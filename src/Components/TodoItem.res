type todo = {
  id: int,
  completed: bool,
  text: string,
}
@react.component
let make = (~todo: todo, ~onComplete: int => unit) => {
  let {id, text, completed} = todo
  <li>
    <input type_="checkbox" checked={completed} onChange={_ => onComplete(id)} />
    <span className={completed ? "text-gray-500 line-through" : "text-black"}>
      {React.string(text)}
    </span>
  </li>
}

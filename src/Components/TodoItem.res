type todo = {
  id: int,
  completed: bool,
  text: string,
}
@react.component
let make = (~todo: todo) => {
  let {id, text, completed} = todo
  <li>
    <input type_="checkbox" checked={completed} />
    <span className={completed ? "text-gray-100" : "text-black"}> {React.string(text)} </span>
  </li>
}

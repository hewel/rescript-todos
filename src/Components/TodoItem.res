type todo = {
  id: int,
  completed: bool,
  text: string,
}
@react.component
let make = (~todo: todo, ~onComplete: int => unit) => {
  let {id, text, completed} = todo
  <li className="border-b flex py-4 px-6 text-3xl items-center">
    <input
      type_="checkbox"
      className="h-6 m-0 mr-4 w-6 accent-blue-500"
      checked={completed}
      onChange={_ => onComplete(id)}
    />
    <span
      className={`-mt-1 break-words max-w-[350px] ${completed
          ? "text-gray-500 line-through"
          : "text-black"}`}>
      {React.string(text)}
    </span>
  </li>
}

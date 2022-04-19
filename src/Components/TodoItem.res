type todo = Reducer.todo
@react.component
let make = (~todo: todo, ~onToggle: int => unit, ~onRemove: int => unit) => {
  let {id, text, completed} = todo
  <li className="border-b flex py-4 px-6 text-3xl items-center">
    <input
      type_="checkbox"
      className="h-6 m-0 mr-4 w-6 accent-blue-500"
      checked={completed}
      onChange={_ => onToggle(id)}
    />
    <span
      className={`-mt-1 break-words max-w-[350px] ${completed
          ? "text-gray-500 line-through"
          : "text-black"}`}>
      {React.string(text)}
    </span>
    <button
      className="bg-transparent cursor-pointer ml-auto h-6 p-0 w-6" onClick={_ => onRemove(id)}>
      <Icon.Trash size={24} />
    </button>
  </li>
}

@react.component
let default = () => {
  let (todoList, setTodoList) = React.useState(_ => [])

  let onAdd = value => {
    switch value {
    | Some(str) =>
      if Js.String.trim(str) != "" && !Belt.Array.some(todoList, i => i == str) {
        setTodoList(Belt.Array.concat([str]))
      }
    | None => ()
    }
  }

  <div className="bg-white rounded-md mx-auto border-1 shadow-md mt-20 px-6 pt-4 pb-8 w-[480px]">
    <h1 className="text-center"> {React.string("Todo List")} </h1>
    <Addtodo onAdd />
    <ul>
      {todoList
      ->Belt.Array.map(i => <li key={i}> <input type_="checkbox" /> {React.string(i)} </li>)
      ->React.array}
    </ul>
  </div>
}

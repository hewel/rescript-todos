open Reducer

@react.component
let make = (~todos: todos, ~onDispatch: action => unit) => {
  <ul className="border-t list-none py-0 px-0">
    {todos
    ->Belt.Array.map(todo =>
      <TodoItem
        key={Js.Int.toString(todo.id)}
        todo
        onToggle={id => id->ToggleTodo->onDispatch}
        onRemove={id => id->RemoveTodo->onDispatch}
      />
    )
    ->React.array}
  </ul>
}

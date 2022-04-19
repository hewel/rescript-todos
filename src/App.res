open Reducer

@react.component
let default = () => {
  let (state, dispatch) = reducer->React.useReducer({
    todos: [],
    nextId: 1,
  })

  let onAdd = value => {
    switch value {
    | Some(str) =>
      if Js.String.trim(str) != "" {
        str->AddTodo->dispatch
      }
    | None => ()
    }
  }

  <div className="bg-white rounded-md mx-auto border-1 shadow-md mt-20 pt-4 pb-8 w-[480px]">
    <h1 className="text-center"> {React.string("Todo List")} </h1>
    <Addtodo onAdd />
    <TodoList todos={state.todos} onDispatch={dispatch} />
  </div>
}

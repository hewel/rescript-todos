type todo = TodoItem.todo
type todos = array<todo>
type action =
  | AddTodo(string)
  | RemoveTodo(int)
  | ToggleTodo(int)
let reducer = (state: todos, action) => {
  switch action {
  | AddTodo(text) =>
    state->Belt.Array.concat([
      {
        id: Belt.Array.length(state),
        text: text,
        completed: false,
      },
    ])
  | RemoveTodo(id) => state->Belt.Array.keep(todo => todo.id != id)
  | ToggleTodo(id) =>
    state->Belt.Array.map(todo => {
      ...todo,
      completed: todo.id == id ? !todo.completed : todo.completed,
    })
  }
}

@react.component
let default = () => {
  let (todoList, dispatch) = reducer->React.useReducer([])

  let onAdd = value => {
    switch value {
    | Some(str) =>
      if Js.String.trim(str) != "" && !Belt.Array.some(todoList, ({text}) => text == str) {
        str->AddTodo->dispatch
      }
    | None => ()
    }
  }

  <div className="bg-white rounded-md mx-auto border-1 shadow-md mt-20 pt-4 pb-8 w-[480px]">
    <h1 className="text-center"> {React.string("Todo List")} </h1>
    <Addtodo onAdd />
    <ul className="list-none py-2 px-0">
      {todoList
      ->Belt.Array.map(todo =>
        <TodoItem key={Js.Int.toString(todo.id)} todo onComplete={id => id->ToggleTodo->dispatch} />
      )
      ->React.array}
    </ul>
  </div>
}

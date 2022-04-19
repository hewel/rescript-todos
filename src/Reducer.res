type action =
  | AddTodo(string)
  | RemoveTodo(int)
  | ToggleTodo(int)
type todo = {
  id: int,
  completed: bool,
  text: string,
}
type todos = array<todo>
type state = {
  todos: todos,
  nextId: int,
}

let reducer = ({todos, nextId}: state, action) => {
  switch action {
  | AddTodo(text) => {
      todos: todos->Belt.Array.concat([
        {
          id: nextId,
          text: text,
          completed: false,
        },
      ]),
      nextId: nextId + 1,
    }
  | RemoveTodo(id) => {todos: todos->Belt.Array.keep(todo => todo.id != id), nextId: nextId}
  | ToggleTodo(id) => {
      todos: todos->Belt.Array.map(todo => {
        ...todo,
        completed: todo.id == id ? !todo.completed : todo.completed,
      }),
      nextId: nextId,
    }
  }
}

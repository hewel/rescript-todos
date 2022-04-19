open Reducer

let filterTitles = [#showAll("All"), #showActive("Active"), #showCompleted("Completed")]

@react.component
let make = (~todos: todos, ~onDispatch: action => unit) => {
  let (filter, setFilter) = React.useState(_ => #showActive("Active"))
  let allNumber = todos->Belt.Array.length
  let activeNumber = todos->Belt.Array.keep(({completed}) => !completed)->Belt.Array.length
  let completedNumber = allNumber - activeNumber

  <>
    <div className="border-t flex mt-6 px-6 justify-end">
      <ul className="flex list-none my-0 px-0">
        {filterTitles
        ->Belt.Array.map(item => {
          let #showAll(title) | #showActive(title) | #showCompleted(title) = item
          let count = switch item {
          | #showAll(_) => allNumber
          | #showActive(_) => activeNumber
          | #showCompleted(_) => completedNumber
          }
          let active = item == filter

          <li
            key={title}
            className={`${active
                ? "bg-gray-50 border-t-sky-400"
                : "bg-gray-200"} rounded-b-lg border border-t-2 border-gray-200 cursor-pointer flex ml-2 py-2 px-2 items-center`}
            onClick={_ => setFilter(_ => item)}>
            {React.string(title)}
            <span className="rounded-md bg-sky-600 text-sm text-white ml-1 px-1 pb-[0.8px]">
              {count->Js.Int.toString->React.string}
            </span>
          </li>
        })
        ->React.array}
      </ul>
    </div>
    <ul className="border-t list-none py-0 px-0">
      {todos
      ->Belt.Array.keep(({completed}) => {
        switch filter {
        | #showAll(_) => true
        | #showActive(_) => !completed
        | #showCompleted(_) => completed
        }
      })
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
  </>
}

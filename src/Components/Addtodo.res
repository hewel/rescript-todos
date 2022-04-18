@react.component
let make = () => {
  let inputValueRef: React.ref<option<string>> = React.useRef(None)

  let onSubmit = (e: ReactEvent.Form.t) => {
    e->ReactEvent.Form.preventDefault

    switch inputValueRef.current {
    | Some(str) => Js.log(str)
    | None => Js.log("None")
    }
  }

  <form className="w-full grid grid-cols-12" onSubmit>
    <input
      className="h-8 text-lg col-span-10"
      onChange={e => e->ReactEvent.Form.target->(target => inputValueRef.current = target["value"])}
      required={true}
    />
    <button className="text-lg col-span-2"> {React.string("Add")} </button>
  </form>
}

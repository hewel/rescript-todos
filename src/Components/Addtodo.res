@react.component
let make = (~onAdd: option<string> => unit) => {
  let inputValueRef: React.ref<option<string>> = React.useRef(None)

  let onSubmit = (e: ReactEvent.Form.t) => {
    e->ReactEvent.Form.preventDefault
    onAdd(inputValueRef.current)
  }

  <form className="rounded-lg w-full grid px-6 grid-cols-12" onSubmit>
    <input
      className="border rounded-l-lg bg-slate-50  h-8 text-xl py-6 px-4 ring-sky-200 col-span-10  focus:(outline-none border-sky-400 ring-2 z-10) "
      onChange={e => e->ReactEvent.Form.target->(target => inputValueRef.current = target["value"])}
      required={true}
    />
    <button
      type_="submit"
      className="bg-white border rounded-r-lg border-l-0 text-lg ring-sky-400 col-span-2 hover:(bg-slate-100) focus:(ring-2 bg-slate-50) ">
      {React.string("ADD")}
    </button>
  </form>
}

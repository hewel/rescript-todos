module Trash = {
  @react.component @module("@tabler/icons")
  external make: (
    ~color: string=?,
    ~size: int=?,
    ~stroke: int=?,
    ~className: string=?,
  ) => React.element = "IconTrash"
}

module Plus = {
  @react.component @module("@tabler/icons")
  external make: (
    ~color: string=?,
    ~size: int=?,
    ~stroke: int=?,
    ~className: string=?,
  ) => React.element = "IconPlus"
}

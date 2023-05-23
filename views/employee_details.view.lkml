# If necessary, uncomment the line below to include explore_source.
# include: "jayanth_look.model.lkml"

view: employee_details {
  derived_table: {
    explore_source: employees {
      column: emp_id {}
      column: manager {}
      column: name {}
      column: count {}
      column: total_manager {}
    }
  }
  dimension: emp_id {
    description: ""
    type: number
  }
  dimension: manager {
    description: ""
    type: number
  }
  dimension: name {
    description: ""
  }
  dimension: count {
    description: ""
    type: number
  }
  dimension: total_manager {
    description: ""
    type: number
  }
}

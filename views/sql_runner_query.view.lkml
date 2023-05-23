view: sql_runner_query {
  derived_table: {
    sql: SELECT
          employees.EmpID  AS `employees.emp_id`,
          employees.Manager  AS `employees.manager`,
          employees.Name  AS `employees.name`,
          COUNT(*) AS `employees.count`,
          COALESCE(SUM(employees.Manager ), 0) AS `employees.total_manager`
      FROM demo_db.Employees  AS employees
      GROUP BY
          1,
          2,
          3
      ORDER BY
          (employees.EmpID ) DESC
      LIMIT 5
       ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: employees_emp_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.`employees.emp_id` ;;
  }

  dimension: employees_manager {
    type: number
    sql: ${TABLE}.`employees.manager` ;;
  }

  dimension: employees_name {
    type: string
    sql: ${TABLE}.`employees.name` ;;
  }

  dimension: employees_count {
    type: number
    sql: ${TABLE}.`employees.count` ;;
  }

  dimension: employees_total_manager {
    type: number
    sql: ${TABLE}.`employees.total_manager` ;;
  }

  set: detail {
    fields: [employees_emp_id, employees_manager, employees_name, employees_count, employees_total_manager]
  }
}

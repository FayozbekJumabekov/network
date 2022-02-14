class Employee {
  String employee_name;
  String employee_salary;
  String employee_age;
  String? id;
  String? profile_image;

  Employee(
      {required this.employee_name,
        required this.profile_image,
      required this.employee_salary,
      required this.employee_age,
       this.id});
}

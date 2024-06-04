<?php 
include "../config/dbConfig.php";
include "../partials/header.php";
include "../partials/navigation.php";

$salesstaff = $conn->prepare("SELECT 
staff_firstname,
staff_surname,
staff_role,
shift
from staff
WHERE staff_role = 'Sales Staff';
");

$salesstaff->execute();

$salesstaff->store_result();

$salesstaff->bind_result($salesfirstname, $salessurname, $salesrole, $salesshift);

$managerstaff = $conn->prepare("SELECT 
staff_firstname,
staff_surname,
staff_role,
shift
from staff
WHERE staff_role LIKE '%Manager%'
");



$managerstaff->execute();

$managerstaff->store_result();

$managerstaff->bind_result($managerfirstname, $managersurname, $managerrole, $managershift);


?>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Irish+Grover&display=swap');
    .ig-font {
        font-family: 'Irish Grover', cursive;
    }
</style>

<div class="overflow-hidden rounded-lg border border-gray-200 shadow-md m-5">
  <table class="w-full border-collapse bg-white text-left text-sm text-gray-500">
    <h1 class="ig-font">Sales Staff Shifts</h1>
    <thead class="bg-gray-50">
      <tr>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Staff First Name</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Staff Surname</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Staff Role</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Staff Shift</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-gray-100 border-t border-gray-100">
    <?php while($salesstaff->fetch()) : ?>
    <tr>
        <td><?= $salesfirstname ?></td>
        <td><?= $salessurname ?></td>
        <td><?= $salesrole ?></td>
        <td><?= $salesshift?></td>
    </tr>
    <?php endwhile ?>
    </tbody>
  </table>
</div>

<div class="overflow-hidden rounded-lg border border-gray-200 shadow-md m-5">
  <table class="w-full border-collapse bg-white text-left text-sm text-gray-500">
    <h1 class="ig-font">Manager Staff Shifts</h1>
    <thead class="bg-gray-50">
      <tr>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Manager First Name</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Manager Surname</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Manager Role</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Manager Shift</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-gray-100 border-t border-gray-100">
    <?php while($managerstaff->fetch()) : ?>
    <tr>
        <td><?= $managerfirstname ?></td>
        <td><?= $managersurname ?></td>
        <td><?= $managerrole ?></td>
        <td><?= $managershift ?></td>
    </tr>
    <?php endwhile ?>
    </tbody>
  </table>
</div>

<?php 
include '../partials/footer.php';
?>
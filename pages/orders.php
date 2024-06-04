<?php 
include "../config/dbConfig.php";
include "../partials/header.php";
include "../partials/navigation.php";

///////////////////////////////////////////////////////////////////////////////////////////////

$orders = $conn->prepare("SELECT
o.order_id,
o.order_date,
o.fk_payment_id,
c.customer_name,
p.payment_type
from orders o
INNER JOIN customer c ON o.fk_customer_id = c.customer_id
INNER JOIN menu_type m ON o.fk_menu_type_id = m.menu_type_id
INNER JOIN payment p ON o.fk_payment_id = p.payment_id
ORDER BY o.order_date DESC 
");

$orders->execute();

$orders->store_result();

$orders->bind_result($oid, $date, $fk_payment_type, $customer, $payment_type);

///////////////////////////////////////////////////////////////////////////////////////////////

$topstaff = $conn->prepare("SELECT 
COUNT(o.order_id),
s.staff_firstname,
s.staff_surname
FROM 
`orders` o
INNER JOIN 
staff s ON o.fk_staff_id = s.staff_id
GROUP BY 
s.staff_id, s.staff_firstname, s.staff_surname
ORDER BY o.order_id DESC
LIMIT 1;");

$topstaff->execute();

$topstaff->store_result();

$topstaff->bind_result($orderstaken ,$stafffirstname, $staffsurname);

///////////////////////////////////////////////////////////////////////////////////////////////

?>

<div class="overflow-hidden rounded-lg border border-gray-200 shadow-md m-5">
  <table class="w-full border-collapse bg-white text-left text-sm text-gray-500">
  <h1 class="ig-font">All Orders</h1>
    <thead class="bg-gray-50 ig-font"> 
      <tr>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Order Id</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Name</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Order Date</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Menu</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Cash / Card</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">View order details</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-gray-100 border-t border-gray-100">

    <?php while($orders->fetch()) : ?>
      <tr>
        <td><?= $oid ?></td>
        <td><?= $customer ?></td>
        <td><?= $date ?></td>
        <td>Lunch</td>
        <td>
          <div class="flex gap-2">
            <span><?= $payment_type ?></span>
          </div>
        </td>

        <td onclick="window.location.href='more_info/<?= $oid ?>'"><i class="fa-solid fa-eye"></i></td>

      </tr>
<?php endwhile ?>
    </tbody>
  </table>
</div>

<div class="overflow-hidden rounded-lg border border-gray-200 shadow-md m-5">
  <table class="w-full border-collapse bg-white text-left text-sm text-gray-500">
    <h1 class="ig-font">Most popular order</h1>
    <thead class="bg-gray-50">
      <tr>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Item Name</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Number of Orders made</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Total Profit from Item</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-gray-100 border-t border-gray-100">
    </tbody>
  </table>
</div>

<div class="overflow-hidden rounded-lg border border-gray-200 shadow-md m-5">
  <table class="w-full border-collapse bg-white text-left text-sm text-gray-500">
    <h1 class="ig-font">Staff Member with Most Orders Taken</h1>
    <thead class="bg-gray-50">
      <tr>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Staff First Name</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Staff Surname</th>
        <th scope="col" class="px-6 py-4 font-medium text-gray-900 ig-font">Orders Taken</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-gray-100 border-t border-gray-100">

    <?php while($topstaff->fetch()) : ?>
      <tr>
        <td><?= $stafffirstname ?></td>
        <td><?= $staffsurname ?></td>
        <td><?= $orderstaken ?></td>
      </tr>
<?php endwhile ?>
    </tbody>
  </table>
</div>


<?php 

include '../partials/footer.php';

?>
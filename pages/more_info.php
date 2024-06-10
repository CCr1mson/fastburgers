<?php 
include "../config/dbConfig.php";
include "../partials/header.php";
include "../partials/navigation.php";

$oid = $_GET['oid'];

$more_info = $conn->prepare("SELECT 
s.staff_firstname,
s.staff_role,
c.customer_name,
c.customer_tel,
o.order_date,
o.order_id,
m.menu_type_id,
p.payment_type,
st.store_location
from `orders` o

LEFT JOIN customer c ON o.fk_customer_id = c.customer_id
LEFT JOIN menu_type m ON o.fk_menu_type_id = m.menu_type_id
LEFT JOIN regular_menu rm ON m.fk_regular_id = rm.regular_menu_id
LEFT JOIN payment p ON o.fk_payment_id = p.payment_id
LEFT JOIN staff s ON o.fk_staff_id = s.staff_id
LEFT JOIN store st ON o.fk_store_id = st.store_id

WHERE o.order_id = $oid

");
$more_info->execute();
$more_info->store_result();
$more_info->bind_result($staffname, $staffrole, $custname, $custtel, $orderdate, $ordernum, $menu_type, $paymenttype, $storelocation);

$more_info->fetch();

?>


<link rel="stylesheet" href="https://cdn.tailgrids.com/tailgrids-fallback.css" />

<div class="overflow-hidden rounded-lg m-5 flex flex-col h-[80%] justify-center">
  <div class="overflow-x-auto">
    <table class="w-full border-collapse bg-white text-left text-sm text-gray-500 border border-gray-200">

      <h1>More Info about Order</h1>
      <thead class="bg-gray-50">
        <tr>
          <th scope="col" class="px-6 py-4 font-medium text-gray-900">Staff Name</th>
          <th scope="col" class="px-6 py-4 font-medium text-gray-900">Staff Role</th>
          <th scope="col" class="px-6 py-4 font-medium text-gray-900">Customer Name</th>
          <th scope="col" class="px-6 py-4 font-medium text-gray-900">Customer Tel</th>
          <th scope="col" class="px-6 py-4 font-medium text-gray-900">Order Date</th>
          <th scope="col" class="px-6 py-4 font-medium text-gray-900">Order Num</th>
          <th scope="col" class="px-6 py-4 font-medium text-gray-900">Payment Type</th>
          <th scope="col" class="px-6 py-4 font-medium text-gray-900">Store Location</th>
        </tr>
      </thead>
      <tbody class="divide-y divide-gray-100 border-t border-gray-100">
        <tr>
          <td><?= $staffname ?></td>
          <td><?= $staffrole ?></td>
          <td><?= $custname ?></td>
          <td><?= $custtel ?></td>
          <td><?= $orderdate ?></td>
          <td><?= $ordernum ?></td>
          <td><?= $paymenttype  ?></td>
          <td><?= $storelocation ?></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>






<?php 

include '../partials/footer.php';

?>
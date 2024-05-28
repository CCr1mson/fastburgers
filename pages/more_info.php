<?php 
include "../config/dbConfig.php";
include "../partials/header.php";
include "../partials/navigation.php";

$oid = $_GET['oid'];

$more_info = $conn->prepare("SELECT
o.order_id,
o.order_date,
c.customer_name,
c.customer_tel,
st.store_name,
p.payment_type,
rm.regular_menu_type,
s.staff_firstname
 from `orders` o
 LEFT JOIN customer c ON o.fk_customer_id = c.customer_id
 LEFT JOIN menu_type m ON o.fk_menu_type_id = m.menu_type_id
 LEFT JOIN regular_menu rm ON m.fk_regular_id = rm.regular_menu_id
 LEFT JOIN payment p ON o.fk_payment_id = p.payment_id
 LEFT JOIN staff s ON o.fk_staff_id = s.staff_id

 LEFT JOIN store st ON o.fk_store_id = st.store_id
 where o.order_id = $oid
");
$more_info->execute();
$more_info->store_result();
$more_info->bind_result($oid, $date, $customer, $custTel, $store, $payment_type, $menu, $staff);

$more_info->fetch();

?>


<link rel="stylesheet" href="https://cdn.tailgrids.com/tailgrids-fallback.css" />

<div class="flex w-full justify-center mt-20">
    <div class="flex flex-col w-1/4 mb-20">
        <h2 class="text-xl underline">Customer Details</h2>
        <p><span class="text-slate-600">Customer Name:</span> <?= $customer ?></p>
        <p><span class="text-slate-600">Customer Tel:</span> <?= $custTel ?></p>
    </div>
    <div class="flex flex-col w-1/4">
        <h2 class="text-xl underline">Order Details</h2>
        <p><span class="text-slate-600">Order Number: </span> <?= $oid ?></p>
        <p> <span class="text-slate-600">Order Date: </span> <?= $date ?></p>
        <p> <span class="text-slate-600">Payment Type: </span> <?= $payment_type ?></p>
        <p> <span class="text-slate-600">Menu Type: </span> <?= $menu ?></p>
    </div>
    <div class="flex flex-col w-1/4">
        <h2 class="text-xl underline">Store Details</h2>
        <p><span class="text-slate-600"> Store Location: </span> <?= $store ?></p>
    </div>
</div>



<?php 

include '../partials/footer.php';

?>
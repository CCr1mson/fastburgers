<?php 
include "../config/dbConfig.php";
include "../partials/header.php";
include "../partials/navigation.php";


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


?>


    

    <table class="border-collapse w-full">
    <tbody>
    <?php while ($orders->fetch()) : ?>
        <tr class="bg-white lg:hover:bg-gray-100 flex lg:table-row flex-row lg:flex-row flex-wrap lg:flex-no-wrap mb-10 lg:mb-0">
            <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b block lg:table-cell relative lg:static">
            <th class="p-3 font-bold uppercase bg-gray-200 text-gray-600 border border-gray-300 hidden lg:table-cell"><?= $oid ?></th>
            <th class="p-3 font-bold uppercase bg-gray-200 text-gray-600 border border-gray-300 hidden lg:table-cell"><?= $customer ?></th>
            </td>
            <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
                <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase"></span>
                <? $date ?>
            </td>
            <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
            </td>
        </tr>
        <?php endwhile?>
    </tbody>
    
</table>







<p>orders</p>

<?php 

include '../partials/footer.php';

?>
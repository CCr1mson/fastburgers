<style>
    @import url('https://fonts.googleapis.com/css2?family=Irish+Grover&display=swap');
    .ig-font {
        font-family: 'Irish Grover', cursive;
    }
    .nav-link {
        margin-right: 20px; /* Adjust the value as needed for desired spacing */
        transition: color 0.3s; /* Smooth transition for hover effect */
    }
    .nav-link:hover {
        color: #FFA500; /* Light orange text color on hover */
    }
</style>

<nav class="flex items-center justify-between flex-wrap bg-orange-600 p-6 h-[10%]">
  <div class="block lg:hidden">
    <button class="flex items-center px-3 py-2 border rounded text-teal-lighter border-teal-light hover:text-white hover:border-white">
      <svg class="h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><title>Menu</title><path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"/></svg>
    </button>
  </div>
  <div class="w-full block flex-grow lg:flex lg:items-center lg:w-auto">
    <div class="text-sm lg:flex-grow ig-font">
      <a href="<?= BASE_PATH ?>orders" class="nav-link"> Orders</a>
      <a href="<?= BASE_PATH ?>shifts" class="nav-link"> Shifts</a>
    </div>
    <div> 
    </div>
    <div>
    </div>
  </div>
</nav>
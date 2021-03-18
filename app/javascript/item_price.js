function item_price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const salesCommission = document.getElementById("add-tax-price");
    salesCommission.innerHTML = Math.floor(inputValue * 0.1);
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.floor(inputValue - salesCommission.innerHTML);
  })
};

window.addEventListener('load', item_price);
window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const taxValue = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = taxValue.toFixed(0);
    const profitValue = inputValue - taxValue;
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = profitValue.toFixed(0);
  })
})
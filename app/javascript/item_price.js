const price = () => {

const priceInput = document.getElementById("item-price");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  
  // 販売手数料の計算
  const fee = Math.floor(inputValue * 0.1);

  // 計算結果を表示
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = fee; // 計算した手数料を表示

   // 販売利益の計算 (価格 - 販売手数料)
   const profit = inputValue - fee;

   // 販売利益を表示
   const profitDom = document.getElementById("profit");
   profitDom.innerHTML = profit;

})

};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);


//connecting to mysql and inquirer
var mysql = require("mysql");
var inquirer = require("inquirer");
var Table = require("cli-table2");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "pickles68",
    database: "bamazon_db"
});

connection.connect(function(err){
    if(err)throw err;
    console.log("Connected as ID: " + connection.threadId)
});


//starts the display of all products and their info
var showProducts = function(){
    var query = "SELECT * FROM products";
    connection.query(query, function(err, res){
        if(err) throw err;
        var showTable = new Table ({
            head: ["Item ID", "Product Name", "Category", "Price", "Quantity"],
            colWidths: [10, 20, 20, 10, 14]
        });
        for(var i = 0; i < res.length; i++){
            showTable.push(
                [res[i].item_id, res[i].product_name, res[i].department_name, res[i].price, res[i].stock_quantity]
            );
        }
        console.log(showTable.toString());
        purchasePrompt();
    });
}

//prompt to start the purchase
function purchasePrompt(){
    inquirer.prompt([
        {
            name: "ID",
            type: "input",
            message: "enter the ID for the item you wish to buy.",
            filter: Number
        },
        {
            name:"Quantity",
            type:"input",
            message:"how many would you like to buy.",
            filter: Number
        },
]).then(function(answers){
    var quantityNeeded = answers.Quantity;
    var IDrequested = answers.ID;
    purchaseOrder(IDrequested, quantityNeeded);
});
};

function purchaseOrder(Id, amountNeeded){
    connection.query("SELECT * FROM products WHERE item_id = " + Id, function(err, res){
        if(err){console.log(err)};
        if(amountNeeded <= res[0].stock_quantity){
            var totalCost = res[0].price * amountNeeded;
            console.log("your total cost for " + amountNeeded + " " + res[0].product_name + " is " + totalCost);
            connection.query("UPDATE products SET stock_quantity = stock_quantity - " + amountNeeded + "WHERE item_id = " + Id);
            }
            else{
                console.log("insufficient quantity! we do not have enough " + res[0].product_name + " to fulfill your order.");
            };
            showProducts();
    });
};

showProducts();
//Enda Keane (C16497656)

void setup()
{
  size(800,600);
  loadData();
  printProducts();
  textSize(30);
  fill(0);
  textAlign(CENTER,TOP);
  text("Cafe Rubis Till System", width/2, height/100);
  line(width/2,height/9,width/2,height/1.1);
  fill(255);
  textSize(15);
}

ArrayList<Product> products = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();

void draw()
{
  displayProducts();
  displayBill();
}

void loadData()
{
  Table table = loadTable("products.csv", "header");
  for(TableRow r: table.rows())
  {
    Product product = new Product(r);
    products.add(product);
  }
}

void printProducts()
{
  for(Product p: products)
  {
    println(p.name.toString() + " " + p.price);
  }
}

void displayProducts()
{
  float numProducts = products.size();
  int i;
  float x = width/20.75;
  float y;
  float boxH = ((height-50)/numProducts)-20;
  for (i = 0; i<numProducts; i++)
  {
    y = 60+(i*70);
    rect(x, y,250,boxH);
    textAlign(LEFT);
    fill(0);
    text(products.get(i).name,x+10,y+(boxH/1.8));
    textAlign(RIGHT);
    text(nf(products.get(i).price, 0, 2),x+240,y+(boxH/1.8));
    fill(255);
  }
}

void mousePressed()
{
  float numProducts = products.size();
  int i;
  float x = width/20.75;
  float y;
  float boxH = ((height-50)/numProducts)-20;
  
  for(i = 0; i<numProducts; i++)
  {
    y = 60+(i*70);
    if((mouseX < x+(250/2) && mouseX > x-(250/2) && (mouseY < y+(boxH/2) && mouseY > y-(boxH/2))))
    {
      println(products.get(i).name);
      bill.add(products.get(i));
    }
  }
}

void displayBill()
{
  float distBetween = height/40;
  float i = 0;
  float total = 0;
  textAlign(CENTER,CENTER);
  rect((width/4)*2.2,height/10,width/2.5,height/1.3);
  fill(0);
  text("Your Bill",(width/4)*3, height/8);
  for(Product p: bill)
  {
    textAlign(RIGHT,CENTER);
    text(p.name, (width/4)*2.6, height/7+(distBetween*i));
    textAlign(LEFT,CENTER);
    text(nf(p.price, 0, 2), (width/4)*3.6,height/7+(distBetween*i));
    total = total + p.price;
    i++;
  }
    textAlign(RIGHT,CENTER);
    text("Total", (width/4)*2.6, height/7+(distBetween*i));
    textAlign(LEFT,CENTER);
    text(nf(total, 0, 2), (width/4)*3.6,height/7+(distBetween*i));
  fill(255);
}
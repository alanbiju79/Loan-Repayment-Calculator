import controlP5.*;
import java.text.DecimalFormat;

DecimalFormat df = new DecimalFormat("0.00");

ControlP5 cp5;
String text1;
String text2;
String text3;

double p;
double months;
double interest;

double monthlyRepayment;
double totalInterest;
double totalRepayment;

void setup(){
  
  size(500,500);
 
  cp5 = new ControlP5(this); 
  
  cp5.addTextfield("Loan Amount")
     .setPosition(50,100)
     .setSize(400,25)
     .setColorBackground(0)
     .setInputFilter(ControlP5.FLOAT)
     .setAutoClear(false);
    
  cp5.addTextfield("Interest Rate (%)")
     .setPosition(50,150)
     .setSize(400,25)
     .setColorBackground(0)
     .setInputFilter(ControlP5.FLOAT)
     .setAutoClear(false);
    
  cp5.addTextfield("Period (months)")
     .setPosition(50,200)
     .setSize(400,25)
     .setColorBackground(0)
     .setInputFilter(ControlP5.FLOAT)
     .setAutoClear(false);
     
  cp5.addButton("Calculate")
     .setPosition(400,250)
     .setSize(50,20);

  text1 = cp5.get(Textfield.class,"Loan Amount").getText();  
  text2 = cp5.get(Textfield.class,"Interest Rate (%)").getText();  
  text3 = cp5.get(Textfield.class,"Period (months)").getText();       
}


void Calculate(){

  text1 = cp5.get(Textfield.class,"Loan Amount").getText();  
  text2 = cp5.get(Textfield.class,"Interest Rate (%)").getText();  
  text3 = cp5.get(Textfield.class,"Period (months)").getText();

  double p = Double.parseDouble(text1);
  double interest = Double.parseDouble(text2);
  double months = Double.parseDouble(text3);
  
  double i = interest/100;
  double q = 12;
  double n = months/q;
  
  double mr = (p*i)/(q*(1-(Math.pow((1+(i/q)),-n*q))));
  monthlyRepayment = (double) Math.round(mr*100)/100;

  double tr = monthlyRepayment*n*q;
  totalRepayment = (double) Math.round(tr*100)/100;

  double ti = totalRepayment-p;
  totalInterest = (double) Math.round(ti*100)/100;
}


void draw(){
  background(0);   
  
  textSize(20);
  text("LOAN REPAYMENT CALCULATOR",90,50);
  
  textSize(11);
  text("Monthly Repayment: "+df.format(monthlyRepayment),50,320);
  text("Total Interest: "+df.format(totalInterest),50,340);
  text("Total Repayment: "+df.format(totalRepayment),50,360);
}

import processing.serial.*;  
import controlP5.*;
import g4p_controls.*;
import processing.video.*;
/////////////////
PFont Mono;
PImage logo;
PImage logo2=logo;
Table table;
int interval = 0;
int end = 10;   
String receivedString;   
int BaudRate=9600;
int statusButton=5;
int restartButton=5;
Capture cam;
Serial myPort; 
ControlP5 cp5;
Chart GPS_X_Axis_Chart;
Chart GPS_Y_Axis_Chart;
Chart GPS_Z_Axis_Chart;
Chart Yaw_Chart;
Chart Pitch_Chart;
Chart Roll_Chart;
Chart Temperature_Chart;
Chart Pressure_Chart;
Chart Height_Chart;
Chart Voltage_Chart;
Textlabel myTextlabelA;
Textlabel myTextlabelB;
Textlabel myTextlabelC;
Textlabel myTextlabelD;
Textlabel myTextlabelE;
Textlabel myTextlabelF;
Textlabel myTextlabelG;
Textlabel myTextlabelH;
Textlabel myTextlabelI;
Textlabel myTextlabelJ;
Textlabel myTextlabelK;
Textlabel myTextlabelL;
Textlabel myTextlabelM;
Textlabel myTextlabelN;
Textlabel myTextlabelO;
RadioButton r1, r2;
/////////////////
void radioButton(int a) {
  statusButton=a;
  restartButton=a;
}
public void settings(){
  fullScreen();
  size(1920, 1080);
}
public void restart(){
  Mono = createFont("yugothil.ttf",18);
cp5 = new ControlP5(this);
r1 = cp5.addRadioButton("radioButton")
         .setPosition(100,20)
         .setSize(100,60)
         .setSpacingColumn(50)
         .addItem("Start/Stop",1);
cp5 = new ControlP5(this);
r2 = cp5.addRadioButton("radioButton2")
         .setPosition(340,20)
         .setSize(100,60)
         .setSpacingColumn(50)
         .addItem("Restart",1);
//////////////////
table = new Table();
/////////////////
logo = loadImage("logo.png");
/////////////////
background(0);
smooth();
strokeWeight(3);
textSize(16);
/////////////////
myPort= new Serial(this, Serial.list()[0], BaudRate); 
myPort.clear();  
receivedString = myPort.readStringUntil(end);
cp5 = new ControlP5(this); 
/////////////////
receivedString = null; 
//
GPS_X_Axis_Chart = cp5.addChart("X Axis")
.setPosition(485, 10)
.setSize(470, 280)
.setRange(-30, 600)
.setView(Chart.LINE) 
.setStrokeWeight(1.5)
.setColorCaptionLabel(color(#00FF00));
//         
GPS_Y_Axis_Chart = cp5.addChart("Y Axis")
.setPosition(965, 10)
.setSize(470, 280)
.setRange(-30, 400)
.setView(Chart.LINE) 
.setStrokeWeight(1.5)
.setColorCaptionLabel(color(#00FF00));
//               
GPS_Z_Axis_Chart = cp5.addChart("Z Axis")
.setPosition(1445, 10)
.setSize(470, 280)
.setRange(-30, 400)
.setView(Chart.LINE) 
.setStrokeWeight(1.5)
.setColorCaptionLabel(color(#00FF00));
//            
Yaw_Chart = cp5.addChart("Yaw Chart")
.setPosition(965, 365)
.setSize(470, 280)
.setRange(-30, 400)
.setView(Chart.LINE) 
.setStrokeWeight(1.5)
.setColorCaptionLabel(color(#00FF00));
//
Pitch_Chart = cp5.addChart("Pitch Chart")
.setPosition(485, 365)
.setSize(470, 280)
.setRange(-30, 400)
.setView(Chart.LINE) 
.setStrokeWeight(1.5)
.setColorCaptionLabel(color(#00FF00));
//               
Roll_Chart = cp5.addChart("Roll Chart")
.setPosition(1445, 365)
.setSize(470, 280)
.setRange(-30, 400)
.setView(Chart.LINE) 
.setStrokeWeight(1.5)
.setColorCaptionLabel(color(#00FF00));
//      
Temperature_Chart = cp5.addChart("Temperature Chart")
.setPosition(8, 725)
.setSize(470, 280)
.setRange(-30, 400)
.setView(Chart.LINE) 
.setStrokeWeight(2)
.setColorCaptionLabel(color(#00FF00));
//       
Pressure_Chart = cp5.addChart("Pressure Chart")
.setPosition(485, 725)
.setSize(470, 280)
.setRange(0, 1000000)
.setView(Chart.LINE) 
.setStrokeWeight(1.5)
.setColorCaptionLabel(color(#00FF00));
//
Height_Chart = cp5.addChart("Height Chart")
.setPosition(965, 725)
.setSize(470, 280)
.setRange(-30, 400)
.setView(Chart.LINE) 
.setStrokeWeight(1.5)
.setColorCaptionLabel(color(#00FF00));
//              
Voltage_Chart = cp5.addChart("Voltage Chart")
.setPosition(1444, 725)
.setSize(470, 280)
.setRange(-30, 400)
.setView(Chart.LINE) 
.setStrokeWeight(1.5)
.setColorCaptionLabel(color(#00FF00));
//
GPS_X_Axis_Chart.addDataSet("incoming");
GPS_X_Axis_Chart.setData("incoming", new float[200]);
//
GPS_Y_Axis_Chart.addDataSet("incoming");
GPS_Y_Axis_Chart.setData("incoming", new float[200]);
//
GPS_Z_Axis_Chart.addDataSet("incoming");
GPS_Z_Axis_Chart.setData("incoming", new float[200]);
//                 
Yaw_Chart.addDataSet("incoming");
Yaw_Chart.setData("incoming", new float[200]);
//                   
Pitch_Chart.addDataSet("incoming");
Pitch_Chart.setData("incoming", new float[200]);
//
Roll_Chart.addDataSet("incoming");
Roll_Chart.setData("incoming", new float[200]);
//             
Temperature_Chart.addDataSet("incoming");
Temperature_Chart.setData("incoming", new float[200]);
//  
Pressure_Chart.addDataSet("incoming");
Pressure_Chart.setData("incoming", new float[200]);
//  
Height_Chart.addDataSet("incoming");
Height_Chart.setData("incoming", new float[200]);
//
Voltage_Chart.addDataSet("incoming");
Voltage_Chart.setData("incoming", new float[200]);
//  
table.addColumn("Team ID");
table.addColumn("Package ID");
table.addColumn("Sending/Receiving Time");
table.addColumn("Satellite Status");
table.addColumn("GPS_X_Axis");
table.addColumn("GPS_Y_Axis");
table.addColumn("GPS_Z_Axis");
table.addColumn("Yaw");
table.addColumn("Pitch");
table.addColumn("Roll");
table.addColumn("Temperature");
table.addColumn("Pressure");
table.addColumn("Height");
table.addColumn("Voltage");
delay(1000);
myPort.clear();
//////////////////////////
String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    cam = new Capture(this, cameras[5]);
    cam.start();
  }
}

void setup() {
  restart();
}
//////////////////////////End of the Setup void.
void draw(){
textFont(Mono);
if(statusButton==1){
logo.resize(100, 100);
//////////////////////////////////
image(logo, 0, 0);
//////////////////////////////////
while (myPort.available () > 0){ 
receivedString = myPort.readStringUntil(end);
}
if (receivedString != null)
{  
String[] a = split(receivedString, ',');
float[] f = new float[a.length]; 
int[] v = new int[a.length];
for(int i = 0; i < a.length; i++)
{
  f[i] = Float.parseFloat(a[i].trim());
  v[i] = round((float)f[i]);
  println(f[i]);

//Defining what will charts push.(Value)
GPS_X_Axis_Chart.push("incoming",f[4]);
GPS_Y_Axis_Chart.push("incoming",f[5]);
GPS_Z_Axis_Chart.push("incoming",f[6]);
Yaw_Chart.push("incoming",f[7]);
Pitch_Chart.push("incoming",f[8]);
Roll_Chart.push("incoming",f[9]);
Temperature_Chart.push("incoming",f[10]);
Pressure_Chart.push("incoming",f[11]);
Height_Chart.push("incoming",f[12]);
Voltage_Chart.push("incoming",f[13]);
//Line codes
stroke(#FF0004);
strokeWeight(5);
line(480,0,480,1080);
line(960,0,960,1080);
line(1440,0,1440,1080);
line(480,360,1920,360);
line(0,720,1920,720);
//edging codes
strokeWeight(8);
line(3,3, 1917,3);
line(3,3, 3,1077);
line(3,1077, 1917,1077);
line(1917,2, 1917,1077);
line(10,1080,1920,1080);
//X Chart Value
noStroke();
fill(#D6CDCD);
stroke(#000000);
rect(20,85,200,40,50);
//Y Chart Value
fill(#D6CDCD);
stroke(#000000);
rect(20,125,200,40,50);
//Z Chart Value
fill(#D6CDCD);
stroke(#000000);
rect(20,165,200,40,50);
//Yaw Chart Value
fill(#D6CDCD);
stroke(#000000);
rect(20,205,200,40,50);
//Pitch Chart Value
fill(#D6CDCD);
stroke(#000000);
rect(20,245,200,40,50);
//Roll Chart Value
fill(#D6CDCD);
stroke(#000000);
rect(20,285,200,40,50);
//Temperature Chart Value
fill(#D6CDCD);
stroke(#000000);
rect(20,325,200,40,50);
//Pressure Chart Value
fill(#D6CDCD);
stroke(#000000);
rect(260,325,200,40,50);
//Height Chart Value
fill(#D6CDCD);
stroke(#000000);
rect(260,285,200,40,50);
//Voltage Chart Value
fill(#D6CDCD);
stroke(#000000);
rect(260,245,200,40,50);
//Team ID
fill(#D6CDCD);
stroke(#000000);
rect(260,205,200,40,50);
//Package ID
fill(#D6CDCD);
stroke(#000000);
rect(260,165,200,40,50);
//Package Sending/Receiving Time
fill(#D6CDCD);
stroke(#000000);
rect(260,125,200,40,50);
//Satalitte Status
fill(#D6CDCD);
stroke(#000000);
rect(260,85,200,40,50);  
////////////////////////////
logo.resize(100, 100);
///////////////////////////
image(logo, 0, 0);
///////////////////////////
cp5 = new ControlP5(this);
myTextlabelA = cp5.addTextlabel("label")
                      .setText("X AXIS(°)=")
                      .setPosition(45,95)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
cp5 = new ControlP5(this);
myTextlabelB = cp5.addTextlabel("label")
                      .setText("Y AXIS(°)=")
                      .setPosition(45,135)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
cp5 = new ControlP5(this);
myTextlabelC = cp5.addTextlabel("label")
                      .setText("Z AXIS(m)=")
                      .setPosition(45,175)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
cp5 = new ControlP5(this);
myTextlabelD = cp5.addTextlabel("label")
                      .setText("YAW(°)=")
                      .setPosition(45,215)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
cp5 = new ControlP5(this);
myTextlabelE = cp5.addTextlabel("label")
                      .setText("PITCH(°)=")
                      .setPosition(45,255)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
cp5 = new ControlP5(this);
myTextlabelF = cp5.addTextlabel("label")
                      .setText("ROLL(°)=")
                      .setPosition(45,295)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
cp5 = new ControlP5(this);
myTextlabelG = cp5.addTextlabel("label")
                      .setText("TEMPERATURE(°) =")
                      .setPosition(30,335)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
cp5 = new ControlP5(this);
myTextlabelH = cp5.addTextlabel("label")
                      .setText("PRESSURE(hPa)=")
                      .setPosition(280,95)
                      .setColorValue(0)
                      .setFont(createFont("Mono",10))
                      ;
cp5 = new ControlP5(this);
myTextlabelI = cp5.addTextlabel("label")
                      .setText("HEIGHT(m)=")
                      .setPosition(280,135)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
cp5 = new ControlP5(this);
myTextlabelJ = cp5.addTextlabel("label")
                      .setText("VOLTAGE(V)=")
                      .setPosition(280,175)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
cp5 = new ControlP5(this);
myTextlabelK = cp5.addTextlabel("label")
                      .setText("Team ID =")
                      .setPosition(280,215)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
 cp5 = new ControlP5(this);
myTextlabelL = cp5.addTextlabel("label")
                      .setText("Package ID =")
                      .setPosition(280,255)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
 cp5 = new ControlP5(this);
myTextlabelM = cp5.addTextlabel("label")
                      .setText("Time=")
                      .setPosition(280,295)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
cp5 = new ControlP5(this);
myTextlabelN = cp5.addTextlabel("label")
                      .setText("Satellite Status =")
                      .setPosition(280,335)
                      .setColorValue(0)
                      .setFont(createFont("Mono",14))
                      ;
fill(#FF0015);
text(f[4],110,110);
fill(#FF0015);
text(f[5],110,150);
fill(#FF0015);
text(f[6],110,190);
fill(#FF0015);
text(f[7],110,230);
fill(#FF0015);
text(f[8],110,270);
fill(#FF0015);
text(f[9],110,310);
fill(#FF0015);
text(f[10],165,350);
fill(#FF0015);
text(f[11],370,110);
fill(#FF0015);
text(f[12],380,150);
fill(#FF0015);
text(f[13],380,190);
fill(#FF0015);
text(f[0],380,230);
fill(#FF0015);
text(f[1],380,270);
fill(#FF0015);
text(f[2],340,310);
fill(#FF0015);
text(f[3],390,350);
TableRow newRow = table.addRow();
newRow.setFloat("Team ID",f[0]);
newRow.setFloat("Package ID", f[1]);
newRow.setFloat("Sending/Receiving Time",f[2]);
newRow.setFloat("Satellite Status",f[3]);
newRow.setFloat("GPS_X_Axis",f[4]);
newRow.setFloat("GPS_Y_Axis",f[5]);
newRow.setFloat("GPS_Z_Axis",f[6]);
newRow.setFloat("Yaw",f[7]);
newRow.setFloat("Pitch",f[8]);
newRow.setFloat("Roll",f[9]);
newRow.setFloat("Temperature",f[10]);
newRow.setFloat("Pressure",f[11]);
newRow.setFloat("Height",f[12]);
newRow.setFloat("Voltage",f[13]);
saveTable(table, "Cofsat_5903/Cofsat_5903.csv");
/////////////////////////
 if (cam.available() == true) {
    cam.read();
  }
  image(cam, 20, 370,450,340);

}
/////////////////////////
}
}
if(restartButton==0){
  restart();
}
}

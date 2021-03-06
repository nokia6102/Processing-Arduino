/* Processing 範例:
 *   透過 Firmata 協定讀取 Arduino 上的 Sensor 讀值
 *   利用 Sensor 讀值移動矩形 (Rectangle)
 */

import processing.serial.*;
import cc.arduino.*; // 載入 Arduino-Firmata 函式庫

Arduino arduino;  
int potPiny = 0; // 可變電阻接在 pin 0 上
int potPinx = 1; // 可變電阻接在 pin 1 上
int y;
int x;

void setup() {
  // 設定畫布大小為 305 x 200 
  size(500, 500);
  
  // 建立 arduino 物件，通訊速率為 57600 bps
  // 注意! 如果你 Arduino 不是接在 COM4，請做適當調整 
  arduino = new Arduino(this, "COM12", 57600);
}

void draw() {
  // 讀取 Arduino 的 Sensor 讀值
  y = arduino.analogRead(potPiny);
  x = arduino.analogRead(potPinx);
  // 讀值除以 4, 把 0-1023 的數值按比例縮放為 0-255 之間的數值
  y = y/4;
  x/=4;
  println(y);  
    
  // 在 (x, y) 座標為 (y, 80) 的位置畫一個 50x50 的矩形
  background(255); // 白色背景
  fill(255,0,0);   // 填滿顏色為紅色 
  rect(x*2,((255-y)*2), 50, 50);
}


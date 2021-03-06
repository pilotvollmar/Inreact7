
/* GUI FINAL
/ Copy updated contents of GUI here when finished playing with it. 
this has extra event handlers and stuff that are not included in the autogenerated version.
*/

boolean winPatternConfig_Loaded = false;
boolean winColourConfig_Loaded = false;
boolean Cp5UiElements_PatternConfig_Loaded = false;
boolean Cp5UiElements_ColourConfig_Loaded = false;
boolean winAddPatConfig_Loaded = false;
boolean winNewProfile_Loaded = false;

synchronized public void winAddPatConfig_draw(PApplet appc, GWinData data) { //_CODE_:winAddPatConfig:417507:
  GWindow w = winAddPatConfig;
  winAttach(w,"left",-winPatternConfig.width+w.width,0);
  if(!winAddPatConfig_Loaded)
  {
    w.background(bgcol);
    winAddPatConfig_Loaded = true;
  }
  
  
  
  
}

public void winAddPatConfig_OnClose(GWindow window) { 
  winPatternConfig.setAlwaysOnTop(true);
  winAddPatConfig_Loaded = false;
}

synchronized public void winPatternConfig_draw(PApplet appc, GWinData data) { 
  GWindow w = winPatternConfig;
  winAttach(w,"left",0,0);
  if(!winPatternConfig_Loaded)
  {
    w.background(bgcol);
    winPatternConfig_Loaded = true;
    
  }
  if(!Cp5UiElements_PatternConfig_Loaded)
  {
    
  loadCp5UiElements_PatternConfig(w);
  }
  DrawSpectrum(w);
  UpdateUIElements(w);
  
  
  
}

synchronized public void winNewProfile_draw(PApplet appc,GWinData data) {
  
  GWindow w = winNewProfile;
  winAttach(w,"left",w.width,225);
  if(!winNewProfile_Loaded)
  {
    w.background(bgcol);
    winNewProfile_Loaded = true;
  }
  
}
synchronized public void winNewProfile_OnClose(GWindow window)
{
  winNewProfile_Loaded = false;
}



synchronized public void winColourConfig_draw(PApplet appc, GWinData data) {
  winAttach(winColourConfig,"right",0,0);
  if(!winColourConfig_Loaded)
  {
    winColourConfig.background(bgcol);
    loadCp5UiElements_PatternConfig(winColourConfig);
    winColourConfig_Loaded = true;
  }
  UpdateUIElements(winColourConfig);
  
  
} 
synchronized public void loadCp5UiElements_PatternConfig(GWindow win)
{
  cp5 = new ControlP5(win);
  if(win == winPatternConfig)
  {
    
  
  sliSelectBands_PatternConfig = cp5.addRange("sliRangeController")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(10,295)
             .setSize(400,20)
             .setHandleSize(10)
             .setRange(0,50)
             .setDecimalPrecision(0)
             //.setNumberOfTickMarks(50)
             //.snapToTickMarks(true)
             .setRangeValues(20,40)
             .setCaptionLabel("")
             .setLabelVisible(false)
             // after the initialization we turn broadcast back on again
             //.setBroadcast(true)
             .setColorActive(color(150,150,150)) 
             .setColorForeground(color(100,100,100))
             .setColorBackground(color(50,50,50))
             
             
             ;
   //SPPD[3] = "20";
   //SPPD[4] = "40";
   sliLowPass_PatternConfig = cp5.addSlider("sliLowPass")
     .setPosition(415,35)
     .setSize(10,255)
     .setRange(0,255)
     .setValue(0)
     .setSliderMode(Slider.FLEXIBLE)
     .setDecimalPrecision(0)
     .setLabelVisible(false)
     .setBroadcast(true)
     .setColorActive(color(150,150,150)) 
     .setColorForeground(color(100,100,100))
     .setColorBackground(color(50,50,50))
     ;
            
  
             
  win.noStroke();
  Cp5UiElements_PatternConfig_Loaded = true;
  
  }
  if(win==winColourConfig)
  {
    
   knoHueOffset_ColourConfig = cp5.addKnob("knoHueOffset")
               .setRange(0,255)
               .setAngleRange(TWO_PI)
               .setStartAngle(HALF_PI)
               .setValue(75)
               .setPosition(10,45)
               .setRadius(75)
               .setNumberOfTickMarks(0)
               .setTickMarkLength(0)
               .snapToTickMarks(false)
               .setColorForeground(color(255))
               .setColorBackground(color(50,50,50))
               .setColorActive(color(100,100,100))
               .setDragDirection(Knob.HORIZONTAL)
               .setViewStyle(Knob.ARC)
               .setDecimalPrecision(0)
               .setLabel("")
               
               ;
    
    sliSat_ColourConfig = cp5.addSlider("sliSat")
     .setPosition(165,45)
     .setSize(20,150)
     .setRange(0,255)
     .setValue(0)
     .setDecimalPrecision(0)
     .setSliderMode(Slider.FLEXIBLE)
     .setLabelVisible(false)
     .setBroadcast(true)
     .setColorActive(color(150,150,150)) 
     .setColorForeground(color(100,100,100))
     .setColorBackground(color(50,50,50))
     ;
    Cp5UiElements_ColourConfig_Loaded = true;
    
  }
  
}

void controlEvent( ControlEvent theEvent )
{
  print("SomethingHappened");
  
}





public void Load_MainWindow(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.GOLD_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  surface.setAlwaysOnTop(true);
  lstCom_MainWindow = new GDropList(this, 10, 10, 70, 80, 3);
  lstCom_MainWindow.setItems(lstLoading, 0);
  lstSelectLight_MainWindow = new GDropList(this, 10, 40, 90, 80, 3);
  lstSelectLight_MainWindow.setItems(lstLoading, 0);
  lstSelectLight_MainWindow.addEventHandler(this, "HandleDroplistEvents");
  lstSelectProfile_MainWindow = new GDropList(this, 190, 10, 100, 80, 3);
  lstSelectProfile_MainWindow.setItems(lstLoading, 0);
  btnMoodMode_MainWindow = new GButton(this, 110, 160, 80, 30);
  btnMoodMode_MainWindow.setText("Mood Mode");
  btnMoodMode_MainWindow.setLocalColorScheme(GCScheme.RED_SCHEME);
  btnMoodMode_MainWindow.addEventHandler(this, "HandleButtonEvents");
  btnMoodMode_MainWindow.setVisible(false);
  btnConnect = new GButton(this, 10, 160, 80, 30);
  btnConnect.setText("Connect");
  btnConnect.addEventHandler(this, "HandleButtonEvents");
  btnProfileSave = new GButton(this, 245, 40, 45, 20);
  btnProfileSave.setText("Save");
  btnProfileSave.addEventHandler(this, "HandleButtonEvents");
  btnProfileNew = new GButton(this, 190, 40, 45, 20);
  btnProfileNew.setText("New");
  btnProfileNew.addEventHandler(this, "HandleButtonEvents");
  lblDiagText = new GLabel(this, 10, 140, 180, 110);
  lblDiagText.setTextAlign(GAlign.LEFT, GAlign.TOP);
  lblDiagText.setText("Diag Text");
  lblDiagText.setOpaque(false);
  //UI_Loaded = true;
  //first = true;
}

public void Load_winColourConfig() {
  winColourConfig = GWindow.getWindow(this, "Colour Config", 0, 0, 440, 200, JAVA2D);
  winColourConfig.noLoop();
  winColourConfig.setActionOnClose(G4P.EXIT_APP);
  winColourConfig.addDrawHandler(this, "winColourConfig_draw");
  winColourConfig.addMouseHandler(this,"HandleMouseEvents");
  winColourConfig.setAlwaysOnTop(true);
  
  lstColourProfile_ColourConfig = new GDropList(winColourConfig, 10, 10, 100, 80, 3);
  lstColourProfile_ColourConfig.setItems(lstLoading, 0);
  lstColourProfile_ColourConfig.addEventHandler(this, "HandleDroplistEvents");
  lstColour_ColourConfig = new GDropList(winColourConfig, 330, 10, 100, 80, 3);
  lstColour_ColourConfig.setItems(lstLoading, 0);
  lstColour_ColourConfig.addEventHandler(this, "HandleDroplistEvents");
  btnSave_ColourConfig = new GButton(winColourConfig, 115, 10, 50, 20);
  btnSave_ColourConfig.setText("Save");
  btnSave_ColourConfig.addEventHandler(this, "HandleButtonEvents");
  btnNewProfile_ColourConfig = new GButton(winColourConfig, 170, 10, 50, 20);
  btnNewProfile_ColourConfig.setText("New");
  btnNewProfile_ColourConfig.addEventHandler(this, "HandleButtonEvents");
  btnClear_ColourConfig = new GButton(winColourConfig, 225, 10, 50, 20);
  btnClear_ColourConfig.setText("Clear");
  btnClear_ColourConfig.addEventHandler(this, "HandleButtonEvents");
  
  winColourConfig.loop();
  
}


public void Load_winPatternConfig() {
  winPatternConfig = GWindow.getWindow(this, "Pattern Config", 0, 0, 550, 325, JAVA2D);
  winPatternConfig.noLoop();
  winPatternConfig.setActionOnClose(G4P.EXIT_APP);
  winPatternConfig.addDrawHandler(this, "winPatternConfig_draw");
  winPatternConfig.addMouseHandler(this,"HandleMouseEvents");
  winPatternConfig.setAlwaysOnTop(true);
  sliMul_PatternConfig = new GSlider2D(winPatternConfig, 440, 190, 100, 100);
  sliMul_PatternConfig.setLimitsX(0.5, 0.0, 1.0);
  sliMul_PatternConfig.setLimitsY(0.5, 0.0, 1.0);
  sliMul_PatternConfig.setNumberFormat(G4P.DECIMAL, 2);
  sliMul_PatternConfig.setOpaque(true);
  sliMul_PatternConfig.addEventHandler(this, "Handle2DSliderEvents");
  lstPatternProfile_PatternConfig = new GDropList(winPatternConfig, 10, 10, 100, 80, 3);
  lstPatternProfile_PatternConfig.setItems(lstLoading, 0);
  lstPatternProfile_PatternConfig.addEventHandler(this, "HandleDroplistEvents");
  lstPattern_PatternConfig = new GDropList(winPatternConfig, 440, 10, 100, 80, 3);
  lstPattern_PatternConfig.setItems(lstLoading, 0);
  lstPattern_PatternConfig.addEventHandler(this, "HandleDroplistEvents");
  btnSave_PatternConfig = new GButton(winPatternConfig, 115, 10, 50, 20);
  btnSave_PatternConfig.setText("Save");
  btnSave_PatternConfig.addEventHandler(this, "HandleButtonEvents");
  btnNewProfile_PatternConfig = new GButton(winPatternConfig, 170, 10, 50, 20);
  btnNewProfile_PatternConfig.setText("New");
  btnNewProfile_PatternConfig.addEventHandler(this, "HandleButtonEvents");
  btnClear_PatternConfig = new GButton(winPatternConfig, 225, 10, 50, 20);
  btnClear_PatternConfig.setText("Clear");
  btnClear_PatternConfig.addEventHandler(this, "HandleButtonEvents");
  btnAddSettings_PatternConfig = new GButton(winPatternConfig, 440, 35, 100, 20);
  btnAddSettings_PatternConfig.setText("More Settings");
  btnAddSettings_PatternConfig.addEventHandler(this, "HandleButtonEvents");
  winPatternConfig.loop();
}

public void Load_WinAddPatConfig()
{  int Index = lstSelectLight_MainWindow.getSelectedIndex();
  winAddPatConfig = GWindow.getWindow(this, "Additional Settings", 0, 0, 240, 240, JAVA2D);
  winAddPatConfig.noLoop();
  winAddPatConfig.setActionOnClose(G4P.CLOSE_WINDOW);
  winAddPatConfig.addDrawHandler(this, "winAddPatConfig_draw");
  winAddPatConfig.addOnCloseHandler(this, "winAddPatConfig_OnClose");
  winPatternConfig.setAlwaysOnTop(false);
  winAddPatConfig.setAlwaysOnTop(true);
  lblLedDecayValA = new GLabel(winAddPatConfig, 10, 10, 80, 20);
  lblLedDecayValA.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblLedDecayValA.setText("Decay Val A:");
  lblLedDecayValA.setOpaque(false);
  lblLedDecayValB = new GLabel(winAddPatConfig, 10, 40, 80, 20);
  lblLedDecayValB.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblLedDecayValB.setText("Decay Val B:");
  lblLedDecayValB.setOpaque(false);
  lblDecayValSplit = new GLabel(winAddPatConfig, 10, 70, 80, 20);
  lblDecayValSplit.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblDecayValSplit.setText("Decay Split:");
  lblDecayValSplit.setOpaque(false);
  txbDecayValA = new GTextField(winAddPatConfig, 90, 10, 50, 20, G4P.SCROLLBARS_NONE);
  txbDecayValA.setOpaque(true);
  txbDecayValB = new GTextField(winAddPatConfig, 90, 40, 50, 20, G4P.SCROLLBARS_NONE);
  txbDecayValB.setOpaque(true);
  txbDecayValSplit = new GTextField(winAddPatConfig, 90, 70, 50, 20, G4P.SCROLLBARS_NONE);
  txbDecayValSplit.setOpaque(true);
  txbGamma_PatternConfig = new GTextField(winAddPatConfig, 90, 100, 50, 20, G4P.SCROLLBARS_NONE);
  txbGamma_PatternConfig.setOpaque(true);
  txbGamma_PatternConfig.addEventHandler(this, "HandleTextfieldEvents");
  txbMaxX_PatternConfig = new GTextField(winAddPatConfig, 90, 130, 50, 20, G4P.SCROLLBARS_NONE);
  txbMaxX_PatternConfig.addEventHandler(this, "HandleTextfieldEvents");
  txbMaxX_PatternConfig.setOpaque(true);
  txbMaxY_PatternConfig = new GTextField(winAddPatConfig, 90, 160, 50, 20, G4P.SCROLLBARS_NONE);
  txbMaxY_PatternConfig.setOpaque(true);
  txbMaxY_PatternConfig.addEventHandler(this, "HandleTextfieldEvents");
  lblGamma_PatternConfig = new GLabel(winAddPatConfig, 10, 100, 70, 20);
  lblGamma_PatternConfig.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblGamma_PatternConfig.setText("Gamma:");
  lblGamma_PatternConfig.setOpaque(false);
  lblMaxX_PatternConfig = new GLabel(winAddPatConfig, 10, 130, 70, 20);
  lblMaxX_PatternConfig.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblMaxX_PatternConfig.setText("Max X:");
  lblMaxX_PatternConfig.setOpaque(false);
  lblMaxY_PatternConfig = new GLabel(winAddPatConfig, 10, 160, 70, 20);
  lblMaxY_PatternConfig.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblMaxY_PatternConfig.setText("Max Y:");
  lblMaxY_PatternConfig.setOpaque(false);
  btnSave_AddPatConfig = new GButton(winAddPatConfig, 190, 210, 45, 20);
  btnSave_AddPatConfig.setText("Save");
  btnSave_AddPatConfig.addEventHandler(this, "HandleButtonEvents");
  txbGamma_PatternConfig.setText(GetTableStr(InstanceLightData,Index,new String[] {"GammaVal"}));
  txbMaxX_PatternConfig.setText(GetTableStr(InstanceLightData,Index,new String[] {"MaxXVal"}));
  txbMaxY_PatternConfig.setText(GetTableStr(InstanceLightData,Index,new String[] {"MaxYVal"}));
  txbDecayValA.setText(GetTableStr(InstanceLightData,Index,new String[] {"DecayValA"}));
  txbDecayValB.setText(GetTableStr(InstanceLightData,Index,new String[] {"DecayValB"}));
  txbDecayValSplit.setText(GetTableStr(InstanceLightData,Index,new String[] {"DecayValSplit"}));
  
  winAddPatConfig.loop();
  
  
}
public void Load_WinNewProfile()
{
  winNewProfile = GWindow.getWindow(this, "New Profile", 0, 0, 150, 100, JAVA2D);
  winNewProfile.noLoop();
  winNewProfile.addDrawHandler(this, "winNewProfile_draw");
  winNewProfile.setActionOnClose(G4P.CLOSE_WINDOW);
  winNewProfile.addOnCloseHandler(this, "winNewProfile_OnClose");
  winNewProfile.setAlwaysOnTop(true);
  txtProfileName_WinNewProfile = new GTextField(winNewProfile, 20, 30, 100, 20, G4P.SCROLLBARS_NONE);
  txtProfileName_WinNewProfile.setOpaque(true);
  lblProfileName_WinNewProfile = new GLabel(winNewProfile, 30, 10, 80, 20);
  lblProfileName_WinNewProfile.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblProfileName_WinNewProfile.setText("Profile Name:");
  lblProfileName_WinNewProfile.setOpaque(false);
  btnCreate_WinNewProfile = new GButton(winNewProfile, 35, 60, 75, 30);
  btnCreate_WinNewProfile.setText("Create");
  btnCreate_WinNewProfile.addEventHandler(this, "HandleButtonEvents");
  winNewProfile.loop();
}




// Variable Declarations G4P
GDropList lstCom_MainWindow; 
GDropList lstSelectLight_MainWindow;
GDropList lstSelectProfile_MainWindow;
GButton btnMoodMode_MainWindow; 
GButton btnConnect;
GButton btnProfileSave;
GButton btnProfileClear;
GButton btnProfileNew;
GButton btnProfileDelete;
GLabel lblDiagText; 
GWindow winPatternConfig;
GSlider2D sliMul_PatternConfig; 
GDropList lstPattern_PatternConfig;
GDropList lstPatternProfile_PatternConfig;
GPanel panSettings_PatternConfig; 
GWindow winColourConfig;
GTextField txbGamma_PatternConfig; 
GTextField txbMaxX_PatternConfig; 
GTextField txbMaxY_PatternConfig;
GLabel lblGamma_PatternConfig; 
GLabel lblMaxX_PatternConfig; 
GLabel lblMaxY_PatternConfig; 
GButton btnSave_PatternConfig; 
GButton btnAddSettings_PatternConfig;
GButton btnNewProfile_PatternConfig;
GButton btnClear_PatternConfig;

GWindow winAddPatConfig;
GLabel lblLedDecayValA; 
GLabel lblLedDecayValB; 
GLabel lblDecayValSplit; 
GTextField txbDecayValA; 
GTextField txbDecayValB; 
GTextField txbDecayValSplit;
GButton btnSave_AddPatConfig;

GDropList lstColourProfile_ColourConfig;
GDropList lstColour_ColourConfig;
GButton btnSave_ColourConfig;
GButton btnNewProfile_ColourConfig;
GButton btnClear_ColourConfig;


GWindow winNewProfile;
GTextField txtProfileName_WinNewProfile; 
GButton button1; 
GLabel lblProfileName_WinNewProfile; 
GButton btnCreate_WinNewProfile; 

// Variable Declarations CP5
ControlP5 cp5;
Range sliSelectBands_PatternConfig;
Slider sliLowPass_PatternConfig;
Knob knoHueOffset_ColourConfig;
Slider sliSat_ColourConfig;
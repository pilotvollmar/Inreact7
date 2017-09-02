/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 

public void HandleButtonEvents(GButton source, GEvent event) { //_CODE_:btnMoodMode_MainWindow:539411:
  println("btnMoodMode_MainWindow - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:btnMoodMode_MainWindow:539411:

synchronized public void winColourConfig_draw(PApplet appc, GWinData data) { //_CODE_:winColourConfig:641755:
  appc.background(230);
} //_CODE_:winColourConfig:641755:

synchronized public void winPatternConfig_draw(PApplet appc, GWinData data) { //_CODE_:winPatternConfig:566842:
  appc.background(230);
} //_CODE_:winPatternConfig:566842:

public void HandleTextboxEvents(GTextField source, GEvent event) { //_CODE_:txbMaxY:390577:
  println("textfield2 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:txbMaxY:390577:

synchronized public void winAddPatConfig_draw(PApplet appc, GWinData data) { //_CODE_:winAddPatConfig:417507:
  appc.background(230);
} //_CODE_:winAddPatConfig:417507:

public void winAddPatConfig_OnClose(GWindow window) { //_CODE_:winAddPatConfig:884444:
  println("winAddPatConfig - window closed at " + millis());
} //_CODE_:winAddPatConfig:884444:

synchronized public void winNewProfile_draw(PApplet appc, GWinData data) { //_CODE_:winNewProfile:260299:
  appc.background(230);
} //_CODE_:winNewProfile:260299:

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:278177:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button1:278177:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  lstCom_MainWindow = new GDropList(this, 10, 10, 70, 80, 3);
  lstCom_MainWindow.setItems(loadStrings("list_680481"), 0);
  lstCom_MainWindow.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  lstSelectLight_MainWindow = new GDropList(this, 100, 10, 90, 80, 3);
  lstSelectLight_MainWindow.setItems(loadStrings("list_411901"), 0);
  lstSelectLight_MainWindow.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  btnMoodMode_MainWindow = new GButton(this, 110, 160, 80, 30);
  btnMoodMode_MainWindow.setText("Mood Mode");
  btnMoodMode_MainWindow.setLocalColorScheme(GCScheme.RED_SCHEME);
  btnMoodMode_MainWindow.addEventHandler(this, "HandleButtonEvents");
  btnConnect = new GButton(this, 10, 160, 80, 30);
  btnConnect.setText("Connect");
  btnConnect.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  lblDiagText = new GLabel(this, 10, 40, 180, 110);
  lblDiagText.setTextAlign(GAlign.LEFT, GAlign.TOP);
  lblDiagText.setText("Diag Text");
  lblDiagText.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  lblDiagText.setOpaque(false);
  winColourConfig = GWindow.getWindow(this, "Colour Config", 0, 0, 240, 120, JAVA2D);
  winColourConfig.noLoop();
  winColourConfig.setActionOnClose(G4P.EXIT_APP);
  winColourConfig.addDrawHandler(this, "winColourConfig_draw");
  winPatternConfig = GWindow.getWindow(this, "Pattern Config", 0, 0, 550, 300, JAVA2D);
  winPatternConfig.noLoop();
  winPatternConfig.addDrawHandler(this, "winPatternConfig_draw");
  lstPattern_PatternConfig = new GDropList(winPatternConfig, 440, 10, 100, 80, 3);
  lstPattern_PatternConfig.setItems(loadStrings("list_629937"), 0);
  lstPattern_PatternConfig.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  sliMul_PatternConfig = new GSlider2D(winPatternConfig, 440, 190, 100, 100);
  sliMul_PatternConfig.setLimitsX(0.5, 0.0, 1.0);
  sliMul_PatternConfig.setLimitsY(0.5, 0.0, 1.0);
  sliMul_PatternConfig.setNumberFormat(G4P.DECIMAL, 2);
  sliMul_PatternConfig.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  sliMul_PatternConfig.setOpaque(true);
  txbGamma_PatternConfig = new GTextField(winPatternConfig, 490, 80, 50, 20, G4P.SCROLLBARS_NONE);
  txbGamma_PatternConfig.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  txbGamma_PatternConfig.setOpaque(true);
  txbMaxX_PatternConfig = new GTextField(winPatternConfig, 490, 110, 50, 20, G4P.SCROLLBARS_NONE);
  txbMaxX_PatternConfig.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  txbMaxX_PatternConfig.setOpaque(true);
  txbMaxY = new GTextField(winPatternConfig, 490, 140, 50, 20, G4P.SCROLLBARS_NONE);
  txbMaxY.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  txbMaxY.setOpaque(true);
  txbMaxY.addEventHandler(this, "HandleTextboxEvents");
  lblGamma_PatternConfig = new GLabel(winPatternConfig, 410, 80, 70, 20);
  lblGamma_PatternConfig.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblGamma_PatternConfig.setText("Gamma:");
  lblGamma_PatternConfig.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  lblGamma_PatternConfig.setOpaque(false);
  lblMaxX_PatternConfig = new GLabel(winPatternConfig, 410, 110, 70, 20);
  lblMaxX_PatternConfig.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblMaxX_PatternConfig.setText("Max X:");
  lblMaxX_PatternConfig.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  lblMaxX_PatternConfig.setOpaque(false);
  lblMaxY_PatternConfig = new GLabel(winPatternConfig, 410, 140, 70, 20);
  lblMaxY_PatternConfig.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblMaxY_PatternConfig.setText("Max Y:");
  lblMaxY_PatternConfig.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  lblMaxY_PatternConfig.setOpaque(false);
  btnSave_PatternConfig = new GButton(winPatternConfig, 490, 40, 50, 20);
  btnSave_PatternConfig.setText("Save");
  btnSave_PatternConfig.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  btnAddSettings_PatternConfig = new GButton(winPatternConfig, 420, 40, 60, 20);
  btnAddSettings_PatternConfig.setText("More");
  btnAddSettings_PatternConfig.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  winAddPatConfig = GWindow.getWindow(this, "Additional Settings", 0, 0, 240, 120, JAVA2D);
  winAddPatConfig.noLoop();
  winAddPatConfig.setActionOnClose(G4P.CLOSE_WINDOW);
  winAddPatConfig.addDrawHandler(this, "winAddPatConfig_draw");
  winAddPatConfig.addOnCloseHandler(this, "winAddPatConfig_OnClose");
  lblLedDecayValA = new GLabel(winAddPatConfig, 10, 10, 80, 20);
  lblLedDecayValA.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblLedDecayValA.setText("Decay Val A:");
  lblLedDecayValA.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  lblLedDecayValA.setOpaque(false);
  lblLedDecayValB = new GLabel(winAddPatConfig, 10, 40, 80, 20);
  lblLedDecayValB.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblLedDecayValB.setText("Decay Val B:");
  lblLedDecayValB.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  lblLedDecayValB.setOpaque(false);
  lblDecayValSplit = new GLabel(winAddPatConfig, 10, 70, 80, 20);
  lblDecayValSplit.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  lblDecayValSplit.setText("Decay Split:");
  lblDecayValSplit.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  lblDecayValSplit.setOpaque(false);
  txbDecayValA = new GTextField(winAddPatConfig, 90, 10, 50, 20, G4P.SCROLLBARS_NONE);
  txbDecayValA.setOpaque(true);
  txbDecayValB = new GTextField(winAddPatConfig, 90, 40, 50, 20, G4P.SCROLLBARS_NONE);
  txbDecayValB.setOpaque(true);
  txbDecayValSplit = new GTextField(winAddPatConfig, 90, 70, 50, 20, G4P.SCROLLBARS_NONE);
  txbDecayValSplit.setOpaque(true);
  winNewProfile = GWindow.getWindow(this, "New Profile", 0, 0, 150, 100, JAVA2D);
  winNewProfile.noLoop();
  winNewProfile.addDrawHandler(this, "winNewProfile_draw");
  txtProfileName_WinNewProfile = new GTextField(winNewProfile, 20, 30, 100, 20, G4P.SCROLLBARS_NONE);
  txtProfileName_WinNewProfile.setOpaque(true);
  button1 = new GButton(winNewProfile, 50, 130, 80, 30);
  button1.setText("Face text");
  button1.addEventHandler(this, "button1_click1");
  lblProfileName_WinNewProfile = new GLabel(winNewProfile, 30, 10, 80, 20);
  lblProfileName_WinNewProfile.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblProfileName_WinNewProfile.setText("Profile Name:");
  lblProfileName_WinNewProfile.setOpaque(false);
  btnCreate_WinNewProfile = new GButton(winNewProfile, 35, 60, 75, 30);
  btnCreate_WinNewProfile.setText("Create");
  winColourConfig.loop();
  winPatternConfig.loop();
  winAddPatConfig.loop();
  winNewProfile.loop();
}

// Variable declarations 
// autogenerated do not edit
GDropList lstCom_MainWindow; 
GDropList lstSelectLight_MainWindow; 
GButton btnMoodMode_MainWindow; 
GButton btnConnect; 
GLabel lblDiagText; 
GWindow winColourConfig;
GWindow winPatternConfig;
GDropList lstPattern_PatternConfig; 
GSlider2D sliMul_PatternConfig; 
GTextField txbGamma_PatternConfig; 
GTextField txbMaxX_PatternConfig; 
GTextField txbMaxY; 
GLabel lblGamma_PatternConfig; 
GLabel lblMaxX_PatternConfig; 
GLabel lblMaxY_PatternConfig; 
GButton btnSave_PatternConfig; 
GButton btnAddSettings_PatternConfig; 
GWindow winAddPatConfig;
GLabel lblLedDecayValA; 
GLabel lblLedDecayValB; 
GLabel lblDecayValSplit; 
GTextField txbDecayValA; 
GTextField txbDecayValB; 
GTextField txbDecayValSplit; 
GWindow winNewProfile;
GTextField txtProfileName_WinNewProfile; 
GButton button1; 
GLabel lblProfileName_WinNewProfile; 
GButton btnCreate_WinNewProfile; 
*/
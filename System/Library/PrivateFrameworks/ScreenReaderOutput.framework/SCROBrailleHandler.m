@implementation SCROBrailleHandler

- (SCROBrailleHandler)initWithBrailleDisplayManager:(id)a3
{
  id v5;
  SCROBrailleHandler *v6;
  SCROBrailleHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCROBrailleHandler;
  v6 = -[SCROHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_brailleDisplayManager, a3);
    -[SCROBrailleDisplayManager setDelegate:](v7->_brailleDisplayManager, "setDelegate:", v7);
  }

  return v7;
}

- (void)invalidate
{
  objc_super v3;

  -[SCROBrailleDisplayManager setDelegate:](self->_brailleDisplayManager, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SCROBrailleHandler;
  -[SCROHandler invalidate](&v3, sel_invalidate);
}

- (int)handleRegisterCallbackForKey:(int)a3 trusted:(BOOL)a4
{
  int result;
  NSObject *v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[16];

  switch(a3)
  {
    case 'H':
      result = 0;
      self->_callbacks.configChanged = 1;
      break;
    case 'I':
      result = 0;
      self->_callbacks.tableLoadFailed = 1;
      break;
    case 'J':
      result = 0;
      self->_callbacks.keypress = 1;
      break;
    case 'K':
      result = 0;
      self->_callbacks.userEventOccured = 1;
      break;
    case 'L':
      result = 0;
      self->_callbacks.replaceTextRange = 1;
      break;
    case 'M':
      result = 0;
      self->_callbacks.startEditing = 1;
      break;
    case 'N':
      result = 0;
      self->_callbacks.insertUntranslatedText = 1;
      break;
    case 'O':
      result = 0;
      self->_callbacks.deleteUntranslatedText = 1;
      break;
    case 'P':
      result = 0;
      self->_callbacks.speechRequest = 1;
      break;
    case 'Q':
      result = 0;
      self->_callbacks.keyWillMem = 1;
      break;
    case 'R':
      result = 0;
      self->_callbacks.keymem = 1;
      break;
    case 'S':
      if (!a4)
        goto LABEL_30;
      result = 0;
      self->_callbacks.didDisplay = 1;
      break;
    case 'T':
      result = 0;
      self->_callbacks.panLeft = 1;
      break;
    case 'U':
      result = 0;
      self->_callbacks.panRight = 1;
      break;
    case 'V':
      result = 0;
      self->_callbacks.showPreviousAnnouncement = 1;
      break;
    case 'W':
      result = 0;
      self->_callbacks.showNextAnnouncement = 1;
      break;
    case 'X':
      result = 0;
      self->_callbacks.playBorderHitSound = 1;
      break;
    case 'Y':
      result = 0;
      self->_callbacks.playCommandNotSupportedSound = 1;
      break;
    case 'Z':
      _SCROD_LOG();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2115BB000, v6, OS_LOG_TYPE_DEFAULT, "Made connection sound", buf, 2u);
      }

      self->_callbacks.playDisplayConnectionSound = 1;
      result = -[SCROBrailleDisplayManager hasActiveDisplays](self->_brailleDisplayManager, "hasActiveDisplays");
      if (result)
      {
        _SCROD_LOG();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2115BB000, v7, OS_LOG_TYPE_DEFAULT, "Handle did load", buf, 2u);
        }

        -[SCROBrailleHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_handleBrailleDriverDidLoad, 0, 0.0);
LABEL_30:
        result = 0;
      }
      break;
    case '[':
      result = 0;
      self->_callbacks.bluetoothDisplayLoadFailed = 1;
      break;
    case '\\':
      result = 0;
      self->_callbacks.displayModeChanged = 1;
      break;
    case ']':
      result = 0;
      self->_callbacks.copyStringToClipboard = 1;
      break;
    case '^':
      result = 0;
      self->_callbacks.planarCanvasDidChange = 1;
      break;
    case '_':
      result = 0;
      self->_callbacks.planarPan = 1;
      break;
    default:
      v8.receiver = self;
      v8.super_class = (Class)SCROBrailleHandler;
      result = -[SCROHandler handleRegisterCallbackForKey:trusted:](&v8, sel_handleRegisterCallbackForKey_trusted_);
      break;
  }
  return result;
}

- (int)handleSetValue:(id)a3 forKey:(int)a4 trusted:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  int v10;
  SCROBrailleDisplayManager *brailleDisplayManager;
  void *v12;
  uint64_t v13;
  void *v14;
  SCROBrailleDisplayManager *v15;
  uint64_t v16;
  SCROBrailleDisplayManager *v17;
  uint64_t v18;
  SCROBrailleDisplayManager *v19;
  SCROBrailleDisplayManager *v20;
  SCROBrailleDisplayManager *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = v8;
  switch((int)v6)
  {
    case 18:
      -[SCROBrailleDisplayManager unloadVirtualDisplay:](self->_brailleDisplayManager, "unloadVirtualDisplay:", objc_msgSend(v8, "unsignedIntegerValue"));
      goto LABEL_50;
    case 21:
      brailleDisplayManager = self->_brailleDisplayManager;
      objc_msgSend(v8, "objectForKey:", CFSTR("displayToken"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");
      objc_msgSend(v9, "objectForKey:", CFSTR("button"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayManager virtualDisplay:pressButton:](brailleDisplayManager, "virtualDisplay:pressButton:", v13, objc_msgSend(v14, "unsignedIntegerValue"));
      goto LABEL_48;
    case 22:
      v15 = self->_brailleDisplayManager;
      objc_msgSend(v8, "objectForKey:", CFSTR("displayToken"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "unsignedIntegerValue");
      objc_msgSend(v9, "objectForKey:", CFSTR("keyChord"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayManager virtualDisplay:pressKeyChord:](v15, "virtualDisplay:pressKeyChord:", v16, objc_msgSend(v14, "unsignedIntegerValue"));
      goto LABEL_48;
    case 23:
      v17 = self->_brailleDisplayManager;
      objc_msgSend(v8, "objectForKey:", CFSTR("displayToken"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v12, "unsignedIntegerValue");
      objc_msgSend(v9, "objectForKey:", CFSTR("index"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayManager virtualDisplay:pressRouterWithIndex:](v17, "virtualDisplay:pressRouterWithIndex:", v18, objc_msgSend(v14, "unsignedIntegerValue"));
      goto LABEL_48;
    case 24:
      -[SCROBrailleDisplayManager loadBluetoothDriverWithAddress:](self->_brailleDisplayManager, "loadBluetoothDriverWithAddress:", v8);
      goto LABEL_50;
    case 25:
      -[SCROBrailleDisplayManager removeBluetoothDriverWithAddress:](self->_brailleDisplayManager, "removeBluetoothDriverWithAddress:", v8);
      goto LABEL_50;
    case 26:
      -[SCROBrailleDisplayManager loadBLEDriverWithIdentifier:](self->_brailleDisplayManager, "loadBLEDriverWithIdentifier:", v8);
      goto LABEL_50;
    case 27:
      -[SCROBrailleDisplayManager configureTableWithIdentifier:](self->_brailleDisplayManager, "configureTableWithIdentifier:", v8);
      goto LABEL_50;
    case 28:
      -[SCROBrailleDisplayManager configureInputTableWithIdentifier:](self->_brailleDisplayManager, "configureInputTableWithIdentifier:", v8);
      goto LABEL_50;
    case 29:
      -[SCROBrailleDisplayManager setAlwaysUsesNemethCodeForTechnicalText:](self->_brailleDisplayManager, "setAlwaysUsesNemethCodeForTechnicalText:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 30:
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithAttributedString:", v8);
      -[SCROBrailleDisplayManager setMainAttributedString:forceUpdate:](self->_brailleDisplayManager, "setMainAttributedString:forceUpdate:", v12, 0);
      goto LABEL_49;
    case 32:
      -[SCROBrailleDisplayManager setShowDotsSevenAndEight:](self->_brailleDisplayManager, "setShowDotsSevenAndEight:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 33:
      -[SCROBrailleDisplayManager setShowEightDotBraille:](self->_brailleDisplayManager, "setShowEightDotBraille:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 34:
      -[SCROBrailleDisplayManager setInputEightDotBraille:](self->_brailleDisplayManager, "setInputEightDotBraille:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 35:
      -[SCROBrailleDisplayManager setAutomaticBrailleTranslationEnabled:](self->_brailleDisplayManager, "setAutomaticBrailleTranslationEnabled:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 36:
      -[SCROBrailleDisplayManager setContractionMode:](self->_brailleDisplayManager, "setContractionMode:", objc_msgSend(v8, "intValue"));
      goto LABEL_50;
    case 37:
      -[SCROBrailleDisplayManager setInputContractionMode:](self->_brailleDisplayManager, "setInputContractionMode:", objc_msgSend(v8, "intValue"));
      goto LABEL_50;
    case 38:
      if (v5)
        -[SCROBrailleDisplayManager setLineDescriptorDisplayCallbackEnabled:](self->_brailleDisplayManager, "setLineDescriptorDisplayCallbackEnabled:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 39:
      -[SCROBrailleDisplayManager setAggregatedStatus:](self->_brailleDisplayManager, "setAggregatedStatus:", v8);
      goto LABEL_50;
    case 40:
      -[SCROBrailleDisplayManager setVirtualStatusAlignment:](self->_brailleDisplayManager, "setVirtualStatusAlignment:", objc_msgSend(v8, "intValue"));
      goto LABEL_50;
    case 41:
      -[SCROBrailleDisplayManager setMasterStatusCellIndex:](self->_brailleDisplayManager, "setMasterStatusCellIndex:", objc_msgSend(v8, "integerValue"));
      goto LABEL_50;
    case 42:
      -[SCROBrailleDisplayManager setPersistentKeyModifiers:](self->_brailleDisplayManager, "setPersistentKeyModifiers:", objc_msgSend(v8, "intValue"));
      goto LABEL_50;
    case 43:
      -[SCROBrailleDisplayManager setWordWrapEnabled:](self->_brailleDisplayManager, "setWordWrapEnabled:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 44:
      -[SCROBrailleDisplayManager setPanWithTextCursorEnabled:](self->_brailleDisplayManager, "setPanWithTextCursorEnabled:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 45:
      -[SCROBrailleDisplayManager setAutoAdvanceEnabled:](self->_brailleDisplayManager, "setAutoAdvanceEnabled:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 46:
      v19 = self->_brailleDisplayManager;
      objc_msgSend(v8, "doubleValue");
      -[SCROBrailleDisplayManager setAutoAdvanceDuration:](v19, "setAutoAdvanceDuration:");
      goto LABEL_50;
    case 47:
      -[SCROBrailleDisplayManager setBlinkingCursorEnabled:](self->_brailleDisplayManager, "setBlinkingCursorEnabled:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 48:
      v20 = self->_brailleDisplayManager;
      objc_msgSend(v8, "doubleValue");
      -[SCROBrailleDisplayManager setLastUserInteractionTime:](v20, "setLastUserInteractionTime:");
      goto LABEL_50;
    case 49:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SCROBrailleDisplayManager setTactileGraphicsImageData:](self->_brailleDisplayManager, "setTactileGraphicsImageData:", v9);
      goto LABEL_50;
    case 50:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SCROBrailleDisplayManager setPlanarData:](self->_brailleDisplayManager, "setPlanarData:", v9);
      goto LABEL_50;
    case 52:
      -[SCROBrailleDisplayManager panDisplayLeft:](self->_brailleDisplayManager, "panDisplayLeft:", objc_msgSend(v8, "integerValue"));
      goto LABEL_50;
    case 53:
      -[SCROBrailleDisplayManager panDisplayRight:](self->_brailleDisplayManager, "panDisplayRight:", objc_msgSend(v8, "integerValue"));
      goto LABEL_50;
    case 54:
      -[SCROBrailleDisplayManager panDisplayBeginning:](self->_brailleDisplayManager, "panDisplayBeginning:", objc_msgSend(v8, "integerValue"));
      goto LABEL_50;
    case 55:
      -[SCROBrailleDisplayManager panDisplayEnd:](self->_brailleDisplayManager, "panDisplayEnd:", objc_msgSend(v8, "integerValue"));
      goto LABEL_50;
    case 56:
      -[SCROBrailleDisplayManager simulateKeypress:](self->_brailleDisplayManager, "simulateKeypress:", v8);
      goto LABEL_50;
    case 57:
      v21 = self->_brailleDisplayManager;
      objc_msgSend(v8, "objectForKey:", CFSTR("prepare"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v12, "BOOLValue");
      objc_msgSend(v9, "objectForKey:", CFSTR("immediate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v14, "BOOLValue");
      objc_msgSend(v9, "objectForKey:", CFSTR("displayToken"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayManager setPrepareToMemorizeNextKey:immediate:forDisplayWithToken:](v21, "setPrepareToMemorizeNextKey:immediate:forDisplayWithToken:", v22, v23, objc_msgSend(v24, "integerValue"));

LABEL_48:
LABEL_49:

      goto LABEL_50;
    case 58:
      -[SCROBrailleDisplayManager setPrimaryBrailleDisplay:](self->_brailleDisplayManager, "setPrimaryBrailleDisplay:", objc_msgSend(v8, "integerValue"));
      goto LABEL_50;
    case 59:
      -[SCROBrailleDisplayManager setSingleLetterInputIsOn:](self->_brailleDisplayManager, "setSingleLetterInputIsOn:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 60:
      -[SCROBrailleDisplayManager setTextSearchModeIsOn:](self->_brailleDisplayManager, "setTextSearchModeIsOn:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_50;
    case 61:
      objc_msgSend(v8, "doubleValue");
      -[SCROBrailleDisplayManager setBrailleKeyDebounceTimeout:](self->_brailleDisplayManager, "setBrailleKeyDebounceTimeout:");
      goto LABEL_50;
    case 62:
      -[SCROBrailleDisplayManager planarPanDisplayLeft:](self->_brailleDisplayManager, "planarPanDisplayLeft:", objc_msgSend(v8, "integerValue"));
      goto LABEL_50;
    case 63:
      -[SCROBrailleDisplayManager planarPanDisplayRight:](self->_brailleDisplayManager, "planarPanDisplayRight:", objc_msgSend(v8, "integerValue"));
LABEL_50:
      v10 = 0;
      break;
    default:
      v26.receiver = self;
      v26.super_class = (Class)SCROBrailleHandler;
      v10 = -[SCROHandler handleSetValue:forKey:trusted:](&v26, sel_handleSetValue_forKey_trusted_, v8, v6, v5);
      break;
  }

  return v10;
}

- (int)handleGetValue:(id *)a3 forKey:(int)a4 trusted:(BOOL)a5
{
  return -[SCROBrailleHandler handleGetValue:forKey:withObject:trusted:](self, "handleGetValue:forKey:withObject:trusted:", a3, *(_QWORD *)&a4, 0, a5);
}

- (int)handleGetValue:(id *)a3 forKey:(int)a4 withObject:(id)a5 trusted:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v24;
  void *v25;
  void *v26;
  SCROBrailleDisplayManager *brailleDisplayManager;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v34;
  id v35;
  uint64_t v36;

  v6 = a6;
  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = v10;
  switch((int)v7)
  {
    case 19:
      v12 = objc_msgSend(v10, "unsignedIntegerValue");
      v13 = (void *)MEMORY[0x24BDD16E0];
      v14 = -[SCROBrailleDisplayManager loadVirtualDisplayWithMainSize:](self->_brailleDisplayManager, "loadVirtualDisplayWithMainSize:", v12);
      goto LABEL_36;
    case 20:
      -[SCROBrailleDisplayManager mainCellsForVirtualDisplay:](self->_brailleDisplayManager, "mainCellsForVirtualDisplay:", objc_msgSend(v10, "unsignedIntegerValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 29:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager alwaysUsesNemethCodeForTechnicalText](self->_brailleDisplayManager, "alwaysUsesNemethCodeForTechnicalText");
      goto LABEL_29;
    case 30:
      if (!v6)
        goto LABEL_34;
      -[SCROBrailleDisplayManager mainAttributedString](self->_brailleDisplayManager, "mainAttributedString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 32:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager showDotsSevenAndEight](self->_brailleDisplayManager, "showDotsSevenAndEight");
      goto LABEL_29;
    case 33:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager showEightDotBraille](self->_brailleDisplayManager, "showEightDotBraille");
      goto LABEL_29;
    case 34:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager inputEightDotBraille](self->_brailleDisplayManager, "inputEightDotBraille");
      goto LABEL_29;
    case 36:
      v18 = (void *)MEMORY[0x24BDD16E0];
      v19 = -[SCROBrailleDisplayManager contractionMode](self->_brailleDisplayManager, "contractionMode");
      goto LABEL_26;
    case 37:
      v18 = (void *)MEMORY[0x24BDD16E0];
      v19 = -[SCROBrailleDisplayManager inputContractionMode](self->_brailleDisplayManager, "inputContractionMode");
      goto LABEL_26;
    case 38:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager lineDescriptorDisplayCallbackEnabled](self->_brailleDisplayManager, "lineDescriptorDisplayCallbackEnabled");
      goto LABEL_29;
    case 39:
      -[SCROBrailleDisplayManager aggregatedStatus](self->_brailleDisplayManager, "aggregatedStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 40:
      v18 = (void *)MEMORY[0x24BDD16E0];
      v19 = -[SCROBrailleDisplayManager virtualStatusAlignment](self->_brailleDisplayManager, "virtualStatusAlignment");
      goto LABEL_26;
    case 41:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SCROBrailleDisplayManager masterStatusCellIndex](self->_brailleDisplayManager, "masterStatusCellIndex"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 42:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SCROBrailleDisplayManager persistentKeyModifiers](self->_brailleDisplayManager, "persistentKeyModifiers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 43:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager wordWrapEnabled](self->_brailleDisplayManager, "wordWrapEnabled");
      goto LABEL_29;
    case 44:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager panWithTextCursorEnabled](self->_brailleDisplayManager, "panWithTextCursorEnabled");
      goto LABEL_29;
    case 45:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager autoAdvanceEnabled](self->_brailleDisplayManager, "autoAdvanceEnabled");
      goto LABEL_29;
    case 46:
      v24 = (void *)MEMORY[0x24BDD16E0];
      -[SCROBrailleDisplayManager autoAdvanceDuration](self->_brailleDisplayManager, "autoAdvanceDuration");
      objc_msgSend(v24, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 47:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager blinkingCursorEnabled](self->_brailleDisplayManager, "blinkingCursorEnabled");
      goto LABEL_29;
    case 64:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager isConfigured](self->_brailleDisplayManager, "isConfigured");
      goto LABEL_29;
    case 65:
      v36 = 0;
      objc_msgSend(v10, "objectForKey:", CFSTR("index"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("displayToken"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brailleDisplayManager = self->_brailleDisplayManager;
      v35 = 0;
      v28 = -[SCROBrailleDisplayManager tokenForRouterIndex:location:appToken:forDisplayWithToken:](brailleDisplayManager, "tokenForRouterIndex:location:appToken:forDisplayWithToken:", objc_msgSend(v25, "integerValue"), &v36, &v35, objc_msgSend(v26, "integerValue"));
      v29 = v35;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v31, kSCROBrailleRouterKeyToken[0]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v36);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v32, kSCROBrailleRouterKeyLocation);

      objc_msgSend(v30, "setObject:forKey:", v29, kSCROBrailleRouterKeyAppToken[0]);
      v33 = objc_retainAutorelease(v30);
      *a3 = v33;

LABEL_34:
      v22 = 0;
      break;
    case 66:
      -[SCROBrailleDisplayManager driverConfiguration](self->_brailleDisplayManager, "driverConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 67:
      v18 = (void *)MEMORY[0x24BDD16E0];
      v19 = -[SCROBrailleDisplayManager displayMode](self->_brailleDisplayManager, "displayMode");
LABEL_26:
      objc_msgSend(v18, "numberWithInt:", v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 68:
      v20 = -[SCROBrailleDisplayManager rangeOfBrailleCellRepresentingCharacterAtIndex:](self->_brailleDisplayManager, "rangeOfBrailleCellRepresentingCharacterAtIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v20, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 69:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager isCandidateSelectionOn](self->_brailleDisplayManager, "isCandidateSelectionOn");
      goto LABEL_29;
    case 70:
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = -[SCROBrailleDisplayManager isWordDescriptionOn](self->_brailleDisplayManager, "isWordDescriptionOn");
LABEL_29:
      objc_msgSend(v16, "numberWithBool:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 71:
      v13 = (void *)MEMORY[0x24BDD16E0];
      v14 = -[SCROBrailleDisplayManager numberOfTextLinesInPlanarBraille](self->_brailleDisplayManager, "numberOfTextLinesInPlanarBraille");
LABEL_36:
      objc_msgSend(v13, "numberWithUnsignedInteger:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
      v22 = 0;
      *a3 = v15;
      break;
    default:
      v34.receiver = self;
      v34.super_class = (Class)SCROBrailleHandler;
      v22 = -[SCROHandler handleGetValue:forKey:withObject:trusted:](&v34, sel_handleGetValue_forKey_withObject_trusted_, a3, v7, v10, v6);
      break;
  }

  return v22;
}

- (int)handlePerformActionForKey:(int)a3 trusted:(BOOL)a4
{
  int result;
  objc_super v5;

  switch(a3)
  {
    case 1:
      -[SCROBrailleDisplayManager beginUpdates](self->_brailleDisplayManager, "beginUpdates");
      goto LABEL_17;
    case 2:
      -[SCROBrailleDisplayManager endUpdates](self->_brailleDisplayManager, "endUpdates");
      goto LABEL_17;
    case 6:
      -[SCROBrailleDisplayManager setAnnouncementsDisplayMode](self->_brailleDisplayManager, "setAnnouncementsDisplayMode");
      goto LABEL_17;
    case 7:
      -[SCROBrailleDisplayManager showNextAnnouncement](self->_brailleDisplayManager, "showNextAnnouncement");
      goto LABEL_17;
    case 8:
      -[SCROBrailleDisplayManager showPreviousAnnouncement](self->_brailleDisplayManager, "showPreviousAnnouncement");
      goto LABEL_17;
    case 9:
      -[SCROBrailleDisplayManager exitCurrentDisplayMode](self->_brailleDisplayManager, "exitCurrentDisplayMode");
      goto LABEL_17;
    case 10:
      -[SCROBrailleDisplayManager translateBrailleToClipboard](self->_brailleDisplayManager, "translateBrailleToClipboard");
      goto LABEL_17;
    case 11:
      -[SCROBrailleDisplayManager resetEditingManager](self->_brailleDisplayManager, "resetEditingManager");
      goto LABEL_17;
    case 12:
      -[SCROBrailleDisplayManager clearTimeoutAlert](self->_brailleDisplayManager, "clearTimeoutAlert");
      goto LABEL_17;
    case 13:
      -[SCROBrailleDisplayManager cancelCandidateSelection](self->_brailleDisplayManager, "cancelCandidateSelection");
      goto LABEL_17;
    case 14:
      -[SCROBrailleDisplayManager showPreviousCandidate](self->_brailleDisplayManager, "showPreviousCandidate");
      goto LABEL_17;
    case 15:
      -[SCROBrailleDisplayManager showNextCandidate](self->_brailleDisplayManager, "showNextCandidate");
      goto LABEL_17;
    case 16:
      -[SCROBrailleDisplayManager showPreviousWordDescription](self->_brailleDisplayManager, "showPreviousWordDescription");
      goto LABEL_17;
    case 17:
      -[SCROBrailleDisplayManager showNextWordDescription](self->_brailleDisplayManager, "showNextWordDescription");
LABEL_17:
      result = 0;
      break;
    default:
      v5.receiver = self;
      v5.super_class = (Class)SCROBrailleHandler;
      result = -[SCROHandler handlePerformActionForKey:trusted:](&v5, sel_handlePerformActionForKey_trusted_);
      break;
  }
  return result;
}

- (void)handleBrailleKeypress:(id)a3
{
  id v4;
  void *v5;
  SCROCallback *v6;

  if (self->_callbacks.keypress)
  {
    v4 = a3;
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 74, v4);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v5);

  }
}

- (void)handleBrailleReplaceTextRange:(_NSRange)a3 withString:(id)a4 cursor:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  SCROCallback *v14;
  SCROCallback *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  if (self->_callbacks.replaceTextRange)
  {
    length = a3.length;
    location = a3.location;
    v17[0] = kSCROBrailleCallbackReplaceTextRange_RangeKey;
    v9 = (void *)MEMORY[0x24BDD1968];
    v10 = a4;
    objc_msgSend(v9, "valueWithRange:", location, length);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = v10;
    v17[1] = kSCROBrailleCallbackReplaceTextRange_StringKey;
    v17[2] = kSCROBrailleCallbackReplaceTextRange_CursorKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = [SCROCallback alloc];
    v15 = -[SCROCallback initWithKey:object:](v14, "initWithKey:object:", 76, v13);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v15, "postToHandler:", v16);

  }
}

- (void)handleUserEventOccured
{
  void *v3;
  SCROCallback *v4;

  if (self->_callbacks.userEventOccured)
  {
    v4 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 75, 0);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v4, "postToHandler:", v3);

  }
}

- (void)handleStartEditing
{
  void *v3;
  SCROCallback *v4;

  if (self->_callbacks.startEditing)
  {
    v4 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 77, 0);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v4, "postToHandler:", v3);

  }
}

- (void)handleBrailleInsertedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4
{
  _BOOL8 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  SCROCallback *v10;
  SCROCallback *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (self->_callbacks.insertUntranslatedText)
    {
      v5 = a4;
      v13[0] = kSCROBrailleCallbackSpeechFeedback_SpeakLiterallyKey;
      v6 = (void *)MEMORY[0x24BDD16E0];
      v7 = a3;
      objc_msgSend(v6, "numberWithBool:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = kSCROBrailleCallbackSpeechFeedback_SpokenTextKey;
      v14[0] = v8;
      v14[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = [SCROCallback alloc];
      v11 = -[SCROCallback initWithKey:object:](v10, "initWithKey:object:", 78, v9);
      -[SCROHandler callbackDelegate](self, "callbackDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROCallback postToHandler:](v11, "postToHandler:", v12);

    }
  }
}

- (void)handleBrailleDeletedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4
{
  _BOOL8 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  SCROCallback *v10;
  SCROCallback *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (self->_callbacks.deleteUntranslatedText)
    {
      v5 = a4;
      v13[0] = kSCROBrailleCallbackSpeechFeedback_SpeakLiterallyKey;
      v6 = (void *)MEMORY[0x24BDD16E0];
      v7 = a3;
      objc_msgSend(v6, "numberWithBool:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = kSCROBrailleCallbackSpeechFeedback_SpokenTextKey;
      v14[0] = v8;
      v14[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = [SCROCallback alloc];
      v11 = -[SCROCallback initWithKey:object:](v10, "initWithKey:object:", 79, v9);
      -[SCROHandler callbackDelegate](self, "callbackDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROCallback postToHandler:](v11, "postToHandler:", v12);

    }
  }
}

- (void)handleBrailleSpeechRequest:(id)a3 language:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  SCROCallback *v10;
  SCROCallback *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (self->_callbacks.speechRequest)
    {
      v13[0] = kSCROBrailleCallbackSpeechFeedback_SpokenTextKey;
      v13[1] = kSCROBrailleCallbackSpeechFeedback_LanguageKey;
      v14[0] = a3;
      v14[1] = a4;
      v6 = (void *)MEMORY[0x24BDBCE70];
      v7 = a4;
      v8 = a3;
      objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = [SCROCallback alloc];

      v11 = -[SCROCallback initWithKey:object:](v10, "initWithKey:object:", 80, v9);
      -[SCROHandler callbackDelegate](self, "callbackDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROCallback postToHandler:](v11, "postToHandler:", v12);

    }
  }
}

- (void)handleBrailleKeyWillMemorize:(id)a3
{
  id v4;
  void *v5;
  SCROCallback *v6;

  if (self->_callbacks.keyWillMem)
  {
    v4 = a3;
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 81, v4);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v5);

  }
}

- (void)handleBrailleKeyMemorize:(id)a3
{
  id v4;
  void *v5;
  SCROCallback *v6;

  if (self->_callbacks.keymem)
  {
    v4 = a3;
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 82, v4);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v5);

  }
}

- (void)handleBrailleDidDisplay:(id)a3
{
  id v4;
  uint64_t v5;
  SCROCallback *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_callbacks.didDisplay)
  {
    v8 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v8, "copy");

      v8 = (id)v5;
    }
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 83, v8);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v7);

    v4 = v8;
  }

}

- (void)handleBrailleDidPanLeft:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  SCROCallback *v15;
  void *v16;
  void *v17;

  if (self->_callbacks.panLeft)
  {
    v10 = (objc_class *)MEMORY[0x24BDBCE70];
    v11 = a6;
    v12 = a5;
    v13 = a4;
    v14 = a3;
    v17 = (void *)objc_msgSend([v10 alloc], "initWithObjectsAndKeys:", v14, CFSTR("success"), v13, CFSTR("token"), v11, CFSTR("lineOffset"), v12, CFSTR("appToken"), 0);

    v15 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 84, v17);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v15, "postToHandler:", v16);

  }
}

- (void)handleBrailleDidPanRight:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  SCROCallback *v15;
  void *v16;
  void *v17;

  if (self->_callbacks.panRight)
  {
    v10 = (objc_class *)MEMORY[0x24BDBCE70];
    v11 = a6;
    v12 = a5;
    v13 = a4;
    v14 = a3;
    v17 = (void *)objc_msgSend([v10 alloc], "initWithObjectsAndKeys:", v14, CFSTR("success"), v13, CFSTR("token"), v11, CFSTR("lineOffset"), v12, CFSTR("appToken"), 0);

    v15 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 85, v17);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v15, "postToHandler:", v16);

  }
}

- (void)handleBrailleDidShowPreviousAnnouncement:(id)a3
{
  id v4;
  void *v5;
  SCROCallback *v6;

  if (self->_callbacks.showPreviousAnnouncement)
  {
    v4 = a3;
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 86, v4);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v5);

  }
}

- (void)handleBrailleDidShowNextAnnouncement:(id)a3
{
  id v4;
  void *v5;
  SCROCallback *v6;

  if (self->_callbacks.showNextAnnouncement)
  {
    v4 = a3;
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 87, v4);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v5);

  }
}

- (void)handleBrailleDriverDisconnected
{
  SCROCallback *v3;
  void *v4;
  SCROCallback *v5;

  if (self->_callbacks.playDisplayConnectionSound)
  {
    v3 = [SCROCallback alloc];
    v5 = -[SCROCallback initWithKey:object:](v3, "initWithKey:object:", 90, MEMORY[0x24BDBD1C0]);
    -[SCROCallback setIsAtomic:](v5, "setIsAtomic:", 1);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v5, "postToHandler:", v4);

  }
}

- (void)handleBrailleDriverDidLoad
{
  NSObject *v3;
  void *v4;
  SCROCallback *v5;
  SCROCallback *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _SCROD_LOG();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_callbacks.playDisplayConnectionSound);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2115BB000, v3, OS_LOG_TYPE_DEFAULT, "Brailler driver did load %@", (uint8_t *)&v8, 0xCu);

  }
  if (self->_callbacks.playDisplayConnectionSound)
  {
    v5 = [SCROCallback alloc];
    v6 = -[SCROCallback initWithKey:object:](v5, "initWithKey:object:", 90, MEMORY[0x24BDBD1C8]);
    -[SCROCallback setIsAtomic:](v6, "setIsAtomic:", 1);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v7);

  }
}

- (void)configurationDidChange
{
  NSObject *v3;
  _BOOL4 configChanged;
  void *v5;
  SCROCallback *v6;
  void *v7;
  NSObject *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _SCROD_LOG();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    configChanged = self->_callbacks.configChanged;
    v10[0] = 67109120;
    v10[1] = configChanged;
    _os_log_impl(&dword_2115BB000, v3, OS_LOG_TYPE_DEFAULT, "-[SCROBrailleHandler configurationDidChange]: _callbacks.configChanged == %d", (uint8_t *)v10, 8u);
  }

  if (self->_callbacks.configChanged)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SCROBrailleDisplayManager isConfigured](self->_brailleDisplayManager, "isConfigured"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 72, v5);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v7);

    _SCROD_LOG();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_2115BB000, v8, OS_LOG_TYPE_DEFAULT, "Posting SCRODisplayConfigurationChangedNotification", (uint8_t *)v10, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kSCRODisplayConfigurationChangedNotification, 0, 0, 1u);

  }
}

- (void)handleFailedToLoadBluetoothDevice:(id)a3
{
  id v4;
  void *v5;
  SCROCallback *v6;

  if (self->_callbacks.bluetoothDisplayLoadFailed)
  {
    v4 = a3;
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 91, v4);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v5);

  }
}

- (void)handleBrailleTableFailedToLoad:(id)a3
{
  id v4;
  void *v5;
  SCROCallback *v6;

  if (self->_callbacks.tableLoadFailed)
  {
    v4 = a3;
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 73, v4);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v5);

  }
}

- (void)handleDisplayModeChanged:(id)a3
{
  id v4;
  void *v5;
  SCROCallback *v6;

  if (self->_callbacks.displayModeChanged)
  {
    v4 = a3;
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 92, v4);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v5);

  }
}

- (void)handleCopyStringToClipboard:(id)a3
{
  id v4;
  void *v5;
  SCROCallback *v6;

  if (self->_callbacks.copyStringToClipboard)
  {
    v4 = a3;
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 93, v4);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v5);

  }
}

- (void)handleTacticalGraphicsCanvasDidChange:(id)a3
{
  id v4;
  void *v5;
  SCROCallback *v6;

  if (self->_callbacks.planarCanvasDidChange)
  {
    v4 = a3;
    v6 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 94, v4);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v6, "postToHandler:", v5);

  }
}

- (void)handlePlanarPanFailedIsLeft:(BOOL)a3
{
  _BOOL8 v3;
  SCROCallback *v5;
  void *v6;
  void *v7;
  SCROCallback *v8;

  if (self->_callbacks.planarPan)
  {
    v3 = a3;
    v5 = [SCROCallback alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SCROCallback initWithKey:object:](v5, "initWithKey:object:", 95, v6);

    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v8, "postToHandler:", v7);

  }
}

- (void)handlePlayBorderHitSound
{
  void *v3;
  SCROCallback *v4;

  if (self->_callbacks.playBorderHitSound)
  {
    v4 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 88, 0);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v4, "postToHandler:", v3);

  }
}

- (void)handlePlayCommandNotSupportedSound
{
  void *v3;
  SCROCallback *v4;

  if (self->_callbacks.playCommandNotSupportedSound)
  {
    v4 = -[SCROCallback initWithKey:object:]([SCROCallback alloc], "initWithKey:object:", 89, 0);
    -[SCROHandler callbackDelegate](self, "callbackDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROCallback postToHandler:](v4, "postToHandler:", v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleDisplayManager, 0);
}

@end

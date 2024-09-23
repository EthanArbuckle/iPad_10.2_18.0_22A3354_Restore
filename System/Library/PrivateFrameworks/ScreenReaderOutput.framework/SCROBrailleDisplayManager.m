@implementation SCROBrailleDisplayManager

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class() == a1)
    v2 = (id)objc_msgSend(MEMORY[0x24BDD1488], "brailleDriverBundles");
}

- (SCROBrailleDisplayManager)init
{
  SCROBrailleDisplayManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *eventQueue;
  id v6;
  void *v7;
  uint64_t v8;
  NSAttributedString *blankUIString;
  SCROBrailleDisplayManagedQueue *v10;
  SCROBrailleDisplayManagedQueue *managedDisplayQueue;
  NSMutableDictionary *v12;
  NSMutableDictionary *detectedIOElementsDict;
  NSMutableSet *v14;
  NSMutableSet *loadedIOElements;
  NSString *inputTableIdentifier;
  NSString *outputTableIdentifier;
  SCROBrailleDisplayManagerStatus *v18;
  SCROBrailleDisplayManagerStatus *status;
  uint64_t v20;
  NSMutableArray *displayModeStack;
  SCROBrailleDisplayHistory *v22;
  SCROBrailleDisplayHistory *history;
  uint64_t v24;
  NSMutableDictionary *virtualDisplays;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SCROBrailleDisplayManager;
  v2 = -[SCROBrailleDisplayManager init](&v28, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("display manager event queue", v3);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc(MEMORY[0x24BDBCE70]);
    v7 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", &unk_24CC30E20, kSCROTokenAttribute[0], 0);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR(" "), v7);
    blankUIString = v2->_blankUIString;
    v2->_blankUIString = (NSAttributedString *)v8;

    v10 = objc_alloc_init(SCROBrailleDisplayManagedQueue);
    managedDisplayQueue = v2->_managedDisplayQueue;
    v2->_managedDisplayQueue = v10;

    -[SCROBrailleDisplayManagedQueue setActiveQueueMaximumSize:](v2->_managedDisplayQueue, "setActiveQueueMaximumSize:", 1);
    v2->_displayConfigurationDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    detectedIOElementsDict = v2->_detectedIOElementsDict;
    v2->_detectedIOElementsDict = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    loadedIOElements = v2->_loadedIOElements;
    v2->_loadedIOElements = v14;

    inputTableIdentifier = v2->_inputTableIdentifier;
    v2->_inputTableIdentifier = (NSString *)&stru_24CC1DB88;

    outputTableIdentifier = v2->_outputTableIdentifier;
    v2->_outputTableIdentifier = (NSString *)&stru_24CC1DB88;

    v2->_showDotsSevenAndEight = 1;
    v2->_automaticBrailleTranslation = 1;
    v18 = objc_alloc_init(SCROBrailleDisplayManagerStatus);
    status = v2->_status;
    v2->_status = v18;

    -[SCROBrailleDisplayManagerStatus setVirtualAlignment:](v2->_status, "setVirtualAlignment:", 0);
    -[SCROBrailleDisplayManagerStatus setMasterStatusCellIndex:](v2->_status, "setMasterStatusCellIndex:", 0);
    v2->_inputAccessMode = 0;
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
    displayModeStack = v2->_displayModeStack;
    v2->_displayModeStack = (NSMutableArray *)v20;

    v22 = objc_alloc_init(SCROBrailleDisplayHistory);
    history = v2->_history;
    v2->_history = v22;

    v2->_isValid = 0;
    v24 = objc_opt_new();
    virtualDisplays = v2->_virtualDisplays;
    v2->_virtualDisplays = (NSMutableDictionary *)v24;

    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDelegate:", v2);

  }
  return v2;
}

+ (id)sharedManager
{
  return (id)sharedManager;
}

+ (void)_setSharedManager:(id)a3
{
  objc_storeStrong((id *)&sharedManager, a3);
}

- (void)invalidate
{
  NSObject *eventQueue;
  _QWORD block[5];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (self->_isValid)
  {
    self->_isValid = 0;
    eventQueue = self->_eventQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__SCROBrailleDisplayManager_invalidate__block_invoke;
    block[3] = &unk_24CC1D2B0;
    block[4] = self;
    dispatch_sync(eventQueue, block);
    -[SCROBrailleDisplayManager _mainQueue_invalidate](self, "_mainQueue_invalidate");
  }
}

uint64_t __39__SCROBrailleDisplayManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_invalidate");
}

- (void)_eventQueue_invalidate
{
  SCROBrailleDisplay *bluetoothBrailleDisplay;
  SCROBrailleDisplay *stealthBrailleDisplay;
  NSMutableDictionary *detectedIOElementsDict;
  NSMutableSet *loadedIOElements;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplayManager _eventQueue_stop](self, "_eventQueue_stop");
  bluetoothBrailleDisplay = self->_bluetoothBrailleDisplay;
  self->_bluetoothBrailleDisplay = 0;

  stealthBrailleDisplay = self->_stealthBrailleDisplay;
  self->_stealthBrailleDisplay = 0;

  detectedIOElementsDict = self->_detectedIOElementsDict;
  self->_detectedIOElementsDict = 0;

  loadedIOElements = self->_loadedIOElements;
  self->_loadedIOElements = 0;

}

- (void)_mainQueue_invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SCROBrailleDisplayManagedQueue *managedDisplayQueue;
  __CFDictionary *displayConfigurationDict;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[SCROBrailleDisplayManager _disableAutoDetect](self, "_disableAutoDetect");
  -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_invalidate);

  -[SCROBrailleDisplayManagedQueue activePendingDisplays](self->_managedDisplayQueue, "activePendingDisplays");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_invalidate);

  -[SCROBrailleDisplayManagedQueue sleepingDisplays](self->_managedDisplayQueue, "sleepingDisplays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_invalidate);

  -[SCROBrailleDisplayManagedQueue disconnectedDisplays](self->_managedDisplayQueue, "disconnectedDisplays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeObjectsPerformSelector:", sel_invalidate);

  -[SCROBrailleDisplayManagedQueue loadingDisplays](self->_managedDisplayQueue, "loadingDisplays");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeObjectsPerformSelector:", sel_invalidate);

  managedDisplayQueue = self->_managedDisplayQueue;
  self->_managedDisplayQueue = 0;

  displayConfigurationDict = self->_displayConfigurationDict;
  if (displayConfigurationDict)
  {
    CFRelease(displayConfigurationDict);
    self->_displayConfigurationDict = 0;
  }
}

- (BOOL)isValid
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__SCROBrailleDisplayManager_isValid__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __36__SCROBrailleDisplayManager_isValid__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 228);
  return result;
}

- (void)tokenizeString:(id)a3 intoFormatter:(id)a4 selection:(_NSRange *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  char v21;
  void *v22;
  int v23;
  int v24;
  char v25;
  char v26;
  int v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  id v31;
  __CFString *v32;
  uint64_t v33;
  id v34;
  __CFString *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _NSRange *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  _NSRange *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[2];
  __int128 v62;
  __int128 v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[5];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t v74;

  v7 = a3;
  v48 = a4;
  v46 = v7;
  v8 = objc_msgSend(v7, "length");
  v73 = 0;
  v74 = 0;
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v52 = a5;
    do
    {
      v51 = v10;
      objc_msgSend(v46, "attribute:atIndex:longestEffectiveRange:inRange:", kSCROTokenAttribute[0], v10, &v73, v10, v9);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "attributedSubstringFromRange:", v73, v74);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attribute:atIndex:effectiveRange:", kSCROLanguageAttribute[0], 0, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "getRange:ofAttribute:", a5, kSCROSelectionAttribute[0]) & 1) == 0)
      {
        if (!objc_msgSend(v11, "getRange:ofAttribute:", a5, kSCROCursorAttribute[0]))
        {
          v12 = 0;
          goto LABEL_8;
        }
        a5->length = 0;
      }
      v12 = 1;
LABEL_8:
      objc_msgSend(v11, "attribute:atIndex:effectiveRange:", kSCROSelectionOnDifferentLineAttribute[0], 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      v67 = 0;
      v68 = &v67;
      v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__0;
      v71 = __Block_byref_object_dispose__0;
      v72 = 0;
      if (v12)
      {
        v15 = kSCROBrailleEditingStringAttribute[0];
        v16 = objc_msgSend(v11, "length");
        v66[0] = MEMORY[0x24BDAC760];
        v66[1] = 3221225472;
        v66[2] = __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke;
        v66[3] = &unk_24CC1D4B0;
        v66[4] = &v67;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v16, 0, v66);
      }
      objc_msgSend(v11, "attribute:atIndex:effectiveRange:", kSCROTechnicalContextAttribute[0], 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      objc_msgSend(v11, "attribute:atIndex:effectiveRange:", kSCROEditableTextAttribute[0], 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      if ((v20 & 1) != 0)
      {
        v21 = 1;
      }
      else
      {
        objc_msgSend(v11, "attribute:atIndex:effectiveRange:", kSCROEditableTextPaddingAttribute[0], 0, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v22, "BOOLValue");

      }
      v65[0] = 0;
      v65[1] = 0;
      v23 = objc_msgSend(v11, "getRange:ofAttribute:", v65, kSCROPlaceholderTextAttribute[0]);
      v64[0] = 0;
      v64[1] = 0;
      v24 = objc_msgSend(v11, "getRange:ofAttribute:", v64, kSCROFocusedAttribute[0]);
      v63 = xmmword_211601A30;
      objc_msgSend(v11, "getRange:ofAttribute:", &v63, kSCROEditableTextPaddingAttribute[0]);
      v50 = v21;
      v49 = v9;
      v62 = xmmword_211601A30;
      objc_msgSend(v11, "getRange:ofAttribute:", &v62, kSCROSuggestionTextAttribute[0]);
      v25 = v18;
      v26 = v14;
      v27 = v12;
      v61[0] = 0;
      v61[1] = 0;
      if (objc_msgSend(v11, "getRange:ofAttribute:", v61, kSCROTerminalOutputAttribute[0]))
        objc_msgSend(v48, "setDisplayMode:", 5);
      v28 = (void *)objc_opt_new();
      v29 = kSCROBoldTextAttribute[0];
      v30 = objc_msgSend(v11, "length");
      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = 3221225472;
      v59[2] = __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_2;
      v59[3] = &unk_24CC1D4D8;
      v31 = v28;
      v60 = v31;
      objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v29, 0, v30, 0, v59);
      v32 = kSCROItalicTextAttribute[0];
      v33 = objc_msgSend(v11, "length");
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_3;
      v57[3] = &unk_24CC1D4D8;
      v34 = v31;
      v58 = v34;
      objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v32, 0, v33, 0, v57);
      v35 = kSCROUnderlineTextAttribute;
      v36 = objc_msgSend(v11, "length");
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_4;
      v55[3] = &unk_24CC1D4D8;
      v37 = v34;
      v56 = v37;
      objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v35, 0, v36, 0, v55);
      objc_msgSend(v11, "string");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v11, "string");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v47;
      }
      else
      {
        v39 = 0;
      }
      v40 = objc_msgSend(v54, "integerValue");
      if (v27)
        v41 = v52;
      else
        v41 = 0;
      if (v24)
        v42 = v64;
      else
        v42 = 0;
      LOBYTE(v45) = v26;
      BYTE1(v44) = v50;
      LOBYTE(v44) = v25;
      objc_msgSend(v48, "addText:overrideText:language:selection:token:focus:technical:isEditableText:paddingRange:suggestionRange:editingString:textFormattingRanges:selectionOnDifferentLine:", v38, v39, v53, v41, v40, v42, v44, v63, v62, v68[5], v37, v45);
      if (v23)

      v43 = v74 + v73;
      v9 = v51 + v49 - (v74 + v73);

      _Block_object_dispose(&v67, 8);
      v10 = v43;
      a5 = v52;
    }
    while (v9);
  }

}

void __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  id v9;

  v8 = a2;
  if (v8)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v8 = v9;
    *a5 = 1;
  }

}

uint64_t __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addBoldRange:");
  return result;
}

uint64_t __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addItalicRange:");
  return result;
}

uint64_t __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addUnderlineRange:");
  return result;
}

- (void)_startAutodetectingTactileGraphics
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef soft__AXSVoiceOverTouchCopyTactileGraphicsDisplay(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SCROBrailleDisplayManager.m"), 24, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_updateTactileGraphicsDisplay
{
  NSObject *v3;
  uint8_t v4[16];

  _SCROD_LOG();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2115BB000, v3, OS_LOG_TYPE_DEFAULT, "Updating tactile graphics from notification", v4, 2u);
  }

  -[SCROBrailleDisplayManager _startAutodetectingTactileGraphics](self, "_startAutodetectingTactileGraphics");
}

- (void)_enableAutoDetect
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkAXSVoiceOverTouchTactileGraphicsDisplayChangedNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SCROBrailleDisplayManager.m"), 25, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_disableAutoDetect
{
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = kSCROBrailleDisplayConnectedNotification;
  +[SCROBrailleDisplayAutoDetector sharedDetector](SCROBrailleDisplayAutoDetector, "sharedDetector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  +[SCROBrailleDisplayAutoDetector sharedDetector](SCROBrailleDisplayAutoDetector, "sharedDetector");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopDetectingDisplays");

}

- (void)_deviceConnectedHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SCROBrailleDisplayManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__SCROBrailleDisplayManager__deviceConnectedHandler___block_invoke;
  v6[3] = &unk_24CC1D500;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __53__SCROBrailleDisplayManager__deviceConnectedHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v5, "objectForKey:", CFSTR("element"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("driverID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_addDetectedIOElement:withDriverIdentifier:", v3, v4);

}

- (void)_addDetectedIOElement:(id)a3 withDriverIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *eventQueue;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  SCROBrailleDisplayManager *v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (v6 && v7)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    eventQueue = self->_eventQueue;
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __72__SCROBrailleDisplayManager__addDetectedIOElement_withDriverIdentifier___block_invoke;
    v13 = &unk_24CC1D528;
    v17 = &v18;
    v14 = self;
    v9 = v6;
    v15 = v9;
    v16 = v7;
    dispatch_sync(eventQueue, &v10);
    if (*((_BYTE *)v19 + 24))
      -[SCROBrailleDisplayManager _loadNextDriverForIOElement:](self, "_loadNextDriverForIOElement:", v9, v10, v11, v12, v13, v14, v15);

    _Block_object_dispose(&v18, 8);
  }

}

uint64_t __72__SCROBrailleDisplayManager__addDetectedIOElement_withDriverIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_eventQueue_addDetectedIOElement:withDriverIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)_eventQueue_addDetectedIOElement:(id)a3 withDriverIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_254AC3E28))
  {
    v20 = v7;
    objc_msgSend(v6, "bluetoothAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = self->_loadedIOElements;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v14, "conformsToProtocol:", &unk_254AC3E28))
          {
            objc_msgSend(v14, "bluetoothAddress");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v8, "isEqualToString:", v15);

            if ((v16 & 1) != 0)
            {

              v17 = 0;
              v7 = v20;
              goto LABEL_20;
            }
          }
        }
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }

    v7 = v20;
  }
  if ((-[NSMutableSet containsObject:](self->_loadedIOElements, "containsObject:", v6) & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_detectedIOElementsDict, "objectForKey:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v8 = v18;
      if ((objc_msgSend(v18, "containsObject:", v6) & 1) == 0)
        objc_msgSend(v8, "addObject:", v7);
      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_detectedIOElementsDict, "setObject:forKey:", v8, v6);
      v17 = 1;
    }
LABEL_20:

  }
  return v17;
}

- (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5
{
  return +[SCROBrailleDisplay displayWithIOElement:driverIdentifier:delegate:](SCROBrailleDisplay, "displayWithIOElement:driverIdentifier:delegate:", a3, a4, a5);
}

- (void)_loadNextDriverForIOElement:(id)a3
{
  void *v4;
  NSObject *eventQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v4 = v6;
  if (v6)
  {
    eventQueue = self->_eventQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__SCROBrailleDisplayManager__loadNextDriverForIOElement___block_invoke;
    block[3] = &unk_24CC1D500;
    block[4] = self;
    v8 = v6;
    dispatch_sync(eventQueue, block);

    v4 = v6;
  }

}

uint64_t __57__SCROBrailleDisplayManager__loadNextDriverForIOElement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_loadNextDriverForIOElement:", *(_QWORD *)(a1 + 40));
}

- (void)_eventQueue_loadNextDriverForIOElement:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  SCROBrailleDisplay *bluetoothBrailleDisplay;
  id WeakRetained;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (objc_msgSend(v4, "transport") == 2 || objc_msgSend(v4, "transport") == 8)
    v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_254AC3E28);
  else
    v5 = 0;
  -[NSMutableDictionary objectForKey:](self->_detectedIOElementsDict, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v9 = v7;
    *(_QWORD *)&v8 = 138412802;
    v15 = v8;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", 0, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayManager _displayWithIOElement:driverIdentifier:delegate:](self, "_displayWithIOElement:driverIdentifier:delegate:", v4, v10, self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _SCROD_LOG();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v15;
        v17 = v11;
        v18 = 2114;
        v19 = v10;
        v20 = 2112;
        v21 = v4;
        _os_log_impl(&dword_2115BB000, v12, OS_LOG_TYPE_DEFAULT, "Made braille display %@ from identifier %{public}@ %@", buf, 0x20u);
      }

      if (v5)
        objc_storeStrong((id *)&self->_bluetoothBrailleDisplay, v11);
      objc_msgSend(v6, "removeObjectAtIndex:", 0);
      if (v11)
        break;
      --v9;

      if (!v9)
        goto LABEL_13;
    }
    -[SCROBrailleDisplayManagedQueue addDisplay:withState:](self->_managedDisplayQueue, "addDisplay:withState:", v11, 4);
    goto LABEL_17;
  }
LABEL_13:
  -[NSMutableDictionary removeObjectForKey:](self->_detectedIOElementsDict, "removeObjectForKey:", v4);
  if (v5)
  {
    bluetoothBrailleDisplay = self->_bluetoothBrailleDisplay;
    self->_bluetoothBrailleDisplay = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v11 = WeakRetained;
      objc_msgSend(v4, "bluetoothAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailedToLoadBluetoothDevice:", v10);
LABEL_17:

    }
  }

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *eventQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__SCROBrailleDisplayManager_setDelegate___block_invoke;
  v7[3] = &unk_24CC1D500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(eventQueue, v7);

}

id __41__SCROBrailleDisplayManager_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

- (SCROSBrailleDisplayManagerDelegate)delegate
{
  NSObject *eventQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__SCROBrailleDisplayManager_delegate__block_invoke;
  v6[3] = &unk_24CC1D488;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SCROSBrailleDisplayManagerDelegate *)v4;
}

void __37__SCROBrailleDisplayManager_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)brailleDisplay:(id)a3 driverDidLoad:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *eventQueue;
  uint64_t (*v9)(uint64_t);
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _SCROD_LOG();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v15 = v4;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_2115BB000, v7, OS_LOG_TYPE_DEFAULT, "Driver did load: %d %{public}@", buf, 0x12u);
  }

  eventQueue = self->_eventQueue;
  if (v4)
  {
    v13 = MEMORY[0x24BDAC760];
    v9 = __58__SCROBrailleDisplayManager_brailleDisplay_driverDidLoad___block_invoke;
    v10 = &v13;
  }
  else
  {
    v12 = MEMORY[0x24BDAC760];
    v9 = __58__SCROBrailleDisplayManager_brailleDisplay_driverDidLoad___block_invoke_2;
    v10 = &v12;
  }
  v10[1] = 3221225472;
  v10[2] = (uint64_t)v9;
  v10[3] = (uint64_t)&unk_24CC1D500;
  v10[4] = (uint64_t)self;
  v10[5] = (uint64_t)v6;
  v11 = v6;
  dispatch_async(eventQueue, v10);

}

uint64_t __58__SCROBrailleDisplayManager_brailleDisplay_driverDidLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_brailleDisplayDriverDidLoad:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__SCROBrailleDisplayManager_brailleDisplay_driverDidLoad___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_brailleDisplayDriverFailedToLoad:", *(_QWORD *)(a1 + 40));
}

- (void)_eventQueue_brailleDisplayDriverDidLoad:(id)a3
{
  SCROBrailleDisplay *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  SCROBrailleDisplay *bluetoothBrailleDisplay;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  NSObject *v13;
  SCROBrailleFormatter *v14;
  uint64_t v15;
  id v16;
  id WeakRetained;
  __CFDictionary *displayConfigurationDict;
  void *v19;
  _BOOL4 v20;
  SCROBrailleDisplay *stealthBrailleDisplay;
  void *v22;
  SCROBrailleDisplay *v23;
  SCROBrailleDisplay *v24;
  int v25;
  uint64_t v26;
  SCROBrailleDisplay *v27;
  int inputAccessMode;
  int v29;
  _BOOL8 lineDescriptorDisplayCallbackEnabled;
  unsigned int v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  int v42;
  _QWORD block[4];
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = (SCROBrailleDisplay *)a3;
  _SCROD_LOG();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SCROBrailleDisplay driverIdentifier](v4, "driverIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v6;
    _os_log_impl(&dword_2115BB000, v5, OS_LOG_TYPE_DEFAULT, "Display loaded: %@", buf, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplay ioElement](v4, "ioElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleDisplay configuration](v4, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    bluetoothBrailleDisplay = self->_bluetoothBrailleDisplay;
    v41 = bluetoothBrailleDisplay == v4;
    if (!bluetoothBrailleDisplay && objc_msgSend(v7, "conformsToProtocol:", &unk_254AC3CF0))
    {
      _SCROD_LOG();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v7;
        _os_log_impl(&dword_2115BB000, v10, OS_LOG_TYPE_DEFAULT, "Marking BTLE device as loading so it can be saved: %@", buf, 0xCu);
      }

      v41 = 1;
    }
    -[NSMutableSet addObject:](self->_loadedIOElements, "addObject:", v7);
    -[NSMutableDictionary removeObjectForKey:](self->_detectedIOElementsDict, "removeObjectForKey:", v7);
    v11 = 0;
  }
  else
  {
    v41 = 0;
    v11 = self->_stealthBrailleDisplay == v4;
  }
  v12 = -[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:", v4);
  _SCROD_LOG();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v46) = v12;
    _os_log_impl(&dword_2115BB000, v13, OS_LOG_TYPE_DEFAULT, "Current display state: %d", buf, 8u);
  }

  v40 = v8;
  if ((v12 & 0xFFFFFFFB) != 0)
  {
    v42 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    WeakRetained = 0;
    goto LABEL_15;
  }
  displayConfigurationDict = self->_displayConfigurationDict;
  if (displayConfigurationDict && v8)
    CFDictionarySetValue(displayConfigurationDict, v4, v8);
  -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v19, "count");

  if (v16)
    v20 = v11;
  else
    v20 = 0;
  v42 = v20;
  if (v20)
  {
    stealthBrailleDisplay = self->_stealthBrailleDisplay;
    self->_stealthBrailleDisplay = 0;

    -[SCROBrailleDisplayManagedQueue removeDisplay:](self->_managedDisplayQueue, "removeDisplay:", v4);
  }
  else
  {
    if (v16 == (id)1)
    {
      -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastObject");
      v23 = (SCROBrailleDisplay *)objc_claimAutoreleasedReturnValue();
      v24 = self->_stealthBrailleDisplay;

      if (v23 == v24)
        -[SCROBrailleDisplayManager _eventQueue_unloadStealthDisplay](self, "_eventQueue_unloadStealthDisplay");
    }
    -[SCROBrailleDisplayManagedQueue setState:forDisplay:](self->_managedDisplayQueue, "setState:forDisplay:", 1, v4);
    if (-[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:", v4) == 1)
    {
      v25 = -[SCROBrailleDisplayManagerStatus virtualAlignment](self->_status, "virtualAlignment");
      v26 = -[SCROBrailleDisplayManagerStatus masterStatusCellIndex](self->_status, "masterStatusCellIndex");
      -[SCROBrailleDisplayManagedQueue primaryDisplay](self->_managedDisplayQueue, "primaryDisplay");
      v27 = (SCROBrailleDisplay *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v39) = v27 == v4;

      inputAccessMode = self->_inputAccessMode;
      v14 = self->_currentBrailleFormatter;
      v29 = 1;
      if (v11)
        goto LABEL_33;
      goto LABEL_30;
    }
  }
  v29 = 0;
  HIDWORD(v39) = 0;
  v25 = 0;
  v26 = 0;
  v14 = 0;
  inputAccessMode = 2;
  if (v11)
  {
LABEL_33:
    if (v16)
    {
      v16 = 0;
      if ((v29 & 1) != 0)
      {
        LODWORD(v39) = v25;
        WeakRetained = 0;
        goto LABEL_37;
      }
      v15 = 0;
      v42 = 1;
      WeakRetained = 0;
    }
    else
    {
      LODWORD(v39) = v25;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((v29 & 1) != 0)
        goto LABEL_37;
      v42 = 0;
      v15 = 0;
    }
    goto LABEL_15;
  }
LABEL_30:
  LODWORD(v39) = v25;
  v16 = objc_loadWeakRetained((id *)&self->_delegate);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v29)
  {
LABEL_37:
    v15 = !v11;
    if (HIDWORD(v39))
      lineDescriptorDisplayCallbackEnabled = self->_lineDescriptorDisplayCallbackEnabled;
    else
      lineDescriptorDisplayCallbackEnabled = 0;
    if (inputAccessMode)
      v31 = 0;
    else
      v31 = HIDWORD(v39);
    if (inputAccessMode == 1)
      v32 = 1;
    else
      v32 = v31;
    _updateNewlyActiveDisplay(v4, v14, lineDescriptorDisplayCallbackEnabled, v32, v26, v39, self->_automaticBrailleTranslation);
    goto LABEL_47;
  }
  v42 = 0;
  v15 = 1;
LABEL_15:
  if (-[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:", v4, v39) != 1)
  {
    -[SCROBrailleDisplay setDelegateWantsDisplayCallback:](v4, "setDelegateWantsDisplayCallback:", 0);
    -[SCROBrailleDisplay setInputAllowed:](v4, "setInputAllowed:", 0);
  }
LABEL_47:
  _SCROD_LOG();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v41);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v46 = v34;
    v47 = 2112;
    v48 = v35;
    _os_log_impl(&dword_2115BB000, v33, OS_LOG_TYPE_DEFAULT, "Braille display loaded: will notify: %@, will save: %@", buf, 0x16u);

  }
  if ((_DWORD)v15)
  {
    if (v41)
      -[SCROBrailleDisplayManager _saveBluetoothDisplayConfiguration:](self, "_saveBluetoothDisplayConfiguration:", v40);
    objc_msgSend(v16, "handleBrailleDriverDidLoad", v39);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__SCROBrailleDisplayManager__eventQueue_brailleDisplayDriverDidLoad___block_invoke;
  block[3] = &unk_24CC1D2B0;
  v44 = WeakRetained;
  v36 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[SCROBrailleDisplayManager brailleInputManager](self, "brailleInputManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleDisplayManager _eventQueue_driverConfiguration](self, "_eventQueue_driverConfiguration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "configureWithDriverConfiguration:", v38);

  if (v42)
    -[SCROBrailleDisplay invalidate](v4, "invalidate");

}

uint64_t __69__SCROBrailleDisplayManager__eventQueue_brailleDisplayDriverDidLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configurationDidChange");
}

- (void)_eventQueue_brailleDisplayDriverFailedToLoad:(id)a3
{
  SCROBrailleDisplay *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  SCROBrailleDisplay *stealthBrailleDisplay;
  void *v9;
  id WeakRetained;
  id v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (SCROBrailleDisplay *)a3;
  _SCROD_LOG();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SCROBrailleDisplay driverIdentifier](v4, "driverIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_2115BB000, v5, OS_LOG_TYPE_DEFAULT, "Display failed load: %{public}@", buf, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplay ioElement](v4, "ioElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  stealthBrailleDisplay = self->_stealthBrailleDisplay;
  if (stealthBrailleDisplay == v4)
  {
    self->_stealthBrailleDisplay = 0;

  }
  -[SCROBrailleDisplayManagedQueue removeDisplay:](self->_managedDisplayQueue, "removeDisplay:", v4);
  -[NSMutableDictionary objectForKey:](self->_detectedIOElementsDict, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (stealthBrailleDisplay == v4)
    {
      WeakRetained = 0;
      goto LABEL_15;
    }
  }
  else
  {
    if (self->_bluetoothBrailleDisplay == v4)
    {
      self->_bluetoothBrailleDisplay = 0;

    }
    if (stealthBrailleDisplay == v4)
    {
      -[SCROBrailleDisplayManager _loadStealthDisplay](self, "_loadStealthDisplay");
      WeakRetained = 0;
      goto LABEL_16;
    }
  }
  if (objc_msgSend(v9, "count"))
  {
    WeakRetained = 0;
    if (!v9)
      goto LABEL_16;
    goto LABEL_15;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v9)
LABEL_15:
    -[SCROBrailleDisplayManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__loadNextDriverForIOElement_, v7, 0);
LABEL_16:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__SCROBrailleDisplayManager__eventQueue_brailleDisplayDriverFailedToLoad___block_invoke;
  block[3] = &unk_24CC1D2B0;
  v13 = WeakRetained;
  v11 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __74__SCROBrailleDisplayManager__eventQueue_brailleDisplayDriverFailedToLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configurationDidChange");
}

- (void)brailleDriverDisconnected:(id)a3
{
  id v4;
  NSObject *eventQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SCROBrailleDisplayManager_brailleDriverDisconnected___block_invoke;
  v7[3] = &unk_24CC1D500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(eventQueue, v7);

}

uint64_t __55__SCROBrailleDisplayManager_brailleDriverDisconnected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_brailleDriverDisconnected:", *(_QWORD *)(a1 + 40));
}

- (void)_eventQueue_brailleDriverDisconnected:(id)a3
{
  SCROBrailleDisplay *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  SCROBrailleDisplay *stealthBrailleDisplay;
  BOOL v11;
  int v12;
  void *v13;
  uint64_t v14;
  SCROBrailleDisplay *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  int inputAccessMode;
  id v24;
  id WeakRetained;
  _BOOL4 v26;
  uint64_t v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  SCROBrailleFormatter *v40;
  _QWORD block[4];
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = (SCROBrailleDisplay *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplay ioElement](v4, "ioElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = -[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:", v4);
  v9 = v8;
  stealthBrailleDisplay = self->_stealthBrailleDisplay;
  v11 = self->_bluetoothBrailleDisplay != v4 || v8 == 4;
  v12 = v11;
  v38 = v12;
  if (v11)
  {
    -[NSMutableSet removeObject:](self->_loadedIOElements, "removeObject:", v5);
    -[SCROBrailleDisplayManagedQueue removeDisplay:](self->_managedDisplayQueue, "removeDisplay:", v4);
  }
  else
  {
    if (objc_msgSend(v5, "transport") == 8
      && -[NSMutableSet containsObject:](self->_loadedIOElements, "containsObject:", v5))
    {
      -[NSMutableSet removeObject:](self->_loadedIOElements, "removeObject:", v5);
    }
    -[SCROBrailleDisplayManagedQueue setState:forDisplay:](self->_managedDisplayQueue, "setState:forDisplay:", 0, v4);
  }
  -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  v39 = (void *)v7;
  v37 = v13;
  if (v14)
  {
    v35 = v5;
    v15 = stealthBrailleDisplay;
    objc_msgSend(v13, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((void *)v7 == v16)
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v36 = 0;
      v40 = 0;
      inputAccessMode = 2;
    }
    else
    {
      v18 = v16;
      -[SCROBrailleDisplayManagedQueue primaryDisplay](self->_managedDisplayQueue, "primaryDisplay");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v18;
      v21 = v18 == v19;

      v22 = -[SCROBrailleDisplayManagerStatus virtualAlignment](self->_status, "virtualAlignment");
      v36 = -[SCROBrailleDisplayManagerStatus masterStatusCellIndex](self->_status, "masterStatusCellIndex");
      inputAccessMode = self->_inputAccessMode;
      v40 = self->_currentBrailleFormatter;
    }

    stealthBrailleDisplay = v15;
    v5 = v35;
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v36 = 0;
    v40 = 0;
    inputAccessMode = 2;
  }
  if (v9 != -[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:", v4))
  {
    if (stealthBrailleDisplay == v4)
      WeakRetained = 0;
    else
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v24 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v14)
      goto LABEL_22;
LABEL_36:
    -[SCROBrailleDisplayManager setUIDisplayMode](self, "setUIDisplayMode");
    -[SCROBrailleDisplayManager _loadStealthDisplay](self, "_loadStealthDisplay");
    v29 = v39;
    v30 = v20;
    goto LABEL_37;
  }
  v24 = 0;
  WeakRetained = 0;
  if (!v14)
    goto LABEL_36;
LABEL_22:
  if (inputAccessMode)
    v26 = 0;
  else
    v26 = v21;
  v27 = inputAccessMode == 1 || v26;
  v28 = v21 && self->_lineDescriptorDisplayCallbackEnabled;
  v29 = v39;
  v30 = v20;
  _updateNewlyActiveDisplay(v20, v40, v28, v27, v36, v22, self->_automaticBrailleTranslation);
LABEL_37:
  objc_msgSend(WeakRetained, "handleBrailleDriverDisconnected");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SCROBrailleDisplayManager__eventQueue_brailleDriverDisconnected___block_invoke;
  block[3] = &unk_24CC1D2B0;
  v31 = v24;
  v42 = v31;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[SCROBrailleDisplayManager brailleInputManager](self, "brailleInputManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleDisplayManager _eventQueue_driverConfiguration](self, "_eventQueue_driverConfiguration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "configureWithDriverConfiguration:", v33);

  if (v38)
    -[SCROBrailleDisplay invalidate](v4, "invalidate");
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_254AC3CF0))
  {
    _SCROD_LOG();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v5;
      _os_log_impl(&dword_2115BB000, v34, OS_LOG_TYPE_DEFAULT, "element was BTLE, restarting auto detect: %@", buf, 0xCu);
    }

    -[SCROBrailleDisplayManager _startAutodetectingTactileGraphics](self, "_startAutodetectingTactileGraphics");
  }

}

uint64_t __67__SCROBrailleDisplayManager__eventQueue_brailleDriverDisconnected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configurationDidChange");
}

- (void)brailleDisplay:(id)a3 isSleeping:(BOOL)a4
{
  id v6;
  NSObject *eventQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SCROBrailleDisplayManager_brailleDisplay_isSleeping___block_invoke;
  block[3] = &unk_24CC1D550;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(eventQueue, block);

}

uint64_t __55__SCROBrailleDisplayManager_brailleDisplay_isSleeping___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_brailleDisplay:isSleeping:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_eventQueue_brailleDisplay:(id)a3 isSleeping:(BOOL)a4
{
  id v6;
  void *v7;
  SCROBrailleDisplay *v8;
  uint64_t v9;
  void *v10;
  SCROBrailleDisplay *v11;
  SCROBrailleDisplay *v12;
  BOOL v13;
  id v14;
  SCROBrailleDisplay *v15;
  SCROBrailleDisplay *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  int inputAccessMode;
  SCROBrailleFormatter *v21;
  id WeakRetained;
  _BOOL4 v23;
  uint64_t v24;
  _BOOL8 v25;
  id v26;
  void *v27;
  void *v28;
  SCROBrailleDisplay *v29;
  _QWORD block[4];
  id v31;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (SCROBrailleDisplay *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v9 = 3;
  }
  else
  {
    if (objc_msgSend(v7, "count") == 1 && v8 == self->_stealthBrailleDisplay)
      -[SCROBrailleDisplayManager _unloadStealthDisplay](self, "_unloadStealthDisplay");
    v9 = 1;
  }
  -[SCROBrailleDisplayManagedQueue setState:forDisplay:](self->_managedDisplayQueue, "setState:forDisplay:", v9, v6);
  -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "lastObject");
    v11 = (SCROBrailleDisplay *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v8 == v11;
    v29 = v8;
    v14 = v6;
    if (v13)
    {
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v21 = 0;
      v15 = 0;
      inputAccessMode = 2;
    }
    else
    {
      v15 = v11;
      -[SCROBrailleDisplayManagedQueue primaryDisplay](self->_managedDisplayQueue, "primaryDisplay");
      v16 = (SCROBrailleDisplay *)objc_claimAutoreleasedReturnValue();
      v17 = v15 == v16;

      v18 = -[SCROBrailleDisplayManagerStatus virtualAlignment](self->_status, "virtualAlignment");
      v19 = -[SCROBrailleDisplayManagerStatus masterStatusCellIndex](self->_status, "masterStatusCellIndex");
      inputAccessMode = self->_inputAccessMode;
      v21 = self->_currentBrailleFormatter;
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (inputAccessMode)
      v23 = 0;
    else
      v23 = v17;
    v24 = inputAccessMode == 1 || v23;
    v25 = v17 && self->_lineDescriptorDisplayCallbackEnabled;
    v6 = v14;
    v8 = v29;
    _updateNewlyActiveDisplay(v15, v21, v25, v24, v19, v18, self->_automaticBrailleTranslation);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[SCROBrailleDisplayManager setUIDisplayMode](self, "setUIDisplayMode");
    -[SCROBrailleDisplayManager _loadStealthDisplay](self, "_loadStealthDisplay");
    v15 = 0;
    v21 = 0;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SCROBrailleDisplayManager__eventQueue_brailleDisplay_isSleeping___block_invoke;
  block[3] = &unk_24CC1D2B0;
  v31 = WeakRetained;
  v26 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[SCROBrailleDisplayManager brailleInputManager](self, "brailleInputManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleDisplayManager _eventQueue_driverConfiguration](self, "_eventQueue_driverConfiguration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "configureWithDriverConfiguration:", v28);

}

uint64_t __67__SCROBrailleDisplayManager__eventQueue_brailleDisplay_isSleeping___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configurationDidChange");
}

- (void)configurationChangedForBrailleDisplay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *eventQueue;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD block[5];
  id v13;
  id v14;
  uint64_t *v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v4, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x3032000000;
      v17[3] = __Block_byref_object_copy__0;
      v17[4] = __Block_byref_object_dispose__0;
      v18 = 0;
      v6 = MEMORY[0x24BDAC760];
      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__SCROBrailleDisplayManager_configurationChangedForBrailleDisplay___block_invoke;
      block[3] = &unk_24CC1D578;
      block[4] = self;
      v13 = v4;
      v8 = v5;
      v14 = v8;
      v15 = &v19;
      v16 = v17;
      dispatch_sync(eventQueue, block);
      if (*((_BYTE *)v20 + 24))
        -[SCROBrailleDisplayManager _saveBluetoothDisplayConfiguration:](self, "_saveBluetoothDisplayConfiguration:", v8);
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __67__SCROBrailleDisplayManager_configurationChangedForBrailleDisplay___block_invoke_2;
      v11[3] = &unk_24CC1D370;
      v11[4] = v17;
      dispatch_async(MEMORY[0x24BDAC9B8], v11);
      -[SCROBrailleDisplayManager brailleInputManager](self, "brailleInputManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayManager driverConfiguration](self, "driverConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configureWithDriverConfiguration:", v10);

      _Block_object_dispose(v17, 8);
      _Block_object_dispose(&v19, 8);
    }

  }
}

void __67__SCROBrailleDisplayManager_configurationChangedForBrailleDisplay___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __CFDictionary *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(__CFDictionary **)(v3 + 64);
    if (v4)
    {
      CFDictionarySetValue(v4, *(const void **)(a1 + 40), *(const void **)(a1 + 48));
      v3 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(a1 + 40) == *(_QWORD *)(v3 + 24);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = WeakRetained;

  }
}

uint64_t __67__SCROBrailleDisplayManager_configurationChangedForBrailleDisplay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "configurationDidChange");
}

- (void)brailleDisplay:(id)a3 pressedKeys:(id)a4
{
  id v6;
  id v7;
  SCROBrailleDisplayManagedQueue *v8;
  NSObject *eventQueue;
  id v10;
  id v11;
  SCROBrailleDisplayManagedQueue *v12;
  _QWORD v13[4];
  SCROBrailleDisplayManagedQueue *v14;
  id v15;
  SCROBrailleDisplayManager *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__SCROBrailleDisplayManager_brailleDisplay_pressedKeys___block_invoke;
  v13[3] = &unk_24CC1D5A0;
  v14 = v8;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(eventQueue, v13);

}

void __56__SCROBrailleDisplayManager_brailleDisplay_pressedKeys___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "stateForDisplay:", v2) == 1)
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));
  else
    WeakRetained = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__SCROBrailleDisplayManager_brailleDisplay_pressedKeys___block_invoke_2;
  v5[3] = &unk_24CC1D500;
  v6 = WeakRetained;
  v7 = *(id *)(a1 + 56);
  v4 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __56__SCROBrailleDisplayManager_brailleDisplay_pressedKeys___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrailleKeypress:", *(_QWORD *)(a1 + 40));
}

- (void)brailleDisplayHadUserInteraction:(id)a3
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SCROBrailleDisplayManager_brailleDisplayHadUserInteraction___block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

void __62__SCROBrailleDisplayManager_brailleDisplayHadUserInteraction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(WeakRetained, "handleUserEventOccured");

}

- (void)brailleDidStartEditingWithDisplay:(id)a3
{
  id v4;
  SCROBrailleDisplayManagedQueue *v5;
  NSObject *eventQueue;
  id v7;
  SCROBrailleDisplayManagedQueue *v8;
  _QWORD block[4];
  SCROBrailleDisplayManagedQueue *v10;
  id v11;
  SCROBrailleDisplayManager *v12;

  v4 = a3;
  v5 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SCROBrailleDisplayManager_brailleDidStartEditingWithDisplay___block_invoke;
  block[3] = &unk_24CC1D448;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(eventQueue, block);

}

void __63__SCROBrailleDisplayManager_brailleDidStartEditingWithDisplay___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "stateForDisplay:", v2) == 1)
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));
  else
    WeakRetained = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SCROBrailleDisplayManager_brailleDidStartEditingWithDisplay___block_invoke_2;
  block[3] = &unk_24CC1D2B0;
  v6 = WeakRetained;
  v4 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __63__SCROBrailleDisplayManager_brailleDidStartEditingWithDisplay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleStartEditing");
}

- (void)brailleDisplay:(id)a3 didReplaceRange:(_NSRange)a4 withString:(id)a5 cursor:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  SCROBrailleDisplayManagedQueue *v13;
  NSObject *eventQueue;
  id v15;
  id v16;
  SCROBrailleDisplayManagedQueue *v17;
  _QWORD block[4];
  SCROBrailleDisplayManagedQueue *v19;
  id v20;
  SCROBrailleDisplayManager *v21;
  id v22;
  NSUInteger v23;
  NSUInteger v24;
  unint64_t v25;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  v12 = a5;
  v13 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__SCROBrailleDisplayManager_brailleDisplay_didReplaceRange_withString_cursor___block_invoke;
  block[3] = &unk_24CC1D5F0;
  v19 = v13;
  v20 = v11;
  v23 = location;
  v24 = length;
  v21 = self;
  v22 = v12;
  v25 = a6;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  dispatch_async(eventQueue, block);

}

void __78__SCROBrailleDisplayManager_brailleDisplay_didReplaceRange_withString_cursor___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "stateForDisplay:", v2) == 1)
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));
  else
    WeakRetained = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__SCROBrailleDisplayManager_brailleDisplay_didReplaceRange_withString_cursor___block_invoke_2;
  block[3] = &unk_24CC1D5C8;
  v8 = WeakRetained;
  v10 = *(_OWORD *)(a1 + 64);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 80);
  v9 = v4;
  v11 = v5;
  v6 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __78__SCROBrailleDisplayManager_brailleDisplay_didReplaceRange_withString_cursor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrailleReplaceTextRange:withString:cursor:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
}

- (void)brailleDisplay:(id)a3 insertedUntranslatedText:(id)a4 speakLiterally:(BOOL)a5
{
  id v8;
  id v9;
  SCROBrailleDisplayManagedQueue *v10;
  NSObject *eventQueue;
  id v12;
  id v13;
  SCROBrailleDisplayManagedQueue *v14;
  _QWORD block[4];
  SCROBrailleDisplayManagedQueue *v16;
  id v17;
  SCROBrailleDisplayManager *v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a4;
  v10 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__SCROBrailleDisplayManager_brailleDisplay_insertedUntranslatedText_speakLiterally___block_invoke;
  block[3] = &unk_24CC1D618;
  v16 = v10;
  v17 = v8;
  v18 = self;
  v19 = v9;
  v20 = a5;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(eventQueue, block);

}

void __84__SCROBrailleDisplayManager_brailleDisplay_insertedUntranslatedText_speakLiterally___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "stateForDisplay:", v2) == 1)
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));
  else
    WeakRetained = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__SCROBrailleDisplayManager_brailleDisplay_insertedUntranslatedText_speakLiterally___block_invoke_2;
  block[3] = &unk_24CC1D550;
  v6 = WeakRetained;
  v7 = *(id *)(a1 + 56);
  v8 = *(_BYTE *)(a1 + 64);
  v4 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __84__SCROBrailleDisplayManager_brailleDisplay_insertedUntranslatedText_speakLiterally___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrailleInsertedUntranslatedText:speakLiterally:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)brailleDisplay:(id)a3 copyStringToClipboard:(id)a4
{
  id v6;
  id v7;
  SCROBrailleDisplayManagedQueue *v8;
  NSObject *eventQueue;
  id v10;
  id v11;
  SCROBrailleDisplayManagedQueue *v12;
  _QWORD v13[4];
  SCROBrailleDisplayManagedQueue *v14;
  id v15;
  SCROBrailleDisplayManager *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__SCROBrailleDisplayManager_brailleDisplay_copyStringToClipboard___block_invoke;
  v13[3] = &unk_24CC1D5A0;
  v14 = v8;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(eventQueue, v13);

}

void __66__SCROBrailleDisplayManager_brailleDisplay_copyStringToClipboard___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "stateForDisplay:", v2) == 1)
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));
  else
    WeakRetained = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__SCROBrailleDisplayManager_brailleDisplay_copyStringToClipboard___block_invoke_2;
  v5[3] = &unk_24CC1D500;
  v6 = WeakRetained;
  v7 = *(id *)(a1 + 56);
  v4 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __66__SCROBrailleDisplayManager_brailleDisplay_copyStringToClipboard___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCopyStringToClipboard:", *(_QWORD *)(a1 + 40));
}

- (void)brailleDisplay:(id)a3 deletedUntranslatedText:(id)a4 speakLiterally:(BOOL)a5
{
  id v8;
  id v9;
  SCROBrailleDisplayManagedQueue *v10;
  NSObject *eventQueue;
  id v12;
  id v13;
  SCROBrailleDisplayManagedQueue *v14;
  _QWORD block[4];
  SCROBrailleDisplayManagedQueue *v16;
  id v17;
  SCROBrailleDisplayManager *v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a4;
  v10 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__SCROBrailleDisplayManager_brailleDisplay_deletedUntranslatedText_speakLiterally___block_invoke;
  block[3] = &unk_24CC1D618;
  v16 = v10;
  v17 = v8;
  v18 = self;
  v19 = v9;
  v20 = a5;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(eventQueue, block);

}

void __83__SCROBrailleDisplayManager_brailleDisplay_deletedUntranslatedText_speakLiterally___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "stateForDisplay:", v2) == 1)
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));
  else
    WeakRetained = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__SCROBrailleDisplayManager_brailleDisplay_deletedUntranslatedText_speakLiterally___block_invoke_2;
  block[3] = &unk_24CC1D550;
  v6 = WeakRetained;
  v7 = *(id *)(a1 + 56);
  v8 = *(_BYTE *)(a1 + 64);
  v4 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __83__SCROBrailleDisplayManager_brailleDisplay_deletedUntranslatedText_speakLiterally___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrailleDeletedUntranslatedText:speakLiterally:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)brailleDisplay:(id)a3 willMemorizeKey:(id)a4
{
  id v6;
  id v7;
  SCROBrailleDisplayManagedQueue *v8;
  NSObject *eventQueue;
  id v10;
  id v11;
  SCROBrailleDisplayManagedQueue *v12;
  _QWORD v13[4];
  SCROBrailleDisplayManagedQueue *v14;
  id v15;
  SCROBrailleDisplayManager *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__SCROBrailleDisplayManager_brailleDisplay_willMemorizeKey___block_invoke;
  v13[3] = &unk_24CC1D5A0;
  v14 = v8;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(eventQueue, v13);

}

void __60__SCROBrailleDisplayManager_brailleDisplay_willMemorizeKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 != *(void **)(a1 + 40) || objc_msgSend(*(id *)(a1 + 32), "stateForDisplay:", v2) != 1)
    goto LABEL_6;
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_DWORD *)(v3 + 232);
  if (v4 == 1)
  {
LABEL_9:
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 72));
    goto LABEL_7;
  }
  if (!v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "primaryDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      v3 = *(_QWORD *)(a1 + 48);
      goto LABEL_9;
    }
  }
LABEL_6:
  WeakRetained = 0;
LABEL_7:
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__SCROBrailleDisplayManager_brailleDisplay_willMemorizeKey___block_invoke_2;
  v9[3] = &unk_24CC1D500;
  v10 = WeakRetained;
  v11 = *(id *)(a1 + 56);
  v8 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __60__SCROBrailleDisplayManager_brailleDisplay_willMemorizeKey___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrailleKeyWillMemorize:", *(_QWORD *)(a1 + 40));
}

- (void)brailleDisplay:(id)a3 memorizedKey:(id)a4
{
  id v6;
  id v7;
  SCROBrailleDisplayManagedQueue *v8;
  NSObject *eventQueue;
  id v10;
  id v11;
  SCROBrailleDisplayManagedQueue *v12;
  _QWORD v13[4];
  SCROBrailleDisplayManagedQueue *v14;
  id v15;
  SCROBrailleDisplayManager *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__SCROBrailleDisplayManager_brailleDisplay_memorizedKey___block_invoke;
  v13[3] = &unk_24CC1D5A0;
  v14 = v8;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(eventQueue, v13);

}

void __57__SCROBrailleDisplayManager_brailleDisplay_memorizedKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 != *(void **)(a1 + 40) || objc_msgSend(*(id *)(a1 + 32), "stateForDisplay:", v2) != 1)
    goto LABEL_6;
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_DWORD *)(v3 + 232);
  if (v4 == 1)
  {
LABEL_9:
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 72));
    goto LABEL_7;
  }
  if (!v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "primaryDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      v3 = *(_QWORD *)(a1 + 48);
      goto LABEL_9;
    }
  }
LABEL_6:
  WeakRetained = 0;
LABEL_7:
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SCROBrailleDisplayManager_brailleDisplay_memorizedKey___block_invoke_2;
  v9[3] = &unk_24CC1D500;
  v10 = WeakRetained;
  v11 = *(id *)(a1 + 56);
  v8 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __57__SCROBrailleDisplayManager_brailleDisplay_memorizedKey___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrailleKeyMemorize:", *(_QWORD *)(a1 + 40));
}

- (void)brailleDisplay:(id)a3 didDisplay:(id)a4
{
  id v6;
  id v7;
  SCROBrailleDisplayManagedQueue *v8;
  NSObject *eventQueue;
  id v10;
  SCROBrailleDisplayManagedQueue *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SCROBrailleDisplayManagedQueue *v15;
  SCROBrailleDisplayManager *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__SCROBrailleDisplayManager_brailleDisplay_didDisplay___block_invoke;
  v13[3] = &unk_24CC1D5A0;
  v14 = v6;
  v15 = v8;
  v16 = self;
  v17 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(eventQueue, v13);

}

void __55__SCROBrailleDisplayManager_brailleDisplay_didDisplay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "primaryDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));
  else
    WeakRetained = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__SCROBrailleDisplayManager_brailleDisplay_didDisplay___block_invoke_2;
  v6[3] = &unk_24CC1D500;
  v7 = WeakRetained;
  v8 = *(id *)(a1 + 56);
  v5 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __55__SCROBrailleDisplayManager_brailleDisplay_didDisplay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrailleDidDisplay:", *(_QWORD *)(a1 + 40));
}

- (void)brailleDisplay:(id)a3 didPanLeft:(id)a4 elementToken:(id)a5 appToken:(id)a6 lineOffset:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SCROBrailleDisplayManagedQueue *v17;
  NSObject *eventQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  SCROBrailleDisplayManagedQueue *v23;
  id v24;
  _QWORD block[5];
  id v26;
  SCROBrailleDisplayManagedQueue *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__SCROBrailleDisplayManager_brailleDisplay_didPanLeft_elementToken_appToken_lineOffset___block_invoke;
  block[3] = &unk_24CC1D668;
  block[4] = self;
  v26 = v12;
  v27 = v17;
  v28 = v13;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v17;
  v24 = v12;
  dispatch_async(eventQueue, block);

}

void __88__SCROBrailleDisplayManager_brailleDisplay_didPanLeft_elementToken_appToken_lineOffset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 232))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "stateForDisplay:", *(_QWORD *)(a1 + 40)) == 1)
    {
      v2 = *(_QWORD *)(a1 + 32);
      if (*(_DWORD *)(v2 + 232) == 1)
        goto LABEL_8;
    }
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "primaryDisplay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == v4)
    {
      v2 = *(_QWORD *)(a1 + 32);
LABEL_8:
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 72));
      goto LABEL_9;
    }
  }
  WeakRetained = 0;
LABEL_9:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__SCROBrailleDisplayManager_brailleDisplay_didPanLeft_elementToken_appToken_lineOffset___block_invoke_2;
  block[3] = &unk_24CC1D640;
  v8 = WeakRetained;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 80);
  v6 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __88__SCROBrailleDisplayManager_brailleDisplay_didPanLeft_elementToken_appToken_lineOffset___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrailleDidPanLeft:elementToken:appToken:lineOffset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)brailleDisplay:(id)a3 didPanRight:(id)a4 elementToken:(id)a5 appToken:(id)a6 lineOffset:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SCROBrailleDisplayManagedQueue *v17;
  NSObject *eventQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  SCROBrailleDisplayManagedQueue *v23;
  id v24;
  _QWORD block[5];
  id v26;
  SCROBrailleDisplayManagedQueue *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__SCROBrailleDisplayManager_brailleDisplay_didPanRight_elementToken_appToken_lineOffset___block_invoke;
  block[3] = &unk_24CC1D668;
  block[4] = self;
  v26 = v12;
  v27 = v17;
  v28 = v13;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v17;
  v24 = v12;
  dispatch_async(eventQueue, block);

}

void __89__SCROBrailleDisplayManager_brailleDisplay_didPanRight_elementToken_appToken_lineOffset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 232))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "stateForDisplay:", *(_QWORD *)(a1 + 40)) == 1)
    {
      v2 = *(_QWORD *)(a1 + 32);
      if (*(_DWORD *)(v2 + 232) == 1)
        goto LABEL_8;
    }
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "primaryDisplay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == v4)
    {
      v2 = *(_QWORD *)(a1 + 32);
LABEL_8:
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 72));
      goto LABEL_9;
    }
  }
  WeakRetained = 0;
LABEL_9:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__SCROBrailleDisplayManager_brailleDisplay_didPanRight_elementToken_appToken_lineOffset___block_invoke_2;
  block[3] = &unk_24CC1D640;
  v8 = WeakRetained;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 80);
  v6 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __89__SCROBrailleDisplayManager_brailleDisplay_didPanRight_elementToken_appToken_lineOffset___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrailleDidPanRight:elementToken:appToken:lineOffset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (id)brailleInputManager
{
  return 0;
}

- (id)newBrailleDisplayCommandDispatcher
{
  return 0;
}

- (void)playBorderHitSoundForBrailleDisplay:(id)a3
{
  id v3;

  -[SCROBrailleDisplayManager delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handlePlayBorderHitSound");

}

- (void)playCommandNotSupportedSoundForBrailleDisplay:(id)a3
{
  id v3;

  -[SCROBrailleDisplayManager delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handlePlayCommandNotSupportedSound");

}

- (void)handlePlanarPanFailedIsLeft:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__SCROBrailleDisplayManager_handlePlanarPanFailedIsLeft___block_invoke;
  v3[3] = &unk_24CC1D2F8;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __57__SCROBrailleDisplayManager_handlePlanarPanFailedIsLeft___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(WeakRetained, "handlePlanarPanFailedIsLeft:", *(unsigned __int8 *)(a1 + 40));

}

- (void)loadBLEDriverWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SCROBrailleDisplayAutoDetector sharedDetector](SCROBrailleDisplayAutoDetector, "sharedDetector");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAutodetectBLEIdentifier:", v3);

}

- (void)_loadStealthDisplay
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SCROBrailleDisplayManager__loadStealthDisplay__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __48__SCROBrailleDisplayManager__loadStealthDisplay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_loadStealthDisplay");
}

- (void)_unloadStealthDisplay
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SCROBrailleDisplayManager__unloadStealthDisplay__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __50__SCROBrailleDisplayManager__unloadStealthDisplay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_unloadStealthDisplay");
}

- (void)_eventQueue_loadStealthDisplay
{
  void *v3;
  id obj;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (!self->_stealthBrailleDisplay && self->_isValid)
  {
    +[SCROStealthBrailleDisplay displayWithDelegate:](SCROStealthBrailleDisplay, "displayWithDelegate:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      obj = v3;
      -[SCROBrailleDisplayManagedQueue addDisplay:withState:](self->_managedDisplayQueue, "addDisplay:withState:", v3, 4);
      objc_storeStrong((id *)&self->_stealthBrailleDisplay, obj);
      v3 = obj;
    }

  }
}

- (void)_eventQueue_unloadStealthDisplay
{
  SCROBrailleDisplay *stealthBrailleDisplay;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplayManagedQueue removeDisplay:](self->_managedDisplayQueue, "removeDisplay:", self->_stealthBrailleDisplay);
  stealthBrailleDisplay = self->_stealthBrailleDisplay;
  self->_stealthBrailleDisplay = 0;

}

- (unint64_t)loadVirtualDisplayWithMainSize:(int64_t)a3
{
  NSObject *eventQueue;
  unint64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SCROBrailleDisplayManager_loadVirtualDisplayWithMainSize___block_invoke;
  block[3] = &unk_24CC1D690;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(eventQueue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __60__SCROBrailleDisplayManager_loadVirtualDisplayWithMainSize___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_eventQueue_loadVirtualDisplayWithMainSize:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_eventQueue_loadVirtualDisplayWithMainSize:(int64_t)a3
{
  SCROVirtualBrailleDisplay *v4;
  NSMutableDictionary *virtualDisplays;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = -[SCROVirtualBrailleDisplay initWithMainSize:]([SCROVirtualBrailleDisplay alloc], "initWithMainSize:", a3);
  -[SCROBrailleDisplay _delayedDisplayLoad](v4, "_delayedDisplayLoad");
  -[SCROBrailleDisplayManagedQueue addDisplay:withState:](self->_managedDisplayQueue, "addDisplay:withState:", v4, 4);
  -[SCROBrailleDisplayManager brailleDisplay:driverDidLoad:](self, "brailleDisplay:driverDidLoad:", v4, 1);
  virtualDisplays = self->_virtualDisplays;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", _eventQueue_loadVirtualDisplayWithMainSize__token);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](virtualDisplays, "setObject:forKey:", v4, v6);

  _SCROD_LOG();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SCROVirtualBrailleDisplay mainSize](v4, "mainSize"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", _eventQueue_loadVirtualDisplayWithMainSize__token);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_2115BB000, v7, OS_LOG_TYPE_DEFAULT, "Virtual display with %@ main cells loaded. Token: %@", (uint8_t *)&v12, 0x16u);

  }
  v10 = _eventQueue_loadVirtualDisplayWithMainSize__token++;

  return v10;
}

- (void)unloadVirtualDisplay:(unint64_t)a3
{
  NSObject *eventQueue;
  _QWORD v4[6];

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SCROBrailleDisplayManager_unloadVirtualDisplay___block_invoke;
  v4[3] = &unk_24CC1D6B8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(eventQueue, v4);
}

uint64_t __50__SCROBrailleDisplayManager_unloadVirtualDisplay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_unloadVirtualDisplay:", *(_QWORD *)(a1 + 40));
}

- (void)_eventQueue_unloadVirtualDisplay:(unint64_t)a3
{
  NSMutableDictionary *virtualDisplays;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  virtualDisplays = self->_virtualDisplays;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](virtualDisplays, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SCROBrailleDisplayManagedQueue removeDisplay:](self->_managedDisplayQueue, "removeDisplay:", v7);
    v8 = self->_virtualDisplays;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

    _SCROD_LOG();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      v12 = "Virtual display with token %@ unloaded.";
LABEL_6:
      _os_log_impl(&dword_2115BB000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);

    }
  }
  else
  {
    _SCROD_LOG();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      v12 = "Virtual display with token %@ not found.";
      goto LABEL_6;
    }
  }

}

- (id)mainCellsForVirtualDisplay:(unint64_t)a3
{
  NSObject *eventQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SCROBrailleDisplayManager_mainCellsForVirtualDisplay___block_invoke;
  block[3] = &unk_24CC1D690;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(eventQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__SCROBrailleDisplayManager_mainCellsForVirtualDisplay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_eventQueue_mainCellsForVirtualDisplay:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_eventQueue_mainCellsForVirtualDisplay:(unint64_t)a3
{
  NSMutableDictionary *virtualDisplays;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  virtualDisplays = self->_virtualDisplays;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](virtualDisplays, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "mainCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _SCROD_LOG();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_2115BB000, v8, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@ is displaying \"%@\", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    _SCROD_LOG();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_2115BB000, v8, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@ not found.", (uint8_t *)&v12, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

- (void)virtualDisplay:(unint64_t)a3 pressButton:(unint64_t)a4
{
  NSObject *eventQueue;
  _QWORD block[7];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SCROBrailleDisplayManager_virtualDisplay_pressButton___block_invoke;
  block[3] = &unk_24CC1D6E0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(eventQueue, block);
}

uint64_t __56__SCROBrailleDisplayManager_virtualDisplay_pressButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_virtualDisplay:pressButton:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_eventQueue_virtualDisplay:(unint64_t)a3 pressButton:(unint64_t)a4
{
  NSMutableDictionary *virtualDisplays;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  virtualDisplays = self->_virtualDisplays;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](virtualDisplays, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    switch(a4)
    {
      case 0uLL:
        objc_msgSend(v8, "pressPanLeft");
        _SCROD_LOG();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v10;
          v11 = "Virtual display with token %@: pan left pressed.";
          goto LABEL_15;
        }
        break;
      case 1uLL:
        objc_msgSend(v8, "pressPanRight");
        _SCROD_LOG();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v10;
          v11 = "Virtual display with token %@: pan right pressed.";
          goto LABEL_15;
        }
        break;
      case 2uLL:
        objc_msgSend(v8, "pressPrevious");
        _SCROD_LOG();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v10;
          v11 = "Virtual display with token %@: previous pressed.";
          goto LABEL_15;
        }
        break;
      case 3uLL:
        objc_msgSend(v8, "pressNext");
        _SCROD_LOG();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v10;
          v11 = "Virtual display with token %@: next pressed.";
          goto LABEL_15;
        }
        break;
      default:
        _SCROD_LOG();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v10;
          v11 = "Undefined button number: %@";
          goto LABEL_15;
        }
        break;
    }
  }
  else
  {
    _SCROD_LOG();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      v11 = "Virtual display with token %@ not found.";
LABEL_15:
      _os_log_impl(&dword_2115BB000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0xCu);

    }
  }

}

- (void)virtualDisplay:(unint64_t)a3 pressKeyChord:(unint64_t)a4
{
  NSObject *eventQueue;
  _QWORD block[7];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SCROBrailleDisplayManager_virtualDisplay_pressKeyChord___block_invoke;
  block[3] = &unk_24CC1D6E0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(eventQueue, block);
}

uint64_t __58__SCROBrailleDisplayManager_virtualDisplay_pressKeyChord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_virtualDisplay:pressKeyChord:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_eventQueue_virtualDisplay:(unint64_t)a3 pressKeyChord:(unint64_t)a4
{
  NSMutableDictionary *virtualDisplays;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  virtualDisplays = self->_virtualDisplays;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](virtualDisplays, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _SCROD_LOG();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_2115BB000, v9, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@: keychord %@ pressed.", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v8, "pressKeyChord:", a4);
  }
  else
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_2115BB000, v9, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@ not found.", (uint8_t *)&v14, 0xCu);

    }
  }

}

- (void)virtualDisplay:(unint64_t)a3 pressRouterWithIndex:(unint64_t)a4
{
  NSObject *eventQueue;
  _QWORD block[7];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SCROBrailleDisplayManager_virtualDisplay_pressRouterWithIndex___block_invoke;
  block[3] = &unk_24CC1D6E0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(eventQueue, block);
}

uint64_t __65__SCROBrailleDisplayManager_virtualDisplay_pressRouterWithIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_virtualDisplay:pressRouterWithIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_eventQueue_virtualDisplay:(unint64_t)a3 pressRouterWithIndex:(unint64_t)a4
{
  NSMutableDictionary *virtualDisplays;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  virtualDisplays = self->_virtualDisplays;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](virtualDisplays, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _SCROD_LOG();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_2115BB000, v9, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@: router with index %@ pressed.", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v8, "pressRouterWithIndex:", a4);
  }
  else
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_2115BB000, v9, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@ not found.", (uint8_t *)&v14, 0xCu);

    }
  }

}

- (id)driverConfiguration
{
  NSObject *eventQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__SCROBrailleDisplayManager_driverConfiguration__block_invoke;
  v6[3] = &unk_24CC1D488;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__SCROBrailleDisplayManager_driverConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_eventQueue_driverConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_eventQueue_driverConfiguration
{
  __CFDictionary *displayConfigurationDict;
  const __CFDictionary *Copy;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SCROBrailleDisplay *v13;
  char v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  displayConfigurationDict = self->_displayConfigurationDict;
  if (displayConfigurationDict)
  {
    Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], displayConfigurationDict);
    if (Copy)
    {
      -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      -[SCROBrailleDisplayManagedQueue activePendingDisplays](self->_managedDisplayQueue, "activePendingDisplays");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copy");

      -[SCROBrailleDisplayManagedQueue sleepingDisplays](self->_managedDisplayQueue, "sleepingDisplays");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      -[SCROBrailleDisplayManagedQueue disconnectedDisplays](self->_managedDisplayQueue, "disconnectedDisplays");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");

      v13 = self->_stealthBrailleDisplay;
      v14 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    Copy = 0;
  }
  v13 = 0;
  v12 = 0;
  v10 = 0;
  v8 = 0;
  v6 = 0;
  v14 = 1;
LABEL_6:
  _SCROD_LOG();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v61 = v6;
    v62 = 2114;
    v63 = v8;
    _os_log_impl(&dword_2115BB000, v15, OS_LOG_TYPE_DEFAULT, "active: %{public}@ pending %{public}@", buf, 0x16u);
  }

  if ((v14 & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    v39 = v10;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", CFDictionaryGetCount(Copy));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v13);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v53;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v53 != v20)
            objc_enumerationMutation(v17);
          _addDisplayConfigurationToList(*(void **)(*((_QWORD *)&v52 + 1) + 8 * v21++), v16, Copy, 1);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v16, "objectAtIndex:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", MEMORY[0x24BDBD1C8], kSCROBrailleDisplayIsPrimary[0]);

    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v23 = v8;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v49;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v49 != v26)
            objc_enumerationMutation(v23);
          _addDisplayConfigurationToList(*(void **)(*((_QWORD *)&v48 + 1) + 8 * v27++), v16, Copy, 2);
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      }
      while (v25);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v28 = v39;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v45;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v45 != v31)
            objc_enumerationMutation(v28);
          _addDisplayConfigurationToList(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v32++), v16, Copy, 3);
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      }
      while (v30);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v33 = v12;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v41;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v41 != v36)
            objc_enumerationMutation(v33);
          _addDisplayConfigurationToList(*(void **)(*((_QWORD *)&v40 + 1) + 8 * v37++), v16, Copy, 0);
        }
        while (v35 != v37);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
      }
      while (v35);
    }

    CFRelease(Copy);
    v10 = v39;
  }

  return v16;
}

- (void)_blankOutDisplaysInQueue:(id)a3
{
  id v4;
  SCROBrailleFormatter *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SCROBrailleFormatter initWithOutputTableIdentifier:inputTableIdentifier:showDotsSevenAndEight:]([SCROBrailleFormatter alloc], "initWithOutputTableIdentifier:inputTableIdentifier:showDotsSevenAndEight:", self->_outputTableIdentifier, self->_inputTableIdentifier, 1);
  v6 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v12, "setBrailleFormatter:", v5, (_QWORD)v13);
        objc_msgSend(v12, "setAggregatedStatus:", v6);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)isConfigured
{
  NSObject *eventQueue;
  uint64_t v4;
  BOOL v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SCROBrailleDisplayManager_isConfigured__block_invoke;
  block[3] = &unk_24CC1D708;
  block[4] = self;
  block[5] = &v8;
  block[6] = &v12;
  dispatch_sync(eventQueue, block);
  v4 = v9[3];
  if (*((_BYTE *)v13 + 24))
    v9[3] = --v4;
  v5 = v4 > 0;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __41__SCROBrailleDisplayManager_isConfigured__block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "displayCountIncludingDisconnectedDisplays:", 0);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 32) != 0;
  return result;
}

- (BOOL)hasActiveDisplays
{
  NSObject *eventQueue;
  uint64_t v4;
  BOOL v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SCROBrailleDisplayManager_hasActiveDisplays__block_invoke;
  block[3] = &unk_24CC1D708;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(eventQueue, block);
  v4 = v13[3];
  if (*((_BYTE *)v9 + 24))
    v13[3] = --v4;
  v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __46__SCROBrailleDisplayManager_hasActiveDisplays__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 16), "activeDisplays");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v2, "count");

  result = objc_msgSend(*(id *)(a1[4] + 16), "stateForDisplay:", *(_QWORD *)(a1[4] + 32));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_DWORD)result == 1;
  return result;
}

- (void)setPrimaryBrailleDisplay:(int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SCROBrailleDisplayManager_setPrimaryBrailleDisplay___block_invoke;
  v4[3] = &unk_24CC1D730;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __54__SCROBrailleDisplayManager_setPrimaryBrailleDisplay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setPrimaryDisplay:", *(unsigned int *)(a1 + 40));
}

- (void)_eventQueue_setPrimaryDisplay:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplayManagedQueue displayForToken:](self->_managedDisplayQueue, "displayForToken:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SCROBrailleDisplayManagedQueue primaryDisplay](self->_managedDisplayQueue, "primaryDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 != v6
      && (-[SCROBrailleDisplayManagedQueue setPrimaryDisplay:](self->_managedDisplayQueue, "setPrimaryDisplay:", v5),
          -[SCROBrailleDisplayManagedQueue primaryDisplay](self->_managedDisplayQueue, "primaryDisplay"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v5 == v7))
    {
      objc_msgSend(v6, "setDelegateWantsDisplayCallback:", 0);
      objc_msgSend(v6, "setInputAllowed:", self->_inputAccessMode == 1);
      objc_msgSend(v5, "setDelegateWantsDisplayCallback:", self->_lineDescriptorDisplayCallbackEnabled);
      objc_msgSend(v5, "setInputAllowed:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else
    {
      WeakRetained = 0;
    }

  }
  else
  {
    WeakRetained = 0;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SCROBrailleDisplayManager__eventQueue_setPrimaryDisplay___block_invoke;
  block[3] = &unk_24CC1D2B0;
  v13 = WeakRetained;
  v9 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[SCROBrailleDisplayManager brailleInputManager](self, "brailleInputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleDisplayManager _eventQueue_driverConfiguration](self, "_eventQueue_driverConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configureWithDriverConfiguration:", v11);

}

uint64_t __59__SCROBrailleDisplayManager__eventQueue_setPrimaryDisplay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configurationDidChange");
}

- (void)setDisplayInputAccessMode:(int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SCROBrailleDisplayManager_setDisplayInputAccessMode___block_invoke;
  v4[3] = &unk_24CC1D730;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __55__SCROBrailleDisplayManager_setDisplayInputAccessMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setDisplayInputAccessMode:", *(unsigned int *)(a1 + 40));
}

- (int)displayInputAccessMode
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SCROBrailleDisplayManager_displayInputAccessMode__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __51__SCROBrailleDisplayManager_displayInputAccessMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 232);
  return result;
}

- (void)_eventQueue_setDisplayInputAccessMode:(int)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  id v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  self->_inputAccessMode = a3;
  -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v5, "copy");

  v6 = objc_msgSend(v11, "count");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v11, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInputAllowed:", a3 < 2);

    if (v7 != 1)
    {
      for (i = 1; i != v7; ++i)
      {
        objc_msgSend(v11, "objectAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setInputAllowed:", a3 == 1);

      }
    }
  }

}

- (void)setMainAttributedString:(id)a3
{
  -[SCROBrailleDisplayManager setMainAttributedString:forceUpdate:](self, "setMainAttributedString:forceUpdate:", a3, 0);
}

- (void)setMainAttributedString:(id)a3 forceUpdate:(BOOL)a4
{
  id v6;
  NSObject *eventQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SCROBrailleDisplayManager_setMainAttributedString_forceUpdate___block_invoke;
  block[3] = &unk_24CC1D550;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(eventQueue, block);

}

void __65__SCROBrailleDisplayManager_setMainAttributedString_forceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setMainAttributedString:shouldDisplay:forceUpdate:", *(_QWORD *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 48));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SCROBrailleDisplayManager_setMainAttributedString_forceUpdate___block_invoke_2;
  block[3] = &unk_24CC1D550;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(_BYTE *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__SCROBrailleDisplayManager_setMainAttributedString_forceUpdate___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "eventHandled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventHandled");
    v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCROBrailleEvent eventWithType:data:data2:data3:](SCROBrailleEvent, "eventWithType:data:data2:data3:", 0, v3, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
}

- (id)mainAttributedString
{
  NSObject *eventQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__SCROBrailleDisplayManager_mainAttributedString__block_invoke;
  v6[3] = &unk_24CC1D488;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__SCROBrailleDisplayManager_mainAttributedString__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_eventQueue_mainAttributedString");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_eventQueue_mainAttributedString
{
  return (id)-[NSAttributedString copy](self->_mainString, "copy");
}

- (void)_eventQueue_setMainAttributedString:(id)a3 shouldDisplay:(BOOL)a4 forceUpdate:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  SCROBrailleFormatter *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  id WeakRetained;
  void *v19;
  char v20;
  _BOOL8 v21;
  SCROBrailleFormatter *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  SCROBrailleFormatter *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  _BOOL8 v35;
  _BOOL8 v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  _BOOL8 v42;
  void *v43;
  void *v44;
  void *v45;
  NSAttributedString *v46;
  NSAttributedString *mainString;
  _BOOL4 v48;
  _QWORD block[4];
  id v50;
  int v51;
  _QWORD v52[2];
  _QWORD v53[2];
  uint8_t buf[4];
  int v55;
  uint64_t v56;

  v5 = a4;
  v6 = (uint64_t)a3;
  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (objc_msgSend(v8, "length"))
  {
    v9 = -[SCROBrailleFormatter initWithOutputTableIdentifier:inputTableIdentifier:showDotsSevenAndEight:]([SCROBrailleFormatter alloc], "initWithOutputTableIdentifier:inputTableIdentifier:showDotsSevenAndEight:", self->_outputTableIdentifier, self->_inputTableIdentifier, self->_showDotsSevenAndEight);
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", kSCROLineFocusAttribute[0], 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "unsignedIntegerValue");
    else
      v12 = 0;
    -[SCROBrailleFormatter setLineFocus:](v9, "setLineFocus:", v12);
    v53[0] = 0;
    v53[1] = 0;
    -[NSMutableArray lastObject](self->_displayModeStack, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = objc_msgSend(v13, "intValue");
    else
      v15 = 0;

    v16 = objc_msgSend(v8, "getRange:ofAttribute:", v53, kSCROTokenAttribute[0]);
    v52[0] = 0;
    v52[1] = 0;
    objc_msgSend(v8, "getRange:ofAttribute:", v52, kSCROTerminalOutputAttribute[0]);
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v5;
      if (objc_msgSend(v17, "isShowingAlert"))
      {

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isCandidateSelectionActive");

      if ((v20 & 1) == 0)
      {
LABEL_15:
        if (!v15
          || v15 == 5
          || v15 == 1 && -[NSMutableArray count](self->_displayModeStack, "count") == 1 && self->_alertPriority > 5u)
        {
          objc_storeStrong((id *)&self->_mainString, (id)v6);
          -[SCROBrailleDisplayManager _eventQueue_stopAlertTimer](self, "_eventQueue_stopAlertTimer");
          objc_storeStrong((id *)&self->_lineString, self->_mainString);
          if (v15)
          {
            -[SCROBrailleDisplayManager _eventQueue_doSetDisplayMode:](self, "_eventQueue_doSetDisplayMode:", 0);
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          }
          else
          {
            WeakRetained = 0;
          }
          v6 = 0;
LABEL_41:
          objc_msgSend(v8, "attribute:atIndex:effectiveRange:", kSCROBrailleOffsetAttribute[0], 0, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "integerValue");

          -[SCROBrailleFormatter setLineOffset:](v9, "setLineOffset:", v38);
          _SCROD_LOG();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            v55 = v38;
            _os_log_impl(&dword_2115BB000, v39, OS_LOG_TYPE_INFO, "Setting line offset: %d", buf, 8u);
          }

          -[SCROBrailleFormatter setCurrentUnread:](v9, "setCurrentUnread:", 0);
          -[SCROBrailleFormatter setAnyUnread:](v9, "setAnyUnread:", -[SCROBrailleDisplayHistory hasUnread](self->_history, "hasUnread"));
          -[SCROBrailleFormatter setDisplayMode:](v9, "setDisplayMode:", v6);
          objc_msgSend(v8, "attribute:atIndex:effectiveRange:", kSCROAppTokenAttribute[0], 0, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCROBrailleFormatter setAppToken:](v9, "setAppToken:", v40);
          -[SCROBrailleDisplayManager tokenizeString:intoFormatter:selection:](self, "tokenizeString:intoFormatter:selection:", v8, v9, v53);

          if ((v16 & 1) != 0)
          {
            if (!v48)
              goto LABEL_56;
LABEL_55:
            -[SCROBrailleDisplayManager _setBrailleFormatter:](self, "_setBrailleFormatter:", v9);
            -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)objc_msgSend(v44, "copy");

            objc_msgSend(v45, "makeObjectsPerformSelector:withObject:", sel_setBrailleFormatter_, v9);
            goto LABEL_56;
          }
          -[SCROBrailleDisplayManager _eventQueue_resetAlertTimer](self, "_eventQueue_resetAlertTimer");
          if (v48)
            goto LABEL_55;
LABEL_56:
          if (WeakRetained)
          {
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __91__SCROBrailleDisplayManager__eventQueue_setMainAttributedString_shouldDisplay_forceUpdate___block_invoke;
            block[3] = &unk_24CC1D730;
            v50 = WeakRetained;
            v51 = v6;
            v11 = WeakRetained;
            dispatch_async(MEMORY[0x24BDAC9B8], block);

            goto LABEL_58;
          }
LABEL_59:

          goto LABEL_60;
        }
        objc_storeStrong((id *)&self->_lineString, (id)v6);
      }
LABEL_27:
      v26 = 0;
LABEL_28:

      v9 = v26;
LABEL_58:

      goto LABEL_59;
    }
    if ((objc_msgSend(v8, "getRange:ofAttribute:", v53, kSCROAlertAttribute[0]) & 1) != 0)
    {
      objc_storeStrong((id *)&self->_mainString, (id)v6);
      if (v15 == 1)
      {
        WeakRetained = 0;
      }
      else
      {
        -[SCROBrailleDisplayManager _eventQueue_doSetDisplayMode:](self, "_eventQueue_doSetDisplayMode:", 1);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      }
      -[SCROBrailleDisplayHistory addString:](self->_history, "addString:", v8);
      objc_msgSend(v8, "attribute:atIndex:effectiveRange:", kSCROAlertTimeoutAttribute[0], 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      v29 = v28;

      v30 = 0.0;
      if (v29 >= 0.0)
        v30 = v29;
      self->_alertTimeout = fmin(v30, 60.0);
      objc_msgSend(v8, "attribute:atIndex:effectiveRange:", kSCROAlertPriorityAttribute[0], 0, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      v48 = v5;
      if (v31)
        v33 = objc_msgSend(v31, "intValue");
      else
        v33 = 5;
      self->_alertPriority = v33;

      v6 = 1;
      goto LABEL_41;
    }
    if (SCROBrailleDisplayHistoryIsHistoryString(v8))
    {
      if (v15 != 2)
        goto LABEL_27;
      -[SCROBrailleDisplayManagerStatus setCurrentAnnouncementUnread:](self->_status, "setCurrentAnnouncementUnread:", SCROBrailleDisplayHistoryIsStringUnread(v8));
      -[SCROBrailleDisplayManagerStatus setAnyUnreadAnnouncements:](self->_status, "setAnyUnreadAnnouncements:", -[SCROBrailleDisplayHistory hasUnread](self->_history, "hasUnread"));
      objc_storeStrong((id *)&self->_mainString, (id)v6);
      -[SCROBrailleFormatter setCurrentUnread:](v9, "setCurrentUnread:", -[SCROBrailleDisplayManagerStatus currentAnnouncementUnread](self->_status, "currentAnnouncementUnread"));
      v21 = -[SCROBrailleDisplayManagerStatus anyUnreadAnnouncements](self->_status, "anyUnreadAnnouncements");
      v22 = v9;
    }
    else
    {
      objc_msgSend(v8, "attribute:atIndex:effectiveRange:", kSCROStatusAttribute[0], 0, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v35 = -[SCROBrailleFormatter currentUnread](self->_currentBrailleFormatter, "currentUnread");
        v36 = -[SCROBrailleFormatter anyUnread](self->_currentBrailleFormatter, "anyUnread");
        if (v15 == 3)
        {
          WeakRetained = 0;
        }
        else
        {
          -[SCROBrailleDisplayManager _eventQueue_doSetDisplayMode:](self, "_eventQueue_doSetDisplayMode:", 3);
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        }
        objc_storeStrong((id *)&self->_mainString, (id)v6);
        objc_storeStrong((id *)&self->_statusString, self->_mainString);
        -[SCROBrailleFormatter setCurrentUnread:](v9, "setCurrentUnread:", v35);
        -[SCROBrailleFormatter setAnyUnread:](v9, "setAnyUnread:", v36);
        LODWORD(v6) = 3;
        -[SCROBrailleFormatter setDisplayMode:](v9, "setDisplayMode:", 3);
        -[SCROBrailleFormatter setStatusText:](v9, "setStatusText:", self->_mainString);

        if (v5)
          goto LABEL_55;
        goto LABEL_56;
      }
      v41 = -[SCROBrailleDisplayHistory isOnMostRecent](self->_history, "isOnMostRecent");
      -[SCROBrailleDisplayHistory addString:](self->_history, "addString:", v8);
      if ((v41 & 1) == 0 && v15 == 2)
      {
        v42 = -[SCROBrailleFormatter currentUnread](self->_currentBrailleFormatter, "currentUnread");
        -[SCROBrailleFormatter setAnyUnread:](v9, "setAnyUnread:", 1);
        -[SCROBrailleFormatter setCurrentUnread:](v9, "setCurrentUnread:", v42);
        LODWORD(v6) = 2;
        -[SCROBrailleFormatter setDisplayMode:](v9, "setDisplayMode:", 2);
        -[SCROBrailleDisplayHistory currentString](self->_history, "currentString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "string");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCROBrailleFormatter addText:selection:token:focus:isEditableText:](v9, "addText:selection:token:focus:isEditableText:", v43, 0, 0, 0, 0);

        goto LABEL_51;
      }
      if (v15 != 2)
      {
        -[SCROBrailleFormatter setAnyUnread:](self->_currentBrailleFormatter, "setAnyUnread:", 1);
        v26 = self->_currentBrailleFormatter;
        goto LABEL_28;
      }
      -[SCROBrailleDisplayHistory moveToMostRecent](self->_history, "moveToMostRecent");
      -[SCROBrailleDisplayHistory currentString](self->_history, "currentString");
      v46 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      mainString = self->_mainString;
      self->_mainString = v46;

      -[SCROBrailleFormatter setCurrentUnread:](v9, "setCurrentUnread:", 1);
      v22 = v9;
      v21 = 1;
    }
    -[SCROBrailleFormatter setAnyUnread:](v22, "setAnyUnread:", v21);
    LODWORD(v6) = 2;
    -[SCROBrailleFormatter setDisplayMode:](v9, "setDisplayMode:", 2);
    -[NSAttributedString attribute:atIndex:effectiveRange:](self->_mainString, "attribute:atIndex:effectiveRange:", kSCROTechnicalContextAttribute[0], 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    -[NSAttributedString string](self->_mainString, "string");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleFormatter addText:selection:token:focus:technical:isEditableText:](v9, "addText:selection:token:focus:technical:isEditableText:", v25, 0, 0, 0, v24, 0);
LABEL_51:

    if (!v5)
      goto LABEL_59;
    WeakRetained = 0;
    goto LABEL_55;
  }
LABEL_60:

}

void __91__SCROBrailleDisplayManager__eventQueue_setMainAttributedString_shouldDisplay_forceUpdate___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleDisplayModeChanged:", v2);

}

- (void)_setBrailleFormatter:(id)a3
{
  void *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_storeStrong((id *)&self->_currentBrailleFormatter, a3);
  objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTechnicalMode:", objc_msgSend(v13, "needsTechnicalMode"));

  LODWORD(self) = objc_msgSend(v13, "displayMode");
  v6 = objc_msgSend(v13, "displayMode");
  if ((_DWORD)self == 2 || (v7 = v6, v8 = objc_msgSend(v13, "displayMode"), v7 == 1))
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "editString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlert:", v10);
  }
  else
  {
    v11 = v8;
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEditable:", objc_msgSend(v13, "isEditableText"));

    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "editString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == 5)
      objc_msgSend(v9, "setTerminalOutput:", v10);
    else
      objc_msgSend(v9, "setScript:", v10);
  }

}

- (void)setAggregatedStatus:(id)a3
{
  id v4;
  NSObject *eventQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SCROBrailleDisplayManager_setAggregatedStatus___block_invoke;
  v7[3] = &unk_24CC1D500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(eventQueue, v7);

}

uint64_t __49__SCROBrailleDisplayManager_setAggregatedStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setAggregatedStatus:", *(_QWORD *)(a1 + 40));
}

- (id)aggregatedStatus
{
  NSObject *eventQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__SCROBrailleDisplayManager_aggregatedStatus__block_invoke;
  v6[3] = &unk_24CC1D488;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __45__SCROBrailleDisplayManager_aggregatedStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "aggregatedData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_eventQueue_setAggregatedStatus:(id)a3
{
  NSObject *eventQueue;
  id v5;
  void *v6;
  id v7;

  eventQueue = self->_eventQueue;
  v5 = a3;
  dispatch_assert_queue_V2(eventQueue);
  -[SCROBrailleDisplayManagerStatus setAggregatedData:](self->_status, "setAggregatedData:", v5);
  -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "copy");

  objc_msgSend(v7, "makeObjectsPerformSelector:withObject:", sel_setAggregatedStatus_, v5);
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  NSObject *eventQueue;
  _QWORD v4[6];

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SCROBrailleDisplayManager_setMasterStatusCellIndex___block_invoke;
  v4[3] = &unk_24CC1D6B8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __54__SCROBrailleDisplayManager_setMasterStatusCellIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setMasterStatusCellIndex:", *(_QWORD *)(a1 + 40));
}

- (int64_t)masterStatusCellIndex
{
  NSObject *eventQueue;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__SCROBrailleDisplayManager_masterStatusCellIndex__block_invoke;
  v6[3] = &unk_24CC1D488;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __50__SCROBrailleDisplayManager_masterStatusCellIndex__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "masterStatusCellIndex");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_eventQueue_setMasterStatusCellIndex:(int64_t)a3
{
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplayManagerStatus setMasterStatusCellIndex:](self->_status, "setMasterStatusCellIndex:", a3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__SCROBrailleDisplayManager__eventQueue_setMasterStatusCellIndex___block_invoke;
  v5[3] = &__block_descriptor_40_e28_v16__0__SCROBrailleDisplay_8l;
  v5[4] = a3;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v5);
}

uint64_t __66__SCROBrailleDisplayManager__eventQueue_setMasterStatusCellIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMasterStatusCellIndex:", *(_QWORD *)(a1 + 32));
}

- (void)setVirtualStatusAlignment:(int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SCROBrailleDisplayManager_setVirtualStatusAlignment___block_invoke;
  v4[3] = &unk_24CC1D730;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __55__SCROBrailleDisplayManager_setVirtualStatusAlignment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setVirtualStatusAlignment:", *(unsigned int *)(a1 + 40));
}

- (int)virtualStatusAlignment
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SCROBrailleDisplayManager_virtualStatusAlignment__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __51__SCROBrailleDisplayManager_virtualStatusAlignment__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "virtualAlignment");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_eventQueue_setVirtualStatusAlignment:(int)a3
{
  uint64_t v3;
  _QWORD v5[4];
  int v6;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplayManagerStatus setVirtualAlignment:](self->_status, "setVirtualAlignment:", v3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__SCROBrailleDisplayManager__eventQueue_setVirtualStatusAlignment___block_invoke;
  v5[3] = &__block_descriptor_36_e28_v16__0__SCROBrailleDisplay_8l;
  v6 = v3;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v5);
}

uint64_t __67__SCROBrailleDisplayManager__eventQueue_setVirtualStatusAlignment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVirtualStatusAlignment:", *(unsigned int *)(a1 + 32));
}

- (void)panDisplayLeft:(int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SCROBrailleDisplayManager_panDisplayLeft___block_invoke;
  v4[3] = &unk_24CC1D730;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __44__SCROBrailleDisplayManager_panDisplayLeft___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_panDisplay:token:", 1, *(unsigned int *)(a1 + 40));
}

- (void)panDisplayRight:(int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__SCROBrailleDisplayManager_panDisplayRight___block_invoke;
  v4[3] = &unk_24CC1D730;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __45__SCROBrailleDisplayManager_panDisplayRight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_panDisplay:token:", 2, *(unsigned int *)(a1 + 40));
}

- (void)panDisplayBeginning:(int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__SCROBrailleDisplayManager_panDisplayBeginning___block_invoke;
  v4[3] = &unk_24CC1D730;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __49__SCROBrailleDisplayManager_panDisplayBeginning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_panDisplay:token:", 3, *(unsigned int *)(a1 + 40));
}

- (void)panDisplayEnd:(int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__SCROBrailleDisplayManager_panDisplayEnd___block_invoke;
  v4[3] = &unk_24CC1D730;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __43__SCROBrailleDisplayManager_panDisplayEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_panDisplay:token:", 4, *(unsigned int *)(a1 + 40));
}

- (void)_eventQueue_panDisplay:(int64_t)a3 token:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplayManagedQueue displayForToken:](self->_managedDisplayQueue, "displayForToken:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:") != 1)
  {

    v11 = 0;
  }
  -[NSMutableArray lastObject](self->_displayModeStack, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "intValue");

    if (v9 == 1)
      -[SCROBrailleDisplayManager _eventQueue_resetAlertTimer](self, "_eventQueue_resetAlertTimer");
  }
  v10 = v11;
  switch(a3)
  {
    case 1:
      objc_msgSend(v11, "panLeft");
      goto LABEL_11;
    case 2:
      objc_msgSend(v11, "panRight");
      goto LABEL_11;
    case 3:
      objc_msgSend(v11, "panBeginning");
      goto LABEL_11;
    case 4:
      objc_msgSend(v11, "panEnd");
LABEL_11:
      v10 = v11;
      break;
    default:
      break;
  }

}

- (void)planarPanDisplayLeft:(int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SCROBrailleDisplayManager_planarPanDisplayLeft___block_invoke;
  v4[3] = &unk_24CC1D730;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __50__SCROBrailleDisplayManager_planarPanDisplayLeft___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_planarPanDisplay:token:", 1, *(unsigned int *)(a1 + 40));
}

- (void)planarPanDisplayRight:(int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SCROBrailleDisplayManager_planarPanDisplayRight___block_invoke;
  v4[3] = &unk_24CC1D730;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __51__SCROBrailleDisplayManager_planarPanDisplayRight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_planarPanDisplay:token:", 2, *(unsigned int *)(a1 + 40));
}

- (void)_eventQueue_planarPanDisplay:(int64_t)a3 token:(int)a4
{
  uint64_t v4;
  void *v7;
  id v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplayManagedQueue displayForToken:](self->_managedDisplayQueue, "displayForToken:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:") == 1)
  {
    v7 = v8;
  }
  else
  {

    v7 = 0;
  }
  if (a3 == 2)
  {
    v9 = v7;
    objc_msgSend(v7, "planarPanRight");
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    v9 = v7;
    objc_msgSend(v7, "planarPanLeft");
LABEL_8:
    v7 = v9;
  }

}

- (void)setUIDisplayMode
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SCROBrailleDisplayManager_setUIDisplayMode__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __45__SCROBrailleDisplayManager_setUIDisplayMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setDisplayMode:", 0);
}

- (void)setAnnouncementsDisplayMode
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SCROBrailleDisplayManager_setAnnouncementsDisplayMode__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __56__SCROBrailleDisplayManager_setAnnouncementsDisplayMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setDisplayMode:", 2);
}

- (void)exitCurrentDisplayMode
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SCROBrailleDisplayManager_exitCurrentDisplayMode__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __51__SCROBrailleDisplayManager_exitCurrentDisplayMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_exitCurrentDisplayMode");
}

- (int)displayMode
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__SCROBrailleDisplayManager_displayMode__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __40__SCROBrailleDisplayManager_displayMode__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
}

- (void)_eventQueue_setDisplayMode:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD v9[5];
  int v10;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[NSMutableArray lastObject](self->_displayModeStack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "intValue");
  else
    v7 = 0;

  if (v7 != (_DWORD)v3)
  {
    -[SCROBrailleDisplayManager _eventQueue_doSetDisplayMode:](self, "_eventQueue_doSetDisplayMode:", v3);
    -[SCROBrailleDisplayManager _eventQueue_cachedMainStringForDisplayMode:](self, "_eventQueue_cachedMainStringForDisplayMode:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleDisplayManager setMainAttributedString:forceUpdate:](self, "setMainAttributedString:forceUpdate:", v8, 1);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__SCROBrailleDisplayManager__eventQueue_setDisplayMode___block_invoke;
    v9[3] = &unk_24CC1D730;
    v9[4] = self;
    v10 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
}

void __56__SCROBrailleDisplayManager__eventQueue_setDisplayMode___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "handleDisplayModeChanged:", v2);

}

- (void)_eventQueue_doSetDisplayMode:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSAttributedString *v22;
  NSAttributedString *uiEditingCachedString;
  NSObject *v24;
  int64_t uiStringCachedLineOffset;
  NSAttributedString *v26;
  int v27;
  _BYTE v28[18];
  uint64_t v29;

  v3 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3 && !-[NSMutableArray containsObject:](self->_displayModeStack, "containsObject:", v5))
  {
    -[NSMutableArray lastObject](self->_displayModeStack, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "intValue");
    else
      v12 = 0;

    if ((_DWORD)v3 == 3)
    {
      if (v12)
      {
        if (v12 == 1)
          -[SCROBrailleDisplayManager _eventQueue_popDisplayModeStack](self, "_eventQueue_popDisplayModeStack");
        goto LABEL_31;
      }
    }
    else if ((_DWORD)v3 == 2)
    {
      if (v12)
      {
        while (1)
        {
          -[SCROBrailleDisplayManager _eventQueue_popDisplayModeStack](self, "_eventQueue_popDisplayModeStack");
          -[NSMutableArray lastObject](self->_displayModeStack, "lastObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (!v13)
            break;
          v15 = objc_msgSend(v13, "intValue");

          if (!v15)
            goto LABEL_23;
        }

      }
LABEL_23:
      -[SCROBrailleDisplayHistory moveToMostRecent](self->_history, "moveToMostRecent");
      -[SCROBrailleDisplayHistory snapshotUnread](self->_history, "snapshotUnread");
    }
    else if (v12)
    {
LABEL_31:
      -[NSMutableArray addObject:](self->_displayModeStack, "addObject:", v5);
      goto LABEL_32;
    }
    v16 = -[SCROBrailleFormatter generationID](self->_currentBrailleFormatter, "generationID");
    -[SCROBrailleDisplayManagedQueue primaryDisplay](self->_managedDisplayQueue, "primaryDisplay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "brailleLineGenerationID");
    if (v18 != v16)
    {
      v19 = v18;
      _SCROD_LOG();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v27 = 134218240;
        *(_QWORD *)v28 = v16;
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = v19;
        _os_log_impl(&dword_2115BB000, v20, OS_LOG_TYPE_INFO, "Braille moving too fast, generation mismatch, wait to sync up %lld %lld", (uint8_t *)&v27, 0x16u);
      }

      usleep(0x7A120u);
    }
    self->_uiStringCachedLineOffset = objc_msgSend(v17, "lineOffset");
    objc_msgSend(v17, "editingString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (NSAttributedString *)objc_msgSend(v21, "copy");
    uiEditingCachedString = self->_uiEditingCachedString;
    self->_uiEditingCachedString = v22;

    _SCROD_LOG();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uiStringCachedLineOffset = self->_uiStringCachedLineOffset;
      v26 = self->_uiEditingCachedString;
      v27 = 67109378;
      *(_DWORD *)v28 = uiStringCachedLineOffset;
      *(_WORD *)&v28[4] = 2112;
      *(_QWORD *)&v28[6] = v26;
      _os_log_impl(&dword_2115BB000, v24, OS_LOG_TYPE_INFO, "Caching line offset as we go into another mode: offset: %d, editing: %@", (uint8_t *)&v27, 0x12u);
    }

    goto LABEL_31;
  }
  v6 = -[NSMutableArray count](self->_displayModeStack, "count");
  if (v6)
  {
    v7 = v6;
    do
    {
      -[NSMutableArray lastObject](self->_displayModeStack, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v5, "isEqualToNumber:", v8);

      if ((v9 & 1) != 0)
        break;
      -[SCROBrailleDisplayManager _eventQueue_popDisplayModeStack](self, "_eventQueue_popDisplayModeStack");
      --v7;
    }
    while (v7);
  }
LABEL_32:

}

- (void)_eventQueue_exitCurrentDisplayMode
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int64_t uiStringCachedLineOffset;
  __CFString *v10;
  void *v11;
  NSAttributedString *uiEditingCachedString;
  uint64_t v13;
  _QWORD v14[5];
  int v15;
  uint8_t buf[16];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (-[NSMutableArray count](self->_displayModeStack, "count"))
  {
    -[SCROBrailleDisplayManager _eventQueue_popDisplayModeStack](self, "_eventQueue_popDisplayModeStack");
    -[NSMutableArray lastObject](self->_displayModeStack, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v5 = objc_msgSend(v3, "intValue");
    else
      v5 = 0;

    -[SCROBrailleDisplayManager _eventQueue_cachedMainStringForDisplayMode:](self, "_eventQueue_cachedMainStringForDisplayMode:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (!(_DWORD)v5)
    {
      _SCROD_LOG();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uiStringCachedLineOffset = self->_uiStringCachedLineOffset;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = uiStringCachedLineOffset;
        _os_log_impl(&dword_2115BB000, v8, OS_LOG_TYPE_INFO, "Consuming stored lineOffset: %d", buf, 8u);
      }

      v10 = kSCROBrailleOffsetAttribute[0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_uiStringCachedLineOffset);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAttribute:value:range:", v10, v11, 0, objc_msgSend(v7, "length"));

      if (self->_uiEditingCachedString)
      {
        *(_OWORD *)buf = xmmword_211601A30;
        objc_msgSend(v7, "getRange:ofAttribute:", buf, kSCROCursorAttribute[0]);
        if (*(_QWORD *)buf != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v7, "addAttribute:value:range:", kSCROBrailleEditingStringAttribute[0], self->_uiEditingCachedString, *(_QWORD *)buf, *(_QWORD *)&buf[8]);
        uiEditingCachedString = self->_uiEditingCachedString;
        self->_uiEditingCachedString = 0;

      }
      self->_uiStringCachedLineOffset = 0;
    }
    v13 = objc_msgSend(v7, "length");
    objc_msgSend(v7, "removeAttribute:range:", kSCROLineFocusAttribute[0], 0, v13);
    objc_msgSend(v7, "addAttribute:value:range:", kSCROLineFocusAttribute[0], &unk_24CC30E38, 0, v13);
    -[SCROBrailleDisplayManager setMainAttributedString:forceUpdate:](self, "setMainAttributedString:forceUpdate:", v7, 1);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __63__SCROBrailleDisplayManager__eventQueue_exitCurrentDisplayMode__block_invoke;
    v14[3] = &unk_24CC1D730;
    v14[4] = self;
    v15 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

  }
}

void __63__SCROBrailleDisplayManager__eventQueue_exitCurrentDisplayMode__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "handleDisplayModeChanged:", v2);

}

- (void)_eventQueue_alertTimeoutHandler
{
  OS_dispatch_source *alertTimer;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplayManager _eventQueue_exitCurrentDisplayMode](self, "_eventQueue_exitCurrentDisplayMode");
  alertTimer = self->_alertTimer;
  self->_alertTimer = 0;

}

- (void)_eventQueue_resetAlertTimer
{
  double alertTimeout;
  NSObject *alertTimer;
  OS_dispatch_source *v5;
  dispatch_time_t v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  alertTimeout = self->_alertTimeout;
  alertTimer = self->_alertTimer;
  if (alertTimer
    && (dispatch_source_testcancel((dispatch_source_t)self->_alertTimer) && alertTimeout > 0.0
     || (dispatch_source_cancel(alertTimer),
         v5 = self->_alertTimer,
         self->_alertTimer = 0,
         v5,
         self->_alertTimer)))
  {
    v6 = dispatch_walltime(0, (uint64_t)(self->_alertTimeout * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->_alertTimer, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_alertTimeout * 0.1));
  }
  else if (alertTimeout > 0.0)
  {
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_eventQueue);
    v8 = self->_alertTimer;
    self->_alertTimer = v7;

    if (self->_alertTimer)
    {
      v9 = dispatch_walltime(0, (uint64_t)(self->_alertTimeout * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->_alertTimer, v9, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_alertTimeout * 0.1));
      v10 = self->_alertTimer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __56__SCROBrailleDisplayManager__eventQueue_resetAlertTimer__block_invoke;
      handler[3] = &unk_24CC1D2B0;
      handler[4] = self;
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume((dispatch_object_t)self->_alertTimer);
    }
  }
}

uint64_t __56__SCROBrailleDisplayManager__eventQueue_resetAlertTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_alertTimeoutHandler");
}

- (void)_eventQueue_stopAlertTimer
{
  NSObject *alertTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  alertTimer = self->_alertTimer;
  if (alertTimer)
  {
    dispatch_source_cancel(alertTimer);
    v4 = self->_alertTimer;
    self->_alertTimer = 0;

  }
}

- (void)_eventQueue_fireAlertTimeoutHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (self->_alertTimer)
  {
    -[SCROBrailleDisplayManager _eventQueue_stopAlertTimer](self, "_eventQueue_stopAlertTimer");
    -[SCROBrailleDisplayManager _eventQueue_alertTimeoutHandler](self, "_eventQueue_alertTimeoutHandler");
  }
}

- (void)_eventQueue_popDisplayModeStack
{
  void *v3;
  void *v4;
  int v5;
  NSAttributedString *statusString;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (-[NSMutableArray count](self->_displayModeStack, "count"))
  {
    -[NSMutableArray lastObject](self->_displayModeStack, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v3, "intValue");

      switch(v5)
      {
        case 3:
          statusString = self->_statusString;
          self->_statusString = 0;

          break;
        case 2:
          -[SCROBrailleDisplayHistory markSnapshotAsRead](self->_history, "markSnapshotAsRead");
          break;
        case 1:
          -[SCROBrailleDisplayManager _eventQueue_stopAlertTimer](self, "_eventQueue_stopAlertTimer");
          break;
      }
    }
    -[NSMutableArray removeLastObject](self->_displayModeStack, "removeLastObject");
  }
}

- (id)_eventQueue_cachedMainStringForDisplayMode:(int)a3
{
  NSAttributedString *lineString;
  NSAttributedString *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  switch(a3)
  {
    case 0:
      lineString = self->_lineString;
      if (lineString)
        goto LABEL_4;
      goto LABEL_3;
    case 1:
      goto LABEL_3;
    case 2:
      -[SCROBrailleDisplayHistory currentString](self->_history, "currentString");
      v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      return v6;
    case 3:
      lineString = self->_statusString;
      if (!lineString)
LABEL_3:
        lineString = self->_blankUIString;
LABEL_4:
      v6 = lineString;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (void)configureTableWithIdentifier:(id)a3
{
  id v4;
  NSObject *eventQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SCROBrailleDisplayManager_configureTableWithIdentifier___block_invoke;
  v7[3] = &unk_24CC1D500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(eventQueue, v7);

}

uint64_t __58__SCROBrailleDisplayManager_configureTableWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setTableIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_eventQueue_setTableIdentifier:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSString **p_outputTableIdentifier;
  NSString *outputTableIdentifier;
  void *v10;
  void *v11;
  __CFString *obj;
  __CFString *obja;

  obj = (__CFString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqual:](obj, "isEqual:", CFSTR("com.apple.scrod.braille.table.duxbury.jpn")))
  {

    v5 = CFSTR("com.apple.scrod.braille.table.apple.ja");
  }
  else
  {
    v5 = obj;
  }
  obja = v5;
  -[__CFString brl_serviceIdentifier](v5, "brl_serviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadTranslatorWithServiceIdentifier:input:", v6, 0);

  -[__CFString brl_tableIdentifier](obja, "brl_tableIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultLanguage:", v7);

  outputTableIdentifier = self->_outputTableIdentifier;
  p_outputTableIdentifier = &self->_outputTableIdentifier;
  if (!-[NSString isEqualToString:](outputTableIdentifier, "isEqualToString:", obja))
  {
    objc_storeStrong((id *)p_outputTableIdentifier, obja);
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOutputTableIdentifier:manager:", obja, v11);

  }
}

- (void)configureInputTableWithIdentifier:(id)a3
{
  id v4;
  NSObject *eventQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SCROBrailleDisplayManager_configureInputTableWithIdentifier___block_invoke;
  v7[3] = &unk_24CC1D500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(eventQueue, v7);

}

uint64_t __63__SCROBrailleDisplayManager_configureInputTableWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setInputTableWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_eventQueue_setInputTableWithIdentifier:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSString **p_inputTableIdentifier;
  NSString *inputTableIdentifier;
  void *v10;
  void *v11;
  __CFString *obj;
  __CFString *obja;

  obj = (__CFString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  +[SCROBrailleTranslationManager inputManager](SCROBrailleTranslationManager, "inputManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqual:](obj, "isEqual:", CFSTR("com.apple.scrod.braille.table.duxbury.jpn")))
  {

    v5 = CFSTR("com.apple.scrod.braille.table.apple.ja");
  }
  else
  {
    v5 = obj;
  }
  obja = v5;
  -[__CFString brl_serviceIdentifier](v5, "brl_serviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadTranslatorWithServiceIdentifier:input:", v6, 1);

  -[__CFString brl_tableIdentifier](obja, "brl_tableIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultLanguage:", v7);

  inputTableIdentifier = self->_inputTableIdentifier;
  p_inputTableIdentifier = &self->_inputTableIdentifier;
  if (!-[NSString isEqualToString:](inputTableIdentifier, "isEqualToString:", obja))
  {
    objc_storeStrong((id *)p_inputTableIdentifier, obja);
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCROBrailleTranslationManager inputManager](SCROBrailleTranslationManager, "inputManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInputTableIdentifier:manager:", obja, v11);

  }
}

- (void)setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  BOOL v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__SCROBrailleDisplayManager_setAlwaysUsesNemethCodeForTechnicalText___block_invoke;
  v4[3] = &unk_24CC1D2F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __69__SCROBrailleDisplayManager_setAlwaysUsesNemethCodeForTechnicalText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setAlwaysUsesNemethCodeForTechnicalText:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)alwaysUsesNemethCodeForTechnicalText
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SCROBrailleDisplayManager_alwaysUsesNemethCodeForTechnicalText__block_invoke;
  block[3] = &unk_24CC1D370;
  block[4] = &v6;
  dispatch_sync(eventQueue, block);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __65__SCROBrailleDisplayManager_alwaysUsesNemethCodeForTechnicalText__block_invoke(uint64_t a1)
{
  id v2;

  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "alwaysUsesNemethCodeForTechnicalText");

}

- (void)_eventQueue_setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlwaysUsesNemethCodeForTechnicalText:", v3);

}

- (int)contractionMode
{
  void *v2;
  int v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC60]), "initWithIdentifier:", self->_outputTableIdentifier);
  v3 = objc_msgSend(v2, "supportsTranslationModeContracted") ^ 1;

  return v3;
}

- (BOOL)showEightDotBraille
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC60]), "initWithIdentifier:", self->_outputTableIdentifier);
  v3 = objc_msgSend(v2, "supportsTranslationMode8Dot");

  return v3;
}

- (BOOL)inputEightDotBraille
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC60]), "initWithIdentifier:", self->_inputTableIdentifier);
  v3 = objc_msgSend(v2, "supportsTranslationMode8Dot");

  return v3;
}

- (void)setAutomaticBrailleTranslationEnabled:(BOOL)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  BOOL v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__SCROBrailleDisplayManager_setAutomaticBrailleTranslationEnabled___block_invoke;
  v4[3] = &unk_24CC1D2F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __67__SCROBrailleDisplayManager_setAutomaticBrailleTranslationEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setAutomaticBrailleTranslationEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)automaticBrailleTranslation
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__SCROBrailleDisplayManager_automaticBrailleTranslation__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __56__SCROBrailleDisplayManager_automaticBrailleTranslation__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 105);
  return result;
}

- (void)_eventQueue_setAutomaticBrailleTranslationEnabled:(BOOL)a3
{
  uint64_t v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5 = MEMORY[0x24BDAC760];
  self->_automaticBrailleTranslation = a3;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __79__SCROBrailleDisplayManager__eventQueue_setAutomaticBrailleTranslationEnabled___block_invoke;
  v6[3] = &unk_24CC1D798;
  v6[4] = self;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v6);
}

uint64_t __79__SCROBrailleDisplayManager__eventQueue_setAutomaticBrailleTranslationEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAutomaticBrailleTranslationEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 105));
}

- (void)setWordWrapEnabled:(BOOL)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  BOOL v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__SCROBrailleDisplayManager_setWordWrapEnabled___block_invoke;
  v4[3] = &unk_24CC1D2F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __48__SCROBrailleDisplayManager_setWordWrapEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setWordWrapEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)wordWrapEnabled
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SCROBrailleDisplayManager_wordWrapEnabled__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __44__SCROBrailleDisplayManager_wordWrapEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 106);
  return result;
}

- (void)_eventQueue_setWordWrapEnabled:(BOOL)a3
{
  uint64_t v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5 = MEMORY[0x24BDAC760];
  self->_wordWrapEnabled = a3;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __60__SCROBrailleDisplayManager__eventQueue_setWordWrapEnabled___block_invoke;
  v6[3] = &unk_24CC1D798;
  v6[4] = self;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v6);
}

uint64_t __60__SCROBrailleDisplayManager__eventQueue_setWordWrapEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWordWrapEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 106));
}

- (void)setPanWithTextCursorEnabled:(BOOL)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  BOOL v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__SCROBrailleDisplayManager_setPanWithTextCursorEnabled___block_invoke;
  v4[3] = &unk_24CC1D2F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __57__SCROBrailleDisplayManager_setPanWithTextCursorEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setPanWithTextCursorEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)panWithTextCursorEnabled
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__SCROBrailleDisplayManager_panWithTextCursorEnabled__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __53__SCROBrailleDisplayManager_panWithTextCursorEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 107);
  return result;
}

- (void)_eventQueue_setPanWithTextCursorEnabled:(BOOL)a3
{
  uint64_t v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5 = MEMORY[0x24BDAC760];
  self->_panWithTextCursorEnabled = a3;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __69__SCROBrailleDisplayManager__eventQueue_setPanWithTextCursorEnabled___block_invoke;
  v6[3] = &unk_24CC1D798;
  v6[4] = self;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v6);
}

uint64_t __69__SCROBrailleDisplayManager__eventQueue_setPanWithTextCursorEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPanWithTextCursorEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 107));
}

- (void)setAutoAdvanceEnabled:(BOOL)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  BOOL v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SCROBrailleDisplayManager_setAutoAdvanceEnabled___block_invoke;
  v4[3] = &unk_24CC1D2F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __51__SCROBrailleDisplayManager_setAutoAdvanceEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setAutoAdvanceEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)autoAdvanceEnabled
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__SCROBrailleDisplayManager_autoAdvanceEnabled__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __47__SCROBrailleDisplayManager_autoAdvanceEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 108);
  return result;
}

- (void)_eventQueue_setAutoAdvanceEnabled:(BOOL)a3
{
  uint64_t v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5 = MEMORY[0x24BDAC760];
  self->_autoAdvanceEnabled = a3;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __63__SCROBrailleDisplayManager__eventQueue_setAutoAdvanceEnabled___block_invoke;
  v6[3] = &unk_24CC1D798;
  v6[4] = self;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v6);
}

uint64_t __63__SCROBrailleDisplayManager__eventQueue_setAutoAdvanceEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAutoAdvanceEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 108));
}

- (void)setAutoAdvanceDuration:(double)a3
{
  NSObject *eventQueue;
  _QWORD v4[6];

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__SCROBrailleDisplayManager_setAutoAdvanceDuration___block_invoke;
  v4[3] = &unk_24CC1D6B8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __52__SCROBrailleDisplayManager_setAutoAdvanceDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setAutoAdvanceDuration:", *(double *)(a1 + 40));
}

- (double)autoAdvanceDuration
{
  NSObject *eventQueue;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__SCROBrailleDisplayManager_autoAdvanceDuration__block_invoke;
  v6[3] = &unk_24CC1D488;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __48__SCROBrailleDisplayManager_autoAdvanceDuration__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 112);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_eventQueue_setAutoAdvanceDuration:(double)a3
{
  uint64_t v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5 = MEMORY[0x24BDAC760];
  self->_autoAdvanceDuration = a3;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __64__SCROBrailleDisplayManager__eventQueue_setAutoAdvanceDuration___block_invoke;
  v6[3] = &unk_24CC1D798;
  v6[4] = self;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v6);
}

uint64_t __64__SCROBrailleDisplayManager__eventQueue_setAutoAdvanceDuration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAutoAdvanceDuration:", *(double *)(*(_QWORD *)(a1 + 32) + 112));
}

- (void)setBlinkingCursorEnabled:(BOOL)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  BOOL v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SCROBrailleDisplayManager_setBlinkingCursorEnabled___block_invoke;
  v4[3] = &unk_24CC1D2F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __54__SCROBrailleDisplayManager_setBlinkingCursorEnabled___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = *(_BYTE *)(a1 + 40);
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__SCROBrailleDisplayManager_setBlinkingCursorEnabled___block_invoke_2;
  v3[3] = &unk_24CC1D798;
  v3[4] = v1;
  return objc_msgSend(v1, "_enumerateActiveDisplays:", v3);
}

uint64_t __54__SCROBrailleDisplayManager_setBlinkingCursorEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBlinkingCursorEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 120));
}

- (BOOL)blinkingCursorEnabled
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__SCROBrailleDisplayManager_blinkingCursorEnabled__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__SCROBrailleDisplayManager_blinkingCursorEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

- (void)setTactileGraphicsImageData:(id)a3
{
  id v4;
  NSObject *eventQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__SCROBrailleDisplayManager_setTactileGraphicsImageData___block_invoke;
  v7[3] = &unk_24CC1D500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(eventQueue, v7);

}

uint64_t __57__SCROBrailleDisplayManager_setTactileGraphicsImageData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setTactileGraphicsImageData:", *(_QWORD *)(a1 + 40));
}

- (void)_eventQueue_setTactileGraphicsImageData:(id)a3
{
  NSData *v4;
  NSData *imageData;
  NSData *v6;
  _QWORD v7[5];

  v4 = (NSData *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  imageData = self->_imageData;
  self->_imageData = v4;
  v6 = v4;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__SCROBrailleDisplayManager__eventQueue_setTactileGraphicsImageData___block_invoke;
  v7[3] = &unk_24CC1D798;
  v7[4] = self;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v7);

}

uint64_t __69__SCROBrailleDisplayManager__eventQueue_setTactileGraphicsImageData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImageData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
}

- (void)setPlanarData:(id)a3
{
  id v4;
  NSObject *eventQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__SCROBrailleDisplayManager_setPlanarData___block_invoke;
  v7[3] = &unk_24CC1D500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(eventQueue, v7);

}

uint64_t __43__SCROBrailleDisplayManager_setPlanarData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setPlanarData:", *(_QWORD *)(a1 + 40));
}

- (void)_eventQueue_setPlanarData:(id)a3
{
  SCRO2DBrailleData *v4;
  SCRO2DBrailleData *planarData;
  SCRO2DBrailleData *v6;
  _QWORD v7[5];

  v4 = (SCRO2DBrailleData *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  planarData = self->_planarData;
  self->_planarData = v4;
  v6 = v4;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SCROBrailleDisplayManager__eventQueue_setPlanarData___block_invoke;
  v7[3] = &unk_24CC1D798;
  v7[4] = self;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v7);

}

uint64_t __55__SCROBrailleDisplayManager__eventQueue_setPlanarData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlanarData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
}

- (unint64_t)numberOfTextLinesInPlanarBraille
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__SCROBrailleDisplayManager_numberOfTextLinesInPlanarBraille__block_invoke;
  v4[3] = &unk_24CC1D7C0;
  v4[4] = &v5;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

unint64_t __61__SCROBrailleDisplayManager_numberOfTextLinesInPlanarBraille__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t result;
  unint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "numberOfTextLinesInPlanarBraille");
  if (v3 <= result)
    v5 = result;
  else
    v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (int)inputContractionMode
{
  void *v2;
  int v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC60]), "initWithIdentifier:", self->_inputTableIdentifier);
  v3 = objc_msgSend(v2, "supportsTranslationModeContracted") ^ 1;

  return v3;
}

- (void)setLastUserInteractionTime:(double)a3
{
  NSObject *eventQueue;
  _QWORD v4[6];

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SCROBrailleDisplayManager_setLastUserInteractionTime___block_invoke;
  v4[3] = &unk_24CC1D6B8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(eventQueue, v4);
}

double __56__SCROBrailleDisplayManager_setLastUserInteractionTime___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 264) = result;
  return result;
}

- (void)setPersistentKeyModifiers:(unsigned int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  unsigned int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SCROBrailleDisplayManager_setPersistentKeyModifiers___block_invoke;
  v4[3] = &unk_24CC1D730;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __55__SCROBrailleDisplayManager_setPersistentKeyModifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setPersistentKeyModifiers:", *(unsigned int *)(a1 + 40));
}

- (unsigned)persistentKeyModifiers
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SCROBrailleDisplayManager_persistentKeyModifiers__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __51__SCROBrailleDisplayManager_persistentKeyModifiers__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 124);
  return result;
}

- (void)_eventQueue_setPersistentKeyModifiers:(unsigned int)a3
{
  uint64_t v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5 = MEMORY[0x24BDAC760];
  self->_persistentKeyModifiers = a3;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __67__SCROBrailleDisplayManager__eventQueue_setPersistentKeyModifiers___block_invoke;
  v6[3] = &unk_24CC1D798;
  v6[4] = self;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v6);
}

uint64_t __67__SCROBrailleDisplayManager__eventQueue_setPersistentKeyModifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistentKeyModifiers:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 124));
}

- (void)setShowDotsSevenAndEight:(BOOL)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  BOOL v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SCROBrailleDisplayManager_setShowDotsSevenAndEight___block_invoke;
  v4[3] = &unk_24CC1D2F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __54__SCROBrailleDisplayManager_setShowDotsSevenAndEight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_showDotsSevenAndEight:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)showDotsSevenAndEight
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__SCROBrailleDisplayManager_showDotsSevenAndEight__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__SCROBrailleDisplayManager_showDotsSevenAndEight__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (void)_eventQueue_showDotsSevenAndEight:(BOOL)a3
{
  _BOOL4 v3;
  NSAttributedString *mainString;
  NSAttributedString *v6;
  NSAttributedString *v7;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (self->_showDotsSevenAndEight != v3)
  {
    self->_showDotsSevenAndEight = v3;
    mainString = self->_mainString;
    if (mainString)
    {
      v6 = mainString;
    }
    else
    {
      v6 = self->_blankUIString;
      if (!v6)
        return;
    }
    v7 = v6;
    -[SCROBrailleDisplayManager setMainAttributedString:forceUpdate:](self, "setMainAttributedString:forceUpdate:", v6, 1);

  }
}

- (BOOL)isCandidateSelectionOn
{
  void *v2;
  char v3;

  if (SCROCustomBrailleEnabled())
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
  else
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCandidateSelectionActive");

  return v3;
}

- (void)cancelCandidateSelection
{
  id v3;

  if (SCROCustomBrailleEnabled()
    && -[SCROBrailleDisplayManager isCandidateSelectionOn](self, "isCandidateSelectionOn"))
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleEscape");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "escapeCommand");
  }

}

- (void)showPreviousCandidate
{
  void *v3;
  id v4;

  if (SCROCustomBrailleEnabled()
    && -[SCROBrailleDisplayManager isCandidateSelectionOn](self, "isCandidateSelectionOn"))
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "showPreviousCandidate");

}

- (void)showNextCandidate
{
  void *v3;
  id v4;

  if (SCROCustomBrailleEnabled()
    && -[SCROBrailleDisplayManager isCandidateSelectionOn](self, "isCandidateSelectionOn"))
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "showNextCandidate");

}

- (BOOL)isWordDescriptionOn
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWordDescriptionActive");

  return v3;
}

- (void)showPreviousWordDescription
{
  id v2;

  objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showPreviousWordDescription");

}

- (void)showNextWordDescription
{
  id v2;

  objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showNextWordDescription");

}

- (void)showPreviousAnnouncement
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SCROBrailleDisplayManager_showPreviousAnnouncement__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __53__SCROBrailleDisplayManager_showPreviousAnnouncement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_showNextAnnouncement:", 0);
}

- (void)showNextAnnouncement
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SCROBrailleDisplayManager_showNextAnnouncement__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __49__SCROBrailleDisplayManager_showNextAnnouncement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_showNextAnnouncement:", 1);
}

- (void)_eventQueue_showNextAnnouncement:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  SCROBrailleDisplayHistory *history;
  char v9;
  char *v10;
  id WeakRetained;
  char **v12;
  id v13;
  _QWORD block[4];
  id v15;
  char *v16;
  char v17;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[NSMutableArray lastObject](self->_displayModeStack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v10 = 0;
    WeakRetained = 0;
    v9 = 0;
    goto LABEL_15;
  }
  v7 = objc_msgSend(v5, "intValue");

  if (v7 != 2)
  {
    v10 = 0;
    WeakRetained = 0;
    v9 = 0;
    v6 = 0;
    goto LABEL_15;
  }
  history = self->_history;
  if (v3)
  {
    if (!-[SCROBrailleDisplayHistory moveToNext](history, "moveToNext"))
    {
      v6 = 0;
      v9 = 0;
LABEL_10:
      v12 = &selRef_handleBrailleDidShowNextAnnouncement_;
      goto LABEL_13;
    }
  }
  else if (!-[SCROBrailleDisplayHistory moveToPrevious](history, "moveToPrevious"))
  {
    v6 = 0;
    v9 = 0;
    goto LABEL_12;
  }
  -[SCROBrailleDisplayHistory currentString](self->_history, "currentString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1;
  if (v3)
    goto LABEL_10;
LABEL_12:
  v12 = &selRef_handleBrailleDidShowPreviousAnnouncement_;
LABEL_13:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = *v12;
  if (v6)
    -[SCROBrailleDisplayManager setMainAttributedString:forceUpdate:](self, "setMainAttributedString:forceUpdate:", v6, 1);
LABEL_15:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SCROBrailleDisplayManager__eventQueue_showNextAnnouncement___block_invoke;
  block[3] = &unk_24CC1D7E8;
  v15 = WeakRetained;
  v16 = v10;
  v17 = v9;
  v13 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __62__SCROBrailleDisplayManager__eventQueue_showNextAnnouncement___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performSelector:withObject:", v2, v3);

}

- (void)setLineDescriptorDisplayCallbackEnabled:(BOOL)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  BOOL v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__SCROBrailleDisplayManager_setLineDescriptorDisplayCallbackEnabled___block_invoke;
  v4[3] = &unk_24CC1D2F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __69__SCROBrailleDisplayManager_setLineDescriptorDisplayCallbackEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setLineDescriptorCallbackEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)lineDescriptorDisplayCallbackEnabled
{
  SCROBrailleDisplayManager *v2;
  NSObject *eventQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__SCROBrailleDisplayManager_lineDescriptorDisplayCallbackEnabled__block_invoke;
  v5[3] = &unk_24CC1D488;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __65__SCROBrailleDisplayManager_lineDescriptorDisplayCallbackEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 81);
  return result;
}

- (void)_eventQueue_setLineDescriptorCallbackEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  self->_lineDescriptorDisplayCallbackEnabled = v3;
  -[SCROBrailleDisplayManagedQueue primaryDisplay](self->_managedDisplayQueue, "primaryDisplay");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegateWantsDisplayCallback:", v3);

}

- (int64_t)tokenForRouterIndex:(int64_t)a3 location:(int64_t *)a4 appToken:(id *)a5 forDisplayWithToken:(int)a6
{
  NSObject *eventQueue;
  int64_t v12;
  _QWORD block[6];
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__SCROBrailleDisplayManager_tokenForRouterIndex_location_appToken_forDisplayWithToken___block_invoke;
  block[3] = &unk_24CC1D810;
  block[4] = self;
  block[5] = &v16;
  v15 = a6;
  dispatch_sync(eventQueue, block);
  v12 = objc_msgSend((id)v17[5], "tokenForRouterIndex:location:appToken:", a3, a4, a5);
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __87__SCROBrailleDisplayManager_tokenForRouterIndex_location_appToken_forDisplayWithToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_eventQueue_activeDisplayForToken:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (_NSRange)rangeOfBrailleCellRepresentingCharacterAtIndex:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[SCROBrailleFormatter rangeOfBrailleCellRepresentingCharacterAtIndex:](self->_currentBrailleFormatter, "rangeOfBrailleCellRepresentingCharacterAtIndex:", a3);
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)clearTimeoutAlert
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SCROBrailleDisplayManager_clearTimeoutAlert__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __46__SCROBrailleDisplayManager_clearTimeoutAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_fireAlertTimeoutHandler");
}

- (void)simulateKeypress:(id)a3
{
  id v4;
  NSObject *eventQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SCROBrailleDisplayManager_simulateKeypress___block_invoke;
  v7[3] = &unk_24CC1D500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(eventQueue, v7);

}

uint64_t __46__SCROBrailleDisplayManager_simulateKeypress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_simulateKeypress:", *(_QWORD *)(a1 + 40));
}

- (void)_eventQueue_simulateKeypress:(id)a3
{
  NSObject *eventQueue;
  id v5;
  id v6;

  eventQueue = self->_eventQueue;
  v5 = a3;
  dispatch_assert_queue_V2(eventQueue);
  -[SCROBrailleDisplayManager _eventQueue_activeDisplayForToken:](self, "_eventQueue_activeDisplayForToken:", objc_msgSend(v5, "displayToken"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "simulateKeypress:", v5);

}

- (void)setPrepareToMemorizeNextKey:(BOOL)a3 immediate:(BOOL)a4 forDisplayWithToken:(int)a5
{
  NSObject *eventQueue;
  _QWORD v6[5];
  int v7;
  BOOL v8;
  BOOL v9;

  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87__SCROBrailleDisplayManager_setPrepareToMemorizeNextKey_immediate_forDisplayWithToken___block_invoke;
  v6[3] = &unk_24CC1D838;
  v6[4] = self;
  v8 = a3;
  v9 = a4;
  v7 = a5;
  dispatch_async(eventQueue, v6);
}

uint64_t __87__SCROBrailleDisplayManager_setPrepareToMemorizeNextKey_immediate_forDisplayWithToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_prepareToMemorizeNextKey:immediately:forDisplayWithToken:", *(unsigned __int8 *)(a1 + 44), *(unsigned __int8 *)(a1 + 45), *(unsigned int *)(a1 + 40));
}

- (void)_eventQueue_prepareToMemorizeNextKey:(BOOL)a3 immediately:(BOOL)a4 forDisplayWithToken:(int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  _BOOL8 v7;
  int inputAccessMode;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  id v15;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  inputAccessMode = self->_inputAccessMode;
  if (!v7 || inputAccessMode)
  {
    if (inputAccessMode == 1)
    {
      -[SCROBrailleDisplayManagedQueue displayForToken:](self->_managedDisplayQueue, "displayForToken:", v5);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v13 = -[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:", v14) == 1;
      v12 = v14;
      if (v13)
        goto LABEL_9;

    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    goto LABEL_8;
  -[SCROBrailleDisplayManagedQueue primaryDisplay](self->_managedDisplayQueue, "primaryDisplay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v15 = v12;
  objc_msgSend(v12, "setPrepareToMemorizeNextKey:immediate:", v7, v6);

}

- (void)beginUpdates
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SCROBrailleDisplayManager_beginUpdates__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __41__SCROBrailleDisplayManager_beginUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setBatchUpdates:", 1);
}

- (void)endUpdates
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SCROBrailleDisplayManager_endUpdates__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __39__SCROBrailleDisplayManager_endUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setBatchUpdates:", 0);
}

- (void)_eventQueue_setBatchUpdates:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char **v6;
  id v7;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (self->_shouldBatchUpdates != v3)
  {
    self->_shouldBatchUpdates = v3;
    -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "copy");

    v6 = &selRef_beginUpdates;
    if (!v3)
      v6 = &selRef_endUpdates;
    objc_msgSend(v7, "makeObjectsPerformSelector:", *v6);

  }
}

- (void)setSingleLetterInputIsOn:(BOOL)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  BOOL v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SCROBrailleDisplayManager_setSingleLetterInputIsOn___block_invoke;
  v4[3] = &unk_24CC1D2F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __54__SCROBrailleDisplayManager_setSingleLetterInputIsOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setSingleLetterInputIsOn:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_eventQueue_setSingleLetterInputIsOn:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__SCROBrailleDisplayManager__eventQueue_setSingleLetterInputIsOn___block_invoke;
  v5[3] = &__block_descriptor_33_e28_v16__0__SCROBrailleDisplay_8l;
  v6 = a3;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v5);
}

uint64_t __66__SCROBrailleDisplayManager__eventQueue_setSingleLetterInputIsOn___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSingleLetterInputIsOn:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setTextSearchModeIsOn:(BOOL)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  BOOL v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SCROBrailleDisplayManager_setTextSearchModeIsOn___block_invoke;
  v4[3] = &unk_24CC1D2F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __51__SCROBrailleDisplayManager_setTextSearchModeIsOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setTextSearchModeIsOn:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_eventQueue_setTextSearchModeIsOn:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__SCROBrailleDisplayManager__eventQueue_setTextSearchModeIsOn___block_invoke;
  v5[3] = &__block_descriptor_33_e28_v16__0__SCROBrailleDisplay_8l;
  v6 = a3;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v5);
}

uint64_t __63__SCROBrailleDisplayManager__eventQueue_setTextSearchModeIsOn___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTextSearchModeOn:", *(unsigned __int8 *)(a1 + 32));
}

- (void)translateBrailleToClipboard
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SCROBrailleDisplayManager_translateBrailleToClipboard__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __56__SCROBrailleDisplayManager_translateBrailleToClipboard__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_translateBrailleToClipboard");
}

- (void)_eventQueue_translateBrailleToClipboard
{
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", &__block_literal_global_0);
}

uint64_t __68__SCROBrailleDisplayManager__eventQueue_translateBrailleToClipboard__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "translateBrailleToClipboard");
}

- (void)setBrailleKeyDebounceTimeout:(double)a3
{
  NSObject *eventQueue;
  _QWORD v4[6];

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__SCROBrailleDisplayManager_setBrailleKeyDebounceTimeout___block_invoke;
  v4[3] = &unk_24CC1D6B8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __58__SCROBrailleDisplayManager_setBrailleKeyDebounceTimeout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setBrailleKeyDebounceTimeout:", *(double *)(a1 + 40));
}

- (void)_eventQueue_setBrailleKeyDebounceTimeout:(double)a3
{
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__SCROBrailleDisplayManager__eventQueue_setBrailleKeyDebounceTimeout___block_invoke;
  v5[3] = &__block_descriptor_40_e28_v16__0__SCROBrailleDisplay_8l;
  *(double *)&v5[4] = a3;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v5);
}

uint64_t __70__SCROBrailleDisplayManager__eventQueue_setBrailleKeyDebounceTimeout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBrailleKeyDebounceTimeout:", *(double *)(a1 + 32));
}

- (void)didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  NSObject *eventQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  NSUInteger v12;
  NSUInteger v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  eventQueue = self->_eventQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__SCROBrailleDisplayManager_didChangeBrailleString_brailleSelection___block_invoke;
  v10[3] = &unk_24CC1D8A0;
  v10[4] = self;
  v11 = v7;
  v12 = location;
  v13 = length;
  v9 = v7;
  dispatch_async(eventQueue, v10);

}

uint64_t __69__SCROBrailleDisplayManager_didChangeBrailleString_brailleSelection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_didChangeBrailleString:brailleSelection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_eventQueue_didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  NSUInteger v11;
  NSUInteger v12;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__SCROBrailleDisplayManager__eventQueue_didChangeBrailleString_brailleSelection___block_invoke;
  v9[3] = &unk_24CC1D8C8;
  v10 = v7;
  v11 = location;
  v12 = length;
  v8 = v7;
  -[SCROBrailleDisplayManager _enumerateActiveDisplays:](self, "_enumerateActiveDisplays:", v9);

}

uint64_t __81__SCROBrailleDisplayManager__eventQueue_didChangeBrailleString_brailleSelection___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "didChangeBrailleString:brailleSelection:", a1[4], a1[5], a1[6]);
}

- (void)didReplaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  NSUInteger v13;
  NSUInteger v14;
  int64_t v15;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__SCROBrailleDisplayManager_didReplaceScriptStringRange_withScriptString_cursorLocation___block_invoke;
  block[3] = &unk_24CC1D5C8;
  v13 = location;
  v14 = length;
  block[4] = self;
  v12 = v9;
  v15 = a5;
  v10 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __89__SCROBrailleDisplayManager_didReplaceScriptStringRange_withScriptString_cursorLocation___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 72));
  objc_msgSend(WeakRetained, "handleBrailleReplaceTextRange:withString:cursor:", a1[6], a1[7], a1[5], a1[8]);

}

- (void)didInsertScriptString:(id)a3
{
  id v4;
  void *v5;
  SCROBrailleKeyboardKey *v6;
  SCROBrailleKeyboardKey *v7;
  _QWORD v8[5];
  SCROBrailleKeyboardKey *v9;

  v4 = a3;
  -[SCROBrailleDisplayManagedQueue primaryDisplay](self->_managedDisplayQueue, "primaryDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (SCROBrailleKeyboardKey *)objc_msgSend(v5, "newBrailleKeyboardKeyForText:modifiers:", v4, *MEMORY[0x24BE0FC98]);

  if (!v6)
  {
    v6 = objc_alloc_init(SCROBrailleKeyboardKey);
    -[SCROBrailleKeyboardKey setKeyString:](v6, "setKeyString:", v4);
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__SCROBrailleDisplayManager_didInsertScriptString___block_invoke;
  v8[3] = &unk_24CC1D500;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __51__SCROBrailleDisplayManager_didInsertScriptString___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "handleBrailleKeypress:", v3);

}

- (void)didDeleteBrailleChar:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;
  char v10;

  v10 = 0;
  objc_msgSend(a3, "unicode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleTranslationUtility spokenStringForDeletedBrailleString:speakLiterally:](SCROBrailleTranslationUtility, "spokenStringForDeletedBrailleString:speakLiterally:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SCROBrailleDisplayManager_didDeleteBrailleChar___block_invoke;
  block[3] = &unk_24CC1D550;
  block[4] = self;
  v8 = v5;
  v9 = v10;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __50__SCROBrailleDisplayManager_didDeleteBrailleChar___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(WeakRetained, "handleBrailleDeletedUntranslatedText:speakLiterally:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (void)requestSpeech:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SCROBrailleDisplayManager_requestSpeech_language___block_invoke;
  block[3] = &unk_24CC1D448;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __52__SCROBrailleDisplayManager_requestSpeech_language___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 72));
  objc_msgSend(WeakRetained, "handleBrailleSpeechRequest:language:", a1[5], a1[6]);

}

- (void)_enumerateActiveDisplays:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[SCROBrailleDisplayManagedQueue activeDisplays](self->_managedDisplayQueue, "activeDisplays");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (id)_eventQueue_activeDisplayForToken:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  -[SCROBrailleDisplayManagedQueue displayForToken:](self->_managedDisplayQueue, "displayForToken:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:", v5) != 1)
  {

    v5 = 0;
  }
  return v5;
}

- (void)resetEditingManager
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SCROBrailleDisplayManager_resetEditingManager__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __48__SCROBrailleDisplayManager_resetEditingManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_resetEditingManager");
}

- (void)_eventQueue_resetEditingManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  +[SCROBrailleFormatter resetEditingManager](SCROBrailleFormatter, "resetEditingManager");
}

- (double)lastUserInteractionTime
{
  return self->_lastUserInteractionTime;
}

- (SCROBrailleDisplayManagedQueue)managedDisplayQueue
{
  return self->_managedDisplayQueue;
}

- (id)eventHandled
{
  return self->_eventHandled;
}

- (void)setEventHandled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandled, 0);
  objc_storeStrong((id *)&self->_tactileGraphicsDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_virtualDisplays, 0);
  objc_storeStrong((id *)&self->_blankUIString, 0);
  objc_storeStrong((id *)&self->_alertTimer, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_lineString, 0);
  objc_storeStrong((id *)&self->_mainString, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_displayModeStack, 0);
  objc_storeStrong((id *)&self->_planarData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_uiEditingCachedString, 0);
  objc_storeStrong((id *)&self->_inputTableIdentifier, 0);
  objc_storeStrong((id *)&self->_outputTableIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadedIOElements, 0);
  objc_storeStrong((id *)&self->_currentBrailleFormatter, 0);
  objc_storeStrong((id *)&self->_detectedIOElementsDict, 0);
  objc_storeStrong((id *)&self->_stealthBrailleDisplay, 0);
  objc_storeStrong((id *)&self->_bluetoothBrailleDisplay, 0);
  objc_storeStrong((id *)&self->_managedDisplayQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end

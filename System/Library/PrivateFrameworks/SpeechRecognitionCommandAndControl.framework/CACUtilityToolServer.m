@implementation CACUtilityToolServer

+ (id)sharedInstance
{
  if (sharedInstance_singletonInit != -1)
    dispatch_once(&sharedInstance_singletonInit, &__block_literal_global_28);
  return (id)sCACUtilityToolServer;
}

void __38__CACUtilityToolServer_sharedInstance__block_invoke()
{
  CACUtilityToolServer *v0;
  void *v1;

  v0 = objc_alloc_init(CACUtilityToolServer);
  v1 = (void *)sCACUtilityToolServer;
  sCACUtilityToolServer = (uint64_t)v0;

}

- (CACUtilityToolServer)init
{
  id v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  void *v6;
  xpc_connection_t mach_service;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CACUtilityToolServer;
  v2 = -[CACUtilityToolServer init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__getNumbersForElements, CFSTR("SOLabeledElementsOverlayDidUpdateElementsNotification"), 0);

    v4 = dispatch_queue_create("com.apple.speech.ToolServerQueue", 0);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    v6 = (void *)objc_opt_new();
    objc_msgSend(v2, "setXpcClients:", v6);

    mach_service = xpc_connection_create_mach_service("com.apple.speech.CommandAndControl.utility", *((dispatch_queue_t *)v2 + 1), 1uLL);
    v8 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = mach_service;

    xpc_connection_set_event_handler(*((xpc_connection_t *)v2 + 2), &__block_literal_global_9);
    xpc_connection_resume(*((xpc_connection_t *)v2 + 2));
  }
  return (CACUtilityToolServer *)v2;
}

void __28__CACUtilityToolServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD handler[4];
  id v7;

  v2 = a2;
  if (MEMORY[0x22E2D6004]() == MEMORY[0x24BDACF88])
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __utility_tool_event_handler_block_invoke;
    handler[3] = &unk_24F2AC6E0;
    v3 = v2;
    v7 = v3;
    xpc_connection_set_event_handler((xpc_connection_t)v3, handler);
    dispatch_get_global_queue(21, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue((xpc_connection_t)v3, v4);

    xpc_connection_resume((xpc_connection_t)v3);
    +[CACUtilityToolServer sharedInstance](CACUtilityToolServer, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addClient:", v3);

  }
}

- (void)startObserving
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CACUtilityToolServer_startObserving__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __38__CACUtilityToolServer_startObserving__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CACUtilityToolServer_startObserving__block_invoke_2;
  block[3] = &unk_24F2AA860;
  block[4] = *(_QWORD *)(a1 + 32);
  if (startObserving_onceToken != -1)
    dispatch_once(&startObserving_onceToken, block);
}

void __38__CACUtilityToolServer_startObserving__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("_statusIndicatorType"), 3, 0);

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("statusIndicatorType"), 3, 0);

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("_recognizerInteractionLevels"), 3, 0);

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("transientOverlayType"), 3, 0);

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("dictationRecognizerMode"), 3, 0);

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("previousTextInsertionSpecifier"), 3, 0);

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("recognizedCommandIdentifier"), 3, 0);

  +[CACUtilityToolServer sharedInstance](CACUtilityToolServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("phoneticAlternative"), 3, 0);

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("gridDidDrill"), 3, 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = *MEMORY[0x24BDD0E80];
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v11 && (objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
  {
    if ((objc_msgSend(v12, "isEqual:", CFSTR("waitingForWakeUpCommand")) & 1) != 0
      || (objc_msgSend(v12, "isEqual:", CFSTR("_recognizerInteractionLevels")) & 1) != 0
      || objc_msgSend(v12, "isEqual:", CFSTR("statusIndicatorType")))
    {
      -[CACUtilityToolServer notifyListeningStatusChanged](self, "notifyListeningStatusChanged");
    }
    else if (objc_msgSend(v12, "isEqual:", CFSTR("transientOverlayType")))
    {
      -[CACUtilityToolServer notifyOverlayStatusChanged](self, "notifyOverlayStatusChanged");
    }
    else if (objc_msgSend(v12, "isEqual:", CFSTR("dictationRecognizerMode")))
    {
      -[CACUtilityToolServer notifyDictationModeChanged](self, "notifyDictationModeChanged");
    }
    else if (objc_msgSend(v12, "isEqual:", CFSTR("previousTextInsertionSpecifier")))
    {
      -[CACUtilityToolServer notifyDidDictateText](self, "notifyDidDictateText");
    }
    else if (objc_msgSend(v12, "isEqual:", CFSTR("recognizedCommandIdentifier")))
    {
      -[CACUtilityToolServer notifyRecognizedCommandIdentifier](self, "notifyRecognizedCommandIdentifier");
    }
    else if (objc_msgSend(v12, "isEqual:", CFSTR("phoneticAlternative")))
    {
      -[CACUtilityToolServer notifyCorrectionForString](self, "notifyCorrectionForString");
    }
    else if (objc_msgSend(v12, "isEqual:", CFSTR("gridDidDrill")))
    {
      -[CACUtilityToolServer notifyDrilled](self, "notifyDrilled");
    }
  }

}

- (void)notifyNumbersForOnboardingElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[CACUtilityToolServer numbersForOnboardingElements](self, "numbersForOnboardingElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v10 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v4, "valueForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ : %@"), v9, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = CFSTR("NumbersForOnboardingElements");
          v20 = v12;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CACUtilityToolServer notifyClients:](self, "notifyClients:", v13);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v6);
    }

  }
}

- (id)gridNumberToHitRect:(CGRect)a3 displayID:(unsigned int)a4
{
  void *v4;
  double height;
  uint64_t v6;
  double width;
  double y;
  double x;
  void *v10;
  int v11;
  void *v12;

  v4 = &unk_24F2CF648;
  if (a3.size.width > 0.0)
  {
    height = a3.size.height;
    if (a3.size.height > 0.0)
    {
      v6 = *(_QWORD *)&a4;
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isActiveOverlayType:", CFSTR("NumberedGrid"));

      if (v11)
      {
        +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "gridNumberForRect:displayID:", v6, x, y, width, height);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = &unk_24F2CF670;
      }
    }
  }
  return v4;
}

- (id)numbersForOnboardingElements
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labeledElementsForItemNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "axIdentifier", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "rangeOfString:", CFSTR("AX_ONBOARDING")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v10, "numberedLabel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", v13, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v2, "count"))
    v14 = v2;
  else
    v14 = 0;

  return v14;
}

- (id)overlayStatus
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeOverlayType");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("none");
  v5 = v3;

  return v5;
}

- (id)drillStatus
{
  void *v2;
  __CFString *v3;
  __CFString *v4;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "gridDidDrill"))
    v3 = CFSTR("1");
  else
    v3 = CFSTR("0");
  v4 = v3;

  return v4;
}

- (void)notifyDictationModeChanged
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[CACUtilityToolServer dictationStatus](self, "dictationStatus");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = CFSTR("DictationStatusString");
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACUtilityToolServer notifyClients:](self, "notifyClients:", v5);

  }
}

- (id)dictationStatus
{
  void *v2;
  unsigned int v3;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dictationRecognizerMode");

  if (v3 > 3)
    return CFSTR("Default");
  else
    return off_24F2AC700[v3];
}

- (void)notifyDidDictateText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousTextInsertionSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "insertedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v7 = CFSTR("DidDictateText");
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACUtilityToolServer notifyClients:](self, "notifyClients:", v6);

  }
}

- (void)notifyOverlayStatusChanged
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("OverlayStatusString");
  -[CACUtilityToolServer overlayStatus](self, "overlayStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACUtilityToolServer notifyClients:](self, "notifyClients:", v4);

}

- (void)notifyDrilled
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("DrilledAtNumber");
  -[CACUtilityToolServer drillStatus](self, "drillStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACUtilityToolServer notifyClients:](self, "notifyClients:", v4);

}

- (id)listeningStatus
{
  void *v2;
  int v3;
  void *v4;
  int v5;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isListening");

  if (!v3)
    return CFSTR("Off");
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentInteractionLevel");

  if ((v5 - 1) >= 2)
    return CFSTR("Listening");
  else
    return CFSTR("Sleeping");
}

- (void)notifyListeningStatusChanged
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[CACUtilityToolServer listeningStatus](self, "listeningStatus");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = CFSTR("ListeningStatusString");
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACUtilityToolServer notifyClients:](self, "notifyClients:", v5);

  }
}

- (void)notifyRecognizedCommandIdentifier
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[CACUtilityToolServer recognizedCommandIdentifier](self, "recognizedCommandIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = CFSTR("RecognizedCommandIdentifierString");
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACUtilityToolServer notifyClients:](self, "notifyClients:", v5);

  }
}

- (id)recognizedCommandIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recognizedCommandIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (v12 = 0u,
        v13 = 0u,
        v10 = 0u,
        v11 = 0u,
        (v4 = objc_msgSend(&unk_24F2CF5A8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16)) != 0))
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = CFSTR("OtherIdentifier");
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&unk_24F2CF5A8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isEqualToString:", v3))
        {
          v7 = v3;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(&unk_24F2CF5A8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = CFSTR("OtherIdentifier");
  }
LABEL_13:

  return v7;
}

- (void)notifyCorrectionForString
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[CACUtilityToolServer phoneticAlternative](self, "phoneticAlternative");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = CFSTR("PhoneticAlternative");
    -[CACUtilityToolServer phoneticAlternative](self, "phoneticAlternative");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACUtilityToolServer notifyClients:](self, "notifyClients:", v5);

  }
}

- (void)notifyClients:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)CACCreateSerializedObject((uint64_t)a3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CACUtilityToolServer xpcClients](self, "xpcClients", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        xpc_connection_send_message(*(xpc_connection_t *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addClient:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CACUtilityToolServer *v7;

  v4 = a3;
  if (v4)
  {
    -[CACUtilityToolServer startObserving](self, "startObserving");
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __34__CACUtilityToolServer_addClient___block_invoke;
    v5[3] = &unk_24F2AAD70;
    v6 = v4;
    v7 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

void __34__CACUtilityToolServer_addClient___block_invoke(uint64_t a1)
{
  id v2;

  if (utility_tool_connection_entitled())
  {
    objc_msgSend(*(id *)(a1 + 40), "xpcClients");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

  }
}

- (void)removeClient:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__CACUtilityToolServer_removeClient___block_invoke;
    v6[3] = &unk_24F2AAD70;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

void __37__CACUtilityToolServer_removeClient___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "xpcClients");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (NSMutableSet)xpcClients
{
  return self->_xpcClients;
}

- (void)setXpcClients:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClients, a3);
}

- (NSString)phoneticAlternative
{
  return self->_phoneticAlternative;
}

- (void)setPhoneticAlternative:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticAlternative, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticAlternative, 0);
  objc_storeStrong((id *)&self->_xpcClients, 0);
  objc_storeStrong((id *)&self->_feedbackListener, 0);
  objc_storeStrong((id *)&self->_toolServerDispatchQueue, 0);
}

@end

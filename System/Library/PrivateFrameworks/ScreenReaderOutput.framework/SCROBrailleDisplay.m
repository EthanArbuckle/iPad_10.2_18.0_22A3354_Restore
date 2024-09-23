@implementation SCROBrailleDisplay

+ (BOOL)brailleDriverClassIsValid:(Class)a3
{
  return -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_254AC2E58)
      && -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_interfaceVersion)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_loadDriverWithIOElement_)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_unloadDriver)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_isDriverLoaded)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_isSleeping)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_modelIdentifier)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_supportsBlinkingCursor)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_isInputEnabled)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:",
                         sel_postsKeyboardEvents)
      && -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_brailleInputMode)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_getInputEvents)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_mainSize)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_statusSize)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_setMainCells_length_)&& (-[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_setStatusCells_length_) & 1) != 0;
}

+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = 0;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "brailleDriverBundleWithIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = (objc_class *)objc_msgSend(v11, "principalClass");
      if (+[SCROBrailleDisplay brailleDriverClassIsValid:](SCROBrailleDisplay, "brailleDriverClassIsValid:", v13))
      {
        v14 = objc_alloc_init(v13);
        v15 = v14;
        if (v14)
        {
          if (objc_msgSend(v14, "interfaceVersion") == 4)
          {
            v16 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDriver:driverIdentifier:ioElement:delegate:", v15, v8, v7, v9);
            v10 = v16;
            if (v16)
              objc_msgSend(v16, "_delayedDisplayLoad");
            goto LABEL_15;
          }
          NSLog(CFSTR("Error: invalid principal class encountered while configuring braille driver: %@"), v8);
        }
        else
        {
          NSLog(CFSTR("Error: unable to instantiate braille driver: %@"), v8);
        }
        v10 = 0;
LABEL_15:

        goto LABEL_16;
      }
      NSLog(CFSTR("Error: invalid principal class encountered while configuring braille driver: %@"), v8);
    }
    else
    {
      NSLog(CFSTR("Error: could not find bundle while configuring braille driver: %@"), v8);
    }
    v10 = 0;
LABEL_16:

  }
  return v10;
}

- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 ioElement:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SCROBrailleDisplay *v15;
  SCROBrailleDisplay *v16;
  SCROBrailleDisplay *v17;
  uint64_t v18;
  SCROBrailleDisplayInput *input;
  const CFSetCallBacks *v20;
  SCROBrailleDisplayStatus *v21;
  SCROBrailleDisplayStatus *status;
  NSString *inputTableIdentifier;
  NSString *outputTableIdentifier;
  NSLock *v25;
  NSLock *contentLock;
  CFAbsoluteTime Current;
  id v28;
  uint64_t v29;
  SCROBrailleDisplayCommandDispatcherProtocol *commandDispatcher;
  SCROBrailleEventDispatcher *v31;
  SCROBrailleEventDispatcher *eventDispatcher;
  void *v33;
  void *v34;
  void *v35;
  CFRunLoopTimerContext v37;
  objc_super v38;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v38.receiver = self;
  v38.super_class = (Class)SCROBrailleDisplay;
  v15 = -[SCROBrailleDisplay init](&v38, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_5;
  v17 = 0;
  if (v11 && v12)
  {
    v15->_isValid = 1;
    +[SCROBrailleDisplayInput sharedInstance](SCROBrailleDisplayInput, "sharedInstance");
    v18 = objc_claimAutoreleasedReturnValue();
    input = v16->_input;
    v16->_input = (SCROBrailleDisplayInput *)v18;

    -[SCROBrailleDisplayInput setQuietSince:](v16->_input, "setQuietSince:", -3061152000.0);
    -[SCROBrailleDisplayInput setBusySince:](v16->_input, "setBusySince:", -3061152000.0);
    -[SCROBrailleDisplayInput setNextWillMemorizeNotificationTime:](v16->_input, "setNextWillMemorizeNotificationTime:", -3061152000.0);
    -[SCROBrailleDisplayInput setMemorizeNextKeyImmediatelyTimeout:](v16->_input, "setMemorizeNextKeyImmediatelyTimeout:", -3061152000.0);
    v20 = (const CFSetCallBacks *)MEMORY[0x24BDBD6B8];
    -[SCROBrailleDisplayInput setDownKeys:](v16->_input, "setDownKeys:", CFSetCreateMutable(0, 0, MEMORY[0x24BDBD6B8]));
    -[SCROBrailleDisplayInput setIsQuiet:](v16->_input, "setIsQuiet:", 1);
    -[SCROBrailleDisplayInput setDownBrailleDots:](v16->_input, "setDownBrailleDots:", CFSetCreateMutable(0, 0, v20));
    -[SCROBrailleDisplayInput setLastBrailleChordPosted:](v16->_input, "setLastBrailleChordPosted:", -3061152000.0);
    -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v16->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
    -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v16->_input, "setBrailleTranslationTimeout:", 1.0);
    v16->_brailleKeyDebounceTimeout = 0.5;
    v21 = objc_alloc_init(SCROBrailleDisplayStatus);
    status = v16->_status;
    v16->_status = v21;

    -[SCROBrailleDisplayStatus setVirtualAlignment:](v16->_status, "setVirtualAlignment:", 0);
    inputTableIdentifier = v16->_inputTableIdentifier;
    v16->_inputTableIdentifier = (NSString *)&stru_24CC1DB88;

    outputTableIdentifier = v16->_outputTableIdentifier;
    v16->_outputTableIdentifier = (NSString *)&stru_24CC1DB88;

    v16->_automaticBrailleTranslationEnabled = 1;
    v25 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    contentLock = v16->_contentLock;
    v16->_contentLock = v25;

    v37.version = 0;
    memset(&v37.retain, 0, 24);
    v37.info = v16;
    Current = CFAbsoluteTimeGetCurrent();
    v16->_inputEventTimer = CFRunLoopTimerCreate(0, Current, 0.1, 0, 0, (CFRunLoopTimerCallBack)_inputEventHandler, &v37);
    objc_storeStrong((id *)&v16->_brailleDriver, a3);
    objc_storeStrong((id *)&v16->_driverIdentifier, a4);
    objc_storeStrong((id *)&v16->_ioElement, a5);
    v28 = objc_storeWeak((id *)&v16->_delegate, v14);
    v29 = objc_msgSend(v14, "newBrailleDisplayCommandDispatcher", *(_OWORD *)&v37.version, *(_OWORD *)&v37.retain, v37.copyDescription);
    commandDispatcher = v16->_commandDispatcher;
    v16->_commandDispatcher = (SCROBrailleDisplayCommandDispatcherProtocol *)v29;

    -[SCROBrailleDisplayCommandDispatcherProtocol setDelegate:](v16->_commandDispatcher, "setDelegate:", v16);
    v16->_delegateWantsDisplayCallback = 1;
    v16->_inputAllowed = 1;
    v31 = -[SCROBrailleEventDispatcher initWithTarget:]([SCROBrailleEventDispatcher alloc], "initWithTarget:", v16);
    eventDispatcher = v16->_eventDispatcher;
    v16->_eventDispatcher = v31;

    v16->_latinEscapeEnabled = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v16, sel__unloadNotification_, CFSTR("SCROBrailleDriverProtocolUnloadNotification"), v16->_brailleDriver);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v16, sel__configurationChangeNotification_, CFSTR("SCROBrailleDriverProtocolConfigurationChangeNotification"), v16->_brailleDriver);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v16, sel__sleepNotification_, CFSTR("SCROBrailleDriverProtocolSleepNotification"), v16->_brailleDriver);

LABEL_5:
    v17 = v16;
  }

  return v17;
}

- (void)_delayedDisplayLoad
{
  objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__runThread, self, 0);
}

- (BOOL)_attemptLoad
{
  return -[SCROBrailleDriverProtocol loadDriverWithIOElement:](self->_brailleDriver, "loadDriverWithIOElement:", self->_ioElement) == 0;
}

- (void)_runThread
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  SCROBrailleDriverProtocol *brailleDriver;
  SCROIOElementProtocol *ioElement;
  int v10;
  NSString *v11;
  NSString *driverModelIdentifier;
  uint64_t v13;
  uint64_t v14;
  SCROBrailleLine *v15;
  SCROBrailleLine *brailleLine;
  int v17;
  __CFRunLoop *runLoop;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  int v23;
  SCROBrailleDriverProtocol *v24;
  __int16 v25;
  SCROIOElementProtocol *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x212BDDCF0](self, a2);
  v4 = -[NSLock lock](self->_contentLock, "lock");
  if (self->_isValid && self->_brailleDriver)
  {
    v5 = (void *)MEMORY[0x212BDDCF0](v4);
    v6 = -[SCROBrailleDisplay _attemptLoad](self, "_attemptLoad");
    objc_autoreleasePoolPop(v5);
    _SCROD_LOG();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      brailleDriver = self->_brailleDriver;
      ioElement = self->_ioElement;
      v23 = 138543874;
      v24 = brailleDriver;
      v25 = 2114;
      v26 = ioElement;
      v27 = 1024;
      v28 = v6;
      _os_log_impl(&dword_2115BB000, v7, OS_LOG_TYPE_DEFAULT, "Load driver %{public}@ with element: %{public}@ : result: %d", (uint8_t *)&v23, 0x1Cu);
    }

    if (v6)
    {
      v10 = 1;
      -[SCROBrailleDriverProtocol modelIdentifier](self->_brailleDriver, "modelIdentifier");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      driverModelIdentifier = self->_driverModelIdentifier;
      self->_driverModelIdentifier = v11;

      v13 = -[SCROBrailleDriverProtocol mainSize](self->_brailleDriver, "mainSize");
      self->_mainSize = v13 & ~(v13 >> 63);
      v14 = -[SCROBrailleDriverProtocol statusSize](self->_brailleDriver, "statusSize");
      self->_statusSize = v14 & ~(v14 >> 63);
      self->_postsKeyboardEvents = -[SCROBrailleDriverProtocol postsKeyboardEvents](self->_brailleDriver, "postsKeyboardEvents");
      self->_brailleInputMode = -[SCROBrailleDriverProtocol brailleInputMode](self->_brailleDriver, "brailleInputMode");
      v15 = -[SCROBrailleLine initWithDriver:mainSize:statusSize:]([SCROBrailleLine alloc], "initWithDriver:mainSize:statusSize:", self->_brailleDriver, self->_mainSize, self->_statusSize);
      brailleLine = self->_brailleLine;
      self->_brailleLine = v15;

      -[SCROBrailleLine setTranslationDelegate:](self->_brailleLine, "setTranslationDelegate:", self);
      self->_runLoop = CFRunLoopGetCurrent();
      -[SCROBrailleDisplay updateBlinkingCursorTimer:](self, "updateBlinkingCursorTimer:", -[SCROBrailleDisplay _blinkingCursorSetting](self, "_blinkingCursorSetting") != 0);
      v17 = -[SCROBrailleDriverProtocol isInputEnabled](self->_brailleDriver, "isInputEnabled");
      self->_inputEnabled = v17;
      if (v17)
        CFRunLoopAddTimer(self->_runLoop, self->_inputEventTimer, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      runLoop = self->_runLoop;
      -[SCROBrailleEventDispatcher start](self->_eventDispatcher, "start");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[SCROBrailleDriverProtocol setBrailleDriverDelegate:](self->_brailleDriver, "setBrailleDriverDelegate:", self);
      v6 = 1;
    }
    else
    {
      runLoop = 0;
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
    runLoop = 0;
    v6 = 0;
  }
  -[NSLock unlock](self->_contentLock, "unlock");
  objc_autoreleasePoolPop(v3);
  if (v10)
  {
    v19 = (void *)MEMORY[0x212BDDCF0]();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v21 = WeakRetained;
    if (v6)
    {
      objc_msgSend(WeakRetained, "brailleDisplay:driverDidLoad:", self, 1);

      objc_autoreleasePoolPop(v19);
      do
      {
        v22 = (void *)MEMORY[0x212BDDCF0]();
        CFRunLoopRun();
        objc_autoreleasePoolPop(v22);
      }
      while (runLoop == self->_runLoop);
    }
    else
    {
      objc_msgSend(WeakRetained, "brailleDisplay:driverDidLoad:", self, 0);

      objc_autoreleasePoolPop(v19);
    }
  }
}

- (unsigned)_blinkingCursorSetting
{
  unsigned int (*v2)(void);
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (unsigned int (*)(void))get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr;
  v8 = get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr;
  if (!get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_block_invoke;
    v4[3] = &unk_24CC1D370;
    v4[4] = &v5;
    __get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_block_invoke((uint64_t)v4);
    v2 = (unsigned int (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    -[SCROBrailleDisplay _blinkingCursorSetting].cold.1();
  return v2() == 0;
}

- (void)dealloc
{
  id v3;
  NSLock *v4;
  NSLock *contentLock;
  SCROBrailleDisplayStatus *status;
  SCROBrailleDisplayInput *input;
  NSString *driverIdentifier;
  NSString *driverModelIdentifier;
  SCROIOElementProtocol *ioElement;
  objc_super v11;

  -[SCROBrailleDisplay invalidate](self, "invalidate");
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = self->_contentLock;
  -[NSLock lock](v4, "lock");
  objc_msgSend(v3, "addObject:", self->_contentLock);
  contentLock = self->_contentLock;
  self->_contentLock = 0;

  if (self->_status)
  {
    objc_msgSend(v3, "addObject:");
    status = self->_status;
    self->_status = 0;

  }
  if (self->_input)
  {
    objc_msgSend(v3, "addObject:");
    input = self->_input;
    self->_input = 0;

  }
  if (self->_driverIdentifier)
  {
    objc_msgSend(v3, "addObject:");
    driverIdentifier = self->_driverIdentifier;
    self->_driverIdentifier = 0;

  }
  if (self->_driverModelIdentifier)
  {
    objc_msgSend(v3, "addObject:");
    driverModelIdentifier = self->_driverModelIdentifier;
    self->_driverModelIdentifier = 0;

  }
  if (self->_ioElement)
  {
    objc_msgSend(v3, "addObject:");
    ioElement = self->_ioElement;
    self->_ioElement = 0;

  }
  -[NSLock unlock](v4, "unlock");

  v11.receiver = self;
  v11.super_class = (Class)SCROBrailleDisplay;
  -[SCROBrailleDisplay dealloc](&v11, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  __CFRunLoopTimer *inputEventTimer;
  __CFRunLoopTimer *blinkerEventTimer;
  __CFRunLoop *runLoop;
  SCROBrailleLine *brailleLine;
  SCROBrailleDriverProtocol *brailleDriver;
  SCROBrailleDisplayCommandDispatcherProtocol *commandDispatcher;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SCROBrailleEventDispatcher invalidate](self->_eventDispatcher, "invalidate");
  -[NSLock lock](self->_contentLock, "lock");
  self->_isValid = 0;
  inputEventTimer = self->_inputEventTimer;
  if (inputEventTimer)
  {
    CFRunLoopTimerInvalidate(inputEventTimer);
    CFRelease(self->_inputEventTimer);
    self->_inputEventTimer = 0;
  }
  blinkerEventTimer = self->_blinkerEventTimer;
  if (blinkerEventTimer)
  {
    CFRunLoopTimerInvalidate(blinkerEventTimer);
    CFRelease(self->_blinkerEventTimer);
    self->_blinkerEventTimer = 0;
  }
  runLoop = self->_runLoop;
  if (runLoop)
  {
    self->_runLoop = 0;
    CFRunLoopStop(runLoop);
  }
  -[SCROBrailleDriverProtocol unloadDriver](self->_brailleDriver, "unloadDriver");
  brailleLine = self->_brailleLine;
  self->_brailleLine = 0;

  brailleDriver = self->_brailleDriver;
  self->_brailleDriver = 0;

  commandDispatcher = self->_commandDispatcher;
  self->_commandDispatcher = 0;

  -[NSLock unlock](self->_contentLock, "unlock");
}

- (BOOL)isValid
{
  BOOL isValid;

  -[NSLock lock](self->_contentLock, "lock");
  isValid = self->_isValid;
  -[NSLock unlock](self->_contentLock, "unlock");
  return isValid;
}

- (BOOL)isLoaded
{
  char v3;

  -[NSLock lock](self->_contentLock, "lock");
  v3 = -[SCROBrailleDriverProtocol isDriverLoaded](self->_brailleDriver, "isDriverLoaded");
  -[NSLock unlock](self->_contentLock, "unlock");
  return v3;
}

- (id)driverIdentifier
{
  NSString *driverIdentifier;
  void *v4;

  -[NSLock lock](self->_contentLock, "lock");
  driverIdentifier = self->_driverIdentifier;
  if (driverIdentifier)
    v4 = (void *)-[NSString copy](driverIdentifier, "copy");
  else
    v4 = 0;
  -[NSLock unlock](self->_contentLock, "unlock");
  return v4;
}

- (id)driverModelIdentifier
{
  NSString *driverModelIdentifier;
  void *v4;

  -[NSLock lock](self->_contentLock, "lock");
  driverModelIdentifier = self->_driverModelIdentifier;
  if (driverModelIdentifier)
    v4 = (void *)-[NSString copy](driverModelIdentifier, "copy");
  else
    v4 = 0;
  -[NSLock unlock](self->_contentLock, "unlock");
  return v4;
}

- (id)lineDescriptor
{
  id v3;

  -[NSLock lock](self->_contentLock, "lock");
  v3 = -[SCROBrailleLine newLineDescriptor](self->_brailleLine, "newLineDescriptor");
  -[NSLock unlock](self->_contentLock, "unlock");
  return v3;
}

- (id)ioElement
{
  return self->_ioElement;
}

- (int)token
{
  return -[SCROIOElementProtocol identifier](self->_ioElement, "identifier");
}

- (int64_t)mainSize
{
  int64_t mainSize;

  -[NSLock lock](self->_contentLock, "lock");
  mainSize = self->_mainSize;
  -[NSLock unlock](self->_contentLock, "unlock");
  return mainSize;
}

- (int64_t)statusSize
{
  int64_t statusSize;

  -[NSLock lock](self->_contentLock, "lock");
  statusSize = self->_statusSize;
  -[NSLock unlock](self->_contentLock, "unlock");
  return statusSize;
}

- (void)setInputAllowed:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[NSLock lock](self->_contentLock, "lock");
  if (self->_inputAllowed != v3)
    self->_inputAllowed = v3;
  -[NSLock unlock](self->_contentLock, "unlock");
}

- (void)setWordWrapEnabled:(BOOL)a3
{
  self->_wordWrapEnabled = a3;
  -[SCROBrailleLine setWordWrapEnabled:](self->_brailleLine, "setWordWrapEnabled:");
}

- (BOOL)wordWrapEnabled
{
  return self->_wordWrapEnabled;
}

- (void)setPanWithTextCursorEnabled:(BOOL)a3
{
  self->_panWithTextCursorEnabled = a3;
  -[SCROBrailleLine setPanWithTextCursorEnabled:](self->_brailleLine, "setPanWithTextCursorEnabled:");
}

- (BOOL)panWithTextCursorEnabled
{
  return self->_panWithTextCursorEnabled;
}

- (void)setAutoAdvanceEnabled:(BOOL)a3
{
  const __CFString *v5;

  v5 = CFSTR("NO");
  if (a3)
    v5 = CFSTR("YES");
  NSLog(CFSTR("AUTOADVANCE: Setting Braille AutoAdvance Enabled: %@"), a2, v5);
  self->_autoAdvanceEnabled = a3;
  -[SCROBrailleDisplay _beginAutoAdvanceIfEnabled](self, "_beginAutoAdvanceIfEnabled");
}

- (void)setAutoAdvanceDuration:(double)a3
{
  double autoAdvanceDuration;

  autoAdvanceDuration = self->_autoAdvanceDuration;
  self->_autoAdvanceDuration = a3;
  if (autoAdvanceDuration != a3)
  {
    NSLog(CFSTR("AUTOADVANCE: Setting Braille AutoAdvance Duration: %f"), a2, *(_QWORD *)&a3);
    -[SCROBrailleDisplay _beginAutoAdvanceIfEnabled](self, "_beginAutoAdvanceIfEnabled");
  }
}

- (BOOL)autoAdvanceEnabled
{
  return self->_autoAdvanceEnabled;
}

- (void)setBlinkingCursorEnabled:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_blinkingCursorEnabled != a3)
  {
    self->_blinkingCursorEnabled = a3;
    -[SCROBrailleLine setBlinkEnabled:](self->_brailleLine, "setBlinkEnabled:");
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __47__SCROBrailleDisplay_setBlinkingCursorEnabled___block_invoke;
    v5[3] = &unk_24CC1D2F8;
    v5[4] = self;
    v6 = a3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
  }
}

uint64_t __47__SCROBrailleDisplay_setBlinkingCursorEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBlinkingCursorTimer:", *(unsigned __int8 *)(a1 + 40));
}

- (void)updateBlinkingCursorTimer:(BOOL)a3
{
  CFAbsoluteTime Current;
  __CFRunLoopTimer *v5;
  __CFRunLoopTimer *blinkerEventTimer;
  CFRunLoopTimerContext v7;

  if (self->_runLoop)
  {
    if (a3
      && -[SCROBrailleDriverProtocol supportsBlinkingCursor](self->_brailleDriver, "supportsBlinkingCursor"))
    {
      if (!self->_blinkerEventTimer)
      {
        v7.version = 0;
        memset(&v7.retain, 0, 24);
        v7.info = self;
        Current = CFAbsoluteTimeGetCurrent();
        v5 = CFRunLoopTimerCreate(0, Current, 0.5, 0, 0, (CFRunLoopTimerCallBack)_blinkerEventHandler, &v7);
        self->_blinkerEventTimer = v5;
        CFRunLoopAddTimer(self->_runLoop, v5, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      }
    }
    else
    {
      blinkerEventTimer = self->_blinkerEventTimer;
      if (blinkerEventTimer)
      {
        CFRunLoopTimerInvalidate(blinkerEventTimer);
        CFRelease(self->_blinkerEventTimer);
        self->_blinkerEventTimer = 0;
      }
    }
  }
}

- (void)setImageData:(id)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v4;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:data2:data3:](SCROBrailleEvent, "eventWithType:data:data2:data3:", 44, a3, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (NSData)imageData
{
  return -[SCROBrailleLine imageData](self->_brailleLine, "imageData");
}

- (void)setPlanarData:(id)a3
{
  id v5;
  SCROBrailleEventDispatcher *eventDispatcher;
  id v7;

  objc_storeStrong((id *)&self->_planarData, a3);
  v5 = a3;
  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:data2:data3:](SCROBrailleEvent, "eventWithType:data:data2:data3:", 45, v5, 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v7);

}

- (void)_beginAutoAdvanceIfEnabled
{
  double autoAdvanceDuration;
  BOOL autoAdvanceEnabled;
  _QWORD v5[4];
  id v6[2];
  BOOL v7;
  id location;

  objc_initWeak(&location, self);
  autoAdvanceDuration = self->_autoAdvanceDuration;
  autoAdvanceEnabled = self->_autoAdvanceEnabled;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__SCROBrailleDisplay__beginAutoAdvanceIfEnabled__block_invoke;
  v5[3] = &unk_24CC1D348;
  objc_copyWeak(v6, &location);
  v7 = autoAdvanceEnabled;
  v6[1] = *(id *)&autoAdvanceDuration;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __48__SCROBrailleDisplay__beginAutoAdvanceIfEnabled__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "autoAdvanceTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  if (*(_BYTE *)(a1 + 48) && (v5 = *(double *)(a1 + 40), v5 > 0.0))
  {
    v6 = (void *)MEMORY[0x24BDBCF40];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__SCROBrailleDisplay__beginAutoAdvanceIfEnabled__block_invoke_2;
    v10[3] = &unk_24CC1D320;
    objc_copyWeak(&v11, v2);
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 1, v10, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "setAutoAdvanceTimer:", v7);

    objc_destroyWeak(&v11);
  }
  else
  {
    v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "setAutoAdvanceTimer:", 0);

  }
}

void __48__SCROBrailleDisplay__beginAutoAdvanceIfEnabled__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[16];
    v4 = WeakRetained;
    +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 19, MEMORY[0x24BDBD1C8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enqueueEvent:", v3);

    WeakRetained = v4;
  }

}

- (id)configuration
{
  NSString *driverIdentifier;
  void *v4;
  NSString *driverModelIdentifier;
  void *v6;
  int64_t statusSize;
  int64_t mainSize;
  uint64_t brailleInputMode;
  SCROIOElementProtocol *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString **v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  -[NSLock lock](self->_contentLock, "lock");
  driverIdentifier = self->_driverIdentifier;
  if (driverIdentifier)
    v4 = (void *)-[NSString copy](driverIdentifier, "copy");
  else
    v4 = 0;
  driverModelIdentifier = self->_driverModelIdentifier;
  if (driverModelIdentifier)
    v6 = (void *)-[NSString copy](driverModelIdentifier, "copy");
  else
    v6 = 0;
  mainSize = self->_mainSize;
  statusSize = self->_statusSize;
  brailleInputMode = self->_brailleInputMode;
  v10 = self->_ioElement;
  -[NSLock unlock](self->_contentLock, "unlock");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4)
    objc_msgSend(v11, "setObject:forKey:", v4, kSCROBrailleDisplayDriverIdentifier[0]);
  if (v6)
  {
    objc_msgSend(v12, "setObject:forKey:", v6, kSCROBrailleDisplayModelIdentifier[0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", mainSize);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, kSCROBrailleDisplayMainSize[0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", statusSize);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, kSCROBrailleDisplayStatusSize[0]);

  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (int)-[SCROIOElementProtocol identifier](v10, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, kSCROBrailleDisplayToken[0]);

    v16 = -[SCROIOElementProtocol transport](v10, "transport");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v17, kSCROBrailleDisplayTransport[0]);

    if (v16 == 1)
    {
      if (-[SCROIOElementProtocol conformsToProtocol:](v10, "conformsToProtocol:", &unk_254AC3EE8))
      {
        v21 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SCROIOElementProtocol vendorId](v10, "vendorId"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SCROIOElementProtocol productId](v10, "productId"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@,%@"), v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, kSCROBrailleDisplayBrailleVendorProductId[0]);

        -[SCROIOElementProtocol productName](v10, "productName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, kSCROBrailleDisplayBrailleProductName[0]);

        -[SCROIOElementProtocol manufacturerName](v10, "manufacturerName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = kSCROBrailleDisplayBrailleManufacturerName;
        goto LABEL_22;
      }
    }
    else if (v16 == 8)
    {
      if (-[SCROIOElementProtocol conformsToProtocol:](v10, "conformsToProtocol:", &unk_254AC3E28))
      {
        -[SCROIOElementProtocol bluetoothAddress](v10, "bluetoothAddress");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = kSCROBrailleDisplayBluetoothAddress;
        goto LABEL_22;
      }
    }
    else if (v16 == 32
           && -[SCROIOElementProtocol conformsToProtocol:](v10, "conformsToProtocol:", &unk_254AC3CF0))
    {
      -[SCROIOElementProtocol address](v10, "address");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, kSCROBrailleDisplayBluetoothAddress[0]);

      -[SCROIOElementProtocol name](v10, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = kSCROBrailleDisplayBrailleProductName;
LABEL_22:
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, *v20);

    }
  }
  else
  {
    objc_msgSend(v12, "setObject:forKey:", &unk_24CC30C70, kSCROBrailleDisplayTransport[0]);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_postsKeyboardEvents);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v26, kSCROBrailleDisplayPostsKeyboardEvents[0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", brailleInputMode);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v27, kSCROBrailleDisplayBrailleInputMode[0]);

  return v12;
}

- (id)canvasDescriptor
{
  void *v3;
  void *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SCROBrailleDriverProtocol canvas](self->_brailleDriver, "canvas");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)requestFlushLine
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v3;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 39, *MEMORY[0x24BDBD270]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v3);

}

- (void)beginUpdates
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v3;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 35, *MEMORY[0x24BDBD270]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v3);

}

- (void)endUpdates
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v3;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 35, *MEMORY[0x24BDBD268]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v3);

}

- (void)setBrailleFormatter:(id)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v4;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:data2:data3:](SCROBrailleEvent, "eventWithType:data:data2:data3:", 29, a3, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (id)realStatus
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_contentLock, "lock");
  -[SCROBrailleDisplayStatus realData](self->_status, "realData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SCROBrailleDisplayStatus realData](self->_status, "realData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "copy");

  }
  -[NSLock unlock](self->_contentLock, "unlock");
  return v3;
}

- (id)virtualStatus
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_contentLock, "lock");
  -[SCROBrailleDisplayStatus virtualData](self->_status, "virtualData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SCROBrailleDisplayStatus virtualData](self->_status, "virtualData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "copy");

  }
  -[NSLock unlock](self->_contentLock, "unlock");
  return v3;
}

- (void)setAggregatedStatus:(id)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v4;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 3, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (id)aggregatedStatus
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_contentLock, "lock");
  -[SCROBrailleDisplayStatus aggregatedData](self->_status, "aggregatedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SCROBrailleDisplayStatus aggregatedData](self->_status, "aggregatedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "copy");

  }
  -[NSLock unlock](self->_contentLock, "unlock");
  return v3;
}

- (void)setVirtualStatusAlignment:(int)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  void *v4;
  id v5;

  eventDispatcher = self->_eventDispatcher;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 4, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (int)virtualStatusAlignment
{
  int v3;

  -[NSLock lock](self->_contentLock, "lock");
  v3 = -[SCROBrailleDisplayStatus virtualAlignment](self->_status, "virtualAlignment");
  -[NSLock unlock](self->_contentLock, "unlock");
  return v3;
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  void *v4;
  id v5;

  eventDispatcher = self->_eventDispatcher;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 5, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (int64_t)masterStatusCellIndex
{
  int64_t v3;

  -[NSLock lock](self->_contentLock, "lock");
  v3 = -[SCROBrailleDisplayStatus masterStatusCellIndex](self->_status, "masterStatusCellIndex");
  -[NSLock unlock](self->_contentLock, "unlock");
  return v3;
}

- (BOOL)delegateWantsDisplayCallback
{
  return self->_delegateWantsDisplayCallback;
}

- (void)setDelegateWantsDisplayCallback:(BOOL)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  void *v4;
  id v5;

  eventDispatcher = self->_eventDispatcher;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 33, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (void)setStatusAttributesWithMasterCellIndex:(int64_t)a3 virtualAlignment:(int)a4
{
  uint64_t v4;
  SCROBrailleEventDispatcher *eventDispatcher;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  eventDispatcher = self->_eventDispatcher;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleEvent eventWithType:data:data2:data3:](SCROBrailleEvent, "eventWithType:data:data2:data3:", 28, v8, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v7);

}

- (void)simulateKeypress:(id)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v4;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 17, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (void)panLeft
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v4;

  -[SCROBrailleDisplay _beginAutoAdvanceIfEnabled](self, "_beginAutoAdvanceIfEnabled");
  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 18, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (void)panRight
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v4;

  -[SCROBrailleDisplay _beginAutoAdvanceIfEnabled](self, "_beginAutoAdvanceIfEnabled");
  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 19, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (void)panBeginning
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v3;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 20, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v3);

}

- (void)panEnd
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v3;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 21, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v3);

}

- (void)planarPanLeft
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v3;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 47, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v3);

}

- (void)planarPanRight
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v3;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 48, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v3);

}

- (void)setPrepareToMemorizeNextKey:(BOOL)a3 immediate:(BOOL)a4
{
  _BOOL8 v4;
  SCROBrailleEventDispatcher *eventDispatcher;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  eventDispatcher = self->_eventDispatcher;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleEvent eventWithType:data:data2:data3:](SCROBrailleEvent, "eventWithType:data:data2:data3:", 24, v8, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v7);

}

- (void)setSingleLetterInputIsOn:(BOOL)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  void *v4;
  id v5;

  eventDispatcher = self->_eventDispatcher;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 38, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (void)setTextSearchModeOn:(BOOL)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  void *v4;
  id v5;

  eventDispatcher = self->_eventDispatcher;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 40, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (void)translateBrailleToClipboard
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v3;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 41, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v3);

}

- (void)setBrailleKeyDebounceTimeout:(double)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  void *v4;
  id v5;

  eventDispatcher = self->_eventDispatcher;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 42, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (int64_t)tokenForRouterIndex:(int64_t)a3 location:(int64_t *)a4 appToken:(id *)a5
{
  int64_t v8;
  int64_t v10;

  v10 = a3;
  -[NSLock lock](self->_contentLock, "lock");
  v8 = -[SCROBrailleLine tokenForRouterIndex:location:appToken:](self->_brailleLine, "tokenForRouterIndex:location:appToken:", &v10, a4, a5);
  -[NSLock unlock](self->_contentLock, "unlock");
  return v8;
}

- (void)handleEvent:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;

  v15 = a3;
  switch(objc_msgSend(v15, "type"))
  {
    case 3u:
      -[SCROBrailleDisplay _aggregatedStatusHandler:](self, "_aggregatedStatusHandler:", v15);
      break;
    case 4u:
    case 5u:
      -[SCROBrailleDisplay _statusDisplayHandler:](self, "_statusDisplayHandler:", v15);
      break;
    case 0x11u:
      -[SCROBrailleDisplay _simulateKeypressHandler:](self, "_simulateKeypressHandler:", v15);
      break;
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
      objc_msgSend(v15, "data");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqual:", MEMORY[0x24BDBD1C8]);

      if (v5)
        -[SCROBrailleDisplay _autoAdvancePanHandler:](self, "_autoAdvancePanHandler:", v15);
      else
        -[SCROBrailleDisplay _panHandler:](self, "_panHandler:", v15);
      break;
    case 0x18u:
      -[SCROBrailleDisplayInput setPrepareToMemorizeNextKey:](self->_input, "setPrepareToMemorizeNextKey:", 0);
      objc_msgSend(v15, "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayInput setRequestPrepareToMemorizeNextKey:](self->_input, "setRequestPrepareToMemorizeNextKey:", objc_msgSend(v6, "BOOLValue"));

      objc_msgSend(v15, "data2");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayInput setMemorizeNextKeyImmediately:](self->_input, "setMemorizeNextKeyImmediately:", objc_msgSend(v7, "BOOLValue"));

      if (-[SCROBrailleDisplayInput memorizeNextKeyImmediately](self->_input, "memorizeNextKeyImmediately"))
        -[SCROBrailleDisplayInput setMemorizeNextKeyImmediatelyTimeout:](self->_input, "setMemorizeNextKeyImmediatelyTimeout:", CFAbsoluteTimeGetCurrent() + *(double *)&kSCROBrailleInputMemorizeNowInterval);
      if (-[SCROBrailleDisplay _isMemorizingKeys](self, "_isMemorizingKeys"))
        -[SCROBrailleLine discardEdits](self->_brailleLine, "discardEdits");
      break;
    case 0x19u:
      -[SCROBrailleDisplay _unloadHandler](self, "_unloadHandler");
      break;
    case 0x1Au:
      objc_msgSend(v15, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      if (v9)
        -[SCROBrailleLine discardEdits](self->_brailleLine, "discardEdits");
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v15, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "brailleDisplay:isSleeping:", self, objc_msgSend(v11, "BOOLValue"));
      goto LABEL_26;
    case 0x1Bu:
      -[SCROBrailleDisplay _configurationChangeHandler](self, "_configurationChangeHandler");
      break;
    case 0x1Cu:
      -[SCROBrailleDisplay _bulkStatusAttributesHandler:](self, "_bulkStatusAttributesHandler:", v15);
      break;
    case 0x1Du:
      -[SCROBrailleDisplay _setBrailleFormatterHandler:](self, "_setBrailleFormatterHandler:", v15);
      break;
    case 0x21u:
      -[SCROBrailleDisplay _setDelegateWantsDisplayCallbackHandler:](self, "_setDelegateWantsDisplayCallbackHandler:", v15);
      break;
    case 0x23u:
      -[SCROBrailleDisplay _setBatchUpdates:](self, "_setBatchUpdates:", v15);
      break;
    case 0x26u:
      -[SCROBrailleDisplay _singleLetterInputHandler:](self, "_singleLetterInputHandler:", v15);
      break;
    case 0x27u:
      -[SCROBrailleLine display](self->_brailleLine, "display");
      break;
    case 0x28u:
      -[SCROBrailleDisplay _textSearchModeHandler:](self, "_textSearchModeHandler:", v15);
      break;
    case 0x29u:
      -[SCROBrailleDisplay _translateBrailleToClipboard](self, "_translateBrailleToClipboard");
      break;
    case 0x2Au:
      objc_msgSend(v15, "data");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "doubleValue");
      -[SCROBrailleDisplay _setBrailleKeyDebounceTimeoutHandler:](self, "_setBrailleKeyDebounceTimeoutHandler:");
      goto LABEL_32;
    case 0x2Cu:
      -[SCROBrailleDisplay _setTactileGraphicsImageDataHandler:](self, "_setTactileGraphicsImageDataHandler:", v15);
      break;
    case 0x2Du:
      -[SCROBrailleDisplay _setPlanarDataHandler:](self, "_setPlanarDataHandler:", v15);
      break;
    case 0x2Eu:
      objc_msgSend(v15, "data");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "data2");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplay _brailleDisplayStringDidChangeHandler:brailleSelection:](self, "_brailleDisplayStringDidChangeHandler:brailleSelection:", WeakRetained, v11);
LABEL_26:

LABEL_32:
      break;
    case 0x2Fu:
      -[SCROBrailleLine planarPanLeft](self->_brailleLine, "planarPanLeft");
      break;
    case 0x30u:
      -[SCROBrailleLine planarPanRight](self->_brailleLine, "planarPanRight");
      break;
    default:
      break;
  }
  -[SCROBrailleDisplay eventHandled](self, "eventHandled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  if (v12)
  {
    -[SCROBrailleDisplay eventHandled](self, "eventHandled");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v14)[2](v14, v15);

    v13 = v15;
  }

}

- (void)_unloadHandler
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "brailleDriverDisconnected:", self);

  -[SCROBrailleDisplay invalidate](self, "invalidate");
}

- (id)_statusStringWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  _BOOL4 v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  unsigned __int8 v27;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", kSCROStatusAttributeCellIndex[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKey:", kSCROStatusAttributeCellTitle[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_statusStringWithDictionary__myBundle)
  {
    v9 = (void *)MEMORY[0x24BDD1488];
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleForClass:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_statusStringWithDictionary__myBundle;
    _statusStringWithDictionary__myBundle = v11;

  }
  v27 = 0;
  -[SCROBrailleDisplayStatus aggregatedData](self->_status, "aggregatedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v7 < v14)
  {
    -[SCROBrailleDisplayStatus aggregatedData](self->_status, "aggregatedData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getBytes:range:", &v27, v7, 1);

  }
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v5, "appendString:", v8);
    objc_msgSend(v5, "appendString:", CFSTR(": "));
  }
  v26 = v8;
  v16 = 0;
  do
  {
    objc_msgSend(v4, "objectForKey:", kSCROStatusAttributeDotText[v16]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (v27 >> v16) & 1;
    -[SCROBrailleDisplayStatus masterStatusCellIndex](self->_status, "masterStatusCellIndex");
    switch((int)v16)
    {
      case 0:
        objc_msgSend((id)_statusStringWithDictionary__myBundle, "localizedStringForKey:value:table:", CFSTR("unreadAnnouncements"), &stru_24CC1DB88, CFSTR("Server"));
        v19 = objc_claimAutoreleasedReturnValue();

        v20 = -[SCROBrailleLine anyUnread](self->_brailleLine, "anyUnread");
        goto LABEL_13;
      case 1:
        objc_msgSend((id)_statusStringWithDictionary__myBundle, "localizedStringForKey:value:table:", CFSTR("currentAnnouncementUnread"), &stru_24CC1DB88, CFSTR("Server"));
        v19 = objc_claimAutoreleasedReturnValue();

        v20 = -[SCROBrailleLine currentUnread](self->_brailleLine, "currentUnread");
        goto LABEL_13;
      case 6:
        objc_msgSend((id)_statusStringWithDictionary__myBundle, "localizedStringForKey:value:table:", CFSTR("canPanLeft"), &stru_24CC1DB88, CFSTR("Server"));
        v19 = objc_claimAutoreleasedReturnValue();

        v20 = -[SCROBrailleLine canPanLeft](self->_brailleLine, "canPanLeft");
        goto LABEL_13;
      case 7:
        objc_msgSend((id)_statusStringWithDictionary__myBundle, "localizedStringForKey:value:table:", CFSTR("canPanRight"), &stru_24CC1DB88, CFSTR("Server"));
        v19 = objc_claimAutoreleasedReturnValue();

        v20 = -[SCROBrailleLine canPanRight](self->_brailleLine, "canPanRight");
LABEL_13:
        v18 = v20;
        v17 = (void *)v19;
        break;
      default:
        break;
    }
    v21 = v16 + 1;
    if (v17)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("%d "), v16 + 1);
      if (v18)
        v22 = 1;
      else
        v22 = 2;
      +[SCROBrailleSubstitutionManager sharedInstance](SCROBrailleSubstitutionManager, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "brailleSubstitutionForType:withLanguage:", v22, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v24);

      objc_msgSend(v5, "appendString:", CFSTR(" "));
      objc_msgSend(v5, "appendString:", v17);
      if (v16 <= 6)
        objc_msgSend(v5, "appendString:", CFSTR("  "));
    }

    ++v16;
  }
  while (v21 != 8);

  return v5;
}

- (void)_setBrailleFormatterHandler:(id)a3
{
  id v4;

  objc_msgSend(a3, "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SCROBrailleDisplay _setBrailleFormatter:](self, "_setBrailleFormatter:", v4);

}

- (void)_setTactileGraphicsImageDataHandler:(id)a3
{
  id v4;

  objc_msgSend(a3, "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SCROBrailleLine setImageData:](self->_brailleLine, "setImageData:", v4);

}

- (void)_setPlanarDataHandler:(id)a3
{
  id v4;

  objc_msgSend(a3, "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleLine setPlanarData:](self->_brailleLine, "setPlanarData:", v4);

}

- (unint64_t)numberOfTextLinesInPlanarBraille
{
  return -[SCROBrailleLine numberOfTextLinesInPlanarBraille](self->_brailleLine, "numberOfTextLinesInPlanarBraille");
}

- (void)_unpauseInputAndProcessKeyEvents
{
  -[SCROBrailleDisplay _unpauseInput](self, "_unpauseInput");
  -[SCROBrailleDisplay _processKeyEvents:](self, "_processKeyEvents:", MEMORY[0x24BDBD1A8]);
}

- (void)unpauseInputOnBrailleFormatterChange
{
  if (-[SCROBrailleDisplay _inputPaused](self, "_inputPaused"))
    -[SCROBrailleDisplay _unpauseInputAndProcessKeyEvents](self, "_unpauseInputAndProcessKeyEvents");
}

- (void)_setBrailleFormatter:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v13 = a3;
  objc_msgSend(v13, "statusText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_contentLock, "lock");
  if (v4
    && (objc_msgSend(v4, "attribute:atIndex:effectiveRange:", kSCROStatusAttribute[0], 0, 0),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SCROBrailleDisplay _statusStringWithDictionary:](self, "_statusStringWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v13, "copy");

    objc_msgSend(v7, "addText:selection:token:focus:isEditableText:", v6, 0, 0, 0, 0);
    objc_msgSend(v7, "translate");

    v8 = (void *)v5;
    v9 = v7;
  }
  else
  {
    v8 = 0;
    v9 = v13;
  }
  v14 = v9;
  -[SCROBrailleLine setFormatter:](self->_brailleLine, "setFormatter:");
  -[NSLock unlock](self->_contentLock, "unlock");
  -[SCROBrailleDisplay unpauseInputOnBrailleFormatterChange](self, "unpauseInputOnBrailleFormatterChange");
  -[SCROBrailleDisplay _beginAutoAdvanceIfEnabled](self, "_beginAutoAdvanceIfEnabled");
  objc_msgSend(v14, "outputTableIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputTableIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_storeStrong((id *)&self->_outputTableIdentifier, v10);
  if (v11 && !-[NSString isEqualToString:](self->_inputTableIdentifier, "isEqualToString:", v11))
  {
    objc_storeStrong((id *)&self->_inputTableIdentifier, v11);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC60]), "initWithIdentifier:", v11);
    self->_isInputEightDot = objc_msgSend(v12, "supportsTranslationMode8Dot");
    self->_isInputContracted = objc_msgSend(v12, "supportsTranslationModeContracted");

  }
  if (!-[SCROBrailleLine hasEdits](self->_brailleLine, "hasEdits"))
    -[SCROBrailleDisplay _updateDisplay](self, "_updateDisplay");

}

- (NSAttributedString)editingString
{
  return -[SCROBrailleLine editingString](self->_brailleLine, "editingString");
}

- (BOOL)hasEdits
{
  return -[SCROBrailleLine hasEdits](self->_brailleLine, "hasEdits");
}

- (void)_statusDisplayHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  SCROBrailleLine *brailleLine;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  v6 = objc_msgSend(v11, "type");
  -[NSLock lock](self->_contentLock, "lock");
  if (v6 != 4)
  {
    if (v6 == 5 && -[SCROBrailleDisplayStatus masterStatusCellIndex](self->_status, "masterStatusCellIndex") != (int)v5)
    {
      -[SCROBrailleDisplayStatus setMasterStatusCellIndex:](self->_status, "setMasterStatusCellIndex:", (int)v5);
      -[SCROBrailleLine setMasterStatusCellIndex:](self->_brailleLine, "setMasterStatusCellIndex:", -[SCROBrailleDisplayStatus masterStatusCellIndex](self->_status, "masterStatusCellIndex"));
LABEL_9:
      v7 = 1;
      goto LABEL_10;
    }
LABEL_6:
    v7 = 0;
    goto LABEL_10;
  }
  if (-[SCROBrailleDisplayStatus virtualAlignment](self->_status, "virtualAlignment") == (_DWORD)v5)
    goto LABEL_6;
  -[SCROBrailleDisplayStatus setVirtualAlignment:](self->_status, "setVirtualAlignment:", v5);
  -[SCROBrailleDisplayStatus virtualData](self->_status, "virtualData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    brailleLine = self->_brailleLine;
    -[SCROBrailleDisplayStatus virtualData](self->_status, "virtualData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleLine setVirtualStatus:alignment:](brailleLine, "setVirtualStatus:alignment:", v10, -[SCROBrailleDisplayStatus virtualAlignment](self->_status, "virtualAlignment"));

    goto LABEL_9;
  }
  v7 = 0;
LABEL_10:
  -[NSLock unlock](self->_contentLock, "unlock");
  if (v7)
    -[SCROBrailleDisplay _updateDisplay](self, "_updateDisplay");

}

- (void)_aggregatedStatusHandler:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t statusSize;
  void *v12;
  void *v13;
  SCROBrailleLine *brailleLine;
  void *v15;
  SCROBrailleLine *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "length");
    v7 = objc_alloc_init(MEMORY[0x24BDBCE50]);
    -[NSLock lock](self->_contentLock, "lock");
    -[SCROBrailleDisplayStatus aggregatedData](self->_status, "aggregatedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleDisplayStatus setAggregatedData:](self->_status, "setAggregatedData:", v5);
    -[SCROBrailleDisplayStatus realData](self->_status, "realData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleDisplayStatus virtualData](self->_status, "virtualData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    statusSize = self->_statusSize;
    if (v6 <= statusSize)
    {
      -[SCROBrailleDisplayStatus setRealData:](self->_status, "setRealData:", v5);
      -[SCROBrailleDisplayStatus setVirtualData:](self->_status, "setVirtualData:", v7);
    }
    else
    {
      if (statusSize < 1)
      {
        -[SCROBrailleDisplayStatus setRealData:](self->_status, "setRealData:", 0);
      }
      else
      {
        objc_msgSend(v5, "subdataWithRange:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCROBrailleDisplayStatus setRealData:](self->_status, "setRealData:", v12);

      }
      objc_msgSend(v5, "subdataWithRange:", self->_statusSize, v6 - self->_statusSize);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayStatus setVirtualData:](self->_status, "setVirtualData:", v13);

    }
    brailleLine = self->_brailleLine;
    -[SCROBrailleDisplayStatus realData](self->_status, "realData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleLine setRealStatus:](brailleLine, "setRealStatus:", v15);

    v16 = self->_brailleLine;
    -[SCROBrailleDisplayStatus virtualData](self->_status, "virtualData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleLine setVirtualStatus:alignment:](v16, "setVirtualStatus:alignment:", v17, -[SCROBrailleDisplayStatus virtualAlignment](self->_status, "virtualAlignment"));

    -[NSLock unlock](self->_contentLock, "unlock");
    -[SCROBrailleDisplay _updateDisplay](self, "_updateDisplay");

  }
}

- (void)_setDelegateWantsDisplayCallbackHandler:(id)a3
{
  void *v4;
  id v5;
  id WeakRetained;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_delegateWantsDisplayCallback = objc_msgSend(v4, "BOOLValue");

  if (self->_delegateWantsDisplayCallback)
  {
    -[SCROBrailleDisplay _updateDisplay](self, "_updateDisplay");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = -[SCROBrailleLine newLineDescriptor](self->_brailleLine, "newLineDescriptor");
    objc_msgSend(WeakRetained, "brailleDisplay:didDisplay:", self, v5);

  }
}

- (void)_simulateKeypressHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "keyMasks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "intValue", (_QWORD)v15);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    -[SCROBrailleDisplay _processKeyEvents:](self, "_processKeyEvents:", v7);
  }

}

- (void)_bulkStatusAttributesHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SCROBrailleLine *brailleLine;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v11, "data2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  -[NSLock lock](self->_contentLock, "lock");
  -[SCROBrailleDisplayStatus setVirtualAlignment:](self->_status, "setVirtualAlignment:", v7);
  -[SCROBrailleDisplayStatus setMasterStatusCellIndex:](self->_status, "setMasterStatusCellIndex:", v5);
  -[SCROBrailleDisplayStatus virtualData](self->_status, "virtualData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    brailleLine = self->_brailleLine;
    -[SCROBrailleDisplayStatus virtualData](self->_status, "virtualData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleLine setVirtualStatus:alignment:](brailleLine, "setVirtualStatus:alignment:", v10, -[SCROBrailleDisplayStatus virtualAlignment](self->_status, "virtualAlignment"));

  }
  -[SCROBrailleLine setMasterStatusCellIndex:](self->_brailleLine, "setMasterStatusCellIndex:", -[SCROBrailleDisplayStatus masterStatusCellIndex](self->_status, "masterStatusCellIndex"));
  -[NSLock unlock](self->_contentLock, "unlock");
  -[SCROBrailleDisplay _updateDisplay](self, "_updateDisplay");

}

- (void)_setBatchUpdates:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (self->_shouldBatchUpdates != v5)
  {
    self->_shouldBatchUpdates = v5;
    if ((v5 & 1) == 0 && self->_needsUpdating)
      -[SCROBrailleDisplay _updateDisplay](self, "_updateDisplay");
  }
}

- (void)_updateDisplay
{
  SCROBrailleLine *v3;
  _BOOL4 v4;
  id WeakRetained;
  id v6;

  if (self->_shouldBatchUpdates)
  {
    if (!self->_needsPanUpdating)
    {
      self->_needsUpdating = 1;
      return;
    }
  }
  else
  {
    self->_needsUpdating = 0;
  }
  self->_needsPanUpdating = 0;
  -[NSLock lock](self->_contentLock, "lock");
  v3 = self->_brailleLine;
  v4 = -[SCROBrailleLine display](v3, "display");
  if (v4 && self->_delegateWantsDisplayCallback)
  {
    v6 = -[SCROBrailleLine newLineDescriptor](v3, "newLineDescriptor");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    WeakRetained = 0;
    v6 = 0;
  }

  -[NSLock unlock](self->_contentLock, "unlock");
  if (v4 && self->_delegateWantsDisplayCallback)
    objc_msgSend(WeakRetained, "brailleDisplay:didDisplay:", self, v6);

}

- (void)_configurationChangeHandler
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int64_t v8;
  int64_t v9;
  _BOOL4 v10;
  NSString *driverModelIdentifier;
  NSString *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t statusSize;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  SCROBrailleLine *brailleLine;
  void *v26;
  SCROBrailleLine *v27;
  void *v28;
  id WeakRetained;
  id obj;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  -[NSLock lock](self->_contentLock, "lock");
  v4 = -[SCROBrailleDriverProtocol mainSize](self->_brailleDriver, "mainSize");
  v5 = -[SCROBrailleDriverProtocol statusSize](self->_brailleDriver, "statusSize");
  -[SCROBrailleDriverProtocol modelIdentifier](self->_brailleDriver, "modelIdentifier");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[SCROBrailleDriverProtocol postsKeyboardEvents](self->_brailleDriver, "postsKeyboardEvents");
  v7 = -[SCROBrailleDriverProtocol brailleInputMode](self->_brailleDriver, "brailleInputMode");
  v8 = v4 & ~(v4 >> 63);
  v9 = v5 & ~(v5 >> 63);
  v10 = __PAIR128__(v9, v8) != *(_OWORD *)&self->_mainSize
     || !objc_msgSend(obj, "isEqual:", self->_driverModelIdentifier)
     || self->_postsKeyboardEvents != v6
     || v7 != self->_brailleInputMode;
  driverModelIdentifier = self->_driverModelIdentifier;
  self->_mainSize = v8;
  self->_statusSize = v9;
  v12 = driverModelIdentifier;
  objc_storeStrong((id *)&self->_driverModelIdentifier, obj);
  self->_postsKeyboardEvents = v6;
  self->_brailleInputMode = v7;
  if (v10)
  {
    -[SCROBrailleDisplayStatus aggregatedData](self->_status, "aggregatedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    -[SCROBrailleDisplayStatus realData](self->_status, "realData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleDisplayStatus virtualData](self->_status, "virtualData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    statusSize = self->_statusSize;
    -[SCROBrailleDisplayStatus aggregatedData](self->_status, "aggregatedData");
    if (v14 <= statusSize)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayStatus setRealData:](self->_status, "setRealData:", v24);

      -[SCROBrailleDisplayStatus setVirtualData:](self->_status, "setVirtualData:", v3);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "subdataWithRange:", 0, statusSize);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayStatus setRealData:](self->_status, "setRealData:", v19);

      v20 = self->_statusSize;
      -[SCROBrailleDisplayStatus aggregatedData](self->_status, "aggregatedData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "subdataWithRange:", v20, v14 - v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCROBrailleDisplayStatus setVirtualData:](self->_status, "setVirtualData:", v22);

    }
    -[SCROBrailleLine setMainSize:](self->_brailleLine, "setMainSize:", self->_mainSize);
    -[SCROBrailleLine setStatusSize:](self->_brailleLine, "setStatusSize:", self->_statusSize);
    brailleLine = self->_brailleLine;
    -[SCROBrailleDisplayStatus realData](self->_status, "realData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleLine setRealStatus:](brailleLine, "setRealStatus:", v26);

    v27 = self->_brailleLine;
    -[SCROBrailleDisplayStatus virtualData](self->_status, "virtualData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROBrailleLine setVirtualStatus:alignment:](v27, "setVirtualStatus:alignment:", v28, -[SCROBrailleDisplayStatus virtualAlignment](self->_status, "virtualAlignment"));

    v23 = 1;
  }
  else
  {
    v23 = 0;
    v16 = 0;
    v15 = 0;
  }
  -[NSLock unlock](self->_contentLock, "unlock");
  if (v23)
  {
    -[SCROBrailleDisplay _updateDisplay](self, "_updateDisplay");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "configurationChangedForBrailleDisplay:", self);

  }
}

- (void)_singleLetterInputHandler:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[SCROBrailleLine setIsSingleLetterInputOn:](self->_brailleLine, "setIsSingleLetterInputOn:", v5);
}

- (void)_textSearchModeHandler:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[SCROBrailleLine setIsTextSearchModeOn:](self->_brailleLine, "setIsTextSearchModeOn:", v5);
}

- (void)_translateBrailleToClipboard
{
  id WeakRetained;
  id v4;

  -[SCROBrailleLine translatedBrailleForTableIdentifier:](self->_brailleLine, "translatedBrailleForTableIdentifier:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "brailleDisplay:copyStringToClipboard:", self, v4);

}

- (void)_setBrailleKeyDebounceTimeoutHandler:(double)a3
{
  self->_brailleKeyDebounceTimeout = a3;
}

- (BOOL)_currentChordShouldExecuteEvenDuringTyping
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  -[SCROBrailleDisplay brailleInputManager](self, "brailleInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SCROBrailleDisplay _newBrailleKeyForCurrentBrailleChord](self, "_newBrailleKeyForCurrentBrailleChord");
  objc_msgSend(v3, "commandForBrailleKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VOTEventCommandBrailleTranslate")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("VOTEventCommandDelete")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("VOTEventCommandReturn"));
  }

  return v6;
}

- (void)insertTypingString:(id)a3
{
  -[SCROBrailleLine insertBrailleStringAtCursor:modifiers:](self->_brailleLine, "insertBrailleStringAtCursor:modifiers:", a3, 0);
}

- (SCROBrailleLine)testingBrailleLine
{
  return self->_brailleLine;
}

- (void)_startEditingText
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "brailleDidStartEditingWithDisplay:", self);

}

- (void)_translateBrailleStringAndPostEvent
{
  -[SCROBrailleLine translate](self->_brailleLine, "translate");
}

- (BOOL)_inputPaused
{
  return self->_inputPaused && CFAbsoluteTimeGetCurrent() - self->_inputPausedTime < 2.0;
}

- (void)_pauseInput
{
  self->_inputPaused = 1;
  self->_inputPausedTime = CFAbsoluteTimeGetCurrent();
}

- (void)_unpauseInput
{
  self->_inputPaused = 0;
  self->_inputPausedTime = -3061152000.0;
}

- (void)_replaceRange:(_NSRange)a3 withString:(id)a4 cursor:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id WeakRetained;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  if ((SCROCustomBrailleEnabled() & 1) == 0 && (SCROJapaneseBrailleSelected() & 1) == 0)
    -[SCROBrailleDisplay _pauseInput](self, "_pauseInput");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "brailleDisplay:didReplaceRange:withString:cursor:", self, location, length, v9, a5);

}

- (void)_processKeyEvents:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *keyEventsQueue;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  uint64_t v10;
  SCROBrailleDisplayInput **p_input;
  void *v12;
  uint64_t v13;
  SCROBrailleDisplay *v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __CFSet *v18;
  SCROBrailleDisplay *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  const __CFArray *v23;
  CFIndex Count;
  void *v25;
  CFIndex FirstIndexOfValue;
  __CFArray *v27;
  __CFSet *v28;
  SCROBrailleDisplay *v29;
  id v30;
  unsigned int v31;
  unsigned int v32;
  const __CFArray *v33;
  CFIndex v34;
  void *v35;
  CFIndex v36;
  BOOL v37;
  id v38;
  unsigned int v39;
  id v40;
  const __CFArray *v41;
  CFIndex v42;
  void *v43;
  CFIndex v44;
  SCROBrailleDisplayInput *v45;
  unsigned int v46;
  int v47;
  unsigned int v48;
  SCROBrailleDisplay *v49;
  unsigned int v50;
  SCROBrailleDisplayInput *input;
  unsigned int v52;
  id v53;
  SCROBrailleLine *v54;
  unsigned int v55;
  id v56;
  BOOL v57;
  __CFArray *v58;
  const __CFArray *v59;
  CFIndex v60;
  void *v61;
  CFIndex v62;
  _BOOL4 v63;
  _BOOL4 v64;
  id v65;
  id WeakRetained;
  SCROBrailleDisplay *v67;
  id v68;
  id v69;
  id v70;
  SCROBrailleDisplay *v71;
  id v72;
  id v73;
  BOOL v74;
  uint64_t v75;
  SCROBrailleDisplay *v76;
  void (**v77)(_QWORD);
  SCROBrailleDisplay *v78;
  void (**v79)(_QWORD);
  SCROBrailleKey *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  SCROBrailleKey *v84;
  SCROBrailleDisplayInput *v85;
  unsigned int v86;
  int v87;
  double Current;
  double v89;
  int v90;
  id v91;
  id v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  void *v103;
  int v104;
  id *location;
  char v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  void *v111;
  id v112;
  id v113;
  SCROBrailleDisplay *v114;
  void *v115;
  void *v116;
  _QWORD v117[4];
  SCROBrailleDisplay *v118;
  uint64_t *v119;
  BOOL v120;
  _QWORD v121[4];
  SCROBrailleDisplay *v122;
  id *v123;
  uint64_t *v124;
  BOOL v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t);
  void (*v130)(uint64_t);
  id v131;
  id v132;
  id *v133;
  uint64_t v134;
  char v135;
  CFRange v136;
  CFRange v137;
  CFRange v138;
  CFRange v139;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  keyEventsQueue = self->_keyEventsQueue;
  if (!keyEventsQueue)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_keyEventsQueue;
    self->_keyEventsQueue = v7;

    keyEventsQueue = self->_keyEventsQueue;
  }
  v103 = v4;
  -[NSMutableArray addObjectsFromArray:](keyEventsQueue, "addObjectsFromArray:", v4);
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSMutableArray count](self->_keyEventsQueue, "count"))
  {
    v106 = 0;
    goto LABEL_162;
  }
  v106 = 0;
  v10 = 0;
  p_input = &self->_input;
  v93 = *MEMORY[0x24BE0FCA8];
  v94 = *MEMORY[0x24BE0FC88];
  v95 = *MEMORY[0x24BE0FC90];
  v96 = *MEMORY[0x24BE0FCA0];
  v100 = ~*MEMORY[0x24BE0FCA0];
  v101 = ~*MEMORY[0x24BE0FCA8];
  v99 = ~*MEMORY[0x24BE0FC90];
  v98 = ~*MEMORY[0x24BE0FC88];
  v104 = *MEMORY[0x24BE0FCB0];
  v97 = ~*MEMORY[0x24BE0FCB0];
  location = (id *)&self->_delegate;
  v102 = *MEMORY[0x24BE0FC98];
  v111 = v9;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_keyEventsQueue, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SCROBrailleDisplay _inputPaused](self, "_inputPaused"))
      break;
    objc_msgSend(v9, "addIndex:", v10);
    v13 = objc_msgSend(v12, "unsignedLongValue");
    if ((v13 & 0x10000) != 0)
    {
      switch(v13 & 0xF)
      {
        case 0:
        case 3:
          v107 = v5;
          v19 = self;
          v20 = v12;
          v21 = objc_msgSend(v20, "unsignedLongValue");
          -[SCROBrailleDisplayInput setNewDown:](self->_input, "setNewDown:", 1);
          if (!-[SCROBrailleDisplayInput currentChord](self->_input, "currentChord"))
            -[SCROBrailleDisplayInput setCurrentChord:](*p_input, "setCurrentChord:", CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]));
          -[SCROBrailleDisplayInput setRouterEvent:](*p_input, "setRouterEvent:", v21);
          v22 = v21 & 0xFFFF00FF;
          v23 = -[SCROBrailleDisplayInput currentChord](*p_input, "currentChord");
          Count = CFArrayGetCount(-[SCROBrailleDisplayInput currentChord](*p_input, "currentChord"));
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v136.location = 0;
          v136.length = Count;
          FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v23, v136, v25);

          if (FirstIndexOfValue < 0)
          {
            v27 = -[SCROBrailleDisplayInput currentChord](*p_input, "currentChord");
            CFArrayAppendValue(v27, (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v22));
          }
          CFSetSetValue(-[SCROBrailleDisplayInput downKeys](*p_input, "downKeys"), v20);

          v5 = v107;
          v9 = v111;
          break;
        case 2:
          v29 = self;
          v30 = v12;
          v31 = objc_msgSend(v30, "unsignedLongValue");
          switch(BYTE1(v31))
          {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
              v32 = v31;
              if (!-[SCROBrailleDisplayInput currentBrailleChordContainsSpacebar](*p_input, "currentBrailleChordContainsSpacebar")&& !-[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord"))
              {
                -[SCROBrailleDisplayInput setCurrentBrailleModifiers:](*p_input, "setCurrentBrailleModifiers:", -[SCROBrailleDisplayInput downBrailleModifiers](*p_input, "downBrailleModifiers"));
              }
              if (!-[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord"))
                -[SCROBrailleDisplayInput setCurrentBrailleChord:](*p_input, "setCurrentBrailleChord:", CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]));
              v108 = v5;
              if (-[SCROBrailleDisplayInput currentBrailleChordContainsSpacebar](*p_input, "currentBrailleChordContainsSpacebar")&& !CFArrayGetCount(-[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord")))
              {
                -[SCROBrailleDisplayInput setCurrentBrailleChordBeganWithSpacebar:](*p_input, "setCurrentBrailleChordBeganWithSpacebar:", 1);
              }
              v33 = -[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord");
              v34 = CFArrayGetCount(-[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord"));
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v32);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v137.location = 0;
              v137.length = v34;
              v36 = CFArrayGetFirstIndexOfValue(v33, v137, v35);

              if (v36 < 0)
                CFArrayAppendValue(-[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord"), v30);
              CFSetSetValue(-[SCROBrailleDisplayInput downBrailleDots](*p_input, "downBrailleDots"), v30);
              v5 = v108;
              if (!-[SCROBrailleDisplay isInputEightDot](v29, "isInputEightDot"))
              {
                v37 = -[SCROBrailleLine isSingleLetterInputOn](self->_brailleLine, "isSingleLetterInputOn");
                if ((v32 & 0xFE00) == 0x600 && !v37)
                  -[SCROBrailleDisplayInput setCurrentBrailleChordContainsNonSpacebarChordableKey:](*p_input, "setCurrentBrailleChordContainsNonSpacebarChordableKey:", 1);
              }
              break;
            case 8:
              if (!-[SCROBrailleDisplayInput currentBrailleChordContainsSpacebar](*p_input, "currentBrailleChordContainsSpacebar")&& !-[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord"))
              {
                -[SCROBrailleDisplayInput setCurrentBrailleModifiers:](*p_input, "setCurrentBrailleModifiers:", -[SCROBrailleDisplayInput downBrailleModifiers](*p_input, "downBrailleModifiers"));
              }
              -[SCROBrailleDisplayInput setSpacebarIsDown:](*p_input, "setSpacebarIsDown:", 1);
              -[SCROBrailleDisplayInput setCurrentBrailleChordContainsSpacebar:](*p_input, "setCurrentBrailleChordContainsSpacebar:", 1);
              break;
            case 9:
              v85 = *p_input;
              v86 = -[SCROBrailleDisplayInput currentBrailleModifiers](*p_input, "currentBrailleModifiers");
              v87 = v104;
              goto LABEL_146;
            case 0xA:
              v85 = *p_input;
              v86 = -[SCROBrailleDisplayInput currentBrailleModifiers](*p_input, "currentBrailleModifiers");
              v87 = v94;
              goto LABEL_146;
            case 0xB:
              v85 = *p_input;
              v86 = -[SCROBrailleDisplayInput currentBrailleModifiers](*p_input, "currentBrailleModifiers");
              v87 = v95;
              goto LABEL_146;
            case 0xC:
              v85 = *p_input;
              v86 = -[SCROBrailleDisplayInput currentBrailleModifiers](*p_input, "currentBrailleModifiers");
              v87 = v96;
              goto LABEL_146;
            case 0xD:
              v85 = *p_input;
              v86 = -[SCROBrailleDisplayInput currentBrailleModifiers](*p_input, "currentBrailleModifiers");
              v87 = v93;
LABEL_146:
              -[SCROBrailleDisplayInput setCurrentBrailleModifiers:](v85, "setCurrentBrailleModifiers:", v87 | v86);
              -[SCROBrailleDisplayInput setDownBrailleModifiers:](*p_input, "setDownBrailleModifiers:", -[SCROBrailleDisplayInput downBrailleModifiers](*p_input, "downBrailleModifiers") | v87);
              break;
            default:
              break;
          }
          Current = CFAbsoluteTimeGetCurrent();
          -[SCROBrailleDisplayInput lastBrailleChordTypingTime](self->_input, "lastBrailleChordTypingTime");
          if (Current - v89 <= self->_brailleKeyDebounceTimeout)
            v90 = !-[SCROBrailleDisplay _currentChordShouldExecuteEvenDuringTyping](v29, "_currentChordShouldExecuteEvenDuringTyping");
          else
            v90 = 0;
          if (!-[SCROBrailleDisplayInput skipBrailleKeyboardKeyTranslation](*p_input, "skipBrailleKeyboardKeyTranslation")&& ((v90 | !-[SCROBrailleDisplayInput currentBrailleChordContainsSpacebar](*p_input, "currentBrailleChordContainsSpacebar")) != 1|| -[SCROBrailleDisplayInput currentBrailleChordContainsNonSpacebarChordableKey](*p_input, "currentBrailleChordContainsNonSpacebarChordableKey"))&& -[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord"))
          {
            -[SCROBrailleDisplayInput setSkipBrailleKeyboardKeyTranslation:](*p_input, "setSkipBrailleKeyboardKeyTranslation:", 1);
          }

          v9 = v111;
          break;
        case 6:
          -[SCROBrailleDisplayInput setCurrentHIDCommand:](*p_input, "setCurrentHIDCommand:", objc_msgSend(v12, "unsignedLongValue"));
          break;
        default:
          v114 = self;
          v38 = v12;
          v39 = objc_msgSend(v38, "unsignedLongValue");
          -[SCROBrailleDisplayInput setNewDown:](self->_input, "setNewDown:", 1);
          if (!-[SCROBrailleDisplayInput currentChord](self->_input, "currentChord"))
            -[SCROBrailleDisplayInput setCurrentChord:](*p_input, "setCurrentChord:", CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]));
          v40 = v5;
          if (-[SCROBrailleDisplayInput currentBrailleChordContainsSpacebar](*p_input, "currentBrailleChordContainsSpacebar")&& !CFArrayGetCount(-[SCROBrailleDisplayInput currentChord](*p_input, "currentChord")))
          {
            -[SCROBrailleDisplayInput setCurrentBrailleChordBeganWithSpacebar:](*p_input, "setCurrentBrailleChordBeganWithSpacebar:", 1);
          }
          v41 = -[SCROBrailleDisplayInput currentChord](*p_input, "currentChord");
          v42 = CFArrayGetCount(-[SCROBrailleDisplayInput currentChord](*p_input, "currentChord"));
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v138.location = 0;
          v138.length = v42;
          v44 = CFArrayGetFirstIndexOfValue(v41, v138, v43);

          if (v44 < 0)
            CFArrayAppendValue(-[SCROBrailleDisplayInput currentChord](*p_input, "currentChord"), v38);
          CFSetSetValue(-[SCROBrailleDisplayInput downKeys](*p_input, "downKeys"), v38);

          v5 = v40;
          break;
      }
    }
    else
    {
      v14 = self;
      v15 = objc_msgSend(v12, "unsignedLongValue");
      v16 = v15;
      v17 = v15 | 0x10000u;
      if ((v15 & 0xF) == 2)
      {
        switch(BYTE1(v15))
        {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
            if (-[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord"))
            {
              v18 = -[SCROBrailleDisplayInput downBrailleDots](*p_input, "downBrailleDots");
              CFSetRemoveValue(v18, (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17));
            }
            if ((v16 & 0xFE00) == 0x600)
              -[SCROBrailleDisplayInput setCurrentBrailleChordContainsNonSpacebarChordableKey:](*p_input, "setCurrentBrailleChordContainsNonSpacebarChordableKey:", 0);
            break;
          case 8:
            -[SCROBrailleDisplayInput setSpacebarIsDown:](*p_input, "setSpacebarIsDown:", 0);
            if (-[SCROBrailleDisplayInput skipBrailleKeyboardKeyTranslation](*p_input, "skipBrailleKeyboardKeyTranslation")&& !-[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord"))
            {
              -[SCROBrailleDisplayInput setSkipBrailleKeyboardKeyTranslation:](*p_input, "setSkipBrailleKeyboardKeyTranslation:", 0);
              -[SCROBrailleDisplayInput setCurrentBrailleChordContainsSpacebar:](*p_input, "setCurrentBrailleChordContainsSpacebar:", 0);
              -[SCROBrailleDisplayInput setCurrentBrailleChordBeganWithSpacebar:](*p_input, "setCurrentBrailleChordBeganWithSpacebar:", 0);
            }
            break;
          case 9:
            v45 = *p_input;
            v46 = -[SCROBrailleDisplayInput downBrailleModifiers](*p_input, "downBrailleModifiers");
            v47 = v97;
            goto LABEL_50;
          case 0xA:
            v45 = *p_input;
            v46 = -[SCROBrailleDisplayInput downBrailleModifiers](*p_input, "downBrailleModifiers");
            v47 = v98;
            goto LABEL_50;
          case 0xB:
            v45 = *p_input;
            v46 = -[SCROBrailleDisplayInput downBrailleModifiers](*p_input, "downBrailleModifiers");
            v47 = v99;
            goto LABEL_50;
          case 0xC:
            v45 = *p_input;
            v46 = -[SCROBrailleDisplayInput downBrailleModifiers](*p_input, "downBrailleModifiers");
            v47 = v100;
            goto LABEL_50;
          case 0xD:
            v45 = *p_input;
            v46 = -[SCROBrailleDisplayInput downBrailleModifiers](*p_input, "downBrailleModifiers");
            v47 = v101;
LABEL_50:
            -[SCROBrailleDisplayInput setDownBrailleModifiers:](v45, "setDownBrailleModifiers:", v46 & v47);
            break;
          default:
            break;
        }
      }
      else if (-[SCROBrailleDisplayInput currentChord](*p_input, "currentChord"))
      {
        v28 = -[SCROBrailleDisplayInput downKeys](*p_input, "downKeys");
        CFSetRemoveValue(v28, (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17));
      }

    }
    if (-[SCROBrailleDisplayInput routerEvent](*p_input, "routerEvent")
      && !-[SCROBrailleDisplayInput prepareToMemorizeNextKey](*p_input, "prepareToMemorizeNextKey")
      || !CFSetGetCount(-[SCROBrailleDisplayInput downKeys](*p_input, "downKeys"))
      && -[SCROBrailleDisplayInput currentChord](*p_input, "currentChord"))
    {
      v115 = v12;
      v48 = -[SCROBrailleDisplayInput routerEvent](self->_input, "routerEvent");
      v49 = self;
      v112 = -[SCROBrailleDisplay _newBrailleKeyForCurrentKeyChord](v49, "_newBrailleKeyForCurrentKeyChord");
      v50 = -[SCROBrailleDisplayInput routerEvent](self->_input, "routerEvent");
      input = self->_input;
      if (v50)
      {
        v52 = -[SCROBrailleDisplayInput routerEvent](input, "routerEvent");
        v121[0] = BYTE1(v52);
        v117[0] = 0;
        if ((v52 & 0xF) != 0)
        {
          v53 = 0;
        }
        else
        {
          v109 = v5;
          v126 = 0;
          -[NSLock lock](self->_contentLock, "lock");
          v54 = self->_brailleLine;
          if (-[SCROBrailleLine getStatusRouterIndex:forRawIndex:](v54, "getStatusRouterIndex:forRawIndex:", &v126, v121[0]))
          {
            v53 = 0;
            v121[0] = v126 + self->_statusSize;
          }
          else
          {
            v132 = 0;
            -[SCROBrailleLine tokenForRouterIndex:location:appToken:](v54, "tokenForRouterIndex:location:appToken:", v121, v117, &v132);
            v53 = v132;
          }

          -[NSLock unlock](self->_contentLock, "unlock");
          v5 = v109;
        }
        objc_msgSend(v112, "setRouterIndex:token:location:appToken:");
        if (-[SCROBrailleDisplayInput currentChord](*p_input, "currentChord"))
        {
          v110 = v10;
          v55 = v48;
          v56 = v5;
          v57 = -[SCROBrailleDisplayInput prepareToMemorizeNextKey](*p_input, "prepareToMemorizeNextKey");
          v58 = -[SCROBrailleDisplayInput currentChord](*p_input, "currentChord");
          v59 = v58;
          if (v57)
          {
            CFRelease(v58);
            -[SCROBrailleDisplayInput setCurrentChord:](*p_input, "setCurrentChord:", 0);
            v5 = v56;
            v48 = v55;
            v10 = v110;
          }
          else
          {
            v60 = CFArrayGetCount(-[SCROBrailleDisplayInput currentChord](*p_input, "currentChord"));
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v52 & 0xFFFF00FF);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v139.location = 0;
            v139.length = v60;
            v62 = CFArrayGetFirstIndexOfValue(v59, v139, v61);

            v5 = v56;
            v48 = v55;
            v10 = v110;
            v9 = v111;
            if ((v62 & 0x8000000000000000) == 0)
              CFArrayRemoveValueAtIndex(-[SCROBrailleDisplayInput currentChord](*p_input, "currentChord"), v62);
          }
        }

      }
      else if (-[SCROBrailleDisplayInput currentChord](input, "currentChord"))
      {
        CFRelease(-[SCROBrailleDisplayInput currentChord](*p_input, "currentChord"));
        -[SCROBrailleDisplayInput setCurrentChord:](*p_input, "setCurrentChord:", 0);
      }
      v63 = -[SCROBrailleDisplay _hasPressedBrailleKeys](v49, "_hasPressedBrailleKeys");
      v64 = -[SCROBrailleDisplayInput newDown](*p_input, "newDown");
      if (!v64)
        goto LABEL_76;
      -[SCROBrailleDisplayInput setNewDown:](*p_input, "setNewDown:", 0);
      if (-[SCROBrailleDisplayInput memorizeNextKeyImmediately](*p_input, "memorizeNextKeyImmediately"))
      {
        if (v63)
        {
          -[SCROBrailleDisplayInput setRouterEvent:](*p_input, "setRouterEvent:", 0);
          v65 = 0;
LABEL_81:

          if (v65)
          {
            v12 = v115;
            if (!-[SCROBrailleLine wantsEdits](self->_brailleLine, "wantsEdits") && !v48
              || (-[SCROBrailleDisplayCommandDispatcherProtocol handleBrailleKeyEvent:](self->_commandDispatcher, "handleBrailleKeyEvent:", v65) & 1) == 0)
            {
              objc_msgSend(v5, "addObject:", v65);
            }
          }
          else
          {
            v106 |= v64;
            v12 = v115;
          }

          goto LABEL_88;
        }
        WeakRetained = objc_loadWeakRetained(location);
        objc_msgSend(WeakRetained, "brailleDisplay:memorizedKey:", v49, v112);

        -[SCROBrailleDisplayInput setRouterEvent:](*p_input, "setRouterEvent:", 0);
        v65 = 0;
LABEL_80:
        -[SCROBrailleDisplay _stopMemorization](v49, "_stopMemorization");
        goto LABEL_81;
      }
      if (!-[SCROBrailleDisplayInput willMemorizeNow](*p_input, "willMemorizeNow"))
        v65 = v112;
      else
LABEL_76:
        v65 = 0;
      -[SCROBrailleDisplayInput setRouterEvent:](*p_input, "setRouterEvent:", 0);
      if (v63)
        goto LABEL_81;
      goto LABEL_80;
    }
LABEL_88:
    if (!CFSetGetCount(-[SCROBrailleDisplayInput downBrailleDots](*p_input, "downBrailleDots"))
      && (-[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord")
       || (-[SCROBrailleDisplayInput currentBrailleChordContainsSpacebar](*p_input, "currentBrailleChordContainsSpacebar")|| -[SCROBrailleDisplayInput currentBrailleChordContainsNonSpacebarChordableKey](*p_input, "currentBrailleChordContainsNonSpacebarChordableKey"))&& !-[SCROBrailleDisplayInput spacebarIsDown](*p_input, "spacebarIsDown")))
    {
      v67 = self;
      if (-[SCROBrailleDisplayInput skipBrailleKeyboardKeyTranslation](self->_input, "skipBrailleKeyboardKeyTranslation"))
      {
        if (-[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord"))
        {
          v68 = -[SCROBrailleDisplay _newBrailleKeyForCurrentBrailleChord](v67, "_newBrailleKeyForCurrentBrailleChord");
          if (-[SCROBrailleDisplayInput memorizeNextKeyImmediately](*p_input, "memorizeNextKeyImmediately"))
          {
            if (!-[SCROBrailleDisplay _hasKeyChord](v67, "_hasKeyChord"))
            {
              v69 = objc_loadWeakRetained(location);
              objc_msgSend(v69, "brailleDisplay:memorizedKey:", v67, v68);

            }
LABEL_103:
            v70 = 0;
          }
          else
          {
            if (-[SCROBrailleDisplayInput willMemorizeNow](*p_input, "willMemorizeNow"))
              goto LABEL_103;
            v70 = v68;
          }

          -[SCROBrailleDisplayInput setCurrentBrailleModifiers:](*p_input, "setCurrentBrailleModifiers:", -[SCROBrailleDisplayInput downBrailleModifiers](*p_input, "downBrailleModifiers"));
          -[SCROBrailleDisplayInput setCurrentBrailleChord:](*p_input, "setCurrentBrailleChord:", 0);
        }
        else
        {
          v70 = 0;
        }
        if (!-[SCROBrailleDisplayInput spacebarIsDown](*p_input, "spacebarIsDown"))
        {
          -[SCROBrailleDisplayInput setSkipBrailleKeyboardKeyTranslation:](*p_input, "setSkipBrailleKeyboardKeyTranslation:", 0);
          -[SCROBrailleDisplayInput setCurrentBrailleChordContainsSpacebar:](*p_input, "setCurrentBrailleChordContainsSpacebar:", 0);
          -[SCROBrailleDisplayInput setCurrentBrailleChordBeganWithSpacebar:](*p_input, "setCurrentBrailleChordBeganWithSpacebar:", 0);
        }
      }
      else
      {
        v70 = 0;
      }
      if (!-[SCROBrailleDisplay _hasKeyChord](v67, "_hasKeyChord")
        && !-[SCROBrailleDisplay _hasPressedBrailleKeys](v67, "_hasPressedBrailleKeys"))
      {
        -[SCROBrailleDisplay _stopMemorization](v67, "_stopMemorization");
      }
      v116 = v12;

      if (v70
        && (!-[SCROBrailleLine wantsEdits](self->_brailleLine, "wantsEdits")
         && (SCROJapaneseBrailleSelected() & 1) == 0
         && !SCROCustomBrailleEnabled()
         || (-[SCROBrailleDisplayCommandDispatcherProtocol handleBrailleKeyEvent:](self->_commandDispatcher, "handleBrailleKeyEvent:", v70) & 1) == 0))
      {
        objc_msgSend(v5, "addObject:", v70);
        -[SCROBrailleDisplay _translateBrailleStringAndPostEvent](v67, "_translateBrailleStringAndPostEvent");
      }
      v71 = v67;
      v132 = 0;
      v133 = &v132;
      v134 = 0x2020000000;
      v135 = 0;
      v126 = 0;
      v127 = &v126;
      v128 = 0x3032000000;
      v129 = __Block_byref_object_copy_;
      v130 = __Block_byref_object_dispose_;
      v72 = v5;
      v131 = v72;
      v73 = v72;
      if (!-[SCROBrailleDisplayInput skipBrailleKeyboardKeyTranslation](*p_input, "skipBrailleKeyboardKeyTranslation"))
      {
        v113 = v70;
        v74 = -[SCROBrailleDisplay persistentKeyModifiers](v71, "persistentKeyModifiers") != v104
           && -[SCROBrailleDisplay persistentKeyModifiers](v71, "persistentKeyModifiers") != v102;
        v75 = MEMORY[0x24BDAC760];
        v121[0] = MEMORY[0x24BDAC760];
        v121[1] = 3221225472;
        v121[2] = ___appendBrailleKeysToArray_block_invoke;
        v121[3] = &unk_24CC1D3B0;
        v76 = v71;
        v122 = v76;
        v123 = &v132;
        v125 = v74;
        v124 = &v126;
        v77 = (void (**)(_QWORD))MEMORY[0x212BDDEB8](v121);
        v117[0] = v75;
        v117[1] = 3221225472;
        v117[2] = ___appendBrailleKeysToArray_block_invoke_805;
        v117[3] = &unk_24CC1D3D8;
        v78 = v76;
        v120 = v74;
        v118 = v78;
        v119 = &v126;
        v79 = (void (**)(_QWORD))MEMORY[0x212BDDEB8](v117);
        if (-[SCROBrailleDisplayInput currentBrailleChordBeganWithSpacebar](*p_input, "currentBrailleChordBeganWithSpacebar")&& -[SCROBrailleDisplayInput currentBrailleChord](*p_input, "currentBrailleChord"))
        {
          *((_BYTE *)v133 + 24) = 1;
          v77[2](v77);
          -[SCROBrailleDisplayInput setCurrentBrailleChordContainsSpacebar:](*p_input, "setCurrentBrailleChordContainsSpacebar:", 0);
          -[SCROBrailleDisplayInput setCurrentBrailleChordBeganWithSpacebar:](*p_input, "setCurrentBrailleChordBeganWithSpacebar:", 0);
        }
        else
        {
          v77[2](v77);
          v79[2](v79);
        }
        v73 = objc_retainAutorelease((id)v127[5]);
        -[SCROBrailleDisplayInput setCurrentBrailleChord:](*p_input, "setCurrentBrailleChord:", 0);
        -[SCROBrailleDisplayInput setCurrentBrailleModifiers:](*p_input, "setCurrentBrailleModifiers:", -[SCROBrailleDisplayInput downBrailleModifiers](*p_input, "downBrailleModifiers"));

        v70 = v113;
      }
      if (!-[SCROBrailleDisplay _hasKeyChord](v71, "_hasKeyChord")
        && !-[SCROBrailleDisplay _hasPressedBrailleKeys](v71, "_hasPressedBrailleKeys"))
      {
        -[SCROBrailleDisplay _stopMemorization](v71, "_stopMemorization");
      }
      _Block_object_dispose(&v126, 8);

      _Block_object_dispose(&v132, 8);
      v5 = v73;

      v9 = v111;
      v12 = v116;
    }
    if (-[SCROBrailleDisplayInput currentHIDCommand](*p_input, "currentHIDCommand"))
    {
      if (-[SCROBrailleDisplay _isMemorizingKeys](self, "_isMemorizingKeys"))
      {
        v80 = objc_alloc_init(SCROBrailleKey);
        -[SCROBrailleKey addKeyMask:](v80, "addKeyMask:", -[SCROBrailleDisplayInput currentHIDCommand](self->_input, "currentHIDCommand"));
        -[SCROBrailleKey setDisplayToken:](v80, "setDisplayToken:", -[SCROIOElementProtocol identifier](self->_ioElement, "identifier"));
        v81 = objc_loadWeakRetained(location);
        objc_msgSend(v81, "brailleDisplay:memorizedKey:", self, v80);

        -[SCROBrailleDisplay _stopMemorization](self, "_stopMemorization");
      }
      else
      {
        if (!v5)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        v82 = -[SCROBrailleDisplayInput currentHIDCommand](self->_input, "currentHIDCommand");
        v83 = -[SCROIOElementProtocol identifier](self->_ioElement, "identifier");
        v84 = objc_alloc_init(SCROBrailleKey);
        -[SCROBrailleKey addKeyMask:](v84, "addKeyMask:", v82);
        -[SCROBrailleKey setDisplayToken:](v84, "setDisplayToken:", v83);
        objc_msgSend(v5, "addObject:", v84);

        v5 = v5;
        -[SCROBrailleDisplayInput setCurrentHIDCommand:](self->_input, "setCurrentHIDCommand:", 0);
      }
    }

    if (++v10 >= (unint64_t)-[NSMutableArray count](self->_keyEventsQueue, "count"))
      goto LABEL_162;
  }

LABEL_162:
  if (objc_msgSend(v9, "count"))
  {
    v91 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v91, "brailleDisplayHadUserInteraction:", self);

  }
  -[NSMutableArray removeObjectsAtIndexes:](self->_keyEventsQueue, "removeObjectsAtIndexes:", v9);
  if ((objc_msgSend(v5, "count") != 0) | v106 & 1)
  {
    if (-[SCROBrailleLine hasEdits](self->_brailleLine, "hasEdits"))
      -[SCROBrailleDisplay _translateBrailleStringAndPostEvent](self, "_translateBrailleStringAndPostEvent");
    v92 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v92, "brailleDisplay:pressedKeys:", self, v5);

  }
}

- (void)_autoAdvancePanHandler:(id)a3
{
  _BOOL4 v4;
  const __CFString *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "type") == 19)
  {
    -[NSLock lock](self->_contentLock, "lock");
    v4 = -[SCROBrailleLine canPanRight](self->_brailleLine, "canPanRight");
    -[NSLock unlock](self->_contentLock, "unlock");
    v5 = CFSTR("@NO");
    if (v4)
      v5 = CFSTR("YES");
    NSLog(CFSTR("AUTOADVANCE: Pan Handler can pan: %@"), v5);
    if (v4 || !-[SCROBrailleLine displayMode](self->_brailleLine, "displayMode"))
      -[SCROBrailleDisplay _panHandler:](self, "_panHandler:", v6);
  }

}

- (void)_panHandler:(id)a3
{
  int v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "type");
  -[NSLock lock](self->_contentLock, "lock");
  switch(v4)
  {
    case 18:
      if (-[SCROBrailleLine panLeft](self->_brailleLine, "panLeft"))
        goto LABEL_9;
      goto LABEL_3;
    case 19:
      if (-[SCROBrailleLine panRight](self->_brailleLine, "panRight"))
        goto LABEL_9;
      goto LABEL_11;
    case 20:
      if (-[SCROBrailleLine panBeginning](self->_brailleLine, "panBeginning"))
        goto LABEL_9;
LABEL_3:
      -[SCROBrailleLine appToken](self->_brailleLine, "appToken");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = -[SCROBrailleLine firstToken](self->_brailleLine, "firstToken");
      goto LABEL_12;
    case 21:
      if (-[SCROBrailleLine panEnd](self->_brailleLine, "panEnd"))
      {
LABEL_9:
        v7 = 0;
        v8 = 0;
        v9 = 1;
      }
      else
      {
LABEL_11:
        -[SCROBrailleLine appToken](self->_brailleLine, "appToken");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = -[SCROBrailleLine lastToken](self->_brailleLine, "lastToken");
LABEL_12:
        v8 = v6;
        v9 = 0;
        v7 = (void *)v5;
      }
LABEL_13:
      -[NSLock unlock](self->_contentLock, "unlock");
      if ((_DWORD)v9)
      {
        self->_needsPanUpdating = 1;
        -[SCROBrailleDisplay _updateDisplay](self, "_updateDisplay");
      }
      if (!-[SCROBrailleDisplay inputAllowed](self, "inputAllowed"))
        goto LABEL_23;
      if (-[SCROBrailleLine hasEdits](self->_brailleLine, "hasEdits"))
        -[SCROBrailleDisplay _translateBrailleStringAndPostEvent](self, "_translateBrailleStringAndPostEvent");
      if (v4 == 19)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SCROBrailleDisplay lineOffset](self, "lineOffset"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "brailleDisplay:didPanRight:elementToken:appToken:lineOffset:", self, v11, v12, v7, v13);
      }
      else
      {
        if (v4 != 18)
          goto LABEL_23;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SCROBrailleDisplay lineOffset](self, "lineOffset"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "brailleDisplay:didPanLeft:elementToken:appToken:lineOffset:", self, v11, v12, v7, v13);
      }

LABEL_23:
      return;
    default:
      v7 = 0;
      v9 = 0;
      v8 = 0;
      goto LABEL_13;
  }
}

- (unint64_t)brailleLineGenerationID
{
  return -[SCROBrailleLine generationID](self->_brailleLine, "generationID");
}

- (int64_t)lineOffset
{
  return -[SCROBrailleLine lineOffset](self->_brailleLine, "lineOffset");
}

- (BOOL)_hasPressedBrailleKeys
{
  unsigned int v4;

  if (-[SCROBrailleDisplayInput currentBrailleChordContainsSpacebar](self->_input, "currentBrailleChordContainsSpacebar")|| -[SCROBrailleDisplayInput currentBrailleChord](self->_input, "currentBrailleChord"))
  {
    return 1;
  }
  v4 = -[SCROBrailleDisplayInput currentBrailleModifiers](self->_input, "currentBrailleModifiers");
  return v4 != *MEMORY[0x24BE0FC98];
}

- (BOOL)_isMemorizingKeys
{
  return -[SCROBrailleDisplayInput requestPrepareToMemorizeNextKey](self->_input, "requestPrepareToMemorizeNextKey")
      || -[SCROBrailleDisplayInput prepareToMemorizeNextKey](self->_input, "prepareToMemorizeNextKey")
      || -[SCROBrailleDisplayInput memorizeNextKeyImmediately](self->_input, "memorizeNextKeyImmediately")
      || -[SCROBrailleDisplayInput willMemorizeNow](self->_input, "willMemorizeNow");
}

- (void)_stopMemorization
{
  -[SCROBrailleDisplayInput setPrepareToMemorizeNextKey:](self->_input, "setPrepareToMemorizeNextKey:", 0);
  -[SCROBrailleDisplayInput setMemorizeNextKeyImmediately:](self->_input, "setMemorizeNextKeyImmediately:", 0);
  -[SCROBrailleDisplayInput setRequestPrepareToMemorizeNextKey:](self->_input, "setRequestPrepareToMemorizeNextKey:", 0);
  -[SCROBrailleDisplayInput setWillMemorizeNow:](self->_input, "setWillMemorizeNow:", 0);
}

- (BOOL)_hasKeyChord
{
  return -[SCROBrailleDisplayInput currentChord](self->_input, "currentChord") != 0;
}

- (BOOL)_hasBrailleChord
{
  _BOOL4 v3;

  v3 = -[SCROBrailleDisplayInput skipBrailleKeyboardKeyTranslation](self->_input, "skipBrailleKeyboardKeyTranslation");
  if (v3)
    LOBYTE(v3) = -[SCROBrailleDisplayInput currentBrailleChord](self->_input, "currentBrailleChord") != 0;
  return v3;
}

- (id)keyArrayForBrailleStringWithCurrentModifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v4 = a3;
  -[SCROBrailleDisplay isInputContracted](self, "isInputContracted");
  v5 = self->_persistentKeyModifiers | -[SCROBrailleDisplayInput currentBrailleModifiers](self->_input, "currentBrailleModifiers");
  -[SCROBrailleDisplay isInputEightDot](self, "isInputEightDot");
  v6 = BRLTModeForFlags();
  if (-[SCROBrailleLine isSingleLetterInputOn](self->_brailleLine, "isSingleLetterInputOn"))
    v7 = 2;
  else
    v7 = v6;
  if (!SCROCustomBrailleEnabled())
  {
    +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textForPrintBraille:language:mode:locations:", v4, 0, v7, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  +[SCROBrailleTranslationManager inputManager](SCROBrailleTranslationManager, "inputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textForPrintBraille:language:mode:locations:", v4, 0, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v9, "length") >= 2)
  {
    objc_msgSend(v9, "substringToIndex:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:

    v9 = (void *)v10;
  }
  v11 = -[SCROBrailleDisplay newBrailleKeyboardKeyForText:modifiers:](self, "newBrailleKeyboardKeyForText:modifiers:", v9, v5);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v11, 0);

  return v12;
}

- (id)brailleInputManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "brailleInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)handleCommandPanLeftForDispatcher:(id)a3
{
  void *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  SCROBrailleDisplay *v12;
  SCROBrailleDisplay *v13;
  double Current;
  double v15;
  double v16;
  double v17;
  double v18;
  SCROBrailleDisplayInput *input;
  id v20;

  v20 = a3;
  -[NSLock lock](self->_contentLock, "lock");
  if (-[SCROBrailleLine panLeft](self->_brailleLine, "panLeft"))
  {
    v4 = 0;
    v5 = 0;
    v6 = 1;
  }
  else
  {
    v7 = -[SCROBrailleLine firstToken](self->_brailleLine, "firstToken");
    -[SCROBrailleLine appToken](self->_brailleLine, "appToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v5 = v7;
  }
  -[NSLock unlock](self->_contentLock, "unlock");
  if ((_DWORD)v6)
  {
    self->_needsPanUpdating = 1;
    -[SCROBrailleDisplay _updateDisplay](self, "_updateDisplay");
  }
  else if (-[SCROBrailleLine hasEdits](self->_brailleLine, "hasEdits"))
  {
    -[SCROBrailleDisplay _translateBrailleStringAndPostEvent](self, "_translateBrailleStringAndPostEvent");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SCROBrailleDisplay lineOffset](self, "lineOffset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "brailleDisplay:didPanLeft:elementToken:appToken:lineOffset:", self, v9, v10, v4, v11);

  v12 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v12->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v12->_input, "setBrailleTranslationTimeout:", 1.0);
  v13 = v12;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v12->_input, "lastBrailleChordPosted");
  v16 = Current - v15;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v12->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v12->_input, "setBrailleCharExponentialMovingAverage:", v17 * 0.6 + v16 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v12->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v12->_input, "setBrailleTranslationTimeout:", fmin(v18 * 3.5, 10.0));
  input = v12->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandPanRightForDispatcher:(id)a3
{
  void *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  SCROBrailleDisplay *v12;
  SCROBrailleDisplay *v13;
  double Current;
  double v15;
  double v16;
  double v17;
  double v18;
  SCROBrailleDisplayInput *input;
  id v20;

  v20 = a3;
  -[NSLock lock](self->_contentLock, "lock");
  if (-[SCROBrailleLine panRight](self->_brailleLine, "panRight"))
  {
    v4 = 0;
    v5 = 0;
    v6 = 1;
  }
  else
  {
    v7 = -[SCROBrailleLine firstToken](self->_brailleLine, "firstToken");
    -[SCROBrailleLine appToken](self->_brailleLine, "appToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v5 = v7;
  }
  -[NSLock unlock](self->_contentLock, "unlock");
  if ((_DWORD)v6)
  {
    self->_needsPanUpdating = 1;
    -[SCROBrailleDisplay _updateDisplay](self, "_updateDisplay");
  }
  else if (-[SCROBrailleLine hasEdits](self->_brailleLine, "hasEdits"))
  {
    -[SCROBrailleDisplay _translateBrailleStringAndPostEvent](self, "_translateBrailleStringAndPostEvent");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SCROBrailleDisplay lineOffset](self, "lineOffset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "brailleDisplay:didPanRight:elementToken:appToken:lineOffset:", self, v9, v10, v4, v11);

  v12 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v12->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v12->_input, "setBrailleTranslationTimeout:", 1.0);
  v13 = v12;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v12->_input, "lastBrailleChordPosted");
  v16 = Current - v15;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v12->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v12->_input, "setBrailleCharExponentialMovingAverage:", v17 * 0.6 + v16 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v12->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v12->_input, "setBrailleTranslationTimeout:", fmin(v18 * 3.5, 10.0));
  input = v12->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandMoveLeftForDispatcher:(id)a3
{
  id WeakRetained;
  SCROBrailleDisplay *v5;
  double Current;
  double v7;
  double v8;
  double v9;
  double v10;
  SCROBrailleDisplayInput *input;
  SCROBrailleDisplay *v12;

  if (!-[SCROBrailleLine moveCursorLeft](self->_brailleLine, "moveCursorLeft", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "playBorderHitSoundForBrailleDisplay:", self);

  }
  v5 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v5->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v5->_input, "setBrailleTranslationTimeout:", 1.0);
  v12 = v5;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v5->_input, "lastBrailleChordPosted");
  v8 = Current - v7;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v5->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v5->_input, "setBrailleCharExponentialMovingAverage:", v9 * 0.6 + v8 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v5->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v5->_input, "setBrailleTranslationTimeout:", fmin(v10 * 3.5, 10.0));
  input = v5->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandMoveRightForDispatcher:(id)a3
{
  id WeakRetained;
  SCROBrailleDisplay *v5;
  double Current;
  double v7;
  double v8;
  double v9;
  double v10;
  SCROBrailleDisplayInput *input;
  SCROBrailleDisplay *v12;

  if (!-[SCROBrailleLine moveCursorRight](self->_brailleLine, "moveCursorRight", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "playBorderHitSoundForBrailleDisplay:", self);

  }
  v5 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v5->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v5->_input, "setBrailleTranslationTimeout:", 1.0);
  v12 = v5;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v5->_input, "lastBrailleChordPosted");
  v8 = Current - v7;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v5->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v5->_input, "setBrailleCharExponentialMovingAverage:", v9 * 0.6 + v8 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v5->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v5->_input, "setBrailleTranslationTimeout:", fmin(v10 * 3.5, 10.0));
  input = v5->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandRouterKeyEvent:(id)a3 forDispatcher:(id)a4
{
  id v5;
  int v6;
  id v7;
  BOOL v8;
  id WeakRetained;
  void *v10;
  SCROBrailleDisplay *v11;
  SCROBrailleDisplay *v12;
  double Current;
  double v14;
  double v15;
  double v16;
  double v17;
  SCROBrailleDisplayInput *input;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v22 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  v6 = objc_msgSend(v5, "getRouterIndex:token:location:appToken:", &v23, &v22, &v21, &v20);
  v7 = v20;
  if (!v6)
    goto LABEL_5;
  v19 = 0;
  v8 = -[SCROBrailleLine moveCursorToRouterIndex:forwardToScreenReader:updateRouterLocation:](self->_brailleLine, "moveCursorToRouterIndex:forwardToScreenReader:updateRouterLocation:", v23, &v19, &v21);
  if (v19)
  {
    objc_msgSend(v5, "setRouterIndex:token:location:appToken:", v23, v22, v21, v7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v24[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "brailleDisplay:pressedKeys:", self, v10);

LABEL_6:
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_5:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "playCommandNotSupportedSoundForBrailleDisplay:", self);
    goto LABEL_6;
  }
LABEL_7:
  v11 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v11->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v11->_input, "setBrailleTranslationTimeout:", 1.0);
  v12 = v11;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v11->_input, "lastBrailleChordPosted");
  v15 = Current - v14;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v11->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v11->_input, "setBrailleCharExponentialMovingAverage:", v16 * 0.6 + v15 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v11->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v11->_input, "setBrailleTranslationTimeout:", fmin(v17 * 3.5, 10.0));
  input = v11->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandDeleteKeyEvent:(id)a3 forDispatcher:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  SCROBrailleDisplay *v8;
  SCROBrailleDisplay *v9;
  double Current;
  double v11;
  double v12;
  double v13;
  double v14;
  SCROBrailleDisplayInput *input;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[SCROBrailleLine deleteAtCursor](self->_brailleLine, "deleteAtCursor"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "brailleDisplay:pressedKeys:", self, v7);

  }
  v8 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v8->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v8->_input, "setBrailleTranslationTimeout:", 1.0);
  v9 = v8;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v8->_input, "lastBrailleChordPosted");
  v12 = Current - v11;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v8->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v8->_input, "setBrailleCharExponentialMovingAverage:", v13 * 0.6 + v12 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v8->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v8->_input, "setBrailleTranslationTimeout:", fmin(v14 * 3.5, 10.0));
  input = v8->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandForwardDeleteKeyEvent:(id)a3 forDispatcher:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  SCROBrailleDisplay *v8;
  SCROBrailleDisplay *v9;
  double Current;
  double v11;
  double v12;
  double v13;
  double v14;
  SCROBrailleDisplayInput *input;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[SCROBrailleLine forwardDeleteAtCursor](self->_brailleLine, "forwardDeleteAtCursor"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "brailleDisplay:pressedKeys:", self, v7);

  }
  v8 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v8->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v8->_input, "setBrailleTranslationTimeout:", 1.0);
  v9 = v8;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v8->_input, "lastBrailleChordPosted");
  v12 = Current - v11;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v8->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v8->_input, "setBrailleCharExponentialMovingAverage:", v13 * 0.6 + v12 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v8->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v8->_input, "setBrailleTranslationTimeout:", fmin(v14 * 3.5, 10.0));
  input = v8->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandEscapeKeyEvent:(id)a3 forDispatcher:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *WeakRetained;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  SCROBrailleDisplay *v16;
  SCROBrailleDisplay *v17;
  double Current;
  double v19;
  double v20;
  double v21;
  double v22;
  SCROBrailleDisplayInput *input;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!SCROCustomBrailleEnabled())
  {
    if (SCROJapaneseBrailleSelected())
    {
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isCandidateSelectionActive"))
      {

LABEL_10:
        objc_msgSend(MEMORY[0x24BE0FC50], "manager");
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "escapeCommand");
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BE0FC50], "manager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayedBraille");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isStageEmpty");

      if ((v14 & 1) == 0)
        goto LABEL_10;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v24 = v5;
    v9 = (void *)MEMORY[0x24BDBCE30];
    v10 = &v24;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "handleEscape");

  if ((v7 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v25[0] = v5;
    v9 = (void *)MEMORY[0x24BDBCE30];
    v10 = (id *)v25;
LABEL_9:
    objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "brailleDisplay:pressedKeys:", self, v15);

LABEL_11:
  }
  v16 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v16->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v16->_input, "setBrailleTranslationTimeout:", 1.0);
  v17 = v16;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v16->_input, "lastBrailleChordPosted");
  v20 = Current - v19;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v16->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v16->_input, "setBrailleCharExponentialMovingAverage:", v21 * 0.6 + v20 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v16->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v16->_input, "setBrailleTranslationTimeout:", fmin(v22 * 3.5, 10.0));
  input = v16->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandReturnBrailleEvent:(id)a3 forDispatcher:(id)a4
{
  id v5;
  void *v6;
  char v7;
  id WeakRetained;
  void *v9;
  id *v10;
  void *v11;
  char v12;
  void *v13;
  SCROBrailleDisplay *v14;
  SCROBrailleDisplay *v15;
  double Current;
  double v17;
  double v18;
  double v19;
  double v20;
  SCROBrailleDisplayInput *input;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "handleReturn");

    if ((v7 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v23[0] = v5;
      v9 = (void *)MEMORY[0x24BDBCE30];
      v10 = (id *)v23;
LABEL_8:
      objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "brailleDisplay:pressedKeys:", self, v13);

    }
  }
  else if (!SCROJapaneseBrailleSelected()
         || (objc_msgSend(MEMORY[0x24BE0FC50], "manager"),
             v11 = (void *)objc_claimAutoreleasedReturnValue(),
             v12 = objc_msgSend(v11, "returnCommand"),
             v11,
             (v12 & 1) == 0))
  {
    -[SCROBrailleDisplay _translateBrailleStringAndPostEvent](self, "_translateBrailleStringAndPostEvent");
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v22 = v5;
      v9 = (void *)MEMORY[0x24BDBCE30];
      v10 = &v22;
      goto LABEL_8;
    }
  }
  v14 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v14->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v14->_input, "setBrailleTranslationTimeout:", 1.0);
  v15 = v14;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v14->_input, "lastBrailleChordPosted");
  v18 = Current - v17;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v14->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v14->_input, "setBrailleCharExponentialMovingAverage:", v19 * 0.6 + v18 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v14->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v14->_input, "setBrailleTranslationTimeout:", fmin(v20 * 3.5, 10.0));
  input = v14->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandWordDescriptionEvent:(id)a3 forDispatcher:(id)a4
{
  void *v5;
  SCROBrailleDisplay *v6;
  double Current;
  double v8;
  double v9;
  double v10;
  double v11;
  SCROBrailleDisplayInput *input;
  SCROBrailleDisplay *v13;

  if (SCROJapaneseBrailleSelected())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleWordDescriptionCommand");

  }
  v6 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v6->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v6->_input, "setBrailleTranslationTimeout:", 1.0);
  v13 = v6;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v6->_input, "lastBrailleChordPosted");
  v9 = Current - v8;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v6->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v6->_input, "setBrailleCharExponentialMovingAverage:", v10 * 0.6 + v9 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v6->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v6->_input, "setBrailleTranslationTimeout:", fmin(v11 * 3.5, 10.0));
  input = v6->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandTranslateForDispatcher:(id)a3
{
  SCROBrailleDisplay *v4;
  double Current;
  double v6;
  double v7;
  double v8;
  double v9;
  SCROBrailleDisplayInput *input;
  SCROBrailleDisplay *v11;

  -[SCROBrailleDisplay _translateBrailleStringAndPostEvent](self, "_translateBrailleStringAndPostEvent", a3);
  v4 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v4->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v4->_input, "setBrailleTranslationTimeout:", 1.0);
  v11 = v4;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v4->_input, "lastBrailleChordPosted");
  v7 = Current - v6;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v4->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v4->_input, "setBrailleCharExponentialMovingAverage:", v8 * 0.6 + v7 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v4->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v4->_input, "setBrailleTranslationTimeout:", fmin(v9 * 3.5, 10.0));
  input = v4->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandToggleContractedBrailleEvent:(id)a3 forDispatcher:(id)a4
{
  __CFArray *Mutable;
  __CFArray *v6;
  id WeakRetained;
  SCROBrailleDisplay *v8;
  SCROBrailleDisplay *v9;
  double Current;
  double v11;
  double v12;
  double v13;
  double v14;
  SCROBrailleDisplayInput *input;
  id value;

  value = a3;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    v6 = Mutable;
    CFArrayAppendValue(Mutable, value);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "brailleDisplay:pressedKeys:", self, v6);

    CFRelease(v6);
  }
  v8 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v8->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v8->_input, "setBrailleTranslationTimeout:", 1.0);
  v9 = v8;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v8->_input, "lastBrailleChordPosted");
  v12 = Current - v11;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v8->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v8->_input, "setBrailleCharExponentialMovingAverage:", v13 * 0.6 + v12 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v8->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v8->_input, "setBrailleTranslationTimeout:", fmin(v14 * 3.5, 10.0));
  input = v8->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleCommandToggleEightDotBrailleEvent:(id)a3 forDispatcher:(id)a4
{
  __CFArray *Mutable;
  __CFArray *v6;
  id WeakRetained;
  SCROBrailleDisplay *v8;
  SCROBrailleDisplay *v9;
  double Current;
  double v11;
  double v12;
  double v13;
  double v14;
  SCROBrailleDisplayInput *input;
  id value;

  value = a3;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    v6 = Mutable;
    CFArrayAppendValue(Mutable, value);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "brailleDisplay:pressedKeys:", self, v6);

    CFRelease(v6);
  }
  v8 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v8->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v8->_input, "setBrailleTranslationTimeout:", 1.0);
  v9 = v8;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v8->_input, "lastBrailleChordPosted");
  v12 = Current - v11;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v8->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v8->_input, "setBrailleCharExponentialMovingAverage:", v13 * 0.6 + v12 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v8->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v8->_input, "setBrailleTranslationTimeout:", fmin(v14 * 3.5, 10.0));
  input = v8->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (void)handleUnsupportedKeyEvent:(id)a3 forDispatcher:(id)a4
{
  SCROBrailleDisplay *v4;
  double Current;
  double v6;
  double v7;
  double v8;
  double v9;
  SCROBrailleDisplayInput *input;
  SCROBrailleDisplay *v11;

  v4 = self;
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v4->_input, "setBrailleCharExponentialMovingAverage:", 1.0);
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v4->_input, "setBrailleTranslationTimeout:", 1.0);
  v11 = v4;
  Current = CFAbsoluteTimeGetCurrent();
  -[SCROBrailleDisplayInput lastBrailleChordPosted](v4->_input, "lastBrailleChordPosted");
  v7 = Current - v6;
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v4->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleCharExponentialMovingAverage:](v4->_input, "setBrailleCharExponentialMovingAverage:", v8 * 0.6 + v7 * 0.4);
  -[SCROBrailleDisplayInput brailleCharExponentialMovingAverage](v4->_input, "brailleCharExponentialMovingAverage");
  -[SCROBrailleDisplayInput setBrailleTranslationTimeout:](v4->_input, "setBrailleTranslationTimeout:", fmin(v9 * 3.5, 10.0));
  input = v4->_input;

  -[SCROBrailleDisplayInput setLastBrailleChordPosted:](input, "setLastBrailleChordPosted:", Current);
}

- (id)_newBrailleKeyForCurrentBrailleChord
{
  SCROBrailleKey *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SCROBrailleKey);
  -[SCROBrailleKey setDisplayToken:](v3, "setDisplayToken:", -[SCROIOElementProtocol identifier](self->_ioElement, "identifier"));
  -[SCROBrailleKey setDisplayMode:](v3, "setDisplayMode:", -[SCROBrailleLine displayMode](self->_brailleLine, "displayMode"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SCROBrailleDisplayInput currentBrailleChord](self->_input, "currentBrailleChord", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[SCROBrailleKey addKeyMask:](v3, "addKeyMask:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "unsignedIntValue"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  if (-[SCROBrailleDisplayInput currentBrailleChordContainsSpacebar](self->_input, "currentBrailleChordContainsSpacebar"))
  {
    -[SCROBrailleKey addSpacebarKeyMask](v3, "addSpacebarKeyMask");
  }
  -[SCROBrailleKey addModifierMask:](v3, "addModifierMask:", -[SCROBrailleDisplayInput currentBrailleModifiers](self->_input, "currentBrailleModifiers"));
  return v3;
}

- (id)_newBrailleKeyForCurrentKeyChord
{
  SCROBrailleKey *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  unsigned int v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SCROBrailleKey);
  -[SCROBrailleKey setDisplayToken:](v3, "setDisplayToken:", -[SCROIOElementProtocol identifier](self->_ioElement, "identifier"));
  -[SCROBrailleKey setDisplayMode:](v3, "setDisplayMode:", -[SCROBrailleLine displayMode](self->_brailleLine, "displayMode"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SCROBrailleDisplayInput currentChord](self->_input, "currentChord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "unsignedIntValue");
        if ((v9 & 0xF) != 0 && (v9 & 0xF) != 3)
          -[SCROBrailleKey addKeyMask:](v3, "addKeyMask:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if (-[SCROBrailleDisplayInput routerEvent](self->_input, "routerEvent"))
  {
    v11 = -[SCROBrailleDisplayInput routerEvent](self->_input, "routerEvent");
    if ((v11 & 0xF) == 0)
    {
      v13 = 0;
      -[NSLock lock](self->_contentLock, "lock");
      if (-[SCROBrailleLine getStatusRouterIndex:forRawIndex:](self->_brailleLine, "getStatusRouterIndex:forRawIndex:", &v13, BYTE1(v11)))
      {
        v11 = v11 & 0xFFFFFFF0 | 3;
      }
      -[NSLock unlock](self->_contentLock, "unlock");
    }
    -[SCROBrailleKey addKeyMask:](v3, "addKeyMask:", v11 & 0xFFFF00FF);
  }
  return v3;
}

- (id)newBrailleKeyboardKeyForText:(id)a3 modifiers:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SCROBrailleKeyboardKey *v7;
  __CFString *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int16 v15;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(SCROBrailleKeyboardKey);
  -[SCROBrailleKey setDisplayToken:](v7, "setDisplayToken:", -[SCROIOElementProtocol identifier](self->_ioElement, "identifier"));
  -[SCROBrailleKey setDisplayMode:](v7, "setDisplayMode:", -[SCROBrailleLine displayMode](self->_brailleLine, "displayMode"));
  -[SCROBrailleKeyboardKey setKeyString:](v7, "setKeyString:", v6);
  -[SCROBrailleKeyboardKey setModifiers:](v7, "setModifiers:", v4);
  if (objc_msgSend(v6, "length") == 1 && *MEMORY[0x24BE0FC98] != (_DWORD)v4)
  {
    v8 = (__CFString *)objc_msgSend(v6, "mutableCopy");
    CFStringTransform(v8, 0, (CFStringRef)*MEMORY[0x24BDBD670], 0);
    CFStringTransform(v8, 0, (CFStringRef)*MEMORY[0x24BDBD660], 0);
    if (-[__CFString length](v8, "length"))
    {
      -[__CFString lowercaseString](v8, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "characterAtIndex:", 0);

      v15 = v10;
      if ((v10 - 97) > 0x19)
      {
        if ((v10 - 49) > 8)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v15, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(&unk_24CC31740, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            -[SCROBrailleKeyboardKey setKeyCode:](v7, "setKeyCode:", objc_msgSend(v13, "unsignedIntegerValue"));

          goto LABEL_12;
        }
        v11 = (v10 - 19);
      }
      else
      {
        v11 = (v10 - 93);
      }
      -[SCROBrailleKeyboardKey setKeyCode:](v7, "setKeyCode:", v11);
    }
LABEL_12:

  }
  return v7;
}

- (void)brailleDriverDidReceiveInput
{
  __CFRunLoop *runLoop;
  const void *v4;
  _QWORD block[5];

  runLoop = self->_runLoop;
  v4 = (const void *)*MEMORY[0x24BDBD5A0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SCROBrailleDisplay_brailleDriverDidReceiveInput__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = self;
  CFRunLoopPerformBlock(runLoop, v4, block);
  CFRunLoopWakeUp(self->_runLoop);
}

uint64_t __50__SCROBrailleDisplay_brailleDriverDidReceiveInput__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inputEventHandler");
}

- (void)_inputEventHandler
{
  double Current;
  unsigned int v4;
  double v5;
  __CFRunLoopTimer *inputEventTimer;
  CFAbsoluteTime v7;
  BOOL v8;
  SCROBrailleDisplayInput *input;
  _BOOL4 v10;
  SCROBrailleDisplayInput *v11;
  double v12;
  __CFRunLoopTimer *v13;
  CFAbsoluteTime v14;
  double v15;
  double v16;
  double v17;
  SCROBrailleDisplayInput *v18;
  id v19;
  _BOOL4 v20;
  double v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  int v27;
  __CFArray *v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id WeakRetained;
  id v34;

  -[NSLock lock](self->_contentLock, "lock");
  -[SCROBrailleDriverProtocol getInputEvents](self->_brailleDriver, "getInputEvents");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_contentLock, "unlock");
  if (objc_msgSend(v34, "count"))
    -[SCROBrailleDisplay _processKeyEvents:](self, "_processKeyEvents:", v34);
  Current = CFAbsoluteTimeGetCurrent();
  if (!-[SCROBrailleDisplayInput currentChord](self->_input, "currentChord")
    && !-[SCROBrailleDisplayInput currentBrailleChord](self->_input, "currentBrailleChord")
    && !-[SCROBrailleDisplayInput currentBrailleChordContainsSpacebar](self->_input, "currentBrailleChordContainsSpacebar"))
  {
    v4 = -[SCROBrailleDisplayInput currentBrailleModifiers](self->_input, "currentBrailleModifiers");
    if (v4 == *MEMORY[0x24BE0FC98])
    {
      -[SCROBrailleDisplayInput quietSince](self->_input, "quietSince");
      if (Current - v5 < 2.0
        || -[SCROBrailleDisplayInput memorizeNextKeyImmediately](self->_input, "memorizeNextKeyImmediately"))
      {
        inputEventTimer = self->_inputEventTimer;
        v7 = CFAbsoluteTimeGetCurrent();
        CFRunLoopTimerSetNextFireDate(inputEventTimer, v7 + 0.01);
      }
      v8 = -[SCROBrailleDisplayInput isQuiet](self->_input, "isQuiet");
      input = self->_input;
      if (!v8)
      {
        -[SCROBrailleDisplayInput setQuietSince:](input, "setQuietSince:", Current);
        input = self->_input;
      }
      -[SCROBrailleDisplayInput setIsQuiet:](input, "setIsQuiet:", 1);
      v10 = -[SCROBrailleDisplayInput memorizeNextKeyImmediately](self->_input, "memorizeNextKeyImmediately");
      v11 = self->_input;
      if (v10)
      {
        -[SCROBrailleDisplayInput memorizeNextKeyImmediatelyTimeout](v11, "memorizeNextKeyImmediatelyTimeout");
        if (Current > v12)
          -[SCROBrailleDisplayInput setMemorizeNextKeyImmediately:](self->_input, "setMemorizeNextKeyImmediately:", 0);
      }
      else if (-[SCROBrailleDisplayInput requestPrepareToMemorizeNextKey](v11, "requestPrepareToMemorizeNextKey"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "brailleDisplay:memorizedKey:", self, 0);

        -[SCROBrailleDisplayInput setPrepareToMemorizeNextKey:](self->_input, "setPrepareToMemorizeNextKey:", 1);
        -[SCROBrailleDisplayInput setRequestPrepareToMemorizeNextKey:](self->_input, "setRequestPrepareToMemorizeNextKey:", 0);
      }
      goto LABEL_43;
    }
  }
  v13 = self->_inputEventTimer;
  v14 = CFAbsoluteTimeGetCurrent();
  CFRunLoopTimerSetNextFireDate(v13, v14 + 0.01);
  if (-[SCROBrailleDisplayInput isQuiet](self->_input, "isQuiet"))
    -[SCROBrailleDisplayInput setBusySince:](self->_input, "setBusySince:", Current);
  -[SCROBrailleDisplayInput setIsQuiet:](self->_input, "setIsQuiet:", 0);
  if (-[SCROBrailleDisplayInput prepareToMemorizeNextKey](self->_input, "prepareToMemorizeNextKey"))
    v15 = *(double *)&kSCROBrailleInputMemorizeHoldInterval;
  else
    v15 = 60.0;
  -[SCROBrailleDisplayInput busySince](self->_input, "busySince");
  v17 = Current - v16;
  v18 = self->_input;
  if (Current - v16 > v15)
  {
    CFSetRemoveAllValues(-[SCROBrailleDisplayInput downKeys](v18, "downKeys"));
    if (-[SCROBrailleDisplayInput prepareToMemorizeNextKey](self->_input, "prepareToMemorizeNextKey"))
    {
      if (-[SCROBrailleDisplay _hasKeyChord](self, "_hasKeyChord"))
      {
        if (!-[SCROBrailleDisplay _hasPressedBrailleKeys](self, "_hasPressedBrailleKeys"))
        {
          v19 = -[SCROBrailleDisplay _newBrailleKeyForCurrentKeyChord](self, "_newBrailleKeyForCurrentKeyChord");
LABEL_33:
          v23 = v19;
LABEL_35:
          if (-[SCROBrailleDisplayInput currentChord](self->_input, "currentChord"))
          {
            CFRelease(-[SCROBrailleDisplayInput currentChord](self->_input, "currentChord"));
            -[SCROBrailleDisplayInput setCurrentChord:](self->_input, "setCurrentChord:", 0);
          }
          -[SCROBrailleDisplayInput setRouterEvent:](self->_input, "setRouterEvent:", 0);
          -[SCROBrailleDisplayInput setNewDown:](self->_input, "setNewDown:", 0);
          -[SCROBrailleDisplayInput setQuietSince:](self->_input, "setQuietSince:", -3061152000.0);
          -[SCROBrailleDisplayInput setIsQuiet:](self->_input, "setIsQuiet:", 1);
          -[SCROBrailleDisplay _stopMemorization](self, "_stopMemorization");
          -[SCROBrailleDisplayInput setSkipBrailleKeyboardKeyTranslation:](self->_input, "setSkipBrailleKeyboardKeyTranslation:", 0);
          if (v23)
          {
            v24 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v24, "brailleDisplay:memorizedKey:", self, v23);

          }
          CFSetRemoveAllValues(-[SCROBrailleDisplayInput downBrailleDots](self->_input, "downBrailleDots"));
          if (-[SCROBrailleDisplayInput currentBrailleChord](self->_input, "currentBrailleChord"))
          {
            CFRelease(-[SCROBrailleDisplayInput currentBrailleChord](self->_input, "currentBrailleChord"));
            -[SCROBrailleDisplayInput setCurrentBrailleChord:](self->_input, "setCurrentBrailleChord:", 0);
          }
          -[SCROBrailleDisplayInput setSpacebarIsDown:](self->_input, "setSpacebarIsDown:", 0);
          -[SCROBrailleDisplayInput setCurrentBrailleChordContainsSpacebar:](self->_input, "setCurrentBrailleChordContainsSpacebar:", 0);
          -[SCROBrailleDisplayInput setCurrentBrailleChordBeganWithSpacebar:](self->_input, "setCurrentBrailleChordBeganWithSpacebar:", 0);
          -[SCROBrailleDisplayInput setSkipBrailleKeyboardKeyTranslation:](self->_input, "setSkipBrailleKeyboardKeyTranslation:", 0);
          v25 = *MEMORY[0x24BE0FC98];
          -[SCROBrailleDisplayInput setDownBrailleModifiers:](self->_input, "setDownBrailleModifiers:", v25);
          -[SCROBrailleDisplayInput setCurrentBrailleModifiers:](self->_input, "setCurrentBrailleModifiers:", v25);
          goto LABEL_42;
        }
      }
      else if (-[SCROBrailleDisplay _hasBrailleChord](self, "_hasBrailleChord"))
      {
        v19 = -[SCROBrailleDisplay _newBrailleKeyForCurrentBrailleChord](self, "_newBrailleKeyForCurrentBrailleChord");
        goto LABEL_33;
      }
    }
    v23 = 0;
    goto LABEL_35;
  }
  v20 = -[SCROBrailleDisplayInput prepareToMemorizeNextKey](v18, "prepareToMemorizeNextKey");
  if (v17 > 0.5 && v20)
  {
    -[SCROBrailleDisplayInput nextWillMemorizeNotificationTime](self->_input, "nextWillMemorizeNotificationTime");
    if (Current > v21)
    {
      if (-[SCROBrailleDisplay _hasKeyChord](self, "_hasKeyChord"))
      {
        if (-[SCROBrailleDisplay _hasPressedBrailleKeys](self, "_hasPressedBrailleKeys"))
          goto LABEL_43;
        v22 = -[SCROBrailleDisplay _newBrailleKeyForCurrentKeyChord](self, "_newBrailleKeyForCurrentKeyChord");
      }
      else
      {
        if (!-[SCROBrailleDisplay _hasBrailleChord](self, "_hasBrailleChord"))
          goto LABEL_43;
        v22 = -[SCROBrailleDisplay _newBrailleKeyForCurrentBrailleChord](self, "_newBrailleKeyForCurrentBrailleChord");
      }
      v23 = v22;
      if (v22)
      {
        -[SCROBrailleDisplayInput setNextWillMemorizeNotificationTime:](self->_input, "setNextWillMemorizeNotificationTime:", Current + *(double *)&kSCROBrailleInputMemorizePulseInterval);
        v32 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v32, "brailleDisplay:willMemorizeKey:", self, v23);

        -[SCROBrailleDisplayInput setWillMemorizeNow:](self->_input, "setWillMemorizeNow:", 1);
LABEL_42:

      }
    }
  }
LABEL_43:
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = SCROCustomBrailleEnabled();
  v28 = -[SCROBrailleDisplayInput currentBrailleChord](self->_input, "currentBrailleChord");
  if (v27)
  {
    if (v28
      || -[SCROBrailleDisplayInput spacebarIsDown](self->_input, "spacebarIsDown")
      || !-[SCROBrailleLine hasEdits](self->_brailleLine, "hasEdits"))
    {
      goto LABEL_58;
    }
LABEL_55:
    if (!self->_automaticBrailleTranslationEnabled)
      goto LABEL_58;
    -[SCROBrailleDisplayInput lastBrailleChordPosted](self->_input, "lastBrailleChordPosted");
    v30 = Current - v29;
    -[SCROBrailleDisplayInput brailleTranslationTimeout](self->_input, "brailleTranslationTimeout");
    if (v30 <= v31)
      goto LABEL_58;
LABEL_57:
    -[SCROBrailleDisplay _translateBrailleStringAndPostEvent](self, "_translateBrailleStringAndPostEvent");
    goto LABEL_58;
  }
  if (!v28
    && !-[SCROBrailleDisplayInput spacebarIsDown](self->_input, "spacebarIsDown")
    && -[SCROBrailleLine hasEdits](self->_brailleLine, "hasEdits"))
  {
    if (-[SCROBrailleDisplay isInputEightDot](self, "isInputEightDot")
      && objc_msgSend(v26, "primaryTableSupportsEightDotBraille")
      && (!-[SCROBrailleDisplay isInputContracted](self, "isInputContracted")
       || !objc_msgSend(v26, "primaryTableSupportsContractedBraille")))
    {
      goto LABEL_57;
    }
    goto LABEL_55;
  }
LABEL_58:

}

- (void)_blinkerEventHandler
{
  if (self->_isValid)
  {
    -[NSLock lock](self->_contentLock, "lock");
    if (!self->_shouldBatchUpdates || !-[SCROBrailleLine needsDisplayFlush](self->_brailleLine, "needsDisplayFlush"))
      -[SCROBrailleLine blinker](self->_brailleLine, "blinker");
    -[NSLock unlock](self->_contentLock, "unlock");
  }
}

- (void)_unloadNotification:(id)a3
{
  -[SCROBrailleDisplay performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedUnloadNotification, 0, 0.0);
}

- (void)_delayedUnloadNotification
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v3;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 25, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v3);

}

- (void)_configurationChangeNotification:(id)a3
{
  -[SCROBrailleDisplay performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedConfigurationChangeNotification, 0, 0.0);
}

- (void)_delayedConfigurationChangeNotification
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v3;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 27, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v3);

}

- (void)_sleepNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SCROBrailleDriverProtocolSleepNotificationIsSleepingKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleDisplay performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedSleepNotification_, v4, 0.0);

}

- (void)_delayedSleepNotification:(id)a3
{
  SCROBrailleEventDispatcher *eventDispatcher;
  id v4;

  eventDispatcher = self->_eventDispatcher;
  +[SCROBrailleEvent eventWithType:data:](SCROBrailleEvent, "eventWithType:data:", 26, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v4);

}

- (void)didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  SCROBrailleEventDispatcher *eventDispatcher;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  length = a4.length;
  location = a4.location;
  eventDispatcher = self->_eventDispatcher;
  v7 = (objc_class *)MEMORY[0x24BE0FC40];
  v8 = a3;
  v11 = (id)objc_msgSend([v7 alloc], "initWithUnicode:", v8);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleEvent eventWithType:data:data2:data3:](SCROBrailleEvent, "eventWithType:data:data2:data3:", 46, v11, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleEventDispatcher enqueueEvent:](eventDispatcher, "enqueueEvent:", v10);

}

- (void)_brailleDisplayStringDidChangeHandler:(id)a3 brailleSelection:(id)a4
{
  SCROBrailleLine *brailleLine;
  uint64_t v6;
  uint64_t v7;
  id v8;

  brailleLine = self->_brailleLine;
  v8 = a3;
  v6 = objc_msgSend(a4, "rangeValue");
  -[SCROBrailleLine brailleDisplayStringDidChange:brailleSelection:modifiers:](brailleLine, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v8, v6, v7, 0);

}

- (void)replaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;

  length = a3.length;
  location = a3.location;
  objc_msgSend(a4, "string");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROBrailleDisplay _replaceRange:withString:cursor:](self, "_replaceRange:withString:cursor:", location, length, v9, a5);

}

- (void)scriptSelectionDidChange:(_NSRange)a3
{
  NSUInteger location;
  id WeakRetained;

  location = a3.location;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "brailleDisplay:didMoveSelection:", self, location);

}

- (void)didInsertScriptString:(id)a3
{
  SCROBrailleDisplayInput *input;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  input = self->_input;
  v5 = a3;
  v6 = -[SCROBrailleDisplay newBrailleKeyboardKeyForText:modifiers:](self, "newBrailleKeyboardKeyForText:modifiers:", v5, self->_persistentKeyModifiers | -[SCROBrailleDisplayInput currentBrailleModifiers](input, "currentBrailleModifiers"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "brailleDisplay:pressedKeys:", self, v8);

}

- (void)brailleDisplayInsertedCharacter:(id)a3 modifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  unsigned __int8 v10;

  v10 = 0;
  v6 = a4;
  objc_msgSend(a3, "unicode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleTranslationUtility spokenStringForInsertedBrailleString:speakLiterally:modifiers:](SCROBrailleTranslationUtility, "spokenStringForInsertedBrailleString:speakLiterally:modifiers:", v7, &v10, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "brailleDisplay:insertedUntranslatedText:speakLiterally:", self, v8, v10);

}

- (void)brailleDisplayDeletedCharacter:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  unsigned __int8 v7;

  v7 = 0;
  objc_msgSend(a3, "unicode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCROBrailleTranslationUtility spokenStringForDeletedBrailleString:speakLiterally:](SCROBrailleTranslationUtility, "spokenStringForDeletedBrailleString:speakLiterally:", v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "brailleDisplay:deletedUntranslatedText:speakLiterally:", self, v5, v7);

}

- (void)handlePlanarPanFailedIsLeft:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "handlePlanarPanFailedIsLeft:", v3);

}

- (int)inputContractionMode
{
  return !-[SCROBrailleDisplay isInputContracted](self, "isInputContracted");
}

- (void)setInputContractionMode:(int)a3
{
  BOOL v4;
  __CFString *v5;
  void *v6;
  id v7;

  v4 = a3 == 0;
  if (a3)
    v5 = CFSTR("com.apple.scrod.braille.table.duxbury.eng-xueb_g1");
  else
    v5 = CFSTR("com.apple.scrod.braille.table.duxbury.eng-xueb_g2");
  objc_storeStrong((id *)&self->_inputTableIdentifier, v5);
  self->_isInputContracted = v4;
  self->_isInputEightDot = 0;
  +[SCROBrailleTranslationManager inputManager](SCROBrailleTranslationManager, "inputManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString brl_languageAndVariant](self->_inputTableIdentifier, "brl_languageAndVariant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultLanguage:", v6);

}

- (int)outputContractionMode
{
  return !-[SCROBrailleDisplay isInputContracted](self, "isInputContracted");
}

- (void)setOutputContractionMode:(int)a3
{
  __CFString *v4;
  void *v5;
  id v6;

  if (a3)
    v4 = CFSTR("com.apple.scrod.braille.table.duxbury.eng-xueb_g1");
  else
    v4 = CFSTR("com.apple.scrod.braille.table.duxbury.eng-xueb_g2");
  objc_storeStrong((id *)&self->_outputTableIdentifier, v4);
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString brl_languageAndVariant](self->_outputTableIdentifier, "brl_languageAndVariant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultLanguage:", v5);

}

- (void)setInputShowEightDot:(BOOL)a3
{
  __CFString *v5;
  void *v6;
  id v7;

  if (a3)
    v5 = CFSTR("com.apple.scrod.braille.table.duxbury.eng-8dot");
  else
    v5 = CFSTR("com.apple.scrod.braille.table.duxbury.eng-xueb_g2");
  objc_storeStrong((id *)&self->_inputTableIdentifier, v5);
  self->_isInputEightDot = a3;
  self->_isInputContracted = !a3;
  +[SCROBrailleTranslationManager inputManager](SCROBrailleTranslationManager, "inputManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString brl_languageAndVariant](self->_inputTableIdentifier, "brl_languageAndVariant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultLanguage:", v6);

}

- (void)setOutputShowEightDot:(BOOL)a3
{
  __CFString *v4;
  void *v5;
  id v6;

  if (a3)
    v4 = CFSTR("com.apple.scrod.braille.table.duxbury.eng-8dot");
  else
    v4 = CFSTR("com.apple.scrod.braille.table.duxbury.eng-xueb_g2");
  objc_storeStrong((id *)&self->_outputTableIdentifier, v4);
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString brl_languageAndVariant](self->_outputTableIdentifier, "brl_languageAndVariant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultLanguage:", v5);

}

- (BOOL)inputAllowed
{
  return self->_inputAllowed;
}

- (BOOL)automaticBrailleTranslationEnabled
{
  return self->_automaticBrailleTranslationEnabled;
}

- (void)setAutomaticBrailleTranslationEnabled:(BOOL)a3
{
  self->_automaticBrailleTranslationEnabled = a3;
}

- (double)autoAdvanceDuration
{
  return self->_autoAdvanceDuration;
}

- (BOOL)blinkingCursorEnabled
{
  return self->_blinkingCursorEnabled;
}

- (SCRO2DBrailleData)planarData
{
  return self->_planarData;
}

- (NSString)outputTableIdentifier
{
  return self->_outputTableIdentifier;
}

- (NSString)inputTableIdentifier
{
  return self->_inputTableIdentifier;
}

- (unsigned)persistentKeyModifiers
{
  return self->_persistentKeyModifiers;
}

- (void)setPersistentKeyModifiers:(unsigned int)a3
{
  self->_persistentKeyModifiers = a3;
}

- (id)eventHandled
{
  return self->_eventHandled;
}

- (void)setEventHandled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (double)brailleKeyDebounceTimeout
{
  return self->_brailleKeyDebounceTimeout;
}

- (NSTimer)autoAdvanceTimer
{
  return self->_autoAdvanceTimer;
}

- (void)setAutoAdvanceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoAdvanceTimer, a3);
}

- (BOOL)isInputEightDot
{
  return self->_isInputEightDot;
}

- (BOOL)isInputContracted
{
  return self->_isInputContracted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoAdvanceTimer, 0);
  objc_storeStrong(&self->_eventHandled, 0);
  objc_storeStrong((id *)&self->_inputTableIdentifier, 0);
  objc_storeStrong((id *)&self->_outputTableIdentifier, 0);
  objc_storeStrong((id *)&self->_planarData, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_keyEventsQueue, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_driverModelIdentifier, 0);
  objc_storeStrong((id *)&self->_driverIdentifier, 0);
  objc_storeStrong((id *)&self->_brailleLine, 0);
  objc_storeStrong((id *)&self->_ioElement, 0);
  objc_storeStrong((id *)&self->_brailleDriver, 0);
  objc_storeStrong((id *)&self->_commandDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentLock, 0);
}

- (void)_blinkingCursorSetting
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Boolean soft__AXSPrefersNonBlinkingCursorIndicator(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SCROBrailleDisplay.m"), 34, CFSTR("%s"), dlerror());

  __break(1u);
}

@end

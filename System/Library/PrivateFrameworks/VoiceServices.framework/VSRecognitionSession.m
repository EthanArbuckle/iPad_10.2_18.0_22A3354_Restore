@implementation VSRecognitionSession

- (void)_init
{
  unsigned int v2;

  self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFF87F | 0x600);
  -[VSRecognitionSession reset](self, "reset");
  v2 = time(0);
  srandom(v2);
}

- (VSRecognitionSession)init
{
  VSRecognitionSession *v2;
  VSRecognitionSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSRecognitionSession;
  v2 = -[VSRecognitionSession init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[VSRecognitionSession _init](v2, "_init");
  return v3;
}

- (VSRecognitionSession)initWithModelIdentifier:(id)a3
{
  VSRecognitionSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSRecognitionSession;
  v4 = -[VSRecognitionSession init](&v6, sel_init);
  if (v4)
  {
    v4->_modelIdentifier = (NSString *)a3;
    -[VSRecognitionSession _init](v4, "_init");
  }
  return v4;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[VSRecognitionSession cancel](self, "cancel");

  -[VSSpeechSynthesizer setDelegate:](self->_synthesizer, "setDelegate:", 0);
  -[VSKeepAlive setActive:](self->_keepAlive, "setActive:", 0);

  if ((*((_BYTE *)&self->_sessionFlags + 2) & 4) != 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.voiceservices.kwidxchanged"), 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)VSRecognitionSession;
  -[VSRecognitionSession dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  if (self->_delegate != a3)
  {
    self->_delegate = (VSRecognitionSessionDelegate *)a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFFD | v4);
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 4;
    else
      v5 = 0;
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFFB | v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 8;
    else
      v6 = 0;
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFF7 | v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 32;
    else
      v7 = 0;
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFDF | v7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFEF | v8);
  }
}

- (id)beginNextAction
{
  $6825843C93F9D5008761B55003A2C12E sessionFlags;
  VSRecognitionAction *currentAction;
  VSRecognitionAction *v5;
  CFErrorRef v6;
  $6825843C93F9D5008761B55003A2C12E v7;
  const __CFAllocator *v8;
  __CFString *v9;
  __CFError *v10;
  id v11;
  VSKeepAlive *v12;
  void *userInfoValues;
  void *userInfoKeys[2];

  userInfoKeys[1] = *(void **)MEMORY[0x1E0C80C00];
  sessionFlags = self->_sessionFlags;
  currentAction = self->_currentAction;
  if ((*(_WORD *)&sessionFlags & 0x4000) != 0)
  {
    if ((*(_DWORD *)&sessionFlags & 0x10000) != 0 && currentAction)
    {
      self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&sessionFlags & 0xFFFEFFFF);
      -[VSRecognitionSession _notifyDelegateActionStarted](self, "_notifyDelegateActionStarted");
      -[VSRecognitionAction _continueAfterDeferredStart](self->_currentAction, "_continueAfterDeferredStart");
      return 0;
    }
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    userInfoKeys[0] = *(void **)MEMORY[0x1E0C9AFB0];
    v9 = CFSTR("action already in progress");
LABEL_10:
    userInfoValues = v9;
    v6 = CFErrorCreateWithUserInfoKeysAndValues(v8, CFSTR("VSErrorDomain"), -4003, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
    v10 = v6;
    return v6;
  }
  if (!currentAction)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    userInfoKeys[0] = *(void **)MEMORY[0x1E0C9AFB0];
    v9 = CFSTR("session is finished or invalid");
    goto LABEL_10;
  }
  v5 = currentAction;
  *(_DWORD *)&self->_sessionFlags |= 0xC000u;
  v6 = -[VSRecognitionAction perform](self->_currentAction, "perform");
  v7 = self->_sessionFlags;
  self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&v7 & 0xFFFF7FFF);
  if (v6)
  {
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&v7 & 0xFFFF3FFF);
  }
  else
  {
    if (!-[VSRecognitionAction _hasDeferredStartCallback](self->_currentAction, "_hasDeferredStartCallback"))
      -[VSRecognitionSession _notifyDelegateActionStarted](self, "_notifyDelegateActionStarted");
    if ((*(_BYTE *)&self->_sessionFlags & 0x40) != 0 && !self->_debugDumpPath)
    {
      v11 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
      if (v11)
        self->_debugDumpPath = (NSString *)(id)objc_msgSend(v11, "_debugDumpPath");
    }
    if (!self->_keepAlive)
    {
      v12 = objc_alloc_init(VSKeepAlive);
      self->_keepAlive = v12;
      -[VSKeepAlive setAudioType:](v12, "setAudioType:", 3);
      -[VSKeepAlive setKeepAudioSessionActive:](self->_keepAlive, "setKeepAudioSessionActive:", 1);
      -[VSKeepAlive setActive:](self->_keepAlive, "setActive:", 1);
    }
  }

  return v6;
}

- (id)reset
{
  const __CFAllocator *v3;
  void *v4;
  VSRecognitionRecognizeAction *v6;
  void *userInfoValues;
  void *userInfoKeys[2];

  userInfoKeys[1] = *(void **)MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)&self->_sessionFlags + 2) & 2) != 0 || self->_currentAction)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = (void *)*MEMORY[0x1E0C9AFB0];
    userInfoValues = CFSTR("session is invalid or not finished");
    userInfoKeys[0] = v4;
    return CFErrorCreateWithUserInfoKeysAndValues(v3, CFSTR("VSErrorDomain"), -4003, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
  }
  else
  {
    v6 = -[VSRecognitionRecognizeAction initWithModelIdentifier:]([VSRecognitionRecognizeAction alloc], "initWithModelIdentifier:", self->_modelIdentifier);
    -[VSRecognitionSession _setAction:](self, "_setAction:", v6);

    return 0;
  }
}

- (BOOL)isRecognizing
{
  id v2;

  v2 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "_isRecognizing");
  return (char)v2;
}

- (BOOL)isActivelyRecognizing
{
  id v2;

  v2 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "_isActivelyRecognizing");
  return (char)v2;
}

- (BOOL)isFinished
{
  return self->_currentAction == 0;
}

- (BOOL)isValid
{
  return (*((_BYTE *)&self->_sessionFlags + 2) & 2) == 0;
}

- (BOOL)hasDeferredAction
{
  return *((_BYTE *)&self->_sessionFlags + 2) & 1;
}

- (BOOL)isBusy
{
  return (*((_BYTE *)&self->_sessionFlags + 1) & 0x40) != 0 && self->_currentAction != 0;
}

- (BOOL)nextActionWillTerminateSession
{
  return -[VSRecognitionAction completionType](self->_currentAction, "completionType") == 0;
}

- (BOOL)nextActionWillRecognize
{
  return (*((_BYTE *)&self->_sessionFlags + 1) & 0x40) == 0
      && -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction") != 0;
}

- (void)setSensitiveActionsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFBFF | v3);
}

- (BOOL)sensitiveActionsEnabled
{
  return (*((unsigned __int8 *)&self->_sessionFlags + 1) >> 2) & 1;
}

- (BOOL)setBluetoothInputAllowed:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  int v6;
  int v7;

  if (((((*((_BYTE *)&self->_sessionFlags + 1) & 8) == 0) ^ a3) & 1) != 0)
  {
LABEL_8:
    LOBYTE(v6) = 1;
    return v6;
  }
  v3 = a3;
  v5 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
  if (!v5 || (v6 = objc_msgSend(v5, "_setBluetoothInputAllowed:", v3)) != 0)
  {
    if (v3)
      v7 = 2048;
    else
      v7 = 0;
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFF7FF | v7);
    goto LABEL_8;
  }
  return v6;
}

- (id)cancelMaintainingKeepAlive:(BOOL)a3
{
  id v5;
  id handlingThread;
  $6825843C93F9D5008761B55003A2C12E sessionFlags;

  v5 = -[VSRecognitionAction cancel](self->_currentAction, "cancel");
  -[VSRecognitionSession _setAction:](self, "_setAction:", 0);
  *(_DWORD *)&self->_sessionFlags |= 0x20000u;
  if (!a3)
  {
    -[VSKeepAlive setActive:](self->_keepAlive, "setActive:", 0);

    self->_keepAlive = 0;
  }
  handlingThread = self->_handlingThread;
  if (handlingThread)
  {
    objc_msgSend(handlingThread, "invalidate");
    objc_msgSend(self->_handlingThread, "setDelegate:", 0);

    self->_handlingThread = 0;
  }
  sessionFlags = self->_sessionFlags;
  if ((*(_WORD *)&sessionFlags & 0x2000) != 0)
  {
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&sessionFlags & 0xFFFFDFFF);
    -[VSSpeechSynthesizer stopSpeakingAtNextBoundary:synchronously:error:](self->_synthesizer, "stopSpeakingAtNextBoundary:synchronously:error:", 0, 0, 0);
  }
  return v5;
}

- (id)cancel
{
  return -[VSRecognitionSession cancelMaintainingKeepAlive:](self, "cancelMaintainingKeepAlive:", 0);
}

- (void)_actionCompleted:(id)a3 nextAction:(id)a4 error:(id)a5
{
  $6825843C93F9D5008761B55003A2C12E sessionFlags;
  id v8;
  id v9;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v15 = a4;
  v16 = a3;
  v14 = a5;
  if (self->_currentAction == a3)
  {
    sessionFlags = self->_sessionFlags;
    if ((*(_DWORD *)&sessionFlags & 0x20000) == 0)
    {
      if ((*(_WORD *)&sessionFlags & 0x8000) != 0)
      {
        v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", -[VSRecognitionSession methodSignatureForSelector:](self, "methodSignatureForSelector:", a2));
        objc_msgSend(v11, "setSelector:", a2);
        objc_msgSend(v11, "setTarget:", self);
        objc_msgSend(v11, "setArgument:atIndex:", &v16, 2);
        objc_msgSend(v11, "setArgument:atIndex:", &v15, 3);
        objc_msgSend(v11, "setArgument:atIndex:", &v14, 4);
        objc_msgSend(v11, "retainArguments");
        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:invocation:repeats:", v11, 0, 0.0);
      }
      else
      {
        v8 = a4;
        v12 = a3;
        if ((*((_BYTE *)&self->_sessionFlags + 1) & 2) == 0)
        {
          if (-[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              v8 = 0;
          }
        }
        if (a5)
          v9 = 0;
        else
          v9 = v8;
        -[VSRecognitionSession _setAction:](self, "_setAction:", v9, v12, v14, v15, v16);
        if (a5 || !v8 && !objc_msgSend(v13, "completionType"))
          *(_DWORD *)&self->_sessionFlags |= 0x20000u;
        if ((*(_BYTE *)&self->_sessionFlags & 0x20) != 0)
          -[VSRecognitionSessionDelegate recognitionSession:didCompleteActionWithError:](self->_delegate, "recognitionSession:didCompleteActionWithError:", self, a5);

      }
    }
  }
}

- (BOOL)_actionStarted:(id)a3
{
  int v4;

  if (self->_currentAction == a3 && objc_msgSend(a3, "_hasDeferredStartCallback"))
  {
    if ((*(_BYTE *)&self->_sessionFlags & 1) != 0)
    {
      v4 = -[VSRecognitionSessionDelegate recognitionSessionWillBeginAction:](self->_delegate, "recognitionSessionWillBeginAction:", self);
      if (!v4)
      {
        *(_DWORD *)&self->_sessionFlags |= 0x10000u;
        return v4;
      }
    }
    -[VSRecognitionSession _notifyDelegateActionStarted](self, "_notifyDelegateActionStarted");
  }
  LOBYTE(v4) = 1;
  return v4;
}

- (void)_notifyDelegateActionStarted
{
  if ((*(_BYTE *)&self->_sessionFlags & 2) != 0)
    -[VSRecognitionSessionDelegate recognitionSessionDidBeginAction:](self->_delegate, "recognitionSessionDidBeginAction:", self);
}

- (void)_notifyDelegateOpenURL:(id)a3 completion:(id)a4
{
  $6825843C93F9D5008761B55003A2C12E sessionFlags;

  sessionFlags = self->_sessionFlags;
  if ((*(_BYTE *)&sessionFlags & 8) != 0)
  {
    -[VSRecognitionSessionDelegate recognitionSession:openURL:completion:](self->_delegate, "recognitionSession:openURL:completion:");
  }
  else if ((*(_BYTE *)&sessionFlags & 4) != 0)
  {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, -[VSRecognitionSessionDelegate recognitionSession:openURL:](self->_delegate, "recognitionSession:openURL:"));
  }
}

- (void)_setAction:(id)a3
{
  VSRecognitionAction *currentAction;
  VSRecognitionAction *v6;
  id v7;
  unsigned int sessionFlags;
  void *v9;

  currentAction = self->_currentAction;
  if (currentAction != a3)
  {
    -[VSRecognitionAction _setSession:](self->_currentAction, "_setSession:", 0);

    v6 = (VSRecognitionAction *)a3;
    self->_currentAction = v6;
    -[VSRecognitionAction _setSession:](v6, "_setSession:", self);
  }
  v7 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
  sessionFlags = self->_sessionFlags;
  if (v7)
  {
    v9 = v7;
    if ((sessionFlags & 0x40) != 0)
    {
      if (self->_debugDumpPath)
        objc_msgSend(v7, "_setDebugDumpPath:");
      else
        objc_msgSend(v7, "_setDebugDumpEnabled:", 1);
    }
    objc_msgSend(v9, "_setPreferredEngine:", (*(_DWORD *)&self->_sessionFlags >> 7) & 3);
    objc_msgSend(v9, "_setAudioInputPath:", self->_audioInputPath);
    objc_msgSend(v9, "_setInputLevelUpdateInterval:", self->_levelInterval);
    objc_msgSend(v9, "_setEngineResetRequired:", (*(_DWORD *)&self->_sessionFlags >> 12) & 1);
    objc_msgSend(v9, "_setBluetoothInputAllowed:", (*(_DWORD *)&self->_sessionFlags >> 11) & 1);

    self->_audioInputPath = 0;
    sessionFlags = *(_DWORD *)&self->_sessionFlags & 0xFFFFEFFF;
  }
  self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(sessionFlags & 0xFFFEBFFF);
  if (currentAction != a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("VSRecognitionSessionKeywordsDidChangeNotification"), self);
}

- (id)_currentRecognizeAction
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return self->_currentAction;
  else
    return 0;
}

- (id)_recognitionResultHandlingThread
{
  id result;
  VSRecognitionResultHandlingThread *v4;

  result = self->_handlingThread;
  if (!result)
  {
    v4 = objc_alloc_init(VSRecognitionResultHandlingThread);
    self->_handlingThread = v4;
    -[VSRecognitionResultHandlingThread setDelegate:](v4, "setDelegate:", self);
    return self->_handlingThread;
  }
  return result;
}

- (void)recognitionResultHandlingThread:(id)a3 didHandleResults:(id)a4 nextAction:(id)a5
{
  objc_msgSend(-[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction", a3), "_handledThreadedResults:nextAction:", a4, a5);
}

- (id)spokenFeedbackString
{
  return -[VSRecognitionAction spokenFeedbackString](self->_currentAction, "spokenFeedbackString");
}

- (id)spokenFeedbackAttributedString
{
  return -[VSRecognitionAction spokenFeedbackAttributedString](self->_currentAction, "spokenFeedbackAttributedString");
}

- (id)displayResultString
{
  return -[VSRecognitionAction resultDisplayString](self->_currentAction, "resultDisplayString");
}

- (id)displayStatusString
{
  return -[VSRecognitionAction statusDisplayString](self->_currentAction, "statusDisplayString");
}

- (void)setInputLevelUpdateInterval:(double)a3
{
  id v4;

  if (self->_levelInterval != a3)
  {
    self->_levelInterval = a3;
    v4 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
    if (v4)
      objc_msgSend(v4, "_setInputLevelUpdateInterval:", a3);
  }
}

- (float)inputLevel
{
  id v2;
  float result;

  v2 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
  if (!v2)
    return 0.0;
  objc_msgSend(v2, "_inputLevel");
  return result;
}

- (float)inputLevelDB
{
  id v2;
  float result;

  v2 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
  if (!v2)
    return 0.0;
  objc_msgSend(v2, "_inputLevelDB");
  return result;
}

- (void)setKeywordPhase:(unint64_t)a3
{
  if (self->_keywordPhase != a3)
  {
    self->_keywordPhase = a3;

    self->_topLevelKeywords = 0;
  }
}

- (id)keywordAtIndex:(int64_t)a3
{
  return (id)objc_msgSend(-[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction"), "_keywordAtIndex:", a3);
}

- (int64_t)keywordCount
{
  return objc_msgSend(-[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction"), "_keywordCount");
}

- (__CFDictionary)_createKeywordIndex
{
  const __CFAllocator **v3;
  __CFDictionary *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  pthread_mutex_lock(&_createKeywordIndex___KeywordIndexLock);
  v3 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
  if (!_createKeywordIndex___KeywordIndexURL)
    _createKeywordIndex___KeywordIndexURL = (uint64_t)VSKeywordIndexCopyDefaultURL((const __CFAllocator *)*MEMORY[0x1E0C9AE00]);
  pthread_mutex_unlock(&_createKeywordIndex___KeywordIndexLock);
  if (_createKeywordIndex___KeywordIndexURL)
    v4 = (__CFDictionary *)VSKeywordIndexCreateWithURL(*v3, (const __CFURL *)_createKeywordIndex___KeywordIndexURL);
  else
    v4 = 0;
  if ((*((_BYTE *)&self->_sessionFlags + 2) & 4) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_VSRecognitionSessionKeywordIndexChangedNotificationHandler, CFSTR("com.apple.voiceservices.kwidxchanged"), 0, CFNotificationSuspensionBehaviorDrop);
    *(_DWORD *)&self->_sessionFlags |= 0x40000u;
  }
  return v4;
}

- (id)_createPhaseSortedKeywordsFromArray:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  CFMutableDictionaryRef Mutable;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!objc_msgSend(a3, "count"))
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_msgSend(a3, "_scrambledKeywordsAndAddToSet:", v5);
  if (self->_keywordPhase)
  {
    v7 = (void *)v6;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    v10 = 0;
    while (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v8, "removeAllObjects");
      if (self->_keywordPhase)
      {
        v11 = 0;
        do
        {
          if (!objc_msgSend(v5, "count"))
            break;
          v12 = objc_msgSend(v7, "_nextKeywordUsingCursors:", Mutable);
          if (v12)
          {
            v13 = v12;
            if ((objc_msgSend(v8, "containsObject:", v12) & 1) == 0)
            {
              if (!v10)
                v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v10, "addObject:", v13);
              objc_msgSend(v8, "addObject:", v13);
              objc_msgSend(v5, "removeObject:", v13);
              ++v11;
            }
          }
        }
        while (v11 < self->_keywordPhase);
      }
    }
    CFRelease(Mutable);

  }
  else
  {
    v10 = (id)objc_msgSend(v5, "allObjects");
  }

  return v10;
}

- (id)_topLevelKeywords
{
  NSArray *topLevelKeywords;
  __CFDictionary *v4;
  __CFDictionary *v5;
  CFMutableArrayRef v6;
  CFMutableArrayRef v7;

  topLevelKeywords = self->_topLevelKeywords;
  if (!topLevelKeywords)
  {
    v4 = -[VSRecognitionSession _createKeywordIndex](self, "_createKeywordIndex");
    if (v4)
    {
      v5 = v4;
      v6 = VSKeywordIndexCopyKeywordsForTopLevelModels(v4);
      if (v6)
      {
        v7 = v6;
        topLevelKeywords = -[VSRecognitionSession _createPhaseSortedKeywordsFromArray:](self, "_createPhaseSortedKeywordsFromArray:", v6);

        CFRelease(v5);
        if (topLevelKeywords)
        {
LABEL_8:
          self->_topLevelKeywords = topLevelKeywords;
          return topLevelKeywords;
        }
      }
      else
      {
        CFRelease(v5);
      }
    }
    topLevelKeywords = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    goto LABEL_8;
  }
  return topLevelKeywords;
}

- (id)_keywordsForModelIdentifier:(id)a3
{
  __CFDictionary *v5;
  __CFDictionary *v6;
  CFMutableArrayRef v7;
  CFMutableArrayRef v8;
  id v9;
  id v11;

  if (!a3)
    return -[VSRecognitionSession _topLevelKeywords](self, "_topLevelKeywords");
  v5 = -[VSRecognitionSession _createKeywordIndex](self, "_createKeywordIndex");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = VSKeywordIndexCopyKeywordsForModelIdentifier(v5, a3);
  if (v7)
  {
    v8 = v7;
    v9 = -[VSRecognitionSession _createPhaseSortedKeywordsFromArray:](self, "_createPhaseSortedKeywordsFromArray:", v7);

  }
  else
  {
    v9 = 0;
  }
  v11 = v9;
  CFRelease(v6);
  return v9;
}

- (void)_keywordIndexChanged
{
  NSArray *topLevelKeywords;

  topLevelKeywords = self->_topLevelKeywords;
  if (topLevelKeywords)
  {

    self->_topLevelKeywords = 0;
  }
  if (objc_msgSend(-[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction"), "_keywordIndexChanged"))objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("VSRecognitionSessionKeywordsDidChangeNotification"), self, 0);
}

- (id)beginSpeakingFeedbackString
{
  id v3;
  const __CFAllocator *v5;
  void *v6;
  CFErrorRef v7;
  __CFError *v8;
  void *userInfoValues;
  void *userInfoKeys[2];

  userInfoKeys[1] = *(void **)MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)&self->_sessionFlags + 1) & 0x20) != 0 || !self->_currentAction)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = (void *)*MEMORY[0x1E0C9AFB0];
    userInfoValues = CFSTR("session is already speaking");
    userInfoKeys[0] = v6;
    v7 = CFErrorCreateWithUserInfoKeysAndValues(v5, CFSTR("VSErrorDomain"), -4003, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
    v8 = v7;
    return v7;
  }
  else
  {
    v3 = -[VSRecognitionSession spokenFeedbackAttributedString](self, "spokenFeedbackAttributedString");
    if (v3)
      return -[VSRecognitionSession _beginSpeakingAttributedString:](self, "_beginSpeakingAttributedString:", v3);
    else
      return -[VSRecognitionSession beginSpeakingString:](self, "beginSpeakingString:", -[VSRecognitionSession spokenFeedbackString](self, "spokenFeedbackString"));
  }
}

- (id)beginSpeakingString:(id)a3
{
  if (objc_msgSend(a3, "length"))
    return -[VSRecognitionSession _beginSpeakingString:attributedString:](self, "_beginSpeakingString:attributedString:", a3, 0);
  -[VSRecognitionSession _notifyDelegateFinishedSpeakingWithError:](self, "_notifyDelegateFinishedSpeakingWithError:", 0);
  return 0;
}

- (id)_beginSpeakingAttributedString:(id)a3
{
  if (objc_msgSend(a3, "length"))
    return -[VSRecognitionSession _beginSpeakingString:attributedString:](self, "_beginSpeakingString:attributedString:", 0, a3);
  -[VSRecognitionSession _notifyDelegateFinishedSpeakingWithError:](self, "_notifyDelegateFinishedSpeakingWithError:", 0);
  return 0;
}

- (id)_beginSpeakingString:(id)a3 attributedString:(id)a4
{
  VSSpeechSynthesizer *v7;
  VSSpeechRequest *v8;
  VSSpeechRequest *v9;

  if (!self->_synthesizer)
  {
    v7 = -[VSSpeechSynthesizer initForInputFeedback]([VSSpeechSynthesizer alloc], "initForInputFeedback");
    self->_synthesizer = v7;
    -[VSSpeechSynthesizer setDelegate:](v7, "setDelegate:", self);
  }
  if (!self->_languageID)
    self->_languageID = (NSString *)VSPreferencesCopySpokenLanguageIdentifier();
  v8 = objc_alloc_init(VSSpeechRequest);
  v9 = v8;
  if (a4)
    -[VSSpeechRequest setAttributedText:](v8, "setAttributedText:", a4);
  else
    -[VSSpeechRequest setText:](v8, "setText:", a3);
  -[VSSpeechRequest setLanguageCode:](v9, "setLanguageCode:", self->_languageID);
  -[VSSpeechRequest setOutputPath:](v9, "setOutputPath:", 0);
  if (!-[VSSpeechSynthesizer startSpeakingRequest:](self->_synthesizer, "startSpeakingRequest:", v9))
    *(_DWORD *)&self->_sessionFlags |= 0x2000u;

  return 0;
}

- (void)_notifyDelegateFinishedSpeakingWithError:(id)a3
{
  if ((*(_BYTE *)&self->_sessionFlags & 0x10) != 0)
    -[VSRecognitionSessionDelegate recognitionSession:didFinishSpeakingFeedbackStringWithError:](self->_delegate, "recognitionSession:didFinishSpeakingFeedbackStringWithError:", self, a3);
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 phonemesSpoken:(id)a6 withError:(id)a7
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__VSRecognitionSession_speechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke;
  block[3] = &unk_1EA8AFD00;
  block[4] = a3;
  block[5] = self;
  block[6] = a7;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)setDebugDumpEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  int v7;
  int v8;

  if (((((*(_BYTE *)&self->_sessionFlags & 0x40) == 0) ^ a3) & 1) != 0)
  {
LABEL_11:
    LOBYTE(v7) = 1;
    return v7;
  }
  v3 = a3;

  self->_debugDumpPath = 0;
  v5 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
  if (!v5)
  {
LABEL_7:
    if (v3)
      v8 = 64;
    else
      v8 = 0;
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFFBF | v8);
    goto LABEL_11;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "_setDebugDumpEnabled:", v3);
  if (v7 && v3)
  {
    self->_debugDumpPath = (NSString *)(id)objc_msgSend(v6, "_debugDumpPath");
    goto LABEL_7;
  }
  if (v7)
    goto LABEL_7;
  return v7;
}

- (id)debugDumpPath
{
  return self->_debugDumpPath;
}

- (BOOL)setNextRecognitionAudioInputPath:(id)a3
{
  id v5;

  if (self->_audioInputPath != a3)
  {
    v5 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
    if (v5)
      return objc_msgSend(v5, "_setAudioInputPath:", a3);

    self->_audioInputPath = (NSString *)a3;
  }
  return 1;
}

- (BOOL)setNextRecognitionRequiresReset:(BOOL)a3
{
  BOOL result;
  _BOOL8 v4;
  id v6;
  unsigned int v7;
  int v8;

  if (((((*((_BYTE *)&self->_sessionFlags + 1) & 0x10) == 0) ^ a3) & 1) != 0)
    return 1;
  v4 = a3;
  v6 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
  if (v6)
  {
    result = objc_msgSend(v6, "_setEngineResetRequired:", v4);
    v7 = *(_DWORD *)&self->_sessionFlags & 0xFFFFEFFF;
  }
  else
  {
    if (v4)
      v8 = 4096;
    else
      v8 = 0;
    v7 = *(_DWORD *)&self->_sessionFlags & 0xFFFFEFFF | v8;
    result = 1;
  }
  self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)v7;
  return result;
}

- (BOOL)setPreferredEngine:(int)a3
{
  uint64_t v3;
  id v5;
  int v6;

  if (((*(_DWORD *)&self->_sessionFlags >> 7) & 3) == a3)
    goto LABEL_5;
  v3 = *(_QWORD *)&a3;
  v5 = -[VSRecognitionSession _currentRecognizeAction](self, "_currentRecognizeAction");
  if (!v5 || (v6 = objc_msgSend(v5, "_setPreferredEngine:", v3)) != 0)
  {
    self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFE7F | ((v3 & 3) << 7));
LABEL_5:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)setPerformRecognitionHandlerActions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_sessionFlags = ($6825843C93F9D5008761B55003A2C12E)(*(_DWORD *)&self->_sessionFlags & 0xFFFFFDFF | v3);
}

uint64_t __105__VSRecognitionSession_speechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v1 + 56))
  {
    v2 = *(_DWORD *)(v1 + 104);
    if ((v2 & 0x2000) != 0)
    {
      *(_DWORD *)(v1 + 104) = v2 & 0xFFFFDFFF;
      return objc_msgSend(*(id *)(result + 40), "_notifyDelegateFinishedSpeakingWithError:", *(_QWORD *)(result + 48));
    }
  }
  return result;
}

@end

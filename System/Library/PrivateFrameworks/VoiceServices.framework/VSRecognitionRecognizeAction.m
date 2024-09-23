@implementation VSRecognitionRecognizeAction

- (VSRecognitionRecognizeAction)initWithModelIdentifier:(id)a3
{
  VSRecognitionRecognizeAction *v4;

  v4 = -[VSRecognitionRecognizeAction init](self, "init");
  if (v4)
    v4->_modelIdentifier = (NSString *)a3;
  return v4;
}

- (void)dealloc
{
  void *recognition;
  objc_super v4;

  -[VSRecognitionRecognizeAction cancel](self, "cancel");

  recognition = self->_recognition;
  if (recognition)
    CFRelease(recognition);
  v4.receiver = self;
  v4.super_class = (Class)VSRecognitionRecognizeAction;
  -[VSRecognitionAction dealloc](&v4, sel_dealloc);
}

- (int)completionType
{
  return 1;
}

- (id)modelIdentifier
{
  return self->_modelIdentifier;
}

- (BOOL)_isRecognizing
{
  _DWORD *recognition;

  recognition = self->_recognition;
  return recognition && recognition[24] < 2u;
}

- (BOOL)_isActivelyRecognizing
{
  _DWORD *recognition;

  recognition = self->_recognition;
  return recognition && recognition[24] == 1;
}

- (BOOL)_hasDeferredStartCallback
{
  return 1;
}

- (BOOL)_setBluetoothInputAllowed:(BOOL)a3
{
  char recognizeFlags;

  recognizeFlags = (char)self->_recognizeFlags;
  if (((((recognizeFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (self->_recognition)
      return 0;
    *(_BYTE *)&self->_recognizeFlags = recognizeFlags | 0x10;
  }
  return 1;
}

- (BOOL)_setInputLevelUpdateInterval:(double)a3
{
  void *recognition;
  BOOL result;

  result = self->_levelInterval == a3
        || (self->_levelInterval = a3, (recognition = self->_recognition) == 0)
        || VSRecognitionSetInputLevelUpdateInterval((uint64_t)recognition, a3) != 0;
  return result;
}

- (float)_inputLevel
{
  void *recognition;

  recognition = self->_recognition;
  if (recognition && (*(_BYTE *)&self->_recognizeFlags & 0x20) != 0)
    return VSRecognitionGetInputLevel((uint64_t)recognition);
  else
    return 0.0;
}

- (float)_inputLevelDB
{
  void *recognition;

  recognition = self->_recognition;
  if (recognition && (*(_BYTE *)&self->_recognizeFlags & 0x20) != 0)
    return VSRecognitionGetInputLevelDB((uint64_t)recognition);
  else
    return 0.0;
}

- (id)_keywords
{
  id result;

  result = self->_keywords;
  if (!result)
  {
    result = (id)objc_msgSend(-[VSRecognitionAction _session](self, "_session"), "_keywordsForModelIdentifier:", self->_modelIdentifier);
    self->_keywords = (NSArray *)result;
    if (!result)
    {
      result = objc_alloc_init(MEMORY[0x1E0C99D20]);
      self->_keywords = (NSArray *)result;
    }
  }
  return result;
}

- (id)_keywordAtIndex:(int64_t)a3
{
  id v4;

  v4 = -[VSRecognitionRecognizeAction _keywords](self, "_keywords");
  if (objc_msgSend(v4, "count") <= (unint64_t)a3)
    return 0;
  else
    return (id)objc_msgSend(v4, "objectAtIndex:", a3);
}

- (int64_t)_keywordCount
{
  return objc_msgSend(-[VSRecognitionRecognizeAction _keywords](self, "_keywords"), "count");
}

- (BOOL)_keywordIndexChanged
{
  NSArray *keywords;

  keywords = self->_keywords;
  if (keywords)
  {

    self->_keywords = 0;
  }
  return 1;
}

- (BOOL)_setDebugDumpEnabled:(BOOL)a3 dumpPath:(id)a4
{
  _BOOL4 v5;
  void *recognition;
  id v8;
  const void *v9;
  _BOOL4 v10;
  NSString *v11;
  void *v12;

  if (((((*(_BYTE *)&self->_recognizeFlags & 1) == 0) ^ a3) & 1) != 0)
    return 1;
  v5 = a3;

  self->_debugDumpPath = 0;
  recognition = self->_recognition;
  if (!recognition)
  {
    v10 = 1;
LABEL_11:
    if (v5)
    {
      if (a4 || (v12 = self->_recognition) == 0)
        v11 = (NSString *)a4;
      else
        v11 = (NSString *)VSRecognitionCopyDebugDumpPath((uint64_t)v12);
      self->_debugDumpPath = v11;
    }
    goto LABEL_17;
  }
  v8 = (id)*MEMORY[0x1E0C9B0D0];
  if (a4)
    v8 = a4;
  if (v5)
    v9 = v8;
  else
    v9 = 0;
  v10 = VSRecognitionSetDebugDumpPath((uint64_t)recognition, v9) != 0;
  if (v10)
    goto LABEL_11;
LABEL_17:
  if (v10)
  {
    *(_BYTE *)&self->_recognizeFlags = *(_BYTE *)&self->_recognizeFlags & 0xFE | v5;
    return 1;
  }
  return 0;
}

- (BOOL)_setDebugDumpEnabled:(BOOL)a3
{
  return -[VSRecognitionRecognizeAction _setDebugDumpEnabled:dumpPath:](self, "_setDebugDumpEnabled:dumpPath:", a3, 0);
}

- (BOOL)_setDebugDumpPath:(id)a3
{
  return -[VSRecognitionRecognizeAction _setDebugDumpEnabled:dumpPath:](self, "_setDebugDumpEnabled:dumpPath:", a3 != 0, a3);
}

- (id)_debugDumpPath
{
  return self->_debugDumpPath;
}

- (BOOL)_setPreferredEngine:(int)a3
{
  $273D3D7B8EE1076586458444117ACD93 recognizeFlags;
  char v4;
  void *recognition;
  int v7;

  recognizeFlags = self->_recognizeFlags;
  if (((*(unsigned int *)&recognizeFlags >> 1) & 3) == a3)
    goto LABEL_6;
  v4 = a3;
  recognition = self->_recognition;
  if (!recognition)
  {
LABEL_5:
    *(_BYTE *)&self->_recognizeFlags = *(_BYTE *)&recognizeFlags & 0xF9 | (2 * (v4 & 3));
LABEL_6:
    LOBYTE(v7) = 1;
    return v7;
  }
  v7 = VSRecognitionSetPreferredEngine((uint64_t)recognition, a3);
  if (v7)
  {
    *(_BYTE *)&recognizeFlags = self->_recognizeFlags;
    goto LABEL_5;
  }
  return v7;
}

- (BOOL)_setAudioInputPath:(id)a3
{
  NSString *audioInputPath;
  void *recognition;
  int v7;

  audioInputPath = self->_audioInputPath;
  if (audioInputPath == a3)
    goto LABEL_6;
  recognition = self->_recognition;
  if (!recognition)
  {
LABEL_5:

    self->_audioInputPath = (NSString *)a3;
LABEL_6:
    LOBYTE(v7) = 1;
    return v7;
  }
  v7 = VSRecognitionSetAudioInputPath((uint64_t)recognition, a3);
  if (v7)
  {
    audioInputPath = self->_audioInputPath;
    goto LABEL_5;
  }
  return v7;
}

- (BOOL)_setEngineResetRequired:(BOOL)a3
{
  char recognizeFlags;
  _BOOL4 v4;
  void *recognition;
  int v7;
  char v8;

  recognizeFlags = (char)self->_recognizeFlags;
  if (((((recognizeFlags & 8) == 0) ^ a3) & 1) != 0)
  {
LABEL_9:
    LOBYTE(v7) = 1;
    return v7;
  }
  v4 = a3;
  recognition = self->_recognition;
  if (!recognition)
  {
LABEL_5:
    if (v4)
      v8 = 8;
    else
      v8 = 0;
    *(_BYTE *)&self->_recognizeFlags = recognizeFlags & 0xF7 | v8;
    goto LABEL_9;
  }
  v7 = VSRecognitionSetEngineResetRequired((uint64_t)recognition, a3);
  if (v7)
  {
    recognizeFlags = (char)self->_recognizeFlags;
    goto LABEL_5;
  }
  return v7;
}

- (__VSRecognition)_createRecognitionInstanceWithCallbacks:(id *)a3 info:(void *)a4
{
  const __CFString *modelIdentifier;

  if (self->_modelIdentifier)
    modelIdentifier = (const __CFString *)self->_modelIdentifier;
  else
    modelIdentifier = CFSTR("_default");
  return (__VSRecognition *)_VSRecognitionCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], modelIdentifier, 0, (__int128 *)a3, (uint64_t)a4);
}

- (void)_configureNewRecognitionInstance
{
  __VSRecognition *v3;
  $273D3D7B8EE1076586458444117ACD93 recognizeFlags;
  int v5;
  NSString *v6;
  NSString *audioInputPath;
  void *recognition;
  double levelInterval;
  __int128 v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, void *);

  v10 = xmmword_1EA8AF8A8;
  v11 = _RecognitionCompletedCallBack;
  v3 = -[VSRecognitionRecognizeAction _createRecognitionInstanceWithCallbacks:info:](self, "_createRecognitionInstanceWithCallbacks:info:", &v10, self);
  self->_recognition = v3;
  if (v3)
  {
    recognizeFlags = self->_recognizeFlags;
    v5 = (*(unsigned int *)&recognizeFlags >> 1) & 3;
    if (v5)
    {
      VSRecognitionSetPreferredEngine((uint64_t)v3, v5);
      *(_BYTE *)&recognizeFlags = self->_recognizeFlags;
    }
    if ((*(_BYTE *)&recognizeFlags & 1) != 0)
    {
      v6 = self->_debugDumpPath ? self->_debugDumpPath : (NSString *)*MEMORY[0x1E0C9B0D0];
      if (VSRecognitionSetDebugDumpPath((uint64_t)self->_recognition, v6) && !self->_debugDumpPath)
        self->_debugDumpPath = (NSString *)VSRecognitionCopyDebugDumpPath((uint64_t)self->_recognition);
    }
    audioInputPath = self->_audioInputPath;
    recognition = self->_recognition;
    if (audioInputPath)
    {
      VSRecognitionSetAudioInputPath((uint64_t)recognition, audioInputPath);
      recognition = self->_recognition;
    }
    if ((*(_BYTE *)&self->_recognizeFlags & 8) != 0)
    {
      VSRecognitionSetEngineResetRequired((uint64_t)recognition, 1);
      recognition = self->_recognition;
    }
    levelInterval = self->_levelInterval;
    if (levelInterval > 0.0)
    {
      VSRecognitionSetInputLevelUpdateInterval((uint64_t)recognition, levelInterval);
      recognition = self->_recognition;
    }
    VSRecognitionSetBluetoothInputAllowed((uint64_t)recognition, (*(_BYTE *)&self->_recognizeFlags & 0x10) != 0);
  }
}

- (id)perform
{
  const __CFAllocator *v2;
  void *v3;
  CFIndex v4;
  char *recognition;
  void *v8;
  id v9;
  void *userInfoValues;
  void *userInfoKeys[2];

  userInfoKeys[1] = *(void **)MEMORY[0x1E0C80C00];
  v9 = 0;
  if (self->_recognition)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = (void *)*MEMORY[0x1E0C9AFB0];
    userInfoValues = CFSTR("recognition already attempted or in progress");
    userInfoKeys[0] = v3;
    v4 = -4003;
LABEL_3:
    v9 = CFErrorCreateWithUserInfoKeysAndValues(v2, CFSTR("VSErrorDomain"), v4, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
    return v9;
  }
  *(_BYTE *)&self->_recognizeFlags &= ~0x20u;
  -[VSRecognitionRecognizeAction _configureNewRecognitionInstance](self, "_configureNewRecognitionInstance", v9);
  recognition = (char *)self->_recognition;
  if (!recognition)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = (void *)*MEMORY[0x1E0C9AFB0];
    userInfoValues = CFSTR("could not create recognition instance");
    userInfoKeys[0] = v8;
    v4 = -4001;
    goto LABEL_3;
  }
  if (!_VSRecognitionPrepareAndBegin(recognition, 0, &v9))
  {
    CFRelease(self->_recognition);
    self->_recognition = 0;
  }
  return v9;
}

- (id)cancel
{
  void *recognition;
  id v5;

  v5 = 0;
  recognition = self->_recognition;
  if (recognition)
  {
    VSRecognitionCancel((uint64_t)recognition, (CFErrorRef *)&v5);
    CFRelease(self->_recognition);
    self->_recognition = 0;
  }
  -[VSRecognitionRecognizeAction _setResults:](self, "_setResults:", 0);
  return v5;
}

- (void)_releaseFromPrepare
{
  CFTypeRef cf;

  cf = 0;
  if (!_VSRecognitionPrepareAndBegin((char *)self->_recognition, 1, &cf))
  {
    CFRelease(self->_recognition);
    self->_recognition = 0;
    -[VSRecognitionAction completeWithNextAction:error:](self, "completeWithNextAction:error:", 0, cf);
    if (cf)
      CFRelease(cf);
  }
}

- (id)_actionForEmptyResults
{
  return 0;
}

- (void)_setResults:(id)a3
{
  NSArray *results;

  results = self->_results;
  if (results != a3)
  {

    self->_results = (NSArray *)a3;
  }
}

- (void)_reset
{
  NSString *audioInputPath;
  void *recognition;

  *(_BYTE *)&self->_recognizeFlags &= 0xD7u;
  audioInputPath = self->_audioInputPath;
  if (audioInputPath)
  {

    self->_audioInputPath = 0;
  }
  recognition = self->_recognition;
  if (recognition)
    CFRelease(recognition);
  self->_recognition = 0;
  -[VSRecognitionRecognizeAction _setResults:](self, "_setResults:", 0);
}

- (void)_handleRecognitionPrepared:(__VSRecognition *)a3
{
  if (self->_recognition == a3
    && objc_msgSend(-[VSRecognitionAction _session](self, "_session"), "_actionStarted:", self))
  {
    if (self->_recognition)
      -[VSRecognitionRecognizeAction _releaseFromPrepare](self, "_releaseFromPrepare");
  }
}

- (void)_handleRecognitionStarted:(__VSRecognition *)a3
{
  if (self->_recognition == a3)
    *(_BYTE *)&self->_recognizeFlags |= 0x20u;
}

- (void)_handleRecognitionCompleted:(__VSRecognition *)a3 withResults:(__CFArray *)a4 error:(__CFError *)a5
{
  int v5;
  VSRecognitionRecognizeAction *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  CFIndex v14;
  CFIndex v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  NSObject *v19;
  char v20;
  __CFArray *v21;
  id v22;
  void *recognition;
  __int128 v24;
  __CFArray *otherArray;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;
  CFRange v31;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = 64;
  if (self->_recognition != a3)
    return;
  v9 = self;
  v10 = 0;
  v11 = 0;
  if (!a4 || a5)
  {
    v21 = 0;
    v16 = 0;
    v17 = 0;
  }
  else
  {
    v12 = -[__CFArray count](a4, "count");
    v14 = v12 - 1;
    if (v12 < 1)
    {
      v10 = 0;
      v21 = 0;
      v11 = 0;
      v16 = 0;
      v17 = 0;
    }
    else
    {
      v15 = 0;
      v26 = 0;
      v27 = 0;
      LOBYTE(v5) = 0;
      v16 = 0;
      v17 = 0;
      v18 = 1;
      *(_QWORD *)&v13 = 138412290;
      v24 = v13;
      otherArray = a4;
      while (1)
      {
        v10 = (void *)-[__CFArray objectAtIndex:](a4, "objectAtIndex:", v15, v24);
        if ((*(_BYTE *)&self->_recognizeFlags & 1) != 0)
        {
          v19 = VSGetLogDefault();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v24;
            v29 = v10;
            _os_log_debug_impl(&dword_1DE15E000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
        if (v18)
        {
          v16 = (void *)objc_msgSend(v10, "createHandler");
          ++v17;
          if (v16)
          {
            v20 = objc_opt_respondsToSelector();
            if (v15 >= v14)
            {
              LOBYTE(v5) = v20 & 1;
              a4 = (__CFArray *)-[__CFArray subarrayWithRange:](a4, "subarrayWithRange:", v15, 1);
            }
            else if ((v20 & 1) != 0)
            {
              v26 = objc_msgSend(v10, "modelIdentifier");
              if (v15)
              {
                v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v27, "addObject:", v10);
              }
              LOBYTE(v5) = 1;
            }
            else
            {
              LOBYTE(v5) = 0;
            }
          }
        }
        else if (objc_msgSend((id)objc_msgSend(v10, "modelIdentifier"), "isEqualToString:", v26))
        {
          if (v27)
            objc_msgSend(v27, "addObject:", v10);
          ++v17;
        }
        else if (!v27)
        {
          v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v31.location = 0;
          v31.length = v15;
          CFArrayAppendArray((CFMutableArrayRef)v27, otherArray, v31);
        }
        v11 = v5;
        if (v14 == v15)
          break;
        v18 = v16 == 0;
        ++v15;
        if (v16)
        {
          if (!v5)
            break;
        }
      }
      a5 = 0;
      v21 = (__CFArray *)v27;
    }
  }
  -[VSRecognitionRecognizeAction _setResults:](self, "_setResults:", 0);
  if (v21)
    a4 = v21;
  if (a5 || v17)
  {
    if (v16)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v16, "requiresThreadedProcessing"))
      {
        if (v11)
        {
          -[__CFArray makeObjectsPerformSelector:withObject:](a4, "makeObjectsPerformSelector:withObject:", sel_setRecognitionAction_, self);
          v22 = (id)objc_msgSend(v16, "actionForRecognitionResults:", a4);
          -[__CFArray makeObjectsPerformSelector:withObject:](a4, "makeObjectsPerformSelector:withObject:", sel_setRecognitionAction_, 0);
        }
        else
        {
          objc_msgSend(v10, "setRecognitionAction:", self);
          v22 = (id)objc_msgSend(v16, "actionForRecognitionResult:", v10);
          objc_msgSend(v10, "setRecognitionAction:", 0);
        }
        goto LABEL_46;
      }
      if ((v11 & 1) == 0)
        a4 = (__CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v10);
      -[VSRecognitionRecognizeAction _setResults:](self, "_setResults:", a4);
      objc_msgSend((id)objc_msgSend(-[VSRecognitionAction _session](self, "_session"), "_recognitionResultHandlingThread"), "handleResults:withHandler:", a4, v16);
    }
    v22 = 0;
  }
  else
  {
    v22 = -[VSRecognitionRecognizeAction _actionForEmptyResults](self, "_actionForEmptyResults");
  }
LABEL_46:
  recognition = self->_recognition;
  if (recognition)
  {
    CFRelease(recognition);
    self->_recognition = 0;
  }
  if (!self->_results)
    -[VSRecognitionAction completeWithNextAction:error:](self, "completeWithNextAction:error:", v22, a5);

}

- (void)_handledThreadedResults:(id)a3 nextAction:(id)a4
{
  if (self->_results == a3)
  {
    -[VSRecognitionRecognizeAction _setResults:](self, "_setResults:", 0);
    -[VSRecognitionAction completeWithNextAction:error:](self, "completeWithNextAction:error:", a4, 0);
  }
}

@end

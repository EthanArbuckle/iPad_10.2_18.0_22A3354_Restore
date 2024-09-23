@implementation CACSpeechSystem

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_18);
}

void __29__CACSpeechSystem_initialize__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.speech.RXAPIDispatchQueue", 0);
  v1 = (void *)sRXAPIDispatchQueue;
  sRXAPIDispatchQueue = (uint64_t)v0;

}

+ (id)rxContextDictionaryForLanguageModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("LanguageModel"));
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("Identifier"));

  }
  return v4;
}

+ (id)valueFromRXContextKey:(id)a3 rxLanguageObject:(__RXLanguageObject *)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)RXObjectCopyProperty();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)speechSystem
{
  id v2;
  CACSpeechSystem *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = a1;
  objc_sync_enter(v2);
  if (!sCACSpeechSystem)
  {
    v3 = [CACSpeechSystem alloc];
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestLocaleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CACSpeechSystem initLocaleIdentifer:microphoneIdentifier:](v3, "initLocaleIdentifer:microphoneIdentifier:", v5, 0);
    v7 = (void *)sCACSpeechSystem;
    sCACSpeechSystem = v6;

  }
  objc_sync_exit(v2);

  return (id)sCACSpeechSystem;
}

+ (void)closeSpeechSystem
{
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  if (sCACSpeechSystem)
    dispatch_sync((dispatch_queue_t)sRXAPIDispatchQueue, &__block_literal_global_11);
  objc_sync_exit(obj);

}

void __36__CACSpeechSystem_closeSpeechSystem__block_invoke()
{
  void *v0;

  objc_msgSend((id)sCACSpeechSystem, "_close");
  v0 = (void *)sCACSpeechSystem;
  sCACSpeechSystem = 0;

}

+ (BOOL)isSpeechSystemServerRunning
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CACSpeechSystem_isSpeechSystemServerRunning__block_invoke;
  block[3] = &unk_24F2ABE98;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)sRXAPIDispatchQueue, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __46__CACSpeechSystem_isSpeechSystemServerRunning__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = sCACSpeechSystem;
  if (sCACSpeechSystem)
  {
    +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recognitionSystemRef");
  }
  v3 = (void *)RXObjectCopyProperty();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

  if (v2)
}

+ (void)recognizeString:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  if (sCACSpeechSystem)
  {
    v6 = (id)sCACSpeechSystem;
    v7 = sRXAPIDispatchQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __35__CACSpeechSystem_recognizeString___block_invoke;
    v9[3] = &unk_24F2AAD70;
    v10 = v6;
    v11 = v4;
    v8 = v6;
    dispatch_async(v7, v9);

  }
  objc_sync_exit(v5);

}

uint64_t __35__CACSpeechSystem_recognizeString___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "recognitionSystemRef");
  return RXObjectSetProperty();
}

+ (void)startPreventingDisplayDimming
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "Error in idle timer assertion: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __48__CACSpeechSystem_startPreventingDisplayDimming__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_stopPreventingDisplayDimming, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_stopPreventingDisplayDimming, 0, 10.0);
}

+ (void)stopPreventingDisplayDimming
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  if (sActiveIdleTimerAssertion)
  {
    objc_msgSend((id)sActiveIdleTimerAssertion, "invalidate");
    v2 = (void *)sActiveIdleTimerAssertion;
    sActiveIdleTimerAssertion = 0;

  }
  objc_sync_exit(obj);

}

- (id)initLocaleIdentifer:(id)a3 microphoneIdentifier:(id)a4
{
  id v5;
  CACSpeechSystem *v6;
  void *v7;
  uint64_t v8;
  NSString *recognitionLocaleIdentifier;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  CACSpeechSystem *v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CACSpeechSystem;
  v6 = -[CACSpeechSystem init](&v16, sel_init);
  if (v6)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bestLocaleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    recognitionLocaleIdentifier = v6->_recognitionLocaleIdentifier;
    v6->_recognitionLocaleIdentifier = (NSString *)v8;

    v10 = sRXAPIDispatchQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__CACSpeechSystem_initLocaleIdentifer_microphoneIdentifier___block_invoke;
    v13[3] = &unk_24F2AAD70;
    v14 = v5;
    v6 = v6;
    v15 = v6;
    dispatch_sync(v10, v13);
    if (!v6->_recognitionSystemRef)
    {
      CACLogRecognition();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CACSpeechSystem initLocaleIdentifer:microphoneIdentifier:].cold.1(v11);

      v6 = 0;
    }

  }
  return v6;
}

void __60__CACSpeechSystem_initLocaleIdentifer_microphoneIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  const void *v10;
  uint8_t v11[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) = RXRecognitionSystemCreate();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
  {
    RXObjectSetProperty();
    RXObjectSetProperty();
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE637D0]);

    if (v4 == 1)
    {
      RXObjectSetProperty();
      CACLogRecognition();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_229A40000, v5, OS_LOG_TYPE_DEFAULT, "Filtering profanity", v11, 2u);
      }

    }
    RXObjectSetProperty();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (void *)RXLocalesSupportingSpellingMode();
    v8 = +[CACLocaleUtilities isLocaleIdentifier:containedInLocaleIdentifiers:](CACLocaleUtilities, "isLocaleIdentifier:containedInLocaleIdentifiers:", v6, v7);

    if (v8)
    {
      v9 = (void *)RXObjectCopyProperty();
      if (v9)
      {
        v10 = v9;
        LOBYTE(v8) = objc_msgSend(v9, "containsObject:", CFSTR("SpellCC"));
        CFRelease(v10);
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 48) = v8;
  }

}

uint64_t __60__CACSpeechSystem_initLocaleIdentifer_microphoneIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleSRSystemBeginUtteranceWithID:", a2);

  return +[CACSpeechSystem startPreventingDisplayDimming](CACSpeechSystem, "startPreventingDisplayDimming");
}

void __60__CACSpeechSystem_initLocaleIdentifer_microphoneIdentifier___block_invoke_3()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_23);
}

void __60__CACSpeechSystem_initLocaleIdentifer_microphoneIdentifier___block_invoke_4()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  CACLogRecognition();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_229A40000, v0, OS_LOG_TYPE_DEFAULT, "Handling kRXRecognitionSystemProperty_ServerErrorCallback", v2, 2u);
  }

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleSRSystemServerError");

}

- (void)_close
{
  NSTimer *setLeadingContextStringDelayTimer;
  NSTimer *setAdditionalContextStringsDelayTimer;
  __CFLocale *currentLocaleRef;
  __RXVocabulary *currentRXVocabularyRef;

  -[NSTimer invalidate](self->_setLeadingContextStringDelayTimer, "invalidate");
  setLeadingContextStringDelayTimer = self->_setLeadingContextStringDelayTimer;
  self->_setLeadingContextStringDelayTimer = 0;

  -[NSTimer invalidate](self->_setAdditionalContextStringsDelayTimer, "invalidate");
  setAdditionalContextStringsDelayTimer = self->_setAdditionalContextStringsDelayTimer;
  self->_setAdditionalContextStringsDelayTimer = 0;

  if (self->_recognitionSystemRef)
  {
    RXObjectSetProperty();
    RXObjectSetProperty();
    RXObjectSetProperty();
    RXRelease(self->_recognitionSystemRef);
    self->_recognitionSystemRef = 0;
  }
  currentLocaleRef = self->_currentLocaleRef;
  if (currentLocaleRef)
  {
    CFRelease(currentLocaleRef);
    self->_currentLocaleRef = 0;
  }
  currentRXVocabularyRef = self->_currentRXVocabularyRef;
  if (currentRXVocabularyRef)
  {
    RXRelease(currentRXVocabularyRef);
    self->_currentRXVocabularyRef = 0;
  }
  +[CACSpeechSystem stopPreventingDisplayDimming](CACSpeechSystem, "stopPreventingDisplayDimming");
}

- (__CFLocale)currentLocaleRef
{
  __CFLocale *result;
  __CFString *v4;

  result = self->_currentLocaleRef;
  if (!result)
  {
    -[CACSpeechSystem recognitionLocaleIdentifier](self, "recognitionLocaleIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    self->_currentLocaleRef = CFLocaleCreate(0, v4);

    return self->_currentLocaleRef;
  }
  return result;
}

- (__RXVocabulary)currentRXVocabularyRef
{
  __RXVocabulary *result;

  result = self->_currentRXVocabularyRef;
  if (!result)
  {
    -[CACSpeechSystem currentLocaleRef](self, "currentLocaleRef");
    result = (__RXVocabulary *)RXVocabularyCreateWithLocale();
    self->_currentRXVocabularyRef = result;
  }
  return result;
}

- (__RXRecognitionSystem)recognitionSystemRef
{
  return self->_recognitionSystemRef;
}

- (__RXLanguageObject)createRXLanguageObjectRefFromCACLanguageModel:(id)a3
{
  return -[CACSpeechSystem createRXLanguageObjectRefFromCACLanguageModel:ignoreBuiltInLMTable:](self, "createRXLanguageObjectRefFromCACLanguageModel:ignoreBuiltInLMTable:", a3, 0);
}

- (__RXLanguageObject)createRXLanguageObjectRefFromCACLanguageModel:(id)a3 ignoreBuiltInLMTable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  __RXLanguageObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  __RXLanguageObject *v28;
  __RXLanguageObject *v29;
  void *v30;
  uint64_t v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForAttribute:", kCACLanguageModelAttributeParameterIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") && !v4)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (__RXLanguageObject *)objc_msgSend(v8, "rxLanguageObjectForBuiltInLMIdentifier:", v7);

    if (v9)
      CFRetain(v9);
    goto LABEL_35;
  }
  objc_msgSend(v6, "objectForAttribute:", *MEMORY[0x24BEAFF60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    objc_msgSend(v6, "identifier");
    +[CACSpeechSystem rxContextDictionaryForLanguageModel:](CACSpeechSystem, "rxContextDictionaryForLanguageModel:", v6);
    v12 = RXPathCreate();
  }
  else
  {
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BEAFEF0]))
    {

    }
    else
    {
      objc_msgSend(v6, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEAFEF8]);

      if (!v15)
      {
        objc_msgSend(v6, "identifier");
        +[CACSpeechSystem rxContextDictionaryForLanguageModel:](CACSpeechSystem, "rxContextDictionaryForLanguageModel:", v6);
        v12 = RXLanguageModelCreate();
        goto LABEL_12;
      }
    }
    objc_msgSend(v6, "identifier");
    -[CACSpeechSystem currentRXVocabularyRef](self, "currentRXVocabularyRef");
    +[CACSpeechSystem rxContextDictionaryForLanguageModel:](CACSpeechSystem, "rxContextDictionaryForLanguageModel:", v6);
    v12 = RXAdLibCreate();
  }
LABEL_12:
  v9 = (__RXLanguageObject *)v12;
  objc_msgSend(v6, "objectForAttribute:", *MEMORY[0x24BEAFF58]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
    RXObjectSetProperty();
  objc_msgSend(v6, "objectForAttribute:", kCACLanguageModelAttributeCommandIdentifier);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    RXObjectSetProperty();
  objc_msgSend(v6, "objectForAttribute:", kCACLanguageModelAttributeCustomCommands);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if (v20)
    RXObjectSetProperty();
  objc_msgSend(v6, "children");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    v33 = v18;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v6, "children");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          v28 = -[CACSpeechSystem createRXLanguageObjectRefFromCACLanguageModel:ignoreBuiltInLMTable:](self, "createRXLanguageObjectRefFromCACLanguageModel:ignoreBuiltInLMTable:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), v4);
          if (v28)
          {
            v29 = v28;
            RXLanguageObjectAddObject();
            RXRelease(v29);
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v25);
    }

    v18 = v33;
  }
  else
  {
    objc_msgSend(v6, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "length"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v30, "string");
        v31 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v31;
      }
      -[CACSpeechSystem currentRXVocabularyRef](self, "currentRXVocabularyRef");
      -[CACSpeechSystem currentLocaleRef](self, "currentLocaleRef");
      RXLanguageObjectAddPhraseAndAlternatives();
    }

  }
LABEL_35:

  return v9;
}

- (id)resultLanguageModelFromRXLanguageObject:(__RXLanguageObject *)a3
{
  void *v4;
  void *v5;
  CFLocaleRef v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t Count;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v23;
  const __CFLocale *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  +[CACSpeechSystem valueFromRXContextKey:rxLanguageObject:](CACSpeechSystem, "valueFromRXContextKey:rxLanguageObject:", CFSTR("LanguageModel"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v5)
  {
    v6 = CFLocaleCreate(0, (CFLocaleIdentifier)-[CACSpeechSystem recognitionLocaleIdentifier](self, "recognitionLocaleIdentifier"));
    v7 = (void *)RXObjectCopyPropertyWithLocale();
    objc_msgSend(v5, "setText:", v7);
    if (RXLanguageObjectGetType() == 4)
    {
      v8 = (void *)RXObjectCopyPropertyWithLocale();
      if (objc_msgSend(v8, "count") == 1)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "length"))
        {
          v24 = v6;
          objc_msgSend(v9, "addObject:", v7);
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v23 = v8;
          objc_msgSend(v8, "objectAtIndex:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v26;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v26 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
                if ((objc_msgSend(v15, "isEqualToString:", v7) & 1) == 0)
                  objc_msgSend(v9, "addObject:", v15);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            }
            while (v12);
          }

          v8 = v23;
          v6 = v24;
        }
        else
        {
          objc_msgSend(v8, "objectAtIndex:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v16);

        }
        objc_msgSend(v5, "attributes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v9, kCACLanguageModelAttributeTextVariants);

      }
    }
    Count = RXLanguageObjectGetCount();
    if (Count >= 1)
    {
      v19 = Count;
      for (j = 0; j != v19; ++j)
      {
        -[CACSpeechSystem resultLanguageModelFromRXLanguageObject:](self, "resultLanguageModelFromRXLanguageObject:", RXLanguageObjectGetObjectAtIndex());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v5, "addChildLanguageModel:", v21);

      }
    }
    if (v6)
      CFRelease(v6);

  }
  return v5;
}

- (void)setLeadingContextString:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__CACSpeechSystem_setLeadingContextString___block_invoke;
  v6[3] = &unk_24F2AAD70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __43__CACSpeechSystem_setLeadingContextString___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v3 = (void *)MEMORY[0x24BDBCF40];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__CACSpeechSystem_setLeadingContextString___block_invoke_2;
  v8[3] = &unk_24F2ABF60;
  v4 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 0.5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  objc_sync_exit(v2);
}

void __43__CACSpeechSystem_setLeadingContextString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

  objc_sync_exit(v4);
  v7 = sRXAPIDispatchQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__CACSpeechSystem_setLeadingContextString___block_invoke_3;
  v9[3] = &unk_24F2AAD70;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  dispatch_async(v7, v9);

}

uint64_t __43__CACSpeechSystem_setLeadingContextString___block_invoke_3(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
    return RXRecognitionSystemAddLeadingContext();
  return result;
}

- (void)setSecureFieldFocused:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_recognitionSystemRef)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __41__CACSpeechSystem_setSecureFieldFocused___block_invoke;
    v3[3] = &unk_24F2ABF88;
    v3[4] = self;
    v4 = a3;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, v3);
  }
}

uint64_t __41__CACSpeechSystem_setSecureFieldFocused___block_invoke()
{
  return RXRecognitionSystemSetSecureFieldFocused();
}

- (void)setAdditionalContextStrings:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke;
  v6[3] = &unk_24F2AAD70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v3 = (void *)MEMORY[0x24BDBCF40];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke_2;
  v8[3] = &unk_24F2ABF60;
  v4 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 0.5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_sync_exit(v2);
}

void __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  objc_sync_exit(v4);
  v7 = sRXAPIDispatchQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke_3;
  v9[3] = &unk_24F2AAD70;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  dispatch_async(v7, v9);

}

uint64_t __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke_3(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
    return RXRecognitionSystemAddOtherContext();
  return result;
}

- (void)rxRecognitionSystemReset
{
  _QWORD block[5];

  if (self->_recognitionSystemRef)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__CACSpeechSystem_rxRecognitionSystemReset__block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
  }
}

uint64_t __43__CACSpeechSystem_rxRecognitionSystemReset__block_invoke()
{
  return RXRecognitionSystemReset();
}

- (void)setRxRecognitionSystemResetMode:(int)a3
{
  _QWORD v3[5];
  int v4;

  if (self->_recognitionSystemRef)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __51__CACSpeechSystem_setRxRecognitionSystemResetMode___block_invoke;
    v3[3] = &unk_24F2ABFB0;
    v3[4] = self;
    v4 = a3;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, v3);
  }
}

uint64_t __51__CACSpeechSystem_setRxRecognitionSystemResetMode___block_invoke()
{
  return RXRecognitionSystemSetResetMode();
}

- (NSString)recognitionLocaleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)supportsSpellingMode
{
  return self->_supportsSpellingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognitionLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_setAdditionalContextStringsDelayTimer, 0);
  objc_storeStrong((id *)&self->_setLeadingContextStringDelayTimer, 0);
}

- (void)initLocaleIdentifer:(os_log_t)log microphoneIdentifier:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229A40000, log, OS_LOG_TYPE_ERROR, "RXRecognitionSystemCreate failed", v1, 2u);
}

@end

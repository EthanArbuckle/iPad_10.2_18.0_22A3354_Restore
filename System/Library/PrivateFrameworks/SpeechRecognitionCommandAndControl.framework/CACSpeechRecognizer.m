@implementation CACSpeechRecognizer

- (void)dealloc
{
  objc_super v3;

  RXRelease(self->_recognizer);
  v3.receiver = self;
  v3.super_class = (Class)CACSpeechRecognizer;
  -[CACSpeechRecognizer dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (id)languageModel
{
  CACSpeechRecognizer *v2;
  CACLanguageModel *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_languageModel;
  objc_sync_exit(v2);

  return v3;
}

- (void)closeSpeechRecognizer
{
  CACSpeechRecognizer *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CACSpeechRecognizer stopListening](obj, "stopListening");
  RXRelease(obj->_rxLanguageModel);
  obj->_rxLanguageModel = 0;
  -[CACSpeechRecognizer setLanguageModel:](obj, "setLanguageModel:", 0);
  RXRelease(obj->_recognizer);
  obj->_recognizer = 0;
  objc_sync_exit(obj);

}

- (BOOL)isSpeechRecognizerOpen
{
  CACSpeechRecognizer *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_recognizer != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLanguageModel:(id)a3
{
  CACLanguageModel *v4;
  CACLanguageModel *languageModel;
  CACSpeechRecognizer *obj;

  v4 = (CACLanguageModel *)a3;
  obj = self;
  objc_sync_enter(obj);
  languageModel = obj->_languageModel;
  obj->_languageModel = v4;

  objc_sync_exit(obj);
}

- (void)openSpeechRecognizer
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD block[6];

  +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "recognitionSystemRef");

  if (v4)
  {
    v5 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke;
    block[3] = &unk_24F2ABFD8;
    block[4] = self;
    block[5] = v4;
    dispatch_sync((dispatch_queue_t)sRXAPIDispatchQueue, block);
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke_4;
    v6[3] = &unk_24F2AA860;
    v6[4] = self;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, v6);
  }
}

uint64_t __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = RXRecognizerCreate();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = result;
  return result;
}

uint64_t __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke_2(uint64_t a1, const void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  if (a2)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerSignPostBeginProcessingForSpeechRecognizer:message:", v5, v6);

    CFRetain(a2);
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke_3;
  v8[3] = &unk_24F2ABFD8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = a2;
  dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, v8);
  return +[CACSpeechSystem stopPreventingDisplayDimming](CACSpeechSystem, "stopPreventingDisplayDimming");
}

void __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "speechRecognizer:didRecognizeRXResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  RXRelease(*(const void **)(a1 + 40));
}

uint64_t __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke_4(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 16))
  {
    v1 = result;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 20);
    RXObjectSetProperty();
    *(_QWORD *)(*(_QWORD *)(v1 + 32) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "createRXLanguageObjectRef");
    RXObjectSetProperty();
    RXObjectSetProperty();
    RXObjectSetProperty();
    return RXObjectSetProperty();
  }
  return result;
}

- (void)startListening
{
  CACSpeechRecognizer *v2;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!-[CACSpeechRecognizer isSpeechRecognizerOpen](v2, "isSpeechRecognizerOpen"))
    -[CACSpeechRecognizer openSpeechRecognizer](v2, "openSpeechRecognizer");
  if (v2->_recognizer && !v2->_isListening)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__CACSpeechRecognizer_startListening__block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
    v2->_isListening = 1;
    v2->_waitingForResponse = 0;
  }
  objc_sync_exit(v2);

}

uint64_t __37__CACSpeechRecognizer_startListening__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
    return RXObjectSetProperty();
  return result;
}

- (void)stopListening
{
  CACSpeechRecognizer *v2;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_recognizer && v2->_isListening)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__CACSpeechRecognizer_stopListening__block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
    v2->_waitingForResponse = 1;
    v2->_isListening = 0;
  }
  objc_sync_exit(v2);

}

uint64_t __36__CACSpeechRecognizer_stopListening__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
    return RXObjectSetProperty();
  return result;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setCommandInfo:(id)a3
{
  id v4;
  CACSpeechRecognizer *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_recognizer)
  {
    v6 = sRXAPIDispatchQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__CACSpeechRecognizer_setCommandInfo___block_invoke;
    v7[3] = &unk_24F2AAD70;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(v6, v7);

  }
  objc_sync_exit(v5);

}

uint64_t __38__CACSpeechRecognizer_setCommandInfo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
    return RXObjectSetProperty();
  return result;
}

- (BOOL)requestCloseMatchResults
{
  return self->_requestCloseMatchResults;
}

- (void)setRequestCloseMatchResults:(BOOL)a3
{
  _QWORD block[5];

  if (self->_requestCloseMatchResults != a3)
  {
    self->_requestCloseMatchResults = a3;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__CACSpeechRecognizer_setRequestCloseMatchResults___block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
  }
}

uint64_t __51__CACSpeechRecognizer_setRequestCloseMatchResults___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
    return RXObjectSetProperty();
  return result;
}

- (BOOL)spellingMode
{
  return self->_spellingMode;
}

- (void)setSpellingMode:(BOOL)a3
{
  _QWORD block[5];

  if (self->_spellingMode != a3)
  {
    self->_spellingMode = a3;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__CACSpeechRecognizer_setSpellingMode___block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
  }
}

uint64_t __39__CACSpeechRecognizer_setSpellingMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
    return RXObjectSetProperty();
  return result;
}

- (BOOL)numberMode
{
  return self->_numberMode;
}

- (void)setNumberMode:(BOOL)a3
{
  _QWORD block[5];

  if (self->_numberMode != a3)
  {
    self->_numberMode = a3;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__CACSpeechRecognizer_setNumberMode___block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
  }
}

uint64_t __37__CACSpeechRecognizer_setNumberMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
    return RXObjectSetProperty();
  return result;
}

- (unint64_t)recognizerFlags
{
  return self->_recognizerFlags;
}

- (void)setRecognizerFlags:(unint64_t)a3
{
  self->_recognizerFlags = a3;
}

- (__RXLanguageObject)rxLanguageModel
{
  return self->_rxLanguageModel;
}

- (BOOL)preventRecognizedTextFeedback
{
  return self->_preventRecognizedTextFeedback;
}

- (void)setPreventRecognizedTextFeedback:(BOOL)a3
{
  self->_preventRecognizedTextFeedback = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_languageModel, 0);
}

@end

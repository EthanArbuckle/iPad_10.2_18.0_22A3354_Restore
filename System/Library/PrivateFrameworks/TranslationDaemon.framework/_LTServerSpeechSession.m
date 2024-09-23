@implementation _LTServerSpeechSession

- (_LTServerSpeechSession)initWithEngine:(id)a3 delegate:(id)a4 selfLoggingManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  _LTServerSpeechSession *v12;
  _LTServerSpeechSession *v13;
  _LTHybridEndpointer *v14;
  _LTHybridEndpointer *endpointer;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  _LTLanguageDetector *v18;
  _LTLanguageDetector *languageDetector;
  _LTServerSpeechSession *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_LTServerSpeechSession;
  v12 = -[_LTServerSpeechSession init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_engine, a3);
    objc_storeStrong((id *)&v13->_delegate, a4);
    objc_storeStrong((id *)&v13->_selfLoggingManager, a5);
    v14 = objc_alloc_init(_LTHybridEndpointer);
    endpointer = v13->_endpointer;
    v13->_endpointer = v14;

    v16 = dispatch_queue_create("com.apple.translation.session", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    v18 = -[_LTLanguageDetector initWithSelfLoggingManager:]([_LTLanguageDetector alloc], "initWithSelfLoggingManager:", v13->_selfLoggingManager);
    languageDetector = v13->_languageDetector;
    v13->_languageDetector = v18;

    v20 = v13;
  }

  return v13;
}

- (void)startSpeechTranslationWithContext:(id)a3
{
  NSError *translationError;
  _LTSpeechActivityDetector *v6;
  _LTSpeechActivityDetector *speechDetector;
  _LTSpeechDataQueue *v8;
  _LTSpeechDataQueue *cache;
  id v10;

  v10 = a3;
  *(_WORD *)&self->_expectFinalLidResult = 0;
  self->_translationFinished = 0;
  atomic_store(0, (unsigned __int8 *)&self->_speechActivityDetected);
  translationError = self->_translationError;
  self->_translationError = 0;

  objc_storeStrong((id *)&self->_context, a3);
  if (objc_msgSend(v10, "enableVAD"))
  {
    v6 = -[_LTSpeechActivityDetector initWithDelegate:]([_LTSpeechActivityDetector alloc], "initWithDelegate:", self);
    speechDetector = self->_speechDetector;
    self->_speechDetector = v6;

    v8 = -[_LTSpeechDataQueue initForSeconds:]([_LTSpeechDataQueue alloc], "initForSeconds:", _LTPreferencesVADAudioCacheMaxDuration());
    cache = self->_cache;
    self->_cache = v8;

  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_speechActivityDetected);
    -[_LTServerSpeechSession _startSpeechTranslationWithContext:](self, "_startSpeechTranslationWithContext:", v10);
  }

}

- (void)_startSpeechTranslationWithContext:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "autodetectLanguage"))
  {
    self->_expectFinalLidResult = 1;
    -[_LTLanguageDetector startLanguageDetectionWithContext:delegate:](self->_languageDetector, "startLanguageDetectionWithContext:delegate:", v4, self);
  }
  -[_LTHybridEndpointer startEndpointingWithContext:delegate:](self->_endpointer, "startEndpointingWithContext:delegate:", v4, self);
  -[_LTTranslationEngine startSpeechTranslationWithContext:delegate:](self->_engine, "startSpeechTranslationWithContext:delegate:", v4, self);

}

- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4
{
  _LTTranslationContext *v6;
  NSError *translationError;
  _LTTranslationContext *context;
  _LTTranslationContext *v9;
  id v10;

  v6 = (_LTTranslationContext *)a3;
  *(_WORD *)&self->_expectFinalLidResult = 0;
  self->_translationFinished = 0;
  translationError = self->_translationError;
  self->_translationError = 0;
  v10 = a4;

  context = self->_context;
  self->_context = v6;
  v9 = v6;

  -[_LTTranslationEngine startTextToSpeechTranslationWithContext:text:delegate:](self->_engine, "startTextToSpeechTranslationWithContext:text:delegate:", v9, v10, self);
}

- (void)addSpeechAudioData:(id)a3
{
  id v4;
  unsigned __int8 v5;
  _LTSpeechDataQueue *cache;
  _LTSpeechDataQueue *v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&self->_speechActivityDetected);
  if ((v5 & 1) != 0)
  {
    cache = self->_cache;
    if (cache)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __45___LTServerSpeechSession_addSpeechAudioData___block_invoke;
      v8[3] = &unk_251A13968;
      v8[4] = self;
      -[_LTSpeechDataQueue consumeAll:](cache, "consumeAll:", v8);
      v7 = self->_cache;
      self->_cache = 0;

    }
    -[_LTServerSpeechSession _translateSpeechAudioData:](self, "_translateSpeechAudioData:", v4);
  }
  else
  {
    -[_LTSpeechActivityDetector addSpeechAudioData:](self->_speechDetector, "addSpeechAudioData:", v4);
    -[_LTSpeechDataQueue addSpeechAudioData:](self->_cache, "addSpeechAudioData:", v4);
  }

}

- (void)_translateSpeechAudioData:(id)a3
{
  id v4;

  v4 = a3;
  -[_LTLanguageDetector addSpeechAudioData:](self->_languageDetector, "addSpeechAudioData:");
  -[_LTHybridEndpointer addSpeechAudioData:](self->_endpointer, "addSpeechAudioData:", v4);
  -[_LTTranslationEngine addSpeechAudioData:](self->_engine, "addSpeechAudioData:", v4);

}

- (void)endAudio
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Sending end of audio", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)cancel
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Asked to cancel speech session", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)delegateTranslationDidFinishWithError:(id)a3
{
  void (**completionHandler)(id, id);
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_LTSpeechTranslationDelegate translationDidFinishWithError:](self->_delegate, "translationDidFinishWithError:", v5);
  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, v5);

}

- (void)speechActivityDetected
{
  unsigned __int8 v2;
  _LTSpeechActivityDetector *speechDetector;

  v2 = atomic_load((unsigned __int8 *)&self->_speechActivityDetected);
  if ((v2 & 1) == 0)
  {
    -[_LTServerSpeechSession _startSpeechTranslationWithContext:](self, "_startSpeechTranslationWithContext:", self->_context);
    speechDetector = self->_speechDetector;
    self->_speechDetector = 0;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_LTSpeechTranslationDelegate speechActivityDetected](self->_delegate, "speechActivityDetected");
    atomic_store(1u, (unsigned __int8 *)&self->_speechActivityDetected);
  }
}

- (void)languageDetectionResult:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_LTSpeechTranslationDelegate languageDetectionResult:](self->_delegate, "languageDetectionResult:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_LTTranslationEngine setLanguagesRecognized:context:](self->_engine, "setLanguagesRecognized:context:", v4, self->_context);
  if (objc_msgSend(v4, "isFinal"))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50___LTServerSpeechSession_languageDetectionResult___block_invoke;
    v6[3] = &unk_251A13100;
    objc_copyWeak(&v7, &location);
    dispatch_async(queue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

- (void)languageDetectionCompleted
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_LTSpeechTranslationDelegate languageDetectionCompleted](self->_delegate, "languageDetectionCompleted");
}

- (void)hybridEndpointerFoundEndpoint
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "HEP triggered", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)serverEndpointerFeatures:(id)a3 locale:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[_LTHybridEndpointer setServerEndpointerFeatures:withLocale:](self->_endpointer, "setServerEndpointerFeatures:withLocale:", v7, v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_LTSpeechTranslationDelegate serverEndpointerFeatures:locale:](self->_delegate, "serverEndpointerFeatures:locale:", v7, v6);

}

- (void)speechRecognitionResult:(id)a3
{
  id v4;

  v4 = a3;
  -[_LTLanguageDetector addSpeechRecognitionResult:](self->_languageDetector, "addSpeechRecognitionResult:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_LTSpeechTranslationDelegate speechRecognitionResult:](self->_delegate, "speechRecognitionResult:", v4);

}

- (void)translatorDidTranslate:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_LTSpeechTranslationDelegate translatorDidTranslate:](self->_delegate, "translatorDidTranslate:", v4);

}

- (void)translationDidFinishWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56___LTServerSpeechSession_translationDidFinishWithError___block_invoke;
  block[3] = &unk_251A130D8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (_LTTranslationEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_LTLanguageDetector)languageDetector
{
  return self->_languageDetector;
}

- (_LTHybridEndpointer)endpointer
{
  return self->_endpointer;
}

- (_LTSpeechTranslationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (_LTDSELFLoggingManager)selfLoggingManager
{
  return self->_selfLoggingManager;
}

- (void)setSelfLoggingManager:(id)a3
{
  objc_storeStrong((id *)&self->_selfLoggingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_endpointer, 0);
  objc_storeStrong((id *)&self->_languageDetector, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_speechDetector, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_translationError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

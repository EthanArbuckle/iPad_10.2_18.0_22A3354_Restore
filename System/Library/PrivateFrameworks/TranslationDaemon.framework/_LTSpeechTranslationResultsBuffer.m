@implementation _LTSpeechTranslationResultsBuffer

- (_LTSpeechTranslationResultsBuffer)init
{
  _LTSpeechTranslationResultsBuffer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *lastASRResults;
  _LTSpeechTranslationResultsBuffer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LTSpeechTranslationResultsBuffer;
  v2 = -[_LTSpeechTranslationResultsBuffer init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    lastASRResults = v2->_lastASRResults;
    v2->_lastASRResults = v3;

    v2->_isBuffering = 1;
    *(_WORD *)&v2->_didFinish = 0;
    v5 = v2;
  }

  return v2;
}

- (void)signalDelegateWhenFinished
{
  self->_signalDelegateWhenFinished = 1;
}

- (void)stopBuffering
{
  void *v3;
  char v4;
  NSMutableDictionary *lastASRResults;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[5];

  -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    lastASRResults = self->_lastASRResults;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50___LTSpeechTranslationResultsBuffer_stopBuffering__block_invoke;
    v12[3] = &unk_251A13B28;
    v12[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lastASRResults, "enumerateKeysAndObjectsUsingBlock:", v12);
  }
  if (self->_translationResult)
  {
    -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "translatorDidTranslate:", self->_translationResult);

    }
  }
  if (self->_didFinish)
  {
    -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "translationDidFinishWithError:", self->_error);

    }
  }
  self->_isBuffering = 0;
  self->_signalDelegateWhenFinished = 1;
}

- (BOOL)hasFailed
{
  return self->_error != 0;
}

- (BOOL)hasFinished
{
  return self->_didFinish;
}

- (BOOL)hasResults
{
  return -[NSMutableDictionary count](self->_lastASRResults, "count") || self->_translationResult != 0;
}

- (void)speechRecognitionResult:(id)a3
{
  id v4;
  NSMutableDictionary *lastASRResults;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v4 = a3;
  if (self->_isBuffering)
  {
    if (v4)
    {
      lastASRResults = self->_lastASRResults;
      v9 = v4;
      objc_msgSend(v4, "locale");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](lastASRResults, "setObject:forKeyedSubscript:", v9, v6);
LABEL_6:

      v4 = v9;
    }
  }
  else
  {
    v9 = v4;
    -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v4 = v9;
    if ((v8 & 1) != 0)
    {
      -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "speechRecognitionResult:", v9);
      goto LABEL_6;
    }
  }

}

- (void)translatorDidTranslate:(id)a3
{
  id v4;
  _LTTranslationResult *v5;
  void *translationResult;
  void *v7;
  char v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_isBuffering)
  {
    v5 = (_LTTranslationResult *)v4;
    translationResult = self->_translationResult;
    self->_translationResult = v5;
LABEL_5:

    goto LABEL_6;
  }
  -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
    translationResult = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(translationResult, "translatorDidTranslate:", v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)translationDidFinishWithError:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  _BOOL4 isBuffering;
  void *v10;
  void *v11;
  id v12;
  uint8_t v13[16];

  v5 = a3;
  if (self->_signalDelegateWhenFinished)
  {
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Offline translation finished, informing delegate that we are all done.", v13, 2u);
    }
    -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      isBuffering = self->_isBuffering;
      -[_LTSpeechTranslationResultsBuffer delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (isBuffering)
        v12 = 0;
      else
        v12 = v5;
      objc_msgSend(v10, "translationDidFinishWithError:", v12);

    }
  }
  else
  {
    self->_didFinish = 1;
    objc_storeStrong((id *)&self->_error, a3);
  }

}

- (_LTSpeechTranslationDelegate)delegate
{
  return (_LTSpeechTranslationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_translationResult, 0);
  objc_storeStrong((id *)&self->_lastASRResults, 0);
}

@end

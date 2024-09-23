@implementation _LTCombinedEngine

- (_LTCombinedEngine)init
{
  _LTCombinedEngine *v2;
  _LTCombinedEngine *v3;
  _LTCombinedEngine *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LTCombinedEngine;
  v2 = -[_LTCombinedEngine init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_translationEnded = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)translatesPair:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "translatesPair:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "translatesPair:", v4);

  }
  return v6;
}

- (void)preheatAsynchronously:(BOOL)a3 withContext:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preheatAsynchronously:withContext:", v4, v6);

  -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preheatAsynchronously:withContext:", v4, v6);

}

- (void)addSpeechAudioData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSpeechAudioData:", v4);

  -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSpeechAudioData:", v4);

}

- (void)endAudio
{
  void *v3;
  id v4;

  -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endAudio");

  -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endAudio");

}

- (void)setLanguagesRecognized:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLanguagesRecognized:context:", v13, v6);

  }
  -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLanguagesRecognized:context:", v13, v6);

  }
}

- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _LTSpeechTranslationResultsBuffer *v19;
  _LTSpeechTranslationResultsBuffer *offlineDelegateBuffer;
  void *v21;
  void *v22;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_LTCombinedEngine startTextToSpeechTranslationWithContext:text:delegate:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  objc_storeWeak((id *)&self->_delegate, v8);
  self->_onlineTranslationStarted = 0;
  v19 = objc_alloc_init(_LTSpeechTranslationResultsBuffer);
  offlineDelegateBuffer = self->_offlineDelegateBuffer;
  self->_offlineDelegateBuffer = v19;

  -[_LTSpeechTranslationResultsBuffer setDelegate:](self->_offlineDelegateBuffer, "setDelegate:", v8);
  -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startTextToSpeechTranslationWithContext:text:delegate:", v10, v9, self);

  -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startTextToSpeechTranslationWithContext:text:delegate:", v10, v9, self->_offlineDelegateBuffer);

}

- (void)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4
{
  _LTSpeechTranslationDelegate **p_delegate;
  id v7;
  id v8;
  _LTSpeechTranslationResultsBuffer *v9;
  _LTSpeechTranslationResultsBuffer *offlineDelegateBuffer;
  void *v11;
  id v12;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  objc_storeWeak((id *)p_delegate, v7);
  self->_onlineTranslationStarted = 0;
  v9 = objc_alloc_init(_LTSpeechTranslationResultsBuffer);
  offlineDelegateBuffer = self->_offlineDelegateBuffer;
  self->_offlineDelegateBuffer = v9;

  -[_LTSpeechTranslationResultsBuffer setDelegate:](self->_offlineDelegateBuffer, "setDelegate:", v7);
  -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startSpeechTranslationWithContext:delegate:", v8, self);

  -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startSpeechTranslationWithContext:delegate:", v8, self->_offlineDelegateBuffer);

}

- (void)cancelSpeechTranslation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelSpeechTranslation:", v3);

  -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelSpeechTranslation:", v3);

}

- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTTranslationEngine *onlineEngine;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  onlineEngine = self->_onlineEngine;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __50___LTCombinedEngine_speak_withContext_completion___block_invoke;
  v15[3] = &unk_251A11308;
  objc_copyWeak(&v19, &location);
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  -[_LTTranslationEngine speak:withContext:completion:](onlineEngine, "speak:withContext:completion:", v12, v13, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)translate:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v43[4];
  NSObject *v44;
  _QWORD *v45;
  _QWORD v46[4];
  NSObject *v47;
  id v48;
  id v49;
  _QWORD v50[4];
  NSObject *v51;
  _QWORD *v52;
  _QWORD v53[4];
  NSObject *v54;
  id v55;
  id v56;
  id v57;
  _QWORD *v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];
  id v62;
  _QWORD v63[3];
  char v64;

  v10 = a3;
  v34 = a4;
  v11 = a5;
  v33 = a6;
  objc_msgSend(v10, "_ltCompactMap:", &__block_literal_global_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__1;
  v61[4] = __Block_byref_object_dispose__1;
  v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__1;
  v59[4] = __Block_byref_object_dispose__1;
  v60 = 0;
  v15 = dispatch_group_create();
  v16 = dispatch_queue_create("com.apple.translation.combined", 0);
  dispatch_group_enter(v15);
  -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_6;
  v53[3] = &unk_251A11398;
  v19 = v16;
  v54 = v19;
  v58 = v61;
  v20 = v13;
  v55 = v20;
  v21 = v11;
  v57 = v21;
  v22 = v14;
  v56 = v22;
  v50[0] = v18;
  v50[1] = 3221225472;
  v50[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_3;
  v50[3] = &unk_251A113C0;
  v52 = v59;
  v23 = v15;
  v51 = v23;
  objc_msgSend(v17, "translate:withContext:paragraphResult:completion:", v10, v34, v53, v50);

  dispatch_group_enter(v23);
  -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v18;
  v46[1] = 3221225472;
  v46[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_4;
  v46[3] = &unk_251A11410;
  v25 = v19;
  v47 = v25;
  v26 = v20;
  v48 = v26;
  v27 = v21;
  v49 = v27;
  v43[0] = v18;
  v43[1] = 3221225472;
  v43[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_6;
  v43[3] = &unk_251A113C0;
  v45 = v61;
  v28 = v23;
  v44 = v28;
  objc_msgSend(v24, "translate:withContext:paragraphResult:completion:", v10, v34, v46, v43);

  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_7;
  block[3] = &unk_251A11438;
  v40 = v63;
  v41 = v59;
  v42 = v61;
  v36 = v26;
  v37 = v22;
  v38 = v33;
  v39 = v27;
  v29 = v27;
  v30 = v22;
  v31 = v26;
  v32 = v33;
  dispatch_group_notify(v28, v25, block);

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(v63, 8);
}

- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[3];
  char v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__1;
  v37[4] = __Block_byref_object_dispose__1;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__1;
  v35[4] = __Block_byref_object_dispose__1;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__1;
  v33[4] = __Block_byref_object_dispose__1;
  v34 = 0;
  v11 = dispatch_group_create();
  v12 = dispatch_queue_create("com.apple.translation.combined", 0);
  dispatch_group_enter(v11);
  -[_LTCombinedEngine offlineEngine](self, "offlineEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke;
  v29[3] = &unk_251A11460;
  v31 = v37;
  v32 = v35;
  v15 = v11;
  v30 = v15;
  objc_msgSend(v13, "translateSentence:withContext:completion:", v8, v9, v29);

  dispatch_group_enter(v15);
  -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke_2;
  v25[3] = &unk_251A11488;
  v28 = v39;
  v17 = v10;
  v27 = v17;
  v18 = v15;
  v26 = v18;
  objc_msgSend(v16, "translateSentence:withContext:completion:", v8, v9, v25);

  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke_3;
  block[3] = &unk_251A114B0;
  v21 = v17;
  v22 = v39;
  v23 = v35;
  v24 = v33;
  v19 = v17;
  dispatch_group_notify(v18, v12, block);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

}

- (void)endpoint
{
  -[_LTTranslationEngine endpoint](self->_onlineEngine, "endpoint");
  -[_LTTranslationEngine endpoint](self->_offlineEngine, "endpoint");
}

- (void)hybridEndpointerFoundEndpoint
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "HEP triggered", a5, a6, a7, a8, 0);
}

- (void)serverEndpointerFeatures:(id)a3 locale:(id)a4
{
  id v6;
  _LTSpeechTranslationDelegate **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "serverEndpointerFeatures:locale:", v11, v6);

  }
}

- (void)speechRecognitionResult:(id)a3
{
  _LTSpeechTranslationDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  self->_onlineTranslationStarted = 1;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "speechRecognitionResult:", v8);

  }
}

- (void)translatorDidTranslate:(id)a3
{
  _LTSpeechTranslationDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "translatorDidTranslate:", v8);

  }
}

- (void)translationDidFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  _LTSpeechTranslationDelegate **p_delegate;
  id WeakRetained;
  char v17;
  id v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = _LTOSLogTranslationEngine();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_LTCombinedEngine translationDidFinishWithError:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    if (!-[_LTSpeechTranslationResultsBuffer hasFailed](self->_offlineDelegateBuffer, "hasFailed"))
    {
      v13 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_2491B9000, v13, OS_LOG_TYPE_INFO, "Online translation failed, continue with offline", v19, 2u);
      }
      -[_LTCombinedEngine onlineEngine](self, "onlineEngine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cancelSpeechTranslation:", 0);

      -[_LTSpeechTranslationResultsBuffer stopBuffering](self->_offlineDelegateBuffer, "stopBuffering");
      goto LABEL_12;
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Server translation finished successfully", buf, 2u);
  }
  self->_serverCompleted = 1;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v18, "translationDidFinishWithError:", v4);

  }
LABEL_12:

}

- (_LTTranslationEngine)offlineEngine
{
  return self->_offlineEngine;
}

- (void)setOfflineEngine:(id)a3
{
  objc_storeStrong((id *)&self->_offlineEngine, a3);
}

- (_LTTranslationEngine)onlineEngine
{
  return self->_onlineEngine;
}

- (void)setOnlineEngine:(id)a3
{
  objc_storeStrong((id *)&self->_onlineEngine, a3);
}

- (_LTSpeechTranslationResultsBuffer)offlineDelegateBuffer
{
  return self->_offlineDelegateBuffer;
}

- (void)setOfflineDelegateBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_offlineDelegateBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDelegateBuffer, 0);
  objc_storeStrong((id *)&self->_onlineEngine, 0);
  objc_storeStrong((id *)&self->_offlineEngine, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startTextToSpeechTranslationWithContext:(uint64_t)a3 text:(uint64_t)a4 delegate:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Starting combined translation", a5, a6, a7, a8, 0);
}

- (void)translationDidFinishWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Server translation finished with error: %@", a5, a6, a7, a8, 2u);
}

@end

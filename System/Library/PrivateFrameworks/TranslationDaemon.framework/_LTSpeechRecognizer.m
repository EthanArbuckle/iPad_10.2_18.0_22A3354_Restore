@implementation _LTSpeechRecognizer

- (_LTSpeechRecognizer)initWithModelURL:(id)a3 language:(id)a4 modelVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  _LTSpeechRecognizer *v12;
  _LTSpeechRecognizer *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *recognitionQueue;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *recognizer;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  _EARSpeechRecognizer *v39;
  _LTSpeechRecognizer *v40;
  id v42;
  objc_super v43;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v43.receiver = self;
  v43.super_class = (Class)_LTSpeechRecognizer;
  v12 = -[_LTSpeechRecognizer init](&v43, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modelURL, a3);
    objc_storeStrong((id *)&v13->_modelVersion, a5);
    objc_storeStrong((id *)&v13->_language, a4);
    v14 = dispatch_queue_create("com.apple.translation.speech", 0);
    recognitionQueue = v13->_recognitionQueue;
    v13->_recognitionQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("mini.json"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_class();
    objc_msgSend(v16, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "supportedByQuasarConfig:", v18);

    v20 = _LTOSLogSpeech();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v21)
        -[_LTSpeechRecognizer initWithModelURL:language:modelVersion:].cold.1(v20, v22, v23, v24, v25, v26, v27, v28);
      v29 = objc_alloc(MEMORY[0x24BE2E738]);
      objc_msgSend(v16, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "initWithConfiguration:useQuasarFormatter:", v30, 1);
      recognizer = v13->_recognizer;
      v13->_recognizer = (_EARSpeechRecognizer *)v31;
    }
    else
    {
      v42 = v10;
      if (v21)
        -[_LTSpeechRecognizer initWithModelURL:language:modelVersion:].cold.2(v20, v22, v23, v24, v25, v26, v27, v28);
      objc_msgSend(v9, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringByAppendingPathComponent:", CFSTR("ncs"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "stringByAppendingPathComponent:", CFSTR("dispatch.voc"));
      recognizer = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringByAppendingPathComponent:", CFSTR("lexicon.enh"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringByAppendingPathComponent:", CFSTR("itn_s.enh"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_alloc(MEMORY[0x24BE2E738]);
      objc_msgSend(v16, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "initWithConfiguration:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:", v37, 0, recognizer, v34, v35);
      v39 = v13->_recognizer;
      v13->_recognizer = (_EARSpeechRecognizer *)v38;

      v10 = v42;
    }

    v40 = v13;
  }

  return v13;
}

- (void)startRecognitionWithAutoStop:(BOOL)a3 resultHandler:(id)a4
{
  id v6;
  NSObject *recognitionQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66___LTSpeechRecognizer_startRecognitionWithAutoStop_resultHandler___block_invoke;
  v9[3] = &unk_251A13A88;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v12 = a3;
  v8 = v6;
  dispatch_async(recognitionQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)addSpeechAudioData:(id)a3
{
  id v4;
  NSObject *recognitionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42___LTSpeechRecognizer_addSpeechAudioData___block_invoke;
  block[3] = &unk_251A10FD0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(recognitionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)endAudio
{
  NSObject *recognitionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31___LTSpeechRecognizer_endAudio__block_invoke;
  v4[3] = &unk_251A111A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(recognitionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelRecognition
{
  NSObject *recognitionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40___LTSpeechRecognizer_cancelRecognition__block_invoke;
  v4[3] = &unk_251A111A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(recognitionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)triggerServerSideEndPointer
{
  NSObject *recognitionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50___LTSpeechRecognizer_triggerServerSideEndPointer__block_invoke;
  v4[3] = &unk_251A111A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(recognitionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_recognizedResult:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id recognitionHandler;
  id v10;

  v10 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recognitionQueue);
  -[_LTSpeechRecognizer recognitionHandler](self, "recognitionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_LTSpeechRecognizer recognitionHandler](self, "recognitionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v10, v6);

    if (v6 || v10 && objc_msgSend(v10, "isFinal"))
    {
      recognitionHandler = self->_recognitionHandler;
      self->_recognitionHandler = 0;

    }
  }

}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v5;
  NSObject *recognitionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  _LTSpeechRecognizer *v10;
  id v11;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70___LTSpeechRecognizer_speechRecognizer_didFinishRecognitionWithError___block_invoke;
  v8[3] = &unk_251A128B0;
  objc_copyWeak(&v11, &location);
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(recognitionQueue, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4
{
  id v5;
  NSObject *recognitionQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71___LTSpeechRecognizer_speechRecognizer_didRecognizeFinalResultPackage___block_invoke;
  v8[3] = &unk_251A128B0;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(recognitionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5;
  NSObject *recognitionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  _LTSpeechRecognizer *v10;
  id v11;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  recognitionQueue = self->_recognitionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66___LTSpeechRecognizer_speechRecognizer_didRecognizePartialResult___block_invoke;
  v8[3] = &unk_251A128B0;
  objc_copyWeak(&v11, &location);
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(recognitionQueue, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSLocale)language
{
  return self->_language;
}

- (id)recognitionHandler
{
  return self->_recognitionHandler;
}

- (void)setRecognitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recognitionHandler, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_finalResult, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

- (void)initWithModelURL:(uint64_t)a3 language:(uint64_t)a4 modelVersion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Initializing recognition with Quasar formatter", a5, a6, a7, a8, 0);
}

- (void)initWithModelURL:(uint64_t)a3 language:(uint64_t)a4 modelVersion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Initializing recognition with config based formatter", a5, a6, a7, a8, 0);
}

@end

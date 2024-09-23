@implementation VTTranscriber

- (VTTranscriber)initWithConfiguration:(id)a3 triggerTokens:(id)a4 useKeywordSpotting:(BOOL)a5
{
  id v8;
  id v9;
  VTTranscriber *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NSMutableArray *v13;
  NSMutableArray *previousUtteranceTokens;
  uint64_t v15;
  NSArray *triggerTokenList;
  NSArray *v17;
  NSObject *v18;
  _EARSpeechRecognitionAudioBuffer *recognizerBuffer;
  uint64_t v20;
  _EARSpeechRecognizer *recognizer;
  VTTranscriber *v22;
  objc_super v24;
  uint8_t buf[4];
  NSArray *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)VTTranscriber;
  v10 = -[VTTranscriber init](&v24, sel_init);
  if (v10)
  {
    v11 = dispatch_queue_create("com.apple.transcribe.Transcriber", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    previousUtteranceTokens = v10->_previousUtteranceTokens;
    v10->_previousUtteranceTokens = v13;

    v10->_triggerConfidence = 0.0;
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("_"));
    v15 = objc_claimAutoreleasedReturnValue();
    triggerTokenList = v10->_triggerTokenList;
    v10->_triggerTokenList = (NSArray *)v15;

    v17 = v10->_triggerTokenList;
    if (v17)
    {
      v18 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v17;
        _os_log_impl(&dword_20D965000, v18, OS_LOG_TYPE_DEFAULT, "Transcriber trigger token list: %{public}@", buf, 0xCu);
      }
    }
    recognizerBuffer = v10->_recognizerBuffer;
    v10->_recognizerBuffer = 0;

    v10->_isTriggerFollowedByWords = 0;
    v10->_useKeywordSpotting = a5;
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BE2E730]), "initWithConfiguration:", v8);
    recognizer = v10->_recognizer;
    v10->_recognizer = (_EARSpeechRecognizer *)v20;

  }
  v22 = v10;

  return v22;
}

- (void)runRecognitionWithCallback:(id)a3
{
  id v4;
  void *v5;
  id callback;
  NSObject *v7;
  _EARSpeechRecognitionAudioBuffer *v8;
  _EARSpeechRecognitionAudioBuffer *recognizerBuffer;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x212BACF9C]();
  callback = self->_callback;
  self->_callback = v5;

  v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "VTTranscriber runRecognitionWithCallback", buf, 2u);
  }
  -[_EARSpeechRecognizer runRecognitionWithResultStream:](self->_recognizer, "runRecognitionWithResultStream:", self);
  v8 = (_EARSpeechRecognitionAudioBuffer *)objc_claimAutoreleasedReturnValue();
  recognizerBuffer = self->_recognizerBuffer;
  self->_recognizerBuffer = v8;

}

- (void)recognizeWavData:(const signed __int16 *)a3 length:(int)a4
{
  -[_EARSpeechRecognitionAudioBuffer addAudioSamples:count:](self->_recognizerBuffer, "addAudioSamples:count:", a3, a4);
}

- (void)endAudio
{
  NSObject *v3;
  uint8_t buf[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "VTTranscriber endAudio", buf, 2u);
  }
  -[_EARSpeechRecognitionAudioBuffer endAudio](self->_recognizerBuffer, "endAudio");
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__VTTranscriber_reset__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5;
  void *v6;
  NSObject *queue;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = v5;
  if (!self->_useKeywordSpotting)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__VTTranscriber_speechRecognizer_didRecognizePartialResult___block_invoke;
    v8[3] = &unk_24C7F4DC0;
    v8[4] = self;
    v9 = v5;
    dispatch_async(queue, v8);

  }
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  VTTranscriber *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__VTTranscriber_speechRecognizer_didRecognizeFinalResults___block_invoke;
  v8[3] = &unk_24C7F4DC0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  VTTranscriber *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__VTTranscriber_speechRecognizer_didFinishRecognitionWithError___block_invoke;
  v8[3] = &unk_24C7F4DC0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (double)_getConfidence:(id)a3
{
  id v4;
  void *v5;
  double v6;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  v6 = 0.0;
  if (v4 && self->_triggerTokenList)
  {
    v9 = 0;
    v10 = (double *)&v9;
    v11 = 0x2020000000;
    v12 = 0x3FF0000000000000;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__VTTranscriber__getConfidence___block_invoke;
    v8[3] = &unk_24C7F4350;
    v8[4] = self;
    v8[5] = &v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
    v6 = v10[3];
    _Block_object_dispose(&v9, 8);
  }

  return v6;
}

- (id)recognizedTokens
{
  return self->_previousUtteranceTokens;
}

- (double)triggerConfidence
{
  return self->_triggerConfidence;
}

- (BOOL)isTriggerFollowedByWords
{
  return self->_isTriggerFollowedByWords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizerBuffer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_triggerTokenList, 0);
  objc_storeStrong((id *)&self->_previousUtteranceTokens, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __32__VTTranscriber__getConfidence___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") > a3)
  {
    objc_msgSend(v5, "tokenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "caseInsensitiveCompare:", v7);

    if (v8)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24)
                                                                  * 0.0;
  }
  v9 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "tokenName");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "UTF8String");
    objc_msgSend(v5, "confidence");
    v13 = 134349570;
    v14 = a3;
    v15 = 2080;
    v16 = v11;
    v17 = 2050;
    v18 = v12;
    _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "EAR Token[%{public}lu]: %s (%{public}f)", (uint8_t *)&v13, 0x20u);

  }
}

void __64__VTTranscriber_speechRecognizer_didFinishRecognitionWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = 136446210;
      v19 = objc_msgSend(v17, "UTF8String");
      _os_log_error_impl(&dword_20D965000, v2, OS_LOG_TYPE_ERROR, "ERROR: %{public}s\n", (uint8_t *)&v18, 0xCu);

    }
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v3 + 65))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      *(_QWORD *)(v3 + 24) = 0xC08F400000000000;
    }
    else
    {
      objc_msgSend(*(id *)(v3 + 16), "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "confidence");
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = v14;

    }
    v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
      v18 = 134349056;
      v19 = v16;
      _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, "EAR Keyword Spotting Confidence: %{public}f", (uint8_t *)&v18, 0xCu);
    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
    if (v12)
LABEL_21:
      (*(void (**)(void))(v12 + 16))();
  }
  else
  {
    *(_BYTE *)(v3 + 64) = 0;
    v4 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v4 + 32))
    {
      v5 = objc_msgSend(*(id *)(v4 + 16), "count");
      if (v5 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "_getConfidence:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = v6;
        v7 = *(_QWORD *)(a1 + 40);
        if (*(double *)(v7 + 24) >= 1.0)
        {
          v8 = objc_msgSend(*(id *)(v7 + 16), "count");
          v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count");
          v7 = *(_QWORD *)(a1 + 40);
          if (v8 > v9)
          {
            *(_BYTE *)(v7 + 64) = 1;
            v7 = *(_QWORD *)(a1 + 40);
          }
        }
        v10 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(v7 + 24);
          v18 = 134349056;
          v19 = v11;
          _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "EAR Final Current Confidence: %{public}f", (uint8_t *)&v18, 0xCu);
          v7 = *(_QWORD *)(a1 + 40);
        }
        v12 = *(_QWORD *)(v7 + 40);
        if (v12)
          goto LABEL_21;
      }
    }
  }
}

void __59__VTTranscriber_speechRecognizer_didRecognizeFinalResults___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v5 = v2;
  objc_msgSend(v2, "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __60__VTTranscriber_speechRecognizer_didRecognizePartialResult___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "tokens");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");

    if (v3 >= v4)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "tokens");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_getConfidence:", v6);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v7;

      v8 = *(_QWORD *)(a1 + 32);
      if (*(double *)(v8 + 24) >= 1.0)
      {
        objc_msgSend(*(id *)(a1 + 40), "tokens");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");
        v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");

        v8 = *(_QWORD *)(a1 + 32);
        if (v10 > v11)
        {
          *(_BYTE *)(v8 + 64) = 1;
          v8 = *(_QWORD *)(a1 + 32);
        }
      }
      v12 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(v8 + 24);
        v15 = 134349056;
        v16 = v13;
        _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "EAR Partial Current Confidence: %{public}f", (uint8_t *)&v15, 0xCu);
        v8 = *(_QWORD *)(a1 + 32);
      }
      v14 = *(_QWORD *)(v8 + 40);
      if (v14)
        (*(void (**)(void))(v14 + 16))();
    }
  }
}

uint64_t __22__VTTranscriber_reset__block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = -1000.0;
  if (!*(_BYTE *)(v1 + 65))
    v2 = 0.0;
  *(double *)(v1 + 24) = v2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

@end

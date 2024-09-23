@implementation _LTOfflineSpeechSynthesizer

- (_LTOfflineSpeechSynthesizer)initWithCompletion:(id)a3
{
  id v4;
  _LTOfflineSpeechSynthesizer *v5;
  SiriTTSDaemonSession *v6;
  SiriTTSDaemonSession *session;
  uint64_t v8;
  id completion;
  _LTAudioDecoder *v10;
  _LTAudioDecoder *audioDecoder;
  _LTOfflineSpeechSynthesizer *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_LTOfflineSpeechSynthesizer;
  v5 = -[_LTOfflineSpeechSynthesizer init](&v14, sel_init);
  if (v5)
  {
    v6 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x24BEA7A10]);
    session = v5->_session;
    v5->_session = v6;

    v8 = objc_msgSend(v4, "copy");
    completion = v5->_completion;
    v5->_completion = (id)v8;

    v10 = objc_alloc_init(_LTAudioDecoder);
    audioDecoder = v5->_audioDecoder;
    v5->_audioDecoder = v10;

    v12 = v5;
  }

  return v5;
}

- (void)speak:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  SiriTTSSynthesisRequest *currentRequest;
  NSMutableArray *v9;
  NSMutableArray *currentAudioData;
  NSMutableArray *v11;
  NSMutableArray *currentWordTimingInfo;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  SiriTTSSynthesisRequest *v25;
  SiriTTSDaemonSession *session;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  currentAudioData = self->_currentAudioData;
  self->_currentAudioData = v9;

  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  currentWordTimingInfo = self->_currentWordTimingInfo;
  self->_currentWordTimingInfo = v11;

  objc_msgSend(v7, "localePair");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "targetLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _LTLocaleMappedForTTS();
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "length") <= 0x14)
  {
    v29 = v6;
  }
  else
  {
    objc_msgSend(v6, "substringToIndex:", 20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("..."));
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  v16 = _LTOSLogTTS();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    objc_msgSend(v31, "localeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138740227;
    v40 = v29;
    v41 = 2114;
    v42 = v18;
    _os_log_impl(&dword_2491B9000, v17, OS_LOG_TYPE_INFO, "Speaking: %{sensitive}@ language code %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(v6, "length", v29))
  {
    objc_msgSend(v31, "localeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_LTDTTSAssetService voiceForLocaleIdentifier:](_LTDTTSAssetService, "voiceForLocaleIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A48]), "initWithText:voice:", v6, v20);
      objc_msgSend(v7, "outputFileURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setOutputPath:", v22);

      objc_msgSend(v7, "ttsPlaybackRate");
      *(float *)&v23 = v23;
      objc_msgSend(v21, "setRate:", v23);
      objc_msgSend(v21, "setPrivacySensitive:", 1);
      objc_msgSend(v21, "setDidReportInstrument:", &__block_literal_global_18);
      objc_storeStrong((id *)&self->_currentRequest, v21);
      objc_initWeak((id *)buf, self);
      v24 = MEMORY[0x24BDAC760];
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_8;
      v37[3] = &unk_251A12D58;
      objc_copyWeak(&v38, (id *)buf);
      -[SiriTTSSynthesisRequest setDidGenerateAudio:](self->_currentRequest, "setDidGenerateAudio:", v37);
      v35[0] = v24;
      v35[1] = 3221225472;
      v35[2] = __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_10;
      v35[3] = &unk_251A12D80;
      objc_copyWeak(&v36, (id *)buf);
      -[SiriTTSSynthesisRequest setDidGenerateWordTimings:](self->_currentRequest, "setDidGenerateWordTimings:", v35);
      session = self->_session;
      v25 = self->_currentRequest;
      v32[0] = v24;
      v32[1] = 3221225472;
      v32[2] = __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_2;
      v32[3] = &unk_251A12DF8;
      objc_copyWeak(&v34, (id *)buf);
      v33 = v6;
      -[SiriTTSDaemonSession synthesizeWithRequest:didFinish:](session, "synthesizeWithRequest:didFinish:", v25, v32);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v28 = _LTOSLogTTS();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[_LTOfflineSpeechSynthesizer speak:withContext:].cold.1(v28, v31);
    }

  }
  else
  {
    v27 = _LTOSLogTTS();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v27, OS_LOG_TYPE_INFO, "Received zero-length or nil text speak request", buf, 2u);
    }
  }

}

- (void)cancel
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = _LTOSLogTTS();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "TTS cancelled", v4, 2u);
  }
  -[SiriTTSDaemonSession cancelWithRequest:](self->_session, "cancelWithRequest:", self->_currentRequest);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDecoder, 0);
  objc_storeStrong((id *)&self->_currentWordTimingInfo, 0);
  objc_storeStrong((id *)&self->_currentAudioData, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)speak:(void *)a1 withContext:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v3, v5, "No synthesis voice found for %{public}@", (uint8_t *)&v6);

}

@end

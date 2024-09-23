@implementation VTUISpeechSynthesizer

- (VTUISpeechSynthesizer)init
{
  VTUISpeechSynthesizer *v2;
  SiriTTSDaemonSession *v3;
  SiriTTSDaemonSession *ttsSession;
  SiriTTSServiceSession *v5;
  SiriTTSServiceSession *serviceSession;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VTUISpeechSynthesizer;
  v2 = -[VTUISpeechSynthesizer init](&v8, sel_init);
  if (v2)
  {
    v3 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x24BEA7A10]);
    ttsSession = v2->_ttsSession;
    v2->_ttsSession = v3;

    v5 = (SiriTTSServiceSession *)objc_alloc_init(MEMORY[0x24BEA7A30]);
    serviceSession = v2->_serviceSession;
    v2->_serviceSession = v5;

  }
  return v2;
}

- (void)speak:(id)a3 language:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id speakStringCompletion;
  void *v13;
  void *v14;
  uint64_t v15;
  SiriTTSDaemonSession *ttsSession;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[VTUISpeechSynthesizer stopSpeaking](self, "stopSpeaking");
  v11 = _Block_copy(v10);
  speakStringCompletion = self->_speakStringCompletion;
  self->_speakStringCompletion = v11;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A58]), "initWithLanguage:name:", v9, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A40]), "initWithText:voice:", v8, v13);
  objc_initWeak(&location, v14);
  v15 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __51__VTUISpeechSynthesizer_speak_language_completion___block_invoke;
  v18[3] = &unk_24F33DA00;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v14, "setDidStartSpeaking:", v18);
  objc_storeStrong((id *)&self->_speechRequest, v14);
  ttsSession = self->_ttsSession;
  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __51__VTUISpeechSynthesizer_speak_language_completion___block_invoke_5;
  v17[3] = &unk_24F33E260;
  v17[4] = self;
  -[SiriTTSDaemonSession speakWithSpeechRequest:didFinish:](ttsSession, "speakWithSpeechRequest:didFinish:", v14, v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __51__VTUISpeechSynthesizer_speak_language_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[VTUISpeechSynthesizer speak:language:completion:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);

  }
}

void __51__VTUISpeechSynthesizer_speak_language_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = *MEMORY[0x24BE09000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[VTUISpeechSynthesizer speak:language:completion:]_block_invoke";
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Speech synthesizer failed to speak TTS %@", (uint8_t *)&v8, 0x16u);
    }
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = 0;

  }
}

- (void)speak:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id speakAudioHintCompletion;
  SiriTTSServiceSession *serviceSession;
  _QWORD v12[5];
  id v13;
  id location;

  v7 = a3;
  v8 = a4;
  -[VTUISpeechSynthesizer stopSpeaking](self, "stopSpeaking");
  v9 = _Block_copy(v8);
  speakAudioHintCompletion = self->_speakAudioHintCompletion;
  self->_speakAudioHintCompletion = v9;

  objc_initWeak(&location, v7);
  objc_storeStrong((id *)&self->_audioHintRequest, a3);
  serviceSession = self->_serviceSession;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__VTUISpeechSynthesizer_speak_completion___block_invoke;
  v12[3] = &unk_24F33E288;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  -[SiriTTSServiceSession speakWithAudioHintRequest:didFinish:](serviceSession, "speakWithAudioHintRequest:didFinish:", v7, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __42__VTUISpeechSynthesizer_speak_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE09000];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v11 = 136315394;
      v12 = "-[VTUISpeechSynthesizer speak:completion:]_block_invoke";
      v13 = 2112;
      v14 = (uint64_t)v3;
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Speech synthesizer failed to speak AudioHint Request %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v5)
  {
    v6 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v11 = 136315394;
    v12 = "-[VTUISpeechSynthesizer speak:completion:]_block_invoke";
    v13 = 2048;
    v14 = objc_msgSend(WeakRetained, "dialogNumber");
    _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s Finished speaking AudioHint Request - dialogNumber #%ld", (uint8_t *)&v11, 0x16u);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = 0;

  }
}

- (void)stopSpeaking
{
  SiriTTSAudioRequest *audioRequest;
  SiriTTSSpeechRequest *speechRequest;
  SiriTTSAudioHintRequest *audioHintRequest;
  void (**speakAudioHintCompletion)(id, _QWORD);
  id v7;
  void (**speakStringCompletion)(id, _QWORD);
  id v9;

  if (self->_audioRequest)
  {
    -[SiriTTSDaemonSession cancelWithRequest:](self->_ttsSession, "cancelWithRequest:");
    audioRequest = self->_audioRequest;
    self->_audioRequest = 0;

  }
  if (self->_speechRequest)
  {
    -[SiriTTSDaemonSession cancelWithRequest:](self->_ttsSession, "cancelWithRequest:");
    speechRequest = self->_speechRequest;
    self->_speechRequest = 0;

  }
  if (self->_audioHintRequest)
  {
    -[SiriTTSDaemonSession cancelWithRequest:](self->_ttsSession, "cancelWithRequest:");
    audioHintRequest = self->_audioHintRequest;
    self->_audioHintRequest = 0;

  }
  speakAudioHintCompletion = (void (**)(id, _QWORD))self->_speakAudioHintCompletion;
  if (speakAudioHintCompletion)
  {
    speakAudioHintCompletion[2](speakAudioHintCompletion, 0);
    v7 = self->_speakAudioHintCompletion;
    self->_speakAudioHintCompletion = 0;

  }
  speakStringCompletion = (void (**)(id, _QWORD))self->_speakStringCompletion;
  if (speakStringCompletion)
  {
    speakStringCompletion[2](speakStringCompletion, 0);
    v9 = self->_speakStringCompletion;
    self->_speakStringCompletion = 0;

  }
}

- (BOOL)isSpeaking
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  uint64_t v5;
  SiriTTSServiceSession *serviceSession;
  SiriTTSDaemonSession *ttsSession;
  dispatch_time_t v8;
  char v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = v3;
  v5 = MEMORY[0x24BDAC760];
  if (self->_audioHintRequest)
  {
    serviceSession = self->_serviceSession;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __35__VTUISpeechSynthesizer_isSpeaking__block_invoke;
    v14[3] = &unk_24F33E2B0;
    v16 = &v17;
    v15 = v3;
    -[SiriTTSServiceSession getAudioPower:](serviceSession, "getAudioPower:", v14);

  }
  if (self->_speechRequest)
  {
    ttsSession = self->_ttsSession;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __35__VTUISpeechSynthesizer_isSpeaking__block_invoke_2;
    v11[3] = &unk_24F33E2D8;
    v13 = &v17;
    v12 = v4;
    -[SiriTTSDaemonSession isSpeaking:](ttsSession, "isSpeaking:", v11);

  }
  v8 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v4, v8);
  v9 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

intptr_t __35__VTUISpeechSynthesizer_isSpeaking__block_invoke(uint64_t a1, float a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 > 0.0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __35__VTUISpeechSynthesizer_isSpeaking__block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)speakAudioHintCompletion
{
  return self->_speakAudioHintCompletion;
}

- (void)setSpeakAudioHintCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)speakStringCompletion
{
  return self->_speakStringCompletion;
}

- (void)setSpeakStringCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SiriTTSDaemonSession)ttsSession
{
  return self->_ttsSession;
}

- (void)setTtsSession:(id)a3
{
  objc_storeStrong((id *)&self->_ttsSession, a3);
}

- (SiriTTSServiceSession)serviceSession
{
  return self->_serviceSession;
}

- (void)setServiceSession:(id)a3
{
  objc_storeStrong((id *)&self->_serviceSession, a3);
}

- (SiriTTSAudioRequest)audioRequest
{
  return self->_audioRequest;
}

- (void)setAudioRequest:(id)a3
{
  objc_storeStrong((id *)&self->_audioRequest, a3);
}

- (SiriTTSSpeechRequest)speechRequest
{
  return self->_speechRequest;
}

- (void)setSpeechRequest:(id)a3
{
  objc_storeStrong((id *)&self->_speechRequest, a3);
}

- (SiriTTSAudioHintRequest)audioHintRequest
{
  return self->_audioHintRequest;
}

- (void)setAudioHintRequest:(id)a3
{
  objc_storeStrong((id *)&self->_audioHintRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioHintRequest, 0);
  objc_storeStrong((id *)&self->_speechRequest, 0);
  objc_storeStrong((id *)&self->_audioRequest, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_ttsSession, 0);
  objc_storeStrong(&self->_speakStringCompletion, 0);
  objc_storeStrong(&self->_speakAudioHintCompletion, 0);
}

@end

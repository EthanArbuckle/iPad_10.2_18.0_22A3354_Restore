@implementation SSRVTUITrainingMessageHandler

- (SSRVTUITrainingMessageHandler)init
{
  SSRVTUITrainingMessageHandler *v2;
  SSRVTUITrainingManager *trainingManager;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSRVTUITrainingMessageHandler;
  v2 = -[SSRVTUITrainingMessageHandler init](&v5, sel_init);
  if (v2)
  {
    SSRLogInitIfNeeded();
    trainingManager = v2->_trainingManager;
    v2->_trainingManager = 0;

  }
  return v2;
}

- (void)setupWithLocaleID:(id)a3 appDomain:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CSVTUIAudioSessionRecorder *v9;
  CSVTUIAudioSession *audioSession;
  SSRVTUITrainingManager *v11;
  SSRVTUITrainingManager *trainingManager;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[SSRVTUITrainingMessageHandler setupWithLocaleID:appDomain:]";
    v15 = 2114;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s localeIdentifier : %{public}@, appDomain : %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v9 = -[CSVTUIAudioSessionRecorder initWithDelegate:]([CSVTUIAudioSessionRecorder alloc], "initWithDelegate:", self);
  audioSession = self->_audioSession;
  self->_audioSession = (CSVTUIAudioSession *)v9;

  v11 = -[SSRVTUITrainingManager initWithLocaleIdentifier:withAudioSession:withAppDomain:shouldTrainViaXPC:]([SSRVTUITrainingManager alloc], "initWithLocaleIdentifier:withAudioSession:withAppDomain:shouldTrainViaXPC:", v6, self->_audioSession, v7, 0);
  trainingManager = self->_trainingManager;
  self->_trainingManager = v11;

  -[SSRVTUITrainingManager setDelegate:](self->_trainingManager, "setDelegate:", self);
}

- (void)vtuiTrainingXPCDisconnected
{
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SSRVTUITrainingMessageHandler vtuiTrainingXPCDisconnected]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s end training and clean up", (uint8_t *)&v5, 0xCu);
  }
  -[SSRVTUITrainingManager cancelTrainingForID:](self->_trainingManager, "cancelTrainingForID:", 0);
  v4 = -[SSRVTUITrainingManager cleanupWithCompletion:](self->_trainingManager, "cleanupWithCompletion:", 0);
}

- (void)startRMS
{
  -[SSRVTUITrainingManager startRMS](self->_trainingManager, "startRMS");
}

- (void)stopRMS
{
  -[SSRVTUITrainingManager stopRMS](self->_trainingManager, "stopRMS");
}

- (void)setLocaleIdentifier:(id)a3
{
  -[SSRVTUITrainingManager setLocaleIdentifier:](self->_trainingManager, "setLocaleIdentifier:", a3);
}

- (void)didDetectForceEndPoint
{
  -[SSRVTUITrainingManager didDetectForceEndPoint](self->_trainingManager, "didDetectForceEndPoint");
}

- (void)prepareWithCompletion:(id)a3
{
  -[SSRVTUITrainingManager prepareWithCompletion:](self->_trainingManager, "prepareWithCompletion:", a3);
}

- (void)cleanupViaXPCWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SSRVTUITrainingMessageHandler cleanupViaXPCWithCompletion:]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  v6 = -[SSRVTUITrainingManager cleanupWithCompletion:](self->_trainingManager, "cleanupWithCompletion:", v4);

}

- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v5 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[SSRVTUITrainingMessageHandler trainUtteranceViaXPC:shouldUseASR:completion:]";
    v12 = 2048;
    v13 = a3;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s utterance: %ld, shouldUseASR : %d", (uint8_t *)&v10, 0x1Cu);
  }
  -[SSRVTUITrainingManager trainUtterance:shouldUseASR:completion:](self->_trainingManager, "trainUtterance:shouldUseASR:completion:", a3, v5, v8);

}

- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 mhUUID:(id)a5 completionWithResult:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v7 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315906;
    v14 = "-[SSRVTUITrainingMessageHandler trainUtteranceViaXPC:shouldUseASR:mhUUID:completionWithResult:]";
    v15 = 2048;
    v16 = a3;
    v17 = 1024;
    v18 = v7;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s utterance: %ld, shouldUseASR : %d, mhuuid : %@", (uint8_t *)&v13, 0x26u);
  }
  -[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:](self->_trainingManager, "trainUtterance:shouldUseASR:mhUUID:completionWithResult:", a3, v7, v10, v11);

}

- (void)playSoundsEffect:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SSRVTUITrainingMessageHandler playSoundsEffect:]";
    v8 = 1024;
    v9 = a3;
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s utterance : %d", (uint8_t *)&v6, 0x12u);
  }
  -[SSRVTUITrainingManager playSoundsEffect:](self->_trainingManager, "playSoundsEffect:", a3);
}

- (void)cancelTrainingViaXPCForID:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SSRVTUITrainingMessageHandler cancelTrainingViaXPCForID:]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[SSRVTUITrainingManager cancelTrainingForID:](self->_trainingManager, "cancelTrainingForID:", a3);
}

- (void)voiceProfileWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SSRVTUITrainingMessageHandler voiceProfileWithCompletion:]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  -[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2](v4, v6);

}

- (void)audioSourceWithCompletion:(id)a3
{
  void (**v4)(id, unint64_t);
  unint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, unint64_t))a3;
  v5 = -[SSRVTUITrainingManager audioSource](self->_trainingManager, "audioSource");
  v6 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SSRVTUITrainingMessageHandler audioSourceWithCompletion:]";
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s audioSource : %lu", (uint8_t *)&v7, 0x16u);
  }
  if (v4)
    v4[2](v4, v5);

}

- (void)VTUITrainingManagerFeedLevel:(float)a3
{
  -[SSRVTUITrainingServiceDelegate CSVTUIRemoteTrainingSessionRMSAvailable:](self->_remoteObjectProxy, "CSVTUIRemoteTrainingSessionRMSAvailable:");
}

- (void)requestAudioProviderForTrainingWithSyncBlock:(id)a3
{
  SSRVTUITrainingAudioSessionDelegate **p_audioSessionDelegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  p_audioSessionDelegate = &self->_audioSessionDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_audioSessionDelegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_audioSessionDelegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_audioSessionDelegate);
      objc_msgSend(v9, "requestAudioProviderForTrainingWithSyncBlock:", v10);

    }
  }

}

- (SSRVTUITrainingServiceDelegate)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObjectProxy, a3);
}

- (SSRVTUITrainingAudioSessionDelegate)audioSessionDelegate
{
  return (SSRVTUITrainingAudioSessionDelegate *)objc_loadWeakRetained((id *)&self->_audioSessionDelegate);
}

- (void)setAudioSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audioSessionDelegate, a3);
}

- (SSRVTUITrainingManager)trainingManager
{
  return self->_trainingManager;
}

- (void)setTrainingManager:(id)a3
{
  objc_storeStrong((id *)&self->_trainingManager, a3);
}

- (CSVTUIAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_trainingManager, 0);
  objc_destroyWeak((id *)&self->_audioSessionDelegate);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
}

@end

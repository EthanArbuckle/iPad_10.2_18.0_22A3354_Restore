@implementation SRUIFSpeechSynthesizer

- (SRUIFSpeechSynthesizer)init
{
  SRUIFSpeechSynthesizer *v2;
  uint64_t v3;
  NSMutableArray *activeTasks;
  NSMutableDictionary *v5;
  NSMutableDictionary *delayedTasks;
  AFQueue *v7;
  AFQueue *taskQueue;
  void *v9;
  uint64_t v10;
  AFVoiceInfo *outputVoice;
  NSObject *v12;
  AFVoiceInfo *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *availableVoicesForLanguage;
  dispatch_queue_t v16;
  OS_dispatch_queue *processingTasksQueue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *pendingTasksQueue;
  dispatch_group_t v21;
  OS_dispatch_group *pendingTasksGroup;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  AFVoiceInfo *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)SRUIFSpeechSynthesizer;
  v2 = -[SRUIFSpeechSynthesizer init](&v24, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    activeTasks = v2->_activeTasks;
    v2->_activeTasks = (NSMutableArray *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    delayedTasks = v2->_delayedTasks;
    v2->_delayedTasks = v5;

    v7 = (AFQueue *)objc_alloc_init(MEMORY[0x24BE09280]);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = v7;

    -[AFQueue setDelegate:](v2->_taskQueue, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "outputVoice");
    v10 = objc_claimAutoreleasedReturnValue();
    outputVoice = v2->_outputVoice;
    v2->_outputVoice = (AFVoiceInfo *)v10;

    v12 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v2->_outputVoice;
      *(_DWORD *)buf = 136315394;
      v26 = "-[SRUIFSpeechSynthesizer init]";
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_219F26000, v12, OS_LOG_TYPE_DEFAULT, "%s #tts outputVoice:%@", buf, 0x16u);
    }
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    availableVoicesForLanguage = v2->_availableVoicesForLanguage;
    v2->_availableVoicesForLanguage = v14;

    v16 = dispatch_queue_create("SpeechSynthesisProcessingTasksQueue", 0);
    processingTasksQueue = v2->_processingTasksQueue;
    v2->_processingTasksQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("SpeechSynthesisPendingTasksQueue", v18);
    pendingTasksQueue = v2->_pendingTasksQueue;
    v2->_pendingTasksQueue = (OS_dispatch_queue *)v19;

    v21 = dispatch_group_create();
    pendingTasksGroup = v2->_pendingTasksGroup;
    v2->_pendingTasksGroup = (OS_dispatch_group *)v21;

  }
  return v2;
}

- (SiriTTSDaemonSession)ttsSession
{
  SiriTTSDaemonSession *v3;
  SiriTTSDaemonSession *ttsSession;

  if (!self->_ttsSession && AFDeviceSupportsTTS())
  {
    v3 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x24BEA7A08]);
    ttsSession = self->_ttsSession;
    self->_ttsSession = v3;

  }
  return self->_ttsSession;
}

- (void)prewarmIfNeeded
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SRUIFSpeechSynthesizer prewarmIfNeeded]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v10, 0xCu);
  }
  v4 = objc_alloc(MEMORY[0x24BEA7A60]);
  -[AFVoiceInfo languageCode](self->_outputVoice, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFVoiceInfo name](self->_outputVoice, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithLanguage:name:", v5, v6);

  objc_msgSend(v7, "setFootprint:", -[SRUIFSpeechSynthesizer _speechFootPrintForVoice:](self, "_speechFootPrintForVoice:", self->_outputVoice));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A50]), "initWithText:voice:", &stru_24DC1C4B0, v7);
  -[SRUIFSpeechSynthesizer ttsSession](self, "ttsSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prewarmWithRequest:didFinish:", v8, &__block_literal_global_1);

}

void __41__SRUIFSpeechSynthesizer_prewarmIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315394;
      v5 = "-[SRUIFSpeechSynthesizer prewarmIfNeeded]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts Unable to prewarm session, error=%@", (uint8_t *)&v4, 0x16u);
    }
  }

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SRUIFSpeechSynthesizer dealloc]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SRUIFSpeechSynthesizer;
  -[SRUIFSpeechSynthesizer dealloc](&v4, sel_dealloc);
}

- (BOOL)isSpeaking
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = dispatch_semaphore_create(0);
  -[SRUIFSpeechSynthesizer ttsSession](self, "ttsSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__SRUIFSpeechSynthesizer_isSpeaking__block_invoke;
  v8[3] = &unk_24DC1AC88;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "isSpeaking:", v8);

  v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

intptr_t __36__SRUIFSpeechSynthesizer_isSpeaking__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)isSynthesisQueueEmpty:(id)a3
{
  id v4;
  NSObject *processingTasksQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  processingTasksQueue = self->_processingTasksQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SRUIFSpeechSynthesizer_isSynthesisQueueEmpty___block_invoke;
  v7[3] = &unk_24DC1ACD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(processingTasksQueue, v7);

}

void __48__SRUIFSpeechSynthesizer_isSynthesisQueueEmpty___block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isSynthesisQueueEmpty");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__SRUIFSpeechSynthesizer_isSynthesisQueueEmpty___block_invoke_2;
  v3[3] = &unk_24DC1ACB0;
  v4 = *(id *)(a1 + 40);
  v5 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __48__SRUIFSpeechSynthesizer_isSynthesisQueueEmpty___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (BOOL)_isSynthesisQueueEmpty
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SRUIFSpeechSynthesizer _activeTasks](self, "_activeTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[SRUIFSpeechSynthesizer _taskQueue](self, "_taskQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 0;

  }
  return v4;
}

- (void)duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  double v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__SRUIFSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke;
  v11[3] = &unk_24DC1A980;
  v12 = v8;
  v9 = v8;
  *(float *)&v10 = a3;
  -[SRUIFSpeechSynthesizer _duckTTSVolumeTo:rampTime:completion:](self, "_duckTTSVolumeTo:rampTime:completion:", v11, v10, a4);

}

void __62__SRUIFSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__SRUIFSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke_2;
  v6[3] = &unk_24DC1AD00;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __62__SRUIFSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8;
  double v9;
  SiriTTSDaemonSession *ttsSession;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v8 = a5;
  ttsSession = self->_ttsSession;
  if (ttsSession)
  {
    *(float *)&v9 = a3;
    -[SiriTTSDaemonSession adjustVolume:rampTime:didFinish:](ttsSession, "adjustVolume:rampTime:didFinish:", v8, v9, a4);
  }
  else if (v8)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__0;
    v15[4] = __Block_byref_object_dispose__0;
    v11 = objc_alloc(MEMORY[0x24BDD1540]);
    v16 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x24BE09488], 6, 0);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__SRUIFSpeechSynthesizer__duckTTSVolumeTo_rampTime_completion___block_invoke;
    v12[3] = &unk_24DC1AD28;
    v13 = v8;
    v14 = v15;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

    _Block_object_dispose(v15, 8);
  }

}

uint64_t __63__SRUIFSpeechSynthesizer__duckTTSVolumeTo_rampTime_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)cancel
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRUIFSpeechSynthesizer cancel]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v4, 0xCu);
  }
  -[SRUIFSpeechSynthesizer _cancelByCancellingActiveTasksOnly:](self, "_cancelByCancellingActiveTasksOnly:", 0);
}

- (void)skipCurrentSynthesis
{
  -[SRUIFSpeechSynthesizer _cancelByCancellingActiveTasksOnly:](self, "_cancelByCancellingActiveTasksOnly:", 1);
}

- (void)_cancelByCancellingActiveTasksOnly:(BOOL)a3
{
  NSObject *processingTasksQueue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  processingTasksQueue = self->_processingTasksQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SRUIFSpeechSynthesizer__cancelByCancellingActiveTasksOnly___block_invoke;
  block[3] = &unk_24DC1ADB0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(processingTasksQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__SRUIFSpeechSynthesizer__cancelByCancellingActiveTasksOnly___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(WeakRetained, "_taskQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dequeueAllObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_20);
    }
    objc_msgSend(v3, "_activeTasks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_21);
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[SRUIFSpeechSynthesizer _cancelByCancellingActiveTasksOnly:]_block_invoke";
      _os_log_impl(&dword_219F26000, v8, OS_LOG_TYPE_DEFAULT, "%s #tts Canceling speech synthesis", buf, 0xCu);
    }
    if (v3[12])
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = (void *)v3[12];
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "ttsSessionRequest", (_QWORD)v16);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "cancelWithRequest:", v15);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v4, "makeObjectsPerformSelector:", sel_executeCompletion, (_QWORD)v16);

  }
}

uint64_t __61__SRUIFSpeechSynthesizer__cancelByCancellingActiveTasksOnly___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSynthesisResult:", 3);
}

uint64_t __61__SRUIFSpeechSynthesizer__cancelByCancellingActiveTasksOnly___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSynthesisResult:", 3);
}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  SRUIFSpeechSynthesizer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SRUIFSpeechSynthesizer invalidate]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts Invalidating %@", (uint8_t *)&v4, 0x16u);
  }
  -[SRUIFSpeechSynthesizer performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_invalidateOnMainThread, 0, 1);
}

- (void)taskEligibilityDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SRUIFSpeechSynthesizer taskEligibilityDidChange:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #tts task=%@", (uint8_t *)&v6, 0x16u);
  }
  -[SRUIFSpeechSynthesizer _processTaskQueue](self, "_processTaskQueue");

}

- (void)didStartAudioTask:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__SRUIFSpeechSynthesizer_didStartAudioTask___block_invoke;
  v6[3] = &unk_24DC1ADD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __44__SRUIFSpeechSynthesizer_didStartAudioTask___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speechSynthesisDidStartSpeakingWithIdentifier:", *(_QWORD *)(a1 + 40));

}

- (void)didFinishAudioTask:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *processingTasksQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  kdebug_trace();
  objc_initWeak(&location, self);
  processingTasksQueue = self->_processingTasksQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke;
  v11[3] = &unk_24DC1A7C0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(processingTasksQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  os_log_t *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(id *)(a1 + 32);
    objc_msgSend(v3, "ttsSessionRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "clientStateManagerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notifyClientStateManagerTransactionBegan:", WeakRetained);

    v7 = (os_log_t *)MEMORY[0x24BE08FB0];
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v28 = "-[SRUIFSpeechSynthesizer didFinishAudioTask:withError:]_block_invoke";
      v29 = 2112;
      v30 = v5;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_219F26000, v8, OS_LOG_TYPE_DEFAULT, "%s #tts request=%@ error=%@", buf, 0x20u);
    }
    if (v3)
    {
      objc_msgSend(WeakRetained, "_activeTasks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v3);

    }
    else
    {
      v11 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    v20 = *(_QWORD *)(a1 + 40);
    v19 = (_QWORD *)(a1 + 40);
    if (v20)
    {
      objc_msgSend(v3, "setSynthesisError:");
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_cold_1();
    }
    else
    {
      v21 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[SRUIFSpeechSynthesizer didFinishAudioTask:withError:]_block_invoke";
        v29 = 2112;
        v30 = v5;
        _os_log_impl(&dword_219F26000, v21, OS_LOG_TYPE_DEFAULT, "%s #tts Finished speaking presynthesized audio \"%@\", buf, 0x16u);
      }
    }
    if (!objc_msgSend(v3, "synthesisResult"))
    {
      if (*v19)
        v22 = 2;
      else
        v22 = 1;
      objc_msgSend(v3, "setSynthesisResult:", v22);
    }
    objc_msgSend(v3, "executeCompletion");
    objc_msgSend(WeakRetained, "_processTaskQueue");
    v23 = WeakRetained[3];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_26;
    v25[3] = &unk_24DC1ADD8;
    v25[4] = WeakRetained;
    v26 = v3;
    v24 = v3;
    dispatch_async(v23, v25);

  }
}

void __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_26(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  char v7;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientStateManagerDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "notifyClientStateManagerSpeakingEnded:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "clientStateManagerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyClientStateManagerTransactionEnded:", *(_QWORD *)(a1 + 32));

  LOBYTE(v3) = objc_msgSend(*(id *)(a1 + 32), "_isSynthesisQueueEmpty");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_2;
  block[3] = &unk_24DC1AE00;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = (char)v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:", v2, *(unsigned __int8 *)(a1 + 48));

}

- (void)didStartSpeakTask:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "ttsSessionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SRUIFSpeechSynthesizer didStartSpeakTask:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_219F26000, v6, OS_LOG_TYPE_DEFAULT, "%s #tts Started:%@", buf, 0x16u);
  }
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__SRUIFSpeechSynthesizer_didStartSpeakTask___block_invoke;
  v9[3] = &unk_24DC1ADD8;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __44__SRUIFSpeechSynthesizer_didStartSpeakTask___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speechSynthesisDidStartSpeakingWithIdentifier:", *(_QWORD *)(a1 + 40));

}

- (void)didFinishSpeakTask:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *processingTasksQueue;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  SRUIFSpeechSynthesizer *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "ttsSessionRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]";
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_219F26000, v9, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Finished %@", buf, 0x16u);
  }
  kdebug_trace();
  objc_initWeak((id *)buf, self);
  processingTasksQueue = self->_processingTasksQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke;
  block[3] = &unk_24DC1AE28;
  objc_copyWeak(&v19, (id *)buf);
  v15 = v7;
  v16 = v6;
  v17 = v8;
  v18 = self;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  dispatch_async(processingTasksQueue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  int v7;
  os_log_t *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  int v30;
  os_log_t v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  _BOOL4 v38;
  uint64_t v39;
  os_log_t v40;
  BOOL v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  _QWORD block[5];
  id v49;
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  _BOOL4 v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = *(_QWORD *)(a1 + 32);
  v4 = (_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "canUseServerTTS");
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = (void *)*MEMORY[0x24BE08FB0];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v10)
      goto LABEL_7;
    v11 = v9;
    objc_msgSend(v6, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136316162;
    v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
    v53 = 2112;
    v54 = v12;
    v55 = 2112;
    v56 = v13;
    v57 = 2112;
    v58 = v14;
    v59 = 1024;
    v60 = v5 == 0;
    v15 = "%s #tts [Post] text=\"%@\" error=%@ request=%@ finishedSpeaking=%i";
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    v11 = v9;
    objc_msgSend(v6, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136316163;
    v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
    v53 = 2117;
    v54 = v12;
    v55 = 2112;
    v56 = v16;
    v57 = 2112;
    v58 = v17;
    v59 = 1024;
    v60 = v5 == 0;
    v15 = "%s #tts [Post] text=\"%{sensitive}@\" error=%@ request=%@ finishedSpeaking=%i";
  }
  _os_log_impl(&dword_219F26000, v11, OS_LOG_TYPE_DEFAULT, v15, buf, 0x30u);

LABEL_7:
  objc_msgSend(WeakRetained, "clientStateManagerDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "notifyClientStateManagerTransactionBegan:", WeakRetained);

  v19 = *v8;
  v20 = *v8;
  if (v6)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
      v53 = 2112;
      v54 = v6;
      _os_log_impl(&dword_219F26000, v19, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Removing Task: %@", buf, 0x16u);
    }
    objc_msgSend(WeakRetained, "_activeTasks");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObject:", v6);

  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_3(v19, v22, v23, v24, v25, v26, v27, v28);
  }
  if (*v4)
  {
    objc_msgSend(v6, "setSynthesisError:");
    v29 = +[SRUIFSpeechSynthesisUtility isSpeechSynthesisErrorUserCancelled:](SRUIFSpeechSynthesisUtility, "isSpeechSynthesisErrorUserCancelled:", *v4);
    v30 = objc_msgSend(v6, "canUseServerTTS");
    v31 = *v8;
    v32 = *v8;
    if (v29)
    {
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v33)
        {
          v34 = v31;
          objc_msgSend(v6, "text");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = *v4;
          *(_DWORD *)buf = 136315650;
          v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
          v53 = 2112;
          v54 = v35;
          v55 = 2114;
          v56 = v36;
          v37 = "%s #tts [Post] Synthesis was cancelled, marking speech request finished \"%@\": %{public}@";
LABEL_23:
          _os_log_impl(&dword_219F26000, v34, OS_LOG_TYPE_DEFAULT, v37, buf, 0x20u);

        }
      }
      else if (v33)
      {
        v34 = v31;
        objc_msgSend(v6, "text");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *v4;
        *(_DWORD *)buf = 136315651;
        v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
        v53 = 2117;
        v54 = v35;
        v55 = 2114;
        v56 = v39;
        v37 = "%s #tts [Post] Synthesis was cancelled, marking speech request finished \"%{sensitive}@\": %{public}@";
        goto LABEL_23;
      }
      objc_msgSend(v6, "setSynthesisResult:", 1);
      goto LABEL_27;
    }
    v38 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v38)
        __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_1(v31, v6);
    }
    else if (v38)
    {
      __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_2(v31, v6);
    }
  }
LABEL_27:
  if (!objc_msgSend(v6, "synthesisResult"))
  {
    v40 = *v8;
    v41 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
      v42 = 2;
    else
      v42 = 1;
    if (v41)
    {
      v43 = v40;
      SRUIFSpeechSynthesisResultGetName(v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
      v53 = 2112;
      v54 = v44;
      _os_log_impl(&dword_219F26000, v43, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Marking result %@", buf, 0x16u);

    }
    objc_msgSend(v6, "setSynthesisResult:", v42);
  }
  v45 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
    v53 = 2112;
    v54 = v6;
    _os_log_impl(&dword_219F26000, v45, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Calling completion for Task: %@", buf, 0x16u);
  }
  objc_msgSend(v6, "executeCompletion");
  objc_msgSend(*(id *)(a1 + 56), "_processTaskQueue");
  v46 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_28;
  block[3] = &unk_24DC1A7C0;
  objc_copyWeak(&v50, v2);
  block[4] = *(_QWORD *)(a1 + 56);
  v49 = v6;
  v47 = v6;
  dispatch_async(v46, block);

  objc_destroyWeak(&v50);
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_28(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[5];
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *MEMORY[0x24BE08FB0];
  if (WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = WeakRetained[10];
      v5 = v3;
      *(_DWORD *)buf = 136315394;
      v20 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
      v21 = 2048;
      v22 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Active Task count: %tu", buf, 0x16u);

    }
    if (!objc_msgSend(WeakRetained[10], "count"))
    {
      objc_msgSend(WeakRetained, "clientStateManagerDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "notifyClientStateManagerSpeakingEnded:", *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(WeakRetained, "clientStateManagerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notifyClientStateManagerTransactionEnded:", *(_QWORD *)(a1 + 32));

    LOBYTE(v7) = objc_msgSend(WeakRetained, "_isSynthesisQueueEmpty");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_29;
    block[3] = &unk_24DC1AE00;
    v8 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v17 = v8;
    v18 = (char)v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_28_cold_1(v3, v9, v10, v11, v12, v13, v14, v15);
  }

}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_29(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:", v2, *(unsigned __int8 *)(a1 + 48));

}

- (void)speakTask:(id)a3 didGenerateMetrics:(id)a4
{
  id v6;
  id v7;
  int v8;
  os_log_t *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  os_log_t v45;
  void *v46;
  SRUIFSpeechSynthesizer *v47;
  void *v48;
  _QWORD block[5];
  id v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  uint64_t v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "canUseServerTTS");
  v9 = (os_log_t *)MEMORY[0x24BE08FB0];
  v10 = (void *)*MEMORY[0x24BE08FB0];
  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v11)
      goto LABEL_7;
    v12 = v10;
    objc_msgSend(v6, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ttsSessionRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v59 = "-[SRUIFSpeechSynthesizer speakTask:didGenerateMetrics:]";
    v60 = 2112;
    v61 = v13;
    v62 = 2112;
    v63 = v14;
    v15 = "%s #tts [Post] text=%@ request=%@";
  }
  else
  {
    if (!v11)
      goto LABEL_7;
    v12 = v10;
    objc_msgSend(v6, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ttsSessionRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315651;
    v59 = "-[SRUIFSpeechSynthesizer speakTask:didGenerateMetrics:]";
    v60 = 2117;
    v61 = v13;
    v62 = 2112;
    v63 = v14;
    v15 = "%s #tts [Post] text=%{sensitive}@ request=%@";
  }
  _os_log_impl(&dword_219F26000, v12, OS_LOG_TYPE_DEFAULT, v15, buf, 0x20u);

LABEL_7:
  v16 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    objc_msgSend(v6, "ttsSessionRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v59 = "-[SRUIFSpeechSynthesizer speakTask:didGenerateMetrics:]";
    v60 = 2112;
    v61 = v18;
    _os_log_impl(&dword_219F26000, v17, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Finished Metrics generated %@", buf, 0x16u);

  }
  if (v7)
  {
    v47 = self;
    objc_msgSend(v6, "analyticsContext");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = (void *)MEMORY[0x24BDBD1B8];
    if (v19)
      v22 = (void *)v19;
    else
      v22 = (void *)MEMORY[0x24BDBD1B8];
    v23 = v22;

    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setObject:forKey:", v26, CFSTR("id"));
    v56 = CFSTR("id");
    v46 = (void *)v26;
    v57 = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (AFIsInternalInstall())
    {
      v54 = CFSTR("text");
      objc_msgSend(v6, "text");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v30 = &stru_24DC1C4B0;
      if (v28)
        v30 = (const __CFString *)v28;
      v55 = v30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v31 = objc_msgSend(v7, "requestCreatedTime");
    if (v31)
    {
      v32 = v31;
      v53[0] = v48;
      v53[1] = v23;
      v53[2] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      AFAnalyticsContextsMerge();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logEventWithType:machAbsoluteTime:context:", 1801, v32, v34);

    }
    v35 = objc_msgSend(v7, "speechBeginTime");
    if (v35)
    {
      v52[0] = v27;
      v52[1] = v23;
      v52[2] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      AFAnalyticsContextsMerge();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logEventWithType:machAbsoluteTime:context:", 1802, v35, v37);

    }
    v38 = objc_msgSend(v7, "speechEndTime");
    if (v38)
    {
      v51[0] = v27;
      v51[1] = v23;
      v51[2] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      AFAnalyticsContextsMerge();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logEventWithType:machAbsoluteTime:context:", 1803, v38, v40);

    }
    v41 = objc_alloc(MEMORY[0x24BE09368]);
    objc_msgSend(v6, "text");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v41, "initWithUtterance:beginTimestamp:endTimestamp:", v42, v35, v38);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__SRUIFSpeechSynthesizer_speakTask_didGenerateMetrics___block_invoke;
    block[3] = &unk_24DC1ADD8;
    block[4] = v47;
    v50 = v43;
    v44 = v43;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v45 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      -[SRUIFSpeechSynthesizer speakTask:didGenerateMetrics:].cold.1(v45, v6);
  }

}

void __55__SRUIFSpeechSynthesizer_speakTask_didGenerateMetrics___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speechSynthesisDidFinish:", *(_QWORD *)(a1 + 40));

}

- (void)setOutputVoice:(id)a3
{
  id v5;
  AFVoiceInfo *v6;
  AFVoiceInfo **p_outputVoice;
  AFVoiceInfo *outputVoice;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  outputVoice = self->_outputVoice;
  p_outputVoice = &self->_outputVoice;
  v6 = outputVoice;
  if (!outputVoice || (-[AFVoiceInfo isEqual:](v6, "isEqual:", v5) & 1) == 0)
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[SRUIFSpeechSynthesizer setOutputVoice:]";
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_219F26000, v9, OS_LOG_TYPE_DEFAULT, "%s #tts Updating synthesizer voice to %@", (uint8_t *)&v11, 0x16u);
    }
    objc_storeStrong((id *)p_outputVoice, a3);
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "synchronizeVoiceServicesLanguageCode");

  }
}

- (void)enqueueSpeechSynthesisRequest:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  double v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  v3 = a3;
  objc_msgSend(v3, "text");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "language");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isPhonetic");
  v6 = objc_msgSend(v3, "provisional");
  v7 = (double)objc_msgSend(v3, "eligibleAfterDuration");
  v8 = objc_msgSend(v3, "delayed");
  v9 = objc_msgSend(v3, "canUseServerTTS");
  objc_msgSend(v3, "preparationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "analyticsContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "speakableContextInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = 1;
  BYTE3(v14) = v9;
  BYTE2(v14) = v8;
  BYTE1(v14) = v6;
  LOBYTE(v14) = v5;
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", v21, v19, v18, v17, 0, v16, v7, v4, v14, v10, v15, v11, v12, v13);

}

- (void)enqueueText:(id)a3 identifier:(id)a4 sessionId:(id)a5 language:(id)a6 gender:(id)a7 isPhonetic:(BOOL)a8 provisionally:(BOOL)a9 eligibleAfterDuration:(double)a10 delayed:(BOOL)a11 canUseServerTTS:(BOOL)a12 preparationIdentifier:(id)a13 completion:(id)a14 analyticsContext:(id)a15 speakableContextInfo:(id)a16
{
  uint64_t v16;
  uint64_t v17;

  LOBYTE(v17) = 1;
  WORD1(v16) = __PAIR16__(a12, a11);
  BYTE1(v16) = a9;
  LOBYTE(v16) = a8;
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", a3, 0, a4, a5, 0, a6, a10, a7, v16, a13, v17, a14, a15, a16);
}

- (void)enqueueText:(id)a3 identifier:(id)a4 sessionId:(id)a5 preferredVoice:(id)a6 language:(id)a7 gender:(id)a8 isPhonetic:(BOOL)a9 provisionally:(BOOL)a10 eligibleAfterDuration:(double)a11 delayed:(BOOL)a12 canUseServerTTS:(BOOL)a13 preparationIdentifier:(id)a14 completion:(id)a15 analyticsContext:(id)a16 speakableContextInfo:(id)a17
{
  uint64_t v17;
  uint64_t v18;

  LOBYTE(v18) = 1;
  WORD1(v17) = __PAIR16__(a13, a12);
  LOWORD(v17) = __PAIR16__(a10, a9);
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", a3, 0, a4, a5, a6, a7, a11, a8, v17, a14, v18, a15, a16, a17);
}

- (void)enqueueAudioData:(id)a3 identifier:(id)a4 sessionId:(id)a5 provisionally:(BOOL)a6 eligibleAfterDuration:(double)a7 completion:(id)a8
{
  uint64_t v8;
  uint64_t v9;

  LOBYTE(v9) = 1;
  WORD1(v8) = 256;
  BYTE1(v8) = a6;
  LOBYTE(v8) = 0;
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", 0, a3, a4, a5, 0, 0, a7, 0, v8, 0, v9, a8, 0, 0);
}

- (void)enqueuePhaticWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SRUIFSpeechSynthesizer enqueuePhaticWithCompletion:]";
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #phatic [Pre]", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = 0;
  LODWORD(v8) = 0x1000000;
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", CFSTR("\x1B\\mrk=play=phat\\"), 0, v7, v7, 0, 0, 0.0, 0, v8, 0, v9, v4, 0, 0);

}

- (void)_enqueueText:(id)a3 audioData:(id)a4 identifier:(id)a5 sessionId:(id)a6 preferredVoice:(id)a7 language:(id)a8 gender:(id)a9 isPhonetic:(BOOL)a10 provisionally:(BOOL)a11 eligibleAfterDuration:(double)a12 delayed:(BOOL)a13 canUseServerTTS:(BOOL)a14 preparationIdentifier:(id)a15 shouldCache:(BOOL)a16 completion:(id)a17 analyticsContext:(id)a18 speakableContextInfo:(id)a19
{
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  SRUIFSpeechSynthesizer *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  SRUIFSpeechSynthesisTask *v40;
  double v41;
  SRUIFSpeechSynthesisTask *v42;
  void *v43;
  SRUIFSpeechSynthesizer *v44;
  NSObject *processingTasksQueue;
  SRUIFSpeechSynthesisTask *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD block[4];
  SRUIFSpeechSynthesisTask *v60;
  SRUIFSpeechSynthesizer *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  BOOL v66;
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v58 = a3;
  v25 = a4;
  v51 = a5;
  v26 = a6;
  v57 = a7;
  v56 = a8;
  v55 = a9;
  v27 = a15;
  v54 = a17;
  v53 = a18;
  v50 = a19;
  v28 = *MEMORY[0x24BE08FB0];
  v29 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (a14)
  {
    if (!v29)
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v68 = "-[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic"
          ":provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:anal"
          "yticsContext:speakableContextInfo:]";
    v69 = 2112;
    v70 = v58;
    v30 = "%s #tts [Pre] text:%@";
  }
  else
  {
    if (!v29)
      goto LABEL_7;
    *(_DWORD *)buf = 136315395;
    v68 = "-[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic"
          ":provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:anal"
          "yticsContext:speakableContextInfo:]";
    v69 = 2117;
    v70 = v58;
    v30 = "%s #tts [Pre] text:%{sensitive}@";
  }
  _os_log_impl(&dword_219F26000, v28, OS_LOG_TYPE_DEFAULT, v30, buf, 0x16u);
LABEL_7:
  v31 = MEMORY[0x24BDAC760];
  v32 = v25;
  v33 = v26;
  v34 = self;
  v49 = v27;
  if (v27)
  {
    v35 = v27;
    objc_initWeak((id *)buf, self);
    v36 = v31;
    v62[0] = v31;
    v62[1] = 3221225472;
    v62[2] = __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke;
    v62[3] = &unk_24DC1AE78;
    objc_copyWeak(&v65, (id *)buf);
    v63 = v35;
    v37 = v58;
    v64 = v58;
    v66 = a14;
    v38 = (void *)MEMORY[0x220736DE0](v62);

    objc_destroyWeak(&v65);
    objc_destroyWeak((id *)buf);
    v39 = v51;
  }
  else
  {
    v36 = MEMORY[0x24BDAC760];
    v38 = 0;
    v39 = v51;
    v37 = v58;
  }
  v40 = [SRUIFSpeechSynthesisTask alloc];
  v41 = 0.0;
  if (a11)
    v41 = a12;
  LOBYTE(v48) = a14;
  LOWORD(v47) = __PAIR16__(a13, a11);
  v42 = -[SRUIFSpeechSynthesisTask initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:provisional:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseServerTTS:eligibilityChangedQueue:](v40, "initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:provisional:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseServerTTS:eligibilityChangedQueue:", v37, v25, v39, v33, v57, v56, v41, v55, v47, v38, v54, v53, v50, v48, self->_processingTasksQueue);
  -[SRUIFSpeechSynthesisTask setIsPhonetic:](v42, "setIsPhonetic:", a10);
  -[SRUIFSpeechSynthesisTask setDelegate:](v42, "setDelegate:", self);
  -[SRUIFSpeechSynthesisTask setShouldCache:](v42, "setShouldCache:", a16);
  if (a13)
  {
    if (v39)
    {
      -[SRUIFSpeechSynthesizer _delayedTasks](self, "_delayedTasks");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, v39);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:].cold.1();
      -[SRUIFSpeechSynthesisTask setDelayed:](v42, "setDelayed:", 0);
    }
    v34 = self;
  }
  kdebug_trace();
  v44 = v34;
  processingTasksQueue = v34->_processingTasksQueue;
  block[0] = v36;
  block[1] = 3221225472;
  block[2] = __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke_43;
  block[3] = &unk_24DC1ADD8;
  v60 = v42;
  v61 = v44;
  v46 = v42;
  dispatch_async(processingTasksQueue, block);

}

void __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v13 = "-[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonet"
            "ic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:"
            "analyticsContext:speakableContextInfo:]_block_invoke";
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Preparation %@", buf, 0x16u);
    }
    v7 = objc_loadWeakRetained(WeakRetained + 7);

    if (v7)
    {
      v8 = objc_loadWeakRetained(WeakRetained + 7);
      v9 = *(_QWORD *)(a1 + 32);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke_39;
      v10[3] = &unk_24DC1AE50;
      v11 = v3;
      objc_msgSend(v8, "speechSynthesisGetPreparedTextForIdentifier:completion:", v9, v10);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    }
  }

}

uint64_t __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __255__SRUIFSpeechSynthesizer__enqueueText_audioData_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_shouldCache_completion_analyticsContext_speakableContextInfo___block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:"
         "provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyt"
         "icsContext:speakableContextInfo:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_219F26000, v2, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Enqueueing task: %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_taskQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueObject:", *(_QWORD *)(a1 + 32));

}

- (void)enqueueText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
  uint64_t v6;
  uint64_t v7;

  LOBYTE(v7) = 1;
  LODWORD(v6) = 0x1000000;
  -[SRUIFSpeechSynthesizer _enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:](self, "_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:", a3, 0, a4, a5, 0, 0, 0.0, 0, v6, 0, v7, a6, 0, 0);
}

- (void)processDelayedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  if (v4)
  {
    -[SRUIFSpeechSynthesizer _delayedTasks](self, "_delayedTasks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelayed:", 0);

    -[SRUIFSpeechSynthesizer _delayedTasks](self, "_delayedTasks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v4);

  }
  else
  {
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFSpeechSynthesizer processDelayedItem:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (void)_handleAudioData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;
  _BYTE v38[32];
  uint64_t v39;
  uint8_t buf[32];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SRUIFSpeechSynthesizer _handleAudioData:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_219F26000, v9, OS_LOG_TYPE_DEFAULT, "%s #tts %@", buf, 0x16u);
  }
  -[SRUIFSpeechSynthesizer clientStateManagerDelegate](self, "clientStateManagerDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyClientStateManagerTransactionBegan:", self);

  objc_msgSend(v6, "audioData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  memset(buf, 0, sizeof(buf));
  objc_msgSend(v6, "audioData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "decoderStreamDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ASBDForSAUIAD(v13, (uint64_t)buf);

  v14 = objc_alloc_init(MEMORY[0x24BEA79E8]);
  *(_OWORD *)v38 = *(_OWORD *)buf;
  *(_OWORD *)&v38[16] = *(_OWORD *)&buf[16];
  v39 = v41;
  objc_msgSend(v14, "setAsbd:", v38);
  objc_msgSend(v11, "audioBuffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAudioData:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA79F8]), "initWithAudio:", v14);
  objc_msgSend(v16, "setAudioSessionId:", self->_audioSessionID);
  v17 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v6, "sessionId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);
  objc_msgSend(v16, "setSiriRequestId:", v19);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v20 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v6, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);
    objc_msgSend(v16, "setSiriAceViewId:", v22);

  }
  objc_initWeak(&location, self);
  v23 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __54__SRUIFSpeechSynthesizer__handleAudioData_completion___block_invoke;
  v34[3] = &unk_24DC1A838;
  objc_copyWeak(&v36, &location);
  v24 = v6;
  v35 = v24;
  objc_msgSend(v16, "setDidStartSpeaking:", v34);
  objc_msgSend(v24, "setTtsSessionRequest:", v16);
  -[SRUIFSpeechSynthesizer ttsSession](self, "ttsSession");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __54__SRUIFSpeechSynthesizer__handleAudioData_completion___block_invoke_2;
  v31[3] = &unk_24DC1AEA0;
  objc_copyWeak(&v33, &location);
  v26 = v24;
  v32 = v26;
  objc_msgSend(v25, "speakWithAudioRequest:didFinish:", v16, v31);

  v27 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v38 = 136315394;
    *(_QWORD *)&v38[4] = "-[SRUIFSpeechSynthesizer _handleAudioData:completion:]";
    *(_WORD *)&v38[12] = 2112;
    *(_QWORD *)&v38[14] = v26;
    _os_log_impl(&dword_219F26000, v27, OS_LOG_TYPE_DEFAULT, "%s #tts started presynthesized audio for %@", v38, 0x16u);
  }
  kdebug_trace();
  -[SRUIFSpeechSynthesizer _activeTasks](self, "_activeTasks");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v26);

  -[SRUIFSpeechSynthesizer clientStateManagerDelegate](self, "clientStateManagerDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "notifyClientStateManagerSpeakingBegan:", self);

  -[SRUIFSpeechSynthesizer clientStateManagerDelegate](self, "clientStateManagerDelegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "notifyClientStateManagerTransactionEnded:", self);

  if (v7)
    v7[2](v7);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

void __54__SRUIFSpeechSynthesizer__handleAudioData_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didStartAudioTask:", *(_QWORD *)(a1 + 32));

}

void __54__SRUIFSpeechSynthesizer__handleAudioData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "didFinishAudioTask:withError:", *(_QWORD *)(a1 + 32), v4);

}

- (void)_handleText:(id)a3 completion:(id)a4
{
  id v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  AFVoiceInfo *outputVoice;
  NSObject *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id *v38;
  void *v39;
  id v40;
  id v41;
  id *v42;
  void (**v43)(_QWORD, _QWORD);
  id v44;
  id *v45;
  void (**v46)(_QWORD);
  id v47;
  id *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  _BOOL4 v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  id *v73;
  _QWORD v74[4];
  id v75;
  id v76;
  SRUIFSpeechSynthesizer *v77;
  void (**v78)(_QWORD, _QWORD);
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  SRUIFSpeechSynthesizer *v83;
  id *v84;
  _QWORD v85[4];
  id v86;
  SRUIFSpeechSynthesizer *v87;
  id *v88;
  _QWORD v89[4];
  id v90;
  id v91;
  SRUIFSpeechSynthesizer *v92;
  id v93;
  id *v94;
  id v95;
  id location;
  _QWORD v97[4];
  id v98;
  SRUIFSpeechSynthesizer *v99;
  id *v100;
  uint8_t buf[4];
  const char *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  const __CFString *v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  void *v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v73 = (id *)a4;
  v7 = objc_msgSend(v6, "canUseServerTTS");
  v8 = (void *)*MEMORY[0x24BE08FB0];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = v8;
      objc_msgSend(v6, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v102 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
      v103 = 2112;
      v104 = v11;
      _os_log_impl(&dword_219F26000, v10, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] text:%@", buf, 0x16u);

    }
  }
  else if (v9)
  {
    v12 = v8;
    objc_msgSend(v6, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315395;
    v102 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
    v103 = 2117;
    v104 = v13;
    _os_log_impl(&dword_219F26000, v12, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] text:%{sensitive}@", buf, 0x16u);

  }
  -[SRUIFSpeechSynthesizer clientStateManagerDelegate](self, "clientStateManagerDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notifyClientStateManagerTransactionBegan:", self);

  objc_msgSend(v6, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "isPhonetic");
  if (v15)
    v17 = v16;
  else
    v17 = 0;
  if (v17 == 1)
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("\x1B/+%@\x1B/+"), v15);

    v15 = (void *)v18;
  }
  objc_msgSend(v6, "language");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[AFVoiceInfo languageCode](self->_outputVoice, "languageCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "language");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "caseInsensitiveCompare:", v21) != 0;

  }
  else
  {
    v22 = 0;
  }

  objc_msgSend(v6, "gender");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = !v22;
  if (v23)
  {
    -[AFVoiceInfo genderString](self->_outputVoice, "genderString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gender");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "caseInsensitiveCompare:", v26) == 0;

    v24 &= v27;
  }
  v28 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    outputVoice = self->_outputVoice;
    v30 = v28;
    -[AFVoiceInfo languageCode](outputVoice, "languageCode");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFVoiceInfo genderString](self->_outputVoice, "genderString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v33 = CFSTR("matches");
    else
      v33 = CFSTR("mismatches");
    objc_msgSend(v6, "language");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gender");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v102 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
    v103 = 2112;
    v104 = v31;
    v105 = 2112;
    v106 = v32;
    v107 = 2112;
    v108 = v33;
    v109 = 2112;
    v110 = v34;
    v111 = 2112;
    v112 = v35;
    _os_log_impl(&dword_219F26000, v30, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Output voice [%@, %@] %@ specified language %@, gender %@", buf, 0x3Eu);

  }
  v36 = MEMORY[0x24BDAC760];
  v97[0] = MEMORY[0x24BDAC760];
  v97[1] = 3221225472;
  v97[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke;
  v97[3] = &unk_24DC1AEC8;
  v37 = v6;
  v98 = v37;
  v99 = self;
  v38 = v73;
  v100 = v38;
  v39 = (void *)MEMORY[0x220736DE0](v97);
  objc_initWeak(&location, self);
  v89[0] = v36;
  v89[1] = 3221225472;
  v89[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_55;
  v89[3] = &unk_24DC1AF18;
  objc_copyWeak(&v95, &location);
  v40 = v15;
  v90 = v40;
  v41 = v37;
  v91 = v41;
  v72 = v39;
  v92 = self;
  v93 = v72;
  v42 = v38;
  v94 = v42;
  v43 = (void (**)(_QWORD, _QWORD))MEMORY[0x220736DE0](v89);
  v85[0] = v36;
  v85[1] = 3221225472;
  v85[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_65;
  v85[3] = &unk_24DC1AF40;
  v44 = v41;
  v86 = v44;
  v87 = self;
  v45 = v42;
  v88 = v45;
  v46 = (void (**)(_QWORD))MEMORY[0x220736DE0](v85);
  v81[0] = v36;
  v81[1] = 3221225472;
  v81[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_66;
  v81[3] = &unk_24DC1AF40;
  v47 = v44;
  v82 = v47;
  v83 = self;
  v48 = v45;
  v84 = v48;
  v49 = (void *)MEMORY[0x220736DE0](v81);
  if (v40)
  {
    if (v24)
    {
      v50 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v102 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
        _os_log_impl(&dword_219F26000, v50, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] outputVoiceMatches", buf, 0xCu);
      }
      ((void (**)(_QWORD, AFVoiceInfo *))v43)[2](v43, self->_outputVoice);
    }
    else
    {
      objc_msgSend(v47, "preferredVoice");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = *MEMORY[0x24BE08FB0];
      v61 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
      v71 = v59;
      if (v59)
      {
        if (v61)
        {
          *(_DWORD *)buf = 136315138;
          v102 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
          _os_log_impl(&dword_219F26000, v60, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Using preferredVoice", buf, 0xCu);
        }
        v62 = objc_alloc(MEMORY[0x24BE093A0]);
        objc_msgSend(v59, "languageString");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "name");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (id)objc_msgSend(v62, "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v63, 0, 0, v64, 0, 0, 0);

        ((void (**)(_QWORD, id))v43)[2](v43, v65);
      }
      else
      {
        if (v61)
        {
          *(_DWORD *)buf = 136315138;
          v102 = "-[SRUIFSpeechSynthesizer _handleText:completion:]";
          _os_log_impl(&dword_219F26000, v60, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] No match for output voice", buf, 0xCu);
        }
        objc_msgSend(v47, "language");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v66;
        if (v66)
        {
          v69 = v66;
        }
        else
        {
          -[AFVoiceInfo languageCode](self->_outputVoice, "languageCode");
          v69 = (id)objc_claimAutoreleasedReturnValue();
        }

        v70 = objc_loadWeakRetained(&location);
        objc_msgSend(v47, "gender");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = v36;
        v74[1] = 3221225472;
        v74[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_68;
        v74[3] = &unk_24DC1AF90;
        objc_copyWeak(&v80, &location);
        v75 = v47;
        v78 = v43;
        v65 = v69;
        v76 = v65;
        v77 = self;
        v79 = v49;
        objc_msgSend(v70, "_findVoiceForLanguage:gender:completion:", v65, v68, v74);

        objc_destroyWeak(&v80);
      }

    }
  }
  else
  {
    v51 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFSpeechSynthesizer _handleText:completion:].cold.1(v51, v52, v53, v54, v55, v56, v57, v58);
    v46[2](v46);
  }

  objc_destroyWeak(&v95);
  objc_destroyWeak(&location);

}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_cold_1((uint64_t)v3, a1, v4);
  if (!objc_msgSend(*(id *)(a1 + 32), "synthesisResult"))
    objc_msgSend(*(id *)(a1 + 32), "setSynthesisResult:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setSynthesisError:", v3);
  objc_msgSend(*(id *)(a1 + 32), "executeCompletion");
  objc_msgSend(*(id *)(a1 + 40), "clientStateManagerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyClientStateManagerTransactionEnded:", *(_QWORD *)(a1 + 40));

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_55(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  dispatch_semaphore_t v23;
  void *v24;
  NSObject *v25;
  dispatch_time_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id WeakRetained;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  NSObject *v47;
  _BYTE *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint8_t v55[4];
  const char *v56;
  _BYTE buf[24];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v42 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v42;
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Success ValidOutputVoice:%@", buf, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = objc_alloc(MEMORY[0x24BEA7A60]);
  objc_msgSend(v42, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithLanguage:name:", v5, v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A38]), "initWithText:voice:", *(_QWORD *)(a1 + 32), v7);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "siriSpeechRate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    LODWORD(v13) = v12;
    objc_msgSend(v8, "setRate:", v13);
  }
  v14 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(*(id *)(a1 + 40), "sessionId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);
  objc_msgSend(v8, "setSiriRequestId:", v16);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);
    objc_msgSend(v8, "setSiriAceViewId:", v19);

  }
  objc_msgSend(*(id *)(a1 + 40), "speakableContextInfo", WeakRetained);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContextInfo:", v20);

  objc_msgSend(v8, "setPrivacySensitive:", objc_msgSend(*(id *)(a1 + 40), "canUseServerTTS") ^ 1);
  v21 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v8, "setAudioSessionId:", objc_msgSend(v21, "audioSessionID"));

  v22 = MEMORY[0x24BDAC760];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_59;
  v52[3] = &unk_24DC1A838;
  objc_copyWeak(&v54, (id *)(a1 + 72));
  v53 = *(id *)(a1 + 40);
  objc_msgSend(v8, "setDidStartSpeaking:", v52);
  v49[0] = v22;
  v49[1] = 3221225472;
  v49[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2;
  v49[3] = &unk_24DC1AEF0;
  objc_copyWeak(&v51, (id *)(a1 + 72));
  v50 = *(id *)(a1 + 40);
  objc_msgSend(v8, "setDidReportInstrument:", v49);
  if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("\x1B\\mrk=play=phat\\")))
    goto LABEL_10;
  v23 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v58) = 0;
  objc_msgSend(v41, "ttsSession");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v22;
  v46[1] = 3221225472;
  v46[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_3;
  v46[3] = &unk_24DC1AC88;
  v48 = buf;
  v25 = v23;
  v47 = v25;
  objc_msgSend(v24, "queryPhaticCapabilityWithVoice:reply:", v7, v46);

  v26 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v25, v26);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {

    _Block_object_dispose(buf, 8);
LABEL_10:
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("\x1B\\mrk=play=phat\\")))
    {
      v27 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
        _os_log_impl(&dword_219F26000, v27, OS_LOG_TYPE_DEFAULT, "%s #phatic [Pre] Success", buf, 0xCu);
      }
    }
    v28 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_219F26000, v28, OS_LOG_TYPE_DEFAULT, "%s #tts 24 [Pre] Calling speakWithSpeechRequest:%@", buf, 0x16u);
    }
    objc_msgSend(v41, "ttsSession");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v22;
    v43[1] = 3221225472;
    v43[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_62;
    v43[3] = &unk_24DC1AEA0;
    objc_copyWeak(&v45, (id *)(a1 + 72));
    v44 = *(id *)(a1 + 40);
    objc_msgSend(v29, "speakWithSpeechRequest:didFinish:", v8, v43);

    v30 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke_2";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      v58 = v31;
      _os_log_impl(&dword_219F26000, v30, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Started synthesis, %@, %@", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "setTtsSessionRequest:", v8);
    kdebug_trace();
    v32 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v32, "_activeTasks");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 48), "clientStateManagerDelegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "notifyClientStateManagerSpeakingBegan:", *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 48), "clientStateManagerDelegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "notifyClientStateManagerTransactionEnded:", *(_QWORD *)(a1 + 48));

    v36 = *(_QWORD *)(a1 + 64);
    if (v36)
      (*(void (**)(void))(v36 + 16))();

    objc_destroyWeak(&v45);
    goto LABEL_20;
  }
  v37 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:", 401);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v37 + 16))(v37, v38);

  v39 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v55 = 136315138;
    v56 = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke_4";
    _os_log_impl(&dword_219F26000, v39, OS_LOG_TYPE_DEFAULT, "%s #phatic [Post] Fail! Phatic Not Supported", v55, 0xCu);
  }

  _Block_object_dispose(buf, 8);
LABEL_20:

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v54);

}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_59(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didStartSpeakTask:", *(_QWORD *)(a1 + 32));

}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "speakTask:didGenerateMetrics:", *(_QWORD *)(a1 + 32), v4);

}

intptr_t __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_3(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_62(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "didFinishSpeakTask:withError:", *(_QWORD *)(a1 + 32), v4);

}

uint64_t __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
    _os_log_impl(&dword_219F26000, v2, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] No text, marking finished", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "setSynthesisResult:", 1);
  objc_msgSend(*(id *)(a1 + 32), "executeCompletion");
  objc_msgSend(*(id *)(a1 + 40), "clientStateManagerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyClientStateManagerTransactionEnded:", *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_66(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;

  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_66_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "setSynthesisResult:", 2);
  objc_msgSend(*(id *)(a1 + 32), "executeCompletion");
  objc_msgSend(*(id *)(a1 + 40), "clientStateManagerDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyClientStateManagerTransactionEnded:", *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;
  id v11;
  NSObject **v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 72));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2_69;
    block[3] = &unk_24DC1AF68;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 56);
    v12 = v5;
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v13 = v7;
    v14 = v8;
    v16 = *(id *)(a1 + 64);
    dispatch_async(v6, block);

  }
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2_69(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 40);
      v4 = v2;
      objc_msgSend(v3, "language");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "gender");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);
      v18 = 136315906;
      v19 = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke_2";
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_219F26000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Found voice for %@ %@: %@", (uint8_t *)&v18, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKey:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 16), "objectForKey:", *(_QWORD *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(a1 + 40);
        v14 = v12;
        objc_msgSend(v13, "language");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "gender");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 136315906;
        v19 = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
        v20 = 2112;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        v24 = 2112;
        v25 = v11;
        _os_log_impl(&dword_219F26000, v14, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] No voice for %@ %@. Using %@", (uint8_t *)&v18, 0x2Au);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

    }
    else
    {
      v17 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2_69_cold_1(a1, v17);
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
  }
}

- (void)_processTaskQueue
{
  NSObject *processingTasksQueue;
  _QWORD block[5];

  processingTasksQueue = self->_processingTasksQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke;
  block[3] = &unk_24DC1AFB8;
  block[4] = self;
  dispatch_async(processingTasksQueue, block);
}

void __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *i;
  uint64_t v11;
  int v12;
  os_log_t v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  id v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  os_log_t v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  uint8_t v41[4];
  uint64_t v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "_activeTasks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend(*(id *)(a1 + 32), "_taskQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v44 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
    v45 = 2048;
    v46 = v7;
    v47 = 2048;
    v48 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #tts activeTasks=%tu taskQueue=%tu", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_taskQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_activeTasks");
  for (i = (void *)objc_claimAutoreleasedReturnValue();
        !objc_msgSend(i, "count");
        i = (void *)objc_claimAutoreleasedReturnValue())
  {
    v11 = objc_msgSend(v9, "count");

    if (!v11)
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 32), "_processProvisionalTasks");
    objc_msgSend(v9, "frontObject");
    i = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(i, "canUseServerTTS");
    v13 = *v2;
    v14 = os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (!v14)
        goto LABEL_13;
      v15 = v13;
      objc_msgSend(i, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v44 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
      v45 = 2112;
      v46 = (uint64_t)v16;
      v47 = 2112;
      v48 = (uint64_t)v17;
      v18 = v15;
      v19 = "%s #tts [Pre] Processing task text=\"%@\" identifier=%@";
    }
    else
    {
      if (!v14)
        goto LABEL_13;
      v15 = v13;
      objc_msgSend(i, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315651;
      v44 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
      v45 = 2117;
      v46 = (uint64_t)v16;
      v47 = 2112;
      v48 = (uint64_t)v17;
      v18 = v15;
      v19 = "%s #tts [Pre] Processing task text=\"%{sensitive}@\" identifier=%@";
    }
    _os_log_impl(&dword_219F26000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x20u);

LABEL_13:
    if ((objc_msgSend(i, "isEligibleForSynthesis") & 1) == 0)
    {
      v38 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
        v45 = 2112;
        v46 = (uint64_t)i;
        _os_log_impl(&dword_219F26000, v38, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] task not eligible: %@", buf, 0x16u);
      }
      break;
    }
    v20 = (id)objc_msgSend(v9, "dequeueObject");
    objc_msgSend(i, "audioData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(i, "text");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        v34 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
          __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_cold_1(v41, &v42, v34);
        objc_msgSend(i, "executeCompletion");
        goto LABEL_18;
      }
      v27 = objc_msgSend(i, "canUseServerTTS");
      v28 = *v2;
      v29 = os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT);
      if (v27)
      {
        if (v29)
        {
          v30 = v28;
          objc_msgSend(i, "text");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v44 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke_2";
          v45 = 2112;
          v46 = (uint64_t)v31;
          v32 = v30;
          v33 = "%s #tts [Pre] text:%@";
          goto LABEL_29;
        }
      }
      else if (v29)
      {
        v30 = v28;
        objc_msgSend(i, "text");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315395;
        v44 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
        v45 = 2117;
        v46 = (uint64_t)v31;
        v32 = v30;
        v33 = "%s #tts [Pre] text:%{sensitive}@";
LABEL_29:
        _os_log_impl(&dword_219F26000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0x16u);

      }
      dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
      v35 = *(void **)(a1 + 32);
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_72;
      v39[3] = &unk_24DC1AFB8;
      v39[4] = v35;
      objc_msgSend(v35, "_handleText:completion:", i, v39);
      v36 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke_2";
        _os_log_impl(&dword_219F26000, v36, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Pending Tasks Group Wait", buf, 0xCu);
      }
      dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40), 0xFFFFFFFFFFFFFFFFLL);
      v37 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
        _os_log_impl(&dword_219F26000, v37, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Pending Tasks Group Complete", buf, 0xCu);
      }
      goto LABEL_18;
    }
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
    v22 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      objc_msgSend(i, "audioData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v44 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
      v45 = 2112;
      v46 = (uint64_t)v24;
      _os_log_impl(&dword_219F26000, v23, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Audio Data:%@", buf, 0x16u);

    }
    v25 = *(void **)(a1 + 32);
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_70;
    v40[3] = &unk_24DC1AFB8;
    v40[4] = v25;
    objc_msgSend(v25, "_handleAudioData:completion:", i, v40);
    dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40), 0xFFFFFFFFFFFFFFFFLL);
LABEL_18:

    objc_msgSend(*(id *)(a1 + 32), "_activeTasks");
  }

LABEL_5:
}

void __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_70(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
}

void __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_72(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
}

- (id)_activeTaskWithTTSRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[SRUIFSpeechSynthesizer _activeTasks](self, "_activeTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__SRUIFSpeechSynthesizer__activeTaskWithTTSRequest___block_invoke;
  v9[3] = &unk_24DC1AFE0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__SRUIFSpeechSynthesizer__activeTaskWithTTSRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "ttsSessionRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_findVoiceForLanguage:(id)a3 gender:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[NSMutableDictionary objectForKey:](self->_availableVoicesForLanguage, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSMutableDictionary objectForKey:](self->_availableVoicesForLanguage, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFSpeechSynthesizer _filterVoices:gender:](self, "_filterVoices:gender:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v10[2](v10, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE093A0], "allVoicesForSiriSessionLanguage:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __66__SRUIFSpeechSynthesizer__findVoiceForLanguage_gender_completion___block_invoke;
    v25 = &unk_24DC1B008;
    v15 = v8;
    v26 = v15;
    v16 = v14;
    v27 = v16;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v22);
    if (objc_msgSend(v16, "count", v22, v23, v24, v25))
    {
      v17 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)MEMORY[0x24BDD16E0];
        v19 = v17;
        objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v29 = "-[SRUIFSpeechSynthesizer _findVoiceForLanguage:gender:completion:]";
        v30 = 2112;
        v31 = v15;
        v32 = 2112;
        v33 = v20;
        _os_log_impl(&dword_219F26000, v19, OS_LOG_TYPE_DEFAULT, "%s #tts %@ has %@ available Voices", buf, 0x20u);

      }
      -[NSMutableDictionary setObject:forKey:](self->_availableVoicesForLanguage, "setObject:forKey:", v16, v15);
      -[SRUIFSpeechSynthesizer _filterVoices:gender:](self, "_filterVoices:gender:", v16, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v10[2](v10, v21);

    }
    else if (v10)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        -[SRUIFSpeechSynthesizer _findVoiceForLanguage:gender:completion:].cold.1();
      v10[2](v10, 0);
    }

  }
}

void __66__SRUIFSpeechSynthesizer__findVoiceForLanguage_gender_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (int64_t)_genderForString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("female")))
    {
      if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("male")))
      {
        if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("neutral")))
          v5 = 0;
        else
          v5 = 3;
      }
      else
      {
        v5 = 1;
      }
    }
    else
    {
      v5 = 2;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_filterVoices:(id)a3 gender:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = -[SRUIFSpeechSynthesizer _genderForString:](self, "_genderForString:", v7);
  v20 = 0;
  v21 = (id *)&v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__SRUIFSpeechSynthesizer__filterVoices_gender___block_invoke;
  v13[3] = &unk_24DC1B030;
  v13[5] = &v14;
  v13[6] = v8;
  v13[4] = &v20;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
  v9 = v21[5];
  if (!v9)
  {
    v10 = (void *)v15[5];
    if (v10)
    {
      objc_storeStrong(v21 + 5, v10);
      v9 = v21[5];
    }
    else
    {
      v9 = 0;
    }
  }
  v11 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __47__SRUIFSpeechSynthesizer__filterVoices_gender___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  BOOL v8;
  id v9;

  v7 = a2;
  v9 = v7;
  if (!a1[6] || (v8 = objc_msgSend(v7, "gender") == a1[6], v7 = v9, v8))
  {
    if (objc_msgSend(v7, "isCustom"))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
      *a4 = 1;
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    }
    v7 = v9;
  }

}

- (void)_processProvisionalTasks
{
  void *v2;
  void *v3;
  __int128 v4;
  os_log_t *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SRUIFSpeechSynthesizer _taskQueue](self, "_taskQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frontObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isProvisional"))
  {
    v5 = (os_log_t *)MEMORY[0x24BE08FB0];
    *(_QWORD *)&v4 = 136315394;
    v10 = v4;
    do
    {
      if ((unint64_t)objc_msgSend(v2, "count", v10) <= 1)
        break;
      objc_msgSend(v2, "objectAtIndex:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEligibleForProcessing");

      if (!v7)
        goto LABEL_11;
      objc_msgSend(v2, "dequeueObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v10;
        v12 = "-[SRUIFSpeechSynthesizer _processProvisionalTasks]";
        v13 = 2112;
        v14 = v8;
        _os_log_impl(&dword_219F26000, v9, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Discarding %@; it is provisional and there are other tasks enqueued",
          buf,
          0x16u);
      }
      if (!objc_msgSend(v8, "synthesisResult"))
        objc_msgSend(v8, "setSynthesisResult:", 2);
      objc_msgSend(v8, "executeCompletion");

      objc_msgSend(v2, "frontObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while ((objc_msgSend(v3, "isProvisional") & 1) != 0);
  }

LABEL_11:
}

- (int64_t)_speechFootPrintForVoice:(id)a3
{
  int64_t result;

  result = objc_msgSend(a3, "footprint");
  if (result != 2)
    return result == 1;
  return result;
}

- (SRUIFSpeechSynthesizerDelegate)delegate
{
  return (SRUIFSpeechSynthesizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SRUIFSpeechSynthesizerClientStateManagerDelegate)clientStateManagerDelegate
{
  return (SRUIFSpeechSynthesizerClientStateManagerDelegate *)objc_loadWeakRetained((id *)&self->_clientStateManagerDelegate);
}

- (void)setClientStateManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_clientStateManagerDelegate, a3);
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (AFQueue)_taskQueue
{
  return self->_taskQueue;
}

- (NSMutableArray)_activeTasks
{
  return self->_activeTasks;
}

- (NSMutableDictionary)_delayedTasks
{
  return self->_delayedTasks;
}

- (void)setTtsSession:(id)a3
{
  objc_storeStrong((id *)&self->_ttsSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsSession, 0);
  objc_storeStrong((id *)&self->_delayedTasks, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_destroyWeak((id *)&self->_clientStateManagerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingTasksGroup, 0);
  objc_storeStrong((id *)&self->_pendingTasksQueue, 0);
  objc_storeStrong((id *)&self->_processingTasksQueue, 0);
  objc_storeStrong((id *)&self->_availableVoicesForLanguage, 0);
  objc_storeStrong((id *)&self->_outputVoice, 0);
}

void __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_cold_1()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315650;
  v2 = "-[SRUIFSpeechSynthesizer didFinishAudioTask:withError:]_block_invoke";
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2(&dword_219F26000, v0, (uint64_t)v0, "%s #tts Unable to finish speaking presynthesized request\"%@\": %{public}@", (uint8_t *)&v1);
  OUTLINED_FUNCTION_6();
}

void __55__SRUIFSpeechSynthesizer_didFinishAudioTask_withError___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F26000, a1, a3, "%s #tts Expected an active task that corresponds to an active speech request, but got nothing!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2(&dword_219F26000, v3, v5, "%s #tts [Post] Unable to finish speaking \"%@\": %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_3_0();
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315651;
  v7 = "-[SRUIFSpeechSynthesizer didFinishSpeakTask:withError:]_block_invoke";
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2(&dword_219F26000, v3, v5, "%s #tts [Post] Unable to finish speaking \"%{sensitive}@\": %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_3_0();
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F26000, a1, a3, "%s #tts [Post] Expected an active task that corresponds to an active speech request, but got nothing!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__SRUIFSpeechSynthesizer_didFinishSpeakTask_withError___block_invoke_28_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F26000, a1, a3, "%s #tts strongSelf==nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)speakTask:(void *)a1 didGenerateMetrics:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "ttsSessionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_219F26000, v3, v5, "%s #tts [Post] Event metrics was missing for the request\"%@\", (uint8_t *)v6);

  OUTLINED_FUNCTION_6();
}

- (void)_enqueueText:audioData:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:shouldCache:completion:analyticsContext:speakableContextInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_219F26000, v0, v1, "%s #tts [Pre] Task is delayed but no identifier provided. This will likely result in out-of-order TTS: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)processDelayedItem:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F26000, a1, a3, "%s #tts [Pre] nil is an invalid delayed item identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleText:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F26000, a1, a3, "%s #tts Not speaking nil text", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 136315650;
  v5 = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
  v6 = 2112;
  v7 = a1;
  v8 = 2112;
  v9 = v3;
  OUTLINED_FUNCTION_1_2(&dword_219F26000, a3, (uint64_t)a3, "%s #tts [Post] Synthesis failed for with %@ for %@ ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_66_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F26000, a1, a3, "%s #tts [Post] Failed onNoOutputVoice", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __49__SRUIFSpeechSynthesizer__handleText_completion___block_invoke_2_69_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "gender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315650;
  v9 = "-[SRUIFSpeechSynthesizer _handleText:completion:]_block_invoke";
  v10 = 2112;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  OUTLINED_FUNCTION_1_2(&dword_219F26000, v4, v7, "%s #tts [Pre] Could not find voice for %@ %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_3_0();
}

void __43__SRUIFSpeechSynthesizer__processTaskQueue__block_invoke_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SRUIFSpeechSynthesizer _processTaskQueue]_block_invoke";
  _os_log_error_impl(&dword_219F26000, log, OS_LOG_TYPE_ERROR, "%s #tts [Pre] Invalid speak request. No text and no audio data", buf, 0xCu);
}

- (void)_findVoiceForLanguage:gender:completion:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_3();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_1_2(&dword_219F26000, v2, (uint64_t)v2, "%s #tts No voice found for language: %@ gender: %@", (uint8_t *)v3);
  OUTLINED_FUNCTION_6();
}

@end

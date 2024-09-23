@implementation CSVTUIAudioRecorder

- (CSVTUIAudioRecorder)initWithQueue:(id)a3 error:(id *)a4
{
  id v6;
  CSVTUIAudioRecorder *v7;
  CSVTUIAudioRecorder *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *voiceControllerCreationQueue;
  uint64_t v17;
  id v18;
  AVVoiceController *voiceController;
  BOOL v20;
  void *v21;
  CSVTUIAudioRecorder *v22;
  uint64_t v23;
  NSHashTable *observers;
  NSObject *v25;
  NSObject *v27;
  CSVTUIAudioRecorder *v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  CSVTUIAudioRecorder *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CSVTUIAudioRecorder;
  v7 = -[CSVTUIAudioRecorder init](&v30, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      -[CSVTUIAudioRecorder setQueue:](v7, "setQueue:", v6);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = (const char *)objc_msgSend(v9, "UTF8String");
      dispatch_get_global_queue(33, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_queue_create_with_target_V2(v10, 0, v11);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v12;

    }
    dispatch_get_global_queue(9, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create_with_target_V2("VoiceControllerCreationQueue", 0, v14);
    voiceControllerCreationQueue = v8->_voiceControllerCreationQueue;
    v8->_voiceControllerCreationQueue = (OS_dispatch_queue *)v15;

    v29 = 0;
    -[CSVTUIAudioRecorder _voiceControllerWithError:](v8, "_voiceControllerWithError:", &v29);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v29;
    voiceController = v8->_voiceController;
    v8->_voiceController = (AVVoiceController *)v17;

    if (v8->_voiceController)
      v20 = v18 == 0;
    else
      v20 = 0;
    if (!v20)
    {
      v21 = (void *)*MEMORY[0x24BE28368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
      {
        v27 = v21;
        objc_msgSend(v18, "localizedDescription");
        v28 = (CSVTUIAudioRecorder *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v32 = "-[CSVTUIAudioRecorder initWithQueue:error:]";
        v33 = 2114;
        v34 = v28;
        _os_log_error_impl(&dword_2117D4000, v27, OS_LOG_TYPE_ERROR, "%s Failed to create AVVC : %{public}@", buf, 0x16u);

        if (a4)
          goto LABEL_11;
      }
      else if (a4)
      {
LABEL_11:
        v18 = objc_retainAutorelease(v18);
        v22 = 0;
        *a4 = v18;
        goto LABEL_17;
      }
      v22 = 0;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v23 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v23;

    v8->_waitingForDidStart = 0;
    v25 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[CSVTUIAudioRecorder initWithQueue:error:]";
      v33 = 2050;
      v34 = v8;
      _os_log_impl(&dword_2117D4000, v25, OS_LOG_TYPE_DEFAULT, "%s Create new CSAudioRecorder = %{public}p", buf, 0x16u);
    }
  }
  if (a4)
    *a4 = 0;
  v22 = v8;
  v18 = 0;
LABEL_17:

  return v22;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__CSVTUIAudioRecorder_registerObserver___block_invoke;
  v7[3] = &unk_24CC85EE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__CSVTUIAudioRecorder_unregisterObserver___block_invoke;
  v7[3] = &unk_24CC85EE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)dealloc
{
  AudioBufferList *pNonInterleavedABL;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  CSVTUIAudioRecorder *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[CSVTUIAudioRecorder _destroyVoiceController](self, "_destroyVoiceController");
  pNonInterleavedABL = self->_pNonInterleavedABL;
  if (pNonInterleavedABL)
    free(pNonInterleavedABL);
  v4 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSVTUIAudioRecorder dealloc]";
    v8 = 2050;
    v9 = self;
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioRecorder %{public}p deallocated", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSVTUIAudioRecorder;
  -[CSVTUIAudioRecorder dealloc](&v5, sel_dealloc);
}

- (void)_destroyVoiceController
{
  AVVoiceController *voiceController;
  os_log_t *v4;
  NSObject *v5;
  id v6;
  os_log_t v7;
  void *v8;
  AVVoiceController *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  voiceController = self->_voiceController;
  if (voiceController)
  {
    v4 = (os_log_t *)MEMORY[0x24BE28368];
    v5 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CSVTUIAudioRecorder _destroyVoiceController]";
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
      voiceController = self->_voiceController;
    }
    v12 = 0;
    -[AVVoiceController teardownWithError:](voiceController, "teardownWithError:", &v12);
    v6 = v12;
    if (v6)
    {
      v7 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        v10 = v7;
        objc_msgSend(v6, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v14 = "-[CSVTUIAudioRecorder _destroyVoiceController]";
        v15 = 2114;
        v16 = v11;
        _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s Failed to teardown AVVC : %{public}@", buf, 0x16u);

      }
    }
    v8 = (void *)MEMORY[0x212BE17E4]();
    v9 = self->_voiceController;
    self->_voiceController = 0;

    objc_autoreleasePoolPop(v8);
  }
}

- (id)_voiceControllerWithError:(id *)a3
{
  AVVoiceController *voiceController;
  int v6;
  uint64_t v7;
  NSObject *voiceControllerCreationQueue;
  NSObject *queue;
  NSObject *v10;
  AVVoiceController *v11;
  AVVoiceController *v12;
  _QWORD v14[7];
  _QWORD block[6];
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  AVVoiceController *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__6408;
  v16[4] = __Block_byref_object_dispose__6409;
  v17 = 0;
  voiceController = self->_voiceController;
  if (!voiceController)
  {
    kdebug_trace();
    v6 = CSIsHorseman();
    v7 = MEMORY[0x24BDAC760];
    if (v6)
    {
      voiceControllerCreationQueue = self->_voiceControllerCreationQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __49__CSVTUIAudioRecorder__voiceControllerWithError___block_invoke;
      block[3] = &unk_24CC864E8;
      block[4] = self;
      block[5] = v16;
      dispatch_sync(voiceControllerCreationQueue, block);
    }
    queue = self->_queue;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __49__CSVTUIAudioRecorder__voiceControllerWithError___block_invoke_2;
    v14[3] = &unk_24CC85F10;
    v14[4] = self;
    v14[5] = v16;
    v14[6] = a3;
    dispatch_async_and_wait(queue, v14);
    v10 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_voiceController;
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSVTUIAudioRecorder _voiceControllerWithError:]";
      v20 = 2050;
      v21 = v11;
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Successfully create AVVC : %{public}p", buf, 0x16u);
    }
    voiceController = self->_voiceController;
  }
  v12 = voiceController;
  _Block_object_dispose(v16, 8);

  return v12;
}

- (unint64_t)setContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id *v9;
  NSObject *v10;
  void *v11;
  NSObject *queue;
  id v13;
  NSObject *v14;
  NSDictionary *v15;
  NSDictionary *latestContext;
  void *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_QWORD *);
  void *v26;
  CSVTUIAudioRecorder *v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__6408;
  v39 = __Block_byref_object_dispose__6409;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avvcContextSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id *)MEMORY[0x24BE28368];
  v10 = (id)*MEMORY[0x24BE28368];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v42 = "-[CSVTUIAudioRecorder setContext:error:]";
    v43 = 2112;
    v44 = v11;
    _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setContext : %@", buf, 0x16u);

  }
  queue = self->_queue;
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __40__CSVTUIAudioRecorder_setContext_error___block_invoke;
  v26 = &unk_24CC85F38;
  v29 = &v31;
  v27 = self;
  v13 = v8;
  v28 = v13;
  v30 = &v35;
  dispatch_async_and_wait(queue, &v23);
  if (!v32[3])
  {
    v14 = *v9;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v36[5], "localizedDescription", v23, v24, v25, v26, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v42 = "-[CSVTUIAudioRecorder setContext:error:]";
      v43 = 2114;
      v44 = v22;
      _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get handle id : %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(v6, "avvcContext", v23, v24, v25, v26, v27);
  v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  latestContext = self->_latestContext;
  self->_latestContext = v15;

  if (a4)
    *a4 = objc_retainAutorelease((id)v36[5]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *v9;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v17, "timeIntervalSinceDate:", v7);
    *(_DWORD *)buf = 136315394;
    v42 = "-[CSVTUIAudioRecorder setContext:error:]";
    v43 = 2050;
    v44 = v19;
    _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s setContext elapsed time = %{public}lf", buf, 0x16u);
  }

  v20 = v32[3];
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

- (void)updateAudioRecorderForTrainingDevice:(unint64_t)a3 deviceUUIDs:(id)a4
{
  CSVTUIAudioRecorderRemoteDeviceContext *remoteDeviceContext;

  remoteDeviceContext = self->_remoteDeviceContext;
  self->_remoteDeviceContext = 0;

}

- (BOOL)prepareAudioStreamRecordWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  id v11;
  void *v12;
  AVVoiceController *voiceController;
  char v14;
  id v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSVTUIAudioRecorder _getRecordSettingsWithRequest](self, "_getRecordSettingsWithRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  v9 = (os_log_t *)MEMORY[0x24BE28368];
  v10 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[CSVTUIAudioRecorder prepareAudioStreamRecordWithStreamHandleId:error:]";
    v27 = 2050;
    v28 = a3;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC prepareRecordForStream(%{public}llu) : %{public}@", buf, 0x20u);
  }
  v11 = objc_alloc(MEMORY[0x24BDB18F8]);
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingBufferDuration");
  v12 = (void *)objc_msgSend(v11, "initWithStreamID:settings:bufferDuration:", a3, v8);
  objc_msgSend(v12, "setMeteringEnabled:", 1);
  voiceController = self->_voiceController;
  v24 = 0;
  v14 = -[AVVoiceController prepareRecordForStream:error:](voiceController, "prepareRecordForStream:error:", v12, &v24);
  v15 = v24;
  if ((v14 & 1) != 0 || (v16 = *v9, !os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)))
  {
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v22 = v16;
  objc_msgSend(v15, "localizedDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136315394;
  v26 = "-[CSVTUIAudioRecorder prepareAudioStreamRecordWithStreamHandleId:error:]";
  v27 = 2114;
  v28 = (unint64_t)v23;
  _os_log_error_impl(&dword_2117D4000, v22, OS_LOG_TYPE_ERROR, "%s AVVC prepareRecordForStream failed : %{public}@", buf, 0x16u);

  if (a4)
LABEL_6:
    *a4 = objc_retainAutorelease(v15);
LABEL_7:
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    objc_msgSend(v17, "timeIntervalSinceDate:", v7);
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSVTUIAudioRecorder prepareAudioStreamRecordWithStreamHandleId:error:]";
    v27 = 2050;
    v28 = v20;
    _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, "%s prepareRecordForStream elapsed time = %{public}lf", buf, 0x16u);

  }
  return v14;
}

- (BOOL)startAudioStreamWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  AVVoiceController *voiceController;
  char v14;
  id v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  mach_absolute_time();
  kdebug_trace();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1900]), "initWithStreamID:atStartHostTime:", a3, 0);
  objc_msgSend(v8, "setSkipAlert:", 1);
  objc_msgSend(v8, "setStartAlert:", 0);
  objc_msgSend(v8, "setStopAlert:", 0);
  objc_msgSend(v8, "setStopOnErrorAlert:", 0);
  v9 = (os_log_t *)MEMORY[0x24BE28368];
  v10 = (void *)*MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v8, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSVTUIAudioRecorder startAudioStreamWithStreamHandleId:error:]";
    v27 = 2114;
    v28 = v12;
    _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC startRecordForStream : %{public}@", buf, 0x16u);

  }
  voiceController = self->_voiceController;
  v24 = 0;
  v14 = -[AVVoiceController startRecordForStream:error:](voiceController, "startRecordForStream:error:", v8, &v24);
  v15 = v24;
  if ((v14 & 1) != 0)
  {
    self->_waitingForDidStart = 1;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v16 = *v9;
  if (!os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v22 = v16;
  objc_msgSend(v15, "localizedDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136315394;
  v26 = "-[CSVTUIAudioRecorder startAudioStreamWithStreamHandleId:error:]";
  v27 = 2114;
  v28 = v23;
  _os_log_error_impl(&dword_2117D4000, v22, OS_LOG_TYPE_ERROR, "%s startRecordForStream failed : %{public}@", buf, 0x16u);

  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(v15);
LABEL_9:
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    objc_msgSend(v17, "timeIntervalSinceDate:", v7);
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSVTUIAudioRecorder startAudioStreamWithStreamHandleId:error:]";
    v27 = 2050;
    v28 = v20;
    _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, "%s startRecordForStream elapsed time = %{public}lf", buf, 0x16u);

  }
  return v14;
}

- (BOOL)stopAudioStreamWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  os_log_t *v8;
  NSObject *v9;
  AVVoiceController *voiceController;
  char v11;
  id v12;
  os_log_t v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (os_log_t *)MEMORY[0x24BE28368];
  v9 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[CSVTUIAudioRecorder stopAudioStreamWithStreamHandleId:error:]";
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC stopRecordForStream", buf, 0xCu);
  }
  voiceController = self->_voiceController;
  v21 = 0;
  v11 = -[AVVoiceController stopRecordForStream:error:](voiceController, "stopRecordForStream:error:", a3, &v21);
  v12 = v21;
  if ((v11 & 1) != 0 || (v13 = *v8, !os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)))
  {
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v19 = v13;
  objc_msgSend(v12, "localizedDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136315394;
  v23 = "-[CSVTUIAudioRecorder stopAudioStreamWithStreamHandleId:error:]";
  v24 = 2114;
  v25 = v20;
  _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s Failed to stopRecordForStream : %{public}@", buf, 0x16u);

  if (a4)
LABEL_6:
    *a4 = objc_retainAutorelease(v12);
LABEL_7:
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v14, "timeIntervalSinceDate:", v7);
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSVTUIAudioRecorder stopAudioStreamWithStreamHandleId:error:]";
    v24 = 2050;
    v25 = v17;
    _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s stopRecordForStream elapsed time = %{public}lf", buf, 0x16u);

  }
  self->_waitingForDidStart = 0;

  return v11;
}

- (BOOL)isRecordingWithStreamHandleId:(unint64_t)a3
{
  if (objc_msgSend(MEMORY[0x24BE28488], "hasRemoteBuiltInMic"))
    return -[CSVTUIRemoteRecordClient isRecording](self->_remoteRecordClient, "isRecording");
  else
    return -[AVVoiceController getCurrentStreamState:](self->_voiceController, "getCurrentStreamState:", a3) > 3;
}

- (id)recordRouteWithStreamHandleId:(unint64_t)a3
{
  __CFString *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x24BE28488], "hasRemoteBuiltInMic") & 1) != 0)
  {
    v5 = CFSTR("Builtin Microphone");
  }
  else
  {
    -[AVVoiceController getRecordDeviceInfoForStream:](self->_voiceController, "getRecordDeviceInfoForStream:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordRoute");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  os_log_t *v10;
  NSObject *v11;
  AVVoiceController *voiceController;
  char v13;
  void *v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (os_log_t *)MEMORY[0x24BE28368];
  v11 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[CSVTUIAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActivate for activation", buf, 0xCu);
  }
  voiceController = self->_voiceController;
  if (a3 == 2)
  {
    v27 = 0;
    v13 = -[AVVoiceController activateAudioSessionForStream:isPrewarm:recordMode:error:](voiceController, "activateAudioSessionForStream:isPrewarm:recordMode:error:", a4, 0, 1, &v27);
    v14 = v27;
  }
  else
  {
    v26 = 0;
    v13 = -[AVVoiceController activateAudioSessionForStream:isPrewarm:recordMode:error:](voiceController, "activateAudioSessionForStream:isPrewarm:recordMode:error:", a4, 0, 0, &v26);
    v14 = v26;
  }
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    v16 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[CSVTUIAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s AVVC successfully activated audioSession", buf, 0xCu);
    }
    v17 = 1;
    if (!a5)
      goto LABEL_15;
LABEL_14:
    *a5 = objc_retainAutorelease(v15);
    goto LABEL_15;
  }
  v18 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
  {
    v24 = v18;
    objc_msgSend(v15, "localizedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v29 = "-[CSVTUIAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    v30 = 2114;
    v31 = v25;
    _os_log_error_impl(&dword_2117D4000, v24, OS_LOG_TYPE_ERROR, "%s AVVC setSessionActivate has failed : %{public}@", buf, 0x16u);

  }
  v17 = 0;
  if (a5)
    goto LABEL_14;
LABEL_15:
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    objc_msgSend(v19, "timeIntervalSinceDate:", v9);
    *(_DWORD *)buf = 136315394;
    v29 = "-[CSVTUIAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    v30 = 2050;
    v31 = v22;
    _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s setSessionActivate elapsed time = %{public}lf", buf, 0x16u);

  }
  return v17;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  os_log_t v10;
  NSObject *v11;
  unint64_t v12;
  int v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (os_log_t *)MEMORY[0x24BE28368];
  v8 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[CSVTUIAudioRecorder deactivateAudioSession:error:]";
    v16 = 2050;
    v17 = a3;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActivate for deactivation : %{public}tu", (uint8_t *)&v14, 0x16u);
  }
  -[AVVoiceController deactivateAudioSessionWithOptions:](self->_voiceController, "deactivateAudioSessionWithOptions:", +[CSVTUIAudioRecorder _convertDeactivateOption:](CSVTUIAudioRecorder, "_convertDeactivateOption:", a3));
  self->_waitingForDidStart = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v9, "timeIntervalSinceDate:", v6);
    v14 = 136315394;
    v15 = "-[CSVTUIAudioRecorder deactivateAudioSession:error:]";
    v16 = 2050;
    v17 = v12;
    _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s setSessionActivate elapsed time = %{public}lf", (uint8_t *)&v14, 0x16u);

  }
  return 1;
}

- (id)getPlaybackRouteForStreamID:(unint64_t)a3
{
  return (id)-[AVVoiceController getPlaybackRouteForStream:withError:](self->_voiceController, "getPlaybackRouteForStream:withError:", a3, 0);
}

- (BOOL)_shouldUseRemoteBuiltInMic:(id)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("useRemoteBuiltInMic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)_processAudioChain:(id)a3 audioStreamHandleId:(unint64_t)a4 remoteVAD:(id)a5 atTime:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7 numberOfChannels:(int)a8
{
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;

  v14 = a3;
  v15 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __128__CSVTUIAudioRecorder__processAudioChain_audioStreamHandleId_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke;
  block[3] = &unk_24CC85F60;
  block[4] = self;
  v20 = v14;
  v21 = v15;
  v22 = a4;
  v23 = a6;
  v24 = a7;
  v25 = a8;
  v17 = v15;
  v18 = v14;
  dispatch_async(queue, block);

}

- (void)_processAudioBuffer:(id)a3 audioStreamHandleId:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x212BE17E4]();
  if (!CSIsTV() || CSIsTorpedo())
  {
    v10 = *(_DWORD *)(objc_msgSend(v8, "streamDescription") + 8);
    if (v10 == 1819304813)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", objc_msgSend(v8, "data"), (int)objc_msgSend(v8, "bytesDataSize"));
      -[CSVTUIAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:](self, "_compensateChannelDataIfNeeded:receivedNumChannels:", v11, *(unsigned int *)(objc_msgSend(v8, "streamDescription") + 28));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v8, "timeStamp");
      -[CSVTUIAudioRecorder _processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:](self, "_processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", v12, a4, 0, v13, a5, objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingNumberOfChannels"));

    }
    else
    {
      v14 = *MEMORY[0x24BE28368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
      {
        v15 = 136315394;
        v16 = "-[CSVTUIAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:]";
        v17 = 1026;
        v18 = v10;
        _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s Cannot handle audio buffer : unexpected format(%{public}u)", (uint8_t *)&v15, 0x12u);
      }
    }
  }
  objc_autoreleasePoolPop(v9);

}

- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4
{
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingNumberOfChannels") <= a4)
  {
    v8 = v5;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDBCEC8]);
    v7 = objc_msgSend(v5, "length") / (unint64_t)a4;
    v8 = (id)objc_msgSend(v6, "initWithLength:", v7 * objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingNumberOfChannels"));
    v9 = objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingNumberOfChannels");
    v10 = _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat, 1) <= 0x888888888888888uLL)
    {
      v11 = v9;
      v12 = *MEMORY[0x24BE28368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315650;
        v15 = "-[CSVTUIAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:]";
        v16 = 1026;
        v17 = v11 - a4;
        v18 = 2050;
        v19 = v10;
        _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Compensating %{public}u channel(s), heartbeat = %{public}lld", (uint8_t *)&v14, 0x1Cu);
        v10 = _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
      }
    }
    _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat = v10 + 1;
    objc_msgSend(v8, "replaceBytesInRange:withBytes:", 0, objc_msgSend(v5, "length"), objc_msgSend(objc_retainAutorelease(v5), "bytes"));
  }

  return v8;
}

- (void)_audioRecorderDidStartRecordingSuccessfully:(BOOL)a3 streamHandleID:(unint64_t)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v6 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_observers;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "audioRecorderDidStartRecord:audioStreamHandleId:successfully:error:", self, a4, v6, v8, (_QWORD)v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  self->_waitingForDidStart = 0;
}

- (void)_audioRecorderDidStopRecordingForReason:(int64_t)a3 streamHandleID:(unint64_t)a4
{
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "audioRecorderDidStopRecord:audioStreamHandleId:reason:", self, a4, a3, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  self->_waitingForDidStart = 0;
}

- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *queue;
  id v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  BOOL v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v7 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = (void *)*MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v11, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v22 = "-[CSVTUIAudioRecorder voiceControllerDidStartRecording:forStream:successfully:error:]";
    v23 = 2050;
    v24 = v10;
    v25 = 2050;
    v26 = a4;
    v27 = 1026;
    v28 = v7;
    v29 = 2114;
    v30 = v14;
    _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Received didStartRecording : %{public}p, forStream:%{public}llu, successfully:%{public}d, error:%{public}@", buf, 0x30u);

  }
  queue = self->_queue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __85__CSVTUIAudioRecorder_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke;
  v17[3] = &unk_24CC85F88;
  v20 = v7;
  v18 = v11;
  v19 = a4;
  v17[4] = self;
  v16 = v11;
  dispatch_async(queue, v17);

}

- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = voiceControllerAudioCallback_forStream_buffer__heartbeat;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * voiceControllerAudioCallback_forStream_buffer__heartbeat, 1) <= 0x888888888888888uLL)
  {
    v11 = (void *)*MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = 136315906;
      v14 = "-[CSVTUIAudioRecorder voiceControllerAudioCallback:forStream:buffer:]";
      v15 = 1026;
      v16 = objc_msgSend(v9, "bytesDataSize");
      v17 = 2050;
      v18 = voiceControllerAudioCallback_forStream_buffer__heartbeat;
      v19 = 2050;
      v20 = a4;
      _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Received audio buffer %{public}d, heartbeat = %{public}llu, streamID (%{public}lu)", (uint8_t *)&v13, 0x26u);

      v10 = voiceControllerAudioCallback_forStream_buffer__heartbeat;
    }
  }
  voiceControllerAudioCallback_forStream_buffer__heartbeat = v10 + 1;
  -[CSVTUIAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:](self, "_processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:", v9, a4, mach_absolute_time());

}

- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5
{
  id v8;
  NSObject *v9;
  NSObject *queue;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v13 = "-[CSVTUIAudioRecorder voiceControllerDidStopRecording:forStream:forReason:]";
    v14 = 2050;
    v15 = v8;
    v16 = 2050;
    v17 = a4;
    v18 = 2050;
    v19 = a5;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Received didStopRecording : %{public}p forStream:%{public}llu forReason:%{public}ld", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__CSVTUIAudioRecorder_voiceControllerDidStopRecording_forStream_forReason___block_invoke;
  block[3] = &unk_24CC85FB0;
  block[4] = self;
  block[5] = a5;
  block[6] = a4;
  dispatch_async(queue, block);

}

- (void)voiceControllerRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int)a4
{
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSVTUIAudioRecorder voiceControllerRecordHardwareConfigurationDidChange:toConfiguration:]";
    v12 = 1026;
    v13 = a4;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s toConfiguration : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__CSVTUIAudioRecorder_voiceControllerRecordHardwareConfigurationDidChange_toConfiguration___block_invoke;
  v8[3] = &unk_24CC85FD8;
  v8[4] = self;
  v9 = a4;
  dispatch_async(queue, v8);
}

- (void)voiceControllerBeginRecordInterruption:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVTUIAudioRecorder voiceControllerBeginRecordInterruption:]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)voiceControllerBeginRecordInterruption:(id)a3 withContext:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSVTUIAudioRecorder voiceControllerBeginRecordInterruption:withContext:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s withContext : %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)voiceControllerEndRecordInterruption:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVTUIAudioRecorder voiceControllerEndRecordInterruption:]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)voiceControllerWillSetAudioSessionActive:(id)a3 willActivate:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSVTUIAudioRecorder voiceControllerWillSetAudioSessionActive:willActivate:]";
    v8 = 1026;
    v9 = v4;
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s activate : %{public}d", (uint8_t *)&v6, 0x12u);
  }
}

- (void)voiceControllerDidSetAudioSessionActive:(id)a3 isActivated:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSVTUIAudioRecorder voiceControllerDidSetAudioSessionActive:isActivated:]";
    v8 = 1026;
    v9 = v4;
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s activate : %{public}d", (uint8_t *)&v6, 0x12u);
  }
}

- (id)_getRecordSettingsWithRequest
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingNumberOfChannels") > 1;
  v14[0] = *MEMORY[0x24BDB1780];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1819304813);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = *MEMORY[0x24BDB17B8];
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = *MEMORY[0x24BDB1788];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleBitDepth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v6;
  v14[3] = *MEMORY[0x24BDB1790];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingIsFloat"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v7;
  v14[4] = *MEMORY[0x24BDB17A0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingNumberOfChannels"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDB1770];
  v15[4] = v8;
  v15[5] = &unk_24CC9A100;
  v10 = *MEMORY[0x24BDB17A8];
  v14[5] = v9;
  v14[6] = v10;
  v15[6] = *MEMORY[0x24BDB17B0];
  v14[7] = *MEMORY[0x24BDB1798];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setAudioSessionEventDelegate:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[CSVTUIAudioRecorder setAudioSessionEventDelegate:]";
    _os_log_error_impl(&dword_2117D4000, v3, OS_LOG_TYPE_ERROR, "%s Unimplemented method called", (uint8_t *)&v4, 0xCu);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)voiceControllerCreationQueue
{
  return self->_voiceControllerCreationQueue;
}

- (void)setVoiceControllerCreationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_voiceControllerCreationQueue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CSVTUIAudioRecorderRemoteDeviceContext)remoteDeviceContext
{
  return self->_remoteDeviceContext;
}

- (void)setRemoteDeviceContext:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceContext, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_voiceControllerCreationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_latestContext, 0);
  objc_storeStrong((id *)&self->_remoteRecordClient, 0);
  objc_storeStrong((id *)&self->_voiceController, 0);
}

void __91__CSVTUIAudioRecorder_voiceControllerRecordHardwareConfigurationDidChange_toConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioRecorderRecordHardwareConfigurationDidChange:toConfiguration:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __75__CSVTUIAudioRecorder_voiceControllerDidStopRecording_forStream_forReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_audioRecorderDidStopRecordingForReason:streamHandleID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __85__CSVTUIAudioRecorder_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_audioRecorderDidStartRecordingSuccessfully:streamHandleID:error:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __128__CSVTUIAudioRecorder__processAudioChain_audioStreamHandleId_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        LODWORD(v7) = *(_DWORD *)(a1 + 80);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "audioRecorderBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __40__CSVTUIAudioRecorder_setContext_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "setContext:error:", v2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

void __49__CSVTUIAudioRecorder__voiceControllerWithError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = objc_alloc(MEMORY[0x24BDB1908]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "initWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

}

void __49__CSVTUIAudioRecorder__voiceControllerWithError___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id obj;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = objc_alloc(MEMORY[0x24BDB1908]);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v3 + 40);
    v4 = objc_msgSend(v2, "initWithError:", &obj);
    objc_storeStrong((id *)(v3 + 40), obj);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v4;

  }
  kdebug_trace();
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v7)
  {
    objc_msgSend(v7, "setRecordDelegate:");
  }
  else
  {
    v8 = (NSObject **)MEMORY[0x24BE28368];
    v9 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSVTUIAudioRecorder _voiceControllerWithError:]_block_invoke_2";
      _os_log_error_impl(&dword_2117D4000, v9, OS_LOG_TYPE_ERROR, "%s AVVC initialization failed", buf, 0xCu);
    }
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v10)
    {
      v11 = *v8;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        objc_msgSend(v10, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v16 = "-[CSVTUIAudioRecorder _voiceControllerWithError:]_block_invoke";
        v17 = 2114;
        v18 = v13;
        _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);

      }
    }
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

uint64_t __42__CSVTUIAudioRecorder_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__CSVTUIAudioRecorder_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", *(_QWORD *)(a1 + 40));
}

+ (unint64_t)_convertDeactivateOption:(unint64_t)a3
{
  return a3 == 1;
}

@end

@implementation VSDurationEstimationTask

- (VSDurationEstimationTask)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (VSDurationEstimationTask)initWithRequest:(id)a3
{
  id v5;
  VSDurationEstimationTask *v6;
  VSDurationEstimationTask *v7;
  VSInstrumentMetrics *v8;
  VSInstrumentMetrics *instrumentMetrics;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  VSDeviceTTSCore *v15;
  VSDeviceTTSCore *deviceCore;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VSDurationEstimationTask;
  v6 = -[VSDurationEstimationTask init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = (VSInstrumentMetrics *)objc_alloc_init(MEMORY[0x24BEC0D88]);
    instrumentMetrics = v7->_instrumentMetrics;
    v7->_instrumentMetrics = v8;

    if (objc_msgSend(v5, "requestCreatedTimestamp"))
    {
      v10 = objc_msgSend(v5, "requestCreatedTimestamp");
    }
    else
    {
      VSGetLogDefault();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA84000, v11, OS_LOG_TYPE_INFO, "Using timestamp inside voiced for Estimation task", buf, 2u);
      }

      v10 = mach_absolute_time();
    }
    -[VSInstrumentMetrics setRequestCreatedTimestamp:](v7->_instrumentMetrics, "setRequestCreatedTimestamp:", v10);
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[VSDurationEstimationTask instrumentMetrics](v7, "instrumentMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "requestCreatedTimestamp");
      *(_DWORD *)buf = 134217984;
      v20 = v14;
      _os_log_impl(&dword_21AA84000, v12, OS_LOG_TYPE_INFO, "Created Estimation task %llu", buf, 0xCu);

    }
    v15 = -[VSDeviceTTSCore initWithRequest:]([VSDeviceTTSCore alloc], "initWithRequest:", v5);
    deviceCore = v7->_deviceCore;
    v7->_deviceCore = v15;

  }
  return v7;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double estimatedDuration;
  void *v48;
  void *v49;
  id v50;
  uint8_t buf[4];
  double v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  -[VSDurationEstimationTask deviceCore](self, "deviceCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedVoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDurationEstimationTask deviceCore](self, "deviceCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedVoiceResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSDurationEstimationTask shortTermCachedEngineForVoice:voiceResource:](VSDurationEstimationTask, "shortTermCachedEngineForVoice:voiceResource:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDurationEstimationTask deviceCore](self, "deviceCore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEngine:", v7);

  -[VSDurationEstimationTask deviceCore](self, "deviceCore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "engine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDurationEstimationTask request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "languageCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDurationEstimationTask request](self, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "voiceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectVoiceForLang:name:type:gender:footprint:", v13, v15, 1, 0, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x24BEC0DE8]);
    objc_msgSend(v16, "voicePath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithVoicePath:resourcePath:", v18, 0);
    -[VSDurationEstimationTask deviceCore](self, "deviceCore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEngine:", v19);

  }
  -[VSDurationEstimationTask deviceCore](self, "deviceCore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "engine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[VSDurationEstimationTask deviceCore](self, "deviceCore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "start");

    if ((-[VSDurationEstimationTask isCancelled](self, "isCancelled") & 1) != 0)
      return;
    -[VSDurationEstimationTask deviceCore](self, "deviceCore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      self->_estimatedDuration = 0.0;
      -[VSDurationEstimationTask deviceCore](self, "deviceCore");
      v50 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSDurationEstimationTask setError:](self, "setError:", v26);

      return;
    }
    -[VSDurationEstimationTask deviceCore](self, "deviceCore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "engine");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x24BDD17C8];
      -[VSDurationEstimationTask deviceCore](self, "deviceCore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "selectedVoice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "key");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSDurationEstimationTask deviceCore](self, "deviceCore");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "selectedVoiceResource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "key");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("cached_engine_%@_%@"), v33, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      +[VSDurationEstimationTask shortTermCachedEngines](VSDurationEstimationTask, "shortTermCachedEngines");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSDurationEstimationTask deviceCore](self, "deviceCore");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "engine");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKey:timeToLive:", v40, v37, 30.0);

    }
    -[VSDurationEstimationTask deviceCore](self, "deviceCore");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "streamAudio");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDurationEstimationTask deviceCore](self, "deviceCore");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v42)
      objc_msgSend(v43, "streamAudio");
    else
      objc_msgSend(v43, "compressedAudio");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "duration");
    self->_estimatedDuration = v46;

    VSGetLogDefault();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      estimatedDuration = self->_estimatedDuration;
      -[VSDurationEstimationTask request](self, "request");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "utterance");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v52 = estimatedDuration;
      v53 = 2112;
      v54 = v49;
      _os_log_impl(&dword_21AA84000, v27, OS_LOG_TYPE_INFO, "Estimated duration: %.2f, for utterance: %@", buf, 0x16u);

LABEL_18:
    }
  }
  else
  {
    VSGetLogDefault();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      -[VSDurationEstimationTask request](self, "request");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v52 = *(double *)&v48;
      _os_log_error_impl(&dword_21AA84000, v27, OS_LOG_TYPE_ERROR, "Unable to create engine for request %@", buf, 0xCu);
      goto LABEL_18;
    }
  }

}

- (void)cancel
{
  void *v3;
  id v4;

  -[VSDurationEstimationTask deviceCore](self, "deviceCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 400, MEMORY[0x24BDBD1B8]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VSDurationEstimationTask setError:](self, "setError:", v4);

}

- (id)delegate
{
  return 0;
}

- (id)taskHash
{
  return &stru_24DD8EF88;
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (double)estimatedDuration
{
  return self->_estimatedDuration;
}

- (VSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setInstrumentMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentMetrics, a3);
}

- (VSDeviceTTSCore)deviceCore
{
  return self->_deviceCore;
}

- (void)setDeviceCore:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCore, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

+ (id)shortTermCachedEngines
{
  if (shortTermCachedEngines_onceToken != -1)
    dispatch_once(&shortTermCachedEngines_onceToken, &__block_literal_global_135);
  return (id)shortTermCachedEngines_shortTermCachedEngines;
}

+ (id)shortTermCachedEngineForVoice:(id)a3 voiceResource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  +[VSDurationEstimationTask shortTermCachedEngines](VSDurationEstimationTask, "shortTermCachedEngines");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", CFSTR("cached_engine_%@_%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __50__VSDurationEstimationTask_shortTermCachedEngines__block_invoke()
{
  VSShortTermCache *v0;
  void *v1;

  v0 = objc_alloc_init(VSShortTermCache);
  v1 = (void *)shortTermCachedEngines_shortTermCachedEngines;
  shortTermCachedEngines_shortTermCachedEngines = (uint64_t)v0;

}

@end

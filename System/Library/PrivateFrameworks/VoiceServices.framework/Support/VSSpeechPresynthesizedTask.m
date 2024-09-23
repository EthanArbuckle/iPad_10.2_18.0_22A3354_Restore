@implementation VSSpeechPresynthesizedTask

- (VSSpeechPresynthesizedTask)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (VSSpeechPresynthesizedTask)initWithRequest:(id)a3
{
  id v5;
  VSSpeechPresynthesizedTask *v6;
  VSSpeechPresynthesizedTask *v7;
  VSInstrumentMetrics *v8;
  VSInstrumentMetrics *instrumentMetrics;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSSpeechPresynthesizedTask;
  v6 = -[VSSpeechPresynthesizedTask init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = (VSInstrumentMetrics *)objc_alloc_init(MEMORY[0x24BEC0D88]);
    instrumentMetrics = v7->_instrumentMetrics;
    v7->_instrumentMetrics = v8;

    -[VSInstrumentMetrics setSourceOfTTS:](v7->_instrumentMetrics, "setSourceOfTTS:", 7);
    if (objc_msgSend(v5, "requestCreatedTimestamp"))
    {
      v10 = objc_msgSend(v5, "requestCreatedTimestamp");
    }
    else
    {
      VSGetLogDefault();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v11, OS_LOG_TYPE_ERROR, "Using timestamp inside voiced for Presynthesized task", buf, 2u);
      }

      v10 = mach_absolute_time();
    }
    -[VSInstrumentMetrics setRequestCreatedTimestamp:](v7->_instrumentMetrics, "setRequestCreatedTimestamp:", v10);
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[VSSpeechPresynthesizedTask instrumentMetrics](v7, "instrumentMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "requestCreatedTimestamp");
      *(_DWORD *)buf = 134217984;
      v19 = v14;
      _os_log_impl(&dword_21AA84000, v12, OS_LOG_TYPE_INFO, "Created Presynthesized Task %llu", buf, 0xCu);

    }
    objc_msgSend(v5, "clientBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSInstrumentMetrics setClientBundleIdentifier:](v7->_instrumentMetrics, "setClientBundleIdentifier:", v15);

    kdebug_trace();
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VSSpeechPresynthesizedTask isExecuting](self, "isExecuting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("task: inprogress %@, request: %@"), v4, self->_request);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)main
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  VSAudioPlaybackService *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  VSAudioPlaybackService *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString **v48;
  uint64_t *v49;
  void *v50;
  _BYTE v51[40];
  _OWORD v52[2];
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VSSpeechPresynthesizedTask request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v62 = v4;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEFAULT, "Speaking pre-synthesized audio: %@", buf, 0xCu);

  }
  v5 = mach_absolute_time();
  -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSynthesisBeginTimestamp:", v5);

  +[VSSiriServerConfiguration defaultConfig](VSSiriServerConfiguration, "defaultConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "experimentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExperimentIdentifier:", v8);

  v10 = (void *)MEMORY[0x24BEC0D78];
  -[VSSpeechPresynthesizedTask request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "audioDataFromPresynthesisRequest:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = mach_absolute_time();
  -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSynthesisEndTimestamp:", v13);

  if (v12)
  {
    objc_msgSend(v12, "asbd");
  }
  else
  {
    v56 = 0;
    v54 = 0u;
    v55 = 0u;
  }
  v52[0] = v54;
  v52[1] = v55;
  v53 = v56;
  -[VSSpeechPresynthesizedTask setAsbd:](self, "setAsbd:", v52);
  v15 = [VSAudioPlaybackService alloc];
  -[VSSpeechPresynthesizedTask request](self, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "audioSessionID");
  -[VSSpeechPresynthesizedTask asbd](self, "asbd");
  -[VSSpeechPresynthesizedTask request](self, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accessoryID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[VSAudioPlaybackService initWithAudioSessionID:asbd:useAVSBAR:](v15, "initWithAudioSessionID:asbd:useAVSBAR:", v17, v51, v19 != 0);
  -[VSSpeechPresynthesizedTask setPlaybackService:](self, "setPlaybackService:", v20);

  -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "outputRouteInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "audioRouteName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAudioOutputRoute:", v23);

  -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v46 = (void *)MEMORY[0x24BDD1540];
    v59 = *MEMORY[0x24BDD0FD8];
    v60 = CFSTR("Can't create VSAudioPlaybackService");
    v47 = (void *)MEMORY[0x24BDBCE70];
    v48 = &v60;
    v49 = &v59;
LABEL_13:
    objc_msgSend(v47, "dictionaryWithObjects:forKeys:count:", v48, v49, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 0, v45);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechPresynthesizedTask setError:](self, "setError:", v50);

    goto LABEL_14;
  }
  if (!v12)
  {
    v46 = (void *)MEMORY[0x24BDD1540];
    v57 = *MEMORY[0x24BDD0FC8];
    v58 = CFSTR("Can't decode audio data");
    v47 = (void *)MEMORY[0x24BDBCE70];
    v48 = &v58;
    v49 = &v57;
    goto LABEL_13;
  }
  if ((-[VSSpeechPresynthesizedTask isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[VSSpeechPresynthesizedTask error](self, "error");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = mach_absolute_time();
      -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(v28, "start");

      v30 = mach_absolute_time() - v27;
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAudioStartTimestampDiffs:", v30);

      -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "audioData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v12, "packetCount");
      objc_msgSend(v12, "packetDescriptions");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "enqueue:packetCount:packetDescriptions:", v33, v34, v35);

      v36 = mach_absolute_time();
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSpeechBeginTimestamp:", v36);

      -[VSSpeechPresynthesizedTask reportSpeechStart](self, "reportSpeechStart");
      -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "flushAndStop");

      -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "error");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechPresynthesizedTask setError:](self, "setError:", v40);

      v41 = mach_absolute_time();
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setSpeechEndTimestamp:", v41);

      objc_msgSend(v12, "duration");
      v44 = v43;
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setAudioDuration:", v44);
LABEL_14:

    }
  }
  -[VSSpeechPresynthesizedTask reportFinish](self, "reportFinish");

}

- (BOOL)isSpeaking
{
  return 1;
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 400, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechPresynthesizedTask setError:](self, "setError:", v3);

  if ((-[VSSpeechPresynthesizedTask isExecuting](self, "isExecuting") & 1) != 0
    || (-[VSSpeechPresynthesizedTask isCancelled](self, "isCancelled") & 1) != 0
    || (-[VSSpeechPresynthesizedTask isFinished](self, "isFinished") & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)VSSpeechPresynthesizedTask;
    -[VSSpeechPresynthesizedTask cancel](&v7, sel_cancel);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VSSpeechPresynthesizedTask;
    -[VSSpeechPresynthesizedTask cancel](&v8, sel_cancel);
    -[VSSpeechPresynthesizedTask reportFinish](self, "reportFinish");
  }
  -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[VSSpeechPresynthesizedTask delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechPresynthesizedTask request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioRequest:didStopAtEnd:error:", v6, 0, 0);

}

- (void)suspend
{
  id v2;

  -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)resume
{
  id v2;
  id v3;

  -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "start");

}

- (void)reportSpeechStart
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  -[VSSpeechPresynthesizedTask delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VSSpeechPresynthesizedTask delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechPresynthesizedTask request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "audioRequestDidStart:", v6);

  }
  -[VSSpeechPresynthesizedTask siriInstrumentation](self, "siriInstrumentation");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeToSpeakLatency");
  v9 = v8;
  -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "outputRouteInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = 0;
  objc_msgSend(v13, "instrumentSpeechStartedWithSource:customerPerceivedLatency:audioOutputRoute:voiceType:voiceFootprint:voiceVersion:resourceVersion:isWhisper:", 7, v11, 0, 0, 0, 0, v9, v12);

}

- (void)reportFinish
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  __CFString *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  void *v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x24BDAC8D0];
  -[VSSpeechPresynthesizedTask delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VSSpeechPresynthesizedTask delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechPresynthesizedTask request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechPresynthesizedTask error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "audioRequest:didReportInstrumentMetrics:error:", v6, v7, v8);

  }
  -[VSSpeechPresynthesizedTask delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[VSSpeechPresynthesizedTask delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechPresynthesizedTask request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechPresynthesizedTask error](self, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechPresynthesizedTask error](self, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "audioRequest:didStopAtEnd:error:", v12, v13 == 0, v14);

  }
  -[VSSpeechPresynthesizedTask error](self, "error");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_9;
  v16 = (void *)v15;
  -[VSSpeechPresynthesizedTask error](self, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "code") == 400)
  {

LABEL_9:
    VSGetLogDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v54, "requestCreatedTimestamp");
      if (-[VSSpeechPresynthesizedTask isCancelled](self, "isCancelled"))
        v22 = CFSTR("Cancelled");
      else
        v22 = CFSTR("Finished");
      -[VSSpeechPresynthesizedTask request](self, "request");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "text");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v24)
        v26 = (const __CFString *)v24;
      else
        v26 = &stru_24DD8EF88;
      v55 = CFSTR("audio_duration");
      v27 = (void *)MEMORY[0x24BDD16E0];
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "audioDuration");
      objc_msgSend(v27, "numberWithDouble:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v29;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v58 = v21;
      v59 = 2112;
      v60 = v22;
      v61 = 2112;
      v62 = v26;
      v63 = 2114;
      v64 = v30;
      _os_log_impl(&dword_21AA84000, v20, OS_LOG_TYPE_DEFAULT, "Audio task %llu: %@ speaking utterance '%@', %{public}@", buf, 0x2Au);

    }
    v31 = -[VSSpeechPresynthesizedTask isCancelled](self, "isCancelled");
    -[VSSpeechPresynthesizedTask siriInstrumentation](self, "siriInstrumentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v31)
    {
      objc_msgSend(v32, "instrumentSpeechCancelled");
    }
    else
    {
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "audioDuration");
      v36 = v35;
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "ttsSynthesisLatency");
      v39 = v38;
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "cappedRealTimeFactor");
      v42 = v41;
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "promptCount");
      -[VSSpeechPresynthesizedTask instrumentMetrics](self, "instrumentMetrics");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "instrumentSpeechEndedWithAudioDuration:synthesisLatency:realTimeFactor:promptCount:errorCode:", v44, objc_msgSend(v45, "errorCode"), v36, v39, v42);

    }
    goto LABEL_23;
  }
  -[VSSpeechPresynthesizedTask error](self, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "code");

  if (v19 == 501)
    goto LABEL_9;
  VSGetLogDefault();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    -[VSSpeechPresynthesizedTask request](self, "request");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "requestCreatedTimestamp");
    -[VSSpeechPresynthesizedTask error](self, "error");
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v58 = v52;
    v59 = 2112;
    v60 = v53;
    _os_log_error_impl(&dword_21AA84000, v46, OS_LOG_TYPE_ERROR, "Error in audio task %llu, error: %@", buf, 0x16u);

  }
  -[VSSpeechPresynthesizedTask siriInstrumentation](self, "siriInstrumentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x24BDD16E0];
  -[VSSpeechPresynthesizedTask error](self, "error");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "numberWithInteger:", objc_msgSend(v48, "code"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "instrumentSpeechFailedWithErrorCodes:", v50);

LABEL_23:
}

- (id)taskHash
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), self);
}

- (id)audioPowerProvider
{
  void *v2;
  void *v3;

  -[VSSpeechPresynthesizedTask playbackService](self, "playbackService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioPowerProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (VSPresynthesizedAudioRequest)request
{
  return self->_request;
}

- (VSSpeechServiceDelegate)delegate
{
  return (VSSpeechServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSAudioPlaybackService)playbackService
{
  return self->_playbackService;
}

- (void)setPlaybackService:(id)a3
{
  objc_storeStrong((id *)&self->_playbackService, a3);
}

- (VSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setInstrumentMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentMetrics, a3);
}

- (NSMutableData)audioData
{
  return self->_audioData;
}

- (void)setAudioData:(id)a3
{
  objc_storeStrong((id *)&self->_audioData, a3);
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[7].mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[8].mBytesPerPacket;
  return self;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)&a3->mBitsPerChannel;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_OWORD *)&self->_asbd.mSampleRate = *(_OWORD *)&a3->mSampleRate;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
  *(_QWORD *)&self->_asbd.mBitsPerChannel = v3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (VSSiriInstrumentation)siriInstrumentation
{
  return self->_siriInstrumentation;
}

- (void)setSiriInstrumentation:(id)a3
{
  objc_storeStrong((id *)&self->_siriInstrumentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriInstrumentation, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_playbackService, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
}

@end

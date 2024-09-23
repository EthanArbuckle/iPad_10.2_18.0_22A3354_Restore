@implementation VSSpeechSynthesisTask

- (VSSpeechSynthesisTask)initWithRequest:(id)a3
{
  VSSpeechSynthesisTask *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSSpeechSynthesisTask;
  result = -[VSSpeechSpeakTask initWithRequest:](&v4, sel_initWithRequest_, a3);
  if (result)
    result->_readyForEagerTask = 1;
  return result;
}

- (BOOL)isSpeaking
{
  void *v2;

  -[VSSpeechSynthesisTask speakTask](self, "speakTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  BOOL v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  -[VSSpeechSpeakTask fetchVoiceResource](self, "fetchVoiceResource");
  -[VSSpeechSpeakTask fetchVoiceAsset](self, "fetchVoiceAsset");
  v3 = (void *)objc_opt_new();
  -[VSSpeechSpeakTask request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "voiceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "estimatedTTSWordTimingForText:withLanguage:voiceName:", v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask setTimingInfos:](self, "setTimingInfos:", v10);

  v11 = (void *)MEMORY[0x24BEC0E10];
  -[VSSpeechSpeakTask timingInfos](self, "timingInfos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contextInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjustWordTimingInfo:forContext:", v12, v14);

  -[VSSpeechSpeakTask error](self, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[VSSpeechSpeakTask cachingService](self, "cachingService");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "fetchCacheForTask:", self);

    -[VSSpeechSpeakTask speechCache](self, "speechCache");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[VSSpeechSynthesisTask reportTimingInfo](self, "reportTimingInfo");
      -[VSSpeechSpeakTask request](self, "request");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "shouldStreamAudioData");

      if (v38)
      {
        -[VSSpeechSpeakTask speechCache](self, "speechCache");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSSpeechSpeakTask delegate](self, "delegate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSSpeechSpeakTask request](self, "request");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "audio");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "synthesisRequest:didGenerateAudioChunk:", v41, v42);

      }
      -[VSSpeechSynthesisTask speakTask](self, "speakTask");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
        -[VSSpeechSpeakTask speakCachedAudio](self, "speakCachedAudio");
    }
    else
    {
      -[VSSpeechSynthesisTask synthesize](self, "synthesize");
      -[VSSpeechSpeakTask error](self, "error");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "duration");
        v47 = v46;
        -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setAudioDuration:", v47);

      }
    }
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "speechBeginTimestamp");

    if (v50 >= 1)
    {
      v51 = mach_absolute_time();
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setSpeechEndTimestamp:", v51);

      -[VSSpeechSpeakTask playbackService](self, "playbackService");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v52) = objc_msgSend(v53, "discontinuedDuringPlayback");

      if ((_DWORD)v52)
      {
        -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setErrorCode:", 452);

      }
    }
  }
  -[VSSpeechSynthesisTask setReadyForEagerTask:](self, "setReadyForEagerTask:", 0);
  if (-[VSSpeechSynthesisTask isCancelled](self, "isCancelled"))
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v58 = *MEMORY[0x24BDD0FD0];
    v59[0] = CFSTR("Synthesis is cancelled/interrupted.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 400, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask setError:](self, "setError:", v18);

  }
  -[VSSpeechSpeakTask error](self, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    -[VSSpeechSynthesisTask reportInstrumentMetrics](self, "reportInstrumentMetrics");
  -[VSSpeechSpeakTask error](self, "error");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_10;
    kdebug_trace();
    +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dumpStreamAudio:forRequest:", v22, v23);

  }
LABEL_10:
  -[VSSpeechSpeakTask error](self, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    -[VSSpeechSpeakTask request](self, "request");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "outputPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "writeWaveToFilePath:", v27);

      if ((v29 & 1) == 0)
      {
        v30 = (void *)MEMORY[0x24BDD1540];
        v56 = *MEMORY[0x24BDD0FD0];
        v57 = CFSTR("writeWaveToFilePath failed.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 501, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSSpeechSpeakTask setError:](self, "setError:", v32);

      }
    }
    if ((-[VSSpeechSynthesisTask isCancelled](self, "isCancelled") & 1) != 0)
      goto LABEL_19;
    -[VSSpeechSpeakTask request](self, "request");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v33, "shouldCache") & 1) != 0)
    {
      -[VSSpeechSpeakTask speechCache](self, "speechCache");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        v55 = -[VSSpeechSpeakTask synthesisHasIssue](self, "synthesisHasIssue");

        if (!v55)
          -[VSSpeechSpeakTask enqueueCache](self, "enqueueCache");
        goto LABEL_19;
      }

    }
LABEL_19:

  }
  -[VSSpeechSynthesisTask reportFinish](self, "reportFinish");
  -[VSSpeechSpeakTask logFinish](self, "logFinish");
  kdebug_trace();
}

- (void)synthesize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask prepareForSynthesis](self, "prepareForSynthesis");
  -[VSSpeechSpeakTask error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && (-[VSSpeechSynthesisTask isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[VSSpeechSynthesisTask speakTask](self, "speakTask");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask startPlaybackServiceWithAudioSessionID:](self, "startPlaybackServiceWithAudioSessionID:", objc_msgSend(v6, "audioSessionID"));

    }
    v7 = mach_absolute_time();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSynthesisBeginTimestamp:", v7);

    kdebug_trace();
    -[VSSpeechSpeakTask engine](self, "engine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "utterance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "canLogRequestText");
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __35__VSSpeechSynthesisTask_synthesize__block_invoke;
    v23[3] = &unk_24DD8E1C8;
    v23[4] = self;
    objc_msgSend(v9, "synthesizeText:loggable:callback:", v11, v13, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[VSSpeechSpeakTask setError:](self, "setError:", v14);
    VSGetLogDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      -[VSSpeechSpeakTask request](self, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "utterance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");
      -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "duration");
      v21 = v20;
      -[VSSpeechSpeakTask error](self, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v25 = v18;
      v26 = 2048;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_21AA84000, v15, OS_LOG_TYPE_INFO, "SynthesisTask done synthesize %lu characters, audio duration %f, error %@", buf, 0x20u);

    }
    -[VSSpeechSpeakTask waitUntilAudioFinished](self, "waitUntilAudioFinished");

  }
}

- (void)setSpeakTask:(id)a3
{
  VSSpeechSpeakTask *v4;
  VSSpeechSpeakTask *speakTask;

  v4 = (VSSpeechSpeakTask *)a3;
  kdebug_trace();
  kdebug_trace();
  speakTask = self->_speakTask;
  self->_speakTask = v4;

}

- (void)setObserverForWordTimings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  -[VSSpeechSynthesisTask speakTask](self, "speakTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[VSSpeechSpeakTask playbackService](self, "playbackService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__VSSpeechSynthesisTask_setObserverForWordTimings___block_invoke;
    v9[3] = &unk_24DD8E9C8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "setBoundaryTimeObserverForTimingInfos:usingBlock:", v4, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)reportTimingInfo
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VSSpeechSpeakTask delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask timingInfos](self, "timingInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synthesisRequest:didReceiveTimingInfo:", v6, v7);

    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 134217984;
      v23 = objc_msgSend(v18, "requestCreatedTimestamp");
      _os_log_debug_impl(&dword_21AA84000, v8, OS_LOG_TYPE_DEBUG, "Task %llu reported word time info", (uint8_t *)&v22, 0xCu);

    }
  }
  -[VSSpeechSynthesisTask speakTask](self, "speakTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask timingInfos](self, "timingInfos");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "speechRequest:didReceiveTimingInfo:", v15, v16);

    VSGetLogDefault();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[VSSpeechSynthesisTask speakTask](self, "speakTask");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "instrumentMetrics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "requestCreatedTimestamp");
      v22 = 134217984;
      v23 = v21;
      _os_log_debug_impl(&dword_21AA84000, v17, OS_LOG_TYPE_DEBUG, "Task %llu reported word time info", (uint8_t *)&v22, 0xCu);

    }
  }
}

- (void)reportInstrumentMetrics
{
  void *v3;
  void *v4;
  char v5;
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
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  uint64_t v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSynthesisTask speakTask](self, "speakTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "utterance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "instrumentMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUtterance:", v7);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "voiceAssetKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "instrumentMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setVoiceAssetKey:", v11);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "voiceResourceAssetKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "instrumentMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setVoiceResourceAssetKey:", v15);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "synthesisBeginTimestamp");
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "instrumentMetrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSynthesisBeginTimestamp:", v19);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "synthesisEndTimestamp");
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "instrumentMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSynthesisEndTimestamp:", v23);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "speechBeginTimestamp");
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "instrumentMetrics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSpeechBeginTimestamp:", v27);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "speechEndTimestamp");
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "instrumentMetrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSpeechEndTimestamp:", v31);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "audioStartTimestampDiffs");
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "instrumentMetrics");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAudioStartTimestampDiffs:", v35);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "audioDuration");
    v40 = v39;
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "instrumentMetrics");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAudioDuration:", v40);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isWarmStart");
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "instrumentMetrics");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setIsWarmStart:", v44);

    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "instrumentMetrics");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "requestCreatedTimestamp");
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v49 - objc_msgSend(v50, "requestCreatedTimestamp");
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "instrumentMetrics");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setEagerRequestCreatedTimestampDiffs:", v51);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "promptCount");
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "instrumentMetrics");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setPromptCount:", v55);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "errorCode");
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "instrumentMetrics");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setErrorCode:", v59);

    VSGetLogDefault();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechSynthesisTask speakTask](self, "speakTask");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "instrumentMetrics");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "requestCreatedTimestamp");
      -[VSSpeechSynthesisTask speakTask](self, "speakTask");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "instrumentMetrics");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 134218242;
      v81 = v65;
      v82 = 2112;
      v83 = v67;
      _os_log_impl(&dword_21AA84000, v62, OS_LOG_TYPE_DEFAULT, "Device SpeakTask %llu: Instrument metric: %@", (uint8_t *)&v80, 0x16u);

    }
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "delegate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "request");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "instrumentMetrics");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "speechRequest:didReportInstrumentMetrics:", v71, v73);

    +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "instrumentMetrics");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "dictionaryMetrics");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "instrumentMetrics");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "dumpInstrumentMetrics:withTimestamp:", v77, objc_msgSend(v79, "requestCreatedTimestamp"));

  }
}

- (void)reportSpeechStart
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "speechBeginTimestamp");

  if (!v4)
  {
    kdebug_trace();
    v5 = mach_absolute_time();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSpeechBeginTimestamp:", v5);

    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[VSSpeechSynthesisTask speakTask](self, "speakTask");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask request](self, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "speechRequestDidStart:", v12);

      VSGetLogDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 134217984;
        v16 = objc_msgSend(v14, "requestCreatedTimestamp");
        _os_log_debug_impl(&dword_21AA84000, v13, OS_LOG_TYPE_DEBUG, "Task %llu started speaking", (uint8_t *)&v15, 0xCu);

      }
    }
  }
}

- (void)reportFinish
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSynthesisTask speakTask](self, "speakTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VSSpeechSynthesisTask speakTask](self, "speakTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VSSpeechSynthesisTask isCancelled](self, "isCancelled") ^ 1;
    -[VSSpeechSpeakTask phonemes](self, "phonemes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask error](self, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "speechRequest:didStopWithSuccess:phonemesSpoken:error:", v8, v9, v11, v12);

    VSGetLogDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[VSSpeechSynthesisTask speakTask](self, "speakTask");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "instrumentMetrics");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "requestCreatedTimestamp");
      -[VSSpeechSpeakTask error](self, "error");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 134218242;
      v33 = v27;
      v34 = 2112;
      v35 = v28;
      _os_log_debug_impl(&dword_21AA84000, v13, OS_LOG_TYPE_DEBUG, "Task %llu reported finish, error: %@", (uint8_t *)&v32, 0x16u);

    }
  }
  -[VSSpeechSpeakTask delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    VSGetLogDefault();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "requestCreatedTimestamp");
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 134218242;
      v33 = v18;
      v34 = 2112;
      v35 = v19;
      _os_log_impl(&dword_21AA84000, v16, OS_LOG_TYPE_DEFAULT, "Device EagerTask %llu: Instrument metric: %@", (uint8_t *)&v32, 0x16u);

    }
    -[VSSpeechSpeakTask delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask error](self, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "synthesisRequest:didFinishWithInstrumentMetrics:error:", v21, v22, v23);

    VSGetLogDefault();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "requestCreatedTimestamp");
      -[VSSpeechSpeakTask error](self, "error");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 134218242;
      v33 = v30;
      v34 = 2112;
      v35 = v31;
      _os_log_debug_impl(&dword_21AA84000, v24, OS_LOG_TYPE_DEBUG, "Task %llu reported finish, error: %@", (uint8_t *)&v32, 0x16u);

    }
  }
}

- (VSSpeechSpeakTask)speakTask
{
  return self->_speakTask;
}

- (BOOL)readyForEagerTask
{
  return self->_readyForEagerTask;
}

- (void)setReadyForEagerTask:(BOOL)a3
{
  self->_readyForEagerTask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakTask, 0);
}

void __51__VSSpeechSynthesisTask_setObserverForWordTimings___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "speakTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "textRange");
    objc_msgSend(v6, "speechRequest:didStartWithMark:forRange:", v7, 1, v8, v9);

  }
}

id __35__VSSpeechSynthesisTask_synthesize__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD block[5];
  _OWORD v49[2];
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if (v4 == 3)
  {
    kdebug_trace();
    v10 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSynthesisEndTimestamp:", v10);

    if ((objc_msgSend(v3, "neuralDidFallback") & 1) != 0)
      v12 = 1;
    else
      v12 = objc_msgSend(v3, "hasAudioClick");
    objc_msgSend(*(id *)(a1 + 32), "setSynthesisHasIssue:", v12);
    v13 = objc_msgSend(v3, "numOfPromptsTriggered");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPromptCount:", v13);

    objc_msgSend(*(id *)(a1 + 32), "timingInfos");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(v3, "wordTimingInfos");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setTimingInfos:", v16);

      v17 = (void *)MEMORY[0x24BEC0E10];
      objc_msgSend(*(id *)(a1 + 32), "timingInfos");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contextInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "adjustWordTimingInfo:forContext:", v18, v20);

    }
    objc_msgSend(*(id *)(a1 + 32), "reportTimingInfo");
    v21 = objc_msgSend(v3, "hasAlignmentStall");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNeuralAlignmentStall:", v21);

    v23 = objc_msgSend(v3, "hasAudioClick");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNeuralAudioClick:", v23);

    v25 = objc_msgSend(v3, "neuralDidFallback");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNeuralFallback:", v25);

    goto LABEL_12;
  }
  if (v4 != 2)
  {
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x220750BF4]();
    objc_msgSend(v3, "mutablePCMData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "voiceBooster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processData:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_5:
      v5 = v9;

      objc_autoreleasePoolPop(v6);
      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 32), "streamAudio");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "appendAudioData:packetCount:packetDescriptions:", v7, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "request");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "shouldStreamAudioData");

    if (v30)
    {
      v31 = objc_alloc_init(MEMORY[0x24BEC0D78]);
      objc_msgSend(*(id *)(a1 + 32), "engine");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        objc_msgSend(v32, "asbd");
      }
      else
      {
        v53 = 0;
        v51 = 0u;
        v52 = 0u;
      }
      v49[0] = v51;
      v49[1] = v52;
      v50 = v53;
      objc_msgSend(v31, "setAsbd:", v49);

      objc_msgSend(v31, "setAudioData:", v7);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "request");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "synthesisRequest:didGenerateAudioChunk:", v35, v31);

    }
    objc_msgSend(*(id *)(a1 + 32), "speakTask");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = *(void **)(a1 + 32);
      objc_msgSend(v37, "speakTask");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "request");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "startPlaybackServiceWithAudioSessionID:", objc_msgSend(v39, "audioSessionID"));

      objc_msgSend(*(id *)(a1 + 32), "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_5;
      objc_msgSend(*(id *)(a1 + 32), "playbackService");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "enqueue:packetCount:packetDescriptions:", v7, 0, 0);

      objc_msgSend(*(id *)(a1 + 32), "taskAuxiliaryQueue");
      v41 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __35__VSSpeechSynthesisTask_synthesize__block_invoke_2;
      block[3] = &unk_24DD8EBB0;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v41, block);

      objc_msgSend(*(id *)(a1 + 32), "timingInfos");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v42)
      {
        v43 = objc_alloc(MEMORY[0x24BDBCE30]);
        objc_msgSend(v3, "wordTimingInfos");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v43, "initWithArray:copyItems:", v44, 1);

        v45 = (void *)MEMORY[0x24BEC0E10];
        objc_msgSend(*(id *)(a1 + 32), "request");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "contextInfo");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "adjustWordTimingInfo:forContext:", v42, v47);

      }
      objc_msgSend(*(id *)(a1 + 32), "setObserverForWordTimings:", v42);

    }
    objc_autoreleasePoolPop(v6);
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

uint64_t __35__VSSpeechSynthesisTask_synthesize__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportSpeechStart");
}

@end

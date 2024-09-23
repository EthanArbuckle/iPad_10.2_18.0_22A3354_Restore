@implementation CSVTUIEndpointAnalyzer

- (CSVTUIEndpointAnalyzer)init
{
  CSVTUIEndpointAnalyzer *v2;
  float v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSVTUIEndpointAnalyzer;
  v2 = -[CSVTUIEndpointAnalyzer init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    v2->_currentRequestSampleRate = (unint64_t)v3;
    v2->_firstAudioSampleSensorTimestamp = 0.0;
    v2->_firstSampleId = -1;
    objc_msgSend(MEMORY[0x24BE28488], "getSerialQueueWithQOS:name:fixedPriority:", 33, CFSTR("com.apple.corespeech.vtui.nnvad"), *MEMORY[0x24BE284E0]);
    v4 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__CSVTUIEndpointAnalyzer_resetForNewRequestWithSampleRate___block_invoke;
  v4[3] = &unk_24CC84D80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)handleVoiceTriggerWithActivationInfo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__CSVTUIEndpointAnalyzer_handleVoiceTriggerWithActivationInfo___block_invoke;
  block[3] = &unk_24CC85EE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)_pcmBufferForAudioChunk:(id)a3
{
  unint64_t activeChannel;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;

  activeChannel = self->_activeChannel;
  v5 = a3;
  objc_msgSend(v5, "dataForChannel:", activeChannel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "numSamples");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", self->_currentRequestAudioFormat, v7);
  objc_msgSend(v8, "setFrameLength:", v7);
  v9 = *(void **)(objc_msgSend(v8, "mutableAudioBufferList") + 16);
  v10 = objc_retainAutorelease(v6);
  v11 = (const void *)objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v5, "numSamples");
  v13 = objc_msgSend(v5, "sampleByteDepth");

  memcpy(v9, v11, v13 * v12);
  return v8;
}

- (void)processAudioSamplesAsynchronously:(id)a3
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
  v7[2] = __60__CSVTUIEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke;
  v7[3] = &unk_24CC85EE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)stopEndpointer
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSVTUIEndpointAnalyzer stopEndpointer]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  self->_nnvadState = 2;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CSVTUIEndpointAnalyzer_stopEndpointer__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__CSVTUIEndpointAnalyzer_recordingStoppedForReason___block_invoke;
  v4[3] = &unk_24CC84D80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (double)_effectiveAudioTimeInSecsForSNObservation:(id)a3
{
  double v4;
  uint64_t v6;

  if (a3)
  {
    objc_msgSend(a3, "timeRange");
    v4 = (double)v6;
  }
  else
  {
    v4 = 0.0;
  }
  return self->_vtEndInSecs + v4 / (double)self->_currentRequestSampleRate;
}

- (void)_checkSNObservationForStartpoint:(id)a3
{
  id v4;
  double v5;
  double v6;
  int v7;
  double startWaitTime;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CSVTUIEndpointAnalyzer _effectiveAudioTimeInSecsForSNObservation:](self, "_effectiveAudioTimeInSecsForSNObservation:", v4);
  v6 = v5;
  v7 = objc_msgSend(v4, "detected");

  if (v7)
  {
    -[CSVTUIEndpointAnalyzer _reportStartpointAtTsInSecs:](self, "_reportStartpointAtTsInSecs:", v6);
  }
  else
  {
    startWaitTime = self->_startWaitTime;
    if (v6 > startWaitTime)
    {
      v9 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315650;
        v11 = "-[CSVTUIEndpointAnalyzer _checkSNObservationForStartpoint:]";
        v12 = 2050;
        v13 = v6;
        v14 = 2050;
        v15 = startWaitTime;
        _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s No Startpt detected even after %{public}f secs. startWaitTime=%{public}f secs", (uint8_t *)&v10, 0x20u);
      }
      -[CSVTUIEndpointAnalyzer _reportEndpointAtTsInSecs:](self, "_reportEndpointAtTsInSecs:", v6);
    }
  }
}

- (void)_checkSNObservationForEndpoint:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "detected") & 1) == 0)
  {
    -[CSVTUIEndpointAnalyzer _effectiveAudioTimeInSecsForSNObservation:](self, "_effectiveAudioTimeInSecsForSNObservation:", v4);
    -[CSVTUIEndpointAnalyzer _reportEndpointAtTsInSecs:](self, "_reportEndpointAtTsInSecs:");
  }

}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *queue;
  _QWORD v11[4];
  id v12;
  CSVTUIEndpointAnalyzer *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_nnvadState == 2)
  {
    v9 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSVTUIEndpointAnalyzer request:didProduceResult:]";
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Processing finished. Not scheduling", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__CSVTUIEndpointAnalyzer_request_didProduceResult___block_invoke;
    v11[3] = &unk_24CC85EE8;
    v12 = v7;
    v13 = self;
    dispatch_async(queue, v11);

  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[CSVTUIEndpointAnalyzer request:didFailWithError:]";
    v10 = 2114;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s request: %{public}@, returnedError: %{public}@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)_reportEndpointAtTsInSecs:(double)a3
{
  os_log_t *v5;
  NSObject *v6;
  double v7;
  float v8;
  unint64_t v9;
  void *v10;
  unint64_t anchorMachAbsTime;
  unint64_t numSamplesProcessedBeforeAnchorTime;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 isAnchorTimeBuffered;
  id WeakRetained;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE284B8];
  v6 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[CSVTUIEndpointAnalyzer _reportEndpointAtTsInSecs:]";
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Reporting end speech", (uint8_t *)&v17, 0xCu);
  }
  self->_nnvadState = 2;
  v7 = self->_vtExtraAudioAtStartInMs / 1000.0 + a3;
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  v9 = (unint64_t)(v7 * v8);
  v10 = (void *)MEMORY[0x24BE28448];
  numSamplesProcessedBeforeAnchorTime = self->_numSamplesProcessedBeforeAnchorTime;
  anchorMachAbsTime = self->_anchorMachAbsTime;
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  v13 = objc_msgSend(v10, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v9, anchorMachAbsTime, numSamplesProcessedBeforeAnchorTime);
  v14 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    isAnchorTimeBuffered = self->_isAnchorTimeBuffered;
    v17 = 136315650;
    v18 = "-[CSVTUIEndpointAnalyzer _reportEndpointAtTsInSecs:]";
    v19 = 2050;
    v20 = v13;
    v21 = 1026;
    v22 = isAnchorTimeBuffered;
    _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s endpointedBuffer.hostTime=%{public}llu, isAnchorTimeBuffered=%{public}d", (uint8_t *)&v17, 0x1Cu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "endpointer:didDetectHardEndpointAtTime:", self, a3);

}

- (void)_reportStartpointAtTsInSecs:(double)a3
{
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSVTUIEndpointAnalyzer _reportStartpointAtTsInSecs:]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Reporting start speech", (uint8_t *)&v7, 0xCu);
  }
  self->_nnvadState = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "endpointer:didDetectStartpointAtTime:", self, a3);

}

- (void)setStartWaitTime:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__CSVTUIEndpointAnalyzer_setStartWaitTime___block_invoke;
  v4[3] = &unk_24CC84D80;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setEndWaitTime:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__CSVTUIEndpointAnalyzer_setEndWaitTime___block_invoke;
  v4[3] = &unk_24CC84D80;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (CSVTUIEndpointAnalyzerDelegate)delegate
{
  return (CSVTUIEndpointAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer
{
  return self->_snAudioStreamAnalyzer;
}

- (void)setSnAudioStreamAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_snAudioStreamAnalyzer, a3);
}

- (unint64_t)framePosition
{
  return self->_framePosition;
}

- (void)setFramePosition:(unint64_t)a3
{
  self->_framePosition = a3;
}

- (unint64_t)nnvadState
{
  return self->_nnvadState;
}

- (void)setNnvadState:(unint64_t)a3
{
  self->_nnvadState = a3;
}

- (unint64_t)numSamplesReceived
{
  return self->_numSamplesReceived;
}

- (void)setNumSamplesReceived:(unint64_t)a3
{
  self->_numSamplesReceived = a3;
}

- (unint64_t)numSamplesProcessedBeforeAnchorTime
{
  return self->_numSamplesProcessedBeforeAnchorTime;
}

- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3
{
  self->_numSamplesProcessedBeforeAnchorTime = a3;
}

- (unint64_t)anchorMachAbsTime
{
  return self->_anchorMachAbsTime;
}

- (void)setAnchorMachAbsTime:(unint64_t)a3
{
  self->_anchorMachAbsTime = a3;
}

- (BOOL)isAnchorTimeBuffered
{
  return self->_isAnchorTimeBuffered;
}

- (void)setIsAnchorTimeBuffered:(BOOL)a3
{
  self->_isAnchorTimeBuffered = a3;
}

- (unint64_t)currentRequestSampleRate
{
  return self->_currentRequestSampleRate;
}

- (void)setCurrentRequestSampleRate:(unint64_t)a3
{
  self->_currentRequestSampleRate = a3;
}

- (AVAudioFormat)currentRequestAudioFormat
{
  return self->_currentRequestAudioFormat;
}

- (void)setCurrentRequestAudioFormat:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequestAudioFormat, a3);
}

- (double)vtEndInSecs
{
  return self->_vtEndInSecs;
}

- (void)setVtEndInSecs:(double)a3
{
  self->_vtEndInSecs = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (double)nnvadAudioOriginInMs
{
  return self->_nnvadAudioOriginInMs;
}

- (void)setNnvadAudioOriginInMs:(double)a3
{
  self->_nnvadAudioOriginInMs = a3;
}

- (BOOL)shouldDetectTwoShot
{
  return self->_shouldDetectTwoShot;
}

- (void)setShouldDetectTwoShot:(BOOL)a3
{
  self->_shouldDetectTwoShot = a3;
}

- (BOOL)didEnterTwoshot
{
  return self->_didEnterTwoshot;
}

- (void)setDidEnterTwoshot:(BOOL)a3
{
  self->_didEnterTwoshot = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileWriter, a3);
}

- (double)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setFirstAudioSampleSensorTimestamp:(double)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (int64_t)firstSampleId
{
  return self->_firstSampleId;
}

- (void)setFirstSampleId:(int64_t)a3
{
  self->_firstSampleId = a3;
}

- (unint64_t)numSamplesSkippedForVT
{
  return self->_numSamplesSkippedForVT;
}

- (void)setNumSamplesSkippedForVT:(unint64_t)a3
{
  self->_numSamplesSkippedForVT = a3;
}

- (BOOL)finishedSkippingSamplesForVT
{
  return self->_finishedSkippingSamplesForVT;
}

- (void)setFinishedSkippingSamplesForVT:(BOOL)a3
{
  self->_finishedSkippingSamplesForVT = a3;
}

- (double)startWaitTime
{
  return self->_startWaitTime;
}

- (double)endWaitTime
{
  return self->_endWaitTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRequestAudioFormat, 0);
  objc_storeStrong((id *)&self->_snAudioStreamAnalyzer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

double __41__CSVTUIEndpointAnalyzer_setEndWaitTime___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 176) = result;
  return result;
}

double __43__CSVTUIEndpointAnalyzer_setStartWaitTime___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 168) = result;
  return result;
}

void __51__CSVTUIEndpointAnalyzer_request_didProduceResult___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "timeRange");
    if (v6 >= 1)
    {
      v3 = *(_QWORD **)(a1 + 40);
      v4 = v3[6];
      switch(v4)
      {
        case 2:
          v5 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v8 = "-[CSVTUIEndpointAnalyzer request:didProduceResult:]_block_invoke";
            _os_log_debug_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEBUG, "%s Processing finished. Ignoring", buf, 0xCu);
          }
          break;
        case 1:
          objc_msgSend(v3, "_checkSNObservationForEndpoint:", *(_QWORD *)(a1 + 32));
          break;
        case 0:
          objc_msgSend(v3, "_checkSNObservationForStartpoint:", *(_QWORD *)(a1 + 32));
          break;
      }
    }
  }
}

void __52__CSVTUIEndpointAnalyzer_recordingStoppedForReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 136315394;
    v7 = "-[CSVTUIEndpointAnalyzer recordingStoppedForReason:]_block_invoke";
    v8 = 2050;
    v9 = v3;
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Recording Stopped For Reason: %{public}ld", (uint8_t *)&v6, 0x16u);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "endAudio");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 136);
  *(_QWORD *)(v4 + 136) = 0;

}

void __40__CSVTUIEndpointAnalyzer_stopEndpointer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "endAudio");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  *(_QWORD *)(v2 + 136) = 0;

}

void __60__CSVTUIEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD **)(a1 + 32);
  if (v1[6] == 2)
  {
    v2 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSVTUIEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
      _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Processing Done. Returning", buf, 0xCu);
    }
  }
  else
  {
    if ((v1[19] & 0x8000000000000000) != 0)
    {
      *(double *)(*(_QWORD *)(a1 + 32) + 144) = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "hostTime");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = objc_msgSend(*(id *)(a1 + 40), "startSampleCount");
      v4 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD **)(a1 + 32);
        v6 = v5[19];
        v7 = v5[7];
        v8 = v5[13];
        *(_DWORD *)buf = 136315906;
        v18 = "-[CSVTUIEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
        v19 = 2050;
        v20 = v6;
        v21 = 2050;
        v22 = v7;
        v23 = 2050;
        v24 = v8;
        _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Rx first sample: %{public}ld, _numSamplesReceived=%{public}lu, _vtEndInSampleCount=%{public}lu", buf, 0x2Au);
      }
      v1 = *(_QWORD **)(a1 + 32);
    }
    v1[8] = v1[7];
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = objc_msgSend(*(id *)(a1 + 40), "hostTime");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(*(id *)(a1 + 40), "wasBuffered");
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(v10 + 56);
    v12 = *(_QWORD *)(v10 + 104);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __60__CSVTUIEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke_11;
    v16[3] = &unk_24CC84A08;
    v16[4] = v10;
    objc_msgSend(v9, "skipSamplesAtStartSuchThatNumSamplesReceivedSoFar:reachesACountOf:completionHandler:", v11, v12, v16);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) += objc_msgSend(*(id *)(a1 + 40), "numSamples");
    objc_msgSend(*(id *)(a1 + 40), "dataForChannel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    v15 = objc_retainAutorelease(v13);
    objc_msgSend(v14, "addSamples:numSamples:", objc_msgSend(v15, "bytes"), objc_msgSend(*(id *)(a1 + 40), "numSamples"));

  }
}

void __60__CSVTUIEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke_11(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) += a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 11) && *(_QWORD *)(v6 + 160) >= *(_QWORD *)(v6 + 104))
  {
    *(_BYTE *)(v6 + 11) = 1;
    v7 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 160);
      LODWORD(v8) = *(unsigned __int8 *)(v8 + 11);
      v11 = 136315650;
      v12 = "-[CSVTUIEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
      v13 = 2050;
      v14 = v9;
      v15 = 1026;
      v16 = v8;
      _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s _numSamplesSkippedForVT=%{public}lu, _finishedSkippingSamplesForVT=%{public}d", (uint8_t *)&v11, 0x1Cu);
    }
  }
  if (objc_msgSend(v5, "numSamples"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_pcmBufferForAudioChunk:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "analyzeAudioBuffer:atAudioFramePosition:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) += objc_msgSend(v10, "frameLength");

  }
}

void __63__CSVTUIEndpointAnalyzer_handleVoiceTriggerWithActivationInfo___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("triggerEndSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  *(double *)(*(_QWORD *)(a1 + 32) + 96) = v3;

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("extraSamplesAtStart"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = (unint64_t)(*(double *)(*(_QWORD *)(a1 + 32) + 96)
                                                               * (double)*(unint64_t *)(*(_QWORD *)(a1 + 32)
                                                                                             + 80));
  *(double *)(*(_QWORD *)(a1 + 32) + 112) = (float)((float)((float)v5
                                                            / (float)*(unint64_t *)(*(_QWORD *)(a1 + 32) + 80))
                                                    * 1000.0);
  *(double *)(*(_QWORD *)(a1 + 32) + 120) = -(*(double *)(*(_QWORD *)(a1 + 32) + 112)
                                              - *(double *)(*(_QWORD *)(a1 + 32) + 96) * 1000.0);
  v6 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(v7 + 96);
    v10 = *(_QWORD *)(v7 + 104);
    v11 = (unint64_t)*(double *)(v7 + 112);
    v12 = *(_QWORD *)(v7 + 120);
    v13 = *(_QWORD *)(v7 + 160);
    LODWORD(v7) = *(unsigned __int8 *)(v7 + 11);
    v14 = 136316930;
    v15 = "-[CSVTUIEndpointAnalyzer handleVoiceTriggerWithActivationInfo:]_block_invoke";
    v16 = 2050;
    v17 = v9;
    v18 = 2050;
    v19 = v10;
    v20 = 2050;
    v21 = v11;
    v22 = 2050;
    v23 = v12;
    v24 = 2050;
    v25 = v13;
    v26 = 1026;
    v27 = v7;
    v28 = 2114;
    v29 = v8;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s triggerEndSeconds: %{public}f, _vtEndInSampleCount: %{public}lu, _vtExtraAudioAtStartInMs: %{public}lu,  _nnvadAudioOriginInMs: %{public}f, _numSamplesSkippedForVT: %{public}lu, _finishedSkippingSamplesForVT: %{public}d, voiceTriggerInfo: %{public}@,", (uint8_t *)&v14, 0x4Eu);
  }
}

void __59__CSVTUIEndpointAnalyzer_resetForNewRequestWithSampleRate___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE284B8];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v22 = "-[CSVTUIEndpointAnalyzer resetForNewRequestWithSampleRate:]_block_invoke";
    v23 = 2048;
    v24 = v4;
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s NewReq: sampleRate: %lu", buf, 0x16u);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = -1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0x4014000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0x3FE8A3D70A3D70A4;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 0;
  v5 = objc_alloc(MEMORY[0x24BDB1818]);
  if (objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingIsFloat"))
    v6 = 1;
  else
    v6 = 3;
  v7 = objc_msgSend(v5, "initWithCommonFormat:sampleRate:channels:interleaved:", v6, 1, 0, (double)*(unint64_t *)(*(_QWORD *)(a1 + 32) + 80));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 88);
  *(_QWORD *)(v8 + 88) = v7;

  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDE9AD8]), "initWithFormat:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = v10;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE9B20]), "initWithRequestType:", 0);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 32);
  v20 = 0;
  v16 = objc_msgSend(v15, "addRequest:withObserver:error:", v13, v14, &v20);
  v17 = v20;
  v18 = v17;
  if (!v16 || v17)
  {
    v19 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSVTUIEndpointAnalyzer resetForNewRequestWithSampleRate:]_block_invoke";
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, "%s Err: %@", buf, 0x16u);
    }
  }

}

+ (id)timeStampString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

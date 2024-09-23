@implementation SSRVoiceActivityDetector

- (SSRVoiceActivityDetector)initWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SSRVoiceActivityDetector *v9;
  SSRVoiceActivityDetector *v10;
  uint64_t v11;
  OS_dispatch_queue *spgQueue;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _EAREndpointer *hybridClassifier;
  _EAREndpointer *v19;
  float v20;
  NSObject *v21;
  uint64_t v22;
  _EARDefaultServerEndpointFeatures *defSepFeats;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SSRVoiceActivityDetector;
  v9 = -[SSRVoiceActivityDetector init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_msgSend(MEMORY[0x24BE28488], "getSerialQueueWithQOS:name:fixedPriority:", 33, CFSTR("com.apple.ssr.vad.spg"), *MEMORY[0x24BE284E0]);
    v11 = objc_claimAutoreleasedReturnValue();
    spgQueue = v10->_spgQueue;
    v10->_spgQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_context, a3);
    v10->_numConsecutiveNonSilenceFrames = 0;
    v10->_segmentStartPointSampleCount = 0;
    v10->_numSamplesProcessed = 0;
    -[SSRVoiceActivityDetector _initializeSPGWithContext:](v10, "_initializeSPGWithContext:", v7);
    v13 = objc_alloc(MEMORY[0x24BE2E720]);
    objc_msgSend(v7, "vadResourcePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v16 = objc_msgSend(v13, "initWithConfiguration:modelVersion:", v15, &v25);
    v17 = v25;
    hybridClassifier = v10->_hybridClassifier;
    v10->_hybridClassifier = (_EAREndpointer *)v16;

    v19 = v10->_hybridClassifier;
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    if ((-[_EAREndpointer requestSupportedWithSamplingRate:](v19, "requestSupportedWithSamplingRate:", (unint64_t)v20) & 1) == 0)
    {
      v21 = *MEMORY[0x24BE28360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[SSRVoiceActivityDetector initWithContext:delegate:]";
        _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s ERR: Hybrid endpointer not ready for processing request", buf, 0xCu);
      }
    }
    -[_EAREndpointer defaultServerEndpointFeatures](v10->_hybridClassifier, "defaultServerEndpointFeatures");
    v22 = objc_claimAutoreleasedReturnValue();
    defSepFeats = v10->_defSepFeats;
    v10->_defSepFeats = (_EARDefaultServerEndpointFeatures *)v22;

    v10->_endpointReported = 0;
  }

  return v10;
}

- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  float v10;
  int v11;
  const char *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[EARCaesuraSilencePosteriorGenerator addAudio:numSamples:](self->_earSpg, "addAudio:numSamples:", a3);
  v6 = self->_numSamplesProcessed + a4;
  self->_numSamplesProcessed = v6;
  if (__ROR8__(0x1CAC083126E978D5 * v6, 7) <= 0x4189374BC6A7EuLL)
  {
    v7 = (void *)*MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x24BE283F0];
      v9 = v7;
      objc_msgSend(v8, "inputRecordingSampleRate");
      v11 = 136315394;
      v12 = "-[SSRVoiceActivityDetector processAudioData:numSamples:]";
      v13 = 2048;
      v14 = (double)v6 / v10;
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s VAD processed %f secs of audio", (uint8_t *)&v11, 0x16u);

    }
  }
}

- (void)endAudio
{
  -[EARCaesuraSilencePosteriorGenerator endAudio](self->_earSpg, "endAudio");
}

- (void)resetWithContext:(id)a3
{
  SSRSpeakerRecognitionContext *v4;
  SSRSpeakerRecognitionContext *context;
  SSRSpeakerRecognitionContext *v6;

  v4 = (SSRSpeakerRecognitionContext *)a3;
  -[EARCaesuraSilencePosteriorGenerator endAudio](self->_earSpg, "endAudio");
  context = self->_context;
  self->_context = v4;
  v6 = v4;

  self->_segmentStartPointSampleCount = self->_numSamplesProcessed;
  self->_numConsecutiveNonSilenceFrames = 0;
  -[SSRVoiceActivityDetector _initializeSPGWithContext:](self, "_initializeSPGWithContext:", v6);

  *(_WORD *)&self->_endpointReported = 0;
}

- (void)_initializeSPGWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  EARCaesuraSilencePosteriorGenerator *v10;
  EARCaesuraSilencePosteriorGenerator *earSpg;

  v4 = (objc_class *)MEMORY[0x24BE2E6D0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "vadResourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  v10 = (EARCaesuraSilencePosteriorGenerator *)objc_msgSend(v6, "initWithConfigFile:samplingRate:queue:", v8, (unint64_t)v9, self->_spgQueue);
  earSpg = self->_earSpg;
  self->_earSpg = v10;

  -[EARCaesuraSilencePosteriorGenerator setDelegate:](self->_earSpg, "setDelegate:", self);
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  _EAREndpointer *hybridClassifier;
  int v26;
  id v27;
  double v28;
  double v29;
  float v30;
  unint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id WeakRetained;
  char v42;
  id v43;
  double v44;
  unint64_t v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  char v56;
  id v57;
  id v58;
  uint64_t v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_endpointReported)
  {
    v5 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v61 = "-[SSRVoiceActivityDetector clientSilenceFeaturesAvailable:]";
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Endpoint already reported. Not scheduling", buf, 0xCu);
    }
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BE2E710]);
    v7 = -[_EARDefaultServerEndpointFeatures wordCount](self->_defSepFeats, "wordCount");
    v8 = -[_EARDefaultServerEndpointFeatures trailingSilenceDuration](self->_defSepFeats, "trailingSilenceDuration");
    -[_EARDefaultServerEndpointFeatures endOfSentenceLikelihood](self->_defSepFeats, "endOfSentenceLikelihood");
    v10 = v9;
    -[_EARDefaultServerEndpointFeatures acousticEndpointerScore](self->_defSepFeats, "acousticEndpointerScore");
    v12 = v11;
    -[_EARDefaultServerEndpointFeatures silencePosterior](self->_defSepFeats, "silencePosterior");
    v14 = v13;
    objc_msgSend(v4, "silenceFramesCountMs");
    v16 = v15;
    objc_msgSend(v4, "silenceProbability");
    v18 = v17;
    objc_msgSend(v4, "silenceDurationMs");
    v20 = v19;
    objc_msgSend(v4, "processedAudioMs");
    *(float *)&v22 = v21;
    *(float *)&v23 = v20;
    v24 = (void *)objc_msgSend(v6, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:", v7, v8, MEMORY[0x24BDBD1A8], 0, v10, v12, v14, v16, v18, v23, v22);
    v59 = 0;
    hybridClassifier = self->_hybridClassifier;
    objc_msgSend(v4, "processedAudioMs");
    v58 = 0;
    v26 = -[_EAREndpointer didEndpointWithFeatures:audioTimestamp:featuresToLog:endpointPosterior:extraDelayMs:](hybridClassifier, "didEndpointWithFeatures:audioTimestamp:featuresToLog:endpointPosterior:extraDelayMs:", v24, &v58, (char *)&v59 + 4, &v59);
    v27 = v58;
    objc_msgSend(v4, "processedAudioMs");
    v29 = v28;
    *(float *)&v12 = (float)(1000 * self->_segmentStartPointSampleCount);
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    v31 = (unint64_t)(v29 + (float)(*(float *)&v12 / v30));
    if (v26)
    {
      self->_endpointReported = 1;
      v32 = (void *)*MEMORY[0x24BE28360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        objc_msgSend(v4, "silenceFramesCountMs");
        v35 = v34;
        objc_msgSend(v4, "silenceDurationMs");
        v37 = v36;
        objc_msgSend(v4, "silenceProbability");
        v39 = v38;
        objc_msgSend(v4, "processedAudioMs");
        *(_DWORD *)buf = 136316162;
        v61 = "-[SSRVoiceActivityDetector clientSilenceFeaturesAvailable:]";
        v62 = 2048;
        v63 = v35;
        v64 = 2048;
        v65 = v37;
        v66 = 2048;
        v67 = v39;
        v68 = 2048;
        v69 = v40;
        _os_log_impl(&dword_2117D4000, v33, OS_LOG_TYPE_DEFAULT, "%s Found Endpoint at: [%f %f %f %f]", buf, 0x34u);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v42 = objc_opt_respondsToSelector();

      if ((v42 & 1) != 0)
      {
        v43 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v43, "SSRVoiceActivityDetector:didDetectEndPointAt:", self, v31);

      }
    }
    else if (!self->_startpointReported)
    {
      objc_msgSend(v4, "silenceProbability");
      if (v44 >= 0.5)
      {
        self->_numConsecutiveNonSilenceFrames = 0;
      }
      else
      {
        v45 = self->_numConsecutiveNonSilenceFrames + 1;
        self->_numConsecutiveNonSilenceFrames = v45;
        if (v45 >= 0xA)
        {
          v46 = (void *)*MEMORY[0x24BE28360];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
          {
            v47 = v46;
            objc_msgSend(v4, "silenceFramesCountMs");
            v49 = v48;
            objc_msgSend(v4, "silenceDurationMs");
            v51 = v50;
            objc_msgSend(v4, "silenceProbability");
            v53 = v52;
            objc_msgSend(v4, "processedAudioMs");
            *(_DWORD *)buf = 136316162;
            v61 = "-[SSRVoiceActivityDetector clientSilenceFeaturesAvailable:]";
            v62 = 2048;
            v63 = v49;
            v64 = 2048;
            v65 = v51;
            v66 = 2048;
            v67 = v53;
            v68 = 2048;
            v69 = v54;
            _os_log_impl(&dword_2117D4000, v47, OS_LOG_TYPE_DEFAULT, "%s Found startpoint at: [%f %f %f %f]", buf, 0x34u);

          }
          v55 = objc_loadWeakRetained((id *)&self->_delegate);
          v56 = objc_opt_respondsToSelector();

          if ((v56 & 1) != 0)
          {
            v57 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v57, "SSRVoiceActivityDetector:didDetectStartPointAt:", self, v31);

          }
          self->_startpointReported = 1;
        }
      }
    }

  }
}

- (SSRSpeakerRecognitionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (SSRVoiceActivityDetectorDelegate)delegate
{
  return (SSRVoiceActivityDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EARCaesuraSilencePosteriorGenerator)earSpg
{
  return self->_earSpg;
}

- (void)setEarSpg:(id)a3
{
  objc_storeStrong((id *)&self->_earSpg, a3);
}

- (_EAREndpointer)hybridClassifier
{
  return self->_hybridClassifier;
}

- (void)setHybridClassifier:(id)a3
{
  objc_storeStrong((id *)&self->_hybridClassifier, a3);
}

- (_EARDefaultServerEndpointFeatures)defSepFeats
{
  return self->_defSepFeats;
}

- (void)setDefSepFeats:(id)a3
{
  objc_storeStrong((id *)&self->_defSepFeats, a3);
}

- (int64_t)segmentStartPointSampleCount
{
  return self->_segmentStartPointSampleCount;
}

- (void)setSegmentStartPointSampleCount:(int64_t)a3
{
  self->_segmentStartPointSampleCount = a3;
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (BOOL)endpointReported
{
  return self->_endpointReported;
}

- (void)setEndpointReported:(BOOL)a3
{
  self->_endpointReported = a3;
}

- (BOOL)startpointReported
{
  return self->_startpointReported;
}

- (void)setStartpointReported:(BOOL)a3
{
  self->_startpointReported = a3;
}

- (OS_dispatch_queue)spgQueue
{
  return self->_spgQueue;
}

- (void)setSpgQueue:(id)a3
{
  objc_storeStrong((id *)&self->_spgQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spgQueue, 0);
  objc_storeStrong((id *)&self->_defSepFeats, 0);
  objc_storeStrong((id *)&self->_hybridClassifier, 0);
  objc_storeStrong((id *)&self->_earSpg, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

@end

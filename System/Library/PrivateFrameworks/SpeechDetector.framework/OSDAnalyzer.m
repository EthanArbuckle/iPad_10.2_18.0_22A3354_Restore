@implementation OSDAnalyzer

- (OSDAnalyzer)initWithConfigFile:(id)a3 sampleRate:(unint64_t)a4 context:(id)a5 queue:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  OSDAnalyzer *v16;
  uint64_t v17;
  NSDictionary *osdContext;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  uint64_t v21;
  EARCaesuraSilencePosteriorGenerator *caesuraSPG;
  EARCaesuraSilencePosteriorGenerator *v23;
  OSDFeatures *v24;
  OSDFeatures *osdFeatures;
  dispatch_queue_t v26;
  OS_dispatch_queue *lipMovementQueue;
  OSDAnalyzer *v28;
  objc_super v30;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)OSDAnalyzer;
  v16 = -[OSDAnalyzer init](&v30, sel_init);
  if (v16)
  {
    if (SDLogInitIfNeeded_once != -1)
      dispatch_once(&SDLogInitIfNeeded_once, &__block_literal_global);
    objc_storeWeak((id *)&v16->_delegate, v15);
    v17 = objc_msgSend(v13, "copy");
    osdContext = v16->_osdContext;
    v16->_osdContext = (NSDictionary *)v17;

    if (v14)
      v19 = (dispatch_queue_t)v14;
    else
      v19 = dispatch_queue_create("OSD queue", 0);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE2E6D0]), "initWithConfigFile:samplingRate:queue:", v12, a4, v16->_queue);
    caesuraSPG = v16->_caesuraSPG;
    v16->_caesuraSPG = (EARCaesuraSilencePosteriorGenerator *)v21;

    v23 = v16->_caesuraSPG;
    if (!v23)
    {
      v28 = 0;
      goto LABEL_11;
    }
    -[EARCaesuraSilencePosteriorGenerator setDelegate:](v23, "setDelegate:", v16);
    v24 = -[OSDFeatures initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:inferenceTime:]([OSDFeatures alloc], "initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:inferenceTime:", 0, 0.0, 0.0, 0.0, 0.0);
    osdFeatures = v16->_osdFeatures;
    v16->_osdFeatures = v24;

    v26 = dispatch_queue_create("LipMovementVAD queue", 0);
    lipMovementQueue = v16->_lipMovementQueue;
    v16->_lipMovementQueue = (OS_dispatch_queue *)v26;

  }
  v28 = v16;
LABEL_11:

  return v28;
}

- (id)getCurrentOSDFeatures
{
  return self->_osdFeatures;
}

- (int64_t)getFrameDurationMs
{
  return -[EARCaesuraSilencePosteriorGenerator getFrameDurationMs](self->_caesuraSPG, "getFrameDurationMs");
}

- (void)addAudio:(id)a3 numSamples:(unint64_t)a4
{
  -[EARCaesuraSilencePosteriorGenerator addAudio:numSamples:](self->_caesuraSPG, "addAudio:numSamples:", a3, a4);
}

- (void)setupLipMovementVADWithModelPath:(id)a3
{
  id v4;
  NSObject *v5;
  SDLipMovementVAD *v6;
  SDLipMovementVAD *lipMovementVAD;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SDLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[OSDAnalyzer setupLipMovementVADWithModelPath:]";
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_21347E000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating lipmovementvad with model path of: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  v6 = -[SDLipMovementVAD initWithModelFile:]([SDLipMovementVAD alloc], "initWithModelFile:", v4);
  lipMovementVAD = self->_lipMovementVAD;
  self->_lipMovementVAD = v6;

  -[SDLipMovementVAD setDelegate:](self->_lipMovementVAD, "setDelegate:", self);
}

- (void)didUpdateVisualSpeechProbability:(double)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  OSDAnalyzerDelegate **p_delegate;
  id WeakRetained;
  void *v11;
  id v12;
  char v13;
  id v14;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v12 = objc_loadWeakRetained((id *)p_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v14, "osdAnalyzer:didUpdateVisualSpeechProbability:from:to:", self, a4, a5, a3);

    }
  }
}

- (void)addFaceTrackingData:(id)a3 atMachAbsTime:(unint64_t)a4
{
  id v6;
  NSObject *lipMovementQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  lipMovementQueue = self->_lipMovementQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__OSDAnalyzer_addFaceTrackingData_atMachAbsTime___block_invoke;
  block[3] = &unk_24CFD28B0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(lipMovementQueue, block);

}

- (void)endAudio
{
  -[EARCaesuraSilencePosteriorGenerator endAudio](self->_caesuraSPG, "endAudio");
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4;
  OSDFeatures *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  OSDFeatures *v15;
  OSDFeatures *osdFeatures;
  id WeakRetained;
  void *v18;
  id v19;
  char v20;
  id v21;
  double v22;
  unint64_t v23;
  id v24;
  char v25;
  id v26;
  double v27;
  id v28;
  void *v29;
  id v30;
  char v31;
  id v32;

  v4 = a3;
  v5 = [OSDFeatures alloc];
  objc_msgSend(v4, "silenceFramesCountMs");
  v7 = v6;
  objc_msgSend(v4, "silenceProbability");
  v9 = v8;
  objc_msgSend(v4, "silenceDurationMs");
  v11 = v10;
  objc_msgSend(v4, "processedAudioMs");
  v13 = v12;
  v14 = objc_msgSend(v4, "inferenceTime");

  v15 = -[OSDFeatures initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:inferenceTime:](v5, "initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:inferenceTime:", v14, v7, v9, v11, v13);
  osdFeatures = self->_osdFeatures;
  self->_osdFeatures = v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v18 = WeakRetained;
    v19 = objc_loadWeakRetained((id *)&self->_delegate);
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      v21 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v21, "osdAnalyzer:didUpdateOSDFeatures:", self, self->_osdFeatures);

    }
  }
  if (!self->_startOfSpeechDetected)
  {
    -[OSDFeatures silenceProbability](self->_osdFeatures, "silenceProbability");
    if (v22 >= 0.6)
    {
      self->_numConsecutiveNonSilenceFrames = 0;
    }
    else
    {
      v23 = self->_numConsecutiveNonSilenceFrames + 1;
      self->_numConsecutiveNonSilenceFrames = v23;
      if (v23 >= 0xA)
      {
        v24 = objc_loadWeakRetained((id *)&self->_delegate);
        v25 = objc_opt_respondsToSelector();

        if ((v25 & 1) != 0)
        {
          v26 = objc_loadWeakRetained((id *)&self->_delegate);
          -[OSDFeatures processedAudioMs](self->_osdFeatures, "processedAudioMs");
          objc_msgSend(v26, "osdAnalyzer:didDetectStartOfSpeechAt:", self);

        }
        self->_startOfSpeechDetected = 1;
      }
    }
  }
  if (!self->_endOfSpeechDetected && self->_startOfSpeechDetected)
  {
    -[OSDFeatures silenceDurationMs](self->_osdFeatures, "silenceDurationMs");
    if (v27 >= 0.975)
    {
      v28 = objc_loadWeakRetained((id *)&self->_delegate);
      if (v28)
      {
        v29 = v28;
        v30 = objc_loadWeakRetained((id *)&self->_delegate);
        v31 = objc_opt_respondsToSelector();

        if ((v31 & 1) != 0)
        {
          v32 = objc_loadWeakRetained((id *)&self->_delegate);
          -[OSDFeatures processedAudioMs](self->_osdFeatures, "processedAudioMs");
          objc_msgSend(v32, "osdAnalyzer:didDetectEndOfSpeechAt:", self);

        }
      }
      self->_endOfSpeechDetected = 1;
    }
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

- (EARCaesuraSilencePosteriorGenerator)caesuraSPG
{
  return self->_caesuraSPG;
}

- (void)setCaesuraSPG:(id)a3
{
  objc_storeStrong((id *)&self->_caesuraSPG, a3);
}

- (OSDAnalyzerDelegate)delegate
{
  return (OSDAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)osdContext
{
  return self->_osdContext;
}

- (void)setOsdContext:(id)a3
{
  objc_storeStrong((id *)&self->_osdContext, a3);
}

- (OSDFeatures)osdFeatures
{
  return self->_osdFeatures;
}

- (void)setOsdFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_osdFeatures, a3);
}

- (BOOL)endOfSpeechDetected
{
  return self->_endOfSpeechDetected;
}

- (void)setEndOfSpeechDetected:(BOOL)a3
{
  self->_endOfSpeechDetected = a3;
}

- (BOOL)startOfSpeechDetected
{
  return self->_startOfSpeechDetected;
}

- (void)setStartOfSpeechDetected:(BOOL)a3
{
  self->_startOfSpeechDetected = a3;
}

- (OS_dispatch_queue)lipMovementQueue
{
  return self->_lipMovementQueue;
}

- (void)setLipMovementQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lipMovementQueue, a3);
}

- (SDLipMovementVAD)lipMovementVAD
{
  return self->_lipMovementVAD;
}

- (void)setLipMovementVAD:(id)a3
{
  objc_storeStrong((id *)&self->_lipMovementVAD, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lipMovementVAD, 0);
  objc_storeStrong((id *)&self->_lipMovementQueue, 0);
  objc_storeStrong((id *)&self->_osdFeatures, 0);
  objc_storeStrong((id *)&self->_osdContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_caesuraSPG, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __49__OSDAnalyzer_addFaceTrackingData_atMachAbsTime___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 72), "addFaceTrackingData:atMachAbsTime:", a1[5], a1[6]);
}

@end

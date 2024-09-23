@implementation PAStimulus

+ (id)sinStimulus
{
  if (sinStimulus_onceToken != -1)
    dispatch_once(&sinStimulus_onceToken, &__block_literal_global);
  return (id)sinStimulus_SIN;
}

void __25__PAStimulus_sinStimulus__block_invoke()
{
  void *v0;
  PAStimulus *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  paBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("Enrollment_1"), CFSTR("mp3"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v1 = [PAStimulus alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PAStimulus initWithFile:](v1, "initWithFile:", v2);
  v4 = (void *)sinStimulus_SIN;
  sinStimulus_SIN = v3;

  objc_msgSend((id)sinStimulus_SIN, "setLevelMultiplier:", 10.0);
}

+ (id)louderSinStimulus
{
  if (louderSinStimulus_onceToken != -1)
    dispatch_once(&louderSinStimulus_onceToken, &__block_literal_global_5);
  return (id)louderSinStimulus_SIN;
}

void __31__PAStimulus_louderSinStimulus__block_invoke()
{
  void *v0;
  PAStimulus *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  paBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("Enrollment_1+15dB"), CFSTR("mp3"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v1 = [PAStimulus alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PAStimulus initWithFile:](v1, "initWithFile:", v2);
  v4 = (void *)louderSinStimulus_SIN;
  louderSinStimulus_SIN = v3;

  objc_msgSend((id)louderSinStimulus_SIN, "setLevelMultiplier:", 10.0);
}

+ (id)musicStimulus
{
  if (musicStimulus_onceToken != -1)
    dispatch_once(&musicStimulus_onceToken, &__block_literal_global_8);
  return (id)musicStimulus_MUSIC;
}

void __27__PAStimulus_musicStimulus__block_invoke()
{
  void *v0;
  PAStimulus *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  paBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("Enrollment_2"), CFSTR("caf"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v1 = [PAStimulus alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PAStimulus initWithFile:](v1, "initWithFile:", v2);
  v4 = (void *)musicStimulus_MUSIC;
  musicStimulus_MUSIC = v3;

  objc_msgSend((id)musicStimulus_MUSIC, "setRampStep:", 0.3);
}

- (PAStimulus)initWithFile:(id)a3
{
  id v4;
  PAStimulus *v5;
  PAStimulus *v6;
  AXDispatchTimer *v7;
  AXDispatchTimer *timer;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PAStimulus;
  v5 = -[PAStimulus init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PAStimulus setFilePath:](v5, "setFilePath:", v4);
    v7 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x1E0CF3978]);
    timer = v6->_timer;
    v6->_timer = v7;

    *(_OWORD *)&v6->_levelMultiplier = xmmword_1DE3D1050;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_audioSessionWasInterrupted_, *MEMORY[0x1E0C896F0], 0);

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "filePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAStimulus filePath](self, "filePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)audioSessionWasInterrupted:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0C89718]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 == 1)
    -[PAStimulus stop](self, "stop");
}

- (void)calculateFFTForBuffer:(id)a3
{
  id v4;
  void *v5;
  void (**stimulusMagnitudesCallback)(id, void *);
  void *v7;
  void *v8;

  v4 = a3;
  -[PAStimulus levelMultiplier](self, "levelMultiplier");
  objc_msgSend(v4, "magnitudesWithLevelMultiplier:count:", self->_bucketCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  if ((unint64_t)objc_msgSend(v8, "count") >= 3)
    objc_msgSend(v8, "removeObjectsInRange:", 0, 2);
  stimulusMagnitudesCallback = (void (**)(id, void *))self->_stimulusMagnitudesCallback;
  v7 = v8;
  if (stimulusMagnitudesCallback)
  {
    stimulusMagnitudesCallback[2](stimulusMagnitudesCallback, v8);
    v7 = v8;
  }

}

- (void)play
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DE3BE000, a2, OS_LOG_TYPE_ERROR, "Error starting PAStimulus: %@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)isPlaying
{
  void *v3;
  BOOL v4;

  -[PAStimulus audioPlayerNode](self, "audioPlayerNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPlaying"))
    v4 = !self->_ramping;
  else
    v4 = 0;

  return v4;
}

- (void)rampVolumeUp:(BOOL)a3
{
  AXDispatchTimer *timer;
  double rampStep;
  _QWORD v5[5];
  BOOL v6;

  timer = self->_timer;
  rampStep = self->_rampStep;
  if (!a3)
    rampStep = rampStep * 0.5;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__PAStimulus_rampVolumeUp___block_invoke;
  v5[3] = &unk_1EA902140;
  v5[4] = self;
  v6 = a3;
  -[AXDispatchTimer afterDelay:processBlock:](timer, "afterDelay:processBlock:", v5, rampStep);
}

void __27__PAStimulus_rampVolumeUp___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;
  _BYTE *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "audioPlayerNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  v5 = dbl_1DE3D1060[*(_BYTE *)(a1 + 40) == 0] + v4;
  objc_msgSend(*(id *)(a1 + 32), "audioPlayerNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = v5;
  objc_msgSend(v6, "setVolume:", v7);

  v8 = v5 >= 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v8 = v5 <= 0.0;
  v9 = *(_BYTE **)(a1 + 32);
  if (v8)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v9[24] = 0;
    }
    else
    {
      objc_msgSend(v9, "unregisterListener");
      objc_msgSend(*(id *)(a1 + 32), "audioPlayerNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stop");

      objc_msgSend(*(id *)(a1 + 32), "engine");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stop");

    }
  }
  else
  {
    objc_msgSend(v9, "rampVolumeUp:", *(unsigned __int8 *)(a1 + 40) != 0);
  }
}

- (void)stop
{
  -[AXDispatchTimer cancel](self->_timer, "cancel");
  -[PAStimulus rampVolumeUp:](self, "rampVolumeUp:", 0);
}

- (void)registerListener:(id)a3 forBucketCount:(unint64_t)a4
{
  id v6;
  void *v7;
  id stimulusMagnitudesCallback;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "copy");
  stimulusMagnitudesCallback = self->_stimulusMagnitudesCallback;
  self->_stimulusMagnitudesCallback = v7;

  self->_bucketCount = a4 + 2;
  objc_initWeak(&location, self);
  -[PAStimulus engine](self, "engine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainMixerNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeTapOnBus:", 0);

  -[PAStimulus engine](self, "engine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mainMixerNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAStimulus engine](self, "engine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mainMixerNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "outputFormatForBus:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__PAStimulus_registerListener_forBucketCount___block_invoke;
  v16[3] = &unk_1EA902168;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v12, "installTapOnBus:bufferSize:format:block:", 0, 1024, v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __46__PAStimulus_registerListener_forBucketCount___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "calculateFFTForBuffer:", v3);

}

- (void)unregisterListener
{
  void *v2;
  id v3;

  -[PAStimulus engine](self, "engine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainMixerNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeTapOnBus:", 0);

}

- (AVAudioEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (AVAudioPlayerNode)audioPlayerNode
{
  return self->_audioPlayerNode;
}

- (void)setAudioPlayerNode:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayerNode, a3);
}

- (AVAudioFile)audioFile
{
  return self->_audioFile;
}

- (void)setAudioFile:(id)a3
{
  objc_storeStrong((id *)&self->_audioFile, a3);
}

- (AVAudioPCMBuffer)audioPCMBuffer
{
  return self->_audioPCMBuffer;
}

- (void)setAudioPCMBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPCMBuffer, a3);
}

- (AXDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (double)levelMultiplier
{
  return self->_levelMultiplier;
}

- (void)setLevelMultiplier:(double)a3
{
  self->_levelMultiplier = a3;
}

- (double)rampStep
{
  return self->_rampStep;
}

- (void)setRampStep:(double)a3
{
  self->_rampStep = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_audioPCMBuffer, 0);
  objc_storeStrong((id *)&self->_audioFile, 0);
  objc_storeStrong((id *)&self->_audioPlayerNode, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong(&self->_stimulusMagnitudesCallback, 0);
}

@end

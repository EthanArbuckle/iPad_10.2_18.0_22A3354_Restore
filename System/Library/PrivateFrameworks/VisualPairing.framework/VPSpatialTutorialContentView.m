@implementation VPSpatialTutorialContentView

- (VPSpatialTutorialContentView)initWithFrame:(CGRect)a3 mode:(int)a4
{
  VPSpatialTutorialContentView *v5;
  VPSpatialTutorialContentView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VPSpatialTutorialContentView;
  v5 = -[VPSpatialTutorialContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_mode = a4;
    v5->_playersPlaying = 0;
    v5->_playersStartTriggered = 0;
    v5->_spatialStatus = 0;
    v5->_stereoStatus = 0;
    -[VPSpatialTutorialContentView initPlayerStereo](v5, "initPlayerStereo");
    -[VPSpatialTutorialContentView initPlayerSpatial](v6, "initPlayerSpatial");
    -[VPSpatialTutorialContentView updatePlayersValuesBasedOnMode](v6, "updatePlayersValuesBasedOnMode");
  }
  return v6;
}

- (VPSpatialTutorialContentView)initWithMode:(int)a3
{
  return -[VPSpatialTutorialContentView initWithFrame:mode:](self, "initWithFrame:mode:", *(_QWORD *)&a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (VPSpatialTutorialContentView)initWithFrame:(CGRect)a3
{
  return -[VPSpatialTutorialContentView initWithFrame:mode:](self, "initWithFrame:mode:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (VPSpatialTutorialContentView)initWithCoder:(id)a3
{
  return -[VPSpatialTutorialContentView initWithFrame:mode:](self, "initWithFrame:mode:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)layoutSublayersOfLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VPSpatialTutorialContentView;
  -[VPSpatialTutorialContentView layoutSublayersOfLayer:](&v4, sel_layoutSublayersOfLayer_, a3);
  -[VPSpatialTutorialContentView bounds](self, "bounds");
  -[AVPlayerLayer setFrame:](self->_playerLayerStereo, "setFrame:");
  -[VPSpatialTutorialContentView bounds](self, "bounds");
  -[AVPlayerLayer setFrame:](self->_playerLayerSpatial, "setFrame:");
}

- (void)dealloc
{
  objc_super v3;

  -[AVPlayerLooper removeObserver:forKeyPath:context:](self->_looperStereo, "removeObserver:forKeyPath:context:", self, CFSTR("status"));
  -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_playerStereo, "removeObserver:forKeyPath:context:", self, CFSTR("status"));
  -[AVPlayerLooper removeObserver:forKeyPath:context:](self->_looperSpatial, "removeObserver:forKeyPath:context:", self, CFSTR("status"));
  -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_playerSpatial, "removeObserver:forKeyPath:context:", self, CFSTR("status"));
  v3.receiver = self;
  v3.super_class = (Class)VPSpatialTutorialContentView;
  -[VPSpatialTutorialContentView dealloc](&v3, sel_dealloc);
}

- (void)initPlayerStereo
{
  void *v3;
  void *v4;
  void *v5;
  AVPlayerItem *v6;
  AVPlayerItem *playerItemStereo;
  AVQueuePlayer *v8;
  AVQueuePlayer *playerStereo;
  void *v10;
  AVQueuePlayer *v11;
  AVPlayerItem *v12;
  AVPlayerLooper *v13;
  AVPlayerLooper *looperStereo;
  AVPlayerLayer *v15;
  AVPlayerLayer *playerLayerStereo;
  void *v17;
  CMTime v18;
  CMTime duration;
  CMTimeRange v20;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("StereoAudioLoop"), CFSTR("mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithURL:", v5);
  v6 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
  playerItemStereo = self->_playerItemStereo;
  self->_playerItemStereo = v6;

  -[AVPlayerItem setAllowedAudioSpatializationFormats:](self->_playerItemStereo, "setAllowedAudioSpatializationFormats:", 0);
  v8 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x24BDB2670]);
  playerStereo = self->_playerStereo;
  self->_playerStereo = v8;

  -[AVQueuePlayer setAutomaticallyWaitsToMinimizeStalling:](self->_playerStereo, "setAutomaticallyWaitsToMinimizeStalling:", 0);
  v10 = (void *)MEMORY[0x24BDB2650];
  v11 = self->_playerStereo;
  v12 = self->_playerItemStereo;
  CMTimeMake(&duration, 14000, 1000);
  v18 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  CMTimeRangeMake(&v20, &v18, &duration);
  objc_msgSend(v10, "playerLooperWithPlayer:templateItem:timeRange:", v11, v12, &v20);
  v13 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
  looperStereo = self->_looperStereo;
  self->_looperStereo = v13;

  -[AVPlayerLooper addObserver:forKeyPath:options:context:](self->_looperStereo, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 5, &self->_looperStereo);
  -[AVQueuePlayer addObserver:forKeyPath:options:context:](self->_playerStereo, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 5, &self->_playerStereo);
  objc_msgSend(MEMORY[0x24BDB2648], "playerLayerWithPlayer:", self->_playerStereo);
  v15 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue();
  playerLayerStereo = self->_playerLayerStereo;
  self->_playerLayerStereo = v15;

  -[VPSpatialTutorialContentView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", self->_playerLayerStereo);

}

- (void)initPlayerSpatial
{
  void *v3;
  void *v4;
  void *v5;
  AVPlayerItem *v6;
  AVPlayerItem *playerItemSpatial;
  AVQueuePlayer *v8;
  AVQueuePlayer *playerSpatial;
  void *v10;
  AVQueuePlayer *v11;
  AVPlayerItem *v12;
  AVPlayerLooper *v13;
  AVPlayerLooper *looperSpatial;
  AVPlayerLayer *v15;
  AVPlayerLayer *playerLayerSpatial;
  void *v17;
  CMTime v18;
  CMTime duration;
  CMTimeRange v20;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("SpatialAudioLoop"), CFSTR("mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithURL:", v5);
  v6 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
  playerItemSpatial = self->_playerItemSpatial;
  self->_playerItemSpatial = v6;

  v8 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x24BDB2670]);
  playerSpatial = self->_playerSpatial;
  self->_playerSpatial = v8;

  -[AVQueuePlayer setAutomaticallyWaitsToMinimizeStalling:](self->_playerSpatial, "setAutomaticallyWaitsToMinimizeStalling:", 0);
  v10 = (void *)MEMORY[0x24BDB2650];
  v11 = self->_playerSpatial;
  v12 = self->_playerItemSpatial;
  CMTimeMake(&duration, 14000, 1000);
  v18 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  CMTimeRangeMake(&v20, &v18, &duration);
  objc_msgSend(v10, "playerLooperWithPlayer:templateItem:timeRange:", v11, v12, &v20);
  v13 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
  looperSpatial = self->_looperSpatial;
  self->_looperSpatial = v13;

  -[AVPlayerLooper addObserver:forKeyPath:options:context:](self->_looperSpatial, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 5, &self->_looperSpatial);
  -[AVQueuePlayer addObserver:forKeyPath:options:context:](self->_playerSpatial, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 5, &self->_playerSpatial);
  objc_msgSend(MEMORY[0x24BDB2648], "playerLayerWithPlayer:", self->_playerSpatial);
  v15 = (AVPlayerLayer *)objc_claimAutoreleasedReturnValue();
  playerLayerSpatial = self->_playerLayerSpatial;
  self->_playerLayerSpatial = v15;

  -[VPSpatialTutorialContentView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", self->_playerLayerSpatial);

}

- (void)startPlayers
{
  double v3;

  self->_playersStartTriggered = 1;
  if (self->_stereoStatus.looperReady
    && self->_stereoStatus.playerReady
    && self->_spatialStatus.looperReady
    && self->_spatialStatus.playerReady)
  {
    -[VPSpatialTutorialContentView updatePlayersValuesBasedOnMode](self, "updatePlayersValuesBasedOnMode");
    LODWORD(v3) = 1.0;
    -[VPSpatialTutorialContentView syncPlayersWithRate:](self, "syncPlayersWithRate:", v3);
  }
  else if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)stopPlayers
{
  double v2;

  self->_playersStartTriggered = 0;
  if (self->_playersPlaying)
  {
    LODWORD(v2) = 0;
    -[VPSpatialTutorialContentView syncPlayersWithRate:](self, "syncPlayersWithRate:", v2);
  }
  else if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)syncPlayersWithRate:(float)a3
{
  OpaqueCMClock *HostTimeClock;
  AVQueuePlayer *playerStereo;
  AVQueuePlayer *v7;
  CMTimeEpoch epoch;
  AVQueuePlayer *v9;
  AVQueuePlayer *playerSpatial;
  Float64 Seconds;
  double v12;
  CMTime v13;
  CMTime time;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CMTime lhs;
  CMTime rhs;
  CMTime v20;
  CMTime v21;

  memset(&v21, 0, sizeof(v21));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v21, HostTimeClock);
  memset(&v20, 0, sizeof(v20));
  CMTimeMakeWithSeconds(&rhs, 0.1, 1000);
  lhs = v21;
  CMTimeAdd(&v20, &lhs, &rhs);
  playerStereo = self->_playerStereo;
  if (playerStereo)
  {
    -[AVQueuePlayer currentTime](playerStereo, "currentTime");
    if ((v16 & 0x100000000) != 0)
    {
      v7 = self->_playerStereo;
      if (v7)
        -[AVQueuePlayer currentTime](v7, "currentTime");
      else
        memset(&time, 0, sizeof(time));
      *(_OWORD *)&lhs.value = *(_OWORD *)&time.value;
      epoch = time.epoch;
      goto LABEL_9;
    }
  }
  else
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  *(_OWORD *)&lhs.value = *MEMORY[0x24BDC0D88];
  epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
LABEL_9:
  lhs.epoch = epoch;
  if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
  {
    time = lhs;
    Seconds = CMTimeGetSeconds(&time);
    v12 = a3;
    LogPrintF();
  }
  v9 = self->_playerStereo;
  time = lhs;
  v13 = v20;
  -[AVQueuePlayer setRate:time:atHostTime:](v9, "setRate:time:atHostTime:", &time, &v13, COERCE_DOUBLE(__PAIR64__(HIDWORD(v20.value), LODWORD(a3))), *(_QWORD *)&Seconds, *(_QWORD *)&v12);
  playerSpatial = self->_playerSpatial;
  time = lhs;
  v13 = v20;
  -[AVQueuePlayer setRate:time:atHostTime:](playerSpatial, "setRate:time:atHostTime:", &time, &v13, COERCE_DOUBLE(__PAIR64__(HIDWORD(v20.value), LODWORD(a3))));
  self->_playersPlaying = a3 == 1.0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  void *v13;

  v8 = a5;
  CUMainQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__VPSpatialTutorialContentView_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_24E04D0B8;
  v12 = v8;
  v13 = a6;
  block[4] = self;
  v10 = v8;
  dispatch_async(v9, block);

}

_BYTE *__79__VPSpatialTutorialContentView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int *v12;
  _BYTE *result;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 == v3 + 424 || v2 == v3 + 432)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(v4, "integerValue");
    else
      v5 = 0;
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    if (v6 == v7 + 424)
    {
      if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
        LogPrintF();
      if (v5 != 1)
        goto LABEL_46;
      v11 = &OBJC_IVAR___VPSpatialTutorialContentView__stereoStatus;
    }
    else
    {
      if (v6 != v7 + 432)
        goto LABEL_46;
      if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
        LogPrintF();
      if (v5 != 1)
        goto LABEL_46;
      v11 = &OBJC_IVAR___VPSpatialTutorialContentView__spatialStatus;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + *v11) = 1;
    goto LABEL_46;
  }
  if (v2 == v3 + 440 || v2 == v3 + 448)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = objc_msgSend(v4, "integerValue");
    else
      v8 = 0;
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    if (v9 == v10 + 440)
    {
      if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
        LogPrintF();
      if (v8 != 1)
        goto LABEL_46;
      v12 = &OBJC_IVAR___VPSpatialTutorialContentView__stereoStatus;
    }
    else
    {
      if (v9 != v10 + 448)
        goto LABEL_46;
      if (gLogCategory_STCV <= 50 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
        LogPrintF();
      if (v8 != 1)
        goto LABEL_46;
      v12 = &OBJC_IVAR___VPSpatialTutorialContentView__spatialStatus;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + *v12 + 1) = 1;
LABEL_46:

    goto LABEL_47;
  }
  if (gLogCategory_STCV <= 90 && (gLogCategory_STCV != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_47:
  result = *(_BYTE **)(a1 + 32);
  if (result[489])
    return (_BYTE *)objc_msgSend(result, "startPlayers");
  return result;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
  -[VPSpatialTutorialContentView updatePlayersValuesBasedOnMode](self, "updatePlayersValuesBasedOnMode");
}

- (void)updatePlayersValuesBasedOnMode
{
  int *v3;
  int mode;
  int *v5;
  int *v6;
  int *v7;
  double v8;
  double v9;

  v3 = &OBJC_IVAR___VPSpatialTutorialContentView__playerLayerStereo;
  mode = self->_mode;
  if (mode)
  {
    if (mode != 1)
      return;
    v5 = &OBJC_IVAR___VPSpatialTutorialContentView__playerLayerStereo;
    v6 = &OBJC_IVAR___VPSpatialTutorialContentView__playerStereo;
    v7 = &OBJC_IVAR___VPSpatialTutorialContentView__playerSpatial;
    v3 = &OBJC_IVAR___VPSpatialTutorialContentView__playerLayerSpatial;
  }
  else
  {
    v6 = &OBJC_IVAR___VPSpatialTutorialContentView__playerSpatial;
    v7 = &OBJC_IVAR___VPSpatialTutorialContentView__playerStereo;
    v5 = &OBJC_IVAR___VPSpatialTutorialContentView__playerLayerSpatial;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v3), "setHidden:", 0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "setHidden:", 1);
  LODWORD(v8) = 1.0;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "setVolume:", v8);
  LODWORD(v9) = 0;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "setVolume:", v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLayerSpatial, 0);
  objc_storeStrong((id *)&self->_playerLayerStereo, 0);
  objc_storeStrong((id *)&self->_playerItemSpatial, 0);
  objc_storeStrong((id *)&self->_playerItemStereo, 0);
  objc_storeStrong((id *)&self->_looperSpatial, 0);
  objc_storeStrong((id *)&self->_looperStereo, 0);
  objc_storeStrong((id *)&self->_playerSpatial, 0);
  objc_storeStrong((id *)&self->_playerStereo, 0);
}

@end

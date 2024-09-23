@implementation AudioDevice

- (id)initInputDeviceWithCtx:(id)a3
{
  id v4;
  AudioDevice *v5;
  AudioDevice *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AudioDevice;
  v5 = -[AudioDevice init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_ctx, v4);
    v6->_isInput = 1;
    -[AudioDevice initAudioPropertyHandler](v6, "initAudioPropertyHandler");
  }

  return v6;
}

- (id)initOutputDeviceWithCtx:(id)a3
{
  id v4;
  AudioDevice *v5;
  AudioDevice *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AudioDevice;
  v5 = -[AudioDevice init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_ctx, v4);
    v6->_isInput = 0;
    -[AudioDevice initAudioPropertyHandler](v6, "initAudioPropertyHandler");
  }

  return v6;
}

- (void)initAudioPropertyHandler
{
  void *v3;
  id audioPropertyHandlerBlock;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AudioDevice_initAudioPropertyHandler__block_invoke;
  v5[3] = &unk_1E857D048;
  objc_copyWeak(&v6, &location);
  v3 = _Block_copy(v5);
  audioPropertyHandlerBlock = self->_audioPropertyHandlerBlock;
  self->_audioPropertyHandlerBlock = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__AudioDevice_initAudioPropertyHandler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "handleAudioDevicePropertyChange:addresses:", a2, a3);
    WeakRetained = v6;
  }

}

- (void)flushAndUpdateDeviceInfoWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  id WeakRetained;
  NSDate *v6;
  NSDate *lastUpdateTime;
  NSDate *v8;
  NSDate *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  AudioDevice *v14;

  v4 = (void (**)(_QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_ctx);
  if (WeakRetained)
  {
    if (self->_isDirty)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastUpdateTime = self->_lastUpdateTime;
      self->_lastUpdateTime = v6;

      if (v4)
        v4[2](v4);
    }
    else
    {
      if (v4)
        v4[2](v4);
      self->_isDirty = 1;
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v9 = self->_lastUpdateTime;
      self->_lastUpdateTime = v8;

      v10 = dispatch_time(0, 10000000000);
      objc_msgSend(WeakRetained, "workQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __49__AudioDevice_flushAndUpdateDeviceInfoWithBlock___block_invoke;
      v12[3] = &unk_1E85791E0;
      v13 = WeakRetained;
      v14 = self;
      dispatch_after(v10, v11, v12);

    }
  }

}

uint64_t __49__AudioDevice_flushAndUpdateDeviceInfoWithBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAudioDevice:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "setIsDirty:", 0);
}

- (BOOL)getAudioDeviceIsRunningSomewhere
{
  return 0;
}

- (float)getAudioDeviceVolume
{
  return 0.0;
}

- (BOOL)getAudioDeviceIsMute
{
  return 0;
}

- (unsigned)getAudioDeviceTransportType
{
  return 0;
}

- (unsigned)getAudioDeviceSource
{
  return 0;
}

- (void)cleanAndUpdateDeviceInfo
{
  id WeakRetained;
  id v4;

  -[AudioDevice removeAudioDeviceListener](self, "removeAudioDeviceListener");
  if (-[AudioDevice updateDefaultAudioDeviceInfo](self, "updateDefaultAudioDeviceInfo"))
  {
    -[AudioDevice addAudioDeviceListener](self, "addAudioDeviceListener");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_ctx);
    if (WeakRetained)
    {
      v4 = WeakRetained;
      if (self->_isInput)
        objc_msgSend(WeakRetained, "setDefaultInputDevice:", 0);
      else
        objc_msgSend(WeakRetained, "setDefaultOutputDevice:", 0);
      WeakRetained = v4;
    }

  }
}

- (BOOL)updateDefaultAudioDeviceInfo
{
  return 1;
}

- (PLAudioAgent)ctx
{
  return (PLAudioAgent *)objc_loadWeakRetained((id *)&self->_ctx);
}

- (void)setCtx:(id)a3
{
  objc_storeWeak((id *)&self->_ctx, a3);
}

- (unsigned)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(unsigned int)a3
{
  self->_deviceID = a3;
}

- (unsigned)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(unsigned int)a3
{
  self->_sourceID = a3;
}

- (unsigned)transType
{
  return self->_transType;
}

- (void)setTransType:(unsigned int)a3
{
  self->_transType = a3;
}

- (BOOL)isInput
{
  return self->_isInput;
}

- (void)setIsInput:(BOOL)a3
{
  self->_isInput = a3;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (id)audioPropertyHandlerBlock
{
  return self->_audioPropertyHandlerBlock;
}

- (void)setAudioPropertyHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (NSDate)lastUpdateTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastUpdateTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong(&self->_audioPropertyHandlerBlock, 0);
  objc_destroyWeak((id *)&self->_ctx);
}

@end

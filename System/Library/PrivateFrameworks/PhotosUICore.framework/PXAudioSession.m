@implementation PXAudioSession

- (PXAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  char *v16;
  PXAudioSession *v17;
  int64_t var3;
  uint64_t v19;
  PXUpdater *updater;
  objc_super v22;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PXAudioSession;
  v16 = -[PXAudioSession init](&v22, sel_init);
  v17 = (PXAudioSession *)v16;
  if (v16)
  {
    var3 = a5->var3;
    *(_OWORD *)(v16 + 200) = *(_OWORD *)&a5->var0;
    *((_QWORD *)v16 + 27) = var3;
    objc_storeStrong((id *)v16 + 21, a3);
    v17->_desiredPlayerVolume = a4;
    v17->_volume = a4;
    objc_storeStrong((id *)&v17->_queue, a6);
    v19 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v17);
    updater = v17->_updater;
    v17->_updater = (PXUpdater *)v19;

    -[PXUpdater addUpdateSelector:](v17->_updater, "addUpdateSelector:", sel__updateDesiredPlayerVolume);
    objc_storeWeak((id *)&v17->_audioSessionDelegate, v15);
  }

  return v17;
}

- (PXAudioSession)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioSession.m"), 44, CFSTR("%s is not available as initializer"), "-[PXAudioSession init]");

  abort();
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXAudioSession status](self, "status") - 1;
  if (v6 > 3)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E5134238[v6];
  -[PXAudioSession asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; status: %@; asset: %@>"), v5, self, v7, v8);

  return (NSString *)v9;
}

- (void)performInternalChanges:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXAudioSession_performInternalChanges___block_invoke;
  block[3] = &unk_1E5146480;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXAudioSession.m"), 77, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAudioSession currentTime]", v7);

  abort();
}

- (void)prepareToPlay
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioSession.m"), 93, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAudioSession prepareToPlay]", v6);

  abort();
}

- (void)pause
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioSession.m"), 97, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAudioSession pause]", v6);

  abort();
}

- (void)play
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioSession.m"), 101, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAudioSession play]", v6);

  abort();
}

- (void)playFromTime:(id *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioSession.m"), 105, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAudioSession playFromTime:]", v7);

  abort();
}

- (void)setVolume:(float)a3
{
  if (self->_volume != a3)
  {
    self->_volume = a3;
    -[PXAudioSession _invalidateDesiredPlayerVolume](self, "_invalidateDesiredPlayerVolume");
  }
}

- (void)setTargetLoudnessInLKFS:(float)a3
{
  if (self->_targetLoudnessInLKFS != a3)
  {
    self->_targetLoudnessInLKFS = a3;
    -[PXAudioSession _invalidateDesiredPlayerVolume](self, "_invalidateDesiredPlayerVolume");
  }
}

- (void)setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    -[PXAudioSession signalChange:](self, "signalChange:", 2);
  }
}

- (void)setError:(id)a3
{
  NSError *v5;
  NSError *v6;

  v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    -[PXAudioSession errorDidChange](self, "errorDidChange");
    -[PXAudioSession signalChange:](self, "signalChange:", 4);
    v5 = v6;
  }

}

- (void)setDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_duration;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 duration;
  CMTime time1;

  p_duration = &self->_duration;
  time1 = *(CMTime *)a3;
  duration = self->_duration;
  if (CMTimeCompare(&time1, (CMTime *)&duration))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_duration->epoch = a3->var3;
    *(_OWORD *)&p_duration->value = v6;
    -[PXAudioSession signalChange:](self, "signalChange:", 1);
  }
}

- (void)setIsReadyToPlay:(BOOL)a3
{
  if (self->_isReadyToPlay != a3)
  {
    self->_isReadyToPlay = a3;
    -[PXAudioSession signalChange:](self, "signalChange:", 8);
  }
}

- (void)setContentPeakDecibels:(id)a3
{
  NSNumber *v5;
  char v6;
  NSNumber *v7;

  v7 = (NSNumber *)a3;
  v5 = self->_contentPeakDecibels;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSNumber isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_contentPeakDecibels, a3);
      -[PXAudioSession _invalidateDesiredPlayerVolume](self, "_invalidateDesiredPlayerVolume");
    }
  }

}

- (void)setContentLoudnessInLKFS:(id)a3
{
  NSNumber *v5;
  char v6;
  NSNumber *v7;

  v7 = (NSNumber *)a3;
  v5 = self->_contentLoudnessInLKFS;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSNumber isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_contentLoudnessInLKFS, a3);
      -[PXAudioSession _invalidateDesiredPlayerVolume](self, "_invalidateDesiredPlayerVolume");
    }
  }

}

- (void)setDesiredPlayerVolume:(float)a3
{
  if (self->_desiredPlayerVolume != a3)
  {
    self->_desiredPlayerVolume = a3;
    -[PXAudioSession desiredPlayerVolumeDidChange](self, "desiredPlayerVolumeDidChange");
  }
}

- (void)_invalidateDesiredPlayerVolume
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateDesiredPlayerVolume);
}

- (void)_updateDesiredPlayerVolume
{
  float v3;
  float v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;

  -[PXAudioSession volume](self, "volume");
  v4 = v3;
  -[PXAudioSession contentPeakDecibels](self, "contentPeakDecibels");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = (void *)v5;
    -[PXAudioSession contentLoudnessInLKFS](self, "contentLoudnessInLKFS");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PXAudioSession targetLoudnessInLKFS](self, "targetLoudnessInLKFS");
      v10 = v9;
      -[PXAudioSession contentLoudnessInLKFS](self, "contentLoudnessInLKFS");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v13 = v12;

      -[PXAudioSession contentPeakDecibels](self, "contentPeakDecibels");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");

      if (v10 != 0.0 && v13 != 0.0)
      {
        PXVolumeGainForTargetLoudness(v10, v13);
        v4 = v4 * *(float *)&v6;
      }
    }
  }
  *(float *)&v6 = v4;
  -[PXAudioSession setDesiredPlayerVolume:](self, "setDesiredPlayerVolume:", v6);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAudioSession;
  -[PXAudioSession performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAudioSession;
  -[PXAudioSession didPerformChanges](&v3, sel_didPerformChanges);
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
}

- (NSError)error
{
  return self->_error;
}

- (float)volume
{
  return self->_volume;
}

- (float)targetLoudnessInLKFS
{
  return self->_targetLoudnessInLKFS;
}

- (NSNumber)contentPeakDecibels
{
  return self->_contentPeakDecibels;
}

- (NSNumber)contentLoudnessInLKFS
{
  return self->_contentLoudnessInLKFS;
}

- (int64_t)status
{
  return self->_status;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (BOOL)isReadyToPlay
{
  return self->_isReadyToPlay;
}

- (PXAudioSessionAVAudioSessionDelegate)audioSessionDelegate
{
  return (PXAudioSessionAVAudioSessionDelegate *)objc_loadWeakRetained((id *)&self->_audioSessionDelegate);
}

- (void)setAudioSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audioSessionDelegate, a3);
}

- (PXAudioAsset)asset
{
  return self->_asset;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (float)desiredPlayerVolume
{
  return self->_desiredPlayerVolume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_audioSessionDelegate);
  objc_storeStrong((id *)&self->_contentLoudnessInLKFS, 0);
  objc_storeStrong((id *)&self->_contentPeakDecibels, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __41__PXAudioSession_performInternalChanges___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "performChanges:", *(_QWORD *)(a1 + 32));

}

@end

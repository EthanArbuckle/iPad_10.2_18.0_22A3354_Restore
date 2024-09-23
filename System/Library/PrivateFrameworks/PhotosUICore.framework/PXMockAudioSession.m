@implementation PXMockAudioSession

- (PXMockAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  PXMockAudioSession *result;
  int64_t var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXMockAudioSession;
  v10 = *a5;
  result = -[PXAudioSession initWithAsset:volume:startTime:queue:audioSessionDelegate:](&v11, sel_initWithAsset_volume_startTime_queue_audioSessionDelegate_, a3, &v10, a6, 0);
  if (result)
  {
    var3 = a5->var3;
    *(_OWORD *)&result->_currentTime.value = *(_OWORD *)&a5->var0;
    result->_currentTime.epoch = var3;
  }
  return result;
}

- (void)prepareToPlay
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[PXAudioSession performInternalChanges:](self, "performInternalChanges:", &__block_literal_global_185896);
  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PXMockAudioSession_prepareToPlay__block_invoke_2;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

- (void)pause
{
  -[PXMockAudioSession _invalidateCurrentTimeUpdateTimer](self, "_invalidateCurrentTimeUpdateTimer");
  -[PXAudioSession performInternalChanges:](self, "performInternalChanges:", &__block_literal_global_3_185895);
}

- (void)play
{
  -[PXAudioSession performInternalChanges:](self, "performInternalChanges:", &__block_literal_global_4_185894);
  -[PXMockAudioSession _startCurrentTimeUpdateTimer](self, "_startCurrentTimeUpdateTimer");
}

- (void)playFromTime:(id *)a3
{
  int64_t var3;

  -[PXAudioSession performInternalChanges:](self, "performInternalChanges:", &__block_literal_global_5_185893);
  var3 = a3->var3;
  *(_OWORD *)&self->_currentTime.value = *(_OWORD *)&a3->var0;
  self->_currentTime.epoch = var3;
  -[PXMockAudioSession _startCurrentTimeUpdateTimer](self, "_startCurrentTimeUpdateTimer");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 232);
  return self;
}

- (void)_startCurrentTimeUpdateTimer
{
  NSTimer *v3;
  NSTimer *currentTimeUpdateTimer;

  -[PXMockAudioSession _invalidateCurrentTimeUpdateTimer](self, "_invalidateCurrentTimeUpdateTimer");
  objc_msgSend(MEMORY[0x1E0C99E88], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__handleCurrentTimeUpdateTimer_, 0, 1, 0.1);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  currentTimeUpdateTimer = self->_currentTimeUpdateTimer;
  self->_currentTimeUpdateTimer = v3;

}

- (void)_invalidateCurrentTimeUpdateTimer
{
  NSTimer *currentTimeUpdateTimer;
  NSTimer *v4;

  currentTimeUpdateTimer = self->_currentTimeUpdateTimer;
  if (currentTimeUpdateTimer)
  {
    -[NSTimer invalidate](currentTimeUpdateTimer, "invalidate");
    v4 = self->_currentTimeUpdateTimer;
    self->_currentTimeUpdateTimer = 0;

  }
}

- (void)_handleCurrentTimeUpdateTimer:(id)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_currentTime;
  CMTime v4;
  CMTime rhs;
  CMTime v6;

  p_currentTime = &self->_currentTime;
  CMTimeMake(&rhs, 1, 10);
  v4 = *(CMTime *)p_currentTime;
  CMTimeAdd(&v6, &v4, &rhs);
  *(CMTime *)p_currentTime = v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimeUpdateTimer, 0);
}

uint64_t __35__PXMockAudioSession_playFromTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatus:", 3);
}

uint64_t __26__PXMockAudioSession_play__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatus:", 3);
}

uint64_t __27__PXMockAudioSession_pause__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatus:", 2);
}

uint64_t __35__PXMockAudioSession_prepareToPlay__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performInternalChanges:", &__block_literal_global_1_185897);
}

void __35__PXMockAudioSession_prepareToPlay__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsReadyToPlay:", 1);
  objc_msgSend(v2, "setStatus:", 2);

}

uint64_t __35__PXMockAudioSession_prepareToPlay__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatus:", 1);
}

@end

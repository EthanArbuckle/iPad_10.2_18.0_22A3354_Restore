@implementation PXSimpleWrappedVideoScrubberControllerTarget

- (PXSimpleWrappedVideoScrubberControllerTarget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoScrubberController.m"), 552, CFSTR("%s is not available as initializer"), "-[PXSimpleWrappedVideoScrubberControllerTarget init]");

  abort();
}

- (PXSimpleWrappedVideoScrubberControllerTarget)initWithVideoPlayer:(id)a3
{
  id v5;
  PXSimpleWrappedVideoScrubberControllerTarget *v6;
  PXSimpleWrappedVideoScrubberControllerTarget *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSimpleWrappedVideoScrubberControllerTarget;
  v6 = -[PXSimpleWrappedVideoScrubberControllerTarget init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_videoPlayer, a3);
    objc_msgSend(v5, "registerChangeObserver:context:", v7, wrappedPlayerObservationContext);
  }

  return v7;
}

- (float)playRate
{
  float result;

  -[ISWrappedAVPlayer rate](self->_videoPlayer, "rate");
  return result;
}

- (id)playerItem
{
  return (id)-[ISWrappedAVPlayer currentItem](self->_videoPlayer, "currentItem");
}

- (int64_t)playerStatus
{
  return -[ISWrappedAVPlayer status](self->_videoPlayer, "status");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playerCurrentTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_videoPlayer;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE currentTime](result, "currentTime");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[ISWrappedAVPlayer currentItem](self->_videoPlayer, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "duration");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void)removeTimeObserver:(id)a3
{
  -[ISWrappedAVPlayer removeTimeObserver:](self->_videoPlayer, "removeTimeObserver:", a3);
}

- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5
{
  ISWrappedAVPlayer *videoPlayer;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  videoPlayer = self->_videoPlayer;
  v7 = *a3;
  -[ISWrappedAVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](videoPlayer, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v7, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)videoScrubberController:(id)a3 seekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7
{
  ISWrappedAVPlayer *videoPlayer;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  videoPlayer = self->_videoPlayer;
  v10 = *a4;
  v9 = *a5;
  v8 = *a6;
  -[ISWrappedAVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](videoPlayer, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v10, &v9, &v8, a7);
}

- (void)cancelPendingSeeks
{
  -[ISWrappedAVPlayer cancelPendingPrerolls](self->_videoPlayer, "cancelPendingPrerolls");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)wrappedPlayerObservationContext == a5)
    px_dispatch_on_main_queue();
}

- (id)statusChangeHandler
{
  return self->statusChangeHandler;
}

- (void)setStatusChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)playerItemChangeHandler
{
  return self->playerItemChangeHandler;
}

- (void)setPlayerItemChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)durationChangeHandler
{
  return self->durationChangeHandler;
}

- (void)setDurationChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong(&self->durationChangeHandler, 0);
  objc_storeStrong(&self->playerItemChangeHandler, 0);
  objc_storeStrong(&self->statusChangeHandler, 0);
}

void __77__PXSimpleWrappedVideoScrubberControllerTarget_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);
  void *v4;
  void (**v5)(void);
  void *v6;
  void (**v7)(void);

  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "statusChangeHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "statusChangeHandler");
      v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v3[2]();

    }
  }
  if ((*(_BYTE *)(a1 + 41) & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "durationChangeHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "durationChangeHandler");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v5[2]();

    }
  }
  if ((*(_BYTE *)(a1 + 40) & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "playerItemChangeHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "playerItemChangeHandler");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

    }
  }
}

@end

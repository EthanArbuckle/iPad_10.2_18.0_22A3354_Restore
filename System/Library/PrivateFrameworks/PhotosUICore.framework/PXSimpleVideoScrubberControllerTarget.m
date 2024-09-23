@implementation PXSimpleVideoScrubberControllerTarget

- (PXSimpleVideoScrubberControllerTarget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoScrubberController.m"), 462, CFSTR("%s is not available as initializer"), "-[PXSimpleVideoScrubberControllerTarget init]");

  abort();
}

- (PXSimpleVideoScrubberControllerTarget)initWithVideoPlayer:(id)a3
{
  id v5;
  PXSimpleVideoScrubberControllerTarget *v6;
  PXSimpleVideoScrubberControllerTarget *v7;
  uint64_t v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSimpleVideoScrubberControllerTarget;
  v6 = -[PXSimpleVideoScrubberControllerTarget init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_videoPlayer, a3);
    -[AVPlayer addObserver:forKeyPath:options:context:](v7->_videoPlayer, "addObserver:forKeyPath:options:context:", v7, CFSTR("status"), 0, avPlayerObservationContext);
    -[AVPlayer addObserver:forKeyPath:options:context:](v7->_videoPlayer, "addObserver:forKeyPath:options:context:", v7, CFSTR("currentItem"), 0, avPlayerObservationContext);
    -[AVPlayer addObserver:forKeyPath:options:context:](v7->_videoPlayer, "addObserver:forKeyPath:options:context:", v7, CFSTR("currentItem.duration"), 1, avPlayerObservationContext);
    v8 = MEMORY[0x1E0CA2E10];
    *(_OWORD *)&v7->_currentItemDuration.value = *MEMORY[0x1E0CA2E10];
    v7->_currentItemDuration.epoch = *(_QWORD *)(v8 + 16);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[AVPlayer removeObserver:forKeyPath:context:](self->_videoPlayer, "removeObserver:forKeyPath:context:", self, CFSTR("status"), avPlayerObservationContext);
  -[AVPlayer removeObserver:forKeyPath:context:](self->_videoPlayer, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.duration"), avPlayerObservationContext);
  -[AVPlayer removeObserver:forKeyPath:context:](self->_videoPlayer, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), avPlayerObservationContext);
  v3.receiver = self;
  v3.super_class = (Class)PXSimpleVideoScrubberControllerTarget;
  -[PXSimpleVideoScrubberControllerTarget dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  __int128 v20;
  int64_t v21;

  v10 = a3;
  v11 = a5;
  if ((void *)avPlayerObservationContext != a6)
  {
    v19.receiver = self;
    v19.super_class = (Class)PXSimpleVideoScrubberControllerTarget;
    -[PXSimpleVideoScrubberControllerTarget observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
    goto LABEL_16;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("status")))
  {
    -[PXSimpleVideoScrubberControllerTarget statusChangeHandler](self, "statusChangeHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PXSimpleVideoScrubberControllerTarget statusChangeHandler](self, "statusChangeHandler");
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v18 = (void *)v13;
      (*(void (**)(void))(v13 + 16))();

      goto LABEL_16;
    }
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("currentItem.duration")))
  {
    -[PXSimpleVideoScrubberControllerTarget durationChangeHandler](self, "durationChangeHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "CMTimeValue");
      }
      else
      {
        v20 = 0uLL;
        v21 = 0;
      }
      *(_OWORD *)&self->_currentItemDuration.value = v20;
      self->_currentItemDuration.epoch = v21;

      -[PXSimpleVideoScrubberControllerTarget durationChangeHandler](self, "durationChangeHandler");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("currentItem")))
  {
    -[PXSimpleVideoScrubberControllerTarget playerItemChangeHandler](self, "playerItemChangeHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PXSimpleVideoScrubberControllerTarget playerItemChangeHandler](self, "playerItemChangeHandler");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
LABEL_16:

}

- (float)playRate
{
  float result;

  -[AVPlayer rate](self->_videoPlayer, "rate");
  return result;
}

- (id)playerItem
{
  return -[AVPlayer currentItem](self->_videoPlayer, "currentItem");
}

- (int64_t)playerStatus
{
  return -[AVPlayer status](self->_videoPlayer, "status");
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
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (void)removeTimeObserver:(id)a3
{
  -[AVPlayer removeTimeObserver:](self->_videoPlayer, "removeTimeObserver:", a3);
}

- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5
{
  AVPlayer *videoPlayer;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  videoPlayer = self->_videoPlayer;
  v7 = *a3;
  -[AVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](videoPlayer, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v7, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)videoScrubberController:(id)a3 seekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7
{
  AVPlayer *videoPlayer;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  videoPlayer = self->_videoPlayer;
  v10 = *a4;
  v9 = *a5;
  v8 = *a6;
  -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](videoPlayer, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v10, &v9, &v8, a7);
}

- (void)cancelPendingSeeks
{
  -[AVPlayer cancelPendingPrerolls](self->_videoPlayer, "cancelPendingPrerolls");
}

- (id)statusChangeHandler
{
  return self->statusChangeHandler;
}

- (void)setStatusChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)durationChangeHandler
{
  return self->durationChangeHandler;
}

- (void)setDurationChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)playerItemChangeHandler
{
  return self->playerItemChangeHandler;
}

- (void)setPlayerItemChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (AVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong(&self->playerItemChangeHandler, 0);
  objc_storeStrong(&self->durationChangeHandler, 0);
  objc_storeStrong(&self->statusChangeHandler, 0);
}

@end

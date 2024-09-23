@implementation ISRateCurveRequest

- (ISRateCurveRequest)initWithTargetTime:(id *)a3 duration:(double)a4 initialRate:(float)a5 avPlayer:(id)a6 progressHandler:(id)a7
{
  id v12;
  id v13;
  char *v14;
  ISRateCurveRequest *v15;
  __int128 v16;
  uint64_t v17;
  id progressHandler;
  objc_super v20;

  v12 = a6;
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ISRateCurveRequest;
  v14 = -[ISRateCurveRequest init](&v20, sel_init);
  v15 = (ISRateCurveRequest *)v14;
  if (v14)
  {
    v16 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v14 + 15) = a3->var3;
    *(_OWORD *)(v14 + 104) = v16;
    *((double *)v14 + 10) = a4;
    *((float *)v14 + 18) = a5;
    objc_storeWeak((id *)v14 + 11, v12);
    v17 = objc_msgSend(v13, "copy");
    progressHandler = v15->_progressHandler;
    v15->_progressHandler = (id)v17;

  }
  return v15;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  id WeakRetained;
  void *v11;
  void *v12;
  id boundaryObserver;
  _QWORD v14[4];
  id v15;
  CMTime v16;
  CMTime v17;
  CMTime rhs;
  CMTime lhs;
  CMTime v20;
  CMTime v21;

  if (!self->_cancelled)
  {
    -[ISRateCurveRequest avPlayer](self, "avPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      memset(&v21, 0, sizeof(v21));
      objc_msgSend(v3, "currentTime");
      lhs = (CMTime)self->_targetTime;
      memset(&v20, 0, sizeof(v20));
      rhs = v21;
      CMTimeSubtract(&v20, &lhs, &rhs);
      self->_stepIndex = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -4;
      do
      {
        memset(&lhs, 0, sizeof(lhs));
        rhs = v20;
        CMTimeMultiplyByRatio(&lhs, &rhs, v6 + 5, 4);
        memset(&rhs, 0, sizeof(rhs));
        v17 = v21;
        v16 = lhs;
        CMTimeAdd(&rhs, &v17, &v16);
        v17 = rhs;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

      }
      while (!__CFADD__(v6++, 1));
      *(float *)&v8 = self->_initialRate;
      objc_msgSend(v4, "_setRate:", v8);
      objc_initWeak((id *)&lhs, self);
      WeakRetained = objc_loadWeakRetained((id *)&self->_avPlayer);
      objc_msgSend(WeakRetained, "dispatchQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __27__ISRateCurveRequest_start__block_invoke;
      v14[3] = &unk_1E9453BF8;
      objc_copyWeak(&v15, (id *)&lhs);
      objc_msgSend(v4, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v5, v11, v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      boundaryObserver = self->_boundaryObserver;
      self->_boundaryObserver = v12;

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)&lhs);

    }
  }
}

- (void)_stepDownRate
{
  ISAVPlayer **p_avPlayer;
  id WeakRetained;
  void *v5;
  double Seconds;
  double v7;
  void *v8;
  double v9;
  _QWORD *v10;
  void (*v11)(_QWORD *, CMTime *, double);
  int64_t v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  $95D729B680665BEAEFA1D6FCA8238556 startVideoTime;
  CMTime rhs;
  CMTime lhs;
  CMTime v23;
  CMTime v24;

  if (!self->_cancelled)
  {
    memset(&v24, 0, sizeof(v24));
    p_avPlayer = &self->_avPlayer;
    WeakRetained = objc_loadWeakRetained((id *)&self->_avPlayer);
    v5 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "currentTime");
    else
      memset(&v24, 0, sizeof(v24));

    memset(&v23, 0, sizeof(v23));
    lhs = (CMTime)self->_targetTime;
    rhs = v24;
    CMTimeSubtract(&v23, &lhs, &rhs);
    memset(&lhs, 0, sizeof(lhs));
    rhs = (CMTime)self->_targetTime;
    startVideoTime = self->_startVideoTime;
    CMTimeSubtract(&lhs, &rhs, (CMTime *)&startVideoTime);
    rhs = v23;
    Seconds = CMTimeGetSeconds(&rhs);
    rhs = lhs;
    v7 = CMTimeGetSeconds(&rhs);
    -[ISRateCurveRequest progressHandler](self, "progressHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (Seconds / v7 <= 1.0)
        v9 = Seconds / v7;
      else
        v9 = 1.0;
      -[ISRateCurveRequest progressHandler](self, "progressHandler");
      v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v11 = (void (*)(_QWORD *, CMTime *, double))v10[2];
      rhs = v24;
      v11(v10, &rhs, v9);

    }
    v12 = self->_stepIndex + 1;
    self->_stepIndex = v12;
    if (v12 == 4)
    {
      v13 = objc_loadWeakRetained((id *)p_avPlayer);
      v14 = v13;
      LODWORD(v15) = 0;
    }
    else
    {
      +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "vitalityEaseMinRate");
      v18 = v17;

      v19 = v18 + (float)((float)(self->_initialRate - v18) * (float)((float)((float)self->_stepIndex * -0.25) + 1.0));
      v13 = objc_loadWeakRetained((id *)p_avPlayer);
      v14 = v13;
      *(float *)&v15 = v19;
    }
    objc_msgSend(v13, "_setRate:", v15);

  }
}

- (void)_didReachTargetTime
{
  ISAVPlayer **p_avPlayer;
  id WeakRetained;
  double v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, double);
  id v9;
  void *v10;
  _QWORD v11[3];
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  $95D729B680665BEAEFA1D6FCA8238556 targetTime;

  if (!self->_cancelled)
  {
    self->_cancelled = 1;
    p_avPlayer = &self->_avPlayer;
    WeakRetained = objc_loadWeakRetained((id *)&self->_avPlayer);
    LODWORD(v5) = 0;
    objc_msgSend(WeakRetained, "_setRate:", v5);

    v6 = objc_loadWeakRetained((id *)p_avPlayer);
    targetTime = self->_targetTime;
    v14 = *MEMORY[0x1E0CA2E68];
    v15 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v12 = v14;
    v13 = v15;
    objc_msgSend(v6, "seekToTime:toleranceBefore:toleranceAfter:", &targetTime, &v14, &v12);

    -[ISRateCurveRequest progressHandler](self, "progressHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ISRateCurveRequest progressHandler](self, "progressHandler");
      v8 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained((id *)p_avPlayer);
      v10 = v9;
      if (v9)
        objc_msgSend(v9, "currentTime");
      else
        memset(v11, 0, sizeof(v11));
      ((void (**)(_QWORD, _QWORD *, double))v8)[2](v8, v11, 1.0);

    }
  }
}

- (void)cancel
{
  self->_cancelled = 1;
  -[ISRateCurveRequest _stopObservingPlayer](self, "_stopObservingPlayer");
}

- (void)dealloc
{
  objc_super v3;

  -[ISRateCurveRequest _stopObservingPlayer](self, "_stopObservingPlayer");
  v3.receiver = self;
  v3.super_class = (Class)ISRateCurveRequest;
  -[ISRateCurveRequest dealloc](&v3, sel_dealloc);
}

- (void)_stopObservingPlayer
{
  id WeakRetained;
  id boundaryObserver;

  if (self->_boundaryObserver)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_avPlayer);
    objc_msgSend(WeakRetained, "removeTimeObserver:", self->_boundaryObserver);

    boundaryObserver = self->_boundaryObserver;
    self->_boundaryObserver = 0;

  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (double)duration
{
  return self->_duration;
}

- (float)initialRate
{
  return self->_initialRate;
}

- (ISAVPlayer)avPlayer
{
  return (ISAVPlayer *)objc_loadWeakRetained((id *)&self->_avPlayer);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_destroyWeak((id *)&self->_avPlayer);
  objc_storeStrong(&self->_boundaryObserver, 0);
}

void __27__ISRateCurveRequest_start__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stepDownRate");

}

@end

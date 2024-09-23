@implementation TVPMediaItemTimingData

- (void)setStartTimeForPreparingForPlaybackInitiation:(double)a3
{
  self->_startTimeForPreparingForPlaybackInitiation = a3;
}

- (void)setStartTimeForPreparingForLoading:(double)a3
{
  self->_startTimeForPreparingForLoading = a3;
}

- (void)setStartTimeForLoadingAVAssetKeys:(double)a3
{
  self->_startTimeForLoadingAVAssetKeys = a3;
}

- (void)setStartTimeForBuffering:(double)a3
{
  self->_startTimeForBuffering = a3;
}

- (void)setStartTimeForAVPlayerItemLoading:(double)a3
{
  self->_startTimeForAVPlayerItemLoading = a3;
}

- (void)setEndTimeForPreparingForPlaybackInitiation:(double)a3
{
  self->_endTimeForPreparingForPlaybackInitiation = a3;
}

- (void)setEndTimeForPreparingForLoading:(double)a3
{
  self->_endTimeForPreparingForLoading = a3;
}

- (void)setEndTimeForLoadingAVAssetKeys:(double)a3
{
  self->_endTimeForLoadingAVAssetKeys = a3;
}

- (void)setInitialLoadingComplete:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  if (self->_initialLoadingComplete != a3)
  {
    self->_initialLoadingComplete = a3;
    v4 = 0.0;
    if (a3)
    {
      -[TVPMediaItemTimingData endTimeForPreparingForLoading](self, "endTimeForPreparingForLoading", 0.0);
      v6 = v5;
      -[TVPMediaItemTimingData startTimeForPreparingForLoading](self, "startTimeForPreparingForLoading");
      v8 = v6 - v7;
      -[TVPMediaItemTimingData endTimeForLoadingAVAssetKeys](self, "endTimeForLoadingAVAssetKeys");
      v10 = v9;
      -[TVPMediaItemTimingData startTimeForLoadingAVAssetKeys](self, "startTimeForLoadingAVAssetKeys");
      v12 = v8 + v10 - v11;
      -[TVPMediaItemTimingData endTimeForPreparingForPlaybackInitiation](self, "endTimeForPreparingForPlaybackInitiation");
      v14 = v13;
      -[TVPMediaItemTimingData startTimeForPreparingForPlaybackInitiation](self, "startTimeForPreparingForPlaybackInitiation");
      v16 = v12 + v14 - v15;
      -[TVPMediaItemTimingData endTimeForAVPlayerItemLoading](self, "endTimeForAVPlayerItemLoading");
      v18 = v17;
      -[TVPMediaItemTimingData startTimeForAVPlayerItemLoading](self, "startTimeForAVPlayerItemLoading");
      v20 = v16 + v18 - v19;
      -[TVPMediaItemTimingData endTimeForBuffering](self, "endTimeForBuffering");
      v22 = v21;
      -[TVPMediaItemTimingData startTimeForBuffering](self, "startTimeForBuffering");
      v4 = v20 + v22 - v23;
    }
    -[TVPMediaItemTimingData setTotalInitialLoadingTime:](self, "setTotalInitialLoadingTime:", v4);
  }
}

- (double)startTimeForPreparingForLoading
{
  return self->_startTimeForPreparingForLoading;
}

- (double)endTimeForPreparingForLoading
{
  return self->_endTimeForPreparingForLoading;
}

- (double)startTimeForLoadingAVAssetKeys
{
  return self->_startTimeForLoadingAVAssetKeys;
}

- (double)endTimeForLoadingAVAssetKeys
{
  return self->_endTimeForLoadingAVAssetKeys;
}

- (double)startTimeForPreparingForPlaybackInitiation
{
  return self->_startTimeForPreparingForPlaybackInitiation;
}

- (double)endTimeForPreparingForPlaybackInitiation
{
  return self->_endTimeForPreparingForPlaybackInitiation;
}

- (double)startTimeForAVPlayerItemLoading
{
  return self->_startTimeForAVPlayerItemLoading;
}

- (double)endTimeForAVPlayerItemLoading
{
  return self->_endTimeForAVPlayerItemLoading;
}

- (void)setEndTimeForAVPlayerItemLoading:(double)a3
{
  self->_endTimeForAVPlayerItemLoading = a3;
}

- (double)startTimeForBuffering
{
  return self->_startTimeForBuffering;
}

- (double)endTimeForBuffering
{
  return self->_endTimeForBuffering;
}

- (void)setEndTimeForBuffering:(double)a3
{
  self->_endTimeForBuffering = a3;
}

- (double)totalInitialLoadingTime
{
  return self->_totalInitialLoadingTime;
}

- (void)setTotalInitialLoadingTime:(double)a3
{
  self->_totalInitialLoadingTime = a3;
}

- (BOOL)initialLoadingComplete
{
  return self->_initialLoadingComplete;
}

@end

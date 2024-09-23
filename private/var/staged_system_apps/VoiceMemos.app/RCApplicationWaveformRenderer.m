@implementation RCApplicationWaveformRenderer

- (double)waveformWaveWidth
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (-[RCWaveformRenderer displayMode](self, "displayMode"))
    objc_msgSend(v3, "waveformWaveWidth");
  else
    objc_msgSend(v3, "overviewWaveformWaveWidth");
  v5 = v4;

  return v5;
}

- (double)waveformHorizontalSpacing
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (-[RCWaveformRenderer displayMode](self, "displayMode"))
    objc_msgSend(v3, "waveformHorizontalSpacing");
  else
    objc_msgSend(v3, "overviewWaveformHorizontalSpacing");
  v5 = v4;

  return v5;
}

- (double)maximumDecibelDisplayRange
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "maximumDecibelDisplayRange");
  v4 = v3;

  return v4;
}

- (double)verticalWaveformPadding
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v3, "waveformWaveVerticalPadding");
  v5 = v4;
  if (!-[RCWaveformRenderer displayMode](self, "displayMode"))
  {
    objc_msgSend(v3, "overviewWaveformWaveVerticalPadding");
    goto LABEL_5;
  }
  if (-[RCApplicationWaveformRenderer isCompactView](self, "isCompactView"))
  {
    objc_msgSend(v3, "compactWaveformWaveVerticalPadding");
LABEL_5:
    v5 = v6;
  }

  return v5;
}

- (BOOL)useCenteredStyleColoring
{
  return (id)-[RCWaveformRenderer displayMode](self, "displayMode") == (id)1
      && (!-[RCApplicationWaveformRenderer isCompactView](self, "isCompactView")
       || !-[RCWaveformRenderer isLiveWaveform](self, "isLiveWaveform")
       || -[RCApplicationWaveformRenderer isPlayBarOnlyMode](self, "isPlayBarOnlyMode"));
}

- (BOOL)renderDimmedUnprocessedSegments
{
  return !-[RCWaveformRenderer isLiveWaveform](self, "isLiveWaveform");
}

- (BOOL)isEditMode
{
  return self->_isEditMode;
}

- (void)setIsEditMode:(BOOL)a3
{
  self->_isEditMode = a3;
}

- (BOOL)isPlayback
{
  return self->_isPlayback;
}

- (void)setIsPlayback:(BOOL)a3
{
  self->_isPlayback = a3;
}

- (BOOL)isCompactView
{
  return self->_isCompactView;
}

- (void)setIsCompactView:(BOOL)a3
{
  self->_isCompactView = a3;
}

- (BOOL)isPlayBarOnlyMode
{
  return self->_isPlayBarOnlyMode;
}

- (void)setIsPlayBarOnlyMode:(BOOL)a3
{
  self->_isPlayBarOnlyMode = a3;
}

@end

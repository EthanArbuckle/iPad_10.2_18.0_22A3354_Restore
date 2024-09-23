@implementation PXStoryPacingManualTimeSource

- (PXStoryPacingManualTimeSource)init
{
  PXStoryPacingManualTimeSource *v2;
  CMTime v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryPacingManualTimeSource;
  v2 = -[PXStoryPacingManualTimeSource init](&v5, sel_init);
  if (v2)
  {
    CMTimeMakeWithSeconds(&v4, 0.0, 600);
    v2->_currentTime = ($95D729B680665BEAEFA1D6FCA8238556)v4;
  }
  return v2;
}

- (void)incrementByTime:(id *)a3
{
  void *v5;
  CMTime v6;
  CMTime rhs;
  CMTime lhs;

  if (-[PXStoryPacingManualTimeSource isActive](self, "isActive"))
  {
    lhs = (CMTime)self->_currentTime;
    rhs = (CMTime)*a3;
    CMTimeAdd(&v6, &lhs, &rhs);
    self->_currentTime = ($95D729B680665BEAEFA1D6FCA8238556)v6;
    -[PXStoryPacingManualTimeSource delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    lhs = (CMTime)*a3;
    objc_msgSend(v5, "timeSource:didIncrementByTime:", self, &lhs);

  }
}

- (BOOL)isRealTime
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (PXStoryPacingTimeSourceDelegate)delegate
{
  return (PXStoryPacingTimeSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

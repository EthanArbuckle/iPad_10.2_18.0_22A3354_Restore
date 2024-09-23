@implementation SUICHandsOnAutoDismissalStrategy

- (double)idleTimeInterval
{
  double v3;
  double v4;
  double result;

  -[SUICAutoDismissalStrategy minimumIdleTimeInterval](self, "minimumIdleTimeInterval");
  v4 = v3;
  -[SUICAutoDismissalStrategy idleTimeout](self, "idleTimeout");
  if (v4 >= result)
    return v4;
  return result;
}

- (BOOL)shouldDismiss
{
  unsigned int v3;
  uint64_t v4;
  uint64_t (**v6)(void);

  if (-[SUICAutoDismissalStrategy isVideoPlaying](self, "isVideoPlaying")
    || -[SUICAutoDismissalStrategy userInteractedWithTouchScreen](self, "userInteractedWithTouchScreen")
    || -[SUICAutoDismissalStrategy userInteractedWithTouchIDSensor](self, "userInteractedWithTouchIDSensor")
    || !-[SUICAutoDismissalStrategy deviceSupportsFaceDetection](self, "deviceSupportsFaceDetection")
    && -[SUICAutoDismissalStrategy deviceSupportsRaiseGestureDetection](self, "deviceSupportsRaiseGestureDetection")
    && -[SUICAutoDismissalStrategy latestDeviceMotionEvent](self, "latestDeviceMotionEvent") == 1
    || -[SUICAutoDismissalStrategy deviceSupportsFaceDetection](self, "deviceSupportsFaceDetection")
    && -[SUICAutoDismissalStrategy latestFaceAwarenessEvent](self, "latestFaceAwarenessEvent") == 1)
  {
    LOBYTE(v3) = 0;
    v4 = 0;
  }
  else
  {
    -[SUICHandsOnAutoDismissalStrategy _mapsNavigationStatusIsActiveBlock](self, "_mapsNavigationStatusIsActiveBlock");
    v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v3 = v6[2]();

    v4 = v3;
  }
  -[SUICAutoDismissalStrategy setAutoDismissalReason:](self, "setAutoDismissalReason:", v4);
  return v3;
}

- (id)_mapsNavigationStatusIsActiveBlock
{
  id mapsNavigationStatusIsActiveBlock;

  mapsNavigationStatusIsActiveBlock = self->_mapsNavigationStatusIsActiveBlock;
  if (!mapsNavigationStatusIsActiveBlock)
  {
    self->_mapsNavigationStatusIsActiveBlock = &__block_literal_global_3;

    mapsNavigationStatusIsActiveBlock = self->_mapsNavigationStatusIsActiveBlock;
  }
  return (id)MEMORY[0x1A8593D14](mapsNavigationStatusIsActiveBlock, a2);
}

- (void)_setMapsNavigationStatusIsActiveBlock:(id)a3
{
  void *v4;
  id mapsNavigationStatusIsActiveBlock;

  v4 = (void *)MEMORY[0x1A8593D14](a3, a2);
  mapsNavigationStatusIsActiveBlock = self->_mapsNavigationStatusIsActiveBlock;
  self->_mapsNavigationStatusIsActiveBlock = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mapsNavigationStatusIsActiveBlock, 0);
}

@end

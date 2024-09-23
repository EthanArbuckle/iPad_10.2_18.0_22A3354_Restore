@implementation SUICHandsOffAutoDismissalStrategy

- (double)idleTimeInterval
{
  double v3;
  double v4;
  double result;

  -[SUICAutoDismissalStrategy minimumIdleTimeInterval](self, "minimumIdleTimeInterval");
  v4 = v3;
  if (-[SUICAutoDismissalStrategy deviceSupportsFaceDetection](self, "deviceSupportsFaceDetection")
    || !-[SUICAutoDismissalStrategy isViewRequiringExtendedTimeoutVisible](self, "isViewRequiringExtendedTimeoutVisible"))
  {
    -[SUICAutoDismissalStrategy idleTimeout](self, "idleTimeout");
  }
  else
  {
    -[SUICAutoDismissalStrategy extendedIdleTimeout](self, "extendedIdleTimeout");
  }
  if (v4 >= result)
    return v4;
  return result;
}

- (BOOL)shouldDismiss
{
  uint64_t v3;
  BOOL v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (-[SUICAutoDismissalStrategy isVideoPlaying](self, "isVideoPlaying")
    || -[SUICAutoDismissalStrategy userInteractedWithTouchScreen](self, "userInteractedWithTouchScreen")
    || -[SUICAutoDismissalStrategy userInteractedWithTouchIDSensor](self, "userInteractedWithTouchIDSensor")
    || !-[SUICAutoDismissalStrategy deviceSupportsFaceDetection](self, "deviceSupportsFaceDetection")
    && -[SUICAutoDismissalStrategy deviceSupportsRaiseGestureDetection](self, "deviceSupportsRaiseGestureDetection")
    && -[SUICAutoDismissalStrategy latestDeviceMotionEvent](self, "latestDeviceMotionEvent") == 1
    || -[SUICAutoDismissalStrategy deviceSupportsFaceDetection](self, "deviceSupportsFaceDetection")
    && -[SUICAutoDismissalStrategy latestFaceAwarenessEvent](self, "latestFaceAwarenessEvent") == 1)
  {
    v3 = 0;
    v4 = 0;
  }
  else if (-[SUICAutoDismissalStrategy deviceSupportsFaceDetection](self, "deviceSupportsFaceDetection")
         || !-[SUICAutoDismissalStrategy isViewRequiringExtendedTimeoutVisible](self, "isViewRequiringExtendedTimeoutVisible"))
  {
    v4 = 1;
    v3 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6;
    -[SUICAutoDismissalStrategy viewRequiringExtendedTimeoutStartTime](self, "viewRequiringExtendedTimeoutStartTime");
    v9 = v7 - v8;
    -[SUICAutoDismissalStrategy extendedIdleTimeout](self, "extendedIdleTimeout");
    v4 = v9 > v10;
    v3 = 4 * (v9 > v10);
  }
  -[SUICAutoDismissalStrategy setAutoDismissalReason:](self, "setAutoDismissalReason:", v3);
  return v4;
}

@end

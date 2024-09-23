@implementation W5WiFiActiveSnifferRequest

- (void)dealloc
{
  NSObject *timeoutTimer;
  objc_super v4;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
    dispatch_release(timeoutTimer);
  v4.receiver = self;
  v4.super_class = (Class)W5WiFiActiveSnifferRequest;
  -[W5WiFiActiveSnifferRequest dealloc](&v4, "dealloc");
}

- (W5WiFiSnifferRequest)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSFileHandle)activeFileHandle
{
  return self->_activeFileHandle;
}

- (void)setActiveFileHandle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BhoundBpfFileDescriptor)activeBFD
{
  return self->_activeBFD;
}

- (void)setActiveBFD:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BhoundPcap)activePCap
{
  return self->_activePCap;
}

- (void)setActivePCap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end

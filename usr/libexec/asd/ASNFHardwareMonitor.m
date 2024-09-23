@implementation ASNFHardwareMonitor

- (ASNFHardwareMonitor)init
{
  dispatch_semaphore_t v3;
  void *v4;

  v3 = dispatch_semaphore_create(0);
  v4 = (void *)qword_1005185C8;
  qword_1005185C8 = (uint64_t)v3;

  return self;
}

- (void)waitForNotification
{
  NSObject *v2;
  dispatch_time_t v3;

  v2 = qword_1005185C8;
  v3 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v2, v3);
}

- (void)hardwareStateDidChange
{
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_1005185C8);
}

@end

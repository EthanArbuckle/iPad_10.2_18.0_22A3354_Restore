@implementation DaemonServiceMatcher

- (DaemonServiceMatcher)init
{
  DaemonServiceMatcher *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *waitSemaphore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DaemonServiceMatcher;
  v2 = -[TSDIOKServiceMatcher init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    waitSemaphore = v2->_waitSemaphore;
    v2->_waitSemaphore = (OS_dispatch_semaphore *)v3;

  }
  return v2;
}

- (BOOL)waitForService
{
  void *v3;
  unsigned int v4;
  _BOOL4 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncDaemonService")));
  v4 = -[TSDIOKServiceMatcher startNotificationsWithMatchingDictionary:](self, "startNotificationsWithMatchingDictionary:", v3);

  if (!v4)
    goto LABEL_5;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_waitSemaphore, 0xFFFFFFFFFFFFFFFFLL))
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    sub_100027F20();
LABEL_5:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)serviceMatched:(id)a3
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitSemaphore);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitSemaphore, 0);
}

@end

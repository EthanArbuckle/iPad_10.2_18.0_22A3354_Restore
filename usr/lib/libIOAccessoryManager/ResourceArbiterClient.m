@implementation ResourceArbiterClient

- (ResourceArbiterClient)initWithID:(int)a3
{
  id v4;
  ResourceArbiterClient *result;
  mach_port_t v6;
  IONotificationPort *v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ResourceArbiterClient;
  v4 = -[ResourceArbiterClient init](&v10, sel_init);
  result = 0;
  if (a3 <= 1 && v4)
  {
    objc_msgSend(v4, "setDelegate:", 0);
    *((_DWORD *)v4 + 14) = a3;
    *((_DWORD *)v4 + 15) = 0;
    *((_BYTE *)v4 + 48) = 0;
    *((_QWORD *)v4 + 8) = dispatch_semaphore_create(0);
    *((_DWORD *)v4 + 8) = 0;
    *((_DWORD *)v4 + 4) = 0;
    *((_DWORD *)v4 + 13) = 0;
    *((_QWORD *)v4 + 5) = dispatch_queue_create("vaduserclient-queue", 0);
    v6 = *MEMORY[0x24BDD8B20];
    v7 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
    *((_QWORD *)v4 + 3) = v7;
    if (v7
      && (IONotificationPortSetDispatchQueue(v7, *((dispatch_queue_t *)v4 + 5)),
          (v8 = IOServiceMatching("VADResourceArbiter")) != 0)
      && (MatchingService = IOServiceGetMatchingService(v6, v8), (*((_DWORD *)v4 + 13) = MatchingService) != 0)
      && !IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)v4 + 4)
      && (IOObjectRetain(*((_DWORD *)v4 + 13)),
          !IOServiceAddInterestNotification(*((IONotificationPortRef *)v4 + 3), *((_DWORD *)v4 + 13), "IOGeneralInterest", (IOServiceInterestCallback)ResourceArbiterClientNotifyEvent, v4, (io_object_t *)v4 + 8)))
    {
      return (ResourceArbiterClient *)v4;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  NSObject *notificationPortQueue;
  IONotificationPort *ioNotificationPort;
  io_connect_t ioConnect;
  io_object_t ioNotificationObject;
  NSObject *sema;
  io_object_t ioService;
  objc_super v9;

  -[BaseResourceArbiterClient setDelegate:](self, "setDelegate:", 0);
  notificationPortQueue = self->_notificationPortQueue;
  if (notificationPortQueue)
    dispatch_release(notificationPortQueue);
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  ioConnect = self->_ioConnect;
  if (ioConnect)
    IOServiceClose(ioConnect);
  ioNotificationObject = self->_ioNotificationObject;
  if (ioNotificationObject)
  {
    IOObjectRelease(ioNotificationObject);
    self->_ioNotificationObject = 0;
  }
  sema = self->_sema;
  if (sema)
    dispatch_release(sema);
  ioService = self->_ioService;
  if (ioService)
    IOObjectRelease(ioService);
  v9.receiver = self;
  v9.super_class = (Class)ResourceArbiterClient;
  -[ResourceArbiterClient dealloc](&v9, sel_dealloc);
}

- (void)_processResourceAccessStatus:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_resourceAccessStatus = a3;
  if (self->_pendingResourceRequest == 1)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sema);
  if (-[BaseResourceArbiterClient delegate](self, "delegate"))
  {
    -[BaseResourceArbiterClient delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ResourceArbiterClientDelegate resourceAccessResult:](-[BaseResourceArbiterClient delegate](self, "delegate"), "resourceAccessResult:", v3);
  }
}

- (BOOL)synchRequestResourceAccess
{
  BOOL result;

  if (self->_pendingResourceRequest
    || !-[BaseResourceArbiterClient delegate](self, "delegate") && self->_clientPriority)
  {
    return 0;
  }
  self->_pendingResourceRequest = 1;
  if (requestResource(self->_ioConnect, self->_clientPriority, 0))
  {
    result = 0;
    self->_pendingResourceRequest = 0;
  }
  else
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
    self->_pendingResourceRequest = 0;
    return self->_resourceAccessStatus;
  }
  return result;
}

- (BOOL)asynchRequestResourceAccess:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;

  v3 = a3;
  v5 = 0;
  if (-[BaseResourceArbiterClient delegate](self, "delegate"))
  {
    if (v3)
    {
      self->_pendingResourceRequest = 2;
      v5 = 1;
      if (requestResource(self->_ioConnect, self->_clientPriority, 1u))
      {
        v5 = 0;
        self->_pendingResourceRequest = 0;
      }
    }
  }
  return v5;
}

- (void)releaseResourceAccess
{
  releaseResource(self->_ioConnect, self->_clientPriority);
  self->_resourceAccessStatus = 0;
}

- (void)resourceAccessGranted
{
  -[ResourceArbiterClient _processResourceAccessStatus:](self, "_processResourceAccessStatus:", 1);
}

- (void)resourceAccessRevoked
{
  if (-[BaseResourceArbiterClient delegate](self, "delegate"))
  {
    -[BaseResourceArbiterClient delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ResourceArbiterClientDelegate resourceAccessRevoked](-[BaseResourceArbiterClient delegate](self, "delegate"), "resourceAccessRevoked");
  }
}

- (unsigned)ioService
{
  return self->_ioService;
}

- (int)clientPriority
{
  return self->_clientPriority;
}

- (int)pendingResourceRequest
{
  return self->_pendingResourceRequest;
}

- (BOOL)resourceAccessStatus
{
  return self->_resourceAccessStatus;
}

- (OS_dispatch_semaphore)sema
{
  return self->_sema;
}

@end

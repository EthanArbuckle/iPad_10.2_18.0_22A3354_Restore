@implementation CLApplicationLifecycleManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_1023079B0 != -1)
    dispatch_once(&qword_1023079B0, &stru_10217CC30);
  return (id)qword_1023079A8;
}

+ (BOOL)isSupported
{
  if (qword_1023079C0 != -1)
    dispatch_once(&qword_1023079C0, &stru_10217CC50);
  return (byte_1023079B8 & 1) == 0;
}

- (CLApplicationLifecycleManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLApplicationLifecycleManagerAdapter;
  return -[CLApplicationLifecycleManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLApplicationLifecycleManagerProtocol, &OBJC_PROTOCOL___CLApplicationLifecycleManagerClientProtocol);
}

- (void)beginService
{
  operator new();
}

- (void)endService
{
  void *manager;

  manager = self->_manager;
  if (manager)
  {
    sub_100C9EDD4((uint64_t)manager);
    operator delete();
  }
  self->_manager = 0;
}

- (void)launchApplication:(id)a3 requiringAuthForServiceMask:(unint64_t)a4
{
  void *manager;
  void *__p[2];
  char v7;

  manager = self->_manager;
  if (manager)
  {
    sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
    sub_100C9DF60((uint64_t)manager, (unsigned __int8 *)__p, a4);
    if (v7 < 0)
      operator delete(__p[0]);
  }
}

- (void)launchDaemon:(id)a3
{
  id *manager;
  id v4;
  void **v5;
  void *__p[2];
  char v7;

  manager = (id *)self->_manager;
  if (manager)
  {
    sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
    v4 = objc_msgSend(objc_msgSend(*manager, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
    if (v7 >= 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    objc_msgSend(v4, "wakeUpLaunchdManagedClient:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
    if (v7 < 0)
      operator delete(__p[0]);
  }
}

- (void)manager
{
  return self->_manager;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
}

@end

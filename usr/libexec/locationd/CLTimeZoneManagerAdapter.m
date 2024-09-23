@implementation CLTimeZoneManagerAdapter

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
  if (qword_102305750 != -1)
    dispatch_once(&qword_102305750, &stru_10215E5D0);
  return (id)qword_102305748;
}

- (CLTimeZoneManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTimeZoneManagerAdapter;
  return -[CLTimeZoneManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLTimeZoneManagerProtocol, &OBJC_PROTOCOL___CLTimeZoneManagerClientProtocol);
}

- (void)beginService
{
  operator new();
}

- (void)endService
{
  sub_100904920((uint64_t)self->_manager);
}

+ (BOOL)isSupported
{
  if (qword_102305758 != -1)
    dispatch_once(&qword_102305758, &stru_10215E5F0);
  return qword_102305760 != 0;
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

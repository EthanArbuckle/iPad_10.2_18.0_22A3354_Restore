@implementation CLActivityLoggerAdapter

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
  if (qword_102301580 != -1)
    dispatch_once(&qword_102301580, &stru_10213F3B8);
  return (id)qword_102301578;
}

- (CLActivityLoggerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLActivityLoggerAdapter;
  return -[CLActivityLoggerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLActivityLoggerProtocol, &OBJC_PROTOCOL___CLActivityLoggerClientProtocol);
}

+ (BOOL)isSupported
{
  sub_100197040();
  return sub_1000C4240();
}

- (void)beginService
{
  self->_logger = (void *)sub_1004ECA24((uint64_t)-[CLActivityLoggerAdapter universe](self, "universe"));
}

- (void)endService
{
  void *logger;

  logger = self->_logger;
  if (logger)
  {
    sub_1004ED314((uint64_t)logger);
    operator delete();
  }
  self->_logger = 0;
}

- (void)logData:(id)a3
{
  id *logger;

  logger = (id *)self->_logger;
  if (logger)
  {
    objc_msgSend(*logger, "silo");
    if (*((_BYTE *)logger + 72))
      sub_1004D76E8(logger + 3, a3);
  }
}

- (void)logger
{
  return self->_logger;
}

- (void)setLogger:(void *)a3
{
  self->_logger = a3;
}

@end

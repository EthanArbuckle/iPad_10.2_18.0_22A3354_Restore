@implementation CLSuggestedActionManager

+ (BOOL)isSupported
{
  if (qword_102306A88 != -1)
    dispatch_once(&qword_102306A88, &stru_1021687A8);
  return byte_102306A80;
}

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
  if (qword_102306A98 != -1)
    dispatch_once(&qword_102306A98, &stru_1021687C8);
  return (id)qword_102306A90;
}

- (CLSuggestedActionManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSuggestedActionManager;
  return -[CLSuggestedActionManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSuggestedActionServiceProtocol, &OBJC_PROTOCOL___CLSuggestedActionClientProtocol);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLSuggestedActionManager;
  -[CLSuggestedActionManager dealloc](&v2, "dealloc");
}

- (void)beginService
{
  objc_msgSend(-[CLSuggestedActionManager universe](self, "universe"), "silo");
}

- (void)endService
{
  objc_msgSend(-[CLSuggestedActionManager universe](self, "universe"), "silo");
}

@end

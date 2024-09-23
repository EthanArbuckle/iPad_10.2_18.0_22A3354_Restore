@implementation CLDuetMonitor

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
  if (qword_102306980 != -1)
    dispatch_once(&qword_102306980, &stru_1021678A0);
  return (id)qword_102306978;
}

+ (BOOL)isSupported
{
  if (qword_102306990 != -1)
    dispatch_once(&qword_102306990, &stru_1021678C0);
  return (byte_102306988 & 1) == 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLDuetMonitor;
  -[CLDuetMonitor dealloc](&v2, "dealloc");
}

- (void)beginService
{
  objc_msgSend(-[CLDuetMonitor universe](self, "universe"), "silo");
}

- (void)endService
{
  objc_msgSend(-[CLDuetMonitor universe](self, "universe"), "silo");
}

- (CLDuetMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDuetMonitor;
  return -[CLDuetMonitor initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLDuetMonitorServiceProtocol, &OBJC_PROTOCOL___CLDuetMonitorClientProtocol);
}

- (int64_t)eventTypeFromNSNumber:(id)a3
{
  int64_t result;

  if (!a3)
    sub_1019194D8();
  result = (int)objc_msgSend(a3, "intValue");
  if (result >= 0xA)
    sub_1019196A4();
  return result;
}

@end

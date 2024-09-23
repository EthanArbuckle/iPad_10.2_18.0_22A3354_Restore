@implementation CLMotionHintLoggerAdapter

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
  if (qword_102310250 != -1)
    dispatch_once(&qword_102310250, &stru_1021D8090);
  return (id)qword_102310248;
}

- (CLMotionHintLoggerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMotionHintLoggerAdapter;
  return -[CLMotionHintLoggerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLMotionHintLoggerProtocol, &OBJC_PROTOCOL___CLMotionHintLoggerClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t block;
  _BYTE v7[32];

  block = (uint64_t)_NSConcreteStackBlock;
  *(_QWORD *)v7 = 3221225472;
  *(_QWORD *)&v7[8] = sub_1018E5240;
  *(_QWORD *)&v7[16] = &unk_10212BB58;
  *(_QWORD *)&v7[24] = -[CLMotionHintLoggerAdapter universe](self, "universe");
  if (qword_102310258 != -1)
    dispatch_once(&qword_102310258, &block);
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", qword_102310240);
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    if (qword_1022A0220 != -1)
      dispatch_once(&qword_1022A0220, &stru_1021D81C0);
    v3 = qword_1022A0228;
    if (os_log_type_enabled((os_log_t)qword_1022A0228, OS_LOG_TYPE_FAULT))
    {
      block = 68289539;
      *(_WORD *)v7 = 2082;
      *(_QWORD *)&v7[2] = "";
      *(_WORD *)&v7[10] = 2082;
      *(_QWORD *)&v7[12] = "assert";
      *(_WORD *)&v7[20] = 2081;
      *(_QWORD *)&v7[22] = "__null != self.notifier";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&block, 0x26u);
      if (qword_1022A0220 != -1)
        dispatch_once(&qword_1022A0220, &stru_1021D81C0);
    }
    v4 = qword_1022A0228;
    if (os_signpost_enabled((os_log_t)qword_1022A0228))
    {
      block = 68289539;
      *(_WORD *)v7 = 2082;
      *(_QWORD *)&v7[2] = "";
      *(_WORD *)&v7[10] = 2082;
      *(_QWORD *)&v7[12] = "assert";
      *(_WORD *)&v7[20] = 2081;
      *(_QWORD *)&v7[22] = "__null != self.notifier";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&block, 0x26u);
      if (qword_1022A0220 != -1)
        dispatch_once(&qword_1022A0220, &stru_1021D81C0);
    }
    v5 = qword_1022A0228;
    if (os_log_type_enabled((os_log_t)qword_1022A0228, OS_LOG_TYPE_INFO))
    {
      block = 68289539;
      *(_WORD *)v7 = 2082;
      *(_QWORD *)&v7[2] = "";
      *(_WORD *)&v7[10] = 2082;
      *(_QWORD *)&v7[12] = "assert";
      *(_WORD *)&v7[20] = 2081;
      *(_QWORD *)&v7[22] = "__null != self.notifier";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&block, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/CLMotionHintLogger.mm", 31, "-[CLMotionHintLoggerAdapter beginService]");
  }
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionHintLoggerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionHintLoggerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMotionHintLoggerAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  return 1;
}

@end

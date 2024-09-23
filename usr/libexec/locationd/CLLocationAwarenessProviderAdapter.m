@implementation CLLocationAwarenessProviderAdapter

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
  if (qword_10230C468 != -1)
    dispatch_once(&qword_10230C468, &stru_10219F7A0);
  return (id)qword_10230C460;
}

- (CLLocationAwarenessProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationAwarenessProviderAdapter;
  return -[CLLocationAwarenessProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLLocationAwarenessProviderProtocol, &OBJC_PROTOCOL___CLLocationAwarenessProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1010BBF6C((uint64_t)-[CLLocationAwarenessProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10193DFCC();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLLocationAwarenessProviderAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLLocationAwarenessProviderAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLLocationAwarenessProviderAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)onScenarioTrigger:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;

  v5 = objc_opt_class(RTScenarioTriggerSettled, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    v7 = -[CLLocationAwarenessProviderAdapter adaptee](self, "adaptee");
    v8 = 1;
LABEL_5:
    sub_1010BC4CC((uint64_t)v7, v8);
    return;
  }
  v9 = objc_opt_class(RTScenarioTriggerUnsettled, v6);
  if ((objc_opt_isKindOfClass(a3, v9) & 1) != 0)
  {
    v7 = -[CLLocationAwarenessProviderAdapter adaptee](self, "adaptee");
    v8 = 0;
    goto LABEL_5;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10219F948);
  v10 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
  {
    v15 = 68289283;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2081;
    v20 = objc_msgSend(objc_msgSend((id)objc_opt_class(a3, v11), "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Awareness Received unexpected Routine notification\", \"triggerClass\":%{private, location:escape_only}s}", (uint8_t *)&v15, 0x1Cu);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10219F948);
  }
  v12 = qword_1022A01D8;
  if (os_signpost_enabled((os_log_t)qword_1022A01D8))
  {
    v14 = objc_msgSend(objc_msgSend((id)objc_opt_class(a3, v13), "description"), "UTF8String");
    v15 = 68289283;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2081;
    v20 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Awareness Received unexpected Routine notification", "{\"msg%{public}.0s\":\"#Awareness Received unexpected Routine notification\", \"triggerClass\":%{private, location:escape_only}s}", (uint8_t *)&v15, 0x1Cu);
  }
}

@end

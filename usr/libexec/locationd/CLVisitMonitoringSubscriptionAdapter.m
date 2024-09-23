@implementation CLVisitMonitoringSubscriptionAdapter

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLVisitMonitoringSubscriptionAdapter)initWithSubscription:(void *)a3
{
  CLVisitMonitoringSubscriptionAdapter *v4;
  CLVisitMonitoringSubscriptionAdapter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLVisitMonitoringSubscriptionAdapter;
  v4 = -[CLVisitMonitoringSubscriptionAdapter init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_subscription = a3;
    -[CLVisitMonitoringSubscriptionAdapter setValid:](v4, "setValid:", 1);
  }
  return v5;
}

- (void)onVisit:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  if (a3)
  {
    sub_10140AFA8((uint64_t)self->_subscription, a3);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021B5A08);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Attempting to notify nil visit\"}", (uint8_t *)&v5, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021B5A08);
    }
    v4 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Attempting to notify nil visit", "{\"msg%{public}.0s\":\"#slv Attempting to notify nil visit\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)invalidate
{
  -[CLVisitMonitoringSubscriptionAdapter setValid:](self, "setValid:", 0);
}

- (BOOL)valid
{
  return self->_valid;
}

@end

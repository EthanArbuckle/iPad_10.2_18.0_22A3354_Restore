@implementation CLMiLoConnectionSubscriptionAdapter

- (CLMiLoConnectionSubscriptionAdapter)initWithMiLoConnectionSubscription:(void *)a3
{
  CLMiLoConnectionSubscriptionAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMiLoConnectionSubscriptionAdapter;
  result = -[CLMiLoConnectionSubscriptionAdapter init](&v5, "init");
  if (result)
    result->_subscription = a3;
  return result;
}

- (void)onMiLoServiceEventUpdate:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;

  v4 = sub_100606014(a3, (uint64_t)a2);
  if (v4)
  {
    v5 = v4;
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_1021480E0);
    v6 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v5[1];
      v8[0] = 68289282;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 1026;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiloServiceEventUpdate\", \"miloServiceEventType data\":%{public}d}", (uint8_t *)v8, 0x18u);
    }
    sub_100606060((uint64_t)self->_subscription, v5);
  }
}

- (void)onMiLoPredictionEventUpdate:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;

  v4 = sub_10060696C(a3, (uint64_t)a2);
  if (v4)
  {
    v5 = v4;
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_1021480E0);
    v6 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiloPredictionEventUpdate\"}", (uint8_t *)v7, 0x12u);
    }
    sub_1006069B8((uint64_t)self->_subscription, v5);
  }
}

- (void)onMiLoDebugResponse:(id)a3
{
  uint64_t *v4;
  uint64_t *v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;

  v4 = (uint64_t *)sub_100606B30(a3, (uint64_t)a2);
  if (v4)
  {
    v5 = v4;
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_1021480E0);
    v6 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiLoDebugResponse\"}", (uint8_t *)v7, 0x12u);
    }
    sub_100606B7C((uint64_t)self->_subscription, v5);
  }
}

- (void)onMiLoConnectionStatusEventUpdate:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;

  v4 = sub_100606DB8(a3, (uint64_t)a2);
  if (v4)
  {
    v5 = v4;
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_1021480E0);
    v6 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiLoConnectionStatusEventUpdate\"}", (uint8_t *)v7, 0x12u);
    }
    sub_100606E30((uint64_t)self->_subscription, v5);
  }
}

- (void)onMiLoObservationMetaInfo:(id)a3
{
  uint64_t *v4;
  uint64_t *v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;

  v4 = (uint64_t *)sub_100606FC4(a3, (uint64_t)a2);
  if (v4)
  {
    v5 = v4;
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_1021480E0);
    v6 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *v5;
      v8[0] = 68289282;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 1026;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiLoRecordingMetaInfo\", \"event type\":%{public}d}", (uint8_t *)v8, 0x18u);
    }
    sub_100607010((uint64_t)self->_subscription, (uint64_t)v5);
  }
}

- (void)onMiLoGenericEvent:(id)a3
{
  uint64_t *v4;
  uint64_t *v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;

  v4 = (uint64_t *)sub_1006072D4(a3, (uint64_t)a2);
  if (v4)
  {
    v5 = v4;
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_1021480E0);
    v6 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiLoGenericEventResponse\"}", (uint8_t *)v7, 0x12u);
    }
    sub_100607320((uint64_t)self->_subscription, v5);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(void *)a3
{
  self->_subscription = a3;
}

@end

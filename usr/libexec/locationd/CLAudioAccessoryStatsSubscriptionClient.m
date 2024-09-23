@implementation CLAudioAccessoryStatsSubscriptionClient

- (CLAudioAccessoryStatsSubscriptionClient)initWithSubscription:(CLAudioAccessoryStatsSubscription *)a3
{
  NSObject *v5;
  void **v6;
  CLAudioAccessoryStatsSubscriptionClient *result;
  uint64_t v8;
  _BYTE *v9;
  char *v10;
  char *v11;
  objc_super v12;
  _BYTE buf[12];
  char v14;
  int v15;
  _BYTE *v16;
  void *__p[2];
  char v18;

  if (qword_10229FD80 != -1)
    dispatch_once(&qword_10229FD80, &stru_102163758);
  v5 = qword_10229FD88;
  if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_INFO))
  {
    (*((void (**)(void **__return_ptr, CLAudioAccessoryStatsSubscription *))a3->var0 + 3))(__p, a3);
    v6 = v18 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[HeadphoneUsage] SubscriptionClient - initWithSubscription (%s)", buf, 0xCu);
    if (v18 < 0)
      operator delete(__p[0]);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_102163758);
    v8 = qword_10229FD88;
    (*((void (**)(_BYTE *__return_ptr, CLAudioAccessoryStatsSubscription *))a3->var0 + 3))(buf, a3);
    if (v14 >= 0)
      v9 = buf;
    else
      v9 = *(_BYTE **)buf;
    v15 = 136315138;
    v16 = v9;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v8, 1, "[HeadphoneUsage] SubscriptionClient - initWithSubscription (%s)", (const char *)&v15);
    v11 = v10;
    if (v14 < 0)
      operator delete(*(void **)buf);
    sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryStatsSubscriptionClient initWithSubscription:]", "%s\n", v11);
    if (v11 != (char *)__p)
      free(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)CLAudioAccessoryStatsSubscriptionClient;
  result = -[CLAudioAccessoryStatsSubscriptionClient init](&v12, "init");
  if (result)
    result->_subscription = a3;
  result->_valid = 1;
  return result;
}

- (void)onUsageMetricsEvent:(id)a3
{
  NSObject *v5;
  void **v6;
  CLAudioAccessoryStatsSubscription *subscription;
  NSObject *v8;
  uint64_t v9;
  _BYTE *v10;
  char *v11;
  char *v12;
  const char *v13;
  void **v14;
  _BYTE buf[12];
  char v16;
  int v17;
  _BYTE *v18;
  void *__p[2];
  char v20;

  if (qword_10229FD80 != -1)
    dispatch_once(&qword_10229FD80, &stru_102163758);
  v5 = qword_10229FD88;
  if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_INFO))
  {
    (*((void (**)(void **__return_ptr))self->_subscription->var0 + 3))(__p);
    v6 = v20 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[HeadphoneUsage] SubscriptionClient - onUsageMetricsEvent (%s)", buf, 0xCu);
    if (v20 < 0)
      operator delete(__p[0]);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_102163758);
    v9 = qword_10229FD88;
    (*((void (**)(_BYTE *__return_ptr))self->_subscription->var0 + 3))(buf);
    if (v16 >= 0)
      v10 = buf;
    else
      v10 = *(_BYTE **)buf;
    v17 = 136315138;
    v18 = v10;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v9, 1, "[HeadphoneUsage] SubscriptionClient - onUsageMetricsEvent (%s)", (const char *)&v17);
    v12 = v11;
    if (v16 < 0)
      operator delete(*(void **)buf);
    sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryStatsSubscriptionClient onUsageMetricsEvent:]", "%s\n", v12);
    if (v12 != (char *)__p)
      free(v12);
  }
  if (a3)
  {
    subscription = self->_subscription;
    if (subscription)
      sub_1009D2F2C((uint64_t)subscription, a3);
  }
  else
  {
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_102163758);
    v8 = qword_10229FD88;
    if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[HeadphoneUsage] Service Client: Nil data received", (uint8_t *)__p, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_10229FD80 != -1)
        dispatch_once(&qword_10229FD80, &stru_102163758);
      *(_WORD *)buf = 0;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_10229FD88, 16, "[HeadphoneUsage] Service Client: Nil data received", buf, 2);
      v14 = (void **)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLAudioAccessoryStatsSubscriptionClient onUsageMetricsEvent:]", "%s\n", v13);
      if (v14 != __p)
        free(v14);
    }
  }
}

- (void)invalidate
{
  NSObject *v3;
  void **v4;
  uint64_t v5;
  _BYTE *v6;
  char *v7;
  char *v8;
  _BYTE buf[12];
  char v10;
  int v11;
  _BYTE *v12;
  void *__p[2];
  char v14;

  if (qword_10229FD80 != -1)
    dispatch_once(&qword_10229FD80, &stru_102163758);
  v3 = qword_10229FD88;
  if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_DEFAULT))
  {
    (*((void (**)(void **__return_ptr))self->_subscription->var0 + 3))(__p);
    v4 = v14 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] SubscriptionClient - invalidate (%s)", buf, 0xCu);
    if (v14 < 0)
      operator delete(__p[0]);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_102163758);
    v5 = qword_10229FD88;
    (*((void (**)(_BYTE *__return_ptr))self->_subscription->var0 + 3))(buf);
    if (v10 >= 0)
      v6 = buf;
    else
      v6 = *(_BYTE **)buf;
    v11 = 136315138;
    v12 = v6;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v5, 0, "[HeadphoneUsage] SubscriptionClient - invalidate (%s)", (const char *)&v11);
    v8 = v7;
    if (v10 < 0)
      operator delete(*(void **)buf);
    sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryStatsSubscriptionClient invalidate]", "%s\n", v8);
    if (v8 != (char *)__p)
      free(v8);
  }
  self->_valid = 0;
  self->_subscription = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end

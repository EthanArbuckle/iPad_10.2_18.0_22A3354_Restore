@implementation CLRunningHealthKitWriter

- (CLRunningHealthKitWriter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLRunningHealthKitWriter;
  return -[CLRunningHealthKitWriter init](&v3, "init");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLRunningHealthKitWriter;
  -[CLRunningHealthKitWriter dealloc](&v2, "dealloc");
}

- (void)dataCollectorDidRequestCollectionThroughDate:(id)a3 completion:(id)a4
{
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (qword_10229FF30 != -1)
    dispatch_once(&qword_10229FF30, &stru_102182228);
  v6 = qword_10229FF38;
  if (os_log_type_enabled((os_log_t)qword_10229FF38, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[HealthKitWriter] Data collection requested through date %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF30 != -1)
      dispatch_once(&qword_10229FF30, &stru_102182228);
    v9 = 138543362;
    v10 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF38, 2, "[HealthKitWriter] Data collection requested through date %{public}@", &v9, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLRunningHealthKitWriter dataCollectorDidRequestCollectionThroughDate:completion:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end

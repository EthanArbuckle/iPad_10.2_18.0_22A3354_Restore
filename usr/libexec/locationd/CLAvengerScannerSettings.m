@implementation CLAvengerScannerSettings

- (CLAvengerScannerSettings)initWithUniverse:(id)a3
{
  self->_otaSettings = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
  operator new();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAvengerScannerSettings;
  -[CLAvengerScannerSettings dealloc](&v3, "dealloc");
  -[CLAvengerScannerSettings unregisterForOTASettingsNotification](self, "unregisterForOTASettingsNotification");

}

- (void)registerForOTASettingsNotification
{
  sub_1007530E0((uint64_t)self->_settingsSubscription.__ptr_.__value_);
}

- (void)unregisterForOTASettingsNotification
{
  sub_100753348(self->_settingsSubscription.__ptr_.__value_);
}

- (void)onUpdatedSettings:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021955B0);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLAvengerScannerSettings Received OTA settings %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021955B0);
    v8 = 138477827;
    v9 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0208, 2, "CLAvengerScannerSettings Received OTA settings %{private}@", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLAvengerScannerSettings onUpdatedSettings:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  self->_otaSettings = (NSDictionary *)objc_msgSend(a3, "copy");
}

- (id)settingsDictionary
{
  _QWORD v4[2];
  _QWORD v5[2];

  v4[0] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "AvengerScannerLongAggressiveScanNonCoexImpactedDuration");
  -[CLAvengerScannerSettings longAggressiveScanNonCoexImpactedDuration](self, "longAggressiveScanNonCoexImpactedDuration");
  v5[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[1] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "AvengerScannerLongAggressiveScanCoexImpactedDuration");
  -[CLAvengerScannerSettings longAggressiveScanCoexImpactedDuration](self, "longAggressiveScanCoexImpactedDuration");
  v5[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
}

- (double)getSettings:(id)a3
{
  int v5;
  int v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  double result;
  unsigned int v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  double v14;

  v14 = 0.0;
  sub_1001E4804(&v12);
  v5 = sub_1001FD98C(v12, (const char *)objc_msgSend(a3, "cStringUsingEncoding:", 1), &v14);
  v6 = v5;
  v7 = v13;
  if (!v13)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  do
    v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    if (v6)
      return v14;
  }
  else
  {
LABEL_5:
    if (v5)
      return v14;
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_otaSettings, "objectForKeyedSubscript:", a3))
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_otaSettings, "objectForKeyedSubscript:", a3), "doubleValue");
  }
  else
  {
    v11 = objc_msgSend(a3, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "AvengerScannerLongAggressiveScanNonCoexImpactedDuration"));
    result = 120.0;
    if (v11)
      return 39.0;
  }
  return result;
}

- (double)longAggressiveScanNonCoexImpactedDuration
{
  double result;

  -[CLAvengerScannerSettings getSettings:](self, "getSettings:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "AvengerScannerLongAggressiveScanNonCoexImpactedDuration"));
  return result;
}

- (double)longAggressiveScanCoexImpactedDuration
{
  double result;

  -[CLAvengerScannerSettings getSettings:](self, "getSettings:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "AvengerScannerLongAggressiveScanCoexImpactedDuration"));
  return result;
}

- (void).cxx_destruct
{
  sub_1004D8F50((uint64_t *)&self->_settingsSubscription, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end

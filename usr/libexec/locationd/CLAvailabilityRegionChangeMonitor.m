@implementation CLAvailabilityRegionChangeMonitor

- (CLAvailabilityRegionChangeMonitor)initWithSilo:(id)a3 andMonitorRegion:(id)a4 andOnRegionChangedCallback:(id)a5
{
  CLAvailabilityRegionChangeMonitor *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  NSString *lastCountryCode;
  int countryCodeNotificationToken;
  NSString *v15;
  int v16;
  const char *v17;
  uint8_t *v18;
  _QWORD handler[6];
  objc_super v20;
  int v21;
  NSString *v22;
  __int16 v23;
  int v24;
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  int v28;

  v20.receiver = self;
  v20.super_class = (Class)CLAvailabilityRegionChangeMonitor;
  v8 = -[CLAvailabilityRegionChangeMonitor init](&v20, "init");
  if (v8)
  {
    v8->_silo = (CLDispatchSilo *)a3;
    v8->_countryCodeNotificationToken = -1;
    v8->_regionChangeCallback = objc_msgSend(a5, "copy");
    v8->_lastCountryCode = (NSString *)objc_msgSend(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"), "countryCode");
    v9 = (const char *)GEOCountryConfigurationCountryCodeChangedDarwinNotification;
    v10 = -[CLDispatchSilo queue](v8->_silo, "queue");
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100B06834;
    handler[3] = &unk_102170860;
    handler[4] = v8;
    handler[5] = a4;
    notify_register_dispatch(v9, &v8->_countryCodeNotificationToken, v10, handler);
  }
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102170880);
  v11 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
  {
    lastCountryCode = v8->_lastCountryCode;
    countryCodeNotificationToken = v8->_countryCodeNotificationToken;
    *(_DWORD *)buf = 138478083;
    v26 = lastCountryCode;
    v27 = 1026;
    v28 = countryCodeNotificationToken;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#availabilityregionmonitor, monitor initialize, country code, %{private}@, token, %{public}d", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102170880);
    v15 = v8->_lastCountryCode;
    v16 = v8->_countryCodeNotificationToken;
    v21 = 138478083;
    v22 = v15;
    v23 = 1026;
    v24 = v16;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 0, "#availabilityregionmonitor, monitor initialize, country code, %{private}@, token, %{public}d", &v21, 18);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLAvailabilityRegionChangeMonitor initWithSilo:andMonitorRegion:andOnRegionChangedCallback:]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_silo = 0;
  self->_regionChangeCallback = 0;

  self->_lastCountryCode = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLAvailabilityRegionChangeMonitor;
  -[CLAvailabilityRegionChangeMonitor dealloc](&v3, "dealloc");
}

- (void)onGeoCountryCodeChangeNotification:(int)a3 andMonitorRegion:(id)a4
{
  id v7;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint8_t *v13;
  int v14;
  NSString *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unsigned int v33;

  v7 = objc_msgSend(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"), "countryCode");
  if (!a4)
    goto LABEL_14;
  if (-[NSString isEqualToString:](-[CLAvailabilityRegionChangeMonitor lastCountryCode](self, "lastCountryCode"), "isEqualToString:", a4))
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v7, "isEqualToString:", a4);
  }
  if (-[NSString isEqualToString:](-[CLAvailabilityRegionChangeMonitor lastCountryCode](self, "lastCountryCode"), "isEqualToString:", a4))
  {
    v9 = objc_msgSend(v7, "isEqualToString:", a4) ^ 1;
  }
  else
  {
    v9 = 0;
  }
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102170880);
  v10 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478851;
    v25 = -[CLAvailabilityRegionChangeMonitor lastCountryCode](self, "lastCountryCode");
    v26 = 2113;
    v27 = v7;
    v28 = 1026;
    v29 = a3;
    v30 = 1025;
    v31 = v8;
    v32 = 1025;
    v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#availabilityregionmonitor, last, %{private}@, new, %{private}@, token, %{public}d, entered, %{private}d, exited, %{private}d", buf, 0x28u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102170880);
    v11 = qword_1022A0028;
    v14 = 138478851;
    v15 = -[CLAvailabilityRegionChangeMonitor lastCountryCode](self, "lastCountryCode");
    v16 = 2113;
    v17 = v7;
    v18 = 1026;
    v19 = a3;
    v20 = 1025;
    v21 = v8;
    v22 = 1025;
    v23 = v9;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 0, "#availabilityregionmonitor, last, %{private}@, new, %{private}@, token, %{public}d, entered, %{private}d, exited, %{private}d", &v14, 40);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLAvailabilityRegionChangeMonitor onGeoCountryCodeChangeNotification:andMonitorRegion:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  if ((v8 | v9) == 1)
LABEL_14:
    (*((void (**)(void))-[CLAvailabilityRegionChangeMonitor regionChangeCallback](self, "regionChangeCallback") + 2))();
  -[CLAvailabilityRegionChangeMonitor setLastCountryCode:](self, "setLastCountryCode:", v7);
}

- (void)stopMonitoring
{
  int countryCodeNotificationToken;

  countryCodeNotificationToken = self->_countryCodeNotificationToken;
  if (countryCodeNotificationToken != -1)
    notify_cancel(countryCodeNotificationToken);
}

- (CLDispatchSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)regionChangeCallback
{
  return self->_regionChangeCallback;
}

- (void)setRegionChangeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)countryCodeNotificationToken
{
  return self->_countryCodeNotificationToken;
}

- (void)setCountryCodeNotificationToken:(int)a3
{
  self->_countryCodeNotificationToken = a3;
}

- (NSString)lastCountryCode
{
  return self->_lastCountryCode;
}

- (void)setLastCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end

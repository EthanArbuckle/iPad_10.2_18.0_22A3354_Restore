@implementation OSChargingSignals

+ (id)sharedInstance
{
  if (qword_100076880 != -1)
    dispatch_once(&qword_100076880, &stru_100060EE0);
  return (id)qword_100076888;
}

- (OSChargingSignals)init
{
  OSChargingSignals *v2;
  OSIWalletMonitor *v3;
  OSIWalletMonitor *walletMonitor;
  OSICalendarMonitor *v5;
  OSICalendarMonitor *calendarMonitor;
  OSILocationMonitor *v7;
  OSILocationMonitor *locationMonitor;
  os_log_t v9;
  OS_os_log *log;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OSChargingSignals;
  v2 = -[OSChargingSignals init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(OSIWalletMonitor);
    walletMonitor = v2->_walletMonitor;
    v2->_walletMonitor = v3;

    v5 = objc_alloc_init(OSICalendarMonitor);
    calendarMonitor = v2->_calendarMonitor;
    v2->_calendarMonitor = v5;

    v7 = objc_alloc_init(OSILocationMonitor);
    locationMonitor = v2->_locationMonitor;
    v2->_locationMonitor = v7;

    v9 = os_log_create("com.apple.osintelligence", "chargingsignals");
    log = v2->_log;
    v2->_log = (OS_os_log *)v9;

  }
  return v2;
}

- (id)determineNextEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  OS_os_log *log;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  OS_os_log *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingSignals walletMonitor](self, "walletMonitor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relevantEventDeadline"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingSignals calendarMonitor](self, "calendarMonitor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relevantEventDeadline"));

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "walletEvent %@, calendarEvent %@", (uint8_t *)&v15, 0x16u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  if ((objc_msgSend(v4, "isEqualToDate:", v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v10 = objc_msgSend(v6, "isEqualToDate:", v9);

    if ((v10 & 1) != 0)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
      goto LABEL_10;
    }
  }
  else
  {

  }
  v12 = self->_log;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Found flight information at %@", (uint8_t *)&v15, 0xCu);
  }
  v11 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
LABEL_10:
  v13 = (void *)v11;

  return v13;
}

- (OSIWalletMonitor)walletMonitor
{
  return (OSIWalletMonitor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWalletMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OSICalendarMonitor)calendarMonitor
{
  return (OSICalendarMonitor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCalendarMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OSILocationMonitor)locationMonitor
{
  return (OSILocationMonitor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocationMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_calendarMonitor, 0);
  objc_storeStrong((id *)&self->_walletMonitor, 0);
}

@end

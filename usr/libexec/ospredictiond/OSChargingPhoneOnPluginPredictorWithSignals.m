@implementation OSChargingPhoneOnPluginPredictorWithSignals

- (OSChargingTwoStagePredictorQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7
{
  id v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  double v26;
  OSChargingTwoStagePredictorQueryResult *result;
  objc_super v28;
  uint8_t buf[4];
  void *v30;

  v14 = a5;
  v15 = a7;
  v16 = a8;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class(self);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138412290;
    v30 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ Querying model", buf, 0xCu);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[OSChargingSignals sharedInstance](OSChargingSignals, "sharedInstance"));
  -[OSChargingPhoneOnPluginPredictorWithSignals setSignals:](self, "setSignals:", v20);

  *(_QWORD *)&retstr->var0 = 0;
  retstr->var1 = 0.0;
  retstr->var2 = 0.0;
  v28.receiver = self;
  v28.super_class = (Class)OSChargingPhoneOnPluginPredictorWithSignals;
  -[OSChargingTwoStagePredictorQueryResult chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:](&v28, "chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:", a4, v14, v15, v16, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingPhoneOnPluginPredictorWithSignals signals](self, "signals"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "determineNextEvent"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  LODWORD(v20) = objc_msgSend(v22, "isEqualToDate:", v23);

  if ((_DWORD)v20)
  {
    retstr->var0 = 0;
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v25 = objc_msgSend(v22, "isEqualToDate:", v24);

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v22, "timeIntervalSinceNow");
      retstr->var1 = v26;
    }
  }

  return result;
}

- (OSChargingSignals)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
  objc_storeStrong((id *)&self->_signals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signals, 0);
}

@end

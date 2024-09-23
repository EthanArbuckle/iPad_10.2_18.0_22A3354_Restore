@implementation _DASSystemConditionsRecorder

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059068;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB848 != -1)
    dispatch_once(&qword_1001AB848, block);
  return (id)qword_1001AB840;
}

- (_DASSystemConditionsRecorder)init
{
  _DASSystemConditionsRecorder *v2;
  uint64_t v3;
  _CDContext *context;
  os_log_t v5;
  OS_os_log *log;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_DASSystemConditionsRecorder;
  v2 = -[_DASSystemConditionsRecorder init](&v14, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    context = v2->_context;
    v2->_context = (_CDContext *)v3;

    v5 = os_log_create("com.apple.duetactivityscheduler", "systemconditionrecorder");
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.duetactivityscheduler.systemConditionsRecorder", v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)recordPowerManagementStatus
{
  _CDContext *context;
  void *v4;
  void *v5;
  _CDContext *v6;
  void *v7;
  void *v8;
  _CDContext *v9;
  void *v10;
  void *v11;
  _CDContext *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  context = self->_context;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForThermalPressureLevel](_CDContextQueries, "keyPathForThermalPressureLevel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v5, CFSTR("ThermalPressure"));

  v6 = self->_context;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, CFSTR("UserActivityStatus"));

  v9 = self->_context;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/system/peakPowerPressureLevel")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, CFSTR("PeakPowerPressure"));

  v12 = self->_context;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForEnergyBudgetRemainingStatus](_CDContextQueries, "keyPathForEnergyBudgetRemainingStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("EnergyBudget"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASGridDataManager sharedInstance](_DASGridDataManager, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v15, "isHighCarbonImpactWindow")));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("CarbonImpactWindow"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  objc_msgSend(v17, "sendDataToPPS:subsystem:category:", v18, CFSTR("BackgroundProcessing"), CFSTR("SystemConditionsPowerManagement"));

}

- (void)recordNetworkStatus
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _CDContext *context;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = +[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", self->_context);
  v4 = +[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", self->_context);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v3));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, CFSTR("WifiQuality"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("CellQuality"));

  context = self->_context;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus](_CDContextQueries, "keyPathForNetworkingBudgetRemainingStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v8));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("DataBudget"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASInternetSharingPolicy policyInstance](_DASInternetSharingPolicy, "policyInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "enabled")));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("InternetSharingOn"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  objc_msgSend(v12, "sendDataToPPS:subsystem:category:", v13, CFSTR("BackgroundProcessing"), CFSTR("SystemConditionsNetwork"));

}

- (void)recordMotionStatus
{
  _CDContext *context;
  void *v4;
  void *v5;
  id v6;
  _CDContext *v7;
  void *v8;
  void *v9;
  _CDContext *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  _CDContext *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  _CDContext *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  id v23;

  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  context = self->_context;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForMotionState](_CDContextQueries, "keyPathForMotionState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "integerValue");

  v7 = self->_context;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCallInProgressStatus](_CDContextQueries, "keyPathForCallInProgressStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8));
  LOBYTE(v7) = objc_msgSend(v9, "BOOLValue");

  v10 = self->_context;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCarplayConnectedStatus](_CDContextQueries, "keyPathForCarplayConnectedStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11));
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = self->_context;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/car/isConnected")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15));
  v17 = objc_msgSend(v16, "BOOLValue");

  v18 = self->_context;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath ephemeralKeyPathWithKey:](_CDContextualKeyPath, "ephemeralKeyPathWithKey:", CFSTR("/maps/navigationInProgress")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19));
  v21 = objc_msgSend(v20, "BOOLValue");

  if ((v7 & 1) != 0
    || (v13 & 1) != 0
    || (v17 & 1) != 0
    || (v21 & 1) != 0
    || v6 != (id)_DASMotionStateAny && v6 != (id)_DASMotionStateStationary)
  {
    objc_msgSend(v23, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("InUseOrMotion"));
  }
  objc_msgSend(v23, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("InUseOrMotion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  objc_msgSend(v22, "sendDataToPPS:subsystem:category:", v23, CFSTR("BackgroundProcessing"), CFSTR("SystemConditionsInUseOrMotion"));

}

- (void)recordBatteryStatus
{
  _CDContext *context;
  void *v4;
  void *v5;
  _CDContext *v6;
  void *v7;
  void *v8;
  _CDContext *v9;
  void *v10;
  void *v11;
  _CDContext *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  context = self->_context;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
  v22 = (id)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = self->_context;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("BatteryLevel"));

  v9 = self->_context;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("IsPluggedIn"));

  v12 = self->_context;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLowPowerModeStatus](_CDContextQueries, "keyPathForLowPowerModeStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("LowPowerMode"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryAdapterIsWirelessKey](_CDContextQueries, "batteryAdapterIsWirelessKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v15));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("IsWireless"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryIsChargingKey](_CDContextQueries, "batteryIsChargingKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v17));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("IsCharging"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryAdapterTypeKey](_CDContextQueries, "batteryAdapterTypeKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v19));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("AdapterType"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  objc_msgSend(v21, "sendDataToPPS:subsystem:category:", v5, CFSTR("BackgroundProcessing"), CFSTR("SystemConditionsBattery"));

}

- (void)recordForKeyPaths:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  _DASSystemConditionsRecorder *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000599B4;
  block[3] = &unk_10015D558;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end

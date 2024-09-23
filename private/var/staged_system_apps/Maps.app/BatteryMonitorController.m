@implementation BatteryMonitorController

+ (id)sharedInstance
{
  if (qword_1014D3CF0 != -1)
    dispatch_once(&qword_1014D3CF0, &stru_1011E0810);
  return (id)qword_1014D3CE8;
}

- (id)beginMonitoringBattery
{
  NSHashTable *v3;
  NSHashTable *tokens;
  _BatteryMonitorConcreteToken *v5;

  if (!self->_tokens)
  {
    v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    tokens = self->_tokens;
    self->_tokens = v3;

  }
  v5 = objc_alloc_init(_BatteryMonitorConcreteToken);
  -[_BatteryMonitorConcreteToken setConcreteTokenDelegate:](v5, "setConcreteTokenDelegate:", self);
  -[NSHashTable addObject:](self->_tokens, "addObject:", v5);
  -[BatteryMonitorController _updateBatteryMonitoring](self, "_updateBatteryMonitoring");
  return v5;
}

- (void)_updateBatteryMonitoring
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_tokens, "allObjects"));
  v4 = objc_msgSend(v3, "count") != 0;

  -[BatteryMonitorController setIsMonitoring:](self, "setIsMonitoring:", v4);
}

- (void)setIsMonitoring:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t Log;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;

  if (self->_isMonitoring != a3)
  {
    v3 = a3;
    self->_isMonitoring = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v4, "setBatteryMonitoringEnabled:", v3);

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "BatteryMonitorController");
    v6 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = NSStringFromBOOL(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Monitoring Battery: %@", (uint8_t *)&v9, 0xCu);

    }
  }
}

- (void)batteryMonitorConcreteTokenWillInvalidate:(id)a3
{
  -[NSHashTable removeObject:](self->_tokens, "removeObject:", a3);
  -[BatteryMonitorController _updateBatteryMonitoring](self, "_updateBatteryMonitoring");
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end

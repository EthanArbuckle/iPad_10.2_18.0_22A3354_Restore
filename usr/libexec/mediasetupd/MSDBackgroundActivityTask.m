@implementation MSDBackgroundActivityTask

- (MSDBackgroundActivityTask)initWithIdentifier:(id)a3
{
  id v5;
  MSDBackgroundActivityTask *v6;
  MSDBackgroundActivityTask *v7;
  MSDBackgroundActivityTask *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v5 = a3;
  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)MSDBackgroundActivityTask;
    v6 = -[MSDBackgroundActivityTask init](&v19, "init");
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_identifier, a3);
      v7->_qualityOfService = 9;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = sub_10002E034();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100003870(v10, v11, v12, v13, v14, v15, v16, v17);

    v8 = 0;
  }

  return v8;
}

- (void)checkIn
{
  id v3;
  NSObject *v4;
  NSString *identifier;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  NSString *v18;

  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    v15 = 136315395;
    v16 = "-[MSDBackgroundActivityTask checkIn]";
    v17 = 2113;
    v18 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Checking-in with identifier %{private}@", (uint8_t *)&v15, 0x16u);
  }

  if (self->_activityBlock)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSBackgroundActivityScheduler), "initWithIdentifier:", self->_identifier);
    -[NSObject setPreregistered:](v6, "setPreregistered:", 1);
  }
  else
  {
    v7 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000038A0(v6, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (void)invalidate
{
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)NSBackgroundActivityScheduler), "initWithIdentifier:", self->_identifier);
  objc_msgSend(v2, "invalidate");

}

- (void)schedule
{
  id activityBlock;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSString *identifier;
  _BOOL4 repeats;
  _BOOL4 allowBattery;
  _BOOL4 requireNetworkConnection;
  _BOOL4 requireInexpensiveNetworkConnection;
  double interval;
  int64_t qualityOfService;
  xpc_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  NSString *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  double v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  int64_t v35;

  activityBlock = self->_activityBlock;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (activityBlock)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      repeats = self->_repeats;
      allowBattery = self->_allowBattery;
      requireNetworkConnection = self->_requireNetworkConnection;
      requireInexpensiveNetworkConnection = self->_requireInexpensiveNetworkConnection;
      interval = self->_interval;
      qualityOfService = self->_qualityOfService;
      v22 = 138479363;
      v23 = identifier;
      v24 = 1024;
      v25 = repeats;
      v26 = 2048;
      v27 = interval;
      v28 = 1024;
      v29 = allowBattery;
      v30 = 1024;
      v31 = requireNetworkConnection;
      v32 = 1024;
      v33 = requireInexpensiveNetworkConnection;
      v34 = 2048;
      v35 = qualityOfService;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduling block for execution at a later time: identifier %{private}@, repeats: %d, interval %f, allowBattery: %d, networkConnection: %d, inexpensiveNetworkConnection: %d, Quality of service %ld", (uint8_t *)&v22, 0x38u);
    }

    v6 = objc_msgSend(objc_alloc((Class)NSBackgroundActivityScheduler), "initWithIdentifier:", self->_identifier);
    -[NSObject setInterval:](v6, "setInterval:", fmax(self->_interval, 2.0));
    -[NSObject setQualityOfService:](v6, "setQualityOfService:", self->_qualityOfService);
    -[NSObject setRepeats:](v6, "setRepeats:", self->_repeats);
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_ALLOW_BATTERY, self->_allowBattery);
    xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, self->_requireInexpensiveNetworkConnection);
    xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, self->_requireNetworkConnection);
    -[NSObject _setAdditionalXPCActivityProperties:](v6, "_setAdditionalXPCActivityProperties:", v14);
    -[NSObject scheduleWithBlock:](v6, "scheduleWithBlock:", self->_activityBlock);

  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1000038D0(v6, v15, v16, v17, v18, v19, v20, v21);
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)activityBlock
{
  return self->_activityBlock;
}

- (void)setActivityBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

- (void)setAllowBattery:(BOOL)a3
{
  self->_allowBattery = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (BOOL)requireInexpensiveNetworkConnection
{
  return self->_requireInexpensiveNetworkConnection;
}

- (void)setRequireInexpensiveNetworkConnection:(BOOL)a3
{
  self->_requireInexpensiveNetworkConnection = a3;
}

- (BOOL)requireNetworkConnection
{
  return self->_requireNetworkConnection;
}

- (void)setRequireNetworkConnection:(BOOL)a3
{
  self->_requireNetworkConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

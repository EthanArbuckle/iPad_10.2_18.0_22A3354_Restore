@implementation NSPPrivateRelayIncompatibleNetworkStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.privateRelayIncompatibleNetworkStats");
}

- (id)analyticsDict
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateRelayIncompatibleNetworkStats tierType](self, "tierType"));

  if (!v3)
  {
    v15 = nplog_obj(v4, v5, v6);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0;
    }
    v19 = 136315138;
    v20 = "-[NSPPrivateRelayIncompatibleNetworkStats analyticsDict]";
    v17 = "%s called with null self.tierType";
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v19, 0xCu);
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateRelayIncompatibleNetworkStats interfaceType](self, "interfaceType"));

  if (!v7)
  {
    v18 = nplog_obj(v8, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v19 = 136315138;
    v20 = "-[NSPPrivateRelayIncompatibleNetworkStats analyticsDict]";
    v17 = "%s called with null self.interfaceType";
    goto LABEL_10;
  }
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateRelayIncompatibleNetworkStats tierType](self, "tierType"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("TierType"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivateRelayIncompatibleNetworkStats interfaceType](self, "interfaceType"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("InterfaceType"));

  return v11;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
  objc_storeStrong((id *)&self->_tierType, a3);
}

- (NSString)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceType, 0);
  objc_storeStrong((id *)&self->_tierType, 0);
}

@end

@implementation NSPSwitchEgressProxyStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.SwitchEgressProxyStats");
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
  void *v14;
  void *v15;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  const char *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPSwitchEgressProxyStats tierType](self, "tierType"));

  if (!v3)
  {
    v17 = nplog_obj(v4, v5, v6);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0;
    }
    v21 = 136315138;
    v22 = "-[NSPSwitchEgressProxyStats analyticsDict]";
    v19 = "%s called with null self.tierType";
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, v19, (uint8_t *)&v21, 0xCu);
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPSwitchEgressProxyStats vendor](self, "vendor"));

  if (!v7)
  {
    v20 = nplog_obj(v8, v9, v10);
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v21 = 136315138;
    v22 = "-[NSPSwitchEgressProxyStats analyticsDict]";
    v19 = "%s called with null self.vendor";
    goto LABEL_10;
  }
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPSwitchEgressProxyStats tierType](self, "tierType"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("TierType"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPSwitchEgressProxyStats vendor](self, "vendor"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("Vendor"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPSwitchEgressProxyStats primaryProxy](self, "primaryProxy")));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("PrimaryProxy"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPSwitchEgressProxyStats fallbackProxy](self, "fallbackProxy")));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("FallbackProxy"));

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

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
  objc_storeStrong((id *)&self->_vendor, a3);
}

- (BOOL)primaryProxy
{
  return self->_primaryProxy;
}

- (void)setPrimaryProxy:(BOOL)a3
{
  self->_primaryProxy = a3;
}

- (BOOL)fallbackProxy
{
  return self->_fallbackProxy;
}

- (void)setFallbackProxy:(BOOL)a3
{
  self->_fallbackProxy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_tierType, 0);
}

@end

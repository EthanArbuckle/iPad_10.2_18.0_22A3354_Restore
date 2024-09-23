@implementation NSPIPAddressLocationPreferenceStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.ipLocationPreference");
}

- (id)analyticsDict
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPIPAddressLocationPreferenceStats tierType](self, "tierType"));

  if (v3)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPIPAddressLocationPreferenceStats locationPreference](self, "locationPreference")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("LocationSharingPreference"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPIPAddressLocationPreferenceStats tierType](self, "tierType"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("TierType"));

    return v7;
  }
  else
  {
    v11 = nplog_obj(v4, v5, v6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315138;
      v14 = "-[NSPIPAddressLocationPreferenceStats analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null self.tierType", (uint8_t *)&v13, 0xCu);
    }

    return 0;
  }
}

- (unint64_t)locationPreference
{
  return self->_locationPreference;
}

- (void)setLocationPreference:(unint64_t)a3
{
  self->_locationPreference = a3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
  objc_storeStrong((id *)&self->_tierType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tierType, 0);
}

@end

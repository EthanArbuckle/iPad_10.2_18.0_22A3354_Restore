@implementation NSPBadTokenInfoStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.badTokenInfoStats");
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPBadTokenInfoStats tierType](self, "tierType"));

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
    v22 = "-[NSPBadTokenInfoStats analyticsDict]";
    v19 = "%s called with null self.tierType";
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, v19, (uint8_t *)&v21, 0xCu);
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPBadTokenInfoStats tokenProxy](self, "tokenProxy"));

  if (!v7)
  {
    v20 = nplog_obj(v8, v9, v10);
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v21 = 136315138;
    v22 = "-[NSPBadTokenInfoStats analyticsDict]";
    v19 = "%s called with null self.tokenProxy";
    goto LABEL_10;
  }
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPBadTokenInfoStats tierType](self, "tierType"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("TierType"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPBadTokenInfoStats tokenProxy](self, "tokenProxy"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("TokenProxy"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPBadTokenInfoStats configAgeHours](self, "configAgeHours")));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("ConfigAge"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPBadTokenInfoStats configTag](self, "configTag"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("ConfigTag"));

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

- (NSString)tokenProxy
{
  return self->_tokenProxy;
}

- (void)setTokenProxy:(id)a3
{
  objc_storeStrong((id *)&self->_tokenProxy, a3);
}

- (unint64_t)configAgeHours
{
  return self->_configAgeHours;
}

- (void)setConfigAgeHours:(unint64_t)a3
{
  self->_configAgeHours = a3;
}

- (NSString)configTag
{
  return self->_configTag;
}

- (void)setConfigTag:(id)a3
{
  objc_storeStrong((id *)&self->_configTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configTag, 0);
  objc_storeStrong((id *)&self->_tokenProxy, 0);
  objc_storeStrong((id *)&self->_tierType, 0);
}

@end

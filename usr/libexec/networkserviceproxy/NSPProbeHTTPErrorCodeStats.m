@implementation NSPProbeHTTPErrorCodeStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.ProbeHTTPErrorStats");
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
  void *v10;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeHTTPErrorCodeStats HTTPErrorCode](self, "HTTPErrorCode"));

  if (v3)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeHTTPErrorCodeStats interfaceType](self, "interfaceType"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("InterfaceType"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPProbeHTTPErrorCodeStats directPath](self, "directPath")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("DirectPath"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeHTTPErrorCodeStats HTTPErrorCode](self, "HTTPErrorCode"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("HTTPCode"));

    return v7;
  }
  else
  {
    v12 = nplog_obj(v4, v5, v6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = 136315138;
      v15 = "-[NSPProbeHTTPErrorCodeStats analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s called with null self.HTTPErrorCode", (uint8_t *)&v14, 0xCu);
    }

    return 0;
  }
}

- (NSString)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceType, a3);
}

- (BOOL)directPath
{
  return self->_directPath;
}

- (void)setDirectPath:(BOOL)a3
{
  self->_directPath = a3;
}

- (NSNumber)HTTPErrorCode
{
  return self->_HTTPErrorCode;
}

- (void)setHTTPErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_HTTPErrorCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HTTPErrorCode, 0);
  objc_storeStrong((id *)&self->_interfaceType, 0);
}

@end

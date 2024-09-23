@implementation NSPDeviceIdentityStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.deviceIdentityStats");
}

- (id)analyticsDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPDeviceIdentityStats success](self, "success")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Success"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPDeviceIdentityStats errorDomain](self, "errorDomain"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ErrorDomain"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSPDeviceIdentityStats errorCode](self, "errorCode")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ErrorCode"));

  return v3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end

@implementation NSPTokenFetchAnalytics

- (id)eventName
{
  return CFSTR("com.apple.nsp.tokenFetch");
}

- (id)analyticsDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenFetchAnalytics proxyURL](self, "proxyURL"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ProxyURL"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenFetchAnalytics proxyVendor](self, "proxyVendor"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ProxyVendor"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenFetchAnalytics tierType](self, "tierType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("TierType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenFetchAnalytics authenticationType](self, "authenticationType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("AuthenticationType"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenFetchAnalytics requestedServerUUID](self, "requestedServerUUID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("RequestedServerUUID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPTokenFetchAnalytics requestedTokenCount](self, "requestedTokenCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("RequestedTokenCount"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPTokenFetchAnalytics activatedCount](self, "activatedCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ActivatedTokenCount"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSPTokenFetchAnalytics httpCode](self, "httpCode")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("HTTPCode"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSPTokenFetchAnalytics nsurlErrorCode](self, "nsurlErrorCode")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("NSURLErrorCode"));

  -[NSPTokenFetchAnalytics latency](self, "latency");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("Latency"));

  return v3;
}

- (NSString)proxyURL
{
  return self->_proxyURL;
}

- (void)setProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_proxyURL, a3);
}

- (NSString)proxyVendor
{
  return self->_proxyVendor;
}

- (void)setProxyVendor:(id)a3
{
  objc_storeStrong((id *)&self->_proxyVendor, a3);
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
  objc_storeStrong((id *)&self->_tierType, a3);
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationType, a3);
}

- (NSString)requestedServerUUID
{
  return self->_requestedServerUUID;
}

- (void)setRequestedServerUUID:(id)a3
{
  self->_requestedServerUUID = (NSString *)a3;
}

- (unint64_t)requestedTokenCount
{
  return self->_requestedTokenCount;
}

- (void)setRequestedTokenCount:(unint64_t)a3
{
  self->_requestedTokenCount = a3;
}

- (unint64_t)activatedCount
{
  return self->_activatedCount;
}

- (void)setActivatedCount:(unint64_t)a3
{
  self->_activatedCount = a3;
}

- (int64_t)httpCode
{
  return self->_httpCode;
}

- (void)setHttpCode:(int64_t)a3
{
  self->_httpCode = a3;
}

- (int64_t)nsurlErrorCode
{
  return self->_nsurlErrorCode;
}

- (void)setNsurlErrorCode:(int64_t)a3
{
  self->_nsurlErrorCode = a3;
}

- (double)latency
{
  return self->_latency;
}

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_tierType, 0);
  objc_storeStrong((id *)&self->_proxyVendor, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);
}

@end

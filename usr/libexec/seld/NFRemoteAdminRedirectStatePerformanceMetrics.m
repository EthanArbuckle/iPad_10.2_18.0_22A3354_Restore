@implementation NFRemoteAdminRedirectStatePerformanceMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFRemoteAdminRedirectStatePerformanceMetrics)initWithCoder:(id)a3
{
  id v4;
  NFRemoteAdminRedirectStatePerformanceMetrics *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  id v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  id v22;
  uint64_t v23;
  NSError *nsUrlSessionError;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NFRemoteAdminRedirectStatePerformanceMetrics;
  v5 = -[NFRemoteAdminRedirectStatePerformanceMetrics init](&v26, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("totalResponsesWithBody"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_totalResponsesWithBody = objc_msgSend(v7, "unsignedIntegerValue");

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("transferWithMaxResponseTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5->_transferWithMaxResponseTime = objc_msgSend(v9, "unsignedIntegerValue");

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("maxResponseTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v11, "doubleValue");
    v5->_maxNetworkResponseTime = v12;

    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("totalResponseTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v14, "doubleValue");
    v5->_totalNetworkResponseTime = v15;

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("totalAPDUTime"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v17, "doubleValue");
    v5->_totalAPDUTime = v18;

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("totalSessionTime"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v20, "doubleValue");
    v5->_totalSessionTime = v21;

    v22 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSError), CFSTR("nsUrlSessionError"));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    nsUrlSessionError = v5->_nsUrlSessionError;
    v5->_nsUrlSessionError = (NSError *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t totalResponsesWithBody;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  totalResponsesWithBody = self->_totalResponsesWithBody;
  v11 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", totalResponsesWithBody));
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("totalResponsesWithBody"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_transferWithMaxResponseTime));
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("transferWithMaxResponseTime"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_maxNetworkResponseTime));
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("maxResponseTime"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_totalNetworkResponseTime));
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("totalResponseTime"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_totalAPDUTime));
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("totalAPDUTime"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_totalSessionTime));
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("totalSessionTime"));

  objc_msgSend(v11, "encodeObject:forKey:", self->_nsUrlSessionError, CFSTR("nsUrlSessionError"));
}

- (id)asDictionary
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSError *nsUrlSessionError;
  void *v9;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_totalResponsesWithBody));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, CFSTR("totalResponsesWithBody"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_transferWithMaxResponseTime));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, CFSTR("transferWithMaxResponseTime"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)(self->_totalNetworkResponseTime * 1000.0)));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, CFSTR("sumOfAllResponseTime"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)(self->_maxNetworkResponseTime * 1000.0)));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, CFSTR("maxResponseTime"));

  nsUrlSessionError = self->_nsUrlSessionError;
  if (nsUrlSessionError)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSError code](nsUrlSessionError, "code")));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, CFSTR("clientNSURLSessionErrorCode"));

  }
  return v3;
}

- (unsigned)totalResponsesWithBody
{
  return self->_totalResponsesWithBody;
}

- (void)setTotalResponsesWithBody:(unsigned int)a3
{
  self->_totalResponsesWithBody = a3;
}

- (unsigned)transferWithMaxResponseTime
{
  return self->_transferWithMaxResponseTime;
}

- (void)setTransferWithMaxResponseTime:(unsigned int)a3
{
  self->_transferWithMaxResponseTime = a3;
}

- (double)maxNetworkResponseTime
{
  return self->_maxNetworkResponseTime;
}

- (void)setMaxNetworkResponseTime:(double)a3
{
  self->_maxNetworkResponseTime = a3;
}

- (double)totalNetworkResponseTime
{
  return self->_totalNetworkResponseTime;
}

- (void)setTotalNetworkResponseTime:(double)a3
{
  self->_totalNetworkResponseTime = a3;
}

- (double)totalAPDUTime
{
  return self->_totalAPDUTime;
}

- (void)setTotalAPDUTime:(double)a3
{
  self->_totalAPDUTime = a3;
}

- (double)totalSessionTime
{
  return self->_totalSessionTime;
}

- (void)setTotalSessionTime:(double)a3
{
  self->_totalSessionTime = a3;
}

- (NSError)nsUrlSessionError
{
  return self->_nsUrlSessionError;
}

- (void)setNsUrlSessionError:(id)a3
{
  objc_storeStrong((id *)&self->_nsUrlSessionError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsUrlSessionError, 0);
}

@end

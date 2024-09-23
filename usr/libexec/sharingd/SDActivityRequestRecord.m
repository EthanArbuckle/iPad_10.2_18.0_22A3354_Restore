@implementation SDActivityRequestRecord

- (SDActivityRequestRecord)init
{
  SDActivityRequestRecord *v2;
  NSDate *v3;
  NSDate *requestCreatedDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDActivityRequestRecord;
  v2 = -[SDActivityRequestRecord init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSDate);
    requestCreatedDate = v2->_requestCreatedDate;
    v2->_requestCreatedDate = v3;

  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSDate *requestCreatedDate;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord requestIdentifier](self, "requestIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord deviceIdentifier](self, "deviceIdentifier"));
  requestCreatedDate = self->_requestCreatedDate;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord completionHandler](self, "completionHandler"));
  if (v7)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord timeoutTimer](self, "timeoutTimer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord error](self, "error"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("message/requestIdentifier:%@, deviceIdentifier:%@, requestCreated:%@, hasCompletionHandler:%@, _timeoutTimer:%@, error:%@"), v4, v5, requestCreatedDate, v8, v9, v10));

  return v11;
}

- (NSDate)requestCreatedDate
{
  return self->_requestCreatedDate;
}

- (void)setRequestCreatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (int64_t)timeoutTimeInterval
{
  return self->_timeoutTimeInterval;
}

- (void)setTimeoutTimeInterval:(int64_t)a3
{
  self->_timeoutTimeInterval = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requestCreatedDate, 0);
}

@end

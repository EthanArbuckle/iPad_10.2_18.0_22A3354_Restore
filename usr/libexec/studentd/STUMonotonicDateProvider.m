@implementation STUMonotonicDateProvider

- (STUMonotonicDateProvider)init
{
  void *v3;
  STUMonotonicDateProvider *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = -[STUMonotonicDateProvider initWithProcessInfo:](self, "initWithProcessInfo:", v3);

  return v4;
}

- (STUMonotonicDateProvider)initWithProcessInfo:(id)a3
{
  id v6;
  STUMonotonicDateProvider *v7;
  STUMonotonicDateProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUMonotonicDateProvider.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processInfo"));

  }
  v11.receiver = self;
  v11.super_class = (Class)STUMonotonicDateProvider;
  v7 = -[STUMonotonicDateProvider init](&v11, "init");
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_processInfo, a3);

  return v8;
}

- (NSDate)currentDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUMonotonicDateProvider processInfo](self, "processInfo"));
  objc_msgSend(v2, "systemUptime");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));

  return (NSDate *)v3;
}

- (NSDate)distantPast
{
  return +[NSDate distantPast](NSDate, "distantPast");
}

- (NSDate)distantFuture
{
  return +[NSDate distantFuture](NSDate, "distantFuture");
}

- (NSString)sessionToken
{
  NSString *mSessionToken;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  void *v12;
  NSString *v13;
  void *v14;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUMonotonicDateProvider.m"), 52, CFSTR("%@ must be called from the main thread"), v14);

  }
  mSessionToken = self->mSessionToken;
  if (!mSessionToken)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRKSystemInfo sharedSystemInfo](CRKSystemInfo, "sharedSystemInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bootDate"));
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)v7));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
    v10 = self->mSessionToken;
    self->mSessionToken = v9;

    mSessionToken = self->mSessionToken;
  }
  return mSessionToken;
}

- (NSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->mSessionToken, 0);
}

@end

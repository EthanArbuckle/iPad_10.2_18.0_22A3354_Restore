@implementation STUDeadmanTokenAuthenticator

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000353A0;
  block[3] = &unk_1000C9FE0;
  block[4] = a1;
  if (qword_1000FC2E0 != -1)
    dispatch_once(&qword_1000FC2E0, block);
  return (id)qword_1000FC2E8;
}

- (STUDeadmanTokenAuthenticator)init
{
  return -[STUDeadmanTokenAuthenticator initWithTimeInterval:](self, "initWithTimeInterval:", 5.0);
}

- (STUDeadmanTokenAuthenticator)initWithTimeInterval:(double)a3
{
  STUDeadmanTokenAuthenticator *v5;
  STUDeadmanTokenAuthenticator *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *mTimersByToken;
  void *v11;
  objc_super v12;

  if (a3 < 0.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDeadmanTokenAuthenticator.m"), 34, CFSTR("Time interval must be nonnegative"));

  }
  v12.receiver = self;
  v12.super_class = (Class)STUDeadmanTokenAuthenticator;
  v5 = -[STUDeadmanTokenAuthenticator init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    v5->mTimeInterval = a3;
    v7 = objc_opt_new(NSMutableDictionary);
    mTimersByToken = v6->mTimersByToken;
    v6->mTimersByToken = v7;

  }
  return v6;
}

- (BOOL)isTokenAuthenticated:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDeadmanTokenAuthenticator.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mTimersByToken, "objectForKeyedSubscript:", v5));
  v7 = v6 != 0;

  return v7;
}

- (void)authenticateToken:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDeadmanTokenAuthenticator.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

    v5 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mTimersByToken, "objectForKeyedSubscript:", v5));
  objc_msgSend(v6, "invalidate");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timerDidFire:", v9, 0, self->mTimeInterval));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mTimersByToken, "setObject:forKeyedSubscript:", v7, v9);

}

- (void)deauthenticateToken:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDeadmanTokenAuthenticator.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

    v5 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mTimersByToken, "objectForKeyedSubscript:", v5));
  objc_msgSend(v6, "fire");

}

- (id)authenticatedTokens
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->mTimersByToken, "allKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

- (void)timerDidFire:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  -[NSMutableDictionary removeObjectForKey:](self->mTimersByToken, "removeObjectForKey:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTimersByToken, 0);
}

@end

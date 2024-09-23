@implementation STUOpenAppUsingFrontBoardOperation

- (STUOpenAppUsingFrontBoardOperation)initWithConfiguration:(id)a3 primitives:(id)a4
{
  id v6;
  id v7;
  STUOpenAppUsingFrontBoardOperation *v8;
  STULaunchAppConfiguration *v9;
  STULaunchAppConfiguration *configuration;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STUOpenAppUsingFrontBoardOperation;
  v8 = -[STUOpenAppUsingFrontBoardOperation init](&v12, "init");
  if (v8)
  {
    v9 = (STULaunchAppConfiguration *)objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = v9;

    objc_storeStrong((id *)&v8->_primitives, a4);
    v8->_attemptsRemaining = 5;
  }

  return v8;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  -[STUOpenAppUsingFrontBoardOperation tryToOpenAppIfAttemptsRemainAfterDelay:](self, "tryToOpenAppIfAttemptsRemainAfterDelay:", 0.0);
}

- (void)tryToOpenAppIfAttemptsRemainAfterDelay:(double)a3
{
  uint64_t v5;
  dispatch_time_t v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  _QWORD block[5];

  if (-[STUOpenAppUsingFrontBoardOperation attemptsRemaining](self, "attemptsRemaining"))
  {
    -[STUOpenAppUsingFrontBoardOperation setAttemptsRemaining:](self, "setAttemptsRemaining:", (char *)-[STUOpenAppUsingFrontBoardOperation attemptsRemaining](self, "attemptsRemaining") - 1);
    if (a3 == 0.0)
    {
      -[STUOpenAppUsingFrontBoardOperation tryToOpenApp](self, "tryToOpenApp");
    }
    else
    {
      v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      global_queue = dispatch_get_global_queue(33, 0);
      v8 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003C864;
      block[3] = &unk_1000C97E8;
      block[4] = self;
      dispatch_after(v6, v8, block);

    }
  }
  else
  {
    v5 = CRKErrorWithCodeAndUserInfo(3, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(v5);
    -[STUOpenAppUsingFrontBoardOperation finishWithError:](self, "finishWithError:", v9);

  }
}

- (void)tryToOpenApp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppUsingFrontBoardOperation primitives](self, "primitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontBoardServicesPrimitives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppUsingFrontBoardOperation configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppUsingFrontBoardOperation makeOptions](self, "makeOptions"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003C93C;
  v8[3] = &unk_1000CA240;
  v8[4] = self;
  objc_msgSend(v4, "openApplication:withOptions:completion:", v6, v7, v8);

}

- (BOOL)shouldRetryAfterError:(id)a3
{
  return -[STUOpenAppUsingFrontBoardOperation isGuidedAccessActiveError:](self, "isGuidedAccessActiveError:", a3);
}

- (void)finishWithError:(id)a3
{
  if (a3)
    -[STUOpenAppUsingFrontBoardOperation endOperationWithError:](self, "endOperationWithError:");
  else
    -[STUOpenAppUsingFrontBoardOperation endOperationWithResultObject:](self, "endOperationWithResultObject:");
}

- (id)realErrorForError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (-[STUOpenAppUsingFrontBoardOperation isLockedError:](self, "isLockedError:", v4))
    v5 = 0;
  else
    v5 = v4;

  return v5;
}

- (BOOL)isLockedError:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v5, "isEqualToString:", FBSOpenApplicationErrorDomain))
    v6 = objc_msgSend(v4, "code") == (id)7;
  else
    v6 = 0;

  return v6;
}

- (BOOL)isRequestDeniedError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v4, "isEqualToString:", FBSOpenApplicationServiceErrorDomain))
    v5 = objc_msgSend(v3, "code") == (id)1;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isUnspecifiedError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v4, "isEqualToString:", FBSOpenApplicationErrorDomain))
    v5 = objc_msgSend(v3, "code") == (id)1;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isGuidedAccessActiveError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  LODWORD(v5) = -[STUOpenAppUsingFrontBoardOperation isRequestDeniedError:](self, "isRequestDeniedError:", v4);
  if ((_DWORD)v5)
    v7 = -[STUOpenAppUsingFrontBoardOperation isUnspecifiedError:](self, "isUnspecifiedError:", v6);
  else
    v7 = 0;

  return v7;
}

- (id)makeOptions
{
  STUFBSOpenApplicationOptions *v3;
  void *v4;

  v3 = objc_opt_new(STUFBSOpenApplicationOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppUsingFrontBoardOperation makeActivities](self, "makeActivities"));
  -[STUFBSOpenApplicationOptions setActivities:](v3, "setActivities:", v4);

  return v3;
}

- (id)makeActivities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  STUFBSActivityContinuation *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  STUFBSActivityContinuation *v12;
  void *v13;
  STUFBSActivityContinuation *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppUsingFrontBoardOperation configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  if (v4)
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppUsingFrontBoardOperation configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityData"));

    if (!v6)
      return 0;
  }
  v7 = [STUFBSActivityContinuation alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppUsingFrontBoardOperation configuration](self, "configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppUsingFrontBoardOperation configuration](self, "configuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityData"));
  v12 = -[STUFBSActivityContinuation initWithType:data:](v7, "initWithType:data:", v9, v11);
  v15 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));

  return v13;
}

- (STULaunchAppConfiguration)configuration
{
  return self->_configuration;
}

- (STUPrimitives)primitives
{
  return self->_primitives;
}

- (unint64_t)attemptsRemaining
{
  return self->_attemptsRemaining;
}

- (void)setAttemptsRemaining:(unint64_t)a3
{
  self->_attemptsRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primitives, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

@implementation MapsAppAnimationSuppressor

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A7EDAC;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D3DE0 != -1)
    dispatch_once(&qword_1014D3DE0, block);
  return (id)qword_1014D3DD8;
}

- (MapsAppAnimationSuppressor)init
{
  MapsAppAnimationSuppressor *v2;
  MapsTokenStorage *v3;
  MapsTokenStorage *tokens;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsAppAnimationSuppressor;
  v2 = -[MapsAppAnimationSuppressor init](&v6, "init");
  if (v2)
  {
    v3 = -[MapsTokenStorage initWithDelegate:tokenGroupName:callbackQueue:]([MapsTokenStorage alloc], "initWithDelegate:tokenGroupName:callbackQueue:", v2, CFSTR("MapsAppAnimationSuppression"), &_dispatch_main_q);
    tokens = v2->_tokens;
    v2->_tokens = v3;

  }
  return v2;
}

+ (id)acquireAnimationSuppressionTokenForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_acquireAnimationSuppressionTokenForReason:", v4));

  return v6;
}

- (id)_acquireAnimationSuppressionTokenForReason:(id)a3
{
  return -[MapsTokenStorage tokenWithReason:](self->_tokens, "tokenWithReason:", a3);
}

- (void)_refreshAnimationSuppression
{
  unint64_t v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  GCDTimer *v8;
  GCDTimer *suppressionTimer;
  GCDTimer *v10;
  GCDTimer *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  void *v15;

  v3 = -[MapsTokenStorage count](self->_tokens, "count");
  v4 = sub_100A7F028();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage allTokenReasons](self->_tokens, "allTokenReasons"));
      v12 = 134218242;
      v13 = v3;
      v14 = 2112;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Suppressing animations for %lu reasons: %@", (uint8_t *)&v12, 0x16u);

    }
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
    if (!self->_suppressionTimer)
    {
      v8 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:repeating:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:repeating:block:", &_dispatch_main_q, 1, &stru_1011E10D8, 10.0));
      suppressionTimer = self->_suppressionTimer;
      self->_suppressionTimer = v8;

    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Unsuppressing animations", (uint8_t *)&v12, 2u);
    }

    v10 = self->_suppressionTimer;
    if (v10)
    {
      -[GCDTimer invalidate](v10, "invalidate");
      v11 = self->_suppressionTimer;
      self->_suppressionTimer = 0;

      +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);
    }
  }
}

- (void)incrementForToken:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = sub_100A7F028();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reason"));
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Adding token for reason: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[MapsAppAnimationSuppressor _refreshAnimationSuppression](self, "_refreshAnimationSuppression");

}

- (void)decrementForToken:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = sub_100A7F028();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reason"));
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Removing token for reason: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[MapsAppAnimationSuppressor _refreshAnimationSuppression](self, "_refreshAnimationSuppression");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_suppressionTimer, 0);
}

@end

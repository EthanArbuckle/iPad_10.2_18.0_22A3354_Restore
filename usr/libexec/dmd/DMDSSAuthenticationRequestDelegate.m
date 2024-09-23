@implementation DMDSSAuthenticationRequestDelegate

+ (id)delegateWithAuthenticationContext:(id)a3
{
  id v3;
  id v4;
  DMDSSAuthenticationRequestDelegate *v5;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)SSAuthenticateRequest), "initWithAuthenticationContext:", v3);

  v5 = -[DMDSSRequestDelegate initWithRequest:]([DMDSSAuthenticationRequestDelegate alloc], "initWithRequest:", v4);
  return v5;
}

+ (double)timeout
{
  return 900.0;
}

- (id)_storeLoginFailedError
{
  if (qword_1000EBA90 != -1)
    dispatch_once(&qword_1000EBA90, &stru_1000BBD00);
  return (id)qword_1000EBA88;
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  unsigned int v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v12;
  objc_super v13;
  _QWORD v14[5];
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100064ECC;
  v16[3] = &unk_1000BB3F8;
  v4 = a3;
  v17 = v4;
  v5 = objc_retainBlock(v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v7 = objc_msgSend(v6, "appWhitelistState");

  if (v7)
    v8 = v7 == 6;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      v10 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%{public}@ starting user authentication.", buf, 0xCu);

    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100064EE0;
    v14[3] = &unk_1000BAB38;
    v14[4] = self;
    v15 = v5;
    v13.receiver = self;
    v13.super_class = (Class)DMDSSAuthenticationRequestDelegate;
    -[DMDSSRequestDelegate startWithCompletionBlock:](&v13, "startWithCompletionBlock:", v14);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not prompting for iTunes account in limited apps mode.", buf, 2u);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSSAuthenticationRequestDelegate _storeLoginFailedError](self, "_storeLoginFailedError"));
    ((void (*)(_QWORD *, void *, _QWORD))v5[2])(v5, v12, 0);

  }
}

- (void)authenticateRequest:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  void *v6;
  uint8_t v7[16];

  v5 = a4;
  if (objc_msgSend(v5, "authenticateResponseType") == (id)4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User successfully logged into iTunes account.", v7, 2u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authenticatedAccount"));
    -[DMDSSAuthenticationRequestDelegate setAuthenticatedAccount:](self, "setAuthenticatedAccount:", v6);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100079778(v5);
  }

}

- (SSAccount)authenticatedAccount
{
  return self->_authenticatedAccount;
}

- (void)setAuthenticatedAccount:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatedAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedAccount, 0);
}

@end

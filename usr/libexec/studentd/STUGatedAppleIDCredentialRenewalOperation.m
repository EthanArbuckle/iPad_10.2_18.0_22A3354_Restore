@implementation STUGatedAppleIDCredentialRenewalOperation

- (STUGatedAppleIDCredentialRenewalOperation)initWithGate:(id)a3 accountsPrimitives:(id)a4
{
  id v7;
  id v8;
  STUGatedAppleIDCredentialRenewalOperation *v9;
  STUGatedAppleIDCredentialRenewalOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STUGatedAppleIDCredentialRenewalOperation;
  v9 = -[STUGatedAppleIDCredentialRenewalOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_gate, a3);
    objc_storeStrong((id *)&v10->_accountsPrimitives, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000540DC;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)run
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;

  if (-[STUGatedAppleIDCredentialRenewalOperation isCanceled](self, "isCanceled"))
  {
    v3 = CATErrorWithCodeAndUserInfo(404, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(v3);
    -[STUGatedAppleIDCredentialRenewalOperation endOperationWithError:](self, "endOperationWithError:", v9);

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUGatedAppleIDCredentialRenewalOperation gate](self, "gate"));
    v10 = 0;
    v5 = objc_msgSend(v4, "isOpenWithError:", &v10);
    v6 = v10;

    if ((v5 & 1) != 0)
    {
      -[STUGatedAppleIDCredentialRenewalOperation promptForCredentials](self, "promptForCredentials");
    }
    else if (v6)
    {
      v7 = sub_1000541E4();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10007CF44((uint64_t)self, v6);

      -[STUGatedAppleIDCredentialRenewalOperation endOperationWithError:](self, "endOperationWithError:", v6);
    }
    else
    {
      -[STUGatedAppleIDCredentialRenewalOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }

  }
}

- (void)promptForCredentials
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;

  v3 = sub_1000541E4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v9 = objc_opt_class(self);
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: Prompting the user to renew their Apple Account credentials", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUGatedAppleIDCredentialRenewalOperation accountsPrimitives](self, "accountsPrimitives"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUGatedAppleIDCredentialRenewalOperation makeRenewalOptions](self, "makeRenewalOptions"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005433C;
  v7[3] = &unk_1000CA240;
  v7[4] = self;
  objc_msgSend(v5, "renewPrimaryAppleIDCredentialsWithOptions:completion:", v6, v7);

}

- (id)makeRenewalOptions
{
  STUAccountCredentialRenewalOptions *v2;

  v2 = objc_opt_new(STUAccountCredentialRenewalOptions);
  -[STUAccountCredentialRenewalOptions setForce:](v2, "setForce:", 1);
  return v2;
}

- (STUAppleIDAuthenticationGate)gate
{
  return self->_gate;
}

- (STUAccountsPrimitives)accountsPrimitives
{
  return self->_accountsPrimitives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsPrimitives, 0);
  objc_storeStrong((id *)&self->_gate, 0);
}

@end

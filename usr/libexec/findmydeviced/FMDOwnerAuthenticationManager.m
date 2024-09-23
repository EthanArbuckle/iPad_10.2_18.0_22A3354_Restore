@implementation FMDOwnerAuthenticationManager

+ (id)ownerAuthenticationManagerEraseAllContentsAndSettings
{
  FMDOwnerAuthenticationManager *v2;
  void *v3;

  v2 = objc_alloc_init(FMDOwnerAuthenticationManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_OWNER_AUTH_REASON_EACS"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDOwnerAuthenticationManager setLocalizedReason:](v2, "setLocalizedReason:", v3);

  -[FMDOwnerAuthenticationManager setFallbackToNoAuthentication:](v2, "setFallbackToNoAuthentication:", 1);
  return v2;
}

- (FMDOwnerAuthenticationManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMDOwnerAuthenticationManager;
  return -[FMDOwnerAuthenticationManager init](&v3, "init");
}

- (void)evaluateOperation
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOwnerAuthenticationManager currentTask](self, "currentTask"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)FMFuture);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000107B4;
    v13[3] = &unk_1002C1570;
    v14 = (id)objc_claimAutoreleasedReturnValue(-[FMDOwnerAuthenticationManager permittedOperationBlock](self, "permittedOperationBlock"));
    v5 = v14;
    v6 = objc_msgSend(v4, "addSuccessBlock:", v13);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000107C8;
    v11[3] = &unk_1002C1598;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[FMDOwnerAuthenticationManager deniedOperationBlock](self, "deniedOperationBlock"));
    v7 = v12;
    v8 = objc_msgSend(v4, "addFailureBlock:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000107DC;
    v10[3] = &unk_1002C15C0;
    v10[4] = self;
    v9 = objc_msgSend(v4, "addCompletionBlock:", v10);
    -[FMDOwnerAuthenticationManager setCurrentTask:](self, "setCurrentTask:", v4);
    -[FMDOwnerAuthenticationManager evaluatePolicy](self, "evaluatePolicy");

  }
}

- (id)evaluationOptions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];

  v7[0] = &off_1002D7F60;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOwnerAuthenticationManager localizedReason](self, "localizedReason"));
  v7[1] = &off_1002D7F78;
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDOwnerAuthenticationManager fallbackToNoAuthentication](self, "fallbackToNoAuthentication")));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  return v5;
}

- (void)evaluatePolicy
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOwnerAuthenticationManager context](self, "context"));

  if (v3)
  {
    v4 = sub_1000533BC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100225B30(v5);
  }
  else
  {
    v5 = objc_alloc_init((Class)LAContext);
    -[FMDOwnerAuthenticationManager setContext:](self, "setContext:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOwnerAuthenticationManager evaluationOptions](self, "evaluationOptions"));
    v7 = sub_1000533BC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Evaluating location-based owner authentication policy with options %@.", buf, 0xCu);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010A10;
    v9[3] = &unk_1002C15E8;
    v9[4] = self;
    -[NSObject evaluatePolicy:options:reply:](v5, "evaluatePolicy:options:reply:", 1025, v6, v9);

  }
}

- (NSString)localizedReason
{
  return self->_localizedReason;
}

- (void)setLocalizedReason:(id)a3
{
  objc_storeStrong((id *)&self->_localizedReason, a3);
}

- (BOOL)fallbackToNoAuthentication
{
  return self->_fallbackToNoAuthentication;
}

- (void)setFallbackToNoAuthentication:(BOOL)a3
{
  self->_fallbackToNoAuthentication = a3;
}

- (id)permittedOperationBlock
{
  return self->_permittedOperationBlock;
}

- (void)setPermittedOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)deniedOperationBlock
{
  return self->_deniedOperationBlock;
}

- (void)setDeniedOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (LAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (FMFuture)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_deniedOperationBlock, 0);
  objc_storeStrong(&self->_permittedOperationBlock, 0);
  objc_storeStrong((id *)&self->_localizedReason, 0);
}

@end

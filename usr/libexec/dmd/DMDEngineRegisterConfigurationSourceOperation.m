@implementation DMDEngineRegisterConfigurationSourceOperation

- (void)main
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  v4 = objc_msgSend(v3, "newBackgroundContext");

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003FEFC;
  v6[3] = &unk_1000B9BA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

- (void)delegateUpdatedDeclarationSourceAndEndOperation:(id)a3
{
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDEngineRegisterConfigurationSourceOperation.m"), 97, CFSTR("%@ must be called from the main thread"), v8);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineRegisterConfigurationSourceOperation delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "registerConfigurationSourceOperation:didUpdateRegistrationForConfigurationSource:") & 1) != 0)objc_msgSend(v5, "registerConfigurationSourceOperation:didUpdateRegistrationForConfigurationSource:", self, v9);
  -[DMDEngineRegisterConfigurationSourceOperation setResultObject:](self, "setResultObject:", 0);

}

- (DMDEngineRegisterConfigurationSourceOperationDelegate)delegate
{
  return (DMDEngineRegisterConfigurationSourceOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DMFRegisterConfigurationSourceRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

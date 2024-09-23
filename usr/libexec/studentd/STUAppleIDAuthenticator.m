@implementation STUAppleIDAuthenticator

- (STUAppleIDAuthenticator)initWithClock:(id)a3 accountsPrimitives:(id)a4 IDSLocalPrimitives:(id)a5
{
  id v8;
  id v9;
  id v10;
  STUAppleIDAuthenticator *v11;
  STUAppleIDAuthenticator *v12;
  STUAppleIDAuthenticationGate *v13;
  STUAppleIDAuthenticationGate *gate;
  CATOperationQueue *v15;
  CATOperationQueue *serialQueue;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)STUAppleIDAuthenticator;
  v11 = -[STUAppleIDAuthenticator init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountsPrimitives, a4);
    v13 = -[STUAppleIDAuthenticationGate initWithClock:accountsPrimitives:IDSLocalPrimitives:]([STUAppleIDAuthenticationGate alloc], "initWithClock:accountsPrimitives:IDSLocalPrimitives:", v8, v9, v10);
    gate = v12->_gate;
    v12->_gate = v13;

    v15 = objc_opt_new(CATOperationQueue);
    serialQueue = v12->_serialQueue;
    v12->_serialQueue = v15;

    -[CATOperationQueue setMaxConcurrentOperationCount:](v12->_serialQueue, "setMaxConcurrentOperationCount:", 1);
  }

  return v12;
}

- (id)operationToEvaluateIDSReadiness
{
  STUGatedAppleIDCredentialRenewalOperation *v3;
  void *v4;
  void *v5;
  STUGatedAppleIDCredentialRenewalOperation *v6;
  STUProxyOperation *v7;
  void *v8;
  STUProxyOperation *v9;

  v3 = [STUGatedAppleIDCredentialRenewalOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticator gate](self, "gate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticator accountsPrimitives](self, "accountsPrimitives"));
  v6 = -[STUGatedAppleIDCredentialRenewalOperation initWithGate:accountsPrimitives:](v3, "initWithGate:accountsPrimitives:", v4, v5);

  v7 = [STUProxyOperation alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticator serialQueue](self, "serialQueue"));
  v9 = -[STUProxyOperation initWithTarget:queue:](v7, "initWithTarget:queue:", v6, v8);

  return v9;
}

- (NSDictionary)debugInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticator gate](self, "gate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "debugInfo"));
  v10 = CFSTR("numberOfInFlightRenewalOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticator serialQueue](self, "serialQueue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "operationCount")));
  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crk_dictionaryByAddingEntriesFromDictionary:", v7));

  return (NSDictionary *)v8;
}

- (STUAccountsPrimitives)accountsPrimitives
{
  return self->_accountsPrimitives;
}

- (STUAppleIDAuthenticationGate)gate
{
  return self->_gate;
}

- (CATOperationQueue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_gate, 0);
  objc_storeStrong((id *)&self->_accountsPrimitives, 0);
}

@end

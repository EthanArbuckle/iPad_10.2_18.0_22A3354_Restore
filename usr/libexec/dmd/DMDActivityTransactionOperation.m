@implementation DMDActivityTransactionOperation

- (BOOL)runConcurrently
{
  return 1;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;
  const __CFString *v13;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDActivityTransactionOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_7;
    v12 = DMFInvalidParameterErrorKey;
    v13 = CFSTR("request.name");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v9 = DMFErrorWithCodeAndUserInfo(1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v9);

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFActivityTransactionRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C29D0;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMDActivityTransactionOperation;
  -[DMDActivityTransactionOperation cancel](&v3, "cancel");
  -[DMDActivityTransactionOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "endOperationIfNeeded", 0, 0);
}

- (void)endOperationIfNeeded
{
  if (-[DMDActivityTransactionOperation isExecuting](self, "isExecuting"))
    -[DMDActivityTransactionOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name")));
  v4 = (void *)os_transaction_create(objc_msgSend(v5, "UTF8String"));
  -[DMDActivityTransactionOperation setTransaction:](self, "setTransaction:", v4);

}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end

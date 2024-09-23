@implementation STUPerformIDSFirewallActionOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  _UNKNOWN **v13;
  uint64_t v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___STUPerformIDSFirewallActionOperation;
  if (objc_msgSendSuper2(&v16, "validateRequest:error:", v6, a4))
  {
    v7 = v6;
    v8 = objc_opt_class(CRKPerformIDSFirewallActionRequest);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      v9 = v7;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      if (!objc_msgSend(v10, "action")
        || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allowedAppleIDs")), v11,
                                                                                                   v11))
      {
        v12 = 1;
LABEL_16:

        goto LABEL_17;
      }
      if (a4)
      {
        v13 = &off_1000D3FB0;
        goto LABEL_14;
      }
    }
    else if (a4)
    {
      v13 = &off_1000D3F88;
LABEL_14:
      v14 = CRKErrorWithCodeAndUserInfo(2, v13);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v14);
      goto LABEL_16;
    }
    v12 = 0;
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (void)cancel
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006919C;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[STUPerformIDSFirewallActionOperation makeFirewallOperation](self, "makeFirewallOperation", a3));
  -[STUPerformIDSFirewallActionOperation setFirewallOperation:](self, "setFirewallOperation:", v5);
  objc_msgSend(v5, "addTarget:selector:forOperationEvents:", self, "firewallOperationDidFinish:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v4, "addOperation:", v5);

}

- (void)firewallOperationDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[STUPerformIDSFirewallActionOperation isExecuting](self, "isExecuting"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
      -[STUPerformIDSFirewallActionOperation endOperationWithError:](self, "endOperationWithError:", v5);
    }
    else
    {
      v5 = (void *)objc_opt_new(CRKPerformIDSFirewallActionResultObject);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resultObject"));
      objc_msgSend(v5, "setAllowedAppleIDs:", v6);

      -[STUPerformIDSFirewallActionOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);
    }

  }
}

- (id)makeFirewallOperation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUPerformIDSFirewallActionOperation actionRequest](self, "actionRequest"));
  v4 = objc_msgSend(v3, "action");

  if (v4 == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUPerformIDSFirewallActionOperation actionRequest](self, "actionRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allowedAppleIDs"));
    v7 = objc_claimAutoreleasedReturnValue(-[STUPerformIDSFirewallActionOperation operationToRemoveAllowedAppleIDs:](self, "operationToRemoveAllowedAppleIDs:", v6));
LABEL_7:
    v3 = (void *)v7;

    return v3;
  }
  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUPerformIDSFirewallActionOperation actionRequest](self, "actionRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allowedAppleIDs"));
    v7 = objc_claimAutoreleasedReturnValue(-[STUPerformIDSFirewallActionOperation operationToAddAllowedAppleIDs:](self, "operationToAddAllowedAppleIDs:", v6));
    goto LABEL_7;
  }
  if (!v4)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUPerformIDSFirewallActionOperation operationToFetchAllowedAppleIDs](self, "operationToFetchAllowedAppleIDs"));
  return v3;
}

- (id)actionRequest
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUPerformIDSFirewallActionOperation request](self, "request"));
  v3 = objc_opt_class(CRKPerformIDSFirewallActionRequest);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUPerformIDSFirewallActionOperation actionRequest]"));
    v7 = (objc_class *)objc_opt_class(CRKPerformIDSFirewallActionRequest);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (objc_class *)objc_opt_class(v2);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("STUPerformIDSFirewallActionOperation.m"), 99, CFSTR("expected %@, got %@"), v9, v12);

  }
  return v2;
}

- (id)operationToFetchAllowedAppleIDs
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "whiteboard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "IDSPrimitives"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000695CC;
  v8[3] = &unk_1000CBB90;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRKBlockOperation blockOperationWithBlock:](CRKBlockOperation, "blockOperationWithBlock:", v8));

  return v6;
}

- (id)operationToAddAllowedAppleIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "whiteboard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IDSPrimitives"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100069770;
  v11[3] = &unk_1000CBBE0;
  v12 = v3;
  v13 = v6;
  v7 = v6;
  v8 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRKBlockOperation blockOperationWithBlock:](CRKBlockOperation, "blockOperationWithBlock:", v11));

  return v9;
}

- (id)operationToRemoveAllowedAppleIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "whiteboard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IDSPrimitives"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100069930;
  v11[3] = &unk_1000CBBE0;
  v12 = v3;
  v13 = v6;
  v7 = v6;
  v8 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRKBlockOperation blockOperationWithBlock:](CRKBlockOperation, "blockOperationWithBlock:", v11));

  return v9;
}

- (CATOperation)firewallOperation
{
  return self->_firewallOperation;
}

- (void)setFirewallOperation:(id)a3
{
  objc_storeStrong((id *)&self->_firewallOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firewallOperation, 0);
}

@end

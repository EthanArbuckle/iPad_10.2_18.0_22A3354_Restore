@implementation STUSimulateOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUSimulateOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKSimulateRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CATErrorWithCodeAndUserInfo(2, &off_1000D3358);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUSimulateOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B2D8;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)runWithRequest:(id)a3
{
  NSMutableArray *v4;
  id v5;
  NSMutableArray *v6;

  v4 = objc_opt_new(NSMutableArray);
  -[STUSimulateOperation setAssertions:](self, "setAssertions:", v4);

  v6 = objc_opt_new(NSMutableArray);
  -[STUSimulateOperation collectIDSLocalAssertions:](self, "collectIDSLocalAssertions:", v6);
  v5 = -[NSMutableArray copy](v6, "copy");
  -[STUSimulateOperation setAssertions:](self, "setAssertions:", v5);

}

- (id)simulateRequest
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulateOperation request](self, "request"));
  v3 = objc_opt_class(CRKSimulateRequest);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUSimulateOperation simulateRequest]"));
    v7 = (objc_class *)objc_opt_class(CRKSimulateRequest);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (objc_class *)objc_opt_class(v2);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("STUSimulateOperation.m"), 76, CFSTR("expected %@, got %@"), v9, v12);

  }
  return v2;
}

- (id)simulations
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "simulations"));

  return v3;
}

- (void)collectIDSLocalAssertions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  STUSimulateOperation *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulateOperation simulateRequest](self, "simulateRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IDSLocalConfiguration"));

  if (v6)
  {
    if (objc_msgSend(v6, "shouldForceAccountsInactive"))
    {
      v7 = sub_10002B778();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v17 = 138543362;
        v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: IDSLocal: Asserting accounts inactive", (uint8_t *)&v17, 0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulateOperation simulations](self, "simulations"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "IDSLocalSimulation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assertAccountsInactive"));
      objc_msgSend(v4, "addObject:", v11);

    }
    if (objc_msgSend(v6, "shouldForceRemoteUsersNotRegistered"))
    {
      v12 = sub_10002B778();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v17 = 138543362;
        v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: IDSLocal: Asserting remote users not registered", (uint8_t *)&v17, 0xCu);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulateOperation simulations](self, "simulations"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "IDSLocalSimulation"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assertRemoteUsersNotRegistered"));
      objc_msgSend(v4, "addObject:", v16);

    }
  }

}

- (NSArray)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end

@implementation STUIDSLocalSimulation

- (void)dealloc
{
  objc_super v3;

  -[STUIDSLocalSimulation endObservingAccounts](self, "endObservingAccounts");
  v3.receiver = self;
  v3.super_class = (Class)STUIDSLocalSimulation;
  -[STUIDSLocalSimulation dealloc](&v3, "dealloc");
}

- (STUIDSLocalSimulation)initWithPrimitives:(id)a3
{
  id v5;
  STUIDSLocalSimulation *v6;
  STUIDSLocalSimulation *v7;
  STUValueBeacon *v8;
  STUValueBeacon *forceAccountsInactiveBeacon;
  NSArray *accounts;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STUIDSLocalSimulation;
  v6 = -[STUIDSLocalSimulation init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_primitives, a3);
    v8 = -[STUValueBeacon initWithValue:]([STUValueBeacon alloc], "initWithValue:", &__kCFBooleanFalse);
    forceAccountsInactiveBeacon = v7->_forceAccountsInactiveBeacon;
    v7->_forceAccountsInactiveBeacon = v8;

    accounts = v7->_accounts;
    v7->_accounts = (NSArray *)&__NSArray0__struct;

    -[STUIDSLocalSimulation beginObservingAccounts](v7, "beginObservingAccounts");
  }

  return v7;
}

- (id)assertAccountsInactive
{
  void *v4;
  void *v5;
  void *v7;
  NSString *v8;
  void *v9;
  _QWORD v10[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUIDSLocalSimulation.m"), 54, CFSTR("%@ must be called from the main thread"), v9);

  }
  -[STUIDSLocalSimulation setInactiveAccountsAssertionCount:](self, "setInactiveAccountsAssertionCount:", (char *)-[STUIDSLocalSimulation inactiveAccountsAssertionCount](self, "inactiveAccountsAssertionCount") + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation forceAccountsInactiveBeacon](self, "forceAccountsInactiveBeacon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUIDSLocalSimulation isForcingAccountsInactive](self, "isForcingAccountsInactive")));
  objc_msgSend(v4, "send:", v5);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100056B6C;
  v10[3] = &unk_1000C97E8;
  v10[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[CRKBlockCancelable cancelableWithBlock:](CRKBlockCancelable, "cancelableWithBlock:", v10));
}

- (id)assertRemoteUsersNotRegistered
{
  void *v5;
  NSString *v6;
  void *v7;
  _QWORD v8[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUIDSLocalSimulation.m"), 68, CFSTR("%@ must be called from the main thread"), v7);

  }
  -[STUIDSLocalSimulation setRemoteUsersNotRegisteredAssertionCount:](self, "setRemoteUsersNotRegisteredAssertionCount:", (char *)-[STUIDSLocalSimulation remoteUsersNotRegisteredAssertionCount](self, "remoteUsersNotRegisteredAssertionCount")+ 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100056D3C;
  v8[3] = &unk_1000C97E8;
  v8[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[CRKBlockCancelable cancelableWithBlock:](CRKBlockCancelable, "cancelableWithBlock:", v8));
}

- (BOOL)isForcingAccountsInactive
{
  return -[STUIDSLocalSimulation inactiveAccountsAssertionCount](self, "inactiveAccountsAssertionCount") > 0;
}

- (void)rebuildAccounts
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accounts"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100056E7C;
  v6[3] = &unk_1000CB5A0;
  v6[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crk_mapUsingBlock:", v6));
  -[STUIDSLocalSimulation setAccounts:](self, "setAccounts:", v5);

}

- (BOOL)isForcingRemoteUsersNotRegistered
{
  return -[STUIDSLocalSimulation remoteUsersNotRegisteredAssertionCount](self, "remoteUsersNotRegisteredAssertionCount") > 0;
}

- (void)beginObservingAccounts
{
  id v3;

  if (!-[STUIDSLocalSimulation isObservingAccounts](self, "isObservingAccounts"))
  {
    -[STUIDSLocalSimulation setObservingAccounts:](self, "setObservingAccounts:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("accounts"), 4, CFSTR("ObservationContext"));

  }
}

- (void)endObservingAccounts
{
  id v3;

  if (-[STUIDSLocalSimulation isObservingAccounts](self, "isObservingAccounts"))
  {
    -[STUIDSLocalSimulation setObservingAccounts:](self, "setObservingAccounts:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("accounts"), CFSTR("ObservationContext"));

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("ObservationContext"))
  {
    -[STUIDSLocalSimulation rebuildAccounts](self, "rebuildAccounts", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)STUIDSLocalSimulation;
    -[STUIDSLocalSimulation observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (NSDictionary)debugInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "debugInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUIDSLocalSimulation isForcingAccountsInactive](self, "isForcingAccountsInactive")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("isForcingAccountsInactive"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUIDSLocalSimulation isForcingRemoteUsersNotRegistered](self, "isForcingRemoteUsersNotRegistered")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("isForcingRemoteUsersNotRegistered"));

  v8 = objc_msgSend(v5, "copy");
  return (NSDictionary *)v8;
}

- (BOOL)sendMessage:(id)a3 toAddress:(id)a4 fromID:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  unsigned __int8 v19;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (-[STUIDSLocalSimulation isForcingRemoteUsersNotRegistered](self, "isForcingRemoteUsersNotRegistered"))
  {
    if (!a8)
    {
      v19 = 0;
      goto LABEL_7;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
    v19 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "makeRemoteUserNotRegisteredError"));
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
    v19 = objc_msgSend(v18, "sendMessage:toAddress:fromID:options:identifier:error:", v14, v15, v16, v17, a7, a8);
  }

LABEL_7:
  return v19;
}

- (id)subscribeToMessageSendsWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscribeToMessageSendsWithHandler:", v4));

  return v6;
}

- (id)subscribeToMessageReceivesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscribeToMessageReceivesWithHandler:", v4));

  return v6;
}

- (void)fetchFirewallWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
  objc_msgSend(v5, "fetchFirewallWithCompletion:", v4);

}

- (BOOL)isRemoteUserNotRegisteredError:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
  v6 = objc_msgSend(v5, "isRemoteUserNotRegisteredError:", v4);

  return v6;
}

- (id)makeRemoteUserNotRegisteredError
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "makeRemoteUserNotRegisteredError"));

  return v3;
}

- (void)forceRefreshIDStatusForDestinations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[STUIDSLocalSimulation primitives](self, "primitives"));
  objc_msgSend(v8, "forceRefreshIDStatusForDestinations:completion:", v7, v6);

}

- (CRKIDSLocalPrimitives)primitives
{
  return self->_primitives;
}

- (int64_t)inactiveAccountsAssertionCount
{
  return self->_inactiveAccountsAssertionCount;
}

- (void)setInactiveAccountsAssertionCount:(int64_t)a3
{
  self->_inactiveAccountsAssertionCount = a3;
}

- (STUValueBeacon)forceAccountsInactiveBeacon
{
  return self->_forceAccountsInactiveBeacon;
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isObservingAccounts
{
  return self->_observingAccounts;
}

- (void)setObservingAccounts:(BOOL)a3
{
  self->_observingAccounts = a3;
}

- (int64_t)remoteUsersNotRegisteredAssertionCount
{
  return self->_remoteUsersNotRegisteredAssertionCount;
}

- (void)setRemoteUsersNotRegisteredAssertionCount:(int64_t)a3
{
  self->_remoteUsersNotRegisteredAssertionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_forceAccountsInactiveBeacon, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
}

@end

@implementation LDClientXPCConnection

+ (id)connectionWithConnection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_opt_new(a1);
  objc_msgSend(v5, "setConnection:", v4);

  return v5;
}

- (void)_ifMissingEntitlementCallCompletionHandler:(id)a3 elseCallBlock:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[LDXPCConnection remoteProcessHasEntitlement:](self, "remoteProcessHasEntitlement:", LKLoginDaemonClientEntitlement))
  {
    if (v6)
      v6[2](v6);
  }
  else if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 2));
    v8[2](v8, v7);

  }
}

- (void)chooseUserWithIdentifier:(id)a3 inClassWithID:(id)a4 password:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100002254;
  v14[3] = &unk_1000082A0;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v10 = v18;
  v11 = v17;
  v12 = v16;
  v13 = v15;
  -[LDClientXPCConnection _ifMissingEntitlementCallCompletionHandler:elseCallBlock:](self, "_ifMissingEntitlementCallCompletionHandler:elseCallBlock:", v10, v14);

}

- (void)loginAppleID:(id)a3 password:(id)a4 localLoginOnly:(BOOL)a5 isTemporarySession:(BOOL)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;
  BOOL v20;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000237C;
  v15[3] = &unk_1000082C8;
  v16 = a3;
  v17 = a4;
  v19 = a5;
  v20 = a6;
  v18 = a7;
  v12 = v18;
  v13 = v17;
  v14 = v16;
  -[LDClientXPCConnection _ifMissingEntitlementCallCompletionHandler:elseCallBlock:](self, "_ifMissingEntitlementCallCompletionHandler:elseCallBlock:", v12, v15);

}

- (void)saveClassConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002470;
  v8[3] = &unk_1000082F0;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[LDClientXPCConnection _ifMissingEntitlementCallCompletionHandler:elseCallBlock:](self, "_ifMissingEntitlementCallCompletionHandler:elseCallBlock:", v6, v8);

}

- (void)isReadyToLoginWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002530;
  v5[3] = &unk_100008318;
  v6 = a3;
  v4 = v6;
  -[LDClientXPCConnection _ifMissingEntitlementCallCompletionHandler:elseCallBlock:](self, "_ifMissingEntitlementCallCompletionHandler:elseCallBlock:", v4, v5);

}

- (void)isReadyToLogoutWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000025F0;
  v5[3] = &unk_100008318;
  v6 = a3;
  v4 = v6;
  -[LDClientXPCConnection _ifMissingEntitlementCallCompletionHandler:elseCallBlock:](self, "_ifMissingEntitlementCallCompletionHandler:elseCallBlock:", v4, v5);

}

- (void)checkInWithCurrentEnvironment:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  unint64_t v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000026B4;
  v7[3] = &unk_100008340;
  v8 = a4;
  v9 = a3;
  v6 = v8;
  -[LDClientXPCConnection _ifMissingEntitlementCallCompletionHandler:elseCallBlock:](self, "_ifMissingEntitlementCallCompletionHandler:elseCallBlock:", v6, v7);

}

- (void)updateGlobalDefaultsValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000027C0;
  v11[3] = &unk_100008368;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v8 = v14;
  v9 = v13;
  v10 = v12;
  -[LDClientXPCConnection _ifMissingEntitlementCallCompletionHandler:elseCallBlock:](self, "_ifMissingEntitlementCallCompletionHandler:elseCallBlock:", v8, v11);

}

- (void)triggerLocalUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000028F8;
  v18[3] = &unk_100008390;
  v19 = a5;
  v20 = a6;
  v23 = a4;
  v24 = a7;
  v25 = a8;
  v21 = a9;
  v22 = a3;
  v15 = v21;
  v16 = v20;
  v17 = v19;
  -[LDClientXPCConnection _ifMissingEntitlementCallCompletionHandler:elseCallBlock:](self, "_ifMissingEntitlementCallCompletionHandler:elseCallBlock:", v15, v18);

}

- (void)interruptLocalUserSwitchTest
{
  -[LDClientXPCConnection _ifMissingEntitlementCallCompletionHandler:elseCallBlock:](self, "_ifMissingEntitlementCallCompletionHandler:elseCallBlock:", 0, &stru_1000083D0);
}

@end

@implementation NSPPrivacyProxyTokenRegistration

- (void)tokenLowWaterMarkReachedForAgent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  NSPPrivacyProxyTokenRegistration *v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_1000030BC;
  v12[4] = sub_100005090;
  v13 = (id)os_transaction_create("com.apple.networkserviceproxy.tokenLowWaterMarkReachedForAgent");
  v5 = NPGetInternalQueue(v13);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005340;
  block[3] = &unk_1000F5320;
  v9 = v4;
  v10 = self;
  v11 = v12;
  v7 = v4;
  dispatch_async(v6, block);

  _Block_object_dispose(v12, 8);
}

- (void)reportErrorForAgent:(id)a3 error:(int)a4 withOptions:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  NSPPrivacyProxyTokenRegistration *v16;
  id v17;
  _QWORD *v18;
  int v19;
  _QWORD v20[5];
  id v21;

  v8 = a3;
  v9 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_1000030BC;
  v20[4] = sub_100005090;
  v21 = (id)os_transaction_create("com.apple.networkserviceproxy.reportErrorForAgent");
  v10 = NPGetInternalQueue(v21);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005564;
  block[3] = &unk_1000F5348;
  v19 = a4;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v20;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, block);

  _Block_object_dispose(v20, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenAgentRegistration, 0);
  objc_storeStrong((id *)&self->_tokenAgent, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

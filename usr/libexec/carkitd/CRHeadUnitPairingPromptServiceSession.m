@implementation CRHeadUnitPairingPromptServiceSession

- (void)wantsToPresentHeadUnitPairingPromptForKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1000697F4(v9, v10, v11, v12, v13, v14, v15, v16);

  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100014800;
  v19[3] = &unk_1000B54F0;
  objc_copyWeak(&v22, &location);
  v20 = v6;
  v21 = v7;
  v17 = v7;
  v18 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)presentHeadUnitPairingPromptForKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_100069824(v9, v10, v11, v12, v13, v14, v15, v16);

  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100014A78;
  v19[3] = &unk_1000B54F0;
  objc_copyWeak(&v22, &location);
  v20 = v6;
  v21 = v7;
  v17 = v7;
  v18 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)handleReceivedResponse:(BOOL)a3 forKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  BOOL v18;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = CarPairingLogging(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1000698C8(a3, v11);

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014D30;
  block[3] = &unk_1000B5540;
  objc_copyWeak(&v17, &location);
  v15 = v8;
  v16 = v9;
  v18 = a3;
  v12 = v9;
  v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (CRHeadUnitPairingPromptServiceSessionDelegate)delegate
{
  return (CRHeadUnitPairingPromptServiceSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)pairingPromptCompletion
{
  return self->_pairingPromptCompletion;
}

- (void)setPairingPromptCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pairingPromptCompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end

@implementation CRSetupPromptPresenterSession

- (CRSetupPromptPresenterSession)init
{
  CRSetupPromptPresenterSession *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRSetupPromptPresenterSession;
  v2 = -[CRSetupPromptPresenterSession init](&v5, "init");
  if (v2)
  {
    v3 = (void *)os_transaction_create("com.apple.carkit.SetupPromptPresenterSession");
    -[CRSetupPromptPresenterSession setSessionTransaction:](v2, "setSessionTransaction:", v3);

  }
  return v2;
}

- (void)invalidate
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = CarPairingLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10006A574(v5);

  -[CRSetupPromptPresenterSession _cleanupAssetProgress](self, "_cleanupAssetProgress");
  -[CRSetupPromptPresenterSession setDismissHandler:](self, "setDismissHandler:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupPromptPresenterSession connection](self, "connection"));
  objc_msgSend(v6, "invalidate");

  -[CRSetupPromptPresenterSession setConnection:](self, "setConnection:", 0);
  -[CRSetupPromptPresenterSession setSessionTransaction:](self, "setSessionTransaction:", 0);
}

- (void)_servicePerform:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupPromptPresenterSession connection](self, "connection"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &stru_1000B57E0));

  v4[2](v4, v6);
}

- (void)presenterIsReadyWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A2D0;
  block[3] = &unk_1000B57A0;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)presenterDidDismissWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A44C;
  block[3] = &unk_1000B57A0;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)presenterRequestsAssetProgressWithCompletion:(id)a3
{
  id v3;
  _QWORD block[5];
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id location;

  objc_initWeak(&location, self);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10001A5F4;
  v11 = sub_10001A604;
  block[0] = _NSConcreteStackBlock;
  v12 = 0;
  block[2] = sub_10001A60C;
  block[3] = &unk_1000B5808;
  block[1] = 3221225472;
  objc_copyWeak(&v6, &location);
  block[4] = &v7;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v3 = (id)v8[5];
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);

  objc_destroyWeak(&location);
  return v3;
}

- (void)presentBluetoothConfirmationPromptForVehicleName:(id)a3 numericCode:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A7C0;
  v14[3] = &unk_1000B5880;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v14);

}

- (void)presentBluetoothContactsSyncPromptWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001AA08;
  v6[3] = &unk_1000B58A8;
  v7 = v4;
  v5 = v4;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v6);

}

- (void)presentBluetoothFailedPromptForVehicleName:(id)a3 isTimeout:(BOOL)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001AC6C;
  v12[3] = &unk_1000B58D0;
  v15 = a4;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v12);

}

- (void)presentWaitingPrompt
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", &stru_1000B5910);
}

- (void)presentAllowWhileLockedPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001AEBC;
  v10[3] = &unk_1000B5938;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v10);

}

- (void)presentConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  BOOL v13;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B108;
  v10[3] = &unk_1000B5960;
  v13 = a3;
  v11 = v8;
  v12 = a4;
  v9 = v8;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v10);

}

- (void)presentUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  unint64_t v13;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B364;
  v10[3] = &unk_1000B5988;
  v12 = a3;
  v13 = a4;
  v11 = v8;
  v9 = v8;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v10);

}

- (void)presentEnhancedIntegrationPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B5D4;
  v10[3] = &unk_1000B5938;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v10);

}

- (void)presentAssetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  BOOL v13;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B820;
  v10[3] = &unk_1000B5960;
  v13 = a3;
  v11 = v8;
  v12 = a4;
  v9 = v8;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v10);

}

- (void)presentAssetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  unint64_t v13;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001BA7C;
  v10[3] = &unk_1000B5988;
  v12 = a3;
  v13 = a4;
  v11 = v8;
  v9 = v8;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v10);

}

- (void)presentAssetProgressForVehicleName:(id)a3 progress:(id)a4 completionHandler:(id)a5 cancelHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSString *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t v21[8];
  _QWORD v22[4];
  id v23;
  CRSetupPromptPresenterSession *v24;
  id v25;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[CRSetupPromptPresenterSession setAssetProgress:](self, "setAssetProgress:", v13);
  -[CRSetupPromptPresenterSession setProgressPromptCompletion:](self, "setProgressPromptCompletion:", v12);

  v14 = NSStringFromSelector("fractionCompleted");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, v15, 2, 0);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001BDBC;
  v22[3] = &unk_1000B5A00;
  v24 = self;
  v25 = v11;
  v23 = v10;
  v16 = v11;
  v17 = v10;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v22);
  LODWORD(v15) = objc_msgSend(v13, "isFinished");

  if ((_DWORD)v15)
  {
    v19 = CarPairingLogging(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "asset progress already finished at time of presenting asset progress prompt", v21, 2u);
    }

    -[CRSetupPromptPresenterSession _handleAssetProgressFinished](self, "_handleAssetProgressFinished");
  }

}

- (void)_handleAssetProgressFinished
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  v3 = CarPairingLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "asset progress completed", v7, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[CRSetupPromptPresenterSession progressPromptCompletion](self, "progressPromptCompletion"));
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  -[CRSetupPromptPresenterSession setProgressPromptCompletion:](self, "setProgressPromptCompletion:", 0);

}

- (void)_cleanupAssetProgress
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void (**v7)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupPromptPresenterSession assetProgress](self, "assetProgress"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupPromptPresenterSession assetProgress](self, "assetProgress"));
    v5 = NSStringFromSelector("fractionCompleted");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, v6);

  }
  -[CRSetupPromptPresenterSession setAssetProgress:](self, "setAssetProgress:", 0);
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CRSetupPromptPresenterSession remoteProgressCompletion](self, "remoteProgressCompletion"));
  if (v7)
    v7[2]();
  -[CRSetupPromptPresenterSession setRemoteProgressCompletion:](self, "setRemoteProgressCompletion:", 0);
  -[CRSetupPromptPresenterSession setProgressPromptCompletion:](self, "setProgressPromptCompletion:", 0);

}

- (void)presentAssetReadyForVehicleName:(id)a3 confirmationHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C154;
  v10[3] = &unk_1000B5938;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v10);

}

- (void)presentAssetReadySoonForVehicleName:(id)a3 confirmationHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C358;
  v10[3] = &unk_1000B5938;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v10);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v6;
  _QWORD v7[5];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C528;
  v7[3] = &unk_1000B5390;
  v7[4] = self;
  v8 = a5;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

}

- (void)presentSetupCarKeysPromptForVehicleName:(id)a3 carKeyInfo:(id)a4 cancelHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001C6E0;
  v14[3] = &unk_1000B5880;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CRSetupPromptPresenterSession _servicePerform:](self, "_servicePerform:", v14);

}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CRSetupPromptPresenterSessionDelegate)sessionDelegate
{
  return (CRSetupPromptPresenterSessionDelegate *)objc_loadWeakRetained((id *)&self->_sessionDelegate);
}

- (void)setSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDelegate, a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (OS_os_transaction)sessionTransaction
{
  return self->_sessionTransaction;
}

- (void)setSessionTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTransaction, a3);
}

- (NSProgress)assetProgress
{
  return self->_assetProgress;
}

- (void)setAssetProgress:(id)a3
{
  objc_storeStrong((id *)&self->_assetProgress, a3);
}

- (id)remoteProgressCompletion
{
  return self->_remoteProgressCompletion;
}

- (void)setRemoteProgressCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)progressPromptCompletion
{
  return self->_progressPromptCompletion;
}

- (void)setProgressPromptCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressPromptCompletion, 0);
  objc_storeStrong(&self->_remoteProgressCompletion, 0);
  objc_storeStrong((id *)&self->_assetProgress, 0);
  objc_storeStrong((id *)&self->_sessionTransaction, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong(&self->_dismissHandler, 0);
}

@end

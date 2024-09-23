@implementation AccessoryAction

- (AccessoryAction)initWithAccount:(id)a3 accessory:(id)a4 requiresConnectivity:(BOOL)a5 serverInteractionController:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  AccessoryAction *v13;
  AccessoryAction *v14;
  dispatch_queue_t v15;
  objc_super v17;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AccessoryAction;
  v13 = -[AccessoryAction init](&v17, "init");
  v14 = v13;
  if (v13)
  {
    -[AccessoryAction setEnqueuedQC:](v13, "setEnqueuedQC:", 0);
    -[AccessoryAction setAccount:](v14, "setAccount:", v10);
    -[AccessoryAction setAccessory:](v14, "setAccessory:", v11);
    -[AccessoryAction setRequiresConnectivity:](v14, "setRequiresConnectivity:", v7);
    -[AccessoryAction setServerInteractionController:](v14, "setServerInteractionController:", v12);
    v15 = dispatch_queue_create("AccessoryActionSerialQueue", 0);
    -[AccessoryAction setSerialQueue:](v14, "setSerialQueue:", v15);

  }
  return v14;
}

- (id)actionType
{
  return CFSTR("AccessoryAction");
}

- (void)willCancelAction
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[AccessoryAction serialQueue](self, "serialQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001CAE4;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)terminate
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AccessoryAction completion](self, "completion"));
  -[AccessoryAction setCompletion:](self, "setCompletion:", 0);
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryAction accessory](self, "accessory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryIdentifier"));
    v11 = objc_msgSend(v8, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[AccessoryAction serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CD30;
  block[3] = &unk_1002C1CF8;
  objc_copyWeak(&v10, &location);
  v6 = v4;
  v9 = v6;
  dispatch_async(v5, block);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryAction accessory](self, "accessory"));
  -[AccessoryAction _performAction:waitForConnection:](self, "_performAction:waitForConnection:", v7, -[AccessoryAction requiresConnectivity](self, "requiresConnectivity"));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (void)_enqueueQCAction
{
  void *v3;
  void *v4;
  FMDActingRequestDecorator *v5;
  id v6;
  id v7;
  FMDActingRequestDecorator *v8;
  void *v9;
  QCAction *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryAction accessory](self, "accessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryAction account](self, "account"));
  v5 = [FMDActingRequestDecorator alloc];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001CF0C;
  v17[3] = &unk_1002C1D20;
  v18 = v3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001CFAC;
  v14[3] = &unk_1002C1D48;
  v15 = v4;
  v16 = v18;
  v6 = v18;
  v7 = v4;
  v8 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v5, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", v17, v14, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryAction serverInteractionController](self, "serverInteractionController"));
  v10 = -[QCAction initWithAccount:shutdownActivityPending:serverInteractionController:]([QCAction alloc], "initWithAccount:shutdownActivityPending:serverInteractionController:", v7, 0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandContext"));
  -[QCAction setCommandContext:](v10, "setCommandContext:", v11);

  -[QCAction setRequestDecorator:](v10, "setRequestDecorator:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
  v13 = objc_msgSend(v12, "enqueueAction:", v10);

}

- (void)_performAction:(id)a3 waitForConnection:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_claimAutoreleasedReturnValue(-[AccessoryAction serialQueue](self, "serialQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001D0D8;
  v9[3] = &unk_1002C1D70;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v12 = a4;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)accessoryIsConnected:(id)a3
{
  return objc_msgSend(a3, "connectionState") == (id)1;
}

- (void)accessoryDidUpdate:(id)a3
{
  id v4;

  v4 = a3;
  -[AccessoryAction _performAction:waitForConnection:](self, "_performAction:waitForConnection:", v4, -[AccessoryAction requiresConnectivity](self, "requiresConnectivity"));

}

- (void)accessoryDidPair:(id)a3
{
  id v4;

  v4 = a3;
  -[AccessoryAction _performAction:waitForConnection:](self, "_performAction:waitForConnection:", v4, -[AccessoryAction requiresConnectivity](self, "requiresConnectivity"));

}

- (void)accessoryDidUnpair:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[AccessoryAction serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D3E8;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (FMDInternalAccessory)accessory
{
  return (FMDInternalAccessory *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccessory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)requiresConnectivity
{
  return self->_requiresConnectivity;
}

- (void)setRequiresConnectivity:(BOOL)a3
{
  self->_requiresConnectivity = a3;
}

- (FMDServerInteractionController)serverInteractionController
{
  return (FMDServerInteractionController *)objc_loadWeakRetained((id *)&self->_serverInteractionController);
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeWeak((id *)&self->_serverInteractionController, a3);
}

- (BOOL)enqueuedQC
{
  return self->_enqueuedQC;
}

- (void)setEnqueuedQC:(BOOL)a3
{
  self->_enqueuedQC = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serverInteractionController);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end

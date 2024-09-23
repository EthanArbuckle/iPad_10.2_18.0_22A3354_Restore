@implementation TSCellularPlanProximityTransferController

- (TSCellularPlanProximityTransferController)initWithESIMDelegate:(id)a3
{
  id v4;
  TSCellularPlanProximityTransferController *v5;
  id v6;
  uint64_t v7;
  CoreTelephonyClient *client;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSCellularPlanProximityTransferController;
  v5 = -[TSCellularPlanProximityTransferController init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDC2810]);
    v7 = objc_msgSend(v6, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    client = v5->_client;
    v5->_client = (CoreTelephonyClient *)v7;

    -[CoreTelephonyClient setDelegate:](v5->_client, "setDelegate:", v5);
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)viewControllerDidComplete:(id)a3
{
  NSObject *v5;
  NSObject *WeakRetained;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v5;
  if (a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[TSCellularPlanProximityTransferController viewControllerDidComplete:]";
      _os_log_impl(&dword_21B647000, WeakRetained, OS_LOG_TYPE_DEFAULT, "view did complete @%s", (uint8_t *)&v7, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject didComplete](WeakRetained, "didComplete");
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[TSCellularPlanProximityTransferController viewControllerDidComplete:].cold.1(WeakRetained);
  }

}

- (void)userDidTapCancel
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TSCellularPlanProximityTransferController userDidTapCancel]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "user canceled secure intent flow @%s", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didComplete");

}

- (void)attemptFailed
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TSCellularPlanProximityTransferController attemptFailed]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "secure intent attempt failed @%s", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didComplete");

}

- (void)launchSecureIntentUI:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  TSSecureIntentGestureViewController *v13;
  NSObject *v14;
  id WeakRetained;
  NSObject *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v7 = a5;
  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t))a6;
  if (+[TSUtilities isSecureIntentUIRequired:](TSUtilities, "isSecureIntentUIRequired:", v10))
  {
    v13 = -[TSSecureIntentGestureViewController initWithExternalizedContext:descriptor:isLocalConvertFlow:]([TSSecureIntentGestureViewController alloc], "initWithExternalizedContext:descriptor:isLocalConvertFlow:", v10, v11, v7);
    -[TSSecureIntentGestureViewController setDelegate:](v13, "setDelegate:", self);
    _TSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = (const char *)v13;
      v20 = 2080;
      v21 = "-[TSCellularPlanProximityTransferController launchSecureIntentUI:descriptor:isLocalConvertFlow:completion:]";
      _os_log_impl(&dword_21B647000, v14, OS_LOG_TYPE_DEFAULT, "present %@ @%s", (uint8_t *)&v18, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didRequestPresentationForProxCard:", v13);

    v12[2](v12, 1);
    v12 = (void (**)(id, uint64_t))v13;
  }
  else
  {
    _TSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "-[TSCellularPlanProximityTransferController launchSecureIntentUI:descriptor:isLocalConvertFlow:completion:]";
      _os_log_impl(&dword_21B647000, v16, OS_LOG_TYPE_DEFAULT, "secure intent gesture is not required. skip @%s", (uint8_t *)&v18, 0xCu);
    }

    v17 = (id)-[CoreTelephonyClient updateSecureIntentData:](self->_client, "updateSecureIntentData:", v10);
    v12[2](v12, 1);
  }

}

- (ESIMProxTransferControllerDelegate)delegate
{
  return (ESIMProxTransferControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewControllerDidComplete:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSCellularPlanProximityTransferController viewControllerDidComplete:]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]invalid view controller @%s", (uint8_t *)&v1, 0xCu);
}

@end

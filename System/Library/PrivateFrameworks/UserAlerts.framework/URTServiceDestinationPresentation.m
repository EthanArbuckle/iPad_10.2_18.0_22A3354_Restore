@implementation URTServiceDestinationPresentation

- (URTServiceDestinationPresentation)initWithAlert:(id)a3 forDestination:(int64_t)a4 preferredPresentationStyle:(int64_t)a5
{
  id v9;
  URTServiceDestinationPresentation *v10;
  URTServiceDestinationPresentation *v11;
  void *v12;
  uint64_t v13;
  OS_dispatch_queue *remoteTargetQueue;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  OS_dispatch_queue *connectionQueue;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BSServiceConnection *connection;
  BSServiceConnection *v26;
  NSObject *v27;
  void *v28;
  BSServiceConnection *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  URTServiceDestinationPresentation *v35;
  id v36[2];
  id location;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  BSServiceConnection *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v38.receiver = self;
  v38.super_class = (Class)URTServiceDestinationPresentation;
  v10 = -[URTServiceDestinationPresentation init](&v38, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_alert, a3);
    v11->_destination = a4;
    v11->_preferredPresentationStyle = a5;
    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = BSDispatchQueueCreate();
    remoteTargetQueue = v11->_remoteTargetQueue;
    v11->_remoteTargetQueue = (OS_dispatch_queue *)v13;

    -[URTServiceDestinationPresentation remoteTargetQueue](v11, "remoteTargetQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v15);

    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = BSDispatchQueueCreate();
    connectionQueue = v11->_connectionQueue;
    v11->_connectionQueue = (OS_dispatch_queue *)v17;

    URTMachPortNameForAlertDestination(a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BE0FA08];
    +[URTAlertServiceSpecification identifier](URTAlertServiceSpecification, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endpointForMachName:service:instance:", v19, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE0FA00], "connectionWithEndpoint:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    connection = v11->_connection;
    v11->_connection = (BSServiceConnection *)v24;

    objc_initWeak(&location, v11);
    v26 = v11->_connection;
    v31 = MEMORY[0x24BDAC760];
    v32 = 3221225472;
    v33 = __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke;
    v34 = &unk_24DC7B2D0;
    v35 = v11;
    objc_copyWeak(v36, &location);
    v36[1] = (id)a4;
    -[BSServiceConnection configureConnection:](v26, "configureConnection:", &v31);
    URTLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      URTDescriptionForAlertDestination(a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v11->_connection;
      *(_DWORD *)buf = 138412546;
      v40 = v28;
      v41 = 2112;
      v42 = v29;
      _os_log_impl(&dword_21A1D3000, v27, OS_LOG_TYPE_DEFAULT, "Activating %@ connection: %@", buf, 0x16u);

    }
    -[BSServiceConnection activate](v11->_connection, "activate", v31, v32, v33, v34);
    objc_destroyWeak(v36);

    objc_destroyWeak(&location);
  }

  return v11;
}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9[2];
  _QWORD v10[4];
  id v11;

  v3 = a2;
  +[URTAlertServiceSpecification serviceQuality](URTAlertServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  +[URTAlertServiceSpecification interface](URTAlertServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_2;
  v10[3] = &unk_24DC7AFF0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  objc_msgSend(v3, "setActivationHandler:", v10);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_3;
  v8[3] = &unk_24DC7B288;
  v9[1] = *(id *)(a1 + 48);
  objc_copyWeak(v9, (id *)(a1 + 40));
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_7;
  v7[3] = &__block_descriptor_40_e29_v16__0__BSServiceConnection_8l;
  v7[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(v9);
  objc_destroyWeak(&v11);

}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionActivated");

}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  URTLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_3_cold_1(a1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionInterrupted");

}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  URTLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_7_cold_1(a1);

}

- (void)present
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  URTLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[URTServiceDestinationPresentation description](self, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21A1D3000, v3, OS_LOG_TYPE_DEFAULT, "attempting to present %@", buf, 0xCu);

  }
  -[URTServiceDestinationPresentation remoteTargetQueue](self, "remoteTargetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__URTServiceDestinationPresentation_present__block_invoke;
  block[3] = &unk_24DC7B160;
  block[4] = self;
  dispatch_async(v5, block);

}

void __44__URTServiceDestinationPresentation_present__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "preferredPresentationStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentAlert:preferringPresentationStyle:", v3, v4);

}

- (void)dismiss
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  URTLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[URTServiceDestinationPresentation description](self, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21A1D3000, v3, OS_LOG_TYPE_DEFAULT, "attempting to dismiss %@", buf, 0xCu);

  }
  -[URTServiceDestinationPresentation remoteTargetQueue](self, "remoteTargetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__URTServiceDestinationPresentation_dismiss__block_invoke;
  block[3] = &unk_24DC7B160;
  block[4] = self;
  dispatch_async(v5, block);

}

void __44__URTServiceDestinationPresentation_dismiss__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissAlert:", v3);

}

- (void)invalidate
{
  NSObject *v3;
  BSServiceConnection *connection;
  void *v5;
  int v6;
  BSServiceConnection *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  URTLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    -[URTServiceDestinationPresentation description](self, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = connection;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_21A1D3000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating connection %@ for %@", (uint8_t *)&v6, 0x16u);

  }
  -[BSServiceConnection invalidate](self->_connection, "invalidate");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)URTServiceDestinationPresentation;
  -[URTServiceDestinationPresentation description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  URTDescriptionForAlertDestination(-[URTServiceDestinationPresentation destination](self, "destination"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[URTServiceDestinationPresentation alert](self, "alert");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ destination: %@, alert: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)handleCancelAction
{
  void *v3;
  id v4;

  -[URTServiceDestinationPresentation connectionQueue](self, "connectionQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[URTServiceDestinationPresentation delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "handleCancelActionForAlertPresentation:", self);

}

- (void)handleDefaultAction
{
  void *v3;
  id v4;

  -[URTServiceDestinationPresentation connectionQueue](self, "connectionQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[URTServiceDestinationPresentation delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "handleDefaultActionForAlertPresentation:", self);

}

- (void)handleOtherAction
{
  void *v3;
  id v4;

  -[URTServiceDestinationPresentation connectionQueue](self, "connectionQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[URTServiceDestinationPresentation delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "handleOtherActionForAlertPresentation:", self);

}

- (void)_handleConnectionActivated
{
  NSObject *v3;
  BSServiceConnection *connection;
  void *v5;
  NSObject *v6;
  int v7;
  BSServiceConnection *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  URTLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    -[URTServiceDestinationPresentation description](self, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = connection;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_21A1D3000, v3, OS_LOG_TYPE_DEFAULT, "Connection activated %@ for %@", (uint8_t *)&v7, 0x16u);

  }
  -[URTServiceDestinationPresentation remoteTargetQueue](self, "remoteTargetQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v6);

}

- (void)_handleConnectionInterrupted
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_21A1D3000, v1, v2, "Connection interrupted! Reactivating %@ for %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (URTAlert)alert
{
  return self->_alert;
}

- (int64_t)destination
{
  return self->_destination;
}

- (int64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (URTDestinationPresentationDelegate)delegate
{
  return (URTDestinationPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)remoteTargetQueue
{
  return self->_remoteTargetQueue;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_remoteTargetQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_alert, 0);
}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_3_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  URTDescriptionForAlertDestination(*(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21A1D3000, v2, v3, "Connection for %@ interrupted! %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __93__URTServiceDestinationPresentation_initWithAlert_forDestination_preferredPresentationStyle___block_invoke_7_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  URTDescriptionForAlertDestination(*(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21A1D3000, v2, v3, "Connection for %@ invalidated! %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end

@implementation TUSimulatedIDSBatchIDQueryController

- (TUSimulatedIDSBatchIDQueryController)initWithService:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  OS_dispatch_queue *v11;
  TUSimulatedIDSBatchIDQueryController *v12;
  TUSimulatedIDSBatchIDQueryController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = (OS_dispatch_queue *)a5;
  v15.receiver = self;
  v15.super_class = (Class)TUSimulatedIDSBatchIDQueryController;
  v12 = -[TUSimulatedIDSBatchIDQueryController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    v13->_queue = v11;
  }

  return v13;
}

- (void)setDestinations:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUSimulatedIDSBatchIDQueryController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__TUSimulatedIDSBatchIDQueryController_setDestinations___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __56__TUSimulatedIDSBatchIDQueryController_setDestinations___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  _validDictionaryForDestinations(*(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "batchQueryController:updatedDestinationsStatus:onService:error:", v2, v3, v4, 0);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (IDSBatchIDQueryControllerDelegate)delegate
{
  return (IDSBatchIDQueryControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end

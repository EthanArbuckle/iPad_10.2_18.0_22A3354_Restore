@implementation PKIDSBatchIDQueryControllerWrapper

- (void)reachableDestinationsForDestination:(id)a3 service:(id)a4 queue:(id)a5 completion:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  IDSBatchIDQueryController *v15;
  IDSBatchIDQueryController *batchIDQueryController;
  void *v17;
  IDSBatchIDQueryController *v18;
  void *v19;
  void *v20;
  id completion;
  dispatch_time_t v22;
  _QWORD v23[4];
  id v24;
  id location;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (!self->_hasRunQuery)
  {
    self->_hasRunQuery = 1;
    v10 = (objc_class *)MEMORY[0x1E0D342B0];
    v11 = a6;
    v12 = a5;
    v13 = a4;
    v14 = a3;
    v15 = (IDSBatchIDQueryController *)objc_msgSend([v10 alloc], "initWithService:delegate:queue:", v13, self, v12);

    batchIDQueryController = self->_batchIDQueryController;
    self->_batchIDQueryController = v15;

    PKIDSNormalizedAddress(v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = self->_batchIDQueryController;
    v26[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSBatchIDQueryController setDestinations:](v18, "setDestinations:", v19);

    v20 = _Block_copy(v11);
    completion = self->_completion;
    self->_completion = v20;

    objc_initWeak(&location, self);
    v22 = dispatch_time(0, 20000000000);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __99__PKIDSBatchIDQueryControllerWrapper_reachableDestinationsForDestination_service_queue_completion___block_invoke;
    v23[3] = &unk_1E2AC3648;
    objc_copyWeak(&v24, &location);
    dispatch_after(v22, MEMORY[0x1E0C80D38], v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
}

void __99__PKIDSBatchIDQueryControllerWrapper_reachableDestinationsForDestination_service_queue_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[1])
  {
    PKLogFacilityTypeGetObject(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKIDSBatchIDQueryControllerWrapper: ERROR timed out waiting for IDS batch query callback", v4, 2u);
    }

    (*(void (**)(void))(v2[1] + 16))();
  }

}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v8;
  void *v9;
  id v10;
  id completion;
  id v12;

  if (self->_completion)
  {
    v8 = a6;
    objc_msgSend(a4, "keysOfEntriesPassingTest:", &__block_literal_global_112);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v12;
    if (v8)
      v10 = 0;
    (*((void (**)(id, id, id))self->_completion + 2))(self->_completion, v10, v8);

    completion = self->_completion;
    self->_completion = 0;

  }
}

BOOL __101__PKIDSBatchIDQueryControllerWrapper_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "integerValue") == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_batchIDQueryController, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end

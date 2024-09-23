@implementation PKSubcredentialProvisioningController

- (PKSubcredentialProvisioningController)init
{
  PKSubcredentialProvisioningController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *operationSerialQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSubcredentialProvisioningController;
  v2 = -[PKSubcredentialProvisioningController init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.passkit.provisioningController", 0);
    operationSerialQueue = v2->_operationSerialQueue;
    v2->_operationSerialQueue = (OS_dispatch_queue *)v3;

    v2->_stateLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)startProvisioningWithConfiguration:(id)a3
{
  PKSubcredentialProvisioningOperation *v5;
  PKSubcredentialProvisioningOperationContext *v6;
  PKSubcredentialProvisioningOperationContext *context;
  PKSubcredentialProvisioningTransitionTable *v8;
  PKSubcredentialProvisioningTransitionTable *transitionTable;
  int64_t v10;
  PKSubcredentialProvisioningOperation *v11;
  PKSubcredentialProvisioningOperation *currentOperation;
  unint64_t currentState;
  PKSubcredentialProvisioningOperation *v14;
  _BOOL4 hasStarted;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *operationSerialQueue;
  void *v23;
  _QWORD block[5];
  PKSubcredentialProvisioningOperation *v25;
  unint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  PKSubcredentialProvisioningOperation *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (PKSubcredentialProvisioningOperation *)a3;
  v6 = -[PKSubcredentialProvisioningOperationContext initWithQueue:]([PKSubcredentialProvisioningOperationContext alloc], "initWithQueue:", self->_operationSerialQueue);
  context = self->_context;
  self->_context = v6;

  os_unfair_lock_lock(&self->_stateLock);
  objc_storeStrong((id *)&self->_configuration, a3);
  -[PKSubcredentialProvisioningOperation transitionTable](v5, "transitionTable");
  v8 = (PKSubcredentialProvisioningTransitionTable *)objc_claimAutoreleasedReturnValue();
  transitionTable = self->_transitionTable;
  self->_transitionTable = v8;

  v10 = -[PKSubcredentialProvisioningOperation startingState](v5, "startingState");
  self->_currentState = v10;
  +[PKSubcredentialProvisioningOperation operationForState:configuration:context:delegate:](PKSubcredentialProvisioningOperation, "operationForState:configuration:context:delegate:", v10, v5, self->_context, self);
  v11 = (PKSubcredentialProvisioningOperation *)objc_claimAutoreleasedReturnValue();
  currentOperation = self->_currentOperation;
  self->_currentOperation = v11;

  currentState = self->_currentState;
  v14 = self->_currentOperation;
  hasStarted = self->_hasStarted;
  self->_hasStarted = 1;
  os_unfair_lock_unlock(&self->_stateLock);
  if (hasStarted)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Provisioning already has started", buf, 2u);
    }
  }
  else
  {
    -[PKSubcredentialProvisioningController webServiceFromConfiguration:](self, "webServiceFromConfiguration:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "targetDevice");
    v16 = objc_claimAutoreleasedReturnValue();

    -[NSObject noteProvisioningDidBegin](v16, "noteProvisioningDidBegin");
    v18 = -[PKSubcredentialProvisioningTransitionTable isValidStartingState:](self->_transitionTable, "isValidStartingState:", currentState);
    PKStringForSubcredentialProvisioningState(currentState);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v18 && v14)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412546;
        v28 = v19;
        v29 = 2112;
        v30 = v5;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Starting pairing in state '%@' with configuration: %@", buf, 0x16u);
      }

      operationSerialQueue = self->_operationSerialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke;
      block[3] = &unk_1E2AC5810;
      block[4] = self;
      v25 = v14;
      v26 = currentState;
      dispatch_async(operationSerialQueue, block);

    }
    else
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412546;
        v28 = v19;
        v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Invalid starting state '%@' with operation %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSubcredentialProvisioningController transitionToState:withOperation:error:](self, "transitionToState:withOperation:error:", 0, v14, v23);

    }
  }

}

void __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke_2;
  v5[3] = &unk_1E2AD33C8;
  v2 = (void *)a1[5];
  v6 = (id)a1[4];
  v3 = v2;
  v4 = a1[6];
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "_canBeginProvisioning:", v5);

}

void __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  _QWORD *v3;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v3 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke_3;
    v7[3] = &unk_1E2AC3620;
    v7[4] = v3;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = v5;
    v9 = v6;
    objc_msgSend(v3, "acquireProvisioningAssertionsWithCompletion:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionToState:withOperation:error:", 0, v3[9], a3);
  }
}

void __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained;
  char v4;
  void *v5;
  void *v6;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transitionToState:withOperation:error:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), v6);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "performOperation");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  if (!WeakRetained)
  {
    v5 = 0;
    goto LABEL_8;
  }
  v6 = WeakRetained;
  v4 = objc_opt_respondsToSelector();
  v5 = v6;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "subcredentialProvisioningController:didEnterState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
LABEL_6:
    v5 = v6;
  }
LABEL_8:

}

- (void)_canBeginProvisioning:(id)a3
{
  id v4;
  PKSecureElement *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  id location;
  _QWORD v13[5];
  id v14;
  _QWORD v15[3];
  char v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 1;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__45;
  v13[4] = __Block_byref_object_dispose__45;
  v14 = 0;
  v5 = objc_alloc_init(PKSecureElement);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke;
  v7[3] = &unk_1E2AD33F0;
  objc_copyWeak(&v11, &location);
  v9 = v15;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v10 = v13;
  -[PKSecureElement allAppletsAndCredentialsWithCompletion:](v5, "allAppletsAndCredentialsWithCompletion:", v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);

}

void __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  id *v23;
  _QWORD *v24;
  id v25;
  id *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  _QWORD block[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v7)
    {
      v8 = v7;
      v26 = a1;
      v27 = WeakRetained;
      v9 = 0;
      v10 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v4, "objectForKey:", v12, v26);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v35 != v16)
                  objc_enumerationMutation(v13);
                v9 += ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "supportedRadioTechnologies") >> 1) & 1;
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v15);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v8);

      a1 = v26;
      WeakRetained = v27;
      if (v9 > 7)
      {
        *(_BYTE *)(*((_QWORD *)v26[6] + 1) + 24) = 0;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 23, 0);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *((_QWORD *)v26[7] + 1);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

        v21 = v26[5];
        v22 = *((_QWORD *)v26[4] + 4);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke_3;
        v28[3] = &unk_1E2AC5748;
        v23 = &v29;
        v29 = v21;
        v30 = *((_OWORD *)v26 + 3);
        v24 = v28;
LABEL_20:
        dispatch_async(v22, v24);

        goto LABEL_21;
      }
    }
    else
    {

    }
    *(_BYTE *)(*((_QWORD *)a1[6] + 1) + 24) = 1;
    v25 = a1[5];
    v22 = *((_QWORD *)a1[4] + 4);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke_2;
    block[3] = &unk_1E2AC5748;
    v23 = &v32;
    v32 = v25;
    v33 = *((_OWORD *)a1 + 3);
    v24 = block;
    goto LABEL_20;
  }
LABEL_21:

}

uint64_t __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

uint64_t __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)cancelProvisioningWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  unint64_t currentState;
  PKSubcredentialProvisioningOperation *v6;
  _BOOL4 hasBeenCanceled;
  void *v8;
  NSObject *v9;
  void *v10;
  id cancelCompletion;
  NSObject *v12;
  NSObject *v13;
  NSObject *operationSerialQueue;
  _QWORD block[4];
  PKSubcredentialProvisioningOperation *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(&self->_stateLock);
  currentState = self->_currentState;
  v6 = self->_currentOperation;
  hasBeenCanceled = self->_hasBeenCanceled;
  if (-[PKSubcredentialProvisioningTransitionTable isStateFinal:](self->_transitionTable, "isStateFinal:", currentState))
  {
    self->_hasBeenCanceled = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    PKStringForSubcredentialProvisioningState(currentState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Can't cancel terminal state '%@'", buf, 0xCu);
    }

    if (v4)
      v4[2](v4);
  }
  else
  {
    v10 = _Block_copy(v4);
    cancelCompletion = self->_cancelCompletion;
    self->_cancelCompletion = v10;

    self->_hasBeenCanceled = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    if (hasBeenCanceled)
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Likely overwrote existing cancelation handler", buf, 2u);
      }

    }
    PKStringForSubcredentialProvisioningState(currentState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Canceling operation '%@'", buf, 0xCu);
    }

    if (-[PKSubcredentialProvisioningOperation canCancelOperation](v6, "canCancelOperation"))
    {
      operationSerialQueue = self->_operationSerialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__PKSubcredentialProvisioningController_cancelProvisioningWithCompletion___block_invoke;
      block[3] = &unk_1E2ABE120;
      v16 = v6;
      dispatch_async(operationSerialQueue, block);

    }
  }

}

uint64_t __74__PKSubcredentialProvisioningController_cancelProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelOperation");
}

- (void)finishProvisioningWithError:(id)a3 state:(int64_t)a4
{
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a3;
  -[PKSubcredentialProvisioningController cleanUpProvisioningAfterError:](self, "cleanUpProvisioningAfterError:", v8 != 0);
  if (v8 || self->_currentState != 16)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "subcredentialProvisioningController:didFinishWithError:inState:", self, v8, a4);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "subcredentialProvisioningController:didFinishWithError:", self, v8);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[PKSubcredentialProvisioningController provisionedPass](self, "provisionedPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "subcredentialProvisioningController:didFinishWithPass:", self, v7);

  }
}

- (void)cleanUpProvisioningAfterError:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  PKDAManager *v15;
  void *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v3 = a3;
  -[PKSubcredentialProvisioningController webServiceFromConfiguration:](self, "webServiceFromConfiguration:", self->_configuration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSubcredentialProvisioningController addedCredential](self, "addedCredential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningController provisionedPass](self, "provisionedPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKSubcredentialProvisioningConfiguration configurationType](self->_configuration, "configurationType");
  if (v9 == 2)
  {
    -[PKSubcredentialProvisioningConfiguration remoteDeviceConfiguration](self->_configuration, "remoteDeviceConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sharingSession");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9 == 1)
    {
      -[PKSubcredentialProvisioningConfiguration acceptInvitationConfiguration](self->_configuration, "acceptInvitationConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9)
        goto LABEL_10;
      -[PKSubcredentialProvisioningConfiguration ownerConfiguration](self->_configuration, "ownerConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    objc_msgSend(v10, "session");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  if (v13)
  {
    objc_msgSend(v13, "endSession");

  }
LABEL_10:
  if (v7 && !v8)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Provisioning did add a credential but not a pass, removing credential", buf, 2u);
    }

    v15 = objc_alloc_init(PKDAManager);
    objc_msgSend(v7, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDAManager deleteCredential:completion:](v15, "deleteCredential:completion:", v16, &__block_literal_global_142);

  }
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Scheduling consistency check on the target device due to provisoning error", v18, 2u);
    }

    objc_msgSend(v6, "consistencyCheck");
  }
  objc_msgSend(v6, "noteProvisioningDidEnd");
  -[PKSubcredentialProvisioningController releaseProvisioningAssertions](self, "releaseProvisioningAssertions");
  -[PKSubcredentialProvisioningController declineRelatedInvitationsIfNecessary](self, "declineRelatedInvitationsIfNecessary");

}

void __71__PKSubcredentialProvisioningController_cleanUpProvisioningAfterError___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Revoked credential - error:%@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)declineRelatedInvitationsIfNecessary
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[PKSubcredentialProvisioningConfiguration configurationType](self->_configuration, "configurationType");
  if (v3 == 1)
  {
    -[PKSubcredentialProvisioningConfiguration acceptInvitationConfiguration](self->_configuration, "acceptInvitationConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteDeviceWebService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKSubcredentialProvisioningOperationContext hasAcceptedInvitation](self->_context, "hasAcceptedInvitation"))
    {
LABEL_4:
      objc_msgSend(v4, "invitation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else
  {
    if (v3 != 3)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_22;
    }
    -[PKSubcredentialProvisioningConfiguration remoteDeviceInvitation](self->_configuration, "remoteDeviceInvitation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localDeviceWebService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKSubcredentialProvisioningOperationContext hasAcceptedInvitation](self->_context, "hasAcceptedInvitation"))
      goto LABEL_4;
  }
  v6 = 0;
LABEL_7:
  v7 = objc_msgSend(v4, "declineRelatedInvitations");

  if (v5)
  {
    if (!v6)
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "No invite was accepted, skipping declining related invites", (uint8_t *)&v13, 2u);
      }
      goto LABEL_21;
    }
    if (v7)
    {
      v8 = objc_msgSend(v6, "copy");
      -[NSObject setIdentifier:](v8, "setIdentifier:", 0);
      -[NSObject setSharingSessionIdentifier:](v8, "setSharingSessionIdentifier:", 0);
      objc_msgSend(v5, "targetDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();
      PKLogFacilityTypeGetObject(0x16uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if ((v10 & 1) != 0)
      {
        if (v12)
        {
          v13 = 138412290;
          v14 = v8;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Declining invites similar to: %@", (uint8_t *)&v13, 0xCu);
        }

        objc_msgSend(v9, "paymentWebService:declineRelatedSharingInvitationsIfNecessary:withCompletion:", v5, v8, 0);
      }
      else
      {
        if (v12)
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Target device doesn't support declining related invitations", (uint8_t *)&v13, 2u);
        }

      }
LABEL_21:

    }
  }
LABEL_22:

}

- (void)transitionToState:(int64_t)a3 withOperation:(id)a4 error:(id)a5
{
  PKSubcredentialProvisioningOperation *v8;
  id v9;
  PKSubcredentialProvisioningOperation **p_currentOperation;
  NSObject *v11;
  unint64_t currentState;
  void *v13;
  NSObject *v14;
  void (**v15)(_QWORD);
  id cancelCompletion;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  PKSubcredentialProvisioningOperation *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  NSObject *operationSerialQueue;
  void *v33;
  void *v34;
  unint64_t v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  PKSubcredentialProvisioningOperation *v40;
  int64_t v41;
  int64_t v42;
  unint64_t v43;
  uint64_t v44;
  PKSubcredentialProvisioningOperation *v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = (PKSubcredentialProvisioningOperation *)a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_stateLock);
  p_currentOperation = &self->_currentOperation;
  if (self->_currentOperation == v8)
  {
    currentState = self->_currentState;
    PKStringForSubcredentialProvisioningState(currentState);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_hasBeenCanceled)
    {
      if (a3 != 1)
      {
        PKLogFacilityTypeGetObject(0x16uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v13;
          _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Stopping transition from '%@' due to pending cancellation", buf, 0xCu);
        }

      }
      v15 = (void (**)(_QWORD))_Block_copy(self->_cancelCompletion);
      cancelCompletion = self->_cancelCompletion;
      self->_cancelCompletion = 0;

      os_unfair_lock_unlock(&self->_stateLock);
      -[PKSubcredentialProvisioningController cleanUpProvisioningAfterError:](self, "cleanUpProvisioningAfterError:", 1);
      if (v15)
        v15[2](v15);
      goto LABEL_25;
    }
    if (!-[PKSubcredentialProvisioningTransitionTable isValidStateTransitionFrom:to:](self->_transitionTable, "isValidStateTransitionFrom:to:", currentState, a3))
    {
      PKStringForSubcredentialProvisioningState(a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot transition from state '%@' to state '%@'"), v13, v17);
      v19 = (void *)v18;
      if (!v9)
      {
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v46 = *MEMORY[0x1E0CB2938];
        v47 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v20 = v13;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, v21);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        v13 = v20;
      }

      a3 = 0;
    }
    v35 = currentState;
    if (-[PKSubcredentialProvisioningTransitionTable isStateFinal:](self->_transitionTable, "isStateFinal:", a3))
    {
      v22 = *p_currentOperation;
      *p_currentOperation = 0;
    }
    else
    {
      v33 = v13;
      -[PKSubcredentialProvisioningOperation configuration](v8, "configuration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSubcredentialProvisioningOperation context](v8, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSubcredentialProvisioningOperation delegate](v8, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKSubcredentialProvisioningOperation operationForState:configuration:context:delegate:](PKSubcredentialProvisioningOperation, "operationForState:configuration:context:delegate:", a3, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v13 = v33;
LABEL_24:
        self->_currentState = a3;
        objc_storeStrong((id *)&self->_currentOperation, v26);
        v31 = self->_currentState;
        os_unfair_lock_unlock(&self->_stateLock);
        operationSerialQueue = self->_operationSerialQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke;
        block[3] = &unk_1E2AD3468;
        v41 = a3;
        v42 = v31;
        block[4] = self;
        v37 = v26;
        v38 = v13;
        v9 = v9;
        v39 = v9;
        v40 = v8;
        v43 = v35;
        v15 = v26;
        dispatch_async(operationSerialQueue, block);

LABEL_25:
        goto LABEL_26;
      }
      v27 = objc_alloc(MEMORY[0x1E0CB3940]);
      PKStringForSubcredentialProvisioningState(0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (PKSubcredentialProvisioningOperation *)objc_msgSend(v27, "initWithFormat:", CFSTR("Failed to create operation for state: %@"), v28);

      v13 = v33;
      if (!v9)
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v44 = *MEMORY[0x1E0CB2938];
        v45 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("PKSubcredentialProvisioningErrorDomain"), 0, v30);
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      a3 = 0;
    }

    v26 = 0;
    goto LABEL_24;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Received unexpected transition request, dropping it...", buf, 2u);
  }

  os_unfair_lock_unlock(&self->_stateLock);
LABEL_26:

}

void __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  char v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  PKStringForSubcredentialProvisioningState(*(_QWORD *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKStringForSubcredentialProvisioningState(*(_QWORD *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v27 = v4;
      v28 = 2112;
      v29 = v3;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Transitioning to state '%@' (expected state '%@') from state '%@'", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "performOperation");
  }
  else if (*(_QWORD *)(a1 + 56)
         && objc_msgSend(*(id *)(a1 + 64), "canBeRestarted")
         && (v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112)),
             v8 = objc_opt_respondsToSelector(),
             v7,
             (v8 & 1) != 0))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v27 = v10;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Checking if error should cause failure in state '%@'", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 56);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke_43;
    v18[3] = &unk_1E2AD3440;
    objc_copyWeak(v25, (id *)buf);
    v19 = *(id *)(a1 + 48);
    v20 = v4;
    v21 = v3;
    v14 = *(id *)(a1 + 56);
    v25[1] = *(id *)(a1 + 88);
    v15 = *(_QWORD *)(a1 + 32);
    v22 = v14;
    v23 = v15;
    v24 = *(id *)(a1 + 64);
    objc_msgSend(v11, "subcredentialProvisioningController:shouldFailAfterError:withCompletion:", v12, v13, v18);

    objc_destroyWeak(v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v27 = v4;
      v28 = 2112;
      v29 = v3;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Transitioning to state '%@' (expected state '%@') from state '%@'", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishProvisioningWithError:state:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88));
  }
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "subcredentialProvisioningController:didEnterState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80));

}

void __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke_43(uint64_t a1, char a2)
{
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  NSObject **v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  char v19;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 80));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke_2;
    block[3] = &unk_1E2AD3418;
    v19 = a2;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v14 = v5;
    v7 = *(id *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 88);
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(void **)(a1 + 72);
    v15 = v7;
    v16 = v8;
    v17 = v9;
    dispatch_async(v6, block);

  }
}

uint64_t __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 96))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v9 = 138412802;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error should cause failure in state '%@' transitioning to state '%@' (expected state '%@')", (uint8_t *)&v9, 0x20u);
    }

    return objc_msgSend(*(id *)(a1 + 56), "finishProvisioningWithError:state:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88));
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 72) + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 72) + 80) = *(_QWORD *)(a1 + 88);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 72) + 72), *(id *)(a1 + 80));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 72) + 40));
    PKLogFacilityTypeGetObject(0x16uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Error should not cause failure, retrying operation for state '%@'", (uint8_t *)&v9, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 80), "performOperation");
  }
}

- (PKAppletSubcredential)addedCredential
{
  os_unfair_lock_s *p_stateLock;
  PKAppletSubcredential *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_addedCredential;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (PKPaymentPass)provisionedPass
{
  os_unfair_lock_s *p_stateLock;
  PKPaymentPass *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_provisionedPass;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (int64_t)currentState
{
  os_unfair_lock_s *p_stateLock;
  int64_t currentState;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  currentState = self->_currentState;
  os_unfair_lock_unlock(p_stateLock);
  return currentState;
}

- (id)webServiceFromConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  switch(-[PKSubcredentialProvisioningConfiguration configurationType](self->_configuration, "configurationType", a3))
  {
    case 0:
      -[PKSubcredentialProvisioningConfiguration ownerConfiguration](self->_configuration, "ownerConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1:
      -[PKSubcredentialProvisioningConfiguration acceptInvitationConfiguration](self->_configuration, "acceptInvitationConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v6 = v4;
      objc_msgSend(v4, "webService");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      -[PKSubcredentialProvisioningConfiguration remoteDeviceConfiguration](self->_configuration, "remoteDeviceConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      -[PKSubcredentialProvisioningConfiguration remoteDeviceInvitation](self->_configuration, "remoteDeviceInvitation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = v8;
      objc_msgSend(v8, "remoteDeviceWebService");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v5 = (void *)v7;

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)acquireProvisioningAssertionsWithCompletion:(id)a3
{
  id v4;
  int64_t v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  OS_dispatch_queue *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  char v21;
  char v22;
  char v23;
  _QWORD v24[4];
  NSObject *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  NSObject *v34;
  id v35;
  id location[2];

  v4 = a3;
  v5 = -[PKSubcredentialProvisioningConfiguration configurationType](self->_configuration, "configurationType");
  if (!v5)
  {
    v6 = 1;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    v6 = 0;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "processIdentifier");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Credential Provisioning (%@:%ld)"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_operationSerialQueue;
    v12 = dispatch_group_create();
    objc_initWeak(location, self);
    dispatch_group_enter(v12);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke;
    v32[3] = &unk_1E2AD3490;
    v13 = v11;
    v33 = v13;
    objc_copyWeak(&v35, location);
    v14 = v12;
    v34 = v14;
    +[PKAssertion acquireAssertionOfType:withReason:completion:](PKAssertion, "acquireAssertionOfType:withReason:completion:", 4, v10, v32);

    objc_destroyWeak(&v35);
    v15 = MEMORY[0x1E0C809B0];
    if ((v6 & 1) != 0)
    {
      dispatch_group_enter(v14);
      v28[0] = v15;
      v28[1] = 3221225472;
      v28[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_49;
      v28[3] = &unk_1E2AD3490;
      v16 = v13;
      v29 = v16;
      objc_copyWeak(&v31, location);
      v17 = v14;
      v30 = v17;
      +[PKAssertion acquireAssertionOfType:withReason:completion:](PKAssertion, "acquireAssertionOfType:withReason:completion:", 0, v10, v28);

      objc_destroyWeak(&v31);
      dispatch_group_enter(v17);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_52;
      v24[3] = &unk_1E2AD3490;
      v25 = v16;
      objc_copyWeak(&v27, location);
      v26 = v17;
      +[PKAssertion acquireAssertionOfType:withReason:completion:](PKAssertion, "acquireAssertionOfType:withReason:completion:", 3, v10, v24);

      objc_destroyWeak(&v27);
      v15 = MEMORY[0x1E0C809B0];
    }
    if (v4)
    {
      block[0] = v15;
      block[1] = 3221225472;
      block[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_55;
      block[3] = &unk_1E2AD34B8;
      objc_copyWeak(&v20, location);
      v19 = v4;
      v21 = 1;
      v22 = v6;
      v23 = v6;
      dispatch_group_notify(v14, v13, block);

      objc_destroyWeak(&v20);
    }
    objc_destroyWeak(location);

    goto LABEL_12;
  }
  if (v4)
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_12:

}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E2AC2E68;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __int16 v8;
  _QWORD v9[4];
  id v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_storeStrong(WeakRetained + 6, v5);
      objc_msgSend(*(id *)(a1 + 32), "setInvalidateWhenBackgrounded:", 0);
      v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3;
      v9[3] = &unk_1E2AC3648;
      objc_copyWeak(&v10, v2);
      objc_msgSend(v6, "setInvalidationHandler:", v9);
      objc_destroyWeak(&v10);
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to acquire user notification suppression assertion", (uint8_t *)&v8, 2u);
      }

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2_50;
  block[3] = &unk_1E2AC2E68;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2_50(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __int16 v8;
  _QWORD v9[4];
  id v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_storeStrong(WeakRetained + 8, v5);
      objc_msgSend(*(id *)(a1 + 32), "setInvalidateWhenBackgrounded:", 0);
      v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3_51;
      v9[3] = &unk_1E2AC3648;
      objc_copyWeak(&v10, v2);
      objc_msgSend(v6, "setInvalidationHandler:", v9);
      objc_destroyWeak(&v10);
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to acquire contactless interface suppression assertion", (uint8_t *)&v8, 2u);
      }

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3_51(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[8];
    WeakRetained[8] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2_53;
  block[3] = &unk_1E2AC2E68;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2_53(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __int16 v8;
  _QWORD v9[4];
  id v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_storeStrong(WeakRetained + 7, v5);
      objc_msgSend(*(id *)(a1 + 32), "setInvalidateWhenBackgrounded:", 0);
      v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3_54;
      v9[3] = &unk_1E2AC3648;
      objc_copyWeak(&v10, v2);
      objc_msgSend(v6, "setInvalidationHandler:", v9);
      objc_destroyWeak(&v10);
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to acquire field detect suppression assertion", (uint8_t *)&v8, 2u);
      }

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3_54(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[7];
    WeakRetained[7] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_55(uint64_t a1)
{
  uint64_t WeakRetained;
  id v3;

  WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (id)WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 48) && !*(_QWORD *)(WeakRetained + 48)
      || *(_BYTE *)(a1 + 49) && !*(_QWORD *)(WeakRetained + 64))
    {
      WeakRetained = 0;
    }
    else if (*(_BYTE *)(a1 + 50))
    {
      WeakRetained = *(_QWORD *)(WeakRetained + 56) != 0;
    }
    else
    {
      WeakRetained = 1;
    }
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), WeakRetained);

}

- (void)releaseProvisioningAssertions
{
  PKAssertion *userNotificationAssertion;
  PKAssertion *fieldDetectSuppressionAssertion;
  PKAssertion *contactlessInterfaceSuppressionAssertion;

  -[PKAssertion invalidate](self->_userNotificationAssertion, "invalidate");
  userNotificationAssertion = self->_userNotificationAssertion;
  self->_userNotificationAssertion = 0;

  -[PKAssertion invalidate](self->_fieldDetectSuppressionAssertion, "invalidate");
  fieldDetectSuppressionAssertion = self->_fieldDetectSuppressionAssertion;
  self->_fieldDetectSuppressionAssertion = 0;

  -[PKAssertion invalidate](self->_contactlessInterfaceSuppressionAssertion, "invalidate");
  contactlessInterfaceSuppressionAssertion = self->_contactlessInterfaceSuppressionAssertion;
  self->_contactlessInterfaceSuppressionAssertion = 0;

}

- (void)operation:(id)a3 advanceToState:(int64_t)a4
{
  -[PKSubcredentialProvisioningController transitionToState:withOperation:error:](self, "transitionToState:withOperation:error:", a4, a3, 0);
}

- (void)operation:(id)a3 failWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0x16uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Failing with error: %@", (uint8_t *)&v9, 0xCu);
  }

  -[PKSubcredentialProvisioningController transitionToState:withOperation:error:](self, "transitionToState:withOperation:error:", 0, v6, v7);
}

- (void)operation:(id)a3 addedCredential:(id)a4
{
  PKAppletSubcredential *v6;
  PKSubcredentialProvisioningOperation *v7;
  PKSubcredentialProvisioningOperation *currentOperation;
  NSObject *v9;
  PKAppletSubcredential *addedCredential;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v6 = (PKAppletSubcredential *)a4;
  v7 = (PKSubcredentialProvisioningOperation *)a3;
  os_unfair_lock_lock(&self->_stateLock);
  currentOperation = self->_currentOperation;

  if (currentOperation != v7)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Received unexpected credential?", buf, 2u);
    }

  }
  addedCredential = self->_addedCredential;
  if (addedCredential)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Adding credential with credential already added?", v12, 2u);
    }

    addedCredential = self->_addedCredential;
  }
  self->_addedCredential = v6;

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)operationWasCanceled:(id)a3
{
  -[PKSubcredentialProvisioningController transitionToState:withOperation:error:](self, "transitionToState:withOperation:error:", 1, a3, 0);
}

- (void)operation:(id)a3 addedPass:(id)a4
{
  PKPaymentPass *v5;
  PKPaymentPass *provisionedPass;

  v5 = (PKPaymentPass *)a4;
  os_unfair_lock_lock(&self->_stateLock);
  provisionedPass = self->_provisionedPass;
  self->_provisionedPass = v5;

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  PKSubcredentialProvisioningOperation *v7;
  int64_t currentState;
  BOOL v9;
  PKSubcredentialProvisioningTransitionTable *transitionTable;
  NSObject *operationSerialQueue;
  _QWORD v12[4];
  PKSubcredentialProvisioningOperation *v13;
  id v14;
  unint64_t v15;
  int64_t v16;

  v6 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v7 = self->_currentOperation;
  currentState = self->_currentState;
  v9 = -[PKSubcredentialProvisioningTransitionTable isStateFinal:](self->_transitionTable, "isStateFinal:", currentState);
  transitionTable = self->_transitionTable;
  os_unfair_lock_unlock(&self->_stateLock);
  if (transitionTable)
  {
    if (!v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        operationSerialQueue = self->_operationSerialQueue;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __64__PKSubcredentialProvisioningController_session_didChangeState___block_invoke;
        v12[3] = &unk_1E2AD34E0;
        v13 = v7;
        v14 = v6;
        v15 = a4;
        v16 = currentState;
        dispatch_async(operationSerialQueue, v12);

      }
    }
  }

}

void __64__PKSubcredentialProvisioningController_session_didChangeState___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isInProgress"))
  {
    objc_msgSend(*(id *)(a1 + 32), "session:didChangeState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    PKStringForSubcredentialProvisioningState(*(_QWORD *)(a1 + 56));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring session:didChangeState: on state %@ - operation completed", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
  id v4;
  PKSubcredentialProvisioningOperation *v5;
  unint64_t currentState;
  NSObject *operationSerialQueue;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  PKSubcredentialProvisioningOperation *v11;
  id v12;
  unint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v5 = self->_currentOperation;
  currentState = self->_currentState;
  os_unfair_lock_unlock(&self->_stateLock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    operationSerialQueue = self->_operationSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__PKSubcredentialProvisioningController_appletSubcredentialPairingSessionDidBeginPairing___block_invoke;
    block[3] = &unk_1E2AC5810;
    v11 = v5;
    v12 = v4;
    v13 = currentState;
    dispatch_async(operationSerialQueue, block);

    v8 = v11;
  }
  else
  {
    PKStringForSubcredentialProvisioningState(currentState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Missing appletSubcredentialPairingSessionDidBeginPairing: on state %@", buf, 0xCu);
    }

  }
}

void __90__PKSubcredentialProvisioningController_appletSubcredentialPairingSessionDidBeginPairing___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isInProgress"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appletSubcredentialPairingSessionDidBeginPairing:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    PKStringForSubcredentialProvisioningState(*(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring appletSubcredentialPairingSessionDidBeginPairing: on state %@ - operation completed", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKSubcredentialProvisioningOperation *v11;
  unint64_t currentState;
  NSObject *operationSerialQueue;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  PKSubcredentialProvisioningOperation *v17;
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_stateLock);
  v11 = self->_currentOperation;
  currentState = self->_currentState;
  os_unfair_lock_unlock(&self->_stateLock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    operationSerialQueue = self->_operationSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __123__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didEndPairingWithSubcredential_registrationData___block_invoke;
    block[3] = &unk_1E2ACB818;
    v17 = v11;
    v18 = v8;
    v19 = v9;
    v20 = v10;
    v21 = currentState;
    dispatch_async(operationSerialQueue, block);

    v14 = v17;
  }
  else
  {
    PKStringForSubcredentialProvisioningState(currentState);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v14;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Missing didEndPairingWithSubcredential: on state %@", buf, 0xCu);
    }

  }
}

void __123__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didEndPairingWithSubcredential_registrationData___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isInProgress"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appletSubcredentialPairingSession:didEndPairingWithSubcredential:registrationData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    PKStringForSubcredentialProvisioningState(*(_QWORD *)(a1 + 64));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring didEndPairingWithSubcredential: on state %@ - operation completed", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
  id v6;
  id v7;
  PKSubcredentialProvisioningOperation *v8;
  unint64_t currentState;
  NSObject *operationSerialQueue;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  PKSubcredentialProvisioningOperation *v14;
  id v15;
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  v8 = self->_currentOperation;
  currentState = self->_currentState;
  os_unfair_lock_unlock(&self->_stateLock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    operationSerialQueue = self->_operationSerialQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __98__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didEndPairingWithError___block_invoke;
    v13[3] = &unk_1E2AD0268;
    v14 = v8;
    v15 = v6;
    v16 = v7;
    v17 = currentState;
    dispatch_async(operationSerialQueue, v13);

    v11 = v14;
  }
  else
  {
    PKStringForSubcredentialProvisioningState(currentState);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Missing didEndPairingWithError: on state %@", buf, 0xCu);
    }

  }
}

void __98__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didEndPairingWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isInProgress"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appletSubcredentialPairingSession:didEndPairingWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    PKStringForSubcredentialProvisioningState(*(_QWORD *)(a1 + 56));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring appletSubcredentialPairingSession:didEndPairingWithError: on state %@ - operation completed", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  PKSubcredentialProvisioningOperation *v8;
  unint64_t currentState;
  NSObject *operationSerialQueue;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  PKSubcredentialProvisioningOperation *v14;
  id v15;
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  v8 = self->_currentOperation;
  currentState = self->_currentState;
  os_unfair_lock_unlock(&self->_stateLock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    operationSerialQueue = self->_operationSerialQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __104__PKSubcredentialProvisioningController_appletSubcredentialPairingSessionDidFirstTransaction_withError___block_invoke;
    v13[3] = &unk_1E2AD0268;
    v14 = v8;
    v15 = v6;
    v16 = v7;
    v17 = currentState;
    dispatch_async(operationSerialQueue, v13);

    v11 = v14;
  }
  else
  {
    PKStringForSubcredentialProvisioningState(currentState);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Missing appletSubcredentialPairingSessionDidFirstTransaction:withError: on state %@", buf, 0xCu);
    }

  }
}

void __104__PKSubcredentialProvisioningController_appletSubcredentialPairingSessionDidFirstTransaction_withError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isInProgress"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appletSubcredentialPairingSessionDidFirstTransaction:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    PKStringForSubcredentialProvisioningState(*(_QWORD *)(a1 + 56));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring appletSubcredentialPairingSessionDidFirstTransaction:withError: on state %@ - operation completed", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4
{
  id v6;
  id v7;
  PKSubcredentialProvisioningOperation *v8;
  unint64_t currentState;
  NSObject *operationSerialQueue;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  PKSubcredentialProvisioningOperation *v14;
  id v15;
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  v8 = self->_currentOperation;
  currentState = self->_currentState;
  os_unfair_lock_unlock(&self->_stateLock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    operationSerialQueue = self->_operationSerialQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didFinishPreWarmWithResult___block_invoke;
    v13[3] = &unk_1E2AD0268;
    v14 = v8;
    v15 = v6;
    v16 = v7;
    v17 = currentState;
    dispatch_async(operationSerialQueue, v13);

    v11 = v14;
  }
  else
  {
    PKStringForSubcredentialProvisioningState(currentState);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Missing appletSubcredentialPairingSession:didFinishPreWarmWithResult: on state %@", buf, 0xCu);
    }

  }
}

void __102__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didFinishPreWarmWithResult___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isInProgress"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appletSubcredentialPairingSession:didFinishPreWarmWithResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    PKStringForSubcredentialProvisioningState(*(_QWORD *)(a1 + 56));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring appletSubcredentialPairingSession:didFinishPreWarmWithResult: on state %@ - operation completed", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishProbingTerminalWithError:(id)a4 brandCode:(unint64_t)a5
{
  NSObject *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject(0x16uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected delgate invoked appletSubcredentialPairingSession:didFinishPreWarmWithResult:", v6, 2u);
  }

}

- (PKSubcredentialProvisioningControllerDelegate)delegate
{
  return (PKSubcredentialProvisioningControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_cancelCompletion, 0);
  objc_storeStrong((id *)&self->_addedCredential, 0);
  objc_storeStrong((id *)&self->_provisionedPass, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_contactlessInterfaceSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_fieldDetectSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_userNotificationAssertion, 0);
  objc_storeStrong((id *)&self->_operationSerialQueue, 0);
  objc_storeStrong((id *)&self->_transitionTable, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

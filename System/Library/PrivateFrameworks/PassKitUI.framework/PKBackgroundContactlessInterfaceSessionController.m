@implementation PKBackgroundContactlessInterfaceSessionController

- (PKBackgroundContactlessInterfaceSessionController)initWithFieldProperties:(id)a3 forPassUniqueID:(id)a4 relinquishOwnership:(id)a5
{
  id v8;
  id v9;
  PKBackgroundContactlessInterfaceSessionController *v10;
  void *v11;
  void *v12;
  void *v13;
  PKBackgroundContactlessInterfaceSessionController *v14;
  PKBackgroundContactlessInterfaceSessionController *v15;
  void *v16;
  id relinquishOwnershipBlock;
  objc_super v19;

  v8 = a4;
  v9 = a5;
  v10 = 0;
  if (a3 && v8)
  {
    if (objc_msgSend(a3, "terminalType") == 4)
    {
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "passWithUniqueID:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "secureElementPass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && objc_msgSend(v13, "isIdentityPass"))
      {
        v19.receiver = self;
        v19.super_class = (Class)PKBackgroundContactlessInterfaceSessionController;
        v14 = -[PKBackgroundContactlessInterfaceSessionController init](&v19, sel_init);
        v15 = v14;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_pass, v13);
          v16 = _Block_copy(v9);
          relinquishOwnershipBlock = v15->_relinquishOwnershipBlock;
          v15->_relinquishOwnershipBlock = v16;

          v15->_lifecycleState = 0;
          v15->_lock._os_unfair_lock_opaque = 0;
        }
        self = v15;
        v10 = self;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PKBackgroundContactlessInterfaceSessionController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKBackgroundContactlessInterfaceSessionController;
  -[PKBackgroundContactlessInterfaceSessionController dealloc](&v3, sel_dealloc);
}

- (void)start
{
  os_unfair_lock_s *p_lock;
  PKPaymentSessionHandle *sessionHandle;
  void *v5;
  PKPaymentSessionHandle *v6;
  PKPaymentSessionHandle *v7;
  _QWORD v8[4];
  id v9;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lifecycleState || self->_session)
  {
    os_unfair_lock_unlock(p_lock);
LABEL_4:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKBackgroundContactlessInterfaceSessionController: Start called twice"));
    return;
  }
  sessionHandle = self->_sessionHandle;
  os_unfair_lock_unlock(p_lock);
  if (sessionHandle)
    goto LABEL_4;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0D672B8];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PKBackgroundContactlessInterfaceSessionController_start__block_invoke;
  v8[3] = &unk_1E3E62038;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "startSTSContactlessInterfaceSessionWithDelegate:completion:", 0, v8);
  v6 = (PKPaymentSessionHandle *)objc_claimAutoreleasedReturnValue();
  v7 = self->_sessionHandle;
  self->_sessionHandle = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__PKBackgroundContactlessInterfaceSessionController_start__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_4;
  if (!a3)
  {
    objc_msgSend(WeakRetained, "setSession:", v7);
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "invalidate");
  if (v7)
LABEL_4:
    InvalidateSession(v7);
LABEL_6:

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);
  PKPaymentSessionHandle *v5;
  PKContactlessInterfaceSession *v6;
  PKPaymentSessionHandle *sessionHandle;
  PKContactlessInterfaceSession *session;
  OS_dispatch_group *group;
  id relinquishOwnershipBlock;
  id v11;
  PKPaymentSessionHandle *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lifecycleState == 2)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v5 = self->_sessionHandle;
    sessionHandle = self->_sessionHandle;
    self->_sessionHandle = 0;

    v6 = self->_session;
    session = self->_session;
    self->_session = 0;

    group = self->_group;
    self->_group = 0;

    self->_lifecycleState = 2;
    relinquishOwnershipBlock = self->_relinquishOwnershipBlock;
    if (relinquishOwnershipBlock)
    {
      v4 = (void (**)(_QWORD))objc_msgSend(relinquishOwnershipBlock, "copy");
      v11 = self->_relinquishOwnershipBlock;
      self->_relinquishOwnershipBlock = 0;

    }
    else
    {
      v4 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  v12 = v5;
  if (v12)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __InvalidateSessionHandle_block_invoke;
    v17[3] = &unk_1E3E62060;
    v17[4] = &v18;
    v15 = objc_msgSend(v13, "beginBackgroundTaskWithExpirationHandler:", v17);

    v19[3] = v15;
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __InvalidateSessionHandle_block_invoke_2;
    v16[3] = &unk_1E3E62060;
    v16[4] = &v18;
    -[PKPaymentSessionHandle invalidateSessionWithCompletion:](v12, "invalidateSessionWithCompletion:", v16);
    _Block_object_dispose(&v18, 8);
  }

  InvalidateSession(v6);
  if (v4)
    v4[2](v4);

}

- (void)setSession:(id)a3
{
  id v5;
  PKPaymentSessionHandle *sessionHandle;
  OS_dispatch_group *v7;
  OS_dispatch_group *group;
  NSObject *v9;
  PKSecureElementPass *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  OS_dispatch_group *v22;
  uint8_t v23[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v5 && self->_lifecycleState != 2)
  {
    objc_storeStrong((id *)&self->_session, a3);
    sessionHandle = self->_sessionHandle;
    self->_sessionHandle = 0;

    self->_lifecycleState = 1;
    v7 = (OS_dispatch_group *)dispatch_group_create();
    group = self->_group;
    self->_group = v7;

    v9 = v7;
    dispatch_group_enter(v9);
    os_unfair_lock_unlock(&self->_lock);
    if (v9)
    {
      objc_msgSend(v5, "setDelegate:", self);
      v10 = self->_pass;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      -[PKSecureElementPass devicePaymentApplications](v10, "devicePaymentApplications");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
LABEL_7:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
          if (objc_msgSend(v16, "paymentType") == 1002)
          {
            if (objc_msgSend(v16, "supportsContactlessPayment"))
            {
              v17 = v16;
              if (v17)
                break;
            }
          }
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
            if (v13)
              goto LABEL_7;
            goto LABEL_15;
          }
        }
        v18 = v17;

        v28 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v5, "activatePaymentApplications:forPaymentPass:", v19, v10);

        if (!v20)
          goto LABEL_18;
        objc_msgSend(v5, "authorizeAndStartCardEmulationWithCredential:deferAuthorization:requiresConfirmationForHandoff:startHandoffIfPending:", 0, 0, 1, 0);
      }
      else
      {
LABEL_15:

        v18 = 0;
LABEL_18:
        PKLogFacilityTypeGetObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, "PKBackgroundContactlessInterfaceSessionController: Failed to activate", v23, 2u);
        }

      }
      dispatch_group_leave(v9);
      os_unfair_lock_lock(&self->_lock);
      v22 = self->_group;
      self->_group = 0;

      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)claimActiveSessionWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  OS_dispatch_group *v6;
  PKContactlessInterfaceSession *v7;
  PKContactlessInterfaceSession *session;
  PKPaymentSessionHandle *sessionHandle;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  PKContactlessInterfaceSession *v14;
  void (**v15)(_QWORD, _QWORD);

  v4 = a3;
  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))v4;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lifecycleState == 1)
    {
      v6 = self->_group;
      v7 = self->_session;
      session = self->_session;
      self->_session = 0;

      sessionHandle = self->_sessionHandle;
      self->_sessionHandle = 0;

      os_unfair_lock_unlock(&self->_lock);
      if (v7)
      {
        if (v6)
        {
          v10 = MEMORY[0x1E0C809B0];
          v11 = 3221225472;
          v12 = __86__PKBackgroundContactlessInterfaceSessionController_claimActiveSessionWithCompletion___block_invoke;
          v13 = &unk_1E3E618A0;
          v15 = v5;
          v7 = v7;
          v14 = v7;
          dispatch_group_notify((dispatch_group_t)v6, MEMORY[0x1E0C80D38], &v10);

        }
        else
        {
          ((void (**)(_QWORD, PKContactlessInterfaceSession *))v5)[2](v5, v7);
        }
        goto LABEL_8;
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v6 = 0;
    }
    v5[2](v5, 0);
    v7 = 0;
LABEL_8:
    -[PKBackgroundContactlessInterfaceSessionController invalidate](self, "invalidate", v10, v11, v12, v13);

    return;
  }
  __break(1u);
}

uint64_t __86__PKBackgroundContactlessInterfaceSessionController_claimActiveSessionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  PKBackgroundContactlessInterfaceSessionController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = self;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKBackgroundContactlessInterfaceSessionController (%p): ignoring transaction end....", buf, 0xCu);
  }

  if (v7)
  {
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBackgroundContactlessInterfaceSessionController _processContexts:didFinishTransaction:](self, "_processContexts:didFinishTransaction:", v9, 1);

  }
  else
  {
    -[PKBackgroundContactlessInterfaceSessionController _processContexts:didFinishTransaction:](self, "_processContexts:didFinishTransaction:", 0, 1);
  }

}

- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4
{
  -[PKBackgroundContactlessInterfaceSessionController _processContexts:didFinishTransaction:](self, "_processContexts:didFinishTransaction:", a4, 0);
}

- (void)_processContexts:(id)a3 didFinishTransaction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  PKBackgroundContactlessInterfaceSessionController *v24;
  void *v25;
  id v26;
  int v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  PKBackgroundContactlessInterfaceSessionController *v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_16:
    PKLogFacilityTypeGetObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = self;
      _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "PKBackgroundContactlessInterfaceSessionController (%p): dropping transaction.", buf, 0xCu);
    }

    goto LABEL_19;
  }
  v24 = self;
  v9 = objc_alloc_init(MEMORY[0x1E0D672B0]);
  v10 = objc_msgSend(v8, "isStoredValuePass");
  v25 = v8;
  objc_msgSend(v8, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = v6;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (!v12)
  {
    v14 = 0;
    goto LABEL_15;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v30;
  v27 = v10 | v4;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v30 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v17, "paymentApplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v17, "transitHistory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "expressState");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:", v19, v20, v18, v11, v21);

        v14 = 1;
      }
      else if (!v27)
      {
        goto LABEL_11;
      }
      objc_msgSend(v18, "applicationIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recordPaymentApplicationUsageForPassUniqueIdentifier:paymentApplicationIdentifier:", v11, v22);

LABEL_11:
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  }
  while (v13);
LABEL_15:

  v8 = v25;
  v6 = v26;
  self = v24;
  if ((v14 & 1) == 0)
    goto LABEL_16;
LABEL_19:

}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionHandle, 0);
  objc_storeStrong(&self->_relinquishOwnershipBlock, 0);
}

@end

@implementation PKBannerHandle

+ (id)createHandleForRequest:(id)a3 queue:(id)a4
{
  PKBannerHandle *v4;
  id v6;
  id v7;
  PKBannerHandle *v8;
  id v9;
  PKBannerHandle *v10;
  PKBannerHandle *v11;
  id *v12;
  dispatch_group_t v13;
  OS_dispatch_group *messageTracker;
  uint64_t v15;
  BSServiceConnectionClient *connection;
  BSServiceConnectionClient *v17;
  PKBannerHandle *v18;
  void *v19;
  uint64_t v20;
  NSArray *attributes;
  NSObject *v22;
  uint64_t v23;
  BSServiceConnectionClient *v24;
  uint64_t v25;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;
  uint8_t buf[4];
  PKBannerHandle *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  BSServiceConnectionClient *v40;
  void *v41;
  __int128 v42;
  void (*v43)(uint64_t, void *);
  void *v44;
  PKBannerHandle *v45;
  PKBannerHandle *v46;
  uint64_t v47;

  v4 = (PKBannerHandle *)a4;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [PKBannerHandle alloc];
  v9 = v7;
  v10 = (PKBannerHandle *)v6;
  v11 = v10;
  if (!v8)
  {
    v18 = 0;
    goto LABEL_16;
  }
  if (v9 && v10)
  {
    v34.receiver = v8;
    v34.super_class = (Class)PKBannerHandle;
    v12 = objc_msgSendSuper2(&v34, sel_init);
    if (!v12)
    {
      PKLogFacilityTypeGetObject(0);
      v8 = (PKBannerHandle *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_FAULT))
      {
        v27 = objc_msgSend(v9, "type");
        LODWORD(v42) = 134217984;
        *(_QWORD *)((char *)&v42 + 4) = v27;
        _os_log_fault_impl(&dword_18FC92000, &v8->super, OS_LOG_TYPE_FAULT, "PKBannerHandle: failed to create handle for %ld - no handle.", (uint8_t *)&v42, 0xCu);
      }

      if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_msgSend(v9, "type");
        LODWORD(v42) = 134217984;
        *(_QWORD *)((char *)&v42 + 4) = v25;
        _os_log_impl(&dword_18FC92000, &v8->super, OS_LOG_TYPE_DEFAULT, "PKBannerHandle: failed to create handle for %ld - no handle.", (uint8_t *)&v42, 0xCu);
      }
      goto LABEL_14;
    }
    v8 = (PKBannerHandle *)v12;
    objc_storeStrong(v12 + 1, a3);
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_queue, v4);
    v13 = dispatch_group_create();
    messageTracker = v8->_messageTracker;
    v8->_messageTracker = (OS_dispatch_group *)v13;

    objc_msgSend(MEMORY[0x1E0D03458], "endpointForSystemMachName:service:instance:", CFSTR("com.apple.PassbookUISceneService.remote-ui"), CFSTR("com.apple.wallet.banner"), 0);
    v10 = (PKBannerHandle *)objc_claimAutoreleasedReturnValue();
    v4 = v10;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v10);
      v15 = objc_claimAutoreleasedReturnValue();
      connection = v8->_connection;
      v8->_connection = (BSServiceConnectionClient *)v15;

      v17 = v8->_connection;
      if (v17)
      {
        *(_QWORD *)&v42 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v42 + 1) = 3221225472;
        v43 = __40__PKBannerHandle__initForRequest_queue___block_invoke;
        v44 = &unk_1E2AC77D0;
        v45 = v11;
        v18 = v8;
        v46 = v18;
        -[BSServiceConnectionClient configureConnection:](v17, "configureConnection:", &v42);
        objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
        v20 = objc_claimAutoreleasedReturnValue();
        attributes = v18->_attributes;
        v18->_attributes = (NSArray *)v20;

        PKLogFacilityTypeGetObject(0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = objc_msgSend(v9, "type");
          v24 = v8->_connection;
          *(_DWORD *)buf = 134218496;
          v36 = v18;
          v37 = 2048;
          v38 = v23;
          v39 = 2048;
          v40 = v24;
          _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): created handle for %ld with connection %p.", buf, 0x20u);
        }

        -[BSServiceConnectionClient activate](v8->_connection, "activate");
        v8 = v4;
        goto LABEL_15;
      }
      PKLogFacilityTypeGetObject(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        v33 = objc_msgSend(v9, "type");
        LODWORD(v42) = 134217984;
        *(_QWORD *)((char *)&v42 + 4) = v33;
        _os_log_fault_impl(&dword_18FC92000, v28, OS_LOG_TYPE_FAULT, "PKBannerHandle: failed to create handle for %ld - no connection.", (uint8_t *)&v42, 0xCu);
      }

      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v31 = objc_msgSend(v9, "type");
      LODWORD(v42) = 134217984;
      *(_QWORD *)((char *)&v42 + 4) = v31;
      v30 = "PKBannerHandle: failed to create handle for %ld - no connection.";
      goto LABEL_26;
    }
  }
  else
  {
    __break(1u);
  }
  PKLogFacilityTypeGetObject((unint64_t)v10);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    v32 = objc_msgSend(v9, "type");
    LODWORD(v42) = 134217984;
    *(_QWORD *)((char *)&v42 + 4) = v32;
    _os_log_fault_impl(&dword_18FC92000, v28, OS_LOG_TYPE_FAULT, "PKBannerHandle: failed to create handle for %ld - no endpoint.", (uint8_t *)&v42, 0xCu);
  }

  if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    goto LABEL_27;
  v29 = objc_msgSend(v9, "type");
  LODWORD(v42) = 134217984;
  *(_QWORD *)((char *)&v42 + 4) = v29;
  v30 = "PKBannerHandle: failed to create handle for %ld - no endpoint.";
LABEL_26:
  _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v42, 0xCu);
LABEL_27:

LABEL_14:
  v18 = 0;
LABEL_15:

LABEL_16:
  return v18;
}

- (PKBannerHandle)init
{

  return 0;
}

void __40__PKBannerHandle__initForRequest_queue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  v4 = PKBannerServiceInterface();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_initWeak(&location, *(id *)(a1 + 40));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__PKBannerHandle__initForRequest_queue___block_invoke_2;
  v9[3] = &unk_1E2AC77A8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __40__PKBannerHandle__initForRequest_queue___block_invoke_11;
  v7[3] = &unk_1E2AC77A8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __40__PKBannerHandle__initForRequest_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  NSObject *v5;
  int v6;
  os_unfair_lock_s *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "invalidate");
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject(4uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134218240;
      v7 = WeakRetained;
      v8 = 2048;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_INFO, "PKBannerHandle (%p): connection %p interrupted.", (uint8_t *)&v6, 0x16u);
    }

    os_unfair_lock_lock(WeakRetained + 4);
    -[PKBannerHandle _invalidateFromRemote:]((uint64_t)WeakRetained, 1);
    os_unfair_lock_unlock(WeakRetained + 4);
  }

}

- (void)_invalidateFromRemote:(uint64_t)a1
{
  uint64_t v4;
  unsigned __int8 *v5;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  const void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void (**v24)(_QWORD);
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _QWORD block[4];
  id v30;
  _QWORD aBlock[4];
  id v32;
  NSObject *v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v4 = 2 * *(unsigned __int8 *)(a1 + 52);
  if (!*(_BYTE *)(a1 + 52) && (a2 & 1) == 0)
    v4 = *(unsigned __int8 *)(a1 + 50);
  v5 = (unsigned __int8 *)(a1 + 48);
  do
  {
    if (__ldaxr(v5))
    {
      __clrex();
      goto LABEL_30;
    }
  }
  while (__stlxr(1u, v5));
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(4uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 134218240;
      v36 = a1;
      v37 = 2048;
      v38 = v8;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): starting local invalidation of connection %p.", buf, 0x16u);
    }

  }
  if (!(_BYTE)v4)
  {
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v36 = a1;
      v10 = "PKBannerHandle (%p): banner interrupted.";
      goto LABEL_22;
    }
LABEL_23:

    goto LABEL_24;
  }
  if (v4 == 1)
  {
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v36 = a1;
      v10 = "PKBannerHandle (%p): banner detached.";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (v4 == 2)
  {
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v36 = a1;
      v10 = "PKBannerHandle (%p): banner finished.";
LABEL_22:
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
LABEL_24:
  v11 = *(void **)(a1 + 72);
  if (v11)
  {
    v12 = v11;
    v13 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = 0;

    if ((a2 & 1) == 0)
    {
      if (*(_BYTE *)(a1 + 51) || !*(_BYTE *)(a1 + 50))
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v12, "remoteTargetWithLaunchingAssertionAttributes:", *(_QWORD *)(a1 + 80));
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v22 = *(id *)(a1 + 32);
          dispatch_group_enter(v22);
          objc_initWeak((id *)buf, (id)a1);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __40__PKBannerHandle__invalidateFromRemote___block_invoke;
          aBlock[3] = &unk_1E2AC7820;
          v14 = v14;
          v32 = v14;
          objc_copyWeak(&v34, (id *)buf);
          v23 = v22;
          v33 = v23;
          v24 = (void (**)(_QWORD))_Block_copy(aBlock);
          if ((PKRunningInLockScreenPlugin() & 1) != 0)
          {
            dispatch_get_global_queue(0, 0);
            v25 = objc_claimAutoreleasedReturnValue();
            dispatch_async(v25, v24);

          }
          else
          {
            v24[2](v24);
          }

          objc_destroyWeak(&v34);
          objc_destroyWeak((id *)buf);

        }
      }
      v16 = *(NSObject **)(a1 + 24);
      v15 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__PKBannerHandle__invalidateFromRemote___block_invoke_21;
      block[3] = &unk_1E2ABE120;
      v30 = v12;
      dispatch_group_notify(v15, v16, block);

    }
  }
LABEL_30:
  v17 = *(const void **)(a1 + 64);
  if (v17)
  {
    v18 = _Block_copy(v17);
    v19 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    v20 = *(NSObject **)(a1 + 24);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __40__PKBannerHandle__invalidateFromRemote___block_invoke_22;
    v26[3] = &unk_1E2AC1C68;
    v27 = v18;
    v28 = v4;
    v21 = v18;
    dispatch_async(v20, v26);

  }
}

void __40__PKBannerHandle__initForRequest_queue___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  NSObject *v5;
  int v6;
  os_unfair_lock_s *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject(4uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134218240;
      v7 = WeakRetained;
      v8 = 2048;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_INFO, "PKBannerHandle (%p): connection %p remotely invalidated.", (uint8_t *)&v6, 0x16u);
    }

    os_unfair_lock_lock(WeakRetained + 4);
    -[PKBannerHandle _invalidateFromRemote:]((uint64_t)WeakRetained, 1);
    os_unfair_lock_unlock(WeakRetained + 4);
  }

}

- (BOOL)isInvalidated
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKBannerHandle _invalidateFromRemote:]((uint64_t)self, 0);
  os_unfair_lock_unlock(p_lock);
}

void __40__PKBannerHandle__invalidateFromRemote___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__PKBannerHandle__invalidateFromRemote___block_invoke_2;
  v3[3] = &unk_1E2AC77F8;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "detachWithReply:", v3);

  objc_destroyWeak(&v5);
}

void __40__PKBannerHandle__invalidateFromRemote___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    PKLogFacilityTypeGetObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (WeakRetained)
    {
      if (v6)
      {
        v10 = 134218242;
        v11 = WeakRetained;
        v12 = 2112;
        v13 = v3;
        v7 = "PKBannerHandle (%p): failed to notify remote of local invalidation - %@.";
        v8 = v5;
        v9 = 22;
LABEL_7:
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
      }
    }
    else if (v6)
    {
      v10 = 138412290;
      v11 = v3;
      v7 = "PKBannerHandle (?): failed to notify remote of local invalidation - %@.";
      v8 = v5;
      v9 = 12;
      goto LABEL_7;
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __40__PKBannerHandle__invalidateFromRemote___block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(4uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKBannerHandle: connection %p locally invalidated.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __40__PKBannerHandle__invalidateFromRemote___block_invoke_22(uint64_t a1)
{
  uint64_t v1;
  PKBannerHandleResponse *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = +[PKBannerHandleResponse createWithResult:]((uint64_t)PKBannerHandleResponse, *(_QWORD *)(a1 + 40));
  (*(void (**)(uint64_t, PKBannerHandleResponse *))(v1 + 16))(v1, v2);

}

- (void)displayWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id completion;
  PKBannerHandleState *v8;
  OS_dispatch_group *v9;
  OS_dispatch_group *initialStateUpdateTracker;
  PKBannerHandleState *v11;
  OS_dispatch_group *v12;
  _QWORD v13[5];
  PKBannerHandleState *v14;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_started)
    __break(1u);
  PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): starting...", (uint8_t *)&buf, 0xCu);
  }

  self->_started = 1;
  v6 = _Block_copy(v4);
  completion = self->_completion;
  self->_completion = v6;

  v8 = self->_state;
  v9 = (OS_dispatch_group *)dispatch_group_create();
  initialStateUpdateTracker = self->_initialStateUpdateTracker;
  self->_initialStateUpdateTracker = v9;

  dispatch_group_enter((dispatch_group_t)self->_initialStateUpdateTracker);
  os_unfair_lock_unlock(&self->_lock);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x2020000000;
  v18 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__PKBannerHandle_displayWithCompletion___block_invoke;
  v13[3] = &unk_1E2AC78C0;
  v13[4] = self;
  v11 = v8;
  v14 = v11;
  p_buf = &buf;
  -[PKBannerHandle _accessTrackedRemoteTargetWithHandler:]((uint64_t)self, v13);
  os_unfair_lock_lock(&self->_lock);
  dispatch_group_leave((dispatch_group_t)self->_initialStateUpdateTracker);
  v12 = self->_initialStateUpdateTracker;
  self->_initialStateUpdateTracker = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    -[PKBannerHandle invalidate](self, "invalidate");

  _Block_object_dispose(&buf, 8);
}

void __40__PKBannerHandle_displayWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t (**v12)(_QWORD);
  NSObject *v13;
  _QWORD block[4];
  uint64_t (**v15)(_QWORD);
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v5 = a2;
  v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __40__PKBannerHandle_displayWithCompletion___block_invoke_2;
  v21[3] = &unk_1E2AC7848;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v5, "configureForRequest:withState:didStartReply:", v8, v7, v21);
  aBlock[0] = v9;
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PKBannerHandle_displayWithCompletion___block_invoke_24;
  aBlock[3] = &unk_1E2AC7898;
  v10 = v5;
  v18 = v10;
  objc_copyWeak(&v20, &location);
  v11 = v6;
  v19 = v11;
  v12 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  if ((PKRunningInLockScreenPlugin() & 1) != 0)
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __40__PKBannerHandle_displayWithCompletion___block_invoke_27;
    block[3] = &unk_1E2AC33F8;
    v15 = v12;
    objc_copyWeak(&v16, &location);
    dispatch_async(v13, block);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_destroyWeak(&v16);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12[2](v12);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __40__PKBannerHandle_displayWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v6 = 134218242;
      v7 = WeakRetained;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): detached before start or failed to configure - %@.", (uint8_t *)&v6, 0x16u);

    }
  }

}

uint64_t __40__PKBannerHandle_displayWithCompletion___block_invoke_24(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __40__PKBannerHandle_displayWithCompletion___block_invoke_2_25;
  v5[3] = &unk_1E2AC7870;
  v7 = &v9;
  v5[1] = 3221225472;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "displayWithReply:", v5);
  v3 = *((unsigned __int8 *)v10 + 24);

  objc_destroyWeak(&v8);
  _Block_object_dispose(&v9, 8);
  return v3;
}

void __40__PKBannerHandle_displayWithCompletion___block_invoke_2_25(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  os_unfair_lock_s *v9;
  __int16 v10;
  os_unfair_lock_s *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == 0;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (!WeakRetained)
      goto LABEL_9;
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = 134218242;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): failed to start - %@.", (uint8_t *)&v8, 0x16u);
    }

LABEL_8:
    os_unfair_lock_lock(v5 + 4);
    BYTE2(v5[12]._os_unfair_lock_opaque) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    os_unfair_lock_unlock(v5 + 4);
    goto LABEL_9;
  }
  if (v7)
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (?): failed to start - %@.", (uint8_t *)&v8, 0xCu);
  }

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __40__PKBannerHandle_displayWithCompletion___block_invoke_27(uint64_t a1)
{
  id WeakRetained;

  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "invalidate");

  }
}

- (void)_accessTrackedRemoteTargetWithHandler:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  os_unfair_lock_s *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  PKDeallocationGuard *v11;
  void (*v12)(_QWORD *, void *, _QWORD *);
  NSObject *v13;
  PKDeallocationGuard *v14;
  NSObject *v15;
  const char *v16;
  _QWORD v17[4];
  PKDeallocationGuard *v18;
  NSObject *v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
      __break(1u);
    v5 = (void *)MEMORY[0x19400CFE8]();
    v6 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v7 = *(void **)(a1 + 72);
    if (v7)
    {
      objc_msgSend(v7, "remoteTargetWithLaunchingAssertionAttributes:", *(_QWORD *)(a1 + 80));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = *(id *)(a1 + 32);
        dispatch_group_enter(v10);
        os_unfair_lock_unlock(v6);
        v11 = -[PKDeallocationGuard initWithBlock:]([PKDeallocationGuard alloc], "initWithBlock:", &__block_literal_global_50);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __56__PKBannerHandle__accessTrackedRemoteTargetWithHandler___block_invoke_2;
        v17[3] = &unk_1E2ABE0D0;
        v18 = v11;
        v19 = v10;
        v12 = (void (*)(_QWORD *, void *, _QWORD *))v4[2];
        v13 = v10;
        v14 = v11;
        v12(v4, v9, v17);

LABEL_12:
        objc_autoreleasePoolPop(v5);
        goto LABEL_13;
      }
      PKLogFacilityTypeGetObject(4uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v21 = a1;
        v16 = "PKBannerHandle (%p): attempting to message inactive connection.";
        goto LABEL_10;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(4uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v21 = a1;
        v16 = "PKBannerHandle (%p): attempting to message invalidated connection.";
LABEL_10:
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    goto LABEL_12;
  }
LABEL_13:

}

- (PKBannerHandleState)state
{
  os_unfair_lock_s *p_lock;
  PKBannerHandleState *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_state;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setState:(id)a3
{
  uint64_t v5;
  _BOOL4 started;
  OS_dispatch_group *v7;
  id v8;
  _QWORD v9[4];
  OS_dispatch_group *v10;
  PKBannerHandle *v11;
  id v12;

  v8 = a3;
  if (v8 && (v5 = objc_msgSend(v8, "type"), v5 != -[PKBannerHandleRequest type](self->_request, "type")))
  {
    __break(1u);
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_state, a3);
    started = self->_started;
    v7 = self->_initialStateUpdateTracker;
    os_unfair_lock_unlock(&self->_lock);
    if (started)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __27__PKBannerHandle_setState___block_invoke;
      v9[3] = &unk_1E2AC78E8;
      v10 = v7;
      v11 = self;
      v12 = v8;
      -[PKBannerHandle _accessTrackedRemoteTargetWithHandler:]((uint64_t)self, v9);

    }
  }
}

void __27__PKBannerHandle_setState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(NSObject **)(a1 + 32);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__PKBannerHandle_setState___block_invoke_2;
    block[3] = &unk_1E2ABE030;
    v10 = &v15;
    v15 = v5;
    v16 = *(id *)(a1 + 48);
    v17 = v7;
    dispatch_group_notify(v8, v9, block);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __27__PKBannerHandle_setState___block_invoke_4;
    v12[3] = &unk_1E2ABD9C8;
    v10 = &v13;
    v13 = v6;
    objc_msgSend(v5, "updateState:withReply:", v11, v12);
  }

}

void __27__PKBannerHandle_setState___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__PKBannerHandle_setState___block_invoke_3;
  v3[3] = &unk_1E2ABD9C8;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "updateState:withReply:", v2, v3);

}

uint64_t __27__PKBannerHandle_setState___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __27__PKBannerHandle_setState___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__PKBannerHandle__accessTrackedRemoteTargetWithHandler___block_invoke_2(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "invalidate"))
    __break(1u);
  else
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)detachWithFinished:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  int v9;
  PKBannerHandle *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  PKLogFacilityTypeGetObject(4uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = self;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKBannerHandle (%p): received remote detach.", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_detached = 1;
  self->_finished = objc_msgSend(v6, "BOOLValue");
  os_unfair_lock_unlock(&self->_lock);
  v7[2](v7, 0);
  -[PKBannerHandle invalidate](self, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_initialStateUpdateTracker, 0);
  objc_storeStrong((id *)&self->_messageTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end

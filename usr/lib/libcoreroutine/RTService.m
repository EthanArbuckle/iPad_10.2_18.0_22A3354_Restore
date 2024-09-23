@implementation RTService

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (void)shutdownWithHandler:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__140;
  v20[4] = __Block_byref_object_dispose__140;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v21 = (id)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__RTService_shutdownWithHandler___block_invoke;
  block[3] = &unk_1E9297CA8;
  v18 = v5;
  v19 = v20;
  block[4] = self;
  v13 = v5;
  dispatch_async(v12, block);

  _Block_object_dispose(v20, 8);
}

void __33__RTService_shutdownWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "setIsShuttingDown:", 1);
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__RTService_shutdownWithHandler___block_invoke_2;
  v5[3] = &unk_1E92A3FA0;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "_shutdownWithHandler:", v5);

}

void __33__RTService_shutdownWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__RTService_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __18__RTService_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_shutdownWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)checkInWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__RTService_checkInWithHandler___block_invoke;
  block[3] = &unk_1E9297178;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __32__RTService_checkInWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_isShuttingDown = a3;
}

@end

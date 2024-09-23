@implementation RTXPCListener

- (void)logClients
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[RTXPCListener connectedClients](self, "connectedClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    -[RTXPCListener machServiceName](self, "machServiceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "%lu clients connected to service, %@", (uint8_t *)&v13, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[RTXPCListener connectedClients](self, "connectedClients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_6);

  }
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[RTXPCListener disconnectedClients](self, "disconnectedClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    -[RTXPCListener machServiceName](self, "machServiceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%lu clients not connected to service, %@", (uint8_t *)&v13, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[RTXPCListener disconnectedClients](self, "disconnectedClients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_5);

  }
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (NSMutableArray)connectedClients
{
  return self->_connectedClients;
}

- (NSMutableArray)disconnectedClients
{
  return self->_disconnectedClients;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTXPCListener)initWithMachServiceName:(id)a3
{
  id v4;
  RTXPCListener *v5;
  uint64_t v6;
  NSString *machServiceName;
  RTXPCListener *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  RTXPCListener *v12;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  NSMutableArray *connectedClients;
  uint64_t v18;
  NSMutableArray *disconnectedClients;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)RTXPCListener;
    v5 = -[RTXPCListener initWithMachServiceName:](&v21, sel_initWithMachServiceName_, v4);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      machServiceName = v5->_machServiceName;
      v5->_machServiceName = (NSString *)v6;

      v8 = v5;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (const char *)-[RTXPCListener UTF8String](objc_retainAutorelease(v8), "UTF8String");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v8);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = (const char *)objc_msgSend(v13, "UTF8String");

      }
      v14 = dispatch_queue_create(v10, v9);

      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v14;

      v16 = objc_opt_new();
      connectedClients = v8->_connectedClients;
      v8->_connectedClients = (NSMutableArray *)v16;

      v18 = objc_opt_new();
      disconnectedClients = v8->_disconnectedClients;
      v8->_disconnectedClients = (NSMutableArray *)v18;

    }
    self = v5;
    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[RTXPCListener initWithMachServiceName:]";
      v24 = 1024;
      v25 = 29;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: serviceName (in %s:%d)", buf, 0x12u);
    }

    v12 = 0;
  }

  return v12;
}

- (void)_setup
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v5;

  -[RTXPCListener logClients](self, "logClients");
  -[RTXPCListener queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTXPCListener _setQueue:](self, "_setQueue:", v3);

  -[RTXPCListener setDelegate:](self, "setDelegate:", self);
  -[RTXPCListener resume](self, "resume");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  -[RTXPCListener machServiceName](self, "machServiceName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, 0, 0, 1u);

}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTXPCListener queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__RTXPCListener_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __22__RTXPCListener_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
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
  v20[3] = __Block_byref_object_copy__8;
  v20[4] = __Block_byref_object_dispose__8;
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
  -[RTXPCListener queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__RTXPCListener_shutdownWithHandler___block_invoke;
  block[3] = &unk_1E9297CA8;
  v18 = v5;
  v19 = v20;
  block[4] = self;
  v13 = v5;
  dispatch_async(v12, block);

  _Block_object_dispose(v20, 8);
}

uint64_t __37__RTXPCListener_shutdownWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __27__RTXPCListener_logClients__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%lu: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __27__RTXPCListener_logClients__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%lu: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 0;
}

- (void)checkInWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[RTXPCListener queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__RTXPCListener_checkInWithHandler___block_invoke;
  block[3] = &unk_1E9297178;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __36__RTXPCListener_checkInWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnectedClients, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end

@implementation PXNetworkStatusMonitor

uint64_t __30__PXNetworkStatusMonitor_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handlePathUpdate:", a2);
}

+ (PXNetworkStatusMonitor)sharedInstance
{
  if (sharedInstance_onceToken_281613 != -1)
    dispatch_once(&sharedInstance_onceToken_281613, &__block_literal_global_281614);
  return (PXNetworkStatusMonitor *)(id)sharedInstance_sharedInstance_281615;
}

void __40__PXNetworkStatusMonitor_sharedInstance__block_invoke()
{
  PXNetworkStatusMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(PXNetworkStatusMonitor);
  v1 = (void *)sharedInstance_sharedInstance_281615;
  sharedInstance_sharedInstance_281615 = (uint64_t)v0;

}

- (PXNetworkStatusMonitor)init
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  NSMapTable *v6;
  NSMapTable *queue_observers;
  OS_nw_path_monitor *v8;
  OS_nw_path_monitor *defaultPathMonitor;
  PXNetworkStatusMonitor *v10;
  NSObject *v11;
  NSObject *p_super;
  uint8_t v14[8];
  _QWORD update_handler[4];
  PXNetworkStatusMonitor *v16;

  if (self)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.PXNetworkStatusMonitor", v3);
    queue = self->_queue;
    self->_queue = v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    queue_observers = self->_queue_observers;
    self->_queue_observers = v6;

    v8 = (OS_nw_path_monitor *)nw_path_monitor_create();
    defaultPathMonitor = self->_defaultPathMonitor;
    self->_defaultPathMonitor = v8;

    if (self->_defaultPathMonitor)
    {
      v10 = self;
      v11 = self->_defaultPathMonitor;
      update_handler[0] = MEMORY[0x1E0C809B0];
      update_handler[1] = 3221225472;
      update_handler[2] = __30__PXNetworkStatusMonitor_init__block_invoke;
      update_handler[3] = &unk_1E5144B08;
      v16 = v10;
      nw_path_monitor_set_update_handler(v11, update_handler);
      nw_path_monitor_set_queue((nw_path_monitor_t)self->_defaultPathMonitor, (dispatch_queue_t)self->_queue);
      nw_path_monitor_start((nw_path_monitor_t)self->_defaultPathMonitor);
      dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_20_281607);
      p_super = &v16->super;
    }
    else
    {
      PLUIGetLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A6789000, p_super, OS_LOG_TYPE_ERROR, "nw_path_monitor_create() failed", v14, 2u);
      }
    }

  }
  return self;
}

- (void)_queue_handlePathUpdate:(id)a3
{
  NSObject *v4;
  nw_path_status_t status;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  _BOOL8 is_constrained;
  _BOOL4 is_expensive;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  status = nw_path_get_status(v4);
  if (nw_path_uses_interface_type(v4, nw_interface_type_wired))
  {
    v6 = 4;
  }
  else if (nw_path_uses_interface_type(v4, nw_interface_type_wifi))
  {
    v6 = 2;
  }
  else if (nw_path_uses_interface_type(v4, nw_interface_type_cellular))
  {
    v6 = 3;
  }
  else if (nw_path_uses_interface_type(v4, nw_interface_type_other))
  {
    v6 = 5;
  }
  else
  {
    v6 = 1;
  }
  v7 = CFSTR("invalid");
  v8 = CFSTR(" reason:notAvailable");
  v9 = CFSTR("unsatisfied");
  switch(status)
  {
    case nw_path_status_invalid:
      goto LABEL_14;
    case nw_path_status_satisfied:
      v7 = CFSTR("satisfied");
      goto LABEL_14;
    case nw_path_status_unsatisfied:
      break;
    case nw_path_status_satisfiable:
      v7 = CFSTR("satisfiable");
LABEL_14:
      v8 = &stru_1E5149688;
      v9 = v7;
      break;
    default:
      v9 = 0;
      v8 = &stru_1E5149688;
      break;
  }
  is_constrained = nw_path_is_constrained(v4);
  is_expensive = nw_path_is_expensive(v4);
  v12 = 256;
  if (!is_expensive)
    v12 = 0;
  v13 = v12 | is_constrained;
  PLUIGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    PXNetworkDetailsDescription(v6, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v15;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "PXNetworkStatusMonitor %@ status:%@%@", (uint8_t *)&v17, 0x20u);

  }
  if ((status & 0xFFFFFFFD) == 1)
    v16 = v6;
  else
    v16 = 1;
  self->queue_bestAvailableNetworkType.type = v16;
  *(_QWORD *)&self->queue_bestAvailableNetworkType.isConstrained = v13;
  -[PXNetworkStatusMonitor _queue_notifyObserversOfBestAvailableNetworkType:](self, "_queue_notifyObserversOfBestAvailableNetworkType:");

}

- (void)_queue_notifyObserversOfBestAvailableNetworkType:(id)a3
{
  uint64_t v3;
  unint64_t var0;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[8];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMapTable keyEnumerator](self->_queue_observers, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if (v11)
        {
          -[NSMapTable objectForKey:](self->_queue_observers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v14[0] = MEMORY[0x1E0C809B0];
            v14[1] = 3221225472;
            v14[2] = __75__PXNetworkStatusMonitor__queue_notifyObserversOfBestAvailableNetworkType___block_invoke;
            v14[3] = &unk_1E5144B50;
            v14[4] = v11;
            v14[5] = self;
            v14[6] = var0;
            v14[7] = v3;
            dispatch_async(v12, v14);
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- ($CE86B1AE65D1A4A4B278E4ED99C18EFC)bestAvailableNetworkType
{
  NSObject *queue;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL8 v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  $CE86B1AE65D1A4A4B278E4ED99C18EFC result;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_1A7E74EE7;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PXNetworkStatusMonitor_bestAvailableNetworkType__block_invoke;
  v7[3] = &unk_1E5148AA8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.var1 = v6;
  result.var2 = BYTE1(v6);
  result.var0 = v5;
  return result;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PXNetworkStatusMonitor_registerObserver_queue___block_invoke;
  block[3] = &unk_1E51457C8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaultPathMonitor, 0);
}

uint64_t __49__PXNetworkStatusMonitor_registerObserver_queue___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", a1[5], a1[6]);
}

uint64_t __75__PXNetworkStatusMonitor__queue_notifyObserversOfBestAvailableNetworkType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkStatusMonitor:didChangeBestAvailableNetworkType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

__n128 __50__PXNetworkStatusMonitor_bestAvailableNetworkType__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 32);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

@end

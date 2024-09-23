@implementation RTNotifier

void __42__RTNotifier_postNotification_toObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "observer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == *(void **)(a1 + 32))
  {
    objc_msgSend(v6, "performSelector:withObject:", objc_msgSend(v7, "selector"), *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }

}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  RTNotifier *v16;
  id v17;
  SEL v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTNotifier addObserver:selector:name:]";
      v21 = 1024;
      v22 = 79;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__RTNotifier_addObserver_selector_name___block_invoke;
  v14[3] = &unk_1E9298238;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = a4;
  v12 = v9;
  v13 = v8;
  dispatch_sync(v11, v14);

}

- (void)postNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTNotifier postNotification:]";
      v16 = 1024;
      v17 = 173;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTNotifier postNotification:]";
      v16 = 1024;
      v17 = 174;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "nil notification name (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier observersMap](self, "observersMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __31__RTNotifier_postNotification___block_invoke;
  v12[3] = &unk_1E929C1E8;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

}

- (unint64_t)getNumberOfObservers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[RTNotifier observersMap](self, "observersMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (NSMutableDictionary)observersMap
{
  return self->_observersMap;
}

void __31__RTNotifier_postNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "observer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selector");

  objc_msgSend(v5, "performSelector:withObject:", v4, *(_QWORD *)(a1 + 32));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __40__RTNotifier_addObserver_selector_name___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "observer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 == (void *)a1[4])
  {
    v8 = objc_msgSend(v10, "selector");
    v9 = a1[6];

    if (v8 == v9)
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (RTNotifier)init
{
  RTNotifier *v2;
  NSObject *v3;
  const char *v4;
  id v5;
  dispatch_queue_t v6;
  RTNotifier *v7;

  v2 = self;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (const char *)-[RTNotifier UTF8String](objc_retainAutorelease(v2), "UTF8String");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v2);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v5, "UTF8String");

  }
  v6 = dispatch_queue_create(v4, v3);

  v7 = -[RTNotifier initWithQueue:](v2, "initWithQueue:", v6);
  return v7;
}

- (RTNotifier)initWithQueue:(id)a3
{
  id v5;
  NSObject *v6;
  RTNotifier *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *observersMap;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTNotifier initWithQueue:]";
      v14 = 1024;
      v15 = 66;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)RTNotifier;
  v7 = -[RTNotifier init](&v11, sel_init);
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersMap = v7->_observersMap;
    v7->_observersMap = v8;

    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

void __40__RTNotifier_addObserver_selector_name___block_invoke(uint64_t a1)
{
  RTObserverRecord *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE buf[24];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = -[RTObserverRecord initWithObserver:selector:]([RTObserverRecord alloc], "initWithObserver:selector:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "observersMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v22) = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__RTNotifier_addObserver_selector_name___block_invoke_2;
    v17[3] = &unk_1E929C170;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 56);
    v19 = buf;
    v20 = v6;
    v18 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v17);
    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      objc_msgSend(v4, "addObject:", v2);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "observersMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v2, 0);
    objc_msgSend(v7, "setObject:forKey:", v8, *(_QWORD *)(a1 + 48));

  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = objc_msgSend(*(id *)(a1 + 40), "getNumberOfObservers:", v15);
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2048;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    v25 = 2048;
    v26 = v16;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, add observer, %@(%p), notification, %@, numberOfObservers, %ld", buf, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 40), "internalAddObserver:name:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)postNotification:(id)a3 toObserver:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTNotifier postNotification:toObserver:]";
      v21 = 1024;
      v22 = 189;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTNotifier postNotification:toObserver:]";
      v21 = 1024;
      v22 = 190;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "nil notification name (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier observersMap](self, "observersMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__RTNotifier_postNotification_toObserver___block_invoke;
  v16[3] = &unk_1E929C210;
  v17 = v7;
  v18 = v6;
  v14 = v6;
  v15 = v7;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

}

- (RTNotifier)initWithName:(id)a3
{
  id v4;
  NSObject *v5;
  RTNotifier *v6;
  NSObject *v7;
  const char *v8;
  id v9;
  dispatch_queue_t v10;
  RTNotifier *v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTNotifier initWithName:]";
      v15 = 1024;
      v16 = 58;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name (in %s:%d)", buf, 0x12u);
    }

  }
  v6 = self;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (const char *)-[RTNotifier UTF8String](objc_retainAutorelease(v6), "UTF8String");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v6);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v9, "UTF8String");

  }
  v10 = dispatch_queue_create(v8, v7);

  v11 = -[RTNotifier initWithQueue:](v6, "initWithQueue:", v10);
  return v11;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTNotifier removeObserver:]";
      v12 = 1024;
      v13 = 119;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationObserver (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__RTNotifier_removeObserver___block_invoke;
  v8[3] = &unk_1E9297540;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __29__RTNotifier_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "observersMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__RTNotifier_removeObserver___block_invoke_2;
  v5[3] = &unk_1E929C198;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __29__RTNotifier_removeObserver___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  v9 = objc_msgSend(v8, "count");
  if (v9 - 1 >= 0)
  {
    v10 = v9;
    v20 = v8;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", --v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "observer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(void **)(a1 + 32) == v12)
      {
        objc_msgSend(v8, "removeObjectAtIndex:", v10);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(a1 + 32);
          v19 = objc_msgSend(*(id *)(a1 + 40), "getNumberOfObservers:", v7);
          *(_DWORD *)buf = 138413314;
          v22 = v15;
          v23 = 2112;
          v24 = v17;
          v25 = 2048;
          v26 = v18;
          v27 = 2112;
          v28 = v7;
          v29 = 2048;
          v30 = v19;
          _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, remove observer, %@(%p), notification, %@, numberOfObservers, %ld", buf, 0x34u);

          v8 = v20;
        }

        objc_msgSend(*(id *)(a1 + 40), "internalRemoveObserver:name:", v12, v7);
      }

    }
    while (v10 > 0);
  }

}

- (void)removeObserver:(id)a3 fromNotification:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTNotifier removeObserver:fromNotification:]";
    v19 = 1024;
    v20 = 148;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationObserver (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTNotifier removeObserver:fromNotification:]";
      v19 = 1024;
      v20 = 149;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__RTNotifier_removeObserver_fromNotification___block_invoke;
  block[3] = &unk_1E9299D78;
  block[4] = self;
  v15 = v8;
  v16 = v6;
  v12 = v6;
  v13 = v8;
  dispatch_sync(v11, block);

}

void __46__RTNotifier_removeObserver_fromNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  objc_class *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, _BYTE *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__52;
  v22 = __Block_byref_object_dispose__52;
  objc_msgSend(*(id *)(a1 + 32), "observersMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v23 = (id)objc_claimAutoreleasedReturnValue();

  v3 = (void *)v19[5];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __46__RTNotifier_removeObserver_fromNotification___block_invoke_25;
  v15 = &unk_1E929C1C0;
  v16 = *(id *)(a1 + 48);
  v17 = &v18;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v12);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = objc_msgSend(*(id *)(a1 + 32), "getNumberOfObservers:", v9, v12, v13, v14, v15);
    *(_DWORD *)buf = 138413314;
    v25 = v6;
    v26 = 2112;
    v27 = v8;
    v28 = 2048;
    v29 = v10;
    v30 = 2112;
    v31 = v9;
    v32 = 2048;
    v33 = v11;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, remove observer, %@(%p), notification, %@, numberOfObservers, %ld", buf, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 32), "internalRemoveObserver:name:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  _Block_object_dispose(&v18, 8);
}

void __46__RTNotifier_removeObserver_fromNotification___block_invoke_25(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObjectAtIndex:", a3);
    *a4 = 1;
  }
}

- (void)removeAllObservers
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__RTNotifier_removeAllObservers__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __32__RTNotifier_removeAllObservers__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "observersMap");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (BOOL)observer:(id)a3 observingNotificationName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  _BYTE *v17;
  _BYTE buf[24];
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTNotifier observer:observingNotificationName:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 226;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer (in %s:%d)", buf, 0x12u);
    }

    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTNotifier observer:observingNotificationName:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 227;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName (in %s:%d)", buf, 0x12u);
    }

LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v19 = 0;
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__RTNotifier_observer_observingNotificationName___block_invoke;
  v14[3] = &unk_1E929C238;
  v14[4] = self;
  v15 = v8;
  v16 = v6;
  v17 = buf;
  dispatch_sync(v9, v14);

  v10 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
LABEL_11:

  return v10;
}

void __49__RTNotifier_observer_observingNotificationName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "observersMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v3 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 48);
      objc_msgSend(v4, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
        break;

      if (++v3 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_7;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

  }
LABEL_7:

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setObserversMap:(id)a3
{
  objc_storeStrong((id *)&self->_observersMap, a3);
}

@end

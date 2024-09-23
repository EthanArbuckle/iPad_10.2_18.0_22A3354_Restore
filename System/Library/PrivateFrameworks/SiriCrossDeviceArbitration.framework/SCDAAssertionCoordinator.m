@implementation SCDAAssertionCoordinator

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7.receiver = self;
  v7.super_class = (Class)SCDAAssertionCoordinator;
  -[SCDAAssertionCoordinator description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {identifier = %@, numberOfAssertions = %llu/%llu}"), v4, self->_identifier, -[SCDAAssertionCoordinator numberOfActiveAssertions](self, "numberOfActiveAssertions"), -[SCDAAssertionCoordinator numberOfPendingAndActiveAssertions](self, "numberOfPendingAndActiveAssertions"));

  return (NSString *)v5;
}

- (SCDAAssertionCoordinator)initWithIdentifier:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCDAAssertionCoordinator *v11;
  uint64_t v12;
  NSString *identifier;
  NSMutableDictionary *v14;
  NSMutableDictionary *assertionsByUUID;
  NSMutableSet *v16;
  NSMutableSet *activeAssertionUUIDs;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  SCDAAssertionCoordinator *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SCDAAssertionCoordinator;
  v11 = -[SCDAAssertionCoordinator init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_queue, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assertionsByUUID = v11->_assertionsByUUID;
    v11->_assertionsByUUID = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activeAssertionUUIDs = v11->_activeAssertionUUIDs;
    v11->_activeAssertionUUIDs = v16;

    v18 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SCDAAssertionCoordinator initWithIdentifier:queue:delegate:]";
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_246211000, v18, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  SCDAAssertionCoordinator *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SCDAAssertionCoordinator dealloc]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  -[SCDAAssertionCoordinator _invalidate](self, "_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SCDAAssertionCoordinator;
  -[SCDAAssertionCoordinator dealloc](&v4, sel_dealloc);
}

- (id)acquireRelinquishableAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int64_t *p_numberOfAssertions;
  unint64_t v10;
  _SCDAAssertionImpl *v11;
  id v12;
  uint64_t v13;
  id v14;
  _SCDAAssertionImpl *v15;
  NSObject *queue;
  _SCDAAssertionImpl *v17;
  _SCDAAssertionProxy *v18;
  _SCDAAssertionProxy *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  SCDAAssertionCoordinator *v25;
  _SCDAAssertionImpl *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[SCDAAssertionCoordinator acquireRelinquishableAssertionWithContext:relinquishmentHandler:]";
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_246211000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  p_numberOfAssertions = &self->_numberOfAssertions;
  do
    v10 = __ldaxr((unint64_t *)p_numberOfAssertions);
  while (__stlxr(v10 + 1, (unint64_t *)p_numberOfAssertions));
  v11 = [_SCDAAssertionImpl alloc];
  v12 = objc_alloc_init(MEMORY[0x24BDD1880]);
  v13 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __92__SCDAAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke;
  v27[3] = &unk_251749F30;
  v27[4] = self;
  v28 = v7;
  v14 = v7;
  v15 = -[_SCDAAssertionImpl initWithUUID:context:relinquishmentHandler:](v11, "initWithUUID:context:relinquishmentHandler:", v12, v6, v27);

  queue = self->_queue;
  v21 = v13;
  v22 = 3221225472;
  v23 = __92__SCDAAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke_2;
  v24 = &unk_25174A620;
  v25 = self;
  v26 = v15;
  v17 = v15;
  dispatch_async(queue, &v21);
  v18 = [_SCDAAssertionProxy alloc];
  v19 = -[_SCDAAssertionProxy initWithImpl:coordinator:](v18, "initWithImpl:coordinator:", v17, self, v21, v22, v23, v24, v25);

  return v19;
}

- (void)relinquishAssertionWithUUID:(id)a3 context:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    SCDAAssertionRelinquishmentOptionsGetNames(a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v21 = "-[SCDAAssertionCoordinator relinquishAssertionWithUUID:context:options:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_246211000, v11, OS_LOG_TYPE_INFO, "%s assertionUUID = %@, context = %@, options = %@", buf, 0x2Au);

  }
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __72__SCDAAssertionCoordinator_relinquishAssertionWithUUID_context_options___block_invoke;
  v16[3] = &unk_251749F58;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a5;
  v14 = v9;
  v15 = v8;
  dispatch_async(queue, v16);

}

- (void)relinquishAssertionWithUUID:(id)a3 error:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    SCDAAssertionRelinquishmentOptionsGetNames(a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v21 = "-[SCDAAssertionCoordinator relinquishAssertionWithUUID:error:options:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_246211000, v11, OS_LOG_TYPE_INFO, "%s assertionUUID = %@, error = %@, options = %@", buf, 0x2Au);

  }
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __70__SCDAAssertionCoordinator_relinquishAssertionWithUUID_error_options___block_invoke;
  v16[3] = &unk_251749F58;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a5;
  v14 = v9;
  v15 = v8;
  dispatch_async(queue, v16);

}

- (void)relinquishAsertionsPassingTest:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[SCDAAssertionCoordinator relinquishAsertionsPassingTest:context:]";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_246211000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke;
    block[3] = &unk_25174ACF0;
    block[4] = self;
    v12 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
}

- (void)relinquishAsertionsPassingTest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[SCDAAssertionCoordinator relinquishAsertionsPassingTest:error:]";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_246211000, v8, OS_LOG_TYPE_INFO, "%s error = %@", buf, 0x16u);
  }
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke;
    block[3] = &unk_25174ACF0;
    block[4] = self;
    v12 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
}

- (unint64_t)numberOfPendingAndActiveAssertions
{
  unint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = atomic_load((unint64_t *)&self->_numberOfAssertions);
  if ((v2 & 0x8000000000000000) != 0)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[SCDAAssertionCoordinator numberOfPendingAndActiveAssertions]";
      v7 = 2048;
      v8 = v2;
      _os_log_error_impl(&dword_246211000, v3, OS_LOG_TYPE_ERROR, "%s numberOfPendingAndActiveAssertions is %lld", (uint8_t *)&v5, 0x16u);
    }
    return 0;
  }
  return v2;
}

- (void)getPendingAndActiveAssertionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __72__SCDAAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke;
    v7[3] = &unk_25174ACA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (unint64_t)numberOfActiveAssertions
{
  unint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = atomic_load((unint64_t *)&self->_numberOfActiveAssertions);
  if ((v2 & 0x8000000000000000) != 0)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[SCDAAssertionCoordinator numberOfActiveAssertions]";
      v7 = 2048;
      v8 = v2;
      _os_log_error_impl(&dword_246211000, v3, OS_LOG_TYPE_ERROR, "%s numberOfActiveAssertions is %lld", (uint8_t *)&v5, 0x16u);
    }
    return 0;
  }
  return v2;
}

- (void)getActiveAssertionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__SCDAAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke;
    v7[3] = &unk_25174ACA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)barrier:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__SCDAAssertionCoordinator_barrier___block_invoke;
    block[3] = &unk_25174AAD0;
    v8 = v4;
    dispatch_async(queue, block);

  }
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  SCDAAssertionCoordinator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SCDAAssertionCoordinator invalidate]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SCDAAssertionCoordinator_invalidate__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_addAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL8 v19;
  id WeakRetained;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  _BYTE *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id location;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  dispatch_source_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SCDAAssertionCoordinator _addAssertion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_debug_impl(&dword_246211000, v5, OS_LOG_TYPE_DEBUG, "%s assertion = %@", buf, 0x16u);
    if (!v4)
      goto LABEL_22;
LABEL_3:
    objc_msgSend(v4, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "effectiveDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "expirationDuration");
    v10 = v9;

    if (v10 >= 0.0)
    {
      objc_msgSend(v7, "timeIntervalSinceNow");
      v13 = v12;
      if (v12 >= 0.0 || v10 <= 0.0 || (v14 = v10 + v12, v14 >= 0.0))
      {
        objc_msgSend(v4, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[NSMutableDictionary count](self->_assertionsByUUID, "count");
        -[NSMutableDictionary setObject:forKey:](self->_assertionsByUUID, "setObject:forKey:", v4, v15);
        v17 = -[NSMutableDictionary count](self->_assertionsByUUID, "count");
        v18 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[SCDAAssertionCoordinator _addAssertion:]";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2048;
          v40 = (uint64_t (*)(uint64_t, uint64_t))v17;
          _os_log_debug_impl(&dword_246211000, v18, OS_LOG_TYPE_DEBUG, "%s numberOfAssertions: %llu -> %llu", buf, 0x20u);
        }
        v19 = v16 == 0;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "assertionCoordinator:didAddAssertion:isFirstAssertion:", self, v4, v19);

        objc_initWeak(&location, self);
        v21 = MEMORY[0x24BDAC760];
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __42__SCDAAssertionCoordinator__addAssertion___block_invoke;
        v34[3] = &unk_251749FF8;
        objc_copyWeak(&v37, &location);
        v22 = v4;
        v35 = v22;
        v23 = v15;
        v36 = v23;
        v24 = MEMORY[0x249555380](v34);
        v25 = (void *)v24;
        if (v13 <= 0.0)
        {
          (*(void (**)(uint64_t))(v24 + 16))(v24);
        }
        else
        {
          v26 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "-[SCDAAssertionCoordinator _addAssertion:]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v22;
            *(_WORD *)&buf[22] = 2048;
            v40 = *(uint64_t (**)(uint64_t, uint64_t))&v13;
            _os_log_debug_impl(&dword_246211000, v26, OS_LOG_TYPE_DEBUG, "%s Activating %@ in %f seconds...", buf, 0x20u);
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v40 = __Block_byref_object_copy_;
          v41 = __Block_byref_object_dispose_;
          v42 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
          v27 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
          v28 = SCDADispatchTimeGetFromDateAndOffset(v7, 0.0);
          dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0);
          v29 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
          v31[0] = v21;
          v31[1] = 3221225472;
          v31[2] = __42__SCDAAssertionCoordinator__addAssertion___block_invoke_100;
          v31[3] = &unk_25174A020;
          v32 = v25;
          v33 = buf;
          dispatch_source_set_event_handler(v29, v31);
          dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));

          _Block_object_dispose(buf, 8);
        }

        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
        goto LABEL_21;
      }
      v30 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[SCDAAssertionCoordinator _addAssertion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2048;
        v40 = *(uint64_t (**)(uint64_t, uint64_t))&v14;
        _os_log_error_impl(&dword_246211000, v30, OS_LOG_TYPE_ERROR, "%s %@ expired %f seconds ago.", buf, 0x20u);
      }
    }
    else
    {
      v11 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[SCDAAssertionCoordinator _addAssertion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2048;
        v40 = *(uint64_t (**)(uint64_t, uint64_t))&v10;
        _os_log_error_impl(&dword_246211000, v11, OS_LOG_TYPE_ERROR, "%s %@ contains invalid expiration duration %f.", buf, 0x20u);
      }
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kSCDAErrorDomain"), 31, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invokeRelinquishmentHandlerWithContext:error:", 0, v23);
LABEL_21:

    goto LABEL_22;
  }
  if (v4)
    goto LABEL_3;
LABEL_22:

}

- (void)_activateAssertionWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int64_t *p_numberOfActiveAssertions;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL8 v12;
  id WeakRetained;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  dispatch_time_t v26;
  NSObject *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _BYTE *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id location;
  _BYTE buf[24];
  double v38;
  void (*v39)(uint64_t);
  dispatch_source_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SCDAAssertionCoordinator _activateAssertionWithUUID:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_debug_impl(&dword_246211000, v5, OS_LOG_TYPE_DEBUG, "%s assertionUUID = %@", buf, 0x16u);
    if (!v4)
      goto LABEL_14;
  }
  else if (!v4)
  {
    goto LABEL_14;
  }
  if ((-[NSMutableSet containsObject:](self->_activeAssertionUUIDs, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableDictionary objectForKey:](self->_assertionsByUUID, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      p_numberOfActiveAssertions = &self->_numberOfActiveAssertions;
      do
        v8 = __ldaxr((unint64_t *)p_numberOfActiveAssertions);
      while (__stlxr(v8 + 1, (unint64_t *)p_numberOfActiveAssertions));
      v9 = -[NSMutableSet count](self->_activeAssertionUUIDs, "count");
      -[NSMutableSet addObject:](self->_activeAssertionUUIDs, "addObject:", v4);
      *(double *)&v10 = COERCE_DOUBLE(-[NSMutableSet count](self->_activeAssertionUUIDs, "count"));
      v11 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[SCDAAssertionCoordinator _activateAssertionWithUUID:]";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2048;
        v38 = *(double *)&v10;
        _os_log_debug_impl(&dword_246211000, v11, OS_LOG_TYPE_DEBUG, "%s numberOfActiveAssertions: %llu -> %llu", buf, 0x20u);
      }
      v12 = v9 == 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "assertionCoordinator:didActivateAssertion:isFirstAssertion:", self, v6, v12);

      objc_msgSend(v6, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "expirationDuration");
      v16 = v15;

      if (v16 > 0.0)
      {
        objc_initWeak(&location, self);
        v17 = MEMORY[0x24BDAC760];
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __55__SCDAAssertionCoordinator__activateAssertionWithUUID___block_invoke;
        v32[3] = &unk_25174A048;
        objc_copyWeak(&v35, &location);
        v18 = v6;
        v33 = v18;
        v34 = v4;
        v19 = (void *)MEMORY[0x249555380](v32);
        objc_msgSend(v18, "context");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "effectiveDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "timeIntervalSinceNow");
        v23 = v22;
        v24 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[SCDAAssertionCoordinator _activateAssertionWithUUID:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2048;
          v38 = v16 + v23;
          _os_log_debug_impl(&dword_246211000, v24, OS_LOG_TYPE_DEBUG, "%s Deactivating %@ in %f seconds...", buf, 0x20u);
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v38 = COERCE_DOUBLE(__Block_byref_object_copy_);
        v39 = __Block_byref_object_dispose_;
        v40 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
        v25 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
        v26 = SCDADispatchTimeGetFromDateAndOffset(v21, v16);
        dispatch_source_set_timer(v25, v26, 0xFFFFFFFFFFFFFFFFLL, 0);
        v27 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
        v29[0] = v17;
        v29[1] = 3221225472;
        v29[2] = __55__SCDAAssertionCoordinator__activateAssertionWithUUID___block_invoke_102;
        v29[3] = &unk_25174A020;
        v30 = v19;
        v31 = buf;
        v28 = v19;
        dispatch_source_set_event_handler(v27, v29);
        dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));

        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v35);
        objc_destroyWeak(&location);
      }
    }

  }
LABEL_14:

}

- (void)_deactivateAndRemoveAssertionWithUUID:(id)a3 context:(id)a4 error:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  int64_t *p_numberOfActiveAssertions;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id WeakRetained;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v27 = v13;
    SCDAAssertionRelinquishmentOptionsGetNames(a6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 136316162;
    v30 = "-[SCDAAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
    v31 = 2112;
    v32 = (uint64_t)v10;
    v33 = 2112;
    v34 = (uint64_t)v11;
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v28;
    _os_log_debug_impl(&dword_246211000, v27, OS_LOG_TYPE_DEBUG, "%s assertionUUID = %@, context = %@, error = %@, options = %@", (uint8_t *)&v29, 0x34u);

    if (!v10)
      goto LABEL_18;
  }
  else if (!v10)
  {
    goto LABEL_18;
  }
  -[NSMutableDictionary objectForKey:](self->_assertionsByUUID, "objectForKey:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = -[NSMutableSet containsObject:](self->_activeAssertionUUIDs, "containsObject:", v10);
    if ((a6 & 1) != 0 && v15)
    {
      v16 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        v29 = 136315394;
        v30 = "-[SCDAAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
        v31 = 2112;
        v32 = (uint64_t)v14;
        _os_log_debug_impl(&dword_246211000, v16, OS_LOG_TYPE_DEBUG, "%s Skipped deactivating %@ because it is active and requested inactive only.", (uint8_t *)&v29, 0x16u);
      }
    }
    else
    {
      if (v15)
      {
        p_numberOfActiveAssertions = &self->_numberOfActiveAssertions;
        do
          v18 = __ldaxr((unint64_t *)p_numberOfActiveAssertions);
        while (__stlxr(v18 - 1, (unint64_t *)p_numberOfActiveAssertions));
        v19 = -[NSMutableSet count](self->_activeAssertionUUIDs, "count");
        -[NSMutableSet removeObject:](self->_activeAssertionUUIDs, "removeObject:", v10);
        v20 = -[NSMutableSet count](self->_activeAssertionUUIDs, "count");
        v21 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          v29 = 136315650;
          v30 = "-[SCDAAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
          v31 = 2048;
          v32 = v19;
          v33 = 2048;
          v34 = v20;
          _os_log_debug_impl(&dword_246211000, v21, OS_LOG_TYPE_DEBUG, "%s numberOfActiveAssertions: %llu -> %llu", (uint8_t *)&v29, 0x20u);
        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "assertionCoordinator:didDeactivateAssertion:isLastAssertion:", self, v14, v20 == 0);

      }
      objc_msgSend(v14, "invokeRelinquishmentHandlerWithContext:error:", v11, v12);
      v23 = -[NSMutableDictionary count](self->_assertionsByUUID, "count");
      -[NSMutableDictionary removeObjectForKey:](self->_assertionsByUUID, "removeObjectForKey:", v10);
      v24 = -[NSMutableDictionary count](self->_assertionsByUUID, "count");
      v25 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        v29 = 136315650;
        v30 = "-[SCDAAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
        v31 = 2048;
        v32 = v23;
        v33 = 2048;
        v34 = v24;
        _os_log_debug_impl(&dword_246211000, v25, OS_LOG_TYPE_DEBUG, "%s numberOfAssertions: %llu -> %llu", (uint8_t *)&v29, 0x20u);
      }
      v26 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v26, "assertionCoordinator:didRemoveAssertion:isLastAssertion:", self, v14, v24 == 0);

    }
  }

LABEL_18:
}

- (void)_invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  SCDAAssertionCoordinator *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[SCDAAssertionCoordinator _invalidate]";
    _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  -[NSMutableDictionary allKeys](self->_assertionsByUUID, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v17;
    *(_QWORD *)&v8 = 136315394;
    v15 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v15;
          v21 = "-[SCDAAssertionCoordinator _invalidate]";
          v22 = 2112;
          v23 = self;
          _os_log_error_impl(&dword_246211000, v13, OS_LOG_TYPE_ERROR, "%s %@ Invalidated", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kSCDAErrorDomain"), 42, 0, v15, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCDAAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:](self, "_deactivateAndRemoveAssertionWithUUID:context:error:options:", v12, 0, v14, 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v9);
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activeAssertionUUIDs, 0);
  objc_storeStrong((id *)&self->_assertionsByUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __55__SCDAAssertionCoordinator__activateAssertionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315394;
      v8 = "-[SCDAAssertionCoordinator _activateAssertionWithUUID:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      _os_log_debug_impl(&dword_246211000, v5, OS_LOG_TYPE_DEBUG, "%s Deactivating %@ now...", (uint8_t *)&v7, 0x16u);
    }
    objc_msgSend(WeakRetained, "_deactivateAndRemoveAssertionWithUUID:context:error:options:", *(_QWORD *)(a1 + 40), v3, 0, 0);
  }

}

void __55__SCDAAssertionCoordinator__activateAssertionWithUUID___block_invoke_102(uint64_t a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = +[SCDAAssertionContext newWithBuilder:](SCDAAssertionContext, "newWithBuilder:", &__block_literal_global_453);
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    dispatch_source_cancel(v4);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __55__SCDAAssertionCoordinator__activateAssertionWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTimestamp:", mach_absolute_time());
  objc_msgSend(v2, "setReason:", CFSTR("Expired on Schedule"));

}

void __42__SCDAAssertionCoordinator__addAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315394;
      v6 = "-[SCDAAssertionCoordinator _addAssertion:]_block_invoke";
      v7 = 2112;
      v8 = v4;
      _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s Activating %@ now...", (uint8_t *)&v5, 0x16u);
    }
    objc_msgSend(WeakRetained, "_activateAssertionWithUUID:", *(_QWORD *)(a1 + 40));
  }

}

void __42__SCDAAssertionCoordinator__addAssertion___block_invoke_100(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

uint64_t __38__SCDAAssertionCoordinator_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __36__SCDAAssertionCoordinator_barrier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__SCDAAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v2);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__SCDAAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke_2;
    v7[3] = &unk_251749FD0;
    v7[4] = v4;
    v6 = v3;
    v8 = v6;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  }
  else
  {
    v6 = (id)MEMORY[0x24BDBD1A8];
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__SCDAAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

void __72__SCDAAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
    if (v4)
    {
      v5 = v4;
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4);
      v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
      if (v3 >= v5)
        v8 = v3 - v5;
      else
        v8 = 0;
      v9 = (void *)objc_msgSend(v7, "initWithCapacity:", v8);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 32);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __72__SCDAAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke_2;
      v16[3] = &unk_251749FA8;
      v16[4] = v10;
      v14 = v6;
      v17 = v14;
      v12 = v9;
      v18 = v12;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);

      v13 = v14;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)MEMORY[0x24BDBD1A8];
    }
  }
  else
  {
    v13 = (id)MEMORY[0x24BDBD1A8];
    v12 = (id)MEMORY[0x24BDBD1A8];
  }
  v15 = v13;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__SCDAAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v8 = a3;
  v6 = objc_msgSend(v5, "containsObject:", a2);
  v7 = 48;
  if (v6)
    v7 = 40;
  objc_msgSend(*(id *)(a1 + v7), "addObject:", v8);

}

void __65__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke_2;
  v16[3] = &unk_251749F80;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v18 = v4;
  v16[4] = v5;
  v6 = v2;
  v17 = v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(a1 + 32), "_deactivateAndRemoveAssertionWithUUID:context:error:options:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), 0, *(_QWORD *)(a1 + 40), 0, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    }
    while (v9);
  }

}

void __65__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v7 = a3;
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v7, objc_msgSend(v6, "containsObject:", v8));

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __67__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __67__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke_2;
  v16[3] = &unk_251749F80;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v18 = v4;
  v16[4] = v5;
  v6 = v2;
  v17 = v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(a1 + 32), "_deactivateAndRemoveAssertionWithUUID:context:error:options:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), *(_QWORD *)(a1 + 40), 0, 0, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    }
    while (v9);
  }

}

void __67__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v7 = a3;
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v7, objc_msgSend(v6, "containsObject:", v8));

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

uint64_t __70__SCDAAssertionCoordinator_relinquishAssertionWithUUID_error_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivateAndRemoveAssertionWithUUID:context:error:options:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __72__SCDAAssertionCoordinator_relinquishAssertionWithUUID_context_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivateAndRemoveAssertionWithUUID:context:error:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

uint64_t __92__SCDAAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  uint64_t result;

  v1 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 24);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 - 1, v1));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __92__SCDAAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAssertion:", *(_QWORD *)(a1 + 40));
}

@end

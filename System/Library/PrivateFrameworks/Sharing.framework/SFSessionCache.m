@implementation SFSessionCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSessionCache)init
{
  SFSessionCache *v2;
  SFSessionCache *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v6;
  NSUUID *identifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFSessionCache;
  v2 = -[SFSessionCache init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_capacity = 6;
    SFMainQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v3->_identifier;
    v3->_identifier = (NSUUID *)v6;

  }
  return v3;
}

- (SFSessionCache)initWithCoder:(id)a3
{
  id v4;
  SFSessionCache *v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v8;
  NSUUID *identifier;
  uint64_t v10;
  NSString *serviceIdentifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *sessions;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSMutableDictionary *timestamps;
  objc_super v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SFSessionCache;
  v5 = -[SFSessionCache init](&v27, sel_init);
  if (v5)
  {
    SFMainQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("cp")))
      v5->_capacity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cp"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("id")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
      v8 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v8;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sid")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
      v10 = objc_claimAutoreleasedReturnValue();
      serviceIdentifier = v5->_serviceIdentifier;
      v5->_serviceIdentifier = (NSString *)v10;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sd")))
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      v29[0] = objc_opt_class();
      v29[1] = objc_opt_class();
      v29[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sd"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v14, v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "mutableCopy");
      sessions = v5->_sessions;
      v5->_sessions = (NSMutableDictionary *)v17;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("tsd")))
    {
      v19 = (void *)MEMORY[0x1E0C99E60];
      v28[0] = objc_opt_class();
      v28[1] = objc_opt_class();
      v28[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWithArray:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sd"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v21, v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "mutableCopy");
      timestamps = v5->_timestamps;
      v5->_timestamps = (NSMutableDictionary *)v24;

    }
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  NSString *serviceIdentifier;
  NSMutableDictionary *sessions;
  void *v7;
  NSMutableDictionary *timestamps;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", self->_capacity, CFSTR("cp"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v10, "encodeObject:forKey:", identifier, CFSTR("id"));
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
    objc_msgSend(v10, "encodeObject:forKey:", serviceIdentifier, CFSTR("sid"));
  sessions = self->_sessions;
  if (sessions)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", sessions, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("sd"));

  }
  timestamps = self->_timestamps;
  if (timestamps)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", timestamps, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("tsd"));

  }
}

- (id)description
{
  id v3;
  void *v4;
  NSString *serviceIdentifier;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSUUID *identifier;
  uint64_t v21;
  uint64_t v22;
  unint64_t capacity;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  identifier = self->_identifier;
  capacity = self->_capacity;
  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
  {
    v31 = v3;
    identifier = (NSUUID *)serviceIdentifier;
    NSAppendPrintF();
    v6 = v31;

    v4 = v6;
  }
  v30 = v4;
  NSAppendPrintF();
  v7 = v4;

  v29 = v7;
  v21 = -[NSMutableDictionary count](self->_sessions, "count", identifier, capacity);
  NSAppendPrintF();
  v8 = v7;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMutableDictionary allKeys](self->_sessions, "allKeys", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_timestamps, "objectForKeyedSubscript:", v15, v22, v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        v24 = v18;
        v22 = v15;
        NSAppendPrintF();
        v8 = v14;

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16, v22, v18);
    }
    while (v11);
  }

  return v8;
}

- (void)_ensureStarted
{
  NSMutableDictionary *v3;
  NSMutableDictionary *sessions;
  NSMutableDictionary *v5;
  NSMutableDictionary *timestamps;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidated)
  {
    if (gLogCategory_SFSessionCache <= 60
      && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (!self->_sessions)
    {
      v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      sessions = self->_sessions;
      self->_sessions = v3;

    }
    if (!self->_timestamps)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      timestamps = self->_timestamps;
      self->_timestamps = v5;

    }
  }
}

- (void)_ensureStopped
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *sessions;
  NSMutableDictionary *timestamps;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_sessions, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_sessions, "removeAllObjects");
  sessions = self->_sessions;
  self->_sessions = 0;

  -[NSMutableDictionary removeAllObjects](self->_timestamps, "removeAllObjects");
  timestamps = self->_timestamps;
  self->_timestamps = 0;

}

- (void)_popCache
{
  void *v3;
  void *v4;
  NSMutableDictionary *timestamps;
  void *v6;
  NSUUID *identifier;
  uint64_t v8;
  _QWORD v9[6];
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy_;
  v10[4] = __Block_byref_object_dispose_;
  v11 = 0;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "numberWithDouble:");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activated)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_8;
  }
  timestamps = self->_timestamps;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27__SFSessionCache__popCache__block_invoke;
  v9[3] = &unk_1E482E0C8;
  v9[4] = v10;
  v9[5] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](timestamps, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v13[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogCategory_SFSessionCache <= 60
      && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_13;
  }
  if (gLogCategory_SFSessionCache <= 10
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    identifier = self->_identifier;
    v8 = v13[5];
    LogPrintF();
  }
  objc_msgSend(v6, "invalidate", identifier, v8);
  -[NSMutableDictionary removeObjectForKey:](self->_sessions, "removeObjectForKey:", v13[5]);
  -[NSMutableDictionary removeObjectForKey:](self->_timestamps, "removeObjectForKey:", v13[5]);
LABEL_8:

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);

}

void __27__SFSessionCache__popCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "doubleValue");
  v7 = v6;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "doubleValue");
  if (v7 < v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (id)_sessionWithDevice:(id)a3 activate:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  SFSession *v11;
  uint64_t v12;
  NSObject *dispatchQueue;
  SFSession *v14;
  SFSession *v15;
  uint64_t v16;
  SFSession *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  uint64_t block;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  SFSession *v27;
  SFSession *v28;
  _QWORD v29[5];
  SFSession *v30;
  id v31;
  _QWORD v32[5];
  SFSession *v33;
  _QWORD v34[5];
  SFSession *v35;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activated)
  {
    v11 = 0;
    goto LABEL_22;
  }
  v11 = 0;
  if (!self->_invalidated && v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v11 = (SFSession *)v12;
      if (gLogCategory_SFSessionCache <= 30
        && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
      {
        v22 = v10;
        LogPrintF();
      }
      if (!v9)
        goto LABEL_21;
      dispatchQueue = self->_dispatchQueue;
      block = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_7;
      v26 = &unk_1E482E0F0;
      v28 = (SFSession *)v9;
      v11 = v11;
      v27 = v11;
      dispatch_async(dispatchQueue, &block);

      v14 = v28;
    }
    else
    {
      if (gLogCategory_SFSessionCache <= 30
        && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
      {
        v22 = v10;
        LogPrintF();
      }
      v15 = objc_alloc_init(SFSession);
      -[SFSession setDispatchQueue:](v15, "setDispatchQueue:", self->_dispatchQueue);
      -[SFSession setPeerDevice:](v15, "setPeerDevice:", v8);
      -[SFSession setServiceIdentifier:](v15, "setServiceIdentifier:", self->_serviceIdentifier);
      v16 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke;
      v34[3] = &unk_1E482D3A0;
      v34[4] = self;
      v17 = v15;
      v35 = v17;
      -[SFSession setInterruptionHandler:](v17, "setInterruptionHandler:", v34);
      v32[0] = v16;
      v32[1] = 3221225472;
      v32[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_3;
      v32[3] = &unk_1E482D3A0;
      v32[4] = self;
      v11 = v17;
      v33 = v11;
      -[SFSession setInvalidationHandler:](v11, "setInvalidationHandler:", v32);
      if (v6)
      {
        v29[0] = v16;
        v29[1] = 3221225472;
        v29[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_5;
        v29[3] = &unk_1E482E118;
        v31 = v9;
        v29[4] = self;
        v30 = v11;
        -[SFSession activateWithCompletion:](v30, "activateWithCompletion:", v29);

      }
      if (-[SFSessionCache cacheFull](self, "cacheFull", v22))
        -[SFSessionCache _popCache](self, "_popCache");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessions, "setObject:forKeyedSubscript:", v11, v10);

      v14 = v35;
    }

LABEL_21:
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date", v22, block, v24, v25, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSince1970");
    objc_msgSend(v18, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timestamps, "setObject:forKeyedSubscript:", v20, v10);

  }
LABEL_22:

  return v11;
}

void __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_2;
  v4[3] = &unk_1E482D3A0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionWasInterrupted:", *(_QWORD *)(a1 + 40));
}

void __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_4;
  v4[3] = &unk_1E482D3A0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionWasInvalidated:", *(_QWORD *)(a1 + 40));
}

void __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFSessionCache <= 30
      && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFSessionCache <= 30
      && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = *(void **)(a1 + 48);
    if (v4)
    {
      v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_6;
      block[3] = &unk_1E482E0F0;
      v8 = v4;
      v7 = *(id *)(a1 + 40);
      dispatch_async(v5, block);

    }
  }

}

uint64_t __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __61__SFSessionCache__sessionWithDevice_activate_withCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_sessionWasInterrupted:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_SFSessionCache <= 30
    && ((v6 = v3, gLogCategory_SFSessionCache != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)_sessionWasInvalidated:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_SFSessionCache <= 30
    && ((v6 = v3, gLogCategory_SFSessionCache != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SFSessionCache_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SFSessionCache_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSessionCache <= 50
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_ensureStarted");
}

- (void)clearCache
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SFSessionCache_clearCache__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SFSessionCache_clearCache__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSessionCache <= 50
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureStopped");
  return objc_msgSend(*(id *)(a1 + 32), "_ensureStarted");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SFSessionCache_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SFSessionCache_invalidate__block_invoke(uint64_t a1)
{
  uint64_t result;

  if (gLogCategory_SFSessionCache <= 50
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_ensureStopped");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  return result;
}

- (void)sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5 toDevice:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *dispatchQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  SFSessionCache *v19;
  id v20;
  id v21;
  unsigned int v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SFSessionCache_sendRequestWithFlags_object_responseHandler_toDevice___block_invoke;
  block[3] = &unk_1E482E168;
  v22 = a3;
  v18 = v10;
  v19 = self;
  v20 = v12;
  v21 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(dispatchQueue, block);

}

void __71__SFSessionCache_sendRequestWithFlags_object_responseHandler_toDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD aBlock[4];
  id v5;
  id v6;
  int v7;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SFSessionCache_sendRequestWithFlags_object_responseHandler_toDevice___block_invoke_2;
  aBlock[3] = &unk_1E482E140;
  v7 = *(_DWORD *)(a1 + 64);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 56);
  v2 = _Block_copy(aBlock);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "_sessionWithDevice:activate:withCompletion:", *(_QWORD *)(a1 + 48), 1, v2);

}

void __71__SFSessionCache_sendRequestWithFlags_object_responseHandler_toDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (gLogCategory_SFSessionCache <= 10
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v3, "sendRequestWithFlags:object:responseHandler:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)sendWithFlags:(unsigned int)a3 object:(id)a4 toDevice:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SFSessionCache *v15;
  id v16;
  unsigned int v17;

  v8 = a4;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__SFSessionCache_sendWithFlags_object_toDevice___block_invoke;
  v13[3] = &unk_1E482E1B8;
  v17 = a3;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

void __48__SFSessionCache_sendWithFlags_object_toDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  int v9;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __48__SFSessionCache_sendWithFlags_object_toDevice___block_invoke_2;
  v7 = &unk_1E482E190;
  v9 = *(_DWORD *)(a1 + 56);
  v8 = *(id *)(a1 + 32);
  v2 = _Block_copy(&v4);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "_sessionWithDevice:activate:withCompletion:", *(_QWORD *)(a1 + 48), 1, v2, v4, v5, v6, v7);

}

void __48__SFSessionCache_sendWithFlags_object_toDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (gLogCategory_SFSessionCache <= 10
    && (gLogCategory_SFSessionCache != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v3, "sendWithFlags:object:", *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (id)sessionWithDevice:(id)a3 activate:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SFSessionCache_sessionWithDevice_activate_withCompletion___block_invoke;
  block[3] = &unk_1E482E1E0;
  block[4] = self;
  v16 = v8;
  v19 = a4;
  v17 = v9;
  v18 = &v20;
  v11 = v9;
  v12 = v8;
  dispatch_sync(dispatchQueue, block);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __60__SFSessionCache_sessionWithDevice_activate_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_sessionWithDevice:activate:withCompletion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)activePeerDeviceIDs
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_activated && !self->_invalidated)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allKeys](self->_sessions, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)activeSessions
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_activated && !self->_invalidated)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allValues](self->_sessions, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)cacheFull
{
  return -[NSMutableDictionary count](self->_sessions, "count") >= self->_capacity;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end

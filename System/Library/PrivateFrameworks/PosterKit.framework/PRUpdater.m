@implementation PRUpdater

- (PRUpdater)initWithDelegate:(id)a3
{
  id v6;
  void *v7;
  PRUpdater *v8;
  PRUpdater *v9;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableSet *lock_connections;
  uint64_t v14;
  NSMutableArray *lock_callOutBlocks;
  PRUpdater *result;
  void *v17;
  objc_super v18;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v18.receiver = self;
    v18.super_class = (Class)PRUpdater;
    v8 = -[PRUpdater init](&v18, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_delegate, a3);
      Serial = BSDispatchQueueCreateSerial();
      queue = v9->_queue;
      v9->_queue = (OS_dispatch_queue *)Serial;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v12 = objc_claimAutoreleasedReturnValue();
      lock_connections = v9->_lock_connections;
      v9->_lock_connections = (NSMutableSet *)v12;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = objc_claimAutoreleasedReturnValue();
      lock_callOutBlocks = v9->_lock_callOutBlocks;
      v9->_lock_callOutBlocks = (NSMutableArray *)v14;

    }
    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("delegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRUpdater initWithDelegate:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    result = (PRUpdater *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v5;
  void *v6;
  BOOL result;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableSet containsObject:](self->_lock_connections, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("![_lock_connections containsObject:connection]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRUpdater shouldAcceptConnection:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    -[NSMutableSet addObject:](self->_lock_connections, "addObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak(&location, v5);
    objc_msgSend(v5, "_setQueue:", self->_queue);
    +[PRUpdatingService interfaceToExtension](PRUpdatingService, "interfaceToExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v6);

    objc_msgSend(v5, "setExportedObject:", self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__PRUpdater_shouldAcceptConnection___block_invoke;
    v9[3] = &unk_1E2185D50;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    objc_msgSend(v5, "setInvalidationHandler:", v9);
    objc_msgSend(v5, "activate");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

    return 1;
  }
  return result;
}

void __36__PRUpdater_shouldAcceptConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PRSLogPosterContents();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __36__PRUpdater_shouldAcceptConnection___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_disconnect:", WeakRetained);
}

- (void)updateDescriptors:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0D016E0];
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tokenFromNSXPCConnection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke;
  v19[3] = &unk_1E2185DF0;
  v23 = v11;
  v24 = a2;
  v19[4] = self;
  v20 = v9;
  v21 = v14;
  v22 = v10;
  v15 = v10;
  v16 = v14;
  v17 = v9;
  v18 = v11;
  -[PRUpdater _enqueueCallOut:](self, "_enqueueCallOut:", v19);

}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  void *v25;
  id *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2;
  v39[3] = &unk_1E2185DA0;
  v9 = v7;
  v10 = *(void **)(a1 + 64);
  v46 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 32);
  v40 = v9;
  v41 = v11;
  v44 = v10;
  v12 = v6;
  v45 = v12;
  v42 = *(id *)(a1 + 40);
  v43 = *(id *)(a1 + 48);
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D77C604](v39);
  v14 = dispatch_time(0, 0x14F46B0000);
  objc_msgSend(MEMORY[0x1E0D7F8F0], "sharedWorkloop");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_41;
  block[3] = &unk_1E2185DC8;
  v16 = v9;
  v36 = v16;
  v37 = *(id *)(a1 + 64);
  v17 = v12;
  v38 = v17;
  dispatch_after(v14, v15, block);

  if (objc_msgSend(*(id *)(a1 + 48), "hasEntitlement:", CFSTR("com.apple.runningboard.posterkit.host")))
  {
    v29 = v16;
    v30 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = *(id *)(a1 + 40);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          v24 = -[PRPosterDescriptor _initWithPath:]([PRPosterDescriptor alloc], "_initWithPath:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v24, v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
      }
      while (v21);
    }

    v5 = v30;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v26 = -[PRUpdatingSessionInfo _initWithInfo:]((id *)[PRUpdatingSessionInfo alloc], *(void **)(a1 + 56));
      objc_msgSend(v30, "updateDescriptors:withSessionInfo:completion:", v18, v26, v13);

      v16 = v29;
    }
    else
    {
      v16 = v29;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v30, "updateDescriptors:completion:", v18, v13);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pr_errorWithCode:", 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v28);

      }
    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 48), "isInvalid"))
      v27 = 5;
    else
      v27 = 6;
    objc_msgSend(MEMORY[0x1E0CB35C8], "pr_errorWithCode:", v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v18);
  }

}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *context;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  void *v59;
  _QWORD *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v60 = (_QWORD *)a1;
  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    v7 = MEMORY[0x18D77C448]();
    v8 = v5;
    if (v8)
    {
      NSClassFromString(CFSTR("NSArray"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_7();
        objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18B6DFE70);
      }
    }
    context = (void *)v7;

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v71 != v12)
            objc_enumerationMutation(v9);
          v14 = *(id *)(*((_QWORD *)&v70 + 1) + 8 * i);
          NSClassFromString(CFSTR("PRPosterDescriptor"));
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_5();
            objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x18B6DFC2CLL);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterDescriptorClass]"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_5();
            objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x18B6DFC8CLL);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
      }
      while (v11);
    }

    if (v8)
    {
      if (v6)
      {
        PRSLogPosterContents();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_4();

      }
      v52 = v6;
      v53 = v5;
      v16 = objc_msgSend(v9, "count");
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = v9;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v67 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
            objc_msgSend(v21, "_path");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "descriptorIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v23, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("replacement descriptor doesn't look valid : %@"), v21);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_2();
              objc_msgSend(objc_retainAutorelease(v47), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x18B6DFD7CLL);
            }
            v24 = (void *)v60[6];
            v64[0] = MEMORY[0x1E0C809B0];
            v64[1] = 3221225472;
            v64[2] = __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_31;
            v64[3] = &unk_1E2185D78;
            v25 = v23;
            v65 = v25;
            objc_msgSend(v24, "bs_firstObjectPassingTest:", v64);
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = (void *)v26;
            if (v22)
              v28 = v26 == 0;
            else
              v28 = 1;
            if (!v28)
            {
              objc_msgSend(v22, "role");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "role");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v29, "isEqual:", v30);

              if ((v31 & 1) == 0)
              {
                v48 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v21, "descriptorIdentifier");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "stringWithFormat:", CFSTR("replaced descriptor '%@' has changed its role? : %@"), v49, v21);
                v50 = (void *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_3();
                objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
                _bs_set_crash_log_message();
                __break(0);
                JUMPOUT(0x18B6DFDECLL);
              }
            }
            objc_msgSend(v22, "serverIdentity");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              objc_msgSend(v59, "addObject:", v22);
            }
            else
            {
              v33 = v60[7];
              v63 = 0;
              objc_msgSend(v22, "extendContentsReadAccessToAuditToken:error:", v33, &v63);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v63;
              if (v34)
              {
                objc_msgSend(v22, "extendValidityForReason:", CFSTR("updateDescriptors-result"));
                v36 = objc_claimAutoreleasedReturnValue();
                if (v36)
                  objc_msgSend(v57, "addObject:", v36);
                objc_msgSend(v59, "addObject:", v34);
              }
              else
              {
                PRSLogPosterContents();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
                {
                  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "bundleIdentifier");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v75 = v55;
                  v76 = 2112;
                  v77 = v35;
                  v78 = 2112;
                  v79 = v21;
                  _os_log_fault_impl(&dword_18B634000, v36, OS_LOG_TYPE_FAULT, "PRUpdater %@ failed to extend access of replacement descriptor to server with error=%@ : %@", buf, 0x20u);

                }
              }

            }
          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        }
        while (v18);
      }

      v37 = objc_msgSend(v57, "count");
      v38 = objc_alloc(MEMORY[0x1E0D7F8D8]);
      v39 = v38;
      if (v37)
      {
        objc_msgSend(MEMORY[0x1E0D7F8F0], "sharedWorkloop");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_39;
        v61[3] = &unk_1E2184010;
        v62 = v57;
        v41 = v59;
        v42 = (void *)objc_msgSend(v39, "initWithPaths:queue:invalidationHandler:", v59, v40, v61);

      }
      else
      {
        v41 = v59;
        v42 = (void *)objc_msgSend(v38, "initWithPaths:", v59);
      }
      v6 = v52;
      v5 = v53;
      v44 = context;
      (*(void (**)(void))(v60[8] + 16))();
      (*(void (**)(void))(v60[9] + 16))();

    }
    else
    {
      PRSLogPosterContents();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_1();

      (*(void (**)(void))(v60[8] + 16))();
      (*(void (**)(void))(v60[9] + 16))();
      v44 = context;
    }
    objc_autoreleasePoolPop(v44);
  }

}

uint64_t __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_31(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "descriptorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_39(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "invalidate", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_41(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "signal");
  PRSLogPosterContents();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_41_cold_1();

    v5 = *(_QWORD *)(a1 + 40);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v17[0] = *MEMORY[0x1E0CB2D68];
    v17[1] = CFSTR("clientBundleIdentifier");
    v18[0] = CFSTR("Client timed out");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("(null bundleIdentifier)");
    if (v8)
      v10 = (const __CFString *)v8;
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pr_errorWithCode:userInfo:", 7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "PRUpdater %@ ran successfully", (uint8_t *)&v15, 0xCu);

    }
  }
}

- (void)updateConfiguration:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0D016E0];
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tokenFromNSXPCConnection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke;
  v19[3] = &unk_1E2185DF0;
  v23 = v11;
  v24 = a2;
  v19[4] = self;
  v20 = v9;
  v21 = v14;
  v22 = v10;
  v15 = v10;
  v16 = v14;
  v17 = v9;
  v18 = v11;
  -[PRUpdater _enqueueCallOut:](self, "_enqueueCallOut:", v19);

}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2;
  v30[3] = &unk_1E2185E18;
  v9 = v7;
  v10 = *(void **)(a1 + 64);
  v37 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 32);
  v31 = v9;
  v32 = v11;
  v35 = v10;
  v12 = v6;
  v36 = v12;
  v33 = *(id *)(a1 + 40);
  v34 = *(id *)(a1 + 48);
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D77C604](v30);
  v14 = dispatch_time(0, 0x14F46B0000);
  objc_msgSend(MEMORY[0x1E0D7F8F0], "sharedWorkloop");
  v15 = objc_claimAutoreleasedReturnValue();
  v23 = v8;
  v24 = 3221225472;
  v25 = __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_69;
  v26 = &unk_1E2185DC8;
  v16 = v9;
  v27 = v16;
  v28 = *(id *)(a1 + 64);
  v17 = v12;
  v29 = v17;
  dispatch_after(v14, v15, &v23);

  if (!objc_msgSend(*(id *)(a1 + 48), "hasEntitlement:", CFSTR("com.apple.runningboard.posterkit.host"), v23, v24, v25, v26))
  {
    v20 = objc_msgSend(*(id *)(a1 + 48), "isInvalid");
    v21 = (void *)MEMORY[0x1E0CB35C8];
    if (v20)
      v22 = 5;
    else
      v22 = 6;
    goto LABEL_9;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = 1;
LABEL_9:
    objc_msgSend(v21, "pr_errorWithCode:", v22);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v13)[2](v13, 0, v18);
    goto LABEL_14;
  }
  v18 = -[PRPosterConfiguration _initWithPath:]([PRPosterConfiguration alloc], "_initWithPath:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = -[PRUpdatingSessionInfo _initWithInfo:]((id *)[PRUpdatingSessionInfo alloc], *(void **)(a1 + 56));
    objc_msgSend(v5, "updateConfiguration:withSessionInfo:completion:", v18, v19, v13);
LABEL_13:

    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pr_errorWithCode:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v19);
    goto LABEL_13;
  }
  objc_msgSend(v5, "updateConfiguration:completion:", v18, v13);
LABEL_14:

}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    v7 = (void *)MEMORY[0x18D77C448]();
    v8 = v5;
    if (!v8)
    {
      PRSLogPosterContents();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      goto LABEL_24;
    }
    v9 = v8;
    NSClassFromString(CFSTR("PRPosterConfiguration"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_5();
      objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B6E0950);
    }

    if (v6)
    {
      PRSLogPosterContents();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_4();

    }
    objc_msgSend(v9, "_path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "role");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "role");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if ((v14 & 1) == 0)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "descriptorIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("replaced configuration '%@' has changed its role? : %@"), v30, v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_3();
      objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B6E09C0);
    }
    objc_msgSend(v11, "serverIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (!v11)
      {
        v19 = 0;
        v20 = 0;
        v18 = 0;
LABEL_23:
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

LABEL_24:
        objc_autoreleasePoolPop(v7);
        goto LABEL_25;
      }
    }
    else
    {
      v22 = *(_QWORD *)(a1 + 56);
      v34 = 0;
      objc_msgSend(v11, "extendContentsReadAccessToAuditToken:error:", v22, &v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v34;
      if (!v20)
      {

        PRSLogPosterContents();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_2((uint64_t)v17, (uint64_t)v9, v27);

        v19 = 0;
        v20 = 0;
        v18 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v11, "extendValidityForReason:", CFSTR("updateConfiguration-result"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = objc_alloc(MEMORY[0x1E0D7F8D8]);
        v36[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D7F8F0], "sharedWorkloop");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_67;
        v32[3] = &unk_1E2184010;
        v19 = v23;
        v33 = v19;
        v18 = (void *)objc_msgSend(v24, "initWithPaths:queue:invalidationHandler:", v25, v26, v32);

        v17 = v33;
        goto LABEL_22;
      }
      v11 = v20;
    }
    v16 = objc_alloc(MEMORY[0x1E0D7F8D8]);
    v35 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithPaths:", v17);
    v19 = 0;
    v20 = v11;
LABEL_22:

    goto LABEL_23;
  }
LABEL_25:

}

uint64_t __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_67(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_69(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "signal");
  PRSLogPosterContents();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_69_cold_1();

    v5 = *(_QWORD *)(a1 + 40);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v17[0] = *MEMORY[0x1E0CB2D68];
    v17[1] = CFSTR("clientBundleIdentifier");
    v18[0] = CFSTR("Client timed out");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("(null bundleIdentifier)");
    if (v8)
      v10 = (const __CFString *)v8;
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pr_errorWithCode:userInfo:", 7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "PRUpdater %@ ran updateConfiguration successfully", (uint8_t *)&v15, 0xCu);

    }
  }
}

- (void)_enqueueCallOut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *lock_callOutBlocks;
  void *v8;
  NSObject *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D77C448]();
  v6 = (void *)objc_msgSend(v4, "copy");
  os_unfair_lock_lock(&self->_lock);
  lock_callOutBlocks = self->_lock_callOutBlocks;
  v8 = (void *)MEMORY[0x18D77C604](v6);
  -[NSMutableArray addObject:](lock_callOutBlocks, "addObject:", v8);

  os_unfair_lock_unlock(&self->_lock);
  PRSLogPosterContents();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PRUpdater _enqueueCallOut:].cold.1();

  objc_autoreleasePoolPop(v5);
  -[PRUpdater _dequeueNextCallOutIfPossible](self, "_dequeueNextCallOutIfPossible");

}

- (void)_dequeueNextCallOutIfPossible
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x18D77C604](a1);
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_20(&dword_18B634000, a2, v7, "PRUpdater %@: calling dequeued delegate block %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_1();
}

void __42__PRUpdater__dequeueNextCallOutIfPossible__block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PRUpdater__dequeueNextCallOutIfPossible__block_invoke_2;
  block[3] = &unk_1E2185E40;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __42__PRUpdater__dequeueNextCallOutIfPossible__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_dequeueNextCallOutIfPossible");
    WeakRetained = v2;
  }

}

- (void)_disconnect:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((-[NSMutableSet containsObject:](self->_lock_connections, "containsObject:", v6) & 1) != 0)
  {
    -[NSMutableSet removeObject:](self->_lock_connections, "removeObject:", v6);
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_lock_connections containsObject:connection]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRUpdater _disconnect:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_callOutBlocks, 0);
  objc_storeStrong((id *)&self->_lock_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)shouldAcceptConnection:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __36__PRUpdater_shouldAcceptConnection___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_21();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_18B634000, v2, v3, "PRUpdater %@ did invalidate %p", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_21();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_0_1(&dword_18B634000, v2, v3, "PRUpdater %@ failed to return replacement descriptors with error=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8_1();
  v3 = (const char *)OUTLINED_FUNCTION_13_0(v2, *MEMORY[0x1E0C80C00]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8_1();
  v3 = (const char *)OUTLINED_FUNCTION_13_0(v2, *MEMORY[0x1E0C80C00]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_13(&dword_18B634000, v2, v3, "PRUpdater %@ returned replacement descriptors with error=%@ : %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7_1();
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_5()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8_1();
  v3 = (const char *)OUTLINED_FUNCTION_13_0(v2, *MEMORY[0x1E0C80C00]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_7()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8_1();
  v3 = (const char *)OUTLINED_FUNCTION_13_0(v2, *MEMORY[0x1E0C80C00]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_41_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15_0(&dword_18B634000, v2, v3, "PRUpdater updateDescriptors timed out for client %@ .", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_21();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_0_1(&dword_18B634000, v2, v3, "PRUpdater %@ failed to return replacement configuration with error=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint8_t v6[40];
  uint64_t v7;

  OUTLINED_FUNCTION_8_1();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  _os_log_fault_impl(&dword_18B634000, a3, OS_LOG_TYPE_FAULT, "PRUpdater %@ failed to extend access of replacement configuration to server with error=%@ : %@", v6, 0x20u);

  OUTLINED_FUNCTION_7_1();
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8_1();
  v3 = (const char *)OUTLINED_FUNCTION_13_0(v2, *MEMORY[0x1E0C80C00]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_13(&dword_18B634000, v2, v3, "PRUpdater %@ returned replacement configuration with error=%@ : %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7_1();
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_5()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8_1();
  v3 = (const char *)OUTLINED_FUNCTION_13_0(v2, *MEMORY[0x1E0C80C00]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_69_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15_0(&dword_18B634000, v2, v3, "PRUpdater updateConfiguration timed out for client %@ .", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_enqueueCallOut:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_21();
  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x18D77C604](v1);
  v6 = 138412546;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_20(&dword_18B634000, v0, v5, "PRUpdater %@: enqueued delegate block %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)_disconnect:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end

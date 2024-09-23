@implementation PBFPosterRoleProcessor

- (PBFPosterRoleProcessor)initWithDataStorage:(id)a3 roleCoordinators:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  PBFPosterRoleProcessor *v14;
  uint64_t v15;
  NSArray *roleCoordinators;
  void *v17;
  void *v18;
  uint64_t v19;
  NSOrderedSet *roleOrderedSet;
  uint64_t v21;
  NSHashTable *observers;
  uint64_t v23;
  NSDictionary *roleToRoleCoordinator;
  uint64_t v25;
  BSAtomicFlag *invalidationFlag;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[4];
  id v35;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:].cold.1();
LABEL_23:
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBACF2E0);
  }
  v10 = v9;
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EF9ED728) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFPosterExtensionDataStorage)]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:].cold.1();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBACF344);
  }

  v11 = v8;
  NSClassFromString(CFSTR("NSArray"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:].cold.2();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBACF3A8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:].cold.2();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBACF40CLL);
  }

  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[roleCoordinators count] > 0"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:].cold.3();
    goto LABEL_23;
  }
  v12 = (void *)objc_opt_new();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __63__PBFPosterRoleProcessor_initWithDataStorage_roleCoordinators___block_invoke;
  v34[3] = &unk_1E86F72E8;
  v13 = v12;
  v35 = v13;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v34);
  v33.receiver = self;
  v33.super_class = (Class)PBFPosterRoleProcessor;
  v14 = -[PBFPosterRoleProcessor init](&v33, sel_init);
  if (v14)
  {
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_40);
    v15 = objc_claimAutoreleasedReturnValue();
    roleCoordinators = v14->_roleCoordinators;
    v14->_roleCoordinators = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v11, "bs_mapNoNulls:", &__block_literal_global_92_1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "orderedSetWithArray:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    roleOrderedSet = v14->_roleOrderedSet;
    v14->_roleOrderedSet = (NSOrderedSet *)v19;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v21;

    v23 = objc_msgSend(v13, "copy");
    roleToRoleCoordinator = v14->_roleToRoleCoordinator;
    v14->_roleToRoleCoordinator = (NSDictionary *)v23;

    objc_storeStrong((id *)&v14->_dataStorage, a3);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    invalidationFlag = v14->_invalidationFlag;
    v14->_invalidationFlag = (BSAtomicFlag *)v25;

    PBFLogDataStore();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterRoleProcessor setLog:](v14, "setLog:", v27);

  }
  return v14;
}

void __63__PBFPosterRoleProcessor_initWithDataStorage_roleCoordinators___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "role");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

uint64_t __63__PBFPosterRoleProcessor_initWithDataStorage_roleCoordinators___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __63__PBFPosterRoleProcessor_initWithDataStorage_roleCoordinators___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "role");
}

- (void)addObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v4 = self->_observers;
    objc_sync_enter(v4);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);
    objc_sync_exit(v4);

  }
}

- (void)removeObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v4 = self->_observers;
    objc_sync_enter(v4);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
    objc_sync_exit(v4);

  }
}

- (id)processChanges:(id)a3 context:(id)a4 reason:(id)a5 userInfo:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  PBFPosterRoleProcessor *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t (*v32)(uint64_t, uint64_t);
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  NSDictionary *v37;
  id v38;
  _BOOL4 v39;
  id v40;
  PBFPosterRoleProcessor *v41;
  _PBFPosterRoleProcessorTransaction *activeTransaction;
  NSObject *v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  void *v48;
  NSObject *v49;
  id v50;
  id v51;
  objc_class *v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  os_signpost_id_t spid;
  NSObject *v59;
  unint64_t v60;
  NSDictionary *v61;
  id *v62;
  PBFPosterRoleProcessor *obj;
  id v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  _QWORD v70[4];
  NSObject *v71;
  id v72;
  id v73;
  id v74;
  NSDictionary *v75;
  PBFPosterRoleProcessor *v76;
  id v77;
  _BYTE *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  os_activity_scope_state_s state;
  uint8_t v84[4];
  id v85;
  __int16 v86;
  id v87;
  uint8_t v88[128];
  _BYTE buf[24];
  uint64_t (*v90)(uint64_t, uint64_t);
  __int128 v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v13 = a4;
  v65 = a5;
  v66 = a6;
  v14 = v13;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleProcessor processChanges:context:reason:userInfo:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v56), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBACFE84);
  }
  v15 = v14;
  if ((objc_msgSend(v14, "conformsToProtocol:", &unk_1EF9ED130) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFPosterRoleCoordinatorTransitionContext)]"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleProcessor processChanges:context:reason:userInfo:error:].cold.3();
    objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBACFEE8);
  }

  v67 = v15;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v16 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v17 = self;
    objc_sync_enter(v17);
    obj = v17;
    if (v17->_activeTransaction)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Active transaction is ongoing.  Role processing is not concurrent."));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = MEMORY[0x1E0C81028];
      v50 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v51 = (id)objc_claimAutoreleasedReturnValue();
        v52 = (objc_class *)objc_opt_class();
        NSStringFromClass(v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2048;
        v90 = (uint64_t (*)(uint64_t, uint64_t))v17;
        LOWORD(v91) = 2114;
        *(_QWORD *)((char *)&v91 + 2) = CFSTR("PBFPosterRoleProcessor.m");
        WORD5(v91) = 1024;
        HIDWORD(v91) = 125;
        v92 = 2114;
        v93 = v48;
        _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
      v54 = _bs_set_crash_log_message();
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.4(v54);
    }
    v62 = a7;
    -[NSHashTable allObjects](v17->_observers, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PBFPosterRoleProcessorTransaction transactionWithReason:context:userInfo:observers:processor:](_PBFPosterRoleProcessorTransaction, "transactionWithReason:context:userInfo:observers:processor:", v65, v15, v66, v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v17->_activeTransaction, v19);
    v20 = v19;
    objc_sync_exit(obj);

    -[PBFPosterRoleProcessor log](obj, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pbf_transitionContextIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "substringToIndex:", 7);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = obj->_roleToRoleCoordinator;
    v24 = os_signpost_id_generate(v21);
    v25 = v21;
    v26 = v25;
    v60 = v24 - 1;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "processRoleCoordinatorChanges:context:reason:userInfo:error:", ", buf, 2u);
    }
    spid = v24;

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v59 = _os_activity_create(&dword_1CB9FA000, "processRoleCoordinatorChange", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v59, &state);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v68;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@} Preparing to process data store update w/ context: %{public}@", buf, 0x16u);
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v68;
      _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@} Changes:", buf, 0xCu);
    }
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v27 = v64;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    if (v28)
    {
      v29 = 0;
      v30 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v80 != v30)
            objc_enumerationMutation(v27);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v32 = *(uint64_t (**)(uint64_t, uint64_t))(*((_QWORD *)&v79 + 1) + 8 * i);
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v68;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v29;
            *(_WORD *)&buf[22] = 2114;
            v90 = v32;
            _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@}\tChange %lu: %{public}@", buf, 0x20u);
            ++v29;
          }
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      }
      while (v28);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v90 = __Block_byref_object_copy__16;
    *(_QWORD *)&v91 = __Block_byref_object_dispose__16;
    *((_QWORD *)&v91 + 1) = 0;
    +[PBFPosterRoleCoordinatorChange distillArrayOfChangesIntoChangesOrderedByPosterRoleEntropy:](PBFPosterRoleCoordinatorChange, "distillArrayOfChangesIntoChangesOrderedByPosterRoleEntropy:", v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __71__PBFPosterRoleProcessor_processChanges_context_reason_userInfo_error___block_invoke;
    v70[3] = &unk_1E86F7390;
    v34 = v26;
    v71 = v34;
    v35 = v68;
    v72 = v35;
    v36 = v33;
    v73 = v36;
    v74 = v27;
    v37 = v61;
    v78 = buf;
    v75 = v37;
    v76 = obj;
    v38 = v20;
    v77 = v38;
    v69 = 0;
    v39 = -[PBFPosterRoleProcessor _executeTransaction:block:error:](obj, "_executeTransaction:block:error:", v38, v70, &v69);
    v40 = v69;
    v41 = obj;
    objc_sync_enter(v41);
    activeTransaction = obj->_activeTransaction;
    obj->_activeTransaction = 0;

    objc_sync_exit(v41);
    os_activity_scope_leave(&state);
    v43 = v34;
    v44 = v43;
    if (v60 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v43))
    {
      *(_WORD *)v84 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v44, OS_SIGNPOST_INTERVAL_END, spid, "processRoleCoordinatorChanges:context:reason:userInfo:error:", ", v84, 2u);
    }

    if (v40)
      v45 = 0;
    else
      v45 = v39;
    if (v45 && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_msgSend(v38, "results");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v62)
      {
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          v46 = *(void **)(*(_QWORD *)&buf[8] + 40);
        else
          v46 = v40;
        *v62 = objc_retainAutorelease(v46);
      }
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v55 = *(id *)(*(_QWORD *)&buf[8] + 40);
        if (!v55)
          v55 = v40;
        *(_DWORD *)v84 = 138543618;
        v85 = v35;
        v86 = 2114;
        v87 = v55;
        _os_log_error_impl(&dword_1CB9FA000, v44, OS_LOG_TYPE_ERROR, "(%{public}@} Failed to commit changes: %{public}@", v84, 0x16u);
      }
      v16 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  return v16;
}

uint64_t __71__PBFPosterRoleProcessor_processChanges_context_reason_userInfo_error___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  __int128 v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __CFString *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;
  const __CFString *v71;
  _BYTE v72[128];
  _QWORD v73[2];
  _QWORD v74[2];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v54 = a2;
  v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v65 = v4;
    _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executing changes", buf, 0xCu);
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = *(id *)(a1 + 48);
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v61;
    v51 = *MEMORY[0x1E0CB2D68];
    *(_QWORD *)&v5 = 138543874;
    v45 = v5;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v61 != v47)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 56), "firstObject", v45);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "role");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v33 = (void *)MEMORY[0x1E0CB35C8];
          v73[0] = v51;
          v73[1] = CFSTR("role");
          if (v9)
            v34 = v9;
          else
            v34 = CFSTR("(unknown role)");
          v74[0] = CFSTR("Role coordinator not found.");
          v74[1] = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "pbf_generalErrorWithCode:userInfo:", 1, v35);
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          v38 = *(void **)(v37 + 40);
          *(_QWORD *)(v37 + 40) = v36;

          goto LABEL_40;
        }
        v11 = (void *)v10;
        v49 = v6;
        v50 = v9;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v12 = v7;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v57;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v57 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
              v18 = *(NSObject **)(a1 + 32);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)buf = 138543618;
                v65 = v19;
                v66 = 2114;
                v67 = v17;
                _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@}\t Begin %{public}@", buf, 0x16u);
              }
              v20 = *(void **)(a1 + 72);
              v21 = *(_QWORD *)(a1 + 80);
              v55 = 0;
              v22 = objc_msgSend(v20, "_executeChange:roleCoordinator:changeHandler:recursiveDepth:transaction:error:", v17, v11, v54, 0, v21, &v55);
              v23 = v55;
              v24 = v23;
              if ((v22 & 1) == 0)
              {
                v25 = v23;
                if (!v23)
                {
                  v26 = (void *)MEMORY[0x1E0CB35C8];
                  v70 = v51;
                  v71 = CFSTR("Change failed to apply and did not return an error.");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "pbf_generalErrorWithCode:userInfo:", 0);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v52;
                }
                objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v25);
                if (!v24)
                {

                }
              }
              v27 = *(NSObject **)(a1 + 32);
              if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  v30 = *(_QWORD *)(a1 + 40);
                  v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
                  *(_DWORD *)buf = v45;
                  v65 = v30;
                  v66 = 2114;
                  v67 = v17;
                  v68 = 2114;
                  v69 = v31;
                  _os_log_error_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_ERROR, "(%{public}@}\tChange %{public}@ failed to apply w/ error: %{public}@", buf, 0x20u);
                }

                goto LABEL_30;
              }
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v28 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)buf = 138543618;
                v65 = v28;
                v66 = 2114;
                v67 = v17;
                _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "(%{public}@}\tChange %{public}@ applied successful", buf, 0x16u);
              }

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_30:

        v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        if (v29)
          goto LABEL_33;
        v6 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
      if (v48)
        continue;
      break;
    }
  }
LABEL_33:

  v32 = *(NSObject **)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      __71__PBFPosterRoleProcessor_processChanges_context_reason_userInfo_error___block_invoke_cold_1();
LABEL_40:
    v39 = 0;
  }
  else
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v40 = *(_QWORD *)(a1 + 40);
      v41 = *(void **)(a1 + 56);
      v42 = v32;
      v43 = objc_msgSend(v41, "count");
      *(_DWORD *)buf = 138543618;
      v65 = v40;
      v66 = 2048;
      v67 = v43;
      _os_log_impl(&dword_1CB9FA000, v42, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executed %lu changes", buf, 0x16u);

    }
    v39 = 1;
  }

  return v39;
}

- (id)processEvents:(id)a3 context:(id)a4 reason:(id)a5 userInfo:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  PBFPosterRoleProcessor *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t (*v32)(uint64_t, uint64_t);
  NSObject *v33;
  id v34;
  id v35;
  _BOOL4 v36;
  id v37;
  PBFPosterRoleProcessor *v38;
  _PBFPosterRoleProcessorTransaction *activeTransaction;
  NSObject *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v45;
  NSObject *v46;
  id v47;
  id v48;
  objc_class *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  os_signpost_id_t spid;
  NSObject *v56;
  unint64_t v57;
  void *v58;
  id *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  _QWORD v66[4];
  NSObject *v67;
  id v68;
  id v69;
  PBFPosterRoleProcessor *v70;
  id v71;
  _BYTE *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  os_activity_scope_state_s state;
  uint8_t v78[4];
  id v79;
  __int16 v80;
  id v81;
  uint8_t v82[128];
  _BYTE buf[24];
  uint64_t (*v84)(uint64_t, uint64_t);
  __int128 v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v13 = a4;
  v14 = a5;
  v62 = a6;
  v15 = v13;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleProcessor processEvents:context:reason:userInfo:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD0CE4);
  }
  v16 = v15;
  if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EF9ED130) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFPosterRoleCoordinatorTransitionContext)]"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleProcessor processEvents:context:reason:userInfo:error:].cold.3();
    objc_msgSend(objc_retainAutorelease(v54), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD0D48);
  }

  v60 = v14;
  v63 = v16;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v17 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v18 = self;
    objc_sync_enter(v18);
    if (v18->_activeTransaction)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Active transaction is ongoing.  Role processing is not concurrent."));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = MEMORY[0x1E0C81028];
      v47 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v48 = (id)objc_claimAutoreleasedReturnValue();
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2048;
        v84 = (uint64_t (*)(uint64_t, uint64_t))v18;
        LOWORD(v85) = 2114;
        *(_QWORD *)((char *)&v85 + 2) = CFSTR("PBFPosterRoleProcessor.m");
        WORD5(v85) = 1024;
        HIDWORD(v85) = 225;
        v86 = 2114;
        v87 = v45;
        _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
      v51 = _bs_set_crash_log_message();
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.4(v51);
    }
    v59 = a7;
    -[NSHashTable allObjects](v18->_observers, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PBFPosterRoleProcessorTransaction transactionWithReason:context:userInfo:observers:processor:](_PBFPosterRoleProcessorTransaction, "transactionWithReason:context:userInfo:observers:processor:", v14, v16, v62, v19, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v20;
    objc_storeStrong((id *)&v18->_activeTransaction, v20);
    objc_sync_exit(v18);

    -[PBFPosterRoleProcessor log](v18, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pbf_transitionContextIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "substringToIndex:", 7);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = os_signpost_id_generate(v21);
    v25 = v21;
    v26 = v25;
    v57 = v24 - 1;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "processEvents:context:reason:userInfo:error:", ", buf, 2u);
    }
    spid = v24;

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v56 = _os_activity_create(&dword_1CB9FA000, "processEvents", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v56, &state);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v64;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@} Preparing to process data store events w/ context: %{public}@", buf, 0x16u);
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v64;
      _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@} Events:", buf, 0xCu);
    }
    v76 = 0u;
    v74 = 0u;
    v75 = 0u;
    v73 = 0u;
    v27 = v61;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (v28)
    {
      v29 = 0;
      v30 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v74 != v30)
            objc_enumerationMutation(v27);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v32 = *(uint64_t (**)(uint64_t, uint64_t))(*((_QWORD *)&v73 + 1) + 8 * i);
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v64;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v29;
            *(_WORD *)&buf[22] = 2114;
            v84 = v32;
            _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@}\tEvent %lu: %{public}@", buf, 0x20u);
            ++v29;
          }
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      }
      while (v28);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v84 = __Block_byref_object_copy__16;
    *(_QWORD *)&v85 = __Block_byref_object_dispose__16;
    *((_QWORD *)&v85 + 1) = 0;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __70__PBFPosterRoleProcessor_processEvents_context_reason_userInfo_error___block_invoke;
    v66[3] = &unk_1E86F73B8;
    v33 = v26;
    v67 = v33;
    v34 = v64;
    v68 = v34;
    v69 = v27;
    v70 = v18;
    v35 = v58;
    v71 = v35;
    v72 = buf;
    v65 = 0;
    v36 = -[PBFPosterRoleProcessor _executeTransaction:block:error:](v18, "_executeTransaction:block:error:", v35, v66, &v65);
    v37 = v65;
    v38 = v18;
    objc_sync_enter(v38);
    activeTransaction = v18->_activeTransaction;
    v18->_activeTransaction = 0;

    objc_sync_exit(v38);
    os_activity_scope_leave(&state);
    v40 = v33;
    v41 = v40;
    if (v57 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v40))
    {
      *(_WORD *)v78 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v41, OS_SIGNPOST_INTERVAL_END, spid, "processRoleCoordinatorChanges:context:reason:userInfo:error:", ", v78, 2u);
    }

    if (v37)
      v42 = 0;
    else
      v42 = v36;
    if (v42 && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_msgSend(v35, "results");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v59)
      {
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          v43 = *(void **)(*(_QWORD *)&buf[8] + 40);
        else
          v43 = v37;
        *v59 = objc_retainAutorelease(v43);
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v52 = *(id *)(*(_QWORD *)&buf[8] + 40);
        if (!v52)
          v52 = v37;
        *(_DWORD *)v78 = 138543618;
        v79 = v34;
        v80 = 2114;
        v81 = v52;
        _os_log_error_impl(&dword_1CB9FA000, v41, OS_LOG_TYPE_ERROR, "(%{public}@} Failed to commit changes: %{public}@", v78, 0x16u);
      }
      v17 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  return v17;
}

BOOL __70__PBFPosterRoleProcessor_processEvents_context_reason_userInfo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v43 = v5;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executing events", buf, 0xCu);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = *(id *)(a1 + 48);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    v36 = *MEMORY[0x1E0CB2D68];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v12 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v43 = v13;
          v44 = 2114;
          v45 = v11;
          _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@}\t Begin %{public}@", buf, 0x16u);
        }
        v14 = *(void **)(a1 + 56);
        v15 = *(_QWORD *)(a1 + 64);
        v16 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        obj = 0;
        v17 = objc_msgSend(v14, "_processEvent:changeHandler:recursiveDepth:transaction:error:", v11, v3, 0, v15, &obj);
        objc_storeStrong(v16, obj);
        v18 = *(_QWORD *)(a1 + 72);
        if ((v17 & 1) == 0 && !*(_QWORD *)(*(_QWORD *)(v18 + 8) + 40))
        {
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v48 = v36;
          v49 = CFSTR("Event failed to be fired and did not return an error.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "pbf_generalErrorWithCode:userInfo:", 0, v20);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v23 = *(void **)(v22 + 40);
          *(_QWORD *)(v22 + 40) = v21;

          v18 = *(_QWORD *)(a1 + 72);
        }
        v24 = *(NSObject **)(a1 + 32);
        if (*(_QWORD *)(*(_QWORD *)(v18 + 8) + 40))
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v34 = *(_QWORD *)(a1 + 40);
            v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
            *(_DWORD *)buf = 138543874;
            v43 = v34;
            v44 = 2114;
            v45 = v11;
            v46 = 2114;
            v47 = v35;
            _os_log_error_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_ERROR, "(%{public}@}\tEvent %{public}@ failed to be processed w/ error: %{public}@", buf, 0x20u);
          }
          goto LABEL_21;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v43 = v25;
          v44 = 2114;
          v45 = v11;
          _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "(%{public}@}\tEvent %{public}@ processed successful", buf, 0x16u);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_21:

  v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v27 = *(NSObject **)(a1 + 32);
  if (v26)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __70__PBFPosterRoleProcessor_processEvents_context_reason_userInfo_error___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *(_QWORD *)(a1 + 40);
    v29 = *(void **)(a1 + 64);
    v30 = v27;
    objc_msgSend(v29, "emittedEvents");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");
    *(_DWORD *)buf = 138543618;
    v43 = v28;
    v44 = 2048;
    v45 = v32;
    _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executed %lu events", buf, 0x16u);

  }
  return v26 == 0;
}

- (void)noteTransactionWasInvalidated:(id)a3
{
  _PBFPosterRoleProcessorTransaction *v4;
  PBFPosterRoleProcessor *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  _PBFPosterRoleProcessorTransaction *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (_PBFPosterRoleProcessorTransaction *)a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (v5->_activeTransaction == v4)
    {
      -[PBFPosterRoleProcessor log](v5, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      -[_PBFPosterRoleProcessorTransaction shortIdentifier](v4, "shortIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543618;
        v9 = v7;
        v10 = 2114;
        v11 = v4;
        _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@} Transaction Invalidated %{public}@", (uint8_t *)&v8, 0x16u);
      }

    }
    objc_sync_exit(v5);

  }
}

- (BOOL)_executeTransaction:(id)a3 block:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *v7;
  double v8;
  double v9;
  NSObject *v10;
  NSOrderedSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSOrderedSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  PBFPosterExtensionDataStorage *dataStorage;
  int v32;
  unint64_t v33;
  NSOrderedSet *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  unint64_t v39;
  _PBFPosterRoleProcessorTransactionResult *v40;
  BOOL v41;
  void *v42;
  double v43;
  double v44;
  NSObject *v45;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSDictionary *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  _QWORD v64[5];
  id v65;
  NSObject *v66;
  id v67;
  NSDictionary *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  _BYTE *v78;
  _QWORD aBlock[4];
  id v80;
  NSObject *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[4];
  id v92;
  __int16 v93;
  double v94;
  uint8_t v95[128];
  _BYTE buf[24];
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v49 = a4;
  v50 = v6;
  objc_msgSend(v6, "shortIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterRoleProcessor log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  v58 = self->_roleToRoleCoordinator;
  BSAbsoluteMachTimeNow();
  v9 = v8;
  PBFLogDataStore();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v53;
    _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@} Starting transaction", buf, 0xCu);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v11 = self->_roleOrderedSet;
  v12 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v88 != v13)
          objc_enumerationMutation(v11);
        -[NSDictionary objectForKeyedSubscript:](v58, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "incrementTransactionCount");

      }
      v12 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
    }
    while (v12);
  }

  -[PBFPosterRoleProcessor _fireWillBeginTransaction:](self, "_fireWillBeginTransaction:", v50);
  v55 = (void *)objc_opt_new();
  v56 = (void *)objc_opt_new();
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v16 = self->_roleOrderedSet;
  v17 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v84 != v18)
          objc_enumerationMutation(v16);
        v20 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j);
        -[NSDictionary objectForKeyedSubscript:](v58, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "pbf_currentActivePosterForRole:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v22, v20);
        objc_msgSend(v21, "posterCollection");
        v23 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v23, v20);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v53;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2114;
          v97 = v23;
          _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@} Stashing collection for role %{public}@: %{public}@", buf, 0x20u);
        }

      }
      v17 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
    }
    while (v17);
  }

  objc_msgSend(v57, "pbf_extensionStoreCoordinatorForProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke;
  aBlock[3] = &unk_1E86F3130;
  v28 = v26;
  v80 = v28;
  v29 = v7;
  v81 = v29;
  v30 = v53;
  v82 = v30;
  v47 = _Block_copy(aBlock);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v97 = __Block_byref_object_copy__16;
  v98 = __Block_byref_object_dispose__16;
  v99 = 0;
  v48 = (void *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  v52 = (void *)objc_opt_new();
  if (v49)
  {
    dataStorage = self->_dataStorage;
    v64[0] = v27;
    v64[1] = 3221225472;
    v64[2] = __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke_135;
    v64[3] = &unk_1E86F73E0;
    v64[4] = self;
    v65 = v50;
    v66 = v29;
    v67 = v30;
    v76 = v49;
    v77 = v47;
    v78 = buf;
    v68 = v58;
    v69 = v28;
    v70 = v52;
    v71 = v55;
    v72 = v54;
    v73 = v56;
    v74 = v57;
    v75 = v48;
    v63 = 0;
    v32 = -[PBFPosterExtensionDataStorage performChanges:error:](dataStorage, "performChanges:error:", v64, &v63);
    v33 = (unint64_t)v63;

  }
  else
  {
    -[PBFPosterRoleProcessor _fireDidBeginTransaction:](self, "_fireDidBeginTransaction:", v50);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v91 = 138543362;
      v92 = v30;
      _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "(%{public}@} completed null transaction", v91, 0xCu);
    }
    -[PBFPosterRoleProcessor _fireWillCommitTransaction:](self, "_fireWillCommitTransaction:", v50);
    v33 = 0;
    v32 = 1;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v34 = self->_roleOrderedSet;
  v35 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v59, v95, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v60 != v36)
          objc_enumerationMutation(v34);
        -[NSDictionary objectForKeyedSubscript:](v58, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "decrementTransactionCount");

      }
      v35 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v59, v95, 16);
    }
    while (v35);
  }

  v39 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (v32 && !(v39 | v33))
  {
    -[PBFPosterRoleProcessor _fireDidCommitTransaction:](self, "_fireDidCommitTransaction:", v50);
    v40 = objc_alloc_init(_PBFPosterRoleProcessorTransactionResult);
    -[_PBFPosterRoleProcessorTransactionResult setAffectedRoles:](v40, "setAffectedRoles:", v52);
    -[_PBFPosterRoleProcessorTransactionResult setCollectionDiffsPerRole:](v40, "setCollectionDiffsPerRole:", v54);
    -[_PBFPosterRoleProcessorTransactionResult setPreCommitActivePosterConfigurationForRole:](v40, "setPreCommitActivePosterConfigurationForRole:", v56);
    -[_PBFPosterRoleProcessorTransactionResult setPostCommitActivePosterConfigurationForRole:](v40, "setPostCommitActivePosterConfigurationForRole:", v48);
    objc_msgSend(v50, "emittedEvents");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PBFPosterRoleProcessorTransactionResult setEmittedEvents:](v40, "setEmittedEvents:", v42);

    objc_msgSend(v50, "setResults:", v40);
    -[PBFPosterRoleProcessor _fireTransactionFinished:result:error:](self, "_fireTransactionFinished:result:error:", v50, v40, 0);
    BSAbsoluteMachTimeNow();
    v44 = v43;
    PBFLogDataStore();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v91 = 138543618;
      v92 = v30;
      v93 = 2048;
      v94 = v44 - v9;
      _os_log_impl(&dword_1CB9FA000, v45, OS_LOG_TYPE_DEFAULT, "(%{public}@} Fin; finished transaction successfully in %f",
        v91,
        0x16u);
    }

    v41 = 1;
  }
  else
  {
    if (!v39)
      v39 = v33;
    v40 = (_PBFPosterRoleProcessorTransactionResult *)(id)v39;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleProcessor _executeTransaction:block:error:].cold.1((uint64_t)v30, (uint64_t)v40, v29);
    -[PBFPosterRoleProcessor _fireTransactionFinished:result:error:](self, "_fireTransactionFinished:result:error:", v50, 0, v40);
    v41 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v41;
}

void __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v24;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v2);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v17 = v3;
        v18 = v2;
        objc_msgSend(v3, "configurationStoreCoordinatorsWithError:", 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v20 != v7)
                objc_enumerationMutation(v4);
              v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
              v10 = *(NSObject **)(a1 + 40);
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                v11 = *(_QWORD *)(a1 + 48);
                *(_DWORD *)buf = 138543618;
                v28 = v11;
                v29 = 2114;
                v30 = v9;
                _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@} Aborting staged changes for %{public}@", buf, 0x16u);
              }
              objc_msgSend(v9, "abortStaged");
            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
          }
          while (v6);
        }

        v12 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          v28 = v13;
          v29 = 2114;
          v30 = v17;
          _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@} Aborting staged changes for %{public}@", buf, 0x16u);
        }
        objc_msgSend(v17, "abortStaged");
        v2 = v18 + 1;
      }
      while (v18 + 1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v16);
  }

}

uint64_t __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke_135(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  NSObject *v47;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  const __CFString *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t n;
  void *v66;
  char v67;
  id v68;
  void *v69;
  NSObject *v70;
  int v71;
  NSObject *v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  void *v80;
  NSObject *v81;
  uint64_t v82;
  NSObject *v83;
  void *v84;
  int v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const __CFString *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *m;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  _BOOL4 v109;
  uint64_t v110;
  void *v111;
  void *v112;
  NSObject *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  id v125;
  id v126;
  id v127;
  id obj;
  id obja;
  char v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  id v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  id v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  id v164;
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  uint8_t buf[4];
  uint64_t v171;
  __int16 v172;
  void *v173;
  __int16 v174;
  id v175;
  __int16 v176;
  void *v177;
  _BYTE v178[128];
  _QWORD v179[2];
  _QWORD v180[2];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  const __CFString *v187;
  _QWORD v188[4];

  v188[1] = *MEMORY[0x1E0C80C00];
  v135 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_fireDidBeginTransaction:", *(_QWORD *)(a1 + 40));
  v3 = *(NSObject **)(a1 + 48);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543362;
    v171 = v4;
    _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executing transaction", buf, 0xCu);
  }
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 128) + 16))();
  v6 = objc_msgSend(*(id *)(a1 + 40), "isInvalidated");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v10 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      v171 = v11;
      _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@} Finalizing Changes for transaction", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_fireWillFinalizeTransaction:", *(_QWORD *)(a1 + 40));
    v168 = 0u;
    v169 = 0u;
    v166 = 0u;
    v167 = 0u;
    objc_msgSend(*(id *)(a1 + 64), "objectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v186, 16);
    v136 = a1;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v167;
      v132 = *(_QWORD *)v167;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v167 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
          v165 = 0;
          v164 = 0;
          v17 = objc_msgSend(v16, "finalizeChangesWithChangeHandler:outEvents:error:", v135, &v165, &v164);
          v18 = v165;
          v19 = v164;
          v20 = v19;
          if ((v17 & 1) == 0)
          {
            v121 = *(_QWORD *)(*(_QWORD *)(v136 + 144) + 8);
            v21 = *(id *)(v121 + 40);
            *(_QWORD *)(v121 + 40) = v19;
            v53 = v19;
LABEL_52:

            goto LABEL_57;
          }
          v162 = 0u;
          v163 = 0u;
          v160 = 0u;
          v161 = 0u;
          v21 = v18;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v160, v185, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v161;
            while (2)
            {
              v25 = 0;
              v26 = v20;
              do
              {
                if (*(_QWORD *)v161 != v24)
                  objc_enumerationMutation(v21);
                v27 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * v25);
                v28 = *(void **)(v136 + 32);
                v29 = *(_QWORD *)(v136 + 40);
                v159 = 0;
                v30 = objc_msgSend(v28, "_processEvent:changeHandler:recursiveDepth:transaction:error:", v27, v135, 1, v29, &v159);
                v20 = v159;

                if ((v30 & 1) == 0)
                {
                  v51 = *(_QWORD *)(*(_QWORD *)(v136 + 144) + 8);
                  v52 = *(void **)(v51 + 40);
                  *(_QWORD *)(v51 + 40) = v20;
                  v53 = v20;

                  goto LABEL_52;
                }
                ++v25;
                v26 = v20;
              }
              while (v23 != v25);
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v160, v185, 16);
              if (v23)
                continue;
              break;
            }
          }

          a1 = v136;
          v14 = v132;
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v186, 16);
        if (v13)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "_fireDidFinalizeTransaction:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_fireWillCommitTransaction:", *(_QWORD *)(a1 + 40));
    v31 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      v171 = v32;
      _os_log_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_DEFAULT, "(%{public}@} Transaction finished executing; attempting to commit staged changes.",
        buf,
        0xCu);
    }
    obj = (id)objc_opt_new();
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v33 = *(id *)(a1 + 72);
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v155, v184, 16);
    if (v34)
    {
      v35 = v34;
      v133 = *(_QWORD *)v156;
      v130 = 1;
      v126 = v33;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v156 != v133)
            objc_enumerationMutation(v126);
          v37 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * j);
          v151 = 0u;
          v152 = 0u;
          v153 = 0u;
          v154 = 0u;
          objc_msgSend(v37, "configurationStoreCoordinatorsWithError:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v151, v183, 16);
          if (v39)
          {
            v40 = v39;
            v41 = 0;
            v42 = *(_QWORD *)v152;
            while (2)
            {
              v43 = 0;
              v44 = v41;
              do
              {
                if (*(_QWORD *)v152 != v42)
                  objc_enumerationMutation(v38);
                v45 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * v43);
                v150 = 0;
                v46 = objc_msgSend(v45, "commitStagedWithError:", &v150);
                v41 = v150;

                if ((v46 & 1) == 0)
                {
                  objc_msgSend(obj, "addObject:", v41);
                  a1 = v136;
                  v47 = *(NSObject **)(v136 + 48);
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  {
                    v48 = *(_QWORD *)(v136 + 56);
                    *(_DWORD *)buf = 138543874;
                    v171 = v48;
                    v172 = 2114;
                    v173 = v45;
                    v174 = 2114;
                    v175 = v41;
                    _os_log_error_impl(&dword_1CB9FA000, v47, OS_LOG_TYPE_ERROR, "(%{public}@} Error committing staged changes for csc %{public}@: %{public}@", buf, 0x20u);
                  }
                  v130 = 0;
                  goto LABEL_46;
                }
                ++v43;
                v44 = v41;
              }
              while (v40 != v43);
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v151, v183, 16);
              if (v40)
                continue;
              break;
            }
            a1 = v136;
LABEL_46:

          }
        }
        v35 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v155, v184, 16);
      }
      while (v35);

      if ((v130 & 1) == 0)
      {
        v49 = 1;
        v50 = 1;
LABEL_74:
        if (objc_msgSend(obj, "count"))
          v71 = 1;
        else
          v71 = v49;
        v72 = *(NSObject **)(a1 + 48);
        v123 = v50 | v71;
        if ((v50 | v71) == 1)
        {
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke_135_cold_1(a1, (uint64_t)obj, v72);
          v73 = *(NSObject **)(a1 + 48);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            v74 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 138543362;
            v171 = v74;
            _os_log_impl(&dword_1CB9FA000, v73, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executing revert of changes for events:", buf, 0xCu);
          }
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          objc_msgSend(*(id *)(a1 + 40), "emittedEvents");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v141, v181, 16);
          if (v76)
          {
            v77 = v76;
            v78 = *(_QWORD *)v142;
            do
            {
              for (k = 0; k != v77; ++k)
              {
                if (*(_QWORD *)v142 != v78)
                  objc_enumerationMutation(v75);
                v80 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * k);
                v81 = *(NSObject **)(v136 + 48);
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  v82 = *(_QWORD *)(v136 + 56);
                  v83 = v81;
                  objc_msgSend(v80, "originatingRoleCoordinatorChange");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v171 = v82;
                  v172 = 2114;
                  v173 = v80;
                  v174 = 2114;
                  v175 = v84;
                  _os_log_impl(&dword_1CB9FA000, v83, OS_LOG_TYPE_DEFAULT, "(%{public}@} Reverting event: %{public}@; origin change: %{public}@",
                    buf,
                    0x20u);

                }
                if (objc_msgSend(v80, "couldRevert"))
                {
                  v85 = objc_msgSend(v80, "revert");
                  v86 = *(NSObject **)(v136 + 48);
                  if (v85)
                  {
                    if (os_log_type_enabled(*(os_log_t *)(v136 + 48), OS_LOG_TYPE_DEFAULT))
                    {
                      v87 = *(_QWORD *)(v136 + 56);
                      *(_DWORD *)buf = 138543618;
                      v171 = v87;
                      v172 = 2114;
                      v173 = v80;
                      _os_log_impl(&dword_1CB9FA000, v86, OS_LOG_TYPE_DEFAULT, "(%{public}@} Reverted %{public}@", buf, 0x16u);
                    }
                  }
                  else if (os_log_type_enabled(*(os_log_t *)(v136 + 48), OS_LOG_TYPE_ERROR))
                  {
                    v88 = *(_QWORD *)(v136 + 56);
                    *(_DWORD *)buf = 138543618;
                    v171 = v88;
                    v172 = 2114;
                    v173 = v80;
                    _os_log_error_impl(&dword_1CB9FA000, v86, OS_LOG_TYPE_ERROR, "(%{public}@} Unable to revert %{public}@", buf, 0x16u);
                  }
                }
              }
              v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v141, v181, 16);
            }
            while (v77);
          }

          v89 = (void *)MEMORY[0x1E0CB35C8];
          v90 = CFSTR("(null tx identifier)");
          if (*(_QWORD *)(v136 + 56))
            v90 = *(const __CFString **)(v136 + 56);
          v91 = *MEMORY[0x1E0CB2F70];
          v179[0] = CFSTR("txIdentifier");
          v179[1] = v91;
          v180[0] = v90;
          v180[1] = obj;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v180, v179, 2);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "pbf_generalErrorWithCode:userInfo:", 8, v92);
          v93 = objc_claimAutoreleasedReturnValue();
          v94 = *(_QWORD *)(*(_QWORD *)(v136 + 144) + 8);
          v95 = *(void **)(v94 + 40);
          *(_QWORD *)(v94 + 40) = v93;

          (*(void (**)(void))(*(_QWORD *)(v136 + 136) + 16))();
        }
        else
        {
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            v96 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 138543362;
            v171 = v96;
            _os_log_impl(&dword_1CB9FA000, v72, OS_LOG_TYPE_DEFAULT, "(%{public}@ Data store has committed changes w/ no errors; building results",
              buf,
              0xCu);
          }
          v97 = *(void **)(a1 + 80);
          objc_msgSend(*(id *)(a1 + 40), "affectedRoles");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "unionSet:", v98);

          v139 = 0u;
          v140 = 0u;
          v137 = 0u;
          v138 = 0u;
          v125 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
          v127 = (id)objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v137, v178, 16);
          if (v127)
          {
            v99 = *(_QWORD *)v138;
            v124 = *(_QWORD *)v138;
            do
            {
              for (m = 0; m != v127; m = (char *)m + 1)
              {
                if (*(_QWORD *)v138 != v99)
                  objc_enumerationMutation(v125);
                v101 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)m);
                objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v101);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 88), "objectForKey:", v101);
                v103 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "buildNewPosterCollectionFromStorage:", v135);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAB8]), "initWithCollection:newCollection:", v103, v104);
                objc_msgSend(*(id *)(a1 + 96), "setObject:forKey:");
                objc_msgSend(*(id *)(a1 + 104), "objectForKeyedSubscript:", v101);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 112), "pbf_desiredActiveConfigurationForRole:", v101);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                v134 = (void *)v103;
                if ((v106
                   && (objc_msgSend(v104, "posterWithUUID:", v106),
                       (v107 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
                   || (objc_msgSend(v102, "determineActivePosterConfigurationForStorage:context:", v135, *(_QWORD *)(a1 + 112)), (v107 = (void *)objc_claimAutoreleasedReturnValue()) != 0))&& (objc_msgSend(v107, "isEqual:", v105) & 1) == 0)
                {
                  +[PBFPosterDataStoreEventBuilder posterActivated:previous:](PBFPosterDataStoreEventBuilder, "posterActivated:previous:", v107, v105);
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v111, "buildWithError:", 0);
                  v112 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v112)
                  {
                    v113 = *(NSObject **)(a1 + 48);
                    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                    {
                      v114 = *(_QWORD *)(a1 + 56);
                      *(_DWORD *)buf = 138544130;
                      v171 = v114;
                      v172 = 2114;
                      v173 = v101;
                      v174 = 2114;
                      v175 = v105;
                      v176 = 2114;
                      v177 = v107;
                      _os_log_impl(&dword_1CB9FA000, v113, OS_LOG_TYPE_DEFAULT, "(%{public}@ Active poster configuration updated for role '%{public}@' from %{public}@ -> %{public}@", buf, 0x2Au);
                    }
                    objc_msgSend(*(id *)(a1 + 32), "_processEvent:changeHandler:recursiveDepth:transaction:error:", v112, v135, 0, *(_QWORD *)(a1 + 40), 0);
                    v115 = *(void **)(a1 + 80);
                    objc_msgSend(*(id *)(a1 + 40), "affectedRoles");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v115, "unionSet:", v116);

                    a1 = v136;
                  }
                  objc_msgSend(*(id *)(a1 + 120), "setObject:forKeyedSubscript:", v107, v101);

                  v99 = v124;
                }
                else
                {
                  v108 = *(NSObject **)(a1 + 48);
                  v109 = os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT);
                  if (v105)
                  {
                    if (v109)
                    {
                      v110 = *(_QWORD *)(a1 + 56);
                      *(_DWORD *)buf = 138543874;
                      v171 = v110;
                      v172 = 2114;
                      v173 = v101;
                      v174 = 2114;
                      v175 = v105;
                      _os_log_impl(&dword_1CB9FA000, v108, OS_LOG_TYPE_DEFAULT, "(%{public}@ Active poster configuration stays the same for role '%{public}@': %{public}@", buf, 0x20u);
                    }
                    objc_msgSend(*(id *)(a1 + 120), "setObject:forKeyedSubscript:", v105, v101);
                  }
                  else if (v109)
                  {
                    v117 = *(_QWORD *)(a1 + 56);
                    *(_DWORD *)buf = 138543874;
                    v171 = v117;
                    v172 = 2114;
                    v173 = v101;
                    v174 = 2114;
                    v175 = 0;
                    _os_log_impl(&dword_1CB9FA000, v108, OS_LOG_TYPE_DEFAULT, "(%{public}@ Active poster configuration for role '%{public}@' is invalid: %{public}@", buf, 0x20u);
                  }
                }

              }
              v127 = (id)objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v137, v178, 16);
            }
            while (v127);
          }

          v118 = *(NSObject **)(a1 + 48);
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
          {
            v119 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 138543362;
            v171 = v119;
            _os_log_impl(&dword_1CB9FA000, v118, OS_LOG_TYPE_DEFAULT, "(%{public}@ Successfully performed changes and committed staged changes.", buf, 0xCu);
          }
        }
        v9 = v123 ^ 1u;
        goto LABEL_127;
      }
    }
    else
    {

    }
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    v61 = *(id *)(a1 + 72);
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v146, v182, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v147;
      while (2)
      {
        for (n = 0; n != v63; ++n)
        {
          if (*(_QWORD *)v147 != v64)
            objc_enumerationMutation(v61);
          v66 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * n);
          v145 = 0;
          v67 = objc_msgSend(v66, "commitStagedWithError:", &v145);
          v68 = v145;
          v69 = v68;
          if ((v67 & 1) == 0)
          {
            objc_msgSend(obj, "addObject:", v68);
            a1 = v136;
            v70 = *(NSObject **)(v136 + 48);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              v122 = *(_QWORD *)(v136 + 56);
              *(_DWORD *)buf = 138543874;
              v171 = v122;
              v172 = 2114;
              v173 = v66;
              v174 = 2114;
              v175 = v69;
              _os_log_error_impl(&dword_1CB9FA000, v70, OS_LOG_TYPE_ERROR, "(%{public}@} Error committing staged changes for esc %{public}@: %{public}@", buf, 0x20u);
            }

            v50 = 1;
            goto LABEL_73;
          }

        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v146, v182, 16);
        if (v63)
          continue;
        break;
      }
      v50 = 0;
      a1 = v136;
    }
    else
    {
      v50 = 0;
    }
LABEL_73:

    v49 = 0;
    goto LABEL_74;
  }
  v8 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 136) + 16))();
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40))
  {
    v54 = (void *)MEMORY[0x1E0CB35C8];
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 0, 0);
      v59 = objc_claimAutoreleasedReturnValue();
      v9 = 0;
      v60 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
      obja = *(id *)(v60 + 40);
      *(_QWORD *)(v60 + 40) = v59;

      goto LABEL_128;
    }
    v55 = CFSTR("(null tx identifier)");
    if (*(_QWORD *)(a1 + 56))
      v55 = *(const __CFString **)(a1 + 56);
    v187 = CFSTR("txIdentifier");
    v188[0] = v55;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v188, &v187, 1);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "pbf_generalErrorWithCode:userInfo:", 3);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
    v58 = *(void **)(v57 + 40);
    *(_QWORD *)(v57 + 40) = v56;

LABEL_57:
    v9 = 0;
LABEL_127:

    goto LABEL_128;
  }
  v9 = 0;
LABEL_128:

  return v9;
}

- (BOOL)_executeChange:(id)a3 roleCoordinator:(id)a4 changeHandler:(id)a5 recursiveDepth:(unint64_t)a6 transaction:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t i;
  void *v31;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  _BYTE v42[128];
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v18 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  -[PBFPosterRoleProcessor _fireWillExecuteChange:transaction:](self, "_fireWillExecuteChange:transaction:", v14, v17);
  if (!objc_msgSend(v17, "isInvalidated"))
  {
    v39 = 0;
    v21 = objc_msgSend(v15, "updateCoordinatorWithChange:changeHandler:emitEvents:error:", v14, v16, &v39, a8);
    v22 = v39;
    if (v21)
    {
      objc_msgSend(v17, "affectedRoles");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v15;
      objc_msgSend(v15, "role");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v24);

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v34 = v22;
      v25 = v22;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v36;
        v29 = a6 + 1;
        while (2)
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v36 != v28)
              objc_enumerationMutation(v25);
            if (!-[PBFPosterRoleProcessor _processEvent:changeHandler:recursiveDepth:transaction:error:](self, "_processEvent:changeHandler:recursiveDepth:transaction:error:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), v16, v29, v17, a8))
            {
              v15 = v33;
              v22 = v34;
              goto LABEL_20;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
          if (v27)
            continue;
          break;
        }
      }

      -[PBFPosterRoleProcessor _fireDidExecuteChange:transaction:](self, "_fireDidExecuteChange:transaction:", v14, v17);
      if (!objc_msgSend(v17, "isInvalidated"))
      {
        v18 = 1;
        v15 = v33;
        v22 = v34;
        goto LABEL_22;
      }
      v22 = v34;
      if (!a8)
      {
        v18 = 0;
        v15 = v33;
        goto LABEL_22;
      }
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D68];
      v41 = CFSTR("transaction invalidated");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 3, v25);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v33;
LABEL_20:

    }
    v18 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (a8)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D68];
    v44[0] = CFSTR("transaction invalidated");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pbf_generalErrorWithCode:userInfo:", 3, v20);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v18 = 0;
LABEL_23:

  return v18;
}

- (BOOL)_processEvent:(id)a3 changeHandler:(id)a4 recursiveDepth:(unint64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSArray *roleCoordinators;
  id v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  char v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  id obj;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  id v61;
  BOOL v62;
  uint64_t v63;
  const __CFString *v64;
  uint8_t v65[128];
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v49 = a4;
  v13 = a6;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v13, "appendEmittedEvent:", v12);
    -[PBFPosterRoleProcessor _fireWillEvaluateEvent:transaction:](self, "_fireWillEvaluateEvent:transaction:", v12, v13);
    if (objc_msgSend(v13, "isInvalidated"))
    {
      if (a7)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v73 = *MEMORY[0x1E0CB2D68];
        v74[0] = CFSTR("transaction invalidated");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pbf_generalErrorWithCode:userInfo:", 3, v16);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v14 = 0;
    }
    else
    {
      objc_msgSend(v13, "shortIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      -[PBFPosterRoleProcessor log](self, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v67 = v17;
        v68 = 2114;
        v69 = v12;
        _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@} Processing event: %{public}@", buf, 0x16u);
      }
      objc_msgSend(v13, "affectedRoles");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v19, "count");
      v46 = v18;

      roleCoordinators = self->_roleCoordinators;
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __87__PBFPosterRoleProcessor__processEvent_changeHandler_recursiveDepth_transaction_error___block_invoke;
      v59[3] = &unk_1E86F7408;
      v62 = v41 != 0;
      v21 = v13;
      v60 = v21;
      v43 = v12;
      v61 = v43;
      -[NSArray bs_filter:](roleCoordinators, "bs_filter:", v59);
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
      v42 = (void *)v17;
      if (v44)
      {
        v45 = *(_QWORD *)v56;
        v22 = a5 + 1;
        v39 = v13;
        v40 = v12;
        do
        {
          v23 = 0;
          v24 = v43;
          do
          {
            if (*(_QWORD *)v56 != v45)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v23);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v67 = v17;
              v68 = 2114;
              v69 = v24;
              v70 = 2114;
              v71 = v25;
              _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@} Issuing event %{public}@ to %{public}@", buf, 0x20u);
            }
            v54 = 0;
            v26 = objc_msgSend(v25, "notifyEventWasReceived:changes:storage:", v24, &v54, v49);
            v27 = v54;
            v47 = v27;
            if ((v26 & 1) != 0)
            {
              if (!v41)
              {
                v28 = v27;
                objc_msgSend(v21, "affectedRoles");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "role");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "addObject:", v30);

                v27 = v28;
              }
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              v31 = v27;
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
              if (v32)
              {
                v33 = v32;
                v34 = *(_QWORD *)v51;
                while (2)
                {
                  for (i = 0; i != v33; ++i)
                  {
                    if (*(_QWORD *)v51 != v34)
                      objc_enumerationMutation(v31);
                    if (!-[PBFPosterRoleProcessor _executeChange:roleCoordinator:changeHandler:recursiveDepth:transaction:error:](self, "_executeChange:roleCoordinator:changeHandler:recursiveDepth:transaction:error:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i), v25, v49, v22, v21, a7))
                    {

                      v37 = obj;
                      v13 = v39;
                      v12 = v40;
                      v18 = v46;
                      goto LABEL_36;
                    }
                  }
                  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
                  if (v33)
                    continue;
                  break;
                }
              }

              v17 = (uint64_t)v42;
              v24 = v43;
              v18 = v46;
            }
            else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v67 = v17;
              v68 = 2114;
              v69 = v24;
              v70 = 2114;
              v71 = v25;
              _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@} Event %{public}@ was not handled by role coordinator %{public}@; continuing",
                buf,
                0x20u);
            }

            ++v23;
          }
          while (v23 != v44);
          v13 = v39;
          v12 = v40;
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
        }
        while (v44);
      }

      -[PBFPosterRoleProcessor _fireDidEvaluateEvent:transaction:](self, "_fireDidEvaluateEvent:transaction:", v43, v21);
      if (objc_msgSend(v21, "isInvalidated"))
      {
        if (a7)
        {
          v36 = (void *)MEMORY[0x1E0CB35C8];
          v63 = *MEMORY[0x1E0CB2D68];
          v64 = CFSTR("transaction invalidated");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "pbf_generalErrorWithCode:userInfo:", 3, v37);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

        }
        v14 = 0;
      }
      else
      {
        v14 = 1;
      }

    }
  }

  return v14;
}

uint64_t __87__PBFPosterRoleProcessor__processEvent_changeHandler_recursiveDepth_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48)
    && (objc_msgSend(*(id *)(a1 + 32), "affectedRoles"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "role"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "containsObject:", v5),
        v5,
        v4,
        !v6))
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v3, "validateEventIsRelevant:", *(_QWORD *)(a1 + 40));
  }

  return v7;
}

- (void)_fireWillBeginTransaction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "roleProcessor:willBeginTransaction:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_fireDidBeginTransaction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "roleProcessor:didBeginTransaction:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_fireWillExecuteChange:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v7, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "roleProcessor:willExecuteChange:transaction:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_fireDidExecuteChange:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v7, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "roleProcessor:didExecuteChange:transaction:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_fireWillEvaluateEvent:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v7, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "roleProcessor:willEvaluateEvent:transaction:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_fireDidEvaluateEvent:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v7, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "roleProcessor:didEvaluateEvent:transaction:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_fireWillFinalizeTransaction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "roleProcessor:willFinalizeTransaction:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_fireDidFinalizeTransaction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "roleProcessor:didFinalizeTransaction:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_fireWillCommitTransaction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "roleProcessor:willCommitTransaction:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_fireDidCommitTransaction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "roleProcessor:didCommitTransaction:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_fireTransactionFinished:(id)a3 result:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v17 = a4;
  v9 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v8, "observers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    if (v9)
      v14 = 0;
    else
      v14 = v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "roleProcessor:transactionFinished:success:results:error:", self, v8, v9 == 0, v14, v9);
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  objc_msgSend(v8, "cancel");
  -[PBFPosterRoleProcessor _resetRoleCoordinatorTransaction](self, "_resetRoleCoordinatorTransaction");

}

- (void)_fireWasInvalidated:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "roleProcessorWasInvalidated:", self);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "cancel");
  -[PBFPosterRoleProcessor _resetRoleCoordinatorTransaction](self, "_resetRoleCoordinatorTransaction");

}

- (void)_resetRoleCoordinatorTransaction
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_roleCoordinators;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "finalizeTransactionCount", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)invalidate
{
  _PBFPosterRoleProcessorTransaction *activeTransaction;
  PBFPosterRoleProcessor *obj;

  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    obj = self;
    objc_sync_enter(obj);
    -[_PBFPosterRoleProcessorTransaction invalidate](obj->_activeTransaction, "invalidate");
    activeTransaction = obj->_activeTransaction;
    obj->_activeTransaction = 0;

    objc_sync_exit(obj);
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  self->_log = (OS_os_log *)a3;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (PBFPosterExtensionDataStorage)dataStorage
{
  return (PBFPosterExtensionDataStorage *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)roleCoordinators
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleCoordinators, 0);
  objc_storeStrong((id *)&self->_dataStorage, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_roleToRoleCoordinator, 0);
  objc_storeStrong((id *)&self->_roleOrderedSet, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
}

- (void)initWithDataStorage:roleCoordinators:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDataStorage:roleCoordinators:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDataStorage:roleCoordinators:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)processChanges:context:reason:userInfo:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)processChanges:context:reason:userInfo:error:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __71__PBFPosterRoleProcessor_processChanges_context_reason_userInfo_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "(%{public}@} Failed to execute changes w/ error: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)processEvents:context:reason:userInfo:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)processEvents:context:reason:userInfo:error:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __70__PBFPosterRoleProcessor_processEvents_context_reason_userInfo_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "(%{public}@} Failed to process events w/ error: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_executeTransaction:(uint64_t)a1 block:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, a2, a3, "(%{public}@} Failed to execute transaction: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_7();
}

void __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke_135_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 56);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, a2, a3, "(%{public}@} Error committing changes: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_7();
}

@end

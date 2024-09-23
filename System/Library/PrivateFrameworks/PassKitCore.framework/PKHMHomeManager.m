@implementation PKHMHomeManager

- (PKHMHomeManager)init
{
  PKHMHomeManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *timerQueue;
  void *v5;
  uint64_t v6;
  HMHomeManager *manager;
  HMHomeManager *v8;
  NSObject *v9;
  PKHMHomeManager *v10;
  NSObject *v11;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKHMHomeManager;
  v2 = -[PKHMHomeManager init](&v14, sel_init);
  if (!v2)
  {
LABEL_6:
    v10 = v2;
    goto LABEL_10;
  }
  v3 = dispatch_queue_create("PKHMHomeManagerTimerQueue", 0);
  timerQueue = v2->_timerQueue;
  v2->_timerQueue = (OS_dispatch_queue *)v3;

  v5 = (void *)objc_msgSend(objc_alloc(_MergedGlobals_180()), "initWithOptions:cachePolicy:", 524, 0);
  objc_msgSend(v5, "setAdaptive:", 1);
  v6 = objc_msgSend(objc_alloc((Class)off_1ECF21BC0()), "initWithConfiguration:", v5);
  manager = v2->_manager;
  v2->_manager = (HMHomeManager *)v6;

  v8 = v2->_manager;
  if (v8)
  {
    -[HMHomeManager setDelegate:](v8, "setDelegate:", v2);
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager initalizing HMHomeManager", v13, 2u);
    }

    goto LABEL_6;
  }
  PKLogFacilityTypeGetObject(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager unable to create HMHomeManager", v13, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (void)fetchHomesWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  os_unfair_lock_s *p_lock;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *fetchCompletions;
  OS_dispatch_source *v9;
  OS_dispatch_source *fetchTimeout;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  NSMutableArray *v14;
  void *v15;
  _QWORD handler[5];

  v4 = (void (**)(id, void *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didLoadData)
  {
    -[HMHomeManager homes](self->_manager, "homes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    if (v4)
      v4[2](v4, v6);

  }
  else
  {
    if (!self->_fetchCompletions)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      fetchCompletions = self->_fetchCompletions;
      self->_fetchCompletions = v7;

      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_timerQueue);
      fetchTimeout = self->_fetchTimeout;
      self->_fetchTimeout = v9;

      v11 = self->_fetchTimeout;
      v12 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      v13 = self->_fetchTimeout;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __44__PKHMHomeManager_fetchHomesWithCompletion___block_invoke;
      handler[3] = &unk_1E2ABE120;
      handler[4] = self;
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume((dispatch_object_t)self->_fetchTimeout);
    }
    if (v4)
    {
      v14 = self->_fetchCompletions;
      v15 = _Block_copy(v4);
      -[NSMutableArray addObject:](v14, "addObject:", v15);

    }
    os_unfair_lock_unlock(p_lock);
  }

}

uint64_t __44__PKHMHomeManager_fetchHomesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager timed out waiting on HMHomeManager to load", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "homeManagerDidUpdateHomes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)fetchHomeIdentifierForPassSerialNumber:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  os_unfair_lock_s *p_lock;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_didLoadData)
    {
      -[HMHomeManager homes](self->_manager, "homes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(p_lock);
      if (v8)
      {
        __73__PKHMHomeManager_fetchHomeIdentifierForPassSerialNumber_withCompletion___block_invoke(v11, v10, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v8)[2](v8, v12);

      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __73__PKHMHomeManager_fetchHomeIdentifierForPassSerialNumber_withCompletion___block_invoke_14;
      v13[3] = &unk_1E2AD6DC0;
      v15 = v8;
      v16 = &__block_literal_global_170;
      v14 = v6;
      -[PKHMHomeManager fetchHomesWithCompletion:](self, "fetchHomesWithCompletion:", v13);

    }
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

id __73__PKHMHomeManager_fetchHomeIdentifierForPassSerialNumber_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if ((PKHomeKitSimulatedLockCompatibilityMode() & 1) != 0)
          goto LABEL_17;
        objc_msgSend(v10, "walletKeyPassSerialNumber", (_QWORD)v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v5;
        v13 = v11;
        if (v13 == v12)
        {

LABEL_17:
          v7 = v10;
          goto LABEL_18;
        }
        v14 = v13;
        if (v5 && v13)
        {
          v15 = objc_msgSend(v12, "isEqualToString:", v13);

          if ((v15 & 1) != 0)
            goto LABEL_17;
        }
        else
        {

        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_18:

  objc_msgSend(v7, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = CFSTR("Found");
    *(_DWORD *)buf = 138412802;
    if (!v7)
      v18 = CFSTR("Did not find");
    v27 = v18;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ home %@ with pass serial number: %@", buf, 0x20u);
  }

  if (v7)
    v19 = v16;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

void __73__PKHMHomeManager_fetchHomeIdentifierForPassSerialNumber_withCompletion___block_invoke_14(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = a1[5];
  if (v2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a2, a1[4]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)fetchLockAccessoryWithTerminalReaderIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  id v9;
  void (**v10)(void *, void *);
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(void *, void *);
  void (**v16)(id, void *);
  _QWORD aBlock[4];
  id v18;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PKHMHomeManager_fetchLockAccessoryWithTerminalReaderIdentifier_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2AD6DE8;
  v9 = v6;
  v18 = v9;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didLoadData)
  {
    -[HMHomeManager homes](self->_manager, "homes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
    if (v7)
      v7[2](v7, v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __81__PKHMHomeManager_fetchLockAccessoryWithTerminalReaderIdentifier_withCompletion___block_invoke_18;
    v14[3] = &unk_1E2AC6C88;
    v15 = v10;
    v16 = v7;
    -[PKHMHomeManager fetchHomesWithCompletion:](self, "fetchHomesWithCompletion:", v14);

    v13 = v15;
  }

}

PKHMAccessory *__81__PKHMHomeManager_fetchLockAccessoryWithTerminalReaderIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  PKHMAccessory *v24;
  void *v25;
  void *v26;
  PKHMAccessory *v27;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v3)
  {
    v4 = v3;
    v30 = *(_QWORD *)v36;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v5), "accessories");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v32;
          while (2)
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v32 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
              if (PKHomeKitSimulatedLockCompatibilityMode())
              {
                FindLockCharacteristicInAccessory(v12);
                v15 = objc_claimAutoreleasedReturnValue();
                if (v15)
                {
                  v18 = (void *)v15;
                  v19 = v12;

                  goto LABEL_20;
                }
              }
              else
              {
                objc_msgSend(v12, "readerIDACWG");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v13, "isEqualToData:", *(_QWORD *)(a1 + 32));

                if (v14)
                {
                  v17 = v12;
LABEL_20:

                  if (v12)
                    goto LABEL_24;
                  goto LABEL_21;
                }
              }
              ++v11;
            }
            while (v9 != v11);
            v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
            v9 = v16;
            if (v16)
              continue;
            break;
          }
        }

LABEL_21:
        ++v5;
      }
      while (v5 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v4);
  }
  v12 = 0;
LABEL_24:

  PKLogFacilityTypeGetObject(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (v12)
      v21 = CFSTR("Found");
    else
      v21 = CFSTR("Did not find");
    objc_msgSend(v12, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v40 = v21;
    v41 = 2112;
    v42 = v22;
    v43 = 2112;
    v44 = v23;
    _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ lock accessory with identifier: %@ (name: %@)", buf, 0x20u);

  }
  if (v12)
  {
    v24 = [PKHMAccessory alloc];
    objc_msgSend(v12, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PKHMAccessory initWithUniqueIdentifier:name:](v24, "initWithUniqueIdentifier:name:", v25, v26);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

void __81__PKHMHomeManager_fetchLockAccessoryWithTerminalReaderIdentifier_withCompletion___block_invoke_18(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (void)setLockStateToSecuredForLockAccessory:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(void *, void *);
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  void (**v17)(void *, void *);
  _QWORD aBlock[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_21;
  aBlock[3] = &unk_1E2AD6E78;
  v9 = v7;
  aBlock[4] = self;
  v19 = v9;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didLoadData)
  {
    -[HMHomeManager homes](self->_manager, "homes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke((uint64_t)v12, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
    v10[2](v10, v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_35;
    v14[3] = &unk_1E2AC6F90;
    v16 = &__block_literal_global_20_3;
    v15 = v6;
    v17 = v10;
    -[PKHMHomeManager fetchHomesWithCompletion:](self, "fetchHomesWithCompletion:", v14);

    v13 = v16;
  }

}

id __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a2;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v2)
  {
    v3 = v2;
    v22 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "accessories");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v6 = v5;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v24;
LABEL_8:
          v10 = 0;
          while (1)
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
            objc_msgSend(v11, "uniqueIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "uniqueIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "hmf_isEqualToUUID:", v13);

            if ((v14 & 1) != 0)
              break;
            if (v8 == ++v10)
            {
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
              if (v8)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v15 = v11;

          if (v15)
            goto LABEL_19;
        }
        else
        {
LABEL_14:

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    }
    while (v3);
  }
  v15 = 0;
LABEL_19:

  PKLogFacilityTypeGetObject(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v15)
      v17 = CFSTR("Found");
    else
      v17 = CFSTR("Did not find");
    objc_msgSend(v15, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = v17;
    v33 = 2112;
    v34 = v18;
    v35 = 2112;
    v36 = v19;
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ lock accessory with identifier: %@ (name: %@)", buf, 0x20u);

  }
  return v15;
}

void __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  FindLockCharacteristicInAccessory(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v6 = CFSTR("Found");
    else
      v6 = CFSTR("Did not find");
    objc_msgSend(v3, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ lock characteristic for accessory: %@", buf, 0x16u);

  }
  if (v4)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_23;
    v16[3] = &unk_1E2AD6E50;
    v16[4] = v4;
    v17 = v3;
    v8 = *(id *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 32);
    v19 = v8;
    objc_msgSend(v4, "writeValue:completionHandler:", &unk_1E2C3F3B8, v16);

  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Failed to find HMCharacteristicTypeTargetLockMechanismState for accessory %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 40);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);

  }
}

void __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v5 = CFSTR("Unsuccessfully");
    else
      v5 = CFSTR("Successfully");
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ wrote characteristic %@ for accessory: %@", (uint8_t *)&v9, 0x20u);

  }
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

void __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_35(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)hasHomeAccessScheduleForPassSerialNumber:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  os_unfair_lock_s *p_lock;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  __CFString *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  id v17;
  __CFString *v18;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_didLoadData)
    {
      -[HMHomeManager homes](self->_manager, "homes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(p_lock);
      if (v8)
      {
        v18 = 0;
        v12 = __75__PKHMHomeManager_hasHomeAccessScheduleForPassSerialNumber_withCompletion___block_invoke(v11, v10, v6, (const __CFString **)&v18);
        v13 = v18;
        ((void (**)(_QWORD, _BOOL8, __CFString *))v8)[2](v8, v12, v13);

      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __75__PKHMHomeManager_hasHomeAccessScheduleForPassSerialNumber_withCompletion___block_invoke_42;
      v14[3] = &unk_1E2AD6DC0;
      v16 = v8;
      v17 = &__block_literal_global_37_3;
      v15 = v6;
      -[PKHMHomeManager fetchHomesWithCompletion:](self, "fetchHomesWithCompletion:", v14);

      v10 = v16;
    }

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

BOOL __75__PKHMHomeManager_hasHomeAccessScheduleForPassSerialNumber_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, const __CFString **a4)
{
  void *v4;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  __CFString *v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  const __CFString *v28;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a4)
  {
    __break(1u);
    goto LABEL_33;
  }
  v4 = v8;
  *a4 = 0;
  if (PKHomeKitSimulatedLockCompatibilityMode())
  {
LABEL_33:
    objc_msgSend(v7, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "uniqueIdentifier");
    *a4 = (const __CFString *)(id)objc_claimAutoreleasedReturnValue();
    v27 = v30 != 0;

    goto LABEL_31;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v31 = v7;
  v9 = v7;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "walletKeyPassSerialNumber");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v4;
        v16 = v14;
        if (v16 == v15)
        {

LABEL_18:
          v10 = v13;
          goto LABEL_19;
        }
        v17 = v16;
        if (v4 && v16)
        {
          v18 = objc_msgSend(v15, "isEqualToString:", v16);

          if (v18)
            goto LABEL_18;
        }
        else
        {

        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_19:

  objc_msgSend(v10, "uniqueIdentifier");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = CFSTR("Found");
    *(_DWORD *)buf = 138412802;
    if (!v10)
      v21 = CFSTR("Did not find");
    v37 = v21;
    v38 = 2112;
    v39 = v19;
    v40 = 2112;
    v41 = v4;
    _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ home %@ with pass serial number: %@", buf, 0x20u);
  }

  if (v10)
  {
    v22 = objc_retainAutorelease(v19);
    *a4 = v22;
    objc_msgSend(v10, "currentUser");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeAccessControlForUser:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "restrictedGuestAccessSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "guestAccessSchedule");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 != 0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v28 = CFSTR("does not have");
      if (v26)
        v28 = CFSTR("has");
      *(_DWORD *)buf = 138412546;
      v37 = v22;
      v38 = 2112;
      v39 = v28;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: Home %@ %@ access schedule", buf, 0x16u);
    }

  }
  else
  {
    v27 = 0;
  }

  v7 = v31;
LABEL_31:

  return v27;
}

void __75__PKHMHomeManager_hasHomeAccessScheduleForPassSerialNumber_withCompletion___block_invoke_42(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v2 = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)isHomeAccessRestrictedForPassSerialNumber:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  os_unfair_lock_s *p_lock;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_didLoadData)
    {
      -[HMHomeManager homes](self->_manager, "homes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = __76__PKHMHomeManager_isHomeAccessRestrictedForPassSerialNumber_withCompletion___block_invoke((uint64_t)v10, v10, v6);

      os_unfair_lock_unlock(p_lock);
      if (v8)
        v8[2](v8, v11);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __76__PKHMHomeManager_isHomeAccessRestrictedForPassSerialNumber_withCompletion___block_invoke_45;
      v12[3] = &unk_1E2AC6F90;
      v14 = &__block_literal_global_44;
      v13 = v6;
      v15 = v8;
      -[PKHMHomeManager fetchHomesWithCompletion:](self, "fetchHomesWithCompletion:", v12);

    }
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __76__PKHMHomeManager_isHomeAccessRestrictedForPassSerialNumber_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if ((PKHomeKitSimulatedLockCompatibilityMode() & 1) != 0)
  {
    v24 = 1;
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v4;
    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "walletKeyPassSerialNumber", (_QWORD)v26);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v5;
          v13 = v11;
          if (v13 == v12)
          {

LABEL_17:
            v7 = v10;
            goto LABEL_18;
          }
          v14 = v13;
          if (v5 && v13)
          {
            v15 = objc_msgSend(v12, "isEqualToString:", v13);

            if (v15)
              goto LABEL_17;
          }
          else
          {

          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_18:

    PKLogFacilityTypeGetObject(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
        v17 = CFSTR("Found");
      else
        v17 = CFSTR("Did not find");
      objc_msgSend(v7, "uniqueIdentifier", (_QWORD)v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      v34 = 2112;
      v35 = v5;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ home %@ with pass serial number: %@", buf, 0x20u);

    }
    if (v7)
    {
      objc_msgSend(v7, "currentUser");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "homeAccessControlForUser:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "restrictedGuestAccessSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "guestAccessSchedule");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "isRestrictedGuestInAllowedPeriod") ^ 1;
      if (v22)
        v24 = v23;
      else
        v24 = 0;

    }
    else
    {
      v24 = 0;
    }

  }
  return v24;
}

uint64_t __76__PKHMHomeManager_isHomeAccessRestrictedForPassSerialNumber_withCompletion___block_invoke_45(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSMutableArray *v7;
  NSMutableArray *fetchCompletions;
  NSObject *fetchTimeout;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *timerQueue;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager found %lu homes", buf, 0xCu);
  }

  v7 = self->_fetchCompletions;
  self->_didLoadData = 1;
  fetchCompletions = self->_fetchCompletions;
  self->_fetchCompletions = 0;

  fetchTimeout = self->_fetchTimeout;
  if (fetchTimeout)
    dispatch_source_cancel(fetchTimeout);
  os_unfair_lock_unlock(&self->_lock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v7;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        timerQueue = self->_timerQueue;
        v18[0] = v14;
        v18[1] = 3221225472;
        v18[2] = __45__PKHMHomeManager_homeManagerDidUpdateHomes___block_invoke;
        v18[3] = &unk_1E2ABDA18;
        v18[4] = v5;
        v18[5] = v16;
        dispatch_async(timerQueue, v18);
        ++v15;
      }
      while (v12 != v15);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

uint64_t __45__PKHMHomeManager_homeManagerDidUpdateHomes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchTimeout, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_fetchCompletions, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end

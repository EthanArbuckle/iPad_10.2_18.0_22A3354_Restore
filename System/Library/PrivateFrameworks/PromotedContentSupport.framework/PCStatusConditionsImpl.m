@implementation PCStatusConditionsImpl

- (id)_setupXPCConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ap.adservicesd.statusconditionservice"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DC2538);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

- (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[6];
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_2153EDB38;
  v29[4] = sub_2153EDB20;
  v30 = (id)MEMORY[0x2199E0838]();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_2153EEA34;
  v27[4] = sub_2153EEA44;
  v28 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v11 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_2153EC874;
  v26[3] = &unk_24D33A9C8;
  v26[4] = v27;
  v26[5] = v29;
  v12 = (void *)MEMORY[0x2199E0838](v26);
  -[PCStatusConditionsImpl _setupXPCConnection](self, "_setupXPCConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = sub_2153ECC90;
  v24[3] = &unk_24D33A978;
  v14 = v12;
  v25 = v14;
  objc_msgSend(v13, "setInvalidationHandler:", v24);
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = sub_2153EF3E4;
  v22[3] = &unk_24D33A978;
  v15 = v14;
  v23 = v15;
  objc_msgSend(v13, "setInterruptionHandler:", v22);
  objc_msgSend(v13, "resume");
  objc_msgSend(v13, "remoteObjectProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = sub_2153EF500;
  v19[3] = &unk_24D33A9F0;
  v17 = v15;
  v21 = v17;
  v18 = v13;
  v20 = v18;
  objc_msgSend(v16, "isStatusConditionRegistered:bundleIdentifier:completionHandler:", v8, v9, v19);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

}

- (void)setStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[6];
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[PCStatusConditionsImpl isConditionRateLimited:onOperation:](self, "isConditionRateLimited:onOperation:", v6, 0))
  {
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = sub_2153EDB38;
    v26[4] = sub_2153EDB20;
    v27 = (id)MEMORY[0x2199E0838](v7);
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = sub_2153EEA34;
    v24[4] = sub_2153EEA44;
    v25 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v8 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_2153EEA4C;
    v23[3] = &unk_24D33A950;
    v23[4] = v24;
    v23[5] = v26;
    v9 = (void *)MEMORY[0x2199E0838](v23);
    -[PCStatusConditionsImpl _setupXPCConnection](self, "_setupXPCConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = sub_2153EEACC;
    v21[3] = &unk_24D33A978;
    v11 = v9;
    v22 = v11;
    objc_msgSend(v10, "setInvalidationHandler:", v21);
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = sub_2153EEBE4;
    v19[3] = &unk_24D33A978;
    v12 = v11;
    v20 = v12;
    objc_msgSend(v10, "setInterruptionHandler:", v19);
    objc_msgSend(v10, "resume");
    objc_msgSend(v10, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = sub_2153EECFC;
    v16[3] = &unk_24D33A9A0;
    v14 = v12;
    v18 = v14;
    v15 = v10;
    v17 = v15;
    objc_msgSend(v13, "setStatusCondition:completionHandler:", v6, v16);

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);

  }
}

- (void)clearStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[6];
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[PCStatusConditionsImpl isConditionRateLimited:onOperation:](self, "isConditionRateLimited:onOperation:", v6, 1))
  {
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = sub_2153EDB38;
    v26[4] = sub_2153EDB20;
    v27 = (id)MEMORY[0x2199E0838](v7);
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = sub_2153EEA34;
    v24[4] = sub_2153EEA44;
    v25 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v8 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_2153EF054;
    v23[3] = &unk_24D33A950;
    v23[4] = v24;
    v23[5] = v26;
    v9 = (void *)MEMORY[0x2199E0838](v23);
    -[PCStatusConditionsImpl _setupXPCConnection](self, "_setupXPCConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = sub_2153EF0D4;
    v21[3] = &unk_24D33A978;
    v11 = v9;
    v22 = v11;
    objc_msgSend(v10, "setInvalidationHandler:", v21);
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = sub_2153EF1EC;
    v19[3] = &unk_24D33A978;
    v12 = v11;
    v20 = v12;
    objc_msgSend(v10, "setInterruptionHandler:", v19);
    objc_msgSend(v10, "resume");
    objc_msgSend(v10, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = sub_2153EF304;
    v16[3] = &unk_24D33A9A0;
    v14 = v12;
    v18 = v14;
    v15 = v10;
    v17 = v15;
    objc_msgSend(v13, "clearStatusCondition:completionHandler:", v6, v16);

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);

  }
}

- (BOOL)isConditionRateLimited:(id)a3 onOperation:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  const char *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[PCStatusConditionsImpl cleanupExpiredConditionsInBuffer](self, "cleanupExpiredConditionsInBuffer");
  APLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("Clear");
    if (!a4)
      v8 = CFSTR("Set");
    v16 = 138543362;
    v17 = v8;
    _os_log_impl(&dword_2153EB000, v7, OS_LOG_TYPE_INFO, "PCStatusConditions %{public}@ called. Checking rate limiting.", (uint8_t *)&v16, 0xCu);
  }

  v9 = -[PCStatusConditionsImpl operationWithCondition:forType:](self, "operationWithCondition:forType:", v6, a4);
  APLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      v12 = CFSTR("CLEAR");
      if (!a4)
        v12 = CFSTR("SET");
      v16 = 138543362;
      v17 = v12;
      v13 = "This is a duplicate %{public}@ call which will be rate limited";
LABEL_14:
      _os_log_impl(&dword_2153EB000, v10, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v16, 0xCu);
    }
  }
  else if (v11)
  {
    v14 = CFSTR("CLEAR");
    if (!a4)
      v14 = CFSTR("SET");
    v16 = 138543362;
    v17 = v14;
    v13 = "This is a new %{public}@ call which will execute.";
    goto LABEL_14;
  }

  return v9;
}

- (BOOL)operationWithCondition:(id)a3 forType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  PCStatusConditionRateLimitedObject *v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[PCRingBuffer sharedInstance](PCRingBuffer, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v6, "ringBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v13, "statusCondition");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqual:", v5))
        {
          v15 = objc_msgSend(v13, "operation");

          if (v15 == a4)
          {
            v24 = 1;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v10);
  }

  v16 = (void *)MEMORY[0x24BDD1758];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = sub_2153EFA6C;
  v27[3] = &unk_24D33AA18;
  v17 = v5;
  v28 = v17;
  objc_msgSend(v16, "predicateWithBlock:", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ringBuffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filterUsingPredicate:", v18);

  v20 = [PCStatusConditionRateLimitedObject alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PCStatusConditionRateLimitedObject init:at:kind:](v20, "init:at:kind:", v17, v21, a4);

  objc_msgSend(v6, "ringBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v22);

  v24 = 0;
  v8 = v28;
LABEL_13:

  objc_msgSend(v6, "lock");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "unlock");

  return v24;
}

- (void)cleanupExpiredConditionsInBuffer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  +[PCRingBuffer sharedInstance](PCRingBuffer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(v2, "cappedRingBufferTo:", 5);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1758];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_2153EFBB4;
  v10[3] = &unk_24D33AA18;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "predicateWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ringBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterUsingPredicate:", v7);

  objc_msgSend(v2, "lock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

}

@end

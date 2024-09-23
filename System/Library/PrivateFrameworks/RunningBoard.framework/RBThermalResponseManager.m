@implementation RBThermalResponseManager

+ (int64_t)_thermalConditionLevelForThermalLevel:(unint64_t)a3
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 830;
  v4 = 840;
  v5 = 860;
  if (a3 == 14)
    v5 = 850;
  if (a3 >= 0xE)
    v4 = v5;
  if (a3 >= 0xB)
    v3 = v4;
  if (a3 >= 7)
    return v3;
  else
    return 0;
}

- (void)_takeAssertionForConditionLevel:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  RBSAssertionIdentifier *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  RBSAssertionIdentifier *v18;
  RBSAssertionIdentifier *currentAssertion;
  RBSAssertionIdentifier *v20;
  void *v21;
  RBSAssertionIdentifier *v22;
  id v23;
  _QWORD v24[4];
  RBSAssertionIdentifier *v25;
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x24BE80B20];
  -[RBDaemonContextProviding process](self->_daemonContext, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifierWithClientPid:", objc_msgSend(v8, "rbs_pid"));
  v9 = (RBSAssertionIdentifier *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE80B68], "attributeWithCondition:value:", CFSTR("therm"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  objc_msgSend(MEMORY[0x24BE80AD0], "attributeWithCompletionPolicy:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BE80B18];
  objc_msgSend(MEMORY[0x24BE80D38], "systemTarget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptorWithIdentifier:target:explanation:attributes:", v9, v14, CFSTR("Thermal Condition"), v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBDaemonContextProviding process](self->_daemonContext, "process");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:](RBAssertionAcquisitionContext, "contextForProcess:withDescriptor:daemonContext:", v16, v15, self->_daemonContext);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = self->_currentAssertion;
  currentAssertion = self->_currentAssertion;
  self->_currentAssertion = v9;
  v20 = v9;

  -[RBDaemonContextProviding assertionManager](self->_daemonContext, "assertionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke;
  v24[3] = &unk_24DD46600;
  v25 = v18;
  v26 = v6;
  v22 = v18;
  v23 = v6;
  objc_msgSend(v21, "acquireAssertionWithContext:completion:", v17, v24);

}

void __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    rbs_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke_cold_1((uint64_t)v3, v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_queue_updateAssertion
{
  OUTLINED_FUNCTION_0_5(&dword_21A8B4000, a2, a3, "In RBThermalResponseManager, notify_get_state failed with %d", a5, a6, a7, a8, 0);
}

void __50__RBThermalResponseManager__queue_updateAssertion__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v3 = a2;
    objc_msgSend(v2, "assertionManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateAssertionWithIdentifier:", v3);

  }
}

- (id)_initWithDaemonContext:(id)a3 notificationName:(id)a4
{
  id v7;
  id v8;
  RBThermalResponseManager *v9;
  int *v10;
  const char *v11;
  NSObject *v12;
  int *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  _QWORD handler[4];
  int *v25;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)RBThermalResponseManager;
  v9 = -[RBThermalResponseManager init](&v26, sel_init);
  v10 = (int *)v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemonContext, a3);
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v12 = objc_msgSend(MEMORY[0x24BE80D58], "sharedBackgroundWorkloop");
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __68__RBThermalResponseManager__initWithDaemonContext_notificationName___block_invoke;
    handler[3] = &unk_24DD46650;
    v13 = v10;
    v25 = v13;
    v14 = notify_register_dispatch(v11, v10 + 4, v12, handler);

    if ((_DWORD)v14)
    {
      rbs_general_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[RBThermalResponseManager _initWithDaemonContext:notificationName:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    }
    v22 = v13;

  }
  return v10;
}

uint64_t __68__RBThermalResponseManager__initWithDaemonContext_notificationName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateAssertion");
}

+ (id)managerWithDaemonContext:(id)a3 notificationName:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RBThermalResponseManager _initWithDaemonContext:notificationName:]([RBThermalResponseManager alloc], "_initWithDaemonContext:notificationName:", v6, v5);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssertion, 0);
  objc_storeStrong((id *)&self->_daemonContext, 0);
}

void __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_FAULT, "In RBThermalResponseManager, acqusition failed with %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_initWithDaemonContext:(uint64_t)a3 notificationName:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_21A8B4000, a2, a3, "In RBThermalResponseManager, notify_register_dispatch failed with %d", a5, a6, a7, a8, 0);
}

@end

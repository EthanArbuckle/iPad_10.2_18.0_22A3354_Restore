@implementation SUInstallationConstraintMonitorWombat

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  BSDispatchQueueAssert();
  v16.receiver = self;
  v16.super_class = (Class)SUInstallationConstraintMonitorWombat;
  v8 = -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:](&v16, sel_initOnQueue_withRepresentedInstallationConstraints_andDownload_, v7, 4096, v6);

  if (v8)
  {
    *((_BYTE *)v8 + 56) = 0;
    v9 = (void *)*((_QWORD *)v8 + 6);
    *((_QWORD *)v8 + 6) = 0;

    objc_msgSend(MEMORY[0x24BE64988], "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v8 + 6);
    *((_QWORD *)v8 + 6) = v10;

    v12 = (_QWORD *)MEMORY[0x24BE64950];
    v17[0] = *MEMORY[0x24BE64950];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v8 + 6), "setAttribute:forKey:error:", v13, *MEMORY[0x24BE64930], 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel__wombatEnabledDidChange_, *v12, *((_QWORD *)v8 + 6));

    objc_msgSend(v8, "_queue_pollSatisfied");
  }
  return v8;
}

- (void)_wombatEnabledDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  NSObject *queue;
  NSObject *v11;
  _QWORD v12[5];
  char v13;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE64958]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = -[NSObject BOOLValue](v7, "BOOLValue");
      queue = self->super._queue;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __65__SUInstallationConstraintMonitorWombat__wombatEnabledDidChange___block_invoke;
      v12[3] = &unk_24CE3BB60;
      v12[4] = self;
      v13 = v9;
      dispatch_async(queue, v12);
    }
    else
    {
      SULogInstallConstraints();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SUInstallationConstraintMonitorWombat _wombatEnabledDidChange:].cold.2();

    }
  }
  else
  {
    SULogInstallConstraints();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SUInstallationConstraintMonitorWombat _wombatEnabledDidChange:].cold.1();
  }

}

uint64_t __65__SUInstallationConstraintMonitorWombat__wombatEnabledDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_set_queue_wombatEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_queue_pollSatisfied
{
  uint64_t v3;

  BSDispatchQueueAssert();
  v3 = -[AVSystemController attributeForKey:](self->_avController, "attributeForKey:", *MEMORY[0x24BE64948]);
  -[SUInstallationConstraintMonitorWombat _set_queue_wombatEnabled:](self, "_set_queue_wombatEnabled:", v3 == *MEMORY[0x24BDBD270]);
}

- (void)_set_queue_wombatEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  SUInstallationConstraintMonitorWombat *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  if (self->_queue_wombatEnabled != v3)
  {
    self->_queue_wombatEnabled = v3;
    SULogInstallConstraints();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_wombatEnabled)
        v6 = CFSTR("NO");
      else
        v6 = CFSTR("YES");
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_2128D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ - is wombat constraint changed (satisfied? %@)", (uint8_t *)&v8, 0x16u);
    }

    -[SUInstallationConstraintMonitorBase delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));

  }
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (self->_queue_wombatEnabled)
    return -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints");
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avController, 0);
}

- (void)_wombatEnabledDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2128D9000, v0, v1, "%s: Failed to get userinfo from %@", v2, v3, v4, v5, 2u);
}

- (void)_wombatEnabledDidChange:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2128D9000, v0, v1, "%s: Failed to get status from %@", v2, v3, v4, v5, 2u);
}

@end

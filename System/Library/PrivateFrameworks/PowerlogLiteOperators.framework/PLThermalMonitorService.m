@implementation PLThermalMonitorService

uint64_t __51__PLThermalMonitorService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSMCCallback:", a2);
}

- (void)handleSMCCallback:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("EnableSMCNotification"), 1);
  if (v4 && v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mTPL"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_20;
    v8 = (void *)v7;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mTPL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (v10 < 1)
      goto LABEL_20;
    PLLogThermal();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[PLThermalMonitorService lastSMCThermalTrigger](self, "lastSMCThermalTrigger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v21;
      _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "Received notification from SMCAgent, lastSMCThermalTrigger: %@", (uint8_t *)&v22, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLThermalMonitorService lastSMCThermalTrigger](self, "lastSMCThermalTrigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PLThermalMonitorService lastSMCThermalTrigger](self, "lastSMCThermalTrigger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v12);
      v16 = fabs(v15);

      if (v16 <= 40.0)
      {
        PLLogThermal();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v22 = 138412290;
          v23 = v6;
          _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "Too frequent thermal triggers, not notifying submodules: %@", (uint8_t *)&v22, 0xCu);
        }

        goto LABEL_19;
      }
      -[PLThermalMonitorService setLastSMCThermalTrigger:](self, "setLastSMCThermalTrigger:", v12);
      PLLogThermal();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v22 = 138412290;
        v23 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "lastSMCThermalTrigger is non-null, notifying submodules: %@", (uint8_t *)&v22, 0xCu);
      }

      v18 = &unk_1E864AF78;
    }
    else
    {
      -[PLThermalMonitorService setLastSMCThermalTrigger:](self, "setLastSMCThermalTrigger:", v12);
      PLLogThermal();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v22 = 138412290;
        v23 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "lastSMCThermalTrigger is null, notifying submodules: %@", (uint8_t *)&v22, 0xCu);
      }

      v18 = &unk_1E864AF50;
    }
    -[PLThermalMonitorService performLogging:](self, "performLogging:", v18);
LABEL_19:

LABEL_20:
  }

}

- (void)performLogging:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogThermal();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "Sent notification to submodules: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D80078], "postNotificationName:object:userInfo:", CFSTR("PLThermalMonitorNotification"), self, v4);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLThermalMonitorService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLThermalMonitorService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLThermalMonitorService;
  return -[PLOperator init](&v3, sel_init);
}

- (void)initOperatorDependancies
{
  void *v3;
  id v4;
  uint64_t v5;
  PLEntryNotificationOperatorComposition *v6;
  PLEntryNotificationOperatorComposition *smcNotification;
  id v8;
  void *v9;
  PLXPCResponderOperatorComposition *v10;
  PLXPCResponderOperatorComposition *sysdiagnoseResponder;
  id v12;
  void *v13;
  PLXPCResponderOperatorComposition *v14;
  PLXPCResponderOperatorComposition *powerHUDResponder;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  +[PLOperator entryKeyForType:andName:](PLSMCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ThermalInstantKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__PLThermalMonitorService_initOperatorDependancies__block_invoke;
  v18[3] = &unk_1E8577F48;
  v18[4] = self;
  v6 = (PLEntryNotificationOperatorComposition *)objc_msgSend(v4, "initWithOperator:forEntryKey:withBlock:", self, v3, v18);
  smcNotification = self->_smcNotification;
  self->_smcNotification = v6;

  v8 = objc_alloc(MEMORY[0x1E0D80098]);
  -[PLOperator workQueue](self, "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __51__PLThermalMonitorService_initOperatorDependancies__block_invoke_22;
  v17[3] = &unk_1E8577F70;
  v17[4] = self;
  v10 = (PLXPCResponderOperatorComposition *)objc_msgSend(v8, "initWithWorkQueue:withRegistration:withBlock:", v9, &unk_1E864AF00, v17);
  sysdiagnoseResponder = self->_sysdiagnoseResponder;
  self->_sysdiagnoseResponder = v10;

  v12 = objc_alloc(MEMORY[0x1E0D80098]);
  -[PLOperator workQueue](self, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __51__PLThermalMonitorService_initOperatorDependancies__block_invoke_30;
  v16[3] = &unk_1E8577F70;
  v16[4] = self;
  v14 = (PLXPCResponderOperatorComposition *)objc_msgSend(v12, "initWithWorkQueue:withRegistration:withBlock:", v13, &unk_1E864AF28, v16);
  powerHUDResponder = self->_powerHUDResponder;
  self->_powerHUDResponder = v14;

}

uint64_t __51__PLThermalMonitorService_initOperatorDependancies__block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSysdiagnoseCallback:");
}

uint64_t __51__PLThermalMonitorService_initOperatorDependancies__block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePowerHUDCallback:");
}

- (id)handleSysdiagnoseCallback:(id)a3
{
  id v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogThermal();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Received event from Sysdiagnose: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PLThermalMonitorService performLogging:](self, "performLogging:", &unk_1E864AFA0);
  return &unk_1E864AFC8;
}

- (id)handlePowerHUDCallback:(id)a3
{
  id v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogThermal();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Received event from PowerHUD: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PLThermalMonitorService performLogging:](self, "performLogging:", &unk_1E864AFF0);
  return &unk_1E864B018;
}

- (PLEntryNotificationOperatorComposition)smcNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSmcNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCResponderOperatorComposition)sysdiagnoseResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSysdiagnoseResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCResponderOperatorComposition)powerHUDResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPowerHUDResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)lastSMCThermalTrigger
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastSMCThermalTrigger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSMCThermalTrigger, 0);
  objc_storeStrong((id *)&self->_powerHUDResponder, 0);
  objc_storeStrong((id *)&self->_sysdiagnoseResponder, 0);
  objc_storeStrong((id *)&self->_smcNotification, 0);
}

@end

@implementation TRIHotfixRolloutTargetingScheduler

- (TRIHotfixRolloutTargetingScheduler)initWithTaskQueue:(id)a3
{
  id v6;
  TRIHotfixRolloutTargetingScheduler *v7;
  TRIHotfixRolloutTargetingScheduler *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIHotfixRolloutTargetingScheduler.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIHotfixRolloutTargetingScheduler;
  v7 = -[TRIHotfixRolloutTargetingScheduler init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_queue, a3);

  return v8;
}

- (void)scheduleHotfixForDeployment:(id)a3 allowingAnyNetworkingAndBatteryUsage:(BOOL)a4 runDelay:(double)a5
{
  _BOOL8 v6;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  double v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIHotfixRolloutTargetingScheduler.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  if (a5 >= 0.0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A10]), "initWithAllowsCellular:discretionaryBehavior:", v6, 0);
    +[TRITaskAttributionInternalInsecure taskAttributionFirstPartyWithNetworkOptions:](TRITaskAttributionInternalInsecure, "taskAttributionFirstPartyWithNetworkOptions:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIRolloutTargetingTask taskWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:](TRIRolloutTargetingTask, "taskWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:", v9, 1, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", a5);
    objc_msgSend(v13, "setStartTime:", v14);

    -[TRIHotfixRolloutTargetingScheduler queue](self, "queue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskQueuingOptions optionsWithDuplicateTaskResolution:](TRITaskQueuingOptions, "optionsWithDuplicateTaskResolution:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addTask:options:", v13, v16);

    -[TRIHotfixRolloutTargetingScheduler _scheduleTaskQueueActivityWithDelay:allowingAnyNetworkingAndBatteryUsage:](self, "_scheduleTaskQueueActivityWithDelay:allowingAnyNetworkingAndBatteryUsage:", v6, a5);
  }
  else
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v19 = a5;
      v20 = 2114;
      v21 = v9;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Received negative run delay %f for hotfix deployment of %{public}@", buf, 0x16u);
    }

  }
}

- (void)_scheduleTaskQueueActivityWithDelay:(double)a3 allowingAnyNetworkingAndBatteryUsage:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "_xpcActivityCriteriaWithRunDelay:allowAnyNetworkingAndBatteryUsage:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRILaunchDaemonActivityDescriptor clientHotfixWifiDescriptor](TRILaunchDaemonActivityDescriptor, "clientHotfixWifiDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke;
  v18[3] = &unk_1E932F7F8;
  v10 = v7;
  v19 = v10;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_19;
  v17[3] = &unk_1E932F820;
  v17[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v8, v18, v17);

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_xpcActivityCriteriaWithRunDelay:allowAnyNetworkingAndBatteryUsage:", 1, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRILaunchDaemonActivityDescriptor clientHotfixCellularAllowBatteryDescriptor](TRILaunchDaemonActivityDescriptor, "clientHotfixCellularAllowBatteryDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = self;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_21;
    v15[3] = &unk_1E932F7F8;
    v16 = v11;
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_22;
    v14[3] = &unk_1E932F820;
    v13 = v11;
    +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v12, v15, v14);

  }
}

void __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Hotfix (wifi) checking in", v5, 2u);
  }

  xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 32));
}

void __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(Scheduler) Hotfix running wifi activity", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v3, 0);

}

void __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_21(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Hotfix (cellular) checking in", v5, 2u);
  }

  xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 32));
}

void __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(Scheduler) Hotfix running cellular activity", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v3, 0);

}

+ (id)_xpcActivityCriteriaWithRunDelay:(double)a3 allowAnyNetworkingAndBatteryUsage:(BOOL)a4
{
  int64_t v5;
  xpc_object_t v6;

  v5 = (uint64_t)a3;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E0C80760], v5);
  xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C80738], a4);
  xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C808C8], !a4);
  return v6;
}

- (TRITaskQueuing)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

@implementation REMDataAccessBehaviorManager

- (REMDataAccessBehaviorManager)init
{
  void *v3;
  REMDataAccessBehaviorManager *v4;

  +[REMXPCDaemonController weakSharedInstance](REMXPCDaemonController, "weakSharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[REMDataAccessBehaviorManager initWithDaemonController:](self, "initWithDaemonController:", v3);

  return v4;
}

- (REMDataAccessBehaviorManager)initWithDaemonController:(id)a3
{
  id v5;
  REMDataAccessBehaviorManager *v6;
  REMDataAccessBehaviorManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMDataAccessBehaviorManager;
  v6 = -[REMDataAccessBehaviorManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_daemonController, a3);

  return v7;
}

- (id)fetchStatusReportsWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__11;
  v14 = __Block_byref_object_dispose__11;
  v4 = MEMORY[0x1E0C809B0];
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke;
  v9[3] = &unk_1E67F8490;
  v9[4] = &v10;
  -[REMDataAccessBehaviorManager _debugPerformerWithReason:errorHandler:](self, "_debugPerformerWithReason:errorHandler:", CFSTR("DA_statusReports"), v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_2;
  v8[3] = &unk_1E67F8DF0;
  v8[4] = &v16;
  v8[5] = &v10;
  objc_msgSend(v5, "dataAccessStatusReports:", v8);
  if (a3)
    *a3 = objc_retainAutorelease((id)v11[5]);
  v6 = (id)v17[5];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

void __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLog dataAccess](REMLog, "dataAccess");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  void *v10;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    +[REMLog dataAccess](REMLog, "dataAccess");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_2_cold_1();

    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = a3;
  }
  else
  {
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = a2;
  }
  objc_storeStrong(v9, v10);

}

- (BOOL)isDataAccessEnabled
{
  return -[REMDataAccessBehaviorManager _getBoolForKey:withDefaultValue:](self, "_getBoolForKey:withDefaultValue:", CFSTR("DataAccessEnabled"), 1);
}

- (void)enableDataAccess
{
  -[REMDataAccessBehaviorManager _setBoolValue:forBehaviorKey:](self, "_setBoolValue:forBehaviorKey:", 1, CFSTR("DataAccessEnabled"));
  -[REMDataAccessBehaviorManager _crashDaemonWithMessage:](self, "_crashDaemonWithMessage:", CFSTR("Enable DataAccess"));
}

- (void)disableDataAccess
{
  -[REMDataAccessBehaviorManager _setBoolValue:forBehaviorKey:](self, "_setBoolValue:forBehaviorKey:", 0, CFSTR("DataAccessEnabled"));
  -[REMDataAccessBehaviorManager _crashDaemonWithMessage:](self, "_crashDaemonWithMessage:", CFSTR("Disable DataAccess"));
}

- (BOOL)isBabySitterEnabled
{
  return -[REMDataAccessBehaviorManager _getBoolForKey:withDefaultValue:](self, "_getBoolForKey:withDefaultValue:", CFSTR("BabysitterEnabled"), 1);
}

- (void)enableBabySitter
{
  -[REMDataAccessBehaviorManager _setBoolValue:forBehaviorKey:](self, "_setBoolValue:forBehaviorKey:", 1, CFSTR("BabysitterEnabled"));
  -[REMDataAccessBehaviorManager _crashDaemonWithMessage:](self, "_crashDaemonWithMessage:", CFSTR("Enable Babysitter"));
}

- (void)disableBabySitter
{
  -[REMDataAccessBehaviorManager _setBoolValue:forBehaviorKey:](self, "_setBoolValue:forBehaviorKey:", 0, CFSTR("BabysitterEnabled"));
  -[REMDataAccessBehaviorManager _crashDaemonWithMessage:](self, "_crashDaemonWithMessage:", CFSTR("Disable Babysitter"));
}

- (int64_t)changeTrackingBehaviors
{
  return -[REMDataAccessBehaviorManager _getIntegerForKey:withDefaultValue:](self, "_getIntegerForKey:withDefaultValue:", CFSTR("DADREMChangeTrackingBehaviors"), 0);
}

- (void)applyChangeTrackingBehavior:(int64_t)a3
{
  -[REMDataAccessBehaviorManager _setIntegerValue:forBehaviorKey:](self, "_setIntegerValue:forBehaviorKey:", -[REMDataAccessBehaviorManager changeTrackingBehaviors](self, "changeTrackingBehaviors") | a3, CFSTR("DADREMChangeTrackingBehaviors"));
  notify_post("com.apple.dataaccess.BehaviorOptionsChanged");
}

- (void)unapplyChangeTrackingBehavior:(int64_t)a3
{
  -[REMDataAccessBehaviorManager _setIntegerValue:forBehaviorKey:](self, "_setIntegerValue:forBehaviorKey:", -[REMDataAccessBehaviorManager changeTrackingBehaviors](self, "changeTrackingBehaviors") & ~a3, CFSTR("DADREMChangeTrackingBehaviors"));
  notify_post("com.apple.dataaccess.BehaviorOptionsChanged");
}

- (void)_setBoolValue:(BOOL)a3 forBehaviorKey:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = a4;
  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
  v10 = v6;
  if (v6)
    v7 = (id)objc_msgSend(v6, "mutableCopy");
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v5);

  CFPreferencesSetAppValue(CFSTR("BehaviorOptions"), v8, CFSTR("com.apple.DataAccess.BehaviorOptions"));
}

- (BOOL)_getBoolForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
  if (v6)
  {
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      a4 = objc_msgSend(v8, "BOOLValue");

  }
  return a4;
}

- (void)_setIntegerValue:(int64_t)a3 forBehaviorKey:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
  v10 = v6;
  if (v6)
    v7 = (id)objc_msgSend(v6, "mutableCopy");
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v5);

  CFPreferencesSetAppValue(CFSTR("BehaviorOptions"), v8, CFSTR("com.apple.DataAccess.BehaviorOptions"));
}

- (int64_t)_getIntegerForKey:(id)a3 withDefaultValue:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
  if (v6)
  {
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      a4 = objc_msgSend(v8, "integerValue");

  }
  return a4;
}

- (void)_crashDaemonWithMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMDataAccessBehaviorManager _debugPerformerWithReason:errorHandler:](self, "_debugPerformerWithReason:errorHandler:", CFSTR("DA_crashDaemon"), &__block_literal_global_33);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "crashDaemonWithMessage:", v4);

}

void __56__REMDataAccessBehaviorManager__crashDaemonWithMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLog dataAccess](REMLog, "dataAccess");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56__REMDataAccessBehaviorManager__crashDaemonWithMessage___block_invoke_cold_1();

}

- (id)_debugPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[REMDataAccessBehaviorManager daemonController](self, "daemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__REMDataAccessBehaviorManager__debugPerformerWithReason_errorHandler___block_invoke;
  v12[3] = &unk_1E67F86B0;
  v13 = v6;
  v9 = v6;
  objc_msgSend(v8, "syncDebugPerformerWithReason:errorHandler:", v7, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __71__REMDataAccessBehaviorManager__debugPerformerWithReason_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[REMLog dataAccess](REMLog, "dataAccess");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__REMDataAccessBehaviorManager__debugPerformerWithReason_errorHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (REMXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
  objc_storeStrong((id *)&self->_daemonController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonController, 0);
}

void __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error while fetching status reports {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __60__REMDataAccessBehaviorManager_fetchStatusReportsWithError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Error getting DataAccess status reports {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __56__REMDataAccessBehaviorManager__crashDaemonWithMessage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "xpc error while trying to carsh daemon {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __71__REMDataAccessBehaviorManager__debugPerformerWithReason_errorHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "xpc error while using xpcPerformer {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end

@implementation SCLSchoolModeWakeScheduler

- (void)scheduleWakeForDate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  scl_framework_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "com.apple.schooltime.wake.activity";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_21E4AD000, v7, OS_LOG_TYPE_DEFAULT, "Registering xpc activity %s for %@", buf, 0x16u);
  }

  v8 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __50__SCLSchoolModeWakeScheduler_scheduleWakeForDate___block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = v6;
  xpc_activity_register("com.apple.schooltime.wake.activity", v8, handler);

}

void __50__SCLSchoolModeWakeScheduler_scheduleWakeForDate___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  xpc_activity_state_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  xpc_activity_state_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  scl_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = (const char *)v3;
    v14 = 2048;
    v15 = state;
    _os_log_impl(&dword_21E4AD000, v5, OS_LOG_TYPE_INFO, "registered & received xpc activity %@ with state %ld", (uint8_t *)&v12, 0x16u);
  }

  if (!xpc_activity_get_state(v3))
  {
    scl_framework_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 136315394;
      v13 = "com.apple.schooltime.wake.activity";
      v14 = 2048;
      v15 = v11;
      _os_log_impl(&dword_21E4AD000, v10, OS_LOG_TYPE_INFO, "%s checked in, setting criteria wake interval %f", (uint8_t *)&v12, 0x16u);
    }

    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x24BDAC5B8], (uint64_t)*(double *)(a1 + 32));
    xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x24BDAC5D8], 1);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x24BDAC6B8], 0);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x24BDAC6F8], 1);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x24BDAC598], 1);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x24BDAC6E8], 0);
    xpc_activity_set_criteria(v3, v8);
    goto LABEL_17;
  }
  if (xpc_activity_should_defer(v3))
  {
    v6 = xpc_activity_set_state(v3, 3);
    scl_framework_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __50__SCLSchoolModeWakeScheduler_scheduleWakeForDate___block_invoke_cold_1(v8);
      goto LABEL_17;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "com.apple.schooltime.wake.activity";
      v9 = "%s deferred";
LABEL_14:
      _os_log_impl(&dword_21E4AD000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, 0xCu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (xpc_activity_get_state(v3) == 2)
  {
    scl_framework_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "com.apple.schooltime.wake.activity";
      v9 = "%s asked to run";
      goto LABEL_14;
    }
LABEL_17:

  }
}

- (void)cancelWake
{
  xpc_activity_unregister("com.apple.schooltime.wake.activity");
}

void __50__SCLSchoolModeWakeScheduler_scheduleWakeForDate___block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "com.apple.schooltime.wake.activity";
  _os_log_error_impl(&dword_21E4AD000, log, OS_LOG_TYPE_ERROR, "xpc_activity_set_state(%s, XPC_ACTIVITY_STATE_DEFER) failed", (uint8_t *)&v1, 0xCu);
}

@end

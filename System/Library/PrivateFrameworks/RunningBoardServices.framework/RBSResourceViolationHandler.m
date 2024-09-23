@implementation RBSResourceViolationHandler

+ (void)notifyCPUViolation:(int)a3
{
  _xpc_connection_s *mach_service;
  NSObject *v5;
  NSObject *v6;
  xpc_object_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  mach_service = xpc_connection_create_mach_service("com.apple.runningboard.resource_notify", 0, 2uLL);
  if (mach_service)
  {
    rbs_process_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109120;
      v23[1] = a3;
      _os_log_impl(&dword_190CD6000, v5, OS_LOG_TYPE_DEFAULT, "Notified CPU resource violation on pid:%d", (uint8_t *)v23, 8u);
    }

    xpc_connection_set_event_handler(mach_service, &__block_literal_global_13);
    xpc_connection_resume(mach_service);
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "cmd", 1uLL);
    xpc_dictionary_set_uint64(v6, "pid", a3);
    v7 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
    if (!v7)
    {
      rbs_general_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[RBSResourceViolationHandler notifyCPUViolation:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

    }
  }
  else
  {
    rbs_general_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[RBSResourceViolationHandler notifyCPUViolation:].cold.1(v6, v16, v17, v18, v19, v20, v21, v22);
  }

}

+ (void)notifyCPUViolation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, a1, a3, "Could not connect to runningboard resource violation server", a5, a6, a7, a8, 0);
}

+ (void)notifyCPUViolation:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, a1, a3, "received nil reply from resource violation server", a5, a6, a7, a8, 0);
}

@end

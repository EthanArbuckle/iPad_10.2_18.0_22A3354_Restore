@implementation RBResourceViolationHandler

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_shared;
}

void __44__RBResourceViolationHandler_sharedInstance__block_invoke()
{
  RBResourceViolationHandler *v0;
  void *v1;

  v0 = objc_alloc_init(RBResourceViolationHandler);
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v0;

}

- (void)handleCPUViolationMessage:(uint64_t)a1 fromConnection:(void *)a2
{
  id v3;
  void *v4;
  uint64_t uint64;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  xpc_object_t reply;
  _xpc_connection_s *v10;
  NSObject *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64 = xpc_dictionary_get_uint64(v3, "pid");
    objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", uint64);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_process_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = uint64;
      _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_DEFAULT, "handleCPUViolationMessage on pid:%d", (uint8_t *)v12, 8u);
    }

    if (objc_msgSend(*(id *)(a1 + 8), "invalidateAssertionsDueToCPUUsageViolationForProcessIdentifier:", v6))
    {
      rbs_process_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEFAULT, "handleCPUViolationMessage removed assertions", (uint8_t *)v12, 2u);
      }

    }
    reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      xpc_dictionary_get_remote_connection(v4);
      v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v10, reply);

      rbs_process_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[RBResourceViolationHandler handleCPUViolationMessage:fromConnection:].cold.2();
    }
    else
    {
      rbs_process_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[RBResourceViolationHandler handleCPUViolationMessage:fromConnection:].cold.1();
    }

  }
}

- (void)handleMessage:(void *)a3 fromConnection:
{
  id v5;
  id v6;
  int uint64;
  NSObject *v8;
  _QWORD activity_block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    uint64 = xpc_dictionary_get_uint64(v5, "cmd");
    if (uint64 == 1)
    {
      activity_block[0] = MEMORY[0x24BDAC760];
      activity_block[1] = 3221225472;
      activity_block[2] = __59__RBResourceViolationHandler_handleMessage_fromConnection___block_invoke;
      activity_block[3] = &unk_24DD45E60;
      activity_block[4] = a1;
      v10 = v5;
      v11 = v6;
      _os_activity_initiate(&dword_21A8B4000, "handleCPUViolationMessage", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    }
    else
    {
      rbs_general_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[RBResourceViolationHandler handleMessage:fromConnection:].cold.1(uint64, v8);

    }
  }

}

void __59__RBResourceViolationHandler_handleMessage_fromConnection___block_invoke(uint64_t a1)
{
  -[RBResourceViolationHandler handleCPUViolationMessage:fromConnection:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)startWithAssertionManager:(uint64_t)a1
{
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  xpc_connection_t mach_service;
  void *v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD handler[5];

  v4 = a2;
  if (a1)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.runningboard.resourceviolationhandler", v5);
    v7 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v6;

    objc_storeStrong((id *)(a1 + 8), a2);
    mach_service = xpc_connection_create_mach_service((const char *)*MEMORY[0x24BE80E50], *(dispatch_queue_t *)(a1 + 16), 1uLL);
    v9 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = mach_service;

    v10 = *(_xpc_connection_s **)(a1 + 24);
    if (v10)
    {
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke;
      handler[3] = &unk_24DD45EB0;
      handler[4] = a1;
      xpc_connection_set_event_handler(v10, handler);
      xpc_connection_resume(*(xpc_connection_t *)(a1 + 24));
      rbs_general_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_DEFAULT, "Resource violation server running", v12, 2u);
      }
    }
    else
    {
      rbs_general_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[RBResourceViolationHandler startWithAssertionManager:].cold.1();
    }

  }
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v3 = a2;
  v4 = MEMORY[0x22074C57C]();
  if (v4 == MEMORY[0x24BDACF88])
  {
    v13 = v3;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2;
    v14[3] = &unk_24DD45E88;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v13;
    xpc_connection_set_event_handler((xpc_connection_t)v13, v14);
    xpc_connection_resume((xpc_connection_t)v13);

  }
  else
  {
    v5 = v4;
    if (v4 == MEMORY[0x24BDACFB8])
    {
      if (v3 == (id)MEMORY[0x24BDACF38])
      {
        rbs_general_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_1();
      }
      else
      {
        if (v3 != (id)MEMORY[0x24BDACF30])
          goto LABEL_7;
        rbs_general_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_2();
      }
    }
    else
    {
      rbs_general_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_3(v5, v6, v7, v8, v9, v10, v11, v12);
    }

  }
LABEL_7:

}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  v3 = a2;
  rbs_general_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, "received incoming resource violation message", v14, 2u);
  }

  v5 = MEMORY[0x22074C57C](v3);
  if (v5 == MEMORY[0x24BDACFA0])
  {
    -[RBResourceViolationHandler handleMessage:fromConnection:](*(_QWORD *)(a1 + 32), v3, *(void **)(a1 + 40));
  }
  else
  {
    v6 = v5;
    if (v5 == MEMORY[0x24BDACFB8])
    {
      if (v3 == (id)MEMORY[0x24BDACF38])
      {
        rbs_general_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_1();
      }
      else
      {
        if (v3 != (id)MEMORY[0x24BDACF30])
          goto LABEL_9;
        rbs_general_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_2();
      }
    }
    else
    {
      rbs_general_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_3(v6, v7, v8, v9, v10, v11, v12, v13);
    }

  }
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
}

- (void)handleCPUViolationMessage:fromConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "handleCPUViolationMessage - message didn't have reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleCPUViolationMessage:fromConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "handleCPUViolationMessage done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleMessage:(int)a1 fromConnection:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "unrecognized command for resource violation server: %ul", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)startWithAssertionManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Could not start runningboard resource violation server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "resource violation server connection invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "resource violation server connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A8B4000, a2, a3, "server resource violation connection had unexpected type %{public}@", a5, a6, a7, a8, 2u);
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "resource violation client connection invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "resource violation client connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__RBResourceViolationHandler_startWithAssertionManager___block_invoke_2_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A8B4000, a2, a3, "client resource violation connection had unexpected type %{public}@", a5, a6, a7, a8, 2u);
}

@end

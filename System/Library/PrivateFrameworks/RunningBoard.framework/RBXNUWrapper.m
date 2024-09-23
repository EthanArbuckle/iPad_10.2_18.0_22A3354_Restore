@implementation RBXNUWrapper

- (void)setGPURole:(unsigned __int8)a3 forPid:(int)a4
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x24BE51558])
  {
    if (self->_gpuDevice)
    {
      if (a3 == 3)
        v10 = 1;
      else
        v10 = 2;
      if (a3 == 4)
        v11 = 0;
      else
        v11 = v10;
      v12 = IOGPUDeviceSetAppGPURole();
      if (v12 == -536870208)
      {
        rbs_process_log();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          goto LABEL_23;
        v14 = 67109376;
        v15 = a4;
        v16 = 1024;
        v17 = v11;
        v5 = "%d setGPURole role to %d (no effect for this process)";
      }
      else
      {
        v13 = v12;
        if (v12)
        {
          rbs_general_log();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
            -[RBXNUWrapper setGPURole:forPid:].cold.2(a4, v13, v4);
          goto LABEL_23;
        }
        rbs_process_log();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          goto LABEL_23;
        v14 = 67109376;
        v15 = a4;
        v16 = 1024;
        v17 = v11;
        v5 = "%d setGPURole role to %d";
      }
      v6 = v4;
      v7 = OS_LOG_TYPE_INFO;
      v8 = 14;
      goto LABEL_20;
    }
    rbs_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[RBXNUWrapper setGPURole:forPid:].cold.1(v4);
  }
  else
  {
    rbs_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v5 = "Setting GPU Role not avaible on this mastering";
      v6 = v4;
      v7 = OS_LOG_TYPE_DEFAULT;
      v8 = 2;
LABEL_20:
      _os_log_impl(&dword_21A8B4000, v6, v7, v5, (uint8_t *)&v14, v8);
    }
  }
LABEL_23:

}

+ (id)sharedWrapper
{
  if (sharedWrapper_onceToken != -1)
    dispatch_once(&sharedWrapper_onceToken, &__block_literal_global_20);
  return (id)sharedWrapper_result;
}

void __29__RBXNUWrapper_sharedWrapper__block_invoke()
{
  RBXNUWrapper *v0;
  void *v1;

  v0 = objc_alloc_init(RBXNUWrapper);
  v1 = (void *)sharedWrapper_result;
  sharedWrapper_result = (uint64_t)v0;

}

- (RBXNUWrapper)init
{
  RBXNUWrapper *v2;
  BOOL v3;
  NSObject *v4;
  const char *v5;
  mach_port_t v6;
  const __CFDictionary *v7;
  uint64_t v8;
  NSObject *v9;
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
  uint64_t v23;
  RBXNUWrapper *v24;
  uint8_t v26[16];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)RBXNUWrapper;
  v2 = -[RBXNUWrapper init](&v27, sel_init);
  if (v2)
  {
    if (MEMORY[0x24BE51530])
      v3 = MEMORY[0x24BDD8980] == 0;
    else
      v3 = 1;
    if (v3)
    {
      rbs_general_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        v5 = "IOGPU not present";
LABEL_13:
        _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, v5, v26, 2u);
      }
    }
    else
    {
      v6 = *MEMORY[0x24BDD8B18];
      v7 = IOServiceMatching("IOGPU");
      if (!IOServiceGetMatchingService(v6, v7))
      {
        rbs_general_log();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
          -[RBXNUWrapper init].cold.1(v4, v10, v11, v12, v13, v14, v15, v16);
        goto LABEL_18;
      }
      v8 = IOGPUDeviceCreate();
      v2->_gpuDevice = (__IOGPUDevice *)v8;
      rbs_general_log();
      v9 = objc_claimAutoreleasedReturnValue();
      v4 = v9;
      if (!v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[RBXNUWrapper init].cold.2(v4, v17, v18, v19, v20, v21, v22, v23);
        goto LABEL_18;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        v5 = "_gpuDevice initialized";
        goto LABEL_13;
      }
    }
LABEL_18:

    v24 = v2;
  }

  return v2;
}

- (void)init
{
  OUTLINED_FUNCTION_5(&dword_21A8B4000, a1, a3, "Unable to create IOGPU device ref", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)setGPURole:(os_log_t)log forPid:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "setGPURole:pid: failed due to nil IOGPU device ref", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)setGPURole:(os_log_t)log forPid:.cold.2(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "%d setGPURole failed with result = %x", (uint8_t *)v3, 0xEu);
}

@end

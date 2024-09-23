@implementation PTMetalContext

- (PTMetalContext)initWithCommandQueue:(id)a3 bundleClass:(Class)a4
{
  id v7;
  PTMetalContext *v8;
  uint64_t v9;
  MTLDevice *device;
  MTLDevice *v11;
  void *v12;
  char v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  char v19;
  PTMetalContext *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  id v30;
  MTLLibrary *library;
  NSObject *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *pipelineLibrary;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  MTLPipelineLibrarySPI *v45;
  NSObject *v46;
  PTMetalTextureUtil *v47;
  PTMetalTextureUtil *textureUtil;
  objc_super v50;
  id v51;
  id v52[2];

  v52[1] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTMetalContext;
  v8 = -[PTMetalContext init](&v50, sel_init);
  if (!v8)
  {
    v20 = 0;
    goto LABEL_42;
  }
  objc_msgSend(v7, "device");
  v9 = objc_claimAutoreleasedReturnValue();
  device = v8->_device;
  v8->_device = (MTLDevice *)v9;

  objc_storeStrong((id *)&v8->_commandQueue, a3);
  v8->_allowCommandbufferAllocation = 0;
  v8->_imageblocksSupported = -[MTLDevice supportsFamily:](v8->_device, "supportsFamily:", 1006);
  v11 = v8->_device;
  -[MTLDevice name](v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "containsString:", CFSTR("Apple")))
  {
    v15 = &stru_1E822B200;
LABEL_20:

    goto LABEL_21;
  }
  NSSelectorFromString(CFSTR("architecture"));
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[MTLDevice architecture](v11, "architecture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("applegpu_"), &stru_1E822B200);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _PTLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[PTMetalContext initWithCommandQueue:bundleClass:].cold.6();

    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PTMetalContext initWithCommandQueue:bundleClass:].cold.5(v12, v17);

    objc_msgSend(v12, "revision");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "containsString:", CFSTR("A")) & 1) != 0)
    {
      v19 = 0;
    }
    else if (-[__CFString containsString:](v15, "containsString:", CFSTR("g16p")))
    {
      objc_msgSend(v12, "revision");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v21, "containsString:", CFSTR("B0")) ^ 1;

    }
    else
    {
      v19 = 1;
    }

    v22 = -[__CFString containsString:](v15, "containsString:", CFSTR("g17p"));
    if ((v19 & 1) == 0 && (v22 & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "revision");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lowercaseString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@_%@"), v15, v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v15 = (__CFString *)v26;
    }

    goto LABEL_20;
  }
  v15 = &stru_1E822B200;
LABEL_21:
  _PTLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[PTMetalContext initWithCommandQueue:bundleClass:].cold.4();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v52[0] = 0;
    v29 = -[MTLDevice newDefaultLibraryWithBundle:error:](v11, "newDefaultLibraryWithBundle:error:", v28, v52);
    v30 = v52[0];
    library = v8->_library;
    v8->_library = (MTLLibrary *)v29;

    if (v30)
    {
      _PTLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[PTMetalContext initWithCommandQueue:bundleClass:].cold.3();

      v33 = v30;
      v34 = v33;
    }
    else
    {
      if ((PTDefaultsPublicGetBool(CFSTR("harvesting.enabled"), 0) & 1) != 0)
      {
        pipelineLibrary = v8->_pipelineLibrary;
        v8->_pipelineLibrary = 0;
      }
      else
      {
        v41 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v28, "resourcePath");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringWithFormat:", CFSTR("%@/%@"), v42, v15);
        pipelineLibrary = (void *)objc_claimAutoreleasedReturnValue();

        v51 = 0;
        v43 = -[MTLDevice newPipelineLibraryWithFilePath:error:](v11, "newPipelineLibraryWithFilePath:error:", pipelineLibrary, &v51);
        v44 = v51;
        v45 = v8->_pipelineLibrary;
        v8->_pipelineLibrary = (MTLPipelineLibrarySPI *)v43;

        if (v44)
        {
          _PTLogSystem();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            -[PTMetalContext initWithCommandQueue:bundleClass:].cold.2();

        }
      }

      v33 = 0;
      v34 = 0;
    }
  }
  else
  {
    _PTLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[PTMetalContext initWithCommandQueue:bundleClass:].cold.1();

    v36 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2F90];
    v51 = (id)*MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot load bundle from %@"), a4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, -12573, v39);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0;
  }

  v47 = -[PTMetalTextureUtil initWithMetalContext:]([PTMetalTextureUtil alloc], "initWithMetalContext:", v8);
  textureUtil = v8->_textureUtil;
  v8->_textureUtil = v47;

  if (v34)
    v20 = 0;
  else
    v20 = v8;

LABEL_42:
  return v20;
}

- (MTLDevice)device
{
  return self->_device;
}

- (id)computePipelineStateFor:(id)a3 withConstants:(id)a4
{
  id v6;
  void *v7;
  id v8;
  MTLDevice *device;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;

  v6 = a3;
  -[PTMetalContext functionWithName:withConstants:](self, "functionWithName:withConstants:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CC6A80]);
    objc_msgSend(v8, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", 1);
    objc_msgSend(v8, "setComputeFunction:", v7);
    objc_msgSend(v8, "setPipelineLibrary:", self->_pipelineLibrary);
    device = self->_device;
    v14 = 0;
    v10 = (void *)-[MTLDevice newComputePipelineStateWithDescriptor:error:](device, "newComputePipelineStateWithDescriptor:error:", v8, &v14);
    v11 = v14;
    if (v11)
    {
      _PTLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PTMetalContext computePipelineStateFor:withConstants:].cold.1(v6, v11, v12);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)functionWithName:(id)a3 withConstants:(id)a4
{
  id v6;
  id v7;
  MTLPipelineLibrarySPI *pipelineLibrary;
  MTLLibrary *library;
  void *v10;
  id v11;
  NSObject *v12;
  MTLLibrary *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    pipelineLibrary = self->_pipelineLibrary;
    library = self->_library;
    if (pipelineLibrary)
    {
      v19 = 0;
      v10 = (void *)-[MTLLibrary newFunctionWithName:constantValues:pipelineLibrary:error:](library, "newFunctionWithName:constantValues:pipelineLibrary:error:", v6, v7, pipelineLibrary, &v19);
      v11 = v19;
      if (!v10)
      {
        _PTLogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[PTMetalContext functionWithName:withConstants:].cold.4(v6);

        v13 = self->_library;
        v18 = v11;
        v10 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](v13, "newFunctionWithName:constantValues:error:", v6, v7, &v18);
        v14 = v18;

        v11 = v14;
        if (!v10)
          goto LABEL_7;
      }
    }
    else
    {
      v20 = 0;
      v10 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](library, "newFunctionWithName:constantValues:error:", v6, v7, &v20);
      v11 = v20;
      if (!v10)
      {
LABEL_7:
        _PTLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[PTMetalContext functionWithName:withConstants:].cold.2(v11);

        goto LABEL_12;
      }
    }
    if (v11)
    {
      _PTLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[PTMetalContext functionWithName:withConstants:].cold.3(v11, v16);
      goto LABEL_19;
    }
  }
  else
  {
    v10 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", v6);
    if (!v10)
    {
      v11 = 0;
LABEL_12:
      _PTLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PTMetalContext functionWithName:withConstants:].cold.1(v6);
      v10 = 0;
LABEL_19:

    }
  }

  return v10;
}

- (BOOL)isCommandBufferCommitted
{
  return self->_commandBuffer == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDevice:", self->_device);
  objc_msgSend(v4, "setCommandQueue:", self->_commandQueue);
  objc_msgSend(v4, "setLibrary:", self->_library);
  objc_msgSend(v4, "setCommandBuffer:", 0);
  objc_msgSend(v4, "setPipelineLibrary:", self->_pipelineLibrary);
  objc_msgSend(v4, "setAllowCommandbufferAllocation:", self->_allowCommandbufferAllocation);
  objc_msgSend(v4, "setImageblocksSupported:", self->_imageblocksSupported);
  objc_msgSend(v4, "setTextureUtil:", self->_textureUtil);
  return v4;
}

- (void)setAllowCommandbufferAllocation:(BOOL)a3
{
  self->_allowCommandbufferAllocation = a3;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)setPipelineLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_pipelineLibrary, a3);
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void)setCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_commandQueue, a3);
}

- (void)setCommandBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_commandBuffer, a3);
}

- (MTLPipelineLibrarySPI)pipelineLibrary
{
  return self->_pipelineLibrary;
}

- (void)commitAndWaitUntilScheduled
{
  MTLCommandBuffer *commandBuffer;

  -[PTMetalContext checkCurrentThreadEqualsCommandBufferThread](self, "checkCurrentThreadEqualsCommandBufferThread");
  -[MTLCommandBuffer commit](self->_commandBuffer, "commit");
  -[MTLCommandBuffer waitUntilScheduled](self->_commandBuffer, "waitUntilScheduled");
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;

}

- (MTLCommandBuffer)commandBuffer
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MTLCommandBuffer *commandBuffer;
  MTLCommandBuffer *v12;
  MTLCommandBuffer *v13;
  MTLCommandBuffer *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (self->_allowCommandbufferAllocation)
  {
    if (-[MTLCommandBuffer status](self->_commandBuffer, "status"))
    {
      _PTLogSystem();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[PTMetalContext commandBuffer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    }
    commandBuffer = self->_commandBuffer;
    if (!commandBuffer)
    {
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v12 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
      v13 = self->_commandBuffer;
      self->_commandBuffer = v12;

      commandBuffer = self->_commandBuffer;
    }
    v14 = commandBuffer;
  }
  else
  {
    _PTLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[PTMetalContext commandBuffer].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    v14 = 0;
  }
  return v14;
}

- (PTMetalContext)initWithDevice:(id)a3 bundleClass:(Class)a4
{
  void *v6;
  PTMetalContext *v7;

  v6 = (void *)objc_msgSend(a3, "newCommandQueue");
  v7 = -[PTMetalContext initWithCommandQueue:bundleClass:](self, "initWithCommandQueue:bundleClass:", v6, a4);

  return v7;
}

- (BOOL)imageblocksSupported
{
  return self->_imageblocksSupported;
}

- (void)setImageblocksSupported:(BOOL)a3
{
  self->_imageblocksSupported = a3;
}

- (void)commit
{
  MTLCommandBuffer *commandBuffer;

  -[PTMetalContext checkCurrentThreadEqualsCommandBufferThread](self, "checkCurrentThreadEqualsCommandBufferThread");
  -[MTLCommandBuffer commit](self->_commandBuffer, "commit");
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;

}

- (void)commitAndWaitUntilCompleted
{
  MTLCommandBuffer *commandBuffer;

  -[PTMetalContext checkCurrentThreadEqualsCommandBufferThread](self, "checkCurrentThreadEqualsCommandBufferThread");
  -[MTLCommandBuffer commit](self->_commandBuffer, "commit");
  -[MTLCommandBuffer waitUntilCompleted](self->_commandBuffer, "waitUntilCompleted");
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;

}

- (void)waitForIdle
{
  id v3;

  v3 = -[PTMetalContext commandBuffer](self, "commandBuffer");
  -[PTMetalContext commitAndWaitUntilCompleted](self, "commitAndWaitUntilCompleted");
}

- (MTLLibrary)library
{
  return self->_library;
}

- (BOOL)allowCommandbufferAllocation
{
  return self->_allowCommandbufferAllocation;
}

- (PTMetalTextureUtil)textureUtil
{
  return self->_textureUtil;
}

- (void)setTextureUtil:(id)a3
{
  objc_storeStrong((id *)&self->_textureUtil, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureUtil, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)initWithCommandQueue:bundleClass:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1C9281000, v0, OS_LOG_TYPE_ERROR, "Cannot load bundle from %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCommandQueue:bundleClass:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_8(&dword_1C9281000, v0, (uint64_t)v0, "Error creating pipeline library %@ from className %@. Falling back to MTLLibrary", v1);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCommandQueue:bundleClass:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_8(&dword_1C9281000, v0, (uint64_t)v0, "Error creating library %@ from %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCommandQueue:bundleClass:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1C9281000, v0, v1, "Resolved gpuName: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCommandQueue:(void *)a1 bundleClass:(NSObject *)a2 .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "revision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1C9281000, a2, v4, "gpu revision: %@", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithCommandQueue:bundleClass:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1C9281000, v0, v1, "gpu name: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)commandBuffer
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Invalid commandbuffer", a5, a6, a7, a8, 0);
}

- (void)functionWithName:(void *)a1 withConstants:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(OUTLINED_FUNCTION_9_2(a1), "UTF8String");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_4(&dword_1C9281000, v1, v2, "Unable to load function %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_1();
}

- (void)functionWithName:(void *)a1 withConstants:.cold.2(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "description");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_8_1(v2, v3);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_4(&dword_1C9281000, v4, v5, "Metal shader compilation error: %s", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)functionWithName:(void *)a1 withConstants:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v2;
  id v4;
  const char *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_8_1(v4, v5);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1C9281000, a2, v6, "Metal shader compilation warnings: %s", v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)functionWithName:(void *)a1 withConstants:.cold.4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(OUTLINED_FUNCTION_9_2(a1), "UTF8String");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_4(&dword_1C9281000, v1, v2, "Unable to load function %s from pipeline library. Retrying from library.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_1();
}

- (void)computePipelineStateFor:(NSObject *)a3 withConstants:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  v5 = objc_msgSend(OUTLINED_FUNCTION_9_2(a1), "UTF8String");
  objc_msgSend(a2, "description");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = 136315394;
  v10 = v5;
  v11 = 2080;
  v12 = OUTLINED_FUNCTION_8_1(v6, v7);
  OUTLINED_FUNCTION_0_8(&dword_1C9281000, a3, v8, "Unable to create pipelineState (%s): %s", (uint8_t *)&v9);

}

@end

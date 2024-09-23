@implementation PTEspressoGenericExecutor

- (id)getInputResourceWithName:(id)a3
{
  return -[PTEspressoGenericExecutor getResourceWithName:fromMap:](self, "getResourceWithName:fromMap:", a3, self->_inputsMap);
}

- (id)getResourceWithName:(id)a3 fromMap:(id)a4
{
  return (id)objc_msgSend(a4, "objectForKeyedSubscript:", a3);
}

- (id)getOutputResourceWithName:(id)a3
{
  return -[PTEspressoGenericExecutor getResourceWithName:fromMap:](self, "getResourceWithName:fromMap:", a3, self->_outputsMap);
}

- (PTEspressoGenericExecutor)initWithMetalContext:(id)a3 url:(id)a4 inputNames:(id)a5 outputNames:(id)a6 tensorSwapNames:(id)a7 reshapeNetworkSize:(id *)a8 configuration:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  PTEspressoGenericExecutor *v23;

  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  +[PTInference ANEConfigForSynchronousWork](PTInference, "ANEConfigForSynchronousWork");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:](self, "initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:", v21, v20, v19, v18, v17, a8, v16, v22);

  return v23;
}

- (PTEspressoGenericExecutor)initWithMetalContext:(id)a3
{
  id v5;
  PTEspressoGenericExecutor *v6;
  PTEspressoGenericExecutor *v7;
  uint64_t v8;
  MTLComputePipelineState *interleavedToPlanar;
  uint64_t v10;
  MTLComputePipelineState *planarToInterleaved;
  PTEspressoGenericExecutor *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PTEspressoGenericExecutor;
  v6 = -[PTEspressoGenericExecutor init](&v19, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("interleavedToPlanar"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  interleavedToPlanar = v7->_interleavedToPlanar;
  v7->_interleavedToPlanar = (MTLComputePipelineState *)v8;

  if (!v7->_interleavedToPlanar)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTEspressoGenericExecutor initWithMetalContext:].cold.1(v13, v14, v15);
    goto LABEL_9;
  }
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("planarToInterleaved"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  planarToInterleaved = v7->_planarToInterleaved;
  v7->_planarToInterleaved = (MTLComputePipelineState *)v10;

  if (!v7->_planarToInterleaved)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTEspressoGenericExecutor initWithMetalContext:].cold.2(v13, v16, v17);
LABEL_9:

LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v12 = v7;
LABEL_11:

  return v12;
}

- (signed)bindTensorSwaps:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *tensorSwap;
  uint64_t v7;
  id v8;
  int v9;
  PTTensorSwapPair *v10;
  void *v11;
  PTTensorSwapPair *v12;
  int v13;
  NSObject *v14;
  uint64_t v17;
  _QWORD v18[4];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableArray *)objc_opt_new();
  tensorSwap = self->_tensorSwap;
  self->_tensorSwap = v5;

  v18[0] = 0;
  v18[1] = 0;
  if (objc_msgSend(v4, "count"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "UTF8String");
      v9 = espresso_network_bind_buffer();

      if (v9)
        break;
      v18[v7 & 1] = v17;
      if ((v7 & 1) != 0)
      {
        v10 = [PTTensorSwapPair alloc];
        objc_msgSend(v4, "subarrayWithRange:", v7 - 1, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PTTensorSwapPair initWithIOSurfaces:names:](v10, "initWithIOSurfaces:names:", v18, v11);

        -[NSMutableArray addObject:](self->_tensorSwap, "addObject:", v12);
      }
      if (objc_msgSend(v4, "count") <= (unint64_t)++v7)
        goto LABEL_7;
    }
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PTEspressoGenericExecutor bindTensorSwaps:].cold.1(v4, v7, v14);

    v13 = 1;
  }
  else
  {
LABEL_7:
    v13 = 0;
  }

  return v13 << 31 >> 31;
}

- (signed)bindBuffers:(id)a3 toMap:(id)a4 isInput:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  IOSurfaceRef v15;
  NSObject *v16;
  CVPixelBufferRef v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  CVPixelBufferRef v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  signed __int16 v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t *v43;
  uint64_t v44;
  _BOOL4 v45;
  id obj;
  const __CFAllocator *allocator;
  uint64_t v48;
  uint64_t v49;
  CVPixelBufferRef pixelBufferOut;
  IOSurfaceRef surface[2];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[4];
  int v67;
  uint8_t v68[4];
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v5 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v8;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (!v49)
  {
    v39 = 0;
    goto LABEL_49;
  }
  v48 = *(_QWORD *)v63;
  v45 = v5;
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v43 = (uint64_t *)&v67;
  v10 = 64;
  if (v5)
    v10 = 56;
  v44 = v10;
  while (2)
  {
    for (i = 0; i != v49; ++i)
    {
      if (*(_QWORD *)v63 != v48)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
      objc_msgSend(v9, "objectForKeyedSubscript:", v12, v43);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        _PTLogSystem();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[PTEspressoGenericExecutor bindBuffers:toMap:isInput:].cold.4();

        goto LABEL_48;
      }
      v61 = 0;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      *(_OWORD *)surface = 0u;
      v52 = 0u;
      v14 = objc_retainAutorelease(v12);
      objc_msgSend(v14, "UTF8String");
      if (espresso_network_bind_buffer())
      {
        _PTLogSystem();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          -[PTEspressoGenericExecutor bindBuffers:toMap:isInput:].cold.3();

LABEL_48:
        v39 = -1;
        goto LABEL_49;
      }
      v15 = surface[0];
      pixelBufferOut = 0;
      if (CVPixelBufferCreateWithIOSurface(allocator, surface[0], 0, &pixelBufferOut))
      {
        _PTLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[PTTensorSwapPair initWithIOSurfaces:names:].cold.1(v68, &v69, v16);

      }
      v17 = pixelBufferOut;
      -[PTMetalContext device](self->_metalContext, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PTPixelBufferUtil getMTLTextureDescriptor:device:](PTPixelBufferUtil, "getMTLTextureDescriptor:device:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v19, "height");
      if (v20 == *((_QWORD *)&v56 + 1))
      {
        v21 = objc_msgSend(v19, "width");
        if (v21 == (_QWORD)v56)
        {
          -[PTMetalContext device](self->_metalContext, "device");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v22, "newTextureWithDescriptor:iosurface:plane:", v19, v15, 0);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, v14);
          goto LABEL_38;
        }
      }
      v24 = v57;
      v25 = pixelBufferOut;
      -[PTMetalContext device](self->_metalContext, "device");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[PTPixelBufferUtil getMTLTextureDescriptor:device:](PTPixelBufferUtil, "getMTLTextureDescriptor:device:", v25, v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "pixelFormat") == 10)
      {
        v27 = v24 == 2;
        v28 = 80;
        v29 = 30;
      }
      else
      {
        if (objc_msgSend(v22, "pixelFormat") != 25)
        {
          _PTLogSystem();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[PTEspressoGenericExecutor bindBuffers:toMap:isInput:].cold.1(v66, v22, v43, v31);

          goto LABEL_28;
        }
        v27 = v24 == 2;
        v28 = 115;
        v29 = 65;
      }
      if (v27)
        v30 = v29;
      else
        v30 = v28;
      objc_msgSend(v22, "setPixelFormat:", v30);
LABEL_28:
      v32 = objc_msgSend(v22, "height");
      if (v32 == *((_QWORD *)&v56 + 1))
      {
        objc_msgSend(v22, "setWidth:", (_QWORD)v56);
        -[PTMetalContext device](self->_metalContext, "device");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v23, "newTextureWithDescriptor:iosurface:plane:", v22, v15, 0);
        v34 = (void *)v33;
      }
      else
      {
        objc_msgSend(v22, "setHeight:");
        -[PTMetalContext device](self->_metalContext, "device");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v35, "newTextureWithDescriptor:", v22);

        -[PTMetalContext device](self->_metalContext, "device");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v36, "newTextureWithDescriptor:iosurface:plane:", v19, v15, 0);

        if (v45)
          v37 = (void *)v33;
        else
          v37 = v34;
        if (v45)
          v38 = v34;
        else
          v38 = (void *)v33;
        objc_msgSend(*(id *)((char *)&self->super.isa + v44), "addObject:", v37);
        objc_msgSend(*(id *)((char *)&self->super.isa + v44), "addObject:", v38);
        v23 = (void *)v33;
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, v14);

LABEL_38:
      CVPixelBufferRelease(pixelBufferOut);

    }
    v39 = 0;
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v49)
      continue;
    break;
  }
LABEL_49:

  return v39;
}

- (id)networkVersion
{
  return self->_networkVersion;
}

- (PTEspressoGenericExecutor)initWithMetalContext:(id)a3 url:(id)a4 inputNames:(id)a5 outputNames:(id)a6 tensorSwapNames:(id)a7 reshapeNetworkSize:(id *)a8 configuration:(id)a9 ANEConfig:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PTEspressoGenericExecutor *v23;
  PTEspressoGenericExecutor *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *espressoCallbackQueue;
  uint64_t v27;
  NSMutableArray *inputInterleavedToPlanarConversion;
  uint64_t v29;
  NSMutableArray *outputPlanarToInterleavedConversion;
  uint64_t context;
  id v32;
  int v33;
  NSObject *v34;
  PTEspressoGenericExecutor *v35;
  int version;
  NSObject *v38;
  NSObject *networkVersion;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  NSMutableDictionary *inputsMap;
  uint64_t v44;
  NSMutableDictionary *outputsMap;
  char v46[64];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  v23 = -[PTEspressoGenericExecutor initWithMetalContext:](self, "initWithMetalContext:", a3);
  v24 = v23;
  if (!v23)
    goto LABEL_12;
  objc_storeStrong((id *)&v23->_url, a4);
  v25 = dispatch_queue_create("monocular-depth-sync", 0);
  espressoCallbackQueue = v24->_espressoCallbackQueue;
  v24->_espressoCallbackQueue = (OS_dispatch_queue *)v25;

  v27 = objc_opt_new();
  inputInterleavedToPlanarConversion = v24->_inputInterleavedToPlanarConversion;
  v24->_inputInterleavedToPlanarConversion = (NSMutableArray *)v27;

  v29 = objc_opt_new();
  outputPlanarToInterleavedConversion = v24->_outputPlanarToInterleavedConversion;
  v24->_outputPlanarToInterleavedConversion = (NSMutableArray *)v29;

  objc_msgSend(v22, "espressoEngine");
  context = espresso_create_context();
  v24->_ctx = (void *)context;
  if (!context)
  {
    _PTLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.1();
    goto LABEL_11;
  }
  v24->_plan = (void *)espresso_create_plan();
  objc_msgSend(v17, "path");
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v32, "UTF8String");
  v33 = espresso_plan_add_network();

  if (v33)
  {
    _PTLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.10();
  }
  else
  {
    objc_msgSend(v22, "espressoPlanPriority");
    if (espresso_plan_set_priority())
    {
      _PTLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.9();
    }
    else
    {
      version = espresso_network_get_version();
      _PTLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      networkVersion = v38;
      if (version)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.8(networkVersion);
      }
      else
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.7();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v46);
        v40 = objc_claimAutoreleasedReturnValue();
        networkVersion = v24->_networkVersion;
        v24->_networkVersion = (NSString *)v40;
      }

      if (!v21
        || (objc_msgSend(objc_retainAutorelease(v21), "UTF8String"),
            !espresso_network_select_configuration()))
      {
        if (a8)
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          -[NSObject UTF8String](v34, "UTF8String");
          if (espresso_network_change_input_blob_shapes_seq())
          {
            _PTLogSystem();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.5();

            goto LABEL_11;
          }

        }
        if (espresso_plan_build())
        {
          _PTLogSystem();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.4();
        }
        else
        {
          -[PTEspressoGenericExecutor bindTensorSwaps:](v24, "bindTensorSwaps:", v20);
          v42 = objc_opt_new();
          inputsMap = v24->_inputsMap;
          v24->_inputsMap = (NSMutableDictionary *)v42;

          if (-[PTEspressoGenericExecutor bindBuffers:toMap:isInput:](v24, "bindBuffers:toMap:isInput:", v18, v24->_inputsMap, 1))
          {
            _PTLogSystem();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.3();
          }
          else
          {
            v44 = objc_opt_new();
            outputsMap = v24->_outputsMap;
            v24->_outputsMap = (NSMutableDictionary *)v44;

            if (!-[PTEspressoGenericExecutor bindBuffers:toMap:isInput:](v24, "bindBuffers:toMap:isInput:", v19, v24->_outputsMap, 0))
            {
              v35 = v24;
              goto LABEL_13;
            }
            _PTLogSystem();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.2();
          }
        }
        goto LABEL_11;
      }
      _PTLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:].cold.6();
    }
  }
LABEL_11:

LABEL_12:
  v35 = 0;
LABEL_13:

  return v35;
}

+ (unint64_t)getEspressoMetalDeviceId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = MTLCreateSystemDefaultDevice();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v3, "registryID");
  if (v6)
  {
    v8 = v7;
    v9 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "registryID");

      if (v11 == v8)
        break;
      if (v6 == ++v9)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v9 = -1;
  }

  return v9;
}

- (unsigned)bindInputResourceWithName:(id)a3 to:(__CVBuffer *)a4
{
  unsigned int result;
  NSObject *v5;

  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  result = espresso_network_bind_cvpixelbuffer();
  if (result)
  {
    _PTLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PTEspressoGenericExecutor bindInputResourceWithName:to:].cold.1();

    return -1;
  }
  return result;
}

- (unsigned)convertBindInput:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[NSMutableArray count](self->_inputInterleavedToPlanarConversion, "count"))
  {
    objc_msgSend(v4, "commandBuffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      _PTLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[PTEspressoGenericExecutor convertBindInput:].cold.1(v6, v7, v8);

    }
    if (-[NSMutableArray count](self->_inputInterleavedToPlanarConversion, "count"))
    {
      v9 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_inputInterleavedToPlanarConversion, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_inputInterleavedToPlanarConversion, "objectAtIndexedSubscript:", v9 + 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTEspressoGenericExecutor convertInterleavedWithMetalContext:inInterleaved:outPlanar:](self, "convertInterleavedWithMetalContext:inInterleaved:outPlanar:", v4, v10, v11);

        v9 += 2;
      }
      while (-[NSMutableArray count](self->_inputInterleavedToPlanarConversion, "count") > v9);
    }
    objc_msgSend(v4, "commitAndWaitUntilScheduled");
  }

  return 0;
}

- (unsigned)convertBindOutput:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[NSMutableArray count](self->_outputPlanarToInterleavedConversion, "count"))
  {
    objc_msgSend(v4, "commandBuffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      _PTLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[PTEspressoGenericExecutor convertBindInput:].cold.1(v6, v7, v8);

    }
    if (-[NSMutableArray count](self->_outputPlanarToInterleavedConversion, "count"))
    {
      v9 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_outputPlanarToInterleavedConversion, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_outputPlanarToInterleavedConversion, "objectAtIndexedSubscript:", v9 + 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTEspressoGenericExecutor convertPlanarWithMetalContext:inPlanarTexture:outInterleaved:](self, "convertPlanarWithMetalContext:inPlanarTexture:outInterleaved:", v4, v10, v11);

        v9 += 2;
      }
      while (-[NSMutableArray count](self->_outputPlanarToInterleavedConversion, "count") > v9);
    }
    objc_msgSend(v4, "commitAndWaitUntilScheduled");
  }

  return 0;
}

- (unsigned)execute
{
  unsigned int result;
  NSObject *v4;

  result = -[PTEspressoGenericExecutor convertBindInput:](self, "convertBindInput:", self->_metalContext);
  if (!result)
  {
    if (espresso_plan_execute_sync())
    {
      _PTLogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[PTEspressoGenericExecutor execute].cold.1();

      return -2;
    }
    else
    {
      return -[PTEspressoGenericExecutor convertBindOutput:](self, "convertBindOutput:", self->_metalContext);
    }
  }
  return result;
}

- (unsigned)executeAsync:(id)a3
{
  return -[PTEspressoGenericExecutor executeAsync:metalContext:](self, "executeAsync:metalContext:", a3, self->_metalContext);
}

- (unsigned)executeAsync:(id)a3 metalContext:(id)a4
{
  id v6;
  unsigned int v7;
  NSObject *v8;
  uint64_t v10;
  id v11;

  v6 = a3;
  v7 = -[PTEspressoGenericExecutor convertBindInput:](self, "convertBindInput:", a4);
  if (!v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = v6;
    if (espresso_plan_submit())
    {
      _PTLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PTEspressoGenericExecutor executeAsync:metalContext:].cold.1();

      v7 = -2;
    }
    else
    {
      v7 = -[PTEspressoGenericExecutor convertBindOutput:](self, "convertBindOutput:", self->_metalContext, v10, 3221225472, __55__PTEspressoGenericExecutor_executeAsync_metalContext___block_invoke, &unk_1E822A570, self, v11);
    }

  }
  return v7;
}

uint64_t __55__PTEspressoGenericExecutor_executeAsync_metalContext___block_invoke(uint64_t a1, int *a2)
{
  NSObject *v4;
  uint64_t result;

  if (a2)
  {
    _PTLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__PTEspressoGenericExecutor_executeAsync_metalContext___block_invoke_cold_1(a2, a1, v4);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unsigned)executeAsync
{
  return -[PTEspressoGenericExecutor executeAsync:](self, "executeAsync:", 0);
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)PTEspressoGenericExecutor;
  -[PTEspressoGenericExecutor dealloc](&v3, sel_dealloc);
}

- (void)convertInterleavedWithMetalContext:(id)a3 inInterleaved:(id)a4 outPlanar:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];
  int v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v8, "height");
  v19 = v11 / objc_msgSend(v9, "height");
  objc_msgSend(v10, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setComputePipelineState:", self->_interleavedToPlanar);
  objc_msgSend(v13, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v8, 1);

  objc_msgSend(v13, "setBytes:length:atIndex:", &v19, 4, 0);
  v14 = objc_msgSend(v9, "width");
  v15 = objc_msgSend(v9, "height");

  v18[0] = v14;
  v18[1] = v15;
  v18[2] = 1;
  v16 = xmmword_1C9323090;
  v17 = 1;
  objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v13, "endEncoding");

}

- (void)convertPlanarWithMetalContext:(id)a3 inPlanarTexture:(id)a4 outInterleaved:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];
  int v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v9, "height");
  v19 = v11 / objc_msgSend(v8, "height");
  objc_msgSend(v10, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setComputePipelineState:", self->_planarToInterleaved);
  objc_msgSend(v13, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v13, "setTexture:atIndex:", v8, 1);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v19, 4, 0);
  v14 = objc_msgSend(v8, "width");
  v15 = objc_msgSend(v8, "height");

  v18[0] = v14;
  v18[1] = v15;
  v18[2] = 1;
  v16 = xmmword_1C9323090;
  v17 = 1;
  objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v13, "endEncoding");

}

- (unsigned)tensorSwap:(int)a3
{
  uint64_t v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  int v11;
  id v12;
  int v13;
  unsigned int v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_tensorSwap;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
  {
    v14 = 0;
    goto LABEL_17;
  }
  v6 = v5;
  v7 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      objc_msgSend(v9, "tensorNameWithIndex:", 0, (_QWORD)v17);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "UTF8String");
      objc_msgSend(v9, "tensorWithIndex:", v3);
      v11 = espresso_network_bind_cvpixelbuffer();

      if (v11)
      {
        _PTLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        goto LABEL_16;
      }
      objc_msgSend(v9, "tensorNameWithIndex:", 1);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "UTF8String");
      objc_msgSend(v9, "tensorWithIndex:", (v3 + 1));
      v13 = espresso_network_bind_cvpixelbuffer();

      if (v13)
      {
        _PTLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
LABEL_15:
          -[PTEspressoGenericExecutor bindInputResourceWithName:to:].cold.1();
LABEL_16:

        v14 = -1;
        goto LABEL_17;
      }
    }
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    v14 = 0;
    if (v6)
      continue;
    break;
  }
LABEL_17:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkVersion, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_planarToInterleaved, 0);
  objc_storeStrong((id *)&self->_interleavedToPlanar, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_espressoCallbackQueue, 0);
  objc_storeStrong((id *)&self->_tensorSwap, 0);
  objc_storeStrong((id *)&self->_outputPlanarToInterleavedConversion, 0);
  objc_storeStrong((id *)&self->_inputInterleavedToPlanarConversion, 0);
  objc_storeStrong((id *)&self->_outputsMap, 0);
  objc_storeStrong((id *)&self->_inputsMap, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_interleavedToPlanar";
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a1, a3, "Assertion failed %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_planarToInterleaved";
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a1, a3, "Assertion failed %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "Error creating espresso context %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "Expresso cannot bind output buffer %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "Espresso cannot bind input buffer %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "Espresso error building plan: %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "Error espresso_network_change_input_blob_shapes_seq: %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "Error espresso_network_select_configuration: %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1C9281000, v1, OS_LOG_TYPE_DEBUG, "network version: %s for %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(os_log_t)log url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "unknown version of espresso model loaded", v1, 2u);
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "Error espresso set priority: %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "Error espresso plan add network: %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)bindTensorSwaps:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a3, v5, "espresso_network_bind_buffer %@ failed", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)bindBuffers:(uint64_t *)a3 toMap:(NSObject *)a4 isInput:.cold.1(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = objc_msgSend(a2, "pixelFormat");
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_error_impl(&dword_1C9281000, a4, OS_LOG_TYPE_ERROR, "MTLPixelFormatR16Float/MTLPixelFormatR8Unorm expected, got %lu", a1, 0xCu);
}

- (void)bindBuffers:toMap:isInput:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "espresso_network_bind_buffer %@ failed", v2);
  OUTLINED_FUNCTION_1();
}

- (void)bindBuffers:toMap:isInput:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "Name %@ not found", v2);
  OUTLINED_FUNCTION_1();
}

- (void)bindInputResourceWithName:to:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "espresso_network_bind_cvpixelbuffer: espresso error %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)convertBindInput:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "metalContext.commandBuffer";
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a1, a3, "Assertion failed %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)execute
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "espresso_plan_execute_sync: espresso error %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)executeAsync:metalContext:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1C9281000, v0, v1, "espresso_plan_submit: espresso error %s for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __55__PTEspressoGenericExecutor_executeAsync_metalContext___block_invoke_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *((_QWORD *)a1 + 1);
  v4 = *a1;
  v5 = a1[1];
  v6 = *(_QWORD *)(*(_QWORD *)(a2 + 32) + 112);
  v7 = 136315906;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  v11 = 1024;
  v12 = v5;
  v13 = 2112;
  v14 = v6;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "espresso_plan_submit callback. %s %i %i for %@", (uint8_t *)&v7, 0x22u);
}

@end

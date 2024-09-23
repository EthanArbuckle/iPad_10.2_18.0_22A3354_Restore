@implementation PTRenderPipeline

- (PTRenderPipeline)initWithDescriptor:(id)a3
{
  id v4;
  PTRenderPipeline *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PTRenderPipelineDescriptor *descriptor;
  void *v19;
  uint64_t v20;
  PTMetalContext *metalContext;
  PTMetalContext *v22;
  void *v23;
  uint64_t v24;
  PTMetalContext *v25;
  void *v26;
  double v27;
  unint64_t v28;
  double v29;
  unint64_t v30;
  double v31;
  unint64_t v32;
  double v33;
  unint64_t v34;
  double v35;
  unint64_t v36;
  double v37;
  unint64_t v38;
  double v39;
  unint64_t v40;
  double v41;
  uint64_t v42;
  NSString *description;
  PTRenderPipeline *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PTRenderPipeline;
  v5 = -[PTRenderPipeline init](&v46, sel_init);
  if (v5
    && (objc_msgSend(v4, "device"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = +[PTRenderPipeline isMetalDeviceSupported:](PTRenderPipeline, "isMetalDeviceSupported:", v6),
        v6,
        v7))
  {
    PTKTraceInit();
    kdebug_trace();
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PTRenderPipeline initWithDescriptor:].cold.2(v8);

    if (!v4)
    {
      _PTLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[PTRenderPipeline initWithDescriptor:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    }
    v17 = objc_msgSend(v4, "copy");
    descriptor = v5->_descriptor;
    v5->_descriptor = (PTRenderPipelineDescriptor *)v17;

    v5->_activeVersion = objc_msgSend(v4, "version");
    objc_msgSend(v4, "options");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", &unk_1E82525F8);
    v20 = objc_claimAutoreleasedReturnValue();
    metalContext = v5->_metalContext;
    v5->_metalContext = (PTMetalContext *)v20;

    if (!v5->_metalContext)
    {
      v22 = [PTMetalContext alloc];
      objc_msgSend(v4, "device");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[PTMetalContext initWithDevice:bundleClass:](v22, "initWithDevice:bundleClass:", v23, objc_opt_class());
      v25 = v5->_metalContext;
      v5->_metalContext = (PTMetalContext *)v24;

      -[PTMetalContext setAllowCommandbufferAllocation:](v5->_metalContext, "setAllowCommandbufferAllocation:", 0);
    }
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "disparitySize");
    v28 = (unint64_t)v27;
    objc_msgSend(v4, "disparitySize");
    v30 = (unint64_t)v29;
    objc_msgSend(v4, "disparitySize");
    v32 = (unint64_t)v31;
    objc_msgSend(v4, "disparitySize");
    v34 = (unint64_t)v33;
    objc_msgSend(v4, "colorInputSize");
    v36 = (unint64_t)v35;
    objc_msgSend(v4, "colorInputSize");
    v38 = (unint64_t)v37;
    objc_msgSend(v4, "colorOutputSize");
    v40 = (unint64_t)v39;
    objc_msgSend(v4, "colorOutputSize");
    objc_msgSend(v26, "stringWithFormat:", CFSTR("i-disp: %lux%lu u-disp: %lux%lu colorInput: %lux%lu colorOutput: %lux%lu"), v28, v30, v32, v34, v36, v38, v40, (unint64_t)v41);
    v42 = objc_claimAutoreleasedReturnValue();
    description = v5->_description;
    v5->_description = (NSString *)v42;

    kdebug_trace();
    v44 = v5;
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (id)createRenderStateWithQuality:(int)a3
{
  return -[PTRenderPipelineState initWithPipelineDescriptor:metalContext:quality:]([PTRenderPipelineState alloc], "initWithPipelineDescriptor:metalContext:quality:", self->_descriptor, self->_metalContext, *(_QWORD *)&a3);
}

+ (BOOL)isMetalDeviceSupported:(id)a3
{
  char v3;
  NSObject *v4;

  v3 = objc_msgSend(a3, "supportsNonUniformThreadgroupSize");
  if ((v3 & 1) == 0)
  {
    _PTLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[PTRenderPipeline isMetalDeviceSupported:].cold.1();

  }
  return v3;
}

- (id)description
{
  return self->_description;
}

+ (id)debugRenderOptions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (BOOL)isRenderVersionSupported:(unint64_t)a3
{
  return +[PTRenderPipelineState classForVersion:](PTRenderPipelineState, "classForVersion:", a3) != 0;
}

+ (unint64_t)latestVersion
{
  return 3;
}

- (unint64_t)activeVersion
{
  return self->_activeVersion;
}

- (void)setActiveVersion:(unint64_t)a3
{
  self->_activeVersion = a3;
}

+ (int)prewarmWithDescriptor:(id)a3
{
  id v3;
  PTRenderPipeline *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  kdebug_trace();
  v4 = -[PTRenderPipeline initWithDescriptor:]([PTRenderPipeline alloc], "initWithDescriptor:", v3);
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(&unk_1E8252EB0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(&unk_1E8252EB0);
          -[PTRenderPipeline createRenderStateWithQuality:](v4, "createRenderStateWithQuality:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "intValue"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "prepareForRendering:", 1) & 1) == 0)
          {
            _PTLogSystem();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              +[PTRenderPipeline prewarmWithDescriptor:].cold.1();

            goto LABEL_14;
          }

        }
        v6 = objc_msgSend(&unk_1E8252EB0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    kdebug_trace();
    v10 = 0;
  }
  else
  {
LABEL_14:
    v10 = -1;
  }

  return v10;
}

+ (int)prewarmForMediaserverd
{
  return +[PTRenderPipeline prewarmForCameraCaptured](PTRenderPipeline, "prewarmForCameraCaptured");
}

+ (int)prewarmForCameraCaptured
{
  double v2;
  id v3;
  PTRenderPipelineDescriptor *v4;
  PTRenderPipelineDescriptor *v5;
  PTRenderPipelineDescriptor *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  double v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  int v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[5];

  v51[3] = *MEMORY[0x1E0C80C00];
  v2 = CACurrentMediaTime();
  kdebug_trace();
  v3 = MTLCreateSystemDefaultDevice();
  v4 = -[PTRenderPipelineDescriptor initWithDevice:version:colorSize:disparitySize:]([PTRenderPipelineDescriptor alloc], "initWithDevice:version:colorSize:disparitySize:", v3, 1, 2112.0, 1188.0, 320.0, 180.0);
  v51[0] = v4;
  v5 = -[PTRenderPipelineDescriptor initWithDevice:version:colorSize:disparitySize:]([PTRenderPipelineDescriptor alloc], "initWithDevice:version:colorSize:disparitySize:", v3, 2, 2112.0, 1188.0, 512.0, 288.0);
  v51[1] = v5;
  v38 = v3;
  v6 = -[PTRenderPipelineDescriptor initWithDevice:version:colorSize:disparitySize:]([PTRenderPipelineDescriptor alloc], "initWithDevice:version:colorSize:disparitySize:", v3, 3, 2112.0, 1188.0, 512.0, 288.0);
  v51[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (!v9)
  {

LABEL_11:
    _PTLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[PTRenderPipeline prewarmForCameraCaptured].cold.3();

    goto LABEL_14;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v44 != v12)
        objc_enumerationMutation(v8);
      v14 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "version");
      v11 |= v14 == +[PTRenderPipeline latestVersion](PTRenderPipeline, "latestVersion");
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  }
  while (v10);

  if ((v11 & 1) == 0)
    goto LABEL_11;
LABEL_14:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
        v23 = (void *)MEMORY[0x1CAA3ACDC]();
        v24 = +[PTRenderPipeline prewarmWithDescriptor:](PTRenderPipeline, "prewarmWithDescriptor:", v22);
        if (v24)
        {
          v25 = v24;
          _PTLogSystem();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v48 = v25;
            _os_log_error_impl(&dword_1C9281000, v26, OS_LOG_TYPE_ERROR, "Failed to prewarm PTRenderPipeline (%d)", buf, 8u);
          }

          v19 = v25;
        }
        objc_autoreleasePoolPop(v23);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  v27 = CACurrentMediaTime() - v2;
  kdebug_trace();
  _PTLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v27 <= 1.0)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      +[PTRenderPipeline prewarmForCameraCaptured].cold.2(v29, v27);
  }
  else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    +[PTRenderPipeline prewarmForCameraCaptured].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
  }

  return v19;
}

- (void)prewarm
{
  PTRenderPipelineDescriptor *v3;
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PTRenderPipelineDescriptor *v12;

  v3 = [PTRenderPipelineDescriptor alloc];
  -[PTMetalContext device](self->_metalContext, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PTRenderPipeline latestVersion](PTRenderPipeline, "latestVersion");
  -[PTRenderPipelineDescriptor colorInputSize](self->_descriptor, "colorInputSize");
  v7 = v6;
  v9 = v8;
  -[PTRenderPipelineDescriptor disparitySize](self->_descriptor, "disparitySize");
  v12 = -[PTRenderPipelineDescriptor initWithDevice:version:colorSize:disparitySize:](v3, "initWithDevice:version:colorSize:disparitySize:", v4, v5, v7, v9, v10, v11);

  +[PTRenderPipeline prewarmWithDescriptor:](PTRenderPipeline, "prewarmWithDescriptor:", v12);
}

- (int)encodeRenderTo:(id)a3 withRenderRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "renderState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "encodeRenderTo:withRenderRequest:", v6, v5);

  return v8;
}

- (unint64_t)minimumResourceHeapSize
{
  NSObject *v2;

  _PTLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[PTRenderPipeline minimumResourceHeapSize].cold.1();

  return 0;
}

- (void)setResourceHeap:(id)a3
{
  NSObject *v3;

  _PTLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[PTRenderPipeline setResourceHeap:].cold.1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithDescriptor:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(os_log_t)log .cold.2(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 20240705;
  _os_log_debug_impl(&dword_1C9281000, log, OS_LOG_TYPE_DEBUG, "PortraitRuntimeAPIVersion %i", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_12();
}

+ (void)isMetalDeviceSupported:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_17();
  _os_log_debug_impl(&dword_1C9281000, v0, OS_LOG_TYPE_DEBUG, "PTRenderPipeline requires Metal support for Non Uniform Threadgroup Size", v1, 2u);
  OUTLINED_FUNCTION_12();
}

+ (void)prewarmWithDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "prepareForRendering failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

+ (void)prewarmForCameraCaptured
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Failed to prewarm PTRenderPipeline: latest version not included", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)minimumResourceHeapSize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "minimumResourceHeapSize currently unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)setResourceHeap:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "setResourceHeap currently unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end

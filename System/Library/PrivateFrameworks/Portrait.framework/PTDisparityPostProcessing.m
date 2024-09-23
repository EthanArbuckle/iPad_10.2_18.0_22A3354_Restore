@implementation PTDisparityPostProcessing

- (PTDisparityPostProcessing)initWithCommandQueue:(id)a3 disparitySize:(id *)a4 filteredDisparitySize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9
{
  id v15;
  id v16;
  char *v17;
  __int128 v18;
  unint64_t var2;
  unint64_t v20;
  PTMetalContext *v21;
  void *v22;
  PTDisparityFilterDEMA_LKT *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  PTDisparityPostProcessing *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v44;
  unint64_t v45;
  __int128 v46;
  unint64_t v47;
  __int128 v48;
  unint64_t v49;
  objc_super v50;

  v15 = a3;
  v16 = a9;
  v50.receiver = self;
  v50.super_class = (Class)PTDisparityPostProcessing;
  v17 = -[PTDisparityPostProcessing init](&v50, sel_init);
  if (!v17)
    goto LABEL_10;
  PTKTraceInit();
  kdebug_trace();
  v18 = *(_OWORD *)&a5->var0;
  *((_QWORD *)v17 + 5) = a5->var2;
  *(_OWORD *)(v17 + 24) = v18;
  var2 = a4->var2;
  *((_OWORD *)v17 + 3) = *(_OWORD *)&a4->var0;
  *((_QWORD *)v17 + 8) = var2;
  v20 = a7->var2;
  *(_OWORD *)(v17 + 72) = *(_OWORD *)&a7->var0;
  *((_QWORD *)v17 + 11) = v20;
  v21 = -[PTMetalContext initWithCommandQueue:bundleClass:]([PTMetalContext alloc], "initWithCommandQueue:bundleClass:", v15, objc_opt_class());
  v22 = (void *)*((_QWORD *)v17 + 2);
  *((_QWORD *)v17 + 2) = v21;

  if (!*((_QWORD *)v17 + 2))
  {
    _PTLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PTDisparityPostProcessing initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);
    goto LABEL_9;
  }
  v23 = [PTDisparityFilterDEMA_LKT alloc];
  v24 = *((_QWORD *)v17 + 2);
  v48 = *(_OWORD *)&a4->var0;
  v49 = a4->var2;
  v46 = *(_OWORD *)&a5->var0;
  v47 = a5->var2;
  v44 = *(_OWORD *)&a7->var0;
  v45 = a7->var2;
  v25 = -[PTDisparityFilterDEMA_LKT initWithMetalContext:disparitySize:disparityFilteredSize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:](v23, "initWithMetalContext:disparitySize:disparityFilteredSize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:", v24, &v48, &v46, a6, &v44, a8, v16);
  v26 = (void *)*((_QWORD *)v17 + 1);
  *((_QWORD *)v17 + 1) = v25;

  if (!*((_QWORD *)v17 + 1))
  {
    _PTLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PTDisparityPostProcessing initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:].cold.2(v28, v36, v37, v38, v39, v40, v41, v42);
LABEL_9:

LABEL_10:
    v27 = 0;
    goto LABEL_11;
  }
  kdebug_trace();
  v27 = v17;
LABEL_11:

  return v27;
}

- (PTDisparityPostProcessing)initWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  PTDisparityPostProcessing *v9;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];

  v4 = a3;
  objc_msgSend(v4, "commandQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "disparitySize");
    objc_msgSend(v4, "filteredDisparitySize");
    v6 = objc_msgSend(v4, "disparityPixelFormat");
    objc_msgSend(v4, "colorSize");
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    memset(v12, 0, sizeof(v12));
    v6 = objc_msgSend(0, "disparityPixelFormat");
    memset(v11, 0, sizeof(v11));
  }
  v7 = objc_msgSend(v4, "colorPixelFormat");
  objc_msgSend(v4, "sensorPort");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PTDisparityPostProcessing initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:](self, "initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:", v5, v13, v12, v6, v11, v7, v8);

  return v9;
}

+ (int)prewarmWithDescriptor:(id)a3
{
  id v3;
  PTDisparityPostProcessing *v4;
  int v5;

  v3 = a3;
  v4 = -[PTDisparityPostProcessing initWithDescriptor:]([PTDisparityPostProcessing alloc], "initWithDescriptor:", v3);

  if (v4)
    v5 = 0;
  else
    v5 = -1;

  return v5;
}

+ (int)prewarmForMediaserverd
{
  return +[PTDisparityPostProcessing prewarmForCameraCaptured](PTDisparityPostProcessing, "prewarmForCameraCaptured");
}

+ (int)prewarmForCameraCaptured
{
  id v2;
  void *v3;
  PTDisparityPostProcessingDescriptor *v4;
  int v5;
  NSObject *v6;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v2 = MTLCreateSystemDefaultDevice();
  v3 = (void *)objc_msgSend(v2, "newCommandQueue");
  v12 = xmmword_1C9323030;
  v13 = 1;
  v10 = xmmword_1C9323030;
  v11 = 1;
  v8 = xmmword_1C9323030;
  v9 = 1;
  v4 = -[PTDisparityPostProcessingDescriptor initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:]([PTDisparityPostProcessingDescriptor alloc], "initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:", v3, &v12, &v10, 25, &v8, 71, CFSTR("PortTypeBackSuperWide"));
  v5 = +[PTDisparityPostProcessing prewarmWithDescriptor:](PTDisparityPostProcessing, "prewarmWithDescriptor:", v4);
  if (v5)
  {
    _PTLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[PTDisparityPostProcessing prewarmForCameraCaptured].cold.1(v5, v6);

  }
  return v5;
}

- (int)computeOpticalFlow:(id)a3 outDisplacement:(id)a4
{
  PTDisparityPostProcessing *v5;
  PTMetalContext *metalContext;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = self;
  metalContext = self->_metalContext;
  v7 = a4;
  v8 = a3;
  -[PTMetalContext commandQueue](metalContext, "commandQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commandBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = -[PTDisparityPostProcessing computeOpticalFlow:inRGBA:outDisplacement:](v5, "computeOpticalFlow:inRGBA:outDisplacement:", v10, v8, v7);
  objc_msgSend(v10, "commit");

  return (int)v5;
}

- (int)computeOpticalFlow:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  $E8CF8C4D35898297CF58D66FCEA3D064 colorSize;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  colorSize = self->_colorSize;
  if (isExpectedSize(v10, (uint64_t *)&colorSize, CFSTR("Invalid size of outDisplacement")))
  {
    if (!v8)
    {
      _PTLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PTEffect updateEffectDelegate:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    }
    v19 = -[PTAbstractDisparityFilter prepareFilter:inRGBA:outDisplacement:](self->_disparityFilter, "prepareFilter:inRGBA:outDisplacement:", v8, v9, v10);
  }
  else
  {
    v19 = -10;
  }

  return v19;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityFilteredPrev:(id)a5 outDisparityFiltered:(id)a6 disparityBias:(float)a7
{
  PTDisparityPostProcessing *v11;
  PTMetalContext *metalContext;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;

  v11 = self;
  metalContext = self->_metalContext;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PTMetalContext commandQueue](metalContext, "commandQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v19 = a7;
  LODWORD(v11) = -[PTDisparityPostProcessing temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:](v11, "temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:", v18, v16, v15, v14, v13, v19);

  objc_msgSend(v18, "commit");
  return (int)v11;
}

- (int)temporalDisparityFilter:(id)a3 inDisparity:(id)a4 inDisplacement:(id)a5 inDisparityFilteredPrev:(id)a6 outDisparityFiltered:(id)a7 disparityBias:(float)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  unint64_t width;
  unint64_t height;
  uint64_t v35;
  uint64_t v36;
  $E8CF8C4D35898297CF58D66FCEA3D064 disparitySize;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  disparitySize = self->_disparitySize;
  if (isExpectedSize(v15, (uint64_t *)&disparitySize, CFSTR("Invalid size of inDisparity"))
    && (disparitySize = self->_colorSize,
        isExpectedSize(v16, (uint64_t *)&disparitySize, CFSTR("Invalid size of inDisplacement")))
    && (disparitySize = self->_filteredDisparitySize,
        (isExpectedSize(v18, (uint64_t *)&disparitySize, CFSTR("Invalid size of outDisparity")) & 1) != 0))
  {
    if (!v14)
    {
      _PTLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PTEffect updateEffectDelegate:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    }
    *(float *)&v19 = a8;
    v28 = -[PTAbstractDisparityFilter temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:](self->_disparityFilter, "temporalDisparityFilter:inDisplacement:inDisparityPrev:inDisparity:outDisparity:disparityBias:", v14, v16, v17, v15, v18, v19);
  }
  else
  {
    _PTLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      width = self->_disparitySize.width;
      height = self->_disparitySize.height;
      v35 = objc_msgSend(v15, "width");
      v36 = objc_msgSend(v15, "height");
      LODWORD(disparitySize.width) = 134218752;
      *(unint64_t *)((char *)&disparitySize.width + 4) = width;
      WORD2(disparitySize.height) = 2048;
      *(unint64_t *)((char *)&disparitySize.height + 6) = height;
      HIWORD(disparitySize.depth) = 2048;
      v38 = v35;
      v39 = 2048;
      v40 = v36;
      _os_log_error_impl(&dword_1C9281000, v29, OS_LOG_TYPE_ERROR, "disparity size expected (%zu x %zu) was (%zu x %zu)", (uint8_t *)&disparitySize, 0x2Au);
    }

    _PTLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[PTDisparityPostProcessing temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:].cold.3();

    _PTLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[PTDisparityPostProcessing temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:].cold.2();

    v28 = -10;
  }

  return v28;
}

- (int)temporalDisparityFilter:(id)a3 inStatePrev:(id)a4 inDisparity:(id)a5 outDisparityFiltered:(id)a6 outState:(id)a7
{
  PTDisparityPostProcessing *v11;
  PTMetalContext *metalContext;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v11 = self;
  metalContext = self->_metalContext;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[PTMetalContext commandQueue](metalContext, "commandQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commandBuffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = -[PTDisparityPostProcessing temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparityFiltered:outState:](v11, "temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparityFiltered:outState:", v19, v17, v16, v15, v14, v13);
  objc_msgSend(v19, "commit");

  return (int)v11;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparityFiltered:(id)a7 outState:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  unint64_t width;
  uint64_t v34;
  uint64_t v35;
  unint64_t height;
  $E8CF8C4D35898297CF58D66FCEA3D064 buf;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  buf = self->_disparitySize;
  if (isExpectedSize(v17, (uint64_t *)&buf, CFSTR("Invalid size of inDisparity"))
    && (buf = self->_colorSize,
        isExpectedSize(v15, (uint64_t *)&buf, CFSTR("Invalid size of inDisplacement")))
    && (buf = self->_filteredDisparitySize,
        (isExpectedSize(v18, (uint64_t *)&buf, CFSTR("Invalid size of outDisparityFiltered")) & 1) != 0))
  {
    if (!v14)
    {
      _PTLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PTEffect updateEffectDelegate:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    }
    v28 = -[PTAbstractDisparityFilter temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparity:outState:](self->_disparityFilter, "temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparity:outState:", v14, v15, v16, v17, v18, v19);
  }
  else
  {
    _PTLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      width = self->_disparitySize.width;
      height = self->_disparitySize.height;
      v34 = objc_msgSend(v17, "width");
      v35 = objc_msgSend(v17, "height");
      LODWORD(buf.width) = 134218752;
      *(unint64_t *)((char *)&buf.width + 4) = width;
      WORD2(buf.height) = 2048;
      *(unint64_t *)((char *)&buf.height + 6) = height;
      HIWORD(buf.depth) = 2048;
      v38 = v34;
      v39 = 2048;
      v40 = v35;
      _os_log_error_impl(&dword_1C9281000, v29, OS_LOG_TYPE_ERROR, "disparity size expected (%zu x %zu) was (%zu x %zu)", (uint8_t *)&buf, 0x2Au);
    }

    _PTLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[PTDisparityPostProcessing temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:].cold.3();

    _PTLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[PTDisparityPostProcessing temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:].cold.2();

    v28 = -10;
  }

  return v28;
}

- (void)reset
{
  -[PTAbstractDisparityFilter reset](self->_disparityFilter, "reset");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_disparityFilter, 0);
}

- (void)initWithCommandQueue:(uint64_t)a3 disparitySize:(uint64_t)a4 filteredDisparitySize:(uint64_t)a5 disparityPixelFormat:(uint64_t)a6 colorSize:(uint64_t)a7 colorPixelFormat:(uint64_t)a8 sensorPort:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCommandQueue:(uint64_t)a3 disparitySize:(uint64_t)a4 filteredDisparitySize:(uint64_t)a5 disparityPixelFormat:(uint64_t)a6 colorSize:(uint64_t)a7 colorPixelFormat:(uint64_t)a8 sensorPort:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)prewarmForCameraCaptured
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "Failed to prewarm PTDisparityPostProcessing (%d)", (uint8_t *)v2, 8u);
}

- (void)temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:.cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_2(v0, v1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_2(&dword_1C9281000, v2, v3, "outDisparity size expected (%zu x %zu) was (%zu x %zu)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_2();
}

- (void)temporalDisparityFilter:inDisparity:inDisplacement:inDisparityFilteredPrev:outDisparityFiltered:disparityBias:.cold.3()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_2(v0, v1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_2(&dword_1C9281000, v2, v3, "inDisplacement size expected (%zu x %zu) was (%zu x %zu)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_2();
}

@end

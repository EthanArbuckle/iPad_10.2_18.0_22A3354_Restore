@implementation SISceneUnderstanding

- (SISceneUnderstanding)initWithComputeEngine:(int64_t)a3
{
  SISceneUnderstanding *v4;
  SISceneUnderstanding *v5;
  SISceneUnderstanding *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SISceneUnderstanding;
  v4 = -[SISceneUnderstanding init](&v8, sel_init);
  v5 = v4;
  if (v4 && -[SISceneUnderstanding initMLNetworkWithComputeEngine:](v4, "initMLNetworkWithComputeEngine:", a3))
  {
    v5->_parameters.input.resolution = (CGSize)kSISceneUnderstandingNetworkResolution;
    v5->_parameters.output = (outputparams_t)kSISceneUnderstandingNetworkResolution;
    *(_OWORD *)&v5->_parameters.input.preprocessor.bias_r = xmmword_21074BB50;
    v5->_parameters.input.preprocessor.network_wants_bgr = 0;
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (CGSize)inputResolution
{
  double v2;
  double v3;
  CGSize result;

  v2 = 256.0;
  v3 = 192.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_SITensorDim)labelTensorDimensions
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].value[2];
  *(_OWORD *)retstr->value = *(_OWORD *)self[4].value;
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

- (_SITensorDim)normalTensorDimensions
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].value[2];
  *(_OWORD *)retstr->value = *(_OWORD *)self[5].value;
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

- (_SITensorDim)probabilitiesTensorDimensions
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].value[2];
  *(_OWORD *)retstr->value = *(_OWORD *)self[6].value;
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

- (BOOL)initMLNetworkWithComputeEngine:(int64_t)a3
{
  void *context;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint8_t v18[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint8_t buf[40];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  context = (void *)espresso_create_context();
  self->_context = context;
  if (!context)
    return 0;
  Espresso::get_internal_context((Espresso *)context, v5);
  *(_DWORD *)(v16 + 68) = 1;
  self->_plan = (void *)espresso_create_plan();
  +[SIMSceneUnderstanding compiledModelPath](SIMSceneUnderstanding, "compiledModelPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    __SceneIntelligenceLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SI"
                           "SceneUnderstanding.mm";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 348;
      *(_WORD *)&buf[18] = 2081;
      *(_QWORD *)&buf[20] = objc_msgSend(0, "UTF8String");
      _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not load network %{private}s ***", buf, 0x1Cu);
    }
    goto LABEL_47;
  }
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[NSObject UTF8String](v8, "UTF8String");
  if (espresso_plan_add_network())
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SI"
                           "SceneUnderstanding.mm";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 357;
      *(_WORD *)&buf[18] = 2081;
      *(_QWORD *)&buf[20] = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not add espresso network %{private}s ***", buf, 0x1Cu);
    }
LABEL_6:

LABEL_47:
    v10 = 0;
    goto LABEL_48;
  }
  if (espresso_plan_build())
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SI"
                           "SceneUnderstanding.mm";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 363;
      *(_WORD *)&buf[18] = 2081;
      *(_QWORD *)&buf[20] = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not build espresso plan %{private}s ***", buf, 0x1Cu);
    }
    goto LABEL_6;
  }
  memset(buf, 0, 32);
  objc_msgSend(kSIMSceneUnderstandingInputTensorName, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v20 = 1025;
      v21 = 370;
      v22 = 2081;
      v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = " %{private}s:%{private}d *** Failure to bind input tensor for scene understanding %{private}s ***";
LABEL_45:
      _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, v12, v18, 0x1Cu);
      goto LABEL_46;
    }
    goto LABEL_46;
  }
  objc_msgSend(kSIMSceneUnderstandingOutputLabelsTensorName, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v20 = 1025;
      v21 = 376;
      v22 = 2081;
      v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = " %{private}s:%{private}d *** Failure to determine output tensor shape for scene understanding %{private}s ***";
      goto LABEL_45;
    }
LABEL_46:

    goto LABEL_47;
  }
  objc_msgSend(kSIMSceneUnderstandingOutputNormalsTensorName, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v20 = 1025;
      v21 = 382;
      v22 = 2081;
      v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = " %{private}s:%{private}d *** Failure to determine output tensor shape for scene understanding %{private}s ***";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  objc_msgSend(kSIMSceneUnderstandingOutputProbabilitiesTensorName, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v20 = 1025;
      v21 = 388;
      v22 = 2081;
      v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = " %{private}s:%{private}d *** Failure to determine output tensor shape for scene understanding %{private}s ***";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  if (*(_QWORD *)buf != self->_variables.output.labels.value[0])
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v20 = 1025;
      v21 = 393;
      v22 = 2081;
      v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = " %{private}s:%{private}d *** Input-Output channel [0] size mismatch %{private}s ***";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  if (*(_QWORD *)&buf[8] != self->_variables.output.labels.value[1])
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v20 = 1025;
      v21 = 398;
      v22 = 2081;
      v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = " %{private}s:%{private}d *** Input-Output channel [1] size mismatch %{private}s ***";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  if (*(_QWORD *)&buf[16] != 3)
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v20 = 1025;
      v21 = 403;
      v22 = 2081;
      v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = " %{private}s:%{private}d *** Input channel [2] size mismatch %{private}s ***";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  if (self->_variables.output.labels.value[2] != 1)
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v20 = 1025;
      v21 = 408;
      v22 = 2081;
      v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = " %{private}s:%{private}d *** Output channel [2] size mismatch %{private}s ***";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  if (*(_QWORD *)&buf[24] != self->_variables.output.labels.value[3])
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v20 = 1025;
      v21 = 413;
      v22 = 2081;
      v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = " %{private}s:%{private}d *** Input-Output channel [3] size mismatch %{private}s ***";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  if (*(_QWORD *)&buf[8] != 192)
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136381187;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v20 = 1025;
      v21 = 423;
      v22 = 2081;
      v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v12 = " %{private}s:%{private}d *** Input-Output channel [1] not expected size %{private}s ***";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  v10 = 1;
LABEL_48:

  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  return v10;
}

- (int64_t)evaluateImage:(__CVBuffer *)a3 results:(id)a4
{
  id v5;
  size_t Width;
  size_t Height;
  NSObject *v8;
  int64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  int v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  kdebug_trace();
  if (Width != 256 || Height != 192)
  {
    __SceneIntelligenceLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 136380931;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v18 = 1025;
      v19 = 439;
      _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unexpected input resolution ***", (uint8_t *)&v16, 0x12u);
    }
    goto LABEL_10;
  }
  if (CVPixelBufferGetPixelFormatType(a3) == 1111970369)
  {
    objc_msgSend(kSIMSceneUnderstandingInputTensorName, "UTF8String");
    if (espresso_network_bind_cvpixelbuffer())
    {
      __SceneIntelligenceLogSharedInstance();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v16 = 136380931;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        v18 = 1025;
        v19 = 454;
        _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to bind network image to espresso input ***", (uint8_t *)&v16, 0x12u);
      }
LABEL_10:

      kdebug_trace();
      v9 = 1;
      goto LABEL_25;
    }
    objc_msgSend(kSIMSceneUnderstandingOutputLabelsTensorName, "UTF8String");
    objc_msgSend(v5, "labelsTensor");
    if (espresso_network_bind_buffer())
    {
      __SceneIntelligenceLogSharedInstance();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = 136380931;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        v18 = 1025;
        v19 = 461;
        v12 = " %{private}s:%{private}d *** Failure to bind output labels tensor for scene understanding ***";
LABEL_23:
        _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, 0x12u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    objc_msgSend(kSIMSceneUnderstandingOutputProbabilitiesTensorName, "UTF8String");
    objc_msgSend(v5, "probabilitiesTensor");
    if (espresso_network_bind_buffer())
    {
      __SceneIntelligenceLogSharedInstance();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = 136380931;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        v18 = 1025;
        v19 = 468;
        v12 = " %{private}s:%{private}d *** Failure to bind output probabilities tensor for scene understanding ***";
        goto LABEL_23;
      }
LABEL_24:

      kdebug_trace();
      v9 = 3;
      goto LABEL_25;
    }
    objc_msgSend(kSIMSceneUnderstandingOutputNormalsTensorName, "UTF8String");
    objc_msgSend(v5, "normalsTensor");
    if (espresso_network_bind_buffer())
    {
      __SceneIntelligenceLogSharedInstance();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = 136380931;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        v18 = 1025;
        v19 = 475;
        v12 = " %{private}s:%{private}d *** Failure to bind output normals tensor for scene understanding ***";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    kdebug_trace();
    v14 = espresso_plan_execute_sync();
    kdebug_trace();
    if (v14)
    {
      __SceneIntelligenceLogSharedInstance();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = 136380931;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        v18 = 1025;
        v19 = 484;
        _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to run network ***", (uint8_t *)&v16, 0x12u);
      }

      kdebug_trace();
      v9 = 4;
    }
    else
    {
      kdebug_trace();
      v9 = 0;
    }
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 136380931;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      v18 = 1025;
      v19 = 446;
      _os_log_impl(&dword_21071A000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unexpected input pixel format ***", (uint8_t *)&v16, 0x12u);
    }

    kdebug_trace();
    v9 = 2;
  }
LABEL_25:

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)SISceneUnderstanding;
  -[SISceneUnderstanding dealloc](&v3, sel_dealloc);
}

@end

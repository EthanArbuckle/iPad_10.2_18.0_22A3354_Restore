@implementation SIAlgorithm

+ (Class)inputDataClass
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
    v6 = 1025;
    v7 = 35;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Expected input class must be overriden ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

+ (Class)outputDataClass
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
    v6 = 1025;
    v7 = 42;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Expected output class must be overriden ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

+ (id)initWithNetworkConfiguration:(id)a3
{
  id v3;
  NSString *v4;
  NSString *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "algorithmClassName");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(NSClassFromString(v4)), "initWithNetworkConfiguration:", v3);
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136380931;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
      v11 = 1025;
      v12 = 49;
      _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** algorithm name is not specified in the subclass ***", (uint8_t *)&v9, 0x12u);
    }

    v6 = 0;
  }

  return v6;
}

- (SIAlgorithm)initWithNetworkConfiguration:(id)a3
{
  id v5;
  SIAlgorithm *v6;
  id *p_isa;
  objc_class *v8;
  void *v9;
  NSString *v10;
  uint64_t v11;
  id v12;
  SIAlgorithm *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SIAlgorithm;
  v6 = -[SIAlgorithm init](&v16, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_networkConfiguration, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 20);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(NSClassFromString(v10)), "initWithNetworkConfiguration:", v5);
    v12 = p_isa[2];
    p_isa[2] = (id)v11;

    objc_msgSend(p_isa[2], "setMappingId:", (int)objc_msgSend(v5, "signpostMappingID"));
    if (p_isa[2])
    {
      v13 = p_isa;
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
        v19 = 1025;
        v20 = 76;
        _os_log_impl(&dword_21071A000, v14, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to initialize ML model ***", buf, 0x12u);
      }

      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CGSize)getOutputResolution
{
  double v2;
  double v3;
  CGSize result;

  -[SIModel getOutputResolution](self->_model, "getOutputResolution");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)getInputResolution
{
  double v2;
  double v3;
  CGSize result;

  -[SIModel getInputResolution](self->_model, "getInputResolution");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)networkVersion
{
  return -[SIModel networkVersion](self->_model, "networkVersion");
}

- (int64_t)runWithInput:(id)a3 output:(id)a4
{
  return -[SIAlgorithm runWithInput:output:resolutionConfiguration:](self, "runWithInput:output:resolutionConfiguration:", a3, a4, -1);
}

- (int64_t)_runWithInput:(id)a3 output:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  objc_class *v15;
  objc_class *v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SIModel setFrameTimestamp:](self->_model, "setFrameTimestamp:", CFAbsoluteTimeGetCurrent());
  objc_msgSend((id)objc_opt_class(), "inputDataClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_msgSend((id)objc_opt_class(), "inputDataClass");
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136381443;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
      v20 = 1025;
      v21 = 106;
      v22 = 2113;
      v23 = v11;
      v24 = 2113;
      v25 = v13;
      v14 = " %{private}s:%{private}d *** Unexpected input data: %{private}@. (Expected %{private}@) ***";
LABEL_10:
      _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, 0x26u);

    }
LABEL_11:

    v8 = 6;
    goto LABEL_12;
  }
  objc_msgSend((id)objc_opt_class(), "outputDataClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_msgSend((id)objc_opt_class(), "outputDataClass");
      NSStringFromClass(v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136381443;
      v19 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
      v20 = 1025;
      v21 = 112;
      v22 = 2113;
      v23 = v11;
      v24 = 2113;
      v25 = v13;
      v14 = " %{private}s:%{private}d *** Unexpected output data: %{private}@. (Expected %{private}@) ***";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  -[SIModel algorithmNameHash](self->_model, "algorithmNameHash");
  -[SIModel mappingId](self->_model, "mappingId");
  kdebug_trace();
  v8 = -[SIAlgorithm _preprocessingInputData:](self, "_preprocessingInputData:", v6);
  -[SIModel algorithmNameHash](self->_model, "algorithmNameHash");
  -[SIModel mappingId](self->_model, "mappingId");
  kdebug_trace();
  if (!v8)
  {
    -[SIModel algorithmNameHash](self->_model, "algorithmNameHash");
    -[SIModel mappingId](self->_model, "mappingId");
    kdebug_trace();
    v8 = -[SIAlgorithm _inferenceWithInput:output:](self, "_inferenceWithInput:output:", v6, v7);
    -[SIModel algorithmNameHash](self->_model, "algorithmNameHash");
    -[SIModel mappingId](self->_model, "mappingId");
    kdebug_trace();
    if (!v8)
    {
      -[SIModel algorithmNameHash](self->_model, "algorithmNameHash");
      -[SIModel mappingId](self->_model, "mappingId");
      kdebug_trace();
      v8 = -[SIAlgorithm _postprocessingOutput:](self, "_postprocessingOutput:", v7);
      -[SIModel algorithmNameHash](self->_model, "algorithmNameHash");
      -[SIModel mappingId](self->_model, "mappingId");
      kdebug_trace();
    }
  }
LABEL_12:

  return v8;
}

- (int64_t)runWithInput:(id)a3 output:(id)a4 resolutionConfiguration:(int64_t)a5
{
  id v8;
  id v9;
  int64_t v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[SIModel algorithmNameHash](self->_model, "algorithmNameHash");
  -[SIModel mappingId](self->_model, "mappingId");
  kdebug_trace();
  if (a5 < 0
    || (-[SIModel algorithmNameHash](self->_model, "algorithmNameHash"),
        -[SIModel mappingId](self->_model, "mappingId"),
        kdebug_trace(),
        v10 = -[SIAlgorithm switchConfiguration:](self, "switchConfiguration:", a5),
        -[SIModel algorithmNameHash](self->_model, "algorithmNameHash"),
        -[SIModel mappingId](self->_model, "mappingId"),
        kdebug_trace(),
        !v10))
  {
    v10 = -[SIAlgorithm _runWithInput:output:](self, "_runWithInput:output:", v8, v9);
    -[SIModel algorithmNameHash](self->_model, "algorithmNameHash");
    -[SIModel mappingId](self->_model, "mappingId");
    kdebug_trace();
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136380931;
      v14 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
      v15 = 1025;
      v16 = 163;
      _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to switch configuration! ***", (uint8_t *)&v13, 0x12u);
    }

  }
  return v10;
}

- (int64_t)switchConfiguration:(unint64_t)a3
{
  int64_t result;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  result = -[SIModel switchNetworkConfiguration:](self->_model, "switchNetworkConfiguration:", a3);
  if (result)
  {
    __SceneIntelligenceLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136380931;
      v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
      v7 = 1025;
      v8 = 183;
      _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** fail to switch the configuration! The output is not updated ***", (uint8_t *)&v5, 0x12u);
    }

    return 5;
  }
  return result;
}

- (int64_t)_preprocessingInputData:(id)a3
{
  return 0;
}

- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4
{
  return 0;
}

- (int64_t)_postprocessingOutput:(id)a3
{
  return 0;
}

- (void)addPrewiringBuffersToStreamWithInputPools:(id)a3 outputPools:(id)a4
{
  -[SIModel addPrewiringBuffersToStreamWithInputPools:outputPools:clearWiredBuffer:](self->_model, "addPrewiringBuffersToStreamWithInputPools:outputPools:clearWiredBuffer:", a3, a4, 1);
}

- (id)createEmptyInputDataWithExpectedFormat
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIAlgorithm.m";
    v6 = 1025;
    v7 = 216;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Must be implemented by the subclass ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (id)subLoggers
{
  return -[SIModel subLoggers](self->_model, "subLoggers");
}

- (SINetworkConfiguration)networkConfiguration
{
  return (SINetworkConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNetworkConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (SIModel)model
{
  return (SIModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_networkConfiguration, 0);
}

@end

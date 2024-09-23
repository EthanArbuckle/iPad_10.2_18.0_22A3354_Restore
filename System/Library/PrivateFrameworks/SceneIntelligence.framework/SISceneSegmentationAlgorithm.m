@implementation SISceneSegmentationAlgorithm

+ (Class)outputDataClass
{
  return (Class)objc_opt_class();
}

+ (Class)inputDataClass
{
  return (Class)objc_opt_class();
}

- (SISceneSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4 uncertaintyThreshold:(float)a5
{
  SISceneSegmentationNetworkConfiguration *v9;
  double v10;
  SISceneSegmentationAlgorithm *v11;

  v9 = objc_alloc_init(SISceneSegmentationNetworkConfiguration);
  -[SINetworkConfiguration setEngineType:](v9, "setEngineType:", a3);
  -[SISceneSegmentationNetworkConfiguration setNetworkModeEnum:](v9, "setNetworkModeEnum:", a4);
  -[SINetworkConfiguration setRunByE5RT:](v9, "setRunByE5RT:", 1);
  *(float *)&v10 = a5;
  -[SISceneSegmentationNetworkConfiguration setUncertaintyThreshold:](v9, "setUncertaintyThreshold:", v10);
  -[SISceneSegmentationNetworkConfiguration setModelConfig:](v9, "setModelConfig:", 1);
  v11 = -[SISceneSegmentationAlgorithm initWithNetworkConfiguration:](self, "initWithNetworkConfiguration:", v9);

  return v11;
}

- (int64_t)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 confidenceOutput:(__IOSurface *)a5 uncertaintyOutput:(__IOSurface *)a6 resampleOutput:(BOOL)a7 networkConfiguration:(int64_t)a8
{
  SIImageInputData *v14;
  NSObject *v15;
  int64_t v16;
  SISceneSegmentationData *v18;
  CVPixelBufferRef v19;
  CVPixelBufferRef texture;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v14 = objc_alloc_init(SIImageInputData);
  -[SIImageInputData setInputImageBuffer:](v14, "setInputImageBuffer:", a3);
  -[SIImageInputData setInputDepthBuffer:](v14, "setInputDepthBuffer:", 0);
  texture = 0;
  pixelBufferOut = 0;
  v19 = 0;
  if (CVPixelBufferCreateWithIOSurface(0, a4, 0, &pixelBufferOut))
  {
    __SceneIntelligenceLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationAlgorithm.m";
      v24 = 1025;
      v25 = 77;
LABEL_7:
      _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to allocate temp buffer for semantic ***", buf, 0x12u);
    }
  }
  else if (CVPixelBufferCreateWithIOSurface(0, a5, 0, &texture))
  {
    __SceneIntelligenceLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationAlgorithm.m";
      v24 = 1025;
      v25 = 79;
      goto LABEL_7;
    }
  }
  else
  {
    if (!a6 || !CVPixelBufferCreateWithIOSurface(0, a6, 0, &v19))
    {
      v18 = [SISceneSegmentationData alloc];
      v15 = -[SISceneSegmentationData initWithOutputSemanticBuffer:confidenceBuffer:uncertaintyBuffer:](v18, "initWithOutputSemanticBuffer:confidenceBuffer:uncertaintyBuffer:", pixelBufferOut, texture, v19);
      CVPixelBufferRelease(pixelBufferOut);
      CVPixelBufferRelease(texture);
      CVPixelBufferRelease(v19);
      v16 = -[SIAlgorithm runWithInput:output:resolutionConfiguration:](self, "runWithInput:output:resolutionConfiguration:", v14, v15, a8);
      goto LABEL_9;
    }
    __SceneIntelligenceLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationAlgorithm.m";
      v24 = 1025;
      v25 = 82;
      goto LABEL_7;
    }
  }
  v16 = 4;
LABEL_9:

  return v16;
}

- (SISceneSegmentationAlgorithm)initWithNetworkConfiguration:(id)a3
{
  id v5;
  SISceneSegmentationAlgorithm *v6;
  SISceneSegmentationAlgorithm *v7;
  uint64_t v8;
  SISceneSegmentation *model;
  SIScaler *v10;
  uint64_t v11;
  SIScaler *scalerOne;
  SIImageInputData *v13;
  SIImageInputData *inputData;
  SISceneSegmentationAlgorithm *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SISceneSegmentationAlgorithm;
  v6 = -[SIAlgorithm initWithNetworkConfiguration:](&v17, sel_initWithNetworkConfiguration_, v5);
  v7 = v6;
  if (v6)
  {
    -[SIAlgorithm model](v6, "model");
    v8 = objc_claimAutoreleasedReturnValue();
    model = v7->_model;
    v7->_model = (SISceneSegmentation *)v8;

    objc_storeStrong((id *)&v7->_configuration, a3);
    v10 = [SIScaler alloc];
    -[SISceneSegmentation getInputResolution](v7->_model, "getInputResolution");
    v11 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v10, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", 1111970369, 0, CFSTR("SceneSegmentation"));
    scalerOne = v7->_scalerOne;
    v7->_scalerOne = (SIScaler *)v11;

    v13 = objc_alloc_init(SIImageInputData);
    inputData = v7->_inputData;
    v7->_inputData = v13;

    v15 = v7;
  }

  return v7;
}

- (int64_t)switchConfiguration:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  SIScaler *v9;
  SIScaler *v10;
  SIScaler *scalerOne;
  objc_super v13;

  -[SIAlgorithm networkConfiguration](self, "networkConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "networkModeEnum");

  v13.receiver = self;
  v13.super_class = (Class)SISceneSegmentationAlgorithm;
  v7 = -[SIAlgorithm switchConfiguration:](&v13, sel_switchConfiguration_, a3);
  if (v7)
    v8 = 1;
  else
    v8 = v6 == a3;
  if (!v8)
  {
    v9 = [SIScaler alloc];
    -[SISceneSegmentation getInputResolution](self->_model, "getInputResolution");
    v10 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v9, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", 1111970369, 0, CFSTR("SceneSegmentation"));
    scalerOne = self->_scalerOne;
    self->_scalerOne = v10;

  }
  return (int64_t)v7;
}

- (int64_t)_preprocessingInputData:(id)a3
{
  __CVBuffer *v4;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = -[SIScaler createScaledImage:](self->_scalerOne, "createScaledImage:", objc_msgSend(a3, "inputImageBuffer"));
  -[SIImageInputData setInputImageBuffer:](self->_inputData, "setInputImageBuffer:", v4);
  CVPixelBufferRelease(v4);
  if (-[SIImageInputData inputImageBuffer](self->_inputData, "inputImageBuffer"))
    return 0;
  __SceneIntelligenceLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136380931;
    v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationAlgorithm.m";
    v9 = 1025;
    v10 = 139;
    _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to scale the input image ***", (uint8_t *)&v7, 0x12u);
  }

  return 1;
}

- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4
{
  return -[SISceneSegmentation evaluateSemanticForImageData:output:](self->_model, "evaluateSemanticForImageData:output:", self->_inputData, a4);
}

- (int64_t)_postprocessingOutput:(id)a3
{
  int64_t v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = -[SISceneSegmentation postprocessingOutput:](self->_model, "postprocessingOutput:", a3);
  if (v3)
  {
    __SceneIntelligenceLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136380931;
      v7 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationAlgorithm.m";
      v8 = 1025;
      v9 = 156;
      _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to do postprocessing for SS result ***", (uint8_t *)&v6, 0x12u);
    }

  }
  return v3;
}

- (SISceneSegmentationNetworkConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_depthScaler, 0);
  objc_storeStrong((id *)&self->_scalerOne, 0);
}

@end

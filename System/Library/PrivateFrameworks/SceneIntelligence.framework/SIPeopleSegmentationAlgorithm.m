@implementation SIPeopleSegmentationAlgorithm

- (SIPeopleSegmentationAlgorithm)initWithInputResolution:(CGSize)a3
{
  SIPeopleSegmentationAlgorithm *v3;

  v3 = -[SIPeopleSegmentationAlgorithm initWithComputeEngine:andNetworkConfiguration:](self, "initWithComputeEngine:andNetworkConfiguration:", SISupportANE(), 0);

  return v3;
}

- (SIPeopleSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3
{
  return -[SIPeopleSegmentationAlgorithm initWithComputeEngine:andNetworkConfiguration:](self, "initWithComputeEngine:andNetworkConfiguration:", a3, 0);
}

- (SIPeopleSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4
{
  return -[SIPeopleSegmentationAlgorithm initWithComputeEngine:andNetworkConfiguration:useAppleNeuralEngineFramework:](self, "initWithComputeEngine:andNetworkConfiguration:useAppleNeuralEngineFramework:", a3, a4, 0);
}

- (SIPeopleSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4 useAppleNeuralEngineFramework:(BOOL)a5
{
  SIPeopleSegmentationNetworkConfiguration *v8;
  SIPeopleSegmentationAlgorithm *v9;

  v8 = objc_alloc_init(SIPeopleSegmentationNetworkConfiguration);
  -[SINetworkConfiguration setEngineType:](v8, "setEngineType:", a3);
  -[SIPeopleSegmentationNetworkConfiguration setNetworkModeEnum:](v8, "setNetworkModeEnum:", a4);
  -[SINetworkConfiguration setRunByE5RT:](v8, "setRunByE5RT:", 1);
  v9 = -[SIPeopleSegmentationAlgorithm initWithNetworkConfiguration:](self, "initWithNetworkConfiguration:", v8);

  return v9;
}

- (int64_t)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4
{
  SIImageInputData *v7;
  SIPeopleSegmentationData *v8;
  id v9;
  objc_super v11;
  CVPixelBufferRef pixelBufferOut;

  v7 = objc_alloc_init(SIImageInputData);
  -[SIImageInputData setInputImageBuffer:](v7, "setInputImageBuffer:", a3);
  v8 = objc_alloc_init(SIPeopleSegmentationData);
  pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface(0, a4, 0, &pixelBufferOut);
  -[SIPeopleSegmentationData setSegmentation:](v8, "setSegmentation:", CVPixelBufferRetain(pixelBufferOut));
  v11.receiver = self;
  v11.super_class = (Class)SIPeopleSegmentationAlgorithm;
  v9 = -[SIAlgorithm runWithInput:output:](&v11, sel_runWithInput_output_, v7, v8);

  return (int64_t)v9;
}

- (int64_t)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 networkConfiguration:(int64_t)a5
{
  int64_t result;

  result = -[SIPeopleSegmentationAlgorithm switchConfiguration:](self, "switchConfiguration:", a5);
  if (!result)
    return -[SIPeopleSegmentationAlgorithm runWithInput:output:](self, "runWithInput:output:", a3, a4);
  return result;
}

- (void)setSnapEveryFrameCount:(unsigned __int8)a3
{
  -[SIPeopleSegmentation setSnapEveryFrameCount:](self->_model, "setSnapEveryFrameCount:", a3);
}

+ (Class)outputDataClass
{
  return (Class)objc_opt_class();
}

+ (Class)inputDataClass
{
  return (Class)objc_opt_class();
}

- (SIPeopleSegmentationAlgorithm)initWithNetworkConfiguration:(id)a3
{
  id v4;
  SIPeopleSegmentationAlgorithm *v5;
  SIPeopleSegmentationAlgorithm *v6;
  uint64_t v7;
  SIPeopleSegmentation *model;
  SIScaler *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  SIScaler *scaler;
  SIImageInputData *v18;
  SIImageInputData *inputData;
  SIPeopleSegmentationAlgorithm *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SIPeopleSegmentationAlgorithm;
  v5 = -[SIAlgorithm initWithNetworkConfiguration:](&v22, sel_initWithNetworkConfiguration_, v4);
  v6 = v5;
  if (v5)
  {
    -[SIAlgorithm model](v5, "model");
    v7 = objc_claimAutoreleasedReturnValue();
    model = v6->_model;
    v6->_model = (SIPeopleSegmentation *)v7;

    v9 = [SIScaler alloc];
    -[SIPeopleSegmentation getInputResolution](v6->_model, "getInputResolution");
    v11 = v10;
    v13 = v12;
    v14 = objc_msgSend(v4, "inputImageFormat");
    objc_msgSend(v4, "imageScalerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v9, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", v14, 0, v15, v11, v13);
    scaler = v6->_scaler;
    v6->_scaler = (SIScaler *)v16;

    v18 = objc_alloc_init(SIImageInputData);
    inputData = v6->_inputData;
    v6->_inputData = v18;

    v20 = v6;
  }

  return v6;
}

- (int64_t)switchConfiguration:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int64_t v8;
  SIScaler *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  SIScaler *v16;
  SIScaler *scaler;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[SIAlgorithm networkConfiguration](self, "networkConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "networkModeEnum");
  if (-[SIPeopleSegmentation switchNetworkConfiguration:](self->_model, "switchNetworkConfiguration:", a3))
  {
    __SceneIntelligenceLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v19 = 136380931;
      v20 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PeopleSegmentation/SIPeopleSegmentationAlgorithm.m";
      v21 = 1025;
      v22 = 135;
      _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** fail to switch the configuration! The output is not updated ***", (uint8_t *)&v19, 0x12u);
    }

    v8 = 5;
  }
  else
  {
    if (v6 != a3)
    {
      v9 = [SIScaler alloc];
      -[SIPeopleSegmentation getInputResolution](self->_model, "getInputResolution");
      v11 = v10;
      v13 = v12;
      v14 = objc_msgSend(v5, "inputImageFormat");
      objc_msgSend(v5, "imageScalerIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v9, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", v14, 0, v15, v11, v13);
      scaler = self->_scaler;
      self->_scaler = v16;

    }
    v8 = 0;
  }

  return v8;
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
  v4 = -[SIScaler createScaledImage:](self->_scaler, "createScaledImage:", objc_msgSend(a3, "inputImageBuffer"));
  -[SIImageInputData setInputImageBuffer:](self->_inputData, "setInputImageBuffer:", v4);
  CVPixelBufferRelease(v4);
  if (-[SIImageInputData inputImageBuffer](self->_inputData, "inputImageBuffer"))
    return 0;
  __SceneIntelligenceLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136380931;
    v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PeopleSegmentation/SIPeopleSegmentationAlgorithm.m";
    v9 = 1025;
    v10 = 154;
    _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to scale the input image or input depth ***", (uint8_t *)&v7, 0x12u);
  }

  return 1;
}

- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4
{
  return -[SIPeopleSegmentation evaluateForInput:output:](self->_model, "evaluateForInput:output:", self->_inputData, a4);
}

- (int64_t)_postprocessingOutput:(id)a3
{
  return -[SIPeopleSegmentation copyResultsToData:](self->_model, "copyResultsToData:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end

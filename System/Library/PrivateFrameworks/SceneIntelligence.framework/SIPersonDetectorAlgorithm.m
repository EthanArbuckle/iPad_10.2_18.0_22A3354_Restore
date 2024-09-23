@implementation SIPersonDetectorAlgorithm

+ (Class)outputDataClass
{
  return (Class)objc_opt_class();
}

+ (Class)inputDataClass
{
  return (Class)objc_opt_class();
}

- (SIPersonDetectorAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4
{
  return -[SIPersonDetectorAlgorithm initWithComputeEngine:andNetworkConfiguration:useE5RT:](self, "initWithComputeEngine:andNetworkConfiguration:useE5RT:", a3, a4, 1);
}

- (SIPersonDetectorAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4 useE5RT:(BOOL)a5
{
  _BOOL8 v5;
  SIPersonDetectorNetworkConfiguration *v9;
  SIPersonDetectorAlgorithm *v10;

  v5 = a5;
  v9 = objc_alloc_init(SIPersonDetectorNetworkConfiguration);
  -[SINetworkConfiguration setEngineType:](v9, "setEngineType:", a3);
  -[SIPersonDetectorNetworkConfiguration setNetworkModeEnum:](v9, "setNetworkModeEnum:", a4);
  -[SINetworkConfiguration setRunByE5RT:](v9, "setRunByE5RT:", v5);
  v10 = -[SIPersonDetectorAlgorithm initWithNetworkConfiguration:](self, "initWithNetworkConfiguration:", v9);

  return v10;
}

- (void)runWithInput:(__CVBuffer *)a3 output:(id)a4
{
  id v6;
  SIImageInputData *v7;
  SIPersonDetectorData *v8;
  objc_super v9;

  v6 = a4;
  v7 = objc_alloc_init(SIImageInputData);
  -[SIImageInputData setInputImageBuffer:](v7, "setInputImageBuffer:", a3);
  v8 = objc_alloc_init(SIPersonDetectorData);
  -[SIPersonDetectorData setBoundingBoxes:](v8, "setBoundingBoxes:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SIPersonDetectorAlgorithm;
  -[SIAlgorithm runWithInput:output:](&v9, sel_runWithInput_output_, v7, v8);

}

- (SIPersonDetectorAlgorithm)initWithNetworkConfiguration:(id)a3
{
  id v4;
  SIPersonDetectorAlgorithm *v5;
  SIPersonDetectorAlgorithm *v6;
  uint64_t v7;
  SIPersonDetector *model;
  SIScaler *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  SIScaler *scaler;
  SIImageInputData *v17;
  SIImageInputData *inputData;
  SIPersonDetectorAlgorithm *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SIPersonDetectorAlgorithm;
  v5 = -[SIAlgorithm initWithNetworkConfiguration:](&v21, sel_initWithNetworkConfiguration_, v4);
  v6 = v5;
  if (v5)
  {
    -[SIAlgorithm model](v5, "model");
    v7 = objc_claimAutoreleasedReturnValue();
    model = v6->_model;
    v6->_model = (SIPersonDetector *)v7;

    v9 = [SIScaler alloc];
    -[SIPersonDetector getInputResolution](v6->_model, "getInputResolution");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "imageScalerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v9, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", 1111970369, 0, v14, v11, v13);
    scaler = v6->_scaler;
    v6->_scaler = (SIScaler *)v15;

    v17 = objc_alloc_init(SIImageInputData);
    inputData = v6->_inputData;
    v6->_inputData = v17;

    v19 = v6;
  }

  return v6;
}

- (int64_t)switchConfiguration:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SIPersonDetectorAlgorithm;
  return -[SIAlgorithm switchConfiguration:](&v4, sel_switchConfiguration_, a3);
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
    v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetectorAlgorithm.m";
    v9 = 1025;
    v10 = 118;
    _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to scale the input image or input depth ***", (uint8_t *)&v7, 0x12u);
  }

  return 1;
}

- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4
{
  return -[SIPersonDetector evaluateForInput:output:](self->_model, "evaluateForInput:output:", self->_inputData, a4);
}

- (int64_t)_postprocessingOutput:(id)a3
{
  return -[SIPersonDetector copyResultsToData:](self->_model, "copyResultsToData:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end

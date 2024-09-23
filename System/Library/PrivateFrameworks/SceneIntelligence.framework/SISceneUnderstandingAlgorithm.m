@implementation SISceneUnderstandingAlgorithm

+ (CGSize)outputResolution
{
  double v2;
  double v3;
  CGSize result;

  +[SISceneUnderstandingResult outputDimensions](SISceneUnderstandingResult, "outputDimensions");
  result.height = v3;
  result.width = v2;
  return result;
}

- (SISceneUnderstandingAlgorithm)initWithInputResolution:(CGSize)a3
{
  return -[SISceneUnderstandingAlgorithm initWithInputResolution:andComputeEngine:](self, "initWithInputResolution:andComputeEngine:", 0, a3.width, a3.height);
}

- (SISceneUnderstandingAlgorithm)initWithInputResolution:(CGSize)a3 andComputeEngine:(int64_t)a4
{
  SISceneUnderstandingAlgorithm *v5;
  SISceneUnderstanding *v6;
  SISceneUnderstanding *segmentation;
  SISceneUnderstandingResult *v8;
  SISceneUnderstandingResult *v9;
  SIScaler *v10;
  uint64_t v11;
  SIScaler *scalerOne;
  SISceneUnderstandingAlgorithm *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SISceneUnderstandingAlgorithm;
  v5 = -[SISceneUnderstandingAlgorithm init](&v15, sel_init, a3.width, a3.height);
  if (v5
    && (v6 = -[SISceneUnderstanding initWithComputeEngine:]([SISceneUnderstanding alloc], "initWithComputeEngine:", a4), segmentation = v5->_segmentation, v5->_segmentation = v6, segmentation, v5->_segmentation))
  {
    v8 = -[SISceneUnderstandingResult initWithModel:]([SISceneUnderstandingResult alloc], "initWithModel:", v5->_segmentation);
    v9 = v5->_result;
    v5->_result = v8;

    v10 = [SIScaler alloc];
    +[SISceneUnderstanding inputResolution](SISceneUnderstanding, "inputResolution");
    v11 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v10, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", 1111970369, 0, CFSTR("SceneUnderstanding"));
    scalerOne = v5->_scalerOne;
    v5->_scalerOne = (SIScaler *)v11;

    v13 = v5;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 confidenceOutput:(__IOSurface *)a5 normalsOutput:(__IOSurface *)a6
{
  -[SISceneUnderstandingAlgorithm runWithInput:output:confidenceOutput:normalsOutput:orientation:](self, "runWithInput:output:confidenceOutput:normalsOutput:orientation:", a3, a4, a5, a6, 3);
}

- (void)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 confidenceOutput:(__IOSurface *)a5 normalsOutput:(__IOSurface *)a6 orientation:(int64_t)a7
{
  __CVBuffer *v13;
  int64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  CVPixelBufferRef v19;
  CVPixelBufferRef texture;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v13 = -[SIScaler createScaledImage:](self->_scalerOne, "createScaledImage:", a3);
  v14 = -[SISceneUnderstanding evaluateImage:results:](self->_segmentation, "evaluateImage:results:", v13, self->_result);
  CVPixelBufferRelease(v13);
  kdebug_trace();
  if (v14)
  {
    __SceneIntelligenceLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstandingAlgorithm.m";
      v24 = 1025;
      v25 = 92;
      _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to run scene understanding on image input ***", buf, 0x12u);
    }

  }
  else
  {
    pixelBufferOut = 0;
    if (CVPixelBufferCreateWithIOSurface(0, a4, 0, &pixelBufferOut))
    {
      __SceneIntelligenceLogSharedInstance();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUndersta"
              "ndingAlgorithm.m";
        v24 = 1025;
        v25 = 100;
        _os_log_impl(&dword_21071A000, v16, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unable to create semantic pixel buffer from Surface ***", buf, 0x12u);
      }

    }
    else
    {
      -[SISceneUnderstandingResult writeLabels:](self->_result, "writeLabels:", pixelBufferOut);
    }
    texture = 0;
    if (CVPixelBufferCreateWithIOSurface(0, a5, 0, &texture))
    {
      __SceneIntelligenceLogSharedInstance();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUndersta"
              "ndingAlgorithm.m";
        v24 = 1025;
        v25 = 110;
        _os_log_impl(&dword_21071A000, v17, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unable to create probabilities pixel buffer from Surface ***", buf, 0x12u);
      }

    }
    else
    {
      -[SISceneUnderstandingResult writeProbabilities:](self->_result, "writeProbabilities:", texture);
    }
    v19 = 0;
    if (CVPixelBufferCreateWithIOSurface(0, a6, 0, &v19))
    {
      __SceneIntelligenceLogSharedInstance();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUndersta"
              "ndingAlgorithm.m";
        v24 = 1025;
        v25 = 120;
        _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unable to create normals pixel buffer from Surface ***", buf, 0x12u);
      }

    }
    else
    {
      -[SISceneUnderstandingResult writeNormals:orientation:](self->_result, "writeNormals:orientation:", v19, a7);
    }
    CVPixelBufferRelease(pixelBufferOut);
    CVPixelBufferRelease(texture);
    CVPixelBufferRelease(v19);
    kdebug_trace();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalerOne, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_segmentation, 0);
}

@end

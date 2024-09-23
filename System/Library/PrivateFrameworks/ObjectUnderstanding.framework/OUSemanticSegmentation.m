@implementation OUSemanticSegmentation

- (OUSemanticSegmentation)init
{
  OUSemanticSegmentation *v2;
  OUSemanticSegmentation *v3;
  OUSemanticSegmentation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OUSemanticSegmentation;
  v2 = -[OUSemanticSegmentation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->deviceOrientation = 0;
    *(_WORD *)&v2->_initRotater = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)setupRotater:(id)a3
{
  id v4;
  uint64_t PixelFormatType;
  uint64_t v6;
  size_t Width;
  size_t Height;
  OUCVPixelBufferRotate *v9;
  OUCVPixelBufferRotate *cvRotate90;
  OUCVPixelBufferRotate *v11;
  OUCVPixelBufferRotate *cvRotate90r;
  OUCVPixelBufferRotate *v13;
  OUCVPixelBufferRotate *cvRotate180;
  OUCVPixelBufferRotate *v15;
  OUCVPixelBufferRotate *cvRotate180r;
  OUCVPixelBufferRotate *v17;
  OUCVPixelBufferRotate *cvRotate270;
  OUCVPixelBufferRotate *v19;
  OUCVPixelBufferRotate *cvRotate270r;
  int64_t deviceOrientation;
  BOOL v22;
  SISceneSegmentationNetworkConfiguration *v23;
  SISceneSegmentationNetworkConfiguration *semanticConfig;
  SISceneSegmentationData *v25;
  SISceneSegmentationData *semResultData;
  double v27;
  id v28;
  double v29;
  SISceneSegmentationAlgorithm *v30;
  SISceneSegmentationAlgorithm *siSceneSegmentationAlgorithm;
  NSObject *v32;

  v4 = a3;
  if (objc_msgSend(v4, "semanticLabelBuffer"))
  {
    if (!self->_initRotater)
    {
      PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v4, "colorBuffer"));
      v6 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v4, "semanticLabelBuffer"));
      Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v4, "colorBuffer"));
      Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v4, "colorBuffer"));
      v9 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 90, PixelFormatType, (float)Height, (float)Width);
      cvRotate90 = self->cvRotate90;
      self->cvRotate90 = v9;

      v11 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 270, v6, 256.0, 192.0);
      cvRotate90r = self->cvRotate90r;
      self->cvRotate90r = v11;

      v13 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 180, PixelFormatType, (float)Width, (float)Height);
      cvRotate180 = self->cvRotate180;
      self->cvRotate180 = v13;

      v15 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 180, v6, 256.0, 192.0);
      cvRotate180r = self->cvRotate180r;
      self->cvRotate180r = v15;

      v17 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 270, PixelFormatType, (float)Height, (float)Width);
      cvRotate270 = self->cvRotate270;
      self->cvRotate270 = v17;

      v19 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 90, v6, 256.0, 192.0);
      cvRotate270r = self->cvRotate270r;
      self->cvRotate270r = v19;

      self->_initRotater = 1;
    }
    if (self->_initSegModel
      && (deviceOrientation = self->deviceOrientation, deviceOrientation == objc_msgSend(v4, "deviceOrientation")))
    {
      v22 = 1;
    }
    else
    {
      self->deviceOrientation = objc_msgSend(v4, "deviceOrientation");
      v23 = (SISceneSegmentationNetworkConfiguration *)objc_alloc_init(MEMORY[0x24BE841C0]);
      semanticConfig = self->semanticConfig;
      self->semanticConfig = v23;

      switch(objc_msgSend(v4, "deviceOrientation"))
      {
        case 1:
        case 2:
          -[SISceneSegmentationNetworkConfiguration setNetworkModeEnum:](self->semanticConfig, "setNetworkModeEnum:", 2);
          v25 = (SISceneSegmentationData *)objc_msgSend(objc_alloc(MEMORY[0x24BE841B8]), "initWithOutputResolution:", 192.0, 256.0);
          break;
        case 3:
        case 4:
          -[SISceneSegmentationNetworkConfiguration setNetworkModeEnum:](self->semanticConfig, "setNetworkModeEnum:", 1);
          v25 = (SISceneSegmentationData *)objc_msgSend(objc_alloc(MEMORY[0x24BE841B8]), "initWithOutputResolution:", 256.0, 192.0);
          break;
        default:
          _OULoggingGetOSLogForCategoryObjectUnderstanding();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            -[OUSemanticSegmentation setupRotater:].cold.1();

          goto LABEL_14;
      }
      semResultData = self->semResultData;
      self->semResultData = v25;

      self->semanticModel = -[SISceneSegmentationNetworkConfiguration networkModeEnum](self->semanticConfig, "networkModeEnum");
      -[SISceneSegmentationNetworkConfiguration setEngineType:](self->semanticConfig, "setEngineType:", 1);
      -[SISceneSegmentationNetworkConfiguration setRunByE5RT:](self->semanticConfig, "setRunByE5RT:", 1);
      LODWORD(v27) = 1053609165;
      -[SISceneSegmentationNetworkConfiguration setUncertaintyThreshold:](self->semanticConfig, "setUncertaintyThreshold:", v27);
      -[SISceneSegmentationNetworkConfiguration setModelConfig:](self->semanticConfig, "setModelConfig:", 0);
      v28 = objc_alloc(MEMORY[0x24BE841B0]);
      v22 = 1;
      LODWORD(v29) = 1053609165;
      v30 = (SISceneSegmentationAlgorithm *)objc_msgSend(v28, "initWithComputeEngine:andNetworkConfiguration:uncertaintyThreshold:", 1, 0, v29);
      siSceneSegmentationAlgorithm = self->siSceneSegmentationAlgorithm;
      self->siSceneSegmentationAlgorithm = v30;

      self->_initSegModel = 1;
    }
  }
  else
  {
LABEL_14:
    v22 = 0;
  }

  return v22;
}

- (__CVBuffer)generateSemanticOnWideCameraWithFrame:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  __CVBuffer *v11;
  SISceneSegmentationAlgorithm *siSceneSegmentationAlgorithm;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v14;
  id v15;
  uint64_t v16;
  SISceneSegmentationAlgorithm *v17;
  IOSurfaceRef v18;
  IOSurfaceRef v19;
  uint8_t v21[16];

  v4 = a3;
  if (-[OUSemanticSegmentation setupRotater:](self, "setupRotater:", v4))
  {
    v5 = objc_msgSend(v4, "sceneColorBuffer");
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[OUSemanticSegmentation generateSemanticOnWideCameraWithFrame:].cold.3();

    v7 = objc_msgSend(v4, "deviceOrientation");
    v8 = 16;
    v9 = 8;
    switch(v7)
    {
      case 1:
        goto LABEL_16;
      case 2:
        v8 = 48;
        v9 = 40;
        goto LABEL_16;
      case 3:
        siSceneSegmentationAlgorithm = self->siSceneSegmentationAlgorithm;
        IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)-[SISceneSegmentationData semantic](self->semResultData, "semantic"));
        v14 = CVPixelBufferGetIOSurface((CVPixelBufferRef)-[SISceneSegmentationData confidence](self->semResultData, "confidence"));
        -[SISceneSegmentationAlgorithm runWithInput:output:confidenceOutput:uncertaintyOutput:resampleOutput:networkConfiguration:](siSceneSegmentationAlgorithm, "runWithInput:output:confidenceOutput:uncertaintyOutput:resampleOutput:networkConfiguration:", v5, IOSurface, v14, CVPixelBufferGetIOSurface((CVPixelBufferRef)-[SISceneSegmentationData uncertainty](self->semResultData, "uncertainty")), 1, 1);
        v11 = (__CVBuffer *)-[SISceneSegmentationData semantic](self->semResultData, "semantic");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[OUSemanticSegmentation generateSemanticOnWideCameraWithFrame:].cold.2();
        goto LABEL_14;
      case 4:
        v8 = 32;
        v9 = 24;
LABEL_16:
        v10 = *(id *)((char *)&self->super.isa + v9);
        v15 = *(id *)((char *)&self->super.isa + v8);
        v16 = -[NSObject rotateImage:](v10, "rotateImage:", v5);
        v17 = self->siSceneSegmentationAlgorithm;
        v18 = CVPixelBufferGetIOSurface((CVPixelBufferRef)-[SISceneSegmentationData semantic](self->semResultData, "semantic"));
        v19 = CVPixelBufferGetIOSurface((CVPixelBufferRef)-[SISceneSegmentationData confidence](self->semResultData, "confidence"));
        -[SISceneSegmentationAlgorithm runWithInput:output:confidenceOutput:uncertaintyOutput:resampleOutput:networkConfiguration:](v17, "runWithInput:output:confidenceOutput:uncertaintyOutput:resampleOutput:networkConfiguration:", v16, v18, v19, CVPixelBufferGetIOSurface((CVPixelBufferRef)-[SISceneSegmentationData uncertainty](self->semResultData, "uncertainty")), 1, self->semanticModel);
        v11 = (__CVBuffer *)objc_msgSend(v15, "rotateImage:", -[SISceneSegmentationData semantic](self->semResultData, "semantic"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_2294C8000, v6, OS_LOG_TYPE_INFO, "Generating semantic over wide (rotation) camera end", v21, 2u);
        }

        break;
      default:
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[OUSemanticSegmentation generateSemanticOnWideCameraWithFrame:].cold.1();
        v11 = 0;
LABEL_14:
        v10 = v6;
        break;
    }
  }
  else
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[OUSemanticSegmentation generateSemanticOnWideCameraWithFrame:].cold.4();
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->semResultData, 0);
  objc_storeStrong((id *)&self->semanticConfig, 0);
  objc_storeStrong((id *)&self->siSceneSegmentationAlgorithm, 0);
  objc_storeStrong((id *)&self->cvRotate270r, 0);
  objc_storeStrong((id *)&self->cvRotate270, 0);
  objc_storeStrong((id *)&self->cvRotate180r, 0);
  objc_storeStrong((id *)&self->cvRotate180, 0);
  objc_storeStrong((id *)&self->cvRotate90r, 0);
  objc_storeStrong((id *)&self->cvRotate90, 0);
}

- (void)setupRotater:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "frame.deviceOrientation is not supported.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generateSemanticOnWideCameraWithFrame:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "[Save ARFrame Error]: invalid device orientation. Skip data saving.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generateSemanticOnWideCameraWithFrame:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "Generating semantic over wide (left-landscape) camera end", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generateSemanticOnWideCameraWithFrame:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "Generating semantic over wide camera starts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generateSemanticOnWideCameraWithFrame:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "SetupRotater fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end

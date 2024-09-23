@implementation PTEffectPersonSegmentationVision

- (PTEffectPersonSegmentationVision)initWithMetalContext:(id)a3 colorSize:(CGSize)a4
{
  id v6;
  PTEffectPersonSegmentationVision *v7;
  PTEffectPersonSegmentationVision *v8;
  VNSession *v9;
  VNSession *visionSession;
  uint64_t v11;
  VNSequenceRequestHandler *visionRequestHandler;
  PTEffectPersonSegmentationVision *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v30;

  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PTEffectPersonSegmentationVision;
  v7 = -[PTEffectPersonSegmentationVision init](&v30, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_10;
  objc_storeStrong((id *)&v7->_metalContext, a3);
  v9 = (VNSession *)objc_alloc_init(MEMORY[0x1E0CEE040]);
  visionSession = v8->_visionSession;
  v8->_visionSession = v9;

  if (!v8->_visionSession)
  {
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationVision initWithMetalContext:colorSize:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_9;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEE038]), "initWithSession:", v8->_visionSession);
  visionRequestHandler = v8->_visionRequestHandler;
  v8->_visionRequestHandler = (VNSequenceRequestHandler *)v11;

  if (!v8->_visionRequestHandler)
  {
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationVision initWithMetalContext:colorSize:].cold.2(v14, v22, v23, v24, v25, v26, v27, v28);
LABEL_9:

LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v13 = v8;
LABEL_11:

  return v13;
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)segmentationSizeForColorSize:(SEL)a3
{
  *(_OWORD *)&retstr->var0 = xmmword_1C9323400;
  retstr->var2 = 1;
  return result;
}

- (id)runPersonSegmentationForPixelBuffer:(__CVBuffer *)a3
{
  VNGeneratePersonSegmentationRequest *v5;
  VNGeneratePersonSegmentationRequest *personSegmentationRequest;
  void *v7;
  VNSequenceRequestHandler *visionRequestHandler;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = (VNGeneratePersonSegmentationRequest *)objc_opt_new();
  personSegmentationRequest = self->_personSegmentationRequest;
  self->_personSegmentationRequest = v5;

  +[PTInference ANEConfigForSynchronousWork](PTInference, "ANEConfigForSynchronousWork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNGeneratePersonSegmentationRequest setModelExecutionPriority:](self->_personSegmentationRequest, "setModelExecutionPriority:", objc_msgSend(v7, "VNRequestModelExecutionPriority"));

  -[VNGeneratePersonSegmentationRequest setQualityLevel:](self->_personSegmentationRequest, "setQualityLevel:", 1);
  -[VNGeneratePersonSegmentationRequest setOutputPixelFormat:](self->_personSegmentationRequest, "setOutputPixelFormat:", 1278226488);
  visionRequestHandler = self->_visionRequestHandler;
  v25[0] = self->_personSegmentationRequest;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  LOBYTE(visionRequestHandler) = -[VNSequenceRequestHandler performRequests:onCVPixelBuffer:error:](visionRequestHandler, "performRequests:onCVPixelBuffer:error:", v9, a3, &v24);
  v10 = v24;

  if ((visionRequestHandler & 1) == 0)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTEffectPersonSegmentationVision runPersonSegmentationForPixelBuffer:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

  }
  -[VNGeneratePersonSegmentationRequest results](self->_personSegmentationRequest, "results");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "pixelBuffer");
    -[PTMetalContext device](self->_metalContext, "device");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTPixelBufferUtil createTextureFromPixelBuffer:device:](PTPixelBufferUtil, "createTextureFromPixelBuffer:device:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)debugTextures
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (unsigned)reset
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personSegmentationRequest, 0);
  objc_storeStrong((id *)&self->_visionRequestHandler, 0);
  objc_storeStrong((id *)&self->_visionSession, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)runPersonSegmentationForPixelBuffer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a2, a3, "Person segmentation error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

@implementation VGEarPCACaptureOptions

- (VGEarPCACaptureOptions)init
{
  VGEarPCACaptureOptions *v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  NSString *debugDataPath;
  NSString *modelsRootPath;
  VGEarPCACaptureOptions *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VGEarPCACaptureOptions;
  v2 = -[VGEarPCACaptureOptions init](&v14, sel_init);
  if (v2)
  {
    v2->_imageWidth = objc_msgSend((id)objc_opt_class(), "defaultImageWidth");
    v2->_imageHeight = objc_msgSend((id)objc_opt_class(), "defaultImageHeight");
    objc_msgSend((id)objc_opt_class(), "defaultEarPresenceThreshold");
    v2->_earPresenceThreshold = v3;
    objc_msgSend((id)objc_opt_class(), "defaultEarOcclusionThreshold");
    v2->_earOcclusionThreshold = v4;
    objc_msgSend((id)objc_opt_class(), "defaultBboxVisibilityThreshold");
    v2->_bboxVisibilityThreshold = v5;
    v2->_useMotionBlurFilter = objc_msgSend((id)objc_opt_class(), "defaultUseMotionBlurFilter");
    objc_msgSend((id)objc_opt_class(), "defaultMotionBlurFilterThreshold");
    v2->_motionBlurFilterThreshold = v6;
    v2->_frameCountThreshold = objc_msgSend((id)objc_opt_class(), "frameCountThreshold");
    objc_msgSend((id)objc_opt_class(), "defaultLandmarkVisibilityThreshold");
    v2->_landmarkVisibilityThreshold = v7;
    v2->_useEarSideSmoothPredictor = objc_msgSend((id)objc_opt_class(), "defaultUseEarSideSmoothPredictor");
    v2->_earSideSmoothPredictorBufferCapacity = objc_msgSend((id)objc_opt_class(), "defaultEarSideSmoothPredictorBufferCapacity");
    objc_msgSend((id)objc_opt_class(), "defaultEarSideSmoothPredictorConfidenceThreshold");
    v2->_earSideSmoothPredictorConfidenceThreshold = v8;
    objc_msgSend((id)objc_opt_class(), "defaultFaceYawLimit");
    v2->_faceYawLimit = v9;
    v2->_writeDebugData = 0;
    debugDataPath = v2->_debugDataPath;
    v2->_debugDataPath = 0;

    modelsRootPath = v2->_modelsRootPath;
    v2->_modelsRootPath = 0;

    v12 = v2;
  }

  return v2;
}

- (VGEarPCACaptureOptions)initWithSuiteName:(id)a3
{
  id v4;
  VGEarPCACaptureOptions *v5;
  VGEarPCACaptureOptions *v6;
  VGEarPCACaptureOptions *v7;

  v4 = a3;
  v5 = -[VGEarPCACaptureOptions init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[VGEarPCACaptureOptions setDefaultsWithSuiteName:](v5, "setDefaultsWithSuiteName:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)setDefaultsWithSuiteName:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  void *v7;
  float v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  float v21;
  id v22;

  v22 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v22);
  objc_msgSend(v4, "objectForKey:", CFSTR("earPresenceThreshold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("earPresenceThreshold"));
    self->_earPresenceThreshold = v6;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("earOcclusionThreshold"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("earOcclusionThreshold"));
    self->_earOcclusionThreshold = v8;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("earBoxVisibilityThreshold"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("earBoxVisibilityThreshold"));
    self->_bboxVisibilityThreshold = v10;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("useEarMotionBlurFilter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    self->_useMotionBlurFilter = objc_msgSend(v4, "BOOLForKey:", CFSTR("useEarMotionBlurFilter"));
  objc_msgSend(v4, "objectForKey:", CFSTR("earMotionBlurFilterThreshold"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    self->_motionBlurFilterThreshold = (float)objc_msgSend(v4, "BOOLForKey:", CFSTR("earMotionBlurFilterThreshold"));
  objc_msgSend(v4, "objectForKey:", CFSTR("numberOfEarFrame"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    self->_frameCountThreshold = objc_msgSend(v4, "integerForKey:", CFSTR("numberOfEarFrame"));
  objc_msgSend(v4, "objectForKey:", CFSTR("earLandmarkVisibility"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("earLandmarkVisibility"));
    self->_landmarkVisibilityThreshold = v15;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("useEarSideSmoothPredictor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    self->_useEarSideSmoothPredictor = objc_msgSend(v4, "BOOLForKey:", CFSTR("useEarSideSmoothPredictor"));
  objc_msgSend(v4, "objectForKey:", CFSTR("earSideSmoothPredictorBufferCapacity"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    self->_earSideSmoothPredictorBufferCapacity = objc_msgSend(v4, "integerForKey:", CFSTR("earSideSmoothPredictorBufferCapacity"));
  objc_msgSend(v4, "objectForKey:", CFSTR("earSideSmoothPredictorConfidenceThreshold"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("earSideSmoothPredictorConfidenceThreshold"));
    self->_earSideSmoothPredictorConfidenceThreshold = v19;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("faceYawLimitForEarPose"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("faceYawLimitForEarPose"));
    self->_faceYawLimit = v21;
  }

}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_useEarSideSmoothPredictor)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_useMotionBlurFilter)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Input image size (%u x %u) Frame count threshold %u Ear bbox detection visibility threshold %f Ear landmark detection visibility threshold %f Use ear side smooth predictor %@ (buffer capacity: %u, confidence threshold: %f) Use motion blur filter %@ Motion blur filter threshold %fFace yaw limit %f"), self->_imageWidth, self->_imageHeight, self->_frameCountThreshold, self->_bboxVisibilityThreshold, self->_landmarkVisibilityThreshold, v3, self->_earSideSmoothPredictorBufferCapacity, self->_earSideSmoothPredictorConfidenceThreshold, v2, self->_motionBlurFilterThreshold, self->_faceYawLimit);
}

+ (unsigned)defaultImageWidth
{
  return 1440;
}

+ (unsigned)defaultImageHeight
{
  return 1920;
}

+ (unsigned)frameCountThreshold
{
  return 15;
}

+ (float)defaultEarPresenceThreshold
{
  return 0.8;
}

+ (float)defaultEarOcclusionThreshold
{
  return 0.8;
}

+ (float)defaultBboxVisibilityThreshold
{
  return 0.8;
}

+ (float)defaultLandmarkVisibilityThreshold
{
  return 0.8;
}

+ (BOOL)defaultUseEarSideSmoothPredictor
{
  return 1;
}

+ (unsigned)defaultEarSideSmoothPredictorBufferCapacity
{
  return 10;
}

+ (float)defaultEarSideSmoothPredictorConfidenceThreshold
{
  return 0.8;
}

+ (BOOL)defaultUseMotionBlurFilter
{
  return 1;
}

+ (float)defaultMotionBlurFilterThreshold
{
  return 4.8;
}

+ (float)defaultFaceYawLimit
{
  return 35.0;
}

- (unsigned)frameCountThreshold
{
  return self->_frameCountThreshold;
}

- (void)setFrameCountThreshold:(unsigned int)a3
{
  self->_frameCountThreshold = a3;
}

- (float)earPresenceThreshold
{
  return self->_earPresenceThreshold;
}

- (void)setEarPresenceThreshold:(float)a3
{
  self->_earPresenceThreshold = a3;
}

- (float)earOcclusionThreshold
{
  return self->_earOcclusionThreshold;
}

- (void)setEarOcclusionThreshold:(float)a3
{
  self->_earOcclusionThreshold = a3;
}

- (float)bboxVisibilityThreshold
{
  return self->_bboxVisibilityThreshold;
}

- (void)setBboxVisibilityThreshold:(float)a3
{
  self->_bboxVisibilityThreshold = a3;
}

- (float)landmarkVisibilityThreshold
{
  return self->_landmarkVisibilityThreshold;
}

- (void)setLandmarkVisibilityThreshold:(float)a3
{
  self->_landmarkVisibilityThreshold = a3;
}

- (BOOL)useEarSideSmoothPredictor
{
  return self->_useEarSideSmoothPredictor;
}

- (void)setUseEarSideSmoothPredictor:(BOOL)a3
{
  self->_useEarSideSmoothPredictor = a3;
}

- (unsigned)earSideSmoothPredictorBufferCapacity
{
  return self->_earSideSmoothPredictorBufferCapacity;
}

- (void)setEarSideSmoothPredictorBufferCapacity:(unsigned int)a3
{
  self->_earSideSmoothPredictorBufferCapacity = a3;
}

- (float)earSideSmoothPredictorConfidenceThreshold
{
  return self->_earSideSmoothPredictorConfidenceThreshold;
}

- (void)setEarSideSmoothPredictorConfidenceThreshold:(float)a3
{
  self->_earSideSmoothPredictorConfidenceThreshold = a3;
}

- (float)faceYawLimit
{
  return self->_faceYawLimit;
}

- (void)setFaceYawLimit:(float)a3
{
  self->_faceYawLimit = a3;
}

- (unsigned)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(unsigned int)a3
{
  self->_imageWidth = a3;
}

- (unsigned)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(unsigned int)a3
{
  self->_imageHeight = a3;
}

- (BOOL)writeDebugData
{
  return self->_writeDebugData;
}

- (void)setWriteDebugData:(BOOL)a3
{
  self->_writeDebugData = a3;
}

- (NSString)debugDataPath
{
  return self->_debugDataPath;
}

- (void)setDebugDataPath:(id)a3
{
  objc_storeStrong((id *)&self->_debugDataPath, a3);
}

- (NSString)modelsRootPath
{
  return self->_modelsRootPath;
}

- (void)setModelsRootPath:(id)a3
{
  objc_storeStrong((id *)&self->_modelsRootPath, a3);
}

- (BOOL)useMotionBlurFilter
{
  return self->_useMotionBlurFilter;
}

- (void)setUseMotionBlurFilter:(BOOL)a3
{
  self->_useMotionBlurFilter = a3;
}

- (float)motionBlurFilterThreshold
{
  return self->_motionBlurFilterThreshold;
}

- (void)setMotionBlurFilterThreshold:(float)a3
{
  self->_motionBlurFilterThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelsRootPath, 0);
  objc_storeStrong((id *)&self->_debugDataPath, 0);
}

@end

@implementation SISceneSegmentationData

- (SISceneSegmentationData)initWithConfig:(id)a3
{
  id v4;
  SISceneSegmentationData *v5;
  SISceneSegmentationData *v6;
  double *p_width;
  double v8;
  double v9;
  size_t v10;
  size_t v11;
  SISceneSegmentationData *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISceneSegmentationData;
  v5 = -[SISceneSegmentationData init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    p_width = &v5->_resolution.width;
    -[SISceneSegmentationData _resolutionByConfig:](v5, "_resolutionByConfig:", v4);
    *p_width = v8;
    v6->_resolution.height = v9;
    v10 = (unint64_t)v8;
    v11 = (unint64_t)v9;
    v6->_semantic = SICreateCVPixelBuffer((unint64_t)v8, (unint64_t)v9, 0x4C303038u, 1);
    v6->_confidence = SICreateCVPixelBuffer(v10, v11, 0x4C303066u, 1);
    v6->_uncertainty = SICreateCVPixelBuffer(v10, v11, 0x4C303066u, 1);
    v12 = v6;
  }

  return v6;
}

- (SISceneSegmentationData)initWithOutputResolution:(CGSize)a3
{
  double height;
  double width;
  SISceneSegmentationData *v5;
  SISceneSegmentationData *v6;
  SISceneSegmentationData *v7;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SISceneSegmentationData;
  v5 = -[SISceneSegmentationData init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_resolution.width = width;
    v5->_resolution.height = height;
    v5->_semantic = SICreateCVPixelBuffer((unint64_t)width, (unint64_t)height, 0x4C303038u, 1);
    v6->_confidence = SICreateCVPixelBuffer((unint64_t)width, (unint64_t)height, 0x4C303066u, 1);
    v6->_uncertainty = SICreateCVPixelBuffer((unint64_t)width, (unint64_t)height, 0x4C303066u, 1);
    v7 = v6;
  }

  return v6;
}

- (SISceneSegmentationData)initWithOutputSemanticBuffer:(__CVBuffer *)a3 confidenceBuffer:(__CVBuffer *)a4 uncertaintyBuffer:(__CVBuffer *)a5
{
  SISceneSegmentationData *v8;
  SISceneSegmentationData *v9;
  SISceneSegmentationData *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SISceneSegmentationData;
  v8 = -[SISceneSegmentationData init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_resolution.width = (double)CVPixelBufferGetWidth(v8->_semantic);
    v9->_resolution.height = (double)CVPixelBufferGetHeight(v9->_semantic);
    v9->_semantic = CVPixelBufferRetain(a3);
    v9->_confidence = CVPixelBufferRetain(a4);
    v9->_uncertainty = CVPixelBufferRetain(a5);
    v10 = v9;
  }

  return v9;
}

- (CGSize)_resolutionByConfig:(id)a3
{
  double SupportedResolution;
  double v4;
  CGSize result;

  SupportedResolution = SISceneSegmentationGetSupportedResolution(objc_msgSend(a3, "networkModeEnum"));
  result.height = v4;
  result.width = SupportedResolution;
  return result;
}

- (BOOL)saveToDisk:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  __CVBuffer *v8;
  void *v9;
  __CVBuffer *semantic;
  void *v11;
  __CVBuffer *confidence;
  void *v13;
  __CVBuffer *uncertainty;
  void *v15;
  BOOL v16;
  NSObject *v17;
  _QWORD v19[2];
  void (*v20)(uint64_t);
  void *v21;
  __CVBuffer *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SISceneSegmentationData;
  if ((objc_msgSend(-[SISceneSegmentationData class](&v23, sel_class), "ensureDirectoryExist:", v6) & 1) != 0)
  {
    v8 = SICreateSemanticColorizedResult(self->_semantic);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v20 = __49__SISceneSegmentationData_saveToDisk_identifier___block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0l;
    v22 = v8;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@/color_semantic_%@.png"), v6, v7);
    if (SISavePixelBufferPNG(v8, v9))
    {
      semantic = self->_semantic;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@/semantic_%@.png"), v6, v7);
      if (SISavePixelBufferPNG(semantic, v11))
      {
        confidence = self->_confidence;
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@/semantic_confidence_%@.tiff"), v6, v7);
        if (SISavePixelBufferTIFF((uint64_t)confidence, v13))
        {
          uncertainty = self->_uncertainty;
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@/semantic_uncertainty_%@.tiff"), v6, v7);
          v16 = SISavePixelBufferTIFF((uint64_t)uncertainty, v15);

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

    v20((uint64_t)v19);
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationDataType.m";
      v26 = 1025;
      v27 = 85;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_21071A000, v17, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** %@ is not a directory, or failed to create a directory ***", buf, 0x1Cu);
    }

    v16 = 0;
  }

  return v16;
}

void __49__SISceneSegmentationData_saveToDisk_identifier___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_semantic);
  CVPixelBufferRelease(self->_confidence);
  CVPixelBufferRelease(self->_uncertainty);
  v3.receiver = self;
  v3.super_class = (Class)SISceneSegmentationData;
  -[SISceneSegmentationData dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)semantic
{
  return self->_semantic;
}

- (__CVBuffer)confidence
{
  return self->_confidence;
}

- (__CVBuffer)uncertainty
{
  return self->_uncertainty;
}

- (CGSize)resolution
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_resolution, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

@end

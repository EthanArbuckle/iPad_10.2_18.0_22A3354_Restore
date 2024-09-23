@implementation PVVideoCompositingExporter

- (id)requiredPixelBufferAttributesForRenderContext
{
  NSDictionary *destinationBufferPoolAttributes;
  NSDictionary *v4;
  void *v5;
  void *v6;
  NSDictionary **p_destinationBufferPoolAttributes;
  NSDictionary *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  destinationBufferPoolAttributes = self->super._destinationBufferPoolAttributes;
  if (!destinationBufferPoolAttributes)
  {
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (+[PVEnvironment PV_ENABLE_BGRA_OUTPUT_EXPORT](PVEnvironment, "PV_ENABLE_BGRA_OUTPUT_EXPORT"))
    {
      v5 = &unk_1E6648F28;
    }
    else
    {
      -[PVVideoCompositingExporter preferredDestinationPixelBufferFormat](self, "preferredDestinationPixelBufferFormat");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CA9040]);

    -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0]);
    p_destinationBufferPoolAttributes = &self->super._destinationBufferPoolAttributes;
    v8 = *p_destinationBufferPoolAttributes;
    *p_destinationBufferPoolAttributes = v4;

    destinationBufferPoolAttributes = *p_destinationBufferPoolAttributes;
  }
  return destinationBufferPoolAttributes;
}

- (id)preferredDestinationPixelBufferFormat
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[PVRendererBase compositingContext](self, "compositingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputColorSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHDRSpace") & 1) != 0)
  {
    -[PVRendererBase compositingContext](self, "compositingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "gpuRenderAPI");

    if (v6)
      return &unk_1E6648FA0;
    else
      return &unk_1E6648F70;
  }
  else
  {

    return &unk_1E6648F70;
  }
}

- (PVVideoCompositingExporter)init
{
  PVVideoCompositingExporter *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  PVTaskTokenPool *v7;
  PVTaskTokenPool *tokenPool;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PVVideoCompositingExporter;
  v2 = -[PVVideoCompositing init](&v16, sel_init);
  if (v2)
  {
    if (+[PVDeviceCharacteristics isLowMemDevice](PVDeviceCharacteristics, "isLowMemDevice"))
    {
      v3 = +[PVEnvironment PVPageSizeLowMemExport](PVEnvironment, "PVPageSizeLowMemExport");
      -[PVRendererBase compositingContext](v2, "compositingContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPageSize:", v3);

    }
    +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredExportColorSpace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVRendererBase setOutputColorSpace:](v2, "setOutputColorSpace:", v6);

    v7 = -[PVTaskTokenPool initWithOffset:]([PVTaskTokenPool alloc], "initWithOffset:", +[PVAVFRenderJobDelegate jobTypeTag](PVAVFRenderJobDelegate, "jobTypeTag") + 100);
    tokenPool = v2->super._tokenPool;
    v2->super._tokenPool = v7;

    +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredExportColorSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isHDRSpace");

    if (v11)
    {
      +[PVColorSpace rec2020LinearColorSpace](PVColorSpace, "rec2020LinearColorSpace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVRendererBase compositingContext](v2, "compositingContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWorkingColorSpace:", v12);
    }
    else
    {
      +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferredExportColorSpace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVRendererBase compositingContext](v2, "compositingContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWorkingColorSpace:", v13);

    }
  }
  return v2;
}

- (void)setupTextureFactories
{
  _BOOL4 v3;
  float v4;

  v3 = +[PVDeviceCharacteristics isLowMemDevice](PVDeviceCharacteristics, "isLowMemDevice");
  v4 = 0.5;
  if (v3)
    v4 = 0.0;
  PVRenderManager::SetupTextureFactories(self->super._renderManager.m_Obj, v4);
}

- (void)setupEffectScheduler
{
  PVEffectScheduler *v3;
  PVEffectScheduler *effectScheduler;

  v3 = objc_alloc_init(PVEffectScheduler);
  effectScheduler = self->super._effectScheduler;
  self->super._effectScheduler = v3;

  -[PVEffectScheduler setIsExporting:](self->super._effectScheduler, "setIsExporting:", 1);
}

@end

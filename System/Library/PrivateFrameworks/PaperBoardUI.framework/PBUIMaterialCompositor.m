@implementation PBUIMaterialCompositor

- (PBUIMaterialCompositor)init
{
  PBUIMaterialCompositor *v2;
  PBUIMaterialCompositor *v3;
  uint64_t v4;
  PBUIRenderer *renderer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBUIMaterialCompositor;
  v2 = -[PBUIMaterialCompositor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_downsampleFactor = 8.0;
    +[PBUICARemoteRenderer remoteRendererIfPossible](PBUICARemoteRenderer, "remoteRendererIfPossible");
    v4 = objc_claimAutoreleasedReturnValue();
    renderer = v3->_renderer;
    v3->_renderer = (PBUIRenderer *)v4;

  }
  return v3;
}

- (id)applyEffect:(id)a3 toImage:(id)a4
{
  uint64_t *v6;
  id v7;
  double downsampleFactor;
  __CFString *v9;
  void *v10;
  PBUIMaterialTreatment *v11;
  PBUICodableImage *v12;
  PBUITreatImageRequest *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v20;

  v6 = (uint64_t *)a3;
  v7 = a4;
  if (v6)
  {
    downsampleFactor = self->_downsampleFactor;
    switch(v6[11])
    {
      case 0:
        goto LABEL_5;
      case 1:
      case 2:
        soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(v6[3]);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        goto LABEL_6;
      case 3:
        v9 = CFSTR("homeScreenLegibility");
        PBUIHomeScreenLegibilityMaterialRecipeBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1BCCA5978](PBUIHomeScreenLegibilityMaterialRecipeScaleAdjustment);
        break;
      default:
        v10 = 0;
        v9 = 0;
        goto LABEL_6;
    }
  }
  else
  {
LABEL_5:
    soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(1);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    downsampleFactor = 1.0;
LABEL_6:
    v20 = &__block_literal_global_10;
  }
  v11 = -[PBUIMaterialTreatment initWithRecipeName:fromBundle:]([PBUIMaterialTreatment alloc], "initWithRecipeName:fromBundle:", v9, v10);
  v12 = -[PBUICodableImage initWithUIImage:error:]([PBUICodableImage alloc], "initWithUIImage:error:", v7, 0);
  v13 = -[PBUITreatImageRequest initWithImage:downscaleFactor:treatment:]([PBUITreatImageRequest alloc], "initWithImage:downscaleFactor:treatment:", v12, v11, downsampleFactor);
  -[PBUIRenderer renderRequest:error:](self->_renderer, "renderRequest:error:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v7, "scale");
  objc_msgSend(v15, "pbui_imageWithIOSurface:scale:orientation:", v14, objc_msgSend(v7, "imageOrientation"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pbui_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", 8, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

double __46__PBUIMaterialCompositor_applyEffect_toImage___block_invoke()
{
  return 0.7;
}

- (double)downsampleFactor
{
  return self->_downsampleFactor;
}

- (void)setDownsampleFactor:(double)a3
{
  self->_downsampleFactor = a3;
}

- (PBUIRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end

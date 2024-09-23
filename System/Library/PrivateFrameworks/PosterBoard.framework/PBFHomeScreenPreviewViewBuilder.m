@implementation PBFHomeScreenPreviewViewBuilder

- (PBFHomeScreenPreviewViewBuilder)init
{
  PBFHomeScreenPreviewViewBuilder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBFHomeScreenPreviewViewBuilder;
  result = -[PBFHomeScreenPreviewViewBuilder init](&v3, sel_init);
  if (result)
    result->_viewScreenSizeScale = 1.0;
  return result;
}

- (id)buildView
{
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id *v21;
  BOOL v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  BOOL v27;
  _QWORD v28[5];
  id v29;

  -[PBFDisplayContext pbf_frame](self->_displayContext, "pbf_frame");
  -[PBFDisplayContext pbf_scale](self->_displayContext, "pbf_scale");
  BSFloatRoundForScale();
  v4 = v3;
  -[PBFDisplayContext pbf_frame](self->_displayContext, "pbf_frame");
  -[PBFDisplayContext pbf_scale](self->_displayContext, "pbf_scale");
  BSFloatRoundForScale();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v4, v5);
  objc_msgSend(v6, "setAutoresizingMask:", 18);
  v7 = -[PRPosterHomeScreenConfiguration selectedAppearanceType](self->_homeScreenConfiguration, "selectedAppearanceType");
  switch(v7)
  {
    case 0:
    case 3:
      v8 = objc_alloc(MEMORY[0x1E0DC3890]);
      objc_msgSend(v6, "bounds");
      v9 = (void *)objc_msgSend(v8, "initWithFrame:");
      objc_msgSend(v9, "setAutoresizingMask:", 18);
      objc_msgSend(v9, "setContentMode:", 0);
      objc_msgSend(v9, "setImage:", self->_unlockedPosterSnapshot);
      objc_msgSend(v6, "addSubview:", v9);
      if (v7 == 3)
      {
        -[PRPosterHomeScreenConfiguration homePosterAppearance](self->_homeScreenConfiguration, "homePosterAppearance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isLegibilityBlurEnabled");

        if (!v18)
          goto LABEL_11;
        goto LABEL_10;
      }
      if (!v7)
      {
        -[PRPosterHomeScreenConfiguration lockPosterAppearance](self->_homeScreenConfiguration, "lockPosterAppearance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isLegibilityBlurEnabled");

        if ((v11 & 1) != 0)
        {
LABEL_10:
          objc_msgSend(MEMORY[0x1E0D47498], "pui_homeScreenLegibilityMaterialView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "pbf_scaleBlurRadiusByAmount:", self->_viewScreenSizeScale);
          objc_msgSend(v6, "bounds");
          objc_msgSend(v19, "setFrame:");
          objc_msgSend(v19, "setAutoresizingMask:", 18);
          objc_msgSend(v19, "setGroupNameBase:", CFSTR("HomeScreenPreviewView"));
          objc_msgSend(v6, "addSubview:", v19);

        }
      }
LABEL_11:

LABEL_12:
      if (-[PBFHomeScreenPreviewViewBuilder excludesSilhouette](self, "excludesSilhouette"))
      {
        v20 = (void *)MEMORY[0x1E0CD28B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke;
        v28[3] = &unk_1E86F2540;
        v28[4] = self;
        v21 = &v29;
        v29 = v6;
        objc_msgSend(v20, "bs_performAfterSynchronizedCommit:", v28);
      }
      else
      {
        v22 = -[PBFHomeScreenPreviewViewBuilder excludesHomeScreenDock](self, "excludesHomeScreenDock");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFHomeScreenPreviewViewBuilder buildView]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_2;
        v25[3] = &unk_1E86F32E0;
        v27 = v22;
        v25[4] = self;
        v21 = &v26;
        v26 = v6;
        PBFDispatchAsyncWithString(v23, QOS_CLASS_USER_INITIATED, v25);

      }
      return v6;
    case 1:
      v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v6, "bounds");
      v9 = (void *)objc_msgSend(v12, "initWithFrame:");
      -[PRPosterHomeScreenConfiguration solidColorAppearance](self->_homeScreenConfiguration, "solidColorAppearance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "effectiveColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "color");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v15);

      goto LABEL_8;
    case 2:
      v16 = objc_alloc(MEMORY[0x1E0D7FCD0]);
      objc_msgSend(v6, "bounds");
      v9 = (void *)objc_msgSend(v16, "initWithFrame:");
      -[PRPosterHomeScreenConfiguration gradientAppearance](self->_homeScreenConfiguration, "gradientAppearance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "gradientColors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setColors:", v14);
LABEL_8:

      objc_msgSend(v9, "setAutoresizingMask:", 18);
      objc_msgSend(v6, "addSubview:", v9);
      goto LABEL_11;
    default:
      goto LABEL_12;
  }
}

uint64_t __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

void __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v2 = objc_alloc_init(MEMORY[0x1E0DAAE90]);
  objc_msgSend(v2, "silhouetteLayoutForPageAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(MEMORY[0x1E0DAAEB8]);
  v6 = v5;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_3;
  v10[3] = &unk_1E86F4688;
  v14 = *(_BYTE *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  +[PBFSilhouetteHelpers makeHomeScreenSilhouetteViewWithLayout:includeDock:displayContext:viewScreenSizeScale:](PBFSilhouetteHelpers, "makeHomeScreenSilhouetteViewWithLayout:includeDock:displayContext:viewScreenSizeScale:", *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 56) == 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(double *)(*(_QWORD *)(a1 + 40) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addSubview:", v2);
  v3 = (void *)MEMORY[0x1E0CD28B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_4;
  v5[3] = &unk_1E86F2540;
  v4 = *(void **)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v4;
  objc_msgSend(v3, "bs_performAfterSynchronizedCommit:", v5);

}

uint64_t __44__PBFHomeScreenPreviewViewBuilder_buildView__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (PBFDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void)setDisplayContext:(id)a3
{
  objc_storeStrong((id *)&self->_displayContext, a3);
}

- (PRPosterHomeScreenConfiguration)homeScreenConfiguration
{
  return self->_homeScreenConfiguration;
}

- (void)setHomeScreenConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenConfiguration, a3);
}

- (UIImage)unlockedPosterSnapshot
{
  return self->_unlockedPosterSnapshot;
}

- (void)setUnlockedPosterSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_unlockedPosterSnapshot, a3);
}

- (BOOL)excludesSilhouette
{
  return self->_excludesSilhouette;
}

- (void)setExcludesSilhouette:(BOOL)a3
{
  self->_excludesSilhouette = a3;
}

- (BOOL)excludesHomeScreenDock
{
  return self->_excludesHomeScreenDock;
}

- (void)setExcludesHomeScreenDock:(BOOL)a3
{
  self->_excludesHomeScreenDock = a3;
}

- (double)viewScreenSizeScale
{
  return self->_viewScreenSizeScale;
}

- (void)setViewScreenSizeScale:(double)a3
{
  self->_viewScreenSizeScale = a3;
}

- (id)renderingCompletionHandler
{
  return self->_renderingCompletionHandler;
}

- (void)setRenderingCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_renderingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_unlockedPosterSnapshot, 0);
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_displayContext, 0);
}

@end

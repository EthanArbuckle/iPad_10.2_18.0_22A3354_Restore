@implementation VKCImageSubjectBaseView

- (VKCImageSubjectBaseView)initWithFrame:(CGRect)a3
{
  VKCImageSubjectBaseView *v3;
  CALayer *v4;
  CALayer *colorLayer;
  CALayer *v6;
  CALayer *imageHighlightLayer;
  CALayer *v8;
  CALayer *imageHighlightLayerMask;
  CAShapeLayer *v10;
  CAShapeLayer *intersectionMask;
  CALayer *v12;
  CALayer *imageHighlightLayerContainerShadow;
  VKCImageSubjectGlowLayer *v14;
  VKCImageSubjectGlowLayer *glowLayer;
  CALayer *v16;
  CALayer *imageHighlightLayerContainer;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *backgroundQueue;
  VKCRemoveBackgroundRequestHandler *v33;
  VKCRemoveBackgroundRequestHandler *removeBackgroundRequestHandler;
  dispatch_time_t v35;
  NSObject *v36;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)VKCImageSubjectBaseView;
  v3 = -[VKCImageBaseOverlayView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    colorLayer = v3->_colorLayer;
    v3->_colorLayer = v4;

    -[VKCImageSubjectBaseView setUsesLightDimmingViewInLightMode:](v3, "setUsesLightDimmingViewInLightMode:", 0);
    v6 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    imageHighlightLayer = v3->_imageHighlightLayer;
    v3->_imageHighlightLayer = v6;

    v8 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    imageHighlightLayerMask = v3->_imageHighlightLayerMask;
    v3->_imageHighlightLayerMask = v8;

    v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    intersectionMask = v3->_intersectionMask;
    v3->_intersectionMask = v10;

    -[CAShapeLayer setHidden:](v3->_intersectionMask, "setHidden:", 1);
    -[CALayer addSublayer:](v3->_imageHighlightLayerMask, "addSublayer:", v3->_intersectionMask);
    -[CALayer setMask:](v3->_imageHighlightLayer, "setMask:", v3->_imageHighlightLayerMask);
    v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    imageHighlightLayerContainerShadow = v3->_imageHighlightLayerContainerShadow;
    v3->_imageHighlightLayerContainerShadow = v12;

    v14 = objc_alloc_init(VKCImageSubjectGlowLayer);
    glowLayer = v3->_glowLayer;
    v3->_glowLayer = v14;

    v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    imageHighlightLayerContainer = v3->_imageHighlightLayerContainer;
    v3->_imageHighlightLayerContainer = v16;

    -[CALayer setAllowsGroupOpacity:](v3->_imageHighlightLayerContainer, "setAllowsGroupOpacity:", 1);
    -[CALayer setAllowsGroupOpacity:](v3->_imageHighlightLayerContainerShadow, "setAllowsGroupOpacity:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setShadowColor:](v3->_imageHighlightLayerContainer, "setShadowColor:", objc_msgSend(v18, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setShadowColor:](v3->_imageHighlightLayerContainerShadow, "setShadowColor:", objc_msgSend(v19, "CGColor"));

    -[CALayer addSublayer:](v3->_imageHighlightLayerContainer, "addSublayer:", v3->_imageHighlightLayerContainerShadow);
    -[CALayer addSublayer:](v3->_imageHighlightLayerContainerShadow, "addSublayer:", v3->_imageHighlightLayer);
    LODWORD(v20) = 0;
    -[CALayer setOpacity:](v3->_imageHighlightLayer, "setOpacity:", v20);
    LODWORD(v21) = 0;
    -[CALayer setOpacity:](v3->_imageHighlightLayerContainer, "setOpacity:", v21);
    LODWORD(v22) = 1.0;
    -[CALayer setOpacity:](v3->_imageHighlightLayerContainerShadow, "setOpacity:", v22);
    LODWORD(v23) = 0;
    -[CALayer setOpacity:](v3->_colorLayer, "setOpacity:", v23);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValue:forKeyPath:", &unk_1E9495148, *MEMORY[0x1E0CD2D90]);
    v42[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer mask](v3->_imageHighlightLayer, "mask");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFilters:", v25);

    -[VKCImageSubjectBaseView layer](v3, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSublayer:", v3->_colorLayer);

    -[VKCImageSubjectBaseView layer](v3, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSublayer:", v3->_imageHighlightLayerContainer);

    -[VKCImageSubjectBaseView layer](v3, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSublayer:", v3->_glowLayer);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = dispatch_queue_create("VKImageSubjectBaseViewBackground", v30);
    backgroundQueue = v3->_backgroundQueue;
    v3->_backgroundQueue = (OS_dispatch_queue *)v31;

    _os_feature_enabled_impl();
    v3->_subjectHighlightFeatureFlagEnabled = 1;
    v33 = objc_alloc_init(VKCRemoveBackgroundRequestHandler);
    removeBackgroundRequestHandler = v3->_removeBackgroundRequestHandler;
    v3->_removeBackgroundRequestHandler = v33;

    objc_initWeak(&location, v3);
    v35 = dispatch_time(0, 1000000000);
    v36 = v3->_backgroundQueue;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __41__VKCImageSubjectBaseView_initWithFrame___block_invoke;
    v38[3] = &unk_1E9462630;
    objc_copyWeak(&v39, &location);
    dispatch_after(v35, v36, v38);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __41__VKCImageSubjectBaseView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMaskLoadContext:", v3);

}

- (UIBezierPath)normalizedSubjectPath
{
  void *v3;
  void *v4;

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  objc_msgSend(v3, "normalizedPathForActiveSubjectsWithContentsRect:topLevelOnly:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBezierPath *)v4;
}

- (UIBezierPath)subjectPathInBoundsCoordinates
{
  void *v3;
  void *v4;
  void *v5;

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  objc_msgSend(v3, "normalizedPathForActiveSubjectsWithContentsRect:topLevelOnly:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageSubjectBaseView convertNormalizedPathToBoundsCoordinates:](self, "convertNormalizedPathToBoundsCoordinates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBezierPath *)v5;
}

- (id)convertNormalizedPathToBoundsCoordinates:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  CGAffineTransform v16;
  CGAffineTransform t2;
  CGAffineTransform v18;
  CGAffineTransform v19;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  if (v4)
  {
    -[VKCImageSubjectBaseView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_msgSend(v4, "copy");

    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, v11, v13);
    CGAffineTransformMakeTranslation(&t2, v7, v9);
    v16 = v19;
    CGAffineTransformConcat(&v18, &v16, &t2);
    v19 = v18;
    objc_msgSend(v14, "vk_applyTransform:", &v18);
    v5 = v14;
  }

  return v5;
}

- (CALayer)pulseLayer
{
  void *v2;
  void *v3;

  -[VKCImageSubjectBaseView pulsePackage](self, "pulsePackage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayer *)v3;
}

- (void)setGlowLayerActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  VKCImageSubjectBaseView *v12;
  void *v13;
  os_log_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  VKCImageSubjectBaseView *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  VKCImageSubjectBaseView *v33;
  os_log_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  VKCImageSubjectBaseView *v41;
  __int16 v42;
  VKCImageSubjectBaseView *v43;
  uint64_t v44;

  v3 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (!self->_glowLayerActive)
      return;
    self->_glowLayerActive = 0;
    goto LABEL_15;
  }
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (self->_glowLayerActive == v3)
      return;
    self->_glowLayerActive = v3;
    if (v3)
    {
      -[VKCImageSubjectBaseView window](self, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "screen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scale");
      v9 = v8;

      v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "vk_indexString");
        v12 = (VKCImageSubjectBaseView *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v12;
        v42 = 2112;
        v43 = self;
        _os_log_impl(&dword_1D2E0D000, v10, OS_LOG_TYPE_DEFAULT, "Activating glow for indexes: %@, : %@", buf, 0x16u);

      }
      -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
      v14 = (os_log_t)objc_claimAutoreleasedReturnValue();
      -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      -[VKCImageSubjectBaseView setActiveGlowLayerIndexSet:](self, "setActiveGlowLayerIndexSet:", v14);
      if (-[NSObject count](v14, "count") == 1)
      {
        -[VKCImageSubjectBaseView subjectPathInBoundsCoordinates](self, "subjectPathInBoundsCoordinates");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCImageSubjectBaseView glowLayer](self, "glowLayer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView vk_viewPointRatioFromWindow](self, "vk_viewPointRatioFromWindow");
        objc_msgSend(v24, "beginAnimationWithViewScale:screenScale:path:index:count:identifier:", v23, 0, 1, &unk_1E9494E98);

      }
      else
      {
        if (!-[NSObject count](v14, "count"))
        {
          objc_msgSend(v13, "allSubjectIndexes");
          v30 = objc_claimAutoreleasedReturnValue();

          v14 = (os_log_t)v30;
        }
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __46__VKCImageSubjectBaseView_setGlowLayerActive___block_invoke;
        v31[3] = &unk_1E9463088;
        v35 = v16;
        v36 = v18;
        v37 = v20;
        v38 = v22;
        v32 = v13;
        v33 = self;
        v39 = v9;
        v14 = v14;
        v34 = v14;
        -[NSObject enumerateIndexesUsingBlock:](v14, "enumerateIndexesUsingBlock:", v31);

        v23 = v32;
      }

LABEL_18:
      -[VKCImageSubjectBaseView baseSubjectDelegate](self, "baseSubjectDelegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "subjectBaseViewGlowLayerActiveDidChange:", self);

      -[VKCImageSubjectBaseView sendSubjectAnalyticsEventWithEventType:interactionType:subjectFound:processingDuration:](self, "sendSubjectAnalyticsEventWithEventType:interactionType:subjectFound:processingDuration:", 1, 0, 1, 0.0);
      return;
    }
LABEL_15:
    -[VKCImageSubjectBaseView glowLayer](self, "glowLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stopAnimationAnimated:", 1);

    -[VKCImageSubjectBaseView setActiveGlowLayerIndexSet:](self, "setActiveGlowLayerIndexSet:", 0);
    v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "vk_indexString");
      v28 = (VKCImageSubjectBaseView *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v28;
      v42 = 2112;
      v43 = self;
      _os_log_impl(&dword_1D2E0D000, v14, OS_LOG_TYPE_DEFAULT, "Deactivating glow for indexes: %@, %@", buf, 0x16u);

    }
    v13 = v14;
    goto LABEL_18;
  }
  v25 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = self;
    _os_log_impl(&dword_1D2E0D000, v25, OS_LOG_TYPE_DEFAULT, "Trying to set the glow layer active, but no subject context exists: %@", buf, 0xCu);
  }

  if (self->_glowLayerActive)
  {
    self->_glowLayerActive = 0;
    goto LABEL_15;
  }
}

void __46__VKCImageSubjectBaseView_setGlowLayerActive___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v5, 1, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "convertNormalizedPathToBoundsCoordinates:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "glowLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "vk_viewPointRatioFromWindow");
  v9 = v8;
  v10 = *(double *)(a1 + 88);
  v11 = objc_msgSend(*(id *)(a1 + 48), "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginAnimationWithViewScale:screenScale:path:index:count:identifier:", v6, a2, v11, v12, v9, v10);

}

- (void)updateGlowLayerForActiveSubjectIndexSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  VKCImageSubjectBaseView *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];
  _QWORD v41[5];
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView activeGlowLayerIndexSet](self, "activeGlowLayerIndexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertIndexSetToConcreteSubjectIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertIndexSetToConcreteSubjectIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexSet:", v5);
  objc_msgSend(v10, "addIndexes:", v7);
  v11 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke;
  v42[3] = &unk_1E94630B0;
  v12 = v5;
  v43 = v12;
  v13 = v7;
  v44 = v13;
  v14 = v8;
  v45 = v14;
  v15 = v9;
  v46 = v15;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", v42);
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke_2;
  v41[3] = &unk_1E94630D8;
  v41[4] = self;
  objc_msgSend(v14, "enumerateIndexesUsingBlock:", v41);
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[VKCImageSubjectBaseView window](self, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "screen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scale");
  v27 = v26;

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v28 = objc_msgSend(v15, "count");
  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke_3;
  v30[3] = &unk_1E9463100;
  v29 = v3;
  v34 = v17;
  v35 = v19;
  v36 = v21;
  v37 = v23;
  v31 = v29;
  v32 = self;
  v38 = v27;
  v33 = v40;
  v39 = v28;
  objc_msgSend(v15, "enumerateIndexesUsingBlock:", v30);
  -[VKCImageSubjectBaseView setActiveGlowLayerIndexSet:](self, "setActiveGlowLayerIndexSet:", v13);

  _Block_object_dispose(v40, 8);
}

uint64_t __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke(id *a1, uint64_t a2)
{
  int v4;
  uint64_t result;
  id *v6;

  v4 = objc_msgSend(a1[4], "containsIndex:", a2);
  result = objc_msgSend(a1[5], "containsIndex:", a2);
  if (!v4 || (result & 1) != 0)
  {
    if (((result ^ 1 | v4) & 1) != 0)
      return result;
    v6 = a1 + 7;
  }
  else
  {
    v6 = a1 + 6;
  }
  return objc_msgSend(*v6, "addIndex:", a2);
}

void __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "glowLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimationForIdentifier:animated:", v3, 1);

}

void __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v5, 1, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "convertNormalizedPathToBoundsCoordinates:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "glowLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "vk_viewPointRatioFromWindow");
  v9 = v8;
  v10 = *(double *)(a1 + 88);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(_QWORD *)(v11 + 24);
  *(_QWORD *)(v11 + 24) = v12 + 1;
  v13 = *(_QWORD *)(a1 + 96);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginAnimationWithViewScale:screenScale:path:index:count:identifier:", v6, v12, v13, v14, v9, v10);

}

- (void)setActiveSubjectIndexSet:(id)a3
{
  -[VKCImageSubjectBaseView setActiveSubjectIndexSet:animated:](self, "setActiveSubjectIndexSet:animated:", a3, 0);
}

- (void)setActiveSubjectIndexSet:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  VKCImageSubjectBaseView *v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "vk_indexString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_1D2E0D000, v7, OS_LOG_TYPE_DEFAULT, "Setting Active subject indexes: %@, %@", (uint8_t *)&v11, 0x16u);

  }
  v9 = (void *)objc_msgSend(v6, "copy");
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActiveSubjectIndexes:", v9);

  -[VKCImageSubjectBaseView updateMaskForCurrentSubjectIndexesAnimated:](self, "updateMaskForCurrentSubjectIndexesAnimated:", v4);
}

- (NSIndexSet)activeSubjectIndexSet
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeSubjectIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSIndexSet *)v4;
}

- (void)showPulseAnimationWithViewScale:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[VKCImageSubjectBaseView configurePulseAnimationWithViewScale:](self, "configurePulseAnimationWithViewScale:", a3);
  -[VKCImageSubjectBaseView pulsePackage](self, "pulsePackage");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rootLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisableUpdateMask:", 2);
  -[VKCImageSubjectBaseView subjectPathInBoundsCoordinates](self, "subjectPathInBoundsCoordinates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[VKCImageSubjectBaseView burstPoint](self, "burstPoint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[VKCImageSubjectBaseView burstPoint](self, "burstPoint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "vk_pointValue");
    v18 = v17;
    v20 = v19;

  }
  else
  {
    v18 = VKMCenterOfRect(v8, v10, v12, v14);
    v20 = v21;
  }

  v22 = VKMNormalizedPointInRect(v18, v20, v8, v10, v12);
  v24 = v23;
  -[VKCImageSubjectBaseView configureSubjectLiftAtPoint:](self, "configureSubjectLiftAtPoint:", v18, v20);
  v25 = VKMDistance(v22, v24, 0.5, 0.5);
  v26 = fmin(v25 + v25, 1.0);
  if (v26 <= 0.0)
    v27 = 0.5;
  else
    v27 = (v26 + 1.0) * 0.5;
  *(float *)&v27 = v27;
  objc_msgSend(v5, "setSpeed:", v27);
  -[VKCImageSubjectBaseView layer](self, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superlayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "convertPoint:toLayer:", v29, v18, v20);
  v31 = v30;
  v33 = v32;

  objc_msgSend(v5, "setPosition:", v31, v33);
  objc_msgSend(v5, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (void)configurePulseAnimationWithViewScale:(double)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  void *v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  -[VKCImageSubjectBaseView pulsePackage](self, "pulsePackage", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_3;
  -[VKCImageSubjectBaseView loadPulsePackage](self, "loadPulsePackage");
  v4 = objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView setPulsePackage:](self, "setPulsePackage:", v4);
  -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject rootLayer](v4, "rootLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSublayer:", v6);

  if (v4)
  {
LABEL_3:
    -[NSObject rootLayer](v4, "rootLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject publishedObjectWithName:](v4, "publishedObjectWithName:", CFSTR("sharpLayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject publishedObjectWithName:](v4, "publishedObjectWithName:", CFSTR("blurLayer"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7 && v8 && v9)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[VKCImageSubjectBaseView subjectPathInBoundsCoordinates](self, "subjectPathInBoundsCoordinates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;

      objc_msgSend(v7, "bounds");
      if (v14 / v17 >= v16 / v18)
        v19 = v14 / v17;
      else
        v19 = v16 / v18;
      +[VKCInternalSettings scaleMultiplier](VKCInternalSettings, "scaleMultiplier");
      v21 = v20;
      memset(&v56, 0, sizeof(v56));
      v22 = VKMRandomBetween(0.0, 6.28318531);
      CGAffineTransformMakeRotation(&v56, v22);
      v55 = v56;
      objc_msgSend(v7, "setAffineTransform:", &v55);
      memset(&v54, 0, sizeof(v54));
      CGAffineTransformMakeScale(&v54, v21 * v19, v21 * v19);
      v53 = v54;
      objc_msgSend(v8, "setAffineTransform:", &v53);
      v52 = v54;
      objc_msgSend(v10, "setAffineTransform:", &v52);
      +[VKCInternalSettings sharpMinOpacity](VKCInternalSettings, "sharpMinOpacity");
      *(float *)&v23 = v23;
      objc_msgSend(v8, "setOpacity:", v23);
      +[VKCInternalSettings sharpMaxThickness](VKCInternalSettings, "sharpMaxThickness");
      v25 = v24;
      +[VKCInternalSettings sharpBlurRadius](VKCInternalSettings, "sharpBlurRadius");
      v27 = v26;
      +[VKCInternalSettings blurMaxThickness](VKCInternalSettings, "blurMaxThickness");
      v29 = v28;
      +[VKCInternalSettings blurBlurRadius](VKCInternalSettings, "blurBlurRadius");
      v31 = v30;
      objc_msgSend(v8, "setLineWidth:", v25);
      __64__VKCImageSubjectBaseView_configurePulseAnimationWithViewScale___block_invoke(v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFilters:", v33);

      +[VKCInternalSettings blurMinOpacity](VKCInternalSettings, "blurMinOpacity");
      *(float *)&v34 = v34;
      objc_msgSend(v10, "setOpacity:", v34);
      objc_msgSend(v10, "setLineWidth:", v29);
      __64__VKCImageSubjectBaseView_configurePulseAnimationWithViewScale___block_invoke(v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFilters:", v36);

      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v11);
    }
    else
    {
      v37 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        -[VKCImageSubjectBaseView configurePulseAnimationWithViewScale:].cold.2(v37, v38, v39, v40, v41, v42, v43, v44);

    }
  }
  else
  {
    v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[VKCImageSubjectBaseView configurePulseAnimationWithViewScale:].cold.1(v4, v45, v46, v47, v48, v49, v50, v51);
  }

}

id __64__VKCImageSubjectBaseView_configurePulseAnimationWithViewScale___block_invoke(double a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKeyPath:", v3, *MEMORY[0x1E0CD2D90]);

  objc_msgSend(v2, "setValue:forKey:", CFSTR("low"), *MEMORY[0x1E0CD2D88]);
  return v2;
}

- (id)loadPulsePackage
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("SubjectPulseLayer"), CFSTR("caar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0CD3070];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v3, v4, 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VKCImageSubjectBaseView loadPulsePackage].cold.1((uint64_t)v6, v7);

  }
  return v5;
}

- (CGSize)imageSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setSubjectContext:(id)a3
{
  VKCImageSubjectContext *v5;
  id *p_subjectContext;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CGAffineTransform *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v5 = (VKCImageSubjectContext *)a3;
  p_subjectContext = (id *)&self->_subjectContext;
  if (self->_subjectContext != v5)
  {
    objc_storeStrong((id *)&self->_subjectContext, a3);
    -[VKCImageSubjectBaseView setBurstPoint:](self, "setBurstPoint:", 0);
    -[VKCImageSubjectBaseView clearCachedSubject](self, "clearCachedSubject");
    v7 = *p_subjectContext;
    -[VKCImageSubjectBaseView analysisResult](self, "analysisResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCachedSubjectContext:", v7);

    -[VKCImageSubjectBaseView customImageForRemoveBackground](self, "customImageForRemoveBackground");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "vk_cgImage");

    -[VKCImageSubjectBaseView customImageForRemoveBackground](self, "customImageForRemoveBackground");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (CGAffineTransform *)objc_msgSend(v11, "vk_imageOrientation");

    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    vk_transformToImageOrientation(v12, (uint64_t)&v21);
    if (!v10)
    {
      objc_msgSend(*p_subjectContext, "request");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "CGImage");

      vk_transformToImageOrientation((CGAffineTransform *)objc_msgSend(*p_subjectContext, "imageOrientation"), (uint64_t)v20);
      v21 = v20[0];
      v22 = v20[1];
      v23 = v20[2];
    }
    -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContents:", v10);

    v17 = v21;
    v18 = v22;
    v19 = v23;
    -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    objc_msgSend(v15, "setAffineTransform:", v16);

    -[VKCImageSubjectBaseView updateMaskForCurrentSubjectIndexesAnimated:](self, "updateMaskForCurrentSubjectIndexesAnimated:", 0);
    -[VKCImageSubjectBaseView updateForImageBoundsChangeIfNecessary](self, "updateForImageBoundsChangeIfNecessary");
  }

}

- (void)configureSubjectLiftAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  y = a3.y;
  x = a3.x;
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", x, y);
  objc_msgSend(v24, "indexOfSubjectAtNormalizedPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  objc_msgSend(v24, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v12 = VKMCenterOfRect(v8, v9, v10, v11);
  v14 = v13;
  -[VKCImageSubjectBaseView imageHighlightLayerContainer](self, "imageHighlightLayerContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v15, "setAnchorPoint:", v12, v14);
  objc_msgSend(v15, "setFrame:", v17, v19, v21, v23);

}

- (void)updateMaskForCurrentSubjectIndexesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[VKCImageSubjectBaseView imageHighlightLayerMask](self, "imageHighlightLayerMask");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView configureMaskForCurrentSubjectContextWithLayer:animated:](self, "configureMaskForCurrentSubjectContextWithLayer:animated:", v5, v3);

}

- (void)configureMaskForCurrentSubjectContextWithLayer:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _BOOL4 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[5];
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform t1;
  CGAffineTransform v55;
  CGAffineTransform t2;
  CGAffineTransform v57;
  CGAffineTransform v58;

  v4 = a4;
  v6 = a3;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v44 = v17;
  v45 = v16;
  v42 = v19;
  v43 = v18;

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "normalizedPathForSubjectWithIndexSet:contentsRect:topLevelOnly:", v21, 0, 0.0, 0.0, 1.0, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v58, 0, sizeof(v58));
  CGAffineTransformMakeTranslation(&v58, -0.5, -0.5);
  -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
    objc_msgSend(v23, "affineTransform");
  else
    memset(&v55, 0, sizeof(v55));
  CGAffineTransformInvert(&t2, &v55);
  t1 = v58;
  CGAffineTransformConcat(&v57, &t1, &t2);
  v58 = v57;

  CGAffineTransformMakeTranslation(&v53, 0.5, 0.5);
  t1 = v58;
  CGAffineTransformConcat(&v57, &t1, &v53);
  v58 = v57;
  VKMTransformConvertingRectToRect((uint64_t)&v52, 0.0, 1.0, 1.0, v8, v10, v12, v14);
  t1 = v58;
  CGAffineTransformConcat(&v57, &t1, &v52);
  v58 = v57;
  objc_msgSend(v22, "vk_applyTransform:", &v57);
  memset(&v57, 0, sizeof(v57));
  CGAffineTransformMakeTranslation(&v57, -v8, -v10);
  VKMTransformConvertingRectToRect((uint64_t)&v51, v8, v12, v14, v45, v44, v43, v42);
  v50 = v57;
  CGAffineTransformConcat(&t1, &v50, &v51);
  v57 = t1;
  objc_msgSend(v22, "vk_applyTransform:", &t1);
  v25 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  objc_msgSend(v6, "sublayers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "reverseObjectEnumerator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __83__VKCImageSubjectBaseView_configureMaskForCurrentSubjectContextWithLayer_animated___block_invoke;
  v49[3] = &unk_1E9463128;
  v49[4] = self;
  objc_msgSend(v28, "vk_objectPassingTest:", v49);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFrame:", v45, v44, v43, v42);
  objc_msgSend(v25, "setFrame:", v45, v44, v43, v42);
  objc_msgSend(v25, "setPath:", objc_msgSend(v22, "vk_CGPath"));
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v25, "setFillColor:", objc_msgSend(v30, "CGColor"));

  v31 = *MEMORY[0x1E0CD2B70];
  objc_msgSend(v25, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  -[VKCImageSubjectBaseView intersectionMask](self, "intersectionMask");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (objc_msgSend(v29, "path") && v4)
  {
    v41 = v4;
    v33 = v6;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_pathFromCGPath:", objc_msgSend(v29, "path"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "vk_intersectAndFlattenWithPath:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v35, "isEmpty") & 1) == 0)
    {
      objc_msgSend(v32, "setFrame:", v45, v44, v43, v42);
      objc_msgSend(v32, "setPath:", objc_msgSend(v35, "vk_CGPath"));
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v32, "setFillColor:", objc_msgSend(v36, "CGColor"));

      objc_msgSend(v32, "setFillRule:", v31);
      objc_msgSend(v32, "setHidden:", 0);
    }

    v6 = v33;
    v4 = v41;
  }
  objc_msgSend(v6, "addSublayer:", v25);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (!v4)
  {
    if (v29)
      objc_msgSend(v29, "removeFromSuperlayer");
    goto LABEL_14;
  }
  -[VKCImageSubjectBaseView opacityAnimationFromValue:toValue:](self, "opacityAnimationFromValue:toValue:", 0.0, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setRemovedOnCompletion:", 1);
  objc_msgSend(v25, "addAnimation:forKey:", v37, CFSTR("fade-in"));

  if (!v29)
  {
LABEL_14:
    objc_msgSend(v32, "setHidden:", 1);
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[VKCImageSubjectBaseView opacityAnimationFromValue:toValue:](self, "opacityAnimationFromValue:toValue:", 1.0, 0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setRemovedOnCompletion:", 0);
  v39 = (void *)MEMORY[0x1E0CD28B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __83__VKCImageSubjectBaseView_configureMaskForCurrentSubjectContextWithLayer_animated___block_invoke_2;
  v46[3] = &unk_1E9462B58;
  v40 = v29;
  v47 = v40;
  v48 = v32;
  objc_msgSend(v39, "setCompletionBlock:", v46);
  objc_msgSend(v40, "addAnimation:forKey:", v38, CFSTR("fade-out"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

LABEL_15:
}

BOOL __83__VKCImageSubjectBaseView_configureMaskForCurrentSubjectContextWithLayer_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "intersectionMask");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 != v3;
}

uint64_t __83__VKCImageSubjectBaseView_configureMaskForCurrentSubjectContextWithLayer_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
  return objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
}

- (id)opacityAnimationFromValue:(double)a3 toValue:(double)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDuration:", 0.2);
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToValue:", v8);

  return v6;
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageSubjectBaseView;
  -[VKCImageSubjectBaseView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageSubjectBaseView updateForImageBoundsChangeIfNecessary](self, "updateForImageBoundsChangeIfNecessary");
}

- (void)setContentsRect:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageSubjectBaseView;
  -[VKCImageBaseOverlayView setContentsRect:](&v4, sel_setContentsRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageSubjectBaseView updateForImageBoundsChangeIfNecessary](self, "updateForImageBoundsChangeIfNecessary");
}

- (void)setHidden:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKCImageSubjectBaseView;
  -[VKCImageSubjectBaseView setHidden:](&v5, sel_setHidden_, a3);
  if (-[VKCImageSubjectBaseView isHidden](self, "isHidden"))
  {
    -[VKCImageSubjectBaseView setGlowLayerActive:](self, "setGlowLayerActive:", 0);
    -[VKCImageSubjectBaseView pulseLayer](self, "pulseLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllAnimations");

  }
}

- (BOOL)isLivePhoto
{
  return 0;
}

- (void)updateForImageBoundsChangeIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;

  -[VKCImageSubjectBaseView imageBounds](self, "imageBounds");
  if (VKMRectIsFinite(v3, v4, v5, v6))
  {
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "subjectCount");

    if (v8)
      -[VKCImageSubjectBaseView _updateForImageBoundsChange](self, "_updateForImageBoundsChange");
  }
}

- (void)_updateForImageBoundsChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  CGFloat v51;
  CGFloat v52;
  id v53;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[VKCImageSubjectBaseView updateMaskForCurrentSubjectIndexesAnimated:](self, "updateMaskForCurrentSubjectIndexesAnimated:", 0);
  -[VKCImageSubjectBaseView colorLayer](self, "colorLayer");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView imageHighlightLayerContainer](self, "imageHighlightLayerContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView imageHighlightLayerContainerShadow](self, "imageHighlightLayerContainerShadow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView glowLayer](self, "glowLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView imageBounds](self, "imageBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  objc_msgSend(v15, "normalizedPathForActiveSubjectsWithContentsRect:topLevelOnly:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v51 = v18;
  v52 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v53, "setFrame:", v8, v10, v12, v14);
  v23 = VKMCenterOfRect(v8, v10, v12, v14);
  v25 = v24;
  v26 = VKMMultiplyPointScalar(v12, v14, 1.1);
  objc_msgSend(v4, "setFrame:", VKMRectWithCenterAndSize(v23, v25, v26));
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v4, "superlayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:fromLayer:", v27, v8, v10, v12, v14);
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(v3, "bounds");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  objc_msgSend(v3, "mask");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

  objc_msgSend(v53, "bounds");
  VKMRectFromNormalizedSubrect(v37, v38, v39, v40, v52, v51, v20, v22);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  objc_msgSend(v53, "mask");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);

  objc_msgSend(v6, "superlayer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bounds");
  objc_msgSend(v6, "setFrame:");

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (CGRect)imageBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[VKCImageSubjectBaseView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  VKMRectFromNormalizedSubrect(v4, v6, v8, v10, v11, v12, v13, v14);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)subjectFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKCImageSubjectBaseView imageBounds](self, "imageBounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "normalizedCropRect");
    VKMRectFromNormalizedSubrect(v5, v7, v9, v11, v13, v14, v15, v16);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

  }
  else
  {
    v18 = *MEMORY[0x1E0C9D628];
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)setRecognitionResult:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  objc_super v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VKCImageSubjectBaseView;
  -[VKCImageBaseOverlayView recognitionResult](&v18, sel_recognitionResult);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)VKCImageSubjectBaseView;
    -[VKCImageBaseOverlayView setRecognitionResult:](&v17, sel_setRecognitionResult_, v4);
    v6 = objc_opt_class();
    VKDynamicCast(v6, (uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedCustomImageForRemoveBackground");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[VKCImageSubjectBaseView setCustomImageForRemoveBackground:](self, "setCustomImageForRemoveBackground:", v8);
    -[VKCImageSubjectBaseView setLoadMaskRequestStatus:](self, "setLoadMaskRequestStatus:", 0);
    -[VKCImageSubjectBaseView analysisResult](self, "analysisResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cachedSubjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectBaseView setSubjectContext:](self, "setSubjectContext:", v10);

    -[VKCImageSubjectBaseView analysisResult](self, "analysisResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectBaseView setImageOrientation:](self, "setImageOrientation:", objc_msgSend(v12, "imageOrientation"));

    -[VKCImageSubjectBaseView setGlowLayerActive:](self, "setGlowLayerActive:", 0);
    -[VKCImageSubjectBaseView setLoadMaskIndex:](self, "setLoadMaskIndex:", -[VKCImageSubjectBaseView loadMaskIndex](self, "loadMaskIndex") + 1);
    -[VKCImageSubjectBaseView colorLayer](self, "colorLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 0;
    objc_msgSend(v13, "setOpacity:", v14);

    -[VKCImageSubjectBaseView imageHighlightLayerContainer](self, "imageHighlightLayerContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 0;
    objc_msgSend(v15, "setOpacity:", v16);

    -[VKCImageSubjectBaseView beginImageSubjectAnalysisWithDelayIfNecessary](self, "beginImageSubjectAnalysisWithDelayIfNecessary");
  }

}

- (void)setCustomImageForRemoveBackground:(id)a3
{
  UIImage *v5;
  NSObject *v6;
  void *v7;
  int v8;
  UIImage *v9;
  __int16 v10;
  VKCImageSubjectBaseView *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (UIImage *)a3;
  if (self->_customImageForRemoveBackground != v5)
  {
    v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = self;
      _os_log_impl(&dword_1D2E0D000, v6, OS_LOG_TYPE_DEFAULT, "Setting custom image for remove background: %@, %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)&self->_customImageForRemoveBackground, a3);
    if (v5)
    {
      -[VKCImageSubjectBaseView analysisResult](self, "analysisResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCachedCustomImageForRemoveBackground:", v5);

    }
    -[VKCImageSubjectBaseView updateMaskForCurrentSubjectIndexesAnimated:](self, "updateMaskForCurrentSubjectIndexesAnimated:", 0);
  }

}

- (void)setUsesLightDimmingViewInLightMode:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  if (a3)
  {
    -[VKCImageSubjectBaseView updateDimmingColorForAppearance](self, "updateDimmingColorForAppearance");
    -[VKCImageSubjectBaseView traitChangeRegistration](self, "traitChangeRegistration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CEAB40], "systemTraitsAffectingColorAppearance");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[VKCImageSubjectBaseView registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v9, self, sel_updateDimmingColorForAppearance);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageSubjectBaseView setTraitChangeRegistration:](self, "setTraitChangeRegistration:", v5);

    }
  }
  else
  {
    -[VKCImageSubjectBaseView traitChangeRegistration](self, "traitChangeRegistration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[VKCImageSubjectBaseView traitChangeRegistration](self, "traitChangeRegistration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageSubjectBaseView unregisterForTraitChanges:](self, "unregisterForTraitChanges:", v7);

    }
    objc_msgSend(MEMORY[0x1E0CEAB40], "appearanceClassForType:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__VKCImageSubjectBaseView_setUsesLightDimmingViewInLightMode___block_invoke;
    v10[3] = &unk_1E94625B8;
    v10[4] = self;
    objc_msgSend(v8, "vk_performAsCurrent:", v10);

  }
}

void __62__VKCImageSubjectBaseView_setUsesLightDimmingViewInLightMode___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.3);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setBackgroundColor:", objc_msgSend(v2, "CGColor"));

}

- (void)clearCachedSubject
{
  -[VKCImageSubjectBaseView set_cachedSubjectIndexSet:](self, "set_cachedSubjectIndexSet:", 0);
  -[VKCImageSubjectBaseView set_cachedSubject:](self, "set_cachedSubject:", 0);
}

- (void)setCachedSubject:(id)a3 forIndexSet:(id)a4
{
  id v6;

  v6 = a3;
  -[VKCImageSubjectBaseView set_cachedSubjectIndexSet:](self, "set_cachedSubjectIndexSet:", a4);
  -[VKCImageSubjectBaseView set_cachedSubject:](self, "set_cachedSubject:", v6);

}

- (id)cachedSubjectForIndexSet:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  -[VKCImageSubjectBaseView _cachedSubjectIndexSet](self, "_cachedSubjectIndexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToIndexSet:", v4);

  if (v6)
  {
    -[VKCImageSubjectBaseView _cachedSubject](self, "_cachedSubject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)updateDimmingColorForAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.8);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageSubjectBaseView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "vk_isDark");

  v8 = v16;
  if (v7)
    v8 = v5;
  v9 = objc_msgSend(objc_retainAutorelease(v8), "CGColor");
  -[VKCImageSubjectBaseView colorLayer](self, "colorLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[VKCImageSubjectBaseView imageHighlightLayerContainerShadow](self, "imageHighlightLayerContainerShadow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if ((v7 & 1) != 0)
  {
    LODWORD(v12) = 0;
    objc_msgSend(v11, "setShadowOpacity:", v12);
  }
  else
  {
    objc_msgSend(v11, "setShadowRadius:", 30.0);
    LODWORD(v14) = 1050253722;
    objc_msgSend(v13, "setShadowOpacity:", v14);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "setShadowColor:", objc_msgSend(v15, "CGColor"));

    objc_msgSend(v13, "setShadowOffset:", 0.0, 5.0);
  }

}

- (VKCImageAnalysisResult)analysisResult
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (VKCImageAnalysisResult *)v5;
}

- (BOOL)subjectExistsAtPoint:(CGPoint)a3
{
  void *v3;
  BOOL v4;

  -[VKCImageSubjectBaseView indexOfSubjectAtPoint:](self, "indexOfSubjectAtPoint:", a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)indexOfSubjectAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", x, y);
    v8 = v7;
    v10 = v9;
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexOfSubjectAtNormalizedPoint:", v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (NSIndexSet)allSubjectsIndexSet
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSubjectIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSIndexSet *)v4;
}

- (void)setLoadMaskRequestStatus:(unint64_t)a3
{
  self->_loadMaskRequestStatus = a3;
}

- (void)loadSubjectMaskIfNecessary
{
  -[VKCImageSubjectBaseView loadSubjectMaskIfNecessaryWithCompletion:](self, "loadSubjectMaskIfNecessaryWithCompletion:", 0);
}

- (void)loadSubjectMaskIfNecessaryWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v5)
      v5[2]();
  }
  else
  {
    -[VKCImageSubjectBaseView _loadSubjectMaskIfNecessaryWithCompletion:](self, "_loadSubjectMaskIfNecessaryWithCompletion:", v5);
  }

}

- (void)_loadSubjectMaskIfNecessaryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16[2];
  id location;

  v4 = a3;
  -[VKCImageSubjectBaseView analysisResult](self, "analysisResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VKCImageSubjectBaseView loadMaskRequestStatus](self, "loadMaskRequestStatus"))
  {
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || !v5)
    {

    }
    else if (-[VKCImageSubjectBaseView subjectHighlightFeatureFlagEnabled](self, "subjectHighlightFeatureFlagEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)(-[VKCImageSubjectBaseView loadMaskIndex](self, "loadMaskIndex") + 1);
      -[VKCImageSubjectBaseView setLoadMaskIndex:](self, "setLoadMaskIndex:", v8);
      -[VKCImageSubjectBaseView setLoadMaskRequestStatus:](self, "setLoadMaskRequestStatus:", 1);
      -[VKCImageSubjectBaseView baseSubjectDelegate](self, "baseSubjectDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subjectBaseViewDidBeginSubjectAnalysis:", self);

      objc_initWeak(&location, self);
      -[VKCImageSubjectBaseView backgroundQueue](self, "backgroundQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke;
      v12[3] = &unk_1E94631C8;
      objc_copyWeak(v16, &location);
      v13 = v7;
      v14 = v5;
      v15 = v4;
      v16[1] = v8;
      v11 = v7;
      dispatch_async(v10, v12);

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
    }
  }

}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void (**v4)(_QWORD, _QWORD);
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  char v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  VKCRemoveBackgroundRequest *v17;
  VKCRemoveBackgroundRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD);
  id v32[2];
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_2;
  v33[3] = &unk_1E9463150;
  v3 = (id *)(a1 + 56);
  objc_copyWeak(&v37, (id *)(a1 + 56));
  v34 = *(id *)(a1 + 32);
  v35 = *(id *)(a1 + 40);
  v36 = *(id *)(a1 + 48);
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8249E20](v33);
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "loadMaskIndex") == *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isPhotosAssetRequest"))
      v8 = v7;
    else
      v8 = 0;
    v25 = v8;
    objc_msgSend(v6, "customImageForRemoveBackground");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = v25 == 0;
    else
      v10 = 0;
    v11 = !v10;

    if ((v11 & 1) == 0)
    {
      v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v6;
        _os_log_impl(&dword_1D2E0D000, v12, OS_LOG_TYPE_DEFAULT, "Using custom image for remove background: %@", buf, 0xCu);
      }

      objc_msgSend(v6, "customImageForRemoveBackground");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "vk_cgImage");

      if (v14)
        goto LABEL_23;
    }
    if (objc_msgSend(v7, "requestType") != 5)
    {
      v14 = objc_msgSend(v7, "blockingGenerateCGImage");
      if (v14)
        goto LABEL_23;
      v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v6;
        _os_log_impl(&dword_1D2E0D000, v15, OS_LOG_TYPE_DEFAULT, "No image is available for subject detection processing: %@", buf, 0xCu);
      }

      v4[2](v4, 0);
    }
    if (!v25)
    {
LABEL_29:

      goto LABEL_30;
    }
    v14 = 0;
LABEL_23:
    v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v6;
      _os_log_impl(&dword_1D2E0D000, v16, OS_LOG_TYPE_DEFAULT, "Beginning Remove Subject processing: %@", buf, 0xCu);
    }

    if (v25)
    {
      v17 = -[VKCRemoveBackgroundRequest initWithPhotosAnalyzerRequest:]([VKCRemoveBackgroundRequest alloc], "initWithPhotosAnalyzerRequest:", v7);
    }
    else
    {
      +[VKCRemoveBackgroundRequest requestWithImage:orientation:canResize:](VKCRemoveBackgroundRequest, "requestWithImage:orientation:canResize:", v14, objc_msgSend(v7, "imageOrientation"), 1);
      v17 = (VKCRemoveBackgroundRequest *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    objc_msgSend(v7, "viImageType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCRemoveBackgroundRequest setVIImageType:](v18, "setVIImageType:", v19);

    -[VKCRemoveBackgroundRequest setMaskOnly:](v18, "setMaskOnly:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeBackgroundRequestHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v2;
    v26[1] = 3221225472;
    v26[2] = __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_82;
    v26[3] = &unk_1E94631A0;
    objc_copyWeak(v32, v3);
    v31 = v4;
    v22 = *(id *)(a1 + 40);
    v23 = *(void **)(a1 + 64);
    v27 = v22;
    v32[1] = v23;
    v24 = v20;
    v28 = v24;
    v29 = *(id *)(a1 + 32);
    v30 = v6;
    objc_msgSend(v21, "performRequest:completion:", v18, v26);

    objc_destroyWeak(v32);
    goto LABEL_29;
  }
LABEL_30:

  objc_destroyWeak(&v37);
}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;
  _QWORD v6[5];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v5 = v4;

  objc_msgSend(WeakRetained, "sendSubjectAnalyticsEventWithEventType:interactionType:subjectFound:processingDuration:", 0, 0, 0, v5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_3;
  v6[3] = &unk_1E94626F8;
  v6[4] = WeakRetained;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  vk_performBlockOnMainThread(v6);

}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "analysisResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "setLoadMaskRequestStatus:", 2);
      objc_msgSend(*(id *)(a1 + 32), "baseSubjectDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subjectBaseViewViewDidCompleteSubjectAnalysis:", *(_QWORD *)(a1 + 32));

      v6 = *(_QWORD *)(a1 + 48);
      if (v6)
        (*(void (**)(void))(v6 + 16))();
    }
  }
}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  VKCImageSubjectContext *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  VKCImageSubjectContext *v22;
  _QWORD v23[5];
  id v24;
  VKCImageSubjectContext *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = WeakRetained;
  if (!v6)
  {
    if (!WeakRetained)
      goto LABEL_12;
    objc_msgSend(WeakRetained, "analysisResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == *(void **)(a1 + 32))
    {
      v11 = objc_msgSend(v8, "loadMaskIndex");
      v12 = *(_QWORD *)(a1 + 80);

      if (v11 != v12)
        goto LABEL_12;
      if (!v5)
      {
        v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v32 = v17;
          _os_log_impl(&dword_1D2E0D000, v9, OS_LOG_TYPE_DEFAULT, "Subject not found for analysis: %@", buf, 0xCu);
        }
        goto LABEL_4;
      }
      v13 = -[VKCImageSubjectContext initWithMaskResult:]([VKCImageSubjectContext alloc], "initWithMaskResult:", v5);
      objc_msgSend(v8, "maskLoadContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        v16 = v14;
      else
        v16 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
      v10 = v16;

      -[VKCImageSubjectContext preparePathsAndImageMaskIfNecessaryWithContext:](v13, "preparePathsAndImageMaskIfNecessaryWithContext:", v10);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_84;
      v23[3] = &unk_1E9463178;
      v23[4] = v8;
      v18 = *(id *)(a1 + 32);
      v30 = *(_QWORD *)(a1 + 80);
      v24 = v18;
      v25 = v13;
      v26 = *(id *)(a1 + 40);
      v19 = *(id *)(a1 + 48);
      v20 = *(_QWORD *)(a1 + 56);
      v21 = *(void **)(a1 + 64);
      v27 = v19;
      v28 = v20;
      v29 = v21;
      v22 = v13;
      vk_performBlockOnMainThread(v23);

    }
    goto LABEL_12;
  }
  v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_82_cold_1();
LABEL_4:

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_12:

}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_84(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "analysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 != *(void **)(a1 + 40))
    goto LABEL_4;
  v18 = v2;
  objc_msgSend(*(id *)(a1 + 32), "subjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    v2 = v18;
LABEL_4:

    return;
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "loadMaskIndex");
  v5 = *(_QWORD *)(a1 + 88);

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSubjectContext:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v8 = v7;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    v11 = v10;

    v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 72), "subjectContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "animatedStickerScore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      v20 = v8 * 1000.0;
      v21 = 2048;
      v22 = v11 * 1000.0;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1D2E0D000, v12, OS_LOG_TYPE_DEFAULT, "Remove Subject mask for analysis complete with madDuration: %f total duration: %fms stickerScore:%@, %@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "normalizedSubjectPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "isEmpty");
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
}

- (void)loadImageSubjectIfNecessaryWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(id, void *);
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  VKCImageSubjectBaseView *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeSubjectIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageSubjectBaseView cachedSubjectForIndexSet:](self, "cachedSubjectForIndexSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v4[2](v4, v7);
    v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "vk_indexString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1D2E0D000, v8, OS_LOG_TYPE_DEFAULT, "Found Cached subject for indexSet: %@, %@", buf, 0x16u);

    }
  }
  else
  {
    v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "vk_indexString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1D2E0D000, v10, OS_LOG_TYPE_DEFAULT, "Did not find subject for indexSet, creating: %@, %@", buf, 0x16u);

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__VKCImageSubjectBaseView_loadImageSubjectIfNecessaryWithCompletion___block_invoke;
    v12[3] = &unk_1E94631F0;
    v12[4] = self;
    v13 = v6;
    v14 = v4;
    -[VKCImageSubjectBaseView loadImageSubjectWithIndexes:completion:](self, "loadImageSubjectWithIndexes:completion:", v13, v12);

  }
}

void __69__VKCImageSubjectBaseView_loadImageSubjectIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setCachedSubject:forIndexSet:", v3, *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)loadImageSubjectWithIndexes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *log;
  _QWORD v24[4];
  id v25;
  NSObject *v26;
  void (**v27)(_QWORD);
  _QWORD *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD *v32;
  id location;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  VKCImageSubjectBaseView *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[VKCImageSubjectBaseView analysisResult](self, "analysisResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__3;
  v34[4] = __Block_byref_object_dispose__3;
  v35 = 0;
  objc_initWeak(&location, self);
  objc_msgSend(v9, "request");
  v10 = objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke;
  v30[3] = &unk_1E9463218;
  v11 = v7;
  v31 = v11;
  v32 = v34;
  v12 = (void (**)(_QWORD))MEMORY[0x1D8249E20](v30);
  v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = self;
    _os_log_impl(&dword_1D2E0D000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to generate subject image, but no subject analysis exists: %@", buf, 0xCu);
  }

  if (!v10 || !v8)
    goto LABEL_22;
  v14 = !-[VKCImageSubjectBaseView subjectHighlightFeatureFlagEnabled](self, "subjectHighlightFeatureFlagEnabled");
  if (!v6)
    LOBYTE(v14) = 1;
  if ((v14 & 1) != 0)
    goto LABEL_22;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v9, "convertExternalIndexSetToInternal:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    if (v16 != objc_msgSend(v6, "count"))
    {
      v17 = objc_msgSend(v15, "count");
      log = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      v18 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412290;
          v37 = self;
          v19 = log;
          _os_log_impl(&dword_1D2E0D000, log, OS_LOG_TYPE_DEFAULT, "Subject image request contains one of more invalid indexes, ignoring invalid indexes: %@", buf, 0xCu);
        }
        else
        {
          v19 = log;
        }
      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412290;
          v37 = self;
          _os_log_impl(&dword_1D2E0D000, log, OS_LOG_TYPE_DEFAULT, "Subject image request indexes contain no valid indexes, returning nil: %@", buf, 0xCu);
        }

        v19 = v10;
        v10 = 0;
      }

    }
  }
  else
  {
    objc_msgSend(v9, "allSubjectIndexes");
    v15 = v6;
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v9 && v10)
  {
    -[NSObject setMaskOnly:](v10, "setMaskOnly:", 0);
    -[NSObject setCropToFit:](v10, "setCropToFit:", 1);
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "madSubjectIndexesForVKSubjectIndexes:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSelectedIndexSet:](v10, "setSelectedIndexSet:", v21);

    -[VKCImageSubjectBaseView removeBackgroundRequestHandler](self, "removeBackgroundRequestHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_87;
    v24[3] = &unk_1E9463240;
    objc_copyWeak(&v29, &location);
    v25 = v8;
    v27 = v12;
    v10 = v10;
    v26 = v10;
    v28 = v34;
    objc_msgSend(v22, "performRequest:completion:", v10, v24);

    objc_destroyWeak(&v29);
  }
  else
  {
LABEL_22:
    v12[2](v12);
  }

  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);

}

uint64_t __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

void __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  __CVBuffer *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = WeakRetained;
  if (!WeakRetained
    || (objc_msgSend(WeakRetained, "analysisResult"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = *(void **)(a1 + 32),
        v9,
        v9 != v10))
  {
LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_12;
  }
  if (!v5 || v6)
  {
    v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_87_cold_1();

    goto LABEL_11;
  }
  v11 = vk_cgImageFromPixelBuffer((__CVBuffer *)objc_msgSend(v5, "pixelBuffer"));
  v12 = objc_msgSend(*(id *)(a1 + 40), "imageOrientation");
  objc_msgSend(MEMORY[0x1E0CEA638], "vk_imageWithCGImage:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "vk_orientedImageFromImage:toOrientation:", v13, v12);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  CGImageRelease(v11);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_89;
  v16[3] = &unk_1E9462E88;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  v17 = *(id *)(a1 + 32);
  vk_dispatchMainAfterDelay(v16, 0.0);

  objc_destroyWeak(&v18);
LABEL_12:

}

void __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_89(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "analysisResult");

    WeakRetained = v2;
  }

}

- (id)imageSubjectPathWithIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  VKCImageSubjectBaseView *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
    objc_msgSend(v6, "normalizedPathForSubjectWithIndexSet:contentsRect:topLevelOnly:", v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[VKCImageSubjectBaseView convertNormalizedPathToBoundsCoordinates:](self, "convertNormalizedPathToBoundsCoordinates:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl(&dword_1D2E0D000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to access subject path, but no subject analysis exists: %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (void)sendSubjectAnalyticsEventWithEventType:(int64_t)a3 interactionType:(int64_t)a4 subjectFound:(BOOL)a5 processingDuration:(double)a6
{
  _BOOL8 v7;
  VKAnalyticsSubjectEvent *v11;
  void *v12;
  void *v13;
  void *v14;
  VKAnalyticsSubjectEvent *v15;

  v7 = a5;
  v11 = [VKAnalyticsSubjectEvent alloc];
  -[VKCImageBaseOverlayView baseDelegate](self, "baseDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "customAnalyticsIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VKAnalyticsSubjectEvent initWithEventType:interactionType:subjectFound:processingDuration:customIdentifier:](v11, "initWithEventType:interactionType:subjectFound:processingDuration:customIdentifier:", a3, a4, v7, v13, a6);

  -[VKCImageSubjectBaseView baseSubjectDelegate](self, "baseSubjectDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subjectBaseView:analyticsEventOccurred:", self, v15);

}

- (VKCImageSubjectBaseViewDelegate)baseSubjectDelegate
{
  return (VKCImageSubjectBaseViewDelegate *)objc_loadWeakRetained((id *)&self->_baseSubjectDelegate);
}

- (void)setBaseSubjectDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_baseSubjectDelegate, a3);
}

- (BOOL)glowLayerActive
{
  return self->_glowLayerActive;
}

- (NSValue)burstPoint
{
  return self->_burstPoint;
}

- (void)setBurstPoint:(id)a3
{
  objc_storeStrong((id *)&self->_burstPoint, a3);
}

- (CALayer)colorLayer
{
  return self->_colorLayer;
}

- (void)setColorLayer:(id)a3
{
  objc_storeStrong((id *)&self->_colorLayer, a3);
}

- (CALayer)imageHighlightLayer
{
  return self->_imageHighlightLayer;
}

- (void)setImageHighlightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_imageHighlightLayer, a3);
}

- (CALayer)imageHighlightLayerContainer
{
  return self->_imageHighlightLayerContainer;
}

- (void)setImageHighlightLayerContainer:(id)a3
{
  objc_storeStrong((id *)&self->_imageHighlightLayerContainer, a3);
}

- (CALayer)imageHighlightLayerContainerShadow
{
  return self->_imageHighlightLayerContainerShadow;
}

- (void)setImageHighlightLayerContainerShadow:(id)a3
{
  objc_storeStrong((id *)&self->_imageHighlightLayerContainerShadow, a3);
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

- (VKCImageSubjectContext)subjectContext
{
  return self->_subjectContext;
}

- (UIImage)customImageForRemoveBackground
{
  return self->_customImageForRemoveBackground;
}

- (unint64_t)loadMaskRequestStatus
{
  return self->_loadMaskRequestStatus;
}

- (NSIndexSet)activeGlowLayerIndexSet
{
  return self->_activeGlowLayerIndexSet;
}

- (void)setActiveGlowLayerIndexSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (BOOL)usesLightDimmingViewInLightMode
{
  return self->_usesLightDimmingViewInLightMode;
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundQueue, a3);
}

- (CALayer)imageHighlightLayerMask
{
  return self->_imageHighlightLayerMask;
}

- (void)setImageHighlightLayerMask:(id)a3
{
  objc_storeStrong((id *)&self->_imageHighlightLayerMask, a3);
}

- (CAShapeLayer)intersectionMask
{
  return self->_intersectionMask;
}

- (void)setIntersectionMask:(id)a3
{
  objc_storeStrong((id *)&self->_intersectionMask, a3);
}

- (VKCImageSubjectGlowLayer)glowLayer
{
  return self->_glowLayer;
}

- (void)setGlowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_glowLayer, a3);
}

- (CAPackage)pulsePackage
{
  return self->_pulsePackage;
}

- (void)setPulsePackage:(id)a3
{
  objc_storeStrong((id *)&self->_pulsePackage, a3);
}

- (BOOL)subjectHighlightFeatureFlagEnabled
{
  return self->_subjectHighlightFeatureFlagEnabled;
}

- (void)setSubjectHighlightFeatureFlagEnabled:(BOOL)a3
{
  self->_subjectHighlightFeatureFlagEnabled = a3;
}

- (unint64_t)loadMaskIndex
{
  return self->_loadMaskIndex;
}

- (void)setLoadMaskIndex:(unint64_t)a3
{
  self->_loadMaskIndex = a3;
}

- (CIContext)maskLoadContext
{
  return (CIContext *)objc_getProperty(self, a2, 656, 1);
}

- (void)setMaskLoadContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (UIImage)_cachedSubject
{
  return (UIImage *)objc_getProperty(self, a2, 664, 1);
}

- (void)set_cachedSubject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 664);
}

- (NSIndexSet)_cachedSubjectIndexSet
{
  return (NSIndexSet *)objc_getProperty(self, a2, 672, 1);
}

- (void)set_cachedSubjectIndexSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (VKCRemoveBackgroundRequestHandler)removeBackgroundRequestHandler
{
  return self->_removeBackgroundRequestHandler;
}

- (void)setRemoveBackgroundRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_removeBackgroundRequestHandler, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_removeBackgroundRequestHandler, 0);
  objc_storeStrong((id *)&self->__cachedSubjectIndexSet, 0);
  objc_storeStrong((id *)&self->__cachedSubject, 0);
  objc_storeStrong((id *)&self->_maskLoadContext, 0);
  objc_storeStrong((id *)&self->_pulsePackage, 0);
  objc_storeStrong((id *)&self->_glowLayer, 0);
  objc_storeStrong((id *)&self->_intersectionMask, 0);
  objc_storeStrong((id *)&self->_imageHighlightLayerMask, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_activeGlowLayerIndexSet, 0);
  objc_storeStrong((id *)&self->_customImageForRemoveBackground, 0);
  objc_storeStrong((id *)&self->_subjectContext, 0);
  objc_storeStrong((id *)&self->_imageHighlightLayerContainerShadow, 0);
  objc_storeStrong((id *)&self->_imageHighlightLayerContainer, 0);
  objc_storeStrong((id *)&self->_imageHighlightLayer, 0);
  objc_storeStrong((id *)&self->_colorLayer, 0);
  objc_storeStrong((id *)&self->_burstPoint, 0);
  objc_destroyWeak((id *)&self->_baseSubjectDelegate);
}

- (void)configurePulseAnimationWithViewScale:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1D2E0D000, a1, a3, "Error configuring pulse animation, pulse package is missing", a5, a6, a7, a8, 0);
}

- (void)configurePulseAnimationWithViewScale:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1D2E0D000, a1, a3, "Error configuring pulse animation, parameters are missing", a5, a6, a7, a8, 0);
}

- (void)loadPulsePackage
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Error getting pulse animation package: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_82_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D2E0D000, v0, v1, "Error generating mask only remove background image: %@ - %@");
  OUTLINED_FUNCTION_2_0();
}

void __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_87_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D2E0D000, v0, v1, "Error generating full remove background image %@ - %@");
  OUTLINED_FUNCTION_2_0();
}

@end

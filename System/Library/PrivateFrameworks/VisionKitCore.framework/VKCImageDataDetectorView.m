@implementation VKCImageDataDetectorView

- (VKCImageDataDetectorView)initWithFrame:(CGRect)a3
{
  char *v3;
  id v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKCImageDataDetectorView;
  v3 = -[VKCImageBaseOverlayView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = (void *)*((_QWORD *)v3 + 70);
    *((_QWORD *)v3 + 70) = v4;

    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v3 + 568) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v3 + 584) = v7;
    *(_OWORD *)(v3 + 600) = v6;
    *(_OWORD *)(v3 + 616) = v7;
  }
  return (VKCImageDataDetectorView *)v3;
}

- (void)setRecognitionResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKCImageDataDetectorView;
  v4 = a3;
  -[VKCImageBaseOverlayView setRecognitionResult:](&v7, sel_setRecognitionResult_, v4);
  objc_msgSend(v4, "dataDetectors", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageDataDetectorView setAllElements:](self, "setAllElements:", v5);

  objc_msgSend(v4, "unfilteredDataDetectors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageDataDetectorView setUnfilteredElements:](self, "setUnfilteredElements:", v6);
  -[VKCImageDataDetectorView updateDisplayedElements](self, "updateDisplayedElements");
}

- (NSArray)displayedElementViews
{
  void *v2;
  void *v3;

  -[VKCImageDataDetectorView _displayedElementViews](self, "_displayedElementViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
  -[VKCImageDataDetectorView updateDisplayedElements](self, "updateDisplayedElements");
}

- (void)setContentsRect:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageDataDetectorView;
  -[VKCImageBaseOverlayView setContentsRect:](&v4, sel_setContentsRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageDataDetectorView updateAllElementViewFramesIfNecessary](self, "updateAllElementViewFramesIfNecessary");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCImageDataDetectorView;
  -[VKCImageDataDetectorView layoutSubviews](&v3, sel_layoutSubviews);
  -[VKCImageDataDetectorView updateAllElementViewFramesIfNecessary](self, "updateAllElementViewFramesIfNecessary");
}

- (void)didMoveToSuperview
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKCImageDataDetectorView;
  -[VKCImageDataDetectorView didMoveToSuperview](&v8, sel_didMoveToSuperview);
  -[VKCImageDataDetectorView superview](self, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[VKCImageDataDetectorView displayedElementViews](self, "displayedElementViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {

    }
    else
    {
      -[VKCImageDataDetectorView displayedElements](self, "displayedElements");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
        -[VKCImageDataDetectorView loadDataDetectorViewsFromDisplayedElements](self, "loadDataDetectorViewsFromDisplayedElements");
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageDataDetectorView;
  -[VKCImageDataDetectorView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageDataDetectorView updateAllElementViewFramesIfNecessary](self, "updateAllElementViewFramesIfNecessary");
}

- (void)setCustomAnalyticsIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCImageDataDetectorView;
  -[VKCImageBaseOverlayView setCustomAnalyticsIdentifier:](&v9, sel_setCustomAnalyticsIdentifier_, v4);
  -[VKCImageDataDetectorView _displayedElementViews](self, "_displayedElementViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__VKCImageDataDetectorView_setCustomAnalyticsIdentifier___block_invoke;
  v7[3] = &unk_1E9465290;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __57__VKCImageDataDetectorView_setCustomAnalyticsIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCustomAnalyticsIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)activateLongPressDataDetectorAtPoint:(CGPoint)a3 maxDistance:(double)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  y = a3.y;
  x = a3.x;
  -[VKCImageDataDetectorView closestElementToPoint:maxDistance:](self, "closestElementToPoint:maxDistance:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageDataDetectorView _displayedElementViews](self, "_displayedElementViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__VKCImageDataDetectorView_activateLongPressDataDetectorAtPoint_maxDistance___block_invoke;
  v13[3] = &unk_1E94652B8;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v9, "vk_objectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    VKMUIStringForPoint(x, y);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "elementView != ((void *)0)", "-[VKCImageDataDetectorView activateLongPressDataDetectorAtPoint:maxDistance:]", 0, 0, CFSTR("Attempting to activate a long press data detector but no elementView was found. point: %@ maxDistance: %f"), v12, *(_QWORD *)&a4);

  }
  objc_msgSend(v11, "manuallyActivateLongPressMenuInteraction");

}

BOOL __77__VKCImageDataDetectorView_activateLongPressDataDetectorAtPoint_maxDistance___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "dataDetectorElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)setAllowLongPressDDActivationOnly:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_allowLongPressDDActivationOnly != a3)
  {
    self->_allowLongPressDDActivationOnly = a3;
    -[VKCImageDataDetectorView _displayedElementViews](self, "_displayedElementViews");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__VKCImageDataDetectorView_setAllowLongPressDDActivationOnly___block_invoke;
    v5[3] = &__block_descriptor_33_e40_v24__0__VKCDataDetectorElementView_8_B16l;
    v6 = a3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  }
}

uint64_t __62__VKCImageDataDetectorView_setAllowLongPressDDActivationOnly___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAllowLongPressDDActivationOnly:", *(unsigned __int8 *)(a1 + 32));
}

- (void)updateDisplayedElements
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[VKCImageDataDetectorView allElements](self, "allElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VKCImageDataDetectorView_updateDisplayedElements__block_invoke;
  v5[3] = &unk_1E9465300;
  v5[4] = self;
  objc_msgSend(v3, "vk_objectsPassingTest:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageDataDetectorView setDisplayedElements:](self, "setDisplayedElements:", v4);

  -[VKCImageDataDetectorView loadDataDetectorViewsFromDisplayedElements](self, "loadDataDetectorViewsFromDisplayedElements");
}

uint64_t __51__VKCImageDataDetectorView_updateDisplayedElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
  v5 = objc_msgSend(v3, "dataDetectorTypes") & v4;
  if (v5 == objc_msgSend(v3, "dataDetectorTypes"))
    v6 = objc_msgSend(*(id *)(a1 + 32), "shouldFilterElementForSpecialCase:", v3) ^ 1;
  else
    v6 = 0;

  return v6;
}

- (BOOL)shouldFilterElementForSpecialCase:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  BOOL v30;

  v4 = a3;
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "dataDetectorTypes") == 4)
  {
    objc_msgSend(v5, "imageSize");
    v7 = v6;
    v8 = VKMRectWithSize();
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v4, "quad");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "boundingBox");
    VKMRectFromNormalizedSubrect(v8, v10, v12, v14, v16, v17, v18, v19);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v28, "vk_isRTL"))
      v7 = 0.0;

    VKMDistanceToRect(v7, 0.0, v21, v23, v25, v27);
    v30 = v29 < 120.0;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKCImageDataDetectorView;
  -[VKCImageDataDetectorView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  VKDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "ignoresHitTest"))
  {

    v4 = 0;
  }

  return v4;
}

- (void)loadDataDetectorViewsFromDisplayedElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  VKCImageDataDetectorView *v13;
  id v14;
  uint64_t v15;
  BOOL v16;

  -[VKCImageDataDetectorView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKCImageDataDetectorView _displayedElementViews](self, "_displayedElementViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    objc_msgSend(v4, "removeAllObjects");
    -[VKCImageDataDetectorView unfilteredElements](self, "unfilteredElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageDataDetectorView displayedElements](self, "displayedElements");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    v7 = -[VKCImageDataDetectorView allowLongPressDDActivationOnly](self, "allowLongPressDDActivationOnly");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__VKCImageDataDetectorView_loadDataDetectorViewsFromDisplayedElements__block_invoke;
    v11[3] = &unk_1E9465328;
    v12 = v5;
    v13 = self;
    v14 = v4;
    v15 = v6;
    v16 = v7;
    v8 = v4;
    v9 = v5;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
    -[VKCImageDataDetectorView updateAllElementViewFrames](self, "updateAllElementViewFrames");

  }
}

void __70__VKCImageDataDetectorView_loadDataDetectorViewsFromDisplayedElements__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(objc_class **)(a1 + 56);
  v4 = a2;
  v7 = (id)objc_msgSend([v3 alloc], "initWithDataDetectorElement:unfilteredElements:", v4, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "customAnalyticsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomAnalyticsIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 40), "analysisResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnalysisRequestID:", objc_msgSend(v6, "analysisRequestID"));

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
  objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setAllowLongPressDDActivationOnly:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v7);

}

- (void)updateAllElementViewFramesIfNecessary
{
  if (-[VKCImageDataDetectorView needsElementFrameUpdate](self, "needsElementFrameUpdate"))
    -[VKCImageDataDetectorView updateAllElementViewFrames](self, "updateAllElementViewFrames");
}

- (void)updateAllElementViewFrames
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[VKCImageDataDetectorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (VKMRectHasArea(v4, v6, v8, v10) && VKMRectHasArea(v12, v14, v16, v18))
  {
    -[VKCImageDataDetectorView setBoundsUsedToCalculateElementFrames:](self, "setBoundsUsedToCalculateElementFrames:", v4, v6, v8, v10);
    -[VKCImageDataDetectorView setContentsRectUsedToCalculateElementFrames:](self, "setContentsRectUsedToCalculateElementFrames:", v12, v14, v16, v18);
    -[VKCImageDataDetectorView _displayedElementViews](self, "_displayedElementViews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __54__VKCImageDataDetectorView_updateAllElementViewFrames__block_invoke;
    v23[3] = &unk_1E9465290;
    v23[4] = self;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v23);

  }
  else
  {
    v20 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      VKMUIStringForRect(v4, v6, v8, v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      VKMUIStringForRect(v12, v14, v16, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v21;
      v26 = 2112;
      v27 = v22;
      _os_log_error_impl(&dword_1D2E0D000, v20, OS_LOG_TYPE_ERROR, "Attempting to update all DD element frames, but the bounds or contentsRect are invalid. Bounds: %@, contentsRect: %@ , skipping", buf, 0x16u);

    }
  }
}

void __54__VKCImageDataDetectorView_updateAllElementViewFrames__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "dataDetectorElement");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameForDataDetectorElement:", v4);
  objc_msgSend(v3, "setFrame:");

}

- (BOOL)needsElementFrameUpdate
{
  VKCImageDataDetectorView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  BOOL v27;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;

  v2 = self;
  -[VKCImageDataDetectorView bounds](self, "bounds");
  v31 = v4;
  v32 = v3;
  v6 = v5;
  v8 = v7;
  -[VKCImageBaseOverlayView contentsRect](v2, "contentsRect");
  v35 = v10;
  v36 = v9;
  v33 = v12;
  v34 = v11;
  -[VKCImageDataDetectorView boundsUsedToCalculateElementFrames](v2, "boundsUsedToCalculateElementFrames");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[VKCImageDataDetectorView contentsRectUsedToCalculateElementFrames](v2, "contentsRectUsedToCalculateElementFrames");
  v22 = v21;
  v24 = v23;
  v29 = v26;
  v30 = v25;
  LOBYTE(v2) = VKMSizeIsEmptyOrHasNanOrInf(v6, v8);
  v27 = VKMNearlyEqualRects(v32, v31, v6, v8, v14, v16, v18, v20);
  return (v2 | v27 & VKMNearlyEqualRects(v36, v35, v34, v33, v22, v24, v30, v29)) ^ 1;
}

- (CGRect)frameForDataDetectorElement:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
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
  CGRect result;

  v4 = a3;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "quad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "quadByConvertingFromNormalizedRectToView:contentsRect:", self, v6, v8, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "boundingBox");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)viewSpaceQuadsForDataDetectorElement:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  VKCImageDataDetectorView *v13;
  void *v14;
  VKCImageDataDetectorView *v15;
  void *v16;
  _QWORD v18[4];
  VKCImageDataDetectorView *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = self;
  objc_msgSend(v4, "boundingQuads");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__VKCImageDataDetectorView_viewSpaceQuadsForDataDetectorElement___block_invoke;
  v18[3] = &unk_1E9465350;
  v19 = v13;
  v20 = v6;
  v21 = v8;
  v22 = v10;
  v23 = v12;
  v15 = v13;
  objc_msgSend(v14, "vk_compactMap:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __65__VKCImageDataDetectorView_viewSpaceQuadsForDataDetectorElement___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)closestElementToPoint:(CGPoint)a3 maxDistance:(double)a4
{
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v19[14];
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  y = a3.y;
  x = a3.x;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16;
  v25 = __Block_byref_object_dispose__16;
  v26 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0x7FF0000000000000;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[VKCImageDataDetectorView displayedElementViews](self, "displayedElementViews");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__VKCImageDataDetectorView_closestElementToPoint_maxDistance___block_invoke;
  v19[3] = &unk_1E9465378;
  *(double *)&v19[7] = a4;
  *(CGFloat *)&v19[8] = x;
  *(CGFloat *)&v19[9] = y;
  v19[10] = v9;
  v19[11] = v11;
  v19[12] = v13;
  v19[13] = v15;
  v19[4] = self;
  v19[5] = v20;
  v19[6] = &v21;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v19);

  v17 = (id)v22[5];
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);

  return v17;
}

void __62__VKCImageDataDetectorView_closestElementToPoint_maxDistance___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "frame");
  v30.origin.x = VKMRectFromAddingSize(v7, v8, v9, v10, *(double *)(a1 + 56));
  if (CGRectContainsPoint(v30, *(CGPoint *)(a1 + 64)))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v6, "dataDetectorElement", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "boundingQuads");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "quadByConvertingFromNormalizedRectToView:contentsRect:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "mininumDistanceToPoint:", *(double *)(a1 + 64), *(double *)(a1 + 72));
          v19 = v18;
          v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          if (v19 < v20)
          {
            objc_msgSend(v6, "dataDetectorElement");
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v23 = *(void **)(v22 + 40);
            *(_QWORD *)(v22 + 40) = v21;

            *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;
            v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          }
          if (v20 <= 0.0)
          {
            *a4 = 1;

            goto LABEL_14;
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (void)setHighlightSelectableItems:(BOOL)a3
{
  -[VKCImageDataDetectorView setHighlightSelectableItems:animated:](self, "setHighlightSelectableItems:animated:", a3, 1);
}

- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_highlightSelectableItems != a3)
    self->_highlightSelectableItems = a3;
}

- (BOOL)dataDetectorElementView:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  VKCImageDataDetectorView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v4 = self;
  objc_msgSend(a3, "convertPoint:toView:", self, a4.x, a4.y);
  v6 = v5;
  v8 = v7;
  -[VKCImageDataDetectorView delegate](v4, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v9, "dataDetectorView:dataDetectorInteractionShouldBeginAtPoint:", v4, v6, v8);

  return (char)v4;
}

- (void)willDisplayMenuForDataDetectorElementView:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "dataDetectorElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageBaseOverlayView analysisResult](self, "analysisResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 1024;
    v12 = objc_msgSend(v7, "analysisRequestID");
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Presenting menu for DD: %@ : id: %d", (uint8_t *)&v9, 0x12u);

  }
  -[VKCImageDataDetectorView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "willDisplayMenuForDataDetectorView:", self);

}

- (void)willDismissMenuForDataDetectorElementView:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "dataDetectorElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageBaseOverlayView analysisResult](self, "analysisResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 1024;
    v12 = objc_msgSend(v7, "analysisRequestID");
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing menu for DD: %@ : id: %d", (uint8_t *)&v9, 0x12u);

  }
  -[VKCImageDataDetectorView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "willDismissMenuForDataDetectorView:", self);

}

- (id)presentingViewControllerForInteractionWithDataDetectorElementView:(id)a3
{
  void *v4;
  void *v5;

  -[VKCImageDataDetectorView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "presentingViewControllerForInteractionWithDataDetectorView:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)previewForDataDetectorElementView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCImageDataDetectorView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewForDataDetectorElementView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewImageForDataDetectorElementView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCImageDataDetectorView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewImageForDataDetectorElementView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)previewImageBoundsForDataDetectorElementView:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[VKCImageDataDetectorView bounds](self, "bounds", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  VKMRectFromNormalizedSubrect(v5, v7, v9, v11, v12, v13, v14, v15);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)dataDetectorElementView:(id)a3 analyticsEventOccured:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VKCImageDataDetectorView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataDetectorView:analyticsEventOccured:", self, v5);

}

- (VKCImageDataDetectorViewDelegate)delegate
{
  return (VKCImageDataDetectorViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (NSArray)displayedElements
{
  return self->_displayedElements;
}

- (void)setDisplayedElements:(id)a3
{
  objc_storeStrong((id *)&self->_displayedElements, a3);
}

- (NSArray)unfilteredElements
{
  return self->_unfilteredElements;
}

- (void)setUnfilteredElements:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredElements, a3);
}

- (BOOL)highlightSelectableItems
{
  return self->_highlightSelectableItems;
}

- (BOOL)allowLongPressDDActivationOnly
{
  return self->_allowLongPressDDActivationOnly;
}

- (NSArray)allElements
{
  return self->_allElements;
}

- (void)setAllElements:(id)a3
{
  objc_storeStrong((id *)&self->_allElements, a3);
}

- (NSMutableSet)_displayedElementViews
{
  return self->__displayedElementViews;
}

- (void)set_displayedElementViews:(id)a3
{
  objc_storeStrong((id *)&self->__displayedElementViews, a3);
}

- (CGRect)boundsUsedToCalculateElementFrames
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundsUsedToCalculateElementFrames.origin.x;
  y = self->_boundsUsedToCalculateElementFrames.origin.y;
  width = self->_boundsUsedToCalculateElementFrames.size.width;
  height = self->_boundsUsedToCalculateElementFrames.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundsUsedToCalculateElementFrames:(CGRect)a3
{
  self->_boundsUsedToCalculateElementFrames = a3;
}

- (CGRect)contentsRectUsedToCalculateElementFrames
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRectUsedToCalculateElementFrames.origin.x;
  y = self->_contentsRectUsedToCalculateElementFrames.origin.y;
  width = self->_contentsRectUsedToCalculateElementFrames.size.width;
  height = self->_contentsRectUsedToCalculateElementFrames.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentsRectUsedToCalculateElementFrames:(CGRect)a3
{
  self->_contentsRectUsedToCalculateElementFrames = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayedElementViews, 0);
  objc_storeStrong((id *)&self->_allElements, 0);
  objc_storeStrong((id *)&self->_unfilteredElements, 0);
  objc_storeStrong((id *)&self->_displayedElements, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __61__VKCImageDataDetectorView_macOS_pathForDataDetectorElement___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "path");
}

id __56__VKCImageDataDetectorView_macOS_setupButtonForElement___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a2;
  if (a4 - 1 == a3)
    v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v4, "normalizedQuadFromView:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

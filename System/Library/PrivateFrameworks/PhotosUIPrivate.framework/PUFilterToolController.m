@implementation PUFilterToolController

- (PUFilterToolController)initWithCoder:(id)a3
{
  PUFilterToolController *v3;
  PUFilterToolController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUFilterToolController;
  v3 = -[PUFilterToolController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    commonInit_82856(v3);
  return v4;
}

- (PUFilterToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  PUFilterToolController *v4;
  PUFilterToolController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUFilterToolController;
  v4 = -[PUPhotoEditToolController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    commonInit_82856(v4);
  return v5;
}

- (void)_setupScrubber
{
  NSNumberFormatter *v3;
  NSNumberFormatter *formatter;
  id v5;
  CEKWheelScrubberView *v6;
  CEKWheelScrubberView *scrubberView;
  void *v8;

  v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
  formatter = self->_formatter;
  self->_formatter = v3;

  -[NSNumberFormatter setMultiplier:](self->_formatter, "setMultiplier:", &unk_1E59BC048);
  -[NSNumberFormatter setRoundingMode:](self->_formatter, "setRoundingMode:", 4);
  v5 = objc_alloc(MEMORY[0x1E0D0D0B0]);
  v6 = (CEKWheelScrubberView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  scrubberView = self->_scrubberView;
  self->_scrubberView = v6;

  -[CEKWheelScrubberView setTransparentGradients](self->_scrubberView, "setTransparentGradients");
  -[CEKWheelScrubberView setDelegate:](self->_scrubberView, "setDelegate:", self);
  -[CEKWheelScrubberView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrubberView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0D719A0], "standardSupportedEffects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKWheelScrubberView setItemCount:](self->_scrubberView, "setItemCount:", objc_msgSend(v8, "count"));

  -[CEKWheelScrubberView setDefaultIndex:](self->_scrubberView, "setDefaultIndex:", 0);
  -[CEKWheelScrubberView setSelectionDotCenterTopSpacing:](self->_scrubberView, "setSelectionDotCenterTopSpacing:", 9.0);
  -[CEKWheelScrubberView setCornerStyle:](self->_scrubberView, "setCornerStyle:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CEKWheelScrubberView setUseSelectionLoupeShadow:](self->_scrubberView, "setUseSelectionLoupeShadow:", 1);
  -[PUFilterToolController _updateScrubberLayout](self, "_updateScrubberLayout");
}

- (void)_setupFilters
{
  void *v3;
  void *v4;
  void *v5;
  CIContext *v6;
  CIContext *context;
  NSMutableDictionary *v8;
  NSMutableDictionary *filterThumbnailCache;
  NSMutableDictionary *v10;
  NSMutableDictionary *filterIntensityCache;
  id v12;
  CEKBadgeTextView *v13;
  CEKBadgeTextView *filterBadgeView;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_monitorAdjustmentsForCache = 1;
  v4 = (void *)MEMORY[0x1E0C9DD90];
  v21 = *MEMORY[0x1E0C9DF88];
  v22[0] = CFSTR("PUFilterToolController");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextWithOptions:", v5);
  v6 = (CIContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v6;

  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  filterThumbnailCache = self->_filterThumbnailCache;
  self->_filterThumbnailCache = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  filterIntensityCache = self->_filterIntensityCache;
  self->_filterIntensityCache = v10;

  v12 = objc_alloc(MEMORY[0x1E0D0D028]);
  v13 = (CEKBadgeTextView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  filterBadgeView = self->_filterBadgeView;
  self->_filterBadgeView = v13;

  objc_msgSend(v3, "photoEditingBadgeViewFillColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setFillColor:](self->_filterBadgeView, "_setFillColor:", v15);

  objc_msgSend(v3, "photoEditingBadgeViewContentColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setContentColor:](self->_filterBadgeView, "_setContentColor:", v16);

  -[CEKBadgeTextView _setFillCornerRadius:](self->_filterBadgeView, "_setFillCornerRadius:", 4.0);
  objc_msgSend(MEMORY[0x1E0D0D028], "_defaultTextInsets");
  -[CEKBadgeTextView _setTextInsets:](self->_filterBadgeView, "_setTextInsets:", v20 + 1.0, v17 + 3.0, v19 + 1.0, v18 + 3.0);
  -[CEKBadgeTextView setTranslatesAutoresizingMaskIntoConstraints:](self->_filterBadgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)_setupSlider
{
  CEKSlider *v3;
  CEKSlider *slider;

  +[PUPhotoEditSupport createEditSlider](PUPhotoEditSupport, "createEditSlider");
  v3 = (CEKSlider *)objc_claimAutoreleasedReturnValue();
  slider = self->_slider;
  self->_slider = v3;

  -[CEKSlider setDelegate:](self->_slider, "setDelegate:", self);
  -[CEKSlider setTranslatesAutoresizingMaskIntoConstraints:](self->_slider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CEKSlider setMinimumValue:](self->_slider, "setMinimumValue:", 0.0);
  -[CEKSlider setMaximumValue:](self->_slider, "setMaximumValue:", 1.0);
  -[CEKSlider setDefaultValue:](self->_slider, "setDefaultValue:", 1.0);
  self->_isSliderTouchDown = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CEKSlider setMarkedValue:](self->_slider, "setMarkedValue:", 0.5);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUFilterToolController;
  -[PUFilterToolController viewDidLoad](&v5, sel_viewDidLoad);
  -[PUFilterToolController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_filterBadgeView);
  -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", self->_slider);
  objc_msgSend(v4, "addSubview:", self->_scrubberView);

}

- (BOOL)wantsScrubberKeyControl
{
  return 1;
}

- (void)increaseScrubberValue:(BOOL)a3
{
  unint64_t v4;
  uint64_t v5;

  v4 = -[CEKWheelScrubberView itemCount](self->_scrubberView, "itemCount", a3) - 1;
  v5 = -[CEKWheelScrubberView selectedIndex](self->_scrubberView, "selectedIndex");
  if (v4 >= v5 + 1)
    v4 = v5 + 1;
  if (-[CEKWheelScrubberView selectedIndex](self->_scrubberView, "selectedIndex") != v4)
  {
    -[CEKWheelScrubberView setSelectedIndex:](self->_scrubberView, "setSelectedIndex:", v4);
    -[PUFilterToolController wheelScrubberViewDidChangeSelectedIndex:](self, "wheelScrubberViewDidChangeSelectedIndex:", self->_scrubberView);
  }
}

- (void)decreaseScrubberValue:(BOOL)a3
{
  if (-[CEKWheelScrubberView selectedIndex](self->_scrubberView, "selectedIndex", a3))
  {
    -[CEKWheelScrubberView setSelectedIndex:](self->_scrubberView, "setSelectedIndex:", -[CEKWheelScrubberView selectedIndex](self->_scrubberView, "selectedIndex") - 1);
    -[PUFilterToolController wheelScrubberViewDidChangeSelectedIndex:](self, "wheelScrubberViewDidChangeSelectedIndex:", self->_scrubberView);
  }
}

- (BOOL)wantsSliderKeyControl
{
  return 1;
}

- (void)increaseSliderValue:(BOOL)a3
{
  +[PUPhotoEditSupport changeValueOfSlider:reverse:coarse:](PUPhotoEditSupport, "changeValueOfSlider:reverse:coarse:", self->_slider, 1, a3);
  -[PUFilterToolController sliderDidScroll:](self, "sliderDidScroll:", self->_slider);
}

- (void)decreaseSliderValue:(BOOL)a3
{
  +[PUPhotoEditSupport changeValueOfSlider:reverse:coarse:](PUPhotoEditSupport, "changeValueOfSlider:reverse:coarse:", self->_slider, 0, a3);
  -[PUFilterToolController sliderDidScroll:](self, "sliderDidScroll:", self->_slider);
}

- (void)willBecomeActiveTool
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUFilterToolController;
  -[PUPhotoEditToolController willBecomeActiveTool](&v4, sel_willBecomeActiveTool);
  self->_monitorAdjustmentsForCache = 0;
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFilterToolController _updateWithCompositionController:](self, "_updateWithCompositionController:", v3);

}

- (void)didResignActiveTool
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFilterToolController;
  -[PUPhotoEditToolController didResignActiveTool](&v3, sel_didResignActiveTool);
  self->_monitorAdjustmentsForCache = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUFilterToolController;
  -[PUPhotoEditToolController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PUFilterToolController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConstraints");

  -[CEKSlider value](self->_slider, "value");
  -[CEKSlider setValue:](self->_slider, "setValue:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSMutableArray *filterBadgeViewConstraints;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUFilterToolController;
  -[PUPhotoEditToolController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_filterBadgeViewConstraints);
  filterBadgeViewConstraints = self->_filterBadgeViewConstraints;
  self->_filterBadgeViewConstraints = 0;

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PUFilterToolController;
  v7 = a4;
  -[PUPhotoEditToolController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PUFilterToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E58A7A08;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v15 = a3;
  if (self->_monitorAdjustmentsForCache)
    -[NSMutableDictionary removeAllObjects](self->_filterThumbnailCache, "removeAllObjects");
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustmentConstants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "nonVisualAdjustmentTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v15, "isSubsetOfSet:", v8);

  objc_msgSend(v5, "PIEffectAdjustmentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "containsObject:", v10) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v5, "PIEffect3DAdjustmentKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "containsObject:", v12);

  }
  if (((!-[PUPhotoEditToolController isActiveTool](self, "isActiveTool") | v9) & 1) == 0 && (v11 & 1) == 0)
  {
    -[NSMutableDictionary removeAllObjects](self->_filterThumbnailCache, "removeAllObjects");
LABEL_9:
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFilterToolController _updateWithCompositionController:](self, "_updateWithCompositionController:", v13);

    goto LABEL_15;
  }
  if (!self->_isScrubbing)
  {
    v14 = self->_isInteractingWithWheelScrubber ? 0 : v11;
    if (v14 == 1)
      goto LABEL_9;
  }
LABEL_15:

}

- (void)_updateWithCompositionController:(id)a3
{
  int64_t v4;
  int64_t v5;
  id v6;

  -[PUFilterToolController _prepareThumbnailImagesIfNeeded](self, "_prepareThumbnailImagesIfNeeded", a3);
  v4 = -[PUFilterToolController _adjustedFilterIndex](self, "_adjustedFilterIndex");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = v4;
  -[CEKWheelScrubberView setSelectedIndex:](self->_scrubberView, "setSelectedIndex:", v5);
  -[CEKWheelScrubberView setMarkedIndex:](self->_scrubberView, "setMarkedIndex:", -1);
  -[CEKWheelScrubberView setMarkedIndex:](self->_scrubberView, "setMarkedIndex:", v5);
  -[PUFilterToolController _adjustedFilterIntensity](self, "_adjustedFilterIntensity");
  -[CEKSlider setValue:](self->_slider, "setValue:");
  -[PUFilterToolController _updateFilterIntensityCache](self, "_updateFilterIntensityCache");
  -[PUFilterToolController _effectForIndex:](self, "_effectForIndex:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFilterToolController _updateBadgeAndSliderWithEffect:](self, "_updateBadgeAndSliderWithEffect:", v6);

}

- (void)_prepareThumbnailImagesIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  os_signpost_id_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  _QWORD v36[5];
  NSObject *v37;
  os_signpost_id_t v38;
  CMTime time2;
  CMTime time1;
  CMTime v41;

  -[PUPhotoEditToolController editSource](self, "editSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "enableEnterEditFilterThumbnailGeneration");

    if (v5)
    {
      v6 = -[NSMutableDictionary count](self->_filterThumbnailCache, "count");
      memset(&v41, 0, sizeof(v41));
      -[PUPhotoEditToolController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mediaView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "player");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        objc_msgSend(v9, "currentTime");
      else
        memset(&v41, 0, sizeof(v41));

      time2 = v41;
      -[PUPhotoEditToolController originalAssetTimeForDisplayedTime:](self, "originalAssetTimeForDisplayedTime:", &time2);
      v41 = time1;
      if (!v6 || (time1 = (CMTime)self->_thumbnailTime, time2 = v41, CMTimeCompare(&time1, &time2)))
      {
        self->_thumbnailTime = ($95D729B680665BEAEFA1D6FCA8238556)v41;
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scale");
        v13 = v12;

        PLPhotoEditGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_signpost_id_generate(v14);
        v16 = v14;
        v17 = v16;
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
        {
          LOWORD(time1.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1AAB61000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FilterThumbnailGeneration", ", (uint8_t *)&time1, 2u);
        }

        -[PUFilterToolController willLoadFilterThumbnails](self, "willLoadFilterThumbnails");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          (*(void (**)(uint64_t))(v18 + 16))(v18);
        v20 = v13 * 51.0;
        v21 = objc_alloc(MEMORY[0x1E0D71990]);
        -[PUPhotoEditToolController editSource](self, "editSource");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithEditSource:", v22);

        -[PUPhotoEditToolController compositionController](self, "compositionController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v24, "copy");

        objc_msgSend(MEMORY[0x1E0D719A0], "effectWithIdentifier:", *MEMORY[0x1E0D723B0]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUPhotoEditEffectsSupport updateCompositionController:withEffect:updateVersion:](PUPhotoEditEffectsSupport, "updateCompositionController:withEffect:updateVersion:", v25, v26, 0);
        objc_msgSend(v25, "depthAdjustmentController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "enabled"))
        {
          objc_msgSend(v25, "adjustmentConstants");
          v28 = v19;
          v29 = v15;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "PIDepthAdjustmentKey");
          v35 = v17;
          v31 = v23;
          v32 = v26;
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v29;
          v19 = v28;
          objc_msgSend(v25, "removeAdjustmentWithKey:", v33);

          v26 = v32;
          v23 = v31;
          v17 = v35;
        }
        objc_msgSend(v23, "setCompositionController:", v25, v35);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __57__PUFilterToolController__prepareThumbnailImagesIfNeeded__block_invoke;
        v36[3] = &unk_1E58A7A30;
        v36[4] = self;
        v37 = v17;
        v38 = v15;
        time1 = v41;
        v34 = v17;
        objc_msgSend(v23, "renderImageWithTargetSize:contentMode:renderMode:renderTime:name:completion:", 1, 0, &time1, CFSTR("PUFilterToolController-prepareThumbs"), v36, v20, v20);

      }
    }
  }

}

- (void)_updateCacheWithCIImage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(MEMORY[0x1E0D719A0], "standardSupportedEffects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      v16 = *MEMORY[0x1E0C9E1F8];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "filterIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = v4;
            v13 = (void *)objc_msgSend(v10, "newEffectFilter");
            v14 = v13;
            if (v13)
            {
              objc_msgSend(v13, "setValue:forKey:", v12, v16);
              objc_msgSend(v14, "outputImage");
              v15 = objc_claimAutoreleasedReturnValue();

              v12 = (id)v15;
            }
            -[NSMutableDictionary setObject:forKey:](self->_filterThumbnailCache, "setObject:forKey:", v12, v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    -[CEKWheelScrubberView updateItems](self->_scrubberView, "updateItems");
  }

}

- (void)_setThumbnail:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_filterThumbnailCache, "setObject:forKey:", a3, a4);
}

- (void)updateViewConstraints
{
  objc_super v3;

  -[PUFilterToolController _updateToolConstraints](self, "_updateToolConstraints");
  -[PUFilterToolController _updateBadgeConstraints](self, "_updateBadgeConstraints");
  v3.receiver = self;
  v3.super_class = (Class)PUFilterToolController;
  -[PUFilterToolController updateViewConstraints](&v3, sel_updateViewConstraints);
}

- (void)_updateToolConstraints
{
  NSMutableArray *v3;
  NSMutableArray *toolConstraints;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CEKSlider *slider;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSMutableArray *v38;
  CEKWheelScrubberView *scrubberView;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int64_t v79;
  BOOL v80;
  double v81;
  CEKSlider *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSMutableArray *v87;
  void *v88;
  void *v89;
  void *v90;
  NSMutableArray *v91;
  void *v92;
  NSMutableArray *v93;
  void *v94;
  void *v95;
  NSMutableArray *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int64_t v101;
  void *v102;
  NSMutableArray *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  NSMutableArray *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  CGAffineTransform v121;
  CGAffineTransform v122;
  _OWORD v123[3];
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[4];
  _QWORD v127[4];
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[7];
  _QWORD v131[5];
  _QWORD v132[5];

  v132[3] = *MEMORY[0x1E0C80C00];
  if (!self->_toolConstraints)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    toolConstraints = self->_toolConstraints;
    self->_toolConstraints = v3;

    v5 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentLayoutStyle");

    -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    slider = self->_slider;
    v120 = v8;
    if (slider)
    {
      if (v5 != 1 || v7 == 4)
      {
        v116 = v7;
        v46 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
        objc_msgSend(v8, "addLayoutGuide:", v46);
        v87 = self->_toolConstraints;
        -[CEKWheelScrubberView widthAnchor](self->_scrubberView, "widthAnchor");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "constraintEqualToConstant:", 75.0);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v130[0] = v102;
        objc_msgSend(v8, "heightAnchor");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKWheelScrubberView heightAnchor](self->_scrubberView, "heightAnchor");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "constraintEqualToAnchor:", v94);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v130[1] = v90;
        objc_msgSend(v8, "centerYAnchor");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKWheelScrubberView centerYAnchor](self->_scrubberView, "centerYAnchor");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "constraintEqualToAnchor:", v88);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v130[2] = v86;
        objc_msgSend(v8, "topAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKWheelScrubberView topAnchor](self->_scrubberView, "topAnchor");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "constraintEqualToAnchor:", v84);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v130[3] = v83;
        objc_msgSend(v46, "widthAnchor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "constraintEqualToConstant:", 66.0);
        v48 = v8;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v130[4] = v49;
        -[CEKWheelScrubberView heightAnchor](self->_scrubberView, "heightAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "heightAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "constraintEqualToAnchor:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v130[5] = v52;
        objc_msgSend(v48, "centerYAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v46;
        objc_msgSend(v46, "centerYAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "constraintEqualToAnchor:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v130[6] = v55;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 7);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v87, "addObjectsFromArray:", v56);

        v57 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
        v103 = self->_toolConstraints;
        if (v57 == 2 || v116 == 4)
        {
          objc_msgSend(v120, "leftAnchor");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[CEKWheelScrubberView leftAnchor](self->_scrubberView, "leftAnchor");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v69;
          objc_msgSend(v69, "constraintEqualToAnchor:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v129[0] = v60;
          objc_msgSend(v120, "rightAnchor");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "rightAnchor");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, 0.0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v129[1] = v63;
          -[CEKWheelScrubberView rightAnchor](self->_scrubberView, "rightAnchor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "leftAnchor");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 9.0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v129[2] = v66;
          v67 = v129;
        }
        else
        {
          objc_msgSend(v120, "rightAnchor");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[CEKWheelScrubberView rightAnchor](self->_scrubberView, "rightAnchor");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v58;
          objc_msgSend(v58, "constraintEqualToAnchor:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v128[0] = v60;
          objc_msgSend(v120, "leftAnchor");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "leftAnchor");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "constraintEqualToAnchor:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v128[1] = v63;
          -[CEKWheelScrubberView leftAnchor](self->_scrubberView, "leftAnchor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "rightAnchor");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "constraintEqualToAnchor:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v128[2] = v66;
          v67 = v128;
        }
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v103, "addObjectsFromArray:", v70);

        v91 = self->_toolConstraints;
        -[CEKSlider heightAnchor](self->_slider, "heightAnchor");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "widthAnchor");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "constraintEqualToAnchor:", v109);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v127[0] = v104;
        -[CEKSlider widthAnchor](self->_slider, "widthAnchor");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "heightAnchor");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "constraintEqualToAnchor:", v95);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v127[1] = v71;
        -[CEKSlider centerXAnchor](self->_slider, "centerXAnchor");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "centerXAnchor");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "constraintEqualToAnchor:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v127[2] = v74;
        -[CEKSlider centerYAnchor](self->_slider, "centerYAnchor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "centerYAnchor");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "constraintEqualToAnchor:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v127[3] = v77;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 4);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v91, "addObjectsFromArray:", v78);

        v79 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
        v80 = v116 == 4 || v79 == 2;
        v81 = 1.57079633;
        if (v80)
          v81 = -1.57079633;
        CGAffineTransformMakeRotation(&v122, v81);
        v82 = self->_slider;
        v121 = v122;
        -[CEKSlider setTransform:](v82, "setTransform:", &v121);
        v28 = v120;
      }
      else
      {
        v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v123[0] = *MEMORY[0x1E0C9BAA8];
        v123[1] = v10;
        v123[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        -[CEKSlider setTransform:](slider, "setTransform:", v123);
        v114 = self->_toolConstraints;
        -[CEKWheelScrubberView heightAnchor](self->_scrubberView, "heightAnchor");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "constraintEqualToConstant:", 75.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v132[0] = v11;
        objc_msgSend(v8, "widthAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKWheelScrubberView widthAnchor](self->_scrubberView, "widthAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintEqualToAnchor:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v132[1] = v14;
        objc_msgSend(v8, "centerXAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKWheelScrubberView centerXAnchor](self->_scrubberView, "centerXAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v132[2] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v114, "addObjectsFromArray:", v18);

        v96 = self->_toolConstraints;
        -[CEKSlider heightAnchor](self->_slider, "heightAnchor");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "constraintEqualToConstant:", 66.0);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v131[0] = v115;
        -[CEKWheelScrubberView widthAnchor](self->_scrubberView, "widthAnchor");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKSlider widthAnchor](self->_slider, "widthAnchor");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "constraintEqualToAnchor:", v105);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v131[1] = v100;
        objc_msgSend(v120, "centerXAnchor");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKSlider centerXAnchor](self->_slider, "centerXAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "constraintEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v131[2] = v20;
        objc_msgSend(v120, "bottomAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKSlider bottomAnchor](self->_slider, "bottomAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 0.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v131[3] = v23;
        -[CEKWheelScrubberView bottomAnchor](self->_scrubberView, "bottomAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKSlider topAnchor](self->_slider, "topAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 9.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v131[4] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v96, "addObjectsFromArray:", v27);

        v28 = v120;
      }
    }
    else
    {
      v93 = self->_toolConstraints;
      objc_msgSend(v8, "leftAnchor");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKWheelScrubberView leftAnchor](self->_scrubberView, "leftAnchor");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "constraintEqualToAnchor:", v113);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = v111;
      objc_msgSend(v8, "rightAnchor");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKWheelScrubberView rightAnchor](self->_scrubberView, "rightAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "constraintEqualToAnchor:", v97);
      v29 = v8;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v126[1] = v30;
      objc_msgSend(v8, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKWheelScrubberView topAnchor](self->_scrubberView, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v101 = v5;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v126[2] = v33;
      objc_msgSend(v29, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKWheelScrubberView bottomAnchor](self->_scrubberView, "bottomAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v126[3] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v93, "addObjectsFromArray:", v37);

      v38 = self->_toolConstraints;
      scrubberView = self->_scrubberView;
      if (v101 != 1 || v7 == 4)
      {
        -[CEKWheelScrubberView widthAnchor](scrubberView, "widthAnchor");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "constraintEqualToConstant:", 75.0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v124[0] = v40;
        v28 = v120;
        objc_msgSend(v120, "heightAnchor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKWheelScrubberView heightAnchor](self->_scrubberView, "heightAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "constraintEqualToAnchor:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v124[1] = v43;
        v44 = (void *)MEMORY[0x1E0C99D20];
        v45 = v124;
      }
      else
      {
        -[CEKWheelScrubberView heightAnchor](scrubberView, "heightAnchor");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "constraintEqualToConstant:", 75.0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v125[0] = v40;
        v28 = v120;
        objc_msgSend(v120, "widthAnchor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKWheelScrubberView widthAnchor](self->_scrubberView, "widthAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "constraintEqualToAnchor:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v125[1] = v43;
        v44 = (void *)MEMORY[0x1E0C99D20];
        v45 = v125;
      }
      objc_msgSend(v44, "arrayWithObjects:count:", v45, 2);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v38, "addObjectsFromArray:", v68);

    }
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_toolConstraints);

  }
}

- (void)_updateBadgeConstraints
{
  void *v3;
  double v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *filterBadgeWidthConstraint;
  void *v7;
  double v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *filterBadgeHeightConstraint;
  NSMutableArray *v11;
  NSMutableArray *filterBadgeViewConstraints;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  int64_t v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  if (!self->_filterBadgeWidthConstraint)
  {
    -[CEKBadgeTextView widthAnchor](self->_filterBadgeView, "widthAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView bounds](self->_filterBadgeView, "bounds");
    objc_msgSend(v3, "constraintEqualToConstant:", v4);
    v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    filterBadgeWidthConstraint = self->_filterBadgeWidthConstraint;
    self->_filterBadgeWidthConstraint = v5;

    -[NSLayoutConstraint setActive:](self->_filterBadgeWidthConstraint, "setActive:", 1);
  }
  if (!self->_filterBadgeHeightConstraint)
  {
    -[CEKBadgeTextView heightAnchor](self->_filterBadgeView, "heightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView bounds](self->_filterBadgeView, "bounds");
    objc_msgSend(v7, "constraintEqualToConstant:", v8);
    v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    filterBadgeHeightConstraint = self->_filterBadgeHeightConstraint;
    self->_filterBadgeHeightConstraint = v9;

    -[NSLayoutConstraint setActive:](self->_filterBadgeHeightConstraint, "setActive:", 1);
  }
  if (!self->_filterBadgeViewConstraints)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    filterBadgeViewConstraints = self->_filterBadgeViewConstraints;
    self->_filterBadgeViewConstraints = v11;

    -[PUPhotoEditToolController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toolControllerMainContainerView:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v14;
    if (v14)
    {
      v15 = v14;
    }
    else
    {
      -[PUFilterToolController view](self, "view");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "currentLayoutStyle");

    if (v18 == 4)
    {
      v32 = self->_filterBadgeViewConstraints;
      -[CEKBadgeTextView rightAnchor](self->_filterBadgeView, "rightAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKWheelScrubberView leftAnchor](self->_scrubberView, "leftAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v19;
      objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -6.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v21;
      -[CEKBadgeTextView centerYAnchor](self->_filterBadgeView, "centerYAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFilterToolController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "centerYAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v24);
      v25 = v16;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v26;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = v35;
    }
    else
    {
      v29 = -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation");
      v32 = self->_filterBadgeViewConstraints;
      -[CEKBadgeTextView bottomAnchor](self->_filterBadgeView, "bottomAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v30;
      if (v29 == 1)
      {
        -[PUPhotoEditToolController toolContainerView](self, "toolContainerView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "topAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "constraintEqualToAnchor:constant:", v21, -6.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v22;
        -[CEKBadgeTextView centerXAnchor](self->_filterBadgeView, "centerXAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "centerXAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintEqualToAnchor:", v24);
        v25 = v16;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v26;
        v27 = (void *)MEMORY[0x1E0C99D20];
        v28 = v37;
      }
      else
      {
        objc_msgSend(v16, "safeAreaLayoutGuide");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bottomAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "constraintEqualToAnchor:constant:", v21, -0.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v22;
        -[CEKBadgeTextView centerXAnchor](self->_filterBadgeView, "centerXAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "centerXAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintEqualToAnchor:", v24);
        v25 = v16;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v26;
        v27 = (void *)MEMORY[0x1E0C99D20];
        v28 = v36;
      }
    }
    objc_msgSend(v27, "arrayWithObjects:count:", v28, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v32, "addObjectsFromArray:", v31);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_filterBadgeViewConstraints);
  }
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  NSMutableArray *filterBadgeViewConstraints;
  NSMutableArray *toolConstraints;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUFilterToolController;
  -[PUPhotoEditToolController setLayoutOrientation:withTransitionCoordinator:](&v8, sel_setLayoutOrientation_withTransitionCoordinator_, a3, a4);
  if (self->_scrubberView)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_filterBadgeViewConstraints);
    filterBadgeViewConstraints = self->_filterBadgeViewConstraints;
    self->_filterBadgeViewConstraints = 0;

    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_toolConstraints);
    toolConstraints = self->_toolConstraints;
    self->_toolConstraints = 0;

    -[PUFilterToolController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsUpdateConstraints");

    -[PUFilterToolController _updateScrubberLayout](self, "_updateScrubberLayout");
    -[CEKWheelScrubberView updateItems](self->_scrubberView, "updateItems");
  }
}

- (void)_updateScrubberLayout
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;

  -[PUPhotoEditToolController photoEditSpec](self, "photoEditSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentLayoutStyle");

  v5 = v4 == 4 || -[PUPhotoEditToolController layoutOrientation](self, "layoutOrientation") != 1;
  -[CEKWheelScrubberView setLayoutDirection:](self->_scrubberView, "setLayoutDirection:", v5);
  -[CEKWheelScrubberView setLayoutOrder:](self->_scrubberView, "setLayoutOrder:", 0);
  -[CEKWheelScrubberView setDotPlacement:](self->_scrubberView, "setDotPlacement:", v5);
}

- (id)localizedName
{
  return PULocalizedString(CFSTR("PHOTOEDIT_FILTERS_TOOL_BUTTON"));
}

- (id)toolbarIconGlyphName
{
  return CFSTR("camera.filters");
}

- (id)selectedToolbarIconGlyphName
{
  return CFSTR("camera.filters");
}

- (BOOL)toolbarGlyphUsesHierarchicalColor
{
  return 1;
}

- (id)centerToolbarView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("PHOTOEDIT_FILTERS_TOP_LABEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "photoEditingTopToolbarToolLabelButtonColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setText:", v4);
  objc_msgSend(v6, "setTextColor:", v5);
  objc_msgSend(v2, "topToolbarToolLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  return v6;
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (int64_t)toolControllerTag
{
  return 1003;
}

- (int64_t)_adjustedFilterIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71660], "adjustmentConstants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PIPortraitAdjustmentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentControllerForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "enabled") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[PUFilterToolController _adjustedFilterName](self, "_adjustedFilterName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUFilterToolController _indexForFilterId:](self, "_indexForFilterId:", v8);

  }
  return v7;
}

- (id)_effectAdjustment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositionKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71660], "adjustmentConstants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PIEffect3DAdjustmentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  if (v6)
    objc_msgSend(v2, "effect3DAdjustmentController");
  else
    objc_msgSend(v2, "effectAdjustmentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_adjustedFilterName
{
  void *v2;
  void *v3;

  -[PUFilterToolController _effectAdjustment](self, "_effectAdjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)_adjustedFilterIntensity
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PUFilterToolController _effectAdjustment](self, "_effectAdjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "intensity");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (id)_effectForIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D719A0], "standardSupportedEffects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 < 1 || objc_msgSend(v4, "count") <= (unint64_t)a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (int64_t)_indexForFilterId:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)MEMORY[0x1E0D719A0];
  v4 = a3;
  objc_msgSend(v3, "standardSupportedEffects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D719A0], "effectWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "indexOfObject:", v6);
  return v7;
}

- (void)_updateBadgeAndSliderWithEffect:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x1E0D719A0];
  objc_msgSend(v15, "filterIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEffectNoneForIdentifier:", v5);

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0D719A0], "effectWithIdentifier:", *MEMORY[0x1E0D723B0]);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  -[PUFilterToolController _setShowSlider:animate:](self, "_setShowSlider:animate:", v6 ^ 1u, 1);
  objc_msgSend(v15, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uppercaseStringWithLocale:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CEKBadgeTextView _setText:](self->_filterBadgeView, "_setText:", v12);
  -[CEKBadgeTextView sizeToFit](self->_filterBadgeView, "sizeToFit");
  -[CEKBadgeTextView bounds](self->_filterBadgeView, "bounds");
  -[NSLayoutConstraint setConstant:](self->_filterBadgeWidthConstraint, "setConstant:", v13);
  -[CEKBadgeTextView bounds](self->_filterBadgeView, "bounds");
  -[NSLayoutConstraint setConstant:](self->_filterBadgeHeightConstraint, "setConstant:", v14);

}

- (void)_setShowSlider:(BOOL)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD aBlock[6];

  v4 = a4;
  v5 = a3;
  if (-[CEKSlider isHidden](self->_slider, "isHidden") == a3)
  {
    v7 = 0.0;
    if (v5)
      v7 = 1.0;
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PUFilterToolController__setShowSlider_animate___block_invoke;
    aBlock[3] = &unk_1E58AACF0;
    aBlock[4] = self;
    *(double *)&aBlock[5] = v7;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    v10 = v9;
    if (v4)
    {
      v11 = (void *)MEMORY[0x1E0DC3F10];
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __49__PUFilterToolController__setShowSlider_animate___block_invoke_2;
      v14[3] = &unk_1E58ABAC8;
      v15 = v9;
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __49__PUFilterToolController__setShowSlider_animate___block_invoke_3;
      v12[3] = &unk_1E58A7A58;
      v12[4] = self;
      v13 = v5;
      objc_msgSend(v11, "animateWithDuration:animations:completion:", v14, v12, 0.25);

    }
    else
    {
      v9[2](v9);
      -[CEKSlider setHidden:](self->_slider, "setHidden:", !v5);
    }

  }
}

- (void)_updateFilterIntensityCache
{
  void *v3;
  NSMutableDictionary *filterIntensityCache;
  void *v5;
  void *v6;
  id v7;

  if (self->_slider)
  {
    -[PUFilterToolController _effectForIndex:](self, "_effectForIndex:", -[CEKWheelScrubberView selectedIndex](self->_scrubberView, "selectedIndex"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filterIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      filterIntensityCache = self->_filterIntensityCache;
      v5 = (void *)MEMORY[0x1E0CB37E8];
      -[CEKSlider value](self->_slider, "value");
      objc_msgSend(v5, "numberWithDouble:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](filterIntensityCache, "setObject:forKey:", v6, v3);

    }
  }
}

- (void)wheelScrubberViewDidChangeSelectedIndex:(id)a3
{
  id v4;

  self->_isInteractingWithWheelScrubber = 1;
  -[PUFilterToolController _effectForIndex:](self, "_effectForIndex:", objc_msgSend(a3, "selectedIndex"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFilterToolController _updateCompositionControllerWithEffect:](self, "_updateCompositionControllerWithEffect:", v4);
  -[PUFilterToolController _updateBadgeAndSliderWithEffect:](self, "_updateBadgeAndSliderWithEffect:", v4);
  self->_isInteractingWithWheelScrubber = 0;

}

- (void)wheelScrubberView:(id)a3 updateCell:(id)a4 forItemAtIndex:(unint64_t)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CIContext *context;
  CGImage *v20;
  id v21;

  v21 = a4;
  -[PUFilterToolController _effectForIndex:](self, "_effectForIndex:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = (id)*MEMORY[0x1E0D723B0];
  -[NSMutableDictionary objectForKey:](self->_filterThumbnailCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v21, "itemView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[CEKWheelScrubberView layoutDirection](self->_scrubberView, "layoutDirection");
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0D719A0], "standardSupportedEffects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count") - 1;

      if (v14 != a5)
      {
LABEL_12:
        context = self->_context;
        objc_msgSend(v9, "extent");
        v20 = -[CIContext createCGImage:fromRect:](context, "createCGImage:fromRect:", v9);
        objc_msgSend(v11, "setContents:", v20);
        CGImageRelease(v20);

        goto LABEL_13;
      }
      objc_msgSend(v11, "setCornerRadius:", 5.0);
      v15 = v12 == 0;
      v16 = 12;
      v17 = 10;
    }
    else
    {
      objc_msgSend(v11, "setCornerRadius:", 5.0);
      v15 = v12 == 0;
      v16 = 3;
      v17 = 5;
    }
    if (v15)
      v18 = v17;
    else
      v18 = v16;
    objc_msgSend(v11, "setMaskedCorners:", v18);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)wheelScrubberViewWillBeginDragging:(id)a3
{
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 1);
}

- (void)wheelScrubberViewWillBeginScrolling:(id)a3
{
  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 1);
  self->_isScrubbing = 1;
  -[CEKSlider setEnabled:dimmed:animated:](self->_slider, "setEnabled:dimmed:animated:", 0, 1, 1);
  -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
}

- (void)wheelScrubberViewWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0, a5, a4.x, a4.y);
}

- (void)wheelScrubberViewDidEndScrolling:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 0);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0);
  self->_isScrubbing = 0;
  -[CEKSlider setEnabled:dimmed:animated:](self->_slider, "setEnabled:dimmed:animated:", 1, 0, 1);
  PULocalizedString(CFSTR("PHOTOEDIT_FILTER_ACTION_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v5);

  v7 = objc_msgSend(v4, "selectedIndex");
  -[PUFilterToolController _effectForIndex:](self, "_effectForIndex:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFilterToolController _updateCompositionControllerWithEffect:](self, "_updateCompositionControllerWithEffect:", v8);

}

- (void)_updateCompositionControllerWithEffect:(id)a3
{
  id v4;
  NSMutableDictionary *filterIntensityCache;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (v4)
  {
    filterIntensityCache = self->_filterIntensityCache;
    objc_msgSend(v4, "filterIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](filterIntensityCache, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "floatValue");
      v9 = v8;
    }
    else
    {
      v9 = 1.0;
    }
    if (-[CEKSlider isEnabled](self->_slider, "isEnabled"))
      -[CEKSlider setValue:](self->_slider, "setValue:", v9);

  }
  else
  {
    v9 = 1.0;
  }
  -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
  -[PUPhotoEditToolController compositionController](self, "compositionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditEffectsSupport updateCompositionController:withEffect:intensity:updateVersion:](PUPhotoEditEffectsSupport, "updateCompositionController:withEffect:intensity:updateVersion:", v10, v13, 1, v9);

  PULocalizedString(CFSTR("PHOTOEDIT_FILTER_ACTION_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v11);

}

- (void)_updateSelectionTextAnimate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  if (self->_isSliderTouchDown)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[CEKSlider value](self->_slider, "value");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](self->_formatter, "stringFromNumber:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKWheelScrubberView setSelectionText:animated:](self->_scrubberView, "setSelectionText:animated:", v6, v3);

  }
  else
  {
    -[CEKWheelScrubberView setSelectionText:animated:](self->_scrubberView, "setSelectionText:animated:", 0, a3);
  }
}

- (void)_sliderDidEndScrolling
{
  self->_isSliderTouchDown = 0;
  -[PUFilterToolController _updateFilterIntensityCache](self, "_updateFilterIntensityCache");
  -[PUFilterToolController _updateSelectionTextAnimate:](self, "_updateSelectionTextAnimate:", 1);
}

- (void)sliderWillBeginScrolling:(id)a3
{
  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 1);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 1);
  self->_isSliderTouchDown = 1;
  -[PUFilterToolController _updateSelectionTextAnimate:](self, "_updateSelectionTextAnimate:", 1);
  -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
}

- (void)sliderDidScroll:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[PUFilterToolController _effectForIndex:](self, "_effectForIndex:", -[CEKWheelScrubberView selectedIndex](self->_scrubberView, "selectedIndex", a3));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PUPhotoEditToolController willModifyAdjustment](self, "willModifyAdjustment");
    -[PUPhotoEditToolController compositionController](self, "compositionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKSlider value](self->_slider, "value");
    +[PUPhotoEditEffectsSupport updateCompositionController:withEffect:intensity:updateVersion:](PUPhotoEditEffectsSupport, "updateCompositionController:withEffect:intensity:updateVersion:", v4, v7, 1);

    PULocalizedString(CFSTR("PHOTOEDIT_FILTER_INTENSITY_ACTION_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v5);

  }
  -[PUFilterToolController _updateSelectionTextAnimate:](self, "_updateSelectionTextAnimate:", 1);

}

- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;

  x = a4.x;
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0, a5, a4.x, a4.y);
  if (x == 0.0)
    -[PUFilterToolController _sliderDidEndScrolling](self, "_sliderDidEndScrolling");
}

- (void)sliderDidEndScrolling:(id)a3
{
  id v4;
  id v5;

  -[PUPhotoEditToolController setActivelyAdjusting:](self, "setActivelyAdjusting:", 0);
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0);
  -[PUFilterToolController _sliderDidEndScrolling](self, "_sliderDidEndScrolling");
  PULocalizedString(CFSTR("PHOTOEDIT_FILTER_INTENSITY_ACTION_TITLE"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PUPhotoEditToolController didModifyAdjustmentWithLocalizedName:](self, "didModifyAdjustmentWithLocalizedName:", v5);

}

- (id)willLoadFilterThumbnails
{
  return self->_willLoadFilterThumbnails;
}

- (void)setWillLoadFilterThumbnails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1312);
}

- (id)didFinishLoadingFilterThumbnails
{
  return self->_didFinishLoadingFilterThumbnails;
}

- (void)setDidFinishLoadingFilterThumbnails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishLoadingFilterThumbnails, 0);
  objc_storeStrong(&self->_willLoadFilterThumbnails, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_filterBadgeHeightConstraint, 0);
  objc_storeStrong((id *)&self->_filterBadgeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_filterBadgeViewConstraints, 0);
  objc_storeStrong((id *)&self->_scrubberViewConstraints, 0);
  objc_storeStrong((id *)&self->_toolConstraints, 0);
  objc_storeStrong((id *)&self->_filterIntensityCache, 0);
  objc_storeStrong((id *)&self->_filterThumbnailCache, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_scrubberView, 0);
  objc_storeStrong((id *)&self->_filterBadgeView, 0);
}

uint64_t __49__PUFilterToolController__setShowSlider_animate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __49__PUFilterToolController__setShowSlider_animate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__PUFilterToolController__setShowSlider_animate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setHidden:", *(_BYTE *)(a1 + 40) == 0);
}

void __57__PUFilterToolController__prepareThumbnailImagesIfNeeded__block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PUFilterToolController__prepareThumbnailImagesIfNeeded__block_invoke_2;
  v8[3] = &unk_1E58AAA58;
  v4 = (void *)a1[5];
  v8[4] = a1[4];
  v9 = v3;
  v5 = v4;
  v6 = a1[6];
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __57__PUFilterToolController__prepareThumbnailImagesIfNeeded__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "_updateCacheWithCIImage:", *(_QWORD *)(a1 + 40));
  v2 = *(id *)(a1 + 48);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, v4, "FilterThumbnailGeneration", ", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "didFinishLoadingFilterThumbnails");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t))(v5 + 16))(v5);

}

uint64_t __77__PUFilterToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setSelectedIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "selectedIndex"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "value");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setValue:");
}

@end

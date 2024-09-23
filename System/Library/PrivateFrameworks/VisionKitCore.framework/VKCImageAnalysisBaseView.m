@implementation VKCImageAnalysisBaseView

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];

  -[VKCImageAnalysisBaseView keyPathsAffectingContentMode](self, "keyPathsAffectingContentMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__VKCImageAnalysisBaseView_dealloc__block_invoke;
  v9[3] = &unk_1E9464CB0;
  v9[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);

  WeakRetained = objc_loadWeakRetained((id *)&self->_layerForObservingContentsRect);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("contentsRect"), VKImageRecognitionContentModeContext);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6 = objc_loadWeakRetained((id *)&self->_scrollViewToObserve);
  objc_msgSend(v6, "_removeScrollViewScrollObserver:", self);

  if (-[VKCImageAnalysisBaseView isAnalysisVisible](self, "isAnalysisVisible")
    && (self->_activeInteractionTypes & 4) != 0)
  {
    +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didLeaveVisualSearchHints");

  }
  -[VKCImageAnalysisBaseView tearDownQuickActions](self, "tearDownQuickActions");
  -[VKCImageAnalysisBaseView deleteDisposableFiles](self, "deleteDisposableFiles");
  v8.receiver = self;
  v8.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageAnalysisBaseView dealloc](&v8, sel_dealloc);
}

void __35__VKCImageAnalysisBaseView_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 608);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), v4, VKImageRecognitionContentModeContext);

}

- (VKCImageAnalysisBaseView)init
{
  VKCImageAnalysisBaseView *v2;
  VKCImageAnalysisBaseView *v3;
  void *v4;
  VKCImageTextSelectionView_iOS *v5;
  uint64_t v6;
  VKCImageTranslationView *translationView;
  VKCImageTranslationView *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *debugImageView;
  void *v12;
  void *v13;
  double v14;
  id v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  VKCAnalysisDebugMenuProvider *v21;
  VKCAnalysisDebugMenuProvider *debugMenuProvider;
  void *v23;
  VKCAnalysisDebugMenuProvider *v24;
  VKCAnalysisDebugMenuProvider *v25;
  UILabel *v26;
  UILabel *textInfoView;
  void *v28;
  void *v29;
  NSObject *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *backgroundQueue;
  VKCRemoveBackgroundRequestHandler *v33;
  VKCRemoveBackgroundRequestHandler *removeBackgroundRequestHandler;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)VKCImageAnalysisBaseView;
  v2 = -[VKCImageAnalysisBaseView init](&v36, sel_init);
  v3 = v2;
  if (v2)
  {
    ++sIdentifierIndex;
    -[VKCImageAnalysisBaseView setIdentifierIndex:](v2, "setIdentifierIndex:");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_scrollViewWillChange_, *MEMORY[0x1E0CEBD80], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_scrollViewDidChange_, *MEMORY[0x1E0CEBD70], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_scrollViewWillChange_, *MEMORY[0x1E0CEBD78], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_scrollViewDidChange_, *MEMORY[0x1E0CEBD68], 0);
    -[VKCImageAnalysisBaseView setAccessibilityIgnoresInvertColors:](v3, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_applicationWillResignActive_, *MEMORY[0x1E0CEB358], 0);
    v3->_longPressDataDetectorsInTextMode = 1;
    v5 = objc_alloc_init(VKCImageTextSelectionView_iOS);
    objc_storeStrong((id *)&v3->_textSelectionView, v5);
    -[VKCImageTextSelectionView setTextSelectionDelegate:](v3->_textSelectionView, "setTextSelectionDelegate:", v3);
    -[VKCImageBaseOverlayView setBaseDelegate:](v3->_textSelectionView, "setBaseDelegate:", v3);
    v6 = objc_opt_new();
    translationView = v3->_translationView;
    v3->_translationView = (VKCImageTranslationView *)v6;

    -[VKCImageBaseOverlayView setBaseDelegate:](v3->_translationView, "setBaseDelegate:", v3);
    v8 = v3->_translationView;
    -[VKCImageAnalysisBaseView translateQuickAction](v3, "translateQuickAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageTranslationView setPresentationAnchorView:](v8, "setPresentationAnchorView:", v9);

    if (vk_isInternalBuild()
      && +[VKCInternalSettings debugMenuEnabled](VKCInternalSettings, "debugMenuEnabled"))
    {
      v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
      debugImageView = v3->_debugImageView;
      v3->_debugImageView = v10;

      objc_msgSend(MEMORY[0x1E0CEA638], "vk_symbolImageWithName:", CFSTR("eye.circle.fill"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v3->_debugImageView, "setImage:", v12);

      -[UIImageView layer](v3->_debugImageView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 0.5;
      objc_msgSend(v13, "setShadowOpacity:", v14);

      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = objc_msgSend(v15, "CGColor");
      -[UIImageView layer](v3->_debugImageView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setShadowColor:", v16);

      v18 = *MEMORY[0x1E0C9D820];
      v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      -[UIImageView layer](v3->_debugImageView, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setShadowOffset:", v18, v19);

      v21 = objc_alloc_init(VKCAnalysisDebugMenuProvider);
      debugMenuProvider = v3->_debugMenuProvider;
      v3->_debugMenuProvider = v21;

      -[UIImageView setVk_userInteractionEnabled:](v3->_debugImageView, "setVk_userInteractionEnabled:", 1);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_debugButtonDidTap_);
      -[UIImageView addGestureRecognizer:](v3->_debugImageView, "addGestureRecognizer:", v23);
      v24 = objc_alloc_init(VKCAnalysisDebugMenuProvider);
      v25 = v3->_debugMenuProvider;
      v3->_debugMenuProvider = v24;

      v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
      textInfoView = v3->_textInfoView;
      v3->_textInfoView = v26;

      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "vk_colorWith40PercentOpacity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setVk_backgroundColor:](v3->_textInfoView, "setVk_backgroundColor:", v29);

      -[UIImageView addSubview:](v3->_debugImageView, "addSubview:", v3->_textInfoView);
      -[VKCImageAnalysisBaseView addSubview:](v3, "addSubview:", v3->_debugImageView);

    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = dispatch_queue_create("VKBaseViewBackground", v30);
    backgroundQueue = v3->_backgroundQueue;
    v3->_backgroundQueue = (OS_dispatch_queue *)v31;

    -[VKCImageAnalysisBaseView setNormalizedVisibleRect:](v3, "setNormalizedVisibleRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    _os_feature_enabled_impl();
    v3->_subjectHighlightFeatureFlagEnabled = 1;
    v33 = objc_alloc_init(VKCRemoveBackgroundRequestHandler);
    removeBackgroundRequestHandler = v3->_removeBackgroundRequestHandler;
    v3->_removeBackgroundRequestHandler = v33;

  }
  return v3;
}

- (void)useInteractionOptions:(unint64_t)a3
{
  uint64_t v5;
  id v6;

  v5 = objc_opt_class();
  VKDynamicCast(v5, (uint64_t)self->_textSelectionView);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "useInteractionOptions:", a3);

}

- (void)applicationWillResignActive:(id)a3
{
  id v4;
  CGRect v5;

  -[VKCImageAnalysisBaseView frameWhenResigningActive](self, "frameWhenResigningActive", a3);
  if (CGRectIsNull(v5))
  {
    -[VKCImageAnalysisBaseView window](self, "window");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    -[VKCImageAnalysisBaseView setFrameWhenResigningActive:](self, "setFrameWhenResigningActive:");

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageAnalysisBaseView layoutSubviews](&v9, sel_layoutSubviews);
  -[VKCImageAnalysisBaseView frameWhenResigningActive](self, "frameWhenResigningActive");
  if (!CGRectIsNull(v10))
  {
    -[VKCImageAnalysisBaseView frameWhenResigningActive](self, "frameWhenResigningActive");
    v4 = v3;
    -[VKCImageAnalysisBaseView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;

    if (v4 != v7)
    {
      -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateSelectionRectsForWindowChange");

      -[VKCImageAnalysisBaseView setFrameWhenResigningActive:](self, "setFrameWhenResigningActive:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)VKImageRecognitionContentModeContext == a6)
  {
    -[VKCImageAnalysisBaseView updateCurrentDisplayedViewContentsRect](self, "updateCurrentDisplayedViewContentsRect", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VKCImageAnalysisBaseView;
    -[VKCImageAnalysisBaseView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSArray)keyPathsAffectingContentMode
{
  return (NSArray *)&unk_1E94954E8;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageAnalysisBaseView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[VKCImageAnalysisBaseView updateNormalizedVisibleRectIfNecessary](self, "updateNormalizedVisibleRectIfNecessary");
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageAnalysisBaseView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[VKCImageAnalysisBaseView updateNormalizedVisibleRectIfNecessary](self, "updateNormalizedVisibleRectIfNecessary");
}

- (void)setContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageBaseOverlayView setContentsRect:](&v15, sel_setContentsRect_);
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentsRect:", x, y, width, height);

  -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentsRect:", x, y, width, height);

  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentsRect:", x, y, width, height);

  -[VKCImageAnalysisBaseView translationView](self, "translationView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentsRect:", x, y, width, height);

  -[VKCImageAnalysisBaseView regexHighlightViewIfExists](self, "regexHighlightViewIfExists");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentsRect:", x, y, width, height);

  -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentsRect:", x, y, width, height);

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentsRect:", x, y, width, height);

}

- (void)setAnalysisResult:(id)a3
{
  VKCImageAnalysisResult *v5;
  id *p_analysisResult;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  _QWORD block[5];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  VKCImageAnalysisBaseView *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (VKCImageAnalysisResult *)a3;
  p_analysisResult = (id *)&self->_analysisResult;
  if (self->_analysisResult != v5)
  {
    objc_storeStrong((id *)&self->_analysisResult, a3);
    v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *p_analysisResult;
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = self;
      _os_log_impl(&dword_1D2E0D000, v7, OS_LOG_TYPE_DEFAULT, "Setting Analysis: %@, %@", buf, 0x16u);
    }

    -[VKCImageAnalysisBaseView clearRegexHighlightsAnimated:updateActiveTypes:](self, "clearRegexHighlightsAnimated:updateActiveTypes:", 0, 0);
    -[VKCImageAnalysisBaseView updateCurrentDisplayedViewContentsRect](self, "updateCurrentDisplayedViewContentsRect");
    v9 = *p_analysisResult;
    -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRecognitionResult:", v9);

    v11 = *p_analysisResult;
    -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRecognitionResult:", v11);

    objc_msgSend(*p_analysisResult, "visualSearchResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setVisualSearchResult:", v13);

    v15 = *p_analysisResult;
    -[VKCImageAnalysisBaseView translationView](self, "translationView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRecognitionResult:", v15);

    v17 = *p_analysisResult;
    -[VKCImageAnalysisBaseView regexHighlightViewIfExists](self, "regexHighlightViewIfExists");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRecognitionResult:", v17);

    v19 = *p_analysisResult;
    -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRecognitionResult:", v19);

    -[VKCImageAnalysisBaseView configureForActiveTypes:](self, "configureForActiveTypes:", -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes"));
    -[VKCImageAnalysisBaseView updateNormalizedVisibleRectIfNecessary](self, "updateNormalizedVisibleRectIfNecessary");
    -[VKCImageAnalysisBaseView sendAnalysisDidChangeAnalyticsEvent](self, "sendAnalysisDidChangeAnalyticsEvent");
    -[VKCImageAnalysisBaseView invalidateVisibleTextAreaInfo](self, "invalidateVisibleTextAreaInfo");
    -[VKCImageAnalysisBaseView tearDownQuickActions](self, "tearDownQuickActions");
    -[VKCImageAnalysisBaseView setQuickActions:](self, "setQuickActions:", MEMORY[0x1E0C9AA60]);
    if (*p_analysisResult)
      -[VKCImageAnalysisBaseView loadQuickActionsIfNecessary](self, "loadQuickActionsIfNecessary");
    -[VKCImageAnalysisBaseView backgroundQueue](self, "backgroundQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__VKCImageAnalysisBaseView_setAnalysisResult___block_invoke;
    block[3] = &unk_1E94625B8;
    block[4] = self;
    dispatch_async(v21, block);

    -[UIImageView setHidden:](self->_debugImageView, "setHidden:", 0);
  }

}

uint64_t __46__VKCImageAnalysisBaseView_setAnalysisResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteDisposableFiles");
}

- (void)analysisDidUpdateForTypes:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRecognitionResult:", v11);

    -[VKCImageAnalysisBaseView translationView](self, "translationView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRecognitionResult:", v11);

    -[VKCImageAnalysisBaseView regexHighlightViewIfExists](self, "regexHighlightViewIfExists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRecognitionResult:", v11);

    -[VKCImageAnalysisBaseView invalidateVisibleTextAreaInfo](self, "invalidateVisibleTextAreaInfo");
  }
  if ((v3 & 5) != 0)
  {
    -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRecognitionResult:", v11);

  }
  if ((v3 & 0x10) != 0)
  {
    objc_msgSend(v11, "visualSearchResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVisualSearchResult:", v9);

    goto LABEL_9;
  }
  if ((v3 & 0x15) != 0)
  {
LABEL_9:
    -[VKCImageAnalysisBaseView updateCurrentDisplayedViewContentsRect](self, "updateCurrentDisplayedViewContentsRect");
    -[VKCImageAnalysisBaseView configureForActiveTypes:](self, "configureForActiveTypes:", -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes"));
    -[VKCImageAnalysisBaseView updateNormalizedVisibleRectIfNecessary](self, "updateNormalizedVisibleRectIfNecessary");
    -[VKCImageAnalysisBaseView updateSubviewsToMatchBounds](self, "updateSubviewsToMatchBounds");
  }
  if (-[VKCImageAnalysisBaseView highlightSelectableItems](self, "highlightSelectableItems"))
  {
    -[VKCImageAnalysisBaseView setHighlightSelectableItems:animated:](self, "setHighlightSelectableItems:animated:", 0, 0);
    -[VKCImageAnalysisBaseView setHighlightSelectableItems:animated:](self, "setHighlightSelectableItems:animated:", 1, 1);
  }
  -[VKCImageAnalysisBaseView updateDebugButtonIfNecessary](self, "updateDebugButtonIfNecessary");

}

- (void)setActiveInteractionTypes:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  VKCImageAnalysisBaseView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_activeInteractionTypes != a3)
  {
    -[VKCImageAnalysisBaseView clearRegexHighlightsAnimated:updateActiveTypes:](self, "clearRegexHighlightsAnimated:updateActiveTypes:", 0, 0);
    v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      VKMUIStringForAnalysisInteractionTypes(a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Setting Active Interaction Types: %@, %@", (uint8_t *)&v7, 0x16u);

    }
    -[VKCImageAnalysisBaseView updateCurrentDisplayedViewContentsRect](self, "updateCurrentDisplayedViewContentsRect");
    -[VKCImageAnalysisBaseView updateNormalizedVisibleRect](self, "updateNormalizedVisibleRect");
    -[VKCImageAnalysisBaseView configureForActiveTypes:](self, "configureForActiveTypes:", a3);
    -[VKCImageAnalysisBaseView sendActiveInteractionTypesDidChangeAnalyticsEvent](self, "sendActiveInteractionTypesDidChangeAnalyticsEvent");
    -[VKCImageAnalysisBaseView invalidateVisibleTextAreaInfo](self, "invalidateVisibleTextAreaInfo");
    if (!a3)
      -[VKCImageAnalysisBaseView setIsShowingTranslation:](self, "setIsShowingTranslation:", 0);
    -[VKCImageAnalysisBaseView set_hasActiveTextSelection:](self, "set_hasActiveTextSelection:", -[VKCImageAnalysisBaseView hasActiveTextSelection](self, "hasActiveTextSelection"));
  }
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)selectedText
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSAttributedString)selectedAttributedText
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedAttributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (NSArray)selectedRanges
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedVKRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nsRangeArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSelectedRanges:(id)a3
{
  void *v4;
  id v5;

  +[VKTextRange rangeWithNSRanges:](VKTextRange, "rangeWithNSRanges:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedVKRange:", v5);

}

- (VKTextRange)selectedRange
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedVKRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VKTextRange *)v3;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  VKCImageAnalysisBaseView *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    VKMUIStringForDDTypes(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Setting DDTypes: %@, %@", (uint8_t *)&v8, 0x16u);

  }
  self->_dataDetectorTypes = a3;
  -[VKCImageDataDetectorView setDataDetectorTypes:](self->_dataDetectorView, "setDataDetectorTypes:", a3);
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateHighlightLayerContentIfVisible");

}

- (void)setHighlightSelectableItems:(BOOL)a3
{
  -[VKCImageAnalysisBaseView setHighlightSelectableItems:animated:](self, "setHighlightSelectableItems:animated:", a3, 1);
}

- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  VKCImageAnalysisBaseView *v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (-[VKCImageAnalysisBaseView highlightSelectableItems](self, "highlightSelectableItems") != a3)
  {
    v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      VKMUIStringForBool(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1D2E0D000, v7, OS_LOG_TYPE_DEFAULT, "Highlight selectable items enabled: %@, %@", (uint8_t *)&v15, 0x16u);

    }
    -[VKCImageAnalysisBaseView clearRegexHighlightsAnimated:updateActiveTypes:](self, "clearRegexHighlightsAnimated:updateActiveTypes:", 0, 0);
    -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHighlightSelectableItems:animated:", v5, v4);

    -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHighlightSelectableItems:animated:", v5, v4);

    -[VKCImageAnalysisBaseView quickActions](self, "quickActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
      -[VKCImageAnalysisBaseView sendQuickActionAnalyticsWithDidBecomeVisible:](self, "sendQuickActionAnalyticsWithDidBecomeVisible:", 1);
    -[VKCImageAnalysisBaseView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "highlightSelectableItemsDidChangeForBaseOverlayView:", self);

    if (!v5)
    {
      if (-[VKCImageAnalysisBaseView isShowingTranslation](self, "isShowingTranslation"))
      {
        -[VKCImageAnalysisBaseView setIsShowingTranslation:](self, "setIsShowingTranslation:", 0);
        -[VKCImageAnalysisBaseView translateQuickAction](self, "translateQuickAction");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSelected:", 0);

      }
    }
  }
}

- (BOOL)highlightSelectableItems
{
  void *v2;
  char v3;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "highlightSelectableItems");

  return v3;
}

- (VKCImageSubjectContext)subjectContext
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VKCImageSubjectContext *)v3;
}

- (BOOL)subjectHighlightActive
{
  void *v2;
  char v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "subjectHighlightActive");

  return v3;
}

- (BOOL)isSubjectHighlightAvailable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isSubjectAnalysisComplete
{
  void *v2;
  BOOL v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "loadMaskRequestStatus") == 2;

  return v3;
}

- (BOOL)subjectInteractionInProgress
{
  void *v2;
  char v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "subjectInteractionInProgress");

  return v3;
}

- (CGRect)subjectFrame
{
  void *v2;
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
  CGRect result;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subjectFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)subjectRequestStatus
{
  void *v2;
  unint64_t v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "loadMaskRequestStatus");

  return v3;
}

- (void)setIdentifierIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageBaseOverlayView setIdentifierIndex:](&v11, sel_setIdentifierIndex_);
  -[VKCImageAnalysisBaseView translationView](self, "translationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifierIndex:", a3);

  -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifierIndex:", a3);

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifierIndex:", a3);

  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifierIndex:", a3);

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifierIndex:", a3);

  -[VKCImageAnalysisBaseView regexHighlightView](self, "regexHighlightView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifierIndex:", a3);

}

- (void)setCustomImageForRemoveBackground:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomImageForRemoveBackground:", v4);

}

- (UIImage)customImageForRemoveBackground
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customImageForRemoveBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (BOOL)usesLightDimmingViewInLightMode
{
  void *v2;
  char v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesLightDimmingViewInLightMode");

  return v3;
}

- (void)setUsesLightDimmingViewInLightMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesLightDimmingViewInLightMode:", v3);

}

- (void)beginImageSubjectAnalysisIfNecessary
{
  id v2;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadSubjectMaskIfNecessary");

}

- (void)beginImageSubjectAnalysisWithDelayIfNecessary
{
  id v2;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginImageSubjectAnalysisWithDelayIfNecessary");

}

- (void)beginImageSubjectAnalysisIfNecessaryWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginImageSubjectAnalysisIfNecessaryWithCompletion:", v4);

}

- (void)loadImageSubjectIfAvailableWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadImageSubjectIfNecessaryWithCompletion:", v4);

}

- (void)loadImageSubjectWithIndexes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadImageSubjectWithIndexes:completion:", v7, v6);

}

- (id)imageSubjectPathWithIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageSubjectPathWithIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)generateSubjectImage
{
  return 0;
}

- (void)highlightSubjectAtIndexSet:(id)a3 showCallout:(BOOL)a4 showBurst:(BOOL)a5 burstPoint:(CGPoint)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  double y;
  double x;
  _BOOL8 v10;
  _BOOL8 v11;
  id v13;
  id v14;

  v7 = a7;
  y = a6.y;
  x = a6.x;
  v10 = a5;
  v11 = a4;
  v13 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", v13, v11, v10, v7, x, y);

}

- (void)set_photosInfoSingleTapSubjectModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTapToSelectModeEnabled:", v3);

  -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVisualSearchCornerViewDisabled:", v3);

  -[VKCImageAnalysisBaseView configureForCurrentActiveInteractionTypes](self, "configureForCurrentActiveInteractionTypes");
}

- (BOOL)_photosInfoSingleTapSubjectModeEnabled
{
  void *v2;
  char v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tapToSelectModeEnabled");

  return v3;
}

- (void)setSubjectViewUserInteractionDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubjectViewUserInteractionDisabled:", v3);

}

- (BOOL)subjectViewUserInteractionDisabled
{
  void *v2;
  char v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "subjectViewUserInteractionDisabled");

  return v3;
}

- (void)loadQuickActionsIfNecessary
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  VKCImageAnalysisBaseView *v7;
  id v8;
  id location;

  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(&location, self);
    -[VKCImageAnalysisBaseView translationView](self, "translationView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__VKCImageAnalysisBaseView_loadQuickActionsIfNecessary__block_invoke;
    v5[3] = &unk_1E9464D00;
    objc_copyWeak(&v8, &location);
    v6 = v3;
    v7 = self;
    objc_msgSend(v4, "checkForTranslationResultsWithCompletion:", v5);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __55__VKCImageAnalysisBaseView_loadQuickActionsIfNecessary__block_invoke(id *a1, int a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  id v24;
  int v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  char v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "analysisResult");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = a1[4];

    if (v7 == v8)
    {
      v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        VKMUIStringForBool(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = a1[5];
        *(_DWORD *)buf = 138412546;
        v35 = v10;
        v36 = 2112;
        v37 = v11;
        _os_log_impl(&dword_1D2E0D000, v9, OS_LOG_TYPE_DEFAULT, "Translation Check completed with result: %@, %@", buf, 0x16u);

      }
      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v6, "textSelectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v13, "vk_containsNonWhitespaceCharacters");

      v25 = objc_msgSend(v6, "analysisIsAllDataDetectors");
      v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        VKMUIStringForBool(v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = a1[5];
        *(_DWORD *)buf = 138412546;
        v35 = v15;
        v36 = 2112;
        v37 = v16;
        _os_log_impl(&dword_1D2E0D000, v14, OS_LOG_TYPE_DEFAULT, "Check for is analysis all data detectors completed with result: %@, %@", buf, 0x16u);

      }
      objc_msgSend(v6, "dataDetectorView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "displayedElements");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataDetectorView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "unfilteredElements");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "analysisResult");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "backgroundQueue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __55__VKCImageAnalysisBaseView_loadQuickActionsIfNecessary__block_invoke_74;
      v28[3] = &unk_1E9464CD8;
      objc_copyWeak(&v31, a1 + 6);
      v29 = a1[4];
      v22 = v24;
      v30 = v22;
      v32 = a2 & (v25 ^ 1);
      v33 = v23;
      +[VKCQuickActionsProcessor quickActionsFromElements:unfilteredElements:analysis:queue:completionHandler:](VKCQuickActionsProcessor, "quickActionsFromElements:unfilteredElements:analysis:queue:completionHandler:", v17, v19, v20, v21, v28);

      objc_destroyWeak(&v31);
    }
  }

}

void __55__VKCImageAnalysisBaseView_loadQuickActionsIfNecessary__block_invoke_74(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "analysisResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);

    if (v5 == v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v11);
      if (*(_BYTE *)(a1 + 56))
      {
        v7 = *(void **)(a1 + 40);
        objc_msgSend(v4, "translateQuickAction");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "insertObject:atIndex:", v8, 0);
      }
      else
      {
        if (!*(_BYTE *)(a1 + 57) || objc_msgSend(*(id *)(a1 + 40), "count"))
          goto LABEL_6;
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v4, "copyAllQuickAction");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v8);
      }

LABEL_6:
      v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
      objc_msgSend(v4, "setQuickActions:", v9);

      objc_msgSend(v4, "sendQuickActionAnalyticsWithDidBecomeVisible:", 0);
    }
  }

}

- (BOOL)analysisIsAllDataDetectors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v4, "length"));
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__VKCImageAnalysisBaseView_analysisIsAllDataDetectors__block_invoke;
  v18[3] = &unk_1E9464D28;
  v9 = v5;
  v19 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __54__VKCImageAnalysisBaseView_analysisIsAllDataDetectors__block_invoke_2;
  v14[3] = &unk_1E9464D50;
  v17 = &v20;
  v11 = v4;
  v15 = v11;
  v12 = v10;
  v16 = v12;
  objc_msgSend(v9, "enumerateRangesUsingBlock:", v14);
  LOBYTE(v7) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v7;
}

void __54__VKCImageAnalysisBaseView_analysisIsAllDataDetectors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v4 = objc_opt_class();
  VKDynamicCast(v4, (uint64_t)v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v9;
  if (v9)
  {
    v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(v9, "characterRange");
    objc_msgSend(v6, "removeIndexesInRange:", v7, v8);
    v5 = v9;
  }

}

uint64_t __54__VKCImageAnalysisBaseView_analysisIsAllDataDetectors__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v9;
  BOOL v11;

  result = objc_msgSend(*(id *)(a1 + 32), "rangeOfCharacterFromSet:", *(_QWORD *)(a1 + 40));
  v11 = result == a2 && v9 == a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;
  return result;
}

- (void)tearDownQuickActions
{
  id v2;

  -[VKCImageAnalysisBaseView quickActions](self, "quickActions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_28);

}

uint64_t __48__VKCImageAnalysisBaseView_tearDownQuickActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tearDown");
}

- (void)setQuickActions:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *quickActions;
  NSArray *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "setDelegate:", self);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  quickActions = self->_quickActions;
  self->_quickActions = v4;
  v10 = v4;

  -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setQuickActions:", v10);

}

- (void)setActionInfoCustomFont:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_actionInfoCustomFont, a3);
  -[VKCImageAnalysisBaseView quickActions](self, "quickActions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView setQuickActions:](self, "setQuickActions:", v4);

}

- (VKCActionInfoButton)copyAllQuickAction
{
  VKCActionInfoButton *copyAllQuickAction;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VKCActionInfoButton *v8;
  VKCActionInfoButton *v9;

  copyAllQuickAction = self->_copyAllQuickAction;
  if (!copyAllQuickAction)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "vk_symbolImageWithName:", CFSTR("doc.on.doc"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    VKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("VK_QUICK_ACTION_TITLE_COPY_ALL"), CFSTR("VK_QUICK_ACTION_TITLE_COPY_ALL"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCActionInfoButton buttonWithImage:text:](VKCActionInfoButton, "buttonWithImage:text:", v4, v6);
    v8 = (VKCActionInfoButton *)objc_claimAutoreleasedReturnValue();
    v9 = self->_copyAllQuickAction;
    self->_copyAllQuickAction = v8;

    -[VKCActionInfoButton setPreferredSymbolConfiguration:](self->_copyAllQuickAction, "setPreferredSymbolConfiguration:", v7);
    -[VKCActionInfoButton vk_addTarget:action:](self->_copyAllQuickAction, "vk_addTarget:action:", self, sel_copyButtonPressed_);

    copyAllQuickAction = self->_copyAllQuickAction;
  }
  return copyAllQuickAction;
}

- (VKCActionInfoButton)translateQuickAction
{
  VKCActionInfoButton *translateQuickAction;
  void *v4;
  void *v5;
  void *v6;
  VKCActionInfoButton *v7;
  VKCActionInfoButton *v8;

  translateQuickAction = self->_translateQuickAction;
  if (!translateQuickAction)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "vk_symbolImageWithName:", CFSTR("translate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    VKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("VK_QUICK_ACTION_TITLE_TRANSLATE"), CFSTR("VK_QUICK_ACTION_TITLE_TRANSLATE"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[VKCActionInfoButton buttonWithImage:text:](VKCActionInfoButton, "buttonWithImage:text:", v4, v6);
    v7 = (VKCActionInfoButton *)objc_claimAutoreleasedReturnValue();
    v8 = self->_translateQuickAction;
    self->_translateQuickAction = v7;

    -[VKCActionInfoButton setChangesSelectionAsPrimaryAction:](self->_translateQuickAction, "setChangesSelectionAsPrimaryAction:", 1);
    -[VKCActionInfoButton vk_addTarget:action:](self->_translateQuickAction, "vk_addTarget:action:", self, sel_translateButtonPressed_);

    translateQuickAction = self->_translateQuickAction;
  }
  return translateQuickAction;
}

- (void)setActionInfoView:(id)a3
{
  VKCActionInfoView **p_actionInfoView;
  id v6;
  void *v7;

  p_actionInfoView = &self->_actionInfoView;
  objc_storeStrong((id *)&self->_actionInfoView, a3);
  v6 = a3;
  -[VKCImageAnalysisBaseView bounds](self, "bounds");
  -[VKCActionInfoView setFrame:](*p_actionInfoView, "setFrame:");
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  -[VKCActionInfoView setContentsRect:](*p_actionInfoView, "setContentsRect:");
  -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
  -[VKCActionInfoView setNormalizedVisibleRect:](*p_actionInfoView, "setNormalizedVisibleRect:");
  -[VKCImageAnalysisBaseView quickActions](self, "quickActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCActionInfoView setQuickActions:](*p_actionInfoView, "setQuickActions:", v7);

  -[VKCImageAnalysisBaseView configureForCurrentActiveInteractionTypes](self, "configureForCurrentActiveInteractionTypes");
}

- (void)resetSelection
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_DEBUG, "Resetting Selection for baseView: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setWantsAutomaticContentsRectCalculation:(BOOL)a3
{
  if (self->_wantsAutomaticContentsRectCalculation != a3)
  {
    self->_wantsAutomaticContentsRectCalculation = a3;
    -[VKCImageAnalysisBaseView updateCurrentDisplayedViewContentsRect](self, "updateCurrentDisplayedViewContentsRect");
  }
}

- (void)translateButtonPressed:(id)a3
{
  id v4;
  int v5;
  VKAnalyticsQuickActionEvent *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  VKAnalyticsQuickActionEvent *v14;

  v4 = a3;
  -[VKCImageAnalysisBaseView setIsShowingTranslation:](self, "setIsShowingTranslation:", objc_msgSend(v4, "isSelected"));
  v5 = objc_msgSend(v4, "isSelected");

  if (v5)
  {
    v6 = [VKAnalyticsQuickActionEvent alloc];
    -[VKCImageAnalysisBaseView quickActions](self, "quickActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    -[VKCImageBaseOverlayView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[VKAnalyticsQuickActionEvent initWithQuickActionType:quickActionsCount:textLength:eventType:customIdentifier:](v6, "initWithQuickActionType:quickActionsCount:textLength:eventType:customIdentifier:", CFSTR("Translation"), v8, v11, 2, v12);

    -[VKCImageAnalysisBaseView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "baseOverlayView:analyticsEventDidOccur:", self, v14);

  }
}

- (void)copyButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  VKAnalyticsQuickActionEvent *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  VKAnalyticsQuickActionEvent *v13;
  void *v14;
  int v15;
  VKCImageAnalysisBaseView *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = self;
    _os_log_impl(&dword_1D2E0D000, v4, OS_LOG_TYPE_DEFAULT, "Copy All QuickAction activated: %@", (uint8_t *)&v15, 0xCu);
  }

  -[VKCImageAnalysisBaseView copyAllToClipboard](self, "copyAllToClipboard");
  -[VKCImageAnalysisBaseView setHighlightSelectableItems:](self, "setHighlightSelectableItems:", 0);
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseOverlayViewDidRequestButtonStateUpdate:", self);

  v6 = [VKAnalyticsQuickActionEvent alloc];
  -[VKCImageAnalysisBaseView quickActions](self, "quickActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  -[VKCImageBaseOverlayView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[VKAnalyticsQuickActionEvent initWithQuickActionType:quickActionsCount:textLength:eventType:customIdentifier:](v6, "initWithQuickActionType:quickActionsCount:textLength:eventType:customIdentifier:", CFSTR("CopyAll"), v8, v11, 2, v12);

  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "baseOverlayView:analyticsEventDidOccur:", self, v13);

}

- (void)copyAllToClipboard
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  v7 = v6;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "baseOverlayView:updateStringForCopy:", self, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "baseOverlayView:updateAttributedStringForCopy:", self, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v11);
  objc_msgSend(v14, "registerObject:visibility:", v13, 0);
  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItemProviders:", v16);

}

- (void)selectAll
{
  NSObject *v3;
  void *v4;
  int v5;
  VKCImageAnalysisBaseView *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Select All: %@", (uint8_t *)&v5, 0xCu);
  }

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectAll:", 0);

}

- (void)clearSelection
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  VKCImageAnalysisBaseView *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Clear Selection: %@", (uint8_t *)&v6, 0xCu);
  }

  +[VKTextRange emptyRange](VKTextRange, "emptyRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedVKRange:", v4);

}

- (void)setIsShowingTranslation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_isShowingTranslation != a3)
  {
    v3 = a3;
    self->_isShowingTranslation = a3;
    -[VKCImageAnalysisBaseView translationView](self, "translationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "showTranslationOverlay");
    else
      objc_msgSend(v5, "hideTranslationOverlay");

    -[VKCImageAnalysisBaseView configureForActiveTypes:](self, "configureForActiveTypes:", -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes"));
  }
}

- (void)checkForTranslationResultsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisBaseView translationView](self, "translationView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkForTranslationResultsWithCompletion:", v4);

}

- (void)test_activateTranslationOverlay
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[VKCImageAnalysisBaseView quickActions](self, "quickActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView translateQuickAction](self, "translateQuickAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
  {
    -[VKCImageAnalysisBaseView translateQuickAction](self, "translateQuickAction");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_vk_performAction");

  }
}

+ (id)keyPathsForValuesAffectingHasActiveTextSelection
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("activeInteractionTypes"), CFSTR("textSelectionView.selectedRange"), 0);
}

- (BOOL)hasActiveTextSelection
{
  BOOL v3;
  void *v4;
  void *v5;

  if ((-[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes") & 1) == 0)
    return 0;
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedVKRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "length") != 0;

  return v3;
}

- (void)set_hasActiveTextSelection:(BOOL)a3
{
  id v4;

  if (self->__hasActiveTextSelection != a3)
  {
    self->__hasActiveTextSelection = a3;
    -[VKCImageAnalysisBaseView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hasActiveTextSelectionDidChangeForBaseOverlayView:", self);

  }
}

- (VKVisibleTextAreaInfo)calculateVisibleTextAreaInfo
{
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 IsFinite;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  void *v28;
  void *v29;
  VKVisibleTextAreaInfo *result;
  _QWORD v31[13];
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;

  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x2020000000;
  v48 = 0x7FF0000000000000;
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v5 = +[VKCInternalSettings debugMenuEnabled](VKCInternalSettings, "debugMenuEnabled");
  -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "normalizedTextLineBoundingBoxes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __56__VKCImageAnalysisBaseView_calculateVisibleTextAreaInfo__block_invoke;
  v31[3] = &unk_1E9464D78;
  *(double *)&v31[9] = v7;
  *(double *)&v31[10] = v9;
  *(double *)&v31[11] = v11;
  *(double *)&v31[12] = v13;
  v32 = v5;
  v31[4] = &v49;
  v31[5] = &v45;
  v31[6] = &v41;
  v31[7] = &v37;
  v31[8] = &v33;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v31);
  retstr->dataDetectors = 0;
  *(_OWORD *)&retstr->boundingBoxArea = 0u;
  *(_OWORD *)&retstr->maxQuadHeight = 0u;
  -[UIView vk_windowLengthFromViewLength:](self, "vk_windowLengthFromViewLength:", 1.0);
  v17 = v16;
  -[VKCImageAnalysisBaseView visibleImageRect](self, "visibleImageRect");
  v19 = v18 / v11;
  IsFinite = VKMRectIsFinite(v7, v9, v11, v13);
  v21 = 0.0;
  v22 = 0.0;
  if (IsFinite)
    v22 = v50[3] / (v11 * v13);
  if (fabs(v22) == INFINITY)
    v22 = 0.0;
  v23 = v22;
  v24 = v17 * v19;
  retstr->boundingBoxArea = v23;
  v25 = v46[3];
  if (v25 == INFINITY)
    v26 = 0.0;
  else
    v26 = v17 * v19 * v25;
  retstr->maxQuadHeight = v24 * v42[3];
  retstr->minQuadHeight = v26;
  v27 = v34[3];
  if (v27)
    v21 = v24 * (v38[3] / (double)v27);
  retstr->averageQuadHeight = v21;
  -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "displayedElements");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->dataDetectors = objc_msgSend(v29, "count");

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  return result;
}

BOOL __56__VKCImageAnalysisBaseView_calculateVisibleTextAreaInfo__block_invoke(uint64_t a1, void *a2)
{
  double height;
  double width;
  double v5;
  _BOOL8 result;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  CGRect v11;
  CGRect v12;

  objc_msgSend(a2, "vk_rectValue");
  height = v11.size.height;
  v12 = CGRectIntersection(v11, *(CGRect *)(a1 + 72));
  width = v12.size.width;
  v5 = v12.size.height;
  result = VKMRectIsFinite(v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  if (result)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24)
                                                                + width * v5;
    if (*(_BYTE *)(a1 + 104))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(double *)(v7 + 24);
      if (v8 >= height)
        v8 = height;
      *(double *)(v7 + 24) = v8;
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(double *)(v9 + 24);
      if (v10 < height)
        v10 = height;
      *(double *)(v9 + 24) = v10;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = height
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 24);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }
  }
  return result;
}

- (void)invalidateVisibleTextAreaInfo
{
  -[VKCImageAnalysisBaseView setVisibleTextAreaInfoIsValid:](self, "setVisibleTextAreaInfoIsValid:", 0);
  -[VKCImageAnalysisBaseView updateAndNotifyAfterValidNormalizedVisibleRectChangeIfNecessary](self, "updateAndNotifyAfterValidNormalizedVisibleRectChangeIfNecessary");
}

- (double)totalQuadTextArea
{
  void *v2;
  double v3;
  double v4;

  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "totalQuadTextArea");
  v4 = v3;

  return v4;
}

- (double)totalBoundingBoxTextArea
{
  void *v2;
  double v3;
  double v4;

  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "totalBoundingBoxTextArea");
  v4 = v3;

  return v4;
}

- (NSArray)rawRectangleObservations
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rectangleObservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)filteredNormalizedRectangleQuads
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredNormalizedRectangleQuads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)filteredRectangleQuads
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[9];

  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKCImageAnalysisBaseView filteredNormalizedRectangleQuads](self, "filteredNormalizedRectangleQuads");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__VKCImageAnalysisBaseView_filteredRectangleQuads__block_invoke;
  v14[3] = &unk_1E9464DA0;
  v14[4] = self;
  v14[5] = v4;
  v14[6] = v6;
  v14[7] = v8;
  v14[8] = v10;
  objc_msgSend(v11, "vk_compactMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

uint64_t __50__VKCImageAnalysisBaseView_filteredRectangleQuads__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setViewForObservingContentMode:(id)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id obj;
  _QWORD v10[5];
  _QWORD v11[5];

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewForObservingContentMode);

  if (WeakRetained != obj)
  {
    -[VKCImageAnalysisBaseView keyPathsAffectingContentMode](self, "keyPathsAffectingContentMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__VKCImageAnalysisBaseView_setViewForObservingContentMode___block_invoke;
    v11[3] = &unk_1E9464CB0;
    v11[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
    objc_storeWeak((id *)&self->_viewForObservingContentMode, obj);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __59__VKCImageAnalysisBaseView_setViewForObservingContentMode___block_invoke_2;
    v10[3] = &unk_1E9464CB0;
    v10[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
    v7 = objc_loadWeakRetained((id *)&self->_viewForObservingContentMode);
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalysisBaseView setLayerForObservingContentsRect:](self, "setLayerForObservingContentsRect:", v8);

    -[VKCImageAnalysisBaseView updateCurrentDisplayedViewContentsRect](self, "updateCurrentDisplayedViewContentsRect");
  }

}

void __59__VKCImageAnalysisBaseView_setViewForObservingContentMode___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 608);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), v4, VKImageRecognitionContentModeContext);

}

void __59__VKCImageAnalysisBaseView_setViewForObservingContentMode___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 608);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), v4, 0, VKImageRecognitionContentModeContext);

}

- (void)setLayerForObservingContentsRect:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layerForObservingContentsRect);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_layerForObservingContentsRect);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("contentsRect"), VKImageRecognitionContentModeContext);

    v6 = objc_storeWeak((id *)&self->_layerForObservingContentsRect, obj);
    objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("contentsRect"), 0, VKImageRecognitionContentModeContext);

  }
}

- (void)setLongPressDataDetectorsInTextMode:(BOOL)a3
{
  self->_longPressDataDetectorsInTextMode = a3;
  -[VKCImageAnalysisBaseView configureForCurrentActiveInteractionTypes](self, "configureForCurrentActiveInteractionTypes");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageAnalysisBaseView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageAnalysisBaseView updateSubviewsToMatchBounds](self, "updateSubviewsToMatchBounds");
  -[VKCImageAnalysisBaseView updateNormalizedVisibleRectIfNecessary](self, "updateNormalizedVisibleRectIfNecessary");
  -[VKCImageAnalysisBaseView updateCurrentDisplayedViewContentsRect](self, "updateCurrentDisplayedViewContentsRect");
  -[VKCImageAnalysisBaseView invalidateVisibleTextAreaInfo](self, "invalidateVisibleTextAreaInfo");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageAnalysisBaseView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageAnalysisBaseView updateSubviewsToMatchBounds](self, "updateSubviewsToMatchBounds");
}

- (void)updateSubviewsToMatchBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VKCImageAnalysisBaseView *v18;
  id v19;

  -[VKCImageAnalysisBaseView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  -[VKCImageAnalysisBaseView translationView](self, "translationView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

  -[VKCImageAnalysisBaseView regexHighlightViewIfExists](self, "regexHighlightViewIfExists");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);

  -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "superview");
  v18 = (VKCImageAnalysisBaseView *)objc_claimAutoreleasedReturnValue();

  if (v18 == self)
  {
    -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v4, v6, v8, v10);

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  char v27;
  char v28;
  _BOOL4 v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  id v38;
  CGPoint v40;
  CGRect v41;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, self->_actionInfoView, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!-[VKCImageAnalysisBaseView subjectHighlightActive](self, "subjectHighlightActive"))
      goto LABEL_9;
    -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes") & 4) != 0)
    {
      -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, v9, x, y);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (void *)v10;
      else
        v12 = v8;
      v13 = v12;

      v8 = v13;
    }
    if (!v8)
    {
LABEL_9:
      -[VKCImageAnalysisBaseView translationView](self, "translationView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, v14, x, y);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, v15, x, y);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, v16, x, y);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
          {
            -[VKCImageAnalysisBaseView regexHighlightViewIfExists](self, "regexHighlightViewIfExists");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, v17, x, y);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v8)
            {
              -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v18, x, y);
              v20 = v19;
              v22 = v21;

              -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "hitTest:withEvent:", v7, v20, v22);
              v8 = (void *)objc_claimAutoreleasedReturnValue();

              v24 = -[VKCImageAnalysisBaseView containsTextAtPoint:](self, "containsTextAtPoint:", x, y);
              v25 = -[VKCImageAnalysisBaseView hasActiveTextSelection](self, "hasActiveTextSelection");
              v26 = -[VKCImageAnalysisBaseView longPressDataDetectorsInTextMode](self, "longPressDataDetectorsInTextMode")&& -[VKCImageAnalysisBaseView dataDetectorTypeAtPoint:](self, "dataDetectorTypeAtPoint:", x, y) != 0;
              v27 = -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes");
              if (!v24 && !v26)
              {
                v28 = v27;
                if ((!v25 || vk_isSeedBuild())
                  && (v28 & 8) != 0
                  && !-[VKCImageAnalysisBaseView subjectViewUserInteractionDisabled](self, "subjectViewUserInteractionDisabled"))
                {
                  if (-[VKCImageAnalysisBaseView isSubjectHighlightAvailable](self, "isSubjectHighlightAvailable"))
                    v29 = -[VKCImageAnalysisBaseView containsImageSubjectAtPoint:](self, "containsImageSubjectAtPoint:", x, y);
                  else
                    v29 = 0;
                  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "isLivePhoto");

                  if ((v31 & 1) != 0 || v29)
                  {
                    -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
                    v32 = objc_claimAutoreleasedReturnValue();

                    v8 = (void *)v32;
                  }
                  if (!v8)
                  {
                    if (vk_isSeedBuild() && objc_msgSend(v7, "buttonMask") == 2)
                    {
                      -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
                      v8 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v8 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v33, x, y);
    v35 = v34;
    v37 = v36;
    objc_msgSend(v33, "bounds");
    v40.x = v35;
    v40.y = v37;
    if (CGRectContainsPoint(v41, v40))
    {
      v38 = v33;

      v8 = v38;
    }
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4 usingSubviewsOf:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  if (!v10)
    goto LABEL_4;
  -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
  objc_msgSend(v10, "hitTest:withEvent:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v10)
  {

LABEL_4:
    v11 = 0;
  }

  return v11;
}

- (void)updateCurrentDisplayedViewContentsRect
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  VKCImageAnalysisBaseView *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  NSObject *v47;
  void *v48;
  int v49;
  VKCImageAnalysisBaseView *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKCImageAnalysisBaseView bounds](self, "bounds");
    if ((VKMSizeIsEmptyOrHasNanOrInf(v4, v5) & 1) == 0)
    {
      if (-[VKCImageAnalysisBaseView wantsAutomaticContentsRectCalculation](self, "wantsAutomaticContentsRectCalculation"))
      {
        -[VKCImageAnalysisBaseView viewForObservingContentMode](self, "viewForObservingContentMode");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          -[VKCImageAnalysisBaseView bounds](self, "bounds");
          v8 = v7;
          v10 = v9;
          v12 = v11;
          v14 = v13;
          v15 = objc_msgSend(v6, "contentMode");
          -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "imageSize");
          v18 = v17;
          v20 = v19;
          -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "request");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[VKCImageContentRectCalculator unitContentsRectForBounds:contentMode:imageSize:orientation:view:](VKCImageContentRectCalculator, "unitContentsRectForBounds:contentMode:imageSize:orientation:view:", v15, objc_msgSend(v22, "imageOrientation"), v6, v8, v10, v12, v14, v18, v20);
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;

        }
        else
        {
          v24 = 0.0;
          v26 = 0.0;
          v28 = 1.0;
          v30 = 1.0;
        }
        -[VKCImageAnalysisBaseView setContentsRect:](self, "setContentsRect:", v24, v26, v28, v30);

      }
      else
      {
        -[VKCImageAnalysisBaseView delegate](self, "delegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "topLevelImplementsContentsRectDelegateForBaseView:", self);

        if (v32)
        {
          -[VKCImageAnalysisBaseView delegate](self, "delegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "contentsRectForImageRecognitionBaseView:", self);
          v35 = v34;
          v37 = v36;
          v39 = v38;
          v41 = v40;

          v42 = self;
          v43 = v35;
          v44 = v37;
          v45 = v39;
          v46 = v41;
        }
        else
        {
          if (!-[VKCImageAnalysisBaseView didLogContentsRectError](self, "didLogContentsRectError"))
          {
            -[VKCImageAnalysisBaseView setDidLogContentsRectError:](self, "setDidLogContentsRectError:", 1);
            v47 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v49 = 138412290;
              v50 = self;
              _os_log_impl(&dword_1D2E0D000, v47, OS_LOG_TYPE_DEFAULT, "Interaction does not want automaticContentsRectCalculation, but did not implement contentsRectFor...... Falling back to Unit Rect: %@", (uint8_t *)&v49, 0xCu);
            }

          }
          v43 = 0.0;
          v44 = 0.0;
          v45 = 1.0;
          v46 = 1.0;
          v42 = self;
        }
        -[VKCImageAnalysisBaseView setContentsRect:](v42, "setContentsRect:", v43, v44, v45, v46);
      }
      -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "updateSelectionRectsForBoundsChange");

    }
  }
  -[VKCImageAnalysisBaseView updateDebugButtonIfNecessary](self, "updateDebugButtonIfNecessary");
}

- (void)_logVisualSearchHintAvailabilityUpdate
{
  char v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes");
  if (!-[VKCImageAnalysisBaseView isAnalysisVisible](self, "isAnalysisVisible") || (v3 & 4) == 0)
  {
    -[VKCImageAnalysisBaseView sendVisualSearchAnalyticsWithDidBecomeActive:](self, "sendVisualSearchAnalyticsWithDidBecomeActive:", 0);
    +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didLeaveVisualSearchHints");
LABEL_7:

    return;
  }
  -[VKCImageAnalysisBaseView sendVisualSearchAnalyticsWithDidBecomeActive:](self, "sendVisualSearchAnalyticsWithDidBecomeActive:", 1);
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "automaticallyShowVisualSearchResults");

  if ((v5 & 1) == 0)
  {
    +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didShowVisualSearchHintsForRequest:invocationType:", v7, 3);

    goto LABEL_7;
  }
}

- (void)_updateAnalysisVisibility
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  _BOOL8 v22;
  id v23;
  id v24;
  CGRect v25;
  CGRect v26;

  -[VKCImageAnalysisBaseView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      objc_msgSend(v3, "superview");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v23;
      v3 = v23;
    }
    while (v5);
  }
  else
  {
    v6 = v3;
  }
  v24 = v6;
  -[VKCImageAnalysisBaseView bounds](self, "bounds");
  v11 = VKMCenterOfRect(v7, v8, v9, v10);
  -[VKCImageAnalysisBaseView convertRect:toView:](self, "convertRect:toView:", v24, v11 + -20.0, v12 + -20.0, 40.0, 40.0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v24, "bounds");
  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  if (CGRectContainsRect(v25, v26))
  {
    -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 != 0;

    if (v22 == -[VKCImageAnalysisBaseView isAnalysisVisible](self, "isAnalysisVisible"))
      goto LABEL_12;
  }
  else
  {
    if (!-[VKCImageAnalysisBaseView isAnalysisVisible](self, "isAnalysisVisible"))
      goto LABEL_12;
    v22 = 0;
  }
  -[VKCImageAnalysisBaseView setIsAnalysisVisible:](self, "setIsAnalysisVisible:", v22);
  if ((self->_activeInteractionTypes & 4) != 0)
    -[VKCImageAnalysisBaseView _logVisualSearchHintAvailabilityUpdate](self, "_logVisualSearchHintAvailabilityUpdate");
LABEL_12:

}

- (CGRect)visibleImageRect
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
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGRect v31;
  CGRect v33;

  -[VKCImageAnalysisBaseView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  VKMRectFromNormalizedSubrect(v4, v6, v8, v10, v11, v12, v13, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
  VKMRectFromNormalizedSubrect(v16, v18, v20, v22, v23, v24, v25, v26);
  v33.origin.x = v27;
  v33.origin.y = v28;
  v33.size.width = v29;
  v33.size.height = v30;
  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  return CGRectIntersection(v31, v33);
}

- (void)updateNormalizedVisibleRectIfNecessary
{
  void *v2;
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  _BOOL4 clientDidSetNormalizedRect;
  void *v8;
  void *v9;

  v4 = -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes");
  v5 = -[VKCImageAnalysisBaseView stringHighlightsActive](self, "stringHighlightsActive");
  v6 = v5;
  clientDidSetNormalizedRect = self->_clientDidSetNormalizedRect;
  if (self->_clientDidSetNormalizedRect)
  {
    -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v8;
    if (!v8 || !((v4 >> 2) & 1 | v6) && (v4 & 1) == 0 && (v4 & 8) == 0)
    {

      goto LABEL_14;
    }
  }
  else if (!((v4 >> 2) & 1 | v5) && (v4 & 1) == 0 && (v4 & 8) == 0)
  {
    goto LABEL_14;
  }
  -[VKCImageAnalysisBaseView window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (clientDidSetNormalizedRect)
  if (v9)
  {
    -[VKCImageAnalysisBaseView updateNormalizedVisibleRect](self, "updateNormalizedVisibleRect");
    return;
  }
LABEL_14:
  -[VKCImageAnalysisBaseView _updateAnalysisVisibility](self, "_updateAnalysisVisibility");
}

- (void)updateNormalizedVisibleRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  char v11;
  void *v12;

  -[VKCImageAnalysisBaseView scrollViewToObserve](self, "scrollViewToObserve");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  if (!v3)
    goto LABEL_8;
  objc_msgSend(v3, "zoomScale");
  v5 = v4;
  objc_msgSend(v12, "minimumZoomScale");
  v7 = v6;
  objc_msgSend(v12, "maximumZoomScale");
  v8 = v12;
  if (v5 <= v9 && v5 >= v7)
  {
    if (v5 != v7 || (v11 = objc_msgSend(v12, "isZoomBouncing"), v8 = v12, (v11 & 1) == 0))
    {
LABEL_8:
      -[VKCImageAnalysisBaseView calculateNormalizedVisibleRect](self, "calculateNormalizedVisibleRect");
      -[VKCImageAnalysisBaseView setNormalizedVisibleRect:](self, "setNormalizedVisibleRect:");
      -[VKCImageAnalysisBaseView _updateAnalysisVisibility](self, "_updateAnalysisVisibility");
      v8 = v12;
    }
  }

}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (VKMRectIsFinite(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    if (!CGRectEqualToRect(v16, v17))
    {
      v15.receiver = self;
      v15.super_class = (Class)VKCImageAnalysisBaseView;
      -[VKCImageBaseOverlayView setNormalizedVisibleRect:](&v15, sel_setNormalizedVisibleRect_, x, y, width, height);
      -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNormalizedVisibleRect:", x, y, width, height);

      -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNormalizedVisibleRect:", x, y, width, height);

      -[VKCImageAnalysisBaseView regexHighlightViewIfExists](self, "regexHighlightViewIfExists");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNormalizedVisibleRect:", x, y, width, height);

      -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNormalizedVisibleRect:", x, y, width, height);

      -[VKCImageAnalysisBaseView translationView](self, "translationView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNormalizedVisibleRect:", x, y, width, height);

      -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNormalizedVisibleRect:", x, y, width, height);

      -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNormalizedVisibleRect:", x, y, width, height);

      -[VKCImageAnalysisBaseView setVisibleTextAreaInfoIsValid:](self, "setVisibleTextAreaInfoIsValid:", 0);
    }
  }
  -[VKCImageAnalysisBaseView updateAndNotifyAfterValidNormalizedVisibleRectChangeIfNecessary](self, "updateAndNotifyAfterValidNormalizedVisibleRectChangeIfNecessary");
}

- (void)updateAndNotifyAfterValidNormalizedVisibleRectChangeIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 HasArea;

  -[VKCImageAnalysisBaseView bounds](self, "bounds");
  if (VKMRectHasArea(v3, v4, v5, v6))
  {
    -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    HasArea = VKMRectHasArea(v8, v9, v10, v11);

    if (HasArea)
      -[VKCImageAnalysisBaseView updateAndNotifyAfterValidNormalizedVisibleRectChange](self, "updateAndNotifyAfterValidNormalizedVisibleRectChange");
  }
}

- (void)updateAndNotifyAfterValidNormalizedVisibleRectChange
{
  void *v3;
  void *v4;
  _OWORD v5[2];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  -[VKCImageAnalysisBaseView setVisibleTextAreaInfoIsValid:](self, "setVisibleTextAreaInfoIsValid:", 1);
  -[VKCImageAnalysisBaseView calculateVisibleTextAreaInfo](self, "calculateVisibleTextAreaInfo");
  v5[0] = v7;
  v5[1] = v8;
  v6 = v9;
  -[VKCImageAnalysisBaseView setVisibleTextAreaInfo:](self, "setVisibleTextAreaInfo:", v5);
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
  objc_msgSend(v3, "baseOverlayView:didUpdateToNormalizedVisibleRect:", self);

  -[VKCImageAnalysisBaseView updateDebugButtonIfNecessary](self, "updateDebugButtonIfNecessary");
  -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vk_setNeedsLayout");

}

- (void)updateDebugButtonIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 HasArea;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;

  -[VKCImageAnalysisBaseView visibleImageRect](self, "visibleImageRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v74 = (id)v11;
    -[VKCImageAnalysisBaseView window](self, "window");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_36:

      return;
    }
    v13 = (void *)v12;
    HasArea = VKMRectHasArea(v4, v6, v8, v10);

    if (HasArea)
    {
      -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
      else
        objc_msgSend(MEMORY[0x1E0CEA478], "orangeColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "vk_colorWith80PercentOpacity");
      v74 = (id)objc_claimAutoreleasedReturnValue();

      -[UIView vk_viewLengthFromWindowLength:](self, "vk_viewLengthFromWindowLength:", 1.0);
      v18 = v17;
      -[VKCImageAnalysisBaseView traitCollection](self, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "vk_hasCompactSize"))
        v20 = 22.0;
      else
        v20 = 30.0;

      -[UIView vk_viewLengthFromWindowLength:](self, "vk_viewLengthFromWindowLength:", v20);
      v22 = v21;
      VKMRectWithCenterAndSize(*MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v21);
      v24 = v23;
      v26 = v25;
      v27 = VKMAddPoints(v22 * 0.5, v22 * 0.5, v4);
      v29 = v28;
      -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setVk_contentTintColor:", v74);
      if (!VKMRectIsFinite(v27, v29, v24, v26))
        goto LABEL_35;
      v71 = v30;
      objc_msgSend(v30, "setFrame:", v27, v29, v24, v26);
      -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0CB37A0];
      -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "request");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "requestID");
      objc_msgSend(v31, "textDataDetectorElements");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");
      objc_msgSend(v31, "mrcDataDetectorElements");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");
      v73 = v31;
      objc_msgSend(v31, "visualSearchResult");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "resultItems");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("ID:%d DD:%lu MRC:%lu VS:%lu "), v34, v36, v38, objc_msgSend(v40, "count"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes");
      objc_msgSend(v41, "appendString:", CFSTR("["));
      if ((v42 & 1) != 0)
      {
        objc_msgSend(v41, "appendString:", CFSTR("T,"));
        if ((v42 & 2) == 0)
        {
LABEL_14:
          if ((v42 & 4) == 0)
            goto LABEL_15;
          goto LABEL_29;
        }
      }
      else if ((v42 & 2) == 0)
      {
        goto LABEL_14;
      }
      objc_msgSend(v41, "appendString:", CFSTR("DD,"));
      if ((v42 & 4) == 0)
      {
LABEL_15:
        if ((v42 & 8) == 0)
          goto LABEL_17;
        goto LABEL_16;
      }
LABEL_29:
      objc_msgSend(v41, "appendString:", CFSTR("VS,"));
      if ((v42 & 8) == 0)
      {
LABEL_17:
        if (objc_msgSend(v41, "characterAtIndex:", objc_msgSend(v41, "length") - 1))
          objc_msgSend(v41, "replaceCharactersInRange:withString:", objc_msgSend(v41, "length") - 1, 1, &stru_1E94661A8);
        objc_msgSend(v41, "appendString:", CFSTR("] "));
        -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "sourceDocument");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
          objc_msgSend(v41, "appendString:", CFSTR("🔤"));
        -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "mrcDataDetectorElements");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
          objc_msgSend(v41, "appendString:", CFSTR("🎛"));
        -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "visualSearchResult");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
          objc_msgSend(v41, "appendString:", CFSTR("🏞"));
        -[VKCImageAnalysisBaseView subjectContext](self, "subjectContext");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "subjectCount");

        if (v50)
        {
          v51 = CFSTR("😻");
          v30 = v71;
        }
        else
        {
          v30 = v71;
          if (!-[VKCImageAnalysisBaseView isSubjectAnalysisComplete](self, "isSubjectAnalysisComplete"))
          {
LABEL_34:
            -[VKCImageAnalysisBaseView textInfoView](self, "textInfoView");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setText:", v41);
            objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", v26 * 0.5);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setFont:", v53);

            objc_msgSend(v52, "sizeToFit");
            objc_msgSend(v52, "bounds");
            v55 = v54;
            objc_msgSend(v30, "bounds");
            v57 = v56;
            v60 = v58 + v59;
            VKMCenterOfRect(v58 + v59, v56, v59, v61);
            v63 = v57 + v62 - v55 * 0.5;
            objc_msgSend(v52, "frame");
            v65 = v64;
            v67 = v66;
            v68 = v66 / 3.0;
            objc_msgSend(v52, "layer");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setCornerRadius:", v68);

            objc_msgSend(v52, "setFrame:", v60, v63, v65, v67);
LABEL_35:
            objc_msgSend(v30, "layer");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "setShadowRadius:", v18 + v18);

            goto LABEL_36;
          }
          v51 = CFSTR("😿");
        }
        objc_msgSend(v41, "appendString:", v51);
        goto LABEL_34;
      }
LABEL_16:
      objc_msgSend(v41, "appendString:", CFSTR("S,"));
      goto LABEL_17;
    }
  }
}

- (void)debugButtonDidTap:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[VKCImageAnalysisBaseView debugMenuProvider](self, "debugMenuProvider", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "presentDebugMenuProvider:fromView:rect:", self, v4);

}

- (CGRect)calculateNormalizedVisibleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
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
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double x;
  double y;
  double width;
  double height;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  VKCImageAnalysisBaseView *v46;
  void *v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  VKCImageAnalysisBaseView *v61;
  void *v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  CGFloat v129;
  double v130;
  double v131;
  CGFloat v132;
  double v133;
  double v134;
  CGFloat v135;
  double v136;
  double v137;
  CGFloat v138;
  double v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect result;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;

  -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VKCImageAnalysisBaseView superview](self, "superview");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    do
    {
      v14 = objc_opt_class();
      VKDynamicCast(v14, (uint64_t)v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "zoomScale");
        if (v17 != 1.0
          && vabdd_f64(1.0, v17) >= fabs(v17 * 0.000000999999997)
          && objc_msgSend(v16, "contentInsetAdjustmentBehavior") == 2)
        {
          objc_msgSend(v11, "addObject:", v16);
        }
      }
      objc_msgSend(v13, "superview");
      v18 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v18;
    }
    while (v18);
  }
  v128 = v10;
  v131 = v8;
  v134 = v6;
  v137 = v4;
  -[VKCImageAnalysisBaseView superview](self, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView bounds](self, "bounds");
  -[VKCImageAnalysisBaseView convertRect:toView:](self, "convertRect:toView:", 0);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[VKCImageAnalysisBaseView window](self, "window");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "vk_safeAreaBounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v140.origin.x = v21;
  v140.origin.y = v23;
  v140.size.width = v25;
  v140.size.height = v27;
  v151.origin.x = v30;
  v151.origin.y = v32;
  v151.size.width = v34;
  v151.size.height = v36;
  v141 = CGRectIntersection(v140, v151);
  x = v141.origin.x;
  y = v141.origin.y;
  width = v141.size.width;
  height = v141.size.height;
  -[VKCImageAnalysisBaseView window](self, "window");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (VKMRectHasArea(x, y, width, height))
  {
    if (v19)
    {
      v42 = x;
      v43 = y;
      v44 = width;
      v45 = height;
      while (1)
      {
        objc_msgSend(v11, "lastObject");
        v46 = (VKCImageAnalysisBaseView *)objc_claimAutoreleasedReturnValue();

        if (v46 == self)
          objc_msgSend(v11, "removeLastObject");
        objc_msgSend(v11, "lastObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
          objc_msgSend(v19, "bounds");
        else
          objc_msgSend(v19, "vk_safeAreaBounds");
        objc_msgSend(v19, "convertRect:toView:", 0);
        v152.origin.x = v48;
        v152.origin.y = v49;
        v152.size.width = v50;
        v152.size.height = v51;
        v142.origin.x = x;
        v142.origin.y = y;
        v142.size.width = width;
        v142.size.height = height;
        v143 = CGRectIntersection(v142, v152);
        x = v143.origin.x;
        y = v143.origin.y;
        width = v143.size.width;
        height = v143.size.height;
        if (VKMRectHasInfComponents(v143.origin.x, v143.origin.y, v143.size.width, v143.size.height))
          break;
        objc_msgSend(v19, "superview");
        v52 = objc_claimAutoreleasedReturnValue();

        v144.origin.x = v42;
        v144.origin.y = v43;
        v144.size.width = v44;
        v144.size.height = v45;
        v153.origin.x = x;
        v153.origin.y = y;
        v153.size.width = width;
        v153.size.height = height;
        if (!CGRectEqualToRect(v144, v153))
        {
          v45 = height;
          v44 = width;
          v43 = y;
          v42 = x;
        }

        v19 = (void *)v52;
        if (!v52)
          goto LABEL_25;
      }

LABEL_25:
      v57 = x;
      v58 = y;
      v59 = width;
      v60 = height;
      height = v45;
      width = v44;
      y = v43;
      x = v42;
    }
    else
    {
      v57 = x;
      v58 = y;
      v59 = width;
      v60 = height;
    }
    v54 = v134;
    v53 = v137;
    v56 = v128;
    v55 = v131;
    v135 = v58;
    v138 = v57;
    v129 = v60;
    v132 = v59;
    if ((VKMRectHasInfComponents(v57, v58, v59, v60) & 1) == 0)
    {
      v61 = self;
      -[VKCImageAnalysisBaseView window](v61, "window");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "vk_safeAreaBounds");
      v154.origin.x = v63;
      v154.origin.y = v64;
      v154.size.width = v65;
      v154.size.height = v66;
      v145.origin.y = v135;
      v145.origin.x = v138;
      v145.size.height = v129;
      v145.size.width = v132;
      v146 = CGRectIntersection(v145, v154);
      v67 = v146.origin.x;
      v68 = v146.origin.y;
      v69 = v146.size.width;
      v70 = v146.size.height;

      if (v61)
      {
        v71 = v61;
        do
        {
          v72 = objc_opt_class();
          VKDynamicCast(v72, (uint64_t)v71);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v73;
          if (v73)
          {
            objc_msgSend(v73, "navigationController");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "toolbar");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            if (v76 && (objc_msgSend(v75, "isToolbarHidden") & 1) == 0)
            {
              objc_msgSend(v75, "toolbar");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "toolbar");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "bounds");
              objc_msgSend(v77, "convertRect:toView:", 0);
              v136 = v69;
              v139 = v70;
              v80 = v79;
              v82 = v81;
              v130 = v67;
              v133 = v68;
              v84 = v83;
              v86 = v85;

              v147.origin.x = v80;
              v147.origin.y = v82;
              v147.size.width = v84;
              v147.size.height = v86;
              CGRectGetMinY(v147);
              v67 = VKMClipRectToMaxY(v130, v133, v136, v139);
              v68 = v87;
              v69 = v88;
              v70 = v89;
            }
            objc_msgSend(v74, "navigationItem");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "navigationBar");
            v91 = (void *)objc_claimAutoreleasedReturnValue();

            if (v91 && (objc_msgSend(v91, "isHidden") & 1) == 0)
            {
              objc_msgSend(v91, "bounds");
              objc_msgSend(v91, "convertRect:toView:", 0);
              CGRectGetMaxY(v148);
              v67 = VKMClipRectToMinY(v67, v68, v69, v70);
              v68 = v92;
              v69 = v93;
              v70 = v94;
            }

          }
          objc_msgSend(v71, "nextResponder");
          v95 = objc_claimAutoreleasedReturnValue();

          v149.origin.x = x;
          v149.origin.y = y;
          v149.size.width = width;
          v149.size.height = height;
          v155.origin.x = v67;
          v155.origin.y = v68;
          v155.size.width = v69;
          v155.size.height = v70;
          if (!CGRectEqualToRect(v149, v155))
          {
            height = v70;
            width = v69;
            y = v68;
            x = v67;
          }

          v71 = (void *)v95;
        }
        while (v95);
      }
      -[VKCImageAnalysisBaseView convertRect:fromView:](v61, "convertRect:fromView:", 0, v67, v68, v69, v70);
      v97 = v96;
      v99 = v98;
      v101 = v100;
      v103 = v102;
      -[VKCImageAnalysisBaseView bounds](v61, "bounds");
      v105 = v104;
      v107 = v106;
      v109 = v108;
      v111 = v110;
      -[VKCImageBaseOverlayView contentsRect](v61, "contentsRect");
      VKMRectFromNormalizedSubrect(v105, v107, v109, v111, v112, v113, v114, v115);
      VKMNormalizedSubrectInRect(v97, v99, v101, v103, v116, v117, v118, v119);
      v53 = v120;
      v54 = v121;
      v55 = v122;
      v56 = v123;
    }

    v41 = 0;
  }
  else
  {
    v54 = v134;
    v53 = v137;
    v56 = v128;
    v55 = v131;
  }

  v124 = v53;
  v125 = v54;
  v126 = v55;
  v127 = v56;
  result.size.height = v127;
  result.size.width = v126;
  result.origin.y = v125;
  result.origin.x = v124;
  return result;
}

- (void)configureForCurrentActiveInteractionTypes
{
  -[VKCImageAnalysisBaseView configureForActiveTypes:](self, "configureForActiveTypes:", -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes"));
}

- (void)configureForActiveTypes:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  int isSeedBuild;
  uint64_t v16;
  int v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  int v21;
  _BOOL4 v22;
  unsigned int v23;
  int v24;
  unint64_t v25;
  _BOOL4 v26;
  int v27;
  _BOOL4 v28;
  _BOOL8 v29;
  unsigned int v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  int v34;
  VKCImageAnalysisBaseView *v35;
  VKCImageAnalysisBaseView *v36;
  int v37;
  VKCImageAnalysisBaseView *v38;
  VKCImageAnalysisBaseView *v39;
  VKCImageAnalysisBaseView *v40;
  VKCImageAnalysisBaseView *v41;
  char v42;
  VKCImageAnalysisBaseView *v43;
  VKCImageAnalysisBaseView *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  unint64_t v50;
  unint64_t activeInteractionTypes;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[6];

  activeInteractionTypes = self->_activeInteractionTypes;
  self->_activeInteractionTypes = a3;
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v60 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
  v5 = objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v6 = objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView translationView](self, "translationView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView regexHighlightViewIfExists](self, "regexHighlightViewIfExists");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
  v7 = objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v7;
  v54 = (void *)v5;
  if ((a3 & 1) != 0
    && (-[VKCImageAnalysisBaseView analysisResult](self, "analysisResult"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "text"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v8,
        v10))
  {
    v11 = !-[VKCImageAnalysisBaseView isShowingTranslation](self, "isShowingTranslation");
  }
  else
  {
    v11 = 0;
  }
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "glowLayerActive");

  v14 = -[VKCImageAnalysisBaseView isShowingTranslation](self, "isShowingTranslation");
  isSeedBuild = vk_isSeedBuild();
  v52 = (void *)v6;
  if (-[VKCImageAnalysisBaseView longPressDataDetectorsInTextMode](self, "longPressDataDetectorsInTextMode"))
    v16 = a3 & ((a3 & 2) == 0);
  else
    v16 = 0;
  v17 = (a3 >> 3) & 1 | isSeedBuild;
  v18 = -[VKCImageAnalysisBaseView stringHighlightsActive](self, "stringHighlightsActive");
  v19 = v18;
  if (!v59 && v18)
  {
    -[VKCImageAnalysisBaseView regexHighlightView](self, "regexHighlightView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = -[VKCImageAnalysisBaseView _photosInfoSingleTapSubjectModeEnabled](self, "_photosInfoSingleTapSubjectModeEnabled");
  v21 = (a3 & 4) == 0 || v20;
  if (!v17)
    v21 = 0;
  v22 = ((((a3 >> 1) & 1 | v16) ^ 1 | v19) & 1) == 0 && !self->_isShowingTranslation;
  v50 = a3;
  v23 = !v19 & (a3 >> 2);
  v24 = v20 | v21;
  LODWORD(v25) = v23 & v20;
  if (v13)
    v26 = 0;
  else
    v26 = v22;
  if (v13)
    v27 = 0;
  else
    v27 = v11;
  if (v13)
  {
    v28 = 0;
  }
  else
  {
    LODWORD(v25) = !v19 & (a3 >> 2);
    v28 = v14;
  }
  v49 = v24;
  if (v24 == 1)
    v29 = v26;
  else
    v29 = v22;
  if (v24 == 1)
    v30 = v27;
  else
    v30 = v11;
  if (v24 == 1)
    v25 = v25;
  else
    v25 = v23;
  v55 = v25;
  if (v24 == 1)
    v31 = v28;
  else
    v31 = v14;
  objc_msgSend(v54, "setAllowLongPressDDActivationOnly:", v16 & v29);
  objc_msgSend(v60, "setLongPressDataDetectorsInTextMode:", v16);
  -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "displayedElements");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "vk_containsObjectPassingTest:", &__block_literal_global_153);

  if ((v30 | v34) == 1)
  {
    objc_msgSend(v60, "superview");
    v35 = (VKCImageAnalysisBaseView *)objc_claimAutoreleasedReturnValue();

    if (v35 != self)
      -[VKCImageAnalysisBaseView addSubview:](self, "addSubview:", v60);
  }
  objc_msgSend(v52, "superview");
  v36 = (VKCImageAnalysisBaseView *)objc_claimAutoreleasedReturnValue();

  if (v36 != self)
    -[VKCImageAnalysisBaseView addSubview:](self, "addSubview:", v52);
  v37 = v19 & (v13 ^ 1);
  if (v29)
  {
    objc_msgSend(v54, "superview");
    v38 = (VKCImageAnalysisBaseView *)objc_claimAutoreleasedReturnValue();

    if (v38 != self)
      -[VKCImageAnalysisBaseView addSubview:](self, "addSubview:", v54);
  }
  if (v37)
  {
    objc_msgSend(v59, "superview");
    v39 = (VKCImageAnalysisBaseView *)objc_claimAutoreleasedReturnValue();

    if (v39 != self)
      -[VKCImageAnalysisBaseView addSubview:](self, "addSubview:", v59);
  }
  if (v56)
  {
    objc_msgSend(v56, "superview");
    v40 = (VKCImageAnalysisBaseView *)objc_claimAutoreleasedReturnValue();
    if (v40 == self)
    {

    }
    else
    {
      v41 = v40;
      v42 = objc_msgSend(v56, "automaticVisualRectLayoutDisabled");

      if ((v42 & 1) == 0)
        -[VKCImageAnalysisBaseView addSubview:](self, "addSubview:", v56);
    }
  }
  if (v31)
  {
    objc_msgSend(v58, "superview");
    v43 = (VKCImageAnalysisBaseView *)objc_claimAutoreleasedReturnValue();

    if (v43 != self)
      -[VKCImageAnalysisBaseView addSubview:](self, "addSubview:", v58);
  }
  objc_msgSend(v53, "superview");
  v44 = (VKCImageAnalysisBaseView *)objc_claimAutoreleasedReturnValue();

  if (v44 != self)
    -[VKCImageAnalysisBaseView addSubview:](self, "addSubview:", v53);
  objc_msgSend(v54, "setAllowLongPressDDActivationOnly:", v16);
  objc_msgSend(v60, "setLongPressDataDetectorsInTextMode:", v16);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
  objc_msgSend(v45, "vk_addNonNilObject:", v59);
  objc_msgSend(v45, "vk_addNonNilObject:", v60);
  objc_msgSend(v45, "vk_addNonNilObject:", v54);
  objc_msgSend(v45, "vk_addNonNilObject:", v53);
  objc_msgSend(v45, "vk_addNonNilObject:", v52);
  objc_msgSend(v45, "vk_addNonNilObject:", v58);
  if ((objc_msgSend(v56, "automaticVisualRectLayoutDisabled") & 1) == 0)
    objc_msgSend(v45, "vk_addNonNilObject:", v56);
  objc_msgSend(v45, "vk_addNonNilObject:", v57);
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __52__VKCImageAnalysisBaseView_configureForActiveTypes___block_invoke_2;
  v61[3] = &unk_1E9464DE8;
  v61[4] = self;
  objc_msgSend(v45, "enumerateObjectsUsingBlock:", v61);
  LODWORD(v46) = v49;
  if (-[VKCImageAnalysisBaseView isPublicAPI](self, "isPublicAPI"))
  {
    v55 = (-[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes") >> 2) & 1;
    v37 = 0;
    v46 = (-[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes") >> 3) & 1;
  }
  objc_msgSend(v60, "setHidden:", (v30 | v34) ^ 1);
  objc_msgSend(v54, "setHidden:", v29 ^ 1);
  objc_msgSend(v52, "setHidden:", v55 ^ 1);
  objc_msgSend(v58, "setHidden:", !v31);
  objc_msgSend(v59, "setHidden:", (v30 | v37) ^ 1);
  objc_msgSend(v57, "setHidden:", v50 == 0);
  v47 = v46 ^ 1;
  objc_msgSend(v53, "setHidden:", v47);
  objc_msgSend(v52, "setUserInteractionEnabled:", v55);
  objc_msgSend(v60, "setUserInteractionEnabled:", v30);
  objc_msgSend(v54, "setUserInteractionEnabled:", v29);
  objc_msgSend(v58, "setUserInteractionEnabled:", -[VKCImageAnalysisBaseView isShowingTranslation](self, "isShowingTranslation"));
  if ((v47 & 1) != 0)
    v48 = 0;
  else
    v48 = -[VKCImageAnalysisBaseView subjectViewUserInteractionDisabled](self, "subjectViewUserInteractionDisabled") ^ 1;
  objc_msgSend(v53, "setUserInteractionEnabled:", v48);
  if (((((activeInteractionTypes & 4) == 0) ^ v55) & 1) == 0
    && -[VKCImageAnalysisBaseView isAnalysisVisible](self, "isAnalysisVisible"))
  {
    -[VKCImageAnalysisBaseView _logVisualSearchHintAvailabilityUpdate](self, "_logVisualSearchHintAvailabilityUpdate");
  }

}

uint64_t __52__VKCImageAnalysisBaseView_configureForActiveTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMRCDataDetector");
}

uint64_t __52__VKCImageAnalysisBaseView_configureForActiveTypes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", a2);
}

- (void)clearTextSelectionViewIfNecessary
{
  VKCImageTextSelectionView *textSelectionView;

  -[VKCImageTextSelectionView removeFromSuperview](self->_textSelectionView, "removeFromSuperview");
  textSelectionView = self->_textSelectionView;
  self->_textSelectionView = 0;

}

- (void)clearDataDetectorViewIfNecessary
{
  VKCImageDataDetectorView *dataDetectorView;

  -[VKCImageDataDetectorView removeFromSuperview](self->_dataDetectorView, "removeFromSuperview");
  dataDetectorView = self->_dataDetectorView;
  self->_dataDetectorView = 0;

}

- (void)clearVisualSearchViewIfNecessary
{
  VKCImageVisualSearchView *visualSearchView;

  -[VKCImageVisualSearchView removeFromSuperview](self->_visualSearchView, "removeFromSuperview");
  visualSearchView = self->_visualSearchView;
  self->_visualSearchView = 0;

}

- (void)clearTranslationViewIfNecessary
{
  VKCImageTranslationView *translationView;

  -[VKCImageTranslationView removeFromSuperview](self->_translationView, "removeFromSuperview");
  translationView = self->_translationView;
  self->_translationView = 0;

}

- (BOOL)containsInteractiveItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  char v6;
  BOOL v7;
  void *v8;
  char v9;
  BOOL result;

  y = a3.y;
  x = a3.x;
  v6 = -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes");
  if ((v6 & 1) == 0)
    goto LABEL_6;
  if (-[VKCImageAnalysisBaseView containsTextAtPoint:](self, "containsTextAtPoint:", x, y))
    return 1;
  if (-[VKCImageAnalysisBaseView longPressDataDetectorsInTextMode](self, "longPressDataDetectorsInTextMode"))
  {
    v7 = -[VKCImageAnalysisBaseView dataDetectorTypeAtPoint:](self, "dataDetectorTypeAtPoint:", x, y) != 0;
    if ((v6 & 2) == 0)
      goto LABEL_9;
  }
  else
  {
LABEL_6:
    v7 = 0;
    if ((v6 & 2) == 0)
      goto LABEL_9;
  }
  if (!v7)
    v7 = -[VKCImageAnalysisBaseView dataDetectorTypeAtPoint:](self, "dataDetectorTypeAtPoint:", x, y) != 0;
LABEL_9:
  if ((v6 & 4) != 0 && !v7)
  {
    if (!-[VKCImageAnalysisBaseView containsVisualSearchItemAtPoint:](self, "containsVisualSearchItemAtPoint:", x, y))
      goto LABEL_12;
    return 1;
  }
  if (v7)
    return 1;
LABEL_12:
  -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHidden");

  if ((v9 & 1) != 0)
  {
    result = 0;
    if ((v6 & 8) == 0)
      return result;
  }
  else
  {
    result = -[VKCImageAnalysisBaseView containsActionInfoItemAtPoint:](self, "containsActionInfoItemAtPoint:", x, y);
    if ((v6 & 8) == 0)
      return result;
  }
  if (!result)
    return -[VKCImageAnalysisBaseView containsImageSubjectAtPoint:](self, "containsImageSubjectAtPoint:", x, y);
  return result;
}

- (BOOL)containsTextAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  return (-[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes") & 1) != 0
      && -[VKCImageAnalysisBaseView analysisContainsTextAtPoint:](self, "analysisContainsTextAtPoint:", x, y);
}

- (BOOL)containsActionInfoItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGPoint v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  v8 = v7;
  v10 = v9;

  -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsInteractableItemAtPoint:", v8, v10);

  if ((v12 & 1) != 0)
    return 1;
  -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    return 0;
  -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v15, x, y);
  v17 = v16;
  v19 = v18;

  -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v21.x = v17;
  v21.y = v19;
  LOBYTE(v15) = CGRectContainsPoint(v22, v21);

  return (char)v15;
}

- (BOOL)containsImageSubjectAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  v8 = v7;
  v10 = v9;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v11, "subjectExistsAtPoint:", v8, v10);

  return (char)v6;
}

- (BOOL)analysisContainsTextAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  v8 = v7;
  v10 = v9;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView currentExtraOffsetForViewScale](self, "currentExtraOffsetForViewScale");
  objc_msgSend(v11, "closestQuadForBlockOfType:toPoint:maxDistance:", 8, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13 != 0;
}

- (void)setActiveSubjectIndexSet:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveSubjectIndexSet:", v4);

}

- (NSIndexSet)activeSubjectIndexSet
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeSubjectIndexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v3;
}

- (NSIndexSet)allSubjectsIndexSet
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSubjectsIndexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v3;
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
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  v8 = v7;
  v10 = v9;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexOfSubjectAtPoint:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)currentExtraOffsetForViewScale
{
  void *v2;
  double v3;
  double v4;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCInternalSettings extraWindowPointTouchOffset](VKCInternalSettings, "extraWindowPointTouchOffset");
  objc_msgSend(v2, "vk_viewLengthFromWindowLength:");
  v4 = v3;

  return v4;
}

- (id)dataDetectorElementPoint:(CGPoint)a3 requestingView:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes");
  if ((v8 & 2) != 0
    || (v8 & 1) != 0
    && -[VKCImageAnalysisBaseView longPressDataDetectorsInTextMode](self, "longPressDataDetectorsInTextMode"))
  {
    -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertPoint:toView:", v9, x, y);
    v11 = v10;
    v13 = v12;

    -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalysisBaseView currentExtraOffsetForViewScale](self, "currentExtraOffsetForViewScale");
    objc_msgSend(v14, "closestElementToPoint:maxDistance:", v11, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)dataDetectorTypeAtPoint:(CGPoint)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[VKCImageAnalysisBaseView dataDetectorElementPoint:requestingView:](self, "dataDetectorElementPoint:requestingView:", self, a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "dataDetectorTypes");
  else
    v5 = 0;

  return v5;
}

- (BOOL)containsVisualSearchItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  if ((-[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes") & 4) == 0)
    return 0;
  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v12, "containsVisualSearchItemAtPoint:", v9, v11);

  return (char)v7;
}

- (VKCImageDataDetectorView)dataDetectorView
{
  VKCImageDataDetectorView *dataDetectorView;
  VKCImageDataDetectorView *v4;
  VKCImageDataDetectorView *v5;

  dataDetectorView = self->_dataDetectorView;
  if (!dataDetectorView)
  {
    v4 = objc_alloc_init(VKCImageDataDetectorView);
    v5 = self->_dataDetectorView;
    self->_dataDetectorView = v4;

    -[VKCImageDataDetectorView setAllowLongPressDDActivationOnly:](self->_dataDetectorView, "setAllowLongPressDDActivationOnly:", -[VKCImageAnalysisBaseView longPressDataDetectorsInTextMode](self, "longPressDataDetectorsInTextMode"));
    -[VKCImageDataDetectorView setDataDetectorTypes:](self->_dataDetectorView, "setDataDetectorTypes:", -[VKCImageAnalysisBaseView dataDetectorTypes](self, "dataDetectorTypes"));
    -[VKCImageDataDetectorView setDelegate:](self->_dataDetectorView, "setDelegate:", self);
    -[VKCImageBaseOverlayView setBaseDelegate:](self->_dataDetectorView, "setBaseDelegate:", self);
    -[VKCImageBaseOverlayView setIdentifierIndex:](self->_dataDetectorView, "setIdentifierIndex:", -[VKCImageBaseOverlayView identifierIndex](self, "identifierIndex"));
    dataDetectorView = self->_dataDetectorView;
  }
  return dataDetectorView;
}

- (VKCImageVisualSearchView)visualSearchView
{
  VKCImageVisualSearchView *visualSearchView;
  VKCImageVisualSearchView *v4;
  VKCImageVisualSearchView *v5;

  visualSearchView = self->_visualSearchView;
  if (!visualSearchView)
  {
    v4 = objc_alloc_init(VKCImageVisualSearchView);
    v5 = self->_visualSearchView;
    self->_visualSearchView = v4;

    -[VKCImageVisualSearchView setDelegate:](self->_visualSearchView, "setDelegate:", self);
    -[VKCImageBaseOverlayView setBaseDelegate:](self->_visualSearchView, "setBaseDelegate:", self);
    -[VKCImageBaseOverlayView setIdentifierIndex:](self->_visualSearchView, "setIdentifierIndex:", -[VKCImageBaseOverlayView identifierIndex](self, "identifierIndex"));
    visualSearchView = self->_visualSearchView;
  }
  return visualSearchView;
}

- (VKCImageCustomHighlightView)regexHighlightView
{
  VKCImageCustomHighlightView *regexHighlightView;
  VKCImageCustomHighlightView *v4;
  VKCImageCustomHighlightView *v5;
  void *v6;

  regexHighlightView = self->_regexHighlightView;
  if (!regexHighlightView)
  {
    v4 = -[VKCImageCustomHighlightView initWithDelegate:]([VKCImageCustomHighlightView alloc], "initWithDelegate:", self);
    v5 = self->_regexHighlightView;
    self->_regexHighlightView = v4;

    -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageBaseOverlayView setRecognitionResult:](self->_regexHighlightView, "setRecognitionResult:", v6);

    -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
    -[VKCImageBaseOverlayView setNormalizedVisibleRect:](self->_regexHighlightView, "setNormalizedVisibleRect:");
    -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
    -[VKCImageBaseOverlayView setContentsRect:](self->_regexHighlightView, "setContentsRect:");
    -[VKCImageAnalysisBaseView bounds](self, "bounds");
    -[VKCImageCustomHighlightView setFrame:](self->_regexHighlightView, "setFrame:");
    -[VKCImageBaseOverlayView setBaseDelegate:](self->_regexHighlightView, "setBaseDelegate:", self);
    -[VKCImageBaseOverlayView setIdentifierIndex:](self->_regexHighlightView, "setIdentifierIndex:", -[VKCImageBaseOverlayView identifierIndex](self, "identifierIndex"));
    regexHighlightView = self->_regexHighlightView;
  }
  return regexHighlightView;
}

- (VKCImageCustomHighlightView)regexHighlightViewIfExists
{
  return self->_regexHighlightView;
}

- (VKCImageSubjectHighlightView)subjectHighlightView
{
  VKCImageSubjectHighlightView *v3;
  VKCImageSubjectHighlightView *subjectHighlightView;
  void *v5;

  if (!self->_subjectHighlightView
    && -[VKCImageAnalysisBaseView subjectHighlightFeatureFlagEnabled](self, "subjectHighlightFeatureFlagEnabled"))
  {
    v3 = objc_alloc_init(VKCImageSubjectHighlightView);
    subjectHighlightView = self->_subjectHighlightView;
    self->_subjectHighlightView = v3;

    -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
    -[VKCImageSubjectBaseView setContentsRect:](self->_subjectHighlightView, "setContentsRect:");
    -[VKCImageAnalysisBaseView bounds](self, "bounds");
    -[VKCImageSubjectHighlightView setFrame:](self->_subjectHighlightView, "setFrame:");
    -[VKCImageSubjectHighlightView setDelegate:](self->_subjectHighlightView, "setDelegate:", self);
    -[VKCImageSubjectBaseView setBaseSubjectDelegate:](self->_subjectHighlightView, "setBaseSubjectDelegate:", self);
    -[VKCImageBaseOverlayView setBaseDelegate:](self->_subjectHighlightView, "setBaseDelegate:", self);
    -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView setRecognitionResult:](self->_subjectHighlightView, "setRecognitionResult:", v5);

    -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
    -[VKCImageSubjectHighlightView setNormalizedVisibleRect:](self->_subjectHighlightView, "setNormalizedVisibleRect:");
    -[VKCImageBaseOverlayView setIdentifierIndex:](self->_subjectHighlightView, "setIdentifierIndex:", -[VKCImageBaseOverlayView identifierIndex](self, "identifierIndex"));
    -[VKCImageAnalysisBaseView configureForCurrentActiveInteractionTypes](self, "configureForCurrentActiveInteractionTypes");
  }
  return self->_subjectHighlightView;
}

- (void)scrollViewWillChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v5, (uint64_t)v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (-[UIView vk_isDescendantOfView:](self, "vk_isDescendantOfView:", v14))
  {
    objc_msgSend(v14, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isHidden");

      if ((v11 & 1) == 0)
      {
        -[VKCImageAnalysisBaseView setActionInfoHiddenForZoomAnimation:](self, "setActionInfoHiddenForZoomAnimation:", 1);
        -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setVk_alpha:", 0.0);

      }
    }
    -[VKCImageAnalysisBaseView scrollViewToObserve](self, "scrollViewToObserve");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v13)
    {
      -[VKCImageAnalysisBaseView setScrollViewToObserveCount:](self, "setScrollViewToObserveCount:", -[VKCImageAnalysisBaseView scrollViewToObserveCount](self, "scrollViewToObserveCount") + 1);
    }
    else
    {
      -[VKCImageAnalysisBaseView setScrollViewToObserveCount:](self, "setScrollViewToObserveCount:", 0);
      -[VKCImageAnalysisBaseView setScrollViewToObserve:](self, "setScrollViewToObserve:", v14);
    }
  }

}

- (void)scrollViewDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v5, (uint64_t)v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (-[VKCImageAnalysisBaseView actionInfoHiddenForZoomAnimation](self, "actionInfoHiddenForZoomAnimation"))
  {
    objc_msgSend(v13, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      -[VKCImageAnalysisBaseView setActionInfoHiddenForZoomAnimation:](self, "setActionInfoHiddenForZoomAnimation:", 0);
      -[VKCImageAnalysisBaseView updateNormalizedVisibleRectIfNecessary](self, "updateNormalizedVisibleRectIfNecessary");
      -[VKCImageAnalysisBaseView actionInfoView](self, "actionInfoView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setVk_alpha:", 1.0);

    }
  }
  -[VKCImageAnalysisBaseView scrollViewToObserve](self, "scrollViewToObserve");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v11)
  {
    if (!-[VKCImageAnalysisBaseView isDescendantOfView:](self, "isDescendantOfView:", v13))
      goto LABEL_11;
    goto LABEL_10;
  }
  if (-[VKCImageAnalysisBaseView scrollViewToObserveCount](self, "scrollViewToObserveCount") < 1)
  {
    -[VKCImageAnalysisBaseView setScrollViewToObserve:](self, "setScrollViewToObserve:", 0);
    -[VKCImageAnalysisBaseView setScrollViewToObserveCount:](self, "setScrollViewToObserveCount:", 0);
LABEL_10:
    -[VKCImageAnalysisBaseView updateNormalizedVisibleRectIfNecessary](self, "updateNormalizedVisibleRectIfNecessary");
    -[VKCImageAnalysisBaseView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
    objc_msgSend(v12, "baseOverlayView:didFinishTransitionToNormalizedVisibleRect:", self);

    goto LABEL_11;
  }
  -[VKCImageAnalysisBaseView setScrollViewToObserveCount:](self, "setScrollViewToObserveCount:", -[VKCImageAnalysisBaseView scrollViewToObserveCount](self, "scrollViewToObserveCount") - 1);
LABEL_11:

}

- (void)setScrollViewToObserve:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewToObserve);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_scrollViewToObserve);
    objc_msgSend(v5, "_removeScrollViewScrollObserver:", self);

    v6 = objc_storeWeak((id *)&self->_scrollViewToObserve, obj);
    objc_msgSend(obj, "_addScrollViewScrollObserver:", self);

  }
}

- (void)highlightMatchesWithString:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  VKCImageAnalysisBaseView *v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView setHighlightStrings:](self, "setHighlightStrings:", v7);

  v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = self;
    _os_log_impl(&dword_1D2E0D000, v8, OS_LOG_TYPE_DEFAULT, "Activating String Highlight Matches Activated: %@", (uint8_t *)&v13, 0xCu);
  }

  -[VKCImageAnalysisBaseView setStringHighlightsActive:](self, "setStringHighlightsActive:", 1);
  -[VKCImageAnalysisBaseView configureForCurrentActiveInteractionTypes](self, "configureForCurrentActiveInteractionTypes");
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "vk_rangesOfMatchesForString:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[VKCImageAnalysisBaseView regexHighlightView](self, "regexHighlightView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "beginHighlightWithRanges:animated:", v11, v4);

}

- (void)clearStringHighlightsAnimated:(BOOL)a3
{
  -[VKCImageAnalysisBaseView clearRegexHighlightsAnimated:updateActiveTypes:](self, "clearRegexHighlightsAnimated:updateActiveTypes:", a3, 1);
}

- (void)clearRegexHighlightsAnimated:(BOOL)a3 updateActiveTypes:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  int v9;
  VKCImageAnalysisBaseView *v10;
  uint64_t v11;

  v4 = a4;
  v5 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (-[VKCImageAnalysisBaseView stringHighlightsActive](self, "stringHighlightsActive"))
  {
    v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_1D2E0D000, v7, OS_LOG_TYPE_DEFAULT, "String Highlight Matches Deactivated: %@", (uint8_t *)&v9, 0xCu);
    }

    -[VKCImageAnalysisBaseView setStringHighlightsActive:](self, "setStringHighlightsActive:", 0);
    -[VKCImageAnalysisBaseView regexHighlightViewIfExists](self, "regexHighlightViewIfExists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clearHighlightsAnimated:", v5);

    -[VKCImageAnalysisBaseView setHighlightStrings:](self, "setHighlightStrings:", 0);
    if (v4)
      -[VKCImageAnalysisBaseView configureForCurrentActiveInteractionTypes](self, "configureForCurrentActiveInteractionTypes");
  }
}

- (void)subjectBaseViewViewDidCompleteSubjectAnalysis:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[VKCImageAnalysisBaseView updateDebugButtonIfNecessary](self, "updateDebugButtonIfNecessary", a3);
  if (-[VKCImageAnalysisBaseView _photosInfoSingleTapSubjectModeEnabled](self, "_photosInfoSingleTapSubjectModeEnabled"))
  {
    if ((-[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes") & 4) != 0)
    {
      -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subjectContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "subjectCount");

      if (v6)
      {
        -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateVisibleItems");

        -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "animateDotsIn");

      }
    }
  }
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "baseOverlayViewDidCompleteSubjectAnalysis:", self);

}

- (void)subjectBaseViewDidBeginSubjectAnalysis:(id)a3
{
  id v4;

  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "baseOverlayViewDidBeginSubjectAnalysis:", self);

}

- (void)subjectBaseView:(id)a3 analyticsEventOccurred:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "baseOverlayView:analyticsEventDidOccur:", self, v5);

}

- (BOOL)subjectHighlightView:(id)a3 shouldBeginInteractionAtPoint:(CGPoint)a4 withType:(unint64_t)a5
{
  VKCImageAnalysisBaseView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v5 = self;
  -[VKCImageAnalysisBaseView convertPoint:fromView:](self, "convertPoint:fromView:", a3, a5, a4.x, a4.y);
  v7 = v6;
  v9 = v8;
  -[VKCImageAnalysisBaseView delegate](v5, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v10, "baseOverlayView:shouldBeginInteractionAtPoint:withTypes:", v5, 8, v7, v9);

  return (char)v5;
}

- (void)subjectHighlightView:(id)a3 willBeginInteractionAtPoint:(CGPoint)a4 withType:(unint64_t)a5
{
  void *v6;
  id v7;

  +[VKTextRange emptyRange](VKTextRange, "emptyRange", a3, a5, a4.x, a4.y);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedVKRange:", v7);

}

- (void)subjectHighlightViewSubjectInteractionInProgressDidChange:(id)a3
{
  id v4;

  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "baseOverlayViewSubjectInteractionInProgressDidChange:", self);

}

- (BOOL)isSubjectHighlightShowingLivePhoto:(id)a3 delegateHasImplementation:(BOOL *)a4
{
  void *v6;

  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "isBaseOverlayViewShowingLivePhoto:delegateHasImplementation:", self, a4);

  return (char)a4;
}

- (void)subjectHighlightView:(id)a3 livePhotoShouldPlay:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "baseOverlayView:livePhotoShouldPlay:", self, v4);

}

- (id)presentingViewControllerForSubjectHighlightView:(id)a3
{
  void *v3;
  void *v4;

  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForImageAnalysisInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)subjectHighlightView:(id)a3 containsVSItemForNormalizedPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualSearchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__VKCImageAnalysisBaseView_subjectHighlightView_containsVSItemForNormalizedPath___block_invoke;
  v12[3] = &unk_1E9464E10;
  v13 = v5;
  v9 = v5;
  objc_msgSend(v8, "vk_objectsPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v10, "count") == 1;

  return (char)v7;
}

uint64_t __81__VKCImageAnalysisBaseView_subjectHighlightView_containsVSItemForNormalizedPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "hasFocalPoint"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "normalizedIconLocation");
    v5 = objc_msgSend(v4, "containsPoint:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)subjectHighlightView:(id)a3 activateVSItemForNormalizedPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualSearchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__VKCImageAnalysisBaseView_subjectHighlightView_activateVSItemForNormalizedPath___block_invoke;
  v15[3] = &unk_1E9464E10;
  v14 = v5;
  v16 = v14;
  objc_msgSend(v8, "vk_objectPassingTest:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[VKCImageAnalysisBaseView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "baseOverlayView:shouldShowLookupForItemFromCallout:", self, v9);

    if (v11)
    {
      v12 = -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes");
      -[VKCImageAnalysisBaseView setActiveInteractionTypes:](self, "setActiveInteractionTypes:", 4);
      objc_msgSend(v9, "setCurrentInvocationType:", 2);
      -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "presentVisualSearchForItem:", v9);

      -[VKCImageAnalysisBaseView setActiveInteractionTypes:](self, "setActiveInteractionTypes:", v12);
    }
  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "item != ((void *)0)", "-[VKCImageAnalysisBaseView subjectHighlightView:activateVSItemForNormalizedPath:]", 0, 0, CFSTR("Trying to show lookup for an item, but no item was found."));
  }

}

uint64_t __81__VKCImageAnalysisBaseView_subjectHighlightView_activateVSItemForNormalizedPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "hasFocalPoint"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "normalizedIconLocation");
    v5 = objc_msgSend(v4, "containsPoint:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)videoPreviewAvailableForSubjectHighlightView:(id)a3
{
  id v4;

  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoPreviewAvailableForBaseOverlayView:", self);

}

- (BOOL)presentVisualSearchForItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  VKCImageAnalysisBaseView *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Presenting visual search result for item: %@: %@", (uint8_t *)&v17, 0x16u);
  }

  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualSearchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if (v9)
  {
    v10 = -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes");
    -[VKCImageAnalysisBaseView setActiveInteractionTypes:](self, "setActiveInteractionTypes:", 4);
    -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentVisualSearchForItem:", v4);

    if ((objc_msgSend(v4, "shouldPlaceInCorner") & 1) == 0
      && -[VKCImageAnalysisBaseView _photosInfoSingleTapSubjectModeEnabled](self, "_photosInfoSingleTapSubjectModeEnabled"))
    {
      -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "normalizedIconLocation");
      objc_msgSend(v12, "viewPointFromNormalizedPoint:");
      objc_msgSend(v12, "indexOfSubjectAtPoint:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v13, "integerValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", v15, 0, 0, 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

      }
    }
    -[VKCImageAnalysisBaseView setActiveInteractionTypes:](self, "setActiveInteractionTypes:", v10);
  }

  return v9;
}

- (id)tempPNGURLForSubjectHighlightView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  VKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VK_SUBJECT_SHARE_FILE_NAME"), CFSTR("VK_SUBJECT_SHARE_FILE_NAME"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView disposableSubjectPNGURLWithTitle:](self, "disposableSubjectPNGURLWithTitle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewForDataDetectorElementView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewForDataDetectorElementView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dataDetectorView:(id)a3 analyticsEventOccured:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "baseOverlayView:analyticsEventDidOccur:", self, v5);

}

- (id)viewForImageSnapshotForTextSelectionView:(id)a3
{
  void *v4;
  void *v5;

  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForImageSnapshotForBaseView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previewImageForDataDetectorElementView:(id)a3
{
  void *v4;
  void *v5;

  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageForImageSnapshotForBaseView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)textSelectionView:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  CGPoint v17;
  CGRect v18;

  y = a4.y;
  x = a4.x;
  -[VKCImageAnalysisBaseView convertPoint:fromView:](self, "convertPoint:fromView:", a3);
  v8 = v7;
  v10 = v9;
  if (-[VKCImageAnalysisBaseView hasActiveTextSelection](self, "hasActiveTextSelection")
    || -[VKCImageAnalysisBaseView containsTextAtPoint:](self, "containsTextAtPoint:", x, y))
  {
    -[VKCImageAnalysisBaseView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "baseOverlayView:shouldBeginInteractionAtPoint:withTypes:", self, 1, v8, v10);

  }
  else
  {
    v12 = 0;
  }
  -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[VKCImageAnalysisBaseView debugImageView](self, "debugImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v17.x = v8;
    v17.y = v10;
    v15 = CGRectContainsPoint(v18, v17);

    return v12 & ~v15;
  }
  return v12;
}

- (BOOL)textSelectionView:(id)a3 dataDetectorExistsAtPoint:(CGPoint)a4
{
  -[VKCImageAnalysisBaseView convertPoint:fromView:](self, "convertPoint:fromView:", a3, a4.x, a4.y);
  return -[VKCImageAnalysisBaseView dataDetectorTypeAtPoint:](self, "dataDetectorTypeAtPoint:") != 0;
}

- (void)textSelectionView:(id)a3 requestsDataDetectorActivationAtPoint:(CGPoint)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[VKCImageAnalysisBaseView convertPoint:fromView:](self, "convertPoint:fromView:", a3, a4.x, a4.y);
  v6 = v5;
  v8 = v7;
  -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView currentExtraOffsetForViewScale](self, "currentExtraOffsetForViewScale");
  objc_msgSend(v10, "activateLongPressDataDetectorAtPoint:maxDistance:", v6, v8, v9);

}

- (void)textSelectionView:(id)a3 selectionDidChange:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a3;
  objc_msgSend(v5, "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("VKCImageTextSelectionViewSelectionDidChange"), v6);

  -[VKCImageAnalysisBaseView set_hasActiveTextSelection:](self, "set_hasActiveTextSelection:", -[VKCImageAnalysisBaseView hasActiveTextSelection](self, "hasActiveTextSelection"));
  -[VKCImageAnalysisBaseView clearStringHighlightsAnimated:](self, "clearStringHighlightsAnimated:", 0);
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textSelectionDidChangeForBaseOverlayView:", self);

}

- (void)textSelectionView:(id)a3 boundsDidChangeFromRect:(CGRect)a4 toRect:(CGRect)a5
{
  -[VKCImageAnalysisBaseView invalidateVisibleTextAreaInfo](self, "invalidateVisibleTextAreaInfo", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  -[VKCImageAnalysisBaseView updateNormalizedVisibleRectIfNecessary](self, "updateNormalizedVisibleRectIfNecessary");
}

- (id)presentingViewControllerForTextSelectionView:(id)a3
{
  void *v3;
  void *v4;

  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForImageAnalysisInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)textSelectionView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "baseOverlayView:prepareForCalloutAction:completion:", self, a4, v7);

}

- (void)subjectHighlightView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "baseOverlayView:prepareForCalloutAction:completion:", self, a4, v7);

}

- (id)textSelectionView:(id)a3 updateStringForCopy:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "baseOverlayView:updateStringForCopy:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)textSelectionView:(id)a3 updateAttributedStringForCopy:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "baseOverlayView:updateAttributedStringForCopy:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)textSelectionView:(id)a3 shouldHandleShareWithRanges:(id)a4 boundingRect:(CGRect)a5 selectedText:(id)a6 selectedAttributedText:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  void *v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v17, "baseOverlayView:shouldHandleShareWithRanges:boundingRect:selectedText:selectedAttributedText:", self, v16, v15, v14, x, y, width, height);

  return (char)self;
}

- (BOOL)dataDetectorView:(id)a3 dataDetectorInteractionShouldBeginAtPoint:(CGPoint)a4
{
  double y;
  double x;
  VKCImageAnalysisBaseView *v6;
  void *v7;

  y = a4.y;
  x = a4.x;
  v6 = self;
  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "baseOverlayView:shouldBeginInteractionAtPoint:withTypes:", v6, 2, x, y);

  return (char)v6;
}

- (void)willDisplayMenuForDataDetectorView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedVKRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView setSelectedTextRangeBeforeDataDetectorMenu:](self, "setSelectedTextRangeBeforeDataDetectorMenu:", v4);

  +[VKTextRange emptyRange](VKTextRange, "emptyRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedVKRange:", v5);

}

- (void)willDismissMenuForDataDetectorView:(id)a3
{
  void *v4;
  void *v5;

  -[VKCImageAnalysisBaseView selectedTextRangeBeforeDataDetectorMenu](self, "selectedTextRangeBeforeDataDetectorMenu", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedVKRange:", v4);

  -[VKCImageAnalysisBaseView setSelectedTextRangeBeforeDataDetectorMenu:](self, "setSelectedTextRangeBeforeDataDetectorMenu:", 0);
}

- (BOOL)visualSearchItemView:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double y;
  double x;
  VKCImageAnalysisBaseView *v6;
  void *v7;

  y = a4.y;
  x = a4.x;
  v6 = self;
  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "baseOverlayView:shouldBeginInteractionAtPoint:withTypes:", v6, 4, x, y);

  return (char)v6;
}

- (void)textSelectionView:(id)a3 analyticsEventOccured:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "baseOverlayView:analyticsEventDidOccur:", self, v5);

}

- (id)nonTextNormalizedHighlightAllQuadsForTextSelectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VKCImageAnalysisBaseView dataDetectorView](self, "dataDetectorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__VKCImageAnalysisBaseView_nonTextNormalizedHighlightAllQuadsForTextSelectionView___block_invoke;
  v9[3] = &unk_1E9464D28;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __83__VKCImageAnalysisBaseView_nonTextNormalizedHighlightAllQuadsForTextSelectionView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isMRCDataDetector"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "boundingQuads");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> id: %d"), v5, self, objc_msgSend(v6, "analysisRequestID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)summaryDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_substringToIndex:", 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)triggerTapToRadar
{
  id v2;

  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerTapToRadar");

}

- (id)textSelectionView:(id)a3 closestVisualSearchItemForRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v17;
  _QWORD v19[9];
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visualSearchResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resultItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11;
  v25 = __Block_byref_object_dispose__11;
  objc_msgSend(v10, "firstObject");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectionQuadsVertexCentroid");
    v13 = v12;
    v15 = v14;

    if (v13 != *MEMORY[0x1E0C9D538] || v15 != *(double *)(MEMORY[0x1E0C9D538] + 8))
    {
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      v20[3] = 0x7FF0000000000000;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __78__VKCImageAnalysisBaseView_textSelectionView_closestVisualSearchItemForRange___block_invoke;
      v19[3] = &unk_1E9464E38;
      *(double *)&v19[7] = v13;
      *(double *)&v19[8] = v15;
      v19[4] = self;
      v19[5] = v20;
      v19[6] = &v21;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v19);
      _Block_object_dispose(v20, 8);
    }
  }
  v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v17;
}

void __78__VKCImageAnalysisBaseView_textSelectionView_closestVisualSearchItemForRange___block_invoke(uint64_t a1, void *a2)
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v4 = objc_msgSend(v13, "shouldPlaceInCorner");
  v5 = v13;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v13, "normalizedBoundingBox");
    +[VKQuad quadFromCGRect:](VKQuad, "quadFromCGRect:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "visualSearchView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewQuadFromNormalizedQuad:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "vertexCentroid");
    v11 = VKMDistance(*(double *)(a1 + 56), *(double *)(a1 + 64), v9, v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v11 < *(double *)(v12 + 24))
    {
      *(double *)(v12 + 24) = v11;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    }

    v5 = v13;
  }

}

- (void)generateTextualVisualSearchResultForQueryInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateTextualVisualSearchResultForQueryInfo:completionHandler:", v7, v6);

}

- (id)visualSearchResultItems
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualSearchResultItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)visualSearchItemView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[VKCImageAnalysisBaseView delegate](self, "delegate", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "baseOverlayView:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self, x, y, width, height);

}

- (void)visualSearchItemViewDidDismissController:(id)a3
{
  id v4;

  -[VKCImageAnalysisBaseView setVsItemPresentedFromMenu:](self, "setVsItemPresentedFromMenu:", 0);
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "baseOverlayViewDismissVisualSearchController:", self);

}

- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generateVisualSearchResultForItems:queryID:completionHandler:", v9, a4, v8);

}

- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitVisualSearchUserFeedbackForReportIdentifier:userFeedbackPayload:sfReportData:", v10, v9, v8);

}

- (void)visualSearchView:(id)a3 analyticsEventOccured:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "baseOverlayView:analyticsEventDidOccur:", self, v5);

}

- (id)visualSearchView:(id)a3 normalizedPathForSubjectAtNormalizedPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  y = a4.y;
  x = a4.x;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "indexOfSubjectAtNormalizedPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
    objc_msgSend(v8, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)visualSearchItemViewDidActivateVSItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;

  v4 = a3;
  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "automaticallyShowVisualSearchResults");

  if (v6)
  {
    objc_msgSend(v4, "visualSearchResultItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "analysis");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageAnalysisResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "visualSearchResultItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "currentInvocationType");

    if (v12)
    {
      +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didShowVisualSearchHintsForRequest:invocationType:", v10, v12);

    }
    else
    {
      v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[VKCImageAnalysisBaseView visualSearchItemViewDidActivateVSItem:].cold.1((uint64_t)self, v14);

    }
  }

}

- (id)presentingViewControllerForImageAnalysisInteraction
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewControllerForImageAnalysisInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDidAddVisualSearchCornerView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDidAddVisualSearchCornerView:", v3);

}

- (BOOL)visualSearchView:(id)a3 shouldShowDotForItem:(id)a4 allItems:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v7 = a4;
  v8 = a5;
  if (-[VKCImageAnalysisBaseView _photosInfoSingleTapSubjectModeEnabled](self, "_photosInfoSingleTapSubjectModeEnabled"))
  {
    -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subjectContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "subjectCount");

      if (v14)
      {
        objc_msgSend(v7, "normalizedIconLocation");
        -[VKCImageBaseOverlayView viewPointFromNormalizedPoint:](self, "viewPointFromNormalizedPoint:");
        objc_msgSend(v11, "indexOfSubjectAtPoint:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __75__VKCImageAnalysisBaseView_visualSearchView_shouldShowDotForItem_allItems___block_invoke;
          v18[3] = &unk_1E9464E60;
          v18[4] = self;
          v19 = v11;
          v20 = v7;
          v21 = v15;
          v16 = objc_msgSend(v8, "vk_containsObjectPassingTest:", v18);

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        objc_msgSend(v8, "count");
        v16 = 1;
      }

    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

BOOL __75__VKCImageAnalysisBaseView_visualSearchView_shouldShowDotForItem_allItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _BOOL8 v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "normalizedIconLocation");
  objc_msgSend(v3, "viewPointFromNormalizedPoint:");
  objc_msgSend(*(id *)(a1 + 40), "indexOfSubjectAtPoint:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(id *)(a1 + 48);

  v7 = v6 != v4 && v5 == *(void **)(a1 + 56);
  return v7;
}

- (void)scrollViewDidZoomToUnitRect:(CGRect)a3
{
  self->_clientDidSetNormalizedRect = 1;
  -[VKCImageAnalysisBaseView setNormalizedVisibleRect:](self, "setNormalizedVisibleRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)automaticallyShowVisualSearchResultsIfApplicable
{
  id v3;

  if (!-[VKCImageAnalysisBaseView _photosInfoSingleTapSubjectModeEnabled](self, "_photosInfoSingleTapSubjectModeEnabled"))
  {
    -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "automaticallyShowVisualSearchResults");

  }
}

- (void)showTopVisualSearchResult
{
  NSObject *v3;
  void *v4;
  int v5;
  VKCImageAnalysisBaseView *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "ShowTopVisualSearchResult: %@", (uint8_t *)&v5, 0xCu);
  }

  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showTopVisualSearchResult");

}

- (void)addMetadataToVSFeedbackItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int v12;

  v4 = a3;
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "analysisRequestID");

  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__VKCImageAnalysisBaseView_addMetadataToVSFeedbackItem___block_invoke;
  v10[3] = &unk_1E9464E88;
  v11 = v8;
  v12 = v6;
  v9 = v8;
  objc_msgSend(v4, "setReportAnIssueMetadataFetchingBlock:", v10);

}

id __56__VKCImageAnalysisBaseView_addMetadataToVSFeedbackItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "blockingCreatePNGAssetDataWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "data != ((void *)0)", "-[VKCImageAnalysisBaseView addMetadataToVSFeedbackItem:]_block_invoke", 0, 0, CFSTR("preview image is nil for VSFeedbackItem. Request: %d"), *(unsigned int *)(a1 + 40));
    goto LABEL_5;
  }
  v5 = *MEMORY[0x1E0D87C70];
  if (!objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0D87C70]))
  {
LABEL_5:
    v6 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_6;
  }
  v8 = v5;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

- (void)createStickerRepresentationsAtIndexSet:(id)a3 type:(unint64_t)a4 stickerIDs:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createStickerRepresentationsAtIndexSet:type:stickerIDs:progress:completion:", v15, a4, v14, v13, v12);

}

- (id)videoPreviewSubjectMatteAtCompositionTime:(id *)a3
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a3;
  objc_msgSend(v4, "videoPreviewSubjectMatteAtCompositionTime:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)videoPreviewSubjectMatteForImage:(id)a3 atCompositionTime:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v6 = a3;
  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *a4;
  objc_msgSend(v7, "videoPreviewSubjectMatteForImage:atCompositionTime:", v6, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- ($0FD61D44AD30C1CDCD15B60AC4039C90)videoPreviewTimeRange
{
  void *v4;
  $0FD61D44AD30C1CDCD15B60AC4039C90 *result;
  void *v6;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "videoPreviewTimeRange");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (CGRect)videoPreviewNormalizedCropRect
{
  void *v2;
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
  CGRect result;

  -[VKCImageAnalysisBaseView subjectHighlightView](self, "subjectHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoPreviewNormalizedCropRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)sendAnalysisDidChangeAnalyticsEvent
{
  VKAnalyticsInteractionEvent *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  VKAnalyticsInteractionEvent *v8;

  v3 = [VKAnalyticsInteractionEvent alloc];
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes");
  -[VKCImageBaseOverlayView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VKAnalyticsInteractionEvent initWithEventType:analysis:source:interactionTypes:buttonActive:customIdentifier:](v3, "initWithEventType:analysis:source:interactionTypes:buttonActive:customIdentifier:", 2, v4, 0, v5, 0, v6);

  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseOverlayView:analyticsEventDidOccur:", self, v8);

}

- (void)sendActiveInteractionTypesDidChangeAnalyticsEvent
{
  VKAnalyticsInteractionEvent *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  VKAnalyticsInteractionEvent *v8;

  v3 = [VKAnalyticsInteractionEvent alloc];
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VKCImageAnalysisBaseView activeInteractionTypes](self, "activeInteractionTypes");
  -[VKCImageBaseOverlayView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VKAnalyticsInteractionEvent initWithEventType:analysis:source:interactionTypes:buttonActive:customIdentifier:](v3, "initWithEventType:analysis:source:interactionTypes:buttonActive:customIdentifier:", 1, v4, 0, v5, 0, v6);

  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseOverlayView:analyticsEventDidOccur:", self, v8);

}

- (void)sendVisualSearchAnalyticsWithDidBecomeActive:(BOOL)a3
{
  _BOOL4 v3;
  VKAnalyticsVisualSearchEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  VKAnalyticsVisualSearchEvent *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[VKCImageAnalysisBaseView visualSearchView](self, "visualSearchView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [VKAnalyticsVisualSearchEvent alloc];
  objc_msgSend(v11, "visualSearchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VKAnalyticsVisualSearchEvent initWithType:items:interactedItem:serverProcessingTime:customIdentifier:](v5, "initWithType:items:interactedItem:serverProcessingTime:customIdentifier:", !v3, v7, 0, v8, 0.0);

  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "baseOverlayView:analyticsEventDidOccur:", self, v9);

}

- (void)sendQuickActionAnalyticsWithDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v4;
  VKAnalyticsQuickActionEvent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  VKAnalyticsQuickActionEvent *v13;

  v4 = a3;
  v5 = [VKAnalyticsQuickActionEvent alloc];
  -[VKCImageAnalysisBaseView quickActions](self, "quickActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  -[VKCImageBaseOverlayView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[VKAnalyticsQuickActionEvent initWithQuickActionType:quickActionsCount:textLength:eventType:customIdentifier:](v5, "initWithQuickActionType:quickActionsCount:textLength:eventType:customIdentifier:", 0, v7, v10, v4, v11);

  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "baseOverlayView:analyticsEventDidOccur:", self, v13);

}

- (id)highlightView:(id)a3 selectionRectsForRanges:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  void *v28;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v6 = a3;
  v7 = a4;
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__11;
  v43 = __Block_byref_object_dispose__11;
  v44 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __66__VKCImageAnalysisBaseView_highlightView_selectionRectsForRanges___block_invoke;
  v36[3] = &unk_1E9463E90;
  v38 = &v39;
  v9 = v8;
  v37 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v36);
  v27 = v7;
  v28 = v6;
  objc_msgSend((id)v40[5], "vk_rangeArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v10, "count") - 1; ++i)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "rangeValue");
    v17 = v16;

    objc_msgSend(v10, "objectAtIndexedSubscript:", i + 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "rangeValue");

    v20 = v15 + v17;
    if (v19 - v20 == 1
      && (objc_msgSend(v11, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v20)) & 1) != 0)
    {
      objc_msgSend((id)v40[5], "addIndex:", v20);
    }
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__11;
  v34 = __Block_byref_object_dispose__11;
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = (void *)v40[5];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66__VKCImageAnalysisBaseView_highlightView_selectionRectsForRanges___block_invoke_2;
  v29[3] = &unk_1E9464EB0;
  v29[4] = self;
  v29[5] = &v30;
  objc_msgSend(v21, "enumerateRangesUsingBlock:", v29);
  v22 = objc_msgSend((id)v31[5], "copy");
  v23 = (void *)v22;
  v24 = (void *)MEMORY[0x1E0C9AA60];
  if (v22)
    v24 = (void *)v22;
  v25 = v24;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v39, 8);

  return v25;
}

void __66__VKCImageAnalysisBaseView_highlightView_selectionRectsForRanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v13 = v3;
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v13;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v3, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "smallestSelectableRangeForPosition:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "nsRange");
  objc_msgSend(v4, "addIndexesInRange:", v11, v12);

}

void __66__VKCImageAnalysisBaseView_highlightView_selectionRectsForRanges___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  VKTextRange *v6;
  void *v7;
  id v8;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "textSelectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[VKTextRange initWithRange:]([VKTextRange alloc], "initWithRange:", a2, a3);
  objc_msgSend(v8, "selectionRectsForRange:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vk_addObjectsFromNonNilArray:", v7);

}

- (void)willDisplayMenuForActionInfoButton:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suppressSelectionViewGrabbers");

  -[VKCImageAnalysisBaseView actionInfoButtonDidActivatePrimaryAction:](self, "actionInfoButtonDidActivatePrimaryAction:", v5);
}

- (void)willHideMenuForActionInfoButton:(id)a3
{
  id v3;

  -[VKCImageAnalysisBaseView textSelectionView](self, "textSelectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsuppressSelectionViewGrabbers");

}

- (void)actionInfoButtonDidActivatePrimaryAction:(id)a3
{
  void *v4;
  VKAnalyticsQuickActionEvent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  VKAnalyticsQuickActionEvent *v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "representedElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForDDTypes(objc_msgSend(v4, "dataDetectorTypes"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v5 = [VKAnalyticsQuickActionEvent alloc];
  -[VKCImageAnalysisBaseView quickActions](self, "quickActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[VKCImageAnalysisBaseView analysisResult](self, "analysisResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  -[VKCImageBaseOverlayView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VKAnalyticsQuickActionEvent initWithQuickActionType:quickActionsCount:textLength:eventType:customIdentifier:](v5, "initWithQuickActionType:quickActionsCount:textLength:eventType:customIdentifier:", v14, v7, v10, 2, v11);

  -[VKCImageAnalysisBaseView delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "baseOverlayView:analyticsEventDidOccur:", self, v12);

}

- (id)disposableFolderPath
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("VKTemp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)disposableSubjectPNGURLWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[VKCImageAnalysisBaseView disposableFolderPath](self, "disposableFolderPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "fileExistsAtPath:", v8) & 1) == 0)
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);
  objc_msgSend(v8, "stringByAppendingPathComponent:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("png"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)deleteDisposableFiles
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisBaseView disposableFolderPath](self, "disposableFolderPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

}

- (BOOL)isShowingTranslation
{
  return self->_isShowingTranslation;
}

- (BOOL)subjectHighlightFeatureFlagEnabled
{
  return self->_subjectHighlightFeatureFlagEnabled;
}

- (void)setSubjectHighlightFeatureFlagEnabled:(BOOL)a3
{
  self->_subjectHighlightFeatureFlagEnabled = a3;
}

- (VKCImageAnalysisResult)analysisResult
{
  return self->_analysisResult;
}

- (BOOL)isPublicAPI
{
  return self->_isPublicAPI;
}

- (void)setIsPublicAPI:(BOOL)a3
{
  self->_isPublicAPI = a3;
}

- (id)loggingParentObject
{
  return objc_loadWeakRetained(&self->_loggingParentObject);
}

- (void)setLoggingParentObject:(id)a3
{
  objc_storeWeak(&self->_loggingParentObject, a3);
}

- (VKCImageTextSelectionView)textSelectionView
{
  return self->_textSelectionView;
}

- (void)setTextSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_textSelectionView, a3);
}

- (void)setDataDetectorView:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectorView, a3);
}

- (void)setVisualSearchView:(id)a3
{
  objc_storeStrong((id *)&self->_visualSearchView, a3);
}

- (VKCImageTranslationView)translationView
{
  return self->_translationView;
}

- (void)setTranslationView:(id)a3
{
  objc_storeStrong((id *)&self->_translationView, a3);
}

- (VKCImageAnalysisBaseViewDelegate)delegate
{
  return (VKCImageAnalysisBaseViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)activeInteractionTypes
{
  return self->_activeInteractionTypes;
}

- (BOOL)longPressDataDetectorsInTextMode
{
  return self->_longPressDataDetectorsInTextMode;
}

- (BOOL)wantsAutomaticContentsRectCalculation
{
  return self->_wantsAutomaticContentsRectCalculation;
}

- (void)setVisibleImageRect:(CGRect)a3
{
  self->_visibleImageRect = a3;
}

- (NSArray)quickActions
{
  return self->_quickActions;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (VKVisibleTextAreaInfo)visibleTextAreaInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[21].maxQuadHeight;
  *(_OWORD *)&retstr->boundingBoxArea = *(_OWORD *)&self[21].boundingBoxArea;
  *(_OWORD *)&retstr->maxQuadHeight = v3;
  retstr->dataDetectors = self[21].dataDetectors;
  return self;
}

- (void)setVisibleTextAreaInfo:(VKVisibleTextAreaInfo *)a3
{
  unint64_t dataDetectors;
  __int128 v4;

  dataDetectors = a3->dataDetectors;
  v4 = *(_OWORD *)&a3->maxQuadHeight;
  *(_OWORD *)&self->_visibleTextAreaInfo.boundingBoxArea = *(_OWORD *)&a3->boundingBoxArea;
  *(_OWORD *)&self->_visibleTextAreaInfo.maxQuadHeight = v4;
  self->_visibleTextAreaInfo.dataDetectors = dataDetectors;
}

- (UIView)viewForObservingContentMode
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_viewForObservingContentMode);
}

- (VKCActionInfoView)actionInfoView
{
  return self->_actionInfoView;
}

- (UIFont)actionInfoCustomFont
{
  return self->_actionInfoCustomFont;
}

- (BOOL)stringHighlightsActive
{
  return self->_stringHighlightsActive;
}

- (void)setStringHighlightsActive:(BOOL)a3
{
  self->_stringHighlightsActive = a3;
}

- (BOOL)didAddVisualSearchCornerView
{
  return self->_didAddVisualSearchCornerView;
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundQueue, a3);
}

- (void)setRegexHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_regexHighlightView, a3);
}

- (void)setSubjectHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_subjectHighlightView, a3);
}

- (BOOL)didLogContentsRectError
{
  return self->_didLogContentsRectError;
}

- (void)setDidLogContentsRectError:(BOOL)a3
{
  self->_didLogContentsRectError = a3;
}

- (unint64_t)checkForQuickActionsIndex
{
  return self->_checkForQuickActionsIndex;
}

- (void)setCheckForQuickActionsIndex:(unint64_t)a3
{
  self->_checkForQuickActionsIndex = a3;
}

- (BOOL)visibleTextAreaInfoIsValid
{
  return self->_visibleTextAreaInfoIsValid;
}

- (void)setVisibleTextAreaInfoIsValid:(BOOL)a3
{
  self->_visibleTextAreaInfoIsValid = a3;
}

- (BOOL)isAnalysisVisible
{
  return self->_isAnalysisVisible;
}

- (void)setIsAnalysisVisible:(BOOL)a3
{
  self->_isAnalysisVisible = a3;
}

- (BOOL)_hasActiveTextSelection
{
  return self->__hasActiveTextSelection;
}

- (NSArray)highlightStrings
{
  return self->_highlightStrings;
}

- (void)setHighlightStrings:(id)a3
{
  objc_storeStrong((id *)&self->_highlightStrings, a3);
}

- (NSIndexSet)highlightStringsIndexSet
{
  return self->_highlightStringsIndexSet;
}

- (void)setHighlightStringsIndexSet:(id)a3
{
  objc_storeStrong((id *)&self->_highlightStringsIndexSet, a3);
}

- (UIImageView)debugImageView
{
  return self->_debugImageView;
}

- (void)setDebugImageView:(id)a3
{
  objc_storeStrong((id *)&self->_debugImageView, a3);
}

- (VKCRemoveBackgroundRequestHandler)removeBackgroundRequestHandler
{
  return self->_removeBackgroundRequestHandler;
}

- (void)setRemoveBackgroundRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_removeBackgroundRequestHandler, a3);
}

- (VKCRemoveBackgroundRequest)inProcessMaskRemoveBackgroundRequest
{
  return self->_inProcessMaskRemoveBackgroundRequest;
}

- (void)setInProcessMaskRemoveBackgroundRequest:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessMaskRemoveBackgroundRequest, a3);
}

- (BOOL)clientDidSetNormalizedRect
{
  return self->_clientDidSetNormalizedRect;
}

- (void)setClientDidSetNormalizedRect:(BOOL)a3
{
  self->_clientDidSetNormalizedRect = a3;
}

- (BOOL)highlightedMenuItemUpdateScheduled
{
  return self->_highlightedMenuItemUpdateScheduled;
}

- (void)setHighlightedMenuItemUpdateScheduled:(BOOL)a3
{
  self->_highlightedMenuItemUpdateScheduled = a3;
}

- (void)setCopyAllQuickAction:(id)a3
{
  objc_storeStrong((id *)&self->_copyAllQuickAction, a3);
}

- (void)setTranslateQuickAction:(id)a3
{
  objc_storeStrong((id *)&self->_translateQuickAction, a3);
}

- (UILabel)textInfoView
{
  return self->_textInfoView;
}

- (void)setTextInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_textInfoView, a3);
}

- (VKTextRange)selectedTextRangeBeforeDataDetectorMenu
{
  return self->_selectedTextRangeBeforeDataDetectorMenu;
}

- (void)setSelectedTextRangeBeforeDataDetectorMenu:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTextRangeBeforeDataDetectorMenu, a3);
}

- (VKCAnalysisDebugMenuProvider)debugMenuProvider
{
  return self->_debugMenuProvider;
}

- (void)setDebugMenuProvider:(id)a3
{
  objc_storeStrong((id *)&self->_debugMenuProvider, a3);
}

- (UIScrollView)scrollViewToObserve
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollViewToObserve);
}

- (int64_t)scrollViewToObserveCount
{
  return self->_scrollViewToObserveCount;
}

- (void)setScrollViewToObserveCount:(int64_t)a3
{
  self->_scrollViewToObserveCount = a3;
}

- (BOOL)actionInfoHiddenForZoomAnimation
{
  return self->_actionInfoHiddenForZoomAnimation;
}

- (void)setActionInfoHiddenForZoomAnimation:(BOOL)a3
{
  self->_actionInfoHiddenForZoomAnimation = a3;
}

- (VKCVisualSearchResultItem)vsItemPresentedFromMenu
{
  return (VKCVisualSearchResultItem *)objc_loadWeakRetained((id *)&self->_vsItemPresentedFromMenu);
}

- (void)setVsItemPresentedFromMenu:(id)a3
{
  objc_storeWeak((id *)&self->_vsItemPresentedFromMenu, a3);
}

- (CALayer)layerForObservingContentsRect
{
  return (CALayer *)objc_loadWeakRetained((id *)&self->_layerForObservingContentsRect);
}

- (CGRect)frameWhenResigningActive
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameWhenResigningActive.origin.x;
  y = self->_frameWhenResigningActive.origin.y;
  width = self->_frameWhenResigningActive.size.width;
  height = self->_frameWhenResigningActive.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameWhenResigningActive:(CGRect)a3
{
  self->_frameWhenResigningActive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layerForObservingContentsRect);
  objc_destroyWeak((id *)&self->_vsItemPresentedFromMenu);
  objc_destroyWeak((id *)&self->_scrollViewToObserve);
  objc_storeStrong((id *)&self->_debugMenuProvider, 0);
  objc_storeStrong((id *)&self->_selectedTextRangeBeforeDataDetectorMenu, 0);
  objc_storeStrong((id *)&self->_textInfoView, 0);
  objc_storeStrong((id *)&self->_translateQuickAction, 0);
  objc_storeStrong((id *)&self->_copyAllQuickAction, 0);
  objc_storeStrong((id *)&self->_inProcessMaskRemoveBackgroundRequest, 0);
  objc_storeStrong((id *)&self->_removeBackgroundRequestHandler, 0);
  objc_storeStrong((id *)&self->_debugImageView, 0);
  objc_storeStrong((id *)&self->_highlightStringsIndexSet, 0);
  objc_storeStrong((id *)&self->_highlightStrings, 0);
  objc_storeStrong((id *)&self->_subjectHighlightView, 0);
  objc_storeStrong((id *)&self->_regexHighlightView, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_actionInfoCustomFont, 0);
  objc_storeStrong((id *)&self->_actionInfoView, 0);
  objc_destroyWeak((id *)&self->_viewForObservingContentMode);
  objc_storeStrong((id *)&self->_quickActions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_translationView, 0);
  objc_storeStrong((id *)&self->_visualSearchView, 0);
  objc_storeStrong((id *)&self->_dataDetectorView, 0);
  objc_storeStrong((id *)&self->_textSelectionView, 0);
  objc_destroyWeak(&self->_loggingParentObject);
  objc_storeStrong((id *)&self->_analysisResult, 0);
}

- (void)visualSearchItemViewDidActivateVSItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "invocationType should not be VKCVSInvocationTypeUnknown : %@", (uint8_t *)&v2, 0xCu);
}

@end

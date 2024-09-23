@implementation VKCImageAnalysisInteraction

- (id)resultItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  VKImageAnalysisInteractionResultInfo *v15;
  void *v16;
  void *v17;
  VKImageAnalysisInteractionResultInfo *v18;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction analysis](self, "analysis");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageAnalysisResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "visualSearchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "domainInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "displayLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "domainInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "displayMessage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = [VKImageAnalysisInteractionResultInfo alloc];
        objc_msgSend(v10, "domainInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "glyphName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "normalizedBoundingBox");
        v18 = -[VKImageAnalysisInteractionResultInfo initWithDisplayLabel:displayMessage:glyphName:rect:](v15, "initWithDisplayLabel:displayMessage:glyphName:rect:", v12, v14, v17);

        objc_msgSend(v3, "addObject:", v18);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VKCImageAnalysisInteraction setViewForObservingContentMode:](self, "setViewForObservingContentMode:", 0);
  -[VKCImageAnalysisInteraction closeAndSendCurrentAnalyticsSession](self, "closeAndSendCurrentAnalyticsSession");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalysisInteraction;
  -[VKCImageAnalysisInteraction dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[VKCImageAnalysisInteraction analysis](self, "analysis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> id: %d"), v4, self, objc_msgSend(v5, "analysisRequestID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)summaryDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_substringToIndex:", 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (VKCImageAnalysisInteraction)init
{
  VKCImageAnalysisInteraction *v2;
  VKCImageAnalysisBaseView *v3;
  VKCImageAnalysisBaseView *baseView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKCImageAnalysisInteraction;
  v2 = -[VKCImageAnalysisInteraction init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VKCImageAnalysisBaseView);
    baseView = v2->_baseView;
    v2->_baseView = v3;

    -[VKCImageAnalysisInteraction commonInit](v2, "commonInit");
  }
  return v2;
}

- (VKCImageAnalysisInteraction)initWithInteractionOptions:(unint64_t)a3
{
  VKCImageAnalysisInteraction *v4;
  VKCImageAnalysisInteraction *v5;

  v4 = -[VKCImageAnalysisInteraction init](self, "init");
  v5 = v4;
  if (v4)
    -[VKCImageAnalysisBaseView useInteractionOptions:](v4->_baseView, "useInteractionOptions:", a3);
  return v5;
}

- (void)commonInit
{
  VKCVisualSearchCornerView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VKAnalyticsProcessor *v8;
  VKAnalyticsProcessor *analyticsProcessor;
  void *v10;
  void *v11;
  id v12;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  objc_msgSend(v12, "setWantsAutomaticContentsRectCalculation:", 1);
  objc_msgSend(v12, "setDataDetectorTypes:", -1);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "setLoggingParentObject:", self);
  v3 = objc_alloc_init(VKCVisualSearchCornerView);
  -[VKCImageAnalysisInteraction setVisualSearchCornerButtonView:](self, "setVisualSearchCornerButtonView:", v3);

  -[VKCImageAnalysisInteraction _customAnalyticsIdentifier](self, "_customAnalyticsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction visualSearchCornerButtonView](self, "visualSearchCornerButtonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_customAnalyticsIdentifier:", v4);

  -[VKCImageAnalysisInteraction visualSearchCornerButtonView](self, "visualSearchCornerButtonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  objc_msgSend(v12, "setDidAddVisualSearchCornerView:", 1);
  -[VKCImageAnalysisInteraction setAnalysisButtonRequiresVisibleContentGating:](self, "setAnalysisButtonRequiresVisibleContentGating:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_triggerTapToRadar_);
  objc_msgSend(v7, "setNumberOfTapsRequired:", 2);
  objc_msgSend(v7, "setNumberOfTouchesRequired:", 2);
  objc_msgSend(v7, "setEnabled:", vk_isInternalBuild());
  -[VKCImageAnalysisInteraction setFeedbackGestureRecognizer:](self, "setFeedbackGestureRecognizer:", v7);
  v8 = objc_alloc_init(VKAnalyticsProcessor);
  analyticsProcessor = self->_analyticsProcessor;
  self->_analyticsProcessor = v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x1E0CEB358], 0);

  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_navOrToolbarVisibilityDidChange_, *MEMORY[0x1E0CEC110], 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_navOrToolbarVisibilityWillChange_, *MEMORY[0x1E0CEC118], 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_navOrToolbarVisibilityDidChange_, *MEMORY[0x1E0CEC100], 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_navOrToolbarVisibilityWillChange_, *MEMORY[0x1E0CEC108], 0);
  -[VKCImageAnalysisInteraction setActionInfoViewHidden:animated:](self, "setActionInfoViewHidden:animated:", 1, 0);
  -[VKCImageAnalysisInteraction setDeriveQuickActionsVisibilityFromState:](self, "setDeriveQuickActionsVisibilityFromState:", 1);
  -[VKCImageAnalysisInteraction setWantsTranslucentActionInfoButtons:](self, "setWantsTranslucentActionInfoButtons:", 1);

}

- (void)navOrToolbarVisibilityWillChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v11[5];

  v4 = a3;
  -[VKCImageAnalysisInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v6, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "vk_isDescendantOfView:", v9);

  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__VKCImageAnalysisInteraction_navOrToolbarVisibilityWillChange___block_invoke;
    v11[3] = &unk_1E94625B8;
    v11[4] = self;
    vk_dispatchMainAfterDelay(v11, 0.0);
  }
}

void __64__VKCImageAnalysisInteraction_navOrToolbarVisibilityWillChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "baseView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateNormalizedVisibleRectIfNecessary");

}

- (void)navOrToolbarVisibilityDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  -[VKCImageAnalysisInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v6, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "vk_isDescendantOfView:", v9);

  if (v10)
  {
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateNormalizedVisibleRectIfNecessary");

  }
}

- (void)willMoveToView:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  if (!a3)
  {
    -[VKCImageAnalysisInteraction view](self, "view");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "removeGestureRecognizer:", self->_feedbackGestureRecognizer);

    +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v5, "activeInteractionTypes");

    if ((v4 & 4) != 0)
      objc_msgSend(v6, "didLeaveVisualSearchHints");

  }
}

- (void)didMoveToView:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  VKCImageAnalysisInteraction *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Interaction %@ did move to view: %@", (uint8_t *)&v9, 0x16u);
  }

  -[VKCImageAnalysisInteraction setView:](self, "setView:", v4);
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "bounds");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v6, "setAutoresizingMask:", 18);
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v7);

    -[VKCImageAnalysisInteraction setViewForObservingContentMode:](self, "setViewForObservingContentMode:", v4);
    objc_msgSend(v6, "configureForCurrentActiveInteractionTypes");
    objc_msgSend(v6, "updateCurrentDisplayedViewContentsRect");
    objc_msgSend(v4, "addGestureRecognizer:", self->_feedbackGestureRecognizer);
  }
  else
  {
    -[VKCImageAnalysisInteraction visualSearchCornerView](self, "visualSearchCornerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[VKCImageAnalysisInteraction setViewForObservingContentMode:](self, "setViewForObservingContentMode:", 0);
    objc_msgSend(v6, "resetSelection");
    objc_msgSend(v6, "resignFirstResponder");
    objc_msgSend(v6, "removeFromSuperview");
  }

}

- (CGRect)contentsRect
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

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsRect");
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

- (void)setView:(id)a3
{
  UIView **p_view;
  id v5;
  id v6;

  p_view = &self->_view;
  v6 = a3;
  objc_storeWeak((id *)p_view, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v6;
  else
    v5 = 0;
  -[VKCImageAnalysisInteraction setViewForObservingContentMode:](self, "setViewForObservingContentMode:", v5);

}

- (void)setViewForObservingContentMode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setViewForObservingContentMode:", v4);

}

- (UIView)viewForObservingContentMode
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForObservingContentMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setAllowLongPressForDataDetectorsInTextMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLongPressDataDetectorsInTextMode:", v3);

}

- (BOOL)allowLongPressForDataDetectorsInTextMode
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longPressDataDetectorsInTextMode");

  return v3;
}

- (void)setAnalysis:(id)a3
{
  VKCImageAnalysis *v5;
  NSObject *v6;
  NSObject *v7;
  VKCImageAnalysis **p_analysis;
  void *v9;
  VKCImageAnalysis *analysis;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v5 = (VKCImageAnalysis *)a3;
  _VKSignpostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VKImageAnalyzerProcessRequestEvent", (const char *)&unk_1D2EDB5E1, buf, 2u);
  }

  v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1D2E0D000, v7, OS_LOG_TYPE_INFO, "Signpost End: \"VKImageAnalyzerProcessRequestEvent\", v17, 2u);
  }

  p_analysis = &self->_analysis;
  if (self->_analysis != v5)
  {
    -[VKCImageAnalysisInteraction setIsSettingAnalysis:](self, "setIsSettingAnalysis:", 1);
    -[VKCImageAnalysisInteraction setDidLogAnalysisButtonVisible:](self, "setDidLogAnalysisButtonVisible:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    analysis = self->_analysis;
    if (analysis)
    {
      -[VKImageAnalysis imageAnalysisResult](analysis, "imageAnalysisResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("VKAnalysisDidUpdateNotification"), v11);

    }
    objc_storeStrong((id *)&self->_analysis, a3);
    if (*p_analysis)
    {
      -[VKImageAnalysis imageAnalysisResult](*p_analysis, "imageAnalysisResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_analysisDidUpdate_, CFSTR("VKAnalysisDidUpdateNotification"), v12);

    }
    -[VKCImageAnalysisInteraction closeAndSendCurrentAnalyticsSession](self, "closeAndSendCurrentAnalyticsSession");
    -[VKCImageAnalysisInteraction clearMatchedHighlightsIfNecessaryAnimated:](self, "clearMatchedHighlightsIfNecessaryAnimated:", 0);
    -[VKImageAnalysis imageAnalysisResult](v5, "imageAnalysisResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAnalysisResult:", v13);

    -[VKCImageAnalysisInteraction visualSearchCornerButtonView](self, "visualSearchCornerButtonView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAnalysis:", v5);

    -[VKCImageAnalysisInteraction actionInfoCornerButtonViewIfExists](self, "actionInfoCornerButtonViewIfExists");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnalysis:", v5);

    -[VKCImageAnalysisInteraction configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:](self, "configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:", 0);
    -[VKCImageAnalysisInteraction setDidToggleAAButton:](self, "setDidToggleAAButton:", 0);
    -[VKCImageAnalysisInteraction _automaticallyShowVisualSearchResultsIfApplicable](self, "_automaticallyShowVisualSearchResultsIfApplicable");
    if (!-[VKCImageAnalysisInteraction didLogAnalysisButtonVisible](self, "didLogAnalysisButtonVisible"))
      -[VKCImageAnalysisInteraction logButtonsVisibleStatus](self, "logButtonsVisibleStatus");
    -[VKCImageAnalysisInteraction set_highlightSelectableItems:](self, "set_highlightSelectableItems:", 0);
    -[VKCImageAnalysisInteraction setIsSettingAnalysis:](self, "setIsSettingAnalysis:", 0);

  }
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)selectedText
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSAttributedString)selectedAttributedText
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedAttributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (NSArray)selectedRanges
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setSelectedRanges:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedRanges:", v4);

}

- (void)setActiveInteractionTypes:(unint64_t)a3
{
  if (-[VKCImageAnalysisInteraction activeInteractionTypes](self, "activeInteractionTypes") != a3)
  {
    -[VKCImageAnalysisInteraction setInteractionTypesSetByClient:](self, "setInteractionTypesSetByClient:", a3);
    -[VKCImageAnalysisInteraction _setActiveInteractionTypes:updateAutomaticState:](self, "_setActiveInteractionTypes:updateAutomaticState:", a3, 1);
  }
}

- (void)_setActiveInteractionTypes:(unint64_t)a3 updateAutomaticState:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  if (!-[VKCImageAnalysisInteraction isUpdatingActiveTypes](self, "isUpdatingActiveTypes"))
  {
    -[VKCImageAnalysisInteraction setIsUpdatingActiveTypes:](self, "setIsUpdatingActiveTypes:", 1);
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActiveInteractionTypes:", a3);

    -[VKCImageAnalysisInteraction visualSearchCornerButtonView](self, "visualSearchCornerButtonView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", (a3 & 4) == 0);

    -[VKCImageAnalysisInteraction actionInfoCornerButtonViewIfExists](self, "actionInfoCornerButtonViewIfExists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", (a3 & 4) == 0);

    if (a3)
    {
      if (!v4)
      {
LABEL_5:
        -[VKCImageAnalysisInteraction _automaticallyShowVisualSearchResultsIfApplicable](self, "_automaticallyShowVisualSearchResultsIfApplicable");
        -[VKCImageAnalysisInteraction actionInfoViewIfExists](self, "actionInfoViewIfExists");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateLayoutIfNecessary");

        -[VKCImageAnalysisInteraction setSubjectHighlightActive:](self, "setSubjectHighlightActive:", 0);
        -[VKCImageAnalysisInteraction setIsUpdatingActiveTypes:](self, "setIsUpdatingActiveTypes:", 0);
        -[VKCImageAnalysisInteraction beginImageSubjectAnalysisWithDelayIfNecessary](self, "beginImageSubjectAnalysisWithDelayIfNecessary");
        return;
      }
    }
    else
    {
      -[VKCImageAnalysisInteraction set_highlightSelectableItems:](self, "set_highlightSelectableItems:", 0);
      if (!v4)
        goto LABEL_5;
    }
    -[VKCImageAnalysisInteraction configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:](self, "configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:", 0);
    goto LABEL_5;
  }
}

- (void)_automaticallyShowVisualSearchResultsIfApplicable
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activeInteractionTypes");

  if ((v4 & 4) != 0
    && -[VKCImageAnalysisInteraction automaticallyShowVisualSearchResults](self, "automaticallyShowVisualSearchResults"))
  {
    -[VKCImageAnalysisInteraction actionInfoCornerButtonViewIfExists](self, "actionInfoCornerButtonViewIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[VKCImageAnalysisInteraction actionInfoCornerButtonViewIfExists](self, "actionInfoCornerButtonViewIfExists");
    else
      -[VKCImageAnalysisInteraction visualSearchCornerButtonView](self, "visualSearchCornerButtonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "automaticallyShowVisualSearchResultsIfApplicable");

    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "automaticallyShowVisualSearchResultsIfApplicable");

  }
}

- (unint64_t)activeInteractionTypes
{
  void *v2;
  unint64_t v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activeInteractionTypes");

  return v3;
}

- (unint64_t)dataDetectorTypes
{
  void *v2;
  unint64_t v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataDetectorTypes");

  return v3;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  id v4;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataDetectorTypes:", a3);

}

- (void)setWantsAutomaticContentsRectCalculation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsAutomaticContentsRectCalculation:", v3);

}

- (BOOL)wantsAutomaticContentsRectCalculation
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsAutomaticContentsRectCalculation");

  return v3;
}

+ (id)keyPathsForValuesAffectingHasActiveTextSelection
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("baseView.hasActiveTextSelection"), 0);
}

- (BOOL)hasActiveTextSelection
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveTextSelection");

  return v3;
}

- (void)set_highlightSelectableItems:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlightSelectableItems:", v3);

}

- (BOOL)subjectViewUserInteractionDisabled
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "subjectViewUserInteractionDisabled");

  return v3;
}

- (void)setSubjectViewUserInteractionDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubjectViewUserInteractionDisabled:", v3);

}

- (BOOL)_highlightSelectableItems
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "highlightSelectableItems");

  return v3;
}

- (void)setHighlightSelectableItems:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[VKCImageAnalysisInteraction _highlightSelectableItems](self, "_highlightSelectableItems") != a3)
  {
    -[VKCImageAnalysisInteraction set_highlightSelectableItems:](self, "set_highlightSelectableItems:", v3);
    -[VKCImageAnalysisInteraction configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:](self, "configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:", 1);
  }
}

- (void)setSubjectHighlightActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubjectHighlightActive:", v3);

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
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", v13, v11, v10, v7, x, y);

}

- (void)createStickerImageAtIndexSet:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__VKCImageAnalysisInteraction_createStickerImageAtIndexSet_completion___block_invoke;
  v8[3] = &unk_1E9463768;
  v9 = v6;
  v7 = v6;
  -[VKCImageAnalysisInteraction loadImageSubjectWithIndexes:completion:](self, "loadImageSubjectWithIndexes:completion:", a3, v8);

}

void __71__VKCImageAnalysisInteraction_createStickerImageAtIndexSet_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[VKImageDataRequirements stickerRequirements](VKImageDataRequirements, "stickerRequirements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_imageDataWithRequirements:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (void)createStickerRepresentationsAtIndexSet:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__VKCImageAnalysisInteraction_createStickerRepresentationsAtIndexSet_completion___block_invoke;
  v10[3] = &unk_1E9463A28;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "createStickerRepresentationsAtIndexSet:type:stickerIDs:progress:completion:", v7, 7, MEMORY[0x1E0C9AA60], 0, v10);

}

uint64_t __81__VKCImageAnalysisInteraction_createStickerRepresentationsAtIndexSet_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createStickerRepresentationsAtIndexSet:type:stickerIDs:progress:completion:", v15, a4, v14, v13, v12);

}

- (id)videoPreviewSubjectMatteAtCompositionTime:(id *)a3
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
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
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
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

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
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

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
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

- (BOOL)subjectHighlightActive
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "subjectHighlightActive");

  return v3;
}

- (BOOL)subjectInteractionInProgress
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "subjectInteractionInProgress");

  return v3;
}

- (void)setActiveSubjectIndexSet:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveSubjectIndexSet:", v4);

}

- (void)set_isPublicAPI:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsPublicAPI:", v3);

  -[VKCImageAnalysisInteraction analyticsProcessor](self, "analyticsProcessor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsPublicAPI:", v3);

}

- (BOOL)_isPublicAPI
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPublicAPI");

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

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
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

- (BOOL)isSubjectHighlightAvailable
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSubjectHighlightAvailable");

  return v3;
}

- (BOOL)isSubjectAnalysisComplete
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSubjectAnalysisComplete");

  return v3;
}

- (NSIndexSet)allSubjectIndexes
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSubjectsIndexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v3;
}

- (NSIndexSet)selectedSubjectIndexes
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeSubjectIndexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v3;
}

- (id)generateSubjectImage
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generateSubjectImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_photosInfoSingleTapSubjectModeEnabled
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_photosInfoSingleTapSubjectModeEnabled");

  return v3;
}

- (void)set_photosInfoSingleTapSubjectModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_photosInfoSingleTapSubjectModeEnabled:", v3);

}

- (void)loadImageSubjectIfAvailableWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadImageSubjectIfAvailableWithCompletion:", v4);

}

- (void)set_photosImageForRemoveBackground:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomImageForRemoveBackground:", v4);

}

- (UIImage)_photosImageForRemoveBackground
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customImageForRemoveBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (BOOL)usesLightDimmingViewInLightMode
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesLightDimmingViewInLightMode");

  return v3;
}

- (void)setUsesLightDimmingViewInLightMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesLightDimmingViewInLightMode:", v3);

}

- (void)set_customAnalyticsIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomAnalyticsIdentifier:", v4);

  -[VKCImageAnalysisInteraction visualSearchCornerButtonView](self, "visualSearchCornerButtonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set_customAnalyticsIdentifier:", v4);

  -[VKCImageAnalysisInteraction actionInfoCornerButtonViewIfExists](self, "actionInfoCornerButtonViewIfExists");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "set_customAnalyticsIdentifier:", v4);

}

- (NSString)_customAnalyticsIdentifier
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customAnalyticsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)liveTextButtonVisible
{
  return self->_buttonsVisible;
}

- (void)setButtonsVisible:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;

  if (self->_buttonsVisible != a3)
  {
    self->_buttonsVisible = a3;
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[VKCImageAnalysisInteraction delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageAnalysisInteraction:liveTextButtonDidChangeToVisible:", self, self->_buttonsVisible);

    }
    -[VKCImageAnalysisInteraction logButtonsVisibleStatus](self, "logButtonsVisibleStatus");
  }
}

- (void)logButtonsVisibleStatus
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  VKCImageAnalysisInteraction *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    VKMUIStringForBool(-[VKCImageAnalysisInteraction buttonsVisible](self, "buttonsVisible"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v4;
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Analysis button is visible: %@, %@ ", (uint8_t *)&v5, 0x16u);

  }
  -[VKCImageAnalysisInteraction setDidLogAnalysisButtonVisible:](self, "setDidLogAnalysisButtonVisible:", 1);
}

- (void)setDelegate:(id)a3
{
  id v4;

  objc_storeWeak((id *)&self->_delegate, a3);
  if (!-[VKCImageAnalysisInteraction wantsAutomaticContentsRectCalculation](self, "wantsAutomaticContentsRectCalculation"))
  {
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateCurrentDisplayedViewContentsRect");

  }
}

- (BOOL)interactableItemExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v12, "containsInteractiveItemAtPoint:", v9, v11);

  return (char)v6;
}

- (BOOL)textExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v12, "containsTextAtPoint:", v9, v11);

  return (char)v6;
}

- (BOOL)dataDetectorExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "dataDetectorTypeAtPoint:", v9, v11);

  return v13 != 0;
}

- (BOOL)visualSearchExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v12, "containsVisualSearchItemAtPoint:", v9, v11);

  return (char)v6;
}

- (BOOL)actionInfoItemExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v12, "containsActionInfoItemAtPoint:", v9, v11);

  return (char)v6;
}

- (BOOL)analysisContainsTextAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v12, "analysisContainsTextAtPoint:", v9, v11);

  return (char)v6;
}

- (BOOL)imageSubjectExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v12, "containsImageSubjectAtPoint:", v9, v11);

  return (char)v6;
}

- (id)subjectIndexAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  -[VKCImageAnalysisInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "indexOfSubjectAtPoint:", v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)resetSelection
{
  id v2;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetSelection");

}

- (void)updateContentsRect
{
  id v2;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCurrentDisplayedViewContentsRect");

}

- (void)beginImageSubjectAnalysisIfNecessary
{
  id v2;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginImageSubjectAnalysisIfNecessary");

}

- (void)beginImageSubjectAnalysisWithDelayIfNecessary
{
  id v2;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginImageSubjectAnalysisWithDelayIfNecessary");

}

- (void)beginImageSubjectAnalysisIfNecessaryWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginImageSubjectAnalysisIfNecessaryWithCompletion:", v4);

}

- (void)loadImageSubjectWithIndexes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadImageSubjectWithIndexes:completion:", v7, v6);

}

- (id)imageSubjectPathWithIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageSubjectPathWithIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)imageSubjectBoundsWithIndexes:(id)a3
{
  void *v3;
  void *v4;
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
  CGRect result;

  -[VKCImageAnalysisInteraction imageSubjectPathWithIndexes:](self, "imageSubjectPathWithIndexes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setForceAnalysisBarButtonItemEnabled:(BOOL)a3
{
  if (self->_forceAnalysisBarButtonItemEnabled != a3)
  {
    self->_forceAnalysisBarButtonItemEnabled = a3;
    -[VKCImageAnalysisInteraction configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:](self, "configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:", 0);
  }
}

- (BOOL)_showVSResultForItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = objc_opt_class();
  VKCheckedDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "presentVisualSearchForItem:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)visualSearchResultItems
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualSearchResultItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)showVisualSearchForResultItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "presentVisualSearchForItem:", v5);
}

- (void)openInfoPaneForTopItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showTopVisualSearchResult");

  -[VKCImageAnalysisInteraction visualSearchResultItems](self, "visualSearchResultItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentInvocationType:", 5);

  -[VKCImageAnalysisInteraction actionInfoCornerButtonViewIfExists](self, "actionInfoCornerButtonViewIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[VKCImageAnalysisInteraction actionInfoCornerButtonViewIfExists](self, "actionInfoCornerButtonViewIfExists");
  else
    -[VKCImageAnalysisInteraction visualSearchCornerButtonView](self, "visualSearchCornerButtonView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showVisualSearchResultView");

}

- (void)setActionInfoViewHidden:(BOOL)a3
{
  -[VKCImageAnalysisInteraction setActionInfoViewHidden:animated:](self, "setActionInfoViewHidden:animated:", a3, 1);
}

- (void)setActionInfoViewHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  if (self->_actionInfoViewHidden != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_actionInfoViewHidden = a3;
    if (a3)
    {
      -[VKCImageAnalysisInteraction actionInfoViewIfExists](self, "actionInfoViewIfExists");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[VKCImageAnalysisInteraction baseView](self, "baseView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateNormalizedVisibleRectIfNecessary");

    }
    objc_msgSend(v8, "vk_setHidden:animated:", v5, v4);

  }
}

- (BOOL)actionInfoLiveTextButtonDisabled
{
  void *v2;
  void *v3;
  char v4;

  -[VKCImageAnalysisInteraction actionInfoViewIfExists](self, "actionInfoViewIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "liveTextButtonDisabled");
  else
    v4 = 0;

  return v4;
}

- (void)setActionInfoLiveTextButtonDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLiveTextButtonDisabled:", v3);

}

- (BOOL)actionInfoVisualSearchCornerViewDisabled
{
  void *v2;
  void *v3;
  char v4;

  -[VKCImageAnalysisInteraction actionInfoViewIfExists](self, "actionInfoViewIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "visualSearchCornerViewDisabled");
  else
    v4 = 0;

  return v4;
}

- (void)setActionInfoVisualSearchCornerViewDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisualSearchCornerViewDisabled:", v3);

}

- (BOOL)actionInfoQuickActionsDisabled
{
  void *v2;
  void *v3;
  char v4;

  -[VKCImageAnalysisInteraction actionInfoViewIfExists](self, "actionInfoViewIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "quickActionsDisabled");
  else
    v4 = 0;

  return v4;
}

- (void)setActionInfoQuickActionsDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQuickActionsDisabled:", v3);

}

- (void)setActionInfoLayoutUpdatesSuspended:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutUpdatesSuspended:", v3);

}

- (UIEdgeInsets)actionInfoEdgeInsets
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
  UIEdgeInsets result;

  -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "edgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setActionInfoEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEdgeInsets:", top, left, bottom, right);

}

- (void)setPreferredQuickActionButtonHeight:(double)a3
{
  id v4;

  if (self->_preferredQuickActionButtonHeight != a3)
  {
    self->_preferredQuickActionButtonHeight = a3;
    -[VKCImageAnalysisInteraction actionInfoViewIfExists](self, "actionInfoViewIfExists");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredQuickActionButtonHeight:", a3);

  }
}

- (void)setActionInfoCustomFont:(id)a3
{
  UIFont *v5;
  UIFont *actionInfoCustomFont;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v5 = (UIFont *)a3;
  if (self->_actionInfoCustomFont != v5)
  {
    objc_storeStrong((id *)&self->_actionInfoCustomFont, a3);
    if (self->_actionInfoCustomFont)
    {
      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __55__VKCImageAnalysisInteraction_setActionInfoCustomFont___block_invoke;
      v14 = &unk_1E9463A78;
      objc_copyWeak(&v15, &location);
      -[VKCImageAnalysisInteraction setQuickActionConfigurationUpdateHandler:](self, "setQuickActionConfigurationUpdateHandler:", &v11);
      actionInfoCustomFont = self->_actionInfoCustomFont;
      -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView", v11, v12, v13, v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "liveTextButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCustomSymbolFont:", actionInfoCustomFont);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      -[VKCImageAnalysisInteraction setQuickActionConfigurationUpdateHandler:](self, "setQuickActionConfigurationUpdateHandler:", 0);
      -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "liveTextButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCustomSymbolFont:", 0);

    }
  }

}

void __55__VKCImageAnalysisInteraction_setActionInfoCustomFont___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(WeakRetained, "actionInfoCustomFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "defaultFontSize");
    objc_msgSend(v7, "fontWithSize:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__VKCImageAnalysisInteraction_setActionInfoCustomFont___block_invoke_2;
    v12[3] = &unk_1E9463A50;
    v13 = v8;
    v9 = v8;
    objc_msgSend(v6, "setTitleTextAttributesTransformer:", v12);
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredSymbolConfigurationForImage:", v10);

    objc_msgSend(v3, "setConfiguration:", v6);
    objc_msgSend(WeakRetained, "actionInfoView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateLayoutIfNecessary");

  }
}

id __55__VKCImageAnalysisInteraction_setActionInfoCustomFont___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CEA098]);
  return v3;
}

- (void)setQuickActionConfigurationUpdateHandler:(id)a3
{
  id v4;
  id quickActionConfigurationUpdateHandler;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  quickActionConfigurationUpdateHandler = self->_quickActionConfigurationUpdateHandler;
  v10 = v4;
  v6 = (void *)MEMORY[0x1D8249E20]();
  LOBYTE(quickActionConfigurationUpdateHandler) = objc_msgSend(quickActionConfigurationUpdateHandler, "isEqual:", v6);

  if ((quickActionConfigurationUpdateHandler & 1) == 0)
  {
    v7 = (void *)objc_msgSend(v10, "copy");
    v8 = self->_quickActionConfigurationUpdateHandler;
    self->_quickActionConfigurationUpdateHandler = v7;

    -[VKCImageAnalysisInteraction actionInfoViewIfExists](self, "actionInfoViewIfExists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setQuickActionConfigurationUpdateHandler:", v10);

  }
}

- (BOOL)actionInfoLayoutUpdatesSuspended
{
  void *v2;
  char v3;

  -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutUpdatesSuspended");

  return v3;
}

- (void)updateActionInfoLayout
{
  id v2;

  -[VKCImageAnalysisInteraction actionInfoViewIfExists](self, "actionInfoViewIfExists");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateLayoutIfNecessary");

}

- (id)customLayoutActionInfoView
{
  void *v3;
  void *v4;
  void *v5;

  -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutomaticVisualRectLayoutDisabled:", 1);
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    objc_msgSend(v3, "removeFromSuperview");
  -[VKCImageAnalysisInteraction setActionInfoViewHidden:animated:](self, "setActionInfoViewHidden:animated:", 0, 0);
  return v3;
}

- (void)setWantsTranslucentActionInfoButtons:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_wantsTranslucentActionInfoButtons != a3)
  {
    v3 = a3;
    self->_wantsTranslucentActionInfoButtons = a3;
    -[VKCImageAnalysisInteraction actionInfoViewIfExists](self, "actionInfoViewIfExists");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWantsTranslucentActionInfoButtons:", v3);

  }
}

- (NSArray)_actionInfoButtons
{
  void *v3;
  NSArray *v4;
  NSArray *actionButtons;
  void *v6;
  void *v7;

  if (!self->_actionButtons)
  {
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "quickActions");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    actionButtons = self->_actionButtons;
    self->_actionButtons = v4;

  }
  -[VKCImageAnalysisInteraction actionButtons](self, "actionButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return (NSArray *)v7;
}

- (void)analysisDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updatedTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__VKCImageAnalysisInteraction_analysisDidUpdate___block_invoke;
  v7[3] = &__block_descriptor_40_e37_v16__0__VKCImageAnalysisInteraction_8l;
  v7[4] = v6;
  vk_performBlockOnMainThreadWithStrongSelf(self, v7);
}

void __49__VKCImageAnalysisInteraction_analysisDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;

  v28 = a2;
  objc_msgSend(v28, "baseView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "analysisDidUpdateForTypes:", *(_QWORD *)(a1 + 32));

  if ((*(_BYTE *)(a1 + 32) & 0x10) != 0)
  {
    objc_msgSend(v28, "analysis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "visualSearchCornerButtonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnalysis:", v4);

    objc_msgSend(v28, "analysis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "actionInfoCornerButtonViewIfExists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnalysis:", v6);

    objc_msgSend(v28, "baseView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "normalizedVisibleRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v28, "visualSearchCornerButtonView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNormalizedVisibleRect:", v10, v12, v14, v16);

    objc_msgSend(v28, "baseView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "normalizedVisibleRect");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(v28, "actionInfoCornerButtonViewIfExists");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setNormalizedVisibleRect:", v20, v22, v24, v26);

  }
}

- (id)previewForDataDetectorElementView:(id)a3
{
  void *v4;
  void *v5;

  -[VKCImageAnalysisInteraction baseView](self, "baseView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction viewForImageSnapshotForBaseView:](self, "viewForImageSnapshotForBaseView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)topLevelImplementsContentsRectDelegateForBaseView:(id)a3
{
  void *v3;
  char v4;

  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (id)viewForImageSnapshotForBaseView:(id)a3
{
  VKCImageAnalysisInteractionDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "contentViewForImageAnalysisInteraction:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VKCImageAnalysisInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)imageForImageSnapshotForBaseView:(id)a3
{
  VKCImageAnalysisInteractionDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "contentImageForImageAnalysisInteraction:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (CGRect)contentsRectForImageRecognitionBaseView:(id)a3
{
  void *v4;
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
  CGRect result;

  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsRectForImageAnalysisInteraction:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)baseOverlayView:(id)a3 shouldBeginInteractionAtPoint:(CGPoint)a4 withTypes:(unint64_t)a5
{
  double y;
  double x;
  unint64_t v9;
  void *v10;
  char v11;
  void *v12;
  char v13;

  y = a4.y;
  x = a4.x;
  v9 = -[VKCImageAnalysisInteraction activeInteractionTypes](self, "activeInteractionTypes", a3) & a5;
  if ((a5 & 2) != 0 && (-[VKCImageAnalysisInteraction activeInteractionTypes](self, "activeInteractionTypes") & 1) != 0)
  {
    if (-[VKCImageAnalysisInteraction allowLongPressForDataDetectorsInTextMode](self, "allowLongPressForDataDetectorsInTextMode")|| v9)
    {
      goto LABEL_4;
    }
    return 0;
  }
  if (!v9)
    return 0;
LABEL_4:
  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
    return 1;
  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "imageAnalysisInteraction:shouldBeginAtPoint:forAnalysisType:", self, a5, x, y);

  return v13;
}

- (void)textSelectionDidChangeForBaseOverlayView:(id)a3
{
  VKCImageAnalysisInteractionDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "textSelectionDidChangeForImageAnalysisInteraction:", self);

  }
}

- (void)baseOverlayViewSubjectInteractionInProgressDidChange:(id)a3
{
  VKCImageAnalysisInteractionDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "imageAnalysisInteractionSubjectInteractionInProgressDidChange:", self);

  }
}

- (void)baseOverlayView:(id)a3 analyticsEventDidOccur:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[VKCImageAnalysisInteraction updateForAnalyticsVisualSearchEventIfNecessary:](self, "updateForAnalyticsVisualSearchEventIfNecessary:", v6);
  -[VKCImageAnalysisInteraction _analyticsDelegate](self, "_analyticsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_visionKitAnalyticsEventDidOccur:interaction:", v6, self);

  -[VKCImageAnalysisInteraction addEventToAnalyticsSession:](self, "addEventToAnalyticsSession:", v6);
}

- (void)visualSearchCornerView:(id)a3 analyticsEventDidOccur:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[VKCImageAnalysisInteraction updateForAnalyticsVisualSearchEventIfNecessary:](self, "updateForAnalyticsVisualSearchEventIfNecessary:", v6);
  -[VKCImageAnalysisInteraction _analyticsDelegate](self, "_analyticsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_visionKitAnalyticsEventDidOccur:interaction:", v6, self);

  -[VKCImageAnalysisInteraction addEventToAnalyticsSession:](self, "addEventToAnalyticsSession:", v6);
}

- (void)updateForAnalyticsVisualSearchEventIfNecessary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  VKCImageAnalysisInteraction *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = objc_opt_class();
  VKDynamicCast(v5, (uint64_t)v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v10)
  {
    v7 = objc_msgSend(v10, "eventType");
    if (v7 == 2)
    {
      v8 = self;
      v9 = 1;
      goto LABEL_7;
    }
    if (v7 == 1)
    {
      objc_msgSend(v10, "setDidInteractWithResultItem:", -[VKCImageAnalysisInteraction didInteractWithVisualSearchItem](self, "didInteractWithVisualSearchItem"));
      goto LABEL_9;
    }
    v6 = v10;
    if (!v7)
    {
      v8 = self;
      v9 = 0;
LABEL_7:
      -[VKCImageAnalysisInteraction setDidInteractWithVisualSearchItem:](v8, "setDidInteractWithVisualSearchItem:", v9);
LABEL_9:
      v6 = v10;
    }
  }

}

- (id)baseOverlayView:(id)a3 updateStringForCopy:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = v5;
  if ((v7 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageAnalysisInteraction:updateStringForCopy:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)baseOverlayView:(id)a3 updateAttributedStringForCopy:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = v5;
  if ((v7 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageAnalysisInteraction:updateAttributedStringForCopy:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)baseOverlayView:(id)a3 shouldHandleShareWithRanges:(id)a4 boundingRect:(CGRect)a5 selectedText:(id)a6 selectedAttributedText:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  char v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "imageAnalysisInteraction:shouldHandleShareWithRanges:boundingRect:selectedText:selectedAttributedText:", self, v14, v15, v16, x, y, width, height);

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (void)baseOverlayView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  char v10;
  id v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageAnalysisInteraction:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self, x, y, width, height);

  }
}

- (void)baseOverlayView:(id)a3 didUpdateToNormalizedVisibleRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[VKCImageAnalysisInteraction visualSearchCornerButtonView](self, "visualSearchCornerButtonView", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNormalizedVisibleRect:", x, y, width, height);

  -[VKCImageAnalysisInteraction actionInfoCornerButtonViewIfExists](self, "actionInfoCornerButtonViewIfExists");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNormalizedVisibleRect:", x, y, width, height);

  if (!-[VKCImageAnalysisInteraction isUpdatingActiveTypes](self, "isUpdatingActiveTypes"))
    -[VKCImageAnalysisInteraction configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:](self, "configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:", 0);
}

- (void)baseOverlayView:(id)a3 didFinishTransitionToNormalizedVisibleRect:(CGRect)a4
{
  if (!-[VKCImageAnalysisInteraction didToggleAAButton](self, "didToggleAAButton", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height))-[VKCImageAnalysisInteraction configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:](self, "configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:", 0);
}

- (void)baseOverlayView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5
{
  void *v7;
  char v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a5;
  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageAnalysisInteraction:prepareForCalloutAction:competion:", self, a4, v10);

  }
  else
  {
    v10[2]();
  }

}

- (BOOL)isBaseOverlayViewShowingLivePhoto:(id)a3 delegateHasImplementation:(BOOL *)a4
{
  void *v6;
  char v7;
  void *v8;
  char v9;

  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
    return 0;
  *a4 = 1;
  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isShowingLivePhotoForImageAnalysisInteraction:", self);

  return v9;
}

- (void)baseOverlayView:(id)a3 livePhotoShouldPlay:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageAnalysisInteraction:livePhotoShouldPlay:", self, v4);

  }
}

- (BOOL)baseOverlayView:(id)a3 shouldShowLookupForItemFromCallout:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "imageAnalysisInteraction:shouldShowLookupForItemFromCallout:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)baseOverlayViewDidCompleteSubjectAnalysis:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageAnalysisInteractionDidCompleteSubjectAnalysis:", self);

  }
}

- (void)baseOverlayViewDidBeginSubjectAnalysis:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageAnalysisInteractionDidBeginSubjectAnalysis:", self);

  }
}

- (void)hasActiveTextSelectionDidChangeForBaseOverlayView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hasActiveTextSelectionDidChangeForImageAnalysisInteraction:", self);

  }
}

- (void)baseOverlayViewDidRequestButtonStateUpdate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VKCImageAnalysisInteraction configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:](self, "configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:", 1);
  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageAnalysisInteraction:didRequestLiveTextButtonSelectedState:", self, objc_msgSend(v7, "highlightSelectableItems"));

  }
}

- (void)highlightSelectableItemsDidChangeForBaseOverlayView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageAnalysisInteraction:highlightSelectedItemsValueDidChange:", self, -[VKCImageAnalysisInteraction highlightSelectableItems](self, "highlightSelectableItems"));

  }
}

- (void)visualSearchCornerView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  char v10;
  id v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageAnalysisInteraction:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self, x, y, width, height);

  }
}

- (void)baseOverlayViewDismissVisualSearchController:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageAnalysisInteractionDidDismissVisualSearchController:", self);

  }
}

- (void)visualSearchCornerViewDidDismissVisualSearchController:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageAnalysisInteractionDidDismissVisualSearchController:", self);

  }
}

- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  VKCImageAnalysis *analysis;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a3;
  +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalysis imageAnalysisResult](self->_analysis, "imageAnalysisResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  analysis = self->_analysis;
  -[VKImageAnalysis imageAnalysisResult](analysis, "imageAnalysisResult");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visualSearchResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__VKCImageAnalysisInteraction_generateVisualSearchResultForItems_queryID_completionHandler___block_invoke;
  v18[3] = &unk_1E9463AC0;
  v19 = v8;
  v17 = v8;
  objc_msgSend(v10, "generateVisualSearchResultForRequest:analysis:items:payload:queryID:completionHandler:", v12, analysis, v9, v16, a4, v18);

}

void __92__VKCImageAnalysisInteraction_generateVisualSearchResultForItems_queryID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  VKCVisualSearchResult *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(VKCVisualSearchResult);
  -[VKCVisualSearchResult setSearchResult:](v8, "setSearchResult:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateTextualVisualSearchResultForQueryInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction analysis](self, "analysis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__VKCImageAnalysisInteraction_generateTextualVisualSearchResultForQueryInfo_completionHandler___block_invoke;
  v11[3] = &unk_1E9462F00;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "generateTextualVisualSearchResultForAnalysis:queryInfo:completionHandler:", v9, v7, v11);

}

uint64_t __95__VKCImageAnalysisInteraction_generateTextualVisualSearchResultForQueryInfo_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalysis imageAnalysisResult](self->_analysis, "imageAnalysisResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitVisualIntelligenceUserFeedbackForRequest:reportIdentifier:userFeedbackPayload:sfReportData:", v12, v10, v9, v8);

}

- (void)addMetadataToVSFeedbackItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMetadataToVSFeedbackItem:", v4);

}

- (id)presentingViewControllerForImageAnalysisInteraction
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentingViewControllerForImageAnalysisInteraction:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)videoPreviewAvailableForBaseOverlayView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[VKCImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPreviewAvailableForImageAnalysisInteraction:", self);

  }
}

- (id)_filteredNormalizedRectangleQuads
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredNormalizedRectangleQuads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_filteredRectangleQuads
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredRectangleQuads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_rawRectangleObservations
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawRectangleObservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_highlightRectangleObservations
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
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  VKCImageAnalysisInteraction *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  -[VKCImageAnalysisInteraction contentsRect](self, "contentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKCImageAnalysisInteraction view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rawRectangleObservations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__VKCImageAnalysisInteraction__highlightRectangleObservations__block_invoke;
  v15[3] = &unk_1E9463AE8;
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  v16 = v11;
  v17 = self;
  v14 = v11;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

}

void __62__VKCImageAnalysisInteraction__highlightRectangleObservations__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a2, "vkQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "vk_autoFadeOutLayerWithQuad:", v6);

}

- (void)_highlightFilteredRectangleQuads
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[VKCImageAnalysisInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction _filteredRectangleQuads](self, "_filteredRectangleQuads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__VKCImageAnalysisInteraction__highlightFilteredRectangleQuads__block_invoke;
  v6[3] = &unk_1E94629F0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

id __63__VKCImageAnalysisInteraction__highlightFilteredRectangleQuads__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "vk_autoFadeOutLayerWithQuad:", a2);
}

- (void)highlightMatchesForString:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  _QWORD v9[2];

  v4 = a4;
  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = &stru_1E94661A8;
  if (a3)
    v6 = (__CFString *)a3;
  v7 = v6;
  v9[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageAnalysisInteraction highlightMatchesForStrings:animated:](self, "highlightMatchesForStrings:animated:", v8, v4);
}

- (void)highlightMatchesForStrings:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "highlightMatchesWithString:animated:", v6, 1);

    -[VKCImageAnalysisInteraction sendAnalyticsEventWithType:source:analysisButtonActive:](self, "sendAnalyticsEventWithType:source:analysisButtonActive:", 3, 0, 0);
  }
  else
  {
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearStringHighlightsAnimated:", v4);
  }

}

- (void)clearMatchedHighlightsIfNecessaryAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearStringHighlightsAnimated:", v3);

}

- (void)triggerTapToRadar:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[VKCImageAnalysisInteraction _provideFeedback](self, "_provideFeedback");
}

- (UIActivity)feedbackActivity
{
  VKBlockUIActivity *v3;
  VKBlockUIActivity *v4;
  _QWORD v6[4];
  id v7;
  id location;

  if (!vk_isInternalBuild())
    return (UIActivity *)0;
  objc_initWeak(&location, self);
  v3 = [VKBlockUIActivity alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__VKCImageAnalysisInteraction_feedbackActivity__block_invoke;
  v6[3] = &unk_1E9462630;
  objc_copyWeak(&v7, &location);
  v4 = -[VKBlockUIActivity initWithTitle:systemImageName:block:](v3, "initWithTitle:systemImageName:block:", CFSTR("Provide Scarlett Feedback"), CFSTR("ant.fill"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return (UIActivity *)v4;
}

void __47__VKCImageAnalysisInteraction_feedbackActivity__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_provideFeedback");

}

- (void)_provideFeedback
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  -[VKCImageAnalysisInteraction analysis](self, "analysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedbackProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v5, "feedbackTypeForImageAnalysisInteraction:", self);
    else
      v7 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(v5, "feedbackOptionsForImageAnalysisInteraction:", self);
    else
      v8 = -1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "feedbackMetadataForImageAnalysisInteraction:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "promisedFeedbackAttachementsForImageAnalysisInteraction:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v10);

    }
    -[VKCImageAnalysisInteraction analysis](self, "analysis");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageAnalysis:", v11);

    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__VKCImageAnalysisInteraction__provideFeedback__block_invoke;
    v13[3] = &unk_1E9463B10;
    v12 = v5;
    v14 = v12;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v4, "provideFeedbackWithType:options:metadata:promisedAttachments:userResponseHandler:", v7, v8, v9, v6, v13);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }

}

void __47__VKCImageAnalysisInteraction__provideFeedback__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          v12 = *(void **)(a1 + 32);
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v12, "writeFeedbackAttachementForImageAnalysisInteraction:to:", WeakRetained, v11, (_QWORD)v14);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (id)presentingViewControllerForFeedbackProvider
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[VKCImageAnalysisInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VKCImageAnalysisInteraction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentingViewControllerForImageAnalysisInteraction:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)scrollViewDidZoomToUnitRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollViewDidZoomToUnitRect:", x, y, width, height);

  -[VKCImageAnalysisInteraction visualSearchCornerButtonView](self, "visualSearchCornerButtonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNormalizedVisibleRect:", x, y, width, height);

  -[VKCImageAnalysisInteraction actionInfoCornerButtonViewIfExists](self, "actionInfoCornerButtonViewIfExists");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNormalizedVisibleRect:", x, y, width, height);

}

- (VKImageAnalysisBarButtonItem)analysisBarButtonItem
{
  VKImageAnalysisBarButtonItem *analysisBarButtonItem;
  VKImageAnalysisBarButtonItem *v4;
  VKImageAnalysisBarButtonItem *v5;

  analysisBarButtonItem = self->_analysisBarButtonItem;
  if (!analysisBarButtonItem)
  {
    +[VKImageAnalysisBarButtonItem analysisButtonWithTarget:action:mode:](VKImageAnalysisBarButtonItem, "analysisButtonWithTarget:action:mode:", self, sel_aAAnalysisButtonPressed_, 0);
    v4 = (VKImageAnalysisBarButtonItem *)objc_claimAutoreleasedReturnValue();
    v5 = self->_analysisBarButtonItem;
    self->_analysisBarButtonItem = v4;

    -[VKCImageAnalysisInteraction configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:](self, "configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:", 0);
    analysisBarButtonItem = self->_analysisBarButtonItem;
  }
  return analysisBarButtonItem;
}

- (VKImageAnalysisButton)analysisButton
{
  VKImageAnalysisButton *analysisButton;
  VKImageAnalysisButton *v4;
  VKImageAnalysisButton *v5;

  analysisButton = self->_analysisButton;
  if (!analysisButton)
  {
    -[VKCImageAnalysisInteraction createAnalysisButton](self, "createAnalysisButton");
    v4 = (VKImageAnalysisButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_analysisButton;
    self->_analysisButton = v4;

    -[VKCImageAnalysisInteraction configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:](self, "configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:", 0);
    analysisButton = self->_analysisButton;
  }
  return analysisButton;
}

- (VKImageAnalysisButton)actionInfoAnalysisButtonIfExists
{
  return self->_actionInfoAnalysisButton;
}

- (VKImageAnalysisButton)actionInfoAnalysisButton
{
  VKImageAnalysisButton *actionInfoAnalysisButton;
  VKImageAnalysisButton *v4;
  VKImageAnalysisButton *v5;

  actionInfoAnalysisButton = self->_actionInfoAnalysisButton;
  if (!actionInfoAnalysisButton)
  {
    -[VKCImageAnalysisInteraction createAnalysisButton](self, "createAnalysisButton");
    v4 = (VKImageAnalysisButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_actionInfoAnalysisButton;
    self->_actionInfoAnalysisButton = v4;

    -[VKCImageAnalysisInteraction configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:](self, "configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:", 0);
    actionInfoAnalysisButton = self->_actionInfoAnalysisButton;
  }
  return actionInfoAnalysisButton;
}

- (id)createAnalysisButton
{
  void *v3;
  void *v4;

  +[VKImageAnalysisButton buttonWithType:](VKImageAnalysisButton, "buttonWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_aAAnalysisButtonPressed_, 64);
  objc_msgSend(v3, "setFunction:", 2);
  objc_msgSend(v3, "setGlyphConfiguration:", 1);
  objc_msgSend(v3, "setMode:", 1);
  objc_msgSend(v3, "setSupportsDynamicType:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

  objc_msgSend(v3, "setAlpha:", 0.0);
  return v3;
}

- (void)setAnalysisButtonPrefersDarkGlyphWhenSelected:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = objc_opt_class();
  -[VKCImageAnalysisInteraction analysisButton](self, "analysisButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VKCheckedDynamicCast(v5, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefersDarkGlyphWhenSelected:", v3);

  -[VKCImageAnalysisInteraction actionInfoAnalysisButtonIfExists](self, "actionInfoAnalysisButtonIfExists");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrefersDarkGlyphWhenSelected:", v3);

}

- (BOOL)analysisButtonPrefersDarkGlyphWhenSelected
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  v3 = objc_opt_class();
  -[VKCImageAnalysisInteraction analysisButton](self, "analysisButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKCheckedDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prefersDarkGlyphWhenSelected");

  return v6;
}

- (void)aAAnalysisButtonPressed:(id)a3
{
  VKImageAnalysisButton *v4;
  NSObject *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  VKImageAnalysisButton *v9;
  uint64_t v10;
  int v11;
  VKCImageAnalysisInteraction *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (VKImageAnalysisButton *)a3;
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = self;
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Live Text Button Pressed: %@", (uint8_t *)&v11, 0xCu);
  }

  v6 = -[VKCImageAnalysisInteraction deriveCurrentAutomaticState](self, "deriveCurrentAutomaticState");
  if (-[VKCImageAnalysisInteraction _isPublicAPI](self, "_isPublicAPI")
    && !-[VKCImageAnalysisInteraction _isInPublicAutomaticMode](self, "_isInPublicAutomaticMode"))
  {
    if (-[VKCImageAnalysisInteraction _isPublicAPI](self, "_isPublicAPI"))
    {
      v7 = v6 - 1;
      if (v6 - 1 < 4)
      {
        v8 = &unk_1D2ED0FE0;
        goto LABEL_11;
      }
    }
  }
  else
  {
    v7 = v6 - 1;
    if (v6 - 1 < 6 && ((0x27u >> v7) & 1) != 0)
    {
      v8 = &unk_1D2ED0FB0;
LABEL_11:
      v6 = v8[v7];
    }
  }
  -[VKCImageAnalysisInteraction setDidToggleAAButton:](self, "setDidToggleAAButton:", 1);
  -[VKCImageAnalysisInteraction configureButtonsForState:updateActiveTypes:](self, "configureButtonsForState:updateActiveTypes:", v6, 1);
  -[VKCImageAnalysisInteraction sendAAButtonPressedDelegateCallbackIfNecessaryForSender:](self, "sendAAButtonPressedDelegateCallbackIfNecessaryForSender:", v4);
  if (self->_analysisButton == v4)
  {
    v10 = 4;
  }
  else
  {
    -[VKCImageAnalysisInteraction actionInfoAnalysisButtonIfExists](self, "actionInfoAnalysisButtonIfExists");
    v9 = (VKImageAnalysisButton *)objc_claimAutoreleasedReturnValue();
    if (v9 == v4)
      v10 = 4;
    else
      v10 = 5;

  }
  -[VKCImageAnalysisInteraction sendAnalyticsEventWithType:source:analysisButtonActive:](self, "sendAnalyticsEventWithType:source:analysisButtonActive:", 0, v10, -[VKCImageAnalysisInteraction _highlightSelectableItems](self, "_highlightSelectableItems"));

}

- (void)sendAAButtonPressedDelegateCallbackIfNecessaryForSender:(id)a3
{
  id v4;
  uint64_t v5;
  VKImageAnalysisButton *v6;
  VKImageAnalysisBarButtonItem *analysisBarButtonItem;
  void *v8;
  int v9;
  id v10;
  char v11;
  id v12;
  id WeakRetained;
  char v14;
  VKImageAnalysisButton *v15;

  v4 = a3;
  v5 = objc_opt_class();
  VKCheckedDynamicCast(v5, (uint64_t)v4);
  v15 = (VKImageAnalysisButton *)objc_claimAutoreleasedReturnValue();

  if (v15 == self->_analysisButton
    || (-[VKCImageAnalysisInteraction actionInfoAnalysisButtonIfExists](self, "actionInfoAnalysisButtonIfExists"),
        v6 = (VKImageAnalysisButton *)objc_claimAutoreleasedReturnValue(),
        v6,
        v15 == v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "imageAnalysisInteraction:imageAnalysisButtonPressed:", self, v15);
      goto LABEL_9;
    }
  }
  else
  {
    analysisBarButtonItem = self->_analysisBarButtonItem;
    if (analysisBarButtonItem)
    {
      -[VKImageAnalysisBarButtonItem customView](analysisBarButtonItem, "customView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[VKImageAnalysisButton isDescendantOfView:](v15, "isDescendantOfView:", v8);

      if (v9)
      {
        v10 = objc_loadWeakRetained((id *)&self->_delegate);
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          v12 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v12, "imageAnalysisInteraction:imageAnalysisBarItemPressed:", self, self->_analysisBarButtonItem);
LABEL_9:

        }
      }
    }
  }

}

- (VKCVisualSearchCornerView)actionInfoCornerButtonViewIfExists
{
  return self->_actionInfoCornerButtonView;
}

- (VKCVisualSearchCornerView)actionInfoCornerButtonView
{
  VKCVisualSearchCornerView *actionInfoCornerButtonView;
  VKCVisualSearchCornerView *v4;
  VKCVisualSearchCornerView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  actionInfoCornerButtonView = self->_actionInfoCornerButtonView;
  if (!actionInfoCornerButtonView)
  {
    v4 = objc_alloc_init(VKCVisualSearchCornerView);
    v5 = self->_actionInfoCornerButtonView;
    self->_actionInfoCornerButtonView = v4;

    -[VKCImageAnalysisInteraction _customAnalyticsIdentifier](self, "_customAnalyticsIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCVisualSearchCornerView set_customAnalyticsIdentifier:](self->_actionInfoCornerButtonView, "set_customAnalyticsIdentifier:", v6);

    -[VKCImageAnalysisInteraction analysis](self, "analysis");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCVisualSearchCornerView setAnalysis:](self->_actionInfoCornerButtonView, "setAnalysis:", v7);

    -[VKCVisualSearchCornerView setDelegate:](self->_actionInfoCornerButtonView, "setDelegate:", self);
    -[VKCImageAnalysisInteraction _customAnalyticsIdentifier](self, "_customAnalyticsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCVisualSearchCornerView set_customAnalyticsIdentifier:](self->_actionInfoCornerButtonView, "set_customAnalyticsIdentifier:", v8);

    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "normalizedVisibleRect");
    -[VKCVisualSearchCornerView setNormalizedVisibleRect:](self->_actionInfoCornerButtonView, "setNormalizedVisibleRect:");

    -[VKCVisualSearchCornerView setHidden:](self->_actionInfoCornerButtonView, "setHidden:", (-[VKCImageAnalysisInteraction activeInteractionTypes](self, "activeInteractionTypes") & 4) == 0);
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDidAddVisualSearchCornerView:", 1);

    actionInfoCornerButtonView = self->_actionInfoCornerButtonView;
  }
  return actionInfoCornerButtonView;
}

- (void)set_manuallyManagesActionInfoButtons:(BOOL)a3
{
  void *v4;
  id v5;

  self->__manuallyManagesActionInfoButtons = a3;
  if (a3)
  {
    -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setQuickActions:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    -[VKCImageAnalysisInteraction actionButtons](self, "actionButtons");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalysisInteraction actionInfoView](self, "actionInfoView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQuickActions:", v5);

  }
}

- (id)actionInfoViewIfExists
{
  return self->_actionInfoView;
}

- (VKCActionInfoView)actionInfoView
{
  VKCActionInfoView *actionInfoView;
  VKCActionInfoView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  VKCActionInfoView *v9;
  VKCActionInfoView *v10;
  void *v11;
  VKCActionInfoView *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *actionButtons;

  actionInfoView = self->_actionInfoView;
  if (!actionInfoView)
  {
    v4 = [VKCActionInfoView alloc];
    -[VKCImageAnalysisInteraction actionInfoAnalysisButton](self, "actionInfoAnalysisButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    -[VKCImageAnalysisInteraction actionInfoCornerButtonView](self, "actionInfoCornerButtonView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    VKCheckedDynamicCast(v6, (uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VKCActionInfoView initWithLiveTextButton:cornerView:](v4, "initWithLiveTextButton:cornerView:", v5, v8);
    v10 = self->_actionInfoView;
    self->_actionInfoView = v9;

    -[VKCImageAnalysisInteraction preferredQuickActionButtonHeight](self, "preferredQuickActionButtonHeight");
    -[VKCActionInfoView setPreferredQuickActionButtonHeight:](self->_actionInfoView, "setPreferredQuickActionButtonHeight:");
    -[VKCImageAnalysisInteraction quickActionConfigurationUpdateHandler](self, "quickActionConfigurationUpdateHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCActionInfoView setQuickActionConfigurationUpdateHandler:](self->_actionInfoView, "setQuickActionConfigurationUpdateHandler:", v11);

    v12 = self->_actionInfoView;
    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActionInfoView:", v12);

    -[VKCImageAnalysisInteraction baseView](self, "baseView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "quickActions");
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    actionButtons = self->_actionButtons;
    self->_actionButtons = v15;

    if (!self->__manuallyManagesActionInfoButtons)
      -[VKCActionInfoView setQuickActions:](self->_actionInfoView, "setQuickActions:", self->_actionButtons);
    -[VKCActionInfoView setWantsTranslucentActionInfoButtons:](self->_actionInfoView, "setWantsTranslucentActionInfoButtons:", -[VKCImageAnalysisInteraction wantsTranslucentActionInfoButtons](self, "wantsTranslucentActionInfoButtons"));
    -[VKCActionInfoView set_quickActionsHidden:](self->_actionInfoView, "set_quickActionsHidden:", 1);
    -[VKCActionInfoView setHidden:](self->_actionInfoView, "setHidden:", -[VKCImageAnalysisInteraction actionInfoViewHidden](self, "actionInfoViewHidden"));
    actionInfoView = self->_actionInfoView;
  }
  return actionInfoView;
}

- (void)configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:(BOOL)a3
{
  -[VKCImageAnalysisInteraction configureButtonsForState:updateActiveTypes:](self, "configureButtonsForState:updateActiveTypes:", -[VKCImageAnalysisInteraction deriveCurrentAutomaticState](self, "deriveCurrentAutomaticState"), a3);
}

- (unint64_t)deriveCurrentAutomaticState
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[VKCImageAnalysisInteraction _isPublicAPI](self, "_isPublicAPI");
  v4 = -[VKCImageAnalysisInteraction _isInPublicAutomaticMode](self, "_isInPublicAutomaticMode");
  v5 = -[VKCImageAnalysisInteraction _highlightSelectableItems](self, "_highlightSelectableItems");
  -[VKCImageAnalysisInteraction analysis](self, "analysis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VKCImageAnalysisInteraction activeInteractionTypes](self, "activeInteractionTypes");
  v8 = 0;
  if (v6 && v7)
  {
    if (!v3 || v4)
    {
      if ((v7 & 4) != 0)
      {
        v8 = 6;
      }
      else
      {
        v8 = 2;
        if ((!v3 || !v4 || !v5) && (v3 || !v5))
        {
          if (v7 == 3)
            v8 = 1;
          else
            v8 = ((uint64_t)(v7 << 63) >> 63) & 3;
        }
      }
    }
    else
    {
      v9 = v7 & 0xFFFFFFFFFFFFFFF7;
      v10 = 5;
      v11 = 3;
      if (v5)
        v11 = 4;
      v12 = ((uint64_t)(v7 << 61) >> 63) & 6;
      v13 = 1;
      if (v5)
        v13 = 2;
      if (v9 == 3)
        v12 = v13;
      if (v9 != 2)
        v10 = v12;
      if (v9 == 1)
        v8 = v11;
      else
        v8 = v10;
    }
  }

  return v8;
}

- (void)configureButtonsForState:(unint64_t)a3 updateActiveTypes:(BOOL)a4
{
  void *v6;
  VKImageAnalysisButton *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  int v14;
  double v15;
  int v16;
  _BOOL4 v17;
  int v18;
  double v19;
  char v20;
  char v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  VKImageAnalysisBarButtonItem *v27;
  VKImageAnalysisButton *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int v36;
  _BOOL4 v37;
  void *v38;
  unsigned int v39;
  VKImageAnalysisBarButtonItem *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  _QWORD v46[4];
  VKImageAnalysisButton *v47;
  id v48;
  char v49;
  _QWORD v50[4];
  VKImageAnalysisButton *v51;
  id v52;
  VKImageAnalysisBarButtonItem *v53;
  id v54;
  id v55;
  VKCImageAnalysisInteraction *v56;
  double v57;
  char v58;
  char v59;
  char v60;
  char v61;
  BOOL v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;

  v44 = a4;
  -[VKCImageAnalysisInteraction analysis](self, "analysis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_analysisButton;
  -[VKCImageAnalysisInteraction actionInfoAnalysisButtonIfExists](self, "actionInfoAnalysisButtonIfExists");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = self->_analysisBarButtonItem;
  -[VKCImageAnalysisInteraction visualSearchCornerButtonView](self, "visualSearchCornerButtonView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisInteraction actionInfoCornerButtonViewIfExists](self, "actionInfoCornerButtonViewIfExists");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hasResultsForAnalysisTypes:", 2);
  v9 = objc_msgSend(v6, "hasResultsForAnalysisTypes:", 1);
  v45 = v6;
  v10 = v8 | objc_msgSend(v6, "hasResultsForAnalysisTypes:", 4);
  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "visibleTextAreaInfo");
    v13 = *(double *)&v63 * 100.0;
  }
  else
  {
    v65 = 0;
    v63 = 0u;
    v64 = 0u;
    v13 = 0.0;
  }
  v14 = v9 | v10;

  +[VKCInternalSettings visibleTextAreaButtonThreshold](VKCInternalSettings, "visibleTextAreaButtonThreshold");
  if (v13 >= v15)
  {
    v16 = 1;
  }
  else
  {
    v16 = -[VKCImageAnalysisInteraction didToggleAAButton](self, "didToggleAAButton") | v10;
    if ((v16 & 1) == 0 && ((v14 ^ 1) & 1) == 0)
      v16 = !-[VKCImageAnalysisInteraction analysisButtonRequiresVisibleContentGating](self, "analysisButtonRequiresVisibleContentGating");
  }
  if ((-[VKCImageAnalysisInteraction interactionTypesSetByClient](self, "interactionTypesSetByClient") & 8) != 0)
  {
    if (-[VKCImageAnalysisInteraction _isPublicAPI](self, "_isPublicAPI"))
      v17 = -[VKCImageAnalysisInteraction _isInPublicAutomaticMode](self, "_isInPublicAutomaticMode");
    else
      v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  v18 = 0;
  v19 = 0.0;
  switch(a3)
  {
    case 0uLL:
      v37 = 0;
      v35 = 0;
      v18 = 0;
      v39 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      break;
    case 1uLL:
      goto LABEL_18;
    case 2uLL:
      v17 = 0;
      v18 = 1;
LABEL_18:
      v37 = v17;
      v23 = 0;
      v22 = 0;
      v20 = v18;
      v21 = 1;
      v35 = 3;
      v39 = v18;
      v18 = 0;
      if ((v14 & v16) != 1)
        break;
      goto LABEL_23;
    case 3uLL:
      v37 = v17;
      v23 = 0;
      v39 = 0;
      v20 = 0;
      v18 = 0;
      v22 = 0;
      v35 = 1;
      v21 = v14;
      if ((v14 & v16 & 1) == 0)
        break;
      goto LABEL_23;
    case 4uLL:
      v37 = 0;
      v20 = 0;
      v22 = 0;
      v35 = 1;
      v23 = 1;
      v39 = 1;
      v21 = v14;
      v18 = 1;
      if ((v14 & v16 & 1) != 0)
      {
LABEL_23:
        v19 = 1.0;
        v22 = 1;
        v18 = v23;
      }
      break;
    case 5uLL:
      v37 = 0;
      v18 = 0;
      v39 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v24 = 2;
      goto LABEL_26;
    case 6uLL:
      v37 = 0;
      v18 = 0;
      v39 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v24 = 4;
LABEL_26:
      v35 = v24;
      break;
    default:
      v37 = v17;
      v35 = 0;
      v39 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      break;
  }
  v36 = v18;
  v25 = -[VKCImageAnalysisInteraction forceAnalysisBarButtonItemEnabled](self, "forceAnalysisBarButtonItemEnabled") & v14;
  v38 = (void *)MEMORY[0x1E0CEABB0];
  v26 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __74__VKCImageAnalysisInteraction_configureButtonsForState_updateActiveTypes___block_invoke;
  v50[3] = &unk_1E9463B38;
  v51 = v7;
  v57 = v19;
  v58 = v21;
  v59 = v20;
  v52 = v41;
  v27 = v40;
  v60 = v22;
  v61 = v25;
  v53 = v27;
  v54 = v43;
  v62 = v44;
  v55 = v42;
  v56 = self;
  v46[0] = v26;
  v46[1] = 3221225472;
  v46[2] = __74__VKCImageAnalysisInteraction_configureButtonsForState_updateActiveTypes___block_invoke_2;
  v46[3] = &unk_1E9463B60;
  v28 = v51;
  v29 = v22;
  v49 = v22;
  v47 = v28;
  v48 = v52;
  v30 = v52;
  v31 = v42;
  v32 = v43;
  objc_msgSend(v38, "animateWithDuration:animations:completion:", v50, v46, 0.15);
  if (v44)
  {
    if (v37)
      v33 = v35 | 8;
    else
      v33 = v35;
    -[VKCImageAnalysisInteraction _setActiveInteractionTypes:updateAutomaticState:](self, "_setActiveInteractionTypes:updateAutomaticState:", v33, 0);
  }
  -[VKCImageAnalysisInteraction set_highlightSelectableItems:](self, "set_highlightSelectableItems:", v39);
  -[VKCImageAnalysisInteraction setButtonsVisible:](self, "setButtonsVisible:", v29);
  if (-[VKCImageAnalysisInteraction deriveQuickActionsVisibilityFromState](self, "deriveQuickActionsVisibilityFromState"))
  {
    -[VKCImageAnalysisInteraction actionInfoViewIfExists](self, "actionInfoViewIfExists");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "set_quickActionsHidden:", v36 | v39 ^ 1);

  }
  -[VKImageAnalysisButton setMode:](v28, "setMode:", 0);
  objc_msgSend(v30, "setMode:", 0);
  -[VKImageAnalysisBarButtonItem setMode:](v27, "setMode:", 0);

}

void __74__VKCImageAnalysisInteraction_configureButtonsForState_updateActiveTypes___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "setSelected:", *(unsigned __int8 *)(a1 + 89));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setEnabled:", *(unsigned __int8 *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "setSelected:", *(unsigned __int8 *)(a1 + 89));
  v2 = *(_BYTE *)(a1 + 88) && *(_BYTE *)(a1 + 90) || *(_BYTE *)(a1 + 91) != 0;
  objc_msgSend(*(id *)(a1 + 48), "setEnabled:", v2);
  objc_msgSend(*(id *)(a1 + 48), "setSelected:", *(unsigned __int8 *)(a1 + 89));
  if (!*(_BYTE *)(a1 + 90)
    && (objc_msgSend(*(id *)(a1 + 56), "isHidden") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 64), "isHidden") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
  }
  if (!*(_BYTE *)(a1 + 89))
  {
    if (*(_BYTE *)(a1 + 92))
    {
      objc_msgSend(*(id *)(a1 + 72), "baseView");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setIsShowingTranslation:", 0);

    }
  }
}

uint64_t __74__VKCImageAnalysisInteraction_configureButtonsForState_updateActiveTypes___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(_BYTE *)(a1 + 48) == 0);
  return objc_msgSend(*(id *)(a1 + 40), "setHidden:", *(_BYTE *)(a1 + 48) == 0);
}

- (void)sendAnalyticsEventWithType:(int64_t)a3 source:(int64_t)a4 analysisButtonActive:(BOOL)a5
{
  _BOOL8 v5;
  VKAnalyticsInteractionEvent *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  VKAnalyticsInteractionEvent *v15;

  v5 = a5;
  v9 = [VKAnalyticsInteractionEvent alloc];
  -[VKCImageAnalysisInteraction analysis](self, "analysis");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageAnalysisResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VKCImageAnalysisInteraction activeInteractionTypes](self, "activeInteractionTypes");
  -[VKCImageAnalysisInteraction _customAnalyticsIdentifier](self, "_customAnalyticsIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VKAnalyticsInteractionEvent initWithEventType:analysis:source:interactionTypes:buttonActive:customIdentifier:](v9, "initWithEventType:analysis:source:interactionTypes:buttonActive:customIdentifier:", a3, v11, a4, v12, v5, v13);

  if (-[VKCImageAnalysisInteraction activeInteractionTypes](self, "activeInteractionTypes"))
    -[VKCImageAnalysisInteraction addEventToAnalyticsSession:](self, "addEventToAnalyticsSession:", v15);
  else
    -[VKCImageAnalysisInteraction closeAndSendCurrentAnalyticsSession](self, "closeAndSendCurrentAnalyticsSession");
  -[VKCImageAnalysisInteraction _analyticsDelegate](self, "_analyticsDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_visionKitAnalyticsEventDidOccur:interaction:", v15, self);

}

- (void)addEventToAnalyticsSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  v4 = a3;
  if (!-[VKCImageAnalysisInteraction isSettingAnalysis](self, "isSettingAnalysis"))
  {
    -[VKCImageAnalysisInteraction analyticsProcessor](self, "analyticsProcessor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processAndSendEvent:", v4);

    -[VKCImageAnalysisInteraction beginNewAnalyticsSessionIfNecessary](self, "beginNewAnalyticsSessionIfNecessary");
    -[VKCImageAnalysisInteraction analyticsSession](self, "analyticsSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEvent:", v4);

    v7 = (void *)(-[VKCImageAnalysisInteraction analyticsTimeoutIndex](self, "analyticsTimeoutIndex") + 1);
    -[VKCImageAnalysisInteraction setAnalyticsTimeoutIndex:](self, "setAnalyticsTimeoutIndex:", v7);
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__VKCImageAnalysisInteraction_addEventToAnalyticsSession___block_invoke;
    v8[3] = &unk_1E9463B88;
    objc_copyWeak(v9, &location);
    v9[1] = v7;
    vk_dispatchMainAfterDelay(v8, 7.0);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }

}

void __58__VKCImageAnalysisInteraction_addEventToAnalyticsSession___block_invoke(uint64_t a1)
{
  id WeakRetained;
  BOOL v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "analyticsTimeoutIndex") == *(_QWORD *)(a1 + 40);
    WeakRetained = v4;
    if (v3)
    {
      objc_msgSend(v4, "closeAndSendCurrentAnalyticsSession");
      WeakRetained = v4;
    }
  }

}

- (void)beginNewAnalyticsSessionIfNecessary
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  VKAnalyticsSessionAccumulator *v7;
  void *v8;
  void *v9;
  VKAnalyticsSessionAccumulator *v10;

  -[VKCImageAnalysisInteraction analysis](self, "analysis");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[VKCImageAnalysisInteraction activeInteractionTypes](self, "activeInteractionTypes");

    if (v5)
    {
      -[VKCImageAnalysisInteraction analyticsSession](self, "analyticsSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = [VKAnalyticsSessionAccumulator alloc];
        -[VKCImageAnalysisInteraction analysis](self, "analysis");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCImageAnalysisInteraction _customAnalyticsIdentifier](self, "_customAnalyticsIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[VKAnalyticsSessionAccumulator initWithAnalysis:customIdentifier:](v7, "initWithAnalysis:customIdentifier:", v8, v9);
        -[VKCImageAnalysisInteraction setAnalyticsSession:](self, "setAnalyticsSession:", v10);

        -[VKCImageAnalysisInteraction setAnalyticsTimeoutIndex:](self, "setAnalyticsTimeoutIndex:", -[VKCImageAnalysisInteraction analyticsTimeoutIndex](self, "analyticsTimeoutIndex") + 1);
      }
    }
  }
}

- (void)closeAndSendCurrentAnalyticsSession
{
  void *v3;
  void *v4;
  id v5;

  -[VKCImageAnalysisInteraction analyticsSession](self, "analyticsSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "close");
    -[VKCImageAnalysisInteraction analyticsProcessor](self, "analyticsProcessor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processAndSendSession:", v5);

    -[VKCImageAnalysisInteraction setAnalyticsTimeoutIndex:](self, "setAnalyticsTimeoutIndex:", -[VKCImageAnalysisInteraction analyticsTimeoutIndex](self, "analyticsTimeoutIndex") + 1);
    -[VKCImageAnalysisInteraction setAnalyticsSession:](self, "setAnalyticsSession:", 0);
    v3 = v5;
  }

}

+ (void)_quickActionResultForDocumentObservation:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    v8 = (id)MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__VKCImageAnalysisInteraction__quickActionResultForDocumentObservation_queue_completionHandler___block_invoke;
  block[3] = &unk_1E94626F8;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v12, block);

}

void __96__VKCImageAnalysisInteraction__quickActionResultForDocumentObservation_queue_completionHandler___block_invoke(uint64_t a1)
{
  VKCImageAnalysisResult *v2;
  VKCImageAnalysisResult *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = [VKCImageAnalysisResult alloc];
  v3 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:](v2, "initWithDocumentObservation:mrcDataDetectors:imageSize:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60], 1.0, 1.0);
  -[VKCTextRecognitionResult dataDetectors](v3, "dataDetectors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult unfilteredDataDetectors](v3, "unfilteredDataDetectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__VKCImageAnalysisInteraction__quickActionResultForDocumentObservation_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E9463BD0;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  +[VKCQuickActionsProcessor quickActionsFromElements:unfilteredElements:analysis:queue:completionHandler:](VKCQuickActionsProcessor, "quickActionsFromElements:unfilteredElements:analysis:queue:completionHandler:", v4, v5, v3, v6, v7);

}

void __96__VKCImageAnalysisInteraction__quickActionResultForDocumentObservation_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VKCExternalQuickActionsResult *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_10);
  VKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VK_QUICK_ACTION_TITLE_MORE"), CFSTR("VK_QUICK_ACTION_TITLE_MORE"), CFSTR("Localizable"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "vk_symbolImageWithName:", CFSTR("ellipsis.circle.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCActionInfoButton buttonWithImage:text:](VKCActionInfoMoreButton, "buttonWithImage:text:", v5, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("QuickActionMore"));
  +[VKCActionInfoView buildMoreButtonMenuFromQuickActions:moreButton:isStandAloneMoreButton:](VKCActionInfoView, "buildMoreButtonMenuFromQuickActions:moreButton:isStandAloneMoreButton:", v3, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMenu:", v7);

  v8 = objc_alloc_init(VKCExternalQuickActionsResult);
  -[VKCExternalQuickActionsResult setQuickActions:](v8, "setQuickActions:", v3);

  -[VKCExternalQuickActionsResult setMoreButton:](v8, "setMoreButton:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __96__VKCImageAnalysisInteraction__quickActionResultForDocumentObservation_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "translucentButtonConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConfiguration:", v3);

}

- (void)_test_activateTranslationOverlay
{
  id v2;

  -[VKCImageAnalysisInteraction baseView](self, "baseView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "test_activateTranslationOverlay");

}

- (VKCImageAnalysisInteractionDelegate)delegate
{
  return (VKCImageAnalysisInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (void)setAnalysisBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_analysisBarButtonItem, a3);
}

- (void)setAnalysisButton:(id)a3
{
  objc_storeStrong((id *)&self->_analysisButton, a3);
}

- (BOOL)analysisButtonRequiresVisibleContentGating
{
  return self->_analysisButtonRequiresVisibleContentGating;
}

- (void)setAnalysisButtonRequiresVisibleContentGating:(BOOL)a3
{
  self->_analysisButtonRequiresVisibleContentGating = a3;
}

- (BOOL)didAddVisualSearchCornerView
{
  return self->_didAddVisualSearchCornerView;
}

- (UIGestureRecognizer)feedbackGestureRecognizer
{
  return self->_feedbackGestureRecognizer;
}

- (void)setFeedbackGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGestureRecognizer, a3);
}

- (BOOL)automaticallyShowVisualSearchResults
{
  return self->_automaticallyShowVisualSearchResults;
}

- (void)setAutomaticallyShowVisualSearchResults:(BOOL)a3
{
  self->_automaticallyShowVisualSearchResults = a3;
}

- (BOOL)actionInfoViewHidden
{
  return self->_actionInfoViewHidden;
}

- (double)preferredQuickActionButtonHeight
{
  return self->_preferredQuickActionButtonHeight;
}

- (UIFont)actionInfoCustomFont
{
  return self->_actionInfoCustomFont;
}

- (id)quickActionConfigurationUpdateHandler
{
  return self->_quickActionConfigurationUpdateHandler;
}

- (NSArray)baseViewConstraints
{
  return self->_baseViewConstraints;
}

- (void)setBaseViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_baseViewConstraints, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (VKCImageAnalysisBaseView)baseView
{
  return self->_baseView;
}

- (void)setBaseView:(id)a3
{
  objc_storeStrong((id *)&self->_baseView, a3);
}

- (BOOL)isSettingAnalysis
{
  return self->_isSettingAnalysis;
}

- (void)setIsSettingAnalysis:(BOOL)a3
{
  self->_isSettingAnalysis = a3;
}

- (BOOL)isUpdatingActiveTypes
{
  return self->_isUpdatingActiveTypes;
}

- (void)setIsUpdatingActiveTypes:(BOOL)a3
{
  self->_isUpdatingActiveTypes = a3;
}

- (VKCVisualSearchCornerView)visualSearchCornerButtonView
{
  return self->_visualSearchCornerButtonView;
}

- (void)setVisualSearchCornerButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_visualSearchCornerButtonView, a3);
}

- (void)setActionInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_actionInfoView, a3);
}

- (void)setActionInfoAnalysisButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionInfoAnalysisButton, a3);
}

- (void)setActionInfoCornerButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_actionInfoCornerButtonView, a3);
}

- (BOOL)wantsTranslucentActionInfoButtons
{
  return self->_wantsTranslucentActionInfoButtons;
}

- (NSArray)actionButtons
{
  return self->_actionButtons;
}

- (void)setActionButtons:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtons, a3);
}

- (BOOL)_manuallyManagesActionInfoButtons
{
  return self->__manuallyManagesActionInfoButtons;
}

- (VKInteractionAnalyticsDelegate)_analyticsDelegate
{
  return (VKInteractionAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->__analyticsDelegate);
}

- (void)set_analyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__analyticsDelegate, a3);
}

- (BOOL)didInteractWithVisualSearchItem
{
  return self->_didInteractWithVisualSearchItem;
}

- (void)setDidInteractWithVisualSearchItem:(BOOL)a3
{
  self->_didInteractWithVisualSearchItem = a3;
}

- (BOOL)forceAnalysisBarButtonItemEnabled
{
  return self->_forceAnalysisBarButtonItemEnabled;
}

- (BOOL)didToggleAAButton
{
  return self->_didToggleAAButton;
}

- (void)setDidToggleAAButton:(BOOL)a3
{
  self->_didToggleAAButton = a3;
}

- (double)visibleTextAreaThreshold
{
  return self->_visibleTextAreaThreshold;
}

- (void)setVisibleTextAreaThreshold:(double)a3
{
  self->_visibleTextAreaThreshold = a3;
}

- (VKAnalyticsSessionAccumulator)analyticsSession
{
  return self->_analyticsSession;
}

- (void)setAnalyticsSession:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsSession, a3);
}

- (VKAnalyticsProcessor)analyticsProcessor
{
  return self->_analyticsProcessor;
}

- (void)setAnalyticsProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsProcessor, a3);
}

- (unint64_t)analyticsTimeoutIndex
{
  return self->_analyticsTimeoutIndex;
}

- (void)setAnalyticsTimeoutIndex:(unint64_t)a3
{
  self->_analyticsTimeoutIndex = a3;
}

- (BOOL)buttonsVisible
{
  return self->_buttonsVisible;
}

- (BOOL)didLogAnalysisButtonVisible
{
  return self->_didLogAnalysisButtonVisible;
}

- (void)setDidLogAnalysisButtonVisible:(BOOL)a3
{
  self->_didLogAnalysisButtonVisible = a3;
}

- (BOOL)deriveQuickActionsVisibilityFromState
{
  return self->_deriveQuickActionsVisibilityFromState;
}

- (void)setDeriveQuickActionsVisibilityFromState:(BOOL)a3
{
  self->_deriveQuickActionsVisibilityFromState = a3;
}

- (unint64_t)interactionTypesSetByClient
{
  return self->_interactionTypesSetByClient;
}

- (void)setInteractionTypesSetByClient:(unint64_t)a3
{
  self->_interactionTypesSetByClient = a3;
}

- (BOOL)_isInPublicAutomaticMode
{
  return self->__isInPublicAutomaticMode;
}

- (void)set_isInPublicAutomaticMode:(BOOL)a3
{
  self->__isInPublicAutomaticMode = a3;
}

- (BOOL)_publicAPIDelegateExists
{
  return self->__publicAPIDelegateExists;
}

- (void)set_publicAPIDelegateExists:(BOOL)a3
{
  self->__publicAPIDelegateExists = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsProcessor, 0);
  objc_storeStrong((id *)&self->_analyticsSession, 0);
  objc_destroyWeak((id *)&self->__analyticsDelegate);
  objc_storeStrong((id *)&self->_actionButtons, 0);
  objc_storeStrong((id *)&self->_actionInfoCornerButtonView, 0);
  objc_storeStrong((id *)&self->_actionInfoAnalysisButton, 0);
  objc_storeStrong((id *)&self->_actionInfoView, 0);
  objc_storeStrong((id *)&self->_visualSearchCornerButtonView, 0);
  objc_storeStrong((id *)&self->_baseView, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_baseViewConstraints, 0);
  objc_storeStrong(&self->_quickActionConfigurationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_actionInfoCustomFont, 0);
  objc_storeStrong((id *)&self->_feedbackGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_analysisButton, 0);
  objc_storeStrong((id *)&self->_analysisBarButtonItem, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)generatePlistsForScalingAndAlignment
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 15);
  -[VKCImageAnalysisInteraction view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  +[VKCMockHelper plistFromSize:](VKCMockHelper, "plistFromSize:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, VKCMockResultLayoutBoundsKey);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(&unk_1E9495578, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(&unk_1E9495578);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11), "integerValue");
        v13 = v12;
        if (v12 > 0xC)
          v14 = 0;
        else
          v14 = off_1E9465D38[v12];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCImageAnalysisInteraction view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setContentMode:", v13);

        -[VKCImageAnalysisInteraction baseView](self, "baseView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "textSelectionView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "quadsForAllWordsForCurrentLayout");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(&unk_1E9495578, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }
  return v3;
}

@end

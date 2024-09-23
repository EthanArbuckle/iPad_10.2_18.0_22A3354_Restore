@implementation VKCCornerLookupButton

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (!self->_observingInteractionDidFinish)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    getkDDRVInteractionDidFinishNotification();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  }
  v5.receiver = self;
  v5.super_class = (Class)VKCCornerLookupButton;
  -[VKCCornerLookupButton dealloc](&v5, sel_dealloc);
}

- (VKCCornerLookupButton)initWithFrame:(CGRect)a3 resultItem:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  VKCCornerLookupButton *v10;
  VKCCornerLookupButton *v11;
  void *v12;
  double v13;
  double v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VKCCornerLookupButton;
  v10 = -[VKCCornerLookupButton initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[VKCCornerLookupButton setResultItem:](v10, "setResultItem:", v9);
    -[VKCCornerLookupButton _setupGestures](v11, "_setupGestures");
    -[VKCCornerLookupButton setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("com.apple.visionkit.visualSearchCornerIndicator"));
    if (objc_msgSend(MEMORY[0x1E0CEA508], "vk_isiPad"))
    {
      -[VKCCornerLookupButton traitCollection](v11, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "vk_hasCompactWidth"))
        v13 = 32.0;
      else
        v13 = 40.0;

    }
    else
    {
      v13 = 32.0;
    }
    v11->_buttonWidth = v13;
    v11->_buttonHeight = v13;
    -[VKCCornerLookupButton cornerButtonSize](v11, "cornerButtonSize");
    -[VKCCornerLookupButton setFrame:](v11, "setFrame:", 0.0, 0.0, v14, v14);
    -[VKCCornerLookupButton _setupButton](v11, "_setupButton");
  }

  return v11;
}

- (void)didMoveToWindow
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 isShowingVisualResultsPane;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  CGPoint v13;
  CGRect v14;

  -[VKCCornerLookupButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (v12 = v3,
        v4 = -[VKCCornerLookupButton shouldShowResultWhenVisible](self, "shouldShowResultWhenVisible"),
        v3 = v12,
        v4))
  {
    isShowingVisualResultsPane = self->_isShowingVisualResultsPane;

    if (!isShowingVisualResultsPane)
    {
      -[VKCCornerLookupButton bounds](self, "bounds");
      -[VKCCornerLookupButton convertPoint:toView:](self, "convertPoint:toView:", 0);
      v7 = v6;
      v9 = v8;
      -[VKCCornerLookupButton window](self, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v13.x = v7;
      v13.y = v9;
      v11 = CGRectContainsPoint(v14, v13);

      if (v11)
        -[VKCCornerLookupButton showVisualSearchResultView](self, "showVisualSearchResultView");
    }
  }
  else
  {

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[VKCCornerLookupButton tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (void)_setupGestures
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", self);
  -[VKCCornerLookupButton addInteraction:](self, "addInteraction:", v3);

}

- (id)imageForButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CEA638];
  -[VKCCornerLookupButton _symbolNameForItem](self, "_symbolNameForItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_symbolImageWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CEA638];
    -[VKCCornerLookupButton _defaultSymbolName](self, "_defaultSymbolName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vk_symbolImageWithName:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_symbolNameForItem
{
  void *v2;
  void *v3;

  -[VKCCornerLookupButton resultItem](self, "resultItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "glyphName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_defaultSymbolName
{
  return CFSTR("doc.text.magnifyingglass");
}

- (id)_backgroundColorBehindText
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
}

- (void)_setupButton
{
  UIButton *v3;
  UIButton *button;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  -[VKCCornerLookupButton imageForButton](self, "imageForButton");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  button = self->_button;
  self->_button = v3;

  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_didTap, 64);
  objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setConfiguration:](self->_button, "setConfiguration:", v5);
  if (objc_msgSend(MEMORY[0x1E0CEA508], "vk_isiPhone"))
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB550]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](self->_button, "setPreferredSymbolConfiguration:forImageInState:", v7, 0);

  }
  -[UIButton setImage:forState:](self->_button, "setImage:forState:", v12, 0);
  -[VKCCornerLookupButton cornerButtonSize](self, "cornerButtonSize");
  v9 = v8;
  -[UIButton setFrame:](self->_button, "setFrame:", 0.0, 0.0, v9, v9);
  -[VKCCornerLookupButton addSubview:](self, "addSubview:", self->_button);
  -[VKCCornerLookupButton updateIndicatorDotForState](self, "updateIndicatorDotForState");
  -[VKCCornerLookupButton layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMasksToBounds:", 1);

  -[VKCCornerLookupButton layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", v9 * 0.5);

}

- (double)cornerButtonSize
{
  double v3;
  double v4;
  double v5;

  -[VKCCornerLookupButton contentSizeScaleFactor](self, "contentSizeScaleFactor");
  v4 = v3;
  -[VKCCornerLookupButton buttonWidth](self, "buttonWidth");
  return v4 * v5;
}

- (double)contentSizeScaleFactor
{
  void *v2;
  double v3;
  double v4;

  -[VKCCornerLookupButton traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vk_contentSizeScaleFactor");
  v4 = v3;

  return fmax(v4, 1.0);
}

- (void)_updateImage
{
  id v3;

  if (self->_isShowingVisualResultsPane)
    -[VKCCornerLookupButton _backgroundColorBehindText](self, "_backgroundColorBehindText");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton vk_setTintColor:](self->_button, "vk_setTintColor:", v3);

}

- (void)updateIndicatorDotForState
{
  id v3;

  -[VKCCornerLookupButton _updateImage](self, "_updateImage");
  if (self->_isShowingVisualResultsPane)
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.569, 1.0, 1.0);
  else
    -[VKCCornerLookupButton _backgroundColorBehindText](self, "_backgroundColorBehindText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setVk_backgroundColor:](self, "setVk_backgroundColor:", v3);

}

- (void)didTap
{
  void *v3;

  if (!self->_isShowingVisualResultsPane)
  {
    -[VKCCornerLookupButton resultItem](self, "resultItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCurrentInvocationType:", 1);

    -[VKCCornerLookupButton showVisualSearchResultView](self, "showVisualSearchResultView");
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setShouldShowResultWhenVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 isShowingVisualResultsPane;

  v3 = a3;
  self->_shouldShowResultWhenVisible = a3;
  -[VKCCornerLookupButton window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v3)
  {
    isShowingVisualResultsPane = self->_isShowingVisualResultsPane;

    if (!isShowingVisualResultsPane)
      -[VKCCornerLookupButton showVisualSearchResultView](self, "showVisualSearchResultView");
  }
  else
  {

  }
}

- (void)showVisualSearchResultView
{
  void *v3;

  self->_isShowingVisualResultsPane = 1;
  -[VKCCornerLookupButton showLookupUIPaneForResultItem](self, "showLookupUIPaneForResultItem");
  -[VKCCornerLookupButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lookupButton:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self, 0.0, 0.0, 1.0, 1.0);

  -[VKCCornerLookupButton updateIndicatorDotForState](self, "updateIndicatorDotForState");
}

- (void)didDismissVisualResultsPane
{
  void *v3;

  self->_isShowingVisualResultsPane = 0;
  -[VKCCornerLookupButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lookupButtonDidDismissController:", self);

  -[VKCCornerLookupButton updateIndicatorDotForState](self, "updateIndicatorDotForState");
}

- (id)_queryString
{
  void *v2;
  void *v3;

  VKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("VK_RESULTS_LOOKUP_PANEL_TITLE"), CFSTR("VK_RESULTS_LOOKUP_PANEL_TITLE"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)queryForProcessingResult
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  v3 = +[VKCImageAnalyzerRequest newQueryIDForParsec](VKCImageAnalyzerRequest, "newQueryIDForParsec");
  v4 = objc_alloc(MEMORY[0x1E0D87C68]);
  -[VKCCornerLookupButton _queryString](self, "_queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke;
  v8[3] = &unk_1E94622B8;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = v3;
  v6 = (void *)objc_msgSend(v4, "initWithTitle:clientIdentifier:userAgent:queryID:queryProvider:", v5, CFSTR("com.apple.mediaanalysisd"), CFSTR("VisualIntelligence/1"), v3, v8);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return v6;
}

void __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint8_t v24[16];
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (a2 && a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSObject didProcessResult](WeakRetained, "didProcessResult") & 1) != 0)
      {
        -[NSObject resultItem](WeakRetained, "resultItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "searchItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "searchSections");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v13, 0);

        -[NSObject delegate](WeakRetained, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lookupButton:didProcessResultWithDuration:", WeakRetained, 0.0);

        +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 48);
        -[NSObject resultItem](WeakRetained, "resultItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "queryID");
        -[NSObject resultItem](WeakRetained, "resultItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "didShowVisualSearchCachedResultsForQueryID:cachedResultQueryID:item:", v16, v18, v19);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject resultItem](WeakRetained, "resultItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 48);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_2;
        v25[3] = &unk_1E9462290;
        v26 = v10;
        v27 = WeakRetained;
        v29 = *(_QWORD *)(a1 + 48);
        v28 = v8;
        objc_msgSend(v20, "generateVisualSearchResultForItems:queryID:completionHandler:", v22, v23, v25);

      }
    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    WeakRetained = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1D2E0D000, WeakRetained, OS_LOG_TYPE_INFO, "Server access was not permitted", v24, 2u);
    }
  }

}

void __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_3;
  v14[3] = &unk_1E9462268;
  v15 = v7;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v16 = v8;
  v17 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  v18 = v6;
  v20 = v11;
  v19 = v10;
  v12 = v6;
  v13 = v7;
  vk_performBlockOnMainThread(v14);

}

void __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_3(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_3_cold_1(v2, v3);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v6 = v5;

    objc_msgSend(*(id *)(a1 + 48), "setDidProcessResult:", 1);
    objc_msgSend(*(id *)(a1 + 48), "setResult:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 56), "resultItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "resultItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSearchItem:", v9);

    v11 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 48), "resultItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setQueryID:", v11);

    v13 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 48), "resultItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchSections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v16, 0);

    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lookupButton:didProcessResultWithDuration:", *(_QWORD *)(a1 + 48), v6);

  }
}

- (void)showLookupUIPaneForResultItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  -[VKCCornerLookupButton queryForProcessingResult](self, "queryForProcessingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D87C60]);
  -[VKCCornerLookupButton _queryString](self, "_queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSearchQuery:rangeInContext:", v3, 0x7FFFFFFFFFFFFFFFLL, objc_msgSend(v5, "length"));

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__VKCCornerLookupButton_showLookupUIPaneForResultItem__block_invoke;
  v15[3] = &unk_1E94622E0;
  v15[4] = self;
  objc_msgSend(v6, "setReportAnIssueExtendedBlock:", v15);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCCornerLookupButton setCurrentRVItemID:](self, "setCurrentRVItemID:", v9);
  objc_msgSend(v6, "setClientHints:", v9);
  -[VKCCornerLookupButton delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addMetadataToVSFeedbackItem:", v6);

  if (!-[VKCCornerLookupButton observingInteractionDidFinish](self, "observingInteractionDidFinish"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getkDDRVInteractionDidFinishNotification();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__didDismissVisualResultsPane_, v12, 0);

    -[VKCCornerLookupButton setObservingInteractionDidFinish:](self, "setObservingInteractionDidFinish:", 1);
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v13 = (void *)getDDRevealBridgeClass_softClass;
  v20 = getDDRevealBridgeClass_softClass;
  if (!getDDRevealBridgeClass_softClass)
  {
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __getDDRevealBridgeClass_block_invoke;
    v16[3] = &unk_1E9462330;
    v16[4] = &v17;
    __getDDRevealBridgeClass_block_invoke((uint64_t)v16);
    v13 = (void *)v18[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v14, "performDefaultActionForRVItem:view:location:fallbackMenuInteraction:context:", v6, self, 0, MEMORY[0x1E0C9AA70], *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

void __54__VKCCornerLookupButton_showLookupUIPaneForResultItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userFeedbackPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitVisualSearchUserFeedbackForReportIdentifier:userFeedbackPayload:sfReportData:", v7, v9, v6);

}

- (void)_didDismissVisualResultsPane:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v5, (uint64_t)v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  objc_msgSend(v15, "clientHints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  VKDynamicCast(v7, (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[VKCCornerLookupButton currentRVItemID](self, "currentRVItemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      getkDDRVInteractionDidFinishNotification();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObserver:name:object:", self, v13, 0);

      -[VKCCornerLookupButton setObservingInteractionDidFinish:](self, "setObservingInteractionDidFinish:", 0);
      -[VKCCornerLookupButton setCurrentRVItemID:](self, "setCurrentRVItemID:", 0);
      self->_isShowingVisualResultsPane = 0;
      -[VKCCornerLookupButton delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lookupButtonDidDismissController:", self);

      -[VKCCornerLookupButton updateIndicatorDotForState](self, "updateIndicatorDotForState");
    }
  }

}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (VKCVisualSearchResultItem)resultItem
{
  return self->_resultItem;
}

- (void)setResultItem:(id)a3
{
  objc_storeStrong((id *)&self->_resultItem, a3);
}

- (VKCVisualSearchResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (VKCCornerLookupButtonDelegate)delegate
{
  return (VKCCornerLookupButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isShowingVisualResultsPane
{
  return self->_isShowingVisualResultsPane;
}

- (void)setIsShowingVisualResultsPane:(BOOL)a3
{
  self->_isShowingVisualResultsPane = a3;
}

- (NSString)currentRVItemID
{
  return self->_currentRVItemID;
}

- (void)setCurrentRVItemID:(id)a3
{
  objc_storeStrong((id *)&self->_currentRVItemID, a3);
}

- (BOOL)observingInteractionDidFinish
{
  return self->_observingInteractionDidFinish;
}

- (void)setObservingInteractionDidFinish:(BOOL)a3
{
  self->_observingInteractionDidFinish = a3;
}

- (BOOL)didProcessResult
{
  return self->_didProcessResult;
}

- (void)setDidProcessResult:(BOOL)a3
{
  self->_didProcessResult = a3;
}

- (BOOL)shouldShowResultWhenVisible
{
  return self->_shouldShowResultWhenVisible;
}

- (double)buttonWidth
{
  return self->_buttonWidth;
}

- (void)setButtonWidth:(double)a3
{
  self->_buttonWidth = a3;
}

- (double)buttonHeight
{
  return self->_buttonHeight;
}

- (void)setButtonHeight:(double)a3
{
  self->_buttonHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRVItemID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_resultItem, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

void __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Could not process analysis result with error: %@", (uint8_t *)&v3, 0xCu);
}

@end

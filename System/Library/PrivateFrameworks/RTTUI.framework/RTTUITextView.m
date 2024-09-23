@implementation RTTUITextView

- (RTTUITextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  RTTUITextView *v4;
  RTTUITextView *v5;
  void *v6;
  int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RTTUITextView;
  v4 = -[RTTUITextView initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[RTTUITextView setKeyboardType:](v4, "setKeyboardType:", 1);
    -[RTTUITextView _loadTTYAbbreviations](v5, "_loadTTYAbbreviations");
    objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rttInlineAbbreviationBarEnabled");

    if (v7)
    {
      -[RTTUITextView _showInlineRTTAbbreviations:](v5, "_showInlineRTTAbbreviations:", 1);
    }
    else
    {
      -[RTTUITextView _setupOverlayPredictions](v5, "_setupOverlayPredictions");
      v5->_showTTYPredictions = 1;
      -[RTTUITextView setShowTTYPredictions:](v5, "setShowTTYPredictions:", 0);
    }
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[RTTUITextView setPredictionsCollectionView:](self, "setPredictionsCollectionView:", 0);
  -[RTTUITextView setTtyAbbreviations:](self, "setTtyAbbreviations:", 0);
  v4.receiver = self;
  v4.super_class = (Class)RTTUITextView;
  -[RTTUITextView dealloc](&v4, sel_dealloc);
}

- (void)_setupOverlayPredictions
{
  void *v3;
  void *v4;
  UICollectionViewFlowLayout *v5;
  UICollectionViewFlowLayout *flowLayout;
  id v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  UIView *v17;
  UIView *inputAccessoryPlaceholderView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__kbFrameChanged_, *MEMORY[0x24BDF7B70], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x24BDF7B78], 0);

  self->_currentKeyboardWidth = -1.0;
  v5 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x24BDF6908]);
  flowLayout = self->_flowLayout;
  self->_flowLayout = v5;

  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_flowLayout, "setMinimumInteritemSpacing:", 3.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_flowLayout, "setMinimumLineSpacing:", 1.0);
  -[UICollectionViewFlowLayout setScrollDirection:](self->_flowLayout, "setScrollDirection:", 1);
  v7 = objc_alloc(MEMORY[0x24BDF68D8]);
  -[RTTUITextView _predictionsCellHeight](self, "_predictionsCellHeight");
  v24 = (id)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", self->_flowLayout, 0.0, 0.0, 768.0, v8);
  -[RTTUITextView setPredictionsCollectionView:](self, "setPredictionsCollectionView:", v24);
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDataSource:", self);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("ttyAbbreviationsCell"));

  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setScrollEnabled:", 0);

  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("TTYAbbreviationsBar"));

  -[RTTUITextView setIsHandlingKeyboardFrameChanged:](self, "setIsHandlingKeyboardFrameChanged:", 0);
  v16 = objc_alloc(MEMORY[0x24BDF6F90]);
  v17 = (UIView *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  inputAccessoryPlaceholderView = self->_inputAccessoryPlaceholderView;
  self->_inputAccessoryPlaceholderView = v17;

  -[UIView setUserInteractionEnabled:](self->_inputAccessoryPlaceholderView, "setUserInteractionEnabled:", 0);
  -[UIView setAlpha:](self->_inputAccessoryPlaceholderView, "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_inputAccessoryPlaceholderView, "setBackgroundColor:", v19);

  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAutoresizesSubviews:", 1);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", self, sel__didPanPredictions_);
  objc_msgSend(v21, "setDelegate:", self);
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addGestureRecognizer:", v21);

  -[RTTUITextView reloadInputViews](self, "reloadInputViews");
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "reloadData");

}

- (double)ttyBarHeight
{
  void *v3;
  char v4;
  double v5;
  void *v6;
  void *v7;
  double Height;
  float v9;
  CGRect v11;

  objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rttInlineAbbreviationBarEnabled");

  v5 = 0.0;
  if ((v4 & 1) == 0)
  {
    -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isHidden") & 1) == 0)
    {
      -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "frame");
      Height = CGRectGetHeight(v11);
      -[RTTUITextView _predictionsCellBuffer](self, "_predictionsCellBuffer");
      v5 = Height + v9;

    }
  }
  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;

  objc_msgSend(a3, "cellForItemAtIndexPath:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTUITextView _tapTTYBarCell:](self, "_tapTTYBarCell:", v5);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  int64_t v12;

  -[RTTUITextView ttyAbbreviations](self, "ttyAbbreviations", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[RTTUITextView text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
    return v6;
  -[RTTUITextView ttyAbbreviations](self, "ttyAbbreviations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexesOfObjectsPassingTest:", &__block_literal_global_3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  return v12;
}

uint64_t __55__RTTUITextView_collectionView_numberOfItemsInSection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKey:", CFSTR("requiresStringContent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue") ^ 1;

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("ttyAbbreviationsCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUITextView ttyAbbreviations](self, "ttyAbbreviations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUITextView text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(v8, "indexesOfObjectsPassingTest:", &__block_literal_global_217);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectsAtIndexes:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  v13 = objc_msgSend(v8, "count");
  if (v13 > objc_msgSend(v6, "row"))
  {
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAbbreviationData:", v14);

  }
  return v7;
}

uint64_t __55__RTTUITextView_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKey:", CFSTR("requiresStringContent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue") ^ 1;

  return v3;
}

- (void)_didPanPredictions:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  id v15;

  v15 = a3;
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "state") == 3)
  {
    objc_msgSend(v15, "translationInView:", v4);
    v6 = v5;
    objc_msgSend(v15, "velocityInView:", v4);
    v8 = self->_panContentOffset.x + v7 * -0.25 - v6;
    objc_msgSend(v4, "contentSize");
    v10 = v9 + -1.0;
    if (v8 < v10)
      v10 = v8;
    objc_msgSend(v4, "indexPathForItemAtPoint:", fmax(v10, 0.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_leftIndex = objc_msgSend(v11, "row");
    -[RTTUITextView _updateTTYBarPosition](self, "_updateTTYBarPosition");

  }
  else
  {
    if (objc_msgSend(v15, "state") == 1)
    {
      objc_msgSend(v4, "contentOffset");
      self->_panContentOffset.x = v12;
      self->_panContentOffset.y = v13;
    }
    objc_msgSend(v15, "translationInView:", v4);
    objc_msgSend(v4, "setContentOffset:", self->_panContentOffset.x - v14, 0.0);
  }

}

- (void)_didSwipeLeft:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;

  v4 = self->_leftIndex + -[RTTUITextView _predictionsPerPage](self, "_predictionsPerPage", a3);
  self->_leftIndex = v4;
  -[RTTUITextView ttyAbbreviations](self, "ttyAbbreviations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 >= v6)
  {
    -[RTTUITextView ttyAbbreviations](self, "ttyAbbreviations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    self->_leftIndex = v8 - -[RTTUITextView _predictionsPerPage](self, "_predictionsPerPage");

  }
  -[RTTUITextView _updateTTYBarPosition](self, "_updateTTYBarPosition");
}

- (void)_kbFrameChanged:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  if (!-[RTTUITextView isHandlingKeyboardFrameChanged](self, "isHandlingKeyboardFrameChanged"))
  {
    -[RTTUITextView setIsHandlingKeyboardFrameChanged:](self, "setIsHandlingKeyboardFrameChanged:", 1);
    objc_msgSend(v8, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BDF7A20]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CGRectValue");
    v7 = v6;

    if (-[RTTUITextView _shouldShowTTYPredictions](self, "_shouldShowTTYPredictions"))
    {
      if (self->_currentKeyboardWidth != v7)
        -[RTTUITextView updateTTYBar](self, "updateTTYBar");
    }
    else
    {
      -[RTTUITextView setShowTTYPredictions:](self, "setShowTTYPredictions:", 0);
    }
    -[RTTUITextView setIsHandlingKeyboardFrameChanged:](self, "setIsHandlingKeyboardFrameChanged:", 0);

  }
}

- (void)_keyboardWillHide:(id)a3
{
  self->_showTTYPredictions = 0;
  -[UICollectionView setHidden:](self->_predictionsCollectionView, "setHidden:", 1);
  -[UIView setHidden:](self->_iPadBufferView, "setHidden:", 1);
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_gaButtonPressed_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (id)inputAccessoryView
{
  void *v3;
  char v4;
  UIView *v5;

  objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rttInlineAbbreviationBarEnabled");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[RTTUITextView _resetTTYBarPosition](self, "_resetTTYBarPosition");
    -[RTTUITextView _updateTTYBarFrame](self, "_updateTTYBarFrame");
    v5 = self->_inputAccessoryPlaceholderView;
  }
  return v5;
}

- (BOOL)disableInputBars
{
  void *v3;
  char v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rttInlineAbbreviationBarEnabled");

  if ((v4 & 1) != 0 || !self->_showTTYPredictions)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "accessibilityUsesExtendedKeyboardPredictionsEnabled") ^ 1;

  }
  return v6;
}

- (void)overrideTTYPredictionsHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rttInlineAbbreviationBarEnabled");

  if ((v6 & 1) == 0 && self->_showTTYPredictions == v3)
  {
    self->_showTTYPredictions = !v3;
    -[RTTUITextView _resetTTYBarPosition](self, "_resetTTYBarPosition");
    -[RTTUITextView updateTTYBar](self, "updateTTYBar");
  }
}

- (void)_showInlineRTTAbbreviations:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  RTTUIAbbreviationViewContainer *v20;
  float v21;
  RTTUIAbbreviationViewContainer *v22;
  void *v23;
  RTTUIAbbreviationViewContainer *v24;
  double v25;
  float v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  RTTUIAbbreviationViewContainer *v30;
  uint64_t *v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;

  v3 = a3;
  -[RTTUITextView inputAssistantItem](self, "inputAssistantItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "trailingBarButtonGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ax_containsObjectUsingBlock:", &__block_literal_global_226);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v6, "_setShowsBarButtonItemsInline:", 1);
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "userInterfaceIdiom");

      if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        objc_msgSend(v6, "trailingBarButtonGroups");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      v17 = v16;

      if (v17 == 0.0)
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bounds");
        v17 = v19;

      }
      v20 = [RTTUIAbbreviationViewContainer alloc];
      -[RTTUITextView _predictionsCellHeight](self, "_predictionsCellHeight");
      v22 = -[RTTUIAbbreviationViewContainer initWithFrame:](v20, "initWithFrame:", 0.0, 0.0, v17, v21);
      -[RTTUIAbbreviationViewContainer setDelaysContentTouches:](v22, "setDelaysContentTouches:", 0);
      -[RTTUIAbbreviationViewContainer setShowsHorizontalScrollIndicator:](v22, "setShowsHorizontalScrollIndicator:", 0);
      -[RTTUIAbbreviationViewContainer setDirectionalLockEnabled:](v22, "setDirectionalLockEnabled:", 1);
      v32 = 0;
      v33 = (double *)&v32;
      v34 = 0x2020000000;
      v35 = 0;
      -[RTTUITextView ttyAbbreviations](self, "ttyAbbreviations");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __45__RTTUITextView__showInlineRTTAbbreviations___block_invoke_2;
      v29[3] = &unk_24D6580D0;
      v29[4] = self;
      v31 = &v32;
      v24 = v22;
      v30 = v24;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v29);

      v25 = v33[3];
      -[RTTUITextView _predictionsCellHeight](self, "_predictionsCellHeight");
      -[RTTUIAbbreviationViewContainer setContentSize:](v24, "setContentSize:", v25, v26);
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v24);
      objc_msgSend(v14, "addObject:", v27);

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6868]), "initWithBarButtonItems:representativeItem:", v14, 0);
      objc_msgSend(v28, "setAccessibilityIdentifier:", CFSTR("RTTGroup"));
      objc_msgSend(v12, "addObject:", v28);
      objc_msgSend(v6, "setLeadingBarButtonGroups:", MEMORY[0x24BDBD1A8]);
      objc_msgSend(v6, "setTrailingBarButtonGroups:", v12);

      _Block_object_dispose(&v32, 8);
    }
  }
  else
  {
    objc_msgSend(v5, "_setShowsBarButtonItemsInline:", 0);
    v13 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v6, "setTrailingBarButtonGroups:", MEMORY[0x24BDBD1A8]);
    objc_msgSend(v6, "setLeadingBarButtonGroups:", v13);
  }

}

uint64_t __45__RTTUITextView__showInlineRTTAbbreviations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("RTTGroup"));

  return v3;
}

void __45__RTTUITextView__showInlineRTTAbbreviations___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  RTTUIAbbreviationView *v6;
  float v7;
  double v8;
  double v9;
  double v10;
  float v11;
  RTTAbbreviationTapGestureRecognizer *v12;
  RTTUIAbbreviationView *v13;

  v5 = a2;
  v6 = [RTTUIAbbreviationView alloc];
  v13 = -[RTTUIAbbreviationView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[RTTUIAbbreviationView setAbbreviationData:](v13, "setAbbreviationData:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_predictionsCellHeight");
  -[RTTUIAbbreviationView sizeThatFits:](v13, "sizeThatFits:", 0.0, v7);
  v9 = v8;
  v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "_predictionsCellHeight");
  -[RTTUIAbbreviationView setFrame:](v13, "setFrame:", v10, 0.0, v9, v11);
  -[RTTUIAbbreviationView setDrawLeftBorder:](v13, "setDrawLeftBorder:", a3 != 0);
  v12 = -[RTTAbbreviationTapGestureRecognizer initWithTarget:action:]([RTTAbbreviationTapGestureRecognizer alloc], "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel__inlineTTYAbbreviationSelected_);
  -[RTTAbbreviationTapGestureRecognizer setAbbrevationView:](v12, "setAbbrevationView:", v13);
  -[RTTUIAbbreviationView addGestureRecognizer:](v13, "addGestureRecognizer:", v12);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v13);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);

}

- (void)_inlineTTYAbbreviationSelected:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v19 = v4;
  objc_msgSend(v4, "abbreviationText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ "), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTUITextView _insertWhitespaceIfNeeded](self, "_insertWhitespaceIfNeeded");
  -[RTTUITextView insertText:](self, "insertText:", v7);
  -[RTTUITextView setShowTTYPredictions:](self, "setShowTTYPredictions:", 0);
  -[RTTUITextView inputAssistantItem](self, "inputAssistantItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingBarButtonGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ax_containsObjectUsingBlock:", &__block_literal_global_242);

  if (v10)
  {
    -[RTTUITextView inputAssistantItem](self, "inputAssistantItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingBarButtonGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "barButtonItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "customView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);
    -[RTTUITextView inputAssistantItem](self, "inputAssistantItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setShowsBarButtonItemsInline:", 0);

    -[RTTUITextView reloadInputViews](self, "reloadInputViews");
    -[RTTUITextView inputAssistantItem](self, "inputAssistantItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setShowsBarButtonItemsInline:", 1);

    -[RTTUITextView reloadInputViews](self, "reloadInputViews");
  }

}

uint64_t __48__RTTUITextView__inlineTTYAbbreviationSelected___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("RTTGroup"));

  return v3;
}

- (void)setShowTTYPredictions:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  _BOOL4 v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rttInlineAbbreviationBarEnabled");

  if ((v6 & 1) == 0 && self->_showTTYPredictions != v3)
  {
    if (v3 && -[RTTUITextView _shouldShowTTYPredictions](self, "_shouldShowTTYPredictions"))
      LOBYTE(v7) = 1;
    else
      v7 = !-[RTTUITextView _isKeyboardPredictionsEnabled](self, "_isKeyboardPredictionsEnabled");
    self->_showTTYPredictions = v7;
    -[RTTUITextView _resetTTYBarPosition](self, "_resetTTYBarPosition");
    -[RTTUITextView updateTTYBar](self, "updateTTYBar");
  }
}

- (BOOL)_shouldShowTTYPredictions
{
  if ((objc_msgSend(MEMORY[0x24BDF6B38], "isSplit") & 1) != 0)
    return 0;
  else
    return objc_msgSend(MEMORY[0x24BDF6B38], "isFloating") ^ 1;
}

- (BOOL)_isKeyboardPredictionsEnabled
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;

  v2 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("KeyboardShowPredictionBar"), CFSTR("com.apple.Preferences"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (!v2)
    return 1;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  v5 = v4 != CFBooleanGetTypeID() || CFBooleanGetValue(v3) != 0;
  CFRelease(v3);
  return v5;
}

- (void)_updateBlackBarPositioning
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  void *v10;
  double v11;
  double v12;
  float v13;
  void *v14;
  double v15;
  double v16;
  float v17;
  id v18;

  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v5 + v7 + -1.0;
  -[RTTUITextView _predictionsCellHeight](self, "_predictionsCellHeight");
  -[UIView setFrame:](self->_rightBackgroundColorEdge, "setFrame:", v8, 0.0, 1.0, v9);

  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentOffset");
  v12 = v11;
  -[RTTUITextView _predictionsCellHeight](self, "_predictionsCellHeight");
  -[UIView setFrame:](self->_leftBackgroundColorEdge, "setFrame:", v12, 0.0, 1.0, v13);

  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentOffset");
  v16 = v5 * 0.5 + v15 + -2.0;
  -[RTTUITextView _predictionsCellHeight](self, "_predictionsCellHeight");
  -[UIView setFrame:](self->_middleBackgroundColorEdge, "setFrame:", v16, 0.0, 4.0, v17);

  -[UIView superview](self->_middleBackgroundColorEdge, "superview");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendSubviewToBack:", self->_middleBackgroundColorEdge);

}

- (void)updateTTYBar
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _Unwind_Exception *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rttInlineAbbreviationBarEnabled");

  if ((v4 & 1) == 0)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v5 = getAXUIKeyboardIsOnScreenSymbolLoc_ptr_0;
    v24 = getAXUIKeyboardIsOnScreenSymbolLoc_ptr_0;
    if (!getAXUIKeyboardIsOnScreenSymbolLoc_ptr_0)
    {
      v6 = (void *)AccessibilityUIUtilitiesLibrary();
      v5 = dlsym(v6, "AXUIKeyboardIsOnScreen");
      v22[3] = (uint64_t)v5;
      getAXUIKeyboardIsOnScreenSymbolLoc_ptr_0 = v5;
    }
    _Block_object_dispose(&v21, 8);
    if (v5)
    {
      if (!((unsigned int (*)(uint64_t))v5)(v7))
        goto LABEL_10;
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v8 = getAXUIKeyboardScreenFrameSymbolLoc_ptr;
      v24 = getAXUIKeyboardScreenFrameSymbolLoc_ptr;
      if (!getAXUIKeyboardScreenFrameSymbolLoc_ptr)
      {
        v9 = (void *)AccessibilityUIUtilitiesLibrary();
        v8 = dlsym(v9, "AXUIKeyboardScreenFrame");
        v22[3] = (uint64_t)v8;
        getAXUIKeyboardScreenFrameSymbolLoc_ptr = v8;
      }
      _Block_object_dispose(&v21, 8);
      if (v8)
      {
        ((void (*)(uint64_t))v8)(v10);
        if (v11 != 0.0)
        {
          -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView", v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "window");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "superview");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "bringSubviewToFront:", v18);
          }
          else
          {
            -[RTTUITextView window](self, "window");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "rootViewController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "view");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addSubview:", v19);

          }
          -[RTTUITextView reloadInputViews](self, "reloadInputViews");
          -[RTTUITextView _updateTTYBarFrame](self, "_updateTTYBarFrame");
          -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "reloadData");
          goto LABEL_13;
        }
LABEL_10:
        AXLogRTT();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_216E9C000, v12, OS_LOG_TYPE_DEFAULT, "No keyboard on screen, removing predictions", (uint8_t *)&v21, 2u);
        }

        -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeFromSuperview");
LABEL_13:

        return;
      }
    }
    else
    {
      -[RTTUIConversationControllerCoordinator registerForCallUpdates:].cold.1();
    }
    v20 = (_Unwind_Exception *)-[RTTUIConversationControllerCoordinator registerForCallUpdates:].cold.1();
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v20);
  }
}

- (void)_updateTTYBarFrame
{
  void *v3;
  double v4;
  double currentKeyboardWidth;
  double v6;
  float v7;
  void *v8;
  UIView *inputAccessoryPlaceholderView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  float v30;
  double v31;
  double v32;
  float v33;
  double v34;
  void *v35;
  UIView *v36;
  UIView *iPadBufferView;
  UIView *v38;
  void *v39;
  CGFloat v40;
  void *v41;
  void *v42;
  void *v43;
  UIView *v44;
  double MaxY;
  double v46;
  double MinY;
  UIView *v48;
  void *v49;
  void *v50;
  void *v51;
  UIView *leftBackgroundColorEdge;
  id v53;
  double v54;
  double v55;
  double v56;
  double v57;
  UIView *v58;
  UIView *v59;
  void *v60;
  UIView *v61;
  UIView *rightBackgroundColorEdge;
  void *v63;
  UIView *v64;
  UIView *middleBackgroundColorEdge;
  void *v66;
  CGFloat rect;
  void *recta;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  self->_currentKeyboardWidth = v4;

  currentKeyboardWidth = self->_currentKeyboardWidth;
  if (currentKeyboardWidth > 0.0)
  {
    v6 = currentKeyboardWidth / (double)-[RTTUITextView _predictionsPerPage](self, "_predictionsPerPage") + -1.0;
    -[RTTUITextView _predictionsCellHeight](self, "_predictionsCellHeight");
    -[UICollectionViewFlowLayout setItemSize:](self->_flowLayout, "setItemSize:", v6, v7);
  }
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", !self->_showTTYPredictions);

  inputAccessoryPlaceholderView = self->_inputAccessoryPlaceholderView;
  -[UIView bounds](inputAccessoryPlaceholderView, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](inputAccessoryPlaceholderView, "convertRect:toView:", v19, v11, v13, v15, v17);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[RTTUITextView _predictionsCellHeight](self, "_predictionsCellHeight");
  v29 = v23 - v28;
  -[RTTUITextView _predictionsCellBuffer](self, "_predictionsCellBuffer");
  v31 = v29 - v30;
  v32 = self->_currentKeyboardWidth;
  -[RTTUITextView _predictionsCellHeight](self, "_predictionsCellHeight");
  v34 = v33;
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v21, v31, v32, v34);

  if (!objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad"))
  {
    -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "superview");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      leftBackgroundColorEdge = self->_leftBackgroundColorEdge;

      if (leftBackgroundColorEdge)
      {
LABEL_15:
        -[RTTUITextView _updateBlackBarPositioning](self, "_updateBlackBarPositioning");
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.15, 0.15, 0.15, 1.0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_alloc(MEMORY[0x24BDF6F90]);
      v54 = *MEMORY[0x24BDBF090];
      v55 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v56 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v57 = *(double *)(MEMORY[0x24BDBF090] + 24);
      v58 = (UIView *)objc_msgSend(v53, "initWithFrame:", *MEMORY[0x24BDBF090], v55, v56, v57);
      v59 = self->_leftBackgroundColorEdge;
      self->_leftBackgroundColorEdge = v58;

      -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addSubview:", self->_leftBackgroundColorEdge);

      -[UIView setBackgroundColor:](self->_leftBackgroundColorEdge, "setBackgroundColor:", v50);
      v61 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v54, v55, v56, v57);
      rightBackgroundColorEdge = self->_rightBackgroundColorEdge;
      self->_rightBackgroundColorEdge = v61;

      -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "addSubview:", self->_rightBackgroundColorEdge);

      -[UIView setBackgroundColor:](self->_rightBackgroundColorEdge, "setBackgroundColor:", v50);
      v64 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v54, v55, v56, v57);
      middleBackgroundColorEdge = self->_middleBackgroundColorEdge;
      self->_middleBackgroundColorEdge = v64;

      -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "insertSubview:atIndex:", self->_middleBackgroundColorEdge, 0);

      -[UIView setBackgroundColor:](self->_middleBackgroundColorEdge, "setBackgroundColor:", v50);
    }

    goto LABEL_15;
  }
  rect = v27;
  if (!self->_iPadBufferView)
  {
    v36 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    iPadBufferView = self->_iPadBufferView;
    self->_iPadBufferView = v36;

    v38 = self->_iPadBufferView;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.2, 0.5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v39);

  }
  v40 = v25;
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v41, "isHidden") & 1) != 0)
    goto LABEL_9;
  -[UIView superview](self->_iPadBufferView, "superview");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "superview");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", self->_iPadBufferView);

LABEL_9:
  }
  v44 = self->_iPadBufferView;
  v69.origin.x = v21;
  v69.origin.y = v31;
  v69.size.width = v32;
  v69.size.height = v34;
  MaxY = CGRectGetMaxY(v69);
  v46 = self->_currentKeyboardWidth;
  v70.origin.x = v21;
  v70.origin.y = v23;
  v70.size.width = v40;
  v70.size.height = rect;
  MinY = CGRectGetMinY(v70);
  v71.origin.x = v21;
  v71.origin.y = v31;
  v71.size.width = v32;
  v71.size.height = v34;
  -[UIView setFrame:](v44, "setFrame:", v21, MaxY, v46, MinY - CGRectGetMaxY(v71));
  v48 = self->_iPadBufferView;
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](v48, "setHidden:", objc_msgSend(v49, "isHidden"));

LABEL_16:
  -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
  recta = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(recta, "reloadData");

}

- (void)_resetTTYBarPosition
{
  void *v3;
  uint64_t v4;
  int64_t leftIndex;
  void *v6;
  id v7;

  self->_leftIndex = 0;
  if (self->_showTTYPredictions)
  {
    -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);
    leftIndex = self->_leftIndex;

    if (v4 > leftIndex)
    {
      -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", self->_leftIndex, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 8, 0);

    }
  }
}

- (void)_updateTTYBarPosition
{
  void *v3;
  void *v4;

  if (self->_showTTYPredictions)
  {
    -[RTTUITextView predictionsCollectionView](self, "predictionsCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", self->_leftIndex, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 8, 1);

    -[RTTUITextView _updateBlackBarPositioning](self, "_updateBlackBarPositioning");
  }
}

- (void)_tapTTYBarCell:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "abbreviationText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ "), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[RTTUITextView _insertWhitespaceIfNeeded](self, "_insertWhitespaceIfNeeded");
  -[RTTUITextView insertText:](self, "insertText:", v6);
  -[RTTUITextView setShowTTYPredictions:](self, "setShowTTYPredictions:", 0);

}

- (void)_insertWhitespaceIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[RTTUITextView beginningOfDocument](self, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUITextView selectedTextRange](self, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTTUITextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v3, v5);

  -[RTTUITextView text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v6 >= 1 && v6 - 1 < v8)
  {
    -[RTTUITextView text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "characterAtIndex:", v6 - 1);

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v11, "characterIsMember:", v10);

    if ((v10 & 1) == 0)
      -[RTTUITextView insertText:](self, "insertText:", CFSTR(" "));
  }
}

- (void)_loadTTYAbbreviations
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("TTYAbbreviationsOrder"), CFSTR("plist"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfFile:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(&unk_24D65DB88, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(&unk_24D65DB88);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v7);
        }
        objc_msgSend(v7, "stringByAppendingString:", CFSTR("_Abbrevation"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "localizedStringForKey:value:table:", v9, &stru_24D658230, CFSTR("TTYAbbreviations"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("abbr"));
        objc_msgSend(v7, "stringByAppendingString:", CFSTR("_Definition"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "localizedStringForKey:value:table:", v11, &stru_24D658230, CFSTR("TTYAbbreviations"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "length"))
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("hint"));

      }
      v5 = objc_msgSend(&unk_24D65DB88, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }
  objc_msgSend(v3, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __38__RTTUITextView__loadTTYAbbreviations__block_invoke;
  v22[3] = &unk_24D658118;
  v23 = v18;
  v14 = v18;
  objc_msgSend(v13, "sortedArrayUsingComparator:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsForKeys:notFoundMarker:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTUITextView setTtyAbbreviations:](self, "setTtyAbbreviations:", v17);
}

uint64_t __38__RTTUITextView__loadTTYAbbreviations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

- (float)_predictionsCellBuffer
{
  int v2;
  float result;

  v2 = objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad");
  result = 0.0;
  if (v2)
    return 5.0;
  return result;
}

- (float)_predictionsCellHeight
{
  float result;
  void *v3;
  double Width;
  CGRect v5;

  if ((objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad") & 1) != 0)
    return 50.0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v5);

  result = 38.0;
  if (Width > 320.0)
    return 39.0;
  return result;
}

- (int)_predictionsPerPage
{
  if (objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad"))
    return 3;
  else
    return 2;
}

- (id)accessibilityIdentifier
{
  return CFSTR("RTTUITextView");
}

- (BOOL)_accessibilityIsRealtimeElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTTUITextView;
  -[RTTUITextView accessibilityTraits](&v3, sel_accessibilityTraits);
  return _AXTraitsRemoveTrait();
}

- (BOOL)showTTYPredictions
{
  return self->_showTTYPredictions;
}

- (NSArray)ttyAbbreviations
{
  return self->_ttyAbbreviations;
}

- (void)setTtyAbbreviations:(id)a3
{
  objc_storeStrong((id *)&self->_ttyAbbreviations, a3);
}

- (UICollectionView)predictionsCollectionView
{
  return self->_predictionsCollectionView;
}

- (void)setPredictionsCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_predictionsCollectionView, a3);
}

- (BOOL)isHandlingKeyboardFrameChanged
{
  return self->_isHandlingKeyboardFrameChanged;
}

- (void)setIsHandlingKeyboardFrameChanged:(BOOL)a3
{
  self->_isHandlingKeyboardFrameChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionsCollectionView, 0);
  objc_storeStrong((id *)&self->_ttyAbbreviations, 0);
  objc_storeStrong((id *)&self->_iPadBufferView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryPlaceholderView, 0);
  objc_storeStrong((id *)&self->_middleBackgroundColorEdge, 0);
  objc_storeStrong((id *)&self->_rightBackgroundColorEdge, 0);
  objc_storeStrong((id *)&self->_leftBackgroundColorEdge, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
}

@end

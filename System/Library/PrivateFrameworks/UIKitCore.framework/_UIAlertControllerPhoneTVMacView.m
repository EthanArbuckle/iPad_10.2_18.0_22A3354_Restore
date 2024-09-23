@implementation _UIAlertControllerPhoneTVMacView

- (_UIAlertControllerPhoneTVMacView)initWithFrame:(CGRect)a3
{
  _UIAlertControllerPhoneTVMacView *v3;
  _UIAlertControllerPhoneTVMacView *v4;
  NSMutableArray *v5;
  NSMutableArray *actionViews;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    *(_WORD *)&v3->_alertControllerViewFlags &= ~0x200u;
    if (_UIAppUseModernRotationAndPresentationBehaviors())
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    else
    {
      -[UIView _setHostsLayoutEngine:](v4, "_setHostsLayoutEngine:", 1);
      -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    }
    -[_UIAlertControllerPhoneTVMacView _setLayoutSize:](v4, "_setLayoutSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v4->_presentationContextPrefersCancelActionShown = 1;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actionViews = v4->_actionViews;
    v4->_actionViews = v5;

    v4->_actionScrubbingEnabled = 1;
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIContentSizeCategoryDidChangeNotification");
  v6[1] = CFSTR("UIAccessibilityDarkerSystemColorsStatusDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[_UIAlertControllerPhoneTVMacView _updateActionViewVisualStyle:](self, "_updateActionViewVisualStyle:", 0);
  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  -[UIView dealloc](&v5, sel_dealloc);
}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[2];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v17[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceWhenContainedInInstancesOfClasses:](_UIAlertControllerPhoneTVMacView, "appearanceWhenContainedInInstancesOfClasses:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceWhenContainedInInstancesOfClasses:](_UIAlertControllerPhoneTVMacView, "appearanceWhenContainedInInstancesOfClasses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke(v3);
  __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke(v5);
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceWhenContainedInInstancesOfClasses:](_UIAlertControllerPhoneTVMacView, "appearanceWhenContainedInInstancesOfClasses:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceWhenContainedInInstancesOfClasses:](_UIAlertControllerPhoneTVMacView, "appearanceWhenContainedInInstancesOfClasses:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke_2(v7);
  __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke_2(v9);
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceWhenContainedInInstancesOfClasses:](_UIAlertControllerPhoneTVMacView, "appearanceWhenContainedInInstancesOfClasses:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  objc_msgSend(v12, "setPresentationContextPrefersCancelActionShown:", 1);
  objc_msgSend(v12, "setPresentedAsPopover:", 0);
  objc_msgSend(v12, "setShouldHaveBackdropView:", 1);

}

- (void)updateObservations:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__contentSizeChanged, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__accessibilityColorsChanged, CFSTR("UIAccessibilityDarkerSystemColorsStatusDidChangeNotification"), 0);
  }
  else
  {
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIAccessibilityDarkerSystemColorsStatusDidChangeNotification"), 0);
  }

}

- (void)setAlertController:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_alertController, obj);
    v5 = obj;
    if (obj)
    {
      -[_UIAlertControllerPhoneTVMacView _prepareViewsAndAddConstraints](self, "_prepareViewsAndAddConstraints");
      v5 = obj;
    }
  }
  -[_UIAlertControllerPhoneTVMacView updateObservations:](self, "updateObservations:", v5);

}

- (id)alertController
{
  return objc_loadWeakRetained((id *)&self->_alertController);
}

- (void)_prepareViewsAndAddConstraints
{
  -[_UIAlertControllerPhoneTVMacView _prepareContentView](self, "_prepareContentView");
  -[_UIAlertControllerPhoneTVMacView _prepareMainInterfaceActionsGroupView](self, "_prepareMainInterfaceActionsGroupView");
  -[_UIAlertControllerPhoneTVMacView _prepareDiscreteCancelActionGroupView](self, "_prepareDiscreteCancelActionGroupView");
  -[_UIAlertControllerPhoneTVMacView _prepareContentViewTopItemsView](self, "_prepareContentViewTopItemsView");
  -[_UIAlertControllerPhoneTVMacView _prepareSeparateContentViewControllerContainerView](self, "_prepareSeparateContentViewControllerContainerView");
  -[_UIAlertControllerPhoneTVMacView _prepareHeaderContentViewControllerContainerView](self, "_prepareHeaderContentViewControllerContainerView");
  -[_UIAlertControllerPhoneTVMacView _prepareTitleLabel](self, "_prepareTitleLabel");
  -[_UIAlertControllerPhoneTVMacView _prepareMesssageLabel](self, "_prepareMesssageLabel");
  -[_UIAlertControllerPhoneTVMacView _prepareDetailMessageLabel](self, "_prepareDetailMessageLabel");
  -[_UIAlertControllerPhoneTVMacView _prepareContentViewControllerContainerView](self, "_prepareContentViewControllerContainerView");
  -[_UIAlertControllerPhoneTVMacView _prepareTextFieldViewControllerContainerView](self, "_prepareTextFieldViewControllerContainerView");
  -[_UIAlertControllerPhoneTVMacView _prepareDimmingView](self, "_prepareDimmingView");
  -[_UIAlertControllerPhoneTVMacView _prepareKeyboardLayoutAlignmentViews](self, "_prepareKeyboardLayoutAlignmentViews");
  -[_UIAlertControllerPhoneTVMacView _applyViewConstraints](self, "_applyViewConstraints");
  -[_UIAlertControllerPhoneTVMacView _applyHeaderContentViewControllerContainerViewConstraints](self, "_applyHeaderContentViewControllerContainerViewConstraints");
  -[_UIAlertControllerPhoneTVMacView _applySeparatedContentViewControllerContainerViewContraints](self, "_applySeparatedContentViewControllerContainerViewContraints");
  -[_UIAlertControllerPhoneTVMacView _applyContentViewControllerContainerViewConstraints](self, "_applyContentViewControllerContainerViewConstraints");
  -[_UIAlertControllerPhoneTVMacView _applyTextFieldViewControllerContainerViewConstraints](self, "_applyTextFieldViewControllerContainerViewConstraints");
  -[_UIAlertControllerPhoneTVMacView _prepareDimmingViewConstraints](self, "_prepareDimmingViewConstraints");
  -[_UIAlertControllerPhoneTVMacView _propertiesChanged](self, "_propertiesChanged");
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
  -[_UIAlertControllerPhoneTVMacView _applyTitleAndMessageLabelVibrantContainerViewConstraints](self, "_applyTitleAndMessageLabelVibrantContainerViewConstraints");
  -[_UIAlertControllerPhoneTVMacView _applyTitleConstraints](self, "_applyTitleConstraints");
  -[_UIAlertControllerPhoneTVMacView _applyMessageConstraints](self, "_applyMessageConstraints");
  -[_UIAlertControllerPhoneTVMacView _applyDetailMessageConstraints](self, "_applyDetailMessageConstraints");
  -[_UIAlertControllerPhoneTVMacView _updateConstraintSpacingForExternalOffset](self, "_updateConstraintSpacingForExternalOffset");
  -[_UIAlertControllerPhoneTVMacView _updateForPropertyChangeIfNeeded](self, "_updateForPropertyChangeIfNeeded");
}

- (void)_prepareContentView
{
  UIView *contentView;
  UIView *v4;
  UIView *v5;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = objc_alloc_init(UIView);
    v5 = self->_contentView;
    self->_contentView = v4;

    -[UIView addSubview:](self, "addSubview:", self->_contentView);
    contentView = self->_contentView;
  }
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)_prepareContentViewTopItemsView
{
  UIView *v3;
  UIView *contentViewTopItemsView;

  if (!self->_contentViewTopItemsView)
  {
    v3 = objc_alloc_init(UIView);
    contentViewTopItemsView = self->_contentViewTopItemsView;
    self->_contentViewTopItemsView = v3;

    -[UIInterfaceActionGroupView insertArrangedHeaderView:atIndex:scrollable:](self->_mainInterfaceActionsGroupView, "insertArrangedHeaderView:atIndex:scrollable:", self->_contentViewTopItemsView, 0, 1);
  }
}

- (void)_prepareHeaderContentViewControllerContainerView
{
  UIView *v3;
  UIView *headerContentViewControllerContainerView;
  double v5;
  double v6;
  double v7;
  double v8;

  if (!self->_headerContentViewControllerContainerView)
  {
    v3 = objc_alloc_init(UIView);
    headerContentViewControllerContainerView = self->_headerContentViewControllerContainerView;
    self->_headerContentViewControllerContainerView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerContentViewControllerContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setClipsToBounds:](self->_headerContentViewControllerContainerView, "setClipsToBounds:", 1);
    LODWORD(v5) = 1144750080;
    -[UIView setContentHuggingPriority:forAxis:](self->_headerContentViewControllerContainerView, "setContentHuggingPriority:forAxis:", 0, v5);
    LODWORD(v6) = 1144750080;
    -[UIView setContentHuggingPriority:forAxis:](self->_headerContentViewControllerContainerView, "setContentHuggingPriority:forAxis:", 1, v6);
    LODWORD(v7) = 1144750080;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_headerContentViewControllerContainerView, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    LODWORD(v8) = 1144750080;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_headerContentViewControllerContainerView, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    -[UIView addSubview:](self->_contentViewTopItemsView, "addSubview:", self->_headerContentViewControllerContainerView);
  }
}

- (void)_prepareSeparateContentViewControllerContainerView
{
  void *v3;
  UIView *separatedHeaderContentViewControllerContainerView;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  UIView *v12;
  void *v13;

  -[_UIAlertControllerPhoneTVMacView separatedHeaderContentViewController](self, "separatedHeaderContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    separatedHeaderContentViewControllerContainerView = self->_separatedHeaderContentViewControllerContainerView;

    if (!separatedHeaderContentViewControllerContainerView)
    {
      v5 = objc_alloc_init(UIView);
      v6 = self->_separatedHeaderContentViewControllerContainerView;
      self->_separatedHeaderContentViewControllerContainerView = v5;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatedHeaderContentViewControllerContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView setClipsToBounds:](self->_separatedHeaderContentViewControllerContainerView, "setClipsToBounds:", 1);
      -[UIInterfaceActionGroupView actionGroup](self->_mainInterfaceActionsGroupView, "actionGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_visualStyle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentCornerRadius");
      v10 = v9;

      -[UIView layer](self->_separatedHeaderContentViewControllerContainerView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCornerRadius:", v10);

      -[UIView setOpaque:](self->_separatedHeaderContentViewControllerContainerView, "setOpaque:", 0);
      v12 = self->_separatedHeaderContentViewControllerContainerView;
      +[UIColor clearColor](UIColor, "clearColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

      -[UIView addSubview:](self->_contentView, "addSubview:", self->_separatedHeaderContentViewControllerContainerView);
    }
  }
}

- (void)_prepareTitleAndMessageLabelVibrantContainer
{
  UIVisualEffectView *v3;
  UIVisualEffectView *titleAndMessageLabelVibrantContainerView;
  void *v5;
  id v6;

  if (!self->_titleAndMessageLabelVibrantContainerView)
  {
    if (-[_UIAlertControllerPhoneTVMacView _titleAndMessageLabelUseVibrancy](self, "_titleAndMessageLabelUseVibrancy"))
    {
      -[_UIAlertControllerPhoneTVMacView _vibrancyEffectForTitleAndMessageLabel](self, "_vibrancyEffectForTitleAndMessageLabel");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v3 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v6);
      titleAndMessageLabelVibrantContainerView = self->_titleAndMessageLabelVibrantContainerView;
      self->_titleAndMessageLabelVibrantContainerView = v3;

      -[UIVisualEffectView contentView](self->_titleAndMessageLabelVibrantContainerView, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setClipsToBounds:", 0);

      -[UIVisualEffectView _setAllowsGroupFiltering:](self->_titleAndMessageLabelVibrantContainerView, "_setAllowsGroupFiltering:", 0);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleAndMessageLabelVibrantContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_contentViewTopItemsView, "addSubview:", self->_titleAndMessageLabelVibrantContainerView);

    }
  }
}

- (void)_prepareTitleLabel
{
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  if (!self->_titleLabel && -[_UIAlertControllerPhoneTVMacView _hasTitle](self, "_hasTitle"))
  {
    v3 = objc_alloc_init(UILabel);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    v5 = self->_titleLabel;
    +[UIColor clearColor](UIColor, "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    LODWORD(v7) = 1053609165;
    -[UILabel _setHyphenationFactor:](self->_titleLabel, "_setHyphenationFactor:", v7);
    -[UILabel _setHyphenationFactorIgnoredIfURLsDetected:](&self->_titleLabel->super.super.super.isa, 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v8) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    LODWORD(v9) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v9);
    -[_UIAlertControllerPhoneTVMacView _updateTitleLabelContents](self, "_updateTitleLabelContents");
    -[_UIAlertControllerPhoneTVMacView _updateLabelTextColor](self, "_updateLabelTextColor");
    -[_UIAlertControllerPhoneTVMacView _updateLabelProperties](self, "_updateLabelProperties");
    -[_UIAlertControllerPhoneTVMacView _updateTitleLabelFontSize](self, "_updateTitleLabelFontSize");
    if (-[_UIAlertControllerPhoneTVMacView _titleAndMessageLabelUseVibrancy](self, "_titleAndMessageLabelUseVibrancy"))
    {
      -[_UIAlertControllerPhoneTVMacView _prepareTitleAndMessageLabelVibrantContainer](self, "_prepareTitleAndMessageLabelVibrantContainer");
      -[UIVisualEffectView contentView](self->_titleAndMessageLabelVibrantContainerView, "contentView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_titleLabel);

    }
    else
    {
      -[UIView addSubview:](self->_contentViewTopItemsView, "addSubview:", self->_titleLabel);
    }
  }
}

- (void)_prepareMesssageLabel
{
  UILabel *v3;
  UILabel *messageLabel;
  UILabel *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  if (!self->_messageLabel && -[_UIAlertControllerPhoneTVMacView _hasMessage](self, "_hasMessage"))
  {
    v3 = objc_alloc_init(UILabel);
    messageLabel = self->_messageLabel;
    self->_messageLabel = v3;

    -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
    v5 = self->_messageLabel;
    +[UIColor clearColor](UIColor, "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    LODWORD(v7) = 1053609165;
    -[UILabel _setHyphenationFactor:](self->_messageLabel, "_setHyphenationFactor:", v7);
    -[UILabel _setHyphenationFactorIgnoredIfURLsDetected:](&self->_messageLabel->super.super.super.isa, 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v8) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_messageLabel, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    LODWORD(v9) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](self->_messageLabel, "setContentHuggingPriority:forAxis:", 1, v9);
    -[_UIAlertControllerPhoneTVMacView _updateMessageLabelContents](self, "_updateMessageLabelContents");
    -[_UIAlertControllerPhoneTVMacView _updateLabelTextColor](self, "_updateLabelTextColor");
    -[_UIAlertControllerPhoneTVMacView _updateLabelProperties](self, "_updateLabelProperties");
    -[_UIAlertControllerPhoneTVMacView _updateMessageLabelFontSize](self, "_updateMessageLabelFontSize");
    if (-[_UIAlertControllerPhoneTVMacView _titleAndMessageLabelUseVibrancy](self, "_titleAndMessageLabelUseVibrancy"))
    {
      -[_UIAlertControllerPhoneTVMacView _prepareTitleAndMessageLabelVibrantContainer](self, "_prepareTitleAndMessageLabelVibrantContainer");
      -[UIVisualEffectView contentView](self->_titleAndMessageLabelVibrantContainerView, "contentView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_messageLabel);

    }
    else
    {
      -[UIView addSubview:](self->_contentViewTopItemsView, "addSubview:", self->_messageLabel);
    }
  }
}

- (void)_prepareDetailMessageLabel
{
  UILabel *v3;
  UILabel *detailMessageLabel;
  UILabel *v5;
  void *v6;

  if (!self->_detailMessageLabel)
  {
    if (-[_UIAlertControllerPhoneTVMacView _hasDetailMessage](self, "_hasDetailMessage"))
    {
      v3 = objc_alloc_init(UILabel);
      detailMessageLabel = self->_detailMessageLabel;
      self->_detailMessageLabel = v3;

      -[UILabel setNumberOfLines:](self->_detailMessageLabel, "setNumberOfLines:", 0);
      -[UILabel setTextAlignment:](self->_detailMessageLabel, "setTextAlignment:", 1);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_detailMessageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v5 = self->_detailMessageLabel;
      +[UIColor clearColor](UIColor, "clearColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

      -[_UIAlertControllerPhoneTVMacView _updateDetailLabelContents](self, "_updateDetailLabelContents");
      -[_UIAlertControllerPhoneTVMacView _updateDetailLabelFontSize](self, "_updateDetailLabelFontSize");
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_detailMessageLabel);
    }
  }
}

- (void)_prepareContentViewControllerContainerView
{
  UIView *v3;
  UIView *contentViewControllerContainerView;

  if (!self->_contentViewControllerContainerView)
  {
    v3 = objc_alloc_init(UIView);
    contentViewControllerContainerView = self->_contentViewControllerContainerView;
    self->_contentViewControllerContainerView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentViewControllerContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setClipsToBounds:](self->_contentViewControllerContainerView, "setClipsToBounds:", 1);
    -[UIView addSubview:](self->_contentViewTopItemsView, "addSubview:", self->_contentViewControllerContainerView);
  }
}

- (void)_prepareTextFieldViewControllerContainerView
{
  UIView *v3;
  UIView *textFieldViewControllerContainerView;

  if (!self->_textFieldViewControllerContainerView)
  {
    v3 = objc_alloc_init(UIView);
    textFieldViewControllerContainerView = self->_textFieldViewControllerContainerView;
    self->_textFieldViewControllerContainerView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_textFieldViewControllerContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setClipsToBounds:](self->_textFieldViewControllerContainerView, "setClipsToBounds:", 1);
    -[UIView addSubview:](self->_contentViewTopItemsView, "addSubview:", self->_textFieldViewControllerContainerView);
  }
}

- (void)_prepareMainInterfaceActionsGroupView
{
  void *v3;
  _UIAlertControllerInterfaceActionGroupView *v4;
  void *v5;
  _UIAlertControllerInterfaceActionGroupView *v6;
  _UIAlertControllerInterfaceActionGroupView *mainInterfaceActionsGroupView;
  _BOOL8 v8;
  void *v9;

  if (!self->_mainInterfaceActionsGroupView)
  {
    +[UIInterfaceActionGroup actionGroupWithActionsBySection:](UIInterfaceActionGroup, "actionGroupWithActionsBySection:", MEMORY[0x1E0C9AA60]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [_UIAlertControllerInterfaceActionGroupView alloc];
    -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UIAlertControllerInterfaceActionGroupView initWithAlertController:actionGroup:actionHandlerInvocationDelegate:](v4, "initWithAlertController:actionGroup:actionHandlerInvocationDelegate:", v5, v3, self);
    mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
    self->_mainInterfaceActionsGroupView = v6;

    -[UIInterfaceActionGroupView setSpringLoaded:](self->_mainInterfaceActionsGroupView, "setSpringLoaded:", -[_UIAlertControllerPhoneTVMacView isSpringLoaded](self, "isSpringLoaded"));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_mainInterfaceActionsGroupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_mainInterfaceActionsGroupView);

  }
  v8 = -[_UIAlertControllerPhoneTVMacView actionScrubbingEnabled](self, "actionScrubbingEnabled");
  -[UIInterfaceActionGroupView actionSelectionController](self->_mainInterfaceActionsGroupView, "actionSelectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScrubbingEnabled:", v8);

  -[UIView setSemanticContentAttribute:](self->_mainInterfaceActionsGroupView, "setSemanticContentAttribute:", 3);
  -[_UIAlertControllerPhoneTVMacView _updateActionsGroupPresentationStyles](self, "_updateActionsGroupPresentationStyles");
}

- (void)_prepareDiscreteCancelActionGroupView
{
  void *v3;
  _UIAlertControllerInterfaceActionGroupView *v4;
  void *v5;
  _UIAlertControllerInterfaceActionGroupView *v6;
  _UIAlertControllerInterfaceActionGroupView *discreteCancelActionGroupView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _UIAlertControllerInterfaceActionGroupView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  _UIAlertControllerInterfaceActionGroupView *v19;
  void *v20;
  _BOOL8 v21;
  id v22;

  if (!self->_discreteCancelActionGroupView)
  {
    +[UIInterfaceActionGroup actionGroupWithActionsBySection:](UIInterfaceActionGroup, "actionGroupWithActionsBySection:", MEMORY[0x1E0C9AA60]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [_UIAlertControllerInterfaceActionGroupView alloc];
    -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UIAlertControllerInterfaceActionGroupView initWithAlertController:actionGroup:actionHandlerInvocationDelegate:](v4, "initWithAlertController:actionGroup:actionHandlerInvocationDelegate:", v5, v3, self);
    discreteCancelActionGroupView = self->_discreteCancelActionGroupView;
    self->_discreteCancelActionGroupView = v6;

    -[UIView focusGroupIdentifier](self->_mainInterfaceActionsGroupView, "focusGroupIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setFocusGroupIdentifier:](self->_discreteCancelActionGroupView, "setFocusGroupIdentifier:", v8);

    -[UIInterfaceActionGroupView setSpringLoaded:](self->_discreteCancelActionGroupView, "setSpringLoaded:", -[_UIAlertControllerPhoneTVMacView isSpringLoaded](self, "isSpringLoaded"));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_discreteCancelActionGroupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView widthAnchor](self->_discreteCancelActionGroupView, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToConstant:", 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setDiscreteCancelActionViewWidthConstraint:](self, "setDiscreteCancelActionViewWidthConstraint:", v10);

    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewWidthConstraint](self, "discreteCancelActionViewWidthConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1148829696;
    objc_msgSend(v11, "setPriority:", v12);

    v13 = self->_discreteCancelActionGroupView;
    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewWidthConstraint](self, "discreteCancelActionViewWidthConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v13, "addConstraint:", v14);

    -[UIView heightAnchor](self->_discreteCancelActionGroupView, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToConstant:", 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setDiscreteCancelActionViewHeightConstraint:](self, "setDiscreteCancelActionViewHeightConstraint:", v16);

    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewHeightConstraint](self, "discreteCancelActionViewHeightConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 1144750080;
    objc_msgSend(v17, "setPriority:", v18);

    v19 = self->_discreteCancelActionGroupView;
    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewHeightConstraint](self, "discreteCancelActionViewHeightConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v19, "addConstraint:", v20);

  }
  v21 = -[_UIAlertControllerPhoneTVMacView actionScrubbingEnabled](self, "actionScrubbingEnabled");
  -[UIInterfaceActionGroupView actionSelectionController](self->_discreteCancelActionGroupView, "actionSelectionController");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setScrubbingEnabled:", v21);

}

- (void)setActionScrubbingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_actionScrubbingEnabled = a3;
  -[UIInterfaceActionGroupView actionSelectionController](self->_mainInterfaceActionsGroupView, "actionSelectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrubbingEnabled:", v3);

  -[UIInterfaceActionGroupView actionSelectionController](self->_discreteCancelActionGroupView, "actionSelectionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrubbingEnabled:", v3);

}

- (id)_newStyledBackgroundView
{
  return -[UIInterfaceActionGroupView _newActionGroupBackgroundView](self->_mainInterfaceActionsGroupView, "_newActionGroupBackgroundView");
}

- (void)_updateActionsGroupPresentationStyles
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_resolvedStyle");
  if (v4 == 1000)
    v5 = 2;
  else
    v5 = v4 == 0;

  -[UIInterfaceActionGroupView setPresentationStyle:](self->_mainInterfaceActionsGroupView, "setPresentationStyle:", v5);
  -[UIInterfaceActionGroupView setPresentationStyle:](self->_discreteCancelActionGroupView, "setPresentationStyle:", v5);
}

- (void)_prepareDimmingView
{
  UIView *v3;
  UIView *dimmingView;
  UIView *v5;
  void *v6;
  UIView *v7;
  void *v8;
  id v9;

  if (!self->_dimmingView)
  {
    v3 = objc_alloc_init(UIView);
    dimmingView = self->_dimmingView;
    self->_dimmingView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_dimmingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = self->_dimmingView;
    +[UIColor _alertControllerDimmingViewColor](UIColor, "_alertControllerDimmingViewColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = self->_dimmingView;
    -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_dismissGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addGestureRecognizer:](v7, "addGestureRecognizer:", v8);

  }
}

- (void)_prepareKeyboardLayoutAlignmentViews
{
  _UIKeyboardLayoutAlignmentView *v3;
  _UIKeyboardLayoutAlignmentView *keyboardLayoutAlignmentView;
  UIView *v5;
  UIView *keyboardLayoutAlignmentAvailableSpaceView;

  if (!self->_keyboardLayoutAlignmentView
    && !+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
  {
    v3 = objc_alloc_init(_UIKeyboardLayoutAlignmentView);
    keyboardLayoutAlignmentView = self->_keyboardLayoutAlignmentView;
    self->_keyboardLayoutAlignmentView = v3;

    v5 = objc_alloc_init(UIView);
    keyboardLayoutAlignmentAvailableSpaceView = self->_keyboardLayoutAlignmentAvailableSpaceView;
    self->_keyboardLayoutAlignmentAvailableSpaceView = v5;

    -[UIView setUserInteractionEnabled:](self->_keyboardLayoutAlignmentAvailableSpaceView, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_keyboardLayoutAlignmentAvailableSpaceView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
}

- (void)_applyViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  UIView *contentView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  UIView *contentViewTopItemsView;
  void *v27;
  id v28;

  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](self, "addConstraint:", v5);

  if (+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
  {
    -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self, "centerYAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addConstraint:](self, "addConstraint:", v8);
  }
  -[UIView widthAnchor](self->_mainInterfaceActionsGroupView, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = 1148829696;
  objc_msgSend(v28, "setPriority:", v11);
  -[UIView addConstraint:](self->_contentView, "addConstraint:", v28);
  -[_UIAlertControllerPhoneTVMacView setActionGroupEqualsContentViewWidthConstraint:](self, "setActionGroupEqualsContentViewWidthConstraint:", v28);
  contentView = self->_contentView;
  -[UIView heightAnchor](contentView, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minimumContentHeight");
  objc_msgSend(v13, "constraintGreaterThanOrEqualToConstant:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](contentView, "addConstraint:", v15);

  -[UIView widthAnchor](self->_contentViewControllerContainerView, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintLessThanOrEqualToConstant:", 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView setContentScrollViewMaximumWidthConstraint:](self, "setContentScrollViewMaximumWidthConstraint:", v17);

  -[_UIAlertControllerPhoneTVMacView contentScrollViewMaximumWidthConstraint](self, "contentScrollViewMaximumWidthConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 1148846080;
  objc_msgSend(v18, "setPriority:", v19);

  -[UIView heightAnchor](self->_contentView, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintLessThanOrEqualToConstant:", 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView setContentViewMaxHeightConstraint:](self, "setContentViewMaxHeightConstraint:", v21);

  -[UIView heightAnchor](self->_contentViewTopItemsView, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintLessThanOrEqualToConstant:", 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView setContentScrollViewMaximumHeightConstraint:](self, "setContentScrollViewMaximumHeightConstraint:", v23);

  -[_UIAlertControllerPhoneTVMacView contentScrollViewMaximumHeightConstraint](self, "contentScrollViewMaximumHeightConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = 1148846080;
  objc_msgSend(v24, "setPriority:", v25);

  contentViewTopItemsView = self->_contentViewTopItemsView;
  -[_UIAlertControllerPhoneTVMacView contentScrollViewMaximumHeightConstraint](self, "contentScrollViewMaximumHeightConstraint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](contentViewTopItemsView, "addConstraint:", v27);

}

- (void)_prepareDimmingViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *dimmingViewConstraints;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  NSArray *dimmingViewConstraintsForActionSheetStyle;
  NSArray *v29;
  NSArray *dimmingViewForegroundViewTopConstraints;
  NSArray *v31;
  NSArray *dimmingViewForegroundViewBottomConstraints;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSArray *v44;
  NSArray *dimmingViewConstraintsForAlertStyle;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  NSArray *v56;
  NSArray *noDimmingViewConstraints;
  id v58;

  _NSDictionaryOfVariableBindings(CFSTR("_dimmingView, self, _contentView"), self->_dimmingView, self, self->_contentView, 0);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_dimmingViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_dimmingView, "centerXAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

    -[UIView centerYAnchor](self->_dimmingView, "centerYAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

    -[UIView widthAnchor](self->_dimmingView, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

    -[UIView heightAnchor](self->_dimmingView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

    objc_msgSend(v3, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dimmingViewConstraints = self->_dimmingViewConstraints;
    self->_dimmingViewConstraints = v16;

  }
  if (!self->_dimmingViewConstraintsForActionSheetStyle)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_contentView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v23);
    objc_msgSend(v18, "addObject:", v26);
    objc_msgSend(v19, "addObject:", v23);
    objc_msgSend(v20, "addObject:", v26);
    objc_msgSend(v18, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
    v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dimmingViewConstraintsForActionSheetStyle = self->_dimmingViewConstraintsForActionSheetStyle;
    self->_dimmingViewConstraintsForActionSheetStyle = v27;

    objc_msgSend(v19, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
    v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dimmingViewForegroundViewTopConstraints = self->_dimmingViewForegroundViewTopConstraints;
    self->_dimmingViewForegroundViewTopConstraints = v29;

    objc_msgSend(v20, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
    v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dimmingViewForegroundViewBottomConstraints = self->_dimmingViewForegroundViewBottomConstraints;
    self->_dimmingViewForegroundViewBottomConstraints = v31;

  }
  if (!self->_dimmingViewConstraintsForAlertStyle)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v37) = 1144750080;
    objc_msgSend(v36, "setPriority:", v37);
    objc_msgSend(v33, "addObject:", v36);
    -[UIView topAnchor](self->_contentView, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v40);

    -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v43);

    objc_msgSend(v33, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
    v44 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dimmingViewConstraintsForAlertStyle = self->_dimmingViewConstraintsForAlertStyle;
    self->_dimmingViewConstraintsForAlertStyle = v44;

  }
  if (!self->_noDimmingViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[self(>=_contentView)]"), 0, 0, v58);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObjectsFromArray:", v47);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[self(==_contentView)]"), 0, 0, v58);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObjectsFromArray:", v48);

    if (!+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
    {
      -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](self, "centerYAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v51);

    }
    -[UIView widthAnchor](self, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_contentView, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v55) = 1111752704;
    objc_msgSend(v54, "setPriority:", v55);
    objc_msgSend(v46, "addObject:", v54);
    objc_msgSend(v46, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
    v56 = (NSArray *)objc_claimAutoreleasedReturnValue();
    noDimmingViewConstraints = self->_noDimmingViewConstraints;
    self->_noDimmingViewConstraints = v56;

  }
  if (+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_noDimmingViewConstraints);
  }

}

- (void)_applyKeyboardAlignmentViewsConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  if (!+[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_keyboardLayoutAlignmentAvailableSpaceView, "leftAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self, "leftAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "constraintEqualToAnchor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView rightAnchor](self->_keyboardLayoutAlignmentAvailableSpaceView, "rightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self, "rightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView topAnchor](self->_keyboardLayoutAlignmentAvailableSpaceView, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView bottomAnchor](self->_keyboardLayoutAlignmentAvailableSpaceView, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_keyboardLayoutAlignmentView, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView bottomAnchor](self->_keyboardLayoutAlignmentAvailableSpaceView, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "addObject:", v5);
    objc_msgSend(v23, "addObject:", v8);
    objc_msgSend(v23, "addObject:", v11);
    objc_msgSend(v23, "addObject:", v14);
    objc_msgSend(v23, "addObject:", v17);
    -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "_resolvedStyle");

    if (v19 == 1)
    {
      -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](self->_keyboardLayoutAlignmentAvailableSpaceView, "centerYAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "addObject:", v22);
    }
    -[UIView addConstraints:](self, "addConstraints:", v23);

  }
}

- (void)_applySeparatedContentViewControllerContainerViewContraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UIView centerXAnchor](self->_separatedHeaderContentViewControllerContainerView, "centerXAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  -[UIView widthAnchor](self->_separatedHeaderContentViewControllerContainerView, "widthAnchor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

}

- (void)_applyHeaderContentViewControllerContainerViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  -[UIView centerXAnchor](self->_headerContentViewControllerContainerView, "centerXAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  -[UIView widthAnchor](self->_headerContentViewControllerContainerView, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintLessThanOrEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_headerContentViewControllerContainerView, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = 1144733696;
  objc_msgSend(v12, "setPriority:", v11);
  objc_msgSend(v12, "setActive:", 1);

}

- (void)_setupHorizontalConstraintsForLabelView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentViewTopItemsView, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(v4, "widthAnchor");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView widthAnchor](self->_contentViewTopItemsView, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView _labelHorizontalInsets](self, "_labelHorizontalInsets");
  objc_msgSend(v11, "constraintEqualToAnchor:multiplier:constant:", v8, 1.0, v9 * -2.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

}

- (void)_applyTitleAndMessageLabelVibrantContainerViewConstraints
{
  __int16 alertControllerViewFlags;

  if (-[_UIAlertControllerPhoneTVMacView _hasTitle](self, "_hasTitle")
    || -[_UIAlertControllerPhoneTVMacView _hasMessage](self, "_hasMessage"))
  {
    if (self->_titleAndMessageLabelVibrantContainerView)
    {
      alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
      if ((alertControllerViewFlags & 1) == 0)
      {
        *(_WORD *)&self->_alertControllerViewFlags = alertControllerViewFlags | 1;
        -[_UIAlertControllerPhoneTVMacView _setupHorizontalConstraintsForLabelView:](self, "_setupHorizontalConstraintsForLabelView:", self->_titleAndMessageLabelVibrantContainerView);
      }
    }
  }
}

- (void)_applyTitleConstraints
{
  __int16 alertControllerViewFlags;

  if (-[_UIAlertControllerPhoneTVMacView _hasTitle](self, "_hasTitle"))
  {
    alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
    if ((alertControllerViewFlags & 2) == 0)
    {
      *(_WORD *)&self->_alertControllerViewFlags = alertControllerViewFlags | 2;
      -[_UIAlertControllerPhoneTVMacView _setupHorizontalConstraintsForLabelView:](self, "_setupHorizontalConstraintsForLabelView:", self->_titleLabel);
    }
  }
}

- (void)_applyMessageConstraints
{
  __int16 alertControllerViewFlags;

  if (-[_UIAlertControllerPhoneTVMacView _hasMessage](self, "_hasMessage"))
  {
    alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
    if ((alertControllerViewFlags & 4) == 0)
    {
      *(_WORD *)&self->_alertControllerViewFlags = alertControllerViewFlags | 4;
      -[_UIAlertControllerPhoneTVMacView _setupHorizontalConstraintsForLabelView:](self, "_setupHorizontalConstraintsForLabelView:", self->_messageLabel);
    }
  }
}

- (void)_applyDetailMessageConstraints
{
  __int16 alertControllerViewFlags;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  if (-[_UIAlertControllerPhoneTVMacView _hasDetailMessage](self, "_hasDetailMessage"))
  {
    alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
    if ((alertControllerViewFlags & 8) == 0)
    {
      *(_WORD *)&self->_alertControllerViewFlags = alertControllerViewFlags | 8;
      -[UIView centerXAnchor](self->_detailMessageLabel, "centerXAnchor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "constraintEqualToAnchor:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setActive:", 1);

      -[UIView widthAnchor](self->_detailMessageLabel, "widthAnchor");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->_contentView, "widthAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAlertControllerPhoneTVMacView _labelHorizontalInsets](self, "_labelHorizontalInsets");
      objc_msgSend(v10, "constraintEqualToAnchor:multiplier:constant:", v7, 1.0, v8 * -2.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setActive:", 1);

    }
  }
}

- (void)_applyContentViewControllerContainerViewConstraints
{
  UIView *contentView;
  void *v4;
  void *v5;
  void *v6;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;
  void *v12;
  id v13;

  contentView = self->_contentView;
  -[UIView centerXAnchor](self->_contentViewControllerContainerView, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](contentView, "addConstraint:", v6);

  v7 = self->_contentView;
  -[UIView widthAnchor](self->_contentViewControllerContainerView, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v7, "addConstraint:", v10);

  v11 = self->_contentView;
  -[UIView widthAnchor](self->_contentViewControllerContainerView, "widthAnchor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintGreaterThanOrEqualToConstant:", 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v11, "addConstraint:", v12);

}

- (void)_applyTextFieldViewControllerContainerViewConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *textFieldViewControllerContainerViewWidthConstraint;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *textFieldViewControllerContainerViewHeightConstraint;
  UIView *contentView;
  void *v11;
  UIView *v12;
  void *v13;
  UIView *v14;
  void *v15;
  void *v16;
  id v17;

  -[UIView widthAnchor](self->_textFieldViewControllerContainerView, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_contentViewTopItemsView, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  textFieldViewControllerContainerViewWidthConstraint = self->_textFieldViewControllerContainerViewWidthConstraint;
  self->_textFieldViewControllerContainerViewWidthConstraint = v5;

  -[UIView heightAnchor](self->_textFieldViewControllerContainerView, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  textFieldViewControllerContainerViewHeightConstraint = self->_textFieldViewControllerContainerViewHeightConstraint;
  self->_textFieldViewControllerContainerViewHeightConstraint = v8;

  contentView = self->_contentView;
  -[_UIAlertControllerPhoneTVMacView textFieldViewControllerContainerViewWidthConstraint](self, "textFieldViewControllerContainerViewWidthConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](contentView, "addConstraint:", v11);

  v12 = self->_contentView;
  -[_UIAlertControllerPhoneTVMacView textFieldViewControllerContainerViewHeightConstraint](self, "textFieldViewControllerContainerViewHeightConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v12, "addConstraint:", v13);

  v14 = self->_contentView;
  -[UIView centerXAnchor](self->_textFieldViewControllerContainerView, "centerXAnchor");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraint:](v14, "addConstraint:", v16);

}

- (BOOL)_buttonsAreTopMost
{
  BOOL v3;
  void *v4;

  if (-[_UIAlertControllerPhoneTVMacView _hasTitle](self, "_hasTitle")
    || -[_UIAlertControllerPhoneTVMacView _hasMessage](self, "_hasMessage"))
  {
    return 0;
  }
  -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 == 0;

  return v3;
}

- (CGSize)_sizeForLayoutWidthDetermination
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  CGSize result;

  v3 = -[_UIAlertControllerPhoneTVMacView presentedAsPopover](self, "presentedAsPopover");
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v3)
  {
    v6 = 0x407E000000000000;
    v7 = 0x4074000000000000;
  }
  else
  {
    -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_existingPresentationControllerImmediate:effective:", 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIAlertControllerPhoneTVMacView _layoutSize](self, "_layoutSize");
    if (v12 == *MEMORY[0x1E0C9D820] && v11 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      objc_msgSend(v10, "bounds");
      v7 = v16;
      v6 = v17;
    }
    else
    {
      -[_UIAlertControllerPhoneTVMacView _layoutSize](self, "_layoutSize");
      v7 = v14;
      v6 = v15;
    }

  }
  v18 = *(double *)&v7;
  v19 = *(double *)&v6;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)_verticalLayoutWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v10;
  double v11;
  double v12;
  double v13;

  -[_UIAlertControllerPhoneTVMacView _sizeForLayoutWidthDetermination](self, "_sizeForLayoutWidthDetermination");
  v4 = v3;
  v6 = v5;
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v4 < v6 || v8 == 3)
    v6 = v4;
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimumWidth");
  v12 = v11;

  if (v12 > 0.0)
  {
    -[_UIAlertControllerPhoneTVMacView _minimumSizeForAllActions](self, "_minimumSizeForAllActions");
    if (v13 < v12)
      v13 = v12;
    if (v13 >= v4)
      return v4;
    else
      return v13;
  }
  return v6;
}

- (BOOL)_horizontalLayoutCanUseFullWidth
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_resolvedStyle"))
  {
    v4 = 0;
  }
  else
  {
    -[_UIAlertControllerPhoneTVMacView actions](self, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (unint64_t)objc_msgSend(v5, "count") > 2;

  }
  return v4;
}

- (double)_minimumWidthFittingAlertContents
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;

  -[_UIAlertControllerPhoneTVMacView _minimumSizeForAllActions](self, "_minimumSizeForAllActions");
  v4 = v3;
  -[_UIAlertControllerPhoneTVMacView _applyTitleAndMessageLabelVibrantContainerViewConstraints](self, "_applyTitleAndMessageLabelVibrantContainerViewConstraints");
  -[_UIAlertControllerPhoneTVMacView _applyTitleConstraints](self, "_applyTitleConstraints");
  -[_UIAlertControllerPhoneTVMacView _applyMessageConstraints](self, "_applyMessageConstraints");
  -[_UIAlertControllerPhoneTVMacView _applyDetailMessageConstraints](self, "_applyDetailMessageConstraints");
  -[_UIAlertControllerPhoneTVMacView _updateConstraintSpacingForExternalOffset](self, "_updateConstraintSpacingForExternalOffset");
  -[_UIAlertControllerPhoneTVMacView _updateForPropertyChangeIfNeeded](self, "_updateForPropertyChangeIfNeeded");
  -[_UIAlertControllerPhoneTVMacView contentScrollViewMaximumHeightConstraint](self, "contentScrollViewMaximumHeightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  -[_UIAlertControllerPhoneTVMacView _contentViewControllerSize](self, "_contentViewControllerSize");
  v7 = v6;
  v9 = v8;
  -[_UIAlertControllerPhoneTVMacView headerContentViewController](self, "headerContentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSize");
  v12 = v11;
  v14 = v13;

  if (v7 < v12)
    v7 = v12;
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minimumWidthFittingContentView:titleLabel:minimumWidthForAllActions:preferredSizeForContentContainers:", self->_contentViewTopItemsView, self->_titleLabel, v4, v7, v9 + v14);
  v17 = v16;

  -[_UIAlertControllerPhoneTVMacView contentScrollViewMaximumHeightConstraint](self, "contentScrollViewMaximumHeightConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  return v17;
}

- (double)_availableWidthForHorizontalLayout:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double result;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = a3;
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "definesWidthByContentFitting");

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maximumWidth");
  v9 = v8;

  if (v6)
  {
    -[_UIAlertControllerPhoneTVMacView _minimumWidthFittingAlertContents](self, "_minimumWidthFittingAlertContents");
  }
  else if (v9 <= 0.0)
  {
    if (v3
      && -[_UIAlertControllerPhoneTVMacView _horizontalLayoutCanUseFullWidth](self, "_horizontalLayoutCanUseFullWidth"))
    {
      -[_UIAlertControllerPhoneTVMacView _sizeForLayoutWidthDetermination](self, "_sizeForLayoutWidthDetermination");
    }
    else
    {
      -[_UIAlertControllerPhoneTVMacView _verticalLayoutWidth](self, "_verticalLayoutWidth");
    }
    v12 = v11;
    -[_UIAlertControllerPhoneTVMacView _contentInsets](self, "_contentInsets");
    result = v12 - (v13 + v14);
  }
  else
  {
    -[_UIAlertControllerPhoneTVMacView _maximumWidthUsingAccessibilityWidthIfActionsAreTruncated:](self, "_maximumWidthUsingAccessibilityWidthIfActionsAreTruncated:", v9);
  }
  if (result < 0.0)
    return 0.0;
  return result;
}

- (UIEdgeInsets)_contentInsets
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
  UIEdgeInsets result;

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInsetsForContainerView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (double)_layoutWidthForHorizontalLayout:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  void *v7;
  int v8;
  double result;

  v3 = a3;
  -[_UIAlertControllerPhoneTVMacView _contentViewControllerSize](self, "_contentViewControllerSize");
  v6 = v5;
  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_shouldFitWidthToContentViewControllerWidth");

  if (v8)
    return v6;
  -[_UIAlertControllerPhoneTVMacView _availableWidthForHorizontalLayout:](self, "_availableWidthForHorizontalLayout:", v3);
  return result;
}

- (double)_idealLayoutWidth
{
  void *v3;
  unint64_t v4;
  double result;

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ((unint64_t)objc_msgSend(v3, "permittedActionLayoutDirection") >> 1) & 1;

  -[_UIAlertControllerPhoneTVMacView _availableWidthForHorizontalLayout:](self, "_availableWidthForHorizontalLayout:", v4);
  return result;
}

- (CGSize)_itemSizeForHorizontalLayout:(BOOL)a3 visualStyleRequiresActionRepresentationToFitItemSize:(BOOL *)a4
{
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
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
  CGSize result;

  v5 = a3;
  -[_UIAlertControllerPhoneTVMacView _minimumSizeForAllActions](self, "_minimumSizeForAllActions");
  v8 = v7;
  v10 = v9;
  -[_UIAlertControllerPhoneTVMacView _idealLayoutWidth](self, "_idealLayoutWidth");
  v12 = v11;
  if (!v5)
  {
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "actionWidthForMinimumActionWidth:availableWidth:", v8, v12);
    v26 = v28;

    if (v26 <= 0.0)
    {
      -[_UIAlertControllerPhoneTVMacView _contentInsets](self, "_contentInsets");
      v30 = v29;
      v32 = v31;
      -[_UIAlertControllerPhoneTVMacView _verticalLayoutWidth](self, "_verticalLayoutWidth");
      v25 = 0;
      v26 = v33 - (v30 + v32);
      if (!a4)
        goto LABEL_13;
    }
    else
    {
      v25 = 1;
      if (!a4)
        goto LABEL_13;
    }
LABEL_12:
    *a4 = v25;
    goto LABEL_13;
  }
  v13 = -[_UIAlertControllerPhoneTVMacView _numberOfActionsForMainActionButtonSequenceView](self, "_numberOfActionsForMainActionButtonSequenceView");
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionSequenceEdgeInsets");
  v16 = v15;
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionSequenceEdgeInsets");
  v19 = v12 - (v16 + v18);

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionSpacingForHorizontalLayout:", 1);
  v22 = (double)(v13 - 1);
  if (v22 < 0.0)
    v22 = 0.0;
  v23 = v19 - v22 * v21;

  if (-[_UIAlertControllerPhoneTVMacView hasDiscreteHorizontalCancelAction](self, "hasDiscreteHorizontalCancelAction"))
  {
    ++v13;
    -[_UIAlertControllerPhoneTVMacView _contentInsets](self, "_contentInsets");
    v23 = v23 - v24;
  }
  v25 = 0;
  v26 = v23 / (double)v13;
  if (a4)
    goto LABEL_12;
LABEL_13:
  v34 = v26;
  v35 = v10;
  result.height = v35;
  result.width = v34;
  return result;
}

- (CGSize)_itemSizeForHorizontalLayout:(BOOL)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UIAlertControllerPhoneTVMacView _itemSizeForHorizontalLayout:visualStyleRequiresActionRepresentationToFitItemSize:](self, "_itemSizeForHorizontalLayout:visualStyleRequiresActionRepresentationToFitItemSize:", a3, 0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_mainActionButtonSequenceViewSizeForHorizontalLayout:(BOOL)a3 itemSize:(CGSize)a4
{
  double height;
  double width;
  _BOOL8 v6;
  uint64_t v8;
  void *v9;
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
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v8 = -[_UIAlertControllerPhoneTVMacView _numberOfActionsForMainActionButtonSequenceView](self, "_numberOfActionsForMainActionButtonSequenceView");
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionSequenceEdgeInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v13 + v17;
  v19 = v11 + v15;
  -[_UIAlertControllerPhoneTVMacView _spaceRequiredForActionSectionsSpacing](self, "_spaceRequiredForActionSectionsSpacing");
  v21 = v20;
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "actionSpacingForHorizontalLayout:", v6);
  v24 = (double)(v8 - 1);
  if (v24 < 0.0)
    v24 = 0.0;
  v25 = v24 * v23;

  v26 = width + v18;
  if (v6)
  {
    v26 = v21 + width * (double)v8 + v18 + v25;
    v27 = height + v19;
  }
  else
  {
    v27 = v21 + height * (double)v8 + v19 + v25;
  }
  result.height = v27;
  result.width = v26;
  return result;
}

- (BOOL)_canLayOutActionsHorizontally
{
  void *v3;
  char v4;
  double v5;
  double v6;
  double v7;
  BOOL result;

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "permittedActionLayoutDirection");

  result = (v4 & 2) != 0
        && (-[_UIAlertControllerPhoneTVMacView _itemSizeForHorizontalLayout:](self, "_itemSizeForHorizontalLayout:", 1), v6 = v5, -[_UIAlertControllerPhoneTVMacView _minimumSizeForAllActions](self, "_minimumSizeForAllActions"), v6 >= v7)&& -[_UIAlertControllerPhoneTVMacView _numberOfActionsForMainActionButtonSequenceView](self, "_numberOfActionsForMainActionButtonSequenceView") > 0;
  return result;
}

- (id)_discreteCancelActionView
{
  void *v3;

  if (-[_UIAlertControllerPhoneTVMacView cancelActionIsDiscrete](self, "cancelActionIsDiscrete"))
  {
    -[_UIAlertControllerPhoneTVMacView __cancelActionView](self, "__cancelActionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_hasDiscreteCancelAction
{
  void *v3;
  BOOL v4;

  -[_UIAlertControllerPhoneTVMacView cancelAction](self, "cancelAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3
    && -[_UIAlertControllerPhoneTVMacView showsCancelAction](self, "showsCancelAction")
    && -[_UIAlertControllerPhoneTVMacView cancelActionIsDiscrete](self, "cancelActionIsDiscrete");

  return v4;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
  -[_UIAlertControllerPhoneTVMacView _updateConstraintSpacingForExternalOffset](self, "_updateConstraintSpacingForExternalOffset");
}

- (void)_updateConstraintSpacingForExternalOffset
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_resolvedStyle");

  if (!v4)
  {
    -[_UIAlertControllerPhoneTVMacView offset](self, "offset");
    v6 = v5;
    if (-[_UIAlertControllerPhoneTVMacView _hasDiscreteCancelAction](self, "_hasDiscreteCancelAction")
      && !-[_UIAlertControllerPhoneTVMacView _canLayOutActionsHorizontally](self, "_canLayOutActionsHorizontally"))
    {
      -[_UIAlertControllerPhoneTVMacView _marginBetweenInterfaceActionGroups](self, "_marginBetweenInterfaceActionGroups");
      v7 = v6 * -0.5;
      v12 = v7 + v11;
      -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewTopConstraint](self, "discreteCancelActionViewTopConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = v12;
    }
    else
    {
      v7 = -v6;
      -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewTopConstraint](self, "discreteCancelActionViewTopConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 0.0;
    }
    objc_msgSend(v8, "setConstant:", v10);

    -[_UIAlertControllerPhoneTVMacView contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", v7);

  }
}

- (void)_recomputeAlertControllerWidth
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  UIView *contentView;
  void *v9;
  id v10;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[_UIAlertControllerPhoneTVMacView _canLayOutActionsHorizontally](self, "_canLayOutActionsHorizontally");
    -[_UIAlertControllerPhoneTVMacView foregroundViewWidthConstraint](self, "foregroundViewWidthConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[UIView widthAnchor](self->_contentView, "widthAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAlertControllerPhoneTVMacView _layoutWidthForHorizontalLayout:](self, "_layoutWidthForHorizontalLayout:", v4);
      objc_msgSend(v6, "constraintEqualToConstant:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAlertControllerPhoneTVMacView setForegroundViewWidthConstraint:](self, "setForegroundViewWidthConstraint:", v7);

      contentView = self->_contentView;
      -[_UIAlertControllerPhoneTVMacView foregroundViewWidthConstraint](self, "foregroundViewWidthConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](contentView, "addConstraint:", v9);

    }
    -[_UIAlertControllerPhoneTVMacView foregroundViewWidthConstraint](self, "foregroundViewWidthConstraint");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView _layoutWidthForHorizontalLayout:](self, "_layoutWidthForHorizontalLayout:", v4);
    objc_msgSend(v10, "setConstant:");

  }
}

- (void)_configureActionGroupViewToAllowHorizontalLayout:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = &unk_1E1A93380;
  else
    v3 = &unk_1E1A93398;
  -[UIInterfaceActionGroupView setAllowedActionLayoutAxisByPriority:](self->_mainInterfaceActionsGroupView, "setAllowedActionLayoutAxisByPriority:", v3);
}

- (void)_actionLayoutDirectionChanged
{
  _BOOL8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _UIAlertControllerInterfaceActionGroupView *mainInterfaceActionsGroupView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  _UIAlertControllerInterfaceActionGroupView *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  UIView *contentView;
  void *v32;
  void *v33;
  void *v34;
  UIView *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL8 v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _UIAlertControllerInterfaceActionGroupView *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  char v73;
  _QWORD v74[3];

  v74[2] = *MEMORY[0x1E0C80C00];
  v3 = -[_UIAlertControllerPhoneTVMacView _canLayOutActionsHorizontally](self, "_canLayOutActionsHorizontally");
  -[_UIAlertControllerPhoneTVMacView _recomputeAlertControllerWidth](self, "_recomputeAlertControllerWidth");
  -[_UIAlertControllerPhoneTVMacView _configureActionGroupViewToAllowHorizontalLayout:](self, "_configureActionGroupViewToAllowHorizontalLayout:", v3);
  v73 = 0;
  -[_UIAlertControllerPhoneTVMacView _itemSizeForHorizontalLayout:visualStyleRequiresActionRepresentationToFitItemSize:](self, "_itemSizeForHorizontalLayout:visualStyleRequiresActionRepresentationToFitItemSize:", v3, &v73);
  v5 = v4;
  -[_UIAlertControllerPhoneTVMacView _mainActionButtonSequenceViewSizeForHorizontalLayout:itemSize:](self, "_mainActionButtonSequenceViewSizeForHorizontalLayout:itemSize:", v3);
  v7 = v6;
  v9 = v8;
  -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewWidthConstraint](self, "mainActionButtonSequenceViewWidthConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[UIView widthAnchor](self->_mainInterfaceActionsGroupView, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setMainActionButtonSequenceViewWidthConstraint:](self, "setMainActionButtonSequenceViewWidthConstraint:", v12);

    -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewWidthConstraint](self, "mainActionButtonSequenceViewWidthConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1148813312;
    objc_msgSend(v13, "setPriority:", v14);

    mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
    -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewWidthConstraint](self, "mainActionButtonSequenceViewWidthConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](mainInterfaceActionsGroupView, "addConstraint:", v16);

  }
  -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewWidthConstraint](self, "mainActionButtonSequenceViewWidthConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConstant:", v7);

  -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewHeightConstraint](self, "mainActionButtonSequenceViewHeightConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[UIView heightAnchor](self->_mainInterfaceActionsGroupView, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setMainActionButtonSequenceViewHeightConstraint:](self, "setMainActionButtonSequenceViewHeightConstraint:", v20);

    -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewHeightConstraint](self, "mainActionButtonSequenceViewHeightConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = 1132003328;
    objc_msgSend(v21, "setPriority:", v22);

    v23 = self->_mainInterfaceActionsGroupView;
    -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewHeightConstraint](self, "mainActionButtonSequenceViewHeightConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v23, "addConstraint:", v24);

  }
  -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewHeightConstraint](self, "mainActionButtonSequenceViewHeightConstraint");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setConstant:", v9);

  if (v3)
    v26 = 5;
  else
    v26 = 9;
  -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewHorizontalAlignmentConstraint](self, "mainActionButtonSequenceViewHorizontalAlignmentConstraint");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewHorizontalAlignmentConstraint](self, "mainActionButtonSequenceViewHorizontalAlignmentConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "firstAttribute");

    if (v30 != v26)
    {
      contentView = self->_contentView;
      -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewHorizontalAlignmentConstraint](self, "mainActionButtonSequenceViewHorizontalAlignmentConstraint");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView removeConstraint:](contentView, "removeConstraint:", v32);

      -[_UIAlertControllerPhoneTVMacView setMainActionButtonSequenceViewHorizontalAlignmentConstraint:](self, "setMainActionButtonSequenceViewHorizontalAlignmentConstraint:", 0);
    }
  }
  -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewHorizontalAlignmentConstraint](self, "mainActionButtonSequenceViewHorizontalAlignmentConstraint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", self->_mainInterfaceActionsGroupView, v26, 0, self->_contentView, v26);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setMainActionButtonSequenceViewHorizontalAlignmentConstraint:](self, "setMainActionButtonSequenceViewHorizontalAlignmentConstraint:", v34);

    v35 = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView mainActionButtonSequenceViewHorizontalAlignmentConstraint](self, "mainActionButtonSequenceViewHorizontalAlignmentConstraint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v35, "addConstraint:", v36);

  }
  -[_UIAlertControllerPhoneTVMacView discreteActionGroupViewHorizontalLayoutTrailingConstraint](self, "discreteActionGroupViewHorizontalLayoutTrailingConstraint");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    -[UIView trailingAnchor](self->_discreteCancelActionGroupView, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setDiscreteActionGroupViewHorizontalLayoutTrailingConstraint:](self, "setDiscreteActionGroupViewHorizontalLayoutTrailingConstraint:", v40);

  }
  -[_UIAlertControllerPhoneTVMacView _discreteCancelActionView](self, "_discreteCancelActionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
    v42 = v3;
  else
    v42 = 0;
  -[_UIAlertControllerPhoneTVMacView discreteActionGroupViewHorizontalLayoutTrailingConstraint](self, "discreteActionGroupViewHorizontalLayoutTrailingConstraint");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setActive:", v42);

  -[_UIAlertControllerPhoneTVMacView actionGroupEqualsContentViewWidthConstraint](self, "actionGroupEqualsContentViewWidthConstraint");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", v3 ^ 1);

  if (v41)
  {
    v45 = -[_UIAlertControllerPhoneTVMacView _canLayOutActionsHorizontally](self, "_canLayOutActionsHorizontally");
    v46 = (void *)MEMORY[0x1E0D156E0];
    v47 = (void *)MEMORY[0x1E0C99D20];
    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewTopConstraint](self, "discreteCancelActionViewTopConstraint");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewLeadingConstraint](self, "discreteCancelActionViewLeadingConstraint");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "arrayWithObjects:", v48, v49, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "deactivateConstraints:", v50);

    -[UIView topAnchor](self->_discreteCancelActionGroupView, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = self->_mainInterfaceActionsGroupView;
    if (v45)
    {
      -[UIView topAnchor](v52, "topAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, 0.0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAlertControllerPhoneTVMacView setDiscreteCancelActionViewTopConstraint:](self, "setDiscreteCancelActionViewTopConstraint:", v54);

      -[UIView leadingAnchor](self->_discreteCancelActionGroupView, "leadingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_mainInterfaceActionsGroupView, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAlertControllerPhoneTVMacView _marginBetweenInterfaceActionGroups](self, "_marginBetweenInterfaceActionGroups");
      objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
    }
    else
    {
      -[UIView bottomAnchor](v52, "bottomAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAlertControllerPhoneTVMacView _marginBetweenInterfaceActionGroups](self, "_marginBetweenInterfaceActionGroups");
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAlertControllerPhoneTVMacView setDiscreteCancelActionViewTopConstraint:](self, "setDiscreteCancelActionViewTopConstraint:", v59);

      -[UIView leadingAnchor](self->_discreteCancelActionGroupView, "leadingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_mainInterfaceActionsGroupView, "leadingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, 0.0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_UIAlertControllerPhoneTVMacView setDiscreteCancelActionViewLeadingConstraint:](self, "setDiscreteCancelActionViewLeadingConstraint:", v57);

    -[_UIAlertControllerPhoneTVMacView _updateConstraintSpacingForExternalOffset](self, "_updateConstraintSpacingForExternalOffset");
    v60 = (void *)MEMORY[0x1E0D156E0];
    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewTopConstraint](self, "discreteCancelActionViewTopConstraint");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v61;
    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewLeadingConstraint](self, "discreteCancelActionViewLeadingConstraint");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "activateConstraints:", v63);

    -[_UIAlertControllerPhoneTVMacView _discreteCancelActionView](self, "_discreteCancelActionView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "action");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "_contentViewController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      objc_msgSend(v66, "preferredContentSize");
      v68 = v67;
    }
    else
    {
      -[_UIAlertControllerPhoneTVMacView _discreteCancelActionView](self, "_discreteCancelActionView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v68 = v70;

    }
    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewWidthConstraint](self, "discreteCancelActionViewWidthConstraint");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setConstant:", v7);

    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewHeightConstraint](self, "discreteCancelActionViewHeightConstraint");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setConstant:", v68);

  }
  if (!v73)
    v5 = 0.0;
  -[UIInterfaceActionGroupView setRequiredActionRepresentationWidth:](self->_mainInterfaceActionsGroupView, "setRequiredActionRepresentationWidth:", v5);
  -[UIInterfaceActionGroupView setRequiredActionRepresentationWidth:](self->_discreteCancelActionGroupView, "setRequiredActionRepresentationWidth:", v5);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateMainScrollableHeaderViewHasRealContent
{
  -[_UIAlertControllerInterfaceActionGroupView setScrollableHeaderViewHasRealContent:](self->_mainInterfaceActionsGroupView, "setScrollableHeaderViewHasRealContent:", -[_UIAlertControllerPhoneTVMacView _buttonsAreTopMost](self, "_buttonsAreTopMost") ^ 1);
}

- (void)_propertiesChanged
{
  *(_WORD *)&self->_alertControllerViewFlags |= 0x800u;
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_updateForPropertyChangeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UIView *p_super;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UIView *v31;
  uint64_t v32;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UILabel *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  UILabel *v57;
  void *v58;
  void *v59;
  void *v60;
  UIView *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  UIView *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  _BOOL4 v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  UILabel *v79;
  _UIAlertControllerInterfaceActionGroupView *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  _QWORD v106[3];

  v106[2] = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&self->_alertControllerViewFlags & 0x800) == 0)
    return;
  *(_WORD *)&self->_alertControllerViewFlags &= ~0x800u;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView _updateMainScrollableHeaderViewHasRealContent](self, "_updateMainScrollableHeaderViewHasRealContent");
  -[_UIAlertControllerPhoneTVMacView headerContentViewControllerContainerViewTopAlignmentConstraint](self, "headerContentViewControllerContainerViewTopAlignmentConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIAlertControllerPhoneTVMacView headerContentViewControllerContainerViewTopAlignmentConstraint](self, "headerContentViewControllerContainerViewTopAlignmentConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObject:", v4);

  }
  -[_UIAlertControllerPhoneTVMacView titleAndMessageLabelVibrantContainerViewVerticalConstraints](self, "titleAndMessageLabelVibrantContainerViewVerticalConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIAlertControllerPhoneTVMacView titleAndMessageLabelVibrantContainerViewVerticalConstraints](self, "titleAndMessageLabelVibrantContainerViewVerticalConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObjectsFromArray:", v6);

  }
  -[_UIAlertControllerPhoneTVMacView titleLabelTopAlignmentConstraints](self, "titleLabelTopAlignmentConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIAlertControllerPhoneTVMacView titleLabelTopAlignmentConstraints](self, "titleLabelTopAlignmentConstraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObjectsFromArray:", v9);

  }
  -[_UIAlertControllerPhoneTVMacView messageLabelTopAlignmentConstraints](self, "messageLabelTopAlignmentConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_UIAlertControllerPhoneTVMacView messageLabelTopAlignmentConstraints](self, "messageLabelTopAlignmentConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObjectsFromArray:", v12);

  }
  -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewTopAlignmentConstraint](self, "contentViewControllerContainerViewTopAlignmentConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewTopAlignmentConstraint](self, "contentViewControllerContainerViewTopAlignmentConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObject:", v14);

  }
  -[_UIAlertControllerPhoneTVMacView textFieldViewControllerContainerViewTopAlignmentConstraints](self, "textFieldViewControllerContainerViewTopAlignmentConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_UIAlertControllerPhoneTVMacView textFieldViewControllerContainerViewTopAlignmentConstraints](self, "textFieldViewControllerContainerViewTopAlignmentConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObjectsFromArray:", v17);

  }
  -[_UIAlertControllerPhoneTVMacView detailMessageLabelTopAlignmentConstraint](self, "detailMessageLabelTopAlignmentConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_UIAlertControllerPhoneTVMacView detailMessageLabelTopAlignmentConstraint](self, "detailMessageLabelTopAlignmentConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObject:", v19);

  }
  -[_UIAlertControllerPhoneTVMacView contentViewTopConstraint](self, "contentViewTopConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_UIAlertControllerPhoneTVMacView contentViewTopConstraint](self, "contentViewTopConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObject:", v21);

  }
  -[_UIAlertControllerPhoneTVMacView contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_UIAlertControllerPhoneTVMacView contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObject:", v23);

  }
  -[_UIAlertControllerPhoneTVMacView contentScrollViewBottomConstraint](self, "contentScrollViewBottomConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_UIAlertControllerPhoneTVMacView contentScrollViewBottomConstraint](self, "contentScrollViewBottomConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObject:", v25);

  }
  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v105);
  p_super = self->_contentViewTopItemsView;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView headerContentViewController](self, "headerContentViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", self->_headerContentViewControllerContainerView, 3, 0, p_super, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setHeaderContentViewControllerContainerViewTopAlignmentConstraint:](self, "setHeaderContentViewControllerContainerViewTopAlignmentConstraint:", v29);

    -[_UIAlertControllerPhoneTVMacView headerContentViewControllerContainerViewTopAlignmentConstraint](self, "headerContentViewControllerContainerViewTopAlignmentConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v30);

    v31 = self->_headerContentViewControllerContainerView;
    v32 = 4;
    p_super = v31;
  }
  else
  {
    v32 = 3;
  }
  v33 = -[_UIAlertControllerPhoneTVMacView _hasTitle](self, "_hasTitle");
  v34 = -[_UIAlertControllerPhoneTVMacView _hasMessage](self, "_hasMessage");
  v35 = v34;
  v104 = v27;
  if ((v33 || v34) && self->_titleAndMessageLabelVibrantContainerView)
  {
    v36 = 12;
    if (v33)
      v37 = 11;
    else
      v37 = 12;
    v38 = *(Class *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____UIAlertControllerPhoneTVMacView__alertControllerViewFlags[v37]);
    if (!v34)
      v36 = 11;
    v102 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____UIAlertControllerPhoneTVMacView__alertControllerViewFlags[v36]));
    v103 = v38;
    objc_msgSend(v103, "topAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_titleAndMessageLabelVibrantContainerView, "topAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v100);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v39;
    objc_msgSend(v102, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_titleAndMessageLabelVibrantContainerView, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v106[1] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setTitleAndMessageLabelVibrantContainerViewVerticalConstraints:](self, "setTitleAndMessageLabelVibrantContainerViewVerticalConstraints:", v43);

    v27 = v104;
    -[_UIAlertControllerPhoneTVMacView titleAndMessageLabelVibrantContainerViewVerticalConstraints](self, "titleAndMessageLabelVibrantContainerViewVerticalConstraints");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v104, "addObjectsFromArray:", v44);
  }
  if (!v33)
  {
    if (!v35)
      goto LABEL_36;
LABEL_38:
    v51 = 0x1E0D15000uLL;
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", self->_messageLabel, 12, 0, p_super, v32);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      v53 = 746;
    else
      v53 = 748;
    +[_UIFlexibleConstantConstraintSet constraintSetWithCollapsableConstantPreferredEqualityConstraint:equalityPriority:](_UIFlexibleConstantConstraintSet, "constraintSetWithCollapsableConstantPreferredEqualityConstraint:equalityPriority:", v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setMessageLabelTopAlignmentConstraints:](self, "setMessageLabelTopAlignmentConstraints:", v54);

    -[_UIAlertControllerPhoneTVMacView messageLabelTopAlignmentConstraints](self, "messageLabelTopAlignmentConstraints");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraints");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v104;
    objc_msgSend(v104, "addObjectsFromArray:", v56);

    v57 = self->_messageLabel;
    v32 = 11;
    p_super = &v57->super;
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", self->_titleLabel, 12, 0, p_super, v32);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFlexibleConstantConstraintSet constraintSetWithCollapsableConstantPreferredEqualityConstraint:equalityPriority:](_UIFlexibleConstantConstraintSet, "constraintSetWithCollapsableConstantPreferredEqualityConstraint:equalityPriority:", v45, 748);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView setTitleLabelTopAlignmentConstraints:](self, "setTitleLabelTopAlignmentConstraints:", v46);

  -[_UIAlertControllerPhoneTVMacView titleLabelTopAlignmentConstraints](self, "titleLabelTopAlignmentConstraints");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraints");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObjectsFromArray:", v48);

  v49 = self->_titleLabel;
  v32 = 11;
  p_super = &v49->super;
  if (v35)
    goto LABEL_38;
LABEL_36:
  v50 = v104;
  v51 = 0x1E0D15000;
LABEL_42:
  -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(*(id *)(v51 + 1760), "constraintWithItem:attribute:relatedBy:toItem:attribute:", self->_contentViewControllerContainerView, 3, 0, p_super, v32);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setContentViewControllerContainerViewTopAlignmentConstraint:](self, "setContentViewControllerContainerViewTopAlignmentConstraint:", v59);

    -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewTopAlignmentConstraint](self, "contentViewControllerContainerViewTopAlignmentConstraint");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v60);

    v61 = self->_contentViewControllerContainerView;
    v32 = 4;
    p_super = v61;
  }
  if (-[_UIAlertControllerPhoneTVMacView _hasTextFields](self, "_hasTextFields"))
  {
    objc_msgSend(*(id *)(v51 + 1760), "constraintWithItem:attribute:relatedBy:toItem:attribute:", self->_textFieldViewControllerContainerView, 3, 0, p_super, v32);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIFlexibleConstantConstraintSet constraintSetWithCollapsableConstantPreferredEqualityConstraint:equalityPriority:](_UIFlexibleConstantConstraintSet, "constraintSetWithCollapsableConstantPreferredEqualityConstraint:equalityPriority:", v62, 745);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setTextFieldViewControllerContainerViewTopAlignmentConstraints:](self, "setTextFieldViewControllerContainerViewTopAlignmentConstraints:", v63);

    -[_UIAlertControllerPhoneTVMacView textFieldViewControllerContainerViewTopAlignmentConstraints](self, "textFieldViewControllerContainerViewTopAlignmentConstraints");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraints");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObjectsFromArray:", v65);

    v66 = self->_textFieldViewControllerContainerView;
    v32 = 4;
    p_super = v66;
  }
  objc_msgSend(*(id *)(v51 + 1760), "constraintWithItem:attribute:relatedBy:toItem:attribute:", self->_contentViewTopItemsView, 4, 0, p_super, v32);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView setContentScrollViewBottomConstraint:](self, "setContentScrollViewBottomConstraint:", v67);

  -[_UIAlertControllerPhoneTVMacView contentScrollViewBottomConstraint](self, "contentScrollViewBottomConstraint");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v68);

  -[_UIAlertControllerPhoneTVMacView separatedHeaderContentViewController](self, "separatedHeaderContentViewController");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 9;
  if (!v69)
    v70 = 7;
  v71 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                          + OBJC_IVAR____UIAlertControllerPhoneTVMacView__alertControllerViewFlags[v70]));

  v72 = -[_UIAlertControllerPhoneTVMacView hasDiscreteHorizontalCancelAction](self, "hasDiscreteHorizontalCancelAction");
  v73 = 16;
  if (!v72)
    v73 = 7;
  v74 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                          + OBJC_IVAR____UIAlertControllerPhoneTVMacView__alertControllerViewFlags[v73]));
  if (-[_UIAlertControllerPhoneTVMacView _hasDetailMessage](self, "_hasDetailMessage"))
  {
    -[UIView firstBaselineAnchor](self->_detailMessageLabel, "firstBaselineAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_mainInterfaceActionsGroupView, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setDetailMessageLabelTopAlignmentConstraint:](self, "setDetailMessageLabelTopAlignmentConstraint:", v77);

    -[_UIAlertControllerPhoneTVMacView detailMessageLabelTopAlignmentConstraint](self, "detailMessageLabelTopAlignmentConstraint");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v78);

    v79 = self->_detailMessageLabel;
    v74 = v79;
  }
  if (-[_UIAlertControllerPhoneTVMacView _hasDiscreteCancelAction](self, "_hasDiscreteCancelAction"))
  {
    v80 = self->_discreteCancelActionGroupView;

    v74 = v80;
  }
  -[UIView topAnchor](self->_contentView, "topAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView setContentViewTopConstraint:](self, "setContentViewTopConstraint:", v83);

  -[_UIAlertControllerPhoneTVMacView contentViewTopConstraint](self, "contentViewTopConstraint");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v84);

  -[_UIAlertControllerPhoneTVMacView separatedHeaderContentViewController](self, "separatedHeaderContentViewController");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v71, 7, 0, self->_contentView, 7);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setSeparatedHeaderContentViewControllerContainerViewWidthConstraint:](self, "setSeparatedHeaderContentViewControllerContainerViewWidthConstraint:", v86);

    -[_UIAlertControllerPhoneTVMacView separatedHeaderContentViewControllerContainerViewWidthConstraint](self, "separatedHeaderContentViewControllerContainerViewWidthConstraint");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v87);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v71, 4, 0, self->_mainInterfaceActionsGroupView, 3);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setSeparatedHeaderContentViewControllerContainerViewBottomConstraint:](self, "setSeparatedHeaderContentViewControllerContainerViewBottomConstraint:", v88);

    -[_UIAlertControllerPhoneTVMacView separatedHeaderContentViewControllerContainerViewBottomConstraint](self, "separatedHeaderContentViewControllerContainerViewBottomConstraint");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = 0.0;
    if ((*(_WORD *)&self->_alertControllerViewFlags & 0x10) == 0)
    {
      -[_UIAlertControllerPhoneTVMacView _marginBetweenInterfaceActionGroups](self, "_marginBetweenInterfaceActionGroups");
      v90 = v91;
    }
    objc_msgSend(v89, "constant");
    objc_msgSend(v89, "setConstant:", v92 - v90);

    -[_UIAlertControllerPhoneTVMacView separatedHeaderContentViewControllerContainerViewBottomConstraint](self, "separatedHeaderContentViewControllerContainerViewBottomConstraint");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v93);

  }
  -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "bottomAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v96);

  -[_UIAlertControllerPhoneTVMacView contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v97);

  -[_UIAlertControllerPhoneTVMacView _updateConstraintConstants](self, "_updateConstraintConstants");
  v98 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(v50, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "activateConstraints:", v99);

}

- (void)_performBatchActionChangesWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = (void (**)(_QWORD))a3;
  -[_UIAlertControllerPhoneTVMacView actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  ++self->_batchActionChangesInProgressCount;
  v4[2](v4);

  --self->_batchActionChangesInProgressCount;
  -[_UIAlertControllerPhoneTVMacView actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[_UIAlertControllerPhoneTVMacView _propertiesChanged](self, "_propertiesChanged");
  if ((*(_WORD *)&self->_alertControllerViewFlags & 0x400) != 0 || v6 != v8)
    -[_UIAlertControllerPhoneTVMacView _actionsChanged](self, "_actionsChanged");
}

- (void)_actionsChanged
{
  __int16 alertControllerViewFlags;
  id v4;

  alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
  *(_WORD *)&self->_alertControllerViewFlags = alertControllerViewFlags & 0xFBFF;
  if (self->_batchActionChangesInProgressCount < 1)
  {
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView _updateActionViewVisualStyle:](self, "_updateActionViewVisualStyle:", 0);
    -[_UIAlertControllerPhoneTVMacView _associateActionsWithActionViews](self, "_associateActionsWithActionViews");
    -[_UIAlertControllerPhoneTVMacView _updateActionViewVisualStyle:](self, "_updateActionViewVisualStyle:", v4);
    -[_UIAlertControllerPhoneTVMacView _updateActionViewHeight](self, "_updateActionViewHeight");
    *(_WORD *)&self->_alertControllerViewFlags &= ~0x200u;
    -[_UIAlertControllerPhoneTVMacView _reloadInterfaceActionViewRepresentations](self, "_reloadInterfaceActionViewRepresentations");
    -[_UIAlertControllerPhoneTVMacView _updatePreferredAction](self, "_updatePreferredAction");
    if (v4)
      -[_UIAlertControllerPhoneTVMacView _actionLayoutDirectionChanged](self, "_actionLayoutDirectionChanged");

  }
  else
  {
    *(_WORD *)&self->_alertControllerViewFlags = alertControllerViewFlags | 0x400;
  }
}

- (void)_associateActionsWithActionViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _UIAlertControllerActionView *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  NSMutableArray *actionViews;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  id obj;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5 - -[NSMutableArray count](self->_actionViews, "count");
  if (v6 >= 1)
  {
    do
    {
      v7 = -[_UIAlertControllerActionView initWithFrame:]([_UIAlertControllerActionView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
      -[NSMutableArray addObject:](self->_actionViews, "addObject:", v7);

      --v6;
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v9 = self->_actionViews;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v61 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v14, "action");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "action");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v14, v16);

        }
        else
        {
          objc_msgSend(v47, "addObject:", v14);
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    }
    while (v11);
  }

  v17 = (void *)objc_msgSend(v4, "mutableCopy");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v18 = v4;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v57 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
        objc_msgSend(v8, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v8, "removeObjectForKey:", v23);
          objc_msgSend(v17, "removeObject:", v23);
          objc_msgSend(v3, "setObject:forKey:", v24, v23);
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v20);
  }
  v45 = v18;

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v17;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v53 != v27)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k);
        objc_msgSend(v47, "firstObject", v45);
        v30 = objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v31 = (void *)v30;
          objc_msgSend(v47, "removeObjectAtIndex:", 0);
        }
        else
        {
          objc_msgSend(v8, "objectEnumerator");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "nextObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "action");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIAlertControllerPhoneTVMacView _interfaceActionRepresentationForAlertAlertAction:](self, "_interfaceActionRepresentationForAlertAlertAction:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "invalidate");

          objc_msgSend(v31, "action");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObjectForKey:", v35);

        }
        -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setAlertController:", v36);

        objc_msgSend(v31, "setAction:", v29);
        objc_msgSend(v3, "setObject:forKey:", v31, v29);

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v26);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v45, "count"));
  v37 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  actionViews = self->_actionViews;
  self->_actionViews = v37;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[_UIAlertControllerPhoneTVMacView actions](self, "actions");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v49;
    do
    {
      for (m = 0; m != v41; ++m)
      {
        if (*(_QWORD *)v49 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * m), v45);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](self->_actionViews, "addObject:", v44);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
    }
    while (v41);
  }

}

- (void)_textFieldsChanged
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  UIView *textFieldViewControllerContainerView;
  void *v9;
  void *v10;
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
  id v28;

  -[_UIAlertControllerPhoneTVMacView textFields](self, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[_UIAlertControllerPhoneTVMacView _textFieldViewController](self, "_textFieldViewController");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
    {
      -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_willParentTextFieldViewController");

      textFieldViewControllerContainerView = self->_textFieldViewControllerContainerView;
      objc_msgSend(v28, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](textFieldViewControllerContainerView, "addSubview:", v9);

      -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_didParentTextFieldViewController");

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leftAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_textFieldViewControllerContainerView, "leftAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v15);

    objc_msgSend(v28, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_textFieldViewControllerContainerView, "rightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v19);

    objc_msgSend(v28, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_textFieldViewControllerContainerView, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v23);

    objc_msgSend(v28, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_textFieldViewControllerContainerView, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v27);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v11);
    -[_UIAlertControllerPhoneTVMacView _sizeOfTextFieldViewControllerChanged](self, "_sizeOfTextFieldViewControllerChanged");

  }
}

- (id)_interfaceActionRepresentationForAlertAlertAction:(id)a3
{
  return (id)objc_msgSend(a3, "_interfaceActionRepresentation");
}

- (id)_interfaceActionForAlertAction:(id)a3 inActionGroupView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a4, "actionGroup", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "underlyingAlertAction");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v5);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_reloadInterfaceActionViewRepresentations
{
  void *v3;
  void *v4;
  void *v5;
  _UIAlertControllerInterfaceActionGroupView *mainInterfaceActionsGroupView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIAlertControllerInterfaceActionGroupView *discreteCancelActionGroupView;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[_UIAlertControllerPhoneTVMacView _unlocalizedOrderedPresentableAlertActionViewRepresentations](self, "_unlocalizedOrderedPresentableAlertActionViewRepresentations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView _indexesOfActionSectionSeparators](self, "_indexesOfActionSectionSeparators");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _newInterfaceActionSectionsForAlertActionViewRepresentations(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
  +[UIInterfaceActionGroup actionGroupWithActionsBySection:](UIInterfaceActionGroup, "actionGroupWithActionsBySection:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView setActionGroup:](mainInterfaceActionsGroupView, "setActionGroup:", v7);

  if (-[_UIAlertControllerPhoneTVMacView _hasDiscreteCancelAction](self, "_hasDiscreteCancelAction"))
  {
    -[_UIAlertControllerPhoneTVMacView _discreteCancelActionView](self, "_discreteCancelActionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _newInterfaceActionSectionsForAlertActionViewRepresentations(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    discreteCancelActionGroupView = self->_discreteCancelActionGroupView;
    +[UIInterfaceActionGroup actionGroupWithActionsBySection:](UIInterfaceActionGroup, "actionGroupWithActionsBySection:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterfaceActionGroupView setActionGroup:](discreteCancelActionGroupView, "setActionGroup:", v13);

  }
  -[_UIAlertControllerPhoneTVMacView _ensureActionViewRepresentationsHaveMetrics](self, "_ensureActionViewRepresentationsHaveMetrics");
  -[_UIAlertControllerPhoneTVMacView _reloadInterfaceActionsGroupViewPreferredAction](self, "_reloadInterfaceActionsGroupViewPreferredAction");

}

- (void)_reloadInterfaceActionsGroupViewPreferredAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UIAlertControllerPhoneTVMacView _effectivePreferredAction](self, "_effectivePreferredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView _interfaceActionForAlertAction:inActionGroupView:](self, "_interfaceActionForAlertAction:inActionGroupView:", v3, self->_mainInterfaceActionsGroupView);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UIInterfaceActionGroupView actionGroup](self->_mainInterfaceActionsGroupView, "actionGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredAction:", v8);

  -[_UIAlertControllerPhoneTVMacView _effectivePreferredAction](self, "_effectivePreferredAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView _interfaceActionForAlertAction:inActionGroupView:](self, "_interfaceActionForAlertAction:inActionGroupView:", v5, self->_discreteCancelActionGroupView);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIInterfaceActionGroupView actionGroup](self->_discreteCancelActionGroupView, "actionGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredAction:", v6);

}

- (void)_scrollInitialActionToVisibleForPresentation
{
  void *v3;
  void *v4;
  _UIAlertControllerInterfaceActionGroupView *mainInterfaceActionsGroupView;
  void *v6;
  void *v7;
  id v8;

  -[UIInterfaceActionGroupView actionGroup](self->_mainInterfaceActionsGroupView, "actionGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
    -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView _interfaceActionForAlertAction:inActionGroupView:](self, "_interfaceActionForAlertAction:inActionGroupView:", v6, self->_mainInterfaceActionsGroupView);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterfaceActionGroupView scrollToCenterForInterfaceAction:](mainInterfaceActionsGroupView, "scrollToCenterForInterfaceAction:", v7);

  }
}

- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = objc_opt_class();
  if (v10 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAlertControllerPhoneTVMacView.m"), 1623, CFSTR("unexpected class %@ for interface action"), objc_opt_class());

  }
  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "underlyingAlertAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83___UIAlertControllerPhoneTVMacView_interfaceAction_invokeActionHandler_completion___block_invoke;
  v15[3] = &unk_1E16B1BA0;
  v16 = v9;
  v13 = v9;
  objc_msgSend(v11, "_dismissWithAction:dismissCompletion:", v12, v15);

}

- (BOOL)_shouldHaveCancelActionInMainActionButtonSequenceView
{
  void *v3;
  _BOOL4 v4;

  if (-[_UIAlertControllerPhoneTVMacView showsCancelAction](self, "showsCancelAction"))
  {
    -[_UIAlertControllerPhoneTVMacView cancelAction](self, "cancelAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = !-[_UIAlertControllerPhoneTVMacView cancelActionIsDiscrete](self, "cancelActionIsDiscrete");
    else
      LOBYTE(v4) = 0;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)_unlocalizedOrderedPresentableAlertActionViewRepresentations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _UIAlertControllerPhoneTVMacView *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView _unlocalizedOrderedPresentableAlertActions](self, "_unlocalizedOrderedPresentableAlertActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96___UIAlertControllerPhoneTVMacView__unlocalizedOrderedPresentableAlertActionViewRepresentations__block_invoke;
  v11[3] = &unk_1E16C50B0;
  v12 = v4;
  v13 = self;
  v6 = v3;
  v14 = v6;
  v7 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
  v8 = v14;
  v9 = v6;

  return v9;
}

- (id)_unlocalizedOrderedPresentableAlertActions
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIAlertControllerPhoneTVMacView _canLayOutActionsHorizontally](self, "_canLayOutActionsHorizontally");
  v5 = -[_UIAlertControllerPhoneTVMacView _shouldHaveCancelActionInMainActionButtonSequenceView](self, "_shouldHaveCancelActionInMainActionButtonSequenceView");
  v6 = -[_UIAlertControllerPhoneTVMacView _actionsReversed](self, "_actionsReversed");
  -[_UIAlertControllerPhoneTVMacView _presentableAlertActions](self, "_presentableAlertActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78___UIAlertControllerPhoneTVMacView__unlocalizedOrderedPresentableAlertActions__block_invoke;
    v10[3] = &unk_1E16B2DD0;
    v11 = v3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    v7 = v11;
  }
  else
  {
    objc_msgSend(v3, "addObjectsFromArray:", v7);
  }

  if (v5)
  {
    -[_UIAlertControllerPhoneTVMacView cancelAction](self, "cancelAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v8);
    if (v4)
      objc_msgSend(v3, "insertObject:atIndex:", v8, 0);
    else
      objc_msgSend(v3, "addObject:", v8);

  }
  return v3;
}

- (id)_presentableAlertActions
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIAlertControllerPhoneTVMacView _shouldHaveCancelActionInMainActionButtonSequenceView](self, "_shouldHaveCancelActionInMainActionButtonSequenceView");
  -[_UIAlertControllerPhoneTVMacView actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  if (!v4)
  {
    -[_UIAlertControllerPhoneTVMacView cancelAction](self, "cancelAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v6);

  }
  return v3;
}

- (int64_t)_numberOfActionsForMainActionButtonSequenceView
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;

  -[_UIAlertControllerPhoneTVMacView actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!-[_UIAlertControllerPhoneTVMacView _shouldHaveCancelActionInMainActionButtonSequenceView](self, "_shouldHaveCancelActionInMainActionButtonSequenceView"))
  {
    -[_UIAlertControllerPhoneTVMacView cancelAction](self, "cancelAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

    v4 -= v6;
  }
  return v4;
}

- (id)_effectivePreferredAction
{
  return self->_effectivePreferredAction;
}

- (void)_updatePreferredAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UIAlertAction *v11;
  UIAlertAction *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[_UIAlertControllerPhoneTVMacView actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView cancelAction](self, "cancelAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_resolvedStyle");
  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_visualStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIAlertControllerActionToEmphasizeGivenActions(v3, v4, v6, v8, v10);
  v11 = (UIAlertAction *)objc_claimAutoreleasedReturnValue();

  v12 = self->_effectivePreferredAction;
  if (v12 != v11 || !-[UIAlertAction _isPreferred](v11, "_isPreferred"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v3;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "_setIsPreferred:", 0, (_QWORD)v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

    objc_storeStrong((id *)&self->_effectivePreferredAction, v11);
    -[UIAlertAction _setIsPreferred:](self->_effectivePreferredAction, "_setIsPreferred:", 1);
    -[_UIAlertControllerPhoneTVMacView _reloadInterfaceActionsGroupViewPreferredAction](self, "_reloadInterfaceActionsGroupViewPreferredAction");
    -[UIView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

}

- (BOOL)_actionLayoutIsVertical
{
  return -[UIInterfaceActionGroupView actionLayoutAxis](self->_mainInterfaceActionsGroupView, "actionLayoutAxis") == 1;
}

- (BOOL)hasDiscreteHorizontalCancelAction
{
  _BOOL4 v3;

  v3 = -[_UIAlertControllerPhoneTVMacView _hasDiscreteCancelAction](self, "_hasDiscreteCancelAction");
  if (v3)
  {
    v3 = -[_UIAlertControllerPhoneTVMacView _buttonsAreTopMost](self, "_buttonsAreTopMost");
    if (v3)
      LOBYTE(v3) = -[_UIAlertControllerPhoneTVMacView _numberOfActionsForMainActionButtonSequenceView](self, "_numberOfActionsForMainActionButtonSequenceView") > 0;
  }
  return v3;
}

- (double)_marginBetweenInterfaceActionGroups
{
  void *v2;
  double v3;
  double v4;

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_spacingBetweenDismissButtonAndContent");
  v4 = v3;

  return v4;
}

- (CGSize)_contentViewControllerSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)_labelHorizontalInsets
{
  void *v2;
  double v3;
  double v4;

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_labelHorizontalInsets");
  v4 = v3;

  return v4;
}

- (CGSize)_minimumSizeForAllActions
{
  void *v3;
  void *v4;
  CGSize *p_largestActionDimension;
  double *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double width;
  double height;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGSize result;

  v28 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&self->_alertControllerViewFlags & 0x200) == 0)
  {
    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewWidthConstraint](self, "discreteCancelActionViewWidthConstraint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActive:", 0);

    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewHeightConstraint](self, "discreteCancelActionViewHeightConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActive:", 0);

    -[_UIAlertControllerPhoneTVMacView _ensureActionViewRepresentationsHaveMetrics](self, "_ensureActionViewRepresentationsHaveMetrics");
    p_largestActionDimension = &self->_largestActionDimension;
    v6 = (double *)MEMORY[0x1E0C9D820];
    self->_largestActionDimension = (CGSize)*MEMORY[0x1E0C9D820];
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = self->_actionViews;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      v11 = *v6;
      v12 = v6[1];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "action");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_contentViewController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v16, "preferredContentSize");
          else
            objc_msgSend(v14, "systemLayoutSizeFittingSize:", v11, v12);
          if (v17 > p_largestActionDimension->width)
            p_largestActionDimension->width = v17;
          if (v18 > self->_largestActionDimension.height)
            self->_largestActionDimension.height = v18;

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewWidthConstraint](self, "discreteCancelActionViewWidthConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewHeightConstraint](self, "discreteCancelActionViewHeightConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    *(_WORD *)&self->_alertControllerViewFlags |= 0x200u;
  }
  width = self->_largestActionDimension.width;
  height = self->_largestActionDimension.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:(id)a3
{
  _UIAlertControllerInterfaceActionGroupView *mainInterfaceActionsGroupView;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[UIInterfaceActionGroupView beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:](self->_mainInterfaceActionsGroupView, "beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:", a3);
  mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
  v6[0] = self->_discreteCancelActionGroupView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView setSimultaneouslyPresentedGroupViews:](mainInterfaceActionsGroupView, "setSimultaneouslyPresentedGroupViews:", v5);

}

- (void)setSpringLoaded:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_springLoaded != a3)
  {
    v3 = a3;
    self->_springLoaded = a3;
    -[UIInterfaceActionGroupView setSpringLoaded:](self->_mainInterfaceActionsGroupView, "setSpringLoaded:");
    -[UIInterfaceActionGroupView setSpringLoaded:](self->_discreteCancelActionGroupView, "setSpringLoaded:", v3);
  }
}

- (BOOL)_shouldAllowPassthroughToLayersBehindUsForTouches:(id)a3
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86___UIAlertControllerPhoneTVMacView__shouldAllowPassthroughToLayersBehindUsForTouches___block_invoke;
  v6[3] = &unk_1E16B2040;
  v6[4] = self;
  objc_msgSend(a3, "objectsPassingTest:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[_UIAlertControllerPhoneTVMacView _shouldAllowPassthroughToLayersBehindUsForTouches:](self, "_shouldAllowPassthroughToLayersBehindUsForTouches:", v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIAlertControllerPhoneTVMacView;
    -[UIResponder touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v6, v7);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[_UIAlertControllerPhoneTVMacView _shouldAllowPassthroughToLayersBehindUsForTouches:](self, "_shouldAllowPassthroughToLayersBehindUsForTouches:", v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIAlertControllerPhoneTVMacView;
    -[UIResponder touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v6, v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[_UIAlertControllerPhoneTVMacView _shouldAllowPassthroughToLayersBehindUsForTouches:](self, "_shouldAllowPassthroughToLayersBehindUsForTouches:", v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIAlertControllerPhoneTVMacView;
    -[UIResponder touchesEnded:withEvent:](&v8, sel_touchesEnded_withEvent_, v6, v7);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[_UIAlertControllerPhoneTVMacView _shouldAllowPassthroughToLayersBehindUsForTouches:](self, "_shouldAllowPassthroughToLayersBehindUsForTouches:", v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIAlertControllerPhoneTVMacView;
    -[UIResponder touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v6, v7);
  }

}

- (void)_setVisualStyle:(id)a3
{
  UIAlertControllerVisualStyle *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  UIAlertControllerVisualStyle *visualStyle;
  void *v13;
  id v14;

  v4 = (UIAlertControllerVisualStyle *)a3;
  -[_UIAlertControllerPhoneTVMacView _unlocalizedOrderedPresentableAlertActions](self, "_unlocalizedOrderedPresentableAlertActions");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  -[UIAlertControllerVisualStyle traitCollection](v4, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v7 == v9)
  {
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

  }
  else
  {
    v11 = 1;
  }
  visualStyle = self->_visualStyle;
  self->_visualStyle = v4;

  -[_UIAlertControllerPhoneTVMacView _updateStyleForIdiomChange:](self, "_updateStyleForIdiomChange:", v11);
  -[_UIAlertControllerPhoneTVMacView _updateActionsGroupPresentationStyles](self, "_updateActionsGroupPresentationStyles");
  -[_UIAlertControllerPhoneTVMacView _unlocalizedOrderedPresentableAlertActions](self, "_unlocalizedOrderedPresentableAlertActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", v13) & 1) == 0)
    -[_UIAlertControllerPhoneTVMacView _reloadInterfaceActionViewRepresentations](self, "_reloadInterfaceActionViewRepresentations");
  -[_UIAlertControllerPhoneTVMacView _updateBackdropView:](self, "_updateBackdropView:", -[_UIAlertControllerPhoneTVMacView shouldHaveBackdropView](self, "shouldHaveBackdropView"));
  -[_UIAlertControllerPhoneTVMacView _updateCancelActionBeingDiscrete](self, "_updateCancelActionBeingDiscrete");

}

- (id)_visualStyle
{
  return self->_visualStyle;
}

- (void)_updateStyleForIdiomChange:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&self->_alertControllerViewFlags &= ~0x200u;
  -[_UIAlertControllerPhoneTVMacView _updateLabelFontSizes](self, "_updateLabelFontSizes");
  -[_UIAlertControllerPhoneTVMacView _updateLabelTextColor](self, "_updateLabelTextColor");
  -[_UIAlertControllerPhoneTVMacView _updateLabelProperties](self, "_updateLabelProperties");
  -[_UIAlertControllerPhoneTVMacView _updateMainGroupViewProperties](self, "_updateMainGroupViewProperties");
  -[_UIAlertControllerPhoneTVMacView _updateActionViewVisualStyle:](self, "_updateActionViewVisualStyle:", v5);
  -[_UIAlertControllerPhoneTVMacView _updateActionViewHeight](self, "_updateActionViewHeight");
  if (v3)
    -[_UIAlertControllerPhoneTVMacView _propertiesChanged](self, "_propertiesChanged");
  -[_UIAlertControllerPhoneTVMacView _updateInsets](self, "_updateInsets");
  -[_UIAlertControllerPhoneTVMacView _updateContentView](self, "_updateContentView");
  -[_UIAlertControllerPhoneTVMacView _updateConstraintConstants](self, "_updateConstraintConstants");
  -[_UIAlertControllerPhoneTVMacView _updatePreferredAction](self, "_updatePreferredAction");
  -[_UIAlertControllerPhoneTVMacView _updateTintColor](self, "_updateTintColor");
  -[_UIAlertControllerPhoneTVMacView _actionLayoutDirectionChanged](self, "_actionLayoutDirectionChanged");

}

- (void)_updateTitleLabelContents
{
  _BOOL4 v3;
  UILabel *titleLabel;
  id v5;

  v3 = -[_UIAlertControllerPhoneTVMacView _hasAttributedTitle](self, "_hasAttributedTitle");
  titleLabel = self->_titleLabel;
  if (v3)
  {
    -[_UIAlertControllerPhoneTVMacView _attributedTitle](self, "_attributedTitle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](titleLabel, "setAttributedText:");
  }
  else
  {
    -[_UIAlertControllerPhoneTVMacView title](self, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](titleLabel, "setText:");
  }

}

- (void)_updateDetailLabelContents
{
  UILabel *detailMessageLabel;
  id v4;

  if (-[_UIAlertControllerPhoneTVMacView _hasDetailMessage](self, "_hasDetailMessage"))
  {
    detailMessageLabel = self->_detailMessageLabel;
    -[_UIAlertControllerPhoneTVMacView _attributedDetailMessage](self, "_attributedDetailMessage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](detailMessageLabel, "setAttributedText:", v4);

  }
}

- (void)_updateMessageLabelContents
{
  _BOOL4 v3;
  UILabel *messageLabel;
  id v5;

  v3 = -[_UIAlertControllerPhoneTVMacView _hasAttributedMessage](self, "_hasAttributedMessage");
  messageLabel = self->_messageLabel;
  if (v3)
  {
    -[_UIAlertControllerPhoneTVMacView _attributedMessage](self, "_attributedMessage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](messageLabel, "setAttributedText:");
  }
  else
  {
    -[_UIAlertControllerPhoneTVMacView message](self, "message");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](messageLabel, "setText:");
  }

}

- (void)_updateTitleLabelFontSize
{
  UILabel *titleLabel;
  void *v4;
  id v5;

  if (!-[_UIAlertControllerPhoneTVMacView _hasAttributedTitle](self, "_hasAttributedTitle"))
  {
    titleLabel = self->_titleLabel;
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleLabelFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](titleLabel, "setFont:", v4);

  }
}

- (void)_updateDetailLabelFontSize
{
  UILabel *detailMessageLabel;
  void *v3;
  id v4;

  detailMessageLabel = self->_detailMessageLabel;
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_detailMessageFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](detailMessageLabel, "setFont:", v3);

}

- (void)_updateMessageLabelFontSize
{
  UILabel *messageLabel;
  void *v4;
  id v5;

  if (!-[_UIAlertControllerPhoneTVMacView _hasAttributedMessage](self, "_hasAttributedMessage"))
  {
    messageLabel = self->_messageLabel;
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageLabelFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](messageLabel, "setFont:", v4);

  }
}

- (void)_updateLabelFontSizes
{
  -[_UIAlertControllerPhoneTVMacView _updateTitleLabelFontSize](self, "_updateTitleLabelFontSize");
  -[_UIAlertControllerPhoneTVMacView _updateMessageLabelFontSize](self, "_updateMessageLabelFontSize");
  -[_UIAlertControllerPhoneTVMacView _updateDetailLabelFontSize](self, "_updateDetailLabelFontSize");
}

- (void)_updateLabelTextColor
{
  UILabel *titleLabel;
  void *v4;
  void *v5;
  UILabel *messageLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  if (!-[_UIAlertControllerPhoneTVMacView _hasAttributedTitle](self, "_hasAttributedTitle"))
  {
    titleLabel = self->_titleLabel;
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](titleLabel, "setTextColor:", v5);

  }
  if (!-[_UIAlertControllerPhoneTVMacView _hasAttributedMessage](self, "_hasAttributedMessage"))
  {
    messageLabel = self->_messageLabel;
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](messageLabel, "setTextColor:", v8);

    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageCompositingFilter");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (-[_UIAlertControllerPhoneTVMacView _titleAndMessageLabelUseVibrancy](self, "_titleAndMessageLabelUseVibrancy")
      || !v16)
    {
      -[UIView layer](self->_contentViewTopItemsView, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAllowsGroupBlending:", 1);

      -[UIView layer](self->_contentViewTopItemsView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 1;
    }
    else
    {
      -[UIView layer](self->_messageLabel, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCompositingFilter:", v16);

      -[UIView layer](self->_contentViewTopItemsView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAllowsGroupBlending:", 0);

      -[UIView layer](self->_contentViewTopItemsView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 0;
    }
    objc_msgSend(v12, "setAllowsGroupOpacity:", v14);

  }
}

- (void)_updateLabelProperties
{
  UIAlertController **p_alertController;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  UILabel *titleLabel;
  id v9;
  UILabel *messageLabel;
  id v11;

  p_alertController = &self->_alertController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  if (objc_msgSend(WeakRetained, "_titleMaximumLineCount") < 0)
  {
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "maximumNumberOfLinesInTitleLabel");
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)p_alertController);
    v6 = objc_msgSend(v5, "_titleMaximumLineCount");
  }
  v7 = v6;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v7);
  titleLabel = self->_titleLabel;
  v9 = objc_loadWeakRetained((id *)p_alertController);
  -[UILabel setLineBreakMode:](titleLabel, "setLineBreakMode:", objc_msgSend(v9, "_titleLineBreakMode"));

  messageLabel = self->_messageLabel;
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setNumberOfLines:](messageLabel, "setNumberOfLines:", objc_msgSend(v11, "maximumNumberOfLinesInMessageLabel"));

}

- (void)_updateInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[_UIAlertControllerPhoneTVMacView _contentInsets](self, "_contentInsets");
  v4 = v3;
  v6 = v5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_dimmingViewForegroundViewTopConstraints;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11++), "setConstant:", v4);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_dimmingViewForegroundViewBottomConstraints;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    v16 = -v6;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "setConstant:", v16, (_QWORD)v18);
      }
      while (v14 != v17);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

}

- (double)_maximumWidthUsingAccessibilityWidthIfActionsAreTruncated:(double)a3
{
  double v5;
  void *v6;
  double v7;

  -[_UIAlertControllerPhoneTVMacView _minimumSizeForAllActions](self, "_minimumSizeForAllActions");
  if (v5 > a3 && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityWidth");
    a3 = v7;

  }
  return a3;
}

- (void)_updateContentView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  _BOOL8 v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  UIView *contentView;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  id v64;

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumWidthForTitleAndMessageContentView");
  -[_UIAlertControllerPhoneTVMacView _maximumWidthUsingAccessibilityWidthIfActionsAreTruncated:](self, "_maximumWidthUsingAccessibilityWidthIfActionsAreTruncated:");
  v5 = v4;

  -[_UIAlertControllerPhoneTVMacView contentScrollViewMaximumWidthConstraint](self, "contentScrollViewMaximumWidthConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 0.0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "setConstant:", v5);

    -[_UIAlertControllerPhoneTVMacView contentScrollViewMaximumWidthConstraint](self, "contentScrollViewMaximumWidthConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
  }
  objc_msgSend(v6, "setActive:", v8);

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maximumContentHeight");
  v11 = v10;

  -[_UIAlertControllerPhoneTVMacView contentScrollViewMaximumHeightConstraint](self, "contentScrollViewMaximumHeightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "setConstant:", v11);

    -[_UIAlertControllerPhoneTVMacView contentScrollViewMaximumHeightConstraint](self, "contentScrollViewMaximumHeightConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1;
  }
  objc_msgSend(v12, "setActive:", v14);

  WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  objc_msgSend(WeakRetained, "_window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    -[UIView window](self, "window");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v64 = v18;

  v19 = objc_msgSend(v64, "_toWindowOrientation");
  if (!v19)
    v19 = objc_msgSend(v64, "interfaceOrientation");
  objc_msgSend(v64, "screen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_21;
  __UIStatusBarManagerForWindow(v64);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isStatusBarHidden");

  if ((v22 & 1) != 0)
  {
    v23 = 1;
  }
  else
  {
    __UIStatusBarManagerForWindow(v64);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "defaultStatusBarHeightInOrientation:", v19);
    v26 = v25;

    v23 = v26 == 0.0;
  }
  if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
    objc_msgSend(v64, "_referenceFrameFromSceneUsingScreenBounds:", v23);
  else
    objc_msgSend(v20, "_applicationFrameForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:", v19, v23, 0.0);
  v28 = v27;
  -[_UIAlertControllerPhoneTVMacView _contentInsets](self, "_contentInsets");
  v31 = v28 - (v29 + v30);
  if (v31 > 0.0)
  {
    -[_UIAlertControllerPhoneTVMacView contentViewMaxHeightConstraint](self, "contentViewMaxHeightConstraint");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setConstant:", v31);

    -[_UIAlertControllerPhoneTVMacView contentViewMaxHeightConstraint](self, "contentViewMaxHeightConstraint");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v35 = 1;
  }
  else
  {
LABEL_21:
    -[_UIAlertControllerPhoneTVMacView contentViewMaxHeightConstraint](self, "contentViewMaxHeightConstraint");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v35 = 0;
  }
  objc_msgSend(v33, "setActive:", v35);

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "contentClipsToBounds");
  contentView = self->_contentView;
  if (v37)
  {
    -[UIView setClipsToBounds:](contentView, "setClipsToBounds:", 1);
    objc_msgSend(v36, "contentCornerRadius");
    v40 = v39;
    -[UIView layer](self->_contentView, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCornerRadius:", v40);

    objc_msgSend(v36, "contentCornerCurve");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_contentView, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setCornerCurve:", v42);

  }
  else
  {
    -[UIView setClipsToBounds:](contentView, "setClipsToBounds:", 0);
    -[UIView layer](self->_contentView, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCornerRadius:", 0.0);
  }

  if (objc_msgSend(v36, "contentHasShadow"))
  {
    objc_msgSend(v36, "contentShadowRadius");
    v45 = v44;
    -[UIView layer](self, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setShadowRadius:", v45);

    objc_msgSend(v36, "contentShadowColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "cgColor");
    -[UIView layer](self, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setShadowColor:", v48);

    objc_msgSend(v36, "contentShadowOffset");
    v51 = v50;
    v53 = v52;
    -[UIView layer](self, "layer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setShadowOffset:", v51, v53);

    objc_msgSend(v36, "contentShadowOpacity");
    *(float *)&v51 = v55;
    -[UIView layer](self, "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    LODWORD(v58) = LODWORD(v51);
  }
  else
  {
    -[UIView layer](self, "layer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setShadowRadius:", 0.0);

    -[UIView layer](self, "layer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setShadowColor:", 0);

    v61 = *MEMORY[0x1E0C9D820];
    v62 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIView layer](self, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setShadowOffset:", v61, v62);

    -[UIView layer](self, "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    LODWORD(v58) = 0;
  }
  objc_msgSend(v56, "setShadowOpacity:", v58);

}

- (void)_updateMainGroupViewProperties
{
  id v3;

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView setFocusAvoidsNonDefaultActionsIfPossible:](self->_mainInterfaceActionsGroupView, "setFocusAvoidsNonDefaultActionsIfPossible:", objc_msgSend(v3, "focusAvoidsNonDefaultActionsIfPossible"));

}

- (void)_updateActionViewVisualStyle:(id)a3
{
  id v4;
  NSMutableArray *actionViews;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  actionViews = self->_actionViews;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65___UIAlertControllerPhoneTVMacView__updateActionViewVisualStyle___block_invoke;
  v7[3] = &unk_1E16C50D8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](actionViews, "enumerateObjectsUsingBlock:", v7);

}

- (void)_updateActionViewHeight
{
  void *v3;
  void *v4;
  NSMutableArray *actionViews;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *category;
  _QWORD v12[6];
  _QWORD v13[5];

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  category = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(category))
  {
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UIAlertControllerPhoneTVMacView _idealLayoutWidth](self, "_idealLayoutWidth");
      actionViews = self->_actionViews;
      v6 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59___UIAlertControllerPhoneTVMacView__updateActionViewHeight__block_invoke;
      v13[3] = &__block_descriptor_40_e45_v32__0___UIAlertControllerActionView_8Q16_B24l;
      v13[4] = v7;
      -[NSMutableArray enumerateObjectsUsingBlock:](actionViews, "enumerateObjectsUsingBlock:", v13);
      *(_WORD *)&self->_alertControllerViewFlags &= ~0x200u;
      -[_UIAlertControllerPhoneTVMacView _itemSizeForHorizontalLayout:](self, "_itemSizeForHorizontalLayout:", -[_UIAlertControllerPhoneTVMacView _canLayOutActionsHorizontally](self, "_canLayOutActionsHorizontally"));
      v8 = self->_actionViews;
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __59___UIAlertControllerPhoneTVMacView__updateActionViewHeight__block_invoke_2;
      v12[3] = &__block_descriptor_48_e45_v32__0___UIAlertControllerActionView_8Q16_B24l;
      v12[4] = v9;
      v12[5] = v10;
      -[NSMutableArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v12);
    }
  }

}

- (void)_updateConstraintConstants
{
  void *v3;
  void (**v4)(void *, UILabel *, double);
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UILabel *messageLabel;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  _QWORD v48[6];
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x2020000000;
  v52 = 0;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __62___UIAlertControllerPhoneTVMacView__updateConstraintConstants__block_invoke;
  v48[3] = &unk_1E16C5140;
  v48[4] = self;
  v48[5] = &v49;
  v4 = (void (**)(void *, UILabel *, double))_Block_copy(v48);
  -[_UIAlertControllerPhoneTVMacView headerContentViewController](self, "headerContentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIAlertControllerPhoneTVMacView headerContentViewControllerContainerViewTopAlignmentConstraint](self, "headerContentViewControllerContainerViewTopAlignmentConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", 0.0);

  }
  v7 = 0.0;
  if (-[_UIAlertControllerPhoneTVMacView _hasTitle](self, "_hasTitle"))
  {
    -[_UIAlertControllerPhoneTVMacView title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_scaledMarginAboveTitleLabelFirstBaselineInAlertControllerView:titleText:", self, v8);
    v10 = v9;

    -[_UIAlertControllerPhoneTVMacView titleLabelTopAlignmentConstraints](self, "titleLabelTopAlignmentConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEqualityConstant:", v10);

    -[_UIAlertControllerPhoneTVMacView titleLabelTopAlignmentConstraints](self, "titleLabelTopAlignmentConstraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_scaledTitleLabelSafeBaselineHeightInAlertControllerView:", self);
    v14 = v13;
    objc_msgSend(v3, "_minimumSpacingAboveTopmostLabelSafeAscender");
    v16 = v15;
    -[_UIAlertControllerPhoneTVMacView titleLabelTopAlignmentConstraints](self, "titleLabelTopAlignmentConstraints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "equalityConstant");
    v19 = v18;
    v20 = v14 + v16;

    if (v20 >= v19)
      v21 = v19;
    else
      v21 = v20;
    objc_msgSend(v12, "setMinConstant:", v21);

    objc_msgSend(v3, "_scaledMarginBelowLastLabelLastBaseline");
    v7 = v22;
    v4[2](v4, self->_titleLabel, v10);
  }
  if (-[_UIAlertControllerPhoneTVMacView _hasMessage](self, "_hasMessage"))
  {
    -[_UIAlertControllerPhoneTVMacView messageLabelTopAlignmentConstraints](self, "messageLabelTopAlignmentConstraints");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_scaledMarginAboveMessageLabelFirstBaseline");
    objc_msgSend(v23, "setEqualityConstant:");

    -[_UIAlertControllerPhoneTVMacView messageLabelTopAlignmentConstraints](self, "messageLabelTopAlignmentConstraints");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_scaledMessageSafeBaselineHeightInAlertControllerView:", self);
    v26 = v25;
    objc_msgSend(v3, "_minimumSpacingAboveTopmostLabelSafeAscender");
    v28 = v27;
    -[_UIAlertControllerPhoneTVMacView messageLabelTopAlignmentConstraints](self, "messageLabelTopAlignmentConstraints");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "equalityConstant");
    v31 = v30;
    v32 = v26 + v28;

    if (v32 >= v31)
      v33 = v31;
    else
      v33 = v32;
    objc_msgSend(v24, "setMinConstant:", v33);

    objc_msgSend(v3, "_scaledMarginBelowMessageLabelLastBaseline");
    v7 = v34;
    messageLabel = self->_messageLabel;
    objc_msgSend(v3, "_scaledMarginAboveMessageLabelFirstBaseline");
    ((void (*)(void (**)(void *, UILabel *, double), UILabel *))v4[2])(v4, messageLabel);
  }
  -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewTopAlignmentConstraint](self, "contentViewControllerContainerViewTopAlignmentConstraint");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setConstant:", v7);

    v7 = 0.0;
  }
  if (-[_UIAlertControllerPhoneTVMacView _hasTextFields](self, "_hasTextFields"))
  {
    -[_UIAlertControllerPhoneTVMacView textFieldViewControllerContainerViewTopAlignmentConstraints](self, "textFieldViewControllerContainerViewTopAlignmentConstraints");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setEqualityConstant:", v7);

    -[_UIAlertControllerPhoneTVMacView textFieldViewControllerContainerViewTopAlignmentConstraints](self, "textFieldViewControllerContainerViewTopAlignmentConstraints");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    v41 = 8.0;
    if (v7 <= 8.0)
      v41 = v7;
    objc_msgSend(v39, "setMinConstant:", v41);

    v7 = 0.0;
  }
  -[_UIAlertControllerPhoneTVMacView _updateConstraintSpacingForExternalOffset](self, "_updateConstraintSpacingForExternalOffset");
  if (-[_UIAlertControllerPhoneTVMacView _numberOfActionsForMainActionButtonSequenceView](self, "_numberOfActionsForMainActionButtonSequenceView") <= 0)v7 = v50[3];
  -[_UIAlertControllerPhoneTVMacView contentScrollViewBottomConstraint](self, "contentScrollViewBottomConstraint");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setConstant:", v7);

  -[_UIAlertControllerPhoneTVMacView detailMessageLabelTopAlignmentConstraint](self, "detailMessageLabelTopAlignmentConstraint");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledMarginAboveDetailMessageFirstBaseline");
  objc_msgSend(v43, "setConstant:");

  if (-[_UIAlertControllerPhoneTVMacView _hasDetailMessage](self, "_hasDetailMessage"))
  {
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_scaledMarginBelowDetailMessage");
    v46 = v45;
    -[_UIAlertControllerPhoneTVMacView contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setConstant:", v46);

  }
  _Block_object_dispose(&v49, 8);

}

- (void)_updateTintColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColorForAlertController:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[UIView setTintColor:](self, "setTintColor:", v6);
    v5 = v6;
  }

}

- (void)_setActionsReversed:(BOOL)a3
{
  if (self->_actionsReversed != a3)
  {
    self->_actionsReversed = a3;
    -[_UIAlertControllerPhoneTVMacView _reloadInterfaceActionViewRepresentations](self, "_reloadInterfaceActionViewRepresentations");
  }
}

- (void)deselectAllActions
{
  void *v3;
  id v4;

  -[UIInterfaceActionGroupView actionSelectionController](self->_mainInterfaceActionsGroupView, "actionSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deselectAllActions");

  -[UIInterfaceActionGroupView actionSelectionController](self->_discreteCancelActionGroupView, "actionSelectionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectAllActions");

}

- (void)_contentSizeChanged
{
  -[_UIAlertControllerPhoneTVMacView _updateStyleForIdiomChange:](self, "_updateStyleForIdiomChange:", 0);
  -[_UIAlertControllerPhoneTVMacView _actionsChanged](self, "_actionsChanged");
}

- (void)_setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v4 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v6 = v5;
  v7 = v6;
  if (v6 == v10)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v10 && v6)
      v8 = objc_msgSend(v10, "isEqual:", v6);
  }

  v9 = v10;
  if (v10)
  {
    -[_UIAlertControllerPhoneTVMacView _prepareTitleLabel](self, "_prepareTitleLabel");
    v9 = v10;
  }
  -[UILabel setText:](self->_titleLabel, "setText:", v9);
  if ((v8 & 1) == 0)
    -[_UIAlertControllerPhoneTVMacView _propertiesChanged](self, "_propertiesChanged");

}

- (void)_setMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v4 = a3;
  -[UILabel text](self->_messageLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v6 = v5;
  v7 = v6;
  if (v6 == v10)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v10 && v6)
      v8 = objc_msgSend(v10, "isEqual:", v6);
  }

  v9 = v10;
  if (v10)
  {
    -[_UIAlertControllerPhoneTVMacView _prepareMesssageLabel](self, "_prepareMesssageLabel");
    v9 = v10;
  }
  -[UILabel setText:](self->_messageLabel, "setText:", v9);
  if ((v8 & 1) == 0)
    -[_UIAlertControllerPhoneTVMacView _propertiesChanged](self, "_propertiesChanged");

}

- (void)_setAttributedTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v4 = a3;
  -[UILabel attributedText](self->_titleLabel, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v6 = v5;
  v7 = v6;
  if (v6 == v10)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v10 && v6)
      v8 = objc_msgSend(v10, "isEqual:", v6);
  }

  v9 = v10;
  if (v10)
  {
    -[_UIAlertControllerPhoneTVMacView _prepareTitleLabel](self, "_prepareTitleLabel");
    v9 = v10;
  }
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v9);
  if ((v8 & 1) == 0)
    -[_UIAlertControllerPhoneTVMacView _propertiesChanged](self, "_propertiesChanged");

}

- (void)_setAttributedMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v4 = a3;
  -[UILabel attributedText](self->_messageLabel, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v6 = v5;
  v7 = v6;
  if (v6 == v10)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v10 && v6)
      v8 = objc_msgSend(v10, "isEqual:", v6);
  }

  v9 = v10;
  if (v10)
  {
    -[_UIAlertControllerPhoneTVMacView _prepareMesssageLabel](self, "_prepareMesssageLabel");
    v9 = v10;
  }
  -[UILabel setAttributedText:](self->_messageLabel, "setAttributedText:", v9);
  if ((v8 & 1) == 0)
    -[_UIAlertControllerPhoneTVMacView _propertiesChanged](self, "_propertiesChanged");

}

- (void)_setAttributedDetailMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v4 = a3;
  -[UILabel attributedText](self->_detailMessageLabel, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v6 = v5;
  v7 = v6;
  if (v6 == v10)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v10 && v6)
      v8 = objc_msgSend(v10, "isEqual:", v6);
  }

  v9 = v10;
  if (v10)
  {
    -[_UIAlertControllerPhoneTVMacView _prepareDetailMessageLabel](self, "_prepareDetailMessageLabel");
    v9 = v10;
  }
  -[UILabel setAttributedText:](self->_detailMessageLabel, "setAttributedText:", v9);
  if ((v8 & 1) == 0)
    -[_UIAlertControllerPhoneTVMacView _propertiesChanged](self, "_propertiesChanged");

}

- (id)title
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)message
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_attributedTitle
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_attributedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_attributedMessage
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_attributedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_attributedDetailMessage
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_attributedDetailMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_vibrancyEffectForTitleAndMessageLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_visualStyle");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (os_variant_has_internal_diagnostics())
  {
    if (!v5)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Neither _UIAlertControllerPhoneTVMacView or UIAlertController have a visual style yet, which means it impossible to correctly determine the vibrancy effect.", buf, 2u);
      }

    }
  }
  else if (!v5)
  {
    v10 = _vibrancyEffectForTitleAndMessageLabel___s_category;
    if (!_vibrancyEffectForTitleAndMessageLabel___s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_vibrancyEffectForTitleAndMessageLabel___s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Neither _UIAlertControllerPhoneTVMacView or UIAlertController have a visual style yet, which means it impossible to correctly determine the vibrancy effect.", v12, 2u);
    }
  }
  objc_msgSend(v5, "vibrancyEffectForTitleAndMessageLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_titleAndMessageLabelUseVibrancy
{
  void *v2;
  BOOL v3;

  -[_UIAlertControllerPhoneTVMacView _vibrancyEffectForTitleAndMessageLabel](self, "_vibrancyEffectForTitleAndMessageLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_hasTitle
{
  void *v2;
  char v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasTitle");

  return v3;
}

- (BOOL)_hasAttributedTitle
{
  void *v2;
  char v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasAttributedTitle");

  return v3;
}

- (BOOL)_hasMessage
{
  void *v2;
  char v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasMessage");

  return v3;
}

- (BOOL)_hasAttributedMessage
{
  void *v2;
  char v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasAttributedMessage");

  return v3;
}

- (BOOL)_hasDetailMessage
{
  void *v2;
  char v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasDetailMessage");

  return v3;
}

- (BOOL)_hasTextFields
{
  void *v2;
  BOOL v3;

  -[_UIAlertControllerPhoneTVMacView textFields](self, "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)_textFieldViewController
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_textFieldViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)headerContentViewController
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_headerContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contentViewController
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)separatedHeaderContentViewController
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_separatedHeaderContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)actions
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cancelAction
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cancelAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_focusedAction
{
  void *v3;
  void *v4;

  -[UIInterfaceActionGroupView _interfaceActionOfFocusedRepresentationView](self->_mainInterfaceActionsGroupView, "_interfaceActionOfFocusedRepresentationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIInterfaceActionGroupView _interfaceActionOfFocusedRepresentationView](self->_discreteCancelActionGroupView, "_interfaceActionOfFocusedRepresentationView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "underlyingAlertAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_preferredActionView
{
  _UIAlertControllerInterfaceActionGroupView *mainInterfaceActionsGroupView;
  _UIAlertControllerInterfaceActionGroupView *v4;
  void *v5;
  void *v6;
  void *v7;

  mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
  __UIFocusEnvironmentPreferredFocusedView(self, 0);
  v4 = (_UIAlertControllerInterfaceActionGroupView *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (mainInterfaceActionsGroupView == v4)
  {
    -[UIInterfaceActionGroupView preferredActionRepresentation](self->_mainInterfaceActionsGroupView, "preferredActionRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "alertControllerActionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_indexesOfActionSectionSeparators
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_indexesOfActionSectionSeparators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)_spaceRequiredForActionSectionsSpacing
{
  void *v3;
  unint64_t v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[_UIAlertControllerPhoneTVMacView _indexesOfActionSectionSeparators](self, "_indexesOfActionSectionSeparators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0.0;
  -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)v4;
  objc_msgSend(v5, "interfaceActionVisualStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionSectionSpacing");
  v9 = v8 * v6;

  return v9;
}

- (id)textFields
{
  void *v2;
  void *v3;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPresentedAsPopover:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v5;

  v3 = a3;
  if (-[_UIAlertControllerPhoneTVMacView presentedAsPopover](self, "presentedAsPopover") != a3)
  {
    if (v3)
      v5 = 16;
    else
      v5 = 0;
    *(_WORD *)&self->_alertControllerViewFlags = *(_WORD *)&self->_alertControllerViewFlags & 0xFFEF | v5;
    if (!-[_UIAlertControllerPhoneTVMacView presentedAsPopover](self, "presentedAsPopover"))
      -[_UIAlertControllerPhoneTVMacView _setLayoutSize:](self, "_setLayoutSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[_UIAlertControllerPhoneTVMacView _reevaluateSuperviewSizingConstraints](self, "_reevaluateSuperviewSizingConstraints");
    -[_UIAlertControllerPhoneTVMacView _sizeOfContentViewControllerChanged](self, "_sizeOfContentViewControllerChanged");
    -[_UIAlertControllerPhoneTVMacView _actionLayoutDirectionChanged](self, "_actionLayoutDirectionChanged");
  }
}

- (BOOL)presentedAsPopover
{
  return (*(_WORD *)&self->_alertControllerViewFlags >> 4) & 1;
}

- (void)setHasDimmingView:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v5;
  void *v6;
  uint64_t v7;
  int *v8;
  int *v9;

  v3 = a3;
  if (-[_UIAlertControllerPhoneTVMacView hasDimmingView](self, "hasDimmingView") != a3)
  {
    if (v3)
      v5 = 32;
    else
      v5 = 0;
    *(_WORD *)&self->_alertControllerViewFlags = *(_WORD *)&self->_alertControllerViewFlags & 0xFFDF | v5;
    -[_UIAlertControllerPhoneTVMacView _reevaluateSuperviewSizingConstraints](self, "_reevaluateSuperviewSizingConstraints");
    if (-[_UIAlertControllerPhoneTVMacView hasDimmingView](self, "hasDimmingView"))
    {
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_dimmingView, 0);
      -[UIView removeConstraints:](self, "removeConstraints:", self->_noDimmingViewConstraints);
      -[UIView addConstraints:](self, "addConstraints:", self->_dimmingViewConstraints);
      -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_resolvedStyle");

      if (v7)
        v8 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__dimmingViewConstraintsForActionSheetStyle;
      else
        v8 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__dimmingViewConstraintsForAlertStyle;
      if (v7)
        v9 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__dimmingViewConstraintsForAlertStyle;
      else
        v9 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__dimmingViewConstraintsForActionSheetStyle;
    }
    else
    {
      -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
      -[UIView removeConstraints:](self, "removeConstraints:", self->_dimmingViewConstraints);
      -[UIView removeConstraints:](self, "removeConstraints:", self->_dimmingViewConstraintsForAlertStyle);
      v9 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__noDimmingViewConstraints;
      v8 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__dimmingViewConstraintsForActionSheetStyle;
    }
    -[UIView removeConstraints:](self, "removeConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v8));
    -[UIView addConstraints:](self, "addConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v9));
  }
}

- (BOOL)hasDimmingView
{
  return (*(_WORD *)&self->_alertControllerViewFlags >> 5) & 1;
}

- (void)setPresentationContextPrefersCancelActionShown:(BOOL)a3
{
  if (self->_presentationContextPrefersCancelActionShown != a3)
  {
    self->_presentationContextPrefersCancelActionShown = a3;
    -[_UIAlertControllerPhoneTVMacView _propertiesChanged](self, "_propertiesChanged");
    -[_UIAlertControllerPhoneTVMacView _actionLayoutDirectionChanged](self, "_actionLayoutDirectionChanged");
    -[_UIAlertControllerPhoneTVMacView _actionsChanged](self, "_actionsChanged");
    -[_UIAlertControllerPhoneTVMacView _updateCancelActionBeingDiscrete](self, "_updateCancelActionBeingDiscrete");
  }
}

- (BOOL)showsCancelAction
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  if (-[_UIAlertControllerPhoneTVMacView presentationContextPrefersCancelActionShown](self, "presentationContextPrefersCancelActionShown"))
  {
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView cancelAction](self, "cancelAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "hideCancelAction:inAlertController:", v4, v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)__cancelActionView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[_UIAlertControllerPhoneTVMacView actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerPhoneTVMacView cancelAction](self, "cancelAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_actionViews, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_updateCancelActionBeingDiscrete
{
  void *v3;
  _BOOL8 v4;
  void *v5;

  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_resolvedStyle"))
  {
    v4 = 0;
  }
  else
  {
    -[_UIAlertControllerPhoneTVMacView cancelAction](self, "cancelAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = -[_UIAlertControllerPhoneTVMacView showsCancelAction](self, "showsCancelAction");
    else
      v4 = 0;

  }
  -[_UIAlertControllerPhoneTVMacView setCancelActionIsDiscrete:](self, "setCancelActionIsDiscrete:", v4);
}

- (void)setCancelActionIsDiscrete:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (-[_UIAlertControllerPhoneTVMacView cancelActionIsDiscrete](self, "cancelActionIsDiscrete") != a3)
  {
    if (v3)
      v5 = 64;
    else
      v5 = 0;
    *(_WORD *)&self->_alertControllerViewFlags = *(_WORD *)&self->_alertControllerViewFlags & 0xFFBF | v5;
    if (v3)
    {
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_discreteCancelActionGroupView);
    }
    else
    {
      -[_UIAlertControllerPhoneTVMacView contentViewBottomConstraint](self, "contentViewBottomConstraint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setActive:", 0);

      -[_UIAlertControllerPhoneTVMacView setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
      -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewTopConstraint](self, "discreteCancelActionViewTopConstraint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setActive:", 0);

      -[_UIAlertControllerPhoneTVMacView setDiscreteCancelActionViewTopConstraint:](self, "setDiscreteCancelActionViewTopConstraint:", 0);
      -[_UIAlertControllerPhoneTVMacView discreteCancelActionViewLeadingConstraint](self, "discreteCancelActionViewLeadingConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setActive:", 0);

      -[_UIAlertControllerPhoneTVMacView setDiscreteCancelActionViewLeadingConstraint:](self, "setDiscreteCancelActionViewLeadingConstraint:", 0);
      -[UIView removeFromSuperview](self->_discreteCancelActionGroupView, "removeFromSuperview");
    }
    -[_UIAlertControllerPhoneTVMacView _reloadInterfaceActionViewRepresentations](self, "_reloadInterfaceActionViewRepresentations");
    -[_UIAlertControllerPhoneTVMacView _propertiesChanged](self, "_propertiesChanged");
    -[_UIAlertControllerPhoneTVMacView _actionLayoutDirectionChanged](self, "_actionLayoutDirectionChanged");
  }
}

- (BOOL)cancelActionIsDiscrete
{
  return (*(_WORD *)&self->_alertControllerViewFlags >> 6) & 1;
}

- (void)_updateBackdropView:(BOOL)a3
{
  _BOOL4 v3;
  UIView *backdropView;
  UIView *v6;
  void *v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
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
  id v22;

  v3 = a3;
  backdropView = self->_backdropView;
  if (backdropView)
  {
    -[UIView removeFromSuperview](backdropView, "removeFromSuperview");
    v6 = self->_backdropView;
    self->_backdropView = 0;

  }
  if (v3)
  {
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentBackdropView");
    v8 = (UIView *)objc_claimAutoreleasedReturnValue();
    v9 = self->_backdropView;
    self->_backdropView = v8;

    v10 = self->_backdropView;
    if (v10)
    {
      -[UIView insertSubview:atIndex:](self->_contentView, "insertSubview:atIndex:", v10, 0);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView leadingAnchor](self->_backdropView, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActive:", 1);

      -[UIView trailingAnchor](self->_backdropView, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setActive:", 1);

      -[UIView topAnchor](self->_backdropView, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_contentView, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setActive:", 1);

      -[UIView bottomAnchor](self->_backdropView, "bottomAnchor");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setActive:", 1);

    }
  }
}

- (void)setShouldHaveBackdropView:(BOOL)a3
{
  __int16 alertControllerViewFlags;
  _BOOL8 v4;
  __int16 v6;

  alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
  if (((((alertControllerViewFlags & 0x80) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    if (a3)
      v6 = 128;
    else
      v6 = 0;
    *(_WORD *)&self->_alertControllerViewFlags = alertControllerViewFlags & 0xFF7F | v6;
    -[UIInterfaceActionGroupView _setDrawsBackground:](self->_mainInterfaceActionsGroupView, "_setDrawsBackground:");
    -[_UIAlertControllerPhoneTVMacView _updateBackdropView:](self, "_updateBackdropView:", v4);
  }
}

- (BOOL)shouldHaveBackdropView
{
  return (*(_WORD *)&self->_alertControllerViewFlags >> 7) & 1;
}

- (void)setAlignsToKeyboard:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v5;

  v3 = a3;
  if (-[_UIAlertControllerPhoneTVMacView alignsToKeyboard](self, "alignsToKeyboard") != a3)
  {
    if (v3)
      v5 = 256;
    else
      v5 = 0;
    *(_WORD *)&self->_alertControllerViewFlags = *(_WORD *)&self->_alertControllerViewFlags & 0xFEFF | v5;
    if (-[_UIAlertControllerPhoneTVMacView alignsToKeyboard](self, "alignsToKeyboard"))
    {
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_keyboardLayoutAlignmentView, 0);
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_keyboardLayoutAlignmentAvailableSpaceView, 0);
      -[_UIAlertControllerPhoneTVMacView _applyKeyboardAlignmentViewsConstraints](self, "_applyKeyboardAlignmentViewsConstraints");
    }
    else
    {
      -[UIView removeFromSuperview](self->_keyboardLayoutAlignmentView, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_keyboardLayoutAlignmentAvailableSpaceView, "removeFromSuperview");
    }
  }
}

- (BOOL)alignsToKeyboard
{
  return HIBYTE(*(_WORD *)&self->_alertControllerViewFlags) & 1;
}

- (void)_addHeaderContentViewControllerToViewHierarchyIfNecessary
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *headerContentViewControllerContainerView;
  void *v7;
  int v8;
  void *v9;
  void *v10;
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
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  -[_UIAlertControllerPhoneTVMacView headerContentViewController](self, "headerContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "superview");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  headerContentViewControllerContainerView = self->_headerContentViewControllerContainerView;

  if (v5 != headerContentViewControllerContainerView)
  {
    -[UIView addSubview:](self->_headerContentViewControllerContainerView, "addSubview:", v4);
    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldRespectContentViewControllerClippingPreference");

    if (v8)
    {
      -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setClipsToBounds:](self->_headerContentViewControllerContainerView, "setClipsToBounds:", objc_msgSend(v9, "_wantsUnclippedHeaderContentViewControllerContainer") ^ 1);

    }
    v18 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v4, "leftAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_headerContentViewControllerContainerView, "leftAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    objc_msgSend(v4, "rightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_headerContentViewControllerContainerView, "rightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v10;
    objc_msgSend(v4, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_headerContentViewControllerContainerView, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v13;
    objc_msgSend(v4, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_headerContentViewControllerContainerView, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v17);

    -[_UIAlertControllerPhoneTVMacView _sizeOfHeaderContentViewControllerChanged](self, "_sizeOfHeaderContentViewControllerChanged");
  }

}

- (void)_addContentViewControllerToViewHierarchyIfNecessary
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *contentViewControllerContainerView;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *contentView;
  void *v13;
  UIView *v14;
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
  UIView *v26;
  void *v27;
  UIView *v28;
  void *v29;
  UIView *v30;
  void *v31;
  UIView *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  UIView *v44;
  void *v45;
  UIView *v46;
  void *v47;

  -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentViewControllerContainerView = self->_contentViewControllerContainerView;

  if (v5 != contentViewControllerContainerView)
  {
    v7 = self->_contentViewControllerContainerView;
    -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v7, "addSubview:", v9);

    -[_UIAlertControllerPhoneTVMacView _visualStyle](self, "_visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "shouldRespectContentViewControllerClippingPreference");

    if ((_DWORD)v8)
    {
      -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setClipsToBounds:](self->_contentViewControllerContainerView, "setClipsToBounds:", objc_msgSend(v11, "_wantsUnclippedContentViewControllerContainer") ^ 1);

    }
    contentView = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerViewLeftConstraint](self, "contentViewControllerViewLeftConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView removeConstraint:](contentView, "removeConstraint:", v13);

    v14 = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerViewRightConstraint](self, "contentViewControllerViewRightConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView removeConstraint:](v14, "removeConstraint:", v15);

    -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leftAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_contentViewControllerContainerView, "leftAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setContentViewControllerViewLeftConstraint:](self, "setContentViewControllerViewLeftConstraint:", v20);

    -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_contentViewControllerContainerView, "rightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setContentViewControllerViewRightConstraint:](self, "setContentViewControllerViewRightConstraint:", v25);

    v26 = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerViewLeftConstraint](self, "contentViewControllerViewLeftConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v26, "addConstraint:", v27);

    v28 = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerViewRightConstraint](self, "contentViewControllerViewRightConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v28, "addConstraint:", v29);

    v30 = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerViewTopConstraint](self, "contentViewControllerViewTopConstraint");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView removeConstraint:](v30, "removeConstraint:", v31);

    v32 = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerViewBottomConstraint](self, "contentViewControllerViewBottomConstraint");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView removeConstraint:](v32, "removeConstraint:", v33);

    -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_contentViewControllerContainerView, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setContentViewControllerViewTopConstraint:](self, "setContentViewControllerViewTopConstraint:", v38);

    -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_contentViewControllerContainerView, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setContentViewControllerViewBottomConstraint:](self, "setContentViewControllerViewBottomConstraint:", v43);

    v44 = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerViewTopConstraint](self, "contentViewControllerViewTopConstraint");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v44, "addConstraint:", v45);

    v46 = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerViewBottomConstraint](self, "contentViewControllerViewBottomConstraint");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v46, "addConstraint:", v47);

    -[_UIAlertControllerPhoneTVMacView _sizeOfContentViewControllerChanged](self, "_sizeOfContentViewControllerChanged");
  }
}

- (void)_addSeparatedHeaderContentViewControllerToViewHierarchyIfNecessary
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *separatedHeaderContentViewControllerContainerView;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  -[_UIAlertControllerPhoneTVMacView separatedHeaderContentViewController](self, "separatedHeaderContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "superview");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  separatedHeaderContentViewControllerContainerView = self->_separatedHeaderContentViewControllerContainerView;

  if (v5 != separatedHeaderContentViewControllerContainerView)
  {
    -[UIView addSubview:](self->_separatedHeaderContentViewControllerContainerView, "addSubview:", v4);
    v16 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v4, "leftAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_separatedHeaderContentViewControllerContainerView, "leftAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    objc_msgSend(v4, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_separatedHeaderContentViewControllerContainerView, "rightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v8;
    objc_msgSend(v4, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_separatedHeaderContentViewControllerContainerView, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v11;
    objc_msgSend(v4, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_separatedHeaderContentViewControllerContainerView, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v15);

  }
}

- (void)_removeHeaderContentViewControllerViewFromHierarchy
{
  void *v2;
  id v3;

  -[_UIAlertControllerPhoneTVMacView headerContentViewController](self, "headerContentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (void)_removeContentViewControllerViewFromHierarchy
{
  void *v3;
  void *v4;

  -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[_UIAlertControllerPhoneTVMacView setContentViewControllerViewLeftConstraint:](self, "setContentViewControllerViewLeftConstraint:", 0);
  -[_UIAlertControllerPhoneTVMacView setContentViewControllerViewRightConstraint:](self, "setContentViewControllerViewRightConstraint:", 0);
  -[_UIAlertControllerPhoneTVMacView setContentViewControllerViewTopConstraint:](self, "setContentViewControllerViewTopConstraint:", 0);
  -[_UIAlertControllerPhoneTVMacView setContentViewControllerViewBottomConstraint:](self, "setContentViewControllerViewBottomConstraint:", 0);
}

- (void)_removeSeparatedHeaderContentViewControllerFromHierarchy
{
  void *v3;
  void *v4;

  -[_UIAlertControllerPhoneTVMacView separatedHeaderContentViewController](self, "separatedHeaderContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[_UIAlertControllerPhoneTVMacView setSeparatedHeaderContentViewControllerContainerViewWidthConstraint:](self, "setSeparatedHeaderContentViewControllerContainerViewWidthConstraint:", 0);
  -[_UIAlertControllerPhoneTVMacView setSeparatedHeaderContentViewControllerContainerViewBottomConstraint:](self, "setSeparatedHeaderContentViewControllerContainerViewBottomConstraint:", 0);
}

- (void)_sizeOfHeaderContentViewControllerChanged
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v10;
  NSLayoutConstraint *headerContentViewControllerPreferredWidthConstraint;
  NSLayoutConstraint *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  double v16;
  NSLayoutConstraint *headerContentViewControllerPreferredHeightConstraint;
  NSLayoutConstraint *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  double v22;
  void *v23;
  _QWORD v24[5];

  -[_UIAlertControllerPhoneTVMacView headerContentViewController](self, "headerContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIAlertControllerPhoneTVMacView headerContentViewController](self, "headerContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  v6 = v5;
  v8 = v7;

  v10 = v8 > 0.0 && v3 != 0;
  headerContentViewControllerPreferredWidthConstraint = self->_headerContentViewControllerPreferredWidthConstraint;
  if (v3 && v6 > 0.0)
  {
    if (headerContentViewControllerPreferredWidthConstraint)
    {
      -[NSLayoutConstraint setConstant:](headerContentViewControllerPreferredWidthConstraint, "setConstant:", v6);
    }
    else
    {
      -[UIView widthAnchor](self->_headerContentViewControllerContainerView, "widthAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToConstant:", v6);
      v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v15 = self->_headerContentViewControllerPreferredWidthConstraint;
      self->_headerContentViewControllerPreferredWidthConstraint = v14;

      LODWORD(v16) = 1144766464;
      -[NSLayoutConstraint setPriority:](self->_headerContentViewControllerPreferredWidthConstraint, "setPriority:", v16);
      -[NSLayoutConstraint setActive:](self->_headerContentViewControllerPreferredWidthConstraint, "setActive:", 1);
    }
  }
  else
  {
    -[NSLayoutConstraint setActive:](headerContentViewControllerPreferredWidthConstraint, "setActive:", 0);
    v12 = self->_headerContentViewControllerPreferredWidthConstraint;
    self->_headerContentViewControllerPreferredWidthConstraint = 0;

  }
  headerContentViewControllerPreferredHeightConstraint = self->_headerContentViewControllerPreferredHeightConstraint;
  if (v10)
  {
    if (headerContentViewControllerPreferredHeightConstraint)
    {
      -[NSLayoutConstraint setConstant:](headerContentViewControllerPreferredHeightConstraint, "setConstant:", v8);
    }
    else
    {
      -[UIView heightAnchor](self->_headerContentViewControllerContainerView, "heightAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToConstant:", v8);
      v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v21 = self->_headerContentViewControllerPreferredHeightConstraint;
      self->_headerContentViewControllerPreferredHeightConstraint = v20;

      LODWORD(v22) = 1144766464;
      -[NSLayoutConstraint setPriority:](self->_headerContentViewControllerPreferredHeightConstraint, "setPriority:", v22);
      -[NSLayoutConstraint setActive:](self->_headerContentViewControllerPreferredHeightConstraint, "setActive:", 1);
    }
  }
  else
  {
    -[NSLayoutConstraint setActive:](headerContentViewControllerPreferredHeightConstraint, "setActive:", 0);
    v18 = self->_headerContentViewControllerPreferredHeightConstraint;
    self->_headerContentViewControllerPreferredHeightConstraint = 0;

  }
  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __77___UIAlertControllerPhoneTVMacView__sizeOfHeaderContentViewControllerChanged__block_invoke;
  v24[3] = &unk_1E16B1B28;
  v24[4] = self;
  objc_msgSend(v23, "_headerContentViewControllerWillTransitionToSize:withAnimations:", v24, v6, v8);

}

- (void)_sizeOfContentViewControllerChanged
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  __int16 alertControllerViewFlags;
  _UIAlertControllerInterfaceActionGroupView *v10;
  float v11;
  double v12;
  float v13;
  void *v14;
  void *v15;
  _UIAlertControllerInterfaceActionGroupView *v16;
  UIView *contentView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  UIView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  UIView *v32;
  void *v33;
  void *v34;
  _QWORD v35[7];

  -[_UIAlertControllerPhoneTVMacView contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIAlertControllerPhoneTVMacView _contentViewControllerSize](self, "_contentViewControllerSize");
  v6 = v5;
  if (v4 == 0.0)
    goto LABEL_5;
  v7 = v4;
  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "_resolvedStyle"))
  {
    alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;

    if ((alertControllerViewFlags & 0x10) != 0)
      goto LABEL_6;
LABEL_5:
    v10 = self->_mainInterfaceActionsGroupView;
    v7 = 0.0;
    goto LABEL_7;
  }

LABEL_6:
  v10 = 0;
LABEL_7:
  v11 = 748.0;
  if (!v3)
    v11 = 751.0;
  v12 = 100.0;
  if (!v3)
    v12 = v6;
  if (v6 == 0.0)
    v13 = v11;
  else
    v13 = 751.0;
  if (v6 == 0.0)
    v6 = v12;
  -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewWidthConstraint](self, "contentViewControllerContainerViewWidthConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v14 = (void *)objc_msgSend((id)objc_msgSend(v14, "secondItem"), "_referenceView");
  v16 = v14;

  if (v16 != v10)
  {
    contentView = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewWidthConstraint](self, "contentViewControllerContainerViewWidthConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView removeConstraint:](contentView, "removeConstraint:", v18);

    -[_UIAlertControllerPhoneTVMacView setContentViewControllerContainerViewWidthConstraint:](self, "setContentViewControllerContainerViewWidthConstraint:", 0);
  }
  -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewWidthConstraint](self, "contentViewControllerContainerViewWidthConstraint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    -[UIView widthAnchor](self->_contentViewControllerContainerView, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v10, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setContentViewControllerContainerViewWidthConstraint:](self, "setContentViewControllerContainerViewWidthConstraint:", v22);

    -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewWidthConstraint](self, "contentViewControllerContainerViewWidthConstraint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1132068864;
    objc_msgSend(v23, "setPriority:", v24);

    v25 = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewWidthConstraint](self, "contentViewControllerContainerViewWidthConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v25, "addConstraint:", v26);

  }
  -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewHeightConstraint](self, "contentViewControllerContainerViewHeightConstraint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    -[UIView heightAnchor](self->_contentViewControllerContainerView, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerPhoneTVMacView setContentViewControllerContainerViewHeightConstraint:](self, "setContentViewControllerContainerViewHeightConstraint:", v29);

    -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewHeightConstraint](self, "contentViewControllerContainerViewHeightConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v31 = v13;
    objc_msgSend(v30, "setPriority:", v31);

    v32 = self->_contentView;
    -[_UIAlertControllerPhoneTVMacView contentViewControllerContainerViewHeightConstraint](self, "contentViewControllerContainerViewHeightConstraint");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v32, "addConstraint:", v33);

  }
  -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __71___UIAlertControllerPhoneTVMacView__sizeOfContentViewControllerChanged__block_invoke;
  v35[3] = &unk_1E16B4E70;
  v35[4] = self;
  *(double *)&v35[5] = v7;
  *(double *)&v35[6] = v6;
  objc_msgSend(v34, "_contentViewControllerWillTransitionToSize:withAnimations:", v35, v7, v6);

}

- (void)_layoutAndPositionInParentIfNeeded
{
  ++self->_layoutRequiresPositionUpdateCount;
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  --self->_layoutRequiresPositionUpdateCount;
}

- (void)_applyISEngineLayoutValuesToBoundsOnly:(BOOL)a3
{
  objc_super v3;

  *(_QWORD *)&a3 = self->_layoutRequiresPositionUpdateCount < 1 && a3;
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  -[UIView _applyISEngineLayoutValuesToBoundsOnly:](&v3, sel__applyISEngineLayoutValuesToBoundsOnly_, a3);
}

- (void)_sizeOfTextFieldViewControllerChanged
{
  NSLayoutConstraint *textFieldViewControllerContainerViewHeightConstraint;
  double v3;
  id v4;

  textFieldViewControllerContainerViewHeightConstraint = self->_textFieldViewControllerContainerViewHeightConstraint;
  -[_UIAlertControllerPhoneTVMacView _textFieldViewController](self, "_textFieldViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  -[NSLayoutConstraint setConstant:](textFieldViewControllerContainerViewHeightConstraint, "setConstant:", v3);

}

- (void)_recomputeActionMetrics
{
  _UIAlertControllerActionViewMetrics *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  _UIAlertControllerPhoneTVMacView *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  _UIAlertControllerPhoneTVMacView *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_UIAlertControllerActionViewMetrics);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = 656;
  v28 = self;
  v4 = self->_actionViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "action", v27, v28);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_descriptiveText");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "currentDescriptiveLabelTextWidth");
          if (v14 > v9)
            v9 = v14;
        }
        objc_msgSend(v11, "action");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "title");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v11, "action");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_descriptiveText");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v11, "currentLabelTextWidth");
            if (v20 > v8)
              v8 = v20;
          }
        }
        else
        {

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
  }

  -[_UIAlertControllerActionViewMetrics setDescriptiveLabelTextWidth:](v3, "setDescriptiveLabelTextWidth:", v9);
  -[_UIAlertControllerActionViewMetrics setLabelTextWidth:](v3, "setLabelTextWidth:", v8);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v28;
  v22 = *(id *)((char *)&v28->super.super.super.super.isa + v27);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "applyMetrics:", v3, v27, v28, (_QWORD)v29);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v24);
  }

  -[_UIAlertControllerPhoneTVMacView setActionViewMetrics:](v21, "setActionViewMetrics:", v3);
}

- (void)_ensureActionViewRepresentationsHaveMetrics
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_actionViewMetrics)
    -[_UIAlertControllerPhoneTVMacView _recomputeActionMetrics](self, "_recomputeActionMetrics");
  -[_UIAlertControllerPhoneTVMacView actionViewMetrics](self, "actionViewMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_actionViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "applyMetrics:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_reevaluateSuperviewSizingConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
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
  id v25;

  if (!-[UIView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[UIView superview](self, "superview");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[_UIAlertControllerPhoneTVMacView centerXConstraint](self, "centerXConstraint");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeConstraint:", v3);

      -[_UIAlertControllerPhoneTVMacView centerYConstraint](self, "centerYConstraint");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeConstraint:", v4);

      -[_UIAlertControllerPhoneTVMacView widthConstraint](self, "widthConstraint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeConstraint:", v5);

      -[_UIAlertControllerPhoneTVMacView heightConstraint](self, "heightConstraint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeConstraint:", v6);

      -[_UIAlertControllerPhoneTVMacView setCenterXConstraint:](self, "setCenterXConstraint:", 0);
      -[_UIAlertControllerPhoneTVMacView setCenterYConstraint:](self, "setCenterYConstraint:", 0);
      -[_UIAlertControllerPhoneTVMacView setWidthConstraint:](self, "setWidthConstraint:", 0);
      -[_UIAlertControllerPhoneTVMacView setHeightConstraint:](self, "setHeightConstraint:", 0);
      -[_UIAlertControllerPhoneTVMacView alertController](self, "alertController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_shouldSizeToFillSuperview");

      if (v8)
      {
        -[UIView centerXAnchor](self, "centerXAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "centerXAnchor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "constraintEqualToAnchor:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIAlertControllerPhoneTVMacView setCenterXConstraint:](self, "setCenterXConstraint:", v11);

        -[UIView centerYAnchor](self, "centerYAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "centerYAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintEqualToAnchor:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIAlertControllerPhoneTVMacView setCenterYConstraint:](self, "setCenterYConstraint:", v14);

        -[UIView widthAnchor](self, "widthAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "widthAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIAlertControllerPhoneTVMacView setWidthConstraint:](self, "setWidthConstraint:", v17);

        -[UIView heightAnchor](self, "heightAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "heightAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIAlertControllerPhoneTVMacView setHeightConstraint:](self, "setHeightConstraint:", v20);

        -[_UIAlertControllerPhoneTVMacView centerXConstraint](self, "centerXConstraint");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addConstraint:", v21);

        -[_UIAlertControllerPhoneTVMacView centerYConstraint](self, "centerYConstraint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addConstraint:", v22);

        -[_UIAlertControllerPhoneTVMacView widthConstraint](self, "widthConstraint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addConstraint:", v23);

        -[_UIAlertControllerPhoneTVMacView heightConstraint](self, "heightConstraint");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addConstraint:", v24);

      }
    }

  }
}

- (void)didMoveToSuperview
{
  -[_UIAlertControllerPhoneTVMacView setCenterXConstraint:](self, "setCenterXConstraint:", 0);
  -[_UIAlertControllerPhoneTVMacView setCenterYConstraint:](self, "setCenterYConstraint:", 0);
  -[_UIAlertControllerPhoneTVMacView setWidthConstraint:](self, "setWidthConstraint:", 0);
  -[_UIAlertControllerPhoneTVMacView setHeightConstraint:](self, "setHeightConstraint:", 0);
  -[_UIAlertControllerPhoneTVMacView _reevaluateSuperviewSizingConstraints](self, "_reevaluateSuperviewSizingConstraints");
}

- (void)_willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  -[UIView _willMoveToWindow:](&v7, sel__willMoveToWindow_, v4);
  if (v4)
  {
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFocusBehaviorSetOverrideFocusSystemEnabled(1, v5, self);
    _UIGameControllerNotifyRelevantSystemUIWillShow(v5, self);
  }
  else
  {
    -[UIView _window](self, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFocusBehaviorSetOverrideFocusSystemEnabled(0, v6, self);

  }
}

- (void)didMoveToWindow
{
  void *v3;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIAlertControllerPhoneTVMacView _updateContentView](self, "_updateContentView");
    -[_UIAlertControllerPhoneTVMacView _updateActionViewHeight](self, "_updateActionViewHeight");
    -[_UIAlertControllerPhoneTVMacView _actionLayoutDirectionChanged](self, "_actionLayoutDirectionChanged");
  }
}

- (void)_prepareForWindowDealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIView _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusBehaviorSetOverrideFocusSystemEnabled(0, v4, self);

  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  -[UIView _prepareForWindowDealloc](&v5, sel__prepareForWindowDealloc);
}

- (void)_prepareForWindowHostingSceneRemoval
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIView _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusBehaviorSetOverrideFocusSystemEnabled(0, v4, self);

  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  -[UIView _prepareForWindowHostingSceneRemoval](&v5, sel__prepareForWindowHostingSceneRemoval);
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)setEffectAlpha:(double)a3
{
  -[UIView setAlpha:](self->_contentView, "setAlpha:", a3);
}

- (double)effectAlpha
{
  double result;

  -[UIView alpha](self->_contentView, "alpha");
  return result;
}

- (void)_disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  char v11;

  v4 = a3;
  if (v4)
  {
    v5 = -[_UIAlertControllerPhoneTVMacView shouldHaveBackdropView](self, "shouldHaveBackdropView");
    -[UIView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowsGroupOpacity");

    if (v5)
    {
      -[UIView layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __104___UIAlertControllerPhoneTVMacView__disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator___block_invoke;
    v9[3] = &unk_1E16C5168;
    v10 = v5;
    v9[4] = self;
    v11 = v7;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", 0, v9);
  }

}

- (void)configureForPresentAlongsideTransitionCoordinator:(id)a3
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86___UIAlertControllerPhoneTVMacView_configureForPresentAlongsideTransitionCoordinator___block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  v4 = a3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  -[_UIAlertControllerPhoneTVMacView _disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator:](self, "_disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator:", v4);
  -[UIInterfaceActionGroupView configureForPresentAlongsideTransitionCoordinator:](self->_mainInterfaceActionsGroupView, "configureForPresentAlongsideTransitionCoordinator:", v4);

}

- (void)configureForDismissAlongsideTransitionCoordinator:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIAlertControllerPhoneTVMacView _disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator:](self, "_disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator:", v4);
  -[UIInterfaceActionGroupView configureForDismissAlongsideTransitionCoordinator:](self->_mainInterfaceActionsGroupView, "configureForDismissAlongsideTransitionCoordinator:", v4);

}

- (int64_t)tintAdjustmentMode
{
  return 1;
}

- (id)preferredFocusedView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _UIAlertControllerInterfaceActionGroupView *discreteCancelActionGroupView;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  -[_UIAlertControllerPhoneTVMacView textFields](self, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[_UIAlertControllerPhoneTVMacView _textFieldViewController](self, "_textFieldViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFocusedView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  if (-[_UIAlertControllerPhoneTVMacView _hasDiscreteCancelAction](self, "_hasDiscreteCancelAction"))
  {
    discreteCancelActionGroupView = self->_discreteCancelActionGroupView;
    return discreteCancelActionGroupView;
  }
  -[UIInterfaceActionGroupView actionGroup](self->_mainInterfaceActionsGroupView, "actionGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    discreteCancelActionGroupView = self->_mainInterfaceActionsGroupView;
    return discreteCancelActionGroupView;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  -[UIView preferredFocusedView](&v12, sel_preferredFocusedView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  void *v4;

  objc_msgSend(a3, "nextFocusedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[UIView containsView:](self, "containsView:", v4);

  return (char)self;
}

- (BOOL)_actionsReversed
{
  return self->_actionsReversed;
}

- (BOOL)isSpringLoaded
{
  return self->_springLoaded;
}

- (CGSize)_layoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutSize.width;
  height = self->_layoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setLayoutSize:(CGSize)a3
{
  self->_layoutSize = a3;
}

- (_UIAlertControllerActionViewMetrics)actionViewMetrics
{
  return self->_actionViewMetrics;
}

- (void)setActionViewMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_actionViewMetrics, a3);
}

- (BOOL)actionScrubbingEnabled
{
  return self->_actionScrubbingEnabled;
}

- (double)offset
{
  return self->_offset;
}

- (BOOL)presentationContextPrefersCancelActionShown
{
  return self->_presentationContextPrefersCancelActionShown;
}

- (NSLayoutConstraint)foregroundViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 808, 1);
}

- (void)setForegroundViewWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 816, 1);
}

- (void)setContentViewTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 824, 1);
}

- (void)setContentViewBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (NSLayoutConstraint)contentViewMaxHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 832, 1);
}

- (void)setContentViewMaxHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (NSLayoutConstraint)headerContentViewControllerContainerViewTopAlignmentConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 840, 1);
}

- (void)setHeaderContentViewControllerContainerViewTopAlignmentConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 840);
}

- (NSArray)titleAndMessageLabelVibrantContainerViewVerticalConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 848, 1);
}

- (void)setTitleAndMessageLabelVibrantContainerViewVerticalConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 848);
}

- (_UIFlexibleConstantConstraintSet)titleLabelTopAlignmentConstraints
{
  return (_UIFlexibleConstantConstraintSet *)objc_getProperty(self, a2, 856, 1);
}

- (void)setTitleLabelTopAlignmentConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 856);
}

- (_UIFlexibleConstantConstraintSet)messageLabelTopAlignmentConstraints
{
  return (_UIFlexibleConstantConstraintSet *)objc_getProperty(self, a2, 864, 1);
}

- (void)setMessageLabelTopAlignmentConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 864);
}

- (NSLayoutConstraint)detailMessageLabelTopAlignmentConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 872, 1);
}

- (void)setDetailMessageLabelTopAlignmentConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 872);
}

- (NSLayoutConstraint)contentViewControllerViewLeftConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 880, 1);
}

- (void)setContentViewControllerViewLeftConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 880);
}

- (NSLayoutConstraint)contentViewControllerViewRightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 888, 1);
}

- (void)setContentViewControllerViewRightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 888);
}

- (NSLayoutConstraint)contentViewControllerViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 896, 1);
}

- (void)setContentViewControllerViewTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 896);
}

- (NSLayoutConstraint)contentViewControllerViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 904, 1);
}

- (void)setContentViewControllerViewBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 904);
}

- (NSLayoutConstraint)textFieldViewControllerViewLeftConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 912, 1);
}

- (void)setTextFieldViewControllerViewLeftConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 912);
}

- (NSLayoutConstraint)textFieldViewControllerViewRightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 920, 1);
}

- (void)setTextFieldViewControllerViewRightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 920);
}

- (NSLayoutConstraint)textFieldViewControllerViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 928, 1);
}

- (void)setTextFieldViewControllerViewTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 928);
}

- (NSLayoutConstraint)textFieldViewControllerViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 936, 1);
}

- (void)setTextFieldViewControllerViewBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 936);
}

- (NSLayoutConstraint)contentScrollViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 944, 1);
}

- (void)setContentScrollViewBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 944);
}

- (NSLayoutConstraint)contentScrollViewMaximumWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 952, 1);
}

- (void)setContentScrollViewMaximumWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 952);
}

- (NSLayoutConstraint)contentScrollViewMaximumHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 960, 1);
}

- (void)setContentScrollViewMaximumHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 960);
}

- (NSLayoutConstraint)contentViewControllerContainerViewTopAlignmentConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 968, 1);
}

- (void)setContentViewControllerContainerViewTopAlignmentConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (NSLayoutConstraint)contentViewControllerContainerViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 976, 1);
}

- (void)setContentViewControllerContainerViewWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (NSLayoutConstraint)contentViewControllerContainerViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 984, 1);
}

- (void)setContentViewControllerContainerViewHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (NSLayoutConstraint)separatedHeaderContentViewControllerContainerViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 992, 1);
}

- (void)setSeparatedHeaderContentViewControllerContainerViewBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (NSLayoutConstraint)separatedHeaderContentViewControllerContainerViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setSeparatedHeaderContentViewControllerContainerViewWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (_UIFlexibleConstantConstraintSet)textFieldViewControllerContainerViewTopAlignmentConstraints
{
  return (_UIFlexibleConstantConstraintSet *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setTextFieldViewControllerContainerViewTopAlignmentConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (NSLayoutConstraint)textFieldViewControllerContainerViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTextFieldViewControllerContainerViewWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (NSLayoutConstraint)textFieldViewControllerContainerViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setTextFieldViewControllerContainerViewHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (NSLayoutConstraint)centerXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setCenterXConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (NSLayoutConstraint)centerYConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setCenterYConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (NSLayoutConstraint)widthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (NSLayoutConstraint)mainActionButtonSequenceViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setMainActionButtonSequenceViewWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (NSLayoutConstraint)mainActionButtonSequenceViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setMainActionButtonSequenceViewHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (NSLayoutConstraint)mainActionButtonSequenceViewHorizontalAlignmentConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setMainActionButtonSequenceViewHorizontalAlignmentConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (NSLayoutConstraint)discreteActionGroupViewHorizontalLayoutTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setDiscreteActionGroupViewHorizontalLayoutTrailingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (NSLayoutConstraint)actionGroupEqualsContentViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setActionGroupEqualsContentViewWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (NSLayoutConstraint)discreteCancelActionViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setDiscreteCancelActionViewTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (NSLayoutConstraint)discreteCancelActionViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setDiscreteCancelActionViewLeadingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (NSLayoutConstraint)discreteCancelActionViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setDiscreteCancelActionViewWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (NSLayoutConstraint)discreteCancelActionViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setDiscreteCancelActionViewHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discreteCancelActionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_discreteCancelActionViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_discreteCancelActionViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_discreteCancelActionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_actionGroupEqualsContentViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_discreteActionGroupViewHorizontalLayoutTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_mainActionButtonSequenceViewHorizontalAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_mainActionButtonSequenceViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_mainActionButtonSequenceViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_centerYConstraint, 0);
  objc_storeStrong((id *)&self->_centerXConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerContainerViewTopAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_separatedHeaderContentViewControllerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_separatedHeaderContentViewControllerContainerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerContainerViewTopAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_contentScrollViewMaximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentScrollViewMaximumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentScrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_detailMessageLabelTopAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_messageLabelTopAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabelTopAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_titleAndMessageLabelVibrantContainerViewVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_headerContentViewControllerContainerViewTopAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewMaxHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_foregroundViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_actionViewMetrics, 0);
  objc_storeStrong((id *)&self->_effectivePreferredAction, 0);
  objc_storeStrong((id *)&self->_headerContentViewControllerPreferredHeightConstraint, 0);
  objc_storeStrong((id *)&self->_headerContentViewControllerPreferredWidthConstraint, 0);
  objc_storeStrong((id *)&self->_noDimmingViewConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingViewConstraintsForActionSheetStyle, 0);
  objc_storeStrong((id *)&self->_dimmingViewConstraintsForAlertStyle, 0);
  objc_storeStrong((id *)&self->_dimmingViewForegroundViewBottomConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingViewForegroundViewTopConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingViewConstraints, 0);
  objc_storeStrong((id *)&self->_actionViews, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_keyboardLayoutAlignmentAvailableSpaceView, 0);
  objc_storeStrong((id *)&self->_keyboardLayoutAlignmentView, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerContainerView, 0);
  objc_storeStrong((id *)&self->_contentViewControllerContainerView, 0);
  objc_storeStrong((id *)&self->_headerContentViewControllerContainerView, 0);
  objc_storeStrong((id *)&self->_separatedHeaderContentViewControllerContainerView, 0);
  objc_storeStrong((id *)&self->_detailMessageLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleAndMessageLabelVibrantContainerView, 0);
  objc_storeStrong((id *)&self->_discreteCancelActionGroupView, 0);
  objc_storeStrong((id *)&self->_mainInterfaceActionsGroupView, 0);
  objc_storeStrong((id *)&self->_contentViewTopItemsView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->_alertController);
}

@end

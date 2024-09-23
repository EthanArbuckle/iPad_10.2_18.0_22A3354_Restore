@implementation UIAlertControllerVisualStyle

- (UIAlertControllerVisualStyle)init
{
  UIAlertControllerVisualStyle *v2;
  UIAlertControllerVisualStyle *v3;
  void *v4;
  uint64_t v5;
  UITraitCollection *traitCollection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIAlertControllerVisualStyle;
  v2 = -[UIAlertControllerVisualStyle init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_forcedInterfaceIdiom = -1;
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v5 = objc_claimAutoreleasedReturnValue();
    traitCollection = v3->_traitCollection;
    v3->_traitCollection = (UITraitCollection *)v5;

    -[UIAlertControllerVisualStyle _reloadInterfaceActionVisualStyle](v3, "_reloadInterfaceActionVisualStyle");
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    -[UIAlertControllerVisualStyle traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[1];
  v5[1] = v7;

  -[UIAlertControllerVisualStyle traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (void)setTraitCollection:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UITraitCollection isEqual:](self->_traitCollection, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    -[UIAlertControllerVisualStyle _reloadInterfaceActionVisualStyle](self, "_reloadInterfaceActionVisualStyle");
  }

}

- (void)setDescriptor:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIAlertControllerDescriptor isEqual:](self->_descriptor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_descriptor, a3);
    -[UIAlertControllerVisualStyle _reloadInterfaceActionVisualStyle](self, "_reloadInterfaceActionVisualStyle");
  }

}

- (void)setForcedInterfaceIdiom:(int64_t)a3
{
  if (self->_forcedInterfaceIdiom != a3)
  {
    self->_forcedInterfaceIdiom = a3;
    -[UIAlertControllerVisualStyle _reloadInterfaceActionVisualStyle](self, "_reloadInterfaceActionVisualStyle");
  }
}

+ (int64_t)interfaceActionPresentationStyle
{
  return 0;
}

- (Class)interfaceActionVisualStyleClassForManagingConcreteVisualStyle
{
  return (Class)objc_opt_class();
}

- (void)_reloadInterfaceActionVisualStyle
{
  void *v3;
  void *v4;
  int64_t forcedInterfaceIdiom;
  uint64_t v6;
  UIInterfaceActionVisualStyle *v7;
  UIInterfaceActionVisualStyle *interfaceActionVisualStyle;
  UIInterfaceActionVisualStyle *v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[UIAlertControllerVisualStyle traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  forcedInterfaceIdiom = self->_forcedInterfaceIdiom;
  if (forcedInterfaceIdiom != -1)
  {
    objc_msgSend(v3, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", forcedInterfaceIdiom, 0x1E1A99498);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  -[objc_class idiomSpecificStyleForTraitCollection:presentationStyle:](-[UIAlertControllerVisualStyle interfaceActionVisualStyleClassForManagingConcreteVisualStyle](self, "interfaceActionVisualStyleClassForManagingConcreteVisualStyle"), "idiomSpecificStyleForTraitCollection:presentationStyle:", v4, objc_msgSend((id)objc_opt_class(), "interfaceActionPresentationStyle"));
  v7 = (UIInterfaceActionVisualStyle *)objc_claimAutoreleasedReturnValue();
  interfaceActionVisualStyle = self->_interfaceActionVisualStyle;
  self->_interfaceActionVisualStyle = v7;

  objc_initWeak(&location, self);
  v9 = self->_interfaceActionVisualStyle;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__UIAlertControllerVisualStyle__reloadInterfaceActionVisualStyle__block_invoke;
  v10[3] = &unk_1E16B2090;
  objc_copyWeak(&v11, &location);
  -[UIInterfaceActionVisualStyle setFontForViewStateBlock:](v9, "setFontForViewStateBlock:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

id __65__UIAlertControllerVisualStyle__reloadInterfaceActionVisualStyle__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "isPreferred"))
      objc_msgSend(WeakRetained, "preferredActionFont");
    else
      objc_msgSend(WeakRetained, "regularActionFont");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)vibrancyEffectForTitleAndMessageLabel
{
  return 0;
}

- (id)messageCompositingFilter
{
  return 0;
}

- (id)titleLabelFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
}

- (id)titleLabelColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (double)marginAboveTitleLabelFirstBaseline
{
  return 0.0;
}

- (double)marginBelowTitleLabelLastBaseline
{
  return 0.0;
}

- (double)_marginAroundActionGroup
{
  return 0.0;
}

- (int64_t)maximumNumberOfLinesInTitleLabel
{
  return 0;
}

- (id)messageLabelFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
}

- (double)_marginAboveDetailMessageFirstBaseline
{
  return 20.0;
}

- (double)_marginBelowDetailMessage
{
  return 0.0;
}

- (double)_spacingBetweenDismissButtonAndContent
{
  return 8.0;
}

- (double)marginAboveMessageLabelFirstBaseline
{
  return 0.0;
}

- (double)marginBelowMessageLabelLastBaseline
{
  return 0.0;
}

- (int64_t)maximumNumberOfLinesInMessageLabel
{
  return 0;
}

- (double)marginBelowLastLabelLastBaseline
{
  return 0.0;
}

- (id)tintColorForAlertController:(id)a3
{
  return 0;
}

- (double)minimumWidth
{
  return 0.0;
}

- (double)maximumWidth
{
  return 0.0;
}

- (double)maximumContentHeight
{
  return 0.0;
}

- (BOOL)definesWidthByContentFitting
{
  return 0;
}

- (double)minimumWidthFittingContentView:(id)a3 titleLabel:(id)a4 minimumWidthForAllActions:(double)a5 maxPreferredWidth:(double)a6 preferredSizeForContentContainers:(CGSize)a7
{
  return 0.0;
}

- (double)accessibilityWidth
{
  return 0.0;
}

- (double)maximumHeightForDisplayOnScreen:(id)a3
{
  CGRect v4;

  objc_msgSend(a3, "_applicationFrame");
  return CGRectGetHeight(v4);
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (void)positionContentsOfAlertController:(id)a3 alertContentView:(id)a4 availableSpaceView:(id)a5 visualStyle:(id)a6 updatableConstraints:(id)a7
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v14);

  objc_msgSend(v10, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "safeAreaLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v18);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v19);
}

- (id)textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4
{
  return a3;
}

- (id)defaultActionFont
{
  void *v2;
  void *v3;
  void *v4;

  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInterfaceActionViewState _nullViewStateForActionType:](UIInterfaceActionViewState, "_nullViewStateForActionType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionTitleLabelFontForViewState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)permittedActionLayoutDirection
{
  return 3;
}

- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4
{
  return 0;
}

- (CGSize)collectionViewOutsetSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)textFieldContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)textFieldHorizontalMargin
{
  return 16.0;
}

- (id)dimmingViewForAlertController:(id)a3
{
  UIView *v3;
  UIView *v4;
  void *v5;

  v3 = [UIView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[UIColor _alertControllerDimmingViewColor](UIColor, "_alertControllerDimmingViewColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  return v4;
}

- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4
{
  return 0.0;
}

- (void)animateRevealOfAlertControllerView:(id)a3 alertController:(id)a4 inContainerView:(id)a5 duration:(double)a6 completionBlock:(id)a7
{
  (*((void (**)(id, uint64_t, double))a7 + 2))(a7, 1, a6);
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  (*((void (**)(id, uint64_t, double))a9 + 2))(a9, 1, a8);
}

- (BOOL)transitionOfType:(int64_t)a3 shouldBeInteractiveForAlertController:(id)a4
{
  return 0;
}

- (id)interactionProgressForTransitionOfType:(int64_t)a3 forAlertController:(id)a4
{
  return 0;
}

- (BOOL)shouldOccludeDuringPresentation
{
  return 1;
}

- (BOOL)shouldPreserveRespondersAcrossWindows
{
  return 0;
}

- (BOOL)placementAvoidsKeyboard
{
  return 0;
}

- (id)preferredActionForActions:(id)a3 suggestedPreferredAction:(id)a4
{
  return a4;
}

- (BOOL)focusAvoidsNonDefaultActionsIfPossible
{
  return 0;
}

- (id)contentBackdropView
{
  return 0;
}

- (BOOL)contentClipsToBounds
{
  return 0;
}

- (double)contentCornerRadius
{
  return 0.0;
}

- (id)contentCornerCurve
{
  return (id)*MEMORY[0x1E0CD2A68];
}

- (BOOL)contentHasShadow
{
  return 0;
}

- (double)contentShadowRadius
{
  return 0.0;
}

- (id)contentShadowColor
{
  return 0;
}

- (CGSize)contentShadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)contentShadowOpacity
{
  return 0.0;
}

- (UIEdgeInsets)actionSequenceEdgeInsets
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

  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionSequenceEdgeInsets");
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

- (id)regularActionFont
{
  void *v2;
  void *v3;

  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultConcreteActionTitleLabelRegularFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)preferredActionFont
{
  void *v2;
  void *v3;

  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultConcreteActionTitleLabelPreferredFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)minimumActionContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumActionContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)contentHorizontalMargin
{
  void *v2;
  double v3;
  double v4;

  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentMargin");
  v4 = v3;

  return v4;
}

- (double)contentVerticalMargin
{
  void *v2;
  double v3;
  double v4;

  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentMargin");
  v4 = v3;

  return v4;
}

- (UIEdgeInsets)actionImageMarginForAction
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
  UIEdgeInsets result;

  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "verticalImageContentSpacing");
  v5 = v4;

  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "horizontalImageContentSpacing");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  v11 = v5;
  v12 = v8;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (void)configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configureAttributesForTitleLabel:classificationLabel:actionViewState:", v10, v9, v8);

}

- (void)configureAttributesForImageView:(id)a3 imageProperty:(id)a4 actionViewState:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configureAttributesForImageView:imageProperty:actionViewState:", v10, v9, v8);

}

- (double)minimumContentHeight
{
  return 44.0;
}

- (double)_minimumSpacingAboveTopmostLabelSafeAscender
{
  return 2.0;
}

- (double)_labelHorizontalInsets
{
  return 16.0;
}

- (double)_scaledMarginAboveTitleLabelFirstBaselineInAlertControllerView:(id)a3 titleText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;

  v6 = a3;
  v7 = a4;
  -[UIAlertControllerVisualStyle titleLabelFont](self, "titleLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyle marginAboveTitleLabelFirstBaseline](self, "marginAboveTitleLabelFirstBaseline");
  objc_msgSend(v8, "_scaledValueForValue:");
  v10 = v9;

  v11 = v7;
  if (objc_msgSend(v11, "length"))
  {
    +[UILabel _tooBigChars]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v12);

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UIAlertControllerVisualStyle _scaledTitleLabelSafeBaselineHeightInAlertControllerView:](self, "_scaledTitleLabelSafeBaselineHeightInAlertControllerView:", v6);
      if (v10 < v14)
        v10 = v14;
    }
  }
  else
  {

  }
  return v10;
}

- (double)_scaledSafeBaselineHeightForLabelFont:(id)a3 inAlertControllerView:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;

  v5 = a4;
  v6 = a3;
  CTFontGetLanguageAwareOutsets();
  objc_msgSend(v6, "ascender");

  UICeilToViewScale(v5);
  v8 = v7;

  return v8;
}

- (double)_scaledTitleLabelSafeBaselineHeightInAlertControllerView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[UIAlertControllerVisualStyle titleLabelFont](self, "titleLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyle _scaledSafeBaselineHeightForLabelFont:inAlertControllerView:](self, "_scaledSafeBaselineHeightForLabelFont:inAlertControllerView:", v5, v4);
  v7 = v6;

  return v7;
}

- (double)_scaledMessageSafeBaselineHeightInAlertControllerView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[UIAlertControllerVisualStyle messageLabelFont](self, "messageLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyle _scaledSafeBaselineHeightForLabelFont:inAlertControllerView:](self, "_scaledSafeBaselineHeightForLabelFont:inAlertControllerView:", v5, v4);
  v7 = v6;

  return v7;
}

- (double)_scaledMarginBelowTitleLabelLastBaseline
{
  void *v3;
  double v4;
  double v5;

  -[UIAlertControllerVisualStyle titleLabelFont](self, "titleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyle marginBelowTitleLabelLastBaseline](self, "marginBelowTitleLabelLastBaseline");
  objc_msgSend(v3, "_scaledValueForValue:");
  v5 = v4;

  return v5;
}

- (double)_scaledMarginAboveMessageLabelFirstBaseline
{
  void *v3;
  double v4;
  double v5;

  -[UIAlertControllerVisualStyle messageLabelFont](self, "messageLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyle marginAboveMessageLabelFirstBaseline](self, "marginAboveMessageLabelFirstBaseline");
  objc_msgSend(v3, "_scaledValueForValue:");
  v5 = v4;

  return v5;
}

- (double)_scaledMarginBelowMessageLabelLastBaseline
{
  void *v3;
  double v4;
  double v5;

  -[UIAlertControllerVisualStyle messageLabelFont](self, "messageLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyle marginBelowMessageLabelLastBaseline](self, "marginBelowMessageLabelLastBaseline");
  objc_msgSend(v3, "_scaledValueForValue:");
  v5 = v4;

  return v5;
}

- (double)_scaledMarginBelowLastLabelLastBaseline
{
  void *v3;
  double v4;
  double v5;

  -[UIAlertControllerVisualStyle titleLabelFont](self, "titleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyle marginBelowLastLabelLastBaseline](self, "marginBelowLastLabelLastBaseline");
  objc_msgSend(v3, "_scaledValueForValue:");
  v5 = v4;

  return v5;
}

- (double)_scaledMarginAboveDetailMessageFirstBaseline
{
  void *v3;
  double v4;
  double v5;

  -[UIAlertControllerVisualStyle _detailMessageFont](self, "_detailMessageFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyle _marginAboveDetailMessageFirstBaseline](self, "_marginAboveDetailMessageFirstBaseline");
  objc_msgSend(v3, "_scaledValueForValue:");
  v5 = v4;

  return v5;
}

- (double)_scaledMarginBelowDetailMessage
{
  void *v3;
  double v4;
  double v5;

  -[UIAlertControllerVisualStyle _detailMessageFont](self, "_detailMessageFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyle _marginBelowDetailMessage](self, "_marginBelowDetailMessage");
  objc_msgSend(v3, "_scaledValueForValue:");
  v5 = v4;

  return v5;
}

- (BOOL)_shouldReverseActions
{
  return 0;
}

- (id)_keyCommandInputForCancelAction
{
  return CFSTR("UIKeyInputEscape");
}

- (double)actionSpacingForHorizontalLayout:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v3 = a3;
  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupViewState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copyWithVerticalLayoutAxis:", !v3);
  -[UIAlertControllerVisualStyle interfaceActionVisualStyle](self, "interfaceActionVisualStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionSpacingForGroupViewState:", v7);
  v10 = v9;

  return v10;
}

- (BOOL)shouldRespectContentViewControllerClippingPreference
{
  return 0;
}

- (UIAlertControllerDescriptor)descriptor
{
  return self->_descriptor;
}

- (int64_t)forcedInterfaceIdiom
{
  return self->_forcedInterfaceIdiom;
}

- (UIInterfaceActionVisualStyle)interfaceActionVisualStyle
{
  return self->_interfaceActionVisualStyle;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_interfaceActionVisualStyle, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end

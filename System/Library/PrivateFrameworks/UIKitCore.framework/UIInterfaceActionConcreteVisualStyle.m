@implementation UIInterfaceActionConcreteVisualStyle

id __109__UIInterfaceActionConcreteVisualStyle_ModernAppleTV__vibrancyStyleColorForUnfocusedTitleLabelWithTintColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "userInterfaceStyle");
  if (v4 == 1000 || v4 == 2)
    +[UIColor labelColor](UIColor, "labelColor");
  else
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;

  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "alphaComponent");
  objc_msgSend(v9, "colorWithAlphaComponent:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __85__UIInterfaceActionConcreteVisualStyle_iOSSheet_newActionBackgroundViewForViewState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", objc_msgSend(*(id *)(a1 + 40), "isHighlighted"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)objc_opt_new();
}

- (id)defaultScreen
{
  return +[UIScreen mainScreen](UIScreen, "mainScreen");
}

- (CGSize)maximumActionGroupContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIInterfaceActionConcreteVisualStyle defaultScreen](self, "defaultScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)contentCornerRadius
{
  return 0.0;
}

- (UIEdgeInsets)contentMargin
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

- (CGSize)minimumActionContentSize
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

- (double)horizontalImageContentSpacing
{
  return 0.0;
}

- (double)verticalImageContentSpacing
{
  return 0.0;
}

- (BOOL)allowsZeroSizedSectionSeparators
{
  return 0;
}

- (double)actionSectionSpacing
{
  return 0.0;
}

- (UIEdgeInsets)actionSequenceEdgeInsets
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

- (BOOL)selectByPressGestureRequired
{
  return 1;
}

- (BOOL)selectionFeedbackEnabled
{
  return 0;
}

- (BOOL)selectByIndirectPointerTouchRequired
{
  return 0;
}

- (double)actionTitleLabelMinimumScaleFactor
{
  return 0.58;
}

- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3
{
  return 0;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  return 0;
}

- (id)newActionSeparatorViewForGroupViewState:(id)a3
{
  return 0;
}

- (id)newSectionSeparatorViewForGroupViewState:(id)a3
{
  return 0;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  return 0;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  return +[UIColor labelColor](UIColor, "labelColor", a3);
}

- (id)actionTitleLabelCompositingFilterForViewState:(id)a3
{
  return 0;
}

- (id)actionImageViewTintColorForImageProperty:(id)a3 actionViewState:(id)a4
{
  return 0;
}

- (double)actionSpacingForGroupViewState:(id)a3
{
  return 0.0;
}

- (id)actionPropertiesAffectingLabelStyling
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)actionPropertiesAffectingImageViewStyling
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)actionGroupPropertiesAffectingActionsScrollViewStyling
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)actionPropertiesAffectingActionRepresentationViewStyling
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)newRepresentationViewForAction:(id)a3
{
  id v4;
  uint64_t v5;
  __objc2_class **v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "_typeForDeterminingViewRepresentation");
  v6 = off_1E167C7B8;
  if (v5 != 100)
    v6 = off_1E167C7C0;
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithAction:", v4);

  -[UIInterfaceActionConcreteVisualStyle actionViewStateForAttachingToActionRepresentationView:](self, "actionViewStateForAttachingToActionRepresentationView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActionViewStateContext:", v8);

  return v7;
}

@end

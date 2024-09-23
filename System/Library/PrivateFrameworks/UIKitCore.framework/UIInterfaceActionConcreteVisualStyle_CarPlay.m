@implementation UIInterfaceActionConcreteVisualStyle_CarPlay

- (id)defaultScreen
{
  return +[UIScreen _carScreen](UIScreen, "_carScreen");
}

- (double)contentCornerRadius
{
  return 13.0;
}

- (UIEdgeInsets)contentMargin
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 12.0;
  v3 = 12.0;
  v4 = 12.0;
  v5 = 12.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)horizontalImageContentSpacing
{
  return 12.0;
}

- (double)verticalImageContentSpacing
{
  return 6.0;
}

- (CGSize)minimumActionContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (BOOL)selectByPressGestureRequired
{
  return 1;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  if (objc_msgSend(a3, "isPreferred"))
    -[UIInterfaceActionConcreteVisualStyle_CarPlay _preferredActionFont](self, "_preferredActionFont");
  else
    -[UIInterfaceActionConcreteVisualStyle_CarPlay _regularActionFont](self, "_regularActionFont");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isHighlighted") & 1) != 0)
    -[UIInterfaceActionConcreteVisualStyle_CarPlay _highlightedActionTitleLabelColorForViewState:](self, "_highlightedActionTitleLabelColorForViewState:", v4);
  else
    -[UIInterfaceActionConcreteVisualStyle_CarPlay _normalActionTitleLabelColorForViewState:](self, "_normalActionTitleLabelColorForViewState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  id v3;
  void *v4;
  char v5;
  __objc2_class **v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isHighlighted");

  if ((v5 & 1) != 0)
  {
    v6 = off_1E167BEE0;
  }
  else
  {
    if (objc_msgSend(v4, "type") != 1)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = off_1E167BEE8;
  }
  v7 = objc_alloc_init(*v6);
LABEL_7:

  return v7;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  return objc_alloc_init(_UIAlertControllerCarBackgroundView);
}

- (id)newActionSeparatorViewForGroupViewState:(id)a3
{
  return (id)objc_opt_new();
}

- (id)_regularActionFont
{
  if (_AXSCarPlayEnhanceTextLegibilityEnabled())
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 16.0);
  else
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_preferredActionFont
{
  return (id)objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 16.0);
}

- (id)_highlightedActionTitleLabelColorForViewState:(id)a3
{
  return +[UIColor _externalSystemDarkGrayColor](UIColor, "_externalSystemDarkGrayColor", a3);
}

- (id)_normalActionTitleLabelColorForViewState:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 < 2)
    goto LABEL_4;
  if (v5 == 2)
  {
    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v5 == 100)
  {
LABEL_4:
    objc_msgSend(v3, "tintColor");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v4 = (void *)v6;
  }

  return v4;
}

@end

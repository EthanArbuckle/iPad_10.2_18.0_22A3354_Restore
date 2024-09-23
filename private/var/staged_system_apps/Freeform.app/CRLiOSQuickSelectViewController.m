@implementation CRLiOSQuickSelectViewController

- (CRLiOSQuickSelectViewController)initWithDelegate:(id)a3
{
  id v4;
  CRLiOSQuickSelectViewController *v5;
  CRLiOSQuickSelectViewController *v6;
  id v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *iconImageView;
  UILabel *v12;
  UILabel *textLabel;
  uint64_t v14;
  UIButton *doneButton;
  uint64_t v16;
  UIButton *selectAllButton;
  uint64_t v18;
  UIButton *deselectAllButton;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLiOSQuickSelectViewController;
  v5 = -[CRLiOSQuickSelectViewController initWithNibName:bundle:](&v21, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_alloc((Class)UIImageView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 17.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("square.on.circle"), v8));
    v10 = (UIImageView *)objc_msgSend(v7, "initWithImage:", v9);
    iconImageView = v6->_iconImageView;
    v6->_iconImageView = v10;

    v12 = (UILabel *)objc_alloc_init((Class)UILabel);
    textLabel = v6->_textLabel;
    v6->_textLabel = v12;

    v14 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    doneButton = v6->_doneButton;
    v6->_doneButton = (UIButton *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    selectAllButton = v6->_selectAllButton;
    v6->_selectAllButton = (UIButton *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    deselectAllButton = v6->_deselectAllButton;
    v6->_deselectAllButton = (UIButton *)v18;

  }
  return v6;
}

- (id)p_makeHUDView
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
  id v18;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  uint64_t v56;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_createBaseHUDView](self, "p_createBaseHUDView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_createBackgroundView](self, "p_createBackgroundView"));
  -[CRLiOSQuickSelectViewController setBackgroundView:](self, "setBackgroundView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController iconImageView](self, "iconImageView"));
  -[CRLiOSQuickSelectViewController p_configureIconView:](self, "p_configureIconView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController textLabel](self, "textLabel"));
  -[CRLiOSQuickSelectViewController p_configureTextLabel:](self, "p_configureTextLabel:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController selectAllButton](self, "selectAllButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController deselectAllButton](self, "deselectAllButton"));
  -[CRLiOSQuickSelectViewController p_configureSelectAllButton:andDeselectAllButton:](self, "p_configureSelectAllButton:andDeselectAllButton:", v7, v8);

  -[CRLiOSQuickSelectViewController p_updateHUDState](self, "p_updateHUDState");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_createSeparatorView](self, "p_createSeparatorView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v10, "addSubview:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController doneButton](self, "doneButton"));
  -[CRLiOSQuickSelectViewController p_configureDoneButton:](self, "p_configureDoneButton:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v3, "addSubview:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v3, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController textLabel](self, "textLabel"));
  objc_msgSend(v3, "addSubview:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController selectAllButton](self, "selectAllButton"));
  objc_msgSend(v3, "addSubview:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController deselectAllButton](self, "deselectAllButton"));
  objc_msgSend(v3, "addSubview:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController doneButton](self, "doneButton"));
  objc_msgSend(v3, "addSubview:", v17);

  v18 = objc_alloc_init((Class)NSMutableArray);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController backgroundView](self, "backgroundView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_constraintsForBackgroundView:inHudView:](self, "p_constraintsForBackgroundView:inHudView:", v19, v3));
  objc_msgSend(v18, "addObjectsFromArray:", v20);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController iconImageView](self, "iconImageView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_constraintsForIconView:verticallyCenteredToView:inHudView:](self, "p_constraintsForIconView:verticallyCenteredToView:inHudView:", v22, v3, v3));
  objc_msgSend(v21, "addObjectsFromArray:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController textLabel](self, "textLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController iconImageView](self, "iconImageView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController selectAllButton](self, "selectAllButton"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController deselectAllButton](self, "deselectAllButton"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_constraintsForTextLabel:inHudView:withIconView:andSelectAllButton:andDeselectAllButton:forCompactLayout:](self, "p_constraintsForTextLabel:inHudView:withIconView:andSelectAllButton:andDeselectAllButton:forCompactLayout:", v24, v3, v25, v26, v27, 0));
  objc_msgSend(v21, "addObjectsFromArray:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController selectAllButton](self, "selectAllButton"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController deselectAllButton](self, "deselectAllButton"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController doneButton](self, "doneButton"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController textLabel](self, "textLabel"));
  LOBYTE(v55) = 0;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_constraintsForSelectAllButton:deselectAllButton:andDoneButton:withSeparator:andTextLabel:inHudView:forCompactLayout:](self, "p_constraintsForSelectAllButton:deselectAllButton:andDoneButton:withSeparator:andTextLabel:inHudView:forCompactLayout:", v29, v30, v31, v9, v32, v3, v55));
  objc_msgSend(v21, "addObjectsFromArray:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController regularSizeHUDConstraints](self, "regularSizeHUDConstraints"));
  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController regularSizeHUDConstraints](self, "regularSizeHUDConstraints"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v21));
    -[CRLiOSQuickSelectViewController setRegularSizeHUDConstraints:](self, "setRegularSizeHUDConstraints:", v36);

  }
  else
  {
    -[CRLiOSQuickSelectViewController setRegularSizeHUDConstraints:](self, "setRegularSizeHUDConstraints:", v21);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController iconImageView](self, "iconImageView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController textLabel](self, "textLabel"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_constraintsForIconView:verticallyCenteredToView:inHudView:](self, "p_constraintsForIconView:verticallyCenteredToView:inHudView:", v38, v39, v3));
  objc_msgSend(v37, "addObjectsFromArray:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController textLabel](self, "textLabel"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController iconImageView](self, "iconImageView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController selectAllButton](self, "selectAllButton"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController deselectAllButton](self, "deselectAllButton"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_constraintsForTextLabel:inHudView:withIconView:andSelectAllButton:andDeselectAllButton:forCompactLayout:](self, "p_constraintsForTextLabel:inHudView:withIconView:andSelectAllButton:andDeselectAllButton:forCompactLayout:", v41, v3, v42, v43, v44, 1));
  objc_msgSend(v37, "addObjectsFromArray:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController selectAllButton](self, "selectAllButton"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController deselectAllButton](self, "deselectAllButton"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController doneButton](self, "doneButton"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController textLabel](self, "textLabel"));
  LOBYTE(v56) = 1;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_constraintsForSelectAllButton:deselectAllButton:andDoneButton:withSeparator:andTextLabel:inHudView:forCompactLayout:](self, "p_constraintsForSelectAllButton:deselectAllButton:andDoneButton:withSeparator:andTextLabel:inHudView:forCompactLayout:", v46, v47, v48, v9, v49, v3, v56));
  objc_msgSend(v37, "addObjectsFromArray:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController compactHUDConstraints](self, "compactHUDConstraints"));
  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController compactHUDConstraints](self, "compactHUDConstraints"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "arrayByAddingObjectsFromArray:", v37));
    -[CRLiOSQuickSelectViewController setCompactHUDConstraints:](self, "setCompactHUDConstraints:", v53);

  }
  else
  {
    -[CRLiOSQuickSelectViewController setCompactHUDConstraints:](self, "setCompactHUDConstraints:", v37);
  }

  return v3;
}

- (void)temporarilyHideUIIfAppropriateForWindowRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
  objc_msgSend(v9, "bounds");
  objc_msgSend(v8, "convertRect:toView:", 0);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[CRLiOSQuickSelectViewController p_temporarilyHideUIIfAppropriateForWindowRect:hudRect:](self, "p_temporarilyHideUIIfAppropriateForWindowRect:hudRect:", x, y, width, height, v11, v13, v15, v17);
}

- (void)temporarilyHideUI
{
  -[CRLiOSQuickSelectViewController p_hideHUDWithAnimation:](self, "p_hideHUDWithAnimation:", 1);
}

- (void)p_temporarilyHideUIIfAppropriateForWindowRect:(CGRect)a3 hudRect:(CGRect)a4
{
  if (sub_100060F38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height)&& !self->_hidingHUDForWindowRect)
  {
    self->_hidingHUDForWindowRect = 1;
    -[CRLiOSQuickSelectViewController p_hideHUDWithAnimation:](self, "p_hideHUDWithAnimation:", 1);
  }
}

- (void)unhideUIIfAppropriateAfterHidingForWindowRect
{
  if (self->_hidingHUDForWindowRect)
  {
    self->_hidingHUDForWindowRect = 0;
    -[CRLiOSQuickSelectViewController p_unhideHUDWithAnimation:](self, "p_unhideHUDWithAnimation:", 1);
  }
}

- (void)unhideUI
{
  -[CRLiOSQuickSelectViewController p_unhideHUDWithAnimation:](self, "p_unhideHUDWithAnimation:", 1);
}

- (id)traitCollection
{
  id v2;
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;
  _QWORD v10[2];

  v9.receiver = self;
  v9.super_class = (Class)CRLiOSQuickSelectViewController;
  v2 = -[CRLiOSQuickSelectViewController traitCollection](&v9, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    v10[0] = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", UIContentSizeCategoryExtraExtraLarge));
    v10[1] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    v7 = objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithTraitsFromCollections:](UITraitCollection, "traitCollectionWithTraitsFromCollections:", v6));

    v3 = (void *)v7;
  }

  return v3;
}

- (BOOL)isInCompactViewModeForCompactFrame:(CGRect)a3 andRegularSizeFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController traitCollection](self, "traitCollection"));
  v14 = objc_msgSend(v13, "horizontalSizeClass");

  if (v14 == (id)1)
    v15 = v11;
  else
    v15 = x;
  if (v14 == (id)1)
    v16 = v10;
  else
    v16 = y;
  if (v14 == (id)1)
    v17 = v9;
  else
    v17 = width;
  if (v14 == (id)1)
    v18 = v8;
  else
    v18 = height;
  return -[CRLiOSQuickSelectViewController p_isInCompactViewModeForFrame:](self, "p_isInCompactViewModeForFrame:", v15, v16, v17, v18);
}

- (BOOL)p_isInCompactViewModeForFrame:(CGRect)a3
{
  double width;
  void *v4;
  id v5;

  width = a3.size.width;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController traitCollection](self, "traitCollection", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == (id)1 && width >= 480.0)
    return 0;
  return width < 480.0 || v5 == (id)1;
}

- (id)p_createBaseHUDView
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v2 = objc_alloc_init((Class)UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v3, "setCornerRadius:", 8.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v4, "setCornerCurve:", kCACornerCurveContinuous);

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.1)));
  v6 = objc_msgSend(v5, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v7, "setBorderColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v8, "setBorderWidth:", 1.0);

  LODWORD(v9) = 1144799232;
  objc_msgSend(v2, "setContentHuggingPriority:forAxis:", 0, v9);
  LODWORD(v10) = 1148829696;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v10);
  return v2;
}

- (id)p_createBackgroundView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init((Class)UIView);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v4, "crl_applyDefaultCanvasOverlayUIShadowSettings");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v5, "setCornerRadius:", 8.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v6, "setCornerCurve:", kCACornerCurveContinuous);

  return v2;
}

- (id)p_createSeparatorView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)UIView);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (void)p_configureIconView:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v8, "setTintColor:", v3);

  LODWORD(v4) = 1148846080;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 1, v7);

}

- (void)p_configureTextLabel:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v7, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v7, "setTextColor:", v4);

  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v7, "setAllowsDefaultTighteningForTruncation:", 1);
  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
  LODWORD(v5) = 1144750080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  LODWORD(v6) = 1132068864;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v6);

}

- (void)p_configureSelectAllButton:(id)a3 andDeselectAllButton:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[CRLiOSQuickSelectViewController p_configureSelectButton:](self, "p_configureSelectButton:", v7);
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, "p_selectAllAction:", 64);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Select All"), 0, 0));
  objc_msgSend(v7, "setTitle:forState:", v9, 0);

  -[CRLiOSQuickSelectViewController p_configureSelectButton:](self, "p_configureSelectButton:", v6);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, "p_deselectAllAction:", 64);
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Deselect All"), 0, 0));
  objc_msgSend(v6, "setTitle:forState:", v10, 0);

}

- (void)p_configureSelectButton:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v7, "setFont:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v8, "setLineBreakMode:", 0);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v9, "setNumberOfLines:", 0);

}

- (void)p_configureDoneButton:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_doneEditingAction:", 64);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleLabel"));
  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleLabel"));
  objc_msgSend(v9, "setLineBreakMode:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleLabel"));
  objc_msgSend(v10, "setNumberOfLines:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Done"), 0, 0));

  objc_msgSend(v4, "setTitle:forState:", v12, 0);
}

- (void)p_updateUIAfterSwitchingBetweenCompactAndRegular
{
  _BOOL4 showingCompactHUD;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  showingCompactHUD = self->_showingCompactHUD;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController doneButton](self, "doneButton"));
  v6 = v4;
  if (showingCompactHUD)
  {
    LODWORD(v5) = 1132068864;
    objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController regularSizeHUDConstraints](self, "regularSizeHUDConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7);

    v8 = objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController compactHUDConstraints](self, "compactHUDConstraints"));
  }
  else
  {
    LODWORD(v5) = 1148829696;
    objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v5);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController compactHUDConstraints](self, "compactHUDConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v9);

    v8 = objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController regularSizeHUDConstraints](self, "regularSizeHUDConstraints"));
  }
  v10 = (id)v8;
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:");

}

- (id)p_constraintsForBackgroundView:(id)a3 inHudView:(id)a4
{
  id v5;
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
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];

  v5 = a4;
  v6 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v21[0] = v18;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v21[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v21[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v21[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));

  return v16;
}

- (id)p_constraintsForIconView:(id)a3 verticallyCenteredToView:(id)a4 inHudView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 12.0));
  v18[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v18[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));

  return v16;
}

- (id)p_constraintsForTextLabel:(id)a3 inHudView:(id)a4 withIconView:(id)a5 andSelectAllButton:(id)a6 andDeselectAllButton:(id)a7 forCompactLayout:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
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
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  _QWORD v43[2];
  void *v44;

  v8 = a8;
  v13 = a3;
  v14 = a6;
  v41 = a7;
  v15 = a5;
  v16 = a4;
  v17 = objc_alloc((Class)NSMutableArray);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 12.0));
  v44 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
  v40 = objc_msgSend(v17, "initWithArray:", v21);

  v39 = v14;
  if (v8)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -12.0));
    v43[0] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 12.0));
    v43[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2));
    v29 = v40;
    objc_msgSend(v40, "addObjectsFromArray:", v28);
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "widthAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:multiplier:", v31, 2.0));

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "widthAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:multiplier:", v33, 2.0));

    LODWORD(v34) = 1.0;
    objc_msgSend(v22, "setPriority:", v34);
    LODWORD(v35) = 1.0;
    objc_msgSend(v23, "setPriority:", v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "heightAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "heightAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -20.0));
    v42[0] = v26;
    v42[1] = v22;
    v42[2] = v23;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    v42[3] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
    objc_msgSend(v40, "addObjectsFromArray:", v37);

    v29 = v40;
  }

  return v29;
}

- (id)p_constraintsForSelectAllButton:(id)a3 deselectAllButton:(id)a4 andDoneButton:(id)a5 withSeparator:(id)a6 andTextLabel:(id)a7 inHudView:(id)a8 forCompactLayout:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
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
  void *v44;
  void *v45;
  void *v46;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
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
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
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
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  _QWORD v123[3];
  _QWORD v124[5];
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[6];
  _QWORD v128[6];
  _QWORD v129[3];

  v14 = a3;
  v15 = a4;
  v118 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v121 = v14;
  v122 = objc_alloc_init((Class)NSMutableArray);
  v116 = v16;
  v119 = v17;
  v120 = v15;
  if (a9)
  {
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:constant:", v19, 12.0));
    v129[0] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "widthAnchor"));
    v22 = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "widthAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    v129[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "heightAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v26, "scale");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToConstant:", 1.0 / v27));
    v129[2] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v129, 3));
    objc_msgSend(v122, "addObjectsFromArray:", v29);

    v30 = v119;
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "leadingAnchor"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  }
  else
  {
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:constant:", v109, 12.0));
    v128[0] = v105;
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:constant:", v97, 12.0));
    v128[1] = v94;
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintGreaterThanOrEqualToAnchor:constant:", v91, 12.0));
    v128[2] = v90;
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintGreaterThanOrEqualToAnchor:constant:", v33, 12.0));
    v128[3] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "widthAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v36, "scale");
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", 1.0 / v37));
    v128[4] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "heightAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "heightAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
    v128[5] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v128, 6));
    objc_msgSend(v122, "addObjectsFromArray:", v42);

    v30 = v119;
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));

    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "topAnchor"));
  }
  v43 = (void *)v32;
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "leadingAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:constant:", v31, 12.0));
  v127[0] = v102;
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "topAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:constant:", v43, 12.0));
  v127[1] = v95;
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v44, -12.0));
  v127[2] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "leadingAnchor"));
  v114 = (void *)v31;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v31, 12.0));
  v127[3] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "topAnchor"));
  v110 = v43;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v43, 12.0));
  v127[4] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, -12.0));
  v127[5] = v52;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v127, 6));
  objc_msgSend(v122, "addObjectsFromArray:", v53);

  if (a9)
  {
    v54 = v121;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "widthAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "widthAnchor"));
    v107 = v55;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
    v125[0] = v57;
    v58 = v120;
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "widthAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "widthAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v60));
    v125[1] = v61;
    v62 = v125;
    v63 = v121;
  }
  else
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "centerYAnchor"));
    v54 = v119;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "centerYAnchor"));
    v107 = v64;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v56));
    v126[0] = v57;
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "centerYAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "centerYAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v60));
    v126[1] = v61;
    v62 = v126;
    v58 = v116;
    v63 = v116;
  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 2));
  objc_msgSend(v122, "addObjectsFromArray:", v65);

  v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "trailingAnchor"));
  v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v68 = v54;
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "leadingAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:constant:", v66, 12.0));
  v124[0] = v99;
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "leadingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:constant:", v67, 12.0));
  v124[1] = v69;
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "leadingAnchor"));
  v115 = (void *)v66;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintGreaterThanOrEqualToAnchor:constant:", v66, 12.0));
  v124[2] = v71;
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "leadingAnchor"));
  v111 = (void *)v67;
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintGreaterThanOrEqualToAnchor:constant:", v67, 12.0));
  v124[3] = v73;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "centerYAnchor"));
  v108 = v68;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "centerYAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v75));
  v124[4] = v76;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v124, 5));
  objc_msgSend(v122, "addObjectsFromArray:", v77);

  if (a9)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "trailingAnchor"));
    v79 = v119;
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "trailingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v80, -12.0));
    v82 = v122;
    objc_msgSend(v122, "addObject:", v81);
  }
  else
  {
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "topAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "topAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:constant:", v80, 10.0));
    v123[0] = v81;
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "bottomAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "bottomAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:constant:", v100, -10.0));
    v123[1] = v83;
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "trailingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "trailingAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, 12.0));
    v123[2] = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v123, 3));
    v82 = v122;
    objc_msgSend(v122, "addObjectsFromArray:", v87);

    v79 = v119;
    v78 = v117;

  }
  return v82;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSQuickSelectViewController;
  -[CRLiOSQuickSelectViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  -[CRLiOSQuickSelectViewController p_setNeedsHudContainerViewFrameUpdate](self, "p_setNeedsHudContainerViewFrameUpdate");
}

- (void)presentOnCanvasViewController:(id)a3 parentView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  CRLiOSUnhittableView *v19;
  CRLiOSUnhittableView *v20;
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
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  dispatch_time_t v46;
  _QWORD block[5];
  _QWORD v48[3];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));

  if (v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232700);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1964();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232720);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController presentOnCanvasViewController:parentView:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 466, 0, "expected nil value for '%{public}s'", "self.hudContainerView.superview");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));

  if (!v14)
  {
    objc_storeWeak((id *)&self->_canvasViewController, v6);
    if (!v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_canvasViewController);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "enclosingScrollView"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));

      if (!v7)
      {
        v18 = objc_loadWeakRetained((id *)&self->_canvasViewController);
        v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "canvasView"));

      }
    }
    v19 = [CRLiOSUnhittableView alloc];
    objc_msgSend(v7, "frame");
    v20 = -[CRLiOSUnhittableView initWithFrame:](v19, "initWithFrame:");
    -[CRLiOSQuickSelectViewController setHudContainerView:](self, "setHudContainerView:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
    objc_msgSend(v21, "setAutoresizingMask:", 18);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
    objc_msgSend(v7, "addSubview:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
    -[CRLiOSQuickSelectViewController setView:](self, "setView:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_makeHUDView](self, "p_makeHUDView"));
    -[CRLiOSQuickSelectViewController setHUDView:](self, "setHUDView:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
    objc_msgSend(v25, "addSubview:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_setupHUDConstraintsInContainerViewForView:isCompact:](self, "p_setupHUDConstraintsInContainerViewForView:isCompact:", v27, 0));

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController regularSizeHUDConstraints](self, "regularSizeHUDConstraints"));
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController regularSizeHUDConstraints](self, "regularSizeHUDConstraints"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v28));
      -[CRLiOSQuickSelectViewController setRegularSizeHUDConstraints:](self, "setRegularSizeHUDConstraints:", v31);

    }
    else
    {
      -[CRLiOSQuickSelectViewController setRegularSizeHUDConstraints:](self, "setRegularSizeHUDConstraints:", v28);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController p_setupHUDConstraintsInContainerViewForView:isCompact:](self, "p_setupHUDConstraintsInContainerViewForView:isCompact:", v32, 1));

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController compactHUDConstraints](self, "compactHUDConstraints"));
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController compactHUDConstraints](self, "compactHUDConstraints"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v33));
      -[CRLiOSQuickSelectViewController setCompactHUDConstraints:](self, "setCompactHUDConstraints:", v36);

    }
    else
    {
      -[CRLiOSQuickSelectViewController setCompactHUDConstraints:](self, "setCompactHUDConstraints:", v33);
    }
    if (self->_showingCompactHUD)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101232740);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF18E4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101232760);
      v37 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController presentOnCanvasViewController:parentView:]"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v38, v39, 506, 0, "We should flip around which constraints are enabled by default.");

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController regularSizeHUDConstraints](self, "regularSizeHUDConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);

    -[CRLiOSQuickSelectViewController p_visibleCanvasRectInContainerView](self, "p_visibleCanvasRectInContainerView");
    -[CRLiOSQuickSelectViewController p_updateHudContainerViewFrameWithVisibleRect:animated:](self, "p_updateHudContainerViewFrameWithVisibleRect:animated:", 0);
    -[CRLiOSQuickSelectViewController p_beginWatchingSelectionChanges](self, "p_beginWatchingSelectionChanges");
    v48[0] = objc_opt_class(UITraitHorizontalSizeClass, v41);
    v48[1] = objc_opt_class(UITraitVerticalSizeClass, v42);
    v48[2] = objc_opt_class(UITraitUserInterfaceStyle, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
    v45 = -[CRLiOSQuickSelectViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v44, &stru_1012327A0);
    v46 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100091D44;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_after(v46, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)p_setNeedsHudContainerViewFrameUpdate
{
  void *v3;
  id v4;
  void *v5;
  NSRunLoopMode v6;

  if (-[CRLiOSQuickSelectViewController p_isPresented](self, "p_isPresented"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = objc_msgSend(v3, "applicationState");

    if (v4 != (id)2)
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_performHudContainerViewFrameUpdate", 0);
      v6 = NSRunLoopCommonModes;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
      -[CRLiOSQuickSelectViewController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "p_performHudContainerViewFrameUpdate", 0, v5, 0.05);

    }
  }
}

- (void)p_performHudContainerViewFrameUpdate
{
  -[CRLiOSQuickSelectViewController p_visibleCanvasRectInContainerView](self, "p_visibleCanvasRectInContainerView");
  -[CRLiOSQuickSelectViewController p_updateHudContainerViewFrameWithVisibleRect:animated:](self, "p_updateHudContainerViewFrameWithVisibleRect:animated:", 1);
}

- (void)p_updateHudContainerViewFrameWithVisibleRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  CGRect *p_lastKnownVisibleRect;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void ***v45;
  void *v46;
  void *v47;
  void **v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  void *v51;
  CRLiOSQuickSelectViewController *v52;
  id v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController traitCollection](self, "traitCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v58.size.width = v18 + 1.0;
  v58.size.height = v20 + 1.0;
  v58.origin.x = v14;
  v58.origin.y = v16;
  v63.origin.x = x;
  v63.origin.y = y;
  v63.size.width = width;
  v63.size.height = height;
  v21 = CGRectContainsRect(v58, v63);
  p_lastKnownVisibleRect = &self->_lastKnownVisibleRect;
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  if ((!CGRectEqualToRect(self->_lastKnownVisibleRect, v64)
     || (-[UITraitCollection isEqual:](self->_lastKnownTraitCollection, "isEqual:", v10) & 1) == 0)
    && width >= 100.0
    && height >= 100.0
    && v21)
  {
    v59.origin.x = p_lastKnownVisibleRect->origin.x;
    v59.origin.y = self->_lastKnownVisibleRect.origin.y;
    v59.size.width = self->_lastKnownVisibleRect.size.width;
    v59.size.height = self->_lastKnownVisibleRect.size.height;
    v65.origin.x = CGRectZero.origin.x;
    v65.origin.y = CGRectZero.origin.y;
    v65.size.width = CGRectZero.size.width;
    v65.size.height = CGRectZero.size.height;
    v23 = CGRectEqualToRect(v59, v65);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "superview"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
    objc_msgSend(v26, "frame");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "superview"));
    objc_msgSend(v25, "convertRect:toView:", v36, v28, v30, v32, v34);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    v66.origin.x = v38;
    v66.origin.y = v40;
    v66.size.width = v42;
    v66.size.height = v44;
    if (!CGRectContainsRect(v60, v66))
      goto LABEL_11;
    if (v23)
      goto LABEL_11;
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    v62 = CGRectInset(v61, -18.0, -18.0);
    v67.origin.x = p_lastKnownVisibleRect->origin.x;
    v67.origin.y = self->_lastKnownVisibleRect.origin.y;
    v67.size.width = self->_lastKnownVisibleRect.size.width;
    v67.size.height = self->_lastKnownVisibleRect.size.height;
    if (!CGRectContainsRect(v62, v67)
      || width / self->_lastKnownVisibleRect.size.width > 1.3
      || height / self->_lastKnownVisibleRect.size.height > 1.3)
    {
LABEL_11:
      p_lastKnownVisibleRect->origin.x = x;
      self->_lastKnownVisibleRect.origin.y = y;
      self->_lastKnownVisibleRect.size.width = width;
      self->_lastKnownVisibleRect.size.height = height;
      objc_storeStrong((id *)&self->_lastKnownTraitCollection, v10);
      v48 = _NSConcreteStackBlock;
      v49 = 3221225472;
      v50 = sub_100092208;
      v51 = &unk_1012327C8;
      v52 = self;
      v54 = x;
      v55 = y;
      v56 = width;
      v57 = height;
      v53 = v10;
      v45 = objc_retainBlock(&v48);
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView", v48, v49, v50, v51, v52));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layer"));
      objc_msgSend(v47, "removeAllAnimations");

      if (v4)
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v45, 0, 0.2);
      else
        ((void (*)(void ***))v45[2])(v45);

    }
  }

}

- (void)dismiss
{
  void *v3;
  id v4;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_performHudContainerViewFrameUpdate", 0);
  -[CRLiOSQuickSelectViewController p_endWatchingSelectionChanges](self, "p_endWatchingSelectionChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
  objc_msgSend(v4, "removeFromSuperview");

}

- (id)p_setupHUDConstraintsInContainerViewForView:(id)a3 isCompact:(BOOL)a4
{
  _BOOL4 v4;
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
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[6];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012327E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1A84();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232808);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_setupHUDConstraintsInContainerViewForView:isCompact:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 635, 0, "invalid nil value for '%{public}s'", "self.hudContainerView");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232828);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF19F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232848);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_setupHUDConstraintsInContainerViewForView:isCompact:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 638, 0, "invalid nil value for '%{public}s'", "view");

  }
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "widthAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:", v16));

  LODWORD(v18) = 1148829696;
  v50 = v17;
  objc_msgSend(v17, "setPriority:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v20));

  LODWORD(v22) = 1.0;
  v49 = v21;
  objc_msgSend(v21, "setPriority:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  if (v4)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 16.0));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, -16.0));

    v32 = 1148846080;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", v25, 16.0));

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:constant:", v35, -16.0));

    v32 = 1144782848;
  }
  v36 = v32;
  LODWORD(v31) = v32;
  objc_msgSend(v26, "setPriority:", v31);
  LODWORD(v37) = v36;
  objc_msgSend(v30, "setPriority:", v37);
  v47 = v26;
  v48 = v30;
  v51[0] = v26;
  v51[1] = v30;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));
  v40 = v6;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  v51[2] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, -16.0));
  v51[3] = v44;
  v51[4] = v50;
  v51[5] = v49;
  v46 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 6));

  return v46;
}

- (void)p_displayCurrentHUDForTraitCollection:(id)a3 andVisibleRect:(CGRect)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (!-[CRLiOSQuickSelectViewController p_isInCompactViewModeForFrame:](self, "p_isInCompactViewModeForFrame:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height))
  {
    if (!self->_showingCompactHUD)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController regularSizeHUDConstraints](self, "regularSizeHUDConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7);

      v6 = objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController regularSizeHUDConstraints](self, "regularSizeHUDConstraints"));
      goto LABEL_9;
    }
    self->_showingCompactHUD = 0;
LABEL_7:
    -[CRLiOSQuickSelectViewController p_updateUIAfterSwitchingBetweenCompactAndRegular](self, "p_updateUIAfterSwitchingBetweenCompactAndRegular");
    return;
  }
  if (!self->_showingCompactHUD)
  {
    self->_showingCompactHUD = 1;
    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController compactHUDConstraints](self, "compactHUDConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController compactHUDConstraints](self, "compactHUDConstraints"));
LABEL_9:
  v8 = (id)v6;
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

}

- (CGRect)p_visibleCanvasRectInContainerView
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
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
  double v27;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "visibleCanvasRectForQuickSelectViewController:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = objc_loadWeakRetained((id *)&self->_canvasViewController);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController hudContainerView](self, "hudContainerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));
  objc_msgSend(v13, "convertRect:toView:", v15, v5, v7, v9, v11);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)p_doneEditingAction:(id)a3
{
  -[CRLiOSQuickSelectViewController p_dismissAndAlertDelegate](self, "p_dismissAndAlertDelegate", a3);
}

- (void)p_dismissAndAlertDelegate
{
  id WeakRetained;

  -[CRLiOSQuickSelectViewController dismiss](self, "dismiss");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didDismissQuickSelectViewController:", self);

}

- (void)p_selectAllAction:(id)a3
{
  CRLiOSQuickSelectViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorForEditAction:withSender:", "selectAll:", self));

  if (v10)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editorForEditAction:withSender:", "selectAllForQuickSelect:", self));

    if (v9 == v10)
      objc_msgSend(v10, "selectAllForQuickSelect:", self);
    else
      objc_msgSend(v10, "selectAll:", self);
    self->_areAllSelected = 1;
  }
  -[CRLiOSQuickSelectViewController p_updateHUDState](self, "p_updateHUDState");

}

- (void)p_deselectAllAction:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPathWithInfos:", 0));
  objc_msgSend(v6, "setSelectionPath:withFlags:", v7, 0x8000);

  self->_areAllSelected = 0;
  -[CRLiOSQuickSelectViewController p_updateHUDState](self, "p_updateHUDState");

}

- (void)p_hideHUDWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232868);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1B14();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232888);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_hideHUDWithAnimation:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 734, 0, "This operation must only be performed on the main thread.");

  }
  if (!-[CRLiOSQuickSelectViewController p_isHUDHidden](self, "p_isHUDHidden"))
  {
    if (v3)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100092F90;
      v9[3] = &unk_10122D110;
      v9[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, 0, 0.2);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
      objc_msgSend(v8, "setAlpha:", 0.0);

    }
  }
  ++self->_hudHidingCount;
}

- (void)p_unhideHUDWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
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
  int64_t hudHidingCount;
  int64_t v16;
  void *v17;
  _QWORD v18[5];

  v3 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012328A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1CCC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012328C8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_unhideHUDWithAnimation:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 751, 0, "This operation must only be performed on the main thread.");

  }
  if (!self->_hudHidingCount)
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012328E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1C14(v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232908);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_unhideHUDWithAnimation:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 752, 0, "expected inequality between %{public}s and %{public}s", "_hudHidingCount", "0");

  }
  if (!-[CRLiOSQuickSelectViewController p_isHUDHidden](self, "p_isHUDHidden"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232928);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1B94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232948);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSQuickSelectViewController p_unhideHUDWithAnimation:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSQuickSelectViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 753, 0, "Attempting to unhide Quick Select HUD but the HUD is not hidden.");

  }
  hudHidingCount = self->_hudHidingCount;
  if (hudHidingCount <= 1)
    hudHidingCount = 1;
  v16 = hudHidingCount - 1;
  self->_hudHidingCount = v16;
  if (!v16 && -[CRLiOSQuickSelectViewController p_isHUDHidden](self, "p_isHUDHidden"))
  {
    if (v3)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100093500;
      v18[3] = &unk_10122D110;
      v18[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v18, 0, 0.2);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
      objc_msgSend(v17, "setAlpha:", 1.0);

    }
  }
}

- (BOOL)p_isHUDHidden
{
  void *v2;
  double v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
  objc_msgSend(v2, "alpha");
  v4 = fabs(v3) < 0.00999999978 || v3 == 0.0;

  return v4;
}

- (void)p_updateHUDState
{
  -[CRLiOSQuickSelectViewController p_updateStateForSelectionButtons](self, "p_updateStateForSelectionButtons");
  -[CRLiOSQuickSelectViewController p_updateHUDTitle](self, "p_updateHUDTitle");
  -[CRLiOSQuickSelectViewController p_updateHUDIcon](self, "p_updateHUDIcon");
}

- (void)p_updateStateForSelectionButtons
{
  _BOOL4 areAllSelected;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  areAllSelected = self->_areAllSelected;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController selectAllButton](self, "selectAllButton"));
  v5 = v4;
  if (areAllSelected)
  {
    objc_msgSend(v4, "setHidden:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController deselectAllButton](self, "deselectAllButton"));
    v8 = v6;
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "setHidden:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController deselectAllButton](self, "deselectAllButton"));
    v8 = v6;
    v7 = 1;
  }
  objc_msgSend(v6, "setHidden:", v7);

}

- (void)p_updateHUDTitle
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100093778;
  v13 = sub_100093788;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("To select or deselect an object, tap it. To select multiple objects, drag across them."), 0, 0));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100093790;
  v8[3] = &unk_101232970;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateEditorsOnStackUsingBlock:", v8);

  v6 = v10[5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController textLabel](self, "textLabel"));
  objc_msgSend(v7, "setText:", v6);

  _Block_object_dispose(&v9, 8);
}

- (void)p_updateHUDIcon
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  __CFString *v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100093778;
  v14 = sub_100093788;
  v15 = CFSTR("square.on.circle");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100093960;
  v9[3] = &unk_101232970;
  v9[4] = &v10;
  objc_msgSend(v4, "enumerateEditorsOnStackUsingBlock:", v9);

  v5 = v11[5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 17.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v5, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v8, "setImage:", v7);

  _Block_object_dispose(&v10, 8);
}

- (void)p_updateHUDAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v6, "setTintColor:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController textLabel](self, "textLabel"));
  objc_msgSend(v7, "setTextColor:", v8);

}

- (void)p_beginWatchingSelectionChanges
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "p_selectionPathDidChange:", CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "p_currentEditorDidChange:", CFSTR("CRLEditorControllerDidChangeCurrentEditors"), v7);

}

- (void)p_endWatchingSelectionChanges
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("CRLEditorControllerDidChangeCurrentEditors"), v7);

}

- (void)p_selectionPathDidChange:(id)a3
{
  id WeakRetained;
  unsigned int v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "shouldExitQuickSelectModeForQuickSelectViewController:", self);

  if (v5)
  {
    -[CRLiOSQuickSelectViewController p_dismissAndAlertDelegate](self, "p_dismissAndAlertDelegate");
  }
  else
  {
    self->_areAllSelected = 0;
    -[CRLiOSQuickSelectViewController p_updateHUDState](self, "p_updateHUDState");
  }
}

- (void)p_currentEditorDidChange:(id)a3
{
  id WeakRetained;
  unsigned int v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "shouldExitQuickSelectModeForQuickSelectViewController:", self);

  if (v5)
    -[CRLiOSQuickSelectViewController p_dismissAndAlertDelegate](self, "p_dismissAndAlertDelegate");
}

- (void)p_performSuperviewInteraction:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)p_isPresented
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSQuickSelectViewController HUDView](self, "HUDView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "superview"));
  v4 = v3 != 0;

  return v4;
}

- (UIView)HUDView
{
  return self->_HUDView;
}

- (void)setHUDView:(id)a3
{
  objc_storeStrong((id *)&self->_HUDView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UIButton)selectAllButton
{
  return self->_selectAllButton;
}

- (void)setSelectAllButton:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllButton, a3);
}

- (UIButton)deselectAllButton
{
  return self->_deselectAllButton;
}

- (void)setDeselectAllButton:(id)a3
{
  objc_storeStrong((id *)&self->_deselectAllButton, a3);
}

- (NSArray)regularSizeHUDConstraints
{
  return self->_regularSizeHUDConstraints;
}

- (void)setRegularSizeHUDConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_regularSizeHUDConstraints, a3);
}

- (NSArray)compactHUDConstraints
{
  return self->_compactHUDConstraints;
}

- (void)setCompactHUDConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_compactHUDConstraints, a3);
}

- (CRLiOSUnhittableView)hudContainerView
{
  return self->_hudContainerView;
}

- (void)setHudContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_hudContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hudContainerView, 0);
  objc_storeStrong((id *)&self->_compactHUDConstraints, 0);
  objc_storeStrong((id *)&self->_regularSizeHUDConstraints, 0);
  objc_storeStrong((id *)&self->_deselectAllButton, 0);
  objc_storeStrong((id *)&self->_selectAllButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_HUDView, 0);
  objc_storeStrong((id *)&self->_lastKnownTraitCollection, 0);
  objc_destroyWeak((id *)&self->_canvasViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

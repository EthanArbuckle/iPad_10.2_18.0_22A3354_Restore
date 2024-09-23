@implementation BKFinishedContentViewController

- (BKFinishedContentViewController)init
{
  BKFinishedContentViewController *v2;
  BKFinishedContentViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKFinishedContentViewController;
  v2 = -[BKContentViewController init](&v5, "init");
  v3 = v2;
  if (v2)
    sub_6C150(v2);
  return v3;
}

- (BKFinishedContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BKFinishedContentViewController *v4;
  BKFinishedContentViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKFinishedContentViewController;
  v4 = -[BKViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    sub_6C150(v4);
  return v5;
}

- (BKFinishedContentViewController)initWithCoder:(id)a3
{
  BKFinishedContentViewController *v3;
  BKFinishedContentViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKFinishedContentViewController;
  v3 = -[BKFinishedContentViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    sub_6C150(v3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BKFinishedContentViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKFinishedContentViewController;
  -[BKContentViewController dealloc](&v3, "dealloc");
}

- (void)releaseViews
{
  UIImageView *checkmarkImageView;
  UILabel *titleLabel;
  UILabel *bodyLabel;
  BKFinishedButton *finishedButton;
  objc_super v7;

  checkmarkImageView = self->_checkmarkImageView;
  self->_checkmarkImageView = 0;

  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = 0;

  finishedButton = self->_finishedButton;
  self->_finishedButton = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKFinishedContentViewController;
  -[BKContentViewController releaseViews](&v7, "releaseViews");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKFinishedContentViewController;
  -[BKContentViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 103.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle.fill"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController checkmarkImageView](self, "checkmarkImageView"));
  objc_msgSend(v5, "setImage:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  __CFString *v5;
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
  objc_super v26;
  _QWORD v27[4];

  v26.receiver = self;
  v26.super_class = (Class)BKFinishedContentViewController;
  -[BKFinishedContentViewController viewWillAppear:](&v26, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = BKStyleManagerDidChangeStyleNotification[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController styleManager](self, "styleManager"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_didChangeStyle:", v5, v6);

  -[BKFinishedContentViewController updateFonts](self, "updateFonts");
  -[BKFinishedContentViewController updateAppearance](self, "updateAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController view](self, "view"));
  objc_msgSend(v7, "layoutIfNeeded");

  -[BKFinishedContentViewController updateButtonAppearance](self, "updateButtonAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController bodyLabel](self, "bodyLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 45.0));
  v27[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController bodyLabel](self, "bodyLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, -45.0));
  v27[1] = v18;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController titleLabel](self, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 45.0));
  v27[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController titleLabel](self, "titleLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -45.0));
  v27[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKFinishedContentViewController;
  -[BKContentViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = BKStyleManagerDidChangeStyleNotification[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController styleManager](self, "styleManager"));
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, v6);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKFinishedContentViewController;
  -[BKFinishedContentViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[BKFinishedContentViewController updateButtonTitle](self, "updateButtonTitle");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKFinishedContentViewController;
  -[BKFinishedContentViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[BKFinishedContentViewController updateButtonAppearance](self, "updateButtonAppearance");
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[BKFinishedContentViewController updateViewConstraints](self, "updateViewConstraints", a3, a4);
}

- (void)finishedPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v6, "contentViewController:setFinishedAndCloseForAssetID:") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));

    objc_msgSend(v6, "contentViewController:setFinishedAndCloseForAssetID:", self, v5);
  }

}

- (void)updateButtonTitle
{
  unsigned int v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  v3 = -[BKFinishedContentViewController im_isCompactWidth](self, "im_isCompactWidth");
  v4 = AEBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
    v7 = CFSTR("Finished");
  else
    v7 = CFSTR("Mark as Finished");
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1C3088, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController finishedButton](self, "finishedButton"));
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

}

- (void)updateButtonAppearance
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  CGFloat v8;
  void *v9;
  id v10;
  CGRect v11;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController finishedButton](self, "finishedButton"));
  -[BKFinishedContentViewController contentScale](self, "contentScale");
  v4 = 40.0;
  v5 = v3 * 40.0;
  v6 = v3 <= 0.0;
  if (v3 <= 0.0)
    v7 = 12.0;
  else
    v7 = v3 * 12.0;
  if (!v6)
    v4 = v5;
  objc_msgSend(v10, "setContentEdgeInsets:", v7, v4, v7, v4);
  objc_msgSend(v10, "frame");
  v8 = CGRectGetHeight(v11) * 0.5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  objc_msgSend(v9, "setCornerRadius:", v8);

}

- (void)updateViewConstraints
{
  void *v3;
  char *v4;
  void *v5;
  char *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double Width;
  BOOL v17;
  void *v18;
  char *v19;
  void *v20;
  double Height;
  BOOL v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;

  v39.receiver = self;
  v39.super_class = (Class)BKFinishedContentViewController;
  -[BKFinishedContentViewController updateViewConstraints](&v39, "updateViewConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController traitCollection](self, "traitCollection"));
  v4 = (char *)objc_msgSend(v3, "horizontalSizeClass");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController traitCollection](self, "traitCollection"));
  v6 = (char *)objc_msgSend(v5, "verticalSizeClass");

  if (v4 == (_BYTE *)&dword_0 + 1)
  {
    if (v6 == (_BYTE *)&dword_0 + 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
      if ((objc_opt_respondsToSelector(v7, "hasSpreadPagesForContentViewController:") & 1) != 0
        && (objc_msgSend(v7, "hasSpreadPagesForContentViewController:", self) & 1) != 0)
      {
        v8 = 24.0;
        v9 = 16.0;
        v10 = 16.0;
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v19 = (char *)objc_msgSend(v18, "orientation") - 1;

        if ((unint64_t)v19 >= 2)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController view](self, "view"));
          objc_msgSend(v20, "bounds");
          Height = CGRectGetHeight(v41);

          v22 = Height > 320.0;
          if (Height <= 320.0)
            v9 = 12.0;
          else
            v9 = 16.0;
          if (v22)
            v8 = 24.0;
          else
            v8 = 20.0;
          v10 = v9;
        }
        else
        {
          v10 = 20.0;
          v9 = 24.0;
          v8 = 32.0;
        }
      }

      v14 = 44.0;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController view](self, "view"));
      objc_msgSend(v15, "bounds");
      Width = CGRectGetWidth(v40);

      v17 = Width > 320.0;
      if (Width <= 320.0)
        v9 = 16.0;
      else
        v9 = 32.0;
      if (v17)
        v10 = 24.0;
      else
        v10 = 16.0;
      if (v17)
        v8 = 47.0;
      else
        v8 = 24.0;
      v11 = 44.0;
      v12 = 96.0;
      if (v17)
        v14 = 96.0;
      else
        v14 = 44.0;
    }
  }
  else
  {
    v11 = 24.0;
    v12 = 120.0;
    v13 = 47.0;
    if (v6 == (_BYTE *)&dword_0 + 1)
      v9 = 16.0;
    else
      v9 = 32.0;
    if (v6 == (_BYTE *)&dword_0 + 1)
      v10 = 16.0;
    else
      v10 = 24.0;
    if (v6 == (_BYTE *)&dword_0 + 1)
      v8 = 24.0;
    else
      v8 = 47.0;
    if (v6 == (_BYTE *)&dword_0 + 1)
      v14 = 44.0;
    else
      v14 = 120.0;
  }
  -[BKFinishedContentViewController contentScale](self, "contentScale", v11, v12, v13);
  v24 = v23 <= 0.0;
  v25 = v14 * v23;
  v26 = v8 * v23;
  v27 = v10 * v23;
  v28 = v23 * 4.0;
  if (v24)
    v29 = 4.0;
  else
    v29 = v28;
  if (!v24)
  {
    v10 = v27;
    v8 = v26;
    v14 = v25;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController checkmarkWidthConstraint](self, "checkmarkWidthConstraint"));
  objc_msgSend(v30, "setConstant:", v14);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController checkmarkHeightConstraint](self, "checkmarkHeightConstraint"));
  objc_msgSend(v31, "setConstant:", v14);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController checkmarkTopConstraint](self, "checkmarkTopConstraint"));
  objc_msgSend(v32, "setConstant:", v29);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController titleTopConstraint](self, "titleTopConstraint"));
  objc_msgSend(v33, "setConstant:", v8);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController bodyTopConstraint](self, "bodyTopConstraint"));
  objc_msgSend(v34, "setConstant:", v10);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController finishedButtonTopConstraint](self, "finishedButtonTopConstraint"));
  objc_msgSend(v35, "setConstant:", v9);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController finishedButtonBottomConstraint](self, "finishedButtonBottomConstraint"));
  objc_msgSend(v36, "setConstant:", 30.0);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController finishedButtonLeadingConstraint](self, "finishedButtonLeadingConstraint"));
  objc_msgSend(v37, "setConstant:", v29);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController finishedButtonTrailingConstraint](self, "finishedButtonTrailingConstraint"));
  objc_msgSend(v38, "setConstant:", v29);

}

- (id)styleManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "styleManager"));

  return v3;
}

- (void)updateFonts
{
  double v3;
  void *v4;
  float v5;
  float v6;
  unsigned int v7;
  double v8;
  unsigned int v9;
  float v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = 1.0;
  if (!-[BKFinishedContentViewController fixedLayout](self, "fixedLayout"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController styleManager](self, "styleManager"));
    objc_msgSend(v4, "fontSize");
    v6 = v5;

    if (v6 > 0.0)
    {
      v7 = -[BKFinishedContentViewController im_isCompactWidth](self, "im_isCompactWidth");
      LODWORD(v8) = 1.5;
      if (v7)
      {
        v9 = -[BKFinishedContentViewController im_isCompactHeight](self, "im_isCompactHeight", v8);
        LODWORD(v8) = 1.5;
        if (v9)
          *(float *)&v8 = 1.25;
      }
      v10 = fmaxf(v6, 0.1);
      if (*(float *)&v8 > v10)
        *(float *)&v8 = v10;
      v3 = *(float *)&v8;
    }
  }
  -[BKFinishedContentViewController contentScale](self, "contentScale");
  if (v11 <= 0.0)
    v11 = 1.0;
  v12 = v3 * v11;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController titleLabel](self, "titleLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec fontSpecWithPostscriptName:size:](TUIFontSpec, "fontSpecWithPostscriptName:size:", CFSTR("BooksSerif-Heavy"), v12 * 24.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "font"));
  objc_msgSend(v21, "setFont:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController bodyLabel](self, "bodyLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v12 * 13.0));
  objc_msgSend(v15, "setFont:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController finishedButton](self, "finishedButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", v12 * 15.0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
  objc_msgSend(v19, "setFont:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController view](self, "view"));
  objc_msgSend(v20, "setNeedsUpdateConstraints");

}

- (void)_didChangeStyle:(id)a3
{
  void *v4;

  if (!+[NSThread isMainThread](NSThread, "isMainThread", a3))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKFinishedContentViewController.m", 400, "-[BKFinishedContentViewController _didChangeStyle:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  -[BKFinishedContentViewController updateFonts](self, "updateFonts");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController view](self, "view"));
  objc_msgSend(v4, "layoutIfNeeded");

  -[BKFinishedContentViewController updateButtonAppearance](self, "updateButtonAppearance");
}

- (void)updateAppearance
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if (-[BKFinishedContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController themePage](self, "themePage"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "backgroundColorForTraitEnvironment:", self));
    v4 = v3;
    if (v3)
      v5 = v3;
    else
      v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v6 = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController view](self, "view"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "finishedCheckmarkColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController checkmarkImageView](self, "checkmarkImageView"));
    objc_msgSend(v9, "setTintColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contentTextColor"));
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController titleLabel](self, "titleLabel"));
    objc_msgSend(v14, "setTextColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController bodyLabel](self, "bodyLabel"));
    objc_msgSend(v15, "setTextColor:", v13);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "buttonColor"));
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController finishedButton](self, "finishedButton"));
    objc_msgSend(v21, "setFrameWidth:", 0.0);
    objc_msgSend(v21, "setFrameColor:", v19);
    objc_msgSend(v21, "setNormalBackgroundColor:", v19);
    objc_msgSend(v21, "setHighlightBackgroundColor:", v6);
    objc_msgSend(v21, "setTitleColor:forState:", v20, 0);
    objc_msgSend(v21, "setTitleColor:forState:", v19, 1);

  }
}

- (void)setTheme:(id)a3
{
  -[BKFinishedContentViewController setTheme:force:](self, "setTheme:force:", a3, 0);
}

- (void)setTheme:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned int v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController theme](self, "theme"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (!v8 || v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)BKFinishedContentViewController;
    -[BKContentViewController setTheme:force:](&v9, "setTheme:force:", v6, v4);
    -[BKFinishedContentViewController updateAppearance](self, "updateAppearance");
  }

}

- (void)setContentScale:(double)a3
{
  void *v4;

  if (self->_contentScale != a3)
  {
    self->_contentScale = a3;
    -[BKFinishedContentViewController updateFonts](self, "updateFonts");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedContentViewController view](self, "view"));
    objc_msgSend(v4, "layoutIfNeeded");

    -[BKFinishedContentViewController updateButtonAppearance](self, "updateButtonAppearance");
  }
}

- (BOOL)isUpsellContent
{
  return 1;
}

- (BOOL)isAnnotationVisible:(id)a3
{
  return 0;
}

- (CGRect)cachedRectForAnnotation:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)cachedVisibleRectForAnnotation:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isReusable
{
  return 0;
}

- (BOOL)isContentLoaded
{
  return 1;
}

- (BOOL)isContentLoadPending
{
  return 0;
}

- (int64_t)pageOffset
{
  return 0;
}

- (id)currentLocation
{
  return -[BKLocation initWithOrdinal:]([BKLocation alloc], "initWithOrdinal:", -[BKContentViewController ordinal](self, "ordinal"));
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->contentSize.width;
  height = self->contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->contentSize = a3;
}

- (double)zoomScale
{
  return self->zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->zoomScale = a3;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (BOOL)fixedLayout
{
  return self->_fixedLayout;
}

- (void)setFixedLayout:(BOOL)a3
{
  self->_fixedLayout = a3;
}

- (BOOL)visibleInScrollMode
{
  return self->visibleInScrollMode;
}

- (void)setVisibleInScrollMode:(BOOL)a3
{
  self->visibleInScrollMode = a3;
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (BKFinishedButton)finishedButton
{
  return self->_finishedButton;
}

- (void)setFinishedButton:(id)a3
{
  objc_storeStrong((id *)&self->_finishedButton, a3);
}

- (NSLayoutConstraint)checkmarkWidthConstraint
{
  return self->_checkmarkWidthConstraint;
}

- (void)setCheckmarkWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkWidthConstraint, a3);
}

- (NSLayoutConstraint)checkmarkHeightConstraint
{
  return self->_checkmarkHeightConstraint;
}

- (void)setCheckmarkHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkHeightConstraint, a3);
}

- (NSLayoutConstraint)titleWidthConstraint
{
  return self->_titleWidthConstraint;
}

- (void)setTitleWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleWidthConstraint, a3);
}

- (NSLayoutConstraint)bodyWidthConstraint
{
  return self->_bodyWidthConstraint;
}

- (void)setBodyWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bodyWidthConstraint, a3);
}

- (NSLayoutConstraint)checkmarkTopConstraint
{
  return self->_checkmarkTopConstraint;
}

- (void)setCheckmarkTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkTopConstraint, a3);
}

- (NSLayoutConstraint)titleTopConstraint
{
  return self->_titleTopConstraint;
}

- (void)setTitleTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleTopConstraint, a3);
}

- (NSLayoutConstraint)bodyTopConstraint
{
  return self->_bodyTopConstraint;
}

- (void)setBodyTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bodyTopConstraint, a3);
}

- (NSLayoutConstraint)finishedButtonTopConstraint
{
  return self->_finishedButtonTopConstraint;
}

- (void)setFinishedButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_finishedButtonTopConstraint, a3);
}

- (NSLayoutConstraint)finishedButtonBottomConstraint
{
  return self->_finishedButtonBottomConstraint;
}

- (void)setFinishedButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_finishedButtonBottomConstraint, a3);
}

- (NSLayoutConstraint)titleLeadingConstraint
{
  return self->_titleLeadingConstraint;
}

- (void)setTitleLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLeadingConstraint, a3);
}

- (NSLayoutConstraint)titleTrailingConstraint
{
  return self->_titleTrailingConstraint;
}

- (void)setTitleTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleTrailingConstraint, a3);
}

- (NSLayoutConstraint)bodyLeadingConstraint
{
  return self->_bodyLeadingConstraint;
}

- (void)setBodyLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLeadingConstraint, a3);
}

- (NSLayoutConstraint)bodyTrailingConstraint
{
  return self->_bodyTrailingConstraint;
}

- (void)setBodyTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bodyTrailingConstraint, a3);
}

- (NSLayoutConstraint)finishedButtonLeadingConstraint
{
  return self->_finishedButtonLeadingConstraint;
}

- (void)setFinishedButtonLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_finishedButtonLeadingConstraint, a3);
}

- (NSLayoutConstraint)finishedButtonTrailingConstraint
{
  return self->_finishedButtonTrailingConstraint;
}

- (void)setFinishedButtonTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_finishedButtonTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_finishedButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bodyTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bodyLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_finishedButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_finishedButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_bodyTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleTopConstraint, 0);
  objc_storeStrong((id *)&self->_checkmarkTopConstraint, 0);
  objc_storeStrong((id *)&self->_bodyWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleWidthConstraint, 0);
  objc_storeStrong((id *)&self->_checkmarkHeightConstraint, 0);
  objc_storeStrong((id *)&self->_checkmarkWidthConstraint, 0);
  objc_storeStrong((id *)&self->_finishedButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
}

@end

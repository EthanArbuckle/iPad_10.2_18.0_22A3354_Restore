@implementation BKSampleUpsellContentViewController

- (BKSampleUpsellContentViewController)init
{
  BKSampleUpsellContentViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKSampleUpsellContentViewController;
  v2 = -[BKContentViewController init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "reachabilityChanged:", CFSTR("kNetworkReachabilityChangedNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BKSampleUpsellContentViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKSampleUpsellContentViewController;
  -[BKContentViewController dealloc](&v3, "dealloc");
}

- (void)releaseViews
{
  UILabel *continueLabel;
  UILabel *bookTitleLabel;
  UILabel *bookAuthorLabel;
  BCBuyGetTwoStateButton *buyButton;
  objc_super v7;

  continueLabel = self->_continueLabel;
  self->_continueLabel = 0;

  bookTitleLabel = self->_bookTitleLabel;
  self->_bookTitleLabel = 0;

  bookAuthorLabel = self->_bookAuthorLabel;
  self->_bookAuthorLabel = 0;

  buyButton = self->_buyButton;
  self->_buyButton = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKSampleUpsellContentViewController;
  -[BKContentViewController releaseViews](&v7, "releaseViews");
}

- (void)viewDidLoad
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
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;
  _QWORD v29[4];

  v28.receiver = self;
  v28.super_class = (Class)BKSampleUpsellContentViewController;
  -[BKContentViewController viewDidLoad](&v28, "viewDidLoad");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController buyButton](self, "buyButton"));
  objc_msgSend(v24, "setDelegate:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController profileFuture](self, "profileFuture"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getNonBlockingError:", 0));

  -[BKSampleUpsellContentViewController configureWithProfile:](self, "configureWithProfile:", v23);
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController profileFuture](self, "profileFuture"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_2E0AC;
  v25[3] = &unk_1BF588;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v4, "get:", v25);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  -[BKSampleUpsellContentViewController updateAppearance](self, "updateAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 45.0));
  v29[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, -45.0));
  v29[1] = v15;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 45.0));
  v29[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -45.0));
  v29[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKSampleUpsellContentViewController;
  -[BKSampleUpsellContentViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = BKStyleManagerDidChangeStyleNotification[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController styleManager](self, "styleManager"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_didChangeStyle:", v5, v6);

  -[BKSampleUpsellContentViewController updateFonts](self, "updateFonts");
  -[BKSampleUpsellContentViewController updateAppearance](self, "updateAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController view](self, "view"));
  objc_msgSend(v7, "layoutIfNeeded");

  -[BKSampleUpsellContentViewController updateButtonAppearance](self, "updateButtonAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController buyButton](self, "buyButton"));
  objc_msgSend(v8, "resetButtonState");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSampleUpsellContentViewController;
  -[BKSampleUpsellContentViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[BKSampleUpsellContentViewController updateButtonAppearance](self, "updateButtonAppearance");
}

- (void)updateButtonAppearance
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController buyButton](self, "buyButton"));
  -[BKSampleUpsellContentViewController contentScale](self, "contentScale");
  v4 = 40.0;
  v5 = v3 * 40.0;
  v6 = v3 <= 0.0;
  if (v3 <= 0.0)
    v7 = 12.0;
  else
    v7 = v3 * 12.0;
  if (!v6)
    v4 = v5;
  objc_msgSend(v8, "setContentEdgeInsets:", v7, v4, v7, v4);

}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  char *v14;
  void *v15;
  unsigned int v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)BKSampleUpsellContentViewController;
  -[BKSampleUpsellContentViewController updateViewConstraints](&v31, "updateViewConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));
  -[BKSampleUpsellContentViewController _calculateLineNumbersForLabel:withFont:](self, "_calculateLineNumbersForLabel:withFont:", v3, v5);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "font"));
  -[BKSampleUpsellContentViewController _calculateLineNumbersForLabel:withFont:](self, "_calculateLineNumbersForLabel:withFont:", v8, v10);
  v12 = v11;

  if (!-[BKSampleUpsellContentViewController im_isCompactWidth](self, "im_isCompactWidth"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
    if (v12 >= (double)(uint64_t)objc_msgSend(v19, "numberOfLines"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
      v21 = v7 >= (double)(uint64_t)objc_msgSend(v20, "numberOfLines");

      if (v21)
        v17 = 4.0;
      else
        v17 = 12.0;
      if (v21)
        v18 = 6.0;
      else
        v18 = 28.0;
      goto LABEL_30;
    }

    goto LABEL_12;
  }
  if (!-[BKSampleUpsellContentViewController im_isCompactHeight](self, "im_isCompactHeight"))
  {
LABEL_12:
    v18 = 28.0;
    v17 = 12.0;
    goto LABEL_30;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v14 = (char *)objc_msgSend(v13, "orientation") - 1;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v15, "hasSpreadPagesForContentViewController:") & 1) != 0)
  {
    v16 = objc_msgSend(v15, "hasSpreadPagesForContentViewController:", self);
    if (v16)
      v17 = 10.0;
    else
      v17 = 12.0;
    if (v16)
      v18 = 14.0;
    else
      v18 = 28.0;
  }
  else
  {
    v18 = 28.0;
    v17 = 12.0;
  }
  if ((unint64_t)v14 >= 2)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
    if (v12 >= (double)(uint64_t)objc_msgSend(v22, "numberOfLines"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
      v24 = v7 >= (double)(uint64_t)objc_msgSend(v23, "numberOfLines");

      if (v24)
        v17 = 4.0;
      else
        v17 = 10.0;
      if (v24)
        v18 = 6.0;
      else
        v18 = 14.0;
    }
    else
    {

      v18 = 14.0;
      v17 = 10.0;
    }
  }

LABEL_30:
  -[BKSampleUpsellContentViewController contentScale](self, "contentScale");
  if (v25 <= 0.0)
    v25 = 1.0;
  v26 = v17 * v25;
  v27 = v18 * v25;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleTopConstraint](self, "bookTitleTopConstraint"));
  objc_msgSend(v28, "setConstant:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorTopConstraint](self, "bookAuthorTopConstraint"));
  objc_msgSend(v29, "setConstant:", v26);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController buyButtonTopConstraint](self, "buyButtonTopConstraint"));
  objc_msgSend(v30, "setConstant:", v27);

}

- (double)_calculateLineNumbersForLabel:(id)a3 withFont:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  NSAttributedStringKey v17;
  id v18;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  objc_msgSend(v6, "frame");
  v9 = v8;

  v17 = NSFontAttributeName;
  v18 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, v9, 1.79769313e308);
  v12 = v11;

  objc_msgSend(v5, "lineHeight");
  v14 = v13;

  v15 = v12 / v14;
  return ceilf(v15);
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
  unsigned __int8 v7;
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
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  char *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v3 = 1.0;
  if (!-[BKSampleUpsellContentViewController fixedLayout](self, "fixedLayout"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController styleManager](self, "styleManager"));
    objc_msgSend(v4, "fontSize");
    v6 = v5;

    if (v6 > 0.0)
    {
      v7 = -[BKSampleUpsellContentViewController im_isCompactWidth](self, "im_isCompactWidth");
      LODWORD(v8) = 1.25;
      if ((v7 & 1) == 0)
      {
        v9 = -[BKSampleUpsellContentViewController im_isCompactHeight](self, "im_isCompactHeight", v8);
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
  -[BKSampleUpsellContentViewController contentScale](self, "contentScale");
  if (v11 <= 0.0)
    v11 = 1.0;
  v12 = v3 * v11;
  v41 = (id)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController continueLabel](self, "continueLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v12 * 13.0));
  objc_msgSend(v41, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec fontSpecWithPostscriptName:size:](TUIFontSpec, "fontSpecWithPostscriptName:size:", CFSTR("BooksSerif-Heavy"), v12 * 26.0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "font"));
  objc_msgSend(v14, "setFont:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v12 * 18.0));
  objc_msgSend(v15, "setFont:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec fontSpecWithPostscriptName:size:](TUIFontSpec, "fontSpecWithPostscriptName:size:", CFSTR("BooksSerif-Heavy"), v12 * 26.0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "font"));
  -[BKSampleUpsellContentViewController _calculateLineNumbersForLabel:withFont:](self, "_calculateLineNumbersForLabel:withFont:", v19, v21);
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v12 * 18.0));
  -[BKSampleUpsellContentViewController _calculateLineNumbersForLabel:withFont:](self, "_calculateLineNumbersForLabel:withFont:", v24, v25);
  v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v29 = (char *)objc_msgSend(v28, "orientation");

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v30, "hasSpreadPagesForContentViewController:") & 1) != 0
    && (objc_msgSend(v30, "hasSpreadPagesForContentViewController:", self) & 1) != 0)
  {
    v31 = 16.0;
    v32 = 24.0;
LABEL_18:
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec fontSpecWithPostscriptName:size:](TUIFontSpec, "fontSpecWithPostscriptName:size:", CFSTR("BooksSerif-Heavy"), v12 * v32));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "font"));
    objc_msgSend(v14, "setFont:", v37);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v12 * v31));
    objc_msgSend(v15, "setFont:", v33);
    goto LABEL_19;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
  if (v23 < (double)(uint64_t)objc_msgSend(v33, "numberOfLines"))
  {
LABEL_19:

    goto LABEL_20;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
  v35 = (double)(uint64_t)objc_msgSend(v34, "numberOfLines");

  if (v27 >= v35 && (unint64_t)(v29 - 1) >= 2)
  {
    v31 = 14.0;
    v32 = 20.0;
    goto LABEL_18;
  }
LABEL_20:
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController buyButton](self, "buyButton"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", v12 * 15.0));
  objc_msgSend(v38, "setButtonFont:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController view](self, "view"));
  objc_msgSend(v40, "setNeedsUpdateConstraints");

}

- (void)_didChangeStyle:(id)a3
{
  void *v4;

  if (!+[NSThread isMainThread](NSThread, "isMainThread", a3))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKSampleUpsellContentViewController.m", 318, "-[BKSampleUpsellContentViewController _didChangeStyle:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  -[BKSampleUpsellContentViewController updateFonts](self, "updateFonts");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController view](self, "view"));
  objc_msgSend(v4, "layoutIfNeeded");

  -[BKSampleUpsellContentViewController updateButtonAppearance](self, "updateButtonAppearance");
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
  id v10;
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
  id v27;
  void *v28;
  id v29;

  if (-[BKSampleUpsellContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    v29 = (id)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController themePage](self, "themePage"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "backgroundColorForTraitEnvironment:", self));
    v4 = v3;
    if (v3)
      v5 = v3;
    else
      v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v6 = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController view](self, "view"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "contentTextColor"));
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController continueLabel](self, "continueLabel"));
    objc_msgSend(v12, "setTextColor:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
    objc_msgSend(v13, "setTextColor:", v11);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
    objc_msgSend(v14, "setTextColor:", v11);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController buyButton](self, "buyButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "finishedButtonBackgroundColor"));
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v19 = v18;

    objc_msgSend(v15, "setBackgroundFillColor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "finishedButtonDisabledBackgroundColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "colorWithAlphaComponent:", 0.4));
    objc_msgSend(v15, "setDisabledBackgroundFillColor:", v21);

    objc_msgSend(v15, "setFrameColor:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v15, "setTextColor:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "colorWithAlphaComponent:", 0.4));
    objc_msgSend(v15, "setDisabledTextColor:", v24);

    objc_msgSend(v15, "setTextHilightColor:", v19);
    objc_msgSend(v15, "setBackgroundFillHighlightColor:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "buyButtonColor"));
    v26 = v25;
    if (v25)
      v27 = v25;
    else
      v27 = (id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksGreen](UIColor, "bc_booksGreen"));
    v28 = v27;

    objc_msgSend(v15, "setBuyStateTextColor:", v28);
    objc_msgSend(v15, "setBuyStateBackgroundFillColor:", v6);
    objc_msgSend(v15, "setBuyStateFrameColor:", v28);
    objc_msgSend(v15, "setFrameWidth:", 0.0);
    objc_msgSend(v15, "updateButton");

  }
}

- (void)setTheme:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController theme](self, "theme"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKSampleUpsellContentViewController;
    -[BKContentViewController setTheme:](&v7, "setTheme:", v4);
    -[BKSampleUpsellContentViewController updateAppearance](self, "updateAppearance");
  }

}

- (void)setTheme:(id)a3 force:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKSampleUpsellContentViewController;
  -[BKContentViewController setTheme:force:](&v5, "setTheme:force:", a3, a4);
  -[BKSampleUpsellContentViewController updateAppearance](self, "updateAppearance");
}

- (void)setContentScale:(double)a3
{
  void *v4;

  if (self->_contentScale != a3)
  {
    self->_contentScale = a3;
    -[BKSampleUpsellContentViewController updateFonts](self, "updateFonts");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController view](self, "view"));
    objc_msgSend(v4, "layoutIfNeeded");

    -[BKSampleUpsellContentViewController updateButtonAppearance](self, "updateButtonAppearance");
  }
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

- (int64_t)pageOffset
{
  return 0;
}

- (id)currentLocation
{
  return -[BKLocation initWithOrdinal:]([BKLocation alloc], "initWithOrdinal:", -[BKContentViewController ordinal](self, "ordinal"));
}

- (void)configureWithProfile:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
  v6 = v5;
  if (!v5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookTitle"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookTitleLabel](self, "bookTitleLabel"));
  objc_msgSend(v7, "setText:", v6);

  if (!v5)
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "author"));
  v9 = v8;
  if (!v8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookAuthor"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController bookAuthorLabel](self, "bookAuthorLabel"));
  objc_msgSend(v10, "setText:", v9);

  if (!v8)
  {

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController buyButton](self, "buyButton"));
  objc_msgSend(v11, "setProductProfile:", v12);

}

- (void)buyButton:(id)a3 initialBuy:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSampleUpsellContentViewController buyDelegate](self, "buyDelegate"));
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_2F230;
    v12[3] = &unk_1BF5B0;
    v13 = v7;
    v14 = v8;
    objc_msgSend(v9, "buyWithCompletion:", v12);

  }
  else
  {
    v10 = objc_retainBlock(v8);
    v11 = v10;
    if (v10)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);

  }
}

- (BOOL)isStore
{
  return 1;
}

- (BOOL)isLocal
{
  return 0;
}

- (BOOL)isDownloading
{
  return 0;
}

- (BOOL)isCloud
{
  return 0;
}

- (BOOL)isSample
{
  return 1;
}

- (BOOL)isAudiobook
{
  return 0;
}

- (BOOL)wasPreordered
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "isPreorder"));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
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

- (UILabel)continueLabel
{
  return self->_continueLabel;
}

- (void)setContinueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_continueLabel, a3);
}

- (UILabel)bookTitleLabel
{
  return self->_bookTitleLabel;
}

- (void)setBookTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bookTitleLabel, a3);
}

- (UILabel)bookAuthorLabel
{
  return self->_bookAuthorLabel;
}

- (void)setBookAuthorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bookAuthorLabel, a3);
}

- (BCBuyGetTwoStateButton)buyButton
{
  return self->_buyButton;
}

- (void)setBuyButton:(id)a3
{
  objc_storeStrong((id *)&self->_buyButton, a3);
}

- (NSLayoutConstraint)bookTitleWidthConstraint
{
  return self->_bookTitleWidthConstraint;
}

- (void)setBookTitleWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bookTitleWidthConstraint, a3);
}

- (NSLayoutConstraint)bookTitleTopConstraint
{
  return self->_bookTitleTopConstraint;
}

- (void)setBookTitleTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bookTitleTopConstraint, a3);
}

- (NSLayoutConstraint)bookAuthorTopConstraint
{
  return self->_bookAuthorTopConstraint;
}

- (void)setBookAuthorTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bookAuthorTopConstraint, a3);
}

- (NSLayoutConstraint)buyButtonTopConstraint
{
  return self->_buyButtonTopConstraint;
}

- (void)setBuyButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buyButtonTopConstraint, a3);
}

- (BKUpsellBuyDelegate)buyDelegate
{
  return (BKUpsellBuyDelegate *)objc_loadWeakRetained((id *)&self->_buyDelegate);
}

- (void)setBuyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buyDelegate, a3);
}

- (BCFutureValue)profileFuture
{
  return self->_profileFuture;
}

- (void)setProfileFuture:(id)a3
{
  objc_storeStrong((id *)&self->_profileFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileFuture, 0);
  objc_destroyWeak((id *)&self->_buyDelegate);
  objc_storeStrong((id *)&self->_buyButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_bookAuthorTopConstraint, 0);
  objc_storeStrong((id *)&self->_bookTitleTopConstraint, 0);
  objc_storeStrong((id *)&self->_bookTitleWidthConstraint, 0);
  objc_storeStrong((id *)&self->_buyButton, 0);
  objc_storeStrong((id *)&self->_bookAuthorLabel, 0);
  objc_storeStrong((id *)&self->_bookTitleLabel, 0);
  objc_storeStrong((id *)&self->_continueLabel, 0);
}

@end

@implementation RelatedSearchSuggestionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (RelatedSearchSuggestionViewController)init
{
  RelatedSearchSuggestionViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RelatedSearchSuggestionViewController;
  v2 = -[RelatedSearchSuggestionViewController init](&v5, "init");
  if (v2)
  {
    v2->_accessibilityEnabled = +[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "preferredContentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[RelatedSearchSuggestionViewController _clearTimer](self, "_clearTimer");
  v3.receiver = self;
  v3.super_class = (Class)RelatedSearchSuggestionViewController;
  -[RelatedSearchSuggestionViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  double v3;
  RelatedSearchSuggestionView *v4;

  v4 = -[RelatedSearchSuggestionView initWithFrame:]([RelatedSearchSuggestionView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RelatedSearchSuggestionView _setHostsLayoutEngine:](v4, "_setHostsLayoutEngine:", 1);
  LODWORD(v3) = 1148846080;
  -[RelatedSearchSuggestionView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v3);
  -[RelatedSearchSuggestionView setAlpha:](v4, "setAlpha:", 0.0);
  -[RelatedSearchSuggestionViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  UIVisualEffectView *v3;
  UIVisualEffectView *blurView;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  UIVisualEffectView *v8;
  void *v9;
  UIScrollView *v10;
  UIScrollView *scrollView;
  void *v12;
  UIScrollView *v13;
  void *v14;
  void *v15;
  void *v16;
  MapsThemeButton *v17;
  MapsThemeButton *closeButton;
  void *v19;
  MapsThemeButton *v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)RelatedSearchSuggestionViewController;
  -[RelatedSearchSuggestionViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  blurView = self->_blurView;
  self->_blurView = v3;

  v5 = self->_blurView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController suggestionView](self, "suggestionView"));
  objc_msgSend(v6, "setBlurView:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_blurView);

  v8 = self->_blurView;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController suggestionView](self, "suggestionView"));
  objc_msgSend(v9, "setBlurView:", v8);

  v10 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  scrollView = self->_scrollView;
  self->_scrollView = v10;

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_scrollView);

  v13 = self->_scrollView;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController suggestionView](self, "suggestionView"));
  objc_msgSend(v14, "setScrollView:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Close [DYM]"), CFSTR("localized string not found"), 0));
  v17 = (MapsThemeButton *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController _createMapsThemeButtonWithTitle:](self, "_createMapsThemeButtonWithTitle:", v16));
  closeButton = self->_closeButton;
  self->_closeButton = v17;

  -[MapsThemeButton setTag:](self->_closeButton, "setTag:", 0x7FFFFFFFFFFFFFFFLL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController view](self, "view"));
  objc_msgSend(v19, "addSubview:", self->_closeButton);

  v20 = self->_closeButton;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController suggestionView](self, "suggestionView"));
  objc_msgSend(v21, "setCloseButton:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController view](self, "view"));
  v23 = objc_msgSend(v22, "_maps_addHairlineAtTopWithMargin:", 0.0);

}

- (void)preferredContentSizeChanged:(id)a3
{
  _BOOL8 v4;
  id v5;

  self->_accessibilityEnabled = +[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled", a3);
  if (-[RelatedSearchSuggestion showCloseButton](self->_suggestion, "showCloseButton"))
    v4 = !self->_accessibilityEnabled;
  else
    v4 = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController suggestionView](self, "suggestionView"));
  objc_msgSend(v5, "setShowCloseButton:", v4);

}

- (void)_loadSuggestions
{
  NSMutableArray *v3;
  NSMutableArray *componentViews;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  -[NSMutableArray makeObjectsPerformSelector:](self->_componentViews, "makeObjectsPerformSelector:", "removeFromSuperview");
  -[NSMutableArray removeAllObjects](self->_componentViews, "removeAllObjects");
  if (!self->_componentViews)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    componentViews = self->_componentViews;
    self->_componentViews = v3;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestion components](self->_suggestion, "components"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v7)
  {
    v9 = v6;
    goto LABEL_19;
  }
  v8 = v7;
  v9 = 0;
  v27 = 0;
  v28 = *(_QWORD *)v30;
  obj = v6;
  do
  {
    v10 = 0;
    v11 = v9;
    do
    {
      if (*(_QWORD *)v30 != v28)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v10);
      v13 = objc_msgSend(v12, "isRelatedSearchSuggestion", obj);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayText"));
      if (v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController _createMapsThemeButtonWithTitle:](self, "_createMapsThemeButtonWithTitle:", v14));

        objc_msgSend(v15, "setTag:", (char *)v10 + v27);
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController _createMapsThemeLabelWithTitle:](self, "_createMapsThemeLabelWithTitle:", v14));

      }
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView centerYAnchor](self->_scrollView, "centerYAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
      objc_msgSend(v5, "addObject:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
      if (v11)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 16.0));
      }
      v22 = (void *)v21;
      objc_msgSend(v5, "addObject:", v21);

      v9 = v15;
      -[NSMutableArray addObject:](self->_componentViews, "addObject:", v9);

      v10 = (char *)v10 + 1;
      v11 = v9;
    }
    while (v8 != v10);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v27 += (uint64_t)v10;
  }
  while (v8);

  if (v9)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -16.0));
    objc_msgSend(v5, "addObject:", v25);

LABEL_19:
  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);

}

- (void)_componentButtonTapped:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  GEORelatedSearchSuggestion *v9;
  GEORelatedSearchSuggestion *pdSuggestion;
  void *v11;
  id v12;

  v12 = a3;
  -[RelatedSearchSuggestionViewController setHidden:animated:](self, "setHidden:animated:", 1, 1);
  v4 = objc_msgSend(v12, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestion components](self->_suggestion, "components"));
  v6 = objc_msgSend(v5, "count");

  if (v4 < v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestion components](self->_suggestion, "components"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v4));

    if (objc_msgSend(v8, "isRelatedSearchSuggestion"))
    {
      v9 = (GEORelatedSearchSuggestion *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suggestion"));
      pdSuggestion = self->_pdSuggestion;
      self->_pdSuggestion = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController delegate](self, "delegate"));
      objc_msgSend(v11, "relatedSearchSuggestionViewControllerDidTapActionButton:", self);

    }
    goto LABEL_6;
  }
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController delegate](self, "delegate"));
    objc_msgSend(v8, "relatedSearchSuggestionViewController:didDismissWithReason:", self, 0);
LABEL_6:

  }
}

- (id)_createMapsThemeButtonWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 1));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "_setTouchInsets:", -7.0, -7.0, -7.0, -7.0);
  objc_msgSend(v5, "setTitleColorProvider:", &stru_1011BE7C0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v6, &stru_1011B3190);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "_componentButtonTapped:", 64);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  objc_msgSend(v7, "setLineBreakMode:", 4);

  if (MKApplicationLayoutDirectionIsRightToLeft())
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v5, "setContentHorizontalAlignment:", v8);
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  return v5;
}

- (id)_createMapsThemeLabelWithTitle:(id)a3
{
  id v3;
  MapsThemeLabel *v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  v4 = -[MapsThemeLabel initWithFrame:]([MapsThemeLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[MapsThemeLabel setTextColor:](v4, "setTextColor:", v5);

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v4, &stru_1011B3190);
  LODWORD(v6) = 1148846080;
  -[MapsThemeLabel setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  -[MapsThemeLabel setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  -[MapsThemeLabel setText:](v4, "setText:", v3);

  return v4;
}

- (void)_clearTimer
{
  NSTimer *hideSuggestionViewTimer;

  -[NSTimer invalidate](self->_hideSuggestionViewTimer, "invalidate");
  hideSuggestionViewTimer = self->_hideSuggestionViewTimer;
  self->_hideSuggestionViewTimer = 0;

}

- (void)_hideSuggestionViewTimerFired:(id)a3
{
  -[RelatedSearchSuggestionViewController _clearTimer](self, "_clearTimer", a3);
  -[RelatedSearchSuggestionViewController dismissWithReason:](self, "dismissWithReason:", 1);
}

- (void)_resetTimer
{
  NSTimer *v3;
  NSTimer *hideSuggestionViewTimer;

  -[RelatedSearchSuggestionViewController _clearTimer](self, "_clearTimer");
  if (self->_hideSuggestionViewTimeoutInSeconds > 0.0)
  {
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_hideSuggestionViewTimerFired:", 0, 0));
    hideSuggestionViewTimer = self->_hideSuggestionViewTimer;
    self->_hideSuggestionViewTimer = v3;

  }
}

- (BOOL)isHidden
{
  void *v2;
  double v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController view](self, "view"));
  objc_msgSend(v2, "alpha");
  v4 = v3 == 0.0;

  return v4;
}

- (void)setHidden:(BOOL)a3
{
  -[RelatedSearchSuggestionViewController setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSDate *suggestionShownDate;
  double v8;
  NSDate *v9;
  NSDate *v10;
  id v11;

  v4 = a4;
  if (-[RelatedSearchSuggestionViewController isHidden](self, "isHidden") != a3)
  {
    if (a3)
    {
      -[RelatedSearchSuggestionViewController _clearTimer](self, "_clearTimer");
      suggestionShownDate = self->_suggestionShownDate;
      self->_suggestionShownDate = 0;

      v8 = 0.0;
    }
    else
    {
      -[RelatedSearchSuggestionViewController _resetTimer](self, "_resetTimer");
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v10 = self->_suggestionShownDate;
      self->_suggestionShownDate = v9;

      self->_forceDismiss = 0;
      v8 = 1.0;
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController suggestionView](self, "suggestionView"));
    objc_msgSend(v11, "setAlpha:animated:", v4, v8);

  }
}

- (void)setSuggestion:(id)a3
{
  RelatedSearchSuggestion *v5;
  double v6;
  _BOOL8 v7;
  void *v8;
  RelatedSearchSuggestion *v9;
  RelatedSearchSuggestion *v10;
  _QWORD v11[5];

  v5 = (RelatedSearchSuggestion *)a3;
  if (self->_suggestion != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_suggestion, a3);
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", CGPointZero.x, CGPointZero.y);
    -[RelatedSearchSuggestion visibleTime](v9, "visibleTime");
    self->_hideSuggestionViewTimeoutInSeconds = v6;
    if (-[RelatedSearchSuggestion showCloseButton](v9, "showCloseButton"))
      v7 = !self->_accessibilityEnabled;
    else
      v7 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController suggestionView](self, "suggestionView", v9));
    objc_msgSend(v8, "setShowCloseButton:", v7);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10037762C;
    v11[3] = &unk_1011AC860;
    v11[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    v5 = v10;
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  -[RelatedSearchSuggestionViewController _resetTimer](self, "_resetTimer", a3, a4);
  self->_suggestionScrollViewScrollingLeft = 0;
  self->_suggestionScrollViewScrollingRight = 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  CGRect v10;

  v9 = a3;
  v4 = objc_msgSend(v9, "contentOffset");
  v6 = v5;
  if (MKApplicationLayoutDirectionIsRightToLeft(v4))
  {
    objc_msgSend(v9, "contentSize");
    v8 = v7 - v6;
    objc_msgSend(v9, "frame");
    v6 = v8 - CGRectGetWidth(v10);
  }
  -[RelatedSearchSuggestionViewController updateSuggestionPositionWithOffset:](self, "updateSuggestionPositionWithOffset:", v6);

}

- (void)updateSuggestionPositionWithOffset:(double)a3
{
  double lastSuggestionScrollOffset;
  void *v6;

  lastSuggestionScrollOffset = self->_lastSuggestionScrollOffset;
  if (lastSuggestionScrollOffset < a3 && !self->_suggestionScrollViewScrollingLeft)
  {
    self->_suggestionScrollViewScrollingLeft = 1;
    self->_suggestionScrollViewScrollingRight = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController delegate](self, "delegate"));
    objc_msgSend(v6, "relatedSearchSuggestionViewControllerDidScrollLeft:", self);
    goto LABEL_7;
  }
  if (lastSuggestionScrollOffset > a3 && !self->_suggestionScrollViewScrollingRight)
  {
    self->_suggestionScrollViewScrollingLeft = 0;
    self->_suggestionScrollViewScrollingRight = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController delegate](self, "delegate"));
    objc_msgSend(v6, "relatedSearchSuggestionViewControllerDidScrollRight:", self);
LABEL_7:

  }
  self->_lastSuggestionScrollOffset = a3;
}

- (void)dismiss
{
  -[RelatedSearchSuggestionViewController dismissWithReason:](self, "dismissWithReason:", 2);
}

- (void)dismissWithReason:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  -[NSDate timeIntervalSinceNow](self->_suggestionShownDate, "timeIntervalSinceNow");
  v6 = v5;
  -[NSDate timeIntervalSinceNow](self->_suggestionShownDate, "timeIntervalSinceNow");
  v8 = v7;
  if (!-[RelatedSearchSuggestionViewController isHidden](self, "isHidden"))
  {
    v9 = -v8;
    if (v6 >= 0.0)
      v9 = v8;
    if (v9 >= 5.0 || self->_forceDismiss)
    {
      -[RelatedSearchSuggestionViewController setHidden:animated:](self, "setHidden:animated:", 1, 1);
      -[RelatedSearchSuggestionViewController resetData](self, "resetData");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController delegate](self, "delegate"));
      objc_msgSend(v10, "relatedSearchSuggestionViewController:didDismissWithReason:", self, a3);

    }
  }
  self->_forceDismiss = 1;
}

- (void)resetData
{
  -[RelatedSearchSuggestionViewController setSuggestion:](self, "setSuggestion:", 0);
}

- (RelatedSearchSuggestionViewControllerDelegate)delegate
{
  return (RelatedSearchSuggestionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RelatedSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (GEORelatedSearchSuggestion)pdSuggestion
{
  return self->_pdSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hideSuggestionViewTimer, 0);
  objc_storeStrong((id *)&self->_suggestionShownDate, 0);
  objc_storeStrong((id *)&self->_componentViews, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end

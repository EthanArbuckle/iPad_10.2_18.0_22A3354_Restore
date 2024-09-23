@implementation MacUGCPOIEnrichmentEditorViewController

- (MacUGCPOIEnrichmentEditorViewController)initWithPOIEnrichmentForm:(id)a3 delegate:(id)a4 presentationContext:(int64_t)a5
{
  id v9;
  id v10;
  MacUGCPOIEnrichmentEditorViewController *v11;
  MacUGCPOIEnrichmentEditorViewController *v12;
  UGCPOIEnrichmentViewController *v13;
  UGCPOIEnrichmentViewController *contentViewController;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MacUGCPOIEnrichmentEditorViewController;
  v11 = -[MacUGCPOIEnrichmentEditorViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_poiEnrichmentForm, a3);
    -[UGCForm addObserver:](v12->_poiEnrichmentForm, "addObserver:", v12);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13 = -[UGCPOIEnrichmentViewController initWithPOIEnrichmentForm:presentationContext:]([UGCPOIEnrichmentViewController alloc], "initWithPOIEnrichmentForm:presentationContext:", v9, a5);
    contentViewController = v12->_contentViewController;
    v12->_contentViewController = v13;

  }
  return v12;
}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MacUGCPOIEnrichmentEditorViewController setView:](self, "setView:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MacUGCPOIEnrichmentEditorViewController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("UGCPOIEnrichmentView"));

}

- (void)viewDidLoad
{
  void *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *blurView;
  void *v6;
  void *v7;
  UGCPOIEnrichmentHeaderView *v8;
  double y;
  double width;
  double height;
  UGCPOIEnrichmentHeaderView *v12;
  UGCPOIEnrichmentHeaderView *macHeaderView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MacFooterView *v19;
  MacFooterView *submitButtonsFooterView;
  _BOOL8 v21;
  void *v22;
  void *v23;
  id v24;
  UIVisualEffectView *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  MacFooterView *v32;
  void *v33;
  void *v34;
  MapsProgressBarModalView *v35;
  MapsProgressBarModalView *progressView;
  void *v37;
  void *v38;
  objc_super v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v39.receiver = self;
  v39.super_class = (Class)MacUGCPOIEnrichmentEditorViewController;
  -[MacUGCPOIEnrichmentEditorViewController viewDidLoad](&v39, "viewDidLoad");
  -[MacUGCPOIEnrichmentEditorViewController _mapsui_resetViewLayoutMargins](self, "_mapsui_resetViewLayoutMargins");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacUGCPOIEnrichmentEditorViewController view](self, "view"));
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 0.0, 26.0, 0.0, 26.0);

  v4 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  blurView = self->_blurView;
  self->_blurView = v4;

  -[UIVisualEffectView _mapsui_resetLayoutMarginsWithPreservesSuperview:](self->_blurView, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  objc_msgSend(v6, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacUGCPOIEnrichmentEditorViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_blurView);

  v8 = [UGCPOIEnrichmentHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v12 = -[UGCPOIEnrichmentHeaderView initWithFrame:](v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  macHeaderView = self->_macHeaderView;
  self->_macHeaderView = v12;

  -[UGCPOIEnrichmentHeaderView setPreservesSuperviewLayoutMargins:](self->_macHeaderView, "setPreservesSuperviewLayoutMargins:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentForm mapItem](self->_poiEnrichmentForm, "mapItem"));
  -[UGCPOIEnrichmentHeaderView setMapItem:](self->_macHeaderView, "setMapItem:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  objc_msgSend(v15, "addSubview:", self->_macHeaderView);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  objc_msgSend(v16, "setPreservesSuperviewLayoutMargins:", 1);

  -[UGCPOIEnrichmentViewController setSuppressRatings:](self->_contentViewController, "setSuppressRatings:", self->_suppressRatings);
  -[MacUGCPOIEnrichmentEditorViewController addChildViewController:](self, "addChildViewController:", self->_contentViewController);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  objc_msgSend(v17, "addSubview:", v18);

  -[UGCPOIEnrichmentViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);
  v19 = -[MacFooterView initWithNoBlurRightSideButtonsOfType:]([MacFooterView alloc], "initWithNoBlurRightSideButtonsOfType:", 16);
  submitButtonsFooterView = self->_submitButtonsFooterView;
  self->_submitButtonsFooterView = v19;

  -[MacFooterView setDelegate:](self->_submitButtonsFooterView, "setDelegate:", self);
  v21 = -[UGCPOIEnrichmentForm isComplete](self->_poiEnrichmentForm, "isComplete");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView rightButton](self->_submitButtonsFooterView, "rightButton"));
  objc_msgSend(v22, "setEnabled:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  objc_msgSend(v23, "addSubview:", self->_submitButtonsFooterView);

  v24 = objc_alloc((Class)MUEdgeLayout);
  v25 = self->_blurView;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MacUGCPOIEnrichmentEditorViewController view](self, "view"));
  v27 = objc_msgSend(v24, "initWithItem:container:", v25, v26);

  v28 = objc_alloc((Class)MUStackLayout);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  v30 = objc_msgSend(v28, "initWithContainer:axis:", v29, 1);

  v41[0] = self->_macHeaderView;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  v32 = self->_submitButtonsFooterView;
  v41[1] = v31;
  v41[2] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 3));
  objc_msgSend(v30, "setArrangedLayoutItems:", v33);

  v40[0] = v27;
  v40[1] = v30;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v34);

  v35 = -[MapsProgressBarModalView initWithFrame:]([MapsProgressBarModalView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  progressView = self->_progressView;
  self->_progressView = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Uploading... [UGC]"), CFSTR("localized string not found"), 0));
  -[MapsProgressBarModalView setProgressTitle:](self->_progressView, "setProgressTitle:", v38);

}

- (void)viewWillAppear:(BOOL)a3
{
  double height;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  MUSizeLayout *sizeLayout;
  id v13;
  void *v14;
  MUSizeLayout *v15;
  MUSizeLayout *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MacUGCPOIEnrichmentEditorViewController;
  -[MacUGCPOIEnrichmentEditorViewController viewWillAppear:](&v17, "viewWillAppear:", a3);
  height = UILayoutFittingCompressedSize.height;
  -[UGCPOIEnrichmentHeaderView systemLayoutSizeFittingSize:](self->_macHeaderView, "systemLayoutSizeFittingSize:", 348.0, height);
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", 348.0, height);
  v9 = v8;

  -[MacFooterView systemLayoutSizeFittingSize:](self->_submitButtonsFooterView, "systemLayoutSizeFittingSize:", 348.0, height);
  v11 = v10;
  sizeLayout = self->_sizeLayout;
  if (!sizeLayout)
  {
    v13 = objc_alloc((Class)MUSizeLayout);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacUGCPOIEnrichmentEditorViewController view](self, "view"));
    v15 = (MUSizeLayout *)objc_msgSend(v13, "initWithItem:size:", v14, CGSizeZero.width, CGSizeZero.height);
    v16 = self->_sizeLayout;
    self->_sizeLayout = v15;

    sizeLayout = self->_sizeLayout;
  }
  -[MUSizeLayout setSize:](sizeLayout, "setSize:", 348.0, v6 + v9 + v11);
  -[MUSizeLayout activate](self->_sizeLayout, "activate");
}

- (void)setSuppressRatings:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_suppressRatings != a3)
  {
    v3 = a3;
    self->_suppressRatings = a3;
    if (-[MacUGCPOIEnrichmentEditorViewController isViewLoaded](self, "isViewLoaded"))
      -[UGCPOIEnrichmentViewController setSuppressRatings:](self->_contentViewController, "setSuppressRatings:", v3);
  }
}

- (void)cancelButtonPressed
{
  id v3;

  -[UGCPOIEnrichmentViewController logCancelAction](self->_contentViewController, "logCancelAction");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacUGCPOIEnrichmentEditorViewController delegate](self, "delegate"));
  objc_msgSend(v3, "poiEnrichmenEditorDidCancel:", self);

}

- (void)sendButtonPressed
{
  id v3;

  -[UGCPOIEnrichmentViewController logDoneAction](self->_contentViewController, "logDoneAction");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacUGCPOIEnrichmentEditorViewController delegate](self, "delegate"));
  objc_msgSend(v3, "poiEnrichmentEditor:finishedFillingEnrichmentForm:", self, self->_poiEnrichmentForm);

}

- (void)_animteProgressViewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacUGCPOIEnrichmentEditorViewController view](self, "view"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100402C9C;
    v6[3] = &unk_1011ADA00;
    v7 = v4;
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v5, 5242882, v6, 0, 0.100000001);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", buf, 2u);
  }

}

- (void)submissionFinishedWithError:(id)a3
{
  id v4;
  double v5;
  MapsProgressBarModalView *progressView;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];

  v4 = a3;
  progressView = self->_progressView;
  if (v4)
  {
    -[MapsProgressBarModalView setObservedProgress:](progressView, "setObservedProgress:", 0);
    progressView = self->_progressView;
    LODWORD(v5) = 0;
  }
  else
  {
    LODWORD(v5) = 1.0;
  }
  -[MapsProgressBarModalView setProgress:](progressView, "setProgress:", v5);
  -[UGCPOIEnrichmentViewController submissionFinishedWithError:](self->_contentViewController, "submissionFinishedWithError:", v4);
  -[MacFooterView submissionFinishedWithError:](self->_submitButtonsFooterView, "submissionFinishedWithError:", v4);
  v7 = -[UGCPOIEnrichmentForm isComplete](self->_poiEnrichmentForm, "isComplete");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView rightButton](self->_submitButtonsFooterView, "rightButton"));
  objc_msgSend(v8, "setEnabled:", v7);

  if ((MapsFeature_IsEnabled_SydneyARP(v9, v10) & 1) == 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100402DA4;
    v11[3] = &unk_1011AC860;
    v11[4] = self;
    -[MacUGCPOIEnrichmentEditorViewController _animteProgressViewWithCompletion:](self, "_animteProgressViewWithCompletion:", v11);
  }

}

- (void)willBeginSubmissionWithProgress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  MapsProgressBarModalView *progressView;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[UGCPOIEnrichmentViewController willBeginSubmissionWithProgress:](self->_contentViewController, "willBeginSubmissionWithProgress:", v4);
  -[MacFooterView willBeginSubmissionWithProgress:](self->_submitButtonsFooterView, "willBeginSubmissionWithProgress:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacUGCPOIEnrichmentEditorViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_progressView);

  -[MapsProgressBarModalView setHidden:](self->_progressView, "setHidden:", 1);
  v6 = objc_alloc((Class)MUEdgeLayout);
  progressView = self->_progressView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacUGCPOIEnrichmentEditorViewController view](self, "view"));
  v9 = objc_msgSend(v6, "initWithItem:container:", progressView, v8);
  objc_msgSend(v9, "activate");

  if ((MapsFeature_IsEnabled_SydneyARP(v10, v11) & 1) == 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100402F0C;
    v12[3] = &unk_1011AC8B0;
    v12[4] = self;
    v13 = v4;
    -[MacUGCPOIEnrichmentEditorViewController _animteProgressViewWithCompletion:](self, "_animteProgressViewWithCompletion:", v12);

  }
}

- (void)formDidChange:(id)a3
{
  _BOOL8 v4;
  id v5;

  v4 = -[UGCPOIEnrichmentForm isComplete](self->_poiEnrichmentForm, "isComplete", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MacFooterView rightButton](self->_submitButtonsFooterView, "rightButton"));
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
  -[MacUGCPOIEnrichmentEditorViewController cancelButtonPressed](self, "cancelButtonPressed", a3);
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
  -[MacUGCPOIEnrichmentEditorViewController sendButtonPressed](self, "sendButtonPressed", a3);
}

- (UGCPOIEnrichmentEditorDelegate)delegate
{
  return (UGCPOIEnrichmentEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)suppressRatings
{
  return self->_suppressRatings;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sizeLayout, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentForm, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_submitButtonsFooterView, 0);
  objc_storeStrong((id *)&self->_macHeaderView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end

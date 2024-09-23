@implementation UGCPOIEnrichmentContaineeViewController

- (UGCPOIEnrichmentContaineeViewController)initWithPOIEnrichmentForm:(id)a3 delegate:(id)a4 presentationContext:(int64_t)a5
{
  id v9;
  id v10;
  UGCPOIEnrichmentContaineeViewController *v11;
  UGCPOIEnrichmentContaineeViewController *v12;
  id *p_poiEnrichmentForm;
  UGCPOIEnrichmentViewController *v14;
  UGCPOIEnrichmentViewController *contentViewController;
  UGCPOIEnrichmentModalHeaderView *v16;
  UGCPOIEnrichmentModalHeaderView *headerView;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  CardView *v27;
  CardView *cardView;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)UGCPOIEnrichmentContaineeViewController;
  v11 = -[UGCPOIEnrichmentContaineeViewController initWithNibName:bundle:](&v30, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    p_poiEnrichmentForm = (id *)&v11->_poiEnrichmentForm;
    objc_storeStrong((id *)&v11->_poiEnrichmentForm, a3);
    objc_msgSend(*p_poiEnrichmentForm, "addObserver:", v12);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v14 = -[UGCPOIEnrichmentViewController initWithPOIEnrichmentForm:presentationContext:]([UGCPOIEnrichmentViewController alloc], "initWithPOIEnrichmentForm:presentationContext:", v9, a5);
    contentViewController = v12->_contentViewController;
    v12->_contentViewController = v14;

    -[UGCPOIEnrichmentViewController setDelegate:](v12->_contentViewController, "setDelegate:", v12);
    v16 = -[UGCPOIEnrichmentModalHeaderView initWithFrame:]([UGCPOIEnrichmentModalHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    headerView = v12->_headerView;
    v12->_headerView = v16;

    -[UGCPOIEnrichmentModalHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v12->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_poiEnrichmentForm, "mapItem"));
    -[UGCPOIEnrichmentModalHeaderView setMapItem:](v12->_headerView, "setMapItem:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView leadingButton](v12->_headerView, "leadingButton"));
    v20 = sub_1009A98D8();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v19, "setTitle:forState:", v21, 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView leadingButton](v12->_headerView, "leadingButton"));
    objc_msgSend(v22, "addTarget:action:forControlEvents:", v12, "cancelButtonPressed", 64);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView trailingButton](v12->_headerView, "trailingButton"));
    v24 = sub_1009A992C();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v23, "setTitle:forState:", v25, 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView trailingButton](v12->_headerView, "trailingButton"));
    objc_msgSend(v26, "addTarget:action:forControlEvents:", v12, "sendButtonPressed", 64);

    v27 = -[CardView initAllowingBlurred:]([CardView alloc], "initAllowingBlurred:", 0);
    cardView = v12->_cardView;
    v12->_cardView = v27;

    -[CardView setTranslatesAutoresizingMaskIntoConstraints:](v12->_cardView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CardView setHideGrabber:](v12->_cardView, "setHideGrabber:", 1);
  }

  return v12;
}

- (id)_backgroundColorForModalFormSheet
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentContaineeViewController theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backgroundColorForModalFormSheet"));

  return v3;
}

- (void)cancelButtonPressed
{
  id WeakRetained;

  -[UGCPOIEnrichmentViewController logCancelAction](self->_contentViewController, "logCancelAction");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "poiEnrichmenEditorDidCancel:", self);

}

- (void)sendButtonPressed
{
  id WeakRetained;

  if (-[UGCPOIEnrichmentForm isComplete](self->_poiEnrichmentForm, "isComplete"))
  {
    -[UGCPOIEnrichmentViewController logDoneAction](self->_contentViewController, "logDoneAction");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "poiEnrichmentEditor:finishedFillingEnrichmentForm:", self, self->_poiEnrichmentForm);

  }
  else
  {
    -[UGCPOIEnrichmentContaineeViewController cancelButtonPressed](self, "cancelButtonPressed");
  }
}

- (void)_updateAppearanceForSubmission
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentForm photosForm](self->_poiEnrichmentForm, "photosForm"));
  v4 = objc_msgSend(v3, "numberOfAddedPhotos");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView trailingButton](self->_headerView, "trailingButton"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Add [Modal Card Header]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v5, "setTitle:forState:", v7, 0);

  }
  else
  {
    v8 = sub_1009A992C();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v5, "setTitle:forState:", v6, 0);
  }

  v9 = -[UGCPOIEnrichmentForm isComplete](self->_poiEnrichmentForm, "isComplete");
  v10 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView trailingButton](self->_headerView, "trailingButton"));
  objc_msgSend(v10, "setEnabled:", v9);

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
  objc_super v49;
  _QWORD v50[8];

  v49.receiver = self;
  v49.super_class = (Class)UGCPOIEnrichmentContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v49, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setPresentedModally:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setTakesAvailableHeight:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setAllowsSwipeToDismiss:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "setDefaultContaineeLayout:", 5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v7, "addSubview:", self->_headerView);

  -[UGCPOIEnrichmentViewController setSuppressRatings:](self->_contentViewController, "setSuppressRatings:", self->_suppressRatings);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  objc_msgSend(v9, "setPreservesSuperviewLayoutMargins:", 1);

  -[UGCPOIEnrichmentContaineeViewController addChildViewController:](self, "addChildViewController:", self->_contentViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  objc_msgSend(v10, "addSubview:", v11);

  -[UGCPOIEnrichmentViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView topAnchor](self->_headerView, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v50[0] = v45;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView leadingAnchor](self->_headerView, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v50[1] = v41;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView trailingAnchor](self->_headerView, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v50[2] = v37;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView bottomAnchor](self->_headerView, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v50[3] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v50[4] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v50[5] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v13));
  v50[6] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v50[7] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

  -[UGCPOIEnrichmentContaineeViewController _updateAppearanceForSubmission](self, "_updateAppearanceForSubmission");
}

- (double)heightForLayout:(unint64_t)a3
{
  double height;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  double v17;

  if (a3 > 5)
  {
    v12 = -1.0;
  }
  else
  {
    if (((1 << a3) & 0x27) != 0)
    {
      height = UILayoutFittingCompressedSize.height;
      -[UGCPOIEnrichmentModalHeaderView systemLayoutSizeFittingSize:](self->_headerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
      v6 = v5 + 0.0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentViewController view](self->_contentViewController, "view"));
      objc_msgSend(v7, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
      v9 = v6 + v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v10, "bottomSafeOffset");
      v12 = v9 + v11;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v10, "availableHeight");
      v12 = v13;
    }

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v15 = objc_msgSend(v14, "containerStyle");

  if (v15 == (id)6)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v16, "availableHeight");
    v12 = v17;

  }
  return v12;
}

- (void)setShowCardBackground:(BOOL)a3
{
  void *v4;
  CardView *cardView;
  void *v6;
  id v7;

  if (self->_showCardBackground != a3)
  {
    self->_showCardBackground = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentContaineeViewController view](self, "view"));
      objc_msgSend(v4, "insertSubview:atIndex:", self->_cardView, 0);

      cardView = self->_cardView;
      v7 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentContaineeViewController view](self, "view"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CardView _maps_constraintsForCenteringInView:](cardView, "_maps_constraintsForCenteringInView:", v7));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

    }
    else
    {
      -[CardView removeFromSuperview](self->_cardView, "removeFromSuperview");
    }
  }
}

- (void)setSuppressRatings:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_suppressRatings != a3)
  {
    v3 = a3;
    self->_suppressRatings = a3;
    if (-[UGCPOIEnrichmentContaineeViewController isViewLoaded](self, "isViewLoaded"))
      -[UGCPOIEnrichmentViewController setSuppressRatings:](self->_contentViewController, "setSuppressRatings:", v3);
  }
}

- (void)willBeginSubmissionWithProgress:(id)a3
{
  UGCPOIEnrichmentModalHeaderView *headerView;
  void *v5;
  void *v6;
  id v7;

  headerView = self->_headerView;
  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView leadingButton](headerView, "leadingButton"));
  objc_msgSend(v5, "setEnabled:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView trailingButton](self->_headerView, "trailingButton"));
  objc_msgSend(v6, "setEnabled:", 0);

  -[UGCPOIEnrichmentModalHeaderView setObservedProgress:](self->_headerView, "setObservedProgress:", v7);
  -[UGCPOIEnrichmentViewController willBeginSubmissionWithProgress:](self->_contentViewController, "willBeginSubmissionWithProgress:", v7);

}

- (void)submissionFinishedWithError:(id)a3
{
  UGCPOIEnrichmentModalHeaderView *headerView;
  void *v5;
  void *v6;
  double v7;
  UGCPOIEnrichmentModalHeaderView *v8;
  id v9;

  headerView = self->_headerView;
  v9 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView leadingButton](headerView, "leadingButton"));
  objc_msgSend(v5, "setEnabled:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentModalHeaderView trailingButton](self->_headerView, "trailingButton"));
  objc_msgSend(v6, "setEnabled:", -[UGCPOIEnrichmentForm isComplete](self->_poiEnrichmentForm, "isComplete"));

  v8 = self->_headerView;
  if (v9)
  {
    -[UGCPOIEnrichmentModalHeaderView setObservedProgress:](v8, "setObservedProgress:", 0);
    v8 = self->_headerView;
    LODWORD(v7) = 0;
  }
  else
  {
    LODWORD(v7) = 1.0;
  }
  -[UGCPOIEnrichmentModalHeaderView setProgress:](v8, "setProgress:", v7);
  -[UGCPOIEnrichmentViewController submissionFinishedWithError:](self->_contentViewController, "submissionFinishedWithError:", v9);

}

- (void)contentDidUpdate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v2, "updateHeightForCurrentLayoutAnimated:", 1);

}

- (void)poiEnrichmentViewController:(id)a3 didSelectTermsOfServiceURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "poiEnrichmentEditor:didSelectTermsOfServiceURL:", self, v5);

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

- (BOOL)showCardBackground
{
  return self->_showCardBackground;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentForm, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end

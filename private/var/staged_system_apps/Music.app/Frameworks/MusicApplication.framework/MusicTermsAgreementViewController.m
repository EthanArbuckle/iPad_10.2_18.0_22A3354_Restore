@implementation MusicTermsAgreementViewController

- (MusicTermsAgreementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MusicTermsAgreementViewController *v4;
  MusicTermsAgreementViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MusicTermsAgreementViewController;
  v4 = -[MusicTermsAgreementViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsAgreementViewController navigationItem](v4, "navigationItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Terms & Conditions"), &stru_13E1990, 0));
    objc_msgSend(v6, "setTitle:", v8);

  }
  return v5;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double MinX;
  double Height;
  double v24;
  double v25;
  double v26;
  double v27;
  double y;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat MaxX;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  uint64_t v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double MinY;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  UILabel *loadingLabel;
  UIActivityIndicatorView *loadingActivityIndicatorView;
  double v51;
  CGFloat rect;
  CGFloat v53;
  double v54;
  double v55;
  double x;
  double v57;
  double width;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  objc_super v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v68.receiver = self;
  v68.super_class = (Class)MusicTermsAgreementViewController;
  -[MusicTermsAgreementViewController viewDidLayoutSubviews](&v68, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsAgreementViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v67 = v4;
  v66 = v5;
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsAgreementViewController traitCollection](self, "traitCollection"));
  MPUFloatGetSafeScaleForValue(objc_msgSend(v10, "displayScale"));
  if (self->_loading)
  {
    v59 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsAgreementViewController view](self, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "safeAreaLayoutGuide"));
    objc_msgSend(v13, "layoutFrame");
    v65 = v9;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v69.origin.x = v15;
    v69.origin.y = v17;
    v69.size.width = v19;
    v69.size.height = v21;
    MinX = CGRectGetMinX(v69);
    v70.origin.x = v67;
    v70.size.height = v65;
    v70.origin.y = v66;
    v70.size.width = v7;
    v64 = v7;
    Height = CGRectGetHeight(v70);
    v71.origin.x = v15;
    v71.origin.y = v17;
    v71.size.width = v19;
    v71.size.height = v21;
    v63 = v66 + MinX;
    v62 = v65 - (MinX + Height - CGRectGetMaxY(v71));
    -[UIActivityIndicatorView frame](self->_loadingActivityIndicatorView, "frame");
    v25 = v24;
    v27 = v26;
    y = CGPointZero.y;
    -[UILabel frame](self->_loadingLabel, "frame");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v72.origin.x = CGPointZero.x;
    v72.origin.y = y;
    v72.size.width = v25;
    v72.size.height = v27;
    MaxX = CGRectGetMaxX(v72);
    v54 = y;
    v60 = v25;
    v61 = v27;
    v73.origin.x = UIRectCenteredYInRectScale(MaxX + 4.0, v30, v32, v34, CGPointZero.x, y, v25, v27, v59);
    v55 = v73.origin.y;
    x = v73.origin.x;
    v57 = v73.size.height;
    width = v73.size.width;
    v79.origin.x = CGPointZero.x;
    v79.origin.y = y;
    v79.size.width = v25;
    v79.size.height = v27;
    v74 = CGRectUnion(v73, v79);
    rect = v74.size.width;
    v53 = v74.size.height;
    v36 = v74.origin.x;
    v37 = v74.origin.y;
    v38 = v74.size.width;
    v75.origin.x = UIRectCenteredIntegralRectScale(v39);
    v40 = v75.origin.x;
    v41 = v75.origin.y;
    v42 = v75.size.width;
    v43 = v75.size.height;
    MinY = CGRectGetMinY(v75);
    v76.origin.x = v36;
    v76.origin.y = v37;
    v76.size.width = v38;
    v76.size.height = v53;
    v45 = MinY - CGRectGetMinY(v76);
    v77.origin.x = v40;
    v77.origin.y = v41;
    v77.size.width = v42;
    v77.size.height = v43;
    v46 = CGRectGetMinX(v77);
    v78.origin.x = v36;
    v78.origin.y = v37;
    v78.size.width = rect;
    v78.size.height = v53;
    v47 = v46 - CGRectGetMinX(v78);
    v48 = CGPointZero.x + v47;
    loadingLabel = self->_loadingLabel;
    MPURectByApplyingUserInterfaceLayoutDirectionInRect(x + v47, v55 + v45, width, v57, v67 + 0.0, v63, v64, v62);
    -[UILabel setFrame:](loadingLabel, "setFrame:");
    loadingActivityIndicatorView = self->_loadingActivityIndicatorView;
    v51 = v48;
    v9 = v65;
    v7 = v64;
    MPURectByApplyingUserInterfaceLayoutDirectionInRect(v51, v54 + v45, v60, v61, v67 + 0.0, v63, v64, v62);
    -[UIActivityIndicatorView setFrame:](loadingActivityIndicatorView, "setFrame:");
  }
  -[UITextView setFrame:](self->_termsTextView, "setFrame:", v67, v66, v7, v9);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UITextView *v5;
  UITextView *termsTextView;
  UITextView *v7;
  void *v8;
  UITextView *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MusicTermsAgreementViewController;
  -[MusicTermsAgreementViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsAgreementViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (UITextView *)objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  termsTextView = self->_termsTextView;
  self->_termsTextView = v5;

  v7 = self->_termsTextView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITextView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  v9 = self->_termsTextView;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UITextView setFont:](v9, "setFont:", v10);

  -[UITextView setEditable:](self->_termsTextView, "setEditable:", 0);
  -[UITextView setSelectable:](self->_termsTextView, "setSelectable:", 0);
  -[UITextView setScrollEnabled:](self->_termsTextView, "setScrollEnabled:", 1);
  -[UITextView setScrollsToTop:](self->_termsTextView, "setScrollsToTop:", 1);
  objc_msgSend(v3, "addSubview:", self->_termsTextView);
  -[MusicTermsAgreementViewController _updateViewState](self, "_updateViewState");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicTermsAgreementViewController;
  -[MusicTermsAgreementViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsAgreementViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentationController"));
  objc_msgSend(v5, "setDelegate:", self);

  objc_msgSend(v4, "setToolbarHidden:", 0);
  -[MusicTermsAgreementViewController _updateBarButtonItems](self, "_updateBarButtonItems");

}

- (id)contentScrollView
{
  return self->_termsTextView;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[MusicTermsAgreementViewController _cancelBarButtonItemAction:](self, "_cancelBarButtonItemAction:", 0);
}

- (void)setAccepting:(BOOL)a3
{
  if (self->_accepting != a3)
  {
    self->_accepting = a3;
    -[MusicTermsAgreementViewController _updateBarButtonItems](self, "_updateBarButtonItems");
  }
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    -[MusicTermsAgreementViewController _updateBarButtonItems](self, "_updateBarButtonItems");
    -[MusicTermsAgreementViewController _updateViewState](self, "_updateViewState");
  }
}

- (void)setTermsText:(id)a3
{
  NSString *v4;
  NSString *termsText;
  unsigned __int8 v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  termsText = self->_termsText;
  if (termsText != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](termsText, "isEqualToString:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_termsText;
      self->_termsText = v7;

      -[MusicTermsAgreementViewController _updateViewState](self, "_updateViewState");
      v4 = v9;
    }
  }

}

- (void)_agreeBarButtonItemAction:(id)a3
{
  MusicTermsAgreementViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "termsAgreementViewControllerDidAcceptTerms:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "termsAgreementViewControllerDidAcceptTerms:", self);

  }
}

- (void)_cancelBarButtonItemAction:(id)a3
{
  MusicTermsAgreementViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "termsAgreementViewControllerDidCancel:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "termsAgreementViewControllerDidCancel:", self);

  }
}

- (void)_sendEmailBarButtonItemAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  MusicTermsAgreementViewController *v20;
  id v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Send by Email"), &stru_13E1990, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Enter an email address to send these Terms & Conditions."), &stru_13E1990, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1));

  objc_msgSend(v8, "addTextFieldWithConfigurationHandler:", &__block_literal_global);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Send"), &stru_13E1990, 0));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = __67__MusicTermsAgreementViewController__sendEmailBarButtonItemAction___block_invoke_2;
  v19 = &unk_1338E80;
  v20 = self;
  v21 = v8;
  v11 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, &v16));

  objc_msgSend(v11, "addAction:", v12, v16, v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_13E1990, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, 0));

  objc_msgSend(v11, "addAction:", v15);
  -[MusicTermsAgreementViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

void __67__MusicTermsAgreementViewController__sendEmailBarButtonItemAction___block_invoke(id a1, UITextField *a2)
{
  UITextField *v2;

  v2 = a2;
  -[UITextField setAutocorrectionType:](v2, "setAutocorrectionType:", 1);
  -[UITextField setAutocapitalizationType:](v2, "setAutocapitalizationType:", 0);
  -[UITextField setKeyboardType:](v2, "setKeyboardType:", 7);

}

void __67__MusicTermsAgreementViewController__sendEmailBarButtonItemAction___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  if ((objc_opt_respondsToSelector(v6, "termsAgreementViewController:didRequestSendByEmailToEmailAddress:") & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "textFields"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    objc_msgSend(v6, "termsAgreementViewController:didRequestSendByEmailToEmailAddress:", v2, v5);

  }
}

- (void)_updateBarButtonItems
{
  UIBarButtonItem *sendEmailBarButtonItem;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  id v9;
  UIBarButtonItem *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  UIBarButtonItem **p_acceptingBarButtonItem;
  UIBarButtonItem *acceptingBarButtonItem;
  id v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *v18;
  UIBarButtonItem *cancelBarButtonItem;
  UIBarButtonItem *v20;
  UIBarButtonItem *v21;
  id v22;
  UIBarButtonItem *v23;
  UIBarButtonItem *v24;
  _QWORD v25[2];

  sendEmailBarButtonItem = self->_sendEmailBarButtonItem;
  if (!sendEmailBarButtonItem)
  {
    v4 = objc_alloc((Class)UIBarButtonItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Send by Email"), &stru_13E1990, 0));
    v7 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 0, self, "_sendEmailBarButtonItemAction:");
    v8 = self->_sendEmailBarButtonItem;
    self->_sendEmailBarButtonItem = v7;

    v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v10 = self->_sendEmailBarButtonItem;
    v25[0] = v9;
    v25[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
    -[MusicTermsAgreementViewController setToolbarItems:](self, "setToolbarItems:", v11);

    sendEmailBarButtonItem = self->_sendEmailBarButtonItem;
  }
  v12 = !self->_loading && !self->_accepting;
  -[UIBarButtonItem setEnabled:](sendEmailBarButtonItem, "setEnabled:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsAgreementViewController navigationItem](self, "navigationItem"));
  if (self->_accepting)
  {
    p_acceptingBarButtonItem = &self->_acceptingBarButtonItem;
    acceptingBarButtonItem = self->_acceptingBarButtonItem;
    if (acceptingBarButtonItem)
      goto LABEL_13;
    v16 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v16, "sizeToFit");
    objc_msgSend(v16, "startAnimating");
    v17 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v16);
    v18 = *p_acceptingBarButtonItem;
    *p_acceptingBarButtonItem = v17;
    goto LABEL_9;
  }
  if (self->_loading)
  {
    acceptingBarButtonItem = 0;
  }
  else
  {
    p_acceptingBarButtonItem = &self->_agreeBarButtonItem;
    acceptingBarButtonItem = self->_agreeBarButtonItem;
    if (!acceptingBarButtonItem)
    {
      v22 = objc_alloc((Class)UIBarButtonItem);
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Agree"), &stru_13E1990, 0));
      v23 = (UIBarButtonItem *)objc_msgSend(v22, "initWithTitle:style:target:action:", v18, 2, self, "_agreeBarButtonItemAction:");
      v24 = *p_acceptingBarButtonItem;
      *p_acceptingBarButtonItem = v23;

LABEL_9:
      acceptingBarButtonItem = *p_acceptingBarButtonItem;
    }
  }
LABEL_13:
  objc_msgSend(v13, "setRightBarButtonItem:", acceptingBarButtonItem);
  cancelBarButtonItem = self->_cancelBarButtonItem;
  if (!cancelBarButtonItem)
  {
    v20 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelBarButtonItemAction:");
    v21 = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = v20;

    objc_msgSend(v13, "setLeftBarButtonItem:", self->_cancelBarButtonItem);
    cancelBarButtonItem = self->_cancelBarButtonItem;
  }
  -[UIBarButtonItem setEnabled:](cancelBarButtonItem, "setEnabled:", !self->_accepting);

}

- (void)_updateViewState
{
  UITextView *termsTextView;
  UILabel *loadingLabel;
  _BOOL4 v5;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UIActivityIndicatorView *v15;
  UIActivityIndicatorView *loadingActivityIndicatorView;
  UILabel *v17;
  UILabel *v18;
  UIActivityIndicatorView *v19;
  UILabel *v20;
  void *v21;
  id v22;

  if (-[MusicTermsAgreementViewController isViewLoaded](self, "isViewLoaded"))
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(-[MusicTermsAgreementViewController view](self, "view"));
    termsTextView = self->_termsTextView;
    if (self->_loading)
    {
      -[UITextView setHidden:](termsTextView, "setHidden:", 1);
      loadingLabel = self->_loadingLabel;
      v5 = loadingLabel == 0;
      if (!loadingLabel)
      {
        v6 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        v7 = self->_loadingLabel;
        self->_loadingLabel = v6;

        v8 = self->_loadingLabel;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_loadingLabel;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Loading…"), &stru_13E1990, 0));
        -[UILabel setText:](v10, "setText:", v12);

        v13 = self->_loadingLabel;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
        -[UILabel setFont:](v13, "setFont:", v14);

        -[UILabel sizeToFit](self->_loadingLabel, "sizeToFit");
        objc_msgSend(v22, "addSubview:", self->_loadingLabel);
      }
      if (!self->_loadingActivityIndicatorView)
      {
        v15 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
        loadingActivityIndicatorView = self->_loadingActivityIndicatorView;
        self->_loadingActivityIndicatorView = v15;

        -[UIActivityIndicatorView startAnimating](self->_loadingActivityIndicatorView, "startAnimating");
        -[UIActivityIndicatorView sizeToFit](self->_loadingActivityIndicatorView, "sizeToFit");
        objc_msgSend(v22, "addSubview:", self->_loadingActivityIndicatorView);
        goto LABEL_13;
      }
    }
    else
    {
      -[UITextView setHidden:](termsTextView, "setHidden:", 0);
      -[UITextView setText:](self->_termsTextView, "setText:", self->_termsText);
      v17 = self->_loadingLabel;
      v5 = v17 != 0;
      if (v17)
      {
        -[UILabel removeFromSuperview](v17, "removeFromSuperview");
        v18 = self->_loadingLabel;
        self->_loadingLabel = 0;

      }
      v19 = self->_loadingActivityIndicatorView;
      if (v19)
      {
        -[UIActivityIndicatorView stopAnimating](v19, "stopAnimating");
        -[UIActivityIndicatorView removeFromSuperview](self->_loadingActivityIndicatorView, "removeFromSuperview");
        v20 = self->_loadingLabel;
        self->_loadingLabel = 0;

        goto LABEL_13;
      }
    }
    v21 = v22;
    if (!v5)
    {
LABEL_14:

      return;
    }
LABEL_13:
    objc_msgSend(v22, "setNeedsLayout");
    v21 = v22;
    goto LABEL_14;
  }
}

- (BOOL)isAccepting
{
  return self->_accepting;
}

- (MusicTermsAgreementViewControllerDelegate)delegate
{
  return (MusicTermsAgreementViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (NSString)termsText
{
  return self->_termsText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_termsTextView, 0);
  objc_storeStrong((id *)&self->_sendEmailBarButtonItem, 0);
  objc_storeStrong((id *)&self->_loadingActivityIndicatorView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_agreeBarButtonItem, 0);
  objc_storeStrong((id *)&self->_acceptingBarButtonItem, 0);
}

@end

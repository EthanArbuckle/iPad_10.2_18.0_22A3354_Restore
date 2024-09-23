@implementation ComposePlaceholderView

- (ComposePlaceholderView)initWithFrame:(CGRect)a3 subject:(id)a4 modelFuture:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  ComposePlaceholderView *v13;
  ComposePlaceholderView *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ComposePlaceholderView;
  v13 = -[ComposePlaceholderView initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_modelFuture, a5);
    -[ComposePlaceholderView _createSubviews](v14, "_createSubviews");
    -[ComposePlaceholderView _setSubject:](v14, "_setSubject:", v11);
  }

  return v14;
}

- (void)_createSubviews
{
  void *v3;
  UINavigationBar *v4;
  UINavigationBar *navigationBar;
  id v6;
  void *v7;
  double Width;
  double v9;
  double v10;
  MFMailComposeToField *v11;
  MFMailComposeToField *toField;
  NSBundle *v13;
  void *v14;
  void *v15;
  MFComposeMultiView *v16;
  MFComposeMultiView *multiField;
  NSBundle *v18;
  void *v19;
  void *v20;
  MFMailComposeRecipientTextView *v21;
  MFMailComposeRecipientTextView *ccField;
  NSBundle *v23;
  void *v24;
  void *v25;
  MFMailComposeRecipientTextView *v26;
  MFMailComposeRecipientTextView *bccField;
  NSBundle *v28;
  void *v29;
  void *v30;
  MFComposeFromView *v31;
  MFComposeFromView *fromField;
  MFComposeSubjectView *v33;
  MFComposeSubjectView *subjectField;
  UIImageView *v35;
  UIImageView *snapshotImageView;
  void *v37;
  id v38;
  CGRect v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[ComposePlaceholderView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[ComposePlaceholderView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v4 = (UINavigationBar *)objc_msgSend(objc_alloc((Class)UINavigationBar), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  navigationBar = self->_navigationBar;
  self->_navigationBar = v4;

  -[ComposePlaceholderView addSubview:](self, "addSubview:", self->_navigationBar);
  v6 = objc_alloc_init((Class)UINavigationItem);
  v38 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
  -[UINavigationBar setItems:](self->_navigationBar, "setItems:", v7);

  -[ComposePlaceholderView bounds](self, "bounds");
  Width = CGRectGetWidth(v39);
  +[MFMailComposeView preferredHeaderHeight](MFMailComposeView, "preferredHeaderHeight");
  v10 = v9;
  v11 = (MFMailComposeToField *)objc_msgSend(objc_alloc((Class)MFMailComposeToField), "initWithFrame:", 0.0, 0.0, Width, v9);
  toField = self->_toField;
  self->_toField = v11;

  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFMailComposeRecipientTextView));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TO"), &stru_100531B00, CFSTR("Main")));
  -[MFMailComposeToField setLabel:](self->_toField, "setLabel:", v15);

  -[MFMailComposeToField setIndicatesUnsafeRecipientsWhenCollapsed:](self->_toField, "setIndicatesUnsafeRecipientsWhenCollapsed:", 1);
  -[MFMailComposeToField setEnabled:](self->_toField, "setEnabled:", 0);
  -[ComposePlaceholderView addSubview:](self, "addSubview:", self->_toField);
  v16 = (MFComposeMultiView *)objc_msgSend(objc_alloc((Class)MFComposeMultiView), "initWithFrame:", 0.0, 0.0, Width, v10);
  multiField = self->_multiField;
  self->_multiField = v16;

  -[MFComposeMultiView setUserInteractionEnabled:](self->_multiField, "setUserInteractionEnabled:", 0);
  v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFMailComposeRecipientTextView));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CC/BCC"), &stru_100531B00, CFSTR("Main")));
  -[MFComposeMultiView setLabel:](self->_multiField, "setLabel:", v20);

  -[ComposePlaceholderView addSubview:](self, "addSubview:", self->_multiField);
  v21 = (MFMailComposeRecipientTextView *)objc_msgSend(objc_alloc((Class)MFMailComposeRecipientTextView), "initWithFrame:", 0.0, 0.0, Width, v10);
  ccField = self->_ccField;
  self->_ccField = v21;

  -[MFMailComposeRecipientTextView setIndicatesUnsafeRecipientsWhenCollapsed:](self->_ccField, "setIndicatesUnsafeRecipientsWhenCollapsed:", 1);
  -[MFMailComposeRecipientTextView setEnabled:](self->_ccField, "setEnabled:", 0);
  -[MFMailComposeRecipientTextView setHidden:](self->_ccField, "setHidden:", 1);
  v23 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFMailComposeRecipientTextView));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CC"), &stru_100531B00, CFSTR("Main")));
  -[MFMailComposeRecipientTextView setLabel:](self->_ccField, "setLabel:", v25);

  -[ComposePlaceholderView addSubview:](self, "addSubview:", self->_ccField);
  v26 = (MFMailComposeRecipientTextView *)objc_msgSend(objc_alloc((Class)MFMailComposeRecipientTextView), "initWithFrame:", 0.0, 0.0, Width, v10);
  bccField = self->_bccField;
  self->_bccField = v26;

  -[MFMailComposeRecipientTextView setIndicatesUnsafeRecipientsWhenCollapsed:](self->_bccField, "setIndicatesUnsafeRecipientsWhenCollapsed:", 1);
  -[MFMailComposeRecipientTextView setEnabled:](self->_bccField, "setEnabled:", 0);
  -[MFMailComposeRecipientTextView setHidden:](self->_bccField, "setHidden:", 1);
  v28 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFMailComposeRecipientTextView));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("BCC"), &stru_100531B00, CFSTR("Main")));
  -[MFMailComposeRecipientTextView setLabel:](self->_bccField, "setLabel:", v30);

  -[ComposePlaceholderView addSubview:](self, "addSubview:", self->_bccField);
  v31 = (MFComposeFromView *)objc_msgSend(objc_alloc((Class)MFComposeFromView), "initWithFrame:", 0.0, 0.0, Width, v10);
  fromField = self->_fromField;
  self->_fromField = v31;

  -[MFComposeFromView setUserInteractionEnabled:](self->_fromField, "setUserInteractionEnabled:", 0);
  -[MFComposeFromView setHidden:](self->_fromField, "setHidden:", 1);
  -[ComposePlaceholderView addSubview:](self, "addSubview:", self->_fromField);
  v33 = (MFComposeSubjectView *)objc_msgSend(objc_alloc((Class)MFComposeSubjectView), "initWithFrame:", 0.0, 0.0, Width, v10);
  subjectField = self->_subjectField;
  self->_subjectField = v33;

  -[MFComposeSubjectView setEnabled:](self->_subjectField, "setEnabled:", 0);
  -[MFComposeSubjectView setDelegate:](self->_subjectField, "setDelegate:", self);
  -[ComposePlaceholderView addSubview:](self, "addSubview:", self->_subjectField);
  v35 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, Width, v10);
  snapshotImageView = self->_snapshotImageView;
  self->_snapshotImageView = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UIImageView setBackgroundColor:](self->_snapshotImageView, "setBackgroundColor:", v37);

  -[ComposePlaceholderView addSubview:](self, "addSubview:", self->_snapshotImageView);
}

- (void)configureLeadingPlaceholderWithSize:(CGSize)a3
{
  double height;
  double width;
  UIView **p_placeholderView;
  UIView *placeholderView;
  id v9;
  void *v10;
  id v11;

  height = a3.height;
  width = a3.width;
  p_placeholderView = &self->_placeholderView;
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    -[UIView bounds](placeholderView, "bounds");
    -[UIView setBounds:](*p_placeholderView, "setBounds:", 0.0, 0.0, width, height);
  }
  else
  {
    if (a3.width == CGSizeZero.width && a3.height == CGSizeZero.height)
    {
      v9 = 0;
      v11 = 0;
    }
    else
    {
      v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
      v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v9);
    }
    objc_storeStrong((id *)p_placeholderView, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar topItem](self->_navigationBar, "topItem"));
    objc_msgSend(v10, "setLeftBarButtonItem:", v11);

  }
}

- (CGRect)placeholderRectInView:(id)a3
{
  id v4;
  UIView *placeholderView;
  double v6;
  CGFloat x;
  double v8;
  CGFloat y;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    -[UIView bounds](placeholderView, "bounds");
    objc_msgSend(v4, "convertRect:fromView:", self->_placeholderView);
    x = v6;
    y = v8;
    width = v10;
    height = v12;
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  void *i;
  void *v21;
  double v22;
  double v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  _QWORD v31[6];
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v29.receiver = self;
  v29.super_class = (Class)ComposePlaceholderView;
  -[ComposePlaceholderView layoutSubviews](&v29, "layoutSubviews");
  -[ComposePlaceholderView bounds](self, "bounds");
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  v7 = CGRectGetWidth(v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView navigationBar](self, "navigationBar"));
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v7, 50.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView toField](self, "toField"));
  v31[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView multiField](self, "multiField"));
  v31[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView ccField](self, "ccField"));
  v31[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView bccField](self, "bccField"));
  v31[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView fromField](self, "fromField"));
  v31[4] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView subjectField](self, "subjectField"));
  v31[5] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 6));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v26;
    v19 = 50.0;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v21, "isHidden", (_QWORD)v25) & 1) == 0)
        {
          objc_msgSend(v21, "bounds");
          v22 = CGRectGetHeight(v33);
          objc_msgSend(v21, "setFrame:", 0.0, v19, v7, v22);
          v19 = v19 + v22;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v17);
  }
  else
  {
    v19 = 50.0;
  }

  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v23 = CGRectGetHeight(v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView snapshotImageView](self, "snapshotImageView"));
  objc_msgSend(v24, "setFrame:", 0.0, v19, v7, v23 - v19);

}

- (void)_updateHeadersWithModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toRecipients"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView toField](self, "toField"));
  objc_msgSend(v5, "setRecipients:", v4);

  if (objc_msgSend(v7, "shouldUseMultiField"))
  {
    -[ComposePlaceholderView _updateMultiFieldWithModel:](self, "_updateMultiFieldWithModel:", v7);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView multiField](self, "multiField"));
    objc_msgSend(v6, "setHidden:", 1);

    -[ComposePlaceholderView _updateIndividualFieldsWithModel:](self, "_updateIndividualFieldsWithModel:", v7);
    -[ComposePlaceholderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateMultiFieldWithModel:(id)a3
{
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;
  NSBundle *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFMailComposeRecipientTextView));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CC/BCC"), &stru_100531B00, CFSTR("Main")));

  if (objc_msgSend(v14, "showSenderAddress"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "senderAddress"));

    if (v7)
    {
      v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFMailComposeRecipientTextView));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CC/BCC/FROM"), &stru_100531B00, CFSTR("Main")));

      v6 = (void *)v10;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView multiField](self, "multiField"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "senderAddress"));
  objc_msgSend(v11, "setAccountDescription:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView multiField](self, "multiField"));
  objc_msgSend(v13, "setLabel:", v6);

}

- (void)_updateIndividualFieldsWithModel:(id)a3
{
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

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ccRecipients"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ccRecipients"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView ccField](self, "ccField"));
    objc_msgSend(v7, "setRecipients:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView ccField](self, "ccField"));
    objc_msgSend(v8, "setHidden:", 0);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bccRecipients"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bccRecipients"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView bccField](self, "bccField"));
    objc_msgSend(v12, "setRecipients:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView bccField](self, "bccField"));
    objc_msgSend(v13, "setHidden:", 0);

  }
  if (objc_msgSend(v18, "showSenderAddress"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "senderAddress"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "senderAddress"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView fromField](self, "fromField"));
      objc_msgSend(v16, "setSelectedAddress:", v15);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView fromField](self, "fromField"));
      objc_msgSend(v17, "setHidden:", 0);

    }
  }

}

- (void)_setSubject:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  unsigned int v7;
  int v8;
  void *v9;
  NSBundle *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v14 = v6;
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = v6;
  }
  else
  {
    v7 = +[UIDevice mf_isPad](UIDevice, "mf_isPad");
    v3 = NSBundle;
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFMailComposeRecipientTextView));
    if (v7)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE_LONG"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE"), &stru_100531B00, CFSTR("Main")));
    }
    v8 = v7 ^ 1;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView navigationBar](self, "navigationBar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topItem"));
  objc_msgSend(v12, "setTitle:", v9);

  if (v8)
  {

  }
  if (v7)
  {

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView subjectField](self, "subjectField"));
  objc_msgSend(v13, "setText:", v14);

}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MinY;
  void *v19;
  id v20;
  CGRect v21;

  height = a4.height;
  width = a4.width;
  v20 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView subjectField](self, "subjectField"));

  v8 = v20;
  if (v7 == v20)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView subjectField](self, "subjectField"));
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v21.origin.x = v11;
    v21.origin.y = v13;
    v21.size.width = v15;
    v21.size.height = v17;
    MinY = CGRectGetMinY(v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView subjectField](self, "subjectField"));
    objc_msgSend(v19, "setFrame:", 0.0, MinY, width, height);

    v8 = v20;
  }

}

- (id)snapshotContentUsingWebView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView modelFuture](self, "modelFuture"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004FB60;
  v21[3] = &unk_10051A8C0;
  objc_copyWeak(&v23, &location);
  v7 = v4;
  v22 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "onScheduler:then:", v6, v21));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004FCCC;
  v19[3] = &unk_10051A8E8;
  v10 = v7;
  v20 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "onScheduler:then:", v9, v19));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004FD5C;
  v16[3] = &unk_10051A938;
  objc_copyWeak(&v18, &location);
  v13 = v10;
  v17 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "onScheduler:then:", v12, v16));

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v14;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView contentLoadingPromise](self, "contentLoadingPromise", a3, a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v5, "finishWithResult:", v4);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  void *v6;
  id v7;

  v7 = a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderView contentLoadingPromise](self, "contentLoadingPromise"));
  objc_msgSend(v6, "finishWithError:", v7);

}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBar, a3);
}

- (EFFuture)modelFuture
{
  return self->_modelFuture;
}

- (void)setModelFuture:(id)a3
{
  objc_storeStrong((id *)&self->_modelFuture, a3);
}

- (EFPromise)contentLoadingPromise
{
  return self->_contentLoadingPromise;
}

- (void)setContentLoadingPromise:(id)a3
{
  objc_storeStrong((id *)&self->_contentLoadingPromise, a3);
}

- (WKNavigation)expectedContentNavigation
{
  return self->_expectedContentNavigation;
}

- (void)setExpectedContentNavigation:(id)a3
{
  objc_storeStrong((id *)&self->_expectedContentNavigation, a3);
}

- (MFMailComposeToField)toField
{
  return self->_toField;
}

- (void)setToField:(id)a3
{
  objc_storeStrong((id *)&self->_toField, a3);
}

- (MFComposeMultiView)multiField
{
  return self->_multiField;
}

- (void)setMultiField:(id)a3
{
  objc_storeStrong((id *)&self->_multiField, a3);
}

- (MFMailComposeRecipientTextView)ccField
{
  return self->_ccField;
}

- (void)setCcField:(id)a3
{
  objc_storeStrong((id *)&self->_ccField, a3);
}

- (MFMailComposeRecipientTextView)bccField
{
  return self->_bccField;
}

- (void)setBccField:(id)a3
{
  objc_storeStrong((id *)&self->_bccField, a3);
}

- (MFComposeFromView)fromField
{
  return self->_fromField;
}

- (void)setFromField:(id)a3
{
  objc_storeStrong((id *)&self->_fromField, a3);
}

- (MFComposeSubjectView)subjectField
{
  return self->_subjectField;
}

- (void)setSubjectField:(id)a3
{
  objc_storeStrong((id *)&self->_subjectField, a3);
}

- (UIImageView)snapshotImageView
{
  return self->_snapshotImageView;
}

- (void)setSnapshotImageView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotImageView, a3);
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_snapshotImageView, 0);
  objc_storeStrong((id *)&self->_subjectField, 0);
  objc_storeStrong((id *)&self->_fromField, 0);
  objc_storeStrong((id *)&self->_bccField, 0);
  objc_storeStrong((id *)&self->_ccField, 0);
  objc_storeStrong((id *)&self->_multiField, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_expectedContentNavigation, 0);
  objc_storeStrong((id *)&self->_contentLoadingPromise, 0);
  objc_storeStrong((id *)&self->_modelFuture, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
}

@end

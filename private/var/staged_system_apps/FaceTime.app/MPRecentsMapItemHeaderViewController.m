@implementation MPRecentsMapItemHeaderViewController

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  double y;
  double width;
  double height;
  UILabel *v13;
  UILabel *titleLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PHRecentCallDetailsView *v19;
  PHRecentCallDetailsView *detailsView;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MPRecentsMapItemHeaderViewController;
  -[MPRecentsMapItemHeaderViewController loadView](&v22, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  LODWORD(v6) = 1132068864;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v6);
  LODWORD(v7) = 1132068864;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleSubheadline, 0x8000, 1));
  v9 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = (UILabel *)objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v8, 0.0));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RECENT_CALLS"), &stru_10008B240, CFSTR("PHRecents")));
  -[UILabel setText:](self->_titleLabel, "setText:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tintColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v18);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_titleLabel);
  v19 = -[PHRecentCallDetailsView initWithFrame:]([PHRecentCallDetailsView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  detailsView = self->_detailsView;
  self->_detailsView = v19;

  -[PHRecentCallDetailsView setTranslatesAutoresizingMaskIntoConstraints:](self->_detailsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController recentCall](self, "recentCall"));
  -[PHRecentCallDetailsView setRecentCall:](self->_detailsView, "setRecentCall:", v21);

  objc_msgSend(v3, "addSubview:", self->_detailsView);
  -[MPRecentsMapItemHeaderViewController loadLayoutConstraints](self, "loadLayoutConstraints");

}

- (void)loadLayoutConstraints
{
  void *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  void *v18;
  PHRecentCallDetailsView *detailsView;
  void *v20;
  void *v21;
  void *v22;
  PHRecentCallDetailsView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  PHRecentCallDetailsView *v31;
  void *v32;
  void *v33;
  id v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  titleLabel = self->_titleLabel;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", titleLabel, 5, 0, v5, 5, 1.0, 16.0));
  objc_msgSend(v3, "addConstraint:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v8 = self->_titleLabel;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 6, 0, v9, 6, 1.0, 16.0));
  objc_msgSend(v7, "addConstraint:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  objc_msgSend(v11, "_scaledValueForValue:", 16.0);
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v15 = self->_titleLabel;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 3, 0, v16, 3, 1.0, v13));
  objc_msgSend(v14, "addConstraint:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  detailsView = self->_detailsView;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", detailsView, 5, 0, v20, 5, 1.0, 16.0));
  objc_msgSend(v18, "addConstraint:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v23 = self->_detailsView;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 6, 0, v24, 6, 1.0, 0.0));
  objc_msgSend(v22, "addConstraint:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_detailsView, 3, 0, self->_titleLabel, 11, 1.0, 0.0));
  objc_msgSend(v26, "addConstraint:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  objc_msgSend(v28, "_scaledValueForValue:", 4.0);
  v30 = -v29;

  v34 = (id)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v31 = self->_detailsView;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 4, 0, v32, 4, 1.0, v30));
  objc_msgSend(v34, "addConstraint:", v33);

}

- (void)setRecentCall:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  CHRecentCall *v8;

  v8 = (CHRecentCall *)a3;
  if (self->_recentCall != v8)
  {
    objc_storeStrong((id *)&self->_recentCall, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController detailsView](self, "detailsView"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController recentCall](self, "recentCall"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPRecentsMapItemHeaderViewController detailsView](self, "detailsView"));
      objc_msgSend(v7, "setRecentCall:", v6);

    }
  }

}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (PHRecentCallDetailsView)detailsView
{
  return self->_detailsView;
}

- (void)setDetailsView:(id)a3
{
  objc_storeStrong((id *)&self->_detailsView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_detailsView, 0);
  objc_storeStrong((id *)&self->_recentCall, 0);
}

@end

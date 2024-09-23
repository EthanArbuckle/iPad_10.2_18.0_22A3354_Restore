@implementation CuratedCollectionItemAppClipView

- (CuratedCollectionItemAppClipView)initWithFrame:(CGRect)a3
{
  CuratedCollectionItemAppClipView *v3;
  CuratedCollectionItemAppClipView *v4;
  void *v5;
  void *v6;
  id v7;
  double y;
  double width;
  double height;
  UILabel *v11;
  UILabel *titleLabel;
  void *v13;
  UILabel *v14;
  UILabel *subtitleLabel;
  void *v16;
  id v17;
  void *v18;
  UIStackView *v19;
  UIStackView *titleStackView;
  UIImageView *v21;
  UIImageView *artworkImageView;
  id v23;
  void *v24;
  UIImageView *v25;
  UIImageView *appClipSymbolImageView;
  double v27;
  double v28;
  id v29;
  void *v30;
  UIStackView *v31;
  UIStackView *contentStackView;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;
  _QWORD v52[6];
  _QWORD v53[3];
  _QWORD v54[2];

  v51.receiver = self;
  v51.super_class = (Class)CuratedCollectionItemAppClipView;
  v3 = -[CuratedCollectionItemAppClipView initWithFrame:](&v51, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CuratedCollectionItemAppClipView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView layer](v4, "layer"));
    objc_msgSend(v5, "setCornerCurve:", kCACornerCurveContinuous);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView layer](v4, "layer"));
    objc_msgSend(v6, "setCornerRadius:", 10.0);

    -[CuratedCollectionItemAppClipView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("CuratedCollectionItemAppClip"));
    v7 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v11 = (UILabel *)objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v13);

    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v16);

    -[UILabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
    v17 = objc_alloc((Class)UIStackView);
    v54[0] = v4->_titleLabel;
    v54[1] = v4->_subtitleLabel;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 2));
    v19 = (UIStackView *)objc_msgSend(v17, "initWithArrangedSubviews:", v18);
    titleStackView = v4->_titleStackView;
    v4->_titleStackView = v19;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v4->_titleStackView, "setAxis:", 1);
    -[UIStackView setAccessibilityIdentifier:](v4->_titleStackView, "setAccessibilityIdentifier:", CFSTR("TitleStackView"));
    v21 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    artworkImageView = v4->_artworkImageView;
    v4->_artworkImageView = v21;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_artworkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_artworkImageView, "setContentMode:", 2);
    -[UIImageView setAccessibilityIdentifier:](v4->_artworkImageView, "setAccessibilityIdentifier:", CFSTR("ArtworkImageView"));
    v23 = objc_alloc((Class)UIImageView);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("appclip")));
    v25 = (UIImageView *)objc_msgSend(v23, "initWithImage:", v24);
    appClipSymbolImageView = v4->_appClipSymbolImageView;
    v4->_appClipSymbolImageView = v25;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_appClipSymbolImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v27) = 1132134400;
    -[UIImageView setContentHuggingPriority:forAxis:](v4->_appClipSymbolImageView, "setContentHuggingPriority:forAxis:", 0, v27);
    LODWORD(v28) = 1144766464;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_appClipSymbolImageView, "setContentCompressionResistancePriority:forAxis:", 0, v28);
    -[UIImageView setAccessibilityIdentifier:](v4->_appClipSymbolImageView, "setAccessibilityIdentifier:", CFSTR("AppClipSymbolImageView"));
    v29 = objc_alloc((Class)UIStackView);
    v53[0] = v4->_artworkImageView;
    v53[1] = v4->_titleStackView;
    v53[2] = v4->_appClipSymbolImageView;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 3));
    v31 = (UIStackView *)objc_msgSend(v29, "initWithArrangedSubviews:", v30);
    contentStackView = v4->_contentStackView;
    v4->_contentStackView = v31;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](v4->_contentStackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v4->_contentStackView, "setSpacing:", 10.0);
    -[UIStackView setAccessibilityIdentifier:](v4->_contentStackView, "setAccessibilityIdentifier:", CFSTR("ContentStackView"));
    -[CuratedCollectionItemAppClipView addSubview:](v4, "addSubview:", v4->_contentStackView);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_contentStackView, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView topAnchor](v4, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 12.0));
    v52[0] = v48;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v4->_contentStackView, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView leadingAnchor](v4, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 16.0));
    v52[1] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v4->_contentStackView, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView trailingAnchor](v4, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, -16.0));
    v52[2] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v4->_contentStackView, "bottomAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView bottomAnchor](v4, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, -12.0));
    v52[3] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v4->_artworkImageView, "widthAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToConstant:", 30.0));
    v52[4] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v4->_artworkImageView, "heightAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToConstant:", 30.0));
    v52[5] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

    -[CuratedCollectionItemAppClipView _updateFonts](v4, "_updateFonts");
    -[CuratedCollectionItemAppClipView updateUI](v4, "updateUI");
  }
  return v4;
}

- (void)updateUI
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (id)2)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v6 = (id)v5;
  -[CuratedCollectionItemAppClipView setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CuratedCollectionItemAppClipView;
  -[CuratedCollectionItemAppClipView traitCollectionDidChange:](&v17, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v8 = sub_1002A8950(v6, v7);

  if (v8)
    -[CuratedCollectionItemAppClipView _updateFonts](self, "_updateFonts");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView traitCollection](self, "traitCollection"));
  objc_msgSend(v9, "displayScale");
  v11 = v10;
  objc_msgSend(v4, "displayScale");
  v13 = v12;

  if (v11 != v13)
    -[CuratedCollectionItemAppClipView _updateFromModel](self, "_updateFromModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView traitCollection](self, "traitCollection"));
  v15 = objc_msgSend(v14, "userInterfaceStyle");
  v16 = objc_msgSend(v4, "userInterfaceStyle");

  if (v15 != v16)
    -[CuratedCollectionItemAppClipView updateUI](self, "updateUI");

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system13](UIFont, "system13"));
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIFont system20Semibold](UIFont, "system20Semibold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v6, 2));
  -[UIImageView setPreferredSymbolConfiguration:](self->_appClipSymbolImageView, "setPreferredSymbolConfiguration:", v5);

}

- (void)setViewModel:(id)a3
{
  CuratedCollectionItemAppClipViewModel *v5;
  CuratedCollectionItemAppClipViewModel *v6;
  unsigned __int8 v7;
  CuratedCollectionItemAppClipViewModel *v8;

  v5 = (CuratedCollectionItemAppClipViewModel *)a3;
  v6 = v5;
  if (self->_viewModel != v5)
  {
    v8 = v5;
    v7 = -[CuratedCollectionItemAppClipViewModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[CuratedCollectionItemAppClipView _updateFromModel](self, "_updateFromModel");
      v6 = v8;
    }
  }

}

- (void)_updateFromModel
{
  void *v3;
  void *v4;
  CuratedCollectionItemAppClipViewModel *v5;
  CuratedCollectionItemAppClipViewModel *viewModel;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  CuratedCollectionItemAppClipViewModel *v12;
  _QWORD v13[4];
  CuratedCollectionItemAppClipViewModel *v14;
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipViewModel title](self->_viewModel, "title"));
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipViewModel subtitle](self->_viewModel, "subtitle"));
  -[UILabel setText:](self->_subtitleLabel, "setText:", v4);

  objc_initWeak(&location, self);
  v5 = self->_viewModel;
  viewModel = self->_viewModel;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView traitCollection](self, "traitCollection"));
  objc_msgSend(v7, "displayScale");
  if (v8 > 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppClipView traitCollection](self, "traitCollection"));
    objc_msgSend(v9, "displayScale");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v9, "scale");
  }
  v11 = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1007AE9C8;
  v13[3] = &unk_1011C6C88;
  objc_copyWeak(&v15, &location);
  v12 = v5;
  v14 = v12;
  -[CuratedCollectionItemAppClipViewModel fetchAppClipIconWithSize:scale:completion:](viewModel, "fetchAppClipIconWithSize:scale:completion:", v13, 30.0, 30.0, v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (CuratedCollectionItemAppClipViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_appClipSymbolImageView, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end

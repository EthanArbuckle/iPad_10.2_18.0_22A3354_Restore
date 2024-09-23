@implementation MTPodcastInfoView

- (MTPodcastInfoView)initWithPodcastUuid:(id)a3
{
  id v5;
  MTPodcastInfoView *v6;
  MTPodcastInfoView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTPodcastInfoView;
  v6 = -[MTPodcastInfoView init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_podcastUuid, a3);
    -[MTPodcastInfoView addSubviews](v7, "addSubviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[MTPodcastInfoView setBackgroundColor:](v7, "setBackgroundColor:", v9);

    -[MTPodcastInfoView setLayoutMarginsFollowReadableWidth:](v7, "setLayoutMarginsFollowReadableWidth:", 1);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTPodcastInfoView;
  -[MTPodcastInfoView dealloc](&v4, "dealloc");
}

- (void)addSubviews
{
  UIImageView *v3;
  UIImageView *imageView;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  UILabel *v12;
  UILabel *titleLabel;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  UILabel *authorLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  UIView *v24;
  UIView *separatorBelowAuthor;
  UIView *v26;
  void *v27;
  IMExpandingLabel *v28;
  IMExpandingLabel *descriptionView;
  UIView *v30;
  UIView *bottomSeparator;
  void *v32;
  id v33;

  v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v3;

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v6 = objc_msgSend(v5, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  objc_msgSend(v7, "setShadowColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  objc_msgSend(v8, "setShadowRadius:", 23.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  objc_msgSend(v9, "setShadowOffset:", 0.0, 5.0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  LODWORD(v11) = 1045220557;
  objc_msgSend(v10, "setShadowOpacity:", v11);

  v12 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  v14 = self->_titleLabel;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UILabel setTextColor:](v14, "setTextColor:", v15);

  v16 = self->_titleLabel;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v16, "setBackgroundColor:", v17);

  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v18 = (UILabel *)objc_alloc_init((Class)UILabel);
  authorLabel = self->_authorLabel;
  self->_authorLabel = v18;

  -[UILabel setTextAlignment:](self->_authorLabel, "setTextAlignment:", 1);
  v20 = self->_authorLabel;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UILabel setTextColor:](v20, "setTextColor:", v21);

  v22 = self->_authorLabel;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v22, "setBackgroundColor:", v23);

  -[UILabel setLineBreakMode:](self->_authorLabel, "setLineBreakMode:", 0);
  -[UILabel setNumberOfLines:](self->_authorLabel, "setNumberOfLines:", 0);
  v24 = (UIView *)objc_alloc_init((Class)UIView);
  separatorBelowAuthor = self->_separatorBelowAuthor;
  self->_separatorBelowAuthor = v24;

  v26 = self->_separatorBelowAuthor;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSeparatorColor](UIColor, "cellSeparatorColor"));
  -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

  v28 = (IMExpandingLabel *)objc_alloc_init((Class)IMExpandingLabel);
  descriptionView = self->_descriptionView;
  self->_descriptionView = v28;

  -[IMExpandingLabel setScrollEnabled:](self->_descriptionView, "setScrollEnabled:", 0);
  -[IMExpandingLabel setNumberOfLines:](self->_descriptionView, "setNumberOfLines:", 4);
  -[IMExpandingLabel setExpanded:](self->_descriptionView, "setExpanded:", 0);
  v33 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "descriptionViewTapped:");
  objc_msgSend(v33, "setDelegate:", self);
  -[IMExpandingLabel addGestureRecognizer:](self->_descriptionView, "addGestureRecognizer:", v33);
  v30 = (UIView *)objc_alloc_init((Class)UIView);
  bottomSeparator = self->_bottomSeparator;
  self->_bottomSeparator = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSeparatorColor](UIColor, "cellSeparatorColor"));
  -[UIView setBackgroundColor:](self->_bottomSeparator, "setBackgroundColor:", v32);

  -[MTPodcastInfoView _updateFonts](self, "_updateFonts");
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_imageView);
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_titleLabel);
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_authorLabel);
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_separatorBelowAuthor);
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_descriptionView);
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_bottomSeparator);
  -[MTPodcastInfoView update](self, "update");

}

- (void)layoutSubviews
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MaxY;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  void *v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  objc_super v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v46.receiver = self;
  v46.super_class = (Class)MTPodcastInfoView;
  -[MTPodcastInfoView layoutSubviews](&v46, "layoutSubviews");
  -[MTPodcastInfoView bounds](self, "bounds");
  Width = CGRectGetWidth(v47);
  v4 = Width + -30.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", Width + -30.0, 3.40282347e38);
  v6 = v5;
  v8 = v7;
  v9 = IMRoundToPixel(fmax((Width - v5) * 0.5, 15.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  objc_msgSend(v10, "mt_offsetFromCapHeightToAscent");
  v12 = IMRoundToPixel(10.0 - v11);

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v9, v12, v6, v8);
  -[UILabel sizeThatFits:](self->_authorLabel, "sizeThatFits:", Width + -30.0, 3.40282347e38);
  v14 = v13;
  v16 = v15;
  v17 = IMRoundToPixel(fmax((Width - v13) * 0.5, 15.0));
  -[UILabel frame](self->_titleLabel, "frame");
  MaxY = CGRectGetMaxY(v48);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v19, "scale");
  v21 = v20;

  -[UILabel setFrame:](self->_authorLabel, "setFrame:", v17, MaxY + 1.0 / v21, v14, v16);
  -[UILabel frame](self->_authorLabel, "frame");
  v22 = CGRectGetMaxY(v49);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_authorLabel, "font"));
  objc_msgSend(v23, "mt_offsetFromCapHeightToAscent");
  v25 = IMRoundToPixel(v22 - v24 + 14.0);

  v26 = Width + -15.0 + -15.0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v27, "scale");
  v29 = v28;

  v30 = 1.0 / v29;
  -[UIView setFrame:](self->_separatorBelowAuthor, "setFrame:", 15.0, v25, v26, v30);
  -[MTPodcastInfoView layoutMargins](self, "layoutMargins");
  v32 = v31;
  -[MTPodcastInfoView layoutMargins](self, "layoutMargins");
  v34 = v4 - (v32 + v33);
  -[IMExpandingLabel heightForWidth:](self->_descriptionView, "heightForWidth:", v34);
  v36 = v35;
  -[MTPodcastInfoView layoutMargins](self, "layoutMargins");
  v50.origin.x = 15.0;
  v38 = v37 + 15.0;
  v50.origin.y = v25;
  v50.size.width = v26;
  v50.size.height = v30;
  -[IMExpandingLabel setFrame:](self->_descriptionView, "setFrame:", v38, CGRectGetMaxY(v50) + 14.0, v34, v36);
  -[IMExpandingLabel frame](self->_descriptionView, "frame");
  v39 = CGRectGetMaxY(v51) + 14.0;
  -[MTPodcastInfoView frame](self, "frame");
  v41 = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v42, "scale");
  v44 = v43;

  -[UIView setFrame:](self->_bottomSeparator, "setFrame:", 0.0, v39, v41, 1.0 / v44);
  -[MTPodcastInfoView frame](self, "frame");
  -[MTPodcastInfoView setFrame:](self, "setFrame:", 0.0, 0.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastInfoView delegate](self, "delegate"));
  objc_msgSend(v45, "podcastInfoViewDidExpand:", self);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  -[MTPodcastInfoView _updateFonts](self, "_updateFonts", a3);
  -[MTPodcastInfoView setNeedsLayout](self, "setNeedsLayout");
  -[MTPodcastInfoView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleCaption1));
  -[UILabel setFont:](self->_authorLabel, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_settingsButton, "titleLabel"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_shareButton, "titleLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  -[IMExpandingLabel setFont:](self->_descriptionView, "setFont:", v9);

}

- (void)update
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastInfoView podcastUuid](self, "podcastUuid"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastForUuid:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
  -[UILabel setText:](self->_titleLabel, "setText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "author"));
  -[UILabel setText:](self->_authorLabel, "setText:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemDescription"));
  -[IMExpandingLabel setText:](self->_descriptionView, "setText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "artworkWithSize:", 240.0, 240.0));
  -[UIImageView setImage:](self->_imageView, "setImage:", v9);

  -[MTPodcastInfoView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)descriptionViewTapped:(id)a3
{
  id v4;

  if ((-[IMExpandingLabel isExpanded](self->_descriptionView, "isExpanded", a3) & 1) == 0)
  {
    -[IMExpandingLabel setExpanded:](self->_descriptionView, "setExpanded:", 1);
    -[MTPodcastInfoView setNeedsLayout](self, "setNeedsLayout");
    -[MTPodcastInfoView layoutIfNeeded](self, "layoutIfNeeded");
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastInfoView delegate](self, "delegate"));
    objc_msgSend(v4, "podcastInfoViewWasTapped:", self);

  }
}

- (id)metricsName
{
  return CFSTR("PodcastDetails");
}

- (id)metricsContentIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastInfoView podcastUuid](self, "podcastUuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastForUuid:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metricsContentIdentifier"));
  return v7;
}

- (MTPodcastInfoViewDelegate)delegate
{
  return (MTPodcastInfoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (void)setPodcastUuid:(id)a3
{
  objc_storeStrong((id *)&self->_podcastUuid, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)authorLabel
{
  return self->_authorLabel;
}

- (void)setAuthorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_authorLabel, a3);
}

- (UIView)separatorBelowAuthor
{
  return self->_separatorBelowAuthor;
}

- (void)setSeparatorBelowAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorBelowAuthor, a3);
}

- (UIButton)settingsButton
{
  return self->_settingsButton;
}

- (void)setSettingsButton:(id)a3
{
  objc_storeStrong((id *)&self->_settingsButton, a3);
}

- (UIButton)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
  objc_storeStrong((id *)&self->_shareButton, a3);
}

- (IMExpandingLabel)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionView, a3);
}

- (UIView)bottomSeparator
{
  return self->_bottomSeparator;
}

- (void)setBottomSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSeparator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_settingsButton, 0);
  objc_storeStrong((id *)&self->_separatorBelowAuthor, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

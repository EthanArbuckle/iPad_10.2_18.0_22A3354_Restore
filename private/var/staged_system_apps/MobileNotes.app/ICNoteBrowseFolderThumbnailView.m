@implementation ICNoteBrowseFolderThumbnailView

- (ICNoteBrowseFolderThumbnailView)initWithCoder:(id)a3
{
  ICNoteBrowseFolderThumbnailView *v3;
  ICNoteBrowseFolderThumbnailView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseFolderThumbnailView;
  v3 = -[ICNoteBrowseFolderThumbnailView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ICNoteBrowseFolderThumbnailView commonInit](v3, "commonInit");
  return v4;
}

- (ICNoteBrowseFolderThumbnailView)initWithFrame:(CGRect)a3
{
  ICNoteBrowseFolderThumbnailView *v3;
  ICNoteBrowseFolderThumbnailView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseFolderThumbnailView;
  v3 = -[ICNoteBrowseFolderThumbnailView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICNoteBrowseFolderThumbnailView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  UIView *v3;
  UIView *contentView;
  void *v5;
  double MidX;
  double MidY;
  ICNoteResultsThumbnailView *v8;
  ICNoteResultsThumbnailView *thumbnailView0;
  ICNoteResultsThumbnailView *v10;
  ICNoteResultsThumbnailView *thumbnailView1;
  ICNoteResultsThumbnailView *v12;
  ICNoteResultsThumbnailView *thumbnailView2;
  ICNoteResultsThumbnailView *v14;
  ICNoteResultsThumbnailView *thumbnailView3;
  ICNoteResultsThumbnailView *v16;
  ICNoteResultsThumbnailView *v17;
  NSArray *v18;
  NSArray *thumbnailViews;
  id v20;
  ICNoteResultsThumbnailView *v21;
  void *v22;
  UIStackView *v23;
  UIStackView *horizontalStackView0;
  id v25;
  ICNoteResultsThumbnailView *v26;
  void *v27;
  UIStackView *v28;
  UIStackView *horizontalStackView1;
  id v30;
  UIStackView *v31;
  void *v32;
  UIStackView *v33;
  UIStackView *verticalStackView;
  unsigned int v35;
  uint64_t v36;
  const UIFontTextStyle *v37;
  UIImageView *v38;
  UIImageView *emptyFolderImageView;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[4];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[4];
  CGRect v64;
  CGRect v65;

  self->_allowsCompactSizeMetrics = 1;
  v3 = (UIView *)objc_alloc_init((Class)UIView);
  contentView = self->_contentView;
  self->_contentView = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray4Color](UIColor, "systemGray4Color"));
  -[UIView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v5);

  -[ICNoteBrowseFolderThumbnailView addSubview:](self, "addSubview:", self->_contentView);
  -[UIView ic_addAnchorsToFillSuperview](self->_contentView, "ic_addAnchorsToFillSuperview");
  -[ICNoteBrowseFolderThumbnailView bounds](self, "bounds");
  MidX = CGRectGetMidX(v64);
  -[ICNoteBrowseFolderThumbnailView bounds](self, "bounds");
  MidY = CGRectGetMidY(v65);
  v8 = -[ICNoteResultsThumbnailView initWithFrame:]([ICNoteResultsThumbnailView alloc], "initWithFrame:", 0.0, 0.0, MidX, MidY);
  thumbnailView0 = self->_thumbnailView0;
  self->_thumbnailView0 = v8;

  -[ICNoteResultsThumbnailView setTranslatesAutoresizingMaskIntoConstraints:](self->_thumbnailView0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = -[ICNoteResultsThumbnailView initWithFrame:]([ICNoteResultsThumbnailView alloc], "initWithFrame:", 0.0, 0.0, MidX, MidY);
  thumbnailView1 = self->_thumbnailView1;
  self->_thumbnailView1 = v10;

  -[ICNoteResultsThumbnailView setTranslatesAutoresizingMaskIntoConstraints:](self->_thumbnailView1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = -[ICNoteResultsThumbnailView initWithFrame:]([ICNoteResultsThumbnailView alloc], "initWithFrame:", 0.0, 0.0, MidX, MidY);
  thumbnailView2 = self->_thumbnailView2;
  self->_thumbnailView2 = v12;

  -[ICNoteResultsThumbnailView setTranslatesAutoresizingMaskIntoConstraints:](self->_thumbnailView2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = -[ICNoteResultsThumbnailView initWithFrame:]([ICNoteResultsThumbnailView alloc], "initWithFrame:", 0.0, 0.0, MidX, MidY);
  thumbnailView3 = self->_thumbnailView3;
  self->_thumbnailView3 = v14;

  -[ICNoteResultsThumbnailView setTranslatesAutoresizingMaskIntoConstraints:](self->_thumbnailView3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = self->_thumbnailView1;
  v63[0] = self->_thumbnailView0;
  v63[1] = v16;
  v17 = self->_thumbnailView3;
  v63[2] = self->_thumbnailView2;
  v63[3] = v17;
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 4));
  thumbnailViews = self->_thumbnailViews;
  self->_thumbnailViews = v18;

  v20 = objc_alloc((Class)UIStackView);
  v21 = self->_thumbnailView1;
  v62[0] = self->_thumbnailView0;
  v62[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 2));
  v23 = (UIStackView *)objc_msgSend(v20, "initWithArrangedSubviews:", v22);
  horizontalStackView0 = self->_horizontalStackView0;
  self->_horizontalStackView0 = v23;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_horizontalStackView0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_horizontalStackView0, "setAxis:", 0);
  -[UIStackView setDistribution:](self->_horizontalStackView0, "setDistribution:", 1);
  v25 = objc_alloc((Class)UIStackView);
  v26 = self->_thumbnailView3;
  v61[0] = self->_thumbnailView2;
  v61[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 2));
  v28 = (UIStackView *)objc_msgSend(v25, "initWithArrangedSubviews:", v27);
  horizontalStackView1 = self->_horizontalStackView1;
  self->_horizontalStackView1 = v28;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_horizontalStackView1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_horizontalStackView1, "setAxis:", 0);
  -[UIStackView setDistribution:](self->_horizontalStackView1, "setDistribution:", 1);
  v30 = objc_alloc((Class)UIStackView);
  v31 = self->_horizontalStackView1;
  v60[0] = self->_horizontalStackView0;
  v60[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 2));
  v33 = (UIStackView *)objc_msgSend(v30, "initWithArrangedSubviews:", v32);
  verticalStackView = self->_verticalStackView;
  self->_verticalStackView = v33;

  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_verticalStackView, "setLayoutMarginsRelativeArrangement:", 1);
  -[UIStackView setAxis:](self->_verticalStackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_verticalStackView, "setDistribution:", 1);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_verticalStackView);
  -[UIStackView ic_addAnchorsToFillSuperview](self->_verticalStackView, "ic_addAnchorsToFillSuperview");
  v35 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  if (v35)
    v36 = 3;
  else
    v36 = 1;
  v37 = &UIFontTextStyleTitle1;
  if (!v35)
    v37 = &UIFontTextStyleBody;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:textStyle:scale:](UIImage, "ic_systemImageNamed:textStyle:scale:", CFSTR("folder"), *v37, v36));
  v38 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v57);
  emptyFolderImageView = self->_emptyFolderImageView;
  self->_emptyFolderImageView = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  -[UIImageView setTintColor:](self->_emptyFolderImageView, "setTintColor:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setBackgroundColor:](self->_emptyFolderImageView, "setBackgroundColor:", v41);

  -[UIImageView setContentMode:](self->_emptyFolderImageView, "setContentMode:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_emptyFolderImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_emptyFolderImageView);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_emptyFolderImageView, "centerXAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_contentView, "centerXAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v59[0] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_emptyFolderImageView, "centerYAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_contentView, "centerYAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v42));
  v59[1] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_emptyFolderImageView, "heightAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_contentView, "heightAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:multiplier:", v45, 0.5));
  v59[2] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_emptyFolderImageView, "widthAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_emptyFolderImageView, "heightAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v48));
  v59[3] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v50);

  -[ICNoteBrowseFolderThumbnailView setHasDropShadow:](self, "setHasDropShadow:", 1);
  -[ICNoteBrowseFolderThumbnailView updateForTraitCollection](self, "updateForTraitCollection");
  v58 = objc_opt_class(UITraitHorizontalSizeClass);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
  v52 = -[ICNoteBrowseFolderThumbnailView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v51, "updateForTraitCollection");

}

- (void)setFolder:(id)a3
{
  objc_storeWeak((id *)&self->_folder, a3);
  -[ICNoteBrowseFolderThumbnailView updateThumbnails](self, "updateThumbnails");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView contentView](self, "contentView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setHasDropShadow:(BOOL)a3
{
  self->_hasDropShadow = a3;
  if (-[ICNoteBrowseFolderThumbnailView hasDropShadow](self, "hasDropShadow"))
    -[ICNoteBrowseFolderThumbnailView ic_applyShadow](self, "ic_applyShadow");
  else
    -[ICNoteBrowseFolderThumbnailView ic_removeShadow](self, "ic_removeShadow");
}

- (BOOL)isCompact
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "ic_hasCompactSize"))
    v4 = -[ICNoteBrowseFolderThumbnailView allowsCompactSizeMetrics](self, "allowsCompactSizeMetrics");
  else
    v4 = 0;

  return v4;
}

- (void)updateThumbnails
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const UIFontTextStyle *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  ICNoteBrowseFolderThumbnailView *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView folder](self, "folder"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleNotes"));
  v5 = (void *)v4;
  v6 = &__NSArray0__struct;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView thumbnailViews](self, "thumbnailViews"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000E2DB0;
  v18[3] = &unk_100554930;
  v19 = v7;
  v20 = self;
  v17 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView folder](self, "folder"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "systemImageName"));
  v11 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  v12 = &UIFontTextStyleTitle1;
  if (!v11)
    v12 = &UIFontTextStyleBody;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:textStyle:scale:](UIImage, "ic_systemImageNamed:textStyle:scale:", v10, *v12, 3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView emptyFolderImageView](self, "emptyFolderImageView"));
  objc_msgSend(v14, "setImage:", v13);

  v15 = objc_msgSend(v17, "count") != 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView emptyFolderImageView](self, "emptyFolderImageView"));
  objc_msgSend(v16, "setHidden:", v15);

}

- (void)updateForTraitCollection
{
  unsigned __int8 v3;
  double v4;
  unsigned int v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v3 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  v4 = 16.0;
  if ((v3 & 1) == 0)
  {
    v5 = -[ICNoteBrowseFolderThumbnailView isCompact](self, "isCompact", 16.0);
    v4 = 12.0;
    if (v5)
      v4 = 8.0;
  }
  -[ICNoteBrowseFolderThumbnailView setCornerRadius:](self, "setCornerRadius:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView contentView](self, "contentView"));
  -[ICNoteBrowseFolderThumbnailView cornerRadius](self, "cornerRadius");
  objc_msgSend(v6, "ic_applyRoundedCornersWithRadius:");

  v7 = 12.0;
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    if (-[ICNoteBrowseFolderThumbnailView isCompact](self, "isCompact"))
      v7 = 4.0;
    else
      v7 = 8.0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView verticalStackView](self, "verticalStackView"));
  objc_msgSend(v8, "setDirectionalLayoutMargins:", v7, v7, v7, v7);

  if (-[ICNoteBrowseFolderThumbnailView isCompact](self, "isCompact"))
    v9 = 2.0;
  else
    v9 = 4.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView verticalStackView](self, "verticalStackView"));
  objc_msgSend(v10, "setSpacing:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView horizontalStackView0](self, "horizontalStackView0"));
  objc_msgSend(v11, "setSpacing:", v9);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseFolderThumbnailView horizontalStackView1](self, "horizontalStackView1"));
  objc_msgSend(v12, "setSpacing:", v9);

}

- (ICFolder)folder
{
  return (ICFolder *)objc_loadWeakRetained((id *)&self->_folder);
}

- (BOOL)hasDropShadow
{
  return self->_hasDropShadow;
}

- (BOOL)allowsCompactSizeMetrics
{
  return self->_allowsCompactSizeMetrics;
}

- (void)setAllowsCompactSizeMetrics:(BOOL)a3
{
  self->_allowsCompactSizeMetrics = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIImageView)emptyFolderImageView
{
  return self->_emptyFolderImageView;
}

- (void)setEmptyFolderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_emptyFolderImageView, a3);
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackView, a3);
}

- (UIStackView)horizontalStackView0
{
  return self->_horizontalStackView0;
}

- (void)setHorizontalStackView0:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalStackView0, a3);
}

- (UIStackView)horizontalStackView1
{
  return self->_horizontalStackView1;
}

- (void)setHorizontalStackView1:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalStackView1, a3);
}

- (ICNoteResultsThumbnailView)thumbnailView0
{
  return self->_thumbnailView0;
}

- (void)setThumbnailView0:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView0, a3);
}

- (ICNoteResultsThumbnailView)thumbnailView1
{
  return self->_thumbnailView1;
}

- (void)setThumbnailView1:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView1, a3);
}

- (ICNoteResultsThumbnailView)thumbnailView2
{
  return self->_thumbnailView2;
}

- (void)setThumbnailView2:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView2, a3);
}

- (ICNoteResultsThumbnailView)thumbnailView3
{
  return self->_thumbnailView3;
}

- (void)setThumbnailView3:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView3, a3);
}

- (NSArray)thumbnailViews
{
  return self->_thumbnailViews;
}

- (void)setThumbnailViews:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailViews, 0);
  objc_storeStrong((id *)&self->_thumbnailView3, 0);
  objc_storeStrong((id *)&self->_thumbnailView2, 0);
  objc_storeStrong((id *)&self->_thumbnailView1, 0);
  objc_storeStrong((id *)&self->_thumbnailView0, 0);
  objc_storeStrong((id *)&self->_horizontalStackView1, 0);
  objc_storeStrong((id *)&self->_horizontalStackView0, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_emptyFolderImageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_folder);
}

@end

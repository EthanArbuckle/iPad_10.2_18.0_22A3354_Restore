@implementation CuratedCollectionMediaIntegrationTableViewCell

- (CuratedCollectionMediaIntegrationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CuratedCollectionMediaIntegrationTableViewCell *v4;
  void *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *utilityQueue;
  objc_class *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *cachedAppImagesByIdentifiers;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CuratedCollectionMediaIntegrationTableViewCell;
  v4 = -[CuratedCollectionMediaIntegrationTableViewCell initWithStyle:reuseIdentifier:](&v16, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CuratedCollectionMediaIntegrationTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.Maps.CuratedCollectionMediaIntegrationTableViewCell", v7);
    utilityQueue = v4->_utilityQueue;
    v4->_utilityQueue = (OS_dispatch_queue *)v8;

    v10 = (objc_class *)objc_opt_class(v4);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[CuratedCollectionMediaIntegrationTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v12);

    -[CuratedCollectionMediaIntegrationTableViewCell _addSubviews](v4, "_addSubviews");
    -[CuratedCollectionMediaIntegrationTableViewCell _setupBaseConstraints](v4, "_setupBaseConstraints");
    -[CuratedCollectionMediaIntegrationTableViewCell _setupCornerRadius](v4, "_setupCornerRadius");
    -[CuratedCollectionMediaIntegrationTableViewCell _setupShadows](v4, "_setupShadows");
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cachedAppImagesByIdentifiers = v4->_cachedAppImagesByIdentifiers;
    v4->_cachedAppImagesByIdentifiers = (NSMutableDictionary *)v13;

    -[CuratedCollectionMediaIntegrationTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  }
  return v4;
}

- (void)setViewModel:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_viewModel, a3);
  if (self->_viewModel)
  {
    -[CuratedCollectionMediaIntegrationTableViewCell _updateLogoConstraintsAndVisibility](self, "_updateLogoConstraintsAndVisibility");
    self->_needsImageLoad = 1;
    -[CuratedCollectionMediaIntegrationTableViewCell _updateViews](self, "_updateViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childViewModels"));
    -[CuratedCollectionMediaIntegrationPlatterControl setEnabled:](self->_platterView, "setEnabled:", objc_msgSend(v5, "count") != 0);

    -[CuratedCollectionMediaIntegrationTableViewCell _loadMenuActionImages](self, "_loadMenuActionImages");
  }

}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  self->_needsImageLoad = 0;
  -[CuratedCollectionMediaIntegrationTableViewCell setViewModel:](self, "setViewModel:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  objc_msgSend(v3, "setImage:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setText:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v5, "setText:", 0);

  -[CuratedCollectionMediaIntegrationTableViewCell setMediaIntegrationMenuInteraction:](self, "setMediaIntegrationMenuInteraction:", 0);
  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionMediaIntegrationTableViewCell;
  -[CuratedCollectionMediaIntegrationTableViewCell prepareForReuse](&v6, "prepareForReuse");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionMediaIntegrationTableViewCell;
  -[CuratedCollectionMediaIntegrationTableViewCell layoutSubviews](&v3, "layoutSubviews");
  -[CuratedCollectionMediaIntegrationTableViewCell _loadImageIfNeeded](self, "_loadImageIfNeeded");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CuratedCollectionMediaIntegrationTableViewCell;
  v4 = a3;
  -[CuratedCollectionMediaIntegrationTableViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[CuratedCollectionMediaIntegrationTableViewCell _updateViews](self, "_updateViews");
}

- (void)setPosition:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_position != a3)
  {
    self->_position = a3;
    if (a3 >= 2)
    {
      if (a3 == 2)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell topMarginConstraint](self, "topMarginConstraint"));
        objc_msgSend(v6, "setConstant:", 0.0);

        v7 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell bottomMarginConstraint](self, "bottomMarginConstraint"));
        objc_msgSend(v7, "setConstant:", 16.0);

      }
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell topMarginConstraint](self, "topMarginConstraint"));
      objc_msgSend(v4, "setConstant:", 16.0);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell bottomMarginConstraint](self, "bottomMarginConstraint"));
      objc_msgSend(v5, "setConstant:", 0.0);

      -[CuratedCollectionMediaIntegrationTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 0.0, 0.0, 1.79769313e308);
    }
  }
}

- (void)_updateViews
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
  id v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell viewModel](self, "viewModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell viewModel](self, "viewModel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionText"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  objc_msgSend(v11, "setText:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell viewModel](self, "viewModel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "realmIcon"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell logoImageView](self, "logoImageView"));
  objc_msgSend(v14, "setImage:", v13);

  -[CuratedCollectionMediaIntegrationTableViewCell _loadImageIfNeeded](self, "_loadImageIfNeeded");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell traitCollection](self, "traitCollection"));
  v16 = objc_msgSend(v15, "userInterfaceStyle");

  if (v16 == (id)2)
    v17 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  else
    v17 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v19 = (id)v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  objc_msgSend(v18, "setBackgroundColor:", v19);

}

- (void)_loadMenuActionImages
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *utilityQueue;
  _QWORD block[4];
  id v8;
  int64x2_t v9;
  uint64_t v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v3, "screenScale");
  v5 = v4;

  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004BAEC8;
  block[3] = &unk_1011B8BD8;
  objc_copyWeak(&v8, &location);
  v9 = vdupq_n_s64(0x4044000000000000uLL);
  v10 = v5;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_loadImageIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double height;
  CuratedCollectionMediaIntegrationViewModel *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CuratedCollectionMediaIntegrationViewModel *v16;
  _QWORD v17[4];
  CuratedCollectionMediaIntegrationViewModel *v18;
  id v19;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  height = CGSizeZero.height;

  if (v5 == CGSizeZero.width && v7 == height)
  {
    -[CuratedCollectionMediaIntegrationTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
  else if (-[CuratedCollectionMediaIntegrationTableViewCell needsImageLoad](self, "needsImageLoad"))
  {
    -[CuratedCollectionMediaIntegrationTableViewCell setNeedsImageLoad:](self, "setNeedsImageLoad:", 0);
    v10 = self->_viewModel;
    objc_initWeak(&location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1004BB540;
    v17[3] = &unk_1011B8C20;
    objc_copyWeak(&v19, &location);
    v16 = v10;
    v18 = v16;
    -[CuratedCollectionMediaIntegrationViewModel loadImageForSize:completion:](v16, "loadImageForSize:completion:", v17, v13, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

- (void)_setupShadows
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor")));
  v4 = objc_msgSend(v3, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v6, "setShadowColor:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  LODWORD(v9) = 1025758986;
  objc_msgSend(v8, "setShadowOpacity:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  objc_msgSend(v11, "setShadowOffset:", 0.0, 2.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
  objc_msgSend(v13, "setShadowRadius:", 5.0);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
  objc_msgSend(v14, "setShadowPathIsBounds:", 1);

}

- (void)_setupCornerRadius
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setCornerRadius:", 10.0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v5, "setMasksToBounds:", 1);

}

- (void)_addSubviews
{
  CuratedCollectionMediaIntegrationPlatterControl *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const UIFontTextStyle *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v3 = objc_alloc_init(CuratedCollectionMediaIntegrationPlatterControl);
  -[CuratedCollectionMediaIntegrationTableViewCell setPlatterView:](self, "setPlatterView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("PlatterView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  objc_msgSend(v5, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  objc_msgSend(v8, "setInteractionDelegate:", self);

  v9 = objc_alloc_init((Class)UILabel);
  -[CuratedCollectionMediaIntegrationTableViewCell setTitleLabel:](self, "setTitleLabel:", v9);

  if (sub_1002A8AA0(self) == 5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell traitCollection](self, "traitCollection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle3, v10, UIFontWeightSemibold));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v12, "setFont:", v11);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v11, "setFont:", v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v13, "setNumberOfLines:", 2);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v14, "setLineBreakStrategy:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v16, "addSubview:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = sub_1002A8AA0(self);
  v20 = &UIFontTextStyleBody;
  if (v19 != 5)
    v20 = &UIFontTextStyleSubheadline;
  v58 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", *v20));
  v21 = objc_alloc_init((Class)UILabel);
  -[CuratedCollectionMediaIntegrationTableViewCell setSubtitleLabel:](self, "setSubtitleLabel:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v22, "setFont:", v58);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v24, "setTextColor:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v26, "addSubview:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v29 = objc_alloc_init((Class)UILabel);
  -[CuratedCollectionMediaIntegrationTableViewCell setActionLabel:](self, "setActionLabel:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  objc_msgSend(v30, "setFont:", v58);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  objc_msgSend(v32, "setTextColor:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  objc_msgSend(v33, "setAccessibilityIdentifier:", CFSTR("ActionLabel"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  objc_msgSend(v34, "addSubview:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v37 = objc_alloc_init((Class)UIControl);
  -[CuratedCollectionMediaIntegrationTableViewCell setActionControl:](self, "setActionControl:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionControl](self, "actionControl"));
  objc_msgSend(v38, "setAccessibilityIdentifier:", CFSTR("ActionControl"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionControl](self, "actionControl"));
  objc_msgSend(v39, "addSubview:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionControl](self, "actionControl"));
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v42 = objc_alloc_init((Class)UIImageView);
  -[CuratedCollectionMediaIntegrationTableViewCell setLogoImageView:](self, "setLogoImageView:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell logoImageView](self, "logoImageView"));
  objc_msgSend(v43, "setContentMode:", 2);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell logoImageView](self, "logoImageView"));
  objc_msgSend(v44, "setAccessibilityIdentifier:", CFSTR("LogoImageView"));

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell logoImageView](self, "logoImageView"));
  objc_msgSend(v45, "addSubview:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell logoImageView](self, "logoImageView"));
  objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v48 = objc_alloc_init((Class)UIImageView);
  -[CuratedCollectionMediaIntegrationTableViewCell setArtworkImageView:](self, "setArtworkImageView:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  objc_msgSend(v49, "setAccessibilityIdentifier:", CFSTR("ArtworkImageView"));

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  objc_msgSend(v50, "addSubview:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "layer"));
  objc_msgSend(v54, "setMasksToBounds:", 1);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "layer"));
  objc_msgSend(v56, "setCornerRadius:", 8.0);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  objc_msgSend(v57, "setContentMode:", 2);

}

- (void)_setupBaseConstraints
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  _QWORD v107[21];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 16.0));
  -[CuratedCollectionMediaIntegrationTableViewCell setTopMarginConstraint:](self, "setTopMarginConstraint:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 16.0));
  -[CuratedCollectionMediaIntegrationTableViewCell setBottomMarginConstraint:](self, "setBottomMarginConstraint:", v12);

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "leadingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell contentView](self, "contentView"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "leadingAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:constant:", v103, 16.0));
  v107[0] = v102;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "trailingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell contentView](self, "contentView"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "trailingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:constant:", v98, -16.0));
  v107[1] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell topMarginConstraint](self, "topMarginConstraint"));
  v107[2] = v96;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell bottomMarginConstraint](self, "bottomMarginConstraint"));
  v107[3] = v95;
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "leadingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "leadingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:constant:", v91, 16.0));
  v107[4] = v90;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "trailingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:constant:", v86, -10.0));
  v107[5] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "topAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "bottomAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, 2.0));
  v107[6] = v80;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "leadingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, 16.0));
  v107[7] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, -10.0));
  v107[8] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell subtitleLabel](self, "subtitleLabel"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "bottomAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, 8.0));
  v107[9] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 16.0));
  v107[10] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, -16.0));
  v107[11] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -16.0));
  v107[12] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionControl](self, "actionControl"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v107[13] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionControl](self, "actionControl"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v107[14] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionControl](self, "actionControl"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v107[15] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionControl](self, "actionControl"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v107[16] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 16.0));
  v107[17] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v14, -16.0));
  v107[18] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "heightAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToConstant:", 64.0));
  v107[19] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell artworkImageView](self, "artworkImageView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "widthAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", 64.0));
  v107[20] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v107, 21));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

}

- (void)_updateLogoConstraintsAndVisibility
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell activeLogoConstraints](self, "activeLogoConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell viewModel](self, "viewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childViewModels"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell logoImageView](self, "logoImageView"));
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setHidden:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 16.0));
    v32 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
  }
  else
  {
    objc_msgSend(v7, "setHidden:", 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell logoImageView](self, "logoImageView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "heightAnchor"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToConstant:", 12.0));
    v33[0] = v25;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell logoImageView](self, "logoImageView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v29, 16.0));
    v33[1] = v28;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell logoImageView](self, "logoImageView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 16.0));
    v33[2] = v21;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell titleLabel](self, "titleLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell logoImageView](self, "logoImageView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell viewModel](self, "viewModel"));
    objc_msgSend(v19, "logoToTitlePadding");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18));
    v33[3] = v20;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));

    v11 = (void *)v25;
    v10 = v27;

    v9 = v30;
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);
  -[CuratedCollectionMediaIntegrationTableViewCell setActiveLogoConstraints:](self, "setActiveLogoConstraints:", v14);

}

- (id)_buildDeferredMenuElementForMediaIntegration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  CuratedCollectionMediaIntegrationTableViewCell *v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004BCF10;
  v8[3] = &unk_1011B8C48;
  v5 = v4;
  v9 = v5;
  objc_copyWeak(&v11, &location);
  v10 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDeferredMenuElement elementWithProvider:](UIDeferredMenuElement, "elementWithProvider:", v8));
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v6;
}

- (id)_allMenuElementsForMediaIntegration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_alloc((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childViewModels"));
  v7 = objc_msgSend(v5, "initWithCapacity:", (char *)objc_msgSend(v6, "count") + 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell _buildMenuElementForViewModel:](self, "_buildMenuElementForViewModel:", v4));
  objc_msgSend(v7, "addObject:", v8);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childViewModels", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell _buildMenuElementForViewModel:](self, "_buildMenuElementForViewModel:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13)));
        objc_msgSend(v7, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v7;
}

- (id)_buildMenuElementForViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableDictionary *cachedAppImagesByIdentifiers;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedSystemFirstPartyName"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemFirstPartyIcon"));
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    cachedAppImagesByIdentifiers = self->_cachedAppImagesByIdentifiers;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cachedAppImagesByIdentifiers, "objectForKeyedSubscript:", v13));

  }
  objc_initWeak(&location, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1004BD2E4;
  v18[3] = &unk_1011ACEC0;
  objc_copyWeak(&v20, &location);
  v15 = v4;
  v19 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v8, v11, v14, v18));

  objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("CuratedCollectionMediaMenuItem"));
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v16;
}

- (id)mediaIntegrationMenuConfigurationWithInteraction:(id)a3
{
  void *v4;
  _QWORD v6[5];

  -[CuratedCollectionMediaIntegrationTableViewCell setMediaIntegrationMenuInteraction:](self, "setMediaIntegrationMenuInteraction:", a3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004BD3BC;
  v6[3] = &unk_1011B7BA8;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v6));
  objc_msgSend(v4, "setPreferredMenuElementOrder:", 2);
  return v4;
}

- (CGPoint)mediaIntegrationMenuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionControl](self, "actionControl"));
  objc_msgSend(v5, "menuAttachmentPointForConfiguration:", v4);
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell platterView](self, "platterView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionControl](self, "actionControl"));
  objc_msgSend(v10, "convertPoint:fromView:", v11, v7, v9);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)mediaIntegrationMenuWillAppear
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  objc_msgSend(v3, "setAlpha:", 0.5);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell delegate](self, "delegate"));
  objc_msgSend(v4, "mediaIntegrationCellDidDisplayChildLinks:", self);

}

- (void)mediaIntegrationMenuWillDisappear
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationTableViewCell actionLabel](self, "actionLabel"));
  objc_msgSend(v2, "setAlpha:", 1.0);

}

- (CuratedCollectionMediaIntegrationViewModel)viewModel
{
  return self->_viewModel;
}

- (CuratedCollectionMediaIntegrationTableViewCellDelegate)delegate
{
  return (CuratedCollectionMediaIntegrationTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)position
{
  return self->_position;
}

- (BOOL)needsImageLoad
{
  return self->_needsImageLoad;
}

- (void)setNeedsImageLoad:(BOOL)a3
{
  self->_needsImageLoad = a3;
}

- (CuratedCollectionMediaIntegrationPlatterControl)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)actionLabel
{
  return self->_actionLabel;
}

- (void)setActionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_actionLabel, a3);
}

- (UIControl)actionControl
{
  return self->_actionControl;
}

- (void)setActionControl:(id)a3
{
  objc_storeStrong((id *)&self->_actionControl, a3);
}

- (UIImageView)logoImageView
{
  return self->_logoImageView;
}

- (void)setLogoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_logoImageView, a3);
}

- (UIImageView)artworkImageView
{
  return self->_artworkImageView;
}

- (void)setArtworkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImageView, a3);
}

- (NSMutableDictionary)cachedAppImagesByIdentifiers
{
  return self->_cachedAppImagesByIdentifiers;
}

- (void)setCachedAppImagesByIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAppImagesByIdentifiers, a3);
}

- (UIContextMenuInteraction)mediaIntegrationMenuInteraction
{
  return self->_mediaIntegrationMenuInteraction;
}

- (void)setMediaIntegrationMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_mediaIntegrationMenuInteraction, a3);
}

- (NSArray)activeLogoConstraints
{
  return self->_activeLogoConstraints;
}

- (void)setActiveLogoConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSLayoutConstraint)topMarginConstraint
{
  return self->_topMarginConstraint;
}

- (void)setTopMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topMarginConstraint, a3);
}

- (NSLayoutConstraint)bottomMarginConstraint
{
  return self->_bottomMarginConstraint;
}

- (void)setBottomMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomMarginConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomMarginConstraint, 0);
  objc_storeStrong((id *)&self->_topMarginConstraint, 0);
  objc_storeStrong((id *)&self->_activeLogoConstraints, 0);
  objc_storeStrong((id *)&self->_mediaIntegrationMenuInteraction, 0);
  objc_storeStrong((id *)&self->_cachedAppImagesByIdentifiers, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_actionControl, 0);
  objc_storeStrong((id *)&self->_actionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
}

@end

@implementation CuratedCollectionHeaderView

- (CuratedCollectionHeaderView)initWithDelegate:(id)a3
{
  id v4;
  CuratedCollectionHeaderView *v5;
  CuratedCollectionHeaderView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CuratedCollectionHeaderView;
  v5 = -[CuratedCollectionHeaderView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_layout = 2;
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[CuratedCollectionHeaderView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("CuratedCollectionHeader"));
    -[CuratedCollectionHeaderView _createSubviews](v6, "_createSubviews");
    -[CuratedCollectionHeaderView _setupConstraints](v6, "_setupConstraints");
    -[CuratedCollectionHeaderView _updateHeaderStyling](v6, "_updateHeaderStyling");
    v6->_needsImageReload = 1;
  }

  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIImageView *v4;
  id v6;
  UIImageView *v7;
  unint64_t layout;
  uint64_t v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionHeaderView;
  v6 = -[CuratedCollectionHeaderView hitTest:withEvent:](&v12, "hitTest:withEvent:", a4, a3.x, a3.y);
  v7 = (UIImageView *)objc_claimAutoreleasedReturnValue(v6);
  layout = self->_layout;
  if (layout >= 4)
  {
    if (layout != 4)
      goto LABEL_3;
    v10 = objc_opt_class(UIControl);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0 && v7 != self->_publisherLogoImageView)
    {
      if (!-[UIImageView isDescendantOfView:](v7, "isDescendantOfView:", self->_titleHeaderView)
        || (-[CuratedCollectionHeaderView _scrollTransitionFraction](self, "_scrollTransitionFraction"), v11 == 0.0))
      {
        v4 = 0;
        goto LABEL_3;
      }
    }
  }
  v4 = v7;
LABEL_3:

  return v4;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionHeaderView;
  -[CuratedCollectionHeaderView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  -[CuratedCollectionHeaderView _updateHeaderStyling](self, "_updateHeaderStyling");
}

- (void)setLayout:(int64_t)a3 transitionFraction:(double)a4
{
  double v5;

  if (self->_layout != a3 || self->_transitionFraction != a4)
  {
    self->_layout = a3;
    self->_transitionFraction = a4;
    if (self->_layout == 4)
    {
      -[CuratedCollectionHeaderView unscrolledHeightForCurrentLayout](self, "unscrolledHeightForCurrentLayout");
      self->_tableViewContentOffset = -v5;
    }
    -[CuratedCollectionHeaderView _updateHeaderStyling](self, "_updateHeaderStyling");
  }
}

- (void)setTableViewContentOffset:(double)a3
{
  if (self->_tableViewContentOffset != a3)
  {
    self->_tableViewContentOffset = a3;
    -[CuratedCollectionHeaderView _updateHeaderStyling](self, "_updateHeaderStyling");
  }
}

- (void)setTableViewSubheaderContentHeight:(double)a3
{
  if (self->_tableViewSubheaderContentHeight != a3)
  {
    self->_tableViewSubheaderContentHeight = a3;
    -[CuratedCollectionHeaderView _updateConstraintConstants](self, "_updateConstraintConstants");
  }
}

- (void)_createSubviews
{
  void *v3;
  id v4;
  double y;
  double width;
  double height;
  UIView *v8;
  UIView *blockView;
  UIView *v10;
  UIView *blockBlackView;
  void *v12;
  void *v13;
  UIView *v14;
  UIView *blockContentView;
  UITapGestureRecognizer *v16;
  UITapGestureRecognizer *blockContentViewTapGestureRecognizer;
  UIImageView *v18;
  UIImageView *heroImageView;
  GradientView *v20;
  GradientView *heroJoeGradientView;
  void *v22;
  void *v23;
  GradientView *v24;
  GradientView *heroBlackGradientView;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  UIView *v34;
  UIView *heroImageJoeView;
  UIView *v36;
  UIView *heroImageBlackView;
  void *v38;
  void *v39;
  UIImageView *v40;
  UIImageView *publisherLogoImageView;
  UITapGestureRecognizer *v42;
  UITapGestureRecognizer *publisherLogoTapGesture;
  UILabel *v44;
  UILabel *titleMultiLineLabel;
  UIView *v46;
  UIView *titleContainerView;
  UIView *v48;
  UIView *titleJoeView;
  UIView *v50;
  UIView *titleBlackView;
  void *v52;
  void *v53;
  TwoButtonContainerHeaderView *v54;
  ContainerHeaderView *v55;
  void *v56;
  void *v57;
  ContainerHeaderView *v58;
  ContainerHeaderView *titleHeaderView;
  ContainerHeaderView *v60;
  void *v61;
  void *v62;
  UIView *v63;
  UIView *titleContentView;
  UIImageView *v65;
  UIImageView *titlePublisherLogoImageView;
  UITapGestureRecognizer *v67;
  UITapGestureRecognizer *titlePublisherLogoTapGesture;
  UILabel *v69;
  UILabel *titleSingleLineLabel;
  UIView *v71;
  UIView *tableViewBackgroundView;
  UIView *v73;
  UIView *tableViewBlockView;
  UIView *v75;
  UIView *tableViewBlockBlackView;
  void *v77;
  void *v78;
  _QWORD v79[2];

  -[CuratedCollectionHeaderView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[CuratedCollectionHeaderView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", _UISheetCornerRadius);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView layer](self, "layer"));
  objc_msgSend(v3, "setMaskedCorners:", 3);

  v4 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  blockView = self->_blockView;
  self->_blockView = v8;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_blockView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](self->_blockView, "setClipsToBounds:", 1);
  -[CuratedCollectionHeaderView addSubview:](self, "addSubview:", self->_blockView);
  v10 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  blockBlackView = self->_blockBlackView;
  self->_blockBlackView = v10;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_blockBlackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "colorWithAlphaComponent:", 0.3));
  -[UIView setBackgroundColor:](self->_blockBlackView, "setBackgroundColor:", v13);

  -[UIView addSubview:](self->_blockView, "addSubview:", self->_blockBlackView);
  v14 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  blockContentView = self->_blockContentView;
  self->_blockContentView = v14;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_blockContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setUserInteractionEnabled:](self->_blockContentView, "setUserInteractionEnabled:", 1);
  -[UIView setAccessibilityIdentifier:](self->_blockContentView, "setAccessibilityIdentifier:", CFSTR("BlockContentView"));
  -[UIView addSubview:](self->_blockView, "addSubview:", self->_blockContentView);
  v16 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "brickTapped");
  blockContentViewTapGestureRecognizer = self->_blockContentViewTapGestureRecognizer;
  self->_blockContentViewTapGestureRecognizer = v16;

  -[UIView addGestureRecognizer:](self->_blockContentView, "addGestureRecognizer:", self->_blockContentViewTapGestureRecognizer);
  v18 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  heroImageView = self->_heroImageView;
  self->_heroImageView = v18;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_heroImageView, "setContentMode:", 2);
  -[UIImageView setClipsToBounds:](self->_heroImageView, "setClipsToBounds:", 1);
  -[UIImageView setAccessibilityIdentifier:](self->_heroImageView, "setAccessibilityIdentifier:", CFSTR("HeroImageView"));
  -[UIView addSubview:](self->_blockContentView, "addSubview:", self->_heroImageView);
  v20 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  heroJoeGradientView = self->_heroJoeGradientView;
  self->_heroJoeGradientView = v20;

  -[GradientView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroJoeGradientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_heroJoeGradientView, "gradientLayer"));
  objc_msgSend(v22, "setStartPoint:", 0.5, 0.0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_heroJoeGradientView, "gradientLayer"));
  objc_msgSend(v23, "setEndPoint:", 0.5, 1.0);

  -[UIView addSubview:](self->_blockContentView, "addSubview:", self->_heroJoeGradientView);
  v24 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  heroBlackGradientView = self->_heroBlackGradientView;
  self->_heroBlackGradientView = v24;

  -[GradientView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroBlackGradientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_heroBlackGradientView, "gradientLayer"));
  objc_msgSend(v26, "setStartPoint:", 0.5, 0.0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_heroBlackGradientView, "gradientLayer"));
  objc_msgSend(v27, "setEndPoint:", 0.5, 1.0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "colorWithAlphaComponent:", 0.0)));
  v79[0] = objc_msgSend(v29, "CGColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "colorWithAlphaComponent:", 0.3)));
  v79[1] = objc_msgSend(v31, "CGColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 2));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_heroBlackGradientView, "gradientLayer"));
  objc_msgSend(v33, "setColors:", v32);

  -[GradientView addSubview:](self->_heroJoeGradientView, "addSubview:", self->_heroBlackGradientView);
  v34 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  heroImageJoeView = self->_heroImageJoeView;
  self->_heroImageJoeView = v34;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroImageJoeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_blockContentView, "addSubview:", self->_heroImageJoeView);
  v36 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  heroImageBlackView = self->_heroImageBlackView;
  self->_heroImageBlackView = v36;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroImageBlackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "colorWithAlphaComponent:", 0.3));
  -[UIView setBackgroundColor:](self->_heroImageBlackView, "setBackgroundColor:", v39);

  -[UIView addSubview:](self->_heroImageJoeView, "addSubview:", self->_heroImageBlackView);
  v40 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView _setupPublisherLogoImageView](self, "_setupPublisherLogoImageView"));
  publisherLogoImageView = self->_publisherLogoImageView;
  self->_publisherLogoImageView = v40;

  -[UIImageView setAccessibilityIdentifier:](self->_publisherLogoImageView, "setAccessibilityIdentifier:", CFSTR("PublisherLogoImageView"));
  -[UIView addSubview:](self->_blockContentView, "addSubview:", self->_publisherLogoImageView);
  v42 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "publisherLogoImageViewTapped");
  publisherLogoTapGesture = self->_publisherLogoTapGesture;
  self->_publisherLogoTapGesture = v42;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_publisherLogoTapGesture, "setNumberOfTapsRequired:", 1);
  -[UIImageView addGestureRecognizer:](self->_publisherLogoImageView, "addGestureRecognizer:", self->_publisherLogoTapGesture);
  v44 = (UILabel *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView _setupTitleLabel](self, "_setupTitleLabel"));
  titleMultiLineLabel = self->_titleMultiLineLabel;
  self->_titleMultiLineLabel = v44;

  -[UILabel setNumberOfLines:](self->_titleMultiLineLabel, "setNumberOfLines:", 3);
  -[UIView addSubview:](self->_blockContentView, "addSubview:", self->_titleMultiLineLabel);
  v46 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleContainerView = self->_titleContainerView;
  self->_titleContainerView = v46;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_titleContainerView, "setAccessibilityIdentifier:", CFSTR("TitleContainerView"));
  -[UIView addSubview:](self->_blockContentView, "addSubview:", self->_titleContainerView);
  v48 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleJoeView = self->_titleJoeView;
  self->_titleJoeView = v48;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleJoeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAlpha:](self->_titleJoeView, "setAlpha:", 0.0);
  -[UIView addSubview:](self->_titleContainerView, "addSubview:", self->_titleJoeView);
  v50 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleBlackView = self->_titleBlackView;
  self->_titleBlackView = v50;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleBlackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "colorWithAlphaComponent:", 0.3));
  -[UIView setBackgroundColor:](self->_titleBlackView, "setBackgroundColor:", v53);

  -[UIView addSubview:](self->_titleJoeView, "addSubview:", self->_titleBlackView);
  if (sub_1002A8AA0(self) == 5)
  {
    v54 = [TwoButtonContainerHeaderView alloc];
    v55 = (ContainerHeaderView *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView delegate](self, "delegate"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "menuForQuickActionButton"));
    v58 = -[TwoButtonContainerHeaderView initWithAdditionalCardButtonType:tintColor:buttonMenu:](v54, "initWithAdditionalCardButtonType:tintColor:buttonMenu:", 2, v55, v57);
    titleHeaderView = self->_titleHeaderView;
    self->_titleHeaderView = v58;

  }
  else
  {
    v60 = -[ContainerHeaderView initWithCardButtonType:cardButtonBlurred:]([ContainerHeaderView alloc], "initWithCardButtonType:cardButtonBlurred:", 0, 1);
    v55 = self->_titleHeaderView;
    self->_titleHeaderView = v60;
  }

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView _headerTapGesture](self->_titleHeaderView, "_headerTapGesture"));
  objc_msgSend(v61, "setCancelsTouchesInView:", 0);

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView delegate](self, "delegate"));
  -[ContainerHeaderView setDelegate:](self->_titleHeaderView, "setDelegate:", v62);

  -[ContainerHeaderView setHairLineAlpha:](self->_titleHeaderView, "setHairLineAlpha:", 0.0);
  -[UIView addSubview:](self->_blockContentView, "addSubview:", self->_titleHeaderView);
  v63 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleContentView = self->_titleContentView;
  self->_titleContentView = v63;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_titleContentView, "setAccessibilityIdentifier:", CFSTR("TitleContentView"));
  -[ContainerHeaderView setTitleView:](self->_titleHeaderView, "setTitleView:", self->_titleContentView);
  v65 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView _setupPublisherLogoImageView](self, "_setupPublisherLogoImageView"));
  titlePublisherLogoImageView = self->_titlePublisherLogoImageView;
  self->_titlePublisherLogoImageView = v65;

  -[UIImageView setAccessibilityIdentifier:](self->_titlePublisherLogoImageView, "setAccessibilityIdentifier:", CFSTR("TitlePublisherLogoImageView"));
  -[UIView addSubview:](self->_titleContentView, "addSubview:", self->_titlePublisherLogoImageView);
  v67 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "publisherLogoImageViewTapped");
  titlePublisherLogoTapGesture = self->_titlePublisherLogoTapGesture;
  self->_titlePublisherLogoTapGesture = v67;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_titlePublisherLogoTapGesture, "setNumberOfTapsRequired:", 1);
  -[UIImageView addGestureRecognizer:](self->_titlePublisherLogoImageView, "addGestureRecognizer:", self->_titlePublisherLogoTapGesture);
  v69 = (UILabel *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView _setupTitleLabel](self, "_setupTitleLabel"));
  titleSingleLineLabel = self->_titleSingleLineLabel;
  self->_titleSingleLineLabel = v69;

  -[UILabel setNumberOfLines:](self->_titleSingleLineLabel, "setNumberOfLines:", 1);
  -[UIView addSubview:](self->_titleContentView, "addSubview:", self->_titleSingleLineLabel);
  v71 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  tableViewBackgroundView = self->_tableViewBackgroundView;
  self->_tableViewBackgroundView = v71;

  v73 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  tableViewBlockView = self->_tableViewBlockView;
  self->_tableViewBlockView = v73;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableViewBlockView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](self->_tableViewBlockView, "setClipsToBounds:", 1);
  -[UIView setAccessibilityIdentifier:](self->_tableViewBlockView, "setAccessibilityIdentifier:", CFSTR("TableViewBlockView"));
  -[UIView addSubview:](self->_tableViewBackgroundView, "addSubview:", self->_tableViewBlockView);
  v75 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  tableViewBlockBlackView = self->_tableViewBlockBlackView;
  self->_tableViewBlockBlackView = v75;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableViewBlockBlackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "colorWithAlphaComponent:", 0.3));
  -[UIView setBackgroundColor:](self->_tableViewBlockBlackView, "setBackgroundColor:", v78);

  -[UIView addSubview:](self->_tableViewBlockView, "addSubview:", self->_tableViewBlockBlackView);
}

- (id)_setupPublisherLogoImageView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView curatedCollection](self, "curatedCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publisherAttribution"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  objc_msgSend(v3, "setAccessibilityLabel:", v6);

  objc_msgSend(v3, "setAccessibilityIgnoresInvertColors:", 1);
  objc_msgSend(v3, "setContentMode:", 1);
  return v3;
}

- (id)_setupTitleLabel
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v2, "setTextColor:", v3);

  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  return v2;
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *blockViewTopConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *blockViewLeadingConstraint;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *blockViewTrailingConstraint;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *blockViewHeightConstraint;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *blockContentViewHeightConstraint;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *heroImageViewWidthConstraint;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *titleMultiLineLabelBottomConstraint;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *tableViewBlockViewTopConstraint;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *tableViewBlockViewLeadingConstraint;
  void *v36;
  void *v37;
  NSLayoutConstraint *v38;
  NSLayoutConstraint *tableViewBlockViewTrailingConstraint;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *tableViewBlockViewHeightConstraint;
  double v43;
  double v44;
  double v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *v48;
  double v49;
  NSLayoutConstraint *v50;
  double v51;
  void *v52;
  uint64_t v53;
  double v54;
  NSLayoutConstraint *v55;
  NSLayoutConstraint *v56;
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
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  _QWORD v231[69];

  v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_blockView, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView topAnchor](self, "topAnchor"));
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  blockViewTopConstraint = self->_blockViewTopConstraint;
  self->_blockViewTopConstraint = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_blockView, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView leadingAnchor](self, "leadingAnchor"));
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  blockViewLeadingConstraint = self->_blockViewLeadingConstraint;
  self->_blockViewLeadingConstraint = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_blockView, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView trailingAnchor](self, "trailingAnchor"));
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  blockViewTrailingConstraint = self->_blockViewTrailingConstraint;
  self->_blockViewTrailingConstraint = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_blockView, "heightAnchor"));
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 0.0));
  blockViewHeightConstraint = self->_blockViewHeightConstraint;
  self->_blockViewHeightConstraint = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_blockContentView, "heightAnchor"));
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 0.0));
  blockContentViewHeightConstraint = self->_blockContentViewHeightConstraint;
  self->_blockContentViewHeightConstraint = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_heroImageView, "widthAnchor"));
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", 0.0));
  heroImageViewWidthConstraint = self->_heroImageViewWidthConstraint;
  self->_heroImageViewWidthConstraint = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleMultiLineLabel, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_blockContentView, "bottomAnchor"));
  v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  titleMultiLineLabelBottomConstraint = self->_titleMultiLineLabelBottomConstraint;
  self->_titleMultiLineLabelBottomConstraint = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_tableViewBlockView, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_tableViewBackgroundView, "topAnchor"));
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
  tableViewBlockViewTopConstraint = self->_tableViewBlockViewTopConstraint;
  self->_tableViewBlockViewTopConstraint = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_tableViewBlockView, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_tableViewBackgroundView, "leadingAnchor"));
  v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
  tableViewBlockViewLeadingConstraint = self->_tableViewBlockViewLeadingConstraint;
  self->_tableViewBlockViewLeadingConstraint = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_tableViewBlockView, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_tableViewBackgroundView, "trailingAnchor"));
  v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
  tableViewBlockViewTrailingConstraint = self->_tableViewBlockViewTrailingConstraint;
  self->_tableViewBlockViewTrailingConstraint = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_tableViewBlockView, "heightAnchor"));
  v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToConstant:", 0.0));
  tableViewBlockViewHeightConstraint = self->_tableViewBlockViewHeightConstraint;
  self->_tableViewBlockViewHeightConstraint = v41;

  LODWORD(v43) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_tableViewBlockViewTopConstraint, "setPriority:", v43);
  LODWORD(v44) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_tableViewBlockViewLeadingConstraint, "setPriority:", v44);
  LODWORD(v45) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_tableViewBlockViewTrailingConstraint, "setPriority:", v45);
  v46 = self->_blockViewLeadingConstraint;
  v231[0] = self->_blockViewTopConstraint;
  v231[1] = v46;
  v47 = self->_blockViewHeightConstraint;
  v231[2] = self->_blockViewTrailingConstraint;
  v231[3] = v47;
  v231[4] = self->_blockContentViewHeightConstraint;
  v229 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_blockBlackView, "topAnchor"));
  v228 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_blockView, "topAnchor"));
  v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v229, "constraintEqualToAnchor:", v228));
  v231[5] = v227;
  v226 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_blockBlackView, "leadingAnchor"));
  v225 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_blockView, "leadingAnchor"));
  v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "constraintEqualToAnchor:", v225));
  v231[6] = v224;
  v223 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_blockBlackView, "trailingAnchor"));
  v222 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_blockView, "trailingAnchor"));
  v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "constraintEqualToAnchor:", v222));
  v231[7] = v221;
  v220 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_blockBlackView, "bottomAnchor"));
  v219 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_blockView, "bottomAnchor"));
  v218 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v220, "constraintEqualToAnchor:", v219));
  v231[8] = v218;
  v217 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_blockContentView, "topAnchor"));
  v216 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_blockView, "topAnchor"));
  v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "constraintEqualToAnchor:", v216));
  v231[9] = v215;
  v214 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_blockContentView, "leadingAnchor"));
  v213 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_blockView, "leadingAnchor"));
  v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v214, "constraintEqualToAnchor:", v213));
  v231[10] = v212;
  v211 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_blockContentView, "trailingAnchor"));
  v210 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_blockView, "trailingAnchor"));
  v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "constraintEqualToAnchor:", v210));
  v231[11] = v209;
  v208 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_blockContentView, "bottomAnchor"));
  v207 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView bottomAnchor](self, "bottomAnchor"));
  v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "constraintEqualToAnchor:", v207));
  v231[12] = v206;
  v205 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_heroImageView, "widthAnchor"));
  v204 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_heroImageView, "heightAnchor"));
  v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "constraintEqualToAnchor:multiplier:", v204, 1.0));
  v231[13] = v203;
  v202 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_heroImageView, "centerXAnchor"));
  v201 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_blockContentView, "centerXAnchor"));
  v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "constraintEqualToAnchor:", v201));
  v231[14] = v200;
  v199 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_heroImageView, "centerYAnchor"));
  v198 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_blockContentView, "centerYAnchor"));
  v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "constraintEqualToAnchor:", v198));
  v48 = self->_heroImageViewWidthConstraint;
  v231[15] = v197;
  v231[16] = v48;
  v196 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView leadingAnchor](self->_heroJoeGradientView, "leadingAnchor"));
  v195 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_blockContentView, "leadingAnchor"));
  v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "constraintEqualToAnchor:", v195));
  v231[17] = v194;
  v193 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView trailingAnchor](self->_heroJoeGradientView, "trailingAnchor"));
  v192 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_blockContentView, "trailingAnchor"));
  v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "constraintEqualToAnchor:", v192));
  v231[18] = v191;
  v190 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView bottomAnchor](self->_heroJoeGradientView, "bottomAnchor"));
  v189 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_blockContentView, "bottomAnchor"));
  v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "constraintEqualToAnchor:constant:", v189, 1.0));
  v231[19] = v188;
  v187 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView heightAnchor](self->_heroJoeGradientView, "heightAnchor"));
  v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "constraintEqualToConstant:", 104.0));
  v231[20] = v186;
  v185 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView topAnchor](self->_heroBlackGradientView, "topAnchor"));
  v184 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView topAnchor](self->_heroJoeGradientView, "topAnchor"));
  v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "constraintEqualToAnchor:", v184));
  v231[21] = v183;
  v182 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView leadingAnchor](self->_heroBlackGradientView, "leadingAnchor"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView leadingAnchor](self->_heroJoeGradientView, "leadingAnchor"));
  v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "constraintEqualToAnchor:", v181));
  v231[22] = v180;
  v179 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView trailingAnchor](self->_heroBlackGradientView, "trailingAnchor"));
  v178 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView trailingAnchor](self->_heroJoeGradientView, "trailingAnchor"));
  v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "constraintEqualToAnchor:", v178));
  v231[23] = v177;
  v176 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView bottomAnchor](self->_heroBlackGradientView, "bottomAnchor"));
  v175 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView bottomAnchor](self->_heroJoeGradientView, "bottomAnchor"));
  v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "constraintEqualToAnchor:", v175));
  v231[24] = v174;
  v173 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_heroImageJoeView, "topAnchor"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_blockContentView, "topAnchor"));
  v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "constraintEqualToAnchor:", v172));
  v231[25] = v171;
  v170 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_heroImageJoeView, "leadingAnchor"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_blockContentView, "leadingAnchor"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "constraintEqualToAnchor:", v169));
  v231[26] = v168;
  v167 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_heroImageJoeView, "trailingAnchor"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_blockContentView, "trailingAnchor"));
  v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "constraintEqualToAnchor:", v166));
  v231[27] = v165;
  v164 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_heroImageJoeView, "bottomAnchor"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_blockContentView, "bottomAnchor"));
  v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "constraintEqualToAnchor:", v163));
  v231[28] = v162;
  v161 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_heroImageBlackView, "topAnchor"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_heroImageJoeView, "topAnchor"));
  v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "constraintEqualToAnchor:", v160));
  v231[29] = v159;
  v158 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_heroImageBlackView, "leadingAnchor"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_heroImageJoeView, "leadingAnchor"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "constraintEqualToAnchor:", v157));
  v231[30] = v155;
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_heroImageBlackView, "trailingAnchor"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_heroImageJoeView, "trailingAnchor"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "constraintEqualToAnchor:", v153));
  v231[31] = v152;
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_heroImageBlackView, "bottomAnchor"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_heroImageJoeView, "bottomAnchor"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "constraintEqualToAnchor:", v150));
  v231[32] = v149;
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_publisherLogoImageView, "leadingAnchor"));
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_blockContentView, "leadingAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "constraintEqualToAnchor:constant:", v147, 16.0));
  v231[33] = v146;
  v145 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_publisherLogoImageView, "heightAnchor"));
  -[CuratedCollectionHeaderView _publisherLogoSize](self, "_publisherLogoSize");
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToConstant:", v49));
  v231[34] = v144;
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleMultiLineLabel, "topAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_publisherLogoImageView, "bottomAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "constraintEqualToAnchor:constant:", v142, 4.0));
  v231[35] = v141;
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleMultiLineLabel, "leadingAnchor"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_blockContentView, "leadingAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "constraintEqualToAnchor:constant:", v139, 16.0));
  v231[36] = v138;
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleMultiLineLabel, "trailingAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_blockContentView, "trailingAnchor"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintEqualToAnchor:constant:", v136, -16.0));
  v50 = self->_titleMultiLineLabelBottomConstraint;
  v231[37] = v135;
  v231[38] = v50;
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_titleContainerView, "topAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_blockContentView, "topAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToAnchor:", v133));
  v231[39] = v132;
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_titleContainerView, "leadingAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_blockContentView, "leadingAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v130));
  v231[40] = v129;
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_titleContainerView, "trailingAnchor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_blockContentView, "trailingAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:", v127));
  v231[41] = v126;
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_titleJoeView, "topAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_titleContainerView, "topAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "constraintEqualToAnchor:", v124));
  v231[42] = v123;
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_titleJoeView, "leadingAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_titleContainerView, "leadingAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:", v121));
  v231[43] = v120;
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_titleJoeView, "trailingAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_titleContainerView, "trailingAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v118));
  v231[44] = v117;
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_titleJoeView, "bottomAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_titleContainerView, "bottomAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:", v115));
  v231[45] = v114;
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_titleBlackView, "topAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_titleJoeView, "topAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v112));
  v231[46] = v111;
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_titleBlackView, "leadingAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_titleJoeView, "leadingAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v109));
  v231[47] = v108;
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_titleBlackView, "trailingAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_titleJoeView, "trailingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:", v106));
  v231[48] = v105;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_titleBlackView, "bottomAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_titleJoeView, "bottomAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v103));
  v231[49] = v102;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_titleContainerView, "safeAreaLayoutGuide"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "topAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v99));
  v231[50] = v98;
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_titleContainerView, "leadingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v96));
  v231[51] = v95;
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_titleContainerView, "trailingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v93));
  v231[52] = v92;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_titleContainerView, "bottomAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v90));
  v231[53] = v89;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_titlePublisherLogoImageView, "topAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_titleContentView, "topAnchor"));
  sub_1002A8AA0(self);
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:constant:", v87, 10.0));
  v231[54] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_titlePublisherLogoImageView, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_titleContentView, "leadingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, 16.0));
  v231[55] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_titlePublisherLogoImageView, "heightAnchor"));
  -[CuratedCollectionHeaderView _publisherLogoSize](self, "_publisherLogoSize");
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToConstant:", v51));
  v231[56] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleSingleLineLabel, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_titlePublisherLogoImageView, "bottomAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, 4.0));
  v231[57] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleSingleLineLabel, "leadingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_titleContentView, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, 16.0));
  v231[58] = v75;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleSingleLineLabel, "trailingAnchor"));
  v74 = v52;
  v53 = objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_titleContentView, "trailingAnchor"));
  v73 = (void *)v53;
  if (sub_1002A8AA0(self) == 5)
    v54 = -16.0;
  else
    v54 = 0.0;
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, v54));
  v231[59] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleSingleLineLabel, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_titleContentView, "bottomAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, -12.0));
  v55 = self->_tableViewBlockViewTopConstraint;
  v231[60] = v69;
  v231[61] = v55;
  v56 = self->_tableViewBlockViewTrailingConstraint;
  v231[62] = self->_tableViewBlockViewLeadingConstraint;
  v231[63] = v56;
  v231[64] = self->_tableViewBlockViewHeightConstraint;
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_tableViewBlockBlackView, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_tableViewBlockView, "topAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintEqualToAnchor:", v68));
  v231[65] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_tableViewBlockBlackView, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_tableViewBlockView, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v57));
  v231[66] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_tableViewBlockBlackView, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_tableViewBlockView, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v60));
  v231[67] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_tableViewBlockBlackView, "bottomAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_tableViewBlockView, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v63));
  v231[68] = v64;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v231, 69));
  objc_msgSend(v230, "addObjectsFromArray:", v65);

  -[CuratedCollectionHeaderView _updateConstraintConstants](self, "_updateConstraintConstants");
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v230);

}

- (void)_updateConstraintConstants
{
  double v3;
  double v4;
  double v5;
  double tableViewContentOffset;
  double v7;
  double v8;

  if (self->_layout)
  {
    -[CuratedCollectionHeaderView _minScrolledHeight](self, "_minScrolledHeight");
    v4 = v3;
    -[CuratedCollectionHeaderView _fullHeight](self, "_fullHeight");
    tableViewContentOffset = self->_tableViewContentOffset;
    if (self->_tableViewSubheaderContentHeight - tableViewContentOffset <= v4)
      v7 = v4;
    else
      v7 = self->_tableViewSubheaderContentHeight - tableViewContentOffset;
    if (v5 > -tableViewContentOffset)
      v5 = -tableViewContentOffset;
    v8 = 0.0;
    if (v5 > v4)
      v4 = v5;
  }
  else
  {
    v8 = 30.0;
    v7 = 112.0;
    v4 = 112.0;
  }
  -[NSLayoutConstraint setConstant:](self->_blockViewTopConstraint, "setConstant:", 0.0);
  -[NSLayoutConstraint setConstant:](self->_blockViewLeadingConstraint, "setConstant:", 0.0);
  -[NSLayoutConstraint setConstant:](self->_blockViewTrailingConstraint, "setConstant:", 0.0);
  -[NSLayoutConstraint setConstant:](self->_blockViewHeightConstraint, "setConstant:", v7);
  -[NSLayoutConstraint setConstant:](self->_blockContentViewHeightConstraint, "setConstant:", v4);
  -[NSLayoutConstraint setConstant:](self->_titleMultiLineLabelBottomConstraint, "setConstant:", -v8);
  -[NSLayoutConstraint setConstant:](self->_tableViewBlockViewTopConstraint, "setConstant:", 0.0);
  -[NSLayoutConstraint setConstant:](self->_tableViewBlockViewLeadingConstraint, "setConstant:", 0.0);
  -[NSLayoutConstraint setConstant:](self->_tableViewBlockViewTrailingConstraint, "setConstant:", -0.0);
  -[NSLayoutConstraint setConstant:](self->_tableViewBlockViewHeightConstraint, "setConstant:", v7);
}

- (void)_updateHeaderStyling
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t layout;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  BOOL v13;

  -[CuratedCollectionHeaderView _heroImageGradientAlphaForLayout:transitionFraction:](self, "_heroImageGradientAlphaForLayout:transitionFraction:", self->_layout, self->_transitionFraction);
  -[GradientView setAlpha:](self->_heroJoeGradientView, "setAlpha:");
  -[CuratedCollectionHeaderView _heroImageJoeAlphaForLayout:transitionFraction:](self, "_heroImageJoeAlphaForLayout:transitionFraction:", self->_layout, self->_transitionFraction);
  -[UIView setAlpha:](self->_heroImageJoeView, "setAlpha:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system22Bold](UIFont, "system22Bold"));
  -[UILabel setFont:](self->_titleSingleLineLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system28Bold](UIFont, "system28Bold"));
  -[UILabel setFont:](self->_titleMultiLineLabel, "setFont:", v4);

  -[CuratedCollectionHeaderView _scrollTransitionFraction](self, "_scrollTransitionFraction");
  v6 = v5;
  v7 = 1.0 - v5;
  -[UIImageView setAlpha:](self->_publisherLogoImageView, "setAlpha:", 1.0 - v5);
  -[UILabel setAlpha:](self->_titleMultiLineLabel, "setAlpha:", v7);
  -[UIView setAlpha:](self->_titleJoeView, "setAlpha:", v6);
  -[UIImageView alpha](self->_titlePublisherLogoImageView, "alpha");
  if ((v6 == 1.0) == (v8 != 1.0))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100696424;
    v12[3] = &unk_1011ACE58;
    v12[4] = self;
    v13 = v6 == 1.0;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v12, 0.2);
  }
  layout = self->_layout;
  v10 = 1;
  if ((unint64_t)(layout - 1) < 3)
  {
    v11 = 0;
LABEL_8:
    -[UITapGestureRecognizer setEnabled:](self->_publisherLogoTapGesture, "setEnabled:", v11);
    -[UITapGestureRecognizer setEnabled:](self->_titlePublisherLogoTapGesture, "setEnabled:", v11);
    -[UITapGestureRecognizer setEnabled:](self->_blockContentViewTapGestureRecognizer, "setEnabled:", v10);
    v10 = 3;
    goto LABEL_9;
  }
  if (!layout)
  {
LABEL_9:
    -[UILabel setNumberOfLines:](self->_titleMultiLineLabel, "setNumberOfLines:", v10);
    goto LABEL_10;
  }
  if (layout == 4)
  {
    v10 = 0;
    v11 = 1;
    goto LABEL_8;
  }
LABEL_10:
  -[CuratedCollectionHeaderView _updateConstraintConstants](self, "_updateConstraintConstants");
}

- (double)_heroImageGradientAlphaForLayout:(int64_t)a3 transitionFraction:(double)a4
{
  int64_t layout;
  double v5;

  layout = self->_layout;
  if ((unint64_t)(layout - 2) < 3)
    return 1.0;
  v5 = 0.0;
  if (layout == 1)
    return a4;
  return v5;
}

- (double)_heroImageJoeAlphaForLayout:(int64_t)a3 transitionFraction:(double)a4
{
  int64_t layout;
  double v5;
  double v6;

  layout = self->_layout;
  if ((unint64_t)(layout - 2) < 3)
    return 0.0;
  v5 = 0.5;
  if (layout == 1)
  {
    v6 = fmax(1.0 - a4, 0.0);
    if (v6 >= 1.0)
      return 0.5;
    else
      return v6 * 0.5;
  }
  return v5;
}

- (id)_titleFontForLayout:(int64_t)a3 transitionFraction:(double)a4
{
  void *v4;
  uint64_t v5;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  if ((unint64_t)a3 < 3)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIFont system22Bold](UIFont, "system22Bold", a4));
LABEL_3:
    v4 = (void *)v5;
    return v4;
  }
  if (a3 == 3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system22Bold](UIFont, "system22Bold"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system28AdaptiveBoldShort](UIFont, "system28AdaptiveBoldShort"));
    objc_msgSend(v8, "pointSize");
    v11 = v10;
    objc_msgSend(v9, "pointSize");
    -[CuratedCollectionHeaderView _valueForTransitionFraction:startValue:endValue:](self, "_valueForTransitionFraction:startValue:endValue:", a4, v11, v12);
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontDescriptor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v15, v14));

    return v4;
  }
  if (a3 == 4)
  {
    if (sub_1002A8AA0(self) == 5)
      v5 = objc_claimAutoreleasedReturnValue(+[UIFont system22AdaptiveCondensedBold](UIFont, "system22AdaptiveCondensedBold"));
    else
      v5 = objc_claimAutoreleasedReturnValue(+[UIFont system28AdaptiveBoldShort](UIFont, "system28AdaptiveBoldShort"));
    goto LABEL_3;
  }
  return v4;
}

- (CGSize)_publisherLogoSize
{
  uint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = sub_1002A8AA0(self);
  v3 = 180.0;
  if (v2 == 5)
    v3 = 144.0;
  v4 = 40.0;
  if (v2 == 5)
    v4 = 32.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_valueForTransitionFraction:(double)a3 startValue:(double)a4 endValue:(double)a5
{
  return a4 + a3 * (a5 - a4);
}

- (double)_scrollTransitionFraction
{
  double v2;
  double v4;
  double tableViewContentOffset;

  v2 = 0.0;
  if (self->_layout == 4)
  {
    -[CuratedCollectionHeaderView _minScrolledHeight](self, "_minScrolledHeight");
    tableViewContentOffset = self->_tableViewContentOffset;
    if (tableViewContentOffset >= -104.0 - v4)
    {
      v2 = 1.0;
      if (tableViewContentOffset < -v4)
        return fmin(fmax((v4 + tableViewContentOffset + 104.0) / 104.0, 0.0), 1.0);
    }
  }
  return v2;
}

- (double)_minScrolledHeight
{
  double v3;
  double v4;
  double v5;

  -[ContainerHeaderView systemLayoutSizeFittingSize:](self->_titleHeaderView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v4 = v3;
  -[CuratedCollectionHeaderView safeAreaInsets](self, "safeAreaInsets");
  return v4 + v5;
}

- (void)setCuratedCollection:(id)a3
{
  GEOPlaceCollection *v5;
  GEOPlaceCollection *v6;

  v5 = (GEOPlaceCollection *)a3;
  if (self->_curatedCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_curatedCollection, a3);
    -[CuratedCollectionHeaderView _updateHeaderContent](self, "_updateHeaderContent");
    v5 = v6;
  }

}

- (void)_updateHeaderContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *logoWidthConstraint;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *titleLogoWidthConstraint;
  id v33;
  NSObject *v34;
  unsigned int v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t buf[4];
  unsigned int v61;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView curatedCollection](self, "curatedCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionLongTitle"));
  v5 = v4;
  if (v4)
  {
    v57 = v4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView curatedCollection](self, "curatedCollection"));
    v57 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionTitle"));

  }
  -[UILabel setText:](self->_titleSingleLineLabel, "setText:", v57);
  -[UILabel setText:](self->_titleMultiLineLabel, "setText:", v57);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v7, "screenScale");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection publisherAttribution](self->_curatedCollection, "publisherAttribution"));
  if (objc_msgSend(v10, "logoWithoutPaddingIdentifier"))
    v11 = objc_msgSend(v10, "logoWithoutPaddingIdentifier");
  else
    v11 = objc_msgSend(v10, "logoIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForIconID:contentScale:sizeGroup:nightMode:](MKIconManager, "imageForIconID:contentScale:sizeGroup:nightMode:", v11, 1, 0, v9));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_publisherLogoImageView, "image"));

    if (!v13)
    {
      -[UIImageView setImage:](self->_publisherLogoImageView, "setImage:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_publisherLogoImageView, "widthAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_publisherLogoImageView, "heightAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_publisherLogoImageView, "image"));
      objc_msgSend(v16, "size");
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_publisherLogoImageView, "image"));
      objc_msgSend(v19, "size");
      v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:multiplier:", v15, v18 / v20));
      logoWidthConstraint = self->_logoWidthConstraint;
      self->_logoWidthConstraint = v21;

      -[NSLayoutConstraint setActive:](self->_logoWidthConstraint, "setActive:", 1);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_titlePublisherLogoImageView, "image"));

    if (!v23)
    {
      -[UIImageView setImage:](self->_titlePublisherLogoImageView, "setImage:", v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_titlePublisherLogoImageView, "widthAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_titlePublisherLogoImageView, "heightAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_titlePublisherLogoImageView, "image"));
      objc_msgSend(v26, "size");
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_titlePublisherLogoImageView, "image"));
      objc_msgSend(v29, "size");
      v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:multiplier:", v25, v28 / v30));
      titleLogoWidthConstraint = self->_titleLogoWidthConstraint;
      self->_titleLogoWidthConstraint = v31;

      -[NSLayoutConstraint setActive:](self->_titleLogoWidthConstraint, "setActive:", 1);
    }
  }
  else
  {
    v33 = sub_1004316CC();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      if (objc_msgSend(v10, "logoWithoutPaddingIdentifier"))
        v35 = objc_msgSend(v10, "logoWithoutPaddingIdentifier");
      else
        v35 = objc_msgSend(v10, "logoIdentifier");
      *(_DWORD *)buf = 67109120;
      v61 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "PAM and Icon-Pack are not in sync. Icon Pack is missing icon for ID: %d", buf, 8u);
    }

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance"));
  v37 = objc_msgSend(v36, "isJoeColorManuallyCuratedForCuratedCollection:", self->_curatedCollection);

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "colorWithAlphaComponent:", 0.0));
    -[UIView setBackgroundColor:](self->_blockBlackView, "setBackgroundColor:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "colorWithAlphaComponent:", 0.0)));
    v59[0] = objc_msgSend(v41, "CGColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "colorWithAlphaComponent:", 0.0)));
    v59[1] = objc_msgSend(v43, "CGColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 2));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_heroBlackGradientView, "gradientLayer"));
    objc_msgSend(v45, "setColors:", v44);

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "colorWithAlphaComponent:", 0.0));
    -[UIView setBackgroundColor:](self->_heroImageBlackView, "setBackgroundColor:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "colorWithAlphaComponent:", 0.0));
    -[UIView setBackgroundColor:](self->_titleBlackView, "setBackgroundColor:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "colorWithAlphaComponent:", 0.0));
    -[UIView setBackgroundColor:](self->_tableViewBlockBlackView, "setBackgroundColor:", v51);

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView _joeColor](self, "_joeColor"));
  -[UIView setBackgroundColor:](self->_blockView, "setBackgroundColor:", v52);
  v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "colorWithAlphaComponent:", 0.0)));
  v58[0] = objc_msgSend(v53, "CGColor");
  v54 = objc_retainAutorelease(v52);
  v58[1] = objc_msgSend(v54, "CGColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 2));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_heroJoeGradientView, "gradientLayer"));
  objc_msgSend(v56, "setColors:", v55);

  -[UIView setBackgroundColor:](self->_heroImageJoeView, "setBackgroundColor:", v54);
  -[UIView setBackgroundColor:](self->_titleJoeView, "setBackgroundColor:", v54);
  -[UIView setBackgroundColor:](self->_tableViewBlockView, "setBackgroundColor:", v54);
  self->_needsImageReload = 1;
  -[CuratedCollectionHeaderView _loadImageIfNeeded](self, "_loadImageIfNeeded");

}

- (id)_joeColor
{
  void *v3;
  void *v4;

  if (!self->_curatedCollection
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance")), v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "joeColorForCuratedCollection:", self->_curatedCollection)), v3, !v4))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  }
  return v4;
}

- (void)_loadImageIfNeeded
{
  void *v3;
  _BOOL4 needsImageReload;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  Block_layout *v15;
  id v16;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView curatedCollection](self, "curatedCollection"));
  if (v3)
  {
    needsImageReload = self->_needsImageReload;

    if (needsImageReload)
    {
      self->_needsImageReload = 0;
      -[NSLayoutConstraint constant](self->_heroImageViewWidthConstraint, "constant");
      if (v5 != 462.0)
        -[NSLayoutConstraint setConstant:](self->_heroImageViewWidthConstraint, "setConstant:");
      -[CuratedCollectionHeaderView _fullHeight](self, "_fullHeight");
      v7 = v6;
      -[CuratedCollectionHeaderView _fullHeight](self, "_fullHeight");
      v9 = v8;
      objc_initWeak(&location, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView curatedCollection](self, "curatedCollection"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView traitCollection](self, "traitCollection"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preferredContentSizeCategory"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100697100;
      v14[3] = &unk_1011BFD90;
      objc_copyWeak(&v16, &location);
      v15 = &stru_1011BFD68;
      objc_msgSend(v10, "loadGradientCoverImageWithCuratedCollection:size:contentSizeCategory:usingImageSource:completion:", v11, v13, 7, v14, v7, v9);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (double)_fullHeight
{
  return dbl_100E39D10[sub_1002A8AA0(self) == 5];
}

- (double)unscrolledHeightForLayout:(int64_t)a3 transitionFraction:(double)a4
{
  double v5;
  double v7;
  double v8;
  double v9;

  v5 = 0.0;
  switch(a3)
  {
    case 0:
      v7 = 112.0;
      break;
    case 1:
      -[CuratedCollectionHeaderView _valueForTransitionFraction:startValue:endValue:](self, "_valueForTransitionFraction:startValue:endValue:", a4, 112.0, 198.0);
      v5 = 16.0;
      break;
    case 2:
      v5 = 16.0;
      v7 = 198.0;
      break;
    case 3:
      -[CuratedCollectionHeaderView _valueForTransitionFraction:startValue:endValue:](self, "_valueForTransitionFraction:startValue:endValue:", a4, 16.0, 0.0);
      v5 = v8;
      -[CuratedCollectionHeaderView _fullHeight](self, "_fullHeight");
      -[CuratedCollectionHeaderView _valueForTransitionFraction:startValue:endValue:](self, "_valueForTransitionFraction:startValue:endValue:", a4, 198.0, v9);
      break;
    case 4:
      -[CuratedCollectionHeaderView _fullHeight](self, "_fullHeight");
      break;
    default:
      v7 = 0.0;
      break;
  }
  return UIRoundToViewScale(self, a2, v7 + v5);
}

- (double)unscrolledHeightForCurrentLayout
{
  double result;

  -[CuratedCollectionHeaderView unscrolledHeightForLayout:transitionFraction:](self, "unscrolledHeightForLayout:transitionFraction:", self->_layout, self->_transitionFraction);
  return result;
}

- (void)brickTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView delegate](self, "delegate"));
  objc_msgSend(v2, "headerViewBrickTapped");

}

- (void)publisherLogoImageViewTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHeaderView delegate](self, "delegate"));
  objc_msgSend(v2, "headerViewPublisherLogoTapped");

}

- (CuratedCollectionHeaderViewDelegate)delegate
{
  return (CuratedCollectionHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (UIView)tableViewBackgroundView
{
  return self->_tableViewBackgroundView;
}

- (double)tableViewContentOffset
{
  return self->_tableViewContentOffset;
}

- (double)tableViewSubheaderContentHeight
{
  return self->_tableViewSubheaderContentHeight;
}

- (int64_t)layout
{
  return self->_layout;
}

- (double)transitionFraction
{
  return self->_transitionFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableViewBlockBlackView, 0);
  objc_storeStrong((id *)&self->_tableViewBlockViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewBlockViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewBlockViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewBlockViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewBlockView, 0);
  objc_storeStrong((id *)&self->_tableViewBackgroundViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewBackgroundView, 0);
  objc_storeStrong((id *)&self->_titleSingleLineLabel, 0);
  objc_storeStrong((id *)&self->_titlePublisherLogoTapGesture, 0);
  objc_storeStrong((id *)&self->_titleLogoWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titlePublisherLogoImageView, 0);
  objc_storeStrong((id *)&self->_titleContentView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_titleBlackView, 0);
  objc_storeStrong((id *)&self->_titleJoeView, 0);
  objc_storeStrong((id *)&self->_titleContainerView, 0);
  objc_storeStrong((id *)&self->_titleMultiLineLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleMultiLineLabel, 0);
  objc_storeStrong((id *)&self->_logoWidthConstraint, 0);
  objc_storeStrong((id *)&self->_publisherLogoTapGesture, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageView, 0);
  objc_storeStrong((id *)&self->_heroImageBlackView, 0);
  objc_storeStrong((id *)&self->_heroImageJoeView, 0);
  objc_storeStrong((id *)&self->_heroImageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_heroBlackGradientView, 0);
  objc_storeStrong((id *)&self->_heroJoeGradientView, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);
  objc_storeStrong((id *)&self->_blockContentViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_blockContentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_blockContentView, 0);
  objc_storeStrong((id *)&self->_blockBlackView, 0);
  objc_storeStrong((id *)&self->_blockViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_blockViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_blockViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_blockViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_blockView, 0);
}

@end

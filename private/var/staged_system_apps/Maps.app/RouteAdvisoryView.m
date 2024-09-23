@implementation RouteAdvisoryView

+ (id)_stringAttributes
{
  uint64_t (**v2)(void);
  uint64_t v3;
  void *v4;
  void *v5;
  NSAttributedStringKey v7;
  void *v8;

  v7 = NSFontAttributeName;
  v2 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(+[RouteOverviewCell secondaryLabelFontProvider](RouteOverviewCell, "secondaryLabelFontProvider"));
  v3 = v2[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  return v5;
}

- (RouteAdvisoryView)initWithViewModel:(id)a3
{
  id v4;
  RouteAdvisoryView *v5;
  uint64_t v6;
  GEOComposedRouteAdvisory *advisory;
  uint64_t v8;
  GEOTransitArtworkDataSource *artwork;
  uint64_t v10;
  NSAttributedString *advisoryText;
  uint64_t v12;
  UIImage *advisoryImage;
  NSUInteger v14;

  v4 = a3;
  v5 = -[RouteAdvisoryView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advisory"));
    advisory = v5->_advisory;
    v5->_advisory = (GEOComposedRouteAdvisory *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artwork"));
    artwork = v5->_artwork;
    v5->_artwork = (GEOTransitArtworkDataSource *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    advisoryText = v5->_advisoryText;
    v5->_advisoryText = (NSAttributedString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));
    advisoryImage = v5->_advisoryImage;
    v5->_advisoryImage = (UIImage *)v12;

    v5->_buttonRange.location = (NSUInteger)objc_msgSend(v4, "buttonRange");
    v5->_buttonRange.length = v14;
    -[UILabel setAttributedText:](v5->_advisoryLabel, "setAttributedText:", v5->_advisoryText);
    -[RouteAdvisoryView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("Advisory"));
    -[RouteAdvisoryView _updateAdvisoryImage](v5, "_updateAdvisoryImage");
  }

  return v5;
}

- (RouteAdvisoryView)initWithFrame:(CGRect)a3
{
  RouteAdvisoryView *v3;
  RouteAdvisoryView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RouteAdvisoryView;
  v3 = -[RouteAdvisoryView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RouteAdvisoryView _setupViews](v3, "_setupViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

- (void)setActionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id actionHandler;
  UIButton *advisoryDetailButton;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t (**v12)(void);
  uint64_t v13;
  void *v14;
  void *v15;
  _UNKNOWN **v16;
  id v17;
  GEOComposedRouteAdvisory *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];

  v4 = a3;
  v5 = v4;
  if (self->_actionHandler != v4)
  {
    v6 = objc_retainBlock(v4);
    actionHandler = self->_actionHandler;
    self->_actionHandler = v6;

    if (!self->_actionHandler)
    {
      -[UILabel setAttributedText:](self->_advisoryLabel, "setAttributedText:", self->_advisoryText);
      -[UILabel setUserInteractionEnabled:](self->_advisoryLabel, "setUserInteractionEnabled:", 0);
      advisoryDetailButton = self->_advisoryDetailButton;
      v9 = 1;
      goto LABEL_6;
    }
    if (sub_1002A8AA0(self) == 5)
    {
      advisoryDetailButton = self->_advisoryDetailButton;
      v9 = 0;
LABEL_6:
      -[UIButton setHidden:](advisoryDetailButton, "setHidden:", v9);
      goto LABEL_16;
    }
    v10 = -[NSAttributedString mutableCopy](self->_advisoryText, "mutableCopy");
    v31[0] = NSForegroundColorAttributeName;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v32[0] = v11;
    v31[1] = NSFontAttributeName;
    v12 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(+[RouteOverviewCell secondaryLabelFontProvider](RouteOverviewCell, "secondaryLabelFontProvider"));
    v13 = v12[2]();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v32[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));

    if (self->_buttonRange.length)
    {
      objc_msgSend(v10, "addAttributes:range:", v15, self->_buttonRange.location);
LABEL_15:
      -[UILabel setAttributedText:](self->_advisoryLabel, "setAttributedText:", v10);
      -[UILabel setUserInteractionEnabled:](self->_advisoryLabel, "setUserInteractionEnabled:", 1);
      v30 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "advisoryDetailPressed");
      -[UILabel addGestureRecognizer:](self->_advisoryLabel, "addGestureRecognizer:", v30);

      goto LABEL_16;
    }
    v16 = MKPlaceCollectionsLogicController_ptr;
    v17 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
    objc_msgSend(v10, "appendAttributedString:", v17);

    v18 = self->_advisory;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteAdvisory advisoryItems](v18, "advisoryItems"));
    if (objc_msgSend(v19, "count") == (id)1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteAdvisory advisoryItems](v18, "advisoryItems"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cardAction"));
      v23 = objc_msgSend(v22, "type");

      v16 = MKPlaceCollectionsLogicController_ptr;
      if (v23 == 1)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = v24;
        v26 = CFSTR("Download button [advisory]");
        v27 = CFSTR("Offline");
LABEL_14:
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v26, CFSTR("localized string not found"), v27));

        v29 = objc_msgSend(objc_alloc((Class)v16[305]), "initWithString:attributes:", v28, v15);
        objc_msgSend(v10, "appendAttributedString:", v29);

        goto LABEL_15;
      }
    }
    else
    {

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = v24;
    v26 = CFSTR("More button [advisory]");
    v27 = 0;
    goto LABEL_14;
  }
LABEL_16:

}

- (void)setOverrideTextColor:(id)a3
{
  UIColor *v5;
  UIColor **p_overrideTextColor;
  void *v7;
  void *v8;
  UIColor *v9;

  v5 = (UIColor *)a3;
  p_overrideTextColor = &self->_overrideTextColor;
  if (self->_overrideTextColor != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_overrideTextColor, a3);
    if (*p_overrideTextColor)
    {
      -[UILabel setTextColor:](self->_advisoryLabel, "setTextColor:");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[UILabel setTextColor:](self->_advisoryLabel, "setTextColor:", v7);

    }
    if (*p_overrideTextColor)
    {
      -[UIButton setTintColor:](self->_advisoryDetailButton, "setTintColor:");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
      -[UIButton setTintColor:](self->_advisoryDetailButton, "setTintColor:", v8);

    }
    v5 = v9;
  }

}

- (void)layoutSubviews
{
  double v3;
  double height;
  double v5;
  CGFloat v7;
  CGFloat v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RouteAdvisoryView;
  -[RouteAdvisoryView layoutSubviews](&v9, "layoutSubviews");
  -[RouteAdvisoryView bounds](self, "bounds");
  height = self->_lastSize.height;
  if (self->_lastSize.width != v5 || height != v3)
  {
    -[RouteAdvisoryView bounds](self, "bounds", self->_lastSize.width, height);
    self->_lastSize.width = v7;
    self->_lastSize.height = v8;
    -[RouteAdvisoryView _refreshClickability](self, "_refreshClickability");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RouteAdvisoryView;
  -[RouteAdvisoryView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  if (self->_artwork)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoryView traitCollection](self, "traitCollection"));
    v6 = objc_msgSend(v5, "userInterfaceStyle");
    v7 = objc_msgSend(v4, "userInterfaceStyle");

    if (v6 != v7)
      -[RouteAdvisoryView _updateAdvisoryImage](self, "_updateAdvisoryImage");
  }

}

- (void)_setupViews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *advisoryLabel;
  void *v9;
  uint64_t v10;
  uint64_t (**v11)(void);
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  UIView *v16;
  UIView *advisoryImageContainer;
  UIImageView *v18;
  UIImageView *advisoryImageView;
  UIButton *v20;
  UIButton *advisoryDetailButton;
  void *v22;
  UIButton *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  double v40;
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
  _QWORD v80[17];

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  advisoryLabel = self->_advisoryLabel;
  self->_advisoryLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_advisoryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setUserInteractionEnabled:](self->_advisoryLabel, "setUserInteractionEnabled:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_advisoryLabel, "setTextColor:", v9);

  if (sub_1002A8AA0(self) == 5)
    v10 = 4;
  else
    v10 = 5;
  -[UILabel setLineBreakMode:](self->_advisoryLabel, "setLineBreakMode:", v10);
  v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(+[RouteOverviewCell secondaryLabelFontProvider](RouteOverviewCell, "secondaryLabelFontProvider"));
  v12 = v11[2]();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[UILabel setFont:](self->_advisoryLabel, "setFont:", v13);

  -[UILabel setNumberOfLines:](self->_advisoryLabel, "setNumberOfLines:", -[RouteAdvisoryView _numberOfLinesForContentSizeCategory](self, "_numberOfLinesForContentSizeCategory"));
  self->_numberOfLines = -[UILabel numberOfLines](self->_advisoryLabel, "numberOfLines");
  LODWORD(v14) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_advisoryLabel, "setContentHuggingPriority:forAxis:", 1, v14);
  LODWORD(v15) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_advisoryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v15);
  -[UILabel setAccessibilityIdentifier:](self->_advisoryLabel, "setAccessibilityIdentifier:", CFSTR("AdvisoryLabel"));
  -[RouteAdvisoryView addSubview:](self, "addSubview:", self->_advisoryLabel);
  v16 = (UIView *)objc_alloc_init((Class)UIView);
  advisoryImageContainer = self->_advisoryImageContainer;
  self->_advisoryImageContainer = v16;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_advisoryImageContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_advisoryImageContainer, "setAccessibilityIdentifier:", CFSTR("AdvisoryImageContainer"));
  -[RouteAdvisoryView addSubview:](self, "addSubview:", self->_advisoryImageContainer);
  v18 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  advisoryImageView = self->_advisoryImageView;
  self->_advisoryImageView = v18;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_advisoryImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_advisoryImageView, "setContentMode:", 1);
  -[UIImageView setClipsToBounds:](self->_advisoryImageView, "setClipsToBounds:", 1);
  -[UIImageView setAccessibilityIdentifier:](self->_advisoryImageView, "setAccessibilityIdentifier:", CFSTR("AdvisoryImage"));
  -[RouteAdvisoryView addSubview:](self, "addSubview:", self->_advisoryImageView);
  v20 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  advisoryDetailButton = self->_advisoryDetailButton;
  self->_advisoryDetailButton = v20;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_advisoryDetailButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setHidden:](self->_advisoryDetailButton, "setHidden:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  -[UIButton setTintColor:](self->_advisoryDetailButton, "setTintColor:", v22);

  -[UIButton addTarget:action:forControlEvents:](self->_advisoryDetailButton, "addTarget:action:forControlEvents:", self, "advisoryDetailPressed", 64);
  v23 = self->_advisoryDetailButton;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v24));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("info.circle.fill"), v25));
  -[UIButton setImage:forState:](v23, "setImage:forState:", v26, 0);

  -[UIButton setAccessibilityIdentifier:](self->_advisoryDetailButton, "setAccessibilityIdentifier:", CFSTR("AdvisoryDetailButton"));
  -[RouteAdvisoryView addSubview:](self, "addSubview:", self->_advisoryDetailButton);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_advisoryLabel, "font"));
  objc_msgSend(v27, "lineHeight");
  v29 = v28;

  v30 = fmin(v29, 17.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_advisoryImageContainer, "widthAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToConstant:", v29));
  v80[0] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_advisoryImageContainer, "heightAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToConstant:", v29));
  v80[1] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_advisoryImageContainer, "topAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_advisoryLabel, "topAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
  v80[2] = v73;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_advisoryImageContainer, "bottomAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoryView bottomAnchor](self, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintLessThanOrEqualToAnchor:", v71));
  v80[3] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_advisoryImageContainer, "leadingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoryView leadingAnchor](self, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v68));
  v80[4] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_advisoryImageContainer, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_advisoryLabel, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, -5.0));
  v80[5] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_advisoryImageView, "widthAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToConstant:", v30));
  v80[6] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_advisoryImageView, "heightAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToConstant:", v30));
  v80[7] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_advisoryImageView, "centerYAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_advisoryImageContainer, "centerYAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
  v80[8] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_advisoryImageView, "centerXAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_advisoryImageContainer, "centerXAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v80[9] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_advisoryLabel, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_advisoryDetailButton, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v80[10] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_advisoryLabel, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoryView topAnchor](self, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v80[11] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_advisoryLabel, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoryView bottomAnchor](self, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v80[12] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_advisoryDetailButton, "centerYAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_advisoryImageContainer, "centerYAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v80[13] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_advisoryDetailButton, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoryView trailingAnchor](self, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
  v80[14] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_advisoryDetailButton, "widthAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_advisoryDetailButton, "heightAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
  v80[15] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_advisoryDetailButton, "widthAnchor"));
  v39 = sub_1002A8AA0(self);
  v40 = 0.0;
  if (v39 == 5)
    v40 = 18.0;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToConstant:", v40));
  v80[16] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 17));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[UIView intrinsicContentSize](self->_advisoryImageContainer, "intrinsicContentSize");
  v4 = v3;
  -[UILabel intrinsicContentSize](self->_advisoryLabel, "intrinsicContentSize");
  v6 = v4 + v5;
  -[UIButton intrinsicContentSize](self->_advisoryDetailButton, "intrinsicContentSize");
  v8 = v6 + v7 + 5.0;
  -[UILabel intrinsicContentSize](self->_advisoryLabel, "intrinsicContentSize");
  v10 = ceil(v9);
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)_updateAdvisoryImage
{
  GEOTransitArtworkDataSource *artwork;
  void *v4;
  uint64_t v5;
  UIImage *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;

  artwork = self->_artwork;
  if (artwork)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoryView traitCollection](self, "traitCollection"));
    v5 = ImageForArtworkDataSource(artwork, v4);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue(v5);

    v6 = v8;
  }
  else
  {
    v6 = self->_advisoryImage;
  }
  v9 = v6;
  if (v6)
  {
    -[UIImageView setImage:](self->_advisoryImageView, "setImage:", v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage warningImageOfSize:](UIImage, "warningImageOfSize:", 17.0));
    -[UIImageView setImage:](self->_advisoryImageView, "setImage:", v7);

  }
}

- (void)advisoryDetailPressed
{
  void (**actionHandler)(void);

  actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler)
    actionHandler[2]();
}

- (void)_refreshClickability
{
  GEOComposedRouteAdvisory *advisory;
  UILabel **p_advisoryLabel;
  void *v5;
  _BOOL4 alwaysClickable;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  -[RouteAdvisoryView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  advisory = self->_advisory;
  if (advisory)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteAdvisory advisoryItems](self->_advisory, "advisoryItems"));
    if (!objc_msgSend(v11, "count"))
      goto LABEL_13;
    p_advisoryLabel = &self->_advisoryLabel;
    if (!self->_advisoryLabel)
      goto LABEL_13;
  }
  else
  {
    p_advisoryLabel = &self->_advisoryLabel;
    if (!self->_advisoryLabel)
      return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoryView advisoryText](self, "advisoryText"));
  if (objc_msgSend(v5, "length"))
  {
    alwaysClickable = self->_alwaysClickable;

    if (advisory)
    if (!alwaysClickable)
    {
      if (-[UILabel isTextTruncated](*p_advisoryLabel, "isTextTruncated"))
      {
        objc_initWeak(&location, self);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoryView _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appCoordinator"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "baseActionCoordinator"));

        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100A84B84;
        v12[3] = &unk_1011AD1E8;
        objc_copyWeak(&v14, &location);
        v10 = v9;
        v13 = v10;
        -[RouteAdvisoryView setActionHandler:](self, "setActionHandler:", v12);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      else
      {
        -[RouteAdvisoryView setActionHandler:](self, "setActionHandler:", 0);
      }
    }
  }
  else
  {

    if (advisory)
LABEL_13:

  }
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  -[RouteAdvisoryView _refreshNumberOfLinesIfNeeded](self, "_refreshNumberOfLinesIfNeeded", a3);
}

- (void)_refreshNumberOfLinesIfNeeded
{
  int64_t v3;

  v3 = -[RouteAdvisoryView _numberOfLinesForContentSizeCategory](self, "_numberOfLinesForContentSizeCategory");
  if (v3 != self->_numberOfLines)
  {
    self->_numberOfLines = v3;
    -[UILabel setNumberOfLines:](self->_advisoryLabel, "setNumberOfLines:", v3);
    -[RouteAdvisoryView _refreshClickability](self, "_refreshClickability");
  }
}

- (int64_t)_numberOfLinesForContentSizeCategory
{
  int64_t v3;
  void *v4;
  void *v5;

  if (sub_1002A8AA0(self) == 5)
    return 2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAdvisoryView traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  if ((objc_msgSend(v5, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraLarge) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraExtraLarge) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraExtraExtraLarge) & 1) != 0)
  {
    v3 = 4;
  }
  else if (objc_msgSend(v5, "isEqualToString:", UIContentSizeCategoryAccessibilityLarge))
  {
    v3 = 3;
  }
  else
  {
    v3 = 2;
  }

  return v3;
}

- (UILabel)advisoryLabel
{
  return self->_advisoryLabel;
}

- (void)setAdvisoryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_advisoryLabel, a3);
}

- (NSAttributedString)advisoryText
{
  return self->_advisoryText;
}

- (void)setAdvisoryText:(id)a3
{
  objc_storeStrong((id *)&self->_advisoryText, a3);
}

- (UIColor)overrideTextColor
{
  return self->_overrideTextColor;
}

- (UIImageView)advisoryImageView
{
  return self->_advisoryImageView;
}

- (void)setAdvisoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_advisoryImageView, a3);
}

- (UIButton)advisoryDetailButton
{
  return self->_advisoryDetailButton;
}

- (void)setAdvisoryDetailButton:(id)a3
{
  objc_storeStrong((id *)&self->_advisoryDetailButton, a3);
}

- (UIView)advisoryImageContainer
{
  return self->_advisoryImageContainer;
}

- (void)setAdvisoryImageContainer:(id)a3
{
  objc_storeStrong((id *)&self->_advisoryImageContainer, a3);
}

- (GEOTransitArtworkDataSource)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (UIImage)advisoryImage
{
  return self->_advisoryImage;
}

- (void)setAdvisoryImage:(id)a3
{
  objc_storeStrong((id *)&self->_advisoryImage, a3);
}

- (BOOL)alwaysClickable
{
  return self->_alwaysClickable;
}

- (void)setAlwaysClickable:(BOOL)a3
{
  self->_alwaysClickable = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_advisoryImage, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_advisoryImageContainer, 0);
  objc_storeStrong((id *)&self->_advisoryDetailButton, 0);
  objc_storeStrong((id *)&self->_advisoryImageView, 0);
  objc_storeStrong((id *)&self->_overrideTextColor, 0);
  objc_storeStrong((id *)&self->_advisoryText, 0);
  objc_storeStrong((id *)&self->_advisoryLabel, 0);
  objc_storeStrong((id *)&self->_advisory, 0);
}

@end

@implementation BKLibraryBookshelfCollectionsHeader

- (BKLibraryBookshelfCollectionsHeader)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfCollectionsHeader *v3;
  uint64_t v4;
  UIButton *button;
  UIImageView *v6;
  UIImageView *chevron;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfCollectionsHeader;
  v3 = -[BKLibraryBookshelfCollectionsHeader initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[BKLibraryBookshelfCollectionsHeader bounds](v3, "bounds");
    -[UIButton setFrame:](v3->_button, "setFrame:");
    -[UIButton setAutoresizingMask:](v3->_button, "setAutoresizingMask:", 18);
    -[UIButton setSpringLoaded:](v3->_button, "setSpringLoaded:", 1);
    v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    chevron = v3->_chevron;
    v3->_chevron = v6;

    -[BKLibraryBookshelfCollectionsHeader addSubview:](v3, "addSubview:", v3->_chevron);
    -[BKLibraryBookshelfCollectionsHeader addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  +[BKDataBinder unbind:](BKDataBinder, "unbind:", self);
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCollectionsHeader;
  -[BKLibraryBookshelfCollectionsHeader dealloc](&v3, "dealloc");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double Height;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  double MaxX;
  double v27;
  double v28;
  double v29;
  UIImageView *chevron;
  uint64_t v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  objc_super v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v59.receiver = self;
  v59.super_class = (Class)BKLibraryBookshelfCollectionsHeader;
  -[BKLibraryBookshelfCollectionsHeader layoutSubviews](&v59, "layoutSubviews");
  -[BKLibraryBookshelfCollectionsHeader bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader chevron](self, "chevron"));
  objc_msgSend(v11, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v13 = v12;
  v15 = v14;

  v60.origin.x = v4;
  v60.origin.y = v6;
  v60.size.width = v8;
  v60.size.height = v10;
  Height = CGRectGetHeight(v60);
  v61.origin.x = v4;
  v61.origin.y = v6;
  v61.size.width = v13;
  v58 = v15;
  v61.size.height = v15;
  v57 = round((Height - CGRectGetHeight(v61)) * 0.5);
  -[BKLibraryBookshelfCollectionsHeader margins](self, "margins");
  v18 = v8 + v17 * -2.0;
  -[BKLibraryBookshelfCollectionsHeader margins](self, "margins");
  v20 = v4 + v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader button](self, "button"));
  objc_msgSend(v21, "sizeThatFits:", v18, v10);
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader traitCollection](self, "traitCollection"));
  v25 = objc_msgSend(v24, "horizontalSizeClass");

  v56 = v13;
  if (v25 == (id)1)
  {
    v62.origin.x = v4;
    v62.origin.y = v6;
    v62.size.width = v8;
    v62.size.height = v10;
    MaxX = CGRectGetMaxX(v62);
    v63.origin.x = v4;
    v63.origin.y = v57;
    v63.size.height = v58;
    v63.size.width = v13;
    v27 = v20;
    v28 = MaxX - CGRectGetWidth(v63);
    -[BKLibraryBookshelfCollectionsHeader margins](self, "margins");
    v55 = v28 - v29;
    chevron = self->_chevron;
    v31 = 0;
  }
  else
  {
    v64.origin.x = v20;
    v64.origin.y = v6;
    v64.size.width = v18;
    v64.size.height = v10;
    v54 = v20;
    v32 = v23 + CGRectGetMinX(v64);
    -[BKLibraryBookshelfCollectionsHeader chevronSpacing](self, "chevronSpacing");
    v34 = v32 + v33;
    -[BKLibraryBookshelfCollectionsHeader chevronSpacing](self, "chevronSpacing");
    v36 = v23 + v35;
    v55 = v34;
    v65.origin.x = v34;
    v65.origin.y = v57;
    v65.size.height = v58;
    v65.size.width = v13;
    v27 = v54;
    v18 = v36 + CGRectGetWidth(v65);
    chevron = self->_chevron;
    v31 = 1;
  }
  -[UIImageView setHidden:](chevron, "setHidden:", v31);
  v37 = IMRectFlippedForRTL(-[BKLibraryBookshelfCollectionsHeader isRTL](self, "isRTL"), v27, v6, v18, v10, v4, v6, v8, v10);
  v39 = v38;
  v40 = v8;
  v42 = v41;
  v44 = v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader button](self, "button"));
  objc_msgSend(v45, "setFrame:", v37, v39, v42, v44);

  v46 = IMRectFlippedForRTL(-[BKLibraryBookshelfCollectionsHeader isRTL](self, "isRTL"), v55, v57, v56, v58, v4, v6, v40, v10);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader chevron](self, "chevron"));
  objc_msgSend(v53, "setFrame:", v46, v48, v50, v52);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
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
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  uint64_t *v65;
  id v66;
  unsigned int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  objc_super v76;

  v76.receiver = self;
  v76.super_class = (Class)BKLibraryBookshelfCollectionsHeader;
  v4 = a3;
  -[BKLibraryBookshelfCollectionsHeader applyLayoutAttributes:](&v76, "applyLayoutAttributes:", v4);
  v5 = objc_opt_class(BKLibraryLayoutAttributes);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainHeaderMetrics"));
  -[BKLibraryBookshelfCollectionsHeader setMainHeaderMetrics:](self, "setMainHeaderMetrics:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  if (!qword_1009F4F98 || (objc_msgSend((id)qword_1009F4F90, "isEqual:", v9) & 1) == 0)
  {
    objc_storeStrong((id *)&qword_1009F4F90, v9);
    v10 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithColor:](UIImage, "imageWithColor:", qword_1009F4F90));
    v11 = (void *)qword_1009F4F98;
    qword_1009F4F98 = v10;

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readingListHighlightColor"));
  v13 = v12;
  if (!qword_1009F4F88 || (objc_msgSend(v12, "isEqual:", qword_1009F4F80) & 1) == 0)
  {
    objc_storeStrong((id *)&qword_1009F4F80, v13);
    v14 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithColor:](UIImage, "imageWithColor:", qword_1009F4F80));
    v15 = (void *)qword_1009F4F88;
    qword_1009F4F88 = v14;

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  -[BKLibraryBookshelfCollectionsHeader setIsRTL:](self, "setIsRTL:", objc_msgSend(v16, "userInterfaceLayoutDirection") == (id)1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader button](self, "button"));
  if (objc_msgSend(v7, "layoutDebugMode"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "colorWithAlphaComponent:", 0.2)));
    v20 = objc_msgSend(v19, "CGColor");
    v72 = v9;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader layer](self, "layer"));
    objc_msgSend(v21, "setBorderColor:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader layer](self, "layer"));
    objc_msgSend(v22, "setBorderWidth:", 0.5);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "colorWithAlphaComponent:", 0.2)));
    v25 = objc_msgSend(v24, "CGColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    objc_msgSend(v26, "setBackgroundColor:", v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "colorWithAlphaComponent:", 0.2)));
    v29 = objc_msgSend(v28, "CGColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "layer"));
    objc_msgSend(v31, "setBorderColor:", v29);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layer"));
    objc_msgSend(v33, "setBorderWidth:", 0.5);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "colorWithAlphaComponent:", 0.2)));
    v36 = objc_msgSend(v35, "CGColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "layer"));
    objc_msgSend(v38, "setBorderColor:", v36);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layer"));
    objc_msgSend(v40, "setBorderWidth:", 0.5);

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "colorWithAlphaComponent:", 0.2)));
    v43 = objc_msgSend(v42, "CGColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader chevron](self, "chevron"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "layer"));
    objc_msgSend(v45, "setBorderColor:", v43);

    v9 = v72;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader chevron](self, "chevron"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layer"));
    v48 = v47;
    v49 = 0.5;
  }
  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader layer](self, "layer"));
    objc_msgSend(v50, "setBorderWidth:", 0.0);

    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    objc_msgSend(v51, "setBackgroundColor:", 0);

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "layer"));
    objc_msgSend(v53, "setBorderWidth:", 0.0);

    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "layer"));
    objc_msgSend(v55, "setBorderWidth:", 0.0);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader chevron](self, "chevron"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layer"));
    v48 = v47;
    v49 = 0.0;
  }
  objc_msgSend(v47, "setBorderWidth:", v49);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader backgroundColor](self, "backgroundColor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headerBackgroundColor"));

  if (v56 != v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headerBackgroundColor"));
    -[BKLibraryBookshelfCollectionsHeader setBackgroundColor:](self, "setBackgroundColor:", v58);

  }
  objc_msgSend(v8, "readingListPadding");
  -[BKLibraryBookshelfCollectionsHeader setPadding:](self, "setPadding:");
  objc_msgSend(v8, "chevronSpacing");
  -[BKLibraryBookshelfCollectionsHeader setChevronSpacing:](self, "setChevronSpacing:");
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columnMetrics"));
  objc_msgSend(v59, "margins");
  -[BKLibraryBookshelfCollectionsHeader setMargins:](self, "setMargins:");

  objc_msgSend(v8, "readingListImageSpacing");
  v61 = v60;
  v62 = v60 * 0.5;
  if (-[BKLibraryBookshelfCollectionsHeader isRTL](self, "isRTL"))
    v63 = -(v61 * 0.5);
  else
    v63 = v62;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readingListHighlightColor"));
  v65 = &qword_1009F4F88;
  if (!v64)
    v65 = &qword_1009F4F98;
  v66 = (id)*v65;

  objc_msgSend(v17, "setContentVerticalAlignment:", 0);
  objc_msgSend(v17, "setContentHorizontalAlignment:", 4);
  objc_msgSend(v17, "setImageEdgeInsets:", 0.0, -v63, 0.0, v63);
  objc_msgSend(v17, "setTitleEdgeInsets:", 0.0, v63, 0.0, -v63);
  objc_msgSend(v17, "setContentEdgeInsets:", 0.0, v62, 0.0, v62);
  objc_msgSend(v17, "setBackgroundImage:forState:", v66, 1);
  -[BKLibraryBookshelfCollectionsHeader _setupGlyphs](self, "_setupGlyphs");
  v67 = objc_msgSend(v17, "isEnabled");
  if (v67 == objc_msgSend(v7, "editMode"))
  {
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100104F28;
    v73[3] = &unk_1008E7338;
    v74 = v17;
    v75 = v7;
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v74, 5242880, v73, 0, 0.3);

  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader buttonText](self, "buttonText"));

  if (v68)
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader buttonText](self, "buttonText"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionsLabelFontAttributes"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "attributes"));
    -[BKLibraryBookshelfCollectionsHeader updateButtonWithText:attributes:](self, "updateButtonWithText:attributes:", v69, v71);

  }
}

- (void)_setupGlyphs
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
  id v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chevronFontAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v5, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chevronName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithConfiguration:", v6));
  -[BKLibraryBookshelfCollectionsHeader setChevronImage:](self, "setChevronImage:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader chevronImage](self, "chevronImage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader chevron](self, "chevron"));
  objc_msgSend(v12, "setImage:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chevronFontAttributes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "foregroundColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader chevron](self, "chevron"));
  objc_msgSend(v16, "setTintColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "iconFontAttributes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "font"));
  v30 = (id)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v19, 3));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "iconName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v21));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "imageWithConfiguration:", v30));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader button](self, "button"));
  objc_msgSend(v24, "setImage:forState:", v23, 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "iconFontAttributes"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "foregroundColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader button](self, "button"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageView"));
  objc_msgSend(v29, "setTintColor:", v27);

}

- (void)setDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[BKDataBinder unbind:](BKDataBinder, "unbind:", self);
  objc_storeWeak((id *)&self->_dataSource, v4);

  -[BKLibraryBookshelfCollectionsHeader _setupGlyphs](self, "_setupGlyphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader button](self, "button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageView"));
  objc_msgSend(v6, "setContentMode:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader dataSource](self, "dataSource"));
  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader dataSource](self, "dataSource"));
    +[BKDataBinder bind:key:to:key:](BKDataBinder, "bind:key:to:key:", v8, CFSTR("readingListButtonText"), self, CFSTR("buttonText"));

  }
}

- (void)setActionHandler:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_actionHandler, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader button](self, "button"));
    objc_msgSend(v6, "removeTarget:action:forControlEvents:", 0, 0, 64);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader button](self, "button"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader actionHandler](self, "actionHandler"));
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v8, "showReadingLists", 64);

    v5 = obj;
  }

}

- (void)setButtonText:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_buttonText, a3);
  v5 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionsLabelFontAttributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributes"));
  -[BKLibraryBookshelfCollectionsHeader updateButtonWithText:attributes:](self, "updateButtonWithText:attributes:", v5, v7);

}

- (void)updateButtonWithText:(id)a3 attributes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSAttributedStringKey v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;

  v48 = a3;
  v6 = objc_msgSend(a4, "mutableCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", NSParagraphStyleAttributeName));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
  v10 = v9;

  v11 = objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v11, "setLineBreakMode:", 4);
  v12 = objc_msgSend(v11, "copy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, NSParagraphStyleAttributeName);

  v13 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v48, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader traitCollection](self, "traitCollection"));
  v15 = objc_msgSend(v14, "horizontalSizeClass");

  v45 = v10;
  v46 = v15;
  if (v15 == (id)1)
  {
    v16 = NSForegroundColorAttributeName;
  }
  else
  {
    v17 = objc_alloc_init((Class)NSTextAttachment);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader chevronImage](self, "chevronImage"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageWithRenderingMode:", 2));
    objc_msgSend(v17, "setImage:", v19);

    v20 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR(" "), v6);
    objc_msgSend(v13, "appendAttributedString:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v17));
    v22 = objc_msgSend(v21, "mutableCopy");

    v16 = NSForegroundColorAttributeName;
    v23 = v13;
    v24 = v11;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "chevronFontAttributes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "foregroundColor"));
    objc_msgSend(v22, "addAttribute:value:range:", NSForegroundColorAttributeName, v27, 0, objc_msgSend(v22, "length"));

    v11 = v24;
    v13 = v23;
    objc_msgSend(v23, "appendAttributedString:", v22);

    v10 = v45;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader button](self, "button"));
  objc_msgSend(v28, "setAttributedTitle:forState:", v13, 0);

  v29 = v6;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", v16));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "colorWithAlphaComponent:", 0.5));
  objc_msgSend(v29, "setObject:forKey:", v31, v16);

  v32 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v48, v29);
  if (v46 != (id)1)
  {
    v33 = objc_alloc_init((Class)NSTextAttachment);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader chevronImage](self, "chevronImage"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "imageWithRenderingMode:", 2));
    v47 = v33;
    objc_msgSend(v33, "setImage:", v35);

    v36 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR(" "), v29);
    objc_msgSend(v32, "appendAttributedString:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v33));
    v38 = objc_msgSend(v37, "mutableCopy");

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "chevronFontAttributes"));
    v41 = v13;
    v42 = v11;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "foregroundColor"));
    objc_msgSend(v38, "addAttribute:value:range:", v16, v43, 0, objc_msgSend(v38, "length"));

    v11 = v42;
    v13 = v41;

    objc_msgSend(v32, "appendAttributedString:", v38);
    v10 = v45;

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionsHeader button](self, "button"));
  objc_msgSend(v44, "setAttributedTitle:forState:", v32, 2);

  -[BKLibraryBookshelfCollectionsHeader setNeedsLayout](self, "setNeedsLayout");
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  return (BKLibraryBookshelfSupplementaryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BKLibraryActionHandler)actionHandler
{
  return (BKLibraryActionHandler *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_mainHeaderMetrics, a3);
}

- (UIImage)chevronImage
{
  return self->_chevronImage;
}

- (void)setChevronImage:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImage, a3);
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
  objc_storeStrong((id *)&self->_chevron, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (double)margins
{
  return self->_margins;
}

- (void)setMargins:(double)a3
{
  self->_margins = a3;
}

- (double)chevronSpacing
{
  return self->_chevronSpacing;
}

- (void)setChevronSpacing:(double)a3
{
  self->_chevronSpacing = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_chevronImage, 0);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end

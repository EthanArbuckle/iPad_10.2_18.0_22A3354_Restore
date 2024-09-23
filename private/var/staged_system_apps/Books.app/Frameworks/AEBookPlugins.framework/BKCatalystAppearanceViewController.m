@implementation BKCatalystAppearanceViewController

- (double)appearanceColorPotSeparator
{
  return 18.0;
}

- (double)appearanceColorPotWidth
{
  return 28.0;
}

- (double)appearanceColorPotHeight
{
  return 28.0;
}

- (double)fontAppearanceWidthPadding
{
  return 14.0;
}

- (double)appearanceColorContainerHeight
{
  return 28.0;
}

- (double)appearanceRowHeight
{
  return 40.0;
}

- (double)scrollingRowHeight
{
  return 40.0;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKCatalystAppearanceViewController;
  -[BKAppearanceViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  *(_QWORD *)&v4 = objc_opt_class(BKFontTableViewCell).n128_u64[0];
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v5, CFSTR("BKFontTableViewCell"), v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "fontDownloadFailed:", BEFontDownloadFailedNotification, 0);

}

- (CGSize)contentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)BKCatalystAppearanceViewController;
  -[BKAppearanceViewController contentSize](&v4, "contentSize");
  v3 = 230.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
    v6 = objc_msgSend(v5, "count");

  }
  else
  {
    v6 = 0;
  }

  return (int64_t)v6;
}

- (BOOL)hasOriginalFont
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (!-[BKCatalystAppearanceViewController determinedOriginalFont](self, "determinedOriginalFont"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fonts](self, "fonts"));
    -[BKCatalystAppearanceViewController setDeterminedOriginalFont:](self, "setDeterminedOriginalFont:", objc_msgSend(v3, "count") != 0);
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fonts](self, "fonts"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_D1D08;
    v6[3] = &unk_1C17F0;
    v6[4] = &v7;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

    self->_hasOriginalFont = *((_BYTE *)v8 + 24);
    _Block_object_dispose(&v7, 8);

  }
  return self->_hasOriginalFont;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKCatalystAppearanceViewController;
  v6 = -[BKAppearanceViewController tableView:numberOfRowsInSection:](&v11, "tableView:numberOfRowsInSection:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a4));

  if (v8 == CFSTR("BKAppearanceMenuItemFont"))
  {
    v6 = &dword_0 + 1;
  }
  else if (v8 == CFSTR("BKAppearanceMenuItemSelectedFont"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fonts](self, "fonts"));
    v6 = objc_msgSend(v9, "count");

  }
  return (int64_t)v6;
}

- (UIImage)clearImage
{
  UIImage *clearImage;
  UIImage *ImageFromCurrentImageContext;
  UIImage *v5;
  UIImage *v6;
  CGSize v8;

  clearImage = self->_clearImage;
  if (!clearImage)
  {
    v8.width = 13.0;
    v8.height = 13.0;
    UIGraphicsBeginImageContextWithOptions(v8, 0, 1.0);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    v6 = self->_clearImage;
    self->_clearImage = v5;

    UIGraphicsEndImageContext();
    clearImage = self->_clearImage;
  }
  return clearImage;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  __CFString *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKCatalystAppearanceViewController;
  -[BKAppearanceViewController tableView:heightForRowAtIndexPath:](&v12, "tableView:heightForRowAtIndexPath:", a3, v6);
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

  if (v10 == CFSTR("BKAppearanceMenuItemTheme") && !objc_msgSend(v6, "row"))
  {
    v8 = 40.0;
  }
  else if (v10 == CFSTR("BKAppearanceMenuItemSelectedFont"))
  {
    v8 = 22.0;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4;
  void *v5;
  double v6;

  if (!a4)
    return 0.0;
  v4 = 8.0;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", a3));
    objc_msgSend(v5, "scale");
    v4 = 1.0 / v6;

  }
  return v4;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  objc_super v12;
  CGRect v13;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKCatalystAppearanceViewController;
  v7 = -[BKAppearanceViewController tableView:viewForFooterInSection:](&v12, "tableView:viewForFooterInSection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (a4 == 2)
  {
    v9 = objc_alloc((Class)UIView);
    objc_msgSend(v6, "frame");
    v10 = objc_msgSend(v9, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v13), 10.0);

    v8 = v10;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKCatalystAppearanceViewController;
  -[BKAppearanceViewController tableView:heightForFooterInSection:](&v6, "tableView:heightForFooterInSection:", a3);
  if (a4 == 2)
    return 10.0;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double Width;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  CGRect v41;

  v6 = a3;
  v7 = objc_alloc_init((Class)BEHairlineDividerView);
  objc_msgSend(v7, "setHorizontal:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKCatalystAppearanceViewController themePage](self, "themePage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "separatorColor"));
  objc_msgSend(v7, "setBackgroundColor:", v9);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "frame");
  Width = CGRectGetWidth(v41);
  -[BKCatalystAppearanceViewController tableView:heightForHeaderInSection:](self, "tableView:heightForHeaderInSection:", v6, a4);
  v12 = v11;

  v14 = CGRectMakeWithSize(v13, Width, v12);
  v18 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v14, v15, v16, v17);
  objc_msgSend(v18, "setPreservesSuperviewLayoutMargins:", 1);
  objc_msgSend(v18, "addSubview:", v7);
  if ((unint64_t)(a4 - 1) > 1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  }
  v21 = v20;
  v36 = v19;
  v35 = (void *)v20;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "heightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v22, "scale");
  v24 = 1.0 / v23;

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToConstant:", v24));
  v40[0] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  v40[1] = v37;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layoutMarginsGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v26));
  v40[2] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layoutMarginsGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  v40[3] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

  return v18;
}

- (void)stylizeForTheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKCatalystAppearanceViewController;
  -[BKAppearanceViewController stylizeForTheme](&v8, "stylizeForTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "separatorColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController sizeSeparatorLine](self, "sizeSeparatorLine"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char isKindOfClass;
  id v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_super v64;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

  if (v9 == CFSTR("BKAppearanceMenuItemSelectedFont"))
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("BKFontTableViewCell"), v6));

    objc_opt_class(BKFontTableViewCell);
    v13 = BUDynamicCast(v12, v63);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fonts](self, "fonts"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController style](self, "style"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fontFamily"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyName"));
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyName"));
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyName"));
      -[BKCatalystAppearanceViewController fontSizeForFontFamilyName:](self, "fontSizeForFontFamilyName:", v22);
      v24 = v23;

      if (objc_msgSend(v7, "kind") == &dword_4)
      {
        v25 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:design:](UIFont, "systemFontOfSize:weight:design:", kCTFontUIFontDesignSerif, v24, UIFontWeightRegular));
LABEL_9:
        v30 = (void *)v25;
        goto LABEL_14;
      }
      if (objc_msgSend(v7, "kind") == (char *)&dword_0 + 3)
      {
        v25 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v24));
        goto LABEL_9;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyName"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v31, v24));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "_fontAdjustedForCurrentContentSizeCategory"));

      if (v28)
        v29 = v28;
      else
        v29 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v24));
    }
    else
    {
      v26 = AEBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Original"), &stru_1C3088, 0));

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
      objc_msgSend(v28, "_scaledValueForValue:", 13.0);
      v29 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    }
    v30 = v29;

LABEL_14:
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKCatalystAppearanceViewController themePage](self, "themePage"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "keyColor"));

    objc_msgSend(v11, "setLabelText:", v21);
    v62 = v30;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bkEffectiveFontForText:", v21));
    objc_msgSend(v11, "setLabelFont:", v35);

    v36 = objc_msgSend(v7, "state") == 1;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "label"));
    objc_msgSend(v37, "setEnabled:", v36);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionView"));
    objc_msgSend(v38, "setHidden:", v18 ^ 1);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionView"));
    objc_msgSend(v39, "setTintColor:", v34);

    if ((v18 & 1) != 0)
    {
LABEL_25:

      goto LABEL_26;
    }
    if (objc_msgSend(v7, "state") == 3)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "accessoryView"));
      objc_opt_class(IMRadialProgressButton);
      isKindOfClass = objc_opt_isKindOfClass(v40, v41);

      if ((isKindOfClass & 1) != 0)
      {
        v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "accessoryView"));
      }
      else
      {
        v43 = objc_alloc_init((Class)IMRadialProgressButton);
        objc_msgSend(v43, "setTintColor:", v34);
        objc_msgSend(v43, "setTrackDiameter:", 16.0);
        objc_msgSend(v43, "setProgressThickness:", 1.0);
        objc_msgSend(v43, "useInnerRect:", 5.0, 5.0);
        objc_msgSend(v43, "addTarget:action:forControlEvents:", self, "stopDownloadingFont:", 64);
      }
      objc_msgSend(v7, "downloadProgress");
      objc_msgSend(v43, "setProgress:");
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "buttonContainerView"));
      objc_msgSend(v57, "addSubview:", v43);

      objc_msgSend(v43, "setTag:", objc_msgSend(v6, "row"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bc_constraintsToFitInSuperviewCentered"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);
    }
    else
    {
      if (objc_msgSend(v7, "state") != 2)
        goto LABEL_24;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyName"));
      v45 = objc_msgSend(v44, "isEqualToString:", &stru_1C3088);

      if ((v45 & 1) != 0)
        goto LABEL_24;
      v43 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      objc_msgSend(v43, "addTarget:action:forControlEvents:", self, "downloadFont:", 64);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleTitle3));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("icloud.and.arrow.down")));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bc_imageWithConfiguration:limitedToContentSizeCategory:", v46, UIContentSizeCategoryAccessibilityExtraLarge));

      objc_msgSend(v43, "setImage:forState:", v61, 0);
      objc_msgSend(v43, "setTintColor:", v34);
      objc_msgSend(v43, "setTag:", objc_msgSend(v6, "row"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "buttonContainerView"));
      objc_msgSend(v48, "addSubview:", v43);

      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bc_constraintsToFitInSuperviewCentered"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v49);

      objc_msgSend(v61, "size");
      v51 = v50;
      objc_msgSend(v61, "size");
      v53 = v51 / v52;
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "widthAnchor"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "heightAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:multiplier:", v54, v53));

      LODWORD(v56) = 1148846080;
      objc_msgSend(v55, "setPriority:", v56);
      objc_msgSend(v55, "setActive:", 1);

    }
LABEL_24:
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "buttonContainerWidthConstraint"));
    objc_msgSend(v58, "setConstant:", 18.0);

    goto LABEL_25;
  }
  v64.receiver = self;
  v64.super_class = (Class)BKCatalystAppearanceViewController;
  v10 = -[BKAppearanceViewController tableView:cellForRowAtIndexPath:](&v64, "tableView:cellForRowAtIndexPath:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
LABEL_26:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

  if (v9 == CFSTR("BKAppearanceMenuItemSelectedFont"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fonts](self, "fonts"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

    if (objc_msgSend(v11, "state") == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fontVC](self, "fontVC"));
      objc_msgSend(v12, "useSelectedFont:", v11);

      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    }

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKCatalystAppearanceViewController;
    -[BKAppearanceViewController tableView:didSelectRowAtIndexPath:](&v14, "tableView:didSelectRowAtIndexPath:", v6, v7);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
  objc_msgSend(v13, "reloadData");

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __CFString *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BKCatalystAppearanceViewController;
  v9 = a5;
  -[BKAppearanceViewController tableView:willDisplayCell:forRowAtIndexPath:](&v18, "tableView:willDisplayCell:forRowAtIndexPath:", a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor", v18.receiver, v18.super_class));
  objc_msgSend(v8, "setBackgroundColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
  v12 = objc_msgSend(v9, "section");

  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v12));
  if (v13 == CFSTR("BKAppearanceMenuItemHorizontalScrollingView")
    || v13 == CFSTR("BKAppearanceMenuItemVerticalScrollingView"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:", UIFontTextStyleTitle1, UIContentSizeCategoryExtraExtraExtraLarge));
    objc_msgSend(v15, "_scaledValueForValue:", 13.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    objc_msgSend(v17, "setFont:", v16);

  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController menuItems](self, "menuItems"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

  if (v9 == CFSTR("BKAppearanceMenuItemSelectedFont"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fonts](self, "fonts"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

    v10 = objc_msgSend(v12, "state") == 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKCatalystAppearanceViewController;
    v10 = -[BKAppearanceViewController tableView:shouldHighlightRowAtIndexPath:](&v14, "tableView:shouldHighlightRowAtIndexPath:", v6, v7);
  }

  return v10;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCatalystAppearanceViewController themePage](self, "themePage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tableViewCellSelectedColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  objc_msgSend(v4, "setBackgroundColor:", 0);

}

- (id)_themeButtonImageForTheme:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMThemePage themeForEPUBTheme:](IMThemePage, "themeForEPUBTheme:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttonFillColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "separatorColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primaryTextColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKCatalystAppearanceViewController _themeButtonImageWithColor:unselectedBorderColor:selectedImageColor:selected:](self, "_themeButtonImageWithColor:unselectedBorderColor:selectedImageColor:selected:", v7, v8, v9, v4));

  return v10;
}

- (id)_themeButtonImageWithColor:(id)a3 unselectedBorderColor:(id)a4 selectedImageColor:(id)a5 selected:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIImage *ImageFromCurrentImageContext;
  void *v24;
  CGSize v26;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[BKCatalystAppearanceViewController appearanceColorPotWidth](self, "appearanceColorPotWidth");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 1, 14.0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v18));
  v26.width = v14;
  v26.height = v14;
  UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v14, v14));
  objc_msgSend(v11, "setFill");

  objc_msgSend(v20, "fill");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v17, v17, v14 + v17 * -2.0, v14 + v17 * -2.0));
  objc_msgSend(v12, "setFill");

  objc_msgSend(v21, "fill");
  if (v6)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageWithTintColor:", v10));
    objc_msgSend(v22, "drawInRect:", v14 * 0.5 * 0.5, v14 * 0.5 * 0.5, v14 * 0.5, v14 * 0.5);

  }
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v24;
}

- (double)fontSizeForFontFamilyName:(id)a3
{
  id v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Iowan Old Style")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Charter")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Athelas")) & 1) != 0
    || (v4 = 13.0, objc_msgSend(v3, "isEqualToString:", CFSTR("Seravek"))))
  {
    v4 = 14.0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v5, "_scaledValueForValue:", v4);
  v7 = v6;

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  objc_super v15;
  _QWORD block[6];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("state")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("downloadProgress")))
  {
    if (-[BKCatalystAppearanceViewController isVisible](self, "isVisible"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fonts](self, "fonts"));
      v14 = objc_msgSend(v13, "indexOfObject:", v11);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_D34A0;
      block[3] = &unk_1C03B0;
      block[4] = self;
      block[5] = v14;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKCatalystAppearanceViewController;
    -[BKCatalystAppearanceViewController observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)downloadFont:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fonts](self, "fonts"));
  v6 = objc_msgSend(v4, "tag");

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6));
  self->_shownCannotDownloadFontAlert = 0;
  objc_msgSend(v7, "download");

}

- (void)stopDownloadingFont:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewController fonts](self, "fonts"));
  v6 = objc_msgSend(v4, "tag");

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6));
  objc_msgSend(v7, "cancelDownload");

}

- (void)fontDownloadFailed:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (!self->_shownCannotDownloadFontAlert)
  {
    v4 = a3;
    v5 = MGGetBoolAnswer(CFSTR("wapi"));
    v6 = AEBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v5)
      v9 = CFSTR("To download fonts, connect to WLAN.");
    else
      v9 = CFSTR("To download fonts, connect to Wi-Fi.");
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1C3088, 0));

    v10 = AEBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Couldn’t Download"), &stru_1C3088, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, v20, 1));

    v14 = AEBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1C3088, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 1, 0));
    objc_msgSend(v13, "addAction:", v17);

    -[BKCatalystAppearanceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
    self->_shownCannotDownloadFontAlert = 1;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

    objc_msgSend(v18, "checkStateSynchronously:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BEAppearanceViewController tableView](self, "tableView"));
    objc_msgSend(v19, "reloadData");

  }
}

- (BOOL)accessibilityPerformEscape
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKCatalystAppearanceViewController;
  return -[BKCatalystAppearanceViewController accessibilityPerformEscape](&v3, "accessibilityPerformEscape");
}

- (BOOL)determinedOriginalFont
{
  return self->_determinedOriginalFont;
}

- (void)setDeterminedOriginalFont:(BOOL)a3
{
  self->_determinedOriginalFont = a3;
}

- (void)setClearImage:(id)a3
{
  objc_storeStrong((id *)&self->_clearImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearImage, 0);
}

@end

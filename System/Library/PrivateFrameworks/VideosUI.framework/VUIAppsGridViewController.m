@implementation VUIAppsGridViewController

- (VUIAppsGridViewController)init
{
  char *v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int64x2_t v19;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)VUIAppsGridViewController;
  v2 = -[VUIAppsGridViewController init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 1000) = vdupq_n_s64(0x404E000000000000uLL);
    v4 = objc_alloc_init(MEMORY[0x1E0DC3610]);
    v5 = (void *)*((_QWORD *)v3 + 122);
    *((_QWORD *)v3 + 122) = v4;

    objc_msgSend(*((id *)v3 + 122), "setScrollDirection:", 0);
    v6 = objc_alloc((Class)objc_msgSend(v3, "_collectionViewClass"));
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", *((_QWORD *)v3 + 122), *MEMORY[0x1E0C9D648], v8, v9, v10);
    v12 = (void *)*((_QWORD *)v3 + 123);
    *((_QWORD *)v3 + 123) = v11;

    objc_msgSend(*((id *)v3 + 123), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v3 + 123), "setDataSource:", v3);
    objc_msgSend(*((id *)v3 + 123), "setDelegate:", v3);
    objc_msgSend(*((id *)v3 + 123), "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("cell"));
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    v14 = (void *)*((_QWORD *)v3 + 121);
    *((_QWORD *)v3 + 121) = v13;

    objc_msgSend(v3, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", *((_QWORD *)v3 + 123));

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceIdiom");

    if (v17 == 2)
    {
      objc_msgSend(v3, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", *((_QWORD *)v3 + 121));

      v19 = (int64x2_t)xmmword_1DA1C1A40;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "userInterfaceIdiom");

      if (v21 != 6)
      {
LABEL_7:
        objc_msgSend(v3, "layoutSubviews");
        return (VUIAppsGridViewController *)v3;
      }
      v19 = vdupq_n_s64(0x4054000000000000uLL);
    }
    *(int64x2_t *)(v3 + 1000) = v19;
    goto LABEL_7;
  }
  return (VUIAppsGridViewController *)v3;
}

- (void)setApps:(id)a3
{
  NSArray *v4;
  NSArray *apps;

  if (self->_apps != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    apps = self->_apps;
    self->_apps = v4;

    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }
}

- (void)setIconSize:(CGSize)a3
{
  double width;
  double height;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  self->_iconSize = a3;
  if (a3.width != width || a3.height != height)
  {
    -[VUIAppsGridViewController layoutSubviews](self, "layoutSubviews");
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }
}

- (void)layoutSubviews
{
  CGSize *p_iconSize;
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  UILabel *titleLabel;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  UILabel *v36;
  void *v37;
  UICollectionView *collectionView;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
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
  id v64;

  p_iconSize = &self->_iconSize;
  width = self->_iconSize.width;
  height = self->_iconSize.height;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v64 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIAppCell contentInsets](VUIAppCell, "contentInsets");
  v8 = v6 + v7;
  v11 = v10 + v9;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == 6 || v13 == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "nativeBounds");
    v17 = v16 * 0.19;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    v20 = v17 / v19;

    if (v13 == 6)
      v21 = 10.0;
    else
      v21 = 20.0;
    width = v8 + p_iconSize->width;
    v22 = v11 + p_iconSize->height + 16.0;
    v23 = 27.0;
    v24 = 12.0;
    v25 = 74.0;
    v26 = 27.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "userInterfaceIdiom");

    if (v28 == 2)
    {
      width = v8 + p_iconSize->width;
      v22 = v11 + p_iconSize->height + 33.0;
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
      v29 = objc_claimAutoreleasedReturnValue();

      v21 = 0.0;
      v20 = 124.0;
      v25 = 68.0;
      v26 = 83.0;
      v23 = 58.0;
      v24 = 50.0;
      v64 = (id)v29;
    }
    else
    {
      v21 = 20.0;
      v22 = height + 20.0;
      v20 = 108.0;
      v26 = 74.0;
      v23 = 50.0;
      v24 = 35.0;
      v25 = 74.0;
    }
  }
  -[UICollectionViewFlowLayout setItemSize:](self->_layout, "setItemSize:", width, v22);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_layout, "setMinimumInteritemSpacing:", v23);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_layout, "setMinimumLineSpacing:", v24);
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v21, v26, v26, v26);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setFont:](self->_titleLabel, "setFont:", v64);
  titleLabel = self->_titleLabel;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:", CFSTR("ACCESS_SEE_ALL_TITLE"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](titleLabel, "setText:", v32);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", 0.8);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[VUIAppsGridViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  if (v35 == 2)
  {
    v36 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v36, "setTextColor:", v37);

    -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", 0);
    objc_msgSend(v33, "setBackgroundColor:", 0);
  }
  else
  {
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](collectionView, "setBackgroundColor:", v39);

    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBackgroundColor:", v40);

  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "userInterfaceIdiom");

  if (v42 == 2)
  {
    -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, v20);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setActive:", 1);

    -[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setActive:", 1);

    -[UICollectionView topAnchor](self->_collectionView, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, v25);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setActive:", 1);
  }
  else
  {
    -[UICollectionView topAnchor](self->_collectionView, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, 20.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    -[VUIAppsGridViewController navigationItem](self, "navigationItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:", CFSTR("ACCESS_SEE_ALL_TITLE"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setTitle:", v51);
  }

  -[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, 0.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

  -[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setActive:", 1);

  -[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setActive:", 1);

}

- (Class)_collectionViewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIAppsGridViewController;
  -[VUIAppsGridViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UICollectionView flashScrollIndicators](self->_collectionView, "flashScrollIndicators");
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIAppsGridViewController;
  v4 = a3;
  -[VUIAppsGridViewController setTitle:](&v5, sel_setTitle_, v4);
  -[UILabel setText:](self->_titleLabel, "setText:", v4, v5.receiver, v5.super_class);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return -[NSArray count](self->_apps, "count", a3);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_apps, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("cell"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIconSize:", self->_iconSize.width, self->_iconSize.height);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appIcon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  objc_msgSend(v10, "vui_iconImageOfSize:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setImage:", v11);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v12);

  return v9;
}

- (NSArray)apps
{
  return self->_apps;
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

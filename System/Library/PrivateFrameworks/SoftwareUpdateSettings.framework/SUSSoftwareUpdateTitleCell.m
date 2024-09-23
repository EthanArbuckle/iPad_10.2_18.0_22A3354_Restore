@implementation SUSSoftwareUpdateTitleCell

+ (int64_t)cellStyle
{
  return 3;
}

- (SUSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  SUSSoftwareUpdateTitleCell *v5;
  SUSSoftwareUpdateTitleCell *v8;
  id v9;
  id location;
  int64_t v11;
  SEL v12;
  SUSSoftwareUpdateTitleCell *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  v5 = v13;
  v13 = 0;
  v13 = -[SUSSoftwareUpdateTitleCell initWithStyle:reuseIdentifier:specifier:updateIcon:showLearnMore:showSplomboNotes:delegate:](v5, "initWithStyle:reuseIdentifier:specifier:updateIcon:showLearnMore:showSplomboNotes:delegate:", v11, location, v9, 0, 1, 0, 0);
  v8 = v13;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

- (SUSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5 updateIcon:(id)a6 showLearnMore:(BOOL)a7 delegate:(id)a8
{
  SUSSoftwareUpdateTitleCell *v8;
  SUSSoftwareUpdateTitleCell *v14;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  id location;
  int64_t v20;
  SEL v21;
  SUSSoftwareUpdateTitleCell *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = 0;
  objc_storeStrong(&v17, a6);
  v16 = a7;
  v15 = 0;
  objc_storeStrong(&v15, a8);
  v8 = v22;
  v22 = 0;
  v22 = -[SUSSoftwareUpdateTitleCell initWithStyle:reuseIdentifier:specifier:updateIcon:showLearnMore:showSplomboNotes:delegate:](v8, "initWithStyle:reuseIdentifier:specifier:updateIcon:showLearnMore:showSplomboNotes:delegate:", v20, location, v18, v17, v16, 0, v15);
  v14 = v22;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v14;
}

- (SUSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5 updateIcon:(id)a6 showLearnMore:(BOOL)a7 showSplomboNotes:(BOOL)a8 delegate:(id)a9
{
  SUSSoftwareUpdateTitleCell *v9;
  SUSSoftwareUpdateTitleCell *v11;
  id v12;
  objc_super v17;
  id v18;
  BOOL v19;
  BOOL v20;
  id v21;
  id v22;
  id location;
  int64_t v24;
  SEL v25;
  SUSSoftwareUpdateTitleCell *v26;

  v26 = self;
  v25 = a2;
  v24 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = 0;
  objc_storeStrong(&v21, a6);
  v20 = a7;
  v19 = a8;
  v18 = 0;
  objc_storeStrong(&v18, a9);
  v9 = v26;
  v26 = 0;
  v17.receiver = v9;
  v17.super_class = (Class)SUSSoftwareUpdateTitleCell;
  v26 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v17, sel_initWithStyle_reuseIdentifier_specifier_, v24, location, v22);
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    objc_storeWeak((id *)&v26->_delegate, v18);
    -[SUSSoftwareUpdateTitleCell setSelectionStyle:](v26, "setSelectionStyle:", 0);
    -[SUSSoftwareUpdateTitleCell setHoverStyle:](v26, "setHoverStyle:");
    objc_storeStrong((id *)&v26->_updateIcon, v21);
    v26->_showLearnMoreButton = v20;
    objc_storeStrong((id *)&v26->_updateIconContraints, 0);
    v26->_showSplomboNotes = v19;
    -[SUSSoftwareUpdateTitleCell setupViews](v26, "setupViews");
    v12 = (id)-[SUSSoftwareUpdateTitleCell detailTextLabel](v26, "detailTextLabel");
    objc_msgSend(v12, "setHidden:", 1);

  }
  v11 = v26;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v26, 0);
  return v11;
}

- (void)updateConstraints
{
  objc_super v2;
  SEL v3;
  SUSSoftwareUpdateTitleCell *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSSoftwareUpdateTitleCell;
  -[SUSSoftwareUpdateTitleCell updateConstraints](&v2, sel_updateConstraints);
}

- (double)preferredHeightWithTable:(id)a3
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
  double v12;
  double v13;
  double v14;
  double v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  UIImage *v27;
  double v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  id v35;
  double v36;
  char v37;
  id v38;
  double v39;
  double v40;
  double v41;
  _BYTE v42[9];
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id location[2];
  SUSSoftwareUpdateTitleCell *v51;

  v51 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSSoftwareUpdateTitleCell bounds](v51, "bounds");
  v49 = v3;
  v35 = (id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  objc_msgSend(v35, "bounds");
  v36 = v4;

  CGSizeMake_0();
  v47 = v5;
  v48 = v6;
  if (v51->_learnMoreLabel)
  {
    -[UILabel sizeThatFits:](v51->_learnMoreLabel, "sizeThatFits:", v5, v6);
    v34 = v7 + 20.0;
  }
  else
  {
    v34 = 0.0;
  }
  if (v51->_splomboNotes)
  {
    -[UILabel sizeThatFits:](v51->_splomboNotes, "sizeThatFits:", v47, v48);
    v33 = v8 + 8.0;
  }
  else
  {
    v33 = 0.0;
  }
  v30 = (id)-[PSWebContainerView webView](v51->_releaseNotesSummaryView, "webView");
  v29 = (id)objc_msgSend(v30, "scrollView");
  objc_msgSend(v29, "contentOffset");
  v45 = v9;
  v46 = v10;

  -[PSWebContainerView heightForWidth:](v51->_releaseNotesSummaryView, "heightForWidth:", v49 - 0.0);
  v44 = v11;
  v32 = (id)-[PSWebContainerView webView](v51->_releaseNotesSummaryView, "webView");
  v31 = (id)objc_msgSend(v32, "scrollView");
  objc_msgSend(v31, "setContentOffset:", v45, v46);

  -[UILabel sizeThatFits:](v51->_updateNameLabel, "sizeThatFits:", v47, v48);
  v43 = v12;
  v42[8] = 0;
  *(_QWORD *)v42 = v51->_progressStyle == 0;
  if (v51->_progressStyle)
  {
    -[UIProgressView sizeThatFits:](v51->_progressBar, "sizeThatFits:", v47, v48);
    *(double *)&v42[1] = v13 + 3.0;
  }
  -[UILabel sizeThatFits:](v51->_updateStatusLabel, "sizeThatFits:", v47, v48);
  v41 = v14 + 3.0;
  v27 = -[UIImageView image](v51->_imageView, "image");
  -[UIImage size](v27, "size");
  v28 = v15;

  v40 = v43 + *(double *)&v42[1] + v41;
  if (v40 < v28)
    v40 = v28;
  v39 = v44;
  if (v44 > v36 / 2.0 - 26.0 - v40 - v34 - v33)
    v39 = v36 / 2.0 - 26.0 - v40 - v34 - v33;
  if (v39 < v36 / 4.0)
    v39 = v36 / 4.0;
  if (v39 >= v44)
  {
    v39 = v44;
    v21 = (id)objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
    v37 = 0;
    v22 = 1;
    if ((objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BEBE090]) & 1) == 0)
    {
      v38 = (id)objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
      v37 = 1;
      v22 = objc_msgSend(v38, "isEqualToString:", *MEMORY[0x24BEBE058]);
    }
    if ((v37 & 1) != 0)

    if ((v22 & 1) != 0)
      v39 = v44 + 20.0;
    v18 = (id)-[PSWebContainerView webView](v51->_releaseNotesSummaryView, "webView");
    v17 = (id)objc_msgSend(v18, "scrollView");
    objc_msgSend(v17, "setScrollEnabled:", 0);

    v20 = (id)-[PSWebContainerView webView](v51->_releaseNotesSummaryView, "webView");
    v19 = (id)objc_msgSend(v20, "scrollView");
    objc_msgSend(v19, "setBounces:", 0);

  }
  else
  {
    v24 = (id)-[PSWebContainerView webView](v51->_releaseNotesSummaryView, "webView", v39);
    v23 = (id)objc_msgSend(v24, "scrollView");
    objc_msgSend(v23, "setScrollEnabled:", 1);

    v26 = (id)-[PSWebContainerView webView](v51->_releaseNotesSummaryView, "webView");
    v25 = (id)objc_msgSend(v26, "scrollView");
    objc_msgSend(v25, "setBounces:", 1);

  }
  objc_storeStrong(location, 0);
  return v39 + v40 + v34 + v33 + 26.0;
}

- (void)layoutSubviews
{
  id v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;
  id v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  SUSSoftwareUpdateTitleCell *v9;

  v9 = self;
  v8 = a2;
  v7 = 0;
  v3 = (NSString *)(id)objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  v7 = IsAccessibilityCategory;
  -[SUSSoftwareUpdateTitleCell configureUpdateNameLabel:](v9, "configureUpdateNameLabel:", IsAccessibilityCategory);
  -[SUSSoftwareUpdateTitleCell configureUpdateStatusLabel:](v9, "configureUpdateStatusLabel:", IsAccessibilityCategory);
  v5 = (id)-[SUSSoftwareUpdateTitleCell contentView](v9, "contentView");
  objc_msgSend(v5, "bringSubviewToFront:", v9->_imageView);

  if (v9->_animatedGearView)
  {
    v2 = (id)-[SUSSoftwareUpdateTitleCell contentView](v9, "contentView");
    objc_msgSend(v2, "bringSubviewToFront:", v9->_animatedGearView);

  }
  v6.receiver = v9;
  v6.super_class = (Class)SUSSoftwareUpdateTitleCell;
  -[PSTableCell layoutSubviews](&v6, sel_layoutSubviews);
}

- (void)setupViews
{
  char v2;
  id v3;
  BOOL v4;
  objc_super v5;
  BOOL v6;
  BOOL IsAccessibilityCategory;
  id location;
  BOOL v9;
  SEL v10;
  SUSSoftwareUpdateTitleCell *v11;

  v11 = self;
  v10 = a2;
  -[SUSSoftwareUpdateTitleCell configureImageView](self, "configureImageView");
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  v9 = v4;
  location = (id)objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)location);
  v6 = 0;
  if (v4)
    v6 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)location, (UIContentSizeCategory)*MEMORY[0x24BEBE0B8]) == NSOrderedDescending;
  else
    v6 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)location, (UIContentSizeCategory)*MEMORY[0x24BEBE0C0]) == NSOrderedDescending;
  -[SUSSoftwareUpdateTitleCell configureUpdateLabelsStackViewConstraints](v11, "configureUpdateLabelsStackViewConstraints");
  v2 = 1;
  if (!IsAccessibilityCategory)
    v2 = v6;
  -[SUSSoftwareUpdateTitleCell configureReleaseNotesSummaryView:](v11, "configureReleaseNotesSummaryView:", v2 & 1);
  v5.receiver = v11;
  v5.super_class = (Class)SUSSoftwareUpdateTitleCell;
  -[SUSSoftwareUpdateTitleCell updateConstraints](&v5, sel_updateConstraints);
  objc_storeStrong(&location, 0);
}

- (void)configureImageView
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIImage *v6;
  UIImage *v7;
  id v8;
  UIImage *updateIcon;
  char v10;
  UIImage *v11;
  id location[2];
  SUSSoftwareUpdateTitleCell *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = -[SUSSoftwareUpdateTitleCell configureUpdateIcon](self, "configureUpdateIcon");
  v10 = 0;
  if (v13->_updateIcon)
  {
    updateIcon = v13->_updateIcon;
  }
  else
  {
    v11 = -[SUSSoftwareUpdateTitleCell gearBackgroundImage](v13, "gearBackgroundImage");
    v10 = 1;
    updateIcon = v11;
  }
  objc_msgSend(location[0], "setImage:", updateIcon);
  if ((v10 & 1) != 0)

  v8 = (id)-[SUSSoftwareUpdateTitleCell contentView](v13, "contentView");
  objc_msgSend(v8, "addSubview:", location[0]);

  objc_storeStrong((id *)&v13->_imageView, location[0]);
  if (v13->_updateIcon)
  {
    v7 = -[UIImageView image](v13->_imageView, "image");
    -[UIImage size](v7, "size");
    -[SUSSoftwareUpdateTitleCell configureUpdateImageViewFromImageSize:](v13, "configureUpdateImageViewFromImageSize:", v2, v3);

  }
  else
  {
    v6 = -[UIImageView image](v13->_imageView, "image");
    -[UIImage size](v6, "size");
    -[SUSSoftwareUpdateTitleCell configureAnimatedGearViewFromImageSize:](v13, "configureAnimatedGearViewFromImageSize:", v4, v5);

  }
  -[UIImageView setAccessibilityIdentifier:](v13->_imageView, "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateTitleCellIcon"));
  objc_storeStrong(location, 0);
}

- (void)configureAnimatedGearViewFromImageSize:(CGSize)a3
{
  SUSSoftwareUpdateAnimatedIcon *v3;
  SUSSoftwareUpdateAnimatedIcon *animatedGearView;
  double v5;
  NSArray *v6;
  NSArray *updateIconContraints;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double height;
  double width;
  _QWORD v37[9];

  v37[8] = *MEMORY[0x24BDAC8D0];
  v3 = -[SUSSoftwareUpdateTitleCell newSoftwareUpdateAnimatedIconWithFrame:](self, "newSoftwareUpdateAnimatedIconWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  animatedGearView = self->_animatedGearView;
  self->_animatedGearView = v3;

  -[SUSSoftwareUpdateAnimatedIcon setTranslatesAutoresizingMaskIntoConstraints:](self->_animatedGearView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v32 = (id)-[SUSSoftwareUpdateTitleCell contentView](self, "contentView");
  objc_msgSend(v32, "addSubview:", self->_animatedGearView);

  height = a3.height;
  width = a3.width;
  if (a3.width == 0.0 || (v5 = a3.height, a3.height == 0.0))
  {
    v5 = 60.0;
    width = 60.0;
    height = 60.0;
  }
  v31 = (id)-[SUSSoftwareUpdateAnimatedIcon widthAnchor](self->_animatedGearView, "widthAnchor", v5);
  v30 = (id)objc_msgSend(v31, "constraintEqualToConstant:", width);
  v37[0] = v30;
  v29 = (id)-[SUSSoftwareUpdateAnimatedIcon heightAnchor](self->_animatedGearView, "heightAnchor");
  v28 = (id)objc_msgSend(v29, "constraintEqualToConstant:", height);
  v37[1] = v28;
  v27 = (id)-[SUSSoftwareUpdateAnimatedIcon leadingAnchor](self->_animatedGearView, "leadingAnchor");
  v26 = (id)-[SUSSoftwareUpdateTitleCell contentView](self, "contentView");
  v25 = (id)objc_msgSend(v26, "leadingAnchor");
  v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:constant:");
  v37[2] = v24;
  v23 = (id)-[SUSSoftwareUpdateAnimatedIcon topAnchor](self->_animatedGearView, "topAnchor");
  v22 = (id)-[SUSSoftwareUpdateTitleCell contentView](self, "contentView");
  v21 = (id)objc_msgSend(v22, "topAnchor");
  v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:constant:", 17.0);
  v37[3] = v20;
  v19 = (id)-[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v18 = (id)objc_msgSend(v19, "constraintEqualToConstant:", width);
  v37[4] = v18;
  v17 = (id)-[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v16 = (id)objc_msgSend(v17, "constraintEqualToConstant:", height);
  v37[5] = v16;
  v15 = (id)-[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v14 = (id)-[SUSSoftwareUpdateTitleCell contentView](self, "contentView");
  v13 = (id)objc_msgSend(v14, "leadingAnchor");
  v12 = (id)objc_msgSend(v15, "constraintEqualToAnchor:constant:", 17.0);
  v37[6] = v12;
  v11 = (id)-[UIImageView topAnchor](self->_imageView, "topAnchor");
  v10 = (id)-[SUSSoftwareUpdateTitleCell contentView](self, "contentView");
  v9 = (id)objc_msgSend(v10, "topAnchor");
  v8 = (id)objc_msgSend(v11, "constraintEqualToAnchor:constant:", 17.0);
  v37[7] = v8;
  v6 = (NSArray *)(id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 8);
  updateIconContraints = self->_updateIconContraints;
  self->_updateIconContraints = v6;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_updateIconContraints);
}

- (void)configureUpdateImageViewFromImageSize:(CGSize)a3
{
  double v3;
  NSArray *v4;
  NSArray *updateIconContraints;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double height;
  double width;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  width = a3.width;
  height = a3.height;
  if (a3.width == 0.0 || (v3 = a3.height, a3.height == 0.0))
  {
    v3 = 60.0;
    width = 60.0;
    height = 60.0;
  }
  v18 = (id)-[UIImageView widthAnchor](self->_imageView, "widthAnchor", v3, 0x255C3A000uLL);
  v17 = (id)objc_msgSend(v18, "constraintEqualToConstant:", width);
  v22[0] = v17;
  v16 = (id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ *(int *)(v6 + 948)), "heightAnchor");
  v15 = (id)objc_msgSend(v16, "constraintEqualToConstant:", height);
  v22[1] = v15;
  v14 = (id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ *(int *)(v6 + 948)), "leadingAnchor");
  v13 = (id)-[SUSSoftwareUpdateTitleCell contentView](self, "contentView");
  v12 = (id)objc_msgSend(v13, "leadingAnchor");
  v11 = (id)objc_msgSend(v14, "constraintEqualToAnchor:constant:");
  v22[2] = v11;
  v10 = (id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ *(int *)(v6 + 948)), "topAnchor");
  v9 = (id)-[SUSSoftwareUpdateTitleCell contentView](self, "contentView");
  v8 = (id)objc_msgSend(v9, "topAnchor");
  v7 = (id)objc_msgSend(v10, "constraintEqualToAnchor:constant:", 17.0);
  v22[3] = v7;
  v4 = (NSArray *)(id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  updateIconContraints = self->_updateIconContraints;
  self->_updateIconContraints = v4;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_updateIconContraints);
}

- (id)configureUpdateIcon
{
  id v2;
  id v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v2 = objc_alloc(MEMORY[0x24BEBD668]);
  v5[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5[0], "sizeToFit");
  objc_msgSend(v5[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = v5[0];
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)configureUpdateLabelsStackViewConstraints
{
  UIStackView *v2;
  UIStackView *updateLabelsStackView;
  NSMutableArray *v4;
  NSMutableArray *updateLabelsConstraints;
  double v6;
  double v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSString *v25;
  BOOL IsAccessibilityCategory;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v25 = (NSString *)(id)objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);

  if (!self->_updateLabelsStackView)
  {
    v2 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    updateLabelsStackView = self->_updateLabelsStackView;
    self->_updateLabelsStackView = v2;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_updateLabelsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_updateLabelsStackView, "setAxis:", 1);
  }
  v24 = (id)-[SUSSoftwareUpdateTitleCell contentView](self, "contentView");
  objc_msgSend(v24, "addSubview:", self->_updateLabelsStackView);

  if (self->_updateLabelsConstraints)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_updateLabelsConstraints);
    -[NSMutableArray removeAllObjects](self->_updateLabelsConstraints, "removeAllObjects");
  }
  else
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    updateLabelsConstraints = self->_updateLabelsConstraints;
    self->_updateLabelsConstraints = v4;

  }
  v12 = self->_updateLabelsConstraints;
  v23 = (id)-[UIStackView topAnchor](self->_updateLabelsStackView, "topAnchor");
  v22 = (id)-[UIImageView topAnchor](self->_imageView, "topAnchor");
  v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
  v28[0] = v21;
  v20 = (id)-[UIStackView leadingAnchor](self->_updateLabelsStackView, "leadingAnchor");
  v19 = (id)-[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
  v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:constant:", 12.0);
  v28[1] = v18;
  v17 = (id)-[UIStackView trailingAnchor](self->_updateLabelsStackView, "trailingAnchor");
  v16 = (id)-[SUSSoftwareUpdateTitleCell contentView](self, "contentView");
  v15 = (id)objc_msgSend(v16, "trailingAnchor");
  v14 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", -12.0);
  v28[2] = v14;
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:");

  if (self->_progressStyle)
  {
    -[UIStackView setDistribution:](self->_updateLabelsStackView, "setDistribution:", 4);
    LODWORD(v6) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](self->_updateLabelsStackView, "setContentHuggingPriority:forAxis:", 1, v6);
    v8 = self->_updateLabelsConstraints;
    v11 = (id)-[UIStackView bottomAnchor](self->_updateLabelsStackView, "bottomAnchor");
    v10 = (id)-[UIImageView bottomAnchor](self->_imageView, "bottomAnchor");
    v9 = (id)objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:");
    -[NSMutableArray addObject:](v8, "addObject:");

  }
  else
  {
    -[UIStackView setDistribution:](self->_updateLabelsStackView, "setDistribution:", 2);
    -[UIStackView setSpacing:](self->_updateLabelsStackView, "setSpacing:", 3.0);
    LODWORD(v7) = 1132068864;
    -[UIStackView setContentHuggingPriority:forAxis:](self->_updateLabelsStackView, "setContentHuggingPriority:forAxis:", 1, v7);
  }
  -[SUSSoftwareUpdateTitleCell configureUpdateNameLabel:](self, "configureUpdateNameLabel:", IsAccessibilityCategory);
  -[SUSSoftwareUpdateTitleCell configureUpdateStatusLabel:](self, "configureUpdateStatusLabel:", IsAccessibilityCategory);
  -[SUSSoftwareUpdateTitleCell configureProgressBar:](self, "configureProgressBar:", IsAccessibilityCategory);
  -[UIStackView layoutSubviews](self->_updateLabelsStackView, "layoutSubviews");
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_updateLabelsConstraints);
}

- (void)configureUpdateNameLabel:(BOOL)a3
{
  UILabel *v3;
  UILabel *updateNameLabel;
  double v5;
  id location;
  BOOL v7;
  SEL v8;
  SUSSoftwareUpdateTitleCell *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  location = (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  if (!v9->_updateNameLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    updateNameLabel = v9->_updateNameLabel;
    v9->_updateNameLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_updateNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v9->_updateNameLabel, "setContentHuggingPriority:forAxis:", 1, v5);
    -[UILabel setNumberOfLines:](v9->_updateNameLabel, "setNumberOfLines:");
    -[UILabel setAdjustsFontForContentSizeCategory:](v9->_updateNameLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setFont:](v9->_updateNameLabel, "setFont:", location);
    -[UILabel setTextAlignment:](v9->_updateNameLabel, "setTextAlignment:", 0);
    -[UIStackView addArrangedSubview:](v9->_updateLabelsStackView, "addArrangedSubview:", v9->_updateNameLabel);
  }
  -[UILabel setAccessibilityIdentifier:](v9->_updateNameLabel, "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateTitleCellUpdateName"));
  objc_storeStrong(&location, 0);
}

- (void)configureUpdateStatusLabel:(BOOL)a3
{
  UILabel *v3;
  UILabel *updateStatusLabel;
  double v5;

  if (!self->_updateStatusLabel)
  {
    v3 = -[SUSSoftwareUpdateTitleCell newUpdateStatusLabel](self, "newUpdateStatusLabel");
    updateStatusLabel = self->_updateStatusLabel;
    self->_updateStatusLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_updateStatusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_updateStatusLabel, "setContentHuggingPriority:forAxis:", 1, v5);
    -[UIStackView addArrangedSubview:](self->_updateLabelsStackView, "addArrangedSubview:", self->_updateStatusLabel);
  }
  -[UILabel setAccessibilityIdentifier:](self->_updateStatusLabel, "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateTitleCellUpdateStatus"));
}

- (void)configureReleaseNotesSummaryView:(BOOL)a3
{
  PSWebContainerView *v3;
  PSWebContainerView *releaseNotesSummaryView;
  uint64_t v5;
  UILabel *learnMoreLabel;
  uint64_t v7;
  UILabel *splomboNotes;
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
  uint64_t v33;
  UIStackView *releaseNotesStackView;
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
  uint64_t v47;
  UIStackView *v48;
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
  uint64_t v61;
  UIStackView *v62;
  uint64_t v63;
  UIStackView *v64;
  UIStackView *v65;
  double v66;
  double v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  PSWebContainerView *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  UIStackView *v150;
  id v151[5];
  id v152[5];
  id v153[5];
  id v154;
  id v155[5];
  id v156[5];
  id v157[5];
  id v158;
  id v159[5];
  id v160[5];
  id v161[5];
  id v162;
  id v163[5];
  id v164[5];
  id v165[5];
  id v166;
  BOOL v167;
  SEL v168;
  SUSSoftwareUpdateTitleCell *v169;
  id v170;
  PSWebContainerView *v171;
  _QWORD v172[4];
  _QWORD v173[2];
  _QWORD v174[4];
  _QWORD v175[2];
  _QWORD v176[6];
  _QWORD v177[2];
  _QWORD v178[3];

  v178[2] = *MEMORY[0x24BDAC8D0];
  v169 = self;
  v168 = a2;
  v167 = a3;
  if (!self->_releaseNotesSummaryView)
  {
    v3 = (PSWebContainerView *)objc_alloc_init(MEMORY[0x24BE75658]);
    releaseNotesSummaryView = v169->_releaseNotesSummaryView;
    v169->_releaseNotesSummaryView = v3;

  }
  if (!v169->_learnMoreLabel && (PSIsRunningInAssistant() & 1) == 0 && v169->_showLearnMoreButton)
  {
    v5 = -[SUSSoftwareUpdateTitleCell newLearnMoreLabel](v169, "newLearnMoreLabel");
    learnMoreLabel = v169->_learnMoreLabel;
    v169->_learnMoreLabel = (UILabel *)v5;

  }
  if (!v169->_splomboNotes && v169->_showSplomboNotes)
  {
    v7 = -[SUSSoftwareUpdateTitleCell newSplomboNotesLabel](v169, "newSplomboNotesLabel");
    splomboNotes = v169->_splomboNotes;
    v169->_splomboNotes = (UILabel *)v7;

  }
  if (v169->_learnMoreLabel && v169->_splomboNotes)
  {
    v124 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v165[1] = v9;
    v165[2] = v10;
    v165[3] = v11;
    v165[4] = v12;
    v166 = (id)objc_msgSend(v124, "initWithFrame:", *(double *)&v9, *(double *)&v10, *(double *)&v11, *(double *)&v12);
    v126 = (id)objc_msgSend(v166, "heightAnchor");
    v125 = (id)objc_msgSend(v126, "constraintEqualToConstant:", 10.0);
    objc_msgSend(v125, "setActive:", 1);

    v127 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v164[1] = v13;
    v164[2] = v14;
    v164[3] = v15;
    v164[4] = v16;
    v165[0] = (id)objc_msgSend(v127, "initWithFrame:", *(double *)&v13, *(double *)&v14, *(double *)&v15, *(double *)&v16);
    v129 = (id)objc_msgSend(v165[0], "heightAnchor");
    v128 = (id)objc_msgSend(v129, "constraintEqualToConstant:", 10.0);
    objc_msgSend(v128, "setActive:", 1);

    v130 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v163[1] = v17;
    v163[2] = v18;
    v163[3] = v19;
    v163[4] = v20;
    v164[0] = (id)objc_msgSend(v130, "initWithFrame:", *(double *)&v17, *(double *)&v18, *(double *)&v19, *(double *)&v20);
    v132 = (id)objc_msgSend(v164[0], "widthAnchor");
    v131 = (id)objc_msgSend(v132, "constraintEqualToConstant:", 8.0);
    objc_msgSend(v131, "setActive:", 1);

    v133 = objc_alloc(MEMORY[0x24BEBD978]);
    v178[0] = v164[0];
    v178[1] = v169->_learnMoreLabel;
    v134 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v178);
    v163[0] = (id)objc_msgSend(v133, "initWithArrangedSubviews:");

    objc_msgSend(v163[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v163[0], "setAutoresizesSubviews:", 0);
    objc_msgSend(v163[0], "setAxis:");
    objc_msgSend(v163[0], "setAlignment:");
    objc_msgSend(v163[0], "setDistribution:", 0);
    v135 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v161[1] = v21;
    v161[2] = v22;
    v161[3] = v23;
    v161[4] = v24;
    v162 = (id)objc_msgSend(v135, "initWithFrame:", *(double *)&v21, *(double *)&v22, *(double *)&v23, *(double *)&v24);
    v137 = (id)objc_msgSend(v162, "heightAnchor");
    v136 = (id)objc_msgSend(v137, "constraintEqualToConstant:", 4.0);
    objc_msgSend(v136, "setActive:", 1);

    v138 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v160[1] = v25;
    v160[2] = v26;
    v160[3] = v27;
    v160[4] = v28;
    v161[0] = (id)objc_msgSend(v138, "initWithFrame:", *(double *)&v25, *(double *)&v26, *(double *)&v27, *(double *)&v28);
    v140 = (id)objc_msgSend(v161[0], "heightAnchor");
    v139 = (id)objc_msgSend(v140, "constraintEqualToConstant:", 4.0);
    objc_msgSend(v139, "setActive:", 1);

    v141 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v159[1] = v29;
    v159[2] = v30;
    v159[3] = v31;
    v159[4] = v32;
    v160[0] = (id)objc_msgSend(v141, "initWithFrame:", *(double *)&v29, *(double *)&v30, *(double *)&v31, *(double *)&v32);
    v143 = (id)objc_msgSend(v160[0], "widthAnchor");
    v142 = (id)objc_msgSend(v143, "constraintEqualToConstant:", 8.0);
    objc_msgSend(v142, "setActive:", 1);

    v144 = objc_alloc(MEMORY[0x24BEBD978]);
    v177[0] = v160[0];
    v177[1] = v169->_splomboNotes;
    v145 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v177, 2);
    v159[0] = (id)objc_msgSend(v144, "initWithArrangedSubviews:");

    objc_msgSend(v159[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v159[0], "setAutoresizesSubviews:", 0);
    objc_msgSend(v159[0], "setAxis:", 0);
    objc_msgSend(v159[0], "setAlignment:", 1);
    objc_msgSend(v159[0], "setDistribution:", 0);
    v146 = objc_alloc(MEMORY[0x24BEBD978]);
    v176[0] = v169->_releaseNotesSummaryView;
    v176[1] = v161[0];
    v176[2] = v159[0];
    v176[3] = v165[0];
    v176[4] = v163[0];
    v176[5] = v166;
    v147 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v176, 6);
    v33 = objc_msgSend(v146, "initWithArrangedSubviews:");
    releaseNotesStackView = v169->_releaseNotesStackView;
    v169->_releaseNotesStackView = (UIStackView *)v33;

    objc_storeStrong(v159, 0);
    objc_storeStrong(v160, 0);
    objc_storeStrong(v161, 0);
    objc_storeStrong(&v162, 0);
    objc_storeStrong(v163, 0);
    objc_storeStrong(v164, 0);
    objc_storeStrong(v165, 0);
    objc_storeStrong(&v166, 0);
  }
  else if (v169->_learnMoreLabel)
  {
    v111 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v157[1] = v35;
    v157[2] = v36;
    v157[3] = v37;
    v157[4] = v38;
    v158 = (id)objc_msgSend(v111, "initWithFrame:", *(double *)&v35, *(double *)&v36, *(double *)&v37, *(double *)&v38);
    v113 = (id)objc_msgSend(v158, "heightAnchor");
    v112 = (id)objc_msgSend(v113, "constraintEqualToConstant:", 10.0);
    objc_msgSend(v112, "setActive:", 1);

    v114 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v156[1] = v39;
    v156[2] = v40;
    v156[3] = v41;
    v156[4] = v42;
    v157[0] = (id)objc_msgSend(v114, "initWithFrame:", *(double *)&v39, *(double *)&v40, *(double *)&v41, *(double *)&v42);
    v116 = (id)objc_msgSend(v157[0], "heightAnchor");
    v115 = (id)objc_msgSend(v116, "constraintEqualToConstant:", 10.0);
    objc_msgSend(v115, "setActive:", 1);

    v117 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v155[1] = v43;
    v155[2] = v44;
    v155[3] = v45;
    v155[4] = v46;
    v156[0] = (id)objc_msgSend(v117, "initWithFrame:", *(double *)&v43, *(double *)&v44, *(double *)&v45, *(double *)&v46);
    v119 = (id)objc_msgSend(v156[0], "widthAnchor");
    v118 = (id)objc_msgSend(v119, "constraintEqualToConstant:", 8.0);
    objc_msgSend(v118, "setActive:", 1);

    v120 = objc_alloc(MEMORY[0x24BEBD978]);
    v175[0] = v156[0];
    v175[1] = v169->_learnMoreLabel;
    v121 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v175, 2);
    v155[0] = (id)objc_msgSend(v120, "initWithArrangedSubviews:");

    objc_msgSend(v155[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v155[0], "setAutoresizesSubviews:", 0);
    objc_msgSend(v155[0], "setAxis:");
    objc_msgSend(v155[0], "setAlignment:", 1);
    objc_msgSend(v155[0], "setDistribution:", 0);
    v122 = objc_alloc(MEMORY[0x24BEBD978]);
    v174[0] = v169->_releaseNotesSummaryView;
    v174[1] = v157[0];
    v174[2] = v155[0];
    v174[3] = v158;
    v123 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v174, 4);
    v47 = objc_msgSend(v122, "initWithArrangedSubviews:");
    v48 = v169->_releaseNotesStackView;
    v169->_releaseNotesStackView = (UIStackView *)v47;

    objc_storeStrong(v155, 0);
    objc_storeStrong(v156, 0);
    objc_storeStrong(v157, 0);
    objc_storeStrong(&v158, 0);
  }
  else if (v169->_splomboNotes)
  {
    v98 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v153[1] = v49;
    v153[2] = v50;
    v153[3] = v51;
    v153[4] = v52;
    v154 = (id)objc_msgSend(v98, "initWithFrame:", *(double *)&v49, *(double *)&v50, *(double *)&v51, *(double *)&v52);
    v100 = (id)objc_msgSend(v154, "heightAnchor");
    v99 = (id)objc_msgSend(v100, "constraintEqualToConstant:", 4.0);
    objc_msgSend(v99, "setActive:", 1);

    v101 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v152[1] = v53;
    v152[2] = v54;
    v152[3] = v55;
    v152[4] = v56;
    v153[0] = (id)objc_msgSend(v101, "initWithFrame:", *(double *)&v53, *(double *)&v54, *(double *)&v55, *(double *)&v56);
    v103 = (id)objc_msgSend(v153[0], "heightAnchor");
    v102 = (id)objc_msgSend(v103, "constraintEqualToConstant:", 4.0);
    objc_msgSend(v102, "setActive:", 1);

    v104 = objc_alloc(MEMORY[0x24BEBDB00]);
    CGRectMake();
    v151[1] = v57;
    v151[2] = v58;
    v151[3] = v59;
    v151[4] = v60;
    v152[0] = (id)objc_msgSend(v104, "initWithFrame:", *(double *)&v57, *(double *)&v58, *(double *)&v59, *(double *)&v60);
    v106 = (id)objc_msgSend(v152[0], "widthAnchor");
    v105 = (id)objc_msgSend(v106, "constraintEqualToConstant:", 8.0);
    objc_msgSend(v105, "setActive:", 1);

    v107 = objc_alloc(MEMORY[0x24BEBD978]);
    v173[0] = v152[0];
    v173[1] = v169->_splomboNotes;
    v108 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v173, 2);
    v151[0] = (id)objc_msgSend(v107, "initWithArrangedSubviews:");

    objc_msgSend(v151[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v151[0], "setAutoresizesSubviews:", 0);
    objc_msgSend(v151[0], "setAxis:");
    objc_msgSend(v151[0], "setAlignment:", 1);
    objc_msgSend(v151[0], "setDistribution:", 0);
    v109 = objc_alloc(MEMORY[0x24BEBD978]);
    v172[0] = v169->_releaseNotesSummaryView;
    v172[1] = v153[0];
    v172[2] = v151[0];
    v172[3] = v154;
    v110 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v172, 4);
    v61 = objc_msgSend(v109, "initWithArrangedSubviews:");
    v62 = v169->_releaseNotesStackView;
    v169->_releaseNotesStackView = (UIStackView *)v61;

    objc_storeStrong(v151, 0);
    objc_storeStrong(v152, 0);
    objc_storeStrong(v153, 0);
    objc_storeStrong(&v154, 0);
  }
  else
  {
    v96 = objc_alloc(MEMORY[0x24BEBD978]);
    v171 = v169->_releaseNotesSummaryView;
    v97 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v171, 1);
    v63 = objc_msgSend(v96, "initWithArrangedSubviews:");
    v64 = v169->_releaseNotesStackView;
    v169->_releaseNotesStackView = (UIStackView *)v63;

  }
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v169->_releaseNotesStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAutoresizesSubviews:](v169->_releaseNotesStackView, "setAutoresizesSubviews:", 0);
  -[UIStackView setAxis:](v169->_releaseNotesStackView, "setAxis:");
  -[UIStackView setAlignment:](v169->_releaseNotesStackView, "setAlignment:", 1);
  -[UIStackView setDistribution:](v169->_releaseNotesStackView, "setDistribution:", 0);
  -[UIStackView setLayoutMarginsRelativeArrangement:](v169->_releaseNotesStackView, "setLayoutMarginsRelativeArrangement:", 1);
  v83 = (id)-[SUSSoftwareUpdateTitleCell contentView](v169, "contentView");
  objc_msgSend(v83, "addSubview:", v169->_releaseNotesStackView);

  v87 = (id)-[UIStackView leadingAnchor](v169->_releaseNotesStackView, "leadingAnchor");
  v86 = (id)-[SUSSoftwareUpdateTitleCell contentView](v169, "contentView");
  v85 = (id)objc_msgSend(v86, "leadingAnchor");
  v84 = (id)objc_msgSend(v87, "constraintEqualToAnchor:constant:", 8.0);
  objc_msgSend(v84, "setActive:", 1);

  v91 = (id)-[UIStackView trailingAnchor](v169->_releaseNotesStackView, "trailingAnchor");
  v90 = (id)-[SUSSoftwareUpdateTitleCell contentView](v169, "contentView");
  v89 = (id)objc_msgSend(v90, "trailingAnchor");
  v88 = (id)objc_msgSend(v91, "constraintEqualToAnchor:constant:", -8.0);
  objc_msgSend(v88, "setActive:", 1);

  v95 = (id)-[UIStackView bottomAnchor](v169->_releaseNotesStackView, "bottomAnchor");
  v94 = (id)-[SUSSoftwareUpdateTitleCell contentView](v169, "contentView");
  v93 = (id)objc_msgSend(v94, "bottomAnchor");
  v92 = (id)objc_msgSend(v95, "constraintEqualToAnchor:");
  objc_msgSend(v92, "setActive:", 1);

  if (v167)
    v65 = v169->_releaseNotesStackView;
  else
    v65 = v169->_releaseNotesSummaryView;
  v150 = v65;
  v69 = (id)-[UIStackView topAnchor](v65, "topAnchor");
  v68 = (id)-[UIStackView bottomAnchor](v169->_updateLabelsStackView, "bottomAnchor");
  v149 = (id)objc_msgSend(v69, "constraintEqualToAnchor:constant:");

  LODWORD(v66) = 1144750080;
  objc_msgSend(v149, "setPriority:", v66);
  objc_msgSend(v149, "setActive:", 1);
  v71 = (id)-[UIStackView topAnchor](v150, "topAnchor");
  v70 = (id)-[UIImageView bottomAnchor](v169->_imageView, "bottomAnchor");
  v148 = (id)objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:constant:", 4.0);

  LODWORD(v67) = 1148846080;
  objc_msgSend(v148, "setPriority:", v67);
  objc_msgSend(v148, "setActive:", 1);
  v75 = (id)-[PSWebContainerView leadingAnchor](v169->_releaseNotesSummaryView, "leadingAnchor");
  v74 = (id)-[SUSSoftwareUpdateTitleCell contentView](v169, "contentView");
  v73 = (id)objc_msgSend(v74, "leadingAnchor");
  v72 = (id)objc_msgSend(v75, "constraintEqualToAnchor:constant:", 8.0);
  objc_msgSend(v72, "setActive:", 1);

  v79 = (id)-[PSWebContainerView trailingAnchor](v169->_releaseNotesSummaryView, "trailingAnchor");
  v78 = (id)-[SUSSoftwareUpdateTitleCell contentView](v169, "contentView");
  v77 = (id)objc_msgSend(v78, "trailingAnchor");
  v76 = (id)objc_msgSend(v79, "constraintEqualToAnchor:constant:", -8.0);
  objc_msgSend(v76, "setActive:", 1);

  -[PSWebContainerView setAccessibilityIdentifier:](v169->_releaseNotesSummaryView, "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateTitleCellReleaseNotesSummary"));
  v80 = v169->_releaseNotesSummaryView;
  v82 = (id)-[PSWebContainerView webView](v80, "webView");
  v170 = v82;
  v81 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v170, 1);
  -[PSWebContainerView setAccessibilityElements:](v80, "setAccessibilityElements:");

  -[PSWebContainerView setAccessibilityContainerType:](v169->_releaseNotesSummaryView, "setAccessibilityContainerType:", 4);
  objc_storeStrong(&v148, 0);
  objc_storeStrong(&v149, 0);
  objc_storeStrong((id *)&v150, 0);
}

- (void)configureProgressBar:(BOOL)a3
{
  UIProgressView *v3;
  UIProgressView *progressBar;

  if (!self->_progressBar)
  {
    v3 = -[SUSSoftwareUpdateTitleCell newProgressBar](self, "newProgressBar");
    progressBar = self->_progressBar;
    self->_progressBar = v3;

    if (self->_progressStyle)
    {
      -[UIStackView addArrangedSubview:](self->_updateLabelsStackView, "addArrangedSubview:", self->_progressBar);
      -[UIProgressView setAlpha:](self->_progressBar, "setAlpha:", 1.0);
      -[UIProgressView setHidden:](self->_progressBar, "setHidden:", 0);
    }
    else
    {
      -[UIProgressView removeFromSuperview](self->_progressBar, "removeFromSuperview");
      -[UIProgressView setAlpha:](self->_progressBar, "setAlpha:", 0.0);
      -[UIProgressView setHidden:](self->_progressBar, "setHidden:", 1);
    }
  }
  -[SUSSoftwareUpdateTitleCell updateProgressTintColor](self, "updateProgressTintColor");
  -[UIProgressView setAccessibilityIdentifier:](self->_progressBar, "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateTitleCellProgressBar"));
}

- (void)updateProgressTintColor
{
  UIProgressView *v2;
  id v3;
  UIProgressView *progressBar;
  id v5;

  if (self->_progressStyle == 2)
  {
    progressBar = self->_progressBar;
    v5 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    -[UIProgressView setProgressTintColor:](progressBar, "setProgressTintColor:");

  }
  else if (self->_progressStyle == 1)
  {
    v2 = self->_progressBar;
    v3 = (id)-[SUSSoftwareUpdateTitleCell tintColor](self, "tintColor");
    -[UIProgressView setProgressTintColor:](v2, "setProgressTintColor:");

  }
}

- (void)setProgressDisplayStyle:(int)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  SUSSoftwareUpdateTitleCell *v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  SUSSoftwareUpdateTitleCell *v18;
  int v19;
  SEL v20;
  SUSSoftwareUpdateTitleCell *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  if (self->_progressStyle != a3)
  {
    v21->_progressStyle = v19;
    -[SUSSoftwareUpdateTitleCell updateProgressTintColor](v21, "updateProgressTintColor");
    if (v21->_progressStyle)
    {
      -[UIStackView addArrangedSubview:](v21->_updateLabelsStackView, "addArrangedSubview:", v21->_progressBar);
      -[UIProgressView setAlpha:](v21->_progressBar, "setAlpha:", 1.0);
      -[UIProgressView setHidden:](v21->_progressBar, "setHidden:", 0);
    }
    else
    {
      -[UIProgressView removeFromSuperview](v21->_progressBar, "removeFromSuperview");
      -[UIProgressView setAlpha:](v21->_progressBar, "setAlpha:", 0.0);
      -[UIProgressView setHidden:](v21->_progressBar, "setHidden:", 1);
    }
    -[SUSSoftwareUpdateTitleCell configureUpdateLabelsStackViewConstraints](v21, "configureUpdateLabelsStackViewConstraints");
    v3 = (id)-[SUSSoftwareUpdateTitleCell superview](v21, "superview");
    v6 = v3 != 0;

    if (v6)
    {
      -[SUSSoftwareUpdateTitleCell layoutIfNeeded](v21, "layoutIfNeeded");
      v5 = (void *)MEMORY[0x24BEBDB00];
      v4 = MEMORY[0x24BDAC760];
      v13 = MEMORY[0x24BDAC760];
      v14 = -1073741824;
      v15 = 0;
      v16 = __54__SUSSoftwareUpdateTitleCell_setProgressDisplayStyle___block_invoke;
      v17 = &unk_24F7630A8;
      v18 = v21;
      v7 = v4;
      v8 = -1073741824;
      v9 = 0;
      v10 = __54__SUSSoftwareUpdateTitleCell_setProgressDisplayStyle___block_invoke_2;
      v11 = &unk_24F7630D0;
      v12 = v21;
      objc_msgSend(v5, "animateWithDuration:animations:completion:", &v13, &v7, 0.3);
      objc_storeStrong((id *)&v12, 0);
      objc_storeStrong((id *)&v18, 0);
    }
    else
    {
      -[SUSSoftwareUpdateTitleCell setNeedsUpdateConstraints](v21, "setNeedsUpdateConstraints");
    }
  }
}

uint64_t __54__SUSSoftwareUpdateTitleCell_setProgressDisplayStyle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
  objc_msgSend(*(id *)(a1 + 32), "updateConstraintsIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __54__SUSSoftwareUpdateTitleCell_setProgressDisplayStyle___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (!*(_DWORD *)(*(_QWORD *)(result + 32) + 1200))
  {
    objc_msgSend(*(id *)(result + 32), "setNeedsUpdateConstraints");
    objc_msgSend(*(id *)(v1 + 32), "updateConstraintsIfNeeded");
    return objc_msgSend(*(id *)(v1 + 32), "layoutIfNeeded");
  }
  return result;
}

- (int)progressDisplayStyle
{
  return self->_progressStyle;
}

- (void)setProgress:(float)a3
{
  -[UIProgressView setProgress:animated:](self->_progressBar, "setProgress:animated:", 0, *(double *)&a3);
}

- (id)newSoftwareUpdateAnimatedIconWithFrame:(CGRect)a3
{
  return -[SUSSoftwareUpdateAnimatedIcon initWithFrame:]([SUSSoftwareUpdateAnimatedIcon alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setReleaseNotesSummary:(id)a3
{
  id v3;
  SUSReleaseNotesProcessor *v4;
  PSWebContainerView *releaseNotesSummaryView;
  id v6;
  id v7;
  id v8;
  id location[2];
  SUSSoftwareUpdateTitleCell *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8 = (id)objc_msgSend(v3, "initWithData:encoding:", location[0]);
  v4 = +[SUSReleaseNotesProcessor sharedInstance](SUSReleaseNotesProcessor, "sharedInstance");
  v7 = -[SUSReleaseNotesProcessor normalizeHtmlReleaseNotes:](v4, "normalizeHtmlReleaseNotes:", v8);

  releaseNotesSummaryView = v10->_releaseNotesSummaryView;
  v6 = (id)objc_msgSend(v7, "dataUsingEncoding:", 4);
  -[PSWebContainerView setContent:](releaseNotesSummaryView, "setContent:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)setUpdateName:(id)a3
{
  id location[2];
  SUSSoftwareUpdateTitleCell *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UILabel setText:](v4->_updateNameLabel, "setText:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)setStatusMessage:(id)a3
{
  id location[2];
  SUSSoftwareUpdateTitleCell *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UILabel setText:](v4->_updateStatusLabel, "setText:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)setStatusMessage:(id)a3 symbolizingError:(BOOL)a4
{
  id v4;
  UILabel *updateStatusLabel;
  char v7;
  id v8;
  char v9;
  id v10;
  id location[2];
  SUSSoftwareUpdateTitleCell *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UILabel setText:](v12->_updateStatusLabel, "setText:", location[0]);
  updateStatusLabel = v12->_updateStatusLabel;
  v9 = 0;
  v7 = 0;
  if (a4)
  {
    v10 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v9 = 1;
    v4 = v10;
  }
  else
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v7 = 1;
    v4 = v8;
  }
  -[UILabel setTextColor:](updateStatusLabel, "setTextColor:", v4, v4);
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  objc_storeStrong(location, 0);
}

- (void)setLearnMoreText:(id)a3
{
  id location[2];
  SUSSoftwareUpdateTitleCell *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UILabel setText:](v4->_learnMoreLabel, "setText:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)setPublisherText:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)setAnimatingGearView:(BOOL)a3
{
  if (self->_animatedGearView)
    -[SUSSoftwareUpdateAnimatedIcon setAnimating:](self->_animatedGearView, "setAnimating:", a3);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id location[2];
  SUSSoftwareUpdateTitleCell *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 && v6->_animatingGearView)
    -[SUSSoftwareUpdateTitleCell setAnimatingGearView:](v6, "setAnimatingGearView:", 1);
  objc_storeStrong(location, 0);
}

- (void)setUpdateIcon:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  SUSSoftwareUpdateTitleCell *v7;
  UIImage *v8;
  SUSSoftwareUpdateTitleCell *v9;
  UIImage *v10;
  UIImage *updateIcon;
  UIImageView *imageView;
  char v13;
  UIImage *v14;
  id location[2];
  SUSSoftwareUpdateTitleCell *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[UIImage isEqual:](v16->_updateIcon, "isEqual:", location[0]) & 1) == 0 && (v16->_updateIcon || location[0]))
  {
    objc_storeStrong((id *)&v16->_updateIcon, location[0]);
    if (v16->_updateIconContraints)
      objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", v16->_updateIconContraints);
    if (v16->_animatedGearView)
    {
      -[SUSSoftwareUpdateAnimatedIcon removeFromSuperview](v16->_animatedGearView, "removeFromSuperview");
      objc_storeStrong((id *)&v16->_animatedGearView, 0);
    }
    imageView = v16->_imageView;
    v13 = 0;
    if (v16->_updateIcon)
    {
      updateIcon = v16->_updateIcon;
    }
    else
    {
      v14 = -[SUSSoftwareUpdateTitleCell gearBackgroundImage](v16, "gearBackgroundImage");
      v13 = 1;
      updateIcon = v14;
    }
    -[UIImageView setImage:](imageView, "setImage:", updateIcon);
    if ((v13 & 1) != 0)

    if (v16->_updateIcon)
    {
      v9 = v16;
      v10 = -[UIImageView image](v16->_imageView, "image");
      -[UIImage size](v10, "size");
      -[SUSSoftwareUpdateTitleCell configureUpdateImageViewFromImageSize:](v9, "configureUpdateImageViewFromImageSize:", v3, v4);

    }
    else
    {
      v7 = v16;
      v8 = -[UIImageView image](v16->_imageView, "image");
      -[UIImage size](v8, "size");
      -[SUSSoftwareUpdateTitleCell configureAnimatedGearViewFromImageSize:](v7, "configureAnimatedGearViewFromImageSize:", v5, v6);

    }
  }
  objc_storeStrong(location, 0);
}

- (UIImage)gearBackgroundImage
{
  void *v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v3 = (void *)MEMORY[0x24BEBD640];
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6[0] = (id)objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("PreferencesIconBackground"));

  v5 = v6[0];
  objc_storeStrong(v6, 0);
  return (UIImage *)v5;
}

- (id)newProgressBar
{
  double v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  CGAffineTransform v11;
  id v12[3];

  v12[2] = self;
  v12[1] = (id)a2;
  v12[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD8A0]), "initWithProgressViewStyle:", 0);
  objc_msgSend(v12[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12[0], "setClipsToBounds:", 1);
  v4 = v12[0];
  CGAffineTransformMakeScale(&v11, 1.0, 0.75);
  objc_msgSend(v4, "setTransform:", &v11);
  v5 = v12[0];
  v7 = (id)objc_msgSend(v12[0], "heightAnchor");
  v6 = (id)objc_msgSend(v7, "constraintEqualToConstant:", 6.0);
  objc_msgSend(v5, "addConstraint:");

  v8 = (id)objc_msgSend(v12[0], "layer");
  objc_msgSend(v12[0], "bounds");
  objc_msgSend(v8, "setCornerRadius:", v2 / 2.0);

  v9 = (id)objc_msgSend(v12[0], "layer");
  objc_msgSend(v9, "setMasksToBounds:", 1);

  v10 = v12[0];
  objc_storeStrong(v12, 0);
  return v10;
}

- (id)newUpdateStatusLabel
{
  id v2;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v2 = objc_alloc(MEMORY[0x24BEBD708]);
  v7[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v7[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = v7[0];
  v5 = (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  objc_msgSend(v4, "setFont:");

  objc_msgSend(v7[0], "setNumberOfLines:", 2);
  objc_msgSend(v7[0], "setLineBreakMode:", 0);
  v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

- (id)newSplomboNotesLabel
{
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13[3];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v13[2] = self;
  v13[1] = (id)a2;
  v2 = objc_alloc(MEMORY[0x24BEBD708]);
  v13[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v4 = v13[0];
  v5 = (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  objc_msgSend(v4, "setFont:");

  objc_msgSend(v13[0], "setNumberOfLines:", 2);
  objc_msgSend(v13[0], "setLineBreakMode:", 0);
  objc_msgSend(v13[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = objc_alloc(MEMORY[0x24BDD1688]);
  v10 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SPLOMBO_UPDATE_INFO"), &stru_24F764478, CFSTR("Software Update"));
  v14 = *MEMORY[0x24BEBB368];
  v8 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v15[0] = v8;
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (id)objc_msgSend(v6, "initWithString:attributes:", v9);

  objc_msgSend(v13[0], "setAttributedText:", v12);
  objc_msgSend(v13[0], "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateTitleCellSplomboNotes"));
  v11 = v13[0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return v11;
}

- (id)newLearnMoreLabel
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16[2];
  SUSSoftwareUpdateTitleCell *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16[1] = (id)a2;
  v2 = objc_alloc(MEMORY[0x24BEBD708]);
  v16[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v16[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = v16[0];
  v6 = (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
  objc_msgSend(v5, "setFont:");

  objc_msgSend(v16[0], "setNumberOfLines:");
  objc_msgSend(v16[0], "setLineBreakMode:", 2);
  objc_msgSend(v16[0], "setTextAlignment:", 0);
  objc_msgSend(v16[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = objc_alloc(MEMORY[0x24BDD1688]);
  v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_LINK"), &stru_24F764478, CFSTR("Software Update"));
  v18 = *MEMORY[0x24BEBB368];
  v9 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v19[0] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v15 = (id)objc_msgSend(v7, "initWithString:attributes:", v10);

  objc_msgSend(v16[0], "setUserInteractionEnabled:", 1);
  v12 = v16[0];
  v3 = objc_alloc(MEMORY[0x24BEBDA20]);
  v13 = (id)objc_msgSend(v3, "initWithTarget:action:", v17, sel_handleLearnMoreTap_);
  objc_msgSend(v12, "addGestureRecognizer:");

  objc_msgSend(v16[0], "setAttributedText:", v15);
  objc_msgSend(v16[0], "setAccessibilityIdentifier:", CFSTR("SUSSoftwareUpdateTitleCellLearnMore"));
  v14 = v16[0];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  return v14;
}

- (void)handleLearnMoreTap:(id)a3
{
  id v3;
  id WeakRetained;
  char v5;
  char v6;
  id v7;
  id location[2];
  SUSSoftwareUpdateTitleCell *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v9->_delegate);
  v6 = 0;
  v5 = 0;
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&v9->_delegate);
    v6 = 1;
    v5 = objc_opt_respondsToSelector();
  }
  if ((v6 & 1) != 0)

  if ((v5 & 1) != 0)
  {
    v3 = objc_loadWeakRetained((id *)&v9->_delegate);
    objc_msgSend(v3, "titleCell:learnMoreButtonTapped:", v9, v9->_learnMoreLabel);

  }
  objc_storeStrong(location, 0);
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (UILabel)updateNameLabel
{
  return self->_updateNameLabel;
}

- (UILabel)updateStatusLabel
{
  return self->_updateStatusLabel;
}

- (UILabel)learnMoreLabel
{
  return self->_learnMoreLabel;
}

- (UILabel)splomboNotes
{
  return self->_splomboNotes;
}

- (PSWebContainerView)releaseNotesSummaryView
{
  return self->_releaseNotesSummaryView;
}

- (NSLayoutConstraint)updateStatusLabelVerticalConstraint
{
  return self->_updateStatusLabelVerticalConstraint;
}

- (void)setUpdateStatusLabelVerticalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_updateStatusLabelVerticalConstraint, a3);
}

- (SUSUISoftwareUpdateTitleCellDelegate)delegate
{
  return (SUSUISoftwareUpdateTitleCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateStatusLabelVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_releaseNotesSummaryView, 0);
  objc_storeStrong((id *)&self->_splomboNotes, 0);
  objc_storeStrong((id *)&self->_learnMoreLabel, 0);
  objc_storeStrong((id *)&self->_updateStatusLabel, 0);
  objc_storeStrong((id *)&self->_updateNameLabel, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_updateIconContraints, 0);
  objc_storeStrong((id *)&self->_updateLabelsConstraints, 0);
  objc_storeStrong((id *)&self->_updateLabelsStackView, 0);
  objc_storeStrong((id *)&self->_releaseNotesStackView, 0);
  objc_storeStrong((id *)&self->_updateIcon, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_animatedGearView, 0);
}

@end

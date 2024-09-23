@implementation TPSBookendsCollectionViewCell

- (TPSBookendsCollectionViewCell)initWithFrame:(CGRect)a3
{
  TPSBookendsCollectionViewCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSLayoutConstraint *heroAssetViewWidthConstraint;
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
  uint64_t v24;
  NSLayoutConstraint *titleLabelCenterXConstraint;
  void *v26;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *titleLabelWidthConstraint;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)TPSBookendsCollectionViewCell;
  v3 = -[TPSBaseTipCollectionViewCell initWithFrame:](&v34, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultBackgroundColor](TPSAppearance, "defaultBackgroundColor"));
    -[TPSBaseTipCollectionViewCell setNoImageBackgroundColorOverride:](v3, "setNoImageBackgroundColorOverride:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](v3, "heroAssetView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell titleLabel](v3, "titleLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v3, "contentScrollView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    objc_msgSend(v10, "setActive:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 0.0));
    heroAssetViewWidthConstraint = v3->_heroAssetViewWidthConstraint;
    v3->_heroAssetViewWidthConstraint = (NSLayoutConstraint *)v12;

    -[NSLayoutConstraint setActive:](v3->_heroAssetViewWidthConstraint, "setActive:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 0.0));
    -[TPSBaseTipCollectionViewCell setAssetViewHeightConstraint:](v3, "setAssetViewHeightConstraint:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell assetViewHeightConstraint](v3, "assetViewHeightConstraint"));
    objc_msgSend(v16, "setActive:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));

    objc_msgSend(v19, "setActive:", 1);
    -[TPSBaseTipCollectionViewCell setAssetViewLayoutGuideCenterXConstraint:](v3, "setAssetViewLayoutGuideCenterXConstraint:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v6, "setBackgroundColor:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "frameLayoutGuide"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerXAnchor"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
    titleLabelCenterXConstraint = v3->_titleLabelCenterXConstraint;
    v3->_titleLabelCenterXConstraint = (NSLayoutConstraint *)v24;

    -[NSLayoutConstraint setActive:](v3->_titleLabelCenterXConstraint, "setActive:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "widthAnchor"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    titleLabelWidthConstraint = v3->_titleLabelWidthConstraint;
    v3->_titleLabelWidthConstraint = (NSLayoutConstraint *)v28;

    -[NSLayoutConstraint setActive:](v3->_titleLabelWidthConstraint, "setActive:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 40.0));
    objc_msgSend(v32, "setActive:", 1);

    -[TPSBaseTipCollectionViewCell updateFonts](v3, "updateFonts");
  }
  return v3;
}

- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;
  unsigned int v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;
  -[TPSBaseTipCollectionViewCell cacheCellSize](self, "cacheCellSize");
  v14 = v11 == v13 && v9 == v12;
  v30.receiver = self;
  v30.super_class = (Class)TPSBookendsCollectionViewCell;
  v15 = -[TPSBaseTipCollectionViewCell setTip:withCellAppearance:](&v30, "setTip:withCellAppearance:", v6, v7);
  v16 = objc_msgSend(v6, "isOutro");
  v17 = 1.0;
  if (v16)
  {
    objc_msgSend(v7, "outroWidthMultiplier", 1.0);
    v17 = -v18;
  }
  -[TPSBaseTipCollectionViewCell setImageParallaxMultiplier:](self, "setImageParallaxMultiplier:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v19, "setAccessibilityIgnoresInvertColors:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](self, "contentLabel"));
  objc_msgSend(v20, "setAccessibilityIgnoresInvertColors:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullContent"));
  v22 = objc_msgSend(v21, "labelStyle");

  if (v22)
    v23 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v23 = objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultLabelColor](TPSAppearance, "defaultLabelColor"));
  v24 = (void *)v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v25, "setTextColor:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell titleLabel](self, "titleLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "textColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](self, "contentLabel"));
  objc_msgSend(v28, "setTextColor:", v27);

  if (!v14)
    -[TPSBookendsCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

  return v15;
}

- (id)titleFont
{
  return +[TPSAppearance systemFontOfSize:weight:](TPSAppearance, "systemFontOfSize:weight:", 40.0, UIFontWeightBold);
}

- (void)updateConstraints
{
  void *v3;
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
  void *v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TPSBookendsCollectionViewCell;
  -[TPSBaseTipCollectionViewCell updateConstraints](&v16, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell cellAppearance](self, "cellAppearance"));
  objc_msgSend(v3, "size");
  v5 = v4;
  objc_msgSend(v3, "bookendsHeightMultiplier");
  v7 = v6;
  objc_msgSend(v3, "size");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  if (objc_msgSend(v10, "isOutro"))
  {
    objc_msgSend(v3, "outroWidthMultiplier");
    v12 = v11;

    if (v12 != 0.0)
    {
      objc_msgSend(v3, "outroWidthMultiplier");
      v9 = v9 * v13;
    }
  }
  else
  {

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](self, "heroAssetView"));
  objc_msgSend(v14, "setAspectFillAsset:", 1);

  -[NSLayoutConstraint setConstant:](self->_heroAssetViewWidthConstraint, "setConstant:", v9);
  -[NSLayoutConstraint setConstant:](self->_heroAssetViewHeightConstraint, "setConstant:", ceil(v5 * v7));
  objc_msgSend(v3, "bookendsContentSidePadding");
  -[NSLayoutConstraint setConstant:](self->_titleLabelWidthConstraint, "setConstant:", v15 * -2.0);

}

- (BOOL)bookendAssetUnderTitle
{
  return self->_bookendAssetUnderTitle;
}

- (void)setBookendAssetUnderTitle:(BOOL)a3
{
  self->_bookendAssetUnderTitle = a3;
}

- (NSLayoutConstraint)titleLabelCenterXConstraint
{
  return self->_titleLabelCenterXConstraint;
}

- (void)setTitleLabelCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelCenterXConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_heroAssetViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_heroAssetViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelWidthConstraint, 0);
}

@end

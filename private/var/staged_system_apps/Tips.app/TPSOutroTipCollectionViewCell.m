@implementation TPSOutroTipCollectionViewCell

- (TPSOutroTipCollectionViewCell)initWithFrame:(CGRect)a3
{
  TPSOutroTipCollectionViewCell *v3;
  TPSOutroTipCollectionViewCell *v4;
  void *v5;
  UIView *v6;
  UIView *standardAssetLayoutGuide;
  void *v8;
  uint64_t v9;
  NSLayoutConstraint *standardAssetLayoutGuideHeightConstraint;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *standardAssetLayoutGuideTopConstraint;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *standardAssetLayoutGuideToTitleTopConstraint;
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
  uint64_t v31;
  NSLayoutConstraint *contentLabelTopConstraint;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSLayoutConstraint *contentLabelBottomConstraint;
  double v38;
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
  uint64_t v50;
  NSLayoutConstraint *textViewTopConstraint;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSLayoutConstraint *textViewBottomConstraint;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_super v64;
  _QWORD v65[4];
  _QWORD v66[4];

  v64.receiver = self;
  v64.super_class = (Class)TPSOutroTipCollectionViewCell;
  v3 = -[TPSBookendsCollectionViewCell initWithFrame:](&v64, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[TPSOutroTipCollectionViewCell contentView](v3, "contentView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v4, "contentScrollView"));
    v6 = (UIView *)objc_alloc_init((Class)UIView);
    standardAssetLayoutGuide = v4->_standardAssetLayoutGuide;
    v4->_standardAssetLayoutGuide = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_standardAssetLayoutGuide, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v4->_standardAssetLayoutGuide);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v4->_standardAssetLayoutGuide, "heightAnchor"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 0.0));
    standardAssetLayoutGuideHeightConstraint = v4->_standardAssetLayoutGuideHeightConstraint;
    v4->_standardAssetLayoutGuideHeightConstraint = (NSLayoutConstraint *)v9;

    -[NSLayoutConstraint setActive:](v4->_standardAssetLayoutGuideHeightConstraint, "setActive:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_standardAssetLayoutGuide, "topAnchor"));
    v63 = v5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    standardAssetLayoutGuideTopConstraint = v4->_standardAssetLayoutGuideTopConstraint;
    v4->_standardAssetLayoutGuideTopConstraint = (NSLayoutConstraint *)v13;

    -[NSLayoutConstraint setActive:](v4->_standardAssetLayoutGuideTopConstraint, "setActive:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_standardAssetLayoutGuide, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell titleLabel](v4, "titleLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
    standardAssetLayoutGuideToTitleTopConstraint = v4->_standardAssetLayoutGuideToTitleTopConstraint;
    v4->_standardAssetLayoutGuideToTitleTopConstraint = (NSLayoutConstraint *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v4->_standardAssetLayoutGuide, "widthAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "widthAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    objc_msgSend(v22, "setActive:", 1);

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell titleLabel](v4, "titleLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](v4, "contentLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "frameLayoutGuide"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerXAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "widthAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "widthAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_standardAssetLayoutGuide, "bottomAnchor"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
    contentLabelTopConstraint = v4->_contentLabelTopConstraint;
    v4->_contentLabelTopConstraint = (NSLayoutConstraint *)v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v4, "contentScrollView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));
    contentLabelBottomConstraint = v4->_contentLabelBottomConstraint;
    v4->_contentLabelBottomConstraint = (NSLayoutConstraint *)v36;

    LODWORD(v38) = 1147224064;
    -[NSLayoutConstraint setPriority:](v4->_contentLabelBottomConstraint, "setPriority:", v38);
    v66[0] = v4->_contentLabelTopConstraint;
    v66[1] = v60;
    v66[2] = v59;
    v66[3] = v4->_contentLabelBottomConstraint;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 4));
    -[TPSBaseTipCollectionViewCell setContentLabelConstraints:](v4, "setContentLabelConstraints:", v39);

    -[TPSBaseTipCollectionViewCell setNeedsTextView:](v4, "setNeedsTextView:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentTextView](v4, "contentTextView"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "centerXAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "frameLayoutGuide"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "centerXAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "widthAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "widthAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v46));

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_standardAssetLayoutGuide, "bottomAnchor"));
    v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
    textViewTopConstraint = v4->_textViewTopConstraint;
    v4->_textViewTopConstraint = (NSLayoutConstraint *)v50;

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v4, "contentScrollView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
    v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v54));
    textViewBottomConstraint = v4->_textViewBottomConstraint;
    v4->_textViewBottomConstraint = (NSLayoutConstraint *)v55;

    v65[0] = v4->_textViewTopConstraint;
    v65[1] = v44;
    v65[2] = v47;
    v65[3] = v4->_textViewBottomConstraint;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 4));
    -[TPSBaseTipCollectionViewCell setContentTextViewConstraints:](v4, "setContentTextViewConstraints:", v57);

    -[TPSBaseTipCollectionViewCell updateFonts](v4, "updateFonts");
  }
  return v4;
}

- (void)setParallaxOffset:(CGPoint)a3
{
  double x;
  void *v5;
  objc_super v6;

  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)TPSOutroTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell setParallaxOffset:](&v6, "setParallaxOffset:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBookendsCollectionViewCell titleLabelCenterXConstraint](self, "titleLabelCenterXConstraint"));
  objc_msgSend(v5, "setConstant:", x * -4.0);

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
  _BOOL4 v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;
  -[TPSBaseTipCollectionViewCell cacheCellSize](self, "cacheCellSize");
  v14 = v11 != v13 || v9 != v12;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));

  v19.receiver = self;
  v19.super_class = (Class)TPSOutroTipCollectionViewCell;
  -[TPSBookendsCollectionViewCell setTip:withCellAppearance:](&v19, "setTip:withCellAppearance:", v6, v7);

  if (v15 != v6 || v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TPSImageAssetView defaultBackgroundColor](TPSImageAssetView, "defaultBackgroundColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](self, "contentScrollView"));
    objc_msgSend(v17, "setBackgroundColor:", v16);

    -[TPSBaseTipCollectionViewCell setNeedsTextView:](self, "setNeedsTextView:", objc_msgSend(v6, "containsLinks"));
    if (v14)
      -[TPSOutroTipCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

  return v15 != v6;
}

- (void)updateConstraints
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  -[TPSBaseTipCollectionViewCell bottomPadding](self, "bottomPadding");
  v4 = v3;
  -[NSLayoutConstraint setConstant:](self->_contentLabelBottomConstraint, "setConstant:");
  -[NSLayoutConstraint setConstant:](self->_textViewBottomConstraint, "setConstant:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell cellAppearance](self, "cellAppearance"));
  objc_msgSend(v5, "outroTextLabelTopPadding");
  v7 = v6;

  -[NSLayoutConstraint setConstant:](self->_contentLabelTopConstraint, "setConstant:", v7);
  -[NSLayoutConstraint setConstant:](self->_textViewTopConstraint, "setConstant:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell cellAppearance](self, "cellAppearance"));
  objc_msgSend(v8, "assetHeight");
  -[NSLayoutConstraint setConstant:](self->_standardAssetLayoutGuideHeightConstraint, "setConstant:");

  v9.receiver = self;
  v9.super_class = (Class)TPSOutroTipCollectionViewCell;
  -[TPSBookendsCollectionViewCell updateConstraints](&v9, "updateConstraints");
  -[NSLayoutConstraint setActive:](self->_standardAssetLayoutGuideTopConstraint, "setActive:", -[TPSBookendsCollectionViewCell bookendAssetUnderTitle](self, "bookendAssetUnderTitle") ^ 1);
  -[NSLayoutConstraint setActive:](self->_standardAssetLayoutGuideToTitleTopConstraint, "setActive:", -[TPSBookendsCollectionViewCell bookendAssetUnderTitle](self, "bookendAssetUnderTitle"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_standardAssetLayoutGuideToTitleTopConstraint, 0);
  objc_storeStrong((id *)&self->_standardAssetLayoutGuideTopConstraint, 0);
  objc_storeStrong((id *)&self->_standardAssetLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_standardAssetLayoutGuide, 0);
}

@end

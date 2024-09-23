@implementation SearchHomeBrowseCategoryCollectionViewCell

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

- (SearchHomeBrowseCategoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  SearchHomeBrowseCategoryCollectionViewCell *v3;
  void *v4;
  id v5;
  UIImageView *v6;
  UIImageView *browseImageView;
  void *v8;
  double v9;
  double v10;
  void *v11;
  UILabel *v12;
  UILabel *titleLabel;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSLayoutConstraint *topLabelToTopConstraint;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *bottomLabelToBottomConstraint;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *imageLeadingConstraint;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *imageToLabelConstraint;
  void *v36;
  uint64_t v37;
  NSLayoutConstraint *imageWidthConstraint;
  void *v39;
  uint64_t v40;
  NSLayoutConstraint *imageHeightConstraint;
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
  objc_super v53;
  _QWORD v54[8];

  v53.receiver = self;
  v53.super_class = (Class)SearchHomeBrowseCategoryCollectionViewCell;
  v3 = -[SearchHomeBrowseCategoryCollectionViewCell initWithFrame:](&v53, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SearchHomeBrowseCategoryCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc_init((Class)UIView);
    -[SearchHomeBrowseCategoryCollectionViewCell setBackgroundView:](v3, "setBackgroundView:", v5);

    v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    browseImageView = v3->_browseImageView;
    v3->_browseImageView = v6;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_browseImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIImageView setBackgroundColor:](v3->_browseImageView, "setBackgroundColor:", v8);

    LODWORD(v9) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_browseImageView, "setContentHuggingPriority:forAxis:", 0, v9);
    LODWORD(v10) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_browseImageView, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    -[UIImageView setAccessibilityIdentifier:](v3->_browseImageView, "setAccessibilityIdentifier:", CFSTR("SearchHomeBrowseCategoryIcon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v11, "addSubview:", v3->_browseImageView);

    v12 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v3->_titleLabel, "setBackgroundColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v15);

    -[UILabel setAccessibilityIdentifier:](v3->_titleLabel, "setAccessibilityIdentifier:", CFSTR("SearchHomeBrowseCategoryTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v16, "addSubview:", v3->_titleLabel);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_titleLabel, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell contentView](v3, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    topLabelToTopConstraint = v3->_topLabelToTopConstraint;
    v3->_topLabelToTopConstraint = (NSLayoutConstraint *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell contentView](v3, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
    bottomLabelToBottomConstraint = v3->_bottomLabelToBottomConstraint;
    v3->_bottomLabelToBottomConstraint = (NSLayoutConstraint *)v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v3->_browseImageView, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell contentView](v3, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
    imageLeadingConstraint = v3->_imageLeadingConstraint;
    v3->_imageLeadingConstraint = (NSLayoutConstraint *)v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v3->_browseImageView, "trailingAnchor"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
    imageToLabelConstraint = v3->_imageToLabelConstraint;
    v3->_imageToLabelConstraint = (NSLayoutConstraint *)v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v3->_browseImageView, "widthAnchor"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToConstant:", 0.0));
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v3->_browseImageView, "heightAnchor"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToConstant:", 0.0));
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v40;

    v54[0] = v3->_imageLeadingConstraint;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v3->_browseImageView, "centerYAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell contentView](v3, "contentView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "centerYAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v44));
    v54[1] = v45;
    v54[2] = v3->_imageWidthConstraint;
    v54[3] = v3->_imageHeightConstraint;
    v54[4] = v3->_imageToLabelConstraint;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell contentView](v3, "contentView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v48));
    v54[5] = v49;
    v54[6] = v3->_topLabelToTopConstraint;
    v54[7] = v3->_bottomLabelToBottomConstraint;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v50);

    if (sub_1002A8AA0(v3) == 5)
    {
      -[SearchHomeBrowseCategoryCollectionViewCell _maps_setCollectionViewCellBackgroundConfiguration](v3, "_maps_setCollectionViewCellBackgroundConfiguration");
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      -[UILabel setHighlightedTextColor:](v3->_titleLabel, "setHighlightedTextColor:", v51);

    }
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1002A8AA0(self) == 5;
}

- (void)setSizeController:(id)a3
{
  void *v5;
  unsigned __int8 v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  id v33;

  v33 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell sizeController](self, "sizeController"));
  v6 = objc_msgSend(v33, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sizeController, a3);
    objc_msgSend(v33, "labelTopAndBottomPadding");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell topLabelToTopConstraint](self, "topLabelToTopConstraint"));
    objc_msgSend(v9, "setConstant:", v8);

    objc_msgSend(v33, "labelTopAndBottomPadding");
    v11 = -v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell bottomLabelToBottomConstraint](self, "bottomLabelToBottomConstraint"));
    objc_msgSend(v12, "setConstant:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "titleLabelFont"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v14, "setFont:", v13);

    objc_msgSend(v33, "imageLeadingPadding");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell imageLeadingConstraint](self, "imageLeadingConstraint"));
    objc_msgSend(v17, "setConstant:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell traitCollection](self, "traitCollection"));
    v19 = objc_msgSend(v18, "userInterfaceIdiom");

    if (v19 == (id)5)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell imageToLabelConstraint](self, "imageToLabelConstraint"));
      v21 = v20;
      v22 = 10.0;
    }
    else
    {
      objc_msgSend(v33, "imageToLabelPadding");
      v24 = v23;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell imageToLabelConstraint](self, "imageToLabelConstraint"));
      v21 = v20;
      v22 = v24;
    }
    objc_msgSend(v20, "setConstant:", v22);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell sizeController](self, "sizeController"));
    objc_msgSend(v25, "imageSize");
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell imageWidthConstraint](self, "imageWidthConstraint"));
    objc_msgSend(v28, "setConstant:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell sizeController](self, "sizeController"));
    objc_msgSend(v29, "imageSize");
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell imageHeightConstraint](self, "imageHeightConstraint"));
    objc_msgSend(v32, "setConstant:", v31);

  }
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchHomeBrowseCategoryCollectionViewCell;
  -[SearchHomeBrowseCategoryCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell browseImageView](self, "browseImageView"));
  objc_msgSend(v3, "setImage:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setText:", 0);

}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell browseImageView](self, "browseImageView"));
  objc_msgSend(v5, "setImage:", v4);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_updateIdentifier, a3);
}

- (SearchHomeBrowseCategoryCellSizeController)sizeController
{
  return self->_sizeController;
}

- (UIImageView)browseImageView
{
  return self->_browseImageView;
}

- (void)setBrowseImageView:(id)a3
{
  objc_storeStrong((id *)&self->_browseImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSLayoutConstraint)topLabelToTopConstraint
{
  return self->_topLabelToTopConstraint;
}

- (void)setTopLabelToTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLabelToTopConstraint, a3);
}

- (NSLayoutConstraint)bottomLabelToBottomConstraint
{
  return self->_bottomLabelToBottomConstraint;
}

- (void)setBottomLabelToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLabelToBottomConstraint, a3);
}

- (NSLayoutConstraint)imageLeadingConstraint
{
  return self->_imageLeadingConstraint;
}

- (void)setImageLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageLeadingConstraint, a3);
}

- (NSLayoutConstraint)imageToLabelConstraint
{
  return self->_imageToLabelConstraint;
}

- (void)setImageToLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageToLabelConstraint, a3);
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageWidthConstraint, a3);
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageToLabelConstraint, 0);
  objc_storeStrong((id *)&self->_imageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLabelToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelToTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_browseImageView, 0);
  objc_storeStrong((id *)&self->_sizeController, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
}

@end

@implementation VideosExtrasCollectionReusableView

- (VideosExtrasCollectionReusableView)initWithFrame:(CGRect)a3
{
  VideosExtrasCollectionReusableView *v3;
  VideosExtrasCollectionReusableView *v4;
  void *v5;
  uint64_t v6;
  UILabel *textLabel;
  void *v8;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *textLeftConstraint;
  uint64_t v12;
  NSLayoutConstraint *textRightConstraint;
  void *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasCollectionReusableView;
  v3 = -[VideosExtrasCollectionReusableView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VideosExtrasCollectionReusableView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasCollectionReusableView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    textLabel = v4->_textLabel;
    v4->_textLabel = (UILabel *)v6;

    -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](v4->_textLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v4->_textLabel, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_textLabel, "setTextColor:", v9);

    -[VideosExtrasCollectionReusableView addSubview:](v4, "addSubview:", v4->_textLabel);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_textLabel, 1, 0, v4, 1, 1.0, 0.0);
    v10 = objc_claimAutoreleasedReturnValue();
    textLeftConstraint = v4->_textLeftConstraint;
    v4->_textLeftConstraint = (NSLayoutConstraint *)v10;

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_textLabel, 2, 0, v4, 2, 1.0, 0.0);
    v12 = objc_claimAutoreleasedReturnValue();
    textRightConstraint = v4->_textRightConstraint;
    v4->_textRightConstraint = (NSLayoutConstraint *)v12;

    v17[0] = v4->_textLeftConstraint;
    v17[1] = v4->_textRightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasCollectionReusableView addConstraints:](v4, "addConstraints:", v14);

  }
  return v4;
}

- (void)_configureConstraintsForInsets:(UIEdgeInsets)a3
{
  double right;
  CGFloat bottom;
  double left;
  CGFloat top;
  double v8;
  double v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[NSLayoutConstraint constant](self->_textLeftConstraint, "constant");
  if (left != v8)
  {
    -[NSLayoutConstraint setConstant:](self->_textLeftConstraint, "setConstant:", left);
    -[VideosExtrasCollectionReusableView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  -[NSLayoutConstraint constant](self->_textRightConstraint, "constant");
  if (right != -v9)
  {
    -[NSLayoutConstraint setConstant:](self->_textRightConstraint, "setConstant:", -right);
    -[VideosExtrasCollectionReusableView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  self->_labelInsets.top = top;
  self->_labelInsets.left = left;
  self->_labelInsets.bottom = bottom;
  self->_labelInsets.right = right;
}

- (void)configureForHeaderElement:(id)a3 headerStyle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MPUContentSizeLayoutConstraint *textBottomConstraint;
  void *v16;
  UILabel *textLabel;
  double v18;
  MPUContentSizeLayoutConstraint *v19;
  MPUContentSizeLayoutConstraint *v20;
  double v21;
  MPUContentSizeLayoutConstraint *textTopConstraint;
  void *v23;
  UILabel *v24;
  double v25;
  MPUContentSizeLayoutConstraint *v26;
  MPUContentSizeLayoutConstraint *v27;
  double v28;
  uint64_t v29;
  UIView *borderView;
  UIView *v31;
  UIView *v32;
  void *v33;
  void *v34;
  NSArray *v35;
  NSArray *borderConstraints;
  UIView *v37;
  id v38;

  v38 = a3;
  v6 = a4;
  objc_msgSend(v38, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(v6, "insets");
    -[VideosExtrasCollectionReusableView _configureConstraintsForInsets:](self, "_configureConstraintsForInsets:");
    objc_msgSend(v6, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v10);

    objc_msgSend(v6, "textStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC1358];
    objc_msgSend(v6, "defaultFontAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorWithFontAttributes:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel configureForIKTextElement:fontDescriptor:textStyle:](self->_textLabel, "configureForIKTextElement:fontDescriptor:textStyle:", v7, v14, v11);
    textBottomConstraint = self->_textBottomConstraint;
    if (!textBottomConstraint)
    {
      v16 = (void *)MEMORY[0x1E0D46958];
      textLabel = self->_textLabel;
      objc_msgSend(v6, "textBaselineDescender");
      objc_msgSend(v16, "contentSizeAutoupdatingConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:textStyle:defaultSizeConstant:", self, 4, 0, textLabel, 12, v11, 1.0, v18);
      v19 = (MPUContentSizeLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v20 = self->_textBottomConstraint;
      self->_textBottomConstraint = v19;

      LODWORD(v21) = 1148829696;
      -[MPUContentSizeLayoutConstraint setPriority:](self->_textBottomConstraint, "setPriority:", v21);
      textBottomConstraint = self->_textBottomConstraint;
    }
    -[MPUContentSizeLayoutConstraint setTextStyle:](textBottomConstraint, "setTextStyle:", v11);
    objc_msgSend(v6, "textBaselineDescender");
    -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_textBottomConstraint, "setDefaultSizeConstant:");
    -[MPUContentSizeLayoutConstraint setActive:](self->_textBottomConstraint, "setActive:", 1);
    textTopConstraint = self->_textTopConstraint;
    if (!textTopConstraint)
    {
      v23 = (void *)MEMORY[0x1E0D46958];
      v24 = self->_textLabel;
      objc_msgSend(v6, "textBaselineHeight");
      objc_msgSend(v23, "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:multiplier:nonStandardLeading:", v24, 0, self, 3, v11, 1.0, v25);
      v26 = (MPUContentSizeLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v27 = self->_textTopConstraint;
      self->_textTopConstraint = v26;

      LODWORD(v28) = 1148829696;
      -[MPUContentSizeLayoutConstraint setPriority:](self->_textTopConstraint, "setPriority:", v28);
      textTopConstraint = self->_textTopConstraint;
    }
    -[MPUContentSizeLayoutConstraint setTextStyle:](textTopConstraint, "setTextStyle:", v11);
    objc_msgSend(v6, "textBaselineHeight");
    -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_textTopConstraint, "setDefaultSizeConstant:");
    -[MPUContentSizeLayoutConstraint setActive:](self->_textTopConstraint, "setActive:", 1);

  }
  v29 = objc_msgSend(v38, "separator");
  borderView = self->_borderView;
  if (v29 == 1)
  {
    if (!borderView)
    {
      +[VideosExtrasElementViewController _borderView](VideosExtrasElementViewController, "_borderView");
      v31 = (UIView *)objc_claimAutoreleasedReturnValue();
      v32 = self->_borderView;
      self->_borderView = v31;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_borderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[VideosExtrasCollectionReusableView addSubview:](self, "addSubview:", self->_borderView);
    }
    if (!self->_borderConstraints)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_borderView, 4, 0, self, 4, 1.0, 0.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", self->_borderView, self, 10, self->_labelInsets.top, self->_labelInsets.left, self->_labelInsets.bottom, self->_labelInsets.right);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "arrayByAddingObject:", v33);
      v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
      borderConstraints = self->_borderConstraints;
      self->_borderConstraints = v35;

      -[VideosExtrasCollectionReusableView addConstraints:](self, "addConstraints:", self->_borderConstraints);
LABEL_16:

    }
  }
  else
  {
    if (borderView)
    {
      -[UIView removeFromSuperview](borderView, "removeFromSuperview");
      v37 = self->_borderView;
      self->_borderView = 0;

    }
    if (self->_borderConstraints)
    {
      -[VideosExtrasCollectionReusableView removeConstraints:](self, "removeConstraints:");
      v33 = self->_borderConstraints;
      self->_borderConstraints = 0;
      goto LABEL_16;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderConstraints, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_textRightConstraint, 0);
  objc_storeStrong((id *)&self->_textBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textLeftConstraint, 0);
  objc_storeStrong((id *)&self->_textTopConstraint, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end

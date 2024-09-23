@implementation ICNoteResultsImageBadgeView

- (ICNoteResultsImageBadgeView)initWithCoder:(id)a3
{
  ICNoteResultsImageBadgeView *v3;
  ICNoteResultsImageBadgeView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsImageBadgeView;
  v3 = -[ICNoteResultsImageBadgeView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ICNoteResultsImageBadgeView commonInit](v3, "commonInit");
  return v4;
}

- (ICNoteResultsImageBadgeView)initWithFrame:(CGRect)a3
{
  ICNoteResultsImageBadgeView *v3;
  ICNoteResultsImageBadgeView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsImageBadgeView;
  v3 = -[ICNoteResultsImageBadgeView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICNoteResultsImageBadgeView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *widthConstraint;
  void *v18;
  id v19;
  _QWORD v20[2];

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    -[ICNoteResultsImageBadgeView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 1);
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    v3 = 11;
  else
    v3 = 8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", v3));
  v5 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v4);
  -[ICNoteResultsImageBadgeView addSubview:](self, "addSubview:", v5);
  objc_msgSend(v5, "ic_addAnchorsToFillSuperview");
  v6 = objc_alloc_init((Class)UIImageView);
  -[ICNoteResultsImageBadgeView setImageView:](self, "setImageView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView imageView](self, "imageView"));
  objc_msgSend(v7, "setContentMode:", 4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView imageView](self, "imageView"));
  objc_msgSend(v9, "setTintColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView imageView](self, "imageView"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView imageView](self, "imageView"));
  objc_msgSend(v12, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView imageView](self, "imageView"));
  objc_msgSend(v14, "ic_addAnchorsToFillSuperview");

  -[ICNoteResultsImageBadgeView setSystemImageName:](self, "setSystemImageName:", CFSTR("pin.fill"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView widthAnchor](self, "widthAnchor"));
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 24.0));
  widthConstraint = self->_widthConstraint;
  self->_widthConstraint = v16;

  -[NSLayoutConstraint setActive:](self->_widthConstraint, "setActive:", 1);
  -[ICNoteResultsImageBadgeView updateForTraitCollection](self, "updateForTraitCollection");
  v20[0] = objc_opt_class(UITraitHorizontalSizeClass);
  v20[1] = objc_opt_class(UITraitPreferredContentSizeCategory);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  v19 = -[ICNoteResultsImageBadgeView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v18, "updateForTraitCollection");

}

- (void)setSystemImageName:(id)a3
{
  objc_storeStrong((id *)&self->_systemImageName, a3);
  -[ICNoteResultsImageBadgeView updateImage](self, "updateImage");
}

- (void)updateImage
{
  void *v3;
  unsigned int v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "ic_hasCompactSize");

  v5 = (id *)&UIFontTextStyleCaption1;
  if (!v4)
    v5 = (id *)&UIFontTextStyleSubheadline;
  v6 = *v5;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView systemImageName](self, "systemImageName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:textStyle:](UIImage, "ic_systemImageNamed:textStyle:", v9, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView imageView](self, "imageView"));
  objc_msgSend(v8, "setImage:", v7);

}

- (void)updateForTraitCollection
{
  void *v3;
  unsigned int v4;
  double v5;
  double v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "ic_hasCompactSize");

  v5 = 8.0;
  if (v4)
  {
    v5 = 4.0;
    v6 = 24.0;
  }
  else
  {
    v6 = 32.0;
  }
  -[ICNoteResultsImageBadgeView ic_applyRoundedCornersWithRadius:](self, "ic_applyRoundedCornersWithRadius:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsImageBadgeView widthConstraint](self, "widthConstraint"));
  objc_msgSend(v7, "setConstant:", v6);

  -[ICNoteResultsImageBadgeView updateImage](self, "updateImage");
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

@end

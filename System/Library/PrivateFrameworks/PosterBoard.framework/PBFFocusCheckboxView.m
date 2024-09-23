@implementation PBFFocusCheckboxView

- (PBFFocusCheckboxView)init
{
  PBFFocusCheckboxView *v2;
  PBFFocusCheckboxView *v3;
  _TtC11PosterBoard13PBFCircleView *v4;
  _TtC11PosterBoard13PBFCircleView *circleView;
  _TtC11PosterBoard13PBFCircleView *v6;
  void *v7;
  _TtC11PosterBoard13PBFCircleView *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIImageView *imageView;
  UIImageView *v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[8];

  v42[6] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)PBFFocusCheckboxView;
  v2 = -[PBFFocusCheckboxView init](&v41, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PBFFocusCheckboxView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = objc_alloc_init(_TtC11PosterBoard13PBFCircleView);
    circleView = v3->_circleView;
    v3->_circleView = v4;

    -[PBFCircleView setTranslatesAutoresizingMaskIntoConstraints:](v3->_circleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PBFCircleView setStrokeWidth:](v3->_circleView, "setStrokeWidth:", 3.0);
    v6 = v3->_circleView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFCircleView setStrokeColor:](v6, "setStrokeColor:", v7);

    v8 = v3->_circleView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFCircleView setFillColor:](v8, "setFillColor:", v9);

    -[PBFCircleView layer](v3->_circleView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 0;
    objc_msgSend(v10, "setShadowOpacity:", v11);

    -[PBFCircleView layer](v3->_circleView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowRadius:", 2.0);

    -[PBFCircleView layer](v3->_circleView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

    -[PBFFocusCheckboxView addSubview:](v3, "addSubview:", v3->_circleView);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 7, 15.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v39);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v14;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setHidden:](v3->_imageView, "setHidden:", 1);
    v16 = v3->_imageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v16, "setTintColor:", v17);

    -[PBFFocusCheckboxView addSubview:](v3, "addSubview:", v3->_imageView);
    v32 = (void *)MEMORY[0x1E0CB3718];
    -[PBFCircleView leadingAnchor](v3->_circleView, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusCheckboxView leadingAnchor](v3, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 4.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v36;
    -[PBFCircleView trailingAnchor](v3->_circleView, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusCheckboxView trailingAnchor](v3, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -4.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v33;
    -[PBFCircleView topAnchor](v3->_circleView, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusCheckboxView topAnchor](v3, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 4.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v29;
    -[PBFCircleView bottomAnchor](v3->_circleView, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusCheckboxView bottomAnchor](v3, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v18, -4.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v19;
    -[UIImageView centerXAnchor](v3->_imageView, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusCheckboxView centerXAnchor](v3, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v22;
    -[UIImageView centerYAnchor](v3->_imageView, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusCheckboxView centerYAnchor](v3, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v26);

  }
  return v3;
}

- (void)setOn:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;

  if (self->_on != a3)
  {
    self->_on = a3;
    -[PBFCircleView layer](self->_circleView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    LODWORD(v6) = 1046562734;
    if (!self->_on)
      *(float *)&v6 = 0.0;
    objc_msgSend(v4, "setShadowOpacity:", v6);

    -[UIImageView setHidden:](self->_imageView, "setHidden:", !self->_on);
    -[PBFFocusCheckboxView _updateColors](self, "_updateColors");
    -[PBFFocusCheckboxView _updateAccessibilityAttributes](self, "_updateAccessibilityAttributes");
  }
}

- (void)_updateColors
{
  void *v3;
  uint64_t v4;
  _TtC11PosterBoard13PBFCircleView *circleView;
  _TtC11PosterBoard13PBFCircleView *v6;
  void *v7;
  _TtC11PosterBoard13PBFCircleView *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (self->_on)
  {
    -[PBFFocusCheckboxView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle");

    circleView = self->_circleView;
    if (v4 == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFCircleView setStrokeColor:](circleView, "setStrokeColor:", v10);

    v8 = self->_circleView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_circleView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFCircleView setStrokeColor:](v6, "setStrokeColor:", v7);

    v8 = self->_circleView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v9;
  -[PBFCircleView setFillColor:](v8, "setFillColor:");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBFFocusCheckboxView;
  v4 = a3;
  -[PBFFocusCheckboxView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[PBFFocusCheckboxView traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[PBFFocusCheckboxView _updateColors](self, "_updateColors");
}

- (void)setAssociatedPosterIdentifier:(id)a3
{
  NSString *v4;
  NSString *associatedPosterIdentifier;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    associatedPosterIdentifier = self->_associatedPosterIdentifier;
    self->_associatedPosterIdentifier = v4;

    -[PBFFocusCheckboxView _updateAccessibilityAttributes](self, "_updateAccessibilityAttributes");
  }

}

- (void)_updateAccessibilityAttributes
{
  uint64_t v3;

  if (self->_associatedPosterIdentifier)
  {
    -[PBFFocusCheckboxView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:");
    if (-[PBFFocusCheckboxView isOn](self, "isOn"))
      v3 = *MEMORY[0x1E0DC46B0];
    else
      v3 = 0;
    -[PBFFocusCheckboxView setAccessibilityTraits:](self, "setAccessibilityTraits:", v3);
  }
  else
  {
    -[PBFFocusCheckboxView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isOn
{
  return self->_on;
}

- (NSString)associatedPosterIdentifier
{
  return self->_associatedPosterIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedPosterIdentifier, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
}

@end

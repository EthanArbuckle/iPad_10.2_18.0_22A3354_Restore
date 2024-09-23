@implementation TPBadgeView

- (double)scaledLayoutValueForBaseValue:(double)a3 shouldLowerBound:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  double result;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scaledValueForValue:", a3);
  v8 = v7;

  result = fmax(v8, a3);
  if (!v4)
    return v8;
  return result;
}

- (void)updateActiveHorizontalConstraints
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[TPBadgeView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 < 2)
  {
    -[TPBadgeView titleLabelLeadingAnchorLayoutConstraint](self, "titleLabelLeadingAnchorLayoutConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 0);

    -[TPBadgeView titleLabelTrailingAnchorLayoutConstraint](self, "titleLabelTrailingAnchorLayoutConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 0);

    -[TPBadgeView widthAnchorLayoutConstraint](self, "widthAnchorLayoutConstraint");
  }
  else
  {
    -[TPBadgeView widthAnchorLayoutConstraint](self, "widthAnchorLayoutConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActive:", 0);

    -[TPBadgeView titleLabelLeadingAnchorLayoutConstraint](self, "titleLabelLeadingAnchorLayoutConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

    -[TPBadgeView titleLabelTrailingAnchorLayoutConstraint](self, "titleLabelTrailingAnchorLayoutConstraint");
  }
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

}

- (void)loadConstraints
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)TPBadgeView;
  -[TPView loadConstraints](&v28, sel_loadConstraints);
  -[TPBadgeView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPBadgeView centerXAnchor](self, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setActive:", 1);
  -[TPBadgeView widthAnchor](self, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPBadgeView heightAnchor](self, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_widthAnchorLayoutConstraint);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", v10);

  -[TPBadgeView setWidthAnchorLayoutConstraint:](self, "setWidthAnchorLayoutConstraint:", v9);
  -[TPBadgeView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPBadgeView leadingAnchor](self, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPBadgeView titleLabelLeadingAnchorLayoutConstraintConstant](self, "titleLabelLeadingAnchorLayoutConstraintConstant");
  -[TPBadgeView scaledLayoutValueForBaseValue:shouldLowerBound:](self, "scaledLayoutValueForBaseValue:shouldLowerBound:", 1);
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_titleLabelLeadingAnchorLayoutConstraint);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIdentifier:", v15);

  -[TPBadgeView setTitleLabelLeadingAnchorLayoutConstraint:](self, "setTitleLabelLeadingAnchorLayoutConstraint:", v14);
  -[TPBadgeView trailingAnchor](self, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPBadgeView titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPBadgeView titleLabelTrailingAnchorLayoutConstraintConstant](self, "titleLabelTrailingAnchorLayoutConstraintConstant");
  -[TPBadgeView scaledLayoutValueForBaseValue:shouldLowerBound:](self, "scaledLayoutValueForBaseValue:shouldLowerBound:", 1);
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_titleLabelTrailingAnchorLayoutConstraint);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIdentifier:", v20);

  -[TPBadgeView setTitleLabelTrailingAnchorLayoutConstraint:](self, "setTitleLabelTrailingAnchorLayoutConstraint:", v19);
  -[TPBadgeView updateActiveHorizontalConstraints](self, "updateActiveHorizontalConstraints");
  -[TPBadgeView titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPBadgeView centerYAnchor](self, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setActive:", 1);
  -[TPBadgeView heightAnchor](self, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPBadgeView suggestedHeight](self, "suggestedHeight");
  objc_msgSend(v25, "constraintEqualToConstant:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_heightAnchorLayoutConstraint);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setIdentifier:", v27);

  objc_msgSend(v26, "setActive:", 1);
  -[TPBadgeView setHeightAnchorLayoutConstraint:](self, "setHeightAnchorLayoutConstraint:", v26);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSLayoutConstraint)widthAnchorLayoutConstraint
{
  return self->_widthAnchorLayoutConstraint;
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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

  switch(self->_theme)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "dynamicTertiaryLabelColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView setBackgroundColor:](self, "setBackgroundColor:", v3);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView titleLabel](self, "titleLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v4);

      objc_msgSend(MEMORY[0x1E0DC3658], "dynamicBackgroundColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView setBackgroundColor:](self, "setBackgroundColor:", v7);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView titleLabel](self, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v8);

      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView setBackgroundColor:](self, "setBackgroundColor:", v10);

      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView setBackgroundColor:](self, "setBackgroundColor:", v12);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView titleLabel](self, "titleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBackgroundColor:", v13);

      objc_msgSend(MEMORY[0x1E0DC3658], "_tp_bluePillColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView setBackgroundColor:](self, "setBackgroundColor:", v15);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView titleLabel](self, "titleLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBackgroundColor:", v16);

      objc_msgSend(MEMORY[0x1E0DC3658], "_tp_greenPillColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5uLL:
      goto LABEL_8;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView setBackgroundColor:](self, "setBackgroundColor:", v18);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView titleLabel](self, "titleLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBackgroundColor:", v19);

      objc_msgSend(MEMORY[0x1E0DC3658], "tableBackgroundColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView titleLabel](self, "titleLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTextColor:", v21);

LABEL_8:
      objc_msgSend(MEMORY[0x1E0DC3658], "dynamicCarSecondaryColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView setBackgroundColor:](self, "setBackgroundColor:", v23);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView titleLabel](self, "titleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBackgroundColor:", v24);

      objc_msgSend(MEMORY[0x1E0DC3658], "tableBackgroundColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 7uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPBadgeView setBackgroundColor:](self, "setBackgroundColor:", v26);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v27 = (void *)v11;
      -[TPBadgeView titleLabel](self, "titleLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setBackgroundColor:", v27);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v30 = (id)v6;
      -[TPBadgeView titleLabel](self, "titleLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTextColor:", v30);

      break;
    default:
      return;
  }
}

- (void)updateSizeCategory
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;

  v3 = -[TPBadgeView sizeCategory](self, "sizeCategory");
  if (v3 <= 4)
  {
    v4 = dbl_1BCFE6E38[v3];
    v5 = dbl_1BCFE6E60[v3];
    v6 = dbl_1BCFE6E88[v3];
    -[TPBadgeView setLayerCornerRadius:](self, "setLayerCornerRadius:", dbl_1BCFE6E10[v3]);
    -[TPBadgeView setTitleLabelFontSize:](self, "setTitleLabelFontSize:", v4);
    -[TPBadgeView setHeightAnchorLayoutConstraintConstantFontMultiplier:](self, "setHeightAnchorLayoutConstraintConstantFontMultiplier:", v5);
    -[TPBadgeView setTitleLabelLeadingAnchorLayoutConstraintConstant:](self, "setTitleLabelLeadingAnchorLayoutConstraintConstant:", v6);
    -[TPBadgeView setTitleLabelTrailingAnchorLayoutConstraintConstant:](self, "setTitleLabelTrailingAnchorLayoutConstraintConstant:", v6);
  }
}

- (void)updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPBadgeView;
  -[TPView updateFonts](&v6, sel_updateFonts);
  v3 = (void *)MEMORY[0x1E0DC1350];
  -[TPBadgeView titleLabelFontSize](self, "titleLabelFontSize");
  -[TPBadgeView scaledLayoutValueForBaseValue:](self, "scaledLayoutValueForBaseValue:");
  objc_msgSend(v3, "systemFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPBadgeView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (NSLayoutConstraint)titleLabelTrailingAnchorLayoutConstraint
{
  return self->_titleLabelTrailingAnchorLayoutConstraint;
}

- (double)titleLabelTrailingAnchorLayoutConstraintConstant
{
  return self->_titleLabelTrailingAnchorLayoutConstraintConstant;
}

- (NSLayoutConstraint)titleLabelLeadingAnchorLayoutConstraint
{
  return self->_titleLabelLeadingAnchorLayoutConstraint;
}

- (double)titleLabelLeadingAnchorLayoutConstraintConstant
{
  return self->_titleLabelLeadingAnchorLayoutConstraintConstant;
}

- (double)titleLabelFontSize
{
  return self->_titleLabelFontSize;
}

- (double)suggestedHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[TPBadgeView heightAnchorLayoutConstraintConstantFontMultiplier](self, "heightAnchorLayoutConstraintConstantFontMultiplier");
  v4 = v3;
  -[TPBadgeView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  v8 = v4 * v7;

  return v8;
}

- (unint64_t)sizeCategory
{
  return self->_sizeCategory;
}

- (void)setWidthAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthAnchorLayoutConstraint, a3);
}

- (void)setTitleLabelTrailingAnchorLayoutConstraintConstant:(double)a3
{
  self->_titleLabelTrailingAnchorLayoutConstraintConstant = a3;
}

- (void)setTitleLabelTrailingAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTrailingAnchorLayoutConstraint, a3);
}

- (void)setTitleLabelLeadingAnchorLayoutConstraintConstant:(double)a3
{
  self->_titleLabelLeadingAnchorLayoutConstraintConstant = a3;
}

- (void)setTitleLabelLeadingAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelLeadingAnchorLayoutConstraint, a3);
}

- (void)setTitleLabelFontSize:(double)a3
{
  self->_titleLabelFontSize = a3;
}

- (void)setLayerCornerRadius:(double)a3
{
  self->_layerCornerRadius = a3;
}

- (void)setHeightAnchorLayoutConstraintConstantFontMultiplier:(double)a3
{
  self->_heightAnchorLayoutConstraintConstantFontMultiplier = a3;
}

- (void)setHeightAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnchorLayoutConstraint, a3);
}

- (double)scaledLayoutValueForBaseValue:(double)a3
{
  double result;

  -[TPBadgeView scaledLayoutValueForBaseValue:shouldLowerBound:](self, "scaledLayoutValueForBaseValue:shouldLowerBound:", 0, a3);
  return result;
}

- (double)layerCornerRadius
{
  return self->_layerCornerRadius;
}

- (TPBadgeView)initWithTitle:(id)a3 theme:(unint64_t)a4
{
  id v6;
  TPBadgeView *v7;
  TPBadgeView *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPBadgeView;
  v7 = -[TPView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_theme = a4;
    -[UILabel setText:](v7->_titleLabel, "setText:", v6);
    -[TPBadgeView updateTheme](v8, "updateTheme");
  }

  return v8;
}

- (TPBadgeView)initWithTitle:(id)a3
{
  return -[TPBadgeView initWithTitle:theme:](self, "initWithTitle:theme:", a3, 0);
}

- (double)heightAnchorLayoutConstraintConstantFontMultiplier
{
  return self->_heightAnchorLayoutConstraintConstantFontMultiplier;
}

- (void)commonInit
{
  double v3;
  double v4;
  void *v5;
  UILabel *v6;
  UILabel *titleLabel;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TPBadgeView;
  -[TPView commonInit](&v12, sel_commonInit);
  -[TPBadgeView _setHostsLayoutEngine:](self, "_setHostsLayoutEngine:", 1);
  self->_sizeCategory = 0;
  -[TPBadgeView updateSizeCategory](self, "updateSizeCategory");
  -[TPBadgeView layerCornerRadius](self, "layerCornerRadius");
  -[TPBadgeView scaledLayoutValueForBaseValue:](self, "scaledLayoutValueForBaseValue:");
  v4 = v3;
  -[TPBadgeView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v6;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v8) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v8);
  LODWORD(v9) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v9);
  LODWORD(v10) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v10);
  LODWORD(v11) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v11);
  -[TPBadgeView addSubview:](self, "addSubview:", self->_titleLabel);
}

- (BOOL)_hasBaseline
{
  return 1;
}

- (void)updateConstraintsConstants
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TPBadgeView;
  -[TPView updateConstraintsConstants](&v19, sel_updateConstraintsConstants);
  -[TPBadgeView layerCornerRadius](self, "layerCornerRadius");
  -[TPBadgeView scaledLayoutValueForBaseValue:](self, "scaledLayoutValueForBaseValue:");
  v4 = v3;
  -[TPBadgeView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  -[TPBadgeView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  v9 = v8;
  -[TPBadgeView heightAnchorLayoutConstraintConstantFontMultiplier](self, "heightAnchorLayoutConstraintConstantFontMultiplier");
  v11 = v9 * v10;
  -[TPBadgeView heightAnchorLayoutConstraint](self, "heightAnchorLayoutConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v11);

  -[TPBadgeView titleLabelLeadingAnchorLayoutConstraintConstant](self, "titleLabelLeadingAnchorLayoutConstraintConstant");
  -[TPBadgeView scaledLayoutValueForBaseValue:shouldLowerBound:](self, "scaledLayoutValueForBaseValue:shouldLowerBound:", 1);
  v14 = v13;
  -[TPBadgeView titleLabelLeadingAnchorLayoutConstraint](self, "titleLabelLeadingAnchorLayoutConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v14);

  -[TPBadgeView titleLabelTrailingAnchorLayoutConstraintConstant](self, "titleLabelTrailingAnchorLayoutConstraintConstant");
  -[TPBadgeView scaledLayoutValueForBaseValue:shouldLowerBound:](self, "scaledLayoutValueForBaseValue:shouldLowerBound:", 1);
  v17 = v16;
  -[TPBadgeView titleLabelTrailingAnchorLayoutConstraint](self, "titleLabelTrailingAnchorLayoutConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", v17);

}

- (void)unloadConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[TPBadgeView widthAnchorLayoutConstraint](self, "widthAnchorLayoutConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 0);

  -[TPBadgeView setWidthAnchorLayoutConstraint:](self, "setWidthAnchorLayoutConstraint:", 0);
  -[TPBadgeView titleLabelLeadingAnchorLayoutConstraint](self, "titleLabelLeadingAnchorLayoutConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  -[TPBadgeView setTitleLabelLeadingAnchorLayoutConstraint:](self, "setTitleLabelLeadingAnchorLayoutConstraint:", 0);
  -[TPBadgeView titleLabelTrailingAnchorLayoutConstraint](self, "titleLabelTrailingAnchorLayoutConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  -[TPBadgeView setTitleLabelTrailingAnchorLayoutConstraint:](self, "setTitleLabelTrailingAnchorLayoutConstraint:", 0);
  -[TPBadgeView heightAnchorLayoutConstraint](self, "heightAnchorLayoutConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

  -[TPBadgeView setHeightAnchorLayoutConstraint:](self, "setHeightAnchorLayoutConstraint:", 0);
  v7.receiver = self;
  v7.super_class = (Class)TPBadgeView;
  -[TPView unloadConstraints](&v7, sel_unloadConstraints);
}

- (void)setSizeCategory:(unint64_t)a3
{
  if (self->_sizeCategory != a3)
  {
    self->_sizeCategory = a3;
    -[TPBadgeView updateSizeCategory](self, "updateSizeCategory");
  }
}

- (void)setTheme:(unint64_t)a3
{
  if (self->_theme != a3)
  {
    self->_theme = a3;
    -[TPBadgeView updateTheme](self, "updateTheme");
  }
}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[TPBadgeView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) == 0)
  {
    -[UILabel setText:](self->_titleLabel, "setText:", v7);
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    v6 = objc_msgSend(v5, "length");
    if (v6 != objc_msgSend(v7, "length"))
      -[TPBadgeView updateActiveHorizontalConstraints](self, "updateActiveHorizontalConstraints");
  }

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[TPBadgeView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  LODWORD(v5) = 1148846080;
  if ((a4 & 1) != 0)
    *(float *)&v4 = 1000.0;
  else
    *(float *)&v4 = 50.0;
  if ((a4 & 2) == 0)
    *(float *)&v5 = 50.0;
  -[TPBadgeView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v4, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (unint64_t)theme
{
  return self->_theme;
}

- (NSLayoutConstraint)heightAnchorLayoutConstraint
{
  return self->_heightAnchorLayoutConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelTrailingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_widthAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_heightAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

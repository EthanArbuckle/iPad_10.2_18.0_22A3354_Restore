@implementation TUIVariantCell

- (TUIVariantCell)initWithFrame:(CGRect)a3 string:(id)a4 annotation:(id)a5 traits:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  TUIVariantCell *v17;
  TUIVariantCell *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  UIView *backgroundView;
  void *v29;
  void *v30;
  uint64_t v31;
  UILabel *labelView;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  UILabel *annotationLabelView;
  void *v39;
  void *v40;
  objc_super v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v42.receiver = self;
  v42.super_class = (Class)TUIVariantCell;
  v17 = -[TUIVariantCell initWithFrame:](&v42, sel_initWithFrame_, x, y, width, height);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayString, a4);
    objc_msgSend(v16, "variantTraits");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = v16;
    objc_storeStrong((id *)&v18->_traits, v21);

    v22 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v23 = *MEMORY[0x1E0C9D648];
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v27 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], v24, v25, v26);
    backgroundView = v18->_backgroundView;
    v18->_backgroundView = (UIView *)v27;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v18->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](v18->_backgroundView, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setMasksToBounds:", 1);

    -[TUIVariantCell highlightColor](v18, "highlightColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v18->_backgroundView, "setBackgroundColor:", v30);

    -[UIView setAlpha:](v18->_backgroundView, "setAlpha:", 0.0);
    -[TUIVariantCell addSubview:](v18, "addSubview:", v18->_backgroundView);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v23, v24, v25, v26);
    labelView = v18->_labelView;
    v18->_labelView = (UILabel *)v31;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v18->_labelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v18->_labelView, "setTextAlignment:", 1);
    -[UILabel setText:](v18->_labelView, "setText:", v14);
    -[UIKBRenderTraits symbolStyle](v18->_traits, "symbolStyle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIVariantCell fontForSymbolStyle:](v18, "fontForSymbolStyle:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18->_labelView, "setFont:", v34);

    -[UILabel setAdjustsFontSizeToFitWidth:](v18->_labelView, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v18->_labelView, "setMinimumScaleFactor:", 0.6);
    -[TUIVariantCell unhighlightedTextColor](v18, "unhighlightedTextColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v18->_labelView, "setTextColor:", v35);

    LODWORD(v36) = 1144782848;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v18->_labelView, "setContentCompressionResistancePriority:forAxis:", 0, v36);
    -[TUIVariantCell addSubview:](v18, "addSubview:", v18->_labelView);
    if (objc_msgSend(v15, "length"))
    {
      v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v23, v24, v25, v26);
      annotationLabelView = v18->_annotationLabelView;
      v18->_annotationLabelView = (UILabel *)v37;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v18->_annotationLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setTextAlignment:](v18->_annotationLabelView, "setTextAlignment:", 1);
      -[UILabel setText:](v18->_annotationLabelView, "setText:", v15);
      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v18->_annotationLabelView, "setFont:", v39);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v18->_annotationLabelView, "setTextColor:", v40);

      -[TUIVariantCell addSubview:](v18, "addSubview:", v18->_annotationLabelView);
    }
    -[TUIVariantCell setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

  return v18;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  unint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIVariantCell;
  -[TUIVariantCell layoutSubviews](&v8, sel_layoutSubviews);
  -[TUIVariantCell backgroundCornerRadius](self, "backgroundCornerRadius");
  v4 = v3;
  -[UIView layer](self->_backgroundView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  v6 = -[TUIVariantCell backgroundMaskedCorners](self, "backgroundMaskedCorners");
  -[UIView layer](self->_backgroundView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskedCorners:", v6);

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
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
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
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  objc_super v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  -[TUIVariantCell cellConstraints](self, "cellConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[TUIVariantCell labelInsets](self, "labelInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[TUIVariantCell backgroundInsets](self, "backgroundInsets");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[TUIVariantCell annotationLabelInsets](self, "annotationLabelInsets");
    v37 = v20;
    v39 = v21;
    -[TUIVariantCell backgroundView](self, "backgroundView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIVariantCell constraintsToEmbedView:withinView:withInsets:](self, "constraintsToEmbedView:withinView:withInsets:", v22, self, v13, v15, v17, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIVariantCell labelView](self, "labelView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIVariantCell constraintsToEmbedView:withinView:withInsets:](self, "constraintsToEmbedView:withinView:withInsets:", v24, v22, v5, v7, v9, v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIVariantCell annotationLabelView](self, "annotationLabelView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "topAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "topAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, v37);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v29;
      objc_msgSend(v28, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "trailingAnchor");
      v38 = v23;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, v39);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v33);
      v34 = objc_claimAutoreleasedReturnValue();

      v26 = (void *)v34;
      v23 = v38;
    }
    -[TUIVariantCell setCellConstraints:](self, "setCellConstraints:", v26);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v26);

  }
  v40.receiver = self;
  v40.super_class = (Class)TUIVariantCell;
  -[TUIVariantCell updateConstraints](&v40, sel_updateConstraints);
}

- (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    -[TUIVariantCell transitionToHighlighted:](self, "transitionToHighlighted:");
    self->_highlighted = a3;
  }
}

- (void)transitionToHighlighted:(BOOL)a3
{
  double v5;
  id v6;

  v5 = 0.0;
  if (a3)
    v5 = 1.0;
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v5);
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    -[TUIVariantCell unhighlightedTextColor](self, "unhighlightedTextColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_labelView, "setTextColor:", v6);

}

- (id)fontForSymbolStyle:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "fontName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWeight");
  v6 = v5;
  objc_msgSend(v3, "fontSize");
  v8 = v7;

  v9 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4D58]);
  v10 = 22.0;
  if (v8 > 0.0)
    v10 = v8;
  if (v9)
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", v10, v6);
  else
    objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithName:size:traits:", v4, 4096, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)constraintsToEmbedView:(id)a3 withinView:(id)a4 withInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;
  id v11;
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
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v26[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, top);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, left);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v14;
  objc_msgSend(v10, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, bottom);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v17;
  objc_msgSend(v10, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, right);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)viewForLastBaselineLayout
{
  return self->_labelView;
}

- (id)viewForFirstBaselineLayout
{
  return self->_labelView;
}

- (UIEdgeInsets)backgroundInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 6.0;
  v3 = 0.0;
  v4 = 15.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)labelInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[TUIVariantCell traits](self, "traits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textOffset");
  v6 = v5;
  -[TUIVariantCell traits](self, "traits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "symbolStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textOffset");
  v10 = v9;

  v11 = 0.0;
  v12 = 0.0;
  v13 = v6;
  v14 = v10;
  result.right = v12;
  result.bottom = v14;
  result.left = v13;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)annotationLabelInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 2.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = -2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)highlightColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

- (id)unhighlightedTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (double)backgroundCornerRadius
{
  return 5.0;
}

- (unint64_t)backgroundMaskedCorners
{
  return 15;
}

- (unint64_t)indexNumber
{
  return self->_indexNumber;
}

- (void)setIndexNumber:(unint64_t)a3
{
  self->_indexNumber = a3;
}

- (BOOL)isPrimaryVariant
{
  return self->_primaryVariant;
}

- (void)setPrimaryVariant:(BOOL)a3
{
  self->_primaryVariant = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UILabel)labelView
{
  return self->_labelView;
}

- (UILabel)annotationLabelView
{
  return self->_annotationLabelView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (UIKBRenderTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (NSArray)cellConstraints
{
  return self->_cellConstraints;
}

- (void)setCellConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_cellConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellConstraints, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_annotationLabelView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end

@implementation PKAddPassButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (PKAddPassButton)addPassButtonWithStyle:(PKAddPassButtonStyle)addPassButtonStyle
{
  return (PKAddPassButton *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAddPassButtonStyle:", addPassButtonStyle);
}

- (PKAddPassButton)initWithCoder:(id)a3
{
  id v4;
  PKAddPassButton *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKAddPassButton;
  v5 = -[PKAddPassButton initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_addPassButtonStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PKButtonStyle"));
    v5->_addPassButtonType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PKButtonType"));
    -[PKAddPassButton _sharedInit](v5, "_sharedInit");
  }

  return v5;
}

- (PKAddPassButton)init
{
  return -[PKAddPassButton initWithAddPassButtonStyle:](self, "initWithAddPassButtonStyle:", 0);
}

- (PKAddPassButton)initWithFrame:(CGRect)a3
{
  return -[PKAddPassButton initWithAddPassButtonStyle:](self, "initWithAddPassButtonStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKAddPassButton)initWithAddPassButtonStyle:(PKAddPassButtonStyle)style
{
  double v4;
  double v5;
  PKAddPassButton *v6;
  PKAddPassButton *v7;
  objc_super v9;

  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v9.receiver = self;
  v9.super_class = (Class)PKAddPassButton;
  v6 = -[PKAddPassButton initWithFrame:](&v9, sel_initWithFrame_, v4, v5, 190.0, 57.0);
  v7 = v6;
  if (v6)
  {
    v6->_addPassButtonStyle = style;
    v6->_addPassButtonType = 0;
    -[PKAddPassButton _sharedInit](v6, "_sharedInit");
  }
  return v7;
}

- (PKAddPassButton)initWithAddPassButtonStyle:(int64_t)a3 addPassButtonType:(int64_t)a4
{
  double v6;
  double v7;
  PKAddPassButton *v8;
  PKAddPassButton *v9;
  objc_super v11;

  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v11.receiver = self;
  v11.super_class = (Class)PKAddPassButton;
  v8 = -[PKAddPassButton initWithFrame:](&v11, sel_initWithFrame_, v6, v7, 190.0, 57.0);
  v9 = v8;
  if (v8)
  {
    v8->_addPassButtonStyle = a3;
    v8->_addPassButtonType = a4;
    -[PKAddPassButton _sharedInit](v8, "_sharedInit");
  }
  return v9;
}

- (void)_sharedInit
{
  CAShapeLayer *v3;
  CAShapeLayer *layer;
  CAShapeLayer *v5;
  id v6;
  CAShapeLayer *v7;
  void *v8;
  double v9;
  PKShapeView *v10;
  PKShapeView *maskView;
  CAShapeLayer *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  UIImageView *v19;
  UIImageView *iconView;
  int64_t addPassButtonType;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  UILabel *v28;
  UILabel *singleLineLabel;
  UILabel *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  uint64_t v34;
  UILabel *v35;
  UILabel *multiLineLabel;
  UILabel *v37;
  void *v38;
  UILabel *v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  void *v45;
  void *v46;
  id v47;

  -[PKAddPassButton setOpaque:](self, "setOpaque:", 0);
  -[PKAddPassButton layer](self, "layer");
  v3 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  layer = self->_layer;
  self->_layer = v3;

  v5 = self->_layer;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.11373, 0.11765, 0.11765, 1.0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

  v7 = self->_layer;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  -[CAShapeLayer setLineWidth:](v7, "setLineWidth:", 1.0 / v9);

  v10 = objc_alloc_init(PKShapeView);
  maskView = self->_maskView;
  self->_maskView = v10;

  v12 = self->_layer;
  -[PKShapeView layer](self->_maskView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setMask:](v12, "setMask:", v13);

  v14 = (void *)MEMORY[0x1E0D66DF8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageNamed:inBundle:", CFSTR("AddPass_Icon"), v15);
  v47 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D66E08], "constraintsWithAspectFitToSize:", 28.0, 20.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "resizedImageWithConstraints:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  self->_iconSize.width = v17;
  self->_iconSize.height = v18;
  v19 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v16);
  iconView = self->_iconView;
  self->_iconView = v19;

  -[PKAddPassButton addSubview:](self, "addSubview:", self->_iconView);
  addPassButtonType = self->_addPassButtonType;
  if (!addPassButtonType)
  {
    v22 = CFSTR("ADD_PASS_BUTTON_SPLIT_TITLE");
    v23 = CFSTR("ADD_PASS_BUTTON_SPLIT_SURTITLE");
    v24 = CFSTR("ADD_PASS_BUTTON_TITLE");
    goto LABEL_5;
  }
  if (addPassButtonType == 1)
  {
    v22 = CFSTR("ADD_PASS_BUTTON_SPLIT_TITLE_TRACK");
    v23 = CFSTR("ADD_PASS_BUTTON_SPLIT_SURTITLE_TRACK");
    v24 = CFSTR("ADD_PASS_BUTTON_TITLE_TRACK");
LABEL_5:
    PKLocalizedString(&v24->isa);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(&v23->isa);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(&v22->isa);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v27 = 0;
  v26 = 0;
  v25 = 0;
LABEL_7:
  v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  singleLineLabel = self->_singleLineLabel;
  self->_singleLineLabel = v28;

  v30 = self->_singleLineLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v30, "setBackgroundColor:", v31);

  v32 = self->_singleLineLabel;
  TitleFormattedString(0, v25, 1, &self->_singleLineAlignmentInset.top);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](v32, "setAttributedText:", v33);

  -[UILabel setNumberOfLines:](self->_singleLineLabel, "setNumberOfLines:", 1);
  -[UILabel sizeToFit](self->_singleLineLabel, "sizeToFit");
  -[PKAddPassButton addSubview:](self, "addSubview:", self->_singleLineLabel);
  if (-[PKAddPassButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v34 = 2;
  else
    v34 = 0;
  v35 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  multiLineLabel = self->_multiLineLabel;
  self->_multiLineLabel = v35;

  v37 = self->_multiLineLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v37, "setBackgroundColor:", v38);

  v39 = self->_multiLineLabel;
  TitleFormattedString(v26, v27, v34, &self->_multiLineAlignmentInset.top);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](v39, "setAttributedText:", v40);

  -[UILabel setNumberOfLines:](self->_multiLineLabel, "setNumberOfLines:", 2);
  -[UILabel sizeToFit](self->_multiLineLabel, "sizeToFit");
  -[PKAddPassButton addSubview:](self, "addSubview:", self->_multiLineLabel);
  -[UILabel frame](self->_singleLineLabel, "frame");
  self->_singleLineSize.width = v41;
  self->_singleLineSize.height = v42;
  -[UILabel frame](self->_multiLineLabel, "frame");
  self->_multiLineSize.width = v43;
  self->_multiLineSize.height = v44;
  -[PKAddPassButton _applyStyle](self, "_applyStyle");
  -[PKAddPassButton bounds](self, "bounds");
  -[PKAddPassButton _adjustVisibleLabelWithBounds:](self, "_adjustVisibleLabelWithBounds:");
  -[PKAddPassButton setAccessibilityLabel:](self, "setAccessibilityLabel:", v25);
  -[PKAddPassButton setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x1E0DC4660]);
  if (dyld_program_sdk_at_least())
    -[PKAddPassButton sizeToFit](self, "sizeToFit");

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddPassButton;
  v4 = a3;
  -[PKAddPassButton encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_addPassButtonStyle, CFSTR("PKButtonStyle"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_addPassButtonType, CFSTR("PKButtonType"));

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKAddPassButton;
  -[PKAddPassButton dealloc](&v2, sel_dealloc);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("path")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKAddPassButton;
    v5 = -[PKAddPassButton _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[PKAddPassButton _intrinsicContentSizeForSingleLine:](self, "_intrinsicContentSizeForSingleLine:", 0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  -[PKAddPassButton _intrinsicContentSizeForSingleLine:](self, "_intrinsicContentSizeForSingleLine:", -[PKAddPassButton _singleLineFitsSize:](self, "_singleLineFitsSize:", a3.width));
  v5 = fmin(height / v4, 1.0);
  v7 = v6 * v5;
  v8 = v4 * v5;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)_intrinsicContentSizeForSingleLine:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (a3)
    -[PKAddPassButton _baseIntrinsicSingleLineSize](self, "_baseIntrinsicSingleLineSize");
  else
    -[PKAddPassButton _baseIntrinsicMultiLineSize](self, "_baseIntrinsicMultiLineSize");
  v5 = v3;
  v6 = v4;
  PKFloatRoundToPixel();
  v8 = v6 + v7 * 2.0;
  v9 = v5 + v7 * 2.0;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)_baseIntrinsicSingleLineSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = self->_iconSize.width
     + 8.0
     + self->_singleLineSize.width
     - self->_singleLineAlignmentInset.left
     - self->_singleLineAlignmentInset.right;
  v3 = fmax(self->_iconSize.height, self->_singleLineSize.height - self->_singleLineAlignmentInset.top - self->_singleLineAlignmentInset.bottom);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_baseIntrinsicMultiLineSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = self->_iconSize.width
     + 8.0
     + self->_multiLineSize.width
     - self->_multiLineAlignmentInset.left
     - self->_multiLineAlignmentInset.right;
  v3 = fmax(self->_iconSize.height, self->_multiLineSize.height - self->_multiLineAlignmentInset.top - self->_multiLineAlignmentInset.bottom);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  CGRectEdge v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double height;
  double width;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  CAShapeLayer *layer;
  id v41;
  void *v42;
  id v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double MinX;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  CGFloat v104;
  double v105;
  double top;
  double v107;
  double v108;
  double bottom;
  double v110;
  double left;
  double v112;
  double v113;
  double v114;
  double right;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  CGFloat amount;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  CATransform3D v132;
  CGRect remainder;
  CGRect slice;
  CATransform3D v135;
  objc_super v136;
  CGRect v137;
  CGRect v138;

  v136.receiver = self;
  v136.super_class = (Class)PKAddPassButton;
  -[PKAddPassButton layoutSubviews](&v136, sel_layoutSubviews);
  -[PKAddPassButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PKAddPassButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v11)
    v12 = CGRectMaxXEdge;
  else
    v12 = CGRectMinXEdge;
  -[PKShapeView setFrame:](self->_maskView, "setFrame:", v4, v6, v8, v10);
  -[PKAddPassButton _adjustVisibleLabelWithBounds:](self, "_adjustVisibleLabelWithBounds:", v4, v6, v8, v10);
  -[UILabel alpha](self->_singleLineLabel, "alpha");
  v118 = v13;
  -[PKAddPassButton _intrinsicContentSizeForSingleLine:](self, "_intrinsicContentSizeForSingleLine:", v13 > 0.0);
  v15 = v14;
  PKFloatRoundToPixel();
  v17 = v16;
  v18 = fmin(v10 / v15, 1.0);
  memset(&v135, 0, sizeof(v135));
  if (v18 == 1.0)
  {
    v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v135.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v135.m33 = v19;
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v135.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v135.m43 = v20;
    v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v135.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v135.m13 = v21;
    v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v135.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v135.m23 = v22;
  }
  else
  {
    CATransform3DMakeScale(&v135, v18, v18, 1.0);
  }
  height = self->_iconSize.height;
  width = self->_singleLineSize.width;
  top = self->_singleLineAlignmentInset.top;
  bottom = self->_singleLineAlignmentInset.bottom;
  left = self->_singleLineAlignmentInset.left;
  right = self->_singleLineAlignmentInset.right;
  v117 = v18 * self->_iconSize.width;
  v25 = v18 * 8.0;
  v26 = v18 * self->_multiLineSize.width;
  v28 = self->_multiLineAlignmentInset.top;
  v27 = self->_multiLineAlignmentInset.left;
  v30 = self->_multiLineAlignmentInset.bottom;
  v29 = self->_multiLineAlignmentInset.right;
  if (v8 != self->_boundsSize.width || v10 != self->_boundsSize.height)
  {
    self->_boundsSize.width = v8;
    self->_boundsSize.height = v10;
    v31 = (void *)MEMORY[0x1E0DC3508];
    v32 = v6;
    v129 = v26;
    v34 = *MEMORY[0x1E0C9D538];
    v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v122 = width;
    v124 = height;
    v119 = v29;
    v113 = v30;
    v103 = v28;
    v105 = v27;
    PKFloatRoundToPixel();
    v36 = v35;
    v37 = v34;
    v6 = v32;
    v38 = v33;
    v25 = v18 * 8.0;
    objc_msgSend(v31, "_bezierPathWithPillRect:cornerRadius:", v37, v38, v8, v10, v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    layer = self->_layer;
    v41 = objc_retainAutorelease(v39);
    -[CAShapeLayer setPath:](layer, "setPath:", objc_msgSend(v41, "CGPath"));
    -[PKShapeView shapeLayer](self->_maskView, "shapeLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_retainAutorelease(v41);
    objc_msgSend(v42, "setPath:", objc_msgSend(v43, "CGPath"));

    v28 = v103;
    v27 = v105;
    v30 = v113;
    v29 = v119;
    width = v122;
    height = v124;
    v26 = v129;
  }
  v98 = v18 * height;
  v114 = v18 * width;
  v130 = v18 * v28;
  amount = v25;
  v127 = v18 * v27;
  v100 = v18 * v30;
  v99 = v18 * v29;
  v44 = v17 * v18;
  memset(&slice, 0, sizeof(slice));
  v45 = v4 + v17 * v18;
  v46 = v6 + v44;
  v47 = v44 + v44;
  v48 = v8 - v47;
  v49 = v10 - v47;
  v50 = v26;
  v51 = 0.0;
  v104 = v46;
  PKSizeAlignedInRect();
  remainder = v137;
  CGRectDivide(v137, &slice, &remainder, v117, v12);
  v52 = 0.0;
  v53 = 0.0;
  v54 = 0.0;
  if (v118 <= 0.0)
  {
    PKSizeAlignedInRect();
    v51 = v55;
  }
  v120 = v52;
  v121 = v54;
  v123 = v53;
  v125 = v51;
  v112 = v18 * left;
  v108 = v18 * top;
  v110 = v18 * bottom;
  v116 = v18 * right;
  CGRectDivide(remainder, &slice, &remainder, amount, v12);
  CGRectDivide(remainder, &slice, &remainder, v50, v12);
  v56 = v130 + v100;
  PKSizeAlignedInRect();
  v101 = v58;
  v102 = v57;
  v60 = v59;
  v107 = v127 + v99 + v61;
  remainder.origin.x = v45;
  remainder.origin.y = v104;
  remainder.size.width = v48;
  remainder.size.height = v49;
  PKSizeAlignedInRect();
  remainder = v138;
  CGRectDivide(v138, &slice, &remainder, v117, v12);
  if (v118 > 0.0)
  {
    PKSizeAlignedInRect();
    v121 = v62;
    v123 = v63;
    v120 = v64;
    v125 = v65;
  }
  v66 = v102 - v127;
  v128 = v56 + v60;
  v131 = v101 - v130;
  CGRectDivide(remainder, &slice, &remainder, amount, v12);
  CGRectDivide(remainder, &slice, &remainder, v114, v12);
  PKSizeAlignedInRect();
  v71 = v67 - v112;
  v72 = v68 - v108;
  v73 = v112 + v116 + v69;
  v74 = v108 + v110 + v70;
  if (v118 <= 0.0)
    v75 = v112 + v116 + v69;
  else
    v75 = v107;
  v76 = v67 - v112;
  v77 = v68 - v108;
  v78 = v112 + v116 + v69;
  v79 = v108 + v110 + v70;
  if (v118 <= 0.0)
  {
    v76 = v66;
    v79 = v128;
    v77 = v131;
    v78 = v107;
  }
  if (v11)
    MinX = CGRectGetMaxX(*(CGRect *)&v76) - v75;
  else
    MinX = CGRectGetMinX(*(CGRect *)&v76);
  if (v118 <= 0.0)
    v81 = v66;
  else
    v81 = MinX;
  if (v118 <= 0.0)
    v82 = MinX;
  else
    v82 = v71;
  -[UIImageView layer](self->_iconView, "layer", *(_QWORD *)&v98);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "anchorPoint");
  v85 = v84;
  v87 = v86;
  v132 = v135;
  objc_msgSend(v83, "setTransform:", &v132);
  objc_msgSend(v83, "setPosition:", v121 + v85 * v120, v123 + v87 * v125);
  -[UILabel layer](self->_multiLineLabel, "layer");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v88, "anchorPoint");
  v90 = v89;
  v92 = v91;
  v132 = v135;
  objc_msgSend(v88, "setTransform:", &v132);
  objc_msgSend(v88, "setPosition:", v81 + v90 * v107, v131 + v92 * v128);
  -[UILabel layer](self->_singleLineLabel, "layer");
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v93, "anchorPoint");
  v95 = v94;
  v97 = v96;
  v132 = v135;
  objc_msgSend(v93, "setTransform:", &v132);
  objc_msgSend(v93, "setPosition:", v82 + v95 * v73, v72 + v97 * v74);

}

- (void)_adjustVisibleLabelWithBounds:(CGRect)a3
{
  unsigned int v4;

  v4 = -[PKAddPassButton _singleLineFitsSize:](self, "_singleLineFitsSize:", a3.size.width, a3.size.height);
  -[UILabel setAlpha:](self->_multiLineLabel, "setAlpha:", (double)(v4 ^ 1));
  -[UILabel setAlpha:](self->_singleLineLabel, "setAlpha:", (double)v4);
}

- (BOOL)_singleLineFitsSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;

  height = a3.height;
  width = a3.width;
  -[PKAddPassButton _intrinsicContentSizeForSingleLine:](self, "_intrinsicContentSizeForSingleLine:", 1);
  return v6 * fmin(height / v5, 1.0) <= width;
}

- (void)_createHighlightFilterIfNecessary
{
  void *v3;
  id v4;
  CAFilter *v5;
  CAFilter *highlightFilter;
  CAFilter *v7;
  id v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!self->_highlightFilter)
  {
    -[PKAddPassButton layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0CD2780]);
    v5 = (CAFilter *)objc_msgSend(v4, "initWithType:", *MEMORY[0x1E0CD2E60]);
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v5;

    -[CAFilter setName:](self->_highlightFilter, "setName:", CFSTR("highlightFilter"));
    v7 = self->_highlightFilter;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAFilter setValue:forKey:](v7, "setValue:forKey:", objc_msgSend(v8, "CGColor"), CFSTR("inputColor"));

    v10[0] = self->_highlightFilter;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFilters:", v9);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CAShapeLayer *layer;
  id v12;
  void *v13;
  id v14;
  id v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAddPassButton;
  -[PKAddPassButton setHighlighted:](&v16, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    -[PKAddPassButton _createHighlightFilterIfNecessary](self, "_createHighlightFilterIfNecessary");
    v5 = 0.6;
    if (!v3)
      v5 = 1.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3658];
    -[CAShapeLayer presentationLayer](self->_layer, "presentationLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "valueForKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
    if (!v9)
      v9 = -[CAShapeLayer valueForKeyPath:](self->_layer, "valueForKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
    objc_msgSend(v7, "colorWithCGColor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    layer = self->_layer;
    v12 = objc_retainAutorelease(v6);
    -[CAShapeLayer setValue:forKeyPath:](layer, "setValue:forKeyPath:", objc_msgSend(v12, "CGColor"), CFSTR("filters.highlightFilter.inputColor"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDuration:", 0.15);
    objc_msgSend(v13, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    v14 = objc_retainAutorelease(v10);
    objc_msgSend(v13, "setFromValue:", objc_msgSend(v14, "CGColor"));
    v15 = objc_retainAutorelease(v12);
    objc_msgSend(v13, "setToValue:", objc_msgSend(v15, "CGColor"));
    -[CAShapeLayer removeAnimationForKey:](self->_layer, "removeAnimationForKey:", CFSTR("highlight"));
    -[CAShapeLayer addAnimation:forKey:](self->_layer, "addAnimation:forKey:", v13, CFSTR("highlight"));

  }
}

- (void)setAddPassButtonStyle:(PKAddPassButtonStyle)addPassButtonStyle
{
  if (self->_addPassButtonStyle != addPassButtonStyle)
  {
    self->_addPassButtonStyle = addPassButtonStyle;
    -[PKAddPassButton _applyStyle](self, "_applyStyle");
  }
}

- (void)_applyStyle
{
  CAShapeLayer *layer;
  id v3;

  layer = self->_layer;
  if (self->_addPassButtonStyle == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.3);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](layer, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

  }
  else
  {
    -[CAShapeLayer setStrokeColor:](layer, "setStrokeColor:", -[CAShapeLayer fillColor](self->_layer, "fillColor"));
  }
}

- (PKAddPassButtonStyle)addPassButtonStyle
{
  return self->_addPassButtonStyle;
}

- (int64_t)addPassButtonType
{
  return self->_addPassButtonType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_multiLineLabel, 0);
  objc_storeStrong((id *)&self->_singleLineLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end

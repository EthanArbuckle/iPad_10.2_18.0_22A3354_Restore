@implementation _PKIdentityButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (id)buttonWithLabel:(int64_t)a3 style:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabel:style:", a3, a4);
}

- (_PKIdentityButton)initWithCoder:(id)a3
{
  id v4;
  _PKIdentityButton *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PKIdentityButton;
  v5 = -[_PKIdentityButton initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_label = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PKIdentityButtonLabel"));
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PKIdentityButtonStyle"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("PKIdentityButtonCornerRadius"));
    v5->_cornerRadius = v6;
    -[_PKIdentityButton _sharedInit](v5, "_sharedInit");
  }

  return v5;
}

- (_PKIdentityButton)init
{
  return -[_PKIdentityButton initWithLabel:style:](self, "initWithLabel:style:", 0, 0);
}

- (_PKIdentityButton)initWithLabel:(int64_t)a3 style:(int64_t)a4
{
  double v6;
  double v7;
  _PKIdentityButton *v8;
  _PKIdentityButton *v9;
  objc_super v11;

  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v11.receiver = self;
  v11.super_class = (Class)_PKIdentityButton;
  v8 = -[_PKIdentityButton initWithFrame:](&v11, sel_initWithFrame_, v6, v7, 190.0, 57.0);
  v9 = v8;
  if (v8)
  {
    v8->_style = a4;
    v8->_label = a3;
    v8->_cornerRadius = 4.0;
    -[_PKIdentityButton _sharedInit](v8, "_sharedInit");
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
  void *v21;
  UILabel *v22;
  UILabel *singleLineLabel;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  uint64_t v28;
  UILabel *v29;
  UILabel *multiLineLabel;
  UILabel *v31;
  void *v32;
  UILabel *v33;
  void *v34;
  void *v35;
  void *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  void *v41;
  void *v42;
  id v43;

  -[_PKIdentityButton setOpaque:](self, "setOpaque:", 0);
  -[_PKIdentityButton layer](self, "layer");
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
  v43 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D66E08], "constraintsWithAspectFitToSize:", 28.0, 20.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "resizedImageWithConstraints:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v41);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  self->_iconSize.width = v17;
  self->_iconSize.height = v18;
  v19 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v16);
  iconView = self->_iconView;
  self->_iconView = v19;

  -[_PKIdentityButton addSubview:](self, "addSubview:", self->_iconView);
  -[_PKIdentityButton _singleLineTitle](self, "_singleLineTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  singleLineLabel = self->_singleLineLabel;
  self->_singleLineLabel = v22;

  v24 = self->_singleLineLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v24, "setBackgroundColor:", v25);

  v26 = self->_singleLineLabel;
  TitleFormattedString(0, v21, 1, &self->_singleLineAlignmentInset.top);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](v26, "setAttributedText:", v27);

  -[UILabel setNumberOfLines:](self->_singleLineLabel, "setNumberOfLines:", 1);
  -[UILabel sizeToFit](self->_singleLineLabel, "sizeToFit");
  -[_PKIdentityButton addSubview:](self, "addSubview:", self->_singleLineLabel);
  if (-[_PKIdentityButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v28 = 2;
  else
    v28 = 0;
  v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  multiLineLabel = self->_multiLineLabel;
  self->_multiLineLabel = v29;

  v31 = self->_multiLineLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v31, "setBackgroundColor:", v32);

  v33 = self->_multiLineLabel;
  -[_PKIdentityButton _splitSurtitle](self, "_splitSurtitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKIdentityButton _splitTitle](self, "_splitTitle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  TitleFormattedString(v34, v35, v28, &self->_multiLineAlignmentInset.top);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](v33, "setAttributedText:", v36);

  -[UILabel setNumberOfLines:](self->_multiLineLabel, "setNumberOfLines:", 2);
  -[UILabel sizeToFit](self->_multiLineLabel, "sizeToFit");
  -[_PKIdentityButton addSubview:](self, "addSubview:", self->_multiLineLabel);
  -[UILabel frame](self->_singleLineLabel, "frame");
  self->_singleLineSize.width = v37;
  self->_singleLineSize.height = v38;
  -[UILabel frame](self->_multiLineLabel, "frame");
  self->_multiLineSize.width = v39;
  self->_multiLineSize.height = v40;
  -[_PKIdentityButton _applyStyle](self, "_applyStyle");
  -[_PKIdentityButton bounds](self, "bounds");
  -[_PKIdentityButton _adjustVisibleLabelWithBounds:](self, "_adjustVisibleLabelWithBounds:");
  -[_PKIdentityButton setAccessibilityLabel:](self, "setAccessibilityLabel:", v21);
  -[_PKIdentityButton setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x1E0DC4660]);
  -[_PKIdentityButton sizeToFit](self, "sizeToFit");

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PKIdentityButton;
  v4 = a3;
  -[_PKIdentityButton encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("PKIdentityButtonStyle"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_label, CFSTR("PKIdentityButtonLabel"));

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
    v7.super_class = (Class)_PKIdentityButton;
    v5 = -[_PKIdentityButton _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_PKIdentityButton _intrinsicContentSizeForSingleLine:](self, "_intrinsicContentSizeForSingleLine:", 0);
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
  -[_PKIdentityButton _intrinsicContentSizeForSingleLine:](self, "_intrinsicContentSizeForSingleLine:", -[_PKIdentityButton _singleLineFitsSize:](self, "_singleLineFitsSize:", a3.width));
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
    -[_PKIdentityButton _baseIntrinsicSingleLineSize](self, "_baseIntrinsicSingleLineSize");
  else
    -[_PKIdentityButton _baseIntrinsicMultiLineSize](self, "_baseIntrinsicMultiLineSize");
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
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  double height;
  double width;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  CAShapeLayer *layer;
  id v43;
  void *v44;
  id v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
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
  double v80;
  double v81;
  double MinX;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  CGFloat v106;
  double v107;
  double top;
  double v109;
  double v110;
  double bottom;
  double v112;
  double left;
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
  double v126;
  double v127;
  CGFloat amount;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  CATransform3D v135;
  CGRect remainder;
  CGRect slice;
  CATransform3D v138;
  objc_super v139;
  CGRect v140;
  CGRect v141;

  v139.receiver = self;
  v139.super_class = (Class)_PKIdentityButton;
  -[_PKIdentityButton layoutSubviews](&v139, sel_layoutSubviews);
  -[_PKIdentityButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[_PKIdentityButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v11)
    v12 = CGRectMaxXEdge;
  else
    v12 = CGRectMinXEdge;
  -[PKShapeView setFrame:](self->_maskView, "setFrame:", v4, v6, v8, v10);
  v126 = v6;
  -[_PKIdentityButton _adjustVisibleLabelWithBounds:](self, "_adjustVisibleLabelWithBounds:", v4, v6, v8, v10);
  -[UILabel alpha](self->_singleLineLabel, "alpha");
  v14 = v13;
  -[_PKIdentityButton _intrinsicContentSizeForSingleLine:](self, "_intrinsicContentSizeForSingleLine:", v13 > 0.0);
  v16 = v15;
  PKFloatRoundToPixel();
  v18 = v17;
  v19 = fmin(v10 / v16, 1.0);
  memset(&v138, 0, sizeof(v138));
  if (v19 == 1.0)
  {
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v138.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v138.m33 = v20;
    v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v138.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v138.m43 = v21;
    v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v138.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v138.m13 = v22;
    v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v138.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v138.m23 = v23;
  }
  else
  {
    CATransform3DMakeScale(&v138, v19, v19, 1.0);
  }
  v120 = v14;
  height = self->_iconSize.height;
  width = self->_singleLineSize.width;
  top = self->_singleLineAlignmentInset.top;
  bottom = self->_singleLineAlignmentInset.bottom;
  left = self->_singleLineAlignmentInset.left;
  right = self->_singleLineAlignmentInset.right;
  v119 = v19 * self->_iconSize.width;
  v26 = v19 * 8.0;
  v27 = v19 * self->_multiLineSize.width;
  v29 = self->_multiLineAlignmentInset.top;
  v28 = self->_multiLineAlignmentInset.left;
  v31 = self->_multiLineAlignmentInset.bottom;
  v30 = self->_multiLineAlignmentInset.right;
  if (v8 != self->_boundsSize.width || v10 != self->_boundsSize.height)
  {
    self->_boundsSize.width = v8;
    self->_boundsSize.height = v10;
    v32 = (void *)MEMORY[0x1E0D675C8];
    v33 = v18;
    v34 = v4;
    v36 = *MEMORY[0x1E0C9D538];
    v35 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v129 = height;
    v132 = v27;
    v124 = width;
    v121 = v30;
    v117 = v31;
    v105 = v29;
    v107 = v28;
    -[_PKIdentityButton _adjustedCornerRadiusForScale:](self, "_adjustedCornerRadiusForScale:", v19);
    v38 = v37;
    v39 = v36;
    v4 = v34;
    v18 = v33;
    v40 = v35;
    v26 = v19 * 8.0;
    objc_msgSend(v32, "pathWithRoundedRect:cornerRadius:", v39, v40, v8, v10, v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    layer = self->_layer;
    v43 = objc_retainAutorelease(v41);
    -[CAShapeLayer setPath:](layer, "setPath:", objc_msgSend(v43, "CGPath"));
    -[PKShapeView shapeLayer](self->_maskView, "shapeLayer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_retainAutorelease(v43);
    objc_msgSend(v44, "setPath:", objc_msgSend(v45, "CGPath"));

    v29 = v105;
    v28 = v107;
    v31 = v117;
    v30 = v121;
    width = v124;
    height = v129;
    v27 = v132;
  }
  v100 = v19 * height;
  v118 = v19 * width;
  v133 = v19 * v29;
  amount = v26;
  v130 = v19 * v28;
  v102 = v19 * v31;
  v101 = v19 * v30;
  v46 = v18 * v19;
  memset(&slice, 0, sizeof(slice));
  v47 = v4 + v18 * v19;
  v48 = v126 + v46;
  v49 = v46 + v46;
  v50 = v8 - v49;
  v51 = v10 - v49;
  v52 = v27;
  v53 = 0.0;
  v106 = v48;
  PKSizeAlignedInRect();
  remainder = v140;
  CGRectDivide(v140, &slice, &remainder, v119, v12);
  v54 = 0.0;
  v55 = 0.0;
  v56 = 0.0;
  if (v120 <= 0.0)
  {
    PKSizeAlignedInRect();
    v53 = v57;
  }
  v122 = v54;
  v123 = v56;
  v125 = v55;
  v127 = v53;
  v110 = v19 * top;
  v112 = v19 * bottom;
  v114 = v19 * left;
  v116 = v19 * right;
  CGRectDivide(remainder, &slice, &remainder, amount, v12);
  CGRectDivide(remainder, &slice, &remainder, v52, v12);
  v58 = v133 + v102;
  PKSizeAlignedInRect();
  v103 = v60;
  v104 = v59;
  v62 = v61;
  v109 = v130 + v101 + v63;
  remainder.origin.x = v47;
  remainder.origin.y = v106;
  remainder.size.width = v50;
  remainder.size.height = v51;
  PKSizeAlignedInRect();
  remainder = v141;
  CGRectDivide(v141, &slice, &remainder, v119, v12);
  if (v120 > 0.0)
  {
    PKSizeAlignedInRect();
    v123 = v64;
    v125 = v65;
    v122 = v66;
    v127 = v67;
  }
  v68 = v104 - v130;
  v131 = v58 + v62;
  v134 = v103 - v133;
  CGRectDivide(remainder, &slice, &remainder, amount, v12);
  CGRectDivide(remainder, &slice, &remainder, v118, v12);
  PKSizeAlignedInRect();
  v73 = v69 - v114;
  v74 = v70 - v110;
  v75 = v114 + v116 + v71;
  v76 = v110 + v112 + v72;
  if (v120 <= 0.0)
    v77 = v114 + v116 + v71;
  else
    v77 = v109;
  v78 = v69 - v114;
  v79 = v70 - v110;
  v80 = v114 + v116 + v71;
  v81 = v110 + v112 + v72;
  if (v120 <= 0.0)
  {
    v78 = v68;
    v81 = v131;
    v79 = v134;
    v80 = v109;
  }
  if (v11)
    MinX = CGRectGetMaxX(*(CGRect *)&v78) - v77;
  else
    MinX = CGRectGetMinX(*(CGRect *)&v78);
  if (v120 <= 0.0)
    v83 = v68;
  else
    v83 = MinX;
  if (v120 <= 0.0)
    v84 = MinX;
  else
    v84 = v73;
  -[UIImageView layer](self->_iconView, "layer", *(_QWORD *)&v100);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "anchorPoint");
  v87 = v86;
  v89 = v88;
  v135 = v138;
  objc_msgSend(v85, "setTransform:", &v135);
  objc_msgSend(v85, "setPosition:", v123 + v87 * v122, v125 + v89 * v127);
  -[UILabel layer](self->_multiLineLabel, "layer");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v90, "anchorPoint");
  v92 = v91;
  v94 = v93;
  v135 = v138;
  objc_msgSend(v90, "setTransform:", &v135);
  objc_msgSend(v90, "setPosition:", v83 + v92 * v109, v134 + v94 * v131);
  -[UILabel layer](self->_singleLineLabel, "layer");
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v95, "anchorPoint");
  v97 = v96;
  v99 = v98;
  v135 = v138;
  objc_msgSend(v95, "setTransform:", &v135);
  objc_msgSend(v95, "setPosition:", v84 + v97 * v75, v74 + v99 * v76);

}

- (void)_adjustVisibleLabelWithBounds:(CGRect)a3
{
  unsigned int v4;

  v4 = -[_PKIdentityButton _singleLineFitsSize:](self, "_singleLineFitsSize:", a3.size.width, a3.size.height);
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
  -[_PKIdentityButton _intrinsicContentSizeForSingleLine:](self, "_intrinsicContentSizeForSingleLine:", 1);
  return v6 * fmin(height / v5, 1.0) <= width;
}

- (id)_singleLineTitle
{
  unint64_t v2;
  __CFString *v3;

  v2 = self->_label - 1;
  if (v2 > 2)
    v3 = CFSTR("IDENTITY_VERIFY_IDENTITY_BUTTON_TITLE");
  else
    v3 = off_1E3E761B8[v2];
  PKLocalizedString(&v3->isa);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_splitSurtitle
{
  unint64_t v2;
  __CFString *v3;

  v2 = self->_label - 1;
  if (v2 > 2)
    v3 = CFSTR("IDENTITY_VERIFY_IDENTITY_BUTTON_SPLIT_SURTITLE");
  else
    v3 = off_1E3E761D0[v2];
  PKLocalizedString(&v3->isa);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_splitTitle
{
  return (id)PKLocalizedString(CFSTR("IDENTITY_BUTTON_SPLIT_TITLE"));
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
    -[_PKIdentityButton layer](self, "layer");
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
  v16.super_class = (Class)_PKIdentityButton;
  -[_PKIdentityButton setHighlighted:](&v16, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    -[_PKIdentityButton _createHighlightFilterIfNecessary](self, "_createHighlightFilterIfNecessary");
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

- (void)_applyStyle
{
  CAShapeLayer *layer;
  id v3;

  layer = self->_layer;
  if (self->_style == 1)
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

- (void)setCornerRadius:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[_PKIdentityButton setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (double)_adjustedCornerRadiusForScale:(double)a3
{
  double result;

  -[_PKIdentityButton cornerRadius](self, "cornerRadius");
  PKFloatRoundToPixelWithScale();
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
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

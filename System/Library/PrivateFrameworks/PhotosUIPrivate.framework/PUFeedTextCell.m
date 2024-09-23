@implementation PUFeedTextCell

- (PUFeedTextCell)initWithFrame:(CGRect)a3
{
  PUFeedTextCell *v3;
  PUFeedTextCell *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUFeedTextCell;
  v3 = -[PUFeedTextCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shouldUseOpaqueBackground = 1;
    -[PUFeedTextCell _updateShouldUseAccessibilityLayout](v3, "_updateShouldUseAccessibilityLayout");
    v5 = -[PUFeedTextCell shouldUseAccessibilityLayout](v4, "shouldUseAccessibilityLayout") ^ 1;
    -[PUFeedTextCell setNumberOfTextLines:](v4, "setNumberOfTextLines:", v5);
    -[PUFeedTextCell setNumberOfDetailTextLines:](v4, "setNumberOfDetailTextLines:", v5);
    -[PUFeedTextCell setTextAlignment:](v4, "setTextAlignment:", 4);
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PUFeedTextCell _labelBackgroundColor](v4, "_labelBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    objc_msgSend(v7, "setNumberOfLines:", -[PUFeedTextCell numberOfTextLines](v4, "numberOfTextLines"));
    objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
    -[PUFeedTextCell _setLabel:](v4, "_setLabel:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PUFeedTextCell;
  -[PUFeedCell dealloc](&v4, sel_dealloc);
}

- (void)_updateShouldUseAccessibilityLayout
{
  NSString *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[PUFeedTextCell setShouldUseAccessibilityLayout:](self, "setShouldUseAccessibilityLayout:", UIContentSizeCategoryIsAccessibilityCategory(v3));

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  -[PUFeedTextCell _invalidateCachedTextSizes](self, "_invalidateCachedTextSizes", a3);
  -[PUFeedTextCell _updateShouldUseAccessibilityLayout](self, "_updateShouldUseAccessibilityLayout");
  -[PUFeedTextCell _updateButtonAnimated:](self, "_updateButtonAnimated:", 0);
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAttributedText:(id)a3
{
  void *v5;
  NSAttributedString *v6;

  v6 = (NSAttributedString *)a3;
  if (self->_attributedText != v6)
  {
    objc_storeStrong((id *)&self->_attributedText, a3);
    -[PUFeedTextCell _label](self, "_label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedText:", v6);

    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setNumberOfTextLines:(int64_t)a3
{
  void *v5;

  if (self->_numberOfTextLines != a3)
  {
    self->_numberOfTextLines = a3;
    -[PUFeedTextCell _label](self, "_label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfLines:", a3);

    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTextDetailTextSpacing:(double)a3
{
  if (self->_textDetailTextSpacing != a3)
  {
    self->_textDetailTextSpacing = a3;
    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAttributedDetailText:(id)a3
{
  NSAttributedString *v5;
  NSAttributedString *v6;

  v5 = (NSAttributedString *)a3;
  if (self->_attributedDetailText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_attributedDetailText, a3);
    -[PUFeedTextCell _updateDetailLabel](self, "_updateDetailLabel");
    v5 = v6;
  }

}

- (void)setNumberOfDetailTextLines:(int64_t)a3
{
  void *v5;

  if (self->_numberOfDetailTextLines != a3)
  {
    self->_numberOfDetailTextLines = a3;
    -[PUFeedTextCell _detailLabel](self, "_detailLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfLines:", a3);

    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  void *v5;
  void *v6;

  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[PUFeedTextCell _label](self, "_label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", a3);

    -[PUFeedTextCell _detailLabel](self, "_detailLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", a3);

    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIconImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_iconImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_iconImage, a3);
    -[PUFeedTextCell _updateIconImageView](self, "_updateIconImageView");
    v5 = v6;
  }

}

- (void)setIconLocation:(int64_t)a3
{
  if (self->_iconLocation != a3)
  {
    self->_iconLocation = a3;
    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIconPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_iconPadding.left
    || a3.top != self->_iconPadding.top
    || a3.right != self->_iconPadding.right
    || a3.bottom != self->_iconPadding.bottom)
  {
    self->_iconPadding = a3;
    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setButtonType:(int64_t)a3
{
  -[PUFeedTextCell setButtonType:animated:](self, "setButtonType:animated:", a3, 0);
}

- (void)setButtonType:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_buttonType != a3)
  {
    self->_buttonType = a3;
    -[PUFeedTextCell _updateButtonAnimated:](self, "_updateButtonAnimated:", a4);
  }
}

- (void)setButtonSize:(int64_t)a3
{
  if (self->_buttonSize != a3)
  {
    self->_buttonSize = a3;
    -[PUFeedTextCell _updateButtonAnimated:](self, "_updateButtonAnimated:", 0);
  }
}

- (void)setButtonHorizontalAlignment:(int64_t)a3
{
  id v4;

  if (self->_buttonHorizontalAlignment != a3)
  {
    self->_buttonHorizontalAlignment = a3;
    -[PUFeedTextCell _button](self, "_button");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentHorizontalAlignment:", a3);

  }
}

- (void)setButtonPadding:(double)a3
{
  if (self->_buttonPadding != a3)
  {
    self->_buttonPadding = a3;
    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }
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
  int64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int64_t v35;
  int64_t v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  CGRect *v55;
  CGFloat v56;
  double v57;
  double v58;
  double MaxX;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGSize v72;
  CGPoint v73;
  double v74;
  double v75;
  double v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect slice;
  CGRect remainder;
  objc_super v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v82.receiver = self;
  v82.super_class = (Class)PUFeedTextCell;
  -[PUFeedTextCell layoutSubviews](&v82, sel_layoutSubviews);
  -[PUFeedTextCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUFeedTextCell contentInsets](self, "contentInsets");
  v12 = v11;
  v70 = v6;
  v71 = v4;
  v14 = v4 + v13;
  v16 = v6 + v15;
  v68 = v10;
  v69 = v8;
  v17 = v8 - (v13 + v11);
  memset(&remainder, 0, sizeof(remainder));
  v19 = v10 - (v15 + v18);
  memset(&slice, 0, sizeof(slice));
  -[PUFeedTextCell _iconSize](self, "_iconSize");
  v76 = v20;
  v74 = v21;
  v22 = -[PUFeedTextCell iconLocation](self, "iconLocation");
  -[PUFeedTextCell iconPadding](self, "iconPadding");
  v75 = v24;
  if ((unint64_t)(v22 - 1) >= 2)
  {
    if (!v22)
    {
      v27 = v23;
      v28 = v25;
      v29 = v26;
      v30 = v26 + v76 + v24;
      v83.origin.x = v14;
      v83.origin.y = v16;
      v83.size.width = v17;
      v83.size.height = v19;
      CGRectDivide(v83, &slice, &remainder, v30, CGRectMaxXEdge);
      slice.origin.x = v75 + slice.origin.x;
      slice.origin.y = v27 + slice.origin.y;
      slice.size.width = slice.size.width - (v75 + v29);
      slice.size.height = slice.size.height - (v27 + v28);
      slice.origin.y = CGRectGetMidY(slice) + v74 * -0.5;
    }
  }
  else
  {
    remainder.origin.x = v14;
    remainder.origin.y = v16;
    remainder.size.width = v17;
    remainder.size.height = v19;
  }
  v72 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v73 = (CGPoint)*MEMORY[0x1E0C9D648];
  v79.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v79.size = v72;
  v31 = *MEMORY[0x1E0DC49E8];
  v32 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v33 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v34 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v35 = -[PUFeedTextCell buttonType](self, "buttonType");
  if (v35)
  {
    v36 = v35;
    -[PUFeedTextCell _textSizeForButtonWithType:size:](self, "_textSizeForButtonWithType:size:", v35, -[PUFeedTextCell buttonSize](self, "buttonSize"));
    v38 = v37;
    v40 = v39;
    if (-[PUFeedTextCell shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout"))
    {
      CGRectDivide(remainder, &v79, &remainder, v40, CGRectMaxYEdge);
      v79.size.width = v38;
      memset(&v78, 0, sizeof(v78));
      -[PUFeedTextCell textDetailTextSpacing](self, "textDetailTextSpacing");
      CGRectDivide(remainder, &v78, &remainder, v41, CGRectMaxYEdge);
    }
    else
    {
      -[PUFeedTextCell _maximumPossibleTextSizeForButtonWithType:size:](self, "_maximumPossibleTextSizeForButtonWithType:size:", v36, -[PUFeedTextCell buttonSize](self, "buttonSize"));
      v43 = v42;
      v45 = v44;
      if (-[PUFeedTextCell buttonHorizontalAlignment](self, "buttonHorizontalAlignment") == 2)
        v46 = v38;
      else
        v46 = v43;
      CGRectDivide(remainder, &v79, &remainder, v46, CGRectMaxXEdge);
      v32 = 5.0;
      v34 = v12 + 5.0;
      v79.origin.x = CGRectGetMaxX(v79) - v43 + -5.0;
      v79.origin.y = v79.origin.y + -5.0;
      v79.size.width = v43 - (-5.0 - (v12 + 5.0));
      v79.size.height = v45 + 15.0;
      -[PUFeedTextCell buttonPadding](self, "buttonPadding");
      remainder.size.width = remainder.size.width - v47;
      v33 = 10.0;
      v31 = 5.0;
    }
  }
  v78 = remainder;
  v77.origin = v73;
  v77.size = v72;
  -[PUFeedTextCell _detailLabel](self, "_detailLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[PUFeedTextCell _label](self, "_label");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v51 = v50;

    -[PUFeedTextCell textDetailTextSpacing](self, "textDetailTextSpacing");
    CGRectDivide(remainder, &v78, &v77, v51 + v52, CGRectMinYEdge);
    v78.size.height = v51;
  }
  if (v22 == 2)
  {
    v77.size.width = v77.size.width - (v76 + v75);
    -[PUFeedTextCell _detailLabel](self, "_detailLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = &v77;
    v53 = v74;
  }
  else
  {
    v53 = v74;
    if (v22 != 1)
      goto LABEL_19;
    v78.size.width = v78.size.width - (v76 + v75);
    -[PUFeedTextCell _label](self, "_label");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = &v78;
  }
  objc_msgSend(v54, "sizeThatFits:", v55->size.width, v55->size.height);
  v55->size.width = v56;

  slice.origin.x = v75 + CGRectGetMaxX(*v55);
  slice.origin.y = CGRectGetMidY(*v55) + v53 * -0.5;
LABEL_19:
  slice.size.width = v76;
  slice.size.height = v53;
  -[PUFeedTextCell iconOffset](self, "iconOffset");
  slice.origin.x = slice.origin.x + v57;
  slice.origin.y = v58 + slice.origin.y;
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUFeedTextCell semanticContentAttribute](self, "semanticContentAttribute")))
  {
    v84.origin.x = v71;
    v84.origin.y = v70;
    v84.size.width = v69;
    v84.size.height = v68;
    MaxX = CGRectGetMaxX(v84);
    slice.origin.x = MaxX - CGRectGetWidth(slice) - slice.origin.x;
    v85.origin.x = v71;
    v85.origin.y = v70;
    v85.size.width = v69;
    v85.size.height = v68;
    v60 = CGRectGetMaxX(v85);
    v78.origin.x = v60 - CGRectGetWidth(v78) - v78.origin.x;
    v86.origin.x = v71;
    v86.origin.y = v70;
    v86.size.width = v69;
    v86.size.height = v68;
    v61 = CGRectGetMaxX(v86);
    v77.origin.x = v61 - CGRectGetWidth(v77) - v77.origin.x;
    v87.origin.x = v71;
    v87.origin.y = v70;
    v87.size.width = v69;
    v87.size.height = v68;
    v62 = CGRectGetMaxX(v87);
    v79.origin.x = v62 - CGRectGetWidth(v79) - v79.origin.x;
  }
  -[PUFeedTextCell _iconImageView](self, "_iconImageView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setFrame:", PURoundRectToPixel(slice.origin.x, slice.origin.y, slice.size.width, slice.size.height));

  -[PUFeedTextCell _label](self, "_label");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setFrame:", PURoundRectToPixel(v78.origin.x, v78.origin.y, v78.size.width, v78.size.height));

  -[PUFeedTextCell _detailLabel](self, "_detailLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setFrame:", PURoundRectToPixel(v77.origin.x, v77.origin.y, v77.size.width, v77.size.height));

  -[PUFeedTextCell _button](self, "_button");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setContentEdgeInsets:", v31, v32, v33, v34);

  -[PUFeedTextCell _button](self, "_button");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setFrame:", PURoundRectToPixel(v79.origin.x, v79.origin.y, v79.size.width, v79.size.height));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _BOOL4 v5;
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
  int64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int64_t v24;
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
  void *v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGSize result;

  width = a3.width;
  v5 = -[PUFeedTextCell shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout", a3.width, a3.height);
  -[PUFeedTextCell contentInsets](self, "contentInsets");
  v55 = v7;
  v56 = v6;
  v9 = v8;
  v11 = v10;
  -[PUFeedTextCell _iconSize](self, "_iconSize");
  v13 = v12;
  v54 = v14;
  v15 = v9 + v11;
  v16 = -[PUFeedTextCell iconLocation](self, "iconLocation");
  -[PUFeedTextCell iconPadding](self, "iconPadding");
  v18 = v13 + v17;
  v20 = v19 + v13 + v17;
  if (v16)
    v20 = -0.0;
  v21 = v15 + v20;
  v23 = *MEMORY[0x1E0C9D820];
  v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v24 = -[PUFeedTextCell buttonType](self, "buttonType");
  v52 = v22;
  v53 = v23;
  if (v24)
  {
    -[PUFeedTextCell _maximumPossibleTextSizeForButtonWithType:size:](self, "_maximumPossibleTextSizeForButtonWithType:size:", v24, -[PUFeedTextCell buttonSize](self, "buttonSize"));
    v23 = v25;
    v22 = v26;
    if (!v5)
    {
      -[PUFeedTextCell buttonPadding](self, "buttonPadding");
      v21 = v21 + v23 + v27;
    }
  }
  v28 = width - v21;
  v29 = width - v21;
  if (v16 == 1)
  {
    -[PUFeedTextCell iconPadding](self, "iconPadding");
    v29 = v28 - (v13 + v30);
  }
  -[PUFeedTextCell _label](self, "_label");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sizeThatFits:", v29, 1.79769313e308);
  v33 = v32;
  v35 = v34;

  -[PUFeedTextCell _detailLabel](self, "_detailLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    if (v16 == 2)
    {
      -[PUFeedTextCell iconPadding](self, "iconPadding");
      v33 = v33 - (v13 + v37);
    }
    -[PUFeedTextCell _detailLabel](self, "_detailLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sizeThatFits:", v28, 1.79769313e308);
    v40 = v39;
    v42 = v41;

  }
  else
  {
    v42 = v52;
    v40 = v53;
  }
  v43 = v18 + v40;
  v44 = v18 + v33;
  if (v16 != 1)
    v44 = v33;
  if (v16 == 2)
    v44 = v33;
  else
    v43 = v40;
  if (v44 >= v43)
    v45 = v44;
  else
    v45 = v43;
  -[PUFeedTextCell textDetailTextSpacing](self, "textDetailTextSpacing");
  v47 = v42 + v35 + v46;
  if (v5 && (v23 != v53 || v22 != v52))
  {
    if (v45 < v23)
      v45 = v23;
    -[PUFeedTextCell textDetailTextSpacing](self, "textDetailTextSpacing");
    v47 = v47 + v22 + v48;
  }
  v49 = v56 + v55 + v47;
  if (v49 < v54)
    v49 = v54;
  if (v49 >= v22)
    v50 = v49;
  else
    v50 = v22;
  if (v5)
    v50 = v49;
  v51 = v21 + v45;
  result.height = v50;
  result.width = v51;
  return result;
}

- (BOOL)shouldRecognizerTap:(id)a3
{
  id v4;
  _BOOL4 v5;
  int64_t v6;
  char v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  objc_super v41;
  CGPoint v42;
  CGPoint v43;
  CGRect v44;
  CGRect v45;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PUFeedTextCell;
  v5 = -[PUFeedCell shouldRecognizerTap:](&v41, sel_shouldRecognizerTap_, v4);
  v6 = -[PUFeedTextCell tappableArea](self, "tappableArea");
  if (!v5 || v6 == 0)
    goto LABEL_14;
  v8 = v6;
  -[PUFeedTextCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  if ((v8 & 1) == 0)
  {
    LOBYTE(v5) = 0;
    if ((v8 & 2) == 0)
      goto LABEL_14;
    goto LABEL_11;
  }
  -[PUFeedTextCell _label](self, "_label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  if (-[PUFeedTextCell iconLocation](self, "iconLocation") == 1)
  {
    -[PUFeedTextCell iconImage](self, "iconImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "size");
    v25 = v24;
    -[PUFeedTextCell iconPadding](self, "iconPadding");
    v20 = v20 + v25 + v26;

  }
  v44.origin.x = PURectWithMinimumSize(v16, v18, v20, v22, 40.0, 40.0);
  v42.x = v11;
  v42.y = v13;
  LOBYTE(v5) = CGRectContainsPoint(v44, v42);
  if ((v8 & 2) != 0)
  {
LABEL_11:
    -[PUFeedTextCell _detailLabel](self, "_detailLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    if (-[PUFeedTextCell iconLocation](self, "iconLocation") == 2)
    {
      -[PUFeedTextCell iconImage](self, "iconImage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "size");
      v38 = v37;
      -[PUFeedTextCell iconPadding](self, "iconPadding");
      v33 = v33 + v38 + v39;

    }
    v45.origin.x = PURectWithMinimumSize(v29, v31, v33, v35, 40.0, 40.0);
    v43.x = v11;
    v43.y = v13;
    LOBYTE(v5) = CGRectContainsPoint(v45, v43);
  }
LABEL_14:

  return v5;
}

- (void)setShouldUseOpaqueBackground:(BOOL)a3
{
  if (self->_shouldUseOpaqueBackground != a3)
  {
    self->_shouldUseOpaqueBackground = a3;
    -[PUFeedTextCell _updateLabelsBackgroundColor](self, "_updateLabelsBackgroundColor");
  }
}

- (void)_updateDetailLabel
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[PUFeedTextCell attributedDetailText](self, "attributedDetailText");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PUFeedTextCell _detailLabel](self, "_detailLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3990]);
      v3 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[PUFeedTextCell _labelBackgroundColor](self, "_labelBackgroundColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBackgroundColor:", v5);

      objc_msgSend(v3, "setNumberOfLines:", -[PUFeedTextCell numberOfDetailTextLines](self, "numberOfDetailTextLines"));
      objc_msgSend(v3, "setTextAlignment:", -[PUFeedTextCell textAlignment](self, "textAlignment"));
      -[PUFeedTextCell _setDetailLabel:](self, "_setDetailLabel:", v3);
    }
    objc_msgSend(v3, "setAttributedText:", v6);

  }
  else
  {
    -[PUFeedTextCell _setDetailLabel:](self, "_setDetailLabel:", 0);
  }
  -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateIconImageView
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[PUFeedTextCell iconImage](self, "iconImage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PUFeedTextCell _iconImageView](self, "_iconImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3890]);
      v3 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v5);

      -[PUFeedTextCell _setIconImageView:](self, "_setIconImageView:", v3);
    }
    objc_msgSend(v3, "setImage:", v6);

  }
  else
  {
    -[PUFeedTextCell _setIconImageView:](self, "_setIconImageView:", 0);
  }
  -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateButtonAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = -[PUFeedTextCell buttonType](self, "buttonType");
  -[PUFeedTextCell _button](self, "_button");
  v6 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v6;
  if (v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "titleLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedTextCell _labelBackgroundColor](self, "_labelBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v8);

      objc_msgSend(v9, "setContentHorizontalAlignment:", -[PUFeedTextCell buttonHorizontalAlignment](self, "buttonHorizontalAlignment"));
      objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__handleButton_, 64);
      -[PUFeedTextCell _setButton:](self, "_setButton:", v9);
    }
    -[PUFeedTextCell _configureButton:withType:size:animated:](self, "_configureButton:withType:size:animated:", v9, v5, -[PUFeedTextCell buttonSize](self, "buttonSize"), v3);
  }
  else
  {
    -[PUFeedTextCell _setButton:](self, "_setButton:", 0);
  }
  -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_setLabel:(id)a3
{
  UILabel *v5;
  UILabel *label;
  void *v7;
  UILabel *v8;

  v5 = (UILabel *)a3;
  label = self->__label;
  v8 = v5;
  if (label != v5)
  {
    -[UILabel removeFromSuperview](label, "removeFromSuperview");
    objc_storeStrong((id *)&self->__label, a3);
    -[PUFeedTextCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setDetailLabel:(id)a3
{
  UILabel *v5;
  UILabel *detailLabel;
  void *v7;
  UILabel *v8;

  v5 = (UILabel *)a3;
  detailLabel = self->__detailLabel;
  v8 = v5;
  if (detailLabel != v5)
  {
    -[UILabel removeFromSuperview](detailLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->__detailLabel, a3);
    -[PUFeedTextCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setIconImageView:(id)a3
{
  UIImageView *v5;
  UIImageView *iconImageView;
  void *v7;
  UIImageView *v8;

  v5 = (UIImageView *)a3;
  iconImageView = self->__iconImageView;
  v8 = v5;
  if (iconImageView != v5)
  {
    -[UIImageView removeFromSuperview](iconImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->__iconImageView, a3);
    -[PUFeedTextCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setButton:(id)a3
{
  UIButton *v5;
  UIButton *button;
  void *v7;
  UIButton *v8;

  v5 = (UIButton *)a3;
  button = self->__button;
  v8 = v5;
  if (button != v5)
  {
    -[UIButton removeFromSuperview](button, "removeFromSuperview");
    objc_storeStrong((id *)&self->__button, a3);
    -[PUFeedTextCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[PUFeedTextCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_handleButton:(id)a3
{
  id v4;

  -[PUFeedTextCell _delegate](self, "_delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didTapButtonInFeedTextCell:", self);

}

- (void)_invalidateCachedTextSizes
{
  uint64_t v2;
  __int128 v3;
  _OWORD *v4;
  _OWORD *v5;

  v2 = 0;
  v3 = *MEMORY[0x1E0C9D820];
  do
  {
    v4 = (_OWORD *)((char *)&cachedSizes + v2);
    v5 = (_OWORD *)((char *)&cachedMaximumPossibleSizes + v2);
    *v4 = v3;
    v4[1] = v3;
    *v5 = v3;
    v5[1] = v3;
    v2 += 32;
  }
  while (v2 != 352);
}

- (CGSize)_textSizeForButtonWithType:(int64_t)a3 size:(int64_t)a4
{
  double *v4;
  double v5;
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
  CGSize result;

  v4 = (double *)((char *)&cachedSizes + 32 * a3 + 16 * a4);
  v5 = *v4;
  if (*v4 == 0.0)
  {
    if (_textSizeForButtonWithType_size__onceToken != -1)
      dispatch_once(&_textSizeForButtonWithType_size__onceToken, &__block_literal_global_27913);
    -[PUFeedTextCell _configureButton:withType:size:animated:](self, "_configureButton:withType:size:animated:", _textSizeForButtonWithType_size__measuringButton, a3, a4, 0);
    objc_msgSend((id)_textSizeForButtonWithType_size__measuringButton, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v10 = v9;
    v12 = v11;
    objc_msgSend((id)_textSizeForButtonWithType_size__measuringButton, "contentEdgeInsets");
    v14 = v13;
    v5 = v10 - (v15 + v16);
    v18 = v12 - (v14 + v17);
    *v4 = v5;
    v4[1] = v18;
  }
  else
  {
    v18 = v4[1];
  }
  result.height = v18;
  result.width = v5;
  return result;
}

- (CGSize)_maximumPossibleTextSizeForButtonWithType:(int64_t)a3 size:(int64_t)a4
{
  double *v4;
  double v5;
  double v6;
  double v9;
  double v10;
  PUFeedTextCell *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  v4 = (double *)((char *)&cachedMaximumPossibleSizes + 32 * a3 + 16 * a4);
  v5 = *v4;
  v6 = v4[1];
  if (*v4 == 0.0)
  {
    switch(a3)
    {
      case 1:
      case 3:
        -[PUFeedTextCell _textSizeForButtonWithType:size:](self, "_textSizeForButtonWithType:size:", 1, a4);
        if (v5 < v9)
          v5 = v9;
        if (v6 < v10)
          v6 = v10;
        v11 = self;
        v12 = 3;
        goto LABEL_28;
      case 2:
      case 4:
        -[PUFeedTextCell _textSizeForButtonWithType:size:](self, "_textSizeForButtonWithType:size:", 2, a4);
        if (v5 < v13)
          v5 = v13;
        if (v6 < v14)
          v6 = v14;
        v11 = self;
        v12 = 4;
        goto LABEL_28;
      case 5:
      case 8:
        -[PUFeedTextCell _textSizeForButtonWithType:size:](self, "_textSizeForButtonWithType:size:", 5, a4);
        if (v5 < v15)
          v5 = v15;
        if (v6 < v16)
          v6 = v16;
        v11 = self;
        v12 = 8;
        goto LABEL_28;
      case 6:
      case 9:
        -[PUFeedTextCell _textSizeForButtonWithType:size:](self, "_textSizeForButtonWithType:size:", 6, a4);
        if (v5 < v17)
          v5 = v17;
        if (v6 < v18)
          v6 = v18;
        v11 = self;
        v12 = 9;
        goto LABEL_28;
      case 7:
      case 10:
        -[PUFeedTextCell _textSizeForButtonWithType:size:](self, "_textSizeForButtonWithType:size:", 7, a4);
        if (v5 < v19)
          v5 = v19;
        if (v6 < v20)
          v6 = v20;
        v11 = self;
        v12 = 10;
LABEL_28:
        -[PUFeedTextCell _textSizeForButtonWithType:size:](v11, "_textSizeForButtonWithType:size:", v12, a4);
        if (v5 < v21)
          v5 = v21;
        if (v6 < v22)
          v6 = v22;
        break;
      default:
        -[PUFeedTextCell _textSizeForButtonWithType:size:](self, "_textSizeForButtonWithType:size:");
        v5 = v25;
        v6 = v26;
        break;
    }
    *v4 = v5;
    v4[1] = v6;
  }
  v23 = v5;
  v24 = v6;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)_configureButton:(id)a3 withType:(int64_t)a4 size:(int64_t)a5 animated:(BOOL)a6
{
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  if ((unint64_t)(a4 - 1) > 9)
  {
    v9 = 0;
  }
  else
  {
    PXLocalizedString();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a5 == 1)
  {
    objc_msgSend(v10, "cloudFeedInteractionLargerTextAttributes");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a5)
  {
    objc_msgSend(v10, "cloudFeedInteractionTextAttributes");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = (void *)v12;
    goto LABEL_10;
  }
  v13 = 0;
LABEL_10:
  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v9)
    v15 = v9;
  else
    v15 = &stru_1E58AD278;
  v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v13);
  objc_msgSend(v19, "setAttributedTitle:forState:", v16, 0);
  objc_msgSend(v19, "setContentEdgeInsets:", 5.0, 5.0, 10.0, 5.0);
  if (!a6)
  {
    objc_msgSend(v19, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeAllAnimations");

  }
}

- (void)_updateLabelsBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PUFeedTextCell _labelBackgroundColor](self, "_labelBackgroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFeedTextCell _label](self, "_label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v7);

  -[PUFeedTextCell _detailLabel](self, "_detailLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v7);

  -[PUFeedTextCell _button](self, "_button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (id)_labelBackgroundColor
{
  void *v2;
  void *v3;

  if (-[PUFeedTextCell shouldUseOpaqueBackground](self, "shouldUseOpaqueBackground"))
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cloudFeedBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (CGSize)_iconSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[PUFeedTextCell iconImage](self, "iconImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5 == *MEMORY[0x1E0C9D820] && v7 == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v8 || !-[PUFeedTextCell shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout"))
    goto LABEL_15;
  v9 = -[PUFeedTextCell iconLocation](self, "iconLocation");
  if (v9 < 2)
  {
    -[PUFeedTextCell attributedText](self, "attributedText");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v11 = (void *)v10;
    goto LABEL_12;
  }
  if (v9 == 2)
  {
    -[PUFeedTextCell attributedDetailText](self, "attributedDetailText");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_scaledValueForValue:", 1.0);
    v5 = v5 * v13;
    v7 = v7 * v13;

  }
LABEL_15:
  v14 = v5;
  v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (int64_t)numberOfTextLines
{
  return self->_numberOfTextLines;
}

- (double)textDetailTextSpacing
{
  return self->_textDetailTextSpacing;
}

- (NSAttributedString)attributedDetailText
{
  return self->_attributedDetailText;
}

- (int64_t)numberOfDetailTextLines
{
  return self->_numberOfDetailTextLines;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (int64_t)iconLocation
{
  return self->_iconLocation;
}

- (UIEdgeInsets)iconPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_iconPadding.top;
  left = self->_iconPadding.left;
  bottom = self->_iconPadding.bottom;
  right = self->_iconPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIOffset)iconOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_iconOffset.horizontal;
  vertical = self->_iconOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setIconOffset:(UIOffset)a3
{
  self->_iconOffset = a3;
}

- (int64_t)tappableArea
{
  return self->_tappableArea;
}

- (void)setTappableArea:(int64_t)a3
{
  self->_tappableArea = a3;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (int64_t)buttonSize
{
  return self->_buttonSize;
}

- (int64_t)buttonHorizontalAlignment
{
  return self->_buttonHorizontalAlignment;
}

- (double)buttonPadding
{
  return self->_buttonPadding;
}

- (BOOL)shouldUseOpaqueBackground
{
  return self->_shouldUseOpaqueBackground;
}

- (UILabel)_label
{
  return self->__label;
}

- (UILabel)_detailLabel
{
  return self->__detailLabel;
}

- (UIImageView)_iconImageView
{
  return self->__iconImageView;
}

- (UIButton)_button
{
  return self->__button;
}

- (BOOL)shouldUseAccessibilityLayout
{
  return self->_shouldUseAccessibilityLayout;
}

- (void)setShouldUseAccessibilityLayout:(BOOL)a3
{
  self->_shouldUseAccessibilityLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__button, 0);
  objc_storeStrong((id *)&self->__iconImageView, 0);
  objc_storeStrong((id *)&self->__detailLabel, 0);
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_attributedDetailText, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

void __50__PUFeedTextCell__textSizeForButtonWithType_size___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_textSizeForButtonWithType_size__measuringButton;
  _textSizeForButtonWithType_size__measuringButton = v0;

}

@end

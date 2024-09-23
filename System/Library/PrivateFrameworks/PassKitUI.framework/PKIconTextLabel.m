@implementation PKIconTextLabel

- (PKIconTextLabel)init
{
  return -[PKIconTextLabel initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)initFrame:(CGRect)a3
{
  return -[PKIconTextLabel initWithText:icon:](self, "initWithText:icon:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKIconTextLabel)initWithText:(id)a3 icon:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  PKIconTextLabel *v10;
  PKIconTextLabel *v11;
  id v12;
  PKIconTextLabel *v13;

  v6 = a3;
  if (v6)
  {
    v7 = (objc_class *)MEMORY[0x1E0CB3498];
    v8 = a4;
    v9 = (void *)objc_msgSend([v7 alloc], "initWithString:", v6);
    v10 = -[PKIconTextLabel initWithAttributedText:icon:](self, "initWithAttributedText:icon:", v9, v8);

    v11 = v10;
  }
  else
  {
    v12 = a4;
    v13 = -[PKIconTextLabel initWithAttributedText:icon:](self, "initWithAttributedText:icon:", 0, v12);

    v11 = v13;
  }

  return v11;
}

- (PKIconTextLabel)initWithAttributedText:(id)a3 icon:(id)a4
{
  id v6;
  id v7;
  PKIconTextLabel *v8;
  PKIconTextLabel *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKIconTextLabel;
  v8 = -[PKIconTextLabel initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    -[PKIconTextLabel setText:](v8, "setText:", v6);
    -[PKIconTextLabel setIcon:](v9, "setIcon:", v7);
  }

  return v9;
}

- (void)setText:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_text, a3);
    -[PKIconTextLabel _updateView](self, "_updateView");
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_textColor, a3);
    -[PKIconTextLabel _updateView](self, "_updateView");
    v5 = v6;
  }

}

- (void)setTextFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_textFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_textFont, a3);
    -[PKIconTextLabel _updateView](self, "_updateView");
    v5 = v6;
  }

}

- (void)setIcon:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_icon != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    -[PKIconTextLabel _updateView](self, "_updateView");
    v5 = v6;
  }

}

- (void)setIconAlignment:(unint64_t)a3
{
  if (self->_iconAlignment != a3)
  {
    self->_iconAlignment = a3;
    -[PKIconTextLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)hasContent
{
  return -[NSAttributedString length](self->_text, "length") || self->_icon != 0;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKIconTextLabel;
  -[PKIconTextLabel layoutSubviews](&v3, sel_layoutSubviews);
  -[PKIconTextLabel bounds](self, "bounds");
  -[PKIconTextLabel _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKIconTextLabel _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  void (**v23)(_QWORD);
  void (**v24)(_QWORD);
  unint64_t iconAlignment;
  void (**v26)(_QWORD);
  double v27;
  double v28;
  double v29;
  _QWORD v30[11];
  int v31;
  _QWORD v32[8];
  int v33;
  int v34;
  _QWORD aBlock[9];
  int v36;
  int v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  double v53;
  _QWORD v54[8];
  _QWORD v55[4];
  __int128 v56;
  __int128 v57;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PKIconTextLabel _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v10 = 2;
  else
    v10 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x4010000000;
  v55[3] = &unk_19E0C78CE;
  v56 = 0u;
  v57 = 0u;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x4010000000;
  v54[3] = &unk_19E0C78CE;
  *(CGFloat *)&v54[4] = x;
  *(CGFloat *)&v54[5] = y;
  *(double *)&v54[6] = width;
  *(double *)&v54[7] = height;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", width, height);
  v12 = v11;
  v14 = v13;
  -[UIImageView sizeThatFits:](self->_iconView, "sizeThatFits:", width, height);
  v16 = v15;
  v18 = v17;
  v19 = fmax(v14, v17);
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x2020000000;
  v53 = v12 + v15;
  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x4010000000;
  v47 = &unk_19E0C78CE;
  v20 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v48 = *MEMORY[0x1E0C9D648];
  v49 = v20;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x4010000000;
  v41 = &unk_19E0C78CE;
  v42 = v48;
  v43 = v20;
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke;
  aBlock[3] = &unk_1E3E70A50;
  *(double *)&aBlock[6] = v12;
  *(double *)&aBlock[7] = v14;
  aBlock[4] = v54;
  aBlock[5] = &v44;
  *(double *)&aBlock[8] = v19;
  v36 = v10;
  v37 = v10;
  v22 = (void (**)(_QWORD))_Block_copy(aBlock);
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke_2;
  v32[3] = &unk_1E3E70A78;
  *(double *)&v32[6] = v16;
  *(double *)&v32[7] = v18;
  v32[4] = v54;
  v32[5] = &v38;
  v33 = v10;
  v34 = v10;
  v23 = (void (**)(_QWORD))_Block_copy(v32);
  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke_3;
  v30[3] = &unk_1E3E70AA0;
  *(double *)&v30[7] = v16;
  *(double *)&v30[8] = v18;
  *(double *)&v30[9] = v12;
  *(double *)&v30[10] = v14;
  v30[4] = v54;
  v30[5] = v55;
  v31 = v10;
  v30[6] = &v50;
  v24 = (void (**)(_QWORD))_Block_copy(v30);
  iconAlignment = self->_iconAlignment;
  if (iconAlignment)
  {
    if (iconAlignment != 1)
      goto LABEL_9;
    v22[2](v22);
    v24[2](v24);
    v26 = v23;
  }
  else
  {
    v23[2](v23);
    v24[2](v24);
    v26 = v22;
  }
  ((void (*)(void))v26[2])();
LABEL_9:
  if (!a4)
  {
    -[UILabel setFrame:](self->_textLabel, "setFrame:", v45[4], v45[5], v45[6], v45[7]);
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v39[4], v39[5], v39[6], v39[7]);
  }
  v27 = v51[3];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(v54, 8);
  _Block_object_dispose(v55, 8);
  v28 = v27;
  v29 = v19;
  result.height = v29;
  result.width = v28;
  return result;
}

uint64_t __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke(uint64_t result)
{
  double v1;
  uint64_t v2;
  CGRect *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGRect v9;

  v1 = *(double *)(result + 48);
  if (v1 > 0.0)
  {
    v2 = result;
    v3 = *(CGRect **)(*(_QWORD *)(result + 32) + 8);
    v9.origin.x = v3[1].origin.x;
    v9.origin.y = v3[1].origin.y;
    ++v3;
    v9.size.width = v3->size.width;
    v9.size.height = v3->size.height;
    CGRectDivide(v9, (CGRect *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32), v3, v1, *(CGRectEdge *)(result + 72));
    PKContentAlignmentMake();
    result = PKSizeAlignedInRect();
    v4 = *(_QWORD **)(*(_QWORD *)(v2 + 40) + 8);
    v4[4] = v5;
    v4[5] = v6;
    v4[6] = v7;
    v4[7] = v8;
  }
  return result;
}

uint64_t __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke_2(uint64_t result)
{
  double v1;
  uint64_t v2;
  CGRect *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGRect v9;

  v1 = *(double *)(result + 48);
  if (v1 > 0.0)
  {
    v2 = result;
    v3 = *(CGRect **)(*(_QWORD *)(result + 32) + 8);
    v9.origin.x = v3[1].origin.x;
    v9.origin.y = v3[1].origin.y;
    ++v3;
    v9.size.width = v3->size.width;
    v9.size.height = v3->size.height;
    CGRectDivide(v9, (CGRect *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32), v3, v1, *(CGRectEdge *)(result + 64));
    PKContentAlignmentMake();
    result = PKSizeAlignedInRect();
    v4 = *(_QWORD **)(*(_QWORD *)(v2 + 40) + 8);
    v4[4] = v5;
    v4[5] = v6;
    v4[6] = v7;
    v4[7] = v8;
  }
  return result;
}

void __54__PKIconTextLabel__layoutWithBounds_isTemplateLayout___block_invoke_3(uint64_t a1)
{
  CGRect *v2;
  CGRect v3;

  if (*(double *)(a1 + 56) > 0.0 && *(double *)(a1 + 72) > 0.0)
  {
    v2 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
    v3.origin.x = v2[1].origin.x;
    v3.origin.y = v2[1].origin.y;
    ++v2;
    v3.size.width = v2->size.width;
    v3.size.height = v2->size.height;
    CGRectDivide(v3, (CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), v2, 5.0, *(CGRectEdge *)(a1 + 88));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24)
                                                                + 5.0;
  }
}

- (void)_updateView
{
  NSAttributedString *text;
  UILabel *textLabel;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  UIImage *icon;
  UIImageView *iconView;
  UIImageView *v10;
  UIImageView *v11;
  UIImageView *v12;

  text = self->_text;
  textLabel = self->_textLabel;
  if (text)
  {
    if (!textLabel)
    {
      v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v6 = self->_textLabel;
      self->_textLabel = v5;

      -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
      -[PKIconTextLabel addSubview:](self, "addSubview:", self->_textLabel);
      textLabel = self->_textLabel;
    }
    -[UILabel setFont:](textLabel, "setFont:", self->_textFont);
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", self->_textColor);
    -[UILabel setAttributedText:](self->_textLabel, "setAttributedText:", self->_text);
  }
  else
  {
    -[UILabel removeFromSuperview](textLabel, "removeFromSuperview");
    v7 = self->_textLabel;
    self->_textLabel = 0;

  }
  icon = self->_icon;
  iconView = self->_iconView;
  if (icon)
  {
    if (!iconView)
    {
      v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v11 = self->_iconView;
      self->_iconView = v10;

      -[PKIconTextLabel addSubview:](self, "addSubview:", self->_iconView);
      iconView = self->_iconView;
      icon = self->_icon;
    }
    -[UIImageView setImage:](iconView, "setImage:", icon);
  }
  else
  {
    -[UIImageView removeFromSuperview](iconView, "removeFromSuperview");
    v12 = self->_iconView;
    self->_iconView = 0;

  }
  -[PKIconTextLabel setNeedsLayout](self, "setNeedsLayout");
}

- (NSAttributedString)text
{
  return self->_text;
}

- (UIFont)textFont
{
  return self->_textFont;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (unint64_t)iconAlignment
{
  return self->_iconAlignment;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_textFont, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end

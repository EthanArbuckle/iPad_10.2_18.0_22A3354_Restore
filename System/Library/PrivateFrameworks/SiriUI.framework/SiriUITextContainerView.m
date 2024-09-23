@implementation SiriUITextContainerView

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4 font:(id)a5 textContainerStyle:(id *)a6
{
  double height;
  double width;
  __int128 v11;
  id v12;
  double MaxY;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGFloat right;
  CGSize result;
  CGRect v24;

  height = a3.height;
  width = a3.width;
  v11 = *(_OWORD *)&a6->var2;
  v19 = *(_OWORD *)&a6->var0;
  v20 = v11;
  v21 = *(_OWORD *)&a6->var3.left;
  right = a6->var3.right;
  v12 = a5;
  objc_msgSend(a1, "_textBoundingRectWithSize:text:font:textContainerStyle:", a4, v12, &v19, width, height);
  MaxY = CGRectGetMaxY(v24);
  v14 = *(_OWORD *)&a6->var2;
  v19 = *(_OWORD *)&a6->var0;
  v20 = v14;
  v21 = *(_OWORD *)&a6->var3.left;
  right = a6->var3.right;
  objc_msgSend(a1, "_distanceFromBaselineToBottomWithFont:textContainerStyle:", v12, &v19);
  v16 = v15;

  v17 = MaxY + v16 + a6->var3.top + a6->var3.bottom;
  v18 = width;
  result.height = v17;
  result.width = v18;
  return result;
}

- (SiriUITextContainerView)initWithText:(id)a3 visualEffect:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SiriUITextContainerView *v12;
  uint64_t v13;
  SiriSharedUIContentLabel *label;
  SiriUIVisualEffectView *v15;
  UIView *containerView;
  uint64_t v17;
  UIView *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SiriUITextContainerView;
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v12 = -[SiriUITextContainerView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x24BDBF090], v9, v10, v11);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BEA6270], "label");
    v13 = objc_claimAutoreleasedReturnValue();
    label = v12->_label;
    v12->_label = (SiriSharedUIContentLabel *)v13;

    if (v7)
    {
      v15 = -[SiriUIVisualEffectView initWithEffect:]([SiriUIVisualEffectView alloc], "initWithEffect:", v7);
      -[SiriUIVisualEffectView setCustomView:](v15, "setCustomView:", v12->_label);
      containerView = v12->_containerView;
      v12->_containerView = &v15->super.super;

    }
    else
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v8, v9, v10, v11);
      v18 = v12->_containerView;
      v12->_containerView = (UIView *)v17;

      -[UIView addSubview:](v12->_containerView, "addSubview:", v12->_label);
    }
    -[SiriUITextContainerView addSubview:](v12, "addSubview:", v12->_containerView);
    -[SiriUITextContainerView setText:](v12, "setText:", v6);
  }

  return v12;
}

- (SiriUITextContainerView)initWithText:(id)a3
{
  return -[SiriUITextContainerView initWithText:visualEffect:](self, "initWithText:visualEffect:", a3, 0);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  SiriSharedUIContentLabel *label;
  void *v23;
  UIView *containerView;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v35.receiver = self;
  v35.super_class = (Class)SiriUITextContainerView;
  -[SiriUITextContainerView layoutSubviews](&v35, sel_layoutSubviews);
  -[SiriSharedUIContentLabel font](self->_label, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIContentLabel text](self->_label, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  -[SiriUITextContainerView textContainerStyle](self, "textContainerStyle");
  -[SiriUITextContainerView frame](self, "frame");
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  v9 = CGRectGetWidth(v36);
  UICeilToViewScale();
  v11 = v10;
  UICeilToViewScale();
  v26 = v9 - (v11 + v12);
  v13 = (void *)objc_opt_class();
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v14 = CGRectGetWidth(v37);
  v27 = v31;
  v28 = v32;
  v29 = v33;
  v30 = v34;
  objc_msgSend(v13, "_textBoundingRectWithSize:text:font:textContainerStyle:", v4, v3, &v27, v14, 1.79769313e308);
  v15 = CGRectGetHeight(v38);
  UICeilToViewScale();
  v17 = v16;
  v18 = *((double *)&v32 + 1);
  v19 = (void *)objc_opt_class();
  v27 = v31;
  v28 = v32;
  v29 = v33;
  v30 = v34;
  objc_msgSend(v19, "_distanceFromBaselineToBottomWithFont:textContainerStyle:", v3, &v27);
  v21 = v15 + v20;
  -[SiriSharedUIContentLabel setFrame:](self->_label, "setFrame:", v17, v18, v26, v15);
  label = self->_label;
  v23 = (void *)objc_opt_class();
  v27 = v31;
  v28 = v32;
  v29 = v33;
  v30 = v34;
  objc_msgSend(v23, "_distanceFromTopToBaselineWithFont:textContainerStyle:", v3, &v27);
  -[SiriSharedUIContentLabel _setFirstLineBaselineFrameOriginY:](label, "_setFirstLineBaselineFrameOriginY:");
  containerView = self->_containerView;
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  v25 = *((double *)&v32 + 1) + (CGRectGetHeight(v39) - *((double *)&v32 + 1) - *((double *)&v33 + 1) - v21) * 0.5;
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  -[UIView setFrame:](containerView, "setFrame:", 0.0, v25, CGRectGetWidth(v40), v21);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15[56];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_opt_class();
  -[SiriSharedUIContentLabel text](self->_label, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIContentLabel font](self->_label, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUITextContainerView textContainerStyle](self, "textContainerStyle");
  objc_msgSend(v6, "sizeThatFits:text:font:textContainerStyle:", v7, v8, v15, width, height);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)setText:(id)a3
{
  -[SiriSharedUIContentLabel setText:](self->_label, "setText:", a3);
  -[SiriUITextContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)text
{
  return (NSString *)-[SiriSharedUIContentLabel text](self->_label, "text");
}

- (void)setFont:(id)a3
{
  -[SiriSharedUIContentLabel setFont:](self->_label, "setFont:", a3);
  -[SiriUITextContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (UIFont)font
{
  return (UIFont *)-[SiriSharedUIContentLabel font](self->_label, "font");
}

- (void)setTextAlignment:(int64_t)a3
{
  if (-[SiriSharedUIContentLabel textAlignment](self->_label, "textAlignment") != a3)
    -[SiriSharedUIContentLabel setTextAlignment:](self->_label, "setTextAlignment:", a3);
}

- (int64_t)textAlignment
{
  return -[SiriSharedUIContentLabel textAlignment](self->_label, "textAlignment");
}

- (void)setTextColor:(id)a3
{
  -[SiriSharedUIContentLabel setTextColor:](self->_label, "setTextColor:", a3);
}

- (UIColor)textColor
{
  return (UIColor *)-[SiriSharedUIContentLabel textColor](self->_label, "textColor");
}

- (void)setTextContainerStyle:(id *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = *(_OWORD *)&a3->var2;
  v5 = *(_OWORD *)&a3->var3.left;
  v7 = *(_OWORD *)&a3->var0;
  self->_textContainerStyle.edgeInsets.right = a3->var3.right;
  *(_OWORD *)&self->_textContainerStyle.distanceFromBaselineToBottom = v6;
  *(_OWORD *)&self->_textContainerStyle.edgeInsets.left = v5;
  *(_OWORD *)&self->_textContainerStyle.numberOfLines = v7;
  -[SiriSharedUIContentLabel setNumberOfLines:](self->_label, "setNumberOfLines:", a3->var0);
  -[SiriSharedUIContentLabel setLineBreakMode:](self->_label, "setLineBreakMode:", 4 * (a3->var0 == 1));
  -[SiriUITextContainerView setNeedsLayout](self, "setNeedsLayout");
}

+ (CGRect)_textBoundingRectWithSize:(CGSize)a3 text:(id)a4 font:(id)a5 textContainerStyle:(id *)a6
{
  double width;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
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
  uint64_t v26;
  _QWORD v27[2];
  CGRect result;

  width = a3.width;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v26 = *MEMORY[0x24BDF65F8];
  v27[0] = a5;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6->var0 == 1)
    v13 = 2;
  else
    v13 = 3;
  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", v13, v12, 0, width - (a6->var3.left + a6->var3.right), 1.79769313e308);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (double)_distanceFromBaselineToBottomWithFont:(id)a3 textContainerStyle:(id *)a4
{
  double result;

  objc_msgSend(a3, "_scaledValueForValue:", a4->var2);
  UIRoundToViewScale();
  return result;
}

+ (double)_distanceFromTopToBaselineWithFont:(id)a3 textContainerStyle:(id *)a4
{
  double result;

  objc_msgSend(a3, "_scaledValueForValue:", a4->var1);
  UIRoundToViewScale();
  return result;
}

- ($131113AABFBD927EF350151908AA1243)textContainerStyle
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[7].var3.bottom;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var3.left = *(_OWORD *)&self[8].var2;
  retstr->var3.right = self[8].var3.left;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

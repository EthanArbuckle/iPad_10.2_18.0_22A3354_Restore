@implementation SiriUICardSnippetHeaderView

+ (double)defaultHeight
{
  return 24.0;
}

- (UIEdgeInsets)_edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  if (SiriUIIsCompactWidth())
    v2 = 16.0;
  else
    v2 = 0.0;
  if (SiriUIIsCompactWidth())
    v3 = 16.0;
  else
    v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = v2;
  result.right = v3;
  result.bottom = v5;
  result.left = v6;
  result.top = v4;
  return result;
}

- (void)configureWithTitle:(id)a3
{
  id v4;
  SiriSharedUIContentLabel *titleLabel;
  SiriSharedUIContentLabel *v6;
  SiriSharedUIContentLabel *v7;
  SiriSharedUIContentLabel *v8;
  void *v9;
  SiriSharedUIContentLabel *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    titleLabel = self->_titleLabel;
    v12 = v4;
    if (!titleLabel)
    {
      objc_msgSend(MEMORY[0x24BEA6270], "label");
      v6 = (SiriSharedUIContentLabel *)objc_claimAutoreleasedReturnValue();
      v7 = self->_titleLabel;
      self->_titleLabel = v6;

      v8 = self->_titleLabel;
      objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUIContentLabel setFont:](v8, "setFont:", v9);

      v10 = self->_titleLabel;
      objc_msgSend(MEMORY[0x24BDF6950], "siriui_blendEffectColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUIContentLabel setTextColor:](v10, "setTextColor:", v11);

      -[SiriUICardSnippetHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
      -[UIView siriui_setBlendEffectEnabled:](self, "siriui_setBlendEffectEnabled:", 1);
      titleLabel = self->_titleLabel;
    }
    -[SiriSharedUIContentLabel setText:](titleLabel, "setText:", v12);
    v4 = v12;
  }

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 24.0;
  result.height = v3;
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
  double v11;
  double v12;
  double v13;
  double v14;
  SiriSharedUIContentLabel *titleLabel;
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
  CGFloat v26;
  CGFloat v27;
  double v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)SiriUICardSnippetHeaderView;
  -[SiriUIReusableHeaderView layoutSubviews](&v29, sel_layoutSubviews);
  -[SiriUICardSnippetHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SiriUICardSnippetHeaderView _edgeInsets](self, "_edgeInsets");
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    v16 = v8 - (v12 + v14);
    v17 = v10 - (v11 + v13);
    v18 = v4 + v12;
    v19 = v6 + v11;
    v20 = SiriUIRectForLabelWithDistanceFromBottomToBaseline(titleLabel, v4 + v12, v6 + v11, v16, v17);
    v22 = v21;
    v24 = v23;
    if (SiriUIIsCompactWidth())
    {
      v25 = v16;
    }
    else
    {
      v27 = v22;
      v28 = v24;
      v25 = v16 - (16.0 + 16.0);
      if (SiriLanguageIsRTL())
      {
        v30.origin.x = v18;
        v30.origin.y = v19;
        v30.size.width = v16;
        v30.size.height = v17;
        v26 = CGRectGetWidth(v30) - 16.0;
        v31.origin.x = v20;
        v31.origin.y = v27;
        v31.size.width = v16 - (16.0 + 16.0);
        v31.size.height = v24;
        v20 = v26 - CGRectGetWidth(v31);
        v22 = v27;
      }
      else
      {
        v20 = 16.0;
      }
    }
    -[SiriSharedUIContentLabel setFrame:](self->_titleLabel, "setFrame:", v20, v22, v25, v24, *(_QWORD *)&v27, *(_QWORD *)&v28);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

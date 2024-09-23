@implementation VUIDebugCollectionHeaderView

- (VUIDebugCollectionHeaderView)initWithFrame:(CGRect)a3
{
  VUIDebugCollectionHeaderView *v3;
  VUITextLayout *v4;
  void *v5;
  VUITextLayout *titleLayout;
  VUITextLayout *v7;
  uint64_t v8;
  VUILabel *titleLabel;
  VUISeparatorView *v10;
  VUISeparatorView *separatorView;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VUIDebugCollectionHeaderView;
  v3 = -[VUIDebugCollectionHeaderView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v4, "setTextStyle:", 14);
    -[VUITextLayout setTextTransform:](v4, "setTextTransform:", 2);
    -[VUITextLayout setNumberOfLines:](v4, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v4, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v4, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setMaximumContentSizeCategory:](v4, "setMaximumContentSizeCategory:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v4, "setColor:", v5);

    titleLayout = v3->_titleLayout;
    v3->_titleLayout = v4;
    v7 = v4;

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v8;

    -[VUIDebugCollectionHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v10 = objc_alloc_init(VUISeparatorView);
    separatorView = v3->_separatorView;
    v3->_separatorView = v10;

    -[VUIDebugCollectionHeaderView addSubview:](v3, "addSubview:", v3->_separatorView);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIDebugCollectionHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v12);
  }
  return v3;
}

- (void)configureHeaderViewWithTitle:(id)a3
{
  id v3;

  v3 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", a3, self->_titleLayout, self->_titleLabel);
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double Height;
  VUISeparatorView *separatorView;
  CGFloat v22;
  CGFloat rect;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[VUIDebugCollectionHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v12 = v11;
  v14 = v13;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v15 = CGRectGetWidth(v24) - v12 - v14;
  rect = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v15, CGRectGetHeight(v25));
  v17 = v16;
  v19 = v18;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  Height = CGRectGetHeight(v26);
  v27.origin.x = v12;
  v27.origin.y = rect;
  v27.size.width = v17;
  v27.size.height = v19;
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v12, Height - CGRectGetHeight(v27) + -5.0, v17, v19);
  separatorView = self->_separatorView;
  -[VUIDebugCollectionHeaderView bounds](self, "bounds");
  v22 = CGRectGetHeight(v28) + -1.0;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  -[VUISeparatorView setFrame:](separatorView, "setFrame:", 0.0, v22, CGRectGetWidth(v29), 1.0);
}

- (VUITextLayout)titleLayout
{
  return self->_titleLayout;
}

- (void)setTitleLayout:(id)a3
{
  objc_storeStrong((id *)&self->_titleLayout, a3);
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleLayout, 0);
}

@end

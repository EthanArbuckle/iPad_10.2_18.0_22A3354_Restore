@implementation VUILibraryEpisodeFooterCell

- (VUILibraryEpisodeFooterCell)initWithFrame:(CGRect)a3
{
  VUILibraryEpisodeFooterCell *v3;
  VUISeparatorView *v4;
  VUISeparatorView *bottomSeparatorView;
  VUISeparatorView *v6;
  VUISeparatorView *topSeparatorView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUILibraryEpisodeFooterCell;
  v3 = -[VUILibraryEpisodeFooterCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUISeparatorView);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v4;

    -[VUILibraryEpisodeFooterCell addSubview:](v3, "addSubview:", v3->_bottomSeparatorView);
    v6 = objc_alloc_init(VUISeparatorView);
    topSeparatorView = v3->_topSeparatorView;
    v3->_topSeparatorView = v6;

    -[VUILibraryEpisodeFooterCell addSubview:](v3, "addSubview:", v3->_topSeparatorView);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryEpisodeFooterCell setBackgroundColor:](v3, "setBackgroundColor:", v8);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  VUISeparatorView *topSeparatorView;
  double v9;
  double v10;
  double v11;
  double v12;
  VUISeparatorView *bottomSeparatorView;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  VUISeparatorView *v23;
  VUIButton *titleButton;
  CGFloat v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v3 = (void *)MEMORY[0x1E0DC3F98];
  -[VUILibraryEpisodeFooterCell bounds](self, "bounds");
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v26));
  v5 = v4;
  v7 = v6;
  topSeparatorView = self->_topSeparatorView;
  -[VUILibraryEpisodeFooterCell bounds](self, "bounds");
  -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", CGRectGetWidth(v27) - (v5 + v7), 1.79769313e308);
  v10 = v9;
  v12 = v11;
  bottomSeparatorView = self->_bottomSeparatorView;
  -[VUILibraryEpisodeFooterCell bounds](self, "bounds");
  -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", CGRectGetWidth(v28) - (v5 + v7), 1.79769313e308);
  v15 = v14;
  v17 = v16;
  -[VUIButton textContentView](self->_titleButton, "textContentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryEpisodeFooterCell bounds](self, "bounds");
  objc_msgSend(v18, "sizeThatFits:", CGRectGetWidth(v29), 1.79769313e308);
  v20 = v19;
  v22 = v21;

  -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v5, 0.0, v10, v12);
  v23 = self->_bottomSeparatorView;
  -[VUILibraryEpisodeFooterCell bounds](self, "bounds");
  -[VUISeparatorView setFrame:](v23, "setFrame:", v5, CGRectGetMaxY(v30), v15, v17);
  titleButton = self->_titleButton;
  -[VUILibraryEpisodeFooterCell bounds](self, "bounds");
  v25 = CGRectGetMidX(v31) - v20 * 0.5;
  -[VUILibraryEpisodeFooterCell bounds](self, "bounds");
  -[VUIButton setFrame:](titleButton, "setFrame:", v25, CGRectGetMidY(v32) - v22 * 0.5, v20, v22);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  -[VUILibraryEpisodeFooterCell traitCollection](self, "traitCollection", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v4, 54.0);
  v6 = v5;

  v7 = v6 + 0.0;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)setTitle:(id)a3
{
  id v5;
  NSString **p_title;
  VUITextLayout *v7;
  void *v8;
  VUIButton *v9;
  void *v10;
  VUIButton *v11;
  VUIButton *titleButton;
  void *v13;
  VUIButton *v14;
  void *v15;
  VUIButton *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v5 = a3;
  p_title = &self->_title;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_title, a3);
    if (*p_title)
    {
      v7 = objc_alloc_init(VUITextLayout);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUITextLayout setColor:](v7, "setColor:", v8);

      -[VUITextLayout setTextStyle:](v7, "setTextStyle:", 13);
      -[VUITextLayout setMaximumContentSizeCategory:](v7, "setMaximumContentSizeCategory:", 12);
      v9 = [VUIButton alloc];
      -[VUILibraryEpisodeFooterCell traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[VUIButton initWithType:interfaceStyle:](v9, "initWithType:interfaceStyle:", 7, objc_msgSend(v10, "userInterfaceStyle"));
      titleButton = self->_titleButton;
      self->_titleButton = v11;

      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", *p_title, v7, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIButton setTextContentView:](self->_titleButton, "setTextContentView:", v13);
      v14 = self->_titleButton;
      -[VUITextLayout color](v7, "color");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIButton setTintColor:](v14, "setTintColor:", v15);

      objc_initWeak(&location, self);
      v16 = self->_titleButton;
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __40__VUILibraryEpisodeFooterCell_setTitle___block_invoke;
      v20 = &unk_1E9F990E0;
      objc_copyWeak(&v21, &location);
      -[VUIButton setSelectActionHandler:](v16, "setSelectActionHandler:", &v17);
      -[VUILibraryEpisodeFooterCell addSubview:](self, "addSubview:", self->_titleButton, v17, v18, v19, v20);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

    }
  }

}

void __40__VUILibraryEpisodeFooterCell_setTitle___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "titleButtonPressedForStoreId:", WeakRetained[82]);

}

- (NSString)title
{
  return self->_title;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_storeStrong((id *)&self->_storeID, a3);
}

- (VUILibraryEpisodeFooterCellDelegate)delegate
{
  return (VUILibraryEpisodeFooterCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void)setTopSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_topSeparatorView, a3);
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (void)setBottomSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, a3);
}

- (VUIButton)titleButton
{
  return self->_titleButton;
}

- (void)setTitleButton:(id)a3
{
  objc_storeStrong((id *)&self->_titleButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

@implementation VUILibraryBannerCollectionViewCell

- (VUILibraryBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  VUILibraryBannerCollectionViewCell *v3;
  VUITextLayout *v4;
  void *v5;
  uint64_t v6;
  VUILabel *titleLabel;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUILibraryBannerCollectionViewCell;
  v3 = -[VUILibraryBannerCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setFontSize:](v4, "setFontSize:", 13.0);
    -[VUITextLayout setFontWeight:](v4, "setFontWeight:", 7);
    -[VUITextLayout setAlignment:](v4, "setAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v4, "setColor:", v5);

    -[VUITextLayout setMargin:](v4, "setMargin:", 6.0, 0.0, 7.0, 0.0);
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v6;

    -[VUILibraryBannerCollectionViewCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_titleLabel);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryBannerCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v9);

    -[VUILibraryBannerCollectionViewCell setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding", a3.width, a3.height);
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - v5 - v6, 1.79769313e308);
  v8 = v7;
  -[VUILabel textLayout](self->_titleLabel, "textLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "margin");
  v11 = v8 + v10;

  -[VUILabel textLayout](self->_titleLabel, "textLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "margin");
  v14 = v11 + v13;

  v15 = width;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  VUILabel *titleLabel;
  void *v11;
  double v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)VUILibraryBannerCollectionViewCell;
  -[VUILibraryBannerCollectionViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[VUILibraryBannerCollectionViewCell bounds](self, "bounds");
  Width = CGRectGetWidth(v14);
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v5 = v4;
  v7 = Width - v4 - v6;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v7, 1.79769313e308);
  v9 = v8;
  titleLabel = self->_titleLabel;
  -[VUILabel textLayout](titleLabel, "textLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "margin");
  -[VUILabel setFrame:](titleLabel, "setFrame:", v5, v12, v7, v9);

}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

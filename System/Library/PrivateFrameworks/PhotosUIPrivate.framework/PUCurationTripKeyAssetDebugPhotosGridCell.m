@implementation PUCurationTripKeyAssetDebugPhotosGridCell

- (void)layoutSubviews
{
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  UILabel *subtitleLabel;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUCurationTripKeyAssetDebugPhotosGridCell;
  -[PUPhotosGridCell layoutSubviews](&v7, sel_layoutSubviews);
  if (!self->_titleLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    -[PUCurationTripKeyAssetDebugPhotosGridCell addSubview:](self, "addSubview:", self->_titleLabel);
  }
  -[PUCurationTripKeyAssetDebugPhotosGridCell setTitle:](self, "setTitle:", self->_title);
  if (!self->_subtitleLabel)
  {
    __66__PUCurationTripKeyAssetBrowserDebugPhotosGridCell_layoutSubviews__block_invoke();
    v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v5;

    -[PUCurationTripKeyAssetDebugPhotosGridCell addSubview:](self, "addSubview:", self->_subtitleLabel);
  }
  -[PUCurationTripKeyAssetDebugPhotosGridCell setSubtitle:](self, "setSubtitle:", self->_subtitle);
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGRect v17;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

  -[UILabel setText:](self->_titleLabel, "setText:", v4);
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[PUCurationTripKeyAssetDebugPhotosGridCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  v16 = CGRectGetMaxY(v17) + 2.0;
  -[UILabel bounds](self->_titleLabel, "bounds");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 2.0, v16, v13 + -4.0);
}

- (void)setSubtitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *subtitle;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGRect v17;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v5;

  -[UILabel setText:](self->_subtitleLabel, "setText:", v4);
  -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
  -[PUCurationTripKeyAssetDebugPhotosGridCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  v16 = CGRectGetMaxY(v17) + 18.0;
  -[UILabel bounds](self->_subtitleLabel, "bounds");
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 2.0, v16, v13 + -4.0);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

@implementation SKUIDownloadsCollectionViewCell

- (SKUIDownloadsCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIDownloadsCollectionViewCell *v8;
  SKUIDownloadsCellView *v9;
  SKUIDownloadsCellView *cellView;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDownloadsCollectionViewCell initWithFrame:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIDownloadsCollectionViewCell;
  v8 = -[SKUIDownloadsCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = objc_alloc_init(SKUIDownloadsCellView);
    cellView = v8->_cellView;
    v8->_cellView = v9;

    -[SKUIDownloadsCollectionViewCell contentView](v8, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v8->_cellView);

  }
  return v8;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[SKUIDownloadsCollectionViewCell isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)SKUIDownloadsCollectionViewCell;
  -[SKUIDownloadsCollectionViewCell setSelected:](&v6, sel_setSelected_, v3);
  if (v5 != v3)
  {
    if (self->_cellState)
      -[SKUIDownloadsCollectionViewCell _reloadEditState](self, "_reloadEditState");
  }
}

- (void)setCellState:(int64_t)a3
{
  if (self->_cellState != a3)
  {
    self->_cellState = a3;
    -[SKUIDownloadsCollectionViewCell _reloadEditState](self, "_reloadEditState");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIImageView *editIndicator;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  float v17;
  CGFloat v18;
  double MaxX;
  void *v20;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)SKUIDownloadsCollectionViewCell;
  -[SKUIDownloadsCollectionViewCell layoutSubviews](&v21, sel_layoutSubviews);
  -[SKUIDownloadsCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  editIndicator = self->_editIndicator;
  if (editIndicator)
  {
    -[UIImageView sizeToFit](editIndicator, "sizeToFit");
    -[UIImageView frame](self->_editIndicator, "frame");
    v14 = v13;
    v16 = v15;
    v17 = (v11 - v15) * 0.5;
    v18 = v7 + roundf(v17);
    -[UIImageView setFrame:](self->_editIndicator, "setFrame:", v5 + 15.0, v18);
    v22.origin.x = v5 + 15.0;
    v22.origin.y = v18;
    v22.size.width = v14;
    v22.size.height = v16;
    MaxX = CGRectGetMaxX(v22);
  }
  else
  {
    MaxX = v5;
  }
  -[SKUIDownloadsCollectionViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");

  -[SKUIDownloadsCellView setFrame:](self->_cellView, "setFrame:", MaxX, v7, v9 - (MaxX - v5), v11);
}

- (void)_reloadEditState
{
  int64_t cellState;
  UIImageView *editIndicator;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  cellState = self->_cellState;
  editIndicator = self->_editIndicator;
  if ((unint64_t)(cellState - 1) > 1)
  {
    -[UIImageView removeFromSuperview](editIndicator, "removeFromSuperview");
    v11 = self->_editIndicator;
    self->_editIndicator = 0;
  }
  else
  {
    if (!editIndicator)
    {
      v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v6 = self->_editIndicator;
      self->_editIndicator = v5;

      -[SKUIDownloadsCollectionViewCell addSubview:](self, "addSubview:", self->_editIndicator);
      cellState = self->_cellState;
    }
    if (cellState == 2)
    {
      v7 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("EditControl"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = -[SKUIDownloadsCollectionViewCell isSelected](self, "isSelected");
      v13 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 1) != 0)
      {
        objc_msgSend(v13, "imageNamed:inBundle:", CFSTR("EditControlSelected"), v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[SKUIDownloadsCollectionViewCell tintColor](self, "tintColor");
      }
      else
      {
        objc_msgSend(v13, "imageNamed:inBundle:", CFSTR("EditControl"), v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
      }
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v10;
    objc_msgSend(v9, "_flatImageWithColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_editIndicator, "setImage:", v11);
  }

  -[SKUIDownloadsCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)cellState
{
  return self->_cellState;
}

- (SKUIDownloadsCellView)cellView
{
  return self->_cellView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editIndicator, 0);
  objc_storeStrong((id *)&self->_cellView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDownloadsCollectionViewCell initWithFrame:]";
}

@end

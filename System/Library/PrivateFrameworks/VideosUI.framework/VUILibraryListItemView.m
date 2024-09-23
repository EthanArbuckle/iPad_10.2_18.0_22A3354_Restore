@implementation VUILibraryListItemView

- (void)setTitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *titleLabel;
  VUILabel *v7;

  v5 = (VUILabel *)a3;
  titleLabel = self->_titleLabel;
  if (titleLabel != v5)
  {
    v7 = v5;
    -[VUILabel removeFromSuperview](titleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleLabel, a3);
    if (self->_titleLabel)
      -[VUILibraryListItemView addSubview:](self, "addSubview:");
    -[VUILibraryListItemView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setItemImage:(id)a3
{
  UIImage *v5;
  UIImage **p_itemImage;
  UIImageView *v7;
  UIImageView *listImageView;
  UIImage *v9;

  v5 = (UIImage *)a3;
  p_itemImage = &self->_itemImage;
  if (self->_itemImage != v5)
  {
    v9 = v5;
    -[UIImageView removeFromSuperview](self->_listImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_itemImage, a3);
    if (*p_itemImage)
    {
      v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_itemImage);
      listImageView = self->_listImageView;
      self->_listImageView = v7;

      -[VUILibraryListItemView addSubview:](self, "addSubview:", self->_listImageView);
    }
    -[VUILibraryListItemView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)layoutSubviews
{
  double Width;
  CGRect v4;
  CGRect v5;

  -[VUILibraryListItemView bounds](self, "bounds");
  Width = CGRectGetWidth(v4);
  -[VUILibraryListItemView bounds](self, "bounds");
  -[VUILibraryListItemView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v5));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUILibraryListItemView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  UIImageView *listImageView;
  double MaxX;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a3.height;
  width = a3.width;
  -[VUILibraryListItemView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v8, 56.0);
  v10 = v9;

  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
  v12 = v11;
  v14 = v13;
  -[UIImageView sizeToFit](self->_listImageView, "sizeToFit");
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "userInterfaceIdiom") == 1)
  {
    -[UIImageView frame](self->_listImageView, "frame");
    width = v12 + CGRectGetWidth(v25) + 84.0;
  }
  if (!a4)
  {
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", 32.0, v10 * 0.5 - v14 * 0.5, v12, v14);
    listImageView = self->_listImageView;
    -[VUILibraryListItemView bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v26);
    -[UIImageView frame](self->_listImageView, "frame");
    v19 = MaxX - (CGRectGetWidth(v27) + 32.0);
    -[UIImageView frame](self->_listImageView, "frame");
    v20 = v10 * 0.5 - CGRectGetHeight(v28) * 0.5;
    -[UIImageView frame](self->_listImageView, "frame");
    v21 = CGRectGetWidth(v29);
    -[UIImageView frame](self->_listImageView, "frame");
    -[UIImageView setFrame:](listImageView, "setFrame:", v19, v20, v21, CGRectGetHeight(v30));
  }

  v22 = width;
  v23 = v10;
  result.height = v23;
  result.width = v22;
  return result;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImage)itemImage
{
  return self->_itemImage;
}

- (UIImageView)listImageView
{
  return self->_listImageView;
}

- (void)setListImageView:(id)a3
{
  objc_storeStrong((id *)&self->_listImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listImageView, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

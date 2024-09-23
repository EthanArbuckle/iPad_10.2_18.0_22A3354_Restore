@implementation REUIScaledFullColorImageView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  REUIScaledFullColorImageView *v7;
  uint64_t v8;
  UIImageView *imageView;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)REUIScaledFullColorImageView;
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = -[REUIScaledFullColorImageView initWithFrame:](&v14, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], v4, v5, v6);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v3, v4, v5, v6);
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v8;

    -[UIImageView setContentMode:](v7->_imageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v7->_imageView, "setClipsToBounds:", 1);
    -[UIImageView layer](v7->_imageView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShouldRasterize:", 1);

    -[UIImageView layer](v7->_imageView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    objc_msgSend(v11, "setRasterizationScale:");

    -[REUIScaledFullColorImageView addSubview:](v7, "addSubview:", v7->_imageView);
  }
  return v7;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a3, "metadata");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "objectForKeyedSubscript:", REUIScaledFullColorImageViewImageMetadataKey);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();
  -[REUIScaledFullColorImageView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) != 0)
    v7 = v8;
  else
    v7 = 0;
  objc_msgSend(v6, "setImage:", v7);

}

- (void)layoutSubviews
{
  CGFloat Width;
  CGFloat Height;
  void *v5;
  double MidX;
  double x;
  double y;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v17.receiver = self;
  v17.super_class = (Class)REUIScaledFullColorImageView;
  -[REUIScaledFullColorImageView layoutSubviews](&v17, sel_layoutSubviews);
  -[REUIScaledFullColorImageView bounds](self, "bounds");
  Width = CGRectGetWidth(v18);
  -[REUIScaledFullColorImageView bounds](self, "bounds");
  Height = CGRectGetHeight(v19);
  -[REUIScaledFullColorImageView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = Width;
  v20.size.height = Height;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = Width;
  v21.size.height = Height;
  objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(v21));

  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = Width;
  v22.size.height = Height;
  v23 = CGRectInset(v22, 1.5, 1.5);
  x = v23.origin.x;
  y = v23.origin.y;
  v9 = v23.size.width;
  v10 = v23.size.height;
  -[REUIScaledFullColorImageView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", x, y, v9, v10);

  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = v9;
  v24.size.height = v10;
  v12 = CGRectGetWidth(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = v9;
  v25.size.height = v10;
  v13 = CGRectGetHeight(v25);
  if (v12 >= v13)
    v14 = v13;
  else
    v14 = v12;
  -[REUIScaledFullColorImageView imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerRadius:", v14 * 0.5);

}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->filterProvider, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->filterProvider);
}

@end

@implementation PricePopoverBar

- (PricePopoverBar)initWithBackgroundImage:(id)a3
{
  id v5;
  PricePopoverBar *v6;
  uint64_t v7;
  UILabel *priceLabel;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  uint64_t v16;
  UILabel *percentChangeLabel;
  UILabel *v18;
  void *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  UIImageView *v25;
  UIImageView *priceChangeSignView;
  UIImageView *v27;
  UIImageView *percentChangeSignView;
  void *v29;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PricePopoverBar;
  v6 = -[PricePopoverBar init](&v31, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    priceLabel = v6->_priceLabel;
    v6->_priceLabel = (UILabel *)v7;

    v9 = v6->_priceLabel;
    +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontOfSize:", 22.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v11);

    v12 = v6->_priceLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = v6->_priceLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[PricePopoverBar addSubview:](v6, "addSubview:", v6->_priceLabel);
    v16 = objc_opt_new();
    percentChangeLabel = v6->_percentChangeLabel;
    v6->_percentChangeLabel = (UILabel *)v16;

    v18 = v6->_percentChangeLabel;
    +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fontOfSize:", 22.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v20);

    v21 = v6->_percentChangeLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    v23 = v6->_percentChangeLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[PricePopoverBar addSubview:](v6, "addSubview:", v6->_percentChangeLabel);
    v25 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    priceChangeSignView = v6->_priceChangeSignView;
    v6->_priceChangeSignView = v25;

    -[PricePopoverBar addSubview:](v6, "addSubview:", v6->_priceChangeSignView);
    v27 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    percentChangeSignView = v6->_percentChangeSignView;
    v6->_percentChangeSignView = v27;

    -[PricePopoverBar addSubview:](v6, "addSubview:", v6->_percentChangeSignView);
    objc_storeStrong((id *)&v6->_backgroundImage, a3);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PricePopoverBar setBackgroundColor:](v6, "setBackgroundColor:", v29);

  }
  return v6;
}

- (void)sizeToFit
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[UIImageView sizeToFit](self->_priceChangeSignView, "sizeToFit");
  -[UIImageView sizeToFit](self->_percentChangeSignView, "sizeToFit");
  -[UILabel text](self->_priceLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[UILabel sizeToFit](self->_priceLabel, "sizeToFit");
    -[UIImageView image](self->_priceChangeSignView, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UIImageView bounds](self->_priceChangeSignView, "bounds");
      v7 = v6 + 4.0;
    }
    else
    {
      v7 = 0.0;
    }

    -[UILabel bounds](self->_priceLabel, "bounds");
    v8 = v7 + v9 + 16.0;
    -[UILabel text](self->_percentChangeLabel, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      -[UILabel sizeToFit](self->_percentChangeLabel, "sizeToFit");
      -[UIImageView image](self->_percentChangeSignView, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[UIImageView bounds](self->_percentChangeSignView, "bounds");
        v14 = v13 + 4.0 + 15.0;
      }
      else
      {
        v14 = 15.0;
      }

      -[UILabel bounds](self->_percentChangeLabel, "bounds");
      v8 = v8 + v14 + v15 + 1.0;
    }
  }
  else
  {
    v8 = 0.0;
  }
  -[UIImage size](self->_backgroundImage, "size");
  if (v16 >= v8)
    v8 = v16;
  -[UIImage size](self->_backgroundImage, "size");
  -[PricePopoverBar setBounds:](self, "setBounds:", 0.0, 0.0, v8, v17);
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v13;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[PricePopoverBar bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIImage drawInRect:](self->_backgroundImage, "drawInRect:");
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceIn);
  -[UIColor set](self->_imageMaskColor, "set");
  v13.origin.x = v6;
  v13.origin.y = v8;
  v13.size.width = v10;
  v13.size.height = v12;
  CGContextFillRect(CurrentContext, v13);
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double MaxX;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  float v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  CGFloat rect;
  double v54;
  double v55;
  CGRect v56;
  CGRect v57;

  -[UILabel text](self->_priceLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[PricePopoverBar sizeToFit](self, "sizeToFit");
    -[PricePopoverBar bounds](self, "bounds");
    v6 = v5;
    +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "textAttachmentDirectionIsRightToLeft");

    -[UIImageView frame](self->_priceChangeSignView, "frame");
    v10 = v9;
    v12 = v11;
    v13 = RoundToPixel((v6 - v11) * 0.5);
    -[UILabel frame](self->_priceLabel, "frame");
    v16 = v14;
    v17 = v15;
    v18 = (v6 - v15) * 0.5;
    v19 = floorf(v18);
    v54 = v6;
    if (v8)
    {
      v20 = 8.0;
      v55 = 8.0;
      v21 = v19;
      v22 = v13;
      v23 = v10;
      v24 = CGRectGetMaxX(*(CGRect *)(&v14 - 2)) + 4.0;
      v25 = v22;
      v26 = v23;
      v27 = v12;
      v28 = v12;
      v29 = v24;
    }
    else
    {
      rect = v13;
      v23 = v10;
      -[UIImageView image](self->_priceChangeSignView, "image");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 8.0;
      if (v30)
      {
        v56.origin.x = 8.0;
        v56.origin.y = rect;
        v56.size.width = v23;
        v56.size.height = v12;
        v24 = CGRectGetMaxX(v56) + 4.0;
      }

      v25 = v19;
      v26 = v16;
      v27 = v17;
      v55 = v24;
      v22 = rect;
      v28 = v12;
      v29 = 8.0;
    }
    v31 = v24;
    MaxX = CGRectGetMaxX(*(CGRect *)(&v25 - 1));
    -[UILabel setFrame:](self->_priceLabel, "setFrame:", v55, v19, v16, v17);
    -[UIImageView setFrame:](self->_priceChangeSignView, "setFrame:", v29, v22, v23, v28);
    -[UILabel text](self->_percentChangeLabel, "text");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "length");

    if (v34)
    {
      -[UIImageView frame](self->_percentChangeSignView, "frame");
      v36 = v35;
      v38 = v37;
      v39 = RoundToPixel((v54 - v37) * 0.5);
      -[UILabel frame](self->_percentChangeLabel, "frame");
      v42 = v40;
      v43 = v41;
      v44 = (v54 - v41) * 0.5;
      v45 = floorf(v44);
      v46 = MaxX + 15.0;
      if (v8)
      {
        v47 = MaxX + 15.0;
        v48 = v45;
        v49 = CGRectGetMaxX(*(CGRect *)(&v40 - 2)) + 4.0;
      }
      else
      {
        v49 = MaxX + 15.0;
        v57.origin.x = v46;
        v57.origin.y = v39;
        v57.size.width = v36;
        v57.size.height = v38;
        v50 = CGRectGetMaxX(v57);
        -[UIImageView image](self->_percentChangeSignView, "image");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 4.0;
        if (!v51)
          v52 = 0.0;
        v46 = v50 + v52;

      }
      -[UIImageView setFrame:](self->_percentChangeSignView, "setFrame:", v49, v39, v36, v38);
      -[UILabel setFrame:](self->_percentChangeLabel, "setFrame:", v46, v45, v42, v43);
    }
  }
}

- (void)setPriceString:(id)a3
{
  -[UILabel setText:](self->_priceLabel, "setText:", a3);
  -[PricePopoverBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPercentChange:(id)a3
{
  -[UILabel setText:](self->_percentChangeLabel, "setText:", a3);
  -[PricePopoverBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)setImageMaskColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_imageMaskColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageMaskColor, a3);
    -[PricePopoverBar setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setChangeImage:(id)a3
{
  UIImageView *priceChangeSignView;
  id v5;

  priceChangeSignView = self->_priceChangeSignView;
  v5 = a3;
  -[UIImageView setImage:](priceChangeSignView, "setImage:", v5);
  -[UIImageView setImage:](self->_percentChangeSignView, "setImage:", v5);

  -[PricePopoverBar setNeedsLayout](self, "setNeedsLayout");
}

- (UIColor)imageMaskColor
{
  return self->_imageMaskColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageMaskColor, 0);
  objc_storeStrong((id *)&self->_percentChangeSignView, 0);
  objc_storeStrong((id *)&self->_priceChangeSignView, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_percentChangeLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
}

@end

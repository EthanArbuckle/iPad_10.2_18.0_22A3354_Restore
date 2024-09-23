@implementation PRXImageView

- (PRXImageView)initWithStyle:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  PRXImageView *v8;
  PRXImageView *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  PRXImageView *v17;
  objc_super v19;

  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  if (a3 == 1)
  {
    v7 = 60.0;
    v6 = 60.0;
  }
  v19.receiver = self;
  v19.super_class = (Class)PRXImageView;
  v8 = -[PRXImageView initWithFrame:](&v19, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    if (a3 == 1)
    {
      -[PRXImageView _setContinuousCornerRadius:](v8, "_setContinuousCornerRadius:", 12.0);
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "CGColor");
      -[PRXImageView layer](v9, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShadowColor:", v11);

      -[PRXImageView layer](v9, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 1045220557;
      objc_msgSend(v13, "setShadowOpacity:", v14);

      -[PRXImageView layer](v9, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setShadowRadius:", 10.0);

      -[PRXImageView layer](v9, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setShadowOffset:", 0.0, 8.0);

    }
    v17 = v9;
  }

  return v9;
}

+ (id)imageViewWithStyle:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:", a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  if (self->_style == 1)
  {
    v2 = 60.0;
    v3 = 60.0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PRXImageView;
    -[PRXImageView intrinsicContentSize](&v4, sel_intrinsicContentSize);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)style
{
  return self->_style;
}

@end

@implementation BKThumbnailScrubberCell

- (BKThumbnailScrubberCell)initWithFrame:(CGRect)a3
{
  BKThumbnailScrubberCell *v3;
  BKThumbnailScrubberCell *v4;
  id v5;
  double y;
  double width;
  double height;
  UIImageView *v9;
  UIImageView *imageView;
  UIImageView *v11;
  double v12;
  id v13;
  void *v14;
  CALayer *v15;
  CALayer *borderLayer;
  CALayer *v17;
  void *v18;
  double v19;
  CALayer *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)BKThumbnailScrubberCell;
  v3 = -[BKThumbnailScrubberCell initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BKThumbnailScrubberCell setOpaque:](v3, "setOpaque:", 0);
    v5 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = (UIImageView *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v4->_imageView;
    v4->_imageView = v9;

    v11 = v4->_imageView;
    *(_QWORD *)&v12 = objc_opt_class(v4).n128_u64[0];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "emptyBackgroundColor", v12));
    -[UIImageView setBackgroundColor:](v11, "setBackgroundColor:", v14);

    -[BKThumbnailScrubberCell insertSubview:atIndex:](v4, "insertSubview:atIndex:", v4->_imageView, 0);
    v15 = objc_opt_new(CALayer);
    borderLayer = v4->_borderLayer;
    v4->_borderLayer = v15;

    v17 = v4->_borderLayer;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v18, "scale");
    -[CALayer setBorderWidth:](v17, "setBorderWidth:", 1.0 / v19);

    -[CALayer setBorderColor:](v4->_borderLayer, "setBorderColor:", -[UIColor CGColor](v4->_strokeColor, "CGColor"));
    -[CALayer setFrame:](v4->_borderLayer, "setFrame:", CGRectZero.origin.x, y, width, height);
    v20 = v4->_borderLayer;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v21, CFSTR("bounds"), v22, CFSTR("position"), 0));
    -[CALayer setActions:](v20, "setActions:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberCell layer](v4, "layer"));
    objc_msgSend(v24, "addSublayer:", v4->_borderLayer);

  }
  return v4;
}

- (void)layoutSubviews
{
  CALayer *borderLayer;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailScrubberCell;
  -[BKThumbnailScrubberCell layoutSubviews](&v4, "layoutSubviews");
  borderLayer = self->_borderLayer;
  -[BKThumbnailScrubberCell bounds](self, "bounds");
  -[CALayer setFrame:](borderLayer, "setFrame:");
  -[BKThumbnailScrubberCell bounds](self, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
}

- (void)setStrokeColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_strokeColor != v5)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    -[CALayer setBorderColor:](self->_borderLayer, "setBorderColor:", -[UIColor CGColor](objc_retainAutorelease(v5), "CGColor"));
  }

}

+ (id)emptyBackgroundColor
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_20F5E8;
  if (!qword_20F5E8)
  {
    v3 = objc_msgSend(objc_alloc((Class)UIColor), "initWithWhite:alpha:", 1.0, 0.5);
    v4 = (void *)qword_20F5E8;
    qword_20F5E8 = (uint64_t)v3;

    v2 = (void *)qword_20F5E8;
  }
  return v2;
}

- (id)imageView
{
  UIImageView *imageView;
  UIImageView *v4;
  UIImageView *v5;
  UIImageView *v6;
  double v7;
  id v8;
  void *v9;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_imageView;
    self->_imageView = v4;

    v6 = self->_imageView;
    *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emptyBackgroundColor", v7));
    -[UIImageView setBackgroundColor:](v6, "setBackgroundColor:", v9);

    -[BKThumbnailScrubberCell insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_imageView, 0);
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberCell imageView](self, "imageView"));
  objc_msgSend(v5, "setImage:", v4);

  -[BKThumbnailScrubberCell setNeedsLayout](self, "setNeedsLayout");
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end

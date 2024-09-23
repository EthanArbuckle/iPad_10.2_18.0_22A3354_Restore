@implementation BKPictureBookView

- (BKPictureBookView)initWithFrame:(CGRect)a3
{
  BKPictureBookView *v3;
  BKPictureBookView *v4;
  UIView *v5;
  UIView *contentView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookView;
  v3 = -[BKPictureBookView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BKPictureBookView setScale:](v3, "setScale:", 1.0);
    v5 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    contentView = v4->_contentView;
    v4->_contentView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIView setBackgroundColor:](v4->_contentView, "setBackgroundColor:", v7);

    -[UIView setOpaque:](v4->_contentView, "setOpaque:", 1);
    -[UIView setClipsToBounds:](v4->_contentView, "setClipsToBounds:", 1);
    -[BKPictureBookView addSubview:](v4, "addSubview:", v4->_contentView);
  }
  return v4;
}

- (void)calculateFramesAtScale:(double)a3 contentFrame:(CGRect *)a4 leftContentFrame:(CGRect *)a5 rightContentFrame:(CGRect *)a6
{
  double v11;
  CGFloat v12;
  double v13;
  double x;
  double y;
  double width;
  double height;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  -[BKPictureBookView actualSize](self, "actualSize");
  v12 = v11 * a3;
  -[BKPictureBookView actualSize](self, "actualSize");
  v46.size.height = v13 * a3;
  v46.origin.x = 0.0;
  v46.origin.y = 0.0;
  v46.size.width = v12;
  v47 = CGRectIntegral(v46);
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  -[BKPictureBookView idealSinglePageSize](self, "idealSinglePageSize");
  v20 = CGSizeZero.width == v19 && CGSizeZero.height == v18;
  v21 = height;
  v22 = width;
  v23 = y;
  v24 = x;
  if (!v20)
  {
    -[BKPictureBookView idealSinglePageSize](self, "idealSinglePageSize");
    v22 = v25 + v25;
    -[BKPictureBookView idealSinglePageSize](self, "idealSinglePageSize");
    v21 = v26;
    v23 = 0.0;
    v24 = 0.0;
  }
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v27 = v22;
  v28 = CGRectContainsRect(v48, *(CGRect *)&v24);
  v29 = height;
  v30 = width;
  v31 = y;
  v32 = x;
  if (v28)
  {
    v33 = -[BKPictureBookView bounds](self, "bounds", x, y, width, height);
    v32 = CGRectCenterRectInRect(v33, x, y, width, height, v34, v35, v36, v37);
  }
  v42 = v31;
  v43 = v30;
  v44 = v29;
  v45 = v32;
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width * 0.5;
  v49.size.height = height;
  v50 = CGRectIntegral(v49);
  v38 = v50.origin.x;
  v39 = v50.origin.y;
  v40 = v50.size.width;
  v41 = v50.size.height;
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  v51.origin.x = CGRectGetMidX(v50);
  v51.origin.y = y;
  v51.size.width = width * 0.5;
  v51.size.height = height;
  v52 = CGRectIntegral(v51);
  a4->origin.x = v45;
  a4->origin.y = v42;
  a4->size.width = v43;
  a4->size.height = v44;
  a5->origin.x = v38;
  a5->origin.y = v39;
  a5->size.width = v40;
  a5->size.height = v41;
  *a6 = v52;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  CGSize size;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double MinY;
  CGPoint v13;
  CGSize v14;
  CGPoint origin;
  CGSize v16;
  CGRect v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BKPictureBookView;
  -[BKPictureBookView layoutSubviews](&v18, "layoutSubviews");
  -[BKPictureBookView scale](self, "scale");
  v4 = v3;
  size = CGRectZero.size;
  v17.origin = CGRectZero.origin;
  v17.size = size;
  origin = v17.origin;
  v16 = size;
  v13 = v17.origin;
  v14 = size;
  -[BKPictureBookView calculateFramesAtScale:contentFrame:leftContentFrame:rightContentFrame:](self, "calculateFramesAtScale:contentFrame:leftContentFrame:rightContentFrame:", &v17, &origin, &v13, v3);
  -[UIView setFrame:](self->_contentView, "setFrame:", *(_OWORD *)&v17.origin, *(_OWORD *)&v17.size);
  -[UIView setFrame:](self->_leftContentView, "setFrame:", origin, v16);
  -[UIView setFrame:](self->_rightContentView, "setFrame:", v13, v14);
  if (-[BKPictureBookView drawsSpine](self, "drawsSpine"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView gutter](self, "gutter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "image"));
    objc_msgSend(v7, "size");
    v9 = v8;

    v10 = v4 * v9;
    v11 = CGRectGetMidX(v17) + v10 * -0.5;
    MinY = CGRectGetMinY(v17);
    objc_msgSend(v6, "setFrame:", v11, MinY, v10, CGRectGetHeight(v17));

  }
  -[BKPictureBookView _updateShadowPath](self, "_updateShadowPath");
}

- (void)setContentSize:(CGSize)a3
{
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    -[BKPictureBookView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)actualSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = (void *)objc_opt_class(self);
  -[BKPictureBookView contentSize](self, "contentSize");
  objc_msgSend(v3, "actualSizeForContentSize:drawsSpine:", -[BKPictureBookView drawsSpine](self, "drawsSpine"), v4, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

+ (CGSize)actualSizeForContentSize:(CGSize)result drawsSpine:(BOOL)a4
{
  double v4;

  v4 = result.width + result.width;
  result.width = v4;
  return result;
}

- (void)setLeftContentView:(id)a3
{
  UIView *v5;
  UIView **p_leftContentView;
  UIView *leftContentView;
  BKPictureBookView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_leftContentView = &self->_leftContentView;
  leftContentView = self->_leftContentView;
  if (leftContentView != v5)
  {
    v9 = v5;
    v8 = (BKPictureBookView *)objc_claimAutoreleasedReturnValue(-[UIView superview](leftContentView, "superview"));

    if (!v9 || v8 == self)
    {
      -[UIView removeFromSuperview](*p_leftContentView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_leftContentView, a3);
      if (!v9)
      {
LABEL_7:
        -[BKPictureBookView setNeedsLayout](self, "setNeedsLayout");
        v5 = v9;
        goto LABEL_8;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_leftContentView, a3);
    }
    -[UIView addSubview:](self->_contentView, "addSubview:", *p_leftContentView);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setRightContentView:(id)a3
{
  UIView *v5;
  UIView **p_rightContentView;
  UIView *rightContentView;
  BKPictureBookView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_rightContentView = &self->_rightContentView;
  rightContentView = self->_rightContentView;
  if (rightContentView != v5)
  {
    v9 = v5;
    v8 = (BKPictureBookView *)objc_claimAutoreleasedReturnValue(-[UIView superview](rightContentView, "superview"));

    if (!v9 || v8 == self)
    {
      -[UIView removeFromSuperview](*p_rightContentView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_rightContentView, a3);
      if (!v9)
      {
LABEL_7:
        -[BKPictureBookView setNeedsLayout](self, "setNeedsLayout");
        v5 = v9;
        goto LABEL_8;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_rightContentView, a3);
    }
    -[UIView addSubview:](self->_contentView, "addSubview:", *p_rightContentView);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_updateShadowPath
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  double height;
  void *v20;
  void *v21;
  double v22;
  id v23;

  if (-[BKPictureBookView drawsShadow](self, "drawsShadow"))
  {
    -[UIView frame](self->_contentView, "frame");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:")));
    v4 = objc_msgSend(v3, "CGPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView layer](self, "layer"));
    objc_msgSend(v5, "setShadowPath:", v4);

    -[BKPictureBookView scale](self, "scale");
    v7 = v6 * 2.8;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView layer](self, "layer"));
    objc_msgSend(v8, "setShadowOffset:", 0.0, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView layer](self, "layer"));
    LODWORD(v10) = 1051931443;
    objc_msgSend(v9, "setShadowOpacity:", v10);

    -[BKPictureBookView scale](self, "scale");
    v12 = v11 * 8.5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView layer](self, "layer"));
    v23 = v13;
    v14 = v12;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView layer](self, "layer"));
    objc_msgSend(v15, "shadowOpacity");
    v17 = v16;

    if (v17 <= 0.0)
      return;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView layer](self, "layer"));
    objc_msgSend(v18, "setShadowPath:", 0);

    height = CGSizeZero.height;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView layer](self, "layer"));
    objc_msgSend(v20, "setShadowOffset:", CGSizeZero.width, height);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView layer](self, "layer"));
    LODWORD(v22) = 0;
    objc_msgSend(v21, "setShadowOpacity:", v22);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView layer](self, "layer"));
    v14 = 0.0;
    v23 = v13;
  }
  objc_msgSend(v13, "setShadowRadius:", v14);

}

- (void)setDrawsSpine:(BOOL)a3
{
  UIImageView *gutter;
  void *v5;

  if (self->_drawsSpine != a3)
  {
    self->_drawsSpine = a3;
    if (a3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView gutter](self, "gutter"));
      -[BKPictureBookView addSubview:](self, "addSubview:", v5);

    }
    else
    {
      -[UIImageView removeFromSuperview](self->_gutter, "removeFromSuperview");
      gutter = self->_gutter;
      self->_gutter = 0;

    }
  }
}

- (id)gutter
{
  UIImageView *gutter;
  id v4;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;

  gutter = self->_gutter;
  if (!gutter)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("PictureBookSpine")));
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
    v7 = self->_gutter;
    self->_gutter = v6;

    gutter = self->_gutter;
  }
  return gutter;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)idealSinglePageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_idealSinglePageSize.width;
  height = self->_idealSinglePageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIdealSinglePageSize:(CGSize)a3
{
  self->_idealSinglePageSize = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)leftContentView
{
  return self->_leftContentView;
}

- (UIView)rightContentView
{
  return self->_rightContentView;
}

- (BOOL)drawsShadow
{
  return self->_drawsShadow;
}

- (void)setDrawsShadow:(BOOL)a3
{
  self->_drawsShadow = a3;
}

- (BOOL)drawsSpine
{
  return self->_drawsSpine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gutter, 0);
  objc_storeStrong((id *)&self->_rightContentView, 0);
  objc_storeStrong((id *)&self->_leftContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

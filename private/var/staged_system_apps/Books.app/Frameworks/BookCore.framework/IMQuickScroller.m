@implementation IMQuickScroller

+ (id)backgroundForSize:(CGSize)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("quickScroll-track.png"), a3.width, a3.height));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stretchableImageWithLeftCapWidth:topCapHeight:", 0, 13));

  return v4;
}

+ (id)foregroundForSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  double v24;
  UIImage *ImageFromCurrentImageContext;
  CGSize v27;

  height = a3.height;
  width = a3.width;
  if (!qword_311248)
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)qword_311248;
    qword_311248 = (uint64_t)v5;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, height));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_311248, "objectForKey:", v7));
  if (!v8)
  {
    if (width == CGSizeZero.width && height == CGSizeZero.height)
    {
      v8 = 0;
    }
    else
    {
      v10 = 0.0;
      v27.width = width;
      v27.height = height;
      UIGraphicsBeginImageContextWithOptions(v27, 0, 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("quickScroll-dot-large.png")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("quickScroll-dot-small.png")));
      objc_msgSend(v11, "size");
      v14 = v13;
      v16 = v15;
      objc_msgSend(v12, "size");
      v18 = v17;
      v20 = v19;
      objc_msgSend(v11, "drawInRect:", 14.0, 15.0, v14, v16);
      objc_msgSend(v11, "drawInRect:", 14.0, height + -15.0 - v16, v14, v16);
      v21 = v16 + 15.0 + 12.0;
      v22 = height + v21 * -2.0;
      v23 = vcvtpd_s64_f64(v22 / (v20 + 12.0));
      if (v23 >= 1)
      {
        v24 = v21 + round((v22 - (double)v23 * v20 - (double)(v23 - 1) * 12.0) * 0.5);
        do
        {
          objc_msgSend(v12, "drawInRect:", 15.0, v24 + v10 * (v20 + 12.0), v18, v20);
          v10 = v10 + 1.0;
          --v23;
        }
        while (v23);
      }
      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v8 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      if (v8)
        objc_msgSend((id)qword_311248, "setObject:forKey:", v8, v7);

    }
  }

  return v8;
}

- (IMQuickScroller)initWithFrame:(CGRect)a3
{
  IMQuickScroller *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  UIImageView *v8;
  UIImageView *background;
  UIImageView *v10;
  UIImageView *foreground;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMQuickScroller;
  v3 = -[IMQuickScroller initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[IMQuickScroller setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[IMQuickScroller setOpaque:](v3, "setOpaque:", 0);
    -[IMQuickScroller setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    v5 = objc_alloc((Class)UIImageView);
    v6 = objc_msgSend((id)objc_opt_class(v3), "backgroundForSize:", CGSizeZero.width, CGSizeZero.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (UIImageView *)objc_msgSend(v5, "initWithImage:", v7);
    background = v3->_background;
    v3->_background = v8;

    -[UIImageView setHidden:](v3->_background, "setHidden:", 1);
    -[IMQuickScroller bounds](v3, "bounds");
    -[UIImageView setFrame:](v3->_background, "setFrame:");
    -[UIImageView setContentMode:](v3->_background, "setContentMode:", 0);
    -[UIImageView setAutoresizingMask:](v3->_background, "setAutoresizingMask:", 18);
    -[IMQuickScroller addSubview:](v3, "addSubview:", v3->_background);
    v10 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    foreground = v3->_foreground;
    v3->_foreground = v10;

    -[IMQuickScroller bounds](v3, "bounds");
    -[UIImageView setFrame:](v3->_foreground, "setFrame:");
    -[UIImageView setHidden:](v3->_foreground, "setHidden:", 0);
    -[UIImageView setContentMode:](v3->_foreground, "setContentMode:", 4);
    -[UIImageView setAutoresizingMask:](v3->_foreground, "setAutoresizingMask:", 18);
    -[IMQuickScroller addSubview:](v3, "addSubview:", v3->_foreground);
  }
  return v3;
}

- (void)updateValueForTouch:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4 + -20.0;
  -[IMQuickScroller frame](self, "frame");
  v7 = v5 / (v6 + -40.0);
  *(float *)&v7 = v7;
  *(float *)&v7 = fminf(fmaxf(*(float *)&v7, 0.0), 1.0);
  -[IMQuickScroller setValue:](self, "setValue:", v7);
  -[IMQuickScroller sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  UIImageView *background;
  id v6;

  background = self->_background;
  v6 = a3;
  -[UIImageView setHidden:](background, "setHidden:", 0);
  -[IMQuickScroller updateValueForTouch:](self, "updateValueForTouch:", v6);

  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[IMQuickScroller updateValueForTouch:](self, "updateValueForTouch:", a3, a4);
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v4;

  LODWORD(v4) = -1.0;
  -[IMQuickScroller setValue:](self, "setValue:", a3, a4, v4);
  -[UIImageView setHidden:](self->_background, "setHidden:", 1);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  double v3;

  LODWORD(v3) = -1.0;
  -[IMQuickScroller setValue:](self, "setValue:", a3, v3);
  -[UIImageView setHidden:](self->_background, "setHidden:", 1);
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)IMQuickScroller;
  -[IMQuickScroller layoutSubviews](&v9, "layoutSubviews");
  -[IMQuickScroller bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  -[UIImageView setFrame:](self->_background, "setFrame:", 5.0, 6.0, 23.0, CGRectGetHeight(v10) + -12.0);
  v7 = objc_msgSend((id)objc_opt_class(self), "foregroundForSize:", width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[UIImageView setImage:](self->_foreground, "setImage:", v8);

  -[UIImageView setFrame:](self->_foreground, "setFrame:", x, y, width, height);
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreground, 0);
  objc_storeStrong((id *)&self->_background, 0);
}

@end

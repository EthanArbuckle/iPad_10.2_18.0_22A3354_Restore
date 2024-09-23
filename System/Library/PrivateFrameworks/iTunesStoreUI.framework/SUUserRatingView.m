@implementation SUUserRatingView

- (SUUserRatingView)init
{
  return -[SUUserRatingView initWithStyle:](self, "initWithStyle:", 0);
}

- (SUUserRatingView)initWithForeground:(id)a3 background:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  SUUserRatingView *v11;
  UIImageView *v12;
  UIImageView *v13;
  UIImageView *foregroundImageView;

  if (a4)
  {
    objc_msgSend(a4, "size");
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v8 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v11 = -[SUUserRatingView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v8, v10);
  if (v11)
  {
    v12 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", a4);
    v11->_backgroundImageView = v12;
    -[SUUserRatingView bounds](v11, "bounds");
    -[UIImageView setFrame:](v12, "setFrame:");
    -[SUUserRatingView addSubview:](v11, "addSubview:", v11->_backgroundImageView);

    v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", a3);
    v11->_foregroundImageView = v13;
    -[UIImageView setContentsPosition:](v13, "setContentsPosition:", 3);
    -[UIImageView setClipsToBounds:](v11->_foregroundImageView, "setClipsToBounds:", 1);
    foregroundImageView = v11->_foregroundImageView;
    -[SUUserRatingView _foregroundImageClipBounds](v11, "_foregroundImageClipBounds");
    -[UIImageView setFrame:](foregroundImageView, "setFrame:");
    -[SUUserRatingView addSubview:](v11, "addSubview:", v11->_foregroundImageView);

  }
  return v11;
}

- (SUUserRatingView)initWithStyle:(int64_t)a3
{
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (a3 == 1)
  {
    v6 = CFSTR("UserRatingBorderedStarsForeground.png");
    v7 = CFSTR("UserRatingBorderedStarsBackground.png");
  }
  else
  {
    if (a3)
    {
      v9 = 0;
      v8 = 0;
      return -[SUUserRatingView initWithForeground:background:](self, "initWithForeground:background:", v9, v8);
    }
    v6 = CFSTR("UserRatingPlainWhiteStarsForeground.png");
    v7 = CFSTR("UserRatingPlainWhiteStarsBackground.png");
  }
  v8 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v7, v5);
  v9 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v6, v5);
  return -[SUUserRatingView initWithForeground:background:](self, "initWithForeground:background:", v9, v8);
}

+ (id)copyImageForRating:(float)a3 backgroundColor:(id)a4 style:(int64_t)a5
{
  void *v7;
  _BOOL8 v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  char v14;
  double v15;
  CGFloat v16;
  UIImage *v17;
  CGSize v19;

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStyle:", a5);
  objc_msgSend(v7, "setBackgroundColor:", a4);
  if (a4)
    v8 = objc_msgSend(MEMORY[0x24BDF6950], "clearColor") != (_QWORD)a4;
  else
    v8 = 0;
  objc_msgSend(v7, "setOpaque:", v8);
  *(float *)&v9 = a3;
  objc_msgSend(v7, "setValue:", v9);
  objc_msgSend(v7, "bounds");
  v11 = v10;
  v13 = v12;
  v14 = objc_msgSend(v7, "isOpaque");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  v16 = v15;
  v19.width = v11;
  v19.height = v13;
  UIGraphicsBeginImageContextWithOptions(v19, v14, v16);
  objc_msgSend((id)objc_msgSend(v7, "layer"), "renderInContext:", UIGraphicsGetCurrentContext());
  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

+ (double)reflectionHeight
{
  return 10.0;
}

- (float)heightWithoutReflection
{
  double v2;
  double v3;
  double v4;

  -[SUUserRatingView frame](self, "frame");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "reflectionHeight");
  return v3 - v4;
}

- (void)setValue:(float)a3
{
  float v3;

  if (a3 > 1.0)
    a3 = 1.0;
  v3 = fmaxf(a3, 0.0);
  if (self->_value != v3)
  {
    self->_value = rintf(v3 * 10.0) / 10.0;
    -[SUUserRatingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  UIImageView *foregroundImageView;

  foregroundImageView = self->_foregroundImageView;
  -[SUUserRatingView _foregroundImageClipBounds](self, "_foregroundImageClipBounds");
  -[UIImageView setFrame:](foregroundImageView, "setFrame:");
}

- (CGRect)_foregroundImageClipBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SUUserRatingView bounds](self, "bounds");
  v7 = v6 * self->_value;
  result.size.height = v5;
  result.size.width = v7;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end

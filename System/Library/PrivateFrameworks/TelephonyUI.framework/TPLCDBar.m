@implementation TPLCDBar

+ (double)defaultHeight
{
  double result;

  objc_msgSend(a1, "defaultHeightForOrientation:", 1);
  return result;
}

+ (double)defaultHeightForOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  result = 100.0;
  if ((unint64_t)(a3 - 1) < 2)
    result = 108.0;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 94.0;
  return result;
}

- (TPLCDBar)initWithDefaultSizeForOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TPLCDBar *v11;
  TPLCDBar *v12;
  void *v13;
  objc_super v15;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  if ((unint64_t)(a3 - 1) >= 2)
    v7 = v9;
  objc_msgSend((id)objc_opt_class(), "defaultHeightForOrientation:", a3);
  v15.receiver = self;
  v15.super_class = (Class)TPLCDBar;
  v11 = -[TPLCDBar initWithFrame:](&v15, sel_initWithFrame_, 0.0, 0.0, v7, v10);
  v12 = v11;
  if (v11)
  {
    -[TPLCDBar setAutoresizingMask:](v11, "setAutoresizingMask:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPLCDBar setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[TPLCDBar setOpaque:](v12, "setOpaque:", 0);
  }
  return v12;
}

- (TPLCDBar)initWithDefaultSize
{
  return -[TPLCDBar initWithDefaultSizeForOrientation:](self, "initWithDefaultSizeForOrientation:", 1);
}

- (TPLCDBar)initWithFrame:(CGRect)a3
{
  double y;
  double x;
  TPLCDBar *v5;
  TPLCDBar *v6;

  y = a3.origin.y;
  x = a3.origin.x;
  v5 = -[TPLCDBar initWithDefaultSizeForOrientation:](self, "initWithDefaultSizeForOrientation:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[TPLCDBar frame](v5, "frame");
    -[TPLCDBar setFrame:](v6, "setFrame:", x, y);
  }
  return v6;
}

- (void)setOrientation:(int64_t)a3 updateFrame:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;

  v4 = a4;
  -[TPLCDBar frame](self, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend((id)objc_opt_class(), "defaultHeightForOrientation:", a3);
  v14 = v13;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v12 = v16;
    v18 = v17;

    if ((unint64_t)(a3 - 1) >= 2)
      v12 = v18;
  }
  -[TPLCDBar setFrame:](self, "setFrame:", v8, v10, v12, v14);
}

- (void)setOrientation:(int64_t)a3
{
  -[TPLCDBar setOrientation:updateFrame:](self, "setOrientation:updateFrame:", a3, 0);
}

+ (id)backgroundImage
{
  return 0;
}

- (UIImageView)shadowView
{
  return (UIImageView *)objc_getProperty(self, a2, 416, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end

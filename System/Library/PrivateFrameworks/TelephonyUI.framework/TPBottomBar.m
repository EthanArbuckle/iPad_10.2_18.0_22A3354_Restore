@implementation TPBottomBar

+ (double)defaultHeightForStyle:(int64_t)a3 orientation:(int64_t)a4
{
  double result;

  switch(a3)
  {
    case 0:
    case 2:
      result = 109.0;
      break;
    case 1:
      result = 178.0;
      break;
    case 3:
      result = 96.0;
      if ((unint64_t)(a4 - 1) < 2)
        result = 128.0;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

+ (double)defaultHeightForStyle:(int64_t)a3
{
  double result;

  +[TPBottomBar defaultHeightForStyle:orientation:](TPBottomBar, "defaultHeightForStyle:orientation:", a3, 1);
  return result;
}

+ (double)defaultHeightForOrientation:(int64_t)a3
{
  double result;

  objc_msgSend(a1, "defaultHeightForStyle:orientation:", +[TPBottomBar fullscreenStyle](TPBottomBar, "fullscreenStyle"), a3);
  return result;
}

+ (double)defaultHeight
{
  double result;

  objc_msgSend(a1, "defaultHeightForOrientation:", 1);
  return result;
}

- (TPBottomBar)initWithDefaultSize
{
  return -[TPBottomBar initWithDefaultSizeForOrientation:](self, "initWithDefaultSizeForOrientation:", 1);
}

- (TPBottomBar)initWithDefaultSizeForOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TPBottomBar *result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  if ((unint64_t)(a3 - 1) >= 2)
    v7 = v9;
  objc_msgSend((id)objc_opt_class(), "defaultHeightForOrientation:", a3);
  result = -[TPBottomBar initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v7, v10);
  if (result)
    result->_orientation = a3;
  return result;
}

+ (int64_t)fullscreenStyle
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 3;
  else
    return 0;
}

+ (int64_t)overlayStyle
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return 2 * ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1);
}

- (TPBottomBar)initWithFrame:(CGRect)a3
{
  return -[TPBottomBar initWithFrame:style:](self, "initWithFrame:style:", +[TPBottomBar fullscreenStyle](TPBottomBar, "fullscreenStyle"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (TPBottomBar)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  TPBottomBar *v5;
  TPBottomBar *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPBottomBar;
  v5 = -[TPBottomBar initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    -[TPBottomBar setOpaque:](v5, "setOpaque:", 0);
    -[TPBottomBar setNeedsDisplayOnBoundsChange:](v6, "setNeedsDisplayOnBoundsChange:", 1);
    -[TPBottomBar setAutoresizingMask:](v6, "setAutoresizingMask:", 2);
    v6->_orientation = 1;
  }
  return v6;
}

- (TPBottomBar)init
{
  TPBottomBar *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPBottomBar;
  v2 = -[TPBottomBar init](&v4, sel_init);
  if (v2)
    v2->_style = +[TPBottomBar fullscreenStyle](TPBottomBar, "fullscreenStyle");
  return v2;
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
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[TPBottomBar frame](self, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend((id)objc_opt_class(), "defaultHeightForOrientation:", a3);
    v16 = v15 - v14;
    v17 = v14 + v16;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      v20 = v19;
      v22 = v21;

      if ((unint64_t)(a3 - 1) >= 2)
        v12 = v22;
      else
        v12 = v20;
      if ((unint64_t)(a3 - 1) >= 2)
        v23 = v20;
      else
        v23 = v22;
      v24 = v23 - v17;
    }
    else
    {
      v24 = v10 - v16;
    }
    -[TPBottomBar setFrame:](self, "setFrame:", v8, v24, v12, v17);
  }
}

- (void)setOrientation:(int64_t)a3
{
  -[TPBottomBar setOrientation:updateFrame:](self, "setOrientation:updateFrame:", a3, 0);
}

- (int64_t)orientation
{
  return self->_orientation;
}

@end

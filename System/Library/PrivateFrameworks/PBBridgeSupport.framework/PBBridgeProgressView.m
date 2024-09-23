@implementation PBBridgeProgressView

- (PBBridgeProgressView)initWithStyle:(unint64_t)a3 andVersion:(unint64_t)a4 overrideSize:(unint64_t)a5
{
  PBBridgeProgressView *v8;
  PBBridgeProgressView *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  unint64_t watchSize;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIImageView *appleLogo;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  objc_super v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)PBBridgeProgressView;
  v8 = -[PBBridgeProgressView initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    v8->_version = a4;
    v8->_tickCount = 100;
    if (a5)
    {
      v8->_watchSize = a5;
    }
    else
    {
      +[PBBridgeWatchAttributeController sharedDeviceController](PBBridgeWatchAttributeController, "sharedDeviceController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_watchSize = objc_msgSend(v10, "size");

    }
    if (a4 == 1)
    {
      objc_msgSend(CFSTR("syncLogo"), "stringByAppendingString:", CFSTR("-v2"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = CFSTR("syncLogo");
    }
    if (v9->_style)
      v12 = CFSTR("syncGizmoLogo");
    else
      v12 = v11;
    watchSize = v9->_watchSize;
    v14 = v12;
    if (_os_feature_enabled_impl())
      v15 = 7;
    else
      v15 = watchSize;
    +[PBBridgeWatchAttributeController resourceString:material:size:forAttributes:](PBBridgeWatchAttributeController, "resourceString:material:size:forAttributes:", v14, 0, v15, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9->_style != 2)
    {
      v17 = objc_alloc(MEMORY[0x24BDF6AE8]);
      v18 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "imageNamed:inBundle:", v16, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "initWithImage:", v20);
      appleLogo = v9->_appleLogo;
      v9->_appleLogo = (UIImageView *)v21;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9->_appleLogo, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PBBridgeProgressView addSubview:](v9, "addSubview:", v9->_appleLogo);
      v35 = v16;
      v23 = v11;
      v24 = (void *)MEMORY[0x24BDD1628];
      -[UIImageView centerXAnchor](v9->_appleLogo, "centerXAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBridgeProgressView centerXAnchor](v9, "centerXAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v27;
      -[UIImageView centerYAnchor](v9->_appleLogo, "centerYAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBridgeProgressView centerYAnchor](v9, "centerYAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v24;
      v11 = v23;
      v16 = v35;
      objc_msgSend(v32, "activateConstraints:", v31);

    }
    objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBridgeProgressView setBackgroundColor:](v9, "setBackgroundColor:", v33);

  }
  return v9;
}

- (PBBridgeProgressView)initWithStyle:(unint64_t)a3 andVersion:(unint64_t)a4
{
  return -[PBBridgeProgressView initWithStyle:andVersion:overrideSize:](self, "initWithStyle:andVersion:overrideSize:", a3, a4, 0);
}

- (PBBridgeProgressView)initWithStyle:(unint64_t)a3
{
  return -[PBBridgeProgressView initWithStyle:andVersion:](self, "initWithStyle:andVersion:", a3, 0);
}

- (double)_tickLength
{
  unint64_t watchSize;
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  double result;
  double *v8;

  if (self->_style == 2)
    return 6.0;
  watchSize = self->_watchSize;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  v6 = watchSize - 1;
  if (v5 <= 2.0)
  {
    result = 0.0;
    if (v6 >= 0x15)
      return result;
    v8 = (double *)&unk_211401948;
  }
  else
  {
    result = 0.0;
    if (v6 >= 0x15)
      return result;
    v8 = (double *)&unk_2114018A0;
  }
  return v8[v6];
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  unint64_t style;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int tickCount;
  int v18;
  double v19;
  void *v20;
  double v21;
  double currentProgress;
  signed int v23;
  char v24;
  float v25;
  signed int v26;
  __int128 v27;
  __int128 v28;
  CGFloat components[2];
  __int128 v30;
  uint64_t v31;
  CGRect v32;

  v31 = *MEMORY[0x24BDAC8D0];
  CurrentContext = UIGraphicsGetCurrentContext();
  style = self->_style;
  -[PBBridgeProgressView _size](self, "_size");
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFill");

  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = v7;
  v32.size.height = v9;
  CGContextFillRect(CurrentContext, v32);
  v11 = 2.0;
  if (style != 1)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v11 = 2.0 / v13;

  }
  v14 = v7 * 0.5;
  -[PBBridgeProgressView _tickLength](self, "_tickLength");
  v16 = v15;
  CGContextSaveGState(CurrentContext);
  *(_OWORD *)components = xmmword_211401860;
  v30 = unk_211401870;
  tickCount = self->_tickCount;
  v27 = xmmword_211401880;
  v28 = unk_211401890;
  if (self->_style == 2)
    v18 = 36;
  else
    v18 = tickCount;
  if (self->_style == 2)
    v19 = 1.0;
  else
    v19 = 100.0 / (double)tickCount;
  if (style == 1)
  {
    CGContextSetLineWidth(CurrentContext, v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", 100.0 / (double)tickCount, v27, v28, *(_QWORD *)&components[0], *(_QWORD *)&components[1], v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    CGContextSetLineWidth(CurrentContext, v19 * (2.0 / v21));

  }
  CGContextTranslateCTM(CurrentContext, v14, v9 * 0.5);
  CGContextRotateCTM(CurrentContext, 3.14159265);
  currentProgress = self->_currentProgress;
  CGContextSetStrokeColor(CurrentContext, components);
  if (v18 >= 1)
  {
    v23 = 0;
    v24 = 0;
    v25 = currentProgress * (double)v18;
    v26 = llroundf(v25);
    do
    {
      if (v23 > v26 && (v24 & 1) == 0)
      {
        CGContextSetStrokeColor(CurrentContext, (const CGFloat *)&v27);
        v24 = 1;
      }
      CGContextMoveToPoint(CurrentContext, 0.0, v14 - v16 * v11);
      CGContextAddLineToPoint(CurrentContext, 0.0, v14);
      CGContextStrokePath(CurrentContext);
      CGContextRotateCTM(CurrentContext, 6.28318531 / (double)v18);
      ++v23;
    }
    while (v18 != v23);
  }
  CGContextRestoreGState(CurrentContext);
}

- (void)setCurrentProgress:(double)a3
{
  self->_currentProgress = a3;
  -[PBBridgeProgressView setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGSize)_size
{
  unint64_t watchSize;
  unint64_t style;
  void *v4;
  double v5;
  double v6;
  double *v7;
  double v8;
  double v9;
  unint64_t v10;
  CGSize result;

  watchSize = self->_watchSize;
  style = self->_style;
  if (style == 2)
  {
    v8 = 40.0;
    if (watchSize != 2)
      v8 = 44.0;
    goto LABEL_13;
  }
  if (!style)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    if (v6 <= 2.0)
      v7 = (double *)&unk_211401840;
    else
      v7 = (double *)&unk_211401850;
    v8 = v7[watchSize == 19];
LABEL_13:
    v9 = v8;
    goto LABEL_14;
  }
  v9 = *MEMORY[0x24BDBF148];
  v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v10 = watchSize - 1;
  if (watchSize - 1 <= 0x14 && ((0x1C30C3u >> v10) & 1) != 0)
  {
    v8 = dbl_2114019F0[v10];
    v9 = dbl_211401A98[v10];
  }
LABEL_14:
  result.height = v8;
  result.width = v9;
  return result;
}

- (double)currentProgress
{
  return self->_currentProgress;
}

- (unint64_t)tickCount
{
  return self->_tickCount;
}

- (void)setTickCount:(unint64_t)a3
{
  self->_tickCount = a3;
}

- (UIImageView)appleLogo
{
  return self->_appleLogo;
}

- (void)setAppleLogo:(id)a3
{
  objc_storeStrong((id *)&self->_appleLogo, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)watchSize
{
  return self->_watchSize;
}

- (void)setWatchSize:(unint64_t)a3
{
  self->_watchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleLogo, 0);
}

@end

@implementation VUIWatchNowTemplateBackgroundLayer

- (VUIWatchNowTemplateBackgroundLayer)initWithRect:(CGRect)a3 withStyle:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  VUIWatchNowTemplateBackgroundLayer *v9;
  VUIWatchNowTemplateBackgroundLayer *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)VUIWatchNowTemplateBackgroundLayer;
  v9 = -[VUIWatchNowTemplateBackgroundLayer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[VUIWatchNowTemplateBackgroundLayer setNeedsDisplay](v9, "setNeedsDisplay");
    -[VUIWatchNowTemplateBackgroundLayer setFrame:](v10, "setFrame:", x, y, width, height);
    v10->_uiStyle = a4;
  }
  return v10;
}

- (void)updateStyle:(int64_t)a3
{
  self->_uiStyle = a3;
  -[VUIWatchNowTemplateBackgroundLayer setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawInContext:(CGContext *)a3
{
  CGColorSpace *DeviceRGB;
  CGColorSpace *v6;
  __int128 *v7;
  CGGradient *v8;
  CGFloat MidX;
  CGFloat v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  CGPoint v20;
  CGPoint v21;
  CGRect v22;
  CGRect v23;

  v19 = *MEMORY[0x1E0C80C00];
  v15 = xmmword_1DA1C2A48;
  v16 = unk_1DA1C2A58;
  v17 = xmmword_1DA1C2A68;
  v18 = unk_1DA1C2A78;
  v11 = xmmword_1DA1C2A88;
  v12 = unk_1DA1C2A98;
  v13 = xmmword_1DA1C2AA8;
  v14 = unk_1DA1C2AB8;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v6 = DeviceRGB;
  if (self->_uiStyle == 1)
    v7 = &v15;
  else
    v7 = &v11;
  v8 = CGGradientCreateWithColorComponents(DeviceRGB, (const CGFloat *)v7, 0, 2uLL);
  CGColorSpaceRelease(v6);
  -[VUIWatchNowTemplateBackgroundLayer bounds](self, "bounds", v11, v12, v13, v14, v15, v16, v17, v18);
  MidX = CGRectGetMidX(v22);
  -[VUIWatchNowTemplateBackgroundLayer bounds](self, "bounds");
  v10 = CGRectGetHeight(v23) * 0.800000012;
  v20.y = 0.0;
  v21.y = 0.0;
  v20.x = MidX;
  v21.x = MidX;
  CGContextDrawRadialGradient(a3, v8, v20, 0.0, v21, v10, 2u);
  CGGradientRelease(v8);
}

- (int64_t)uiStyle
{
  return self->_uiStyle;
}

- (void)setUiStyle:(int64_t)a3
{
  self->_uiStyle = a3;
}

@end

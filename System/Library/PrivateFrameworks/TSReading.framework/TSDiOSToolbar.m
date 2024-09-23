@implementation TSDiOSToolbar

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDiOSToolbar;
  -[TSDiOSToolbar dealloc](&v3, sel_dealloc);
}

- (void)setBackgroundImage:(id)a3
{
  id v5;

  if (self->mBackgroundImage != a3)
  {
    v5 = a3;

    self->mBackgroundImage = (UIImage *)a3;
    -[TSDiOSToolbar p_updateLayerFlags](self, "p_updateLayerFlags");
    -[TSDiOSToolbar setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setDrawsBackground:(BOOL)a3
{
  if (self->mDrawsBackground != a3)
  {
    self->mDrawsBackground = a3;
    -[TSDiOSToolbar p_updateLayerFlags](self, "p_updateLayerFlags");
    -[TSDiOSToolbar setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)p_updateLayerFlags
{
  UIImage *mBackgroundImage;
  CGImageAlphaInfo AlphaInfo;
  uint64_t v5;

  mBackgroundImage = self->mBackgroundImage;
  if (mBackgroundImage && self->mDrawsBackground)
  {
    AlphaInfo = CGImageGetAlphaInfo(-[UIImage CGImage](mBackgroundImage, "CGImage"));
    -[TSDiOSToolbar setOpaque:](self, "setOpaque:", (AlphaInfo < kCGImageAlphaOnly) & (0x61u >> AlphaInfo));
    v5 = -[TSDiOSToolbar isOpaque](self, "isOpaque") ^ 1;
  }
  else
  {
    v5 = 1;
    -[TSDiOSToolbar setOpaque:](self, "setOpaque:", 1);
  }
  -[TSDiOSToolbar setClearsContextBeforeDrawing:](self, "setClearsContextBeforeDrawing:", v5);
}

- (void)setShadowOpacity:(double)a3
{
  float v5;
  void *v6;
  double v7;

  v5 = a3;
  v6 = (void *)-[TSDiOSToolbar layer](self, "layer");
  *(float *)&v7 = v5;
  objc_msgSend(v6, "setShadowOpacity:", v7);
  self->mShadowOpacity = a3;
}

- (void)setShadowOffset:(CGSize)a3
{
  CGFloat height;
  CGFloat width;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)-[TSDiOSToolbar layer](self, "layer"), "setShadowOffset:", a3.width, a3.height);
  self->mShadowOffset.width = width;
  self->mShadowOffset.height = height;
}

- (void)setShadowRadius:(double)a3
{
  objc_msgSend((id)-[TSDiOSToolbar layer](self, "layer"), "setShadowRadius:", a3);
  self->mShadowRadius = a3;
}

- (void)drawRect:(CGRect)a3
{
  UIImage *mBackgroundImage;
  objc_super v4;

  if (self->mDrawsBackground)
  {
    mBackgroundImage = self->mBackgroundImage;
    if (mBackgroundImage)
    {
      -[TSDiOSToolbar bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
      -[UIImage drawInRect:](mBackgroundImage, "drawInRect:");
    }
    else
    {
      v4.receiver = self;
      v4.super_class = (Class)TSDiOSToolbar;
      -[TSDiOSToolbar drawRect:](&v4, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    }
  }
}

- (void)layoutSubviews
{
  void *v3;
  double mShadowOpacity;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDiOSToolbar;
  -[TSDiOSToolbar layoutSubviews](&v5, sel_layoutSubviews);
  if (self->mShadowOpacity > 0.0)
  {
    v3 = (void *)-[TSDiOSToolbar layer](self, "layer");
    mShadowOpacity = self->mShadowOpacity;
    *(float *)&mShadowOpacity = mShadowOpacity;
    objc_msgSend(v3, "setShadowOpacity:", mShadowOpacity);
    objc_msgSend(v3, "setShadowOffset:", self->mShadowOffset.width, self->mShadowOffset.height);
    objc_msgSend(v3, "setShadowRadius:", self->mShadowRadius);
    -[TSDiOSToolbar setupShadowPath](self, "setupShadowPath");
  }
}

- (void)setupShadowPath
{
  CGPath *Mutable;
  double mShadowX;
  double v5;
  double v6;
  CGRect v7;

  Mutable = CGPathCreateMutable();
  -[TSDiOSToolbar bounds](self, "bounds");
  mShadowX = self->mShadowX;
  v7.origin.x = v5 + mShadowX;
  v7.size.width = v6 - mShadowX;
  CGPathAddRect(Mutable, 0, v7);
  objc_msgSend((id)-[TSDiOSToolbar layer](self, "layer"), "setShadowPath:", Mutable);
  CFRelease(Mutable);
}

- (void)setShadowX:(double)a3
{
  self->mShadowX = a3;
  -[TSDiOSToolbar setupShadowPath](self, "setupShadowPath");
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  objc_super v11;
  objc_super v12;

  if (!objc_msgSend(a4, "isEqualToString:", CFSTR("shadowPath")))
  {
    v11.receiver = self;
    v11.super_class = (Class)TSDiOSToolbar;
    return -[TSDiOSToolbar actionForLayer:forKey:](&v11, sel_actionForLayer_forKey_, a3, a4);
  }
  v12.receiver = self;
  v12.super_class = (Class)TSDiOSToolbar;
  v7 = -[TSDiOSToolbar actionForLayer:forKey:](&v12, sel_actionForLayer_forKey_, a3, CFSTR("position"));
  if (v7 == (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v8 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", a4);
  objc_msgSend(v7, "duration");
  objc_msgSend(v8, "setDuration:");
  objc_msgSend(v8, "setTimingFunction:", objc_msgSend(v7, "timingFunction"));
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend((id)objc_msgSend(v7, "delegate"), "animationDidStop:finished:", v7, 0);
  return v8;
}

- (UIImage)backgroundImage
{
  return self->mBackgroundImage;
}

- (BOOL)drawsBackground
{
  return self->mDrawsBackground;
}

- (double)shadowOpacity
{
  return self->mShadowOpacity;
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->mShadowOffset.width;
  height = self->mShadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)shadowRadius
{
  return self->mShadowRadius;
}

- (double)shadowX
{
  return self->mShadowX;
}

@end

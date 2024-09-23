@implementation TSDPathStroker

- (TSDPathStroker)initWithProperties:(id)a3 bundle:(id)a4 dataManager:(void *)a5 precedingStroker:(id)a6
{
  TSDPathStroker *v8;
  TSUColor *v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TSDPathStroker;
  v8 = -[TSDPathStroker init](&v19, sel_init, a3, a4, a5);
  if (v8)
  {
    v8->mPrecedingStroker = (TSDPathStroker *)a6;
    v9 = (TSUColor *)objc_msgSend(a3, "objectForKey:", CFSTR("color"));
    if (v9)
    {
      v17 = 0.0;
      v18 = 0.0;
      v15 = 0.0;
      v16 = 0.0;
      v10 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v9);
      objc_msgSend(v10, "tsu_scanCGFloat:", &v18);
      objc_msgSend(v10, "tsu_scanCGFloat:", &v17);
      objc_msgSend(v10, "tsu_scanCGFloat:", &v16);
      objc_msgSend(v10, "tsu_scanCGFloat:", &v15);
      v9 = (TSUColor *)(id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", v18, v17, v16, v15);
    }
    v8->mColor = v9;
    v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("width"));
    if (v11)
    {
      objc_msgSend(v11, "floatValue");
      v13 = v12;
    }
    else
    {
      v13 = -1.0;
    }
    v8->mWidth = v13;
  }
  return v8;
}

- (void)dealloc
{
  TSUColor *mColor;
  objc_super v4;

  mColor = self->mColor;
  if (mColor)

  v4.receiver = self;
  v4.super_class = (Class)TSDPathStroker;
  -[TSDPathStroker dealloc](&v4, sel_dealloc);
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4 inColor:(id)a5
{
  TSDPathStroker *mPrecedingStroker;
  double mWidth;
  void *mColor;

  mPrecedingStroker = self->mPrecedingStroker;
  if (mPrecedingStroker)
    -[TSDPathStroker strokePath:inContext:inColor:](mPrecedingStroker, "strokePath:inContext:inColor:", a3, a4, a5);
  mWidth = self->mWidth;
  if (mWidth > 0.0)
    CGContextSetLineWidth(a4, mWidth);
  mColor = self->mColor;
  if (!mColor)
    mColor = a5;
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(mColor, "CGColor"));
  CGContextAddPath(a4, a3);
  CGContextStrokePath(a4);
  if (self->mWidth > 0.0)
    CGContextSetLineWidth(a4, 1.0);
}

- (double)width
{
  return self->mWidth;
}

- (void)setWidth:(double)a3
{
  self->mWidth = a3;
}

@end

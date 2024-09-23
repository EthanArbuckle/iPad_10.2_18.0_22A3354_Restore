@implementation THDottedHairlineView

- (void)p_initCommon
{
  self->mColor = +[UIColor blackColor](UIColor, "blackColor");
}

- (THDottedHairlineView)initWithFrame:(CGRect)a3
{
  THDottedHairlineView *v3;
  THDottedHairlineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THDottedHairlineView;
  v3 = -[THDottedHairlineView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[THDottedHairlineView p_initCommon](v3, "p_initCommon");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[THDottedHairlineView setColor:](self, "setColor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THDottedHairlineView;
  -[THDottedHairlineView dealloc](&v3, "dealloc");
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THDottedHairlineView;
  -[THDottedHairlineView awakeFromNib](&v3, "awakeFromNib");
  -[THDottedHairlineView p_initCommon](self, "p_initCommon");
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  CGPoint points;
  uint64_t v10;
  uint64_t v11;
  CGRect v12;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetStrokeColorWithColor(CurrentContext, -[UIColor CGColor](self->mColor, "CGColor"));
  CGContextSetLineDash(CurrentContext, 0.0, dbl_314698, 2uLL);
  -[THDottedHairlineView frame](self, "frame");
  if (v5 >= 2.0)
  {
    -[THDottedHairlineView frame](self, "frame");
    if (v7 >= 2.0)
    {
      -[THDottedHairlineView frame](self, "frame");
      CGContextStrokeRect(CurrentContext, v12);
      goto LABEL_7;
    }
    points.x = 0.0;
    points.y = 0.0;
    -[THDottedHairlineView frame](self, "frame");
    v10 = v8;
    v11 = 0;
  }
  else
  {
    points.x = 0.0;
    points.y = 0.0;
    -[THDottedHairlineView frame](self, "frame");
    v10 = 0;
    v11 = v6;
  }
  CGContextStrokeLineSegments(CurrentContext, &points, 2uLL);
LABEL_7:
  CGContextRestoreGState(CurrentContext);
}

- (UIColor)color
{
  return self->mColor;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end

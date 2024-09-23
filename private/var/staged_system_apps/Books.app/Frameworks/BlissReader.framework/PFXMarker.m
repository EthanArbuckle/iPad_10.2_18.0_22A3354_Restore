@implementation PFXMarker

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXMarker;
  -[PFXSvgElement dealloc](&v3, "dealloc");
}

- (void)setBezierPath:(id)a3
{
  self->mBezierPath = (TSDBezierPath *)a3;
}

- (void)setFilled:(BOOL)a3
{
  self->mIsFilled = a3;
}

- (void)end
{
  double v3;
  double v4;
  double v5;
  double v6;
  TSDLineEnd *v7;
  id v8;

  objc_msgSend(-[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "refX"), "doubleValue");
  v4 = v3;
  objc_msgSend(-[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "refY"), "doubleValue");
  v6 = v5;
  v8 = -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "markerId");
  if (v8 && (v7 = +[TSDLineEnd lineEndWithIdentifier:](TSDLineEnd, "lineEndWithIdentifier:", v8)) != 0
    || (v7 = +[TSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", -[TSDBezierPath CGPath](self->mBezierPath, "CGPath", v7), self->mIsFilled, v8, v4, v6)) != 0)
  {
    -[PFXSvgElement cacheDefinition:](self, "cacheDefinition:", v7);
  }
}

@end

@implementation PFXInteractiveImageWidgetViewObj

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXInteractiveImageWidgetViewObj;
  -[PFXInteractiveImageWidgetViewObj dealloc](&v3, "dealloc");
}

- (NSArray)children
{
  return self->mChildren;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (double)scale
{
  return self->mScale;
}

- (void)setScale:(double)a3
{
  self->mScale = a3;
}

- (CGPoint)translation
{
  double x;
  double y;
  CGPoint result;

  x = self->mTranslation.x;
  y = self->mTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  self->mTranslation = a3;
}

- (TSDInfoGeometry)canvasGeometry
{
  return self->mCanvasGeometry;
}

- (void)setCanvasGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (TSWPShapeStyle)style
{
  return self->mStyle;
}

- (void)setStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end

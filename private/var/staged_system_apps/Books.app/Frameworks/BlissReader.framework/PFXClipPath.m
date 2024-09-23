@implementation PFXClipPath

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXClipPath;
  -[PFXSvgElement dealloc](&v3, "dealloc");
}

- (void)setBezierPath:(id)a3
{
  self->mBezierPath = (TSDBezierPath *)a3;
}

- (void)end
{
  -[PFXSvgElement cacheDefinition:](self, "cacheDefinition:", self->mBezierPath);
}

@end

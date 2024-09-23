@implementation SBRenderImage

- (SBRenderImage)initWithRenderImage:(_CARenderImage *)a3
{
  SBRenderImage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRenderImage;
  v3 = -[SBRenderImage init](&v5, sel_init);
  if (v3)
    v3->_image = (_CARenderImage *)CARenderRetain();
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CARenderRelease();
  v3.receiver = self;
  v3.super_class = (Class)SBRenderImage;
  -[SBRenderImage dealloc](&v3, sel_dealloc);
}

- (void)CA_copyRenderValue
{
  return (void *)CARenderRetain();
}

@end

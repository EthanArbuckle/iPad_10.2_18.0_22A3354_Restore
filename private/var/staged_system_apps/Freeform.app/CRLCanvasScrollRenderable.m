@implementation CRLCanvasScrollRenderable

- (CRLCanvasScrollRenderable)initWithScrollLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasScrollRenderable;
  return -[CRLCanvasRenderable initWithCALayer:](&v4, "initWithCALayer:", a3);
}

+ (id)renderableFromScrollLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithScrollLayer:", v4);

  return v5;
}

+ (id)renderable
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAScrollLayer layer](CAScrollLayer, "layer"));
  v4 = objc_msgSend(v2, "initWithScrollLayer:", v3);

  return v4;
}

@end

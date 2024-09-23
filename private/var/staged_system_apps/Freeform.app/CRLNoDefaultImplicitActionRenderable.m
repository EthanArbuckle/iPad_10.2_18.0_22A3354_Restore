@implementation CRLNoDefaultImplicitActionRenderable

- (CRLNoDefaultImplicitActionRenderable)initWithNoImplicitActionLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLNoDefaultImplicitActionRenderable;
  return -[CRLCanvasRenderable initWithCALayer:](&v4, "initWithCALayer:", a3);
}

+ (id)renderableFromNoImplicitActionLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithNoImplicitActionLayer:", v4);

  return v5;
}

+ (id)renderable
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLNoDefaultImplicitActionLayer layer](CRLNoDefaultImplicitActionLayer, "layer"));
  v4 = objc_msgSend(v2, "initWithNoImplicitActionLayer:", v3);

  return v4;
}

@end

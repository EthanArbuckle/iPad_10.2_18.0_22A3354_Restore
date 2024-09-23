@implementation CRLBackgroundUpdatableRenderable

- (CRLBackgroundUpdatableRenderable)initWithBackgroundUpdatableLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLBackgroundUpdatableRenderable;
  return -[CRLCanvasRenderable initWithCALayer:](&v4, "initWithCALayer:", a3);
}

+ (id)renderableFromBackgroundUpdatableLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithBackgroundUpdatableLayer:", v4);

  return v5;
}

+ (id)renderable
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBackgroundUpdatableLayer layer](CRLBackgroundUpdatableLayer, "layer"));
  v4 = objc_msgSend(v2, "initWithBackgroundUpdatableLayer:", v3);

  return v4;
}

- (id)p_backgroundUpdatableLayer
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLBackgroundUpdatableLayer, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (void)setContentsFromBackground:(void *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLBackgroundUpdatableRenderable p_backgroundUpdatableLayer](self, "p_backgroundUpdatableLayer"));
  objc_msgSend(v4, "setContentsFromBackground:", a3);

}

@end

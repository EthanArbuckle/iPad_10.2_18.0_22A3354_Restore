@implementation CRLTilingRenderable

- (CRLTilingRenderable)initWithTilingLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLTilingRenderable;
  return -[CRLCanvasRenderable initWithCALayer:](&v4, "initWithCALayer:", a3);
}

+ (id)renderableFromTilingLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithTilingLayer:", v4);

  return v5;
}

+ (id)renderable
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTilingLayer layer](CRLTilingLayer, "layer"));
  v4 = objc_msgSend(v2, "initWithTilingLayer:", v3);

  return v4;
}

- (id)p_tilingLayer
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLTilingLayer, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (int64_t)tilingMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingRenderable p_tilingLayer](self, "p_tilingLayer"));
  v3 = objc_msgSend(v2, "tilingMode");

  return (int64_t)v3;
}

- (void)setTilingMode:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLTilingRenderable p_tilingLayer](self, "p_tilingLayer"));
  objc_msgSend(v4, "setTilingMode:", a3);

}

- (BOOL)forceTiled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTilingRenderable p_tilingLayer](self, "p_tilingLayer"));
  v3 = objc_msgSend(v2, "forceTiled");

  return v3;
}

- (void)setForceTiled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLTilingRenderable p_tilingLayer](self, "p_tilingLayer"));
  objc_msgSend(v4, "setForceTiled:", v3);

}

@end

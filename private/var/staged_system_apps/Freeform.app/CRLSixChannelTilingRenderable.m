@implementation CRLSixChannelTilingRenderable

- (CRLSixChannelTilingRenderable)initWithSixChannelTilingLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLSixChannelTilingRenderable;
  return -[CRLCanvasRenderable initWithCALayer:](&v4, "initWithCALayer:", a3);
}

+ (id)renderableFromSixChannelTilingLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithSixChannelTilingLayer:", v4);

  return v5;
}

+ (id)renderable
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSixChannelTilingLayer layer](CRLSixChannelTilingLayer, "layer"));
  v4 = objc_msgSend(v2, "initWithSixChannelTilingLayer:", v3);

  return v4;
}

- (id)p_sixChannelTilingLayer
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_opt_class(CRLSixChannelTilingLayer, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

@end

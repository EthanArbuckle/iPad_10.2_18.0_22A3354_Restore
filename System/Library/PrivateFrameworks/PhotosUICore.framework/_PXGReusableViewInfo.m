@implementation _PXGReusableViewInfo

- (PXGInternalReusableView)view
{
  return self->_view;
}

- (_PXGReusableViewInfo)hostingViewInfo
{
  return (_PXGReusableViewInfo *)objc_loadWeakRetained((id *)&self->_hostingViewInfo);
}

- (_PXGReusableViewInfo)initWithReusableView:(id)a3
{
  id v5;
  _PXGReusableViewInfo *v6;
  _PXGReusableViewInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXGReusableViewInfo;
  v6 = -[_PXGReusableViewInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_view, a3);
    *(_OWORD *)&v7->_rotation = xmmword_1A7C0C250;
  }

  return v7;
}

- (double)scale
{
  return self->_scale;
}

- (double)rotation
{
  return self->_rotation;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXGReusableViewInfo view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; view = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addHostedViewInfo:(id)a3
{
  id v4;
  NSMutableArray *hostedViewInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  hostedViewInfos = self->_hostedViewInfos;
  v8 = v4;
  if (!hostedViewInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_hostedViewInfos;
    self->_hostedViewInfos = v6;

    v4 = v8;
    hostedViewInfos = self->_hostedViewInfos;
  }
  -[NSMutableArray addObject:](hostedViewInfos, "addObject:", v4);

}

- (void)removeFromSuperViewInfo
{
  void *v3;
  id *v4;

  -[_PXGReusableViewInfo hostingViewInfo](self, "hostingViewInfo");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_PXGReusableViewInfo view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pxg_removeFromSuperview");

    objc_msgSend(v4[1], "removeObject:", self);
    -[_PXGReusableViewInfo setHostingViewInfo:](self, "setHostingViewInfo:", 0);
  }

}

- (NSArray)hostedViewInfos
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_hostedViewInfos, "copy");
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (void)setHostingViewInfo:(id)a3
{
  objc_storeWeak((id *)&self->_hostingViewInfo, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingViewInfo);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_hostedViewInfos, 0);
}

@end

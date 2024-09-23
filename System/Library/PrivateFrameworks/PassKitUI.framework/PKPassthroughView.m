@implementation PKPassthroughView

- (PKPassthroughView)initWithFrame:(CGRect)a3
{
  PKPassthroughView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassthroughView;
  result = -[PKPassthroughView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_hitTestEnabled = 1;
  return result;
}

- (void)dealloc
{
  _QWORD *WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_portal);
  if (WeakRetained)
    --WeakRetained[53];

  v4.receiver = self;
  v4.super_class = (Class)PKPassthroughView;
  -[PKPassthroughView dealloc](&v4, sel_dealloc);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _BYTE *v8;
  PKPassthroughView *v9;
  _BYTE *WeakRetained;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->_inHitTest && (!self->_portalTargetCount || self->_inPortalHitTest))
  {
    self->_inHitTest = 1;
    if (self->_hitTestEnabled)
    {
      v24.receiver = self;
      v24.super_class = (Class)PKPassthroughView;
      -[PKPassthroughView hitTest:withEvent:](&v24, sel_hitTest_withEvent_, v7, x, y);
      v9 = (PKPassthroughView *)objc_claimAutoreleasedReturnValue();
      if (v9 == self)
      {

      }
      else
      {
        v8 = v9;
        if (v9)
        {
LABEL_16:
          self->_inHitTest = 0;
          goto LABEL_17;
        }
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_portal);
    if (WeakRetained)
    {
      -[PKPassthroughView bounds](self, "bounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(WeakRetained, "bounds");
      v26.origin.x = v19;
      v26.origin.y = v20;
      v26.size.width = v21;
      v26.size.height = v22;
      v25.origin.x = v12;
      v25.origin.y = v14;
      v25.size.width = v16;
      v25.size.height = v18;
      if (CGRectEqualToRect(v25, v26))
      {
        WeakRetained[417] = 1;
        objc_msgSend(WeakRetained, "hitTest:withEvent:", v7, x, y);
        v8 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        WeakRetained[417] = 0;
        if (v8 != WeakRetained)
        {
LABEL_15:

          goto LABEL_16;
        }

      }
    }
    v8 = 0;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (void)setPortal:(id)a3
{
  PKPassthroughView **p_portal;
  _QWORD *WeakRetained;
  void *v6;
  _QWORD *obj;

  obj = a3;
  p_portal = &self->_portal;
  WeakRetained = objc_loadWeakRetained((id *)&self->_portal);
  v6 = WeakRetained;
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      --WeakRetained[53];
    objc_storeWeak((id *)p_portal, obj);
    if (obj)
      ++obj[53];
  }

}

- (BOOL)isPortalled
{
  return self->_portalTargetCount != 0;
}

- (BOOL)isHitTestEnabled
{
  return self->_hitTestEnabled;
}

- (void)setHitTestEnabled:(BOOL)a3
{
  self->_hitTestEnabled = a3;
}

- (PKPassthroughView)portal
{
  return (PKPassthroughView *)objc_loadWeakRetained((id *)&self->_portal);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_portal);
}

@end

@implementation _UIUpdateLinkViewInteraction

- (void)dealloc
{
  _UIUpdateLinkTrackingView *link;
  objc_super v3;

  link = self->_link;
  if (link)
    *(_QWORD *)&link->super.super._sceneForeground = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIUpdateLinkViewInteraction;
  -[_UIUpdateLinkViewInteraction dealloc](&v3, sel_dealloc);
}

- (UIView)view
{
  return self->_view;
}

- (void)didMoveToView:(id)a3
{
  void *v5;
  void *v6;

  -[UIView _window](self->_view, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIUpdateLinkViewInteraction _updateWindowFrom:to:]((uint64_t)self, v5, v6);

  self->_view = (UIView *)a3;
}

- (void)_updateWindowFrom:(void *)a3 to:
{
  uint64_t v6;
  void *v7;
  void *v8;
  _BYTE *v9;
  int v10;
  int v11;

  if (a1)
  {
    -[_UIUpdateLinkTrackingWindow _switchWindowFrom:to:](*(_QWORD *)(a1 + 16), (uint64_t)a2, a3);
    v6 = *(_QWORD *)(a1 + 16);
    objc_msgSend(a2, "_windowHostingScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "_windowHostingScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIUpdateLinkTrackingScene _switchSceneFrom:to:](v6, (uint64_t)v7, v8);

    v9 = *(_BYTE **)(a1 + 16);
    if (v9)
    {
      v10 = objc_msgSend(v9, "_canEngage");
      if (v9[48] != v10)
      {
        v9[48] = v10;
        if (v9[50])
          v11 = v10;
        else
          v11 = 0;
        -[UIUpdateLink _setActive:]((uint64_t)v9, v11);
      }
    }
  }
}

- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4
{
  -[_UIUpdateLinkViewInteraction _updateWindowFrom:to:]((uint64_t)self, a3, a4);
}

@end

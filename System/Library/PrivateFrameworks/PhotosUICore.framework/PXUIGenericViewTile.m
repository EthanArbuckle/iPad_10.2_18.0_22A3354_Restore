@implementation PXUIGenericViewTile

- (void)_setSpec:(id)a3
{
  PXViewSpec *v5;

  v5 = (PXViewSpec *)a3;
  if (self->__spec != v5)
  {
    objc_storeStrong((id *)&self->__spec, a3);
    -[UIView px_setSpec:](self->_view, "px_setSpec:", v5);
  }

}

- (UIView)view
{
  UIView *view;
  UIView *v4;
  UIView *v5;

  view = self->_view;
  if (!view)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_view;
    self->_view = v4;

    -[UIView setUserInteractionEnabled:](self->_view, "setUserInteractionEnabled:", 0);
    -[UIView px_setSpec:](self->_view, "px_setSpec:", self->__spec);
    view = self->_view;
  }
  return view;
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  id v5;

  objc_msgSend(a4, "viewSpec", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUIGenericViewTile _setSpec:](self, "_setSpec:", v5);

}

- (void)becomeReusable
{
  -[UIView setHidden:](self->_view, "setHidden:", 1);
}

- (void)prepareForReuse
{
  -[UIView setHidden:](self->_view, "setHidden:", 0);
}

- (PXViewSpec)_spec
{
  return self->__spec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end

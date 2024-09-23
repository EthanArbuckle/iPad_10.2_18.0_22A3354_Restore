@implementation PBFOrientationTransformPortalView

- (void)setPortalView:(id)a3
{
  _UIPortalView *v5;
  _UIPortalView *portalView;
  _UIPortalView *v7;

  v5 = (_UIPortalView *)a3;
  portalView = self->_portalView;
  v7 = v5;
  if (portalView != v5)
  {
    -[_UIPortalView removeFromSuperview](portalView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_portalView, a3);
    -[BSUIOrientationTransformWrapperView addContentView:](self, "addContentView:", v7);
    -[PBFOrientationTransformPortalView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PBFOrientationTransformPortalView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
}

@end

@implementation _PXAssetsSceneAnchor

- (_PXAssetsSceneAnchor)initWithAssetReference:(id)a3 anchorOrigin:(CGPoint)a4 distance:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  _PXAssetsSceneAnchor *v11;
  _PXAssetsSceneAnchor *v12;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PXAssetsSceneAnchor;
  v11 = -[_PXAssetsSceneAnchor init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetReference, a3);
    v12->_anchorOrigin.x = x;
    v12->_anchorOrigin.y = y;
    v12->_distance = a5;
  }

  return v12;
}

- (PXAssetReference)assetReference
{
  return self->_assetReference;
}

- (CGPoint)anchorOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorOrigin.x;
  y = self->_anchorOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetReference, 0);
}

@end

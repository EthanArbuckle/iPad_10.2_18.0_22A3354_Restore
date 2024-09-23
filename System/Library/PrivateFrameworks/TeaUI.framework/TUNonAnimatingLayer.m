@implementation TUNonAnimatingLayer

- (TUNonAnimatingLayer)init
{
  TUNonAnimatingLayer *v2;
  TUNonAnimatingLayerDelegate *v3;
  TUNonAnimatingLayerDelegate *layerDelegate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUNonAnimatingLayer;
  v2 = -[TUNonAnimatingLayer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TUNonAnimatingLayerDelegate);
    layerDelegate = v2->_layerDelegate;
    v2->_layerDelegate = v3;

    -[TUNonAnimatingLayer setDelegate:](v2, "setDelegate:", v2->_layerDelegate);
  }
  return v2;
}

- (TUNonAnimatingLayerDelegate)layerDelegate
{
  return self->_layerDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerDelegate, 0);
}

@end

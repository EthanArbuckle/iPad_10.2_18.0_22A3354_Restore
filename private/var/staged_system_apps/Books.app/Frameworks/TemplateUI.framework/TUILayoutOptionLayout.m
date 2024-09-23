@implementation TUILayoutOptionLayout

- (TUILayoutOptionLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUILayoutOptionLayout *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUILayoutOptionLayout;
  result = -[TUILayout initWithModel:parent:controller:](&v6, "initWithModel:parent:controller:", a3, a4, a5);
  if (result)
    result->_scale = 1.0;
  return result;
}

- (double)computedScale
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUILayoutOptionLayout;
  -[TUILayout computedScale](&v5, "computedScale");
  return v3 * self->_scale;
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[TUILayout onComputedScaleDidChange](self, "onComputedScaleDidChange");
  }
}

- (void)computeLayout
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  -[TUILayout containingWidth](self, "containingWidth");
  objc_msgSend(v4, "setContainingWidth:");
  -[TUILayout containingHeight](self, "containingHeight");
  objc_msgSend(v4, "setContainingHeight:");
  -[TUILayout flexedWidth](self, "flexedWidth");
  objc_msgSend(v4, "setFlexedWidth:");
  -[TUILayout flexedHeight](self, "flexedHeight");
  objc_msgSend(v4, "setFlexedHeight:");
  objc_msgSend(v4, "validateLayout");
  objc_msgSend(v4, "setComputedOrigin:", CGPointZero.x, CGPointZero.y);
  objc_msgSend(v4, "computedTransformedSize");
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");

}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  void *v3;
  void *v4;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v4, "validatedIntrinsicWidthConsideringSpecified");
  return v5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  void *v3;
  void *v4;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v4, "validatedIntrinsicHeightConsideringSpecified");
  return v5;
}

- (double)scale
{
  return self->_scale;
}

@end

@implementation _UIIntelligenceSystemViewHostLayer

- (id)_hostLayerDelegate
{
  void *v2;
  void *v3;
  id v4;

  -[_UIIntelligenceSystemViewHostLayer delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "conformsToProtocol:", &unk_1EDDEBB28))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIIntelligenceSystemViewHostLayer;
  -[_UIIntelligenceSystemViewHostLayer setCornerRadius:](&v6, sel_setCornerRadius_);
  -[_UIIntelligenceSystemViewHostLayer _hostLayerDelegate](self, "_hostLayerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layerCornerRadiusDidChange:", a3);

}

- (void)setCornerCurve:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIIntelligenceSystemViewHostLayer;
  v4 = a3;
  -[_UIIntelligenceSystemViewHostLayer setCornerCurve:](&v6, sel_setCornerCurve_, v4);
  -[_UIIntelligenceSystemViewHostLayer _hostLayerDelegate](self, "_hostLayerDelegate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layerCornerCurveDidChange:", v4);

}

- (void)setMaskedCorners:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIIntelligenceSystemViewHostLayer;
  -[_UIIntelligenceSystemViewHostLayer setMaskedCorners:](&v6, sel_setMaskedCorners_);
  -[_UIIntelligenceSystemViewHostLayer _hostLayerDelegate](self, "_hostLayerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layerMaskedCornersDidChange:", a3);

}

@end

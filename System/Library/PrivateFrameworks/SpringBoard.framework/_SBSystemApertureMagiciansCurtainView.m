@implementation _SBSystemApertureMagiciansCurtainView

- (_SBSystemApertureMagiciansCurtainView)initWithFrame:(CGRect)a3
{
  _SBSystemApertureMagiciansCurtainView *v3;
  _SBSystemApertureMagiciansCurtainView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SBSystemApertureMagiciansCurtainView;
  v3 = -[_SBSystemApertureGainMapView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_SBGainMapView setSupportsHitTesting:](v3->super._gainMapView, "setSupportsHitTesting:", 0);
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sensorRegionSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_SBSystemApertureMagiciansCurtainView;
  -[_SBSystemApertureGainMapView layoutSubviews](&v13, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sensorRegionSize");
  BSRectWithSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_SBSystemApertureMagiciansCurtainView window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSystemApertureContainerView _defaultCornerRadiusForBounds:inWindow:](SBSystemApertureContainerView, "_defaultCornerRadiusForBounds:inWindow:", v12, v5, v7, v9, v11);
  -[_SBSystemApertureGainMapView setIDCornerRadius:](self, "setIDCornerRadius:");

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _SBSystemApertureMagiciansCurtainView *v5;
  _SBSystemApertureMagiciansCurtainView *v6;
  _SBSystemApertureMagiciansCurtainView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SBSystemApertureMagiciansCurtainView;
  -[_SBSystemApertureMagiciansCurtainView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_SBSystemApertureMagiciansCurtainView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

@end

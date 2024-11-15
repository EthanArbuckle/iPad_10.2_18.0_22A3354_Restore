@implementation _SBGainMapView

+ (Class)layerClass
{
  return (Class)objc_opt_self();
}

- (_SBGainMapView)initWithFrame:(CGRect)a3
{
  _SBGainMapView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SBGainMapView;
  result = -[_SBGainMapView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_supportsHitTesting = 1;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _SBGainMapView *v5;
  _SBGainMapView *v6;
  _SBGainMapView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SBGainMapView;
  -[_SBGainMapView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_SBGainMapView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self && !self->_supportsHitTesting)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (BOOL)supportsHitTesting
{
  return self->_supportsHitTesting;
}

- (void)setSupportsHitTesting:(BOOL)a3
{
  self->_supportsHitTesting = a3;
}

@end

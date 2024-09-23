@implementation RCPlatterWaveformSlice

- (RCPlatterWaveformSlice)init
{
  RCPlatterWaveformSlice *v2;
  RCPlatterWaveformSlice *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCPlatterWaveformSlice;
  v2 = -[RCPlatterWaveformSlice init](&v5, "init");
  v3 = v2;
  if (v2)
    -[RCPlatterWaveformSlice setupView](v2, "setupView");
  return v3;
}

- (void)setupView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v8 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RCPlatterWaveformSlice setView:](self, "setView:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v3, "platterWaveformSliceWidth");
  v5 = v4;
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v6, "setCornerRadius:", v5 * 0.5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", 1);

}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (BOOL)amplitudeNeedsUpdate
{
  return self->_amplitudeNeedsUpdate;
}

- (void)setAmplitudeNeedsUpdate:(BOOL)a3
{
  self->_amplitudeNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end

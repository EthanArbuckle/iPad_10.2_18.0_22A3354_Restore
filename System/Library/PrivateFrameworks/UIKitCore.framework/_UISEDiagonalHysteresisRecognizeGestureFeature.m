@implementation _UISEDiagonalHysteresisRecognizeGestureFeature

- (_UISEDiagonalHysteresisRecognizeGestureFeature)initWithSettings:(id)a3
{
  _UISEDiagonalHysteresisRecognizeGestureFeature *v4;
  _UISEDiagonalHysteresisRecognizeGestureFeature *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISEDiagonalHysteresisRecognizeGestureFeature;
  v4 = -[_UISEDiagonalHysteresisRecognizeGestureFeature init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_settings, a3);
    v5->_initialLocation = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  double v5;
  float64x2_t v6;

  -[_UISEGestureFeatureSettings hysteresis](self->_settings, "hysteresis");
  if (a3->var0 == 1)
  {
    if (v5 <= 0.0
      || (v6 = vsubq_f64((float64x2_t)self->_initialLocation, (float64x2_t)a3->var5),
          sqrt(vaddvq_f64(vmulq_f64(v6, v6))) > v5))
    {
      -[_UISEGestureFeature _setState:](self, "_setState:", 1);
    }
  }
  else if (!a3->var0)
  {
    self->_initialLocation = a3->var5;
  }
}

@end

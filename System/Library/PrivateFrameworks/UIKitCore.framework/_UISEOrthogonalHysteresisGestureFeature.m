@implementation _UISEOrthogonalHysteresisGestureFeature

- (_UISEOrthogonalHysteresisGestureFeature)initWithSettings:(id)a3 touchedEdgesProvider:(id)a4
{
  _UISEOrthogonalHysteresisGestureFeature *v6;
  _UISEOrthogonalHysteresisGestureFeature *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UISEOrthogonalHysteresisGestureFeature;
  v6 = -[_UISEOrthogonalHysteresisGestureFeature init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    objc_storeWeak((id *)&v7->_provider, a4);
    v7->_initialLocation = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
    v7->_initialTimestamp = NAN;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  double v5;
  double v6;
  id WeakRetained;
  uint64_t v8;
  float64x2_t v9;
  double v10;
  double v11;
  double v12;
  CGPoint *p_y;
  double v14;
  CGPoint *p_var5;
  _UISEOrthogonalHysteresisGestureFeature *v16;
  uint64_t v17;
  unint64_t v18;
  _UISEGestureFeatureSettings *settings;
  double v20;
  double v21;
  long double v22;
  double v23;
  double v24;

  -[_UISEGestureFeatureSettings hysteresis](self->_settings, "hysteresis");
  if (a3->var0 == 1)
  {
    v6 = v5;
    if (v5 > 0.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
      v8 = objc_msgSend(WeakRetained, "touchedEdges");

      if (((~(_BYTE)v8 & 3) == 0) | (2 * ((~(_BYTE)v8 & 9) == 0)) | (4 * ((~(_BYTE)v8 & 6) == 0)) | (8 * ((~(_BYTE)v8 & 0xC) == 0)))
      {
        v9 = vsubq_f64((float64x2_t)self->_initialLocation, (float64x2_t)a3->var5);
        if (sqrt(vaddvq_f64(vmulq_f64(v9, v9))) <= v6)
        {
          -[_UISEGestureFeatureSettings cornerAngleWindow](self->_settings, "cornerAngleWindow");
          v11 = v10;
          v12 = 0.0;
LABEL_19:
          -[_UISEGestureFeatureSettings hysteresis](self->_settings, "hysteresis");
          v22 = fmin(v21, 10.0) / tan(v11 * -0.5 + 1.57079633);
          v23 = a3->var6 - self->_initialTimestamp;
          -[_UISEGestureFeatureSettings edgeAngleWindowDecayTime](self->_settings, "edgeAngleWindowDecayTime");
          if (v12 <= fmax(v22 * (1.0 - v23 * (1.0 / v24)), 20.0))
            return;
          v16 = self;
          v17 = 2;
LABEL_14:
          -[_UISEGestureFeature _setState:](v16, "_setState:", v17);
          return;
        }
      }
      else
      {
        if ((v8 & 0xA) != 0)
        {
          p_y = (CGPoint *)&self->_initialLocation.y;
          v14 = vabdd_f64(a3->var5.x, self->_initialLocation.x);
          p_var5 = (CGPoint *)&a3->var5.y;
        }
        else
        {
          p_var5 = &a3->var5;
          p_y = &self->_initialLocation;
          v14 = vabdd_f64(a3->var5.y, self->_initialLocation.y);
        }
        if (v14 <= v6)
        {
          v12 = vabdd_f64(p_var5->x, p_y->x);
          v18 = -[_UISEGestureFeatureSettings interfaceBottomEdge](self->_settings, "interfaceBottomEdge");
          settings = self->_settings;
          if (v8 == v18)
            -[_UISEGestureFeatureSettings bottomEdgeAngleWindow](settings, "bottomEdgeAngleWindow");
          else
            -[_UISEGestureFeatureSettings edgeAngleWindow](settings, "edgeAngleWindow");
          v11 = v20;
          goto LABEL_19;
        }
      }
    }
    v16 = self;
    v17 = 1;
    goto LABEL_14;
  }
  if (!a3->var0)
  {
    self->_initialLocation = a3->var5;
    self->_initialTimestamp = a3->var6;
  }
}

@end

@implementation _UISEVelocityDirectionEdgesGestureFeature

- (_UISEVelocityDirectionEdgesGestureFeature)initWithSettings:(id)a3 touchedEdgesProvider:(id)a4 exactMatchEdges:(BOOL)a5
{
  _UISEVelocityDirectionEdgesGestureFeature *v8;
  _UISEVelocityDirectionEdgesGestureFeature *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UISEVelocityDirectionEdgesGestureFeature;
  v8 = -[_UISEVelocityDirectionEdgesGestureFeature init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_touchedEdges = 0;
    objc_storeWeak((id *)&v8->_provider, a4);
    objc_storeStrong((id *)&v9->_settings, a3);
    v9->_exactMatchEdges = a5;
    v9->_initialLocation = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  id WeakRetained;
  uint64_t v6;
  double v7;
  double v8;
  int v9;
  uint64_t v10;
  _UISEGestureFeatureSettings *settings;
  double v12;
  uint64_t v13;
  _UISEGestureFeatureSettings *v14;
  double v15;
  double v16;
  unint64_t v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  _BOOL4 exactMatchEdges;
  unint64_t v22;
  uint64_t v23;

  if (a3->var0 != 1)
  {
    if (!a3->var0)
      self->_initialLocation = a3->var5;
    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v6 = objc_msgSend(WeakRetained, "touchedEdges");

  v7 = atan2(a3->var5.y - self->_initialLocation.y, a3->var5.x - self->_initialLocation.x);
  v8 = 0.0;
  if ((unint64_t)(v6 - 1) <= 0xB)
    v8 = dbl_18667CCE8[v6 - 1];
  v9 = ~LODWORD(self->_touchedEdges);
  v10 = ((v9 & 3) == 0) | (2 * ((v9 & 9) == 0)) | (4 * ((v9 & 6) == 0)) | (8 * ((v9 & 0xC) == 0));
  settings = self->_settings;
  if (v10)
  {
    -[_UISEGestureFeatureSettings cornerAngleWindow](settings, "cornerAngleWindow");
  }
  else
  {
    v13 = -[_UISEGestureFeatureSettings interfaceBottomEdge](settings, "interfaceBottomEdge");
    v14 = self->_settings;
    if (v6 == v13)
      -[_UISEGestureFeatureSettings bottomEdgeAngleWindow](v14, "bottomEdgeAngleWindow");
    else
      -[_UISEGestureFeatureSettings edgeAngleWindow](v14, "edgeAngleWindow");
  }
  v15 = v12;
  v16 = fabs(remainder(v7 - v8, 6.28318531));
  if (v16 >= v15 * 0.5)
    v17 = 0;
  else
    v17 = v6;
  if (v10)
    v18 = v16 < v15 * 0.5;
  else
    v18 = 1;
  if (!v18)
  {
    if ((int)(v7 / 1.57079633) <= 0)
      v19 = -(-(int)(v7 / 1.57079633) & 3);
    else
      v19 = (int)(v7 / 1.57079633) & 3;
    if (v19 > 3)
      v20 = 0;
    else
      v20 = qword_18667CD48[v19];
    v17 = v20 & v6;
  }
  exactMatchEdges = self->_exactMatchEdges;
  v22 = -[_UISEGestureFeatureSettings targetEdges](self->_settings, "targetEdges");
  if (!exactMatchEdges)
  {
    v17 &= v22;
    if (!v17)
      goto LABEL_29;
    goto LABEL_28;
  }
  if (v17 == v22)
LABEL_28:
    self->_touchedEdges = v17;
LABEL_29:
  if (self->_touchedEdges)
    v23 = 1;
  else
    v23 = 2;
  -[_UISEGestureFeature _setState:](self, "_setState:", v23);
}

- (id)debugDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISEVelocityDirectionEdgesGestureFeature;
  -[_UISEGestureFeature debugDictionary](&v7, sel_debugDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  _UIRectEdgeDescription(self->_touchedEdges);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("touchedEdges"));

  return v4;
}

- (unint64_t)touchedEdges
{
  return self->_touchedEdges;
}

@end

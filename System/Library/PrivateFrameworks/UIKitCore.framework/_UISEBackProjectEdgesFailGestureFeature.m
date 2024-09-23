@implementation _UISEBackProjectEdgesFailGestureFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  CGPoint *p_initialLocation;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  _UISEGestureFeatureSettings *settings;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  unint64_t v25;

  if (a3->var0 == 1)
  {
    if (!self->_hasDoneTest)
    {
      p_initialLocation = &self->_initialLocation;
      v6 = a3->var5.x - self->_initialLocation.x;
      v7 = a3->var5.y - self->_initialLocation.y;
      -[_UISEGestureFeatureSettings maximumBackProjectTimeFactor](self->_settings, "maximumBackProjectTimeFactor");
      if (v8 > 1.0)
      {
        v9 = v8;
        v10 = a3->var6 - self->_initialTimestamp;
        -[_UISEGestureFeatureSettings backProjectTime](self->_settings, "backProjectTime");
        v12 = v11 / v10;
        if (v12 < 1.0)
          v12 = 1.0;
        if (v12 >= v9)
          v12 = v9;
        v6 = v6 * v12;
        v7 = v7 * v12;
      }
      v13 = p_initialLocation->x - v6;
      v14 = self->_initialLocation.y - v7;
      v15 = -[_UISEGestureFeatureSettings targetEdges](self->_settings, "targetEdges");
      v16 = -[_UISEGestureFeatureSettings interfaceBottomEdge](self->_settings, "interfaceBottomEdge");
      settings = self->_settings;
      if (v15 == v16)
        -[_UISEGestureFeatureSettings bottomEdgeRegionSize](settings, "bottomEdgeRegionSize");
      else
        -[_UISEGestureFeatureSettings edgeRegionSize](settings, "edgeRegionSize");
      v19 = v18;
      -[_UISEGestureFeatureSettings bounds](self->_settings, "bounds");
      v24 = UIRectEdgeRegionForLocation(v20, v21, v22, v23, v13, v14, v19);
      v25 = -[_UISEGestureFeatureSettings targetEdges](self->_settings, "targetEdges");
      self->_touchedEdges = v25 & v24;
      if ((v25 & v24) == 0)
        -[_UISEGestureFeature _setState:](self, "_setState:", 2);
      self->_hasDoneTest = 1;
    }
  }
  else if (!a3->var0)
  {
    self->_initialLocation = a3->var5;
    self->_initialTimestamp = a3->var6;
  }
}

- (_UISEBackProjectEdgesFailGestureFeature)initWithSettings:(id)a3
{
  _UISEBackProjectEdgesFailGestureFeature *v4;
  _UISEBackProjectEdgesFailGestureFeature *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISEBackProjectEdgesFailGestureFeature;
  v4 = -[_UISEBackProjectEdgesFailGestureFeature init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_touchedEdges = 0;
    objc_storeStrong((id *)&v4->_settings, a3);
    v5->_hasDoneTest = 0;
    v5->_initialLocation = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
    v5->_initialTimestamp = NAN;
  }
  return v5;
}

- (id)debugDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISEBackProjectEdgesFailGestureFeature;
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

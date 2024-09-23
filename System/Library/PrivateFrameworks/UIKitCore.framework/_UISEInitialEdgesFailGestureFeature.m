@implementation _UISEInitialEdgesFailGestureFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  _BOOL4 useEdgeRegionSize;
  _UISEGestureFeatureSettings *settings;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  CGRect v16;
  CGRect v17;

  useEdgeRegionSize = self->_useEdgeRegionSize;
  settings = self->_settings;
  if (useEdgeRegionSize)
  {
    -[_UISEGestureFeatureSettings edgeRegionSize](settings, "edgeRegionSize");
    v8 = v7 + 20.0;
  }
  else
  {
    -[_UISEGestureFeatureSettings bounds](settings, "bounds");
    v9 = CGRectGetWidth(v16) * 0.5;
    -[_UISEGestureFeatureSettings bounds](self->_settings, "bounds");
    v10 = CGRectGetHeight(v17) * 0.5;
    if (v9 >= v10)
      v8 = v10;
    else
      v8 = v9;
  }
  if (!a3->var0)
  {
    -[_UISEGestureFeatureSettings bounds](self->_settings, "bounds");
    v15 = UIRectEdgeRegionForLocation(v11, v12, v13, v14, a3->var5.x, a3->var5.y, v8);
    if ((-[_UISEGestureFeatureSettings targetEdges](self->_settings, "targetEdges") & v15) == 0)
      -[_UISEGestureFeature _setState:](self, "_setState:", 2);
  }
}

- (_UISEInitialEdgesFailGestureFeature)initWithSettings:(id)a3 useEdgeRegionSize:(BOOL)a4
{
  _UISEInitialEdgesFailGestureFeature *v6;
  _UISEInitialEdgesFailGestureFeature *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UISEInitialEdgesFailGestureFeature;
  v6 = -[_UISEInitialEdgesFailGestureFeature init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v7->_useEdgeRegionSize = a4;
  }
  return v7;
}

@end

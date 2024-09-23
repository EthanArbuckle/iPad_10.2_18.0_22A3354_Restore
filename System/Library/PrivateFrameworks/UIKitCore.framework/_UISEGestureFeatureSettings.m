@implementation _UISEGestureFeatureSettings

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)targetEdges
{
  return self->_targetEdges;
}

- (void)setInterfaceBottomEdge:(unint64_t)a3
{
  self->_interfaceBottomEdge = a3;
}

- (void)setTargetEdges:(unint64_t)a3
{
  self->_targetEdges = a3;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)edgeRegionSize
{
  return self->_edgeRegionSize;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (_UISEGestureFeatureSettings)init
{
  _UISEGestureFeatureSettings *v2;
  _UISEGestureFeatureSettings *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  int v8;
  double v9;
  int v10;
  double v11;
  CGSize v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UISEGestureFeatureSettings;
  v2 = -[_UISEGestureFeatureSettings init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_backProjectTime = xmmword_18667CC90;
    *(_OWORD *)&v2->_bottomEdgeRegionSize = xmmword_18667CCA0;
    *(_OWORD *)&v2->_edgeAngleWindow = xmmword_18667CCB0;
    v4 = 13.0;
    if (!_UIDeviceNativeUserInterfaceIdiom() && MGGetBoolAnswer())
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_referenceBounds");
      v7 = v6;

      v8 = MGGetBoolAnswer();
      v9 = 0.09;
      if (v8)
        v9 = 0.1;
      v4 = v7 * v9;
    }
    v3->_edgeRegionSize = v4;
    v3->_hysteresis = 15.0;
    v3->_minimumNumberOfSubfeatures = 1;
    v3->_maximumSwipeDuration = 0.25;
    v10 = MGGetBoolAnswer();
    v11 = 1.0;
    if (v10)
      v11 = 2.0;
    v3->_maximumBackProjectTimeFactor = v11;
    v12 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v3->_bounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v3->_bounds.size = v12;
    v3->_interfaceBottomEdge = 0;
    v3->_targetEdges = 0;
  }
  return v3;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (void)setMinimumNumberOfSubfeatures:(unint64_t)a3
{
  self->_minimumNumberOfSubfeatures = a3;
}

- (double)backProjectTime
{
  return self->_backProjectTime;
}

- (void)setBackProjectTime:(double)a3
{
  self->_backProjectTime = a3;
}

- (double)bottomEdgeAngleWindow
{
  return self->_bottomEdgeAngleWindow;
}

- (void)setBottomEdgeAngleWindow:(double)a3
{
  self->_bottomEdgeAngleWindow = a3;
}

- (double)bottomEdgeRegionSize
{
  return self->_bottomEdgeRegionSize;
}

- (void)setBottomEdgeRegionSize:(double)a3
{
  self->_bottomEdgeRegionSize = a3;
}

- (double)cornerAngleWindow
{
  return self->_cornerAngleWindow;
}

- (void)setCornerAngleWindow:(double)a3
{
  self->_cornerAngleWindow = a3;
}

- (double)edgeAngleWindow
{
  return self->_edgeAngleWindow;
}

- (void)setEdgeAngleWindow:(double)a3
{
  self->_edgeAngleWindow = a3;
}

- (double)edgeAngleWindowDecayTime
{
  return self->_edgeAngleWindowDecayTime;
}

- (void)setEdgeAngleWindowDecayTime:(double)a3
{
  self->_edgeAngleWindowDecayTime = a3;
}

- (void)setEdgeRegionSize:(double)a3
{
  self->_edgeRegionSize = a3;
}

- (unint64_t)interfaceBottomEdge
{
  return self->_interfaceBottomEdge;
}

- (unint64_t)minimumNumberOfSubfeatures
{
  return self->_minimumNumberOfSubfeatures;
}

- (double)maximumBackProjectTimeFactor
{
  return self->_maximumBackProjectTimeFactor;
}

- (void)setMaximumBackProjectTimeFactor:(double)a3
{
  self->_maximumBackProjectTimeFactor = a3;
}

- (double)maximumSwipeDuration
{
  return self->_maximumSwipeDuration;
}

- (void)setMaximumSwipeDuration:(double)a3
{
  self->_maximumSwipeDuration = a3;
}

- (BOOL)ignoreHIDEdgeFlags
{
  return self->_ignoreHIDEdgeFlags;
}

- (void)setIgnoreHIDEdgeFlags:(BOOL)a3
{
  self->_ignoreHIDEdgeFlags = a3;
}

@end

@implementation _UIZoomEdgeFeedbackGenerator

- (_UIZoomEdgeFeedbackGenerator)init
{
  void *v3;
  _UIZoomEdgeFeedbackGenerator *v4;

  +[_UIEdgeFeedbackGeneratorConfiguration _zoomConfiguration](_UIEdgeFeedbackGeneratorConfiguration, "_zoomConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIEdgeFeedbackGenerator initWithConfiguration:view:](self, "initWithConfiguration:view:", v3, 0);

  return v4;
}

- (_UIZoomEdgeFeedbackGenerator)initWithView:(id)a3
{
  id v4;
  void *v5;
  _UIZoomEdgeFeedbackGenerator *v6;

  v4 = a3;
  +[_UIEdgeFeedbackGeneratorConfiguration _zoomConfiguration](_UIEdgeFeedbackGeneratorConfiguration, "_zoomConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIEdgeFeedbackGenerator initWithConfiguration:view:](self, "initWithConfiguration:view:", v5, v4);

  return v6;
}

- (void)_updateMaximumValue
{
  -[_UIEdgeFeedbackGenerator setDistance:](self, "setDistance:", (double)log(self->_maximumZoomScale / self->_minimumZoomScale));
}

- (void)setMinimumZoomScale:(double)a3
{
  if (self->_minimumZoomScale != a3)
  {
    self->_minimumZoomScale = a3;
    -[_UIZoomEdgeFeedbackGenerator _updateMaximumValue](self, "_updateMaximumValue");
  }
}

- (void)setMaximumZoomScale:(double)a3
{
  if (self->_maximumZoomScale != a3)
  {
    self->_maximumZoomScale = a3;
    -[_UIZoomEdgeFeedbackGenerator _updateMaximumValue](self, "_updateMaximumValue");
  }
}

- (void)zoomScaleUpdated:(double)a3 atLocation:(CGPoint)a4
{
  -[_UIZoomEdgeFeedbackGenerator _zoomScaleUpdated:withVelocity:atLocation:](self, "_zoomScaleUpdated:withVelocity:atLocation:", a3, 0.0, a4.x, a4.y);
}

- (void)zoomScaleUpdated:(double)a3
{
  -[_UIZoomEdgeFeedbackGenerator _zoomScaleUpdated:withVelocity:atLocation:](self, "_zoomScaleUpdated:withVelocity:atLocation:", a3, 0.0, 1.79769313e308, 1.79769313e308);
}

- (void)_zoomScaleUpdated:(double)a3 withVelocity:(double)a4 atLocation:(CGPoint)a5
{
  double y;
  double x;
  double minimumZoomScale;
  double v11;
  double v12;

  y = a5.y;
  x = a5.x;
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled") && -[_UIEdgeFeedbackGenerator _state](self, "_state"))
  {
    minimumZoomScale = self->_minimumZoomScale;
    v11 = log(a3 / minimumZoomScale);
    if (minimumZoomScale <= a3)
      v12 = -log(self->_minimumTemporaryZoomScale / minimumZoomScale);
    else
      v12 = log(self->_maximumTemporaryZoomScale / self->_maximumZoomScale);
    -[_UIEdgeFeedbackGenerator setExtentBeyondDistance:](self, "setExtentBeyondDistance:", v12);
    if (a4 == 0.0)
      -[_UIEdgeFeedbackGenerator positionUpdated:atLocation:](self, "positionUpdated:atLocation:", v11, x, y);
    else
      -[_UIEdgeFeedbackGenerator _positionUpdated:withVelocity:atLocation:](self, "_positionUpdated:withVelocity:atLocation:", v11, a4, x, y);
  }
}

- (double)minimumZoomScale
{
  return self->_minimumZoomScale;
}

- (double)maximumZoomScale
{
  return self->_maximumZoomScale;
}

- (double)minimumTemporaryZoomScale
{
  return self->_minimumTemporaryZoomScale;
}

- (void)setMinimumTemporaryZoomScale:(double)a3
{
  self->_minimumTemporaryZoomScale = a3;
}

- (double)maximumTemporaryZoomScale
{
  return self->_maximumTemporaryZoomScale;
}

- (void)setMaximumTemporaryZoomScale:(double)a3
{
  self->_maximumTemporaryZoomScale = a3;
}

@end

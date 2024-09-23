@implementation UIGestureRecognizerTransformAnalyzerInfo

- (void)_reset
{
  double v3;
  double v4;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIGestureRecognizerTransformAnalyzerInfo _setTranslation:](self, "_setTranslation:", *MEMORY[0x1E0C9D538], v4);
  -[UIGestureRecognizerTransformAnalyzerInfo _setTranslationMagnitude:](self, "_setTranslationMagnitude:", 0.0);
  -[UIGestureRecognizerTransformAnalyzerInfo _setAbsoluteTranslation:](self, "_setAbsoluteTranslation:", v3, v4);
  -[UIGestureRecognizerTransformAnalyzerInfo _setScale:](self, "_setScale:", 0.0);
  -[UIGestureRecognizerTransformAnalyzerInfo _setRotation:](self, "_setRotation:", 0.0);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendPoint:withName:", CFSTR("translation"), self->_translation.x, self->_translation.y);
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("translationMagnitude"), self->_translationMagnitude);
  v6 = (id)objc_msgSend(v3, "appendPoint:withName:", CFSTR("absoluteTranslation"), self->_absoluteTranslation.x, self->_absoluteTranslation.y);
  v7 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("scale"), self->_scale);
  v8 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("rotation"), self->_rotation);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGPoint)translation
{
  double x;
  double y;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

- (double)translationMagnitude
{
  return self->_translationMagnitude;
}

- (void)_setTranslationMagnitude:(double)a3
{
  self->_translationMagnitude = a3;
}

- (CGPoint)absoluteTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_absoluteTranslation.x;
  y = self->_absoluteTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setAbsoluteTranslation:(CGPoint)a3
{
  self->_absoluteTranslation = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)_setScale:(double)a3
{
  self->_scale = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)_setRotation:(double)a3
{
  self->_rotation = a3;
}

@end

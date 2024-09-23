@implementation VUIPointAnimationAction

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_animationToRun && self->_key)
  {
    v6 = v9;
    objc_msgSend(v6, "valueForKey:", self->_key);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", self->_fromPoint.x, self->_fromPoint.y);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CABasicAnimation setFromValue:](self->_animationToRun, "setFromValue:", v8);

      -[CABasicAnimation setToValue:](self->_animationToRun, "setToValue:", v7);
      objc_msgSend(v6, "addAnimation:forKey:", self->_animationToRun, self->_key);
    }

  }
}

- (CABasicAnimation)animationToRun
{
  return self->_animationToRun;
}

- (void)setAnimationToRun:(id)a3
{
  objc_storeStrong((id *)&self->_animationToRun, a3);
}

- (CGPoint)fromPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_fromPoint.x;
  y = self->_fromPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFromPoint:(CGPoint)a3
{
  self->_fromPoint = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_animationToRun, 0);
}

@end

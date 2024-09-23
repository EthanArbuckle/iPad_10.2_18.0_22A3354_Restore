@implementation VUIRectAnimationAction

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
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", self->_fromRect.origin.x, self->_fromRect.origin.y, self->_fromRect.size.width, self->_fromRect.size.height);
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

- (CGRect)fromRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fromRect.origin.x;
  y = self->_fromRect.origin.y;
  width = self->_fromRect.size.width;
  height = self->_fromRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFromRect:(CGRect)a3
{
  self->_fromRect = a3;
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

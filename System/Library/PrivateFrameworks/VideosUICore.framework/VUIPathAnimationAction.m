@implementation VUIPathAnimationAction

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
  NSString *key;
  id v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_animationToRun)
    {
      key = self->_key;
      if (key)
      {
        v7 = v9;
        v8 = objc_msgSend(v7, "valueForKey:", key);
        -[CABasicAnimation setFromValue:](self->_animationToRun, "setFromValue:", self->_fromPath);
        -[CABasicAnimation setToValue:](self->_animationToRun, "setToValue:", v8);
        objc_msgSend(v7, "addAnimation:forKey:", self->_animationToRun, self->_key);

      }
    }
  }

}

- (void)setFromPath:(CGPath *)a3
{
  CGPathRetain(a3);
  CGPathRelease(self->_fromPath);
  self->_fromPath = a3;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_fromPath);
  v3.receiver = self;
  v3.super_class = (Class)VUIPathAnimationAction;
  -[VUIPathAnimationAction dealloc](&v3, sel_dealloc);
}

- (CABasicAnimation)animationToRun
{
  return self->_animationToRun;
}

- (void)setAnimationToRun:(id)a3
{
  objc_storeStrong((id *)&self->_animationToRun, a3);
}

- (CGPath)fromPath
{
  return self->_fromPath;
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

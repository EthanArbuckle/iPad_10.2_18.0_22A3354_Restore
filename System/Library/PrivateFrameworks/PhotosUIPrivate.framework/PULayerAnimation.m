@implementation PULayerAnimation

- (PULayerAnimation)init
{
  return -[PULayerAnimation initWithLayer:key:](self, "initWithLayer:key:", 0, 0);
}

- (PULayerAnimation)initWithLayer:(id)a3 key:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PULayerAnimation *v11;
  PULayerAnimation *v12;
  uint64_t v13;
  NSString *key;
  uint64_t v15;
  CAAnimation *animation;
  float v17;
  double v18;
  double v19;
  void *v21;
  void *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayerAnimation.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layer != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayerAnimation.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)PULayerAnimation;
  v11 = -[PULayerAnimation init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_layer, a3);
    v13 = objc_msgSend(v10, "copy");
    key = v12->_key;
    v12->_key = (NSString *)v13;

    objc_msgSend(v8, "animationForKey:", v12->_key);
    v15 = objc_claimAutoreleasedReturnValue();
    animation = v12->__animation;
    v12->__animation = (CAAnimation *)v15;

    -[CAAnimation speed](v12->__animation, "speed");
    v12->_speed = v17;
    -[CAAnimation timeOffset](v12->__animation, "timeOffset");
    v12->_timeOffset = v18;
    -[CAAnimation beginTime](v12->__animation, "beginTime");
    v12->_beginTime = v19;
    v12->_isAnimationRunning = v12->_speed > 0.0;
  }

  return v12;
}

- (BOOL)isReadyToComplete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PULayerAnimation;
  if (-[PUAnimationGroup isReadyToComplete](&v10, sel_isReadyToComplete))
  {
    -[PULayerAnimation _animation](self, "_animation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && self->_isAnimationRunning)
    {
      -[PULayerAnimation layer](self, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PULayerAnimation key](self, "key");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "animationForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v3 == v6;

      v8 = !v7;
    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

- (void)setSpeed:(float)a3 timeOffset:(double)a4 beginTime:(double)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  id v15;

  -[PULayerAnimation _animation](self, "_animation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v15 = v9;
    -[PULayerAnimation layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULayerAnimation key](self, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "animationForKey:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v12)
    {
      if (a3 == 0.0)
      {
        if (a4 < 0.0)
          a4 = 0.0;
        objc_msgSend(v15, "duration");
        v14 = v13 + -0.01;
        if (a4 >= v14)
          a4 = v14;
      }
      if (self->_speed != a3 || a4 != self->_timeOffset || self->_beginTime != a5)
      {
        self->_speed = a3;
        self->_timeOffset = a4;
        self->_beginTime = a5;
        -[PULayerAnimation _updateLayerAnimation](self, "_updateLayerAnimation");
      }
    }
    else
    {
      self->_isAnimationRunning = 0;
      -[PULayerAnimation _setAnimation:](self, "_setAnimation:", 0);
    }

    v9 = v15;
  }

}

- (void)finishImmediately
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PULayerAnimation;
  -[PUAnimationGroup finishImmediately](&v7, sel_finishImmediately);
  -[PULayerAnimation _animation](self, "_animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PULayerAnimation layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PULayerAnimation key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v6)
    objc_msgSend(v4, "removeAnimationForKey:", v5);

}

- (void)_updateLayerAnimation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  -[PULayerAnimation _animation](self, "_animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  *(float *)&v5 = self->_speed;
  objc_msgSend(v4, "setSpeed:", v5);
  objc_msgSend(v4, "setTimeOffset:", self->_timeOffset);
  objc_msgSend(v4, "setBeginTime:", self->_beginTime);
  objc_msgSend(v4, "setDelegate:", self);
  -[PULayerAnimation layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PULayerAnimation key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAnimationForKey:", v7);
  objc_msgSend(v6, "addAnimation:forKey:", v4, v7);
  objc_msgSend(v6, "animationForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PULayerAnimation _setAnimation:](self, "_setAnimation:", v8);
}

- (void)animationDidStart:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PULayerAnimation _animation](self, "_animation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    self->_isAnimationRunning = 1;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[PULayerAnimation _animation](self, "_animation");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    self->_isAnimationRunning = 0;
    -[PUAnimationGroup completeIfNeeded](self, "completeIfNeeded");
    -[PULayerAnimation _setAnimation:](self, "_setAnimation:", 0);
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PULayerAnimation layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PULayerAnimation key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; layer: %@; key: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (CALayer)layer
{
  return self->_layer;
}

- (NSString)key
{
  return self->_key;
}

- (CAAnimation)_animation
{
  return self->__animation;
}

- (void)_setAnimation:(id)a3
{
  objc_storeStrong((id *)&self->__animation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animation, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end

@implementation SXComponentAnimationHandler

- (SXComponentAnimationHandler)initWithComponent:(id)a3 withAnimation:(id)a4
{
  id v7;
  id v8;
  SXComponentAnimationHandler *v9;
  SXComponentAnimationHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXComponentAnimationHandler;
  v9 = -[SXComponentAnimationHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_component, a3);
    objc_storeStrong((id *)&v10->_animation, a4);
    v10->_state = 1;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentAnimationHandler component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    objc_msgSend(v4, "animation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentAnimationHandler animation](self, "animation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 == v9;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)prepareAnimation
{
  void *v3;
  id v4;

  -[SXComponentAnimationHandler component](self, "component");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentAnimationHandler animation](self, "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationDidStart:", v3);

}

- (void)startAnimation
{
  -[SXComponentAnimationHandler setState:](self, "setState:", 3);
}

- (double)factorForVisibileBounds:(CGRect)a3 andAbsoluteComponentRect:(CGRect)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double MinY;
  double v11;
  double v12;
  double v13;
  CGFloat width;
  CGFloat height;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v6 = a3.size.height;
  v7 = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  MinY = CGRectGetMinY(a3);
  v17.origin.x = v9;
  v17.origin.y = v8;
  v17.size.width = v7;
  v17.size.height = v6;
  v11 = MinY + CGRectGetHeight(v17) * 0.75;
  v18.origin.x = v9;
  v18.origin.y = v8;
  v18.size.width = v7;
  v18.size.height = v6;
  v12 = CGRectGetMinY(v18);
  v19.origin.x = v9;
  v19.origin.y = v8;
  v19.size.width = v7;
  v19.size.height = v6;
  v13 = v12 + CGRectGetHeight(v19) * 0.25;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  return fmin(fmax(1.0 - (CGRectGetMinY(v20) - v13) / (v11 - v13), 0.0), 1.0);
}

- (double)screenHeightStartOffset
{
  return 0.25;
}

- (void)updateAnimationWithFactor:(double)a3
{
  self->_factor = a3;
  if (-[SXComponentAnimationHandler state](self, "state") != 2)
    -[SXComponentAnimationHandler setState:](self, "setState:", 2);
}

- (void)finishAnimation
{
  void *v3;
  id v4;

  -[SXComponentAnimationHandler setState:](self, "setState:", 4);
  -[SXComponentAnimationHandler component](self, "component");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentAnimationHandler animation](self, "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationDidFinish:", v3);

}

- (BOOL)animationShouldRepeat
{
  return 0;
}

- (BOOL)shouldFinishAtEndOfScrollView
{
  return 1;
}

- (void)setState:(int64_t)a3
{
  void *v5;
  void *v6;

  if (a3 == 2)
  {
    -[SXComponentAnimationHandler component](self, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentAnimationHandler animation](self, "animation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationDidStart:", v6);

  }
  self->_state = a3;
}

- (SXComponentView)component
{
  return self->_component;
}

- (SXComponentAnimation)animation
{
  return self->_animation;
}

- (int64_t)state
{
  return self->_state;
}

- (double)factor
{
  return self->_factor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end

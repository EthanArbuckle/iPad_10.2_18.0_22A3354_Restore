@implementation _UIViewControllerTransitionCoordinatorContextDescription

+ (id)descriptionForTransitionCoordinatorContext:(id)a3
{
  id v4;
  id v5;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setAnimated:", objc_msgSend(v4, "isAnimated"));
  objc_msgSend(v5, "setInteractive:", objc_msgSend(v4, "isInteractive"));
  objc_msgSend(v5, "setCancelled:", objc_msgSend(v4, "isCancelled"));
  objc_msgSend(v4, "transitionDuration");
  objc_msgSend(v5, "setTransitionDuration:");
  objc_msgSend(v4, "percentComplete");
  objc_msgSend(v5, "setPercentComplete:");
  objc_msgSend(v4, "completionVelocity");
  objc_msgSend(v5, "setCompletionVelocity:");
  objc_msgSend(v5, "setCompletionCurve:", objc_msgSend(v4, "completionCurve"));
  if (v4)
  {
    objc_msgSend(v4, "targetTransform");
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
  }
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  objc_msgSend(v5, "setTargetTransform:", v7);
  objc_msgSend(v5, "setToOrientation:", 0);
  objc_msgSend(v5, "setFromOrientation:", 0);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  CGAffineTransform v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription isAnimated](self, "isAnimated"), CFSTR("_UIViewControllerTransitionCoordinatorDescriptionIsAnimatedKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription isInteractive](self, "isInteractive"), CFSTR("_UIViewControllerTransitionCoordinatorDescriptionIsInteractiveKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription isCancelled](self, "isCancelled"), CFSTR("_UIViewControllerTransitionCoordinatorDescriptionIsCancelledKey"));
  -[_UIViewControllerTransitionCoordinatorContextDescription transitionDuration](self, "transitionDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionTransitionDurationKey"));
  -[_UIViewControllerTransitionCoordinatorContextDescription percentComplete](self, "percentComplete");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionPercentCompleteKey"));
  -[_UIViewControllerTransitionCoordinatorContextDescription completionVelocity](self, "completionVelocity");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionCompletionVelocityKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription completionCurve](self, "completionCurve"), CFSTR("_UIViewControllerTransitionCoordinatorDescriptionCompletionCurveKey"));
  -[_UIViewControllerTransitionCoordinatorContextDescription targetTransform](self, "targetTransform");
  NSStringFromCGAffineTransform(&v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_UIViewControllerTransitionCoordinatorDescriptionTargetTransformKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription toOrientation](self, "toOrientation"), CFSTR("_UIViewControllerTransitionCoordinatorDescriptionToOrientationKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIViewControllerTransitionCoordinatorContextDescription fromOrientation](self, "fromOrientation"), CFSTR("_UIViewControllerTransitionCoordinatorDescriptionFromOrientationKey"));

}

- (_UIViewControllerTransitionCoordinatorContextDescription)initWithCoder:(id)a3
{
  id v4;
  _UIViewControllerTransitionCoordinatorContextDescription *v5;
  NSString *v6;
  _UIViewControllerTransitionCoordinatorContextDescription *v7;
  CGAffineTransform v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIViewControllerTransitionCoordinatorContextDescription;
  v5 = -[_UIViewControllerTransitionCoordinatorContextDescription init](&v10, sel_init);
  if (v5)
  {
    -[_UIViewControllerTransitionCoordinatorContextDescription setAnimated:](v5, "setAnimated:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionIsAnimatedKey")));
    -[_UIViewControllerTransitionCoordinatorContextDescription setInteractive:](v5, "setInteractive:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionIsInteractiveKey")));
    -[_UIViewControllerTransitionCoordinatorContextDescription setCancelled:](v5, "setCancelled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionIsCancelledKey")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionTransitionDurationKey"));
    -[_UIViewControllerTransitionCoordinatorContextDescription setTransitionDuration:](v5, "setTransitionDuration:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionPercentCompleteKey"));
    -[_UIViewControllerTransitionCoordinatorContextDescription setPercentComplete:](v5, "setPercentComplete:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionCompletionVelocityKey"));
    -[_UIViewControllerTransitionCoordinatorContextDescription setCompletionVelocity:](v5, "setCompletionVelocity:");
    -[_UIViewControllerTransitionCoordinatorContextDescription setCompletionCurve:](v5, "setCompletionCurve:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionCompletionCurveKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UIViewControllerTransitionCoordinatorDescriptionTargetTransformKey"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformFromString(&v9, v6);
    -[_UIViewControllerTransitionCoordinatorContextDescription setTargetTransform:](v5, "setTargetTransform:", &v9);

    -[_UIViewControllerTransitionCoordinatorContextDescription setToOrientation:](v5, "setToOrientation:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionToOrientationKey")));
    -[_UIViewControllerTransitionCoordinatorContextDescription setFromOrientation:](v5, "setFromOrientation:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_UIViewControllerTransitionCoordinatorDescriptionFromOrientationKey")));
    v7 = v5;
  }

  return v5;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (double)completionVelocity
{
  return self->_completionVelocity;
}

- (void)setCompletionVelocity:(double)a3
{
  self->_completionVelocity = a3;
}

- (int64_t)completionCurve
{
  return self->_completionCurve;
}

- (void)setCompletionCurve:(int64_t)a3
{
  self->_completionCurve = a3;
}

- (CGAffineTransform)targetTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].a;
  return self;
}

- (void)setTargetTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_targetTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_targetTransform.tx = v4;
  *(_OWORD *)&self->_targetTransform.a = v3;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (void)setToOrientation:(int64_t)a3
{
  self->_toOrientation = a3;
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (void)setFromOrientation:(int64_t)a3
{
  self->_fromOrientation = a3;
}

@end

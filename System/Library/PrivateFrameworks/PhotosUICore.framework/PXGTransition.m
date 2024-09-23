@implementation PXGTransition

- (PXGTransition)initWithAnimations:(id)a3 layout:(id)a4
{
  id v7;
  id v8;
  PXGTransition *v9;
  PXGTransition *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXGTransition;
  v9 = -[PXGTransition init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_animations, a3);
    objc_storeStrong((id *)&v10->_layout, a4);
    v10->_isIntercative = 1;
  }

  return v10;
}

- (void)invalidate
{
  self->_invalid = 1;
}

- (void)animateToInitialStateWithCompletionBlock:(id)a3
{
  void *v4;
  id completionBlock;

  *(_WORD *)&self->_animatingTowardsInitialState = 1;
  v4 = (void *)objc_msgSend(a3, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v4;

}

- (void)animateToFinalStateWithCompletionBlock:(id)a3
{
  void *v4;
  id completionBlock;

  *(_WORD *)&self->_animatingTowardsInitialState = 256;
  v4 = (void *)objc_msgSend(a3, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v4;

}

- (void)setFractionCompleted:(float)a3
{
  void *v6;

  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGTransition.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_invalid"));

  }
  if (!self->_animatingTowardsFinalState && !self->_animatingTowardsInitialState)
    self->_fractionCompleted = a3;
}

- (NSSet)animations
{
  return self->_animations;
}

- (float)fractionCompleted
{
  return self->_fractionCompleted;
}

- (PXGLayout)layout
{
  return self->_layout;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (BOOL)animatingTowardsInitialState
{
  return self->_animatingTowardsInitialState;
}

- (BOOL)animatingTowardsFinalState
{
  return self->_animatingTowardsFinalState;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (BOOL)isIntercative
{
  return self->_isIntercative;
}

- (void)setIsIntercative:(BOOL)a3
{
  self->_isIntercative = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

@end

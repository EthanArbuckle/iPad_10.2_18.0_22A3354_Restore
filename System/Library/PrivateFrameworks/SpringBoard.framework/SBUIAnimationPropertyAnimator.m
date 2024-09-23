@implementation SBUIAnimationPropertyAnimator

- (SBUIAnimationPropertyAnimator)initWithPropertyAnimatorGenerator:(id)a3
{
  id v5;
  SBUIAnimationPropertyAnimator *v6;
  uint64_t v7;
  id generator;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationPropertyAnimator.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("generator"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBUIAnimationPropertyAnimator;
  v6 = -[SBUIAnimationPropertyAnimator init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    generator = v6->_generator;
    v6->_generator = (id)v7;

  }
  return v6;
}

- (SBUIAnimationPropertyAnimator)initWithPropertyAnimator:(id)a3 duration:(double)a4
{
  id v8;
  SBUIAnimationPropertyAnimator *v9;
  SBUIAnimationPropertyAnimator *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationPropertyAnimator.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animator"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SBUIAnimationPropertyAnimator;
  v9 = -[SBUIAnimationPropertyAnimator init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_propertyAnimator, a3);
    v10->_duration = a4;
  }

  return v10;
}

- (BOOL)isReversed
{
  void *v2;
  char v3;

  -[SBUIAnimationPropertyAnimator propertyAnimator](self, "propertyAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReversed");

  return v3;
}

- (BOOL)wasReversed
{
  return self->_reverseCount != 0;
}

- (void)reverseAnimation
{
  id v3;

  ++self->_reverseCount;
  -[SBUIAnimationPropertyAnimator propertyAnimator](self, "propertyAnimator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReversed:", -[SBUIAnimationPropertyAnimator isReversed](self, "isReversed") ^ 1);

}

- (void)addCompletion:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *completionBlocks;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;

  v9 = a3;
  -[SBUIAnimationPropertyAnimator propertyAnimator](self, "propertyAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBUIAnimationPropertyAnimator propertyAnimator](self, "propertyAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addCompletion:", v9);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    if (!completionBlocks)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = self->_completionBlocks;
      self->_completionBlocks = v7;

      completionBlocks = self->_completionBlocks;
    }
    v5 = (void *)objc_msgSend(v9, "copy");
    -[NSMutableArray addObject:](completionBlocks, "addObject:", v5);
  }

}

- (double)transitionDuration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[SBUIAnimationPropertyAnimator generator](self, "generator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[SBUIAnimationPropertyAnimator _executeGenerator:](self, "_executeGenerator:", v4);
  -[SBUIAnimationPropertyAnimator duration](self, "duration");
  v7 = v6;

  return v7;
}

- (void)animateTransition:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBUIAnimationPropertyAnimator generator](self, "generator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SBUIAnimationPropertyAnimator _executeGenerator:](self, "_executeGenerator:", v6);
  -[SBUIAnimationPropertyAnimator prepareToRunAnimation:](self, "prepareToRunAnimation:", v6);
  -[SBUIAnimationPropertyAnimator propertyAnimator](self, "propertyAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimation");

  self->_wasStarted = 1;
}

- (void)_executeGenerator:(id)a3
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  UIViewPropertyAnimator *v7;
  UIViewPropertyAnimator *propertyAnimator;
  UIViewPropertyAnimator *v9;
  double v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_propertyAnimator)
  {
    -[SBUIAnimationPropertyAnimator generator](self, "generator");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v5);
    v7 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
    propertyAnimator = self->_propertyAnimator;
    self->_propertyAnimator = v7;

    v9 = self->_propertyAnimator;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationPropertyAnimator.m"), 108, CFSTR("SBUIAnimationPropertyAnimator needs a UIViewPropertyAnimator."));

      v9 = self->_propertyAnimator;
    }
    -[UIViewPropertyAnimator duration](v9, "duration");
    self->_duration = v10;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_completionBlocks;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          -[UIViewPropertyAnimator addCompletion:](self->_propertyAnimator, "addCompletion:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), (_QWORD)v17);
        }
        while (v13 != v15);
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
}

- (UIViewPropertyAnimator)propertyAnimator
{
  return self->_propertyAnimator;
}

- (double)duration
{
  return self->_duration;
}

- (id)generator
{
  return self->_generator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generator, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

@end

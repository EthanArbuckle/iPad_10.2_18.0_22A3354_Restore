@implementation _UICollectionCompositionalLayoutDynamicAnimator

- (id)behaviorForIdentifier:(id *)a1
{
  id *v3;
  void *v5;

  if (a1)
  {
    v3 = a1;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_behaviorForIdentifier_, v3, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3528, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    }
    objc_msgSend(v3[42], "objectForKeyedSubscript:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)_animatorStep:(double)a3
{
  BOOL v4;
  void (**invalidationHandler)(id, _QWORD);
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICollectionCompositionalLayoutDynamicAnimator;
  v4 = -[UIDynamicAnimator _animatorStep:](&v7, sel__animatorStep_, a3);
  invalidationHandler = (void (**)(id, _QWORD))self->_invalidationHandler;
  if (invalidationHandler)
    invalidationHandler[2](invalidationHandler, 0);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemBehaviors, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end

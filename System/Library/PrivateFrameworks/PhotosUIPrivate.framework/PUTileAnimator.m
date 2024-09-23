@implementation PUTileAnimator

- (void)prepareTileControllerForAnimation:(id)a3 withInitialLayoutInfo:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileAnimator.m"), 18, CFSTR("must be implemented by concrete subclass"));

}

- (void)animateTileController:(id)a3 toLayoutInfo:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileAnimator.m"), 22, CFSTR("must be implemented by concrete subclass"));

}

- (void)updateAnimationForTileController:(id)a3 withRepositionedTargetLayoutInfo:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileAnimator.m"), 26, CFSTR("must be implemented by concrete subclass"));

}

- (id)freezeTileController:(id)a3
{
  return (id)objc_msgSend(a3, "freeze");
}

- (void)transitionWillBeginAnimation:(id)a3
{
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransition);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileAnimator.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_currentTransition"), obj);

  }
  objc_storeWeak((id *)&self->_currentTransition, obj);

}

- (void)transitionDidBeginAnimation:(id)a3
{
  PUTilingViewControllerTransition **p_currentTransition;
  id v6;
  id WeakRetained;
  void *v8;

  p_currentTransition = &self->_currentTransition;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_currentTransition);

  if (WeakRetained != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileAnimator.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transition == _currentTransition"));

  }
  objc_storeWeak((id *)p_currentTransition, 0);
}

- (PUTilingViewControllerTransition)currentTransition
{
  return (PUTilingViewControllerTransition *)objc_loadWeakRetained((id *)&self->_currentTransition);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentTransition);
}

@end

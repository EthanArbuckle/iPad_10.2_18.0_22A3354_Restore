@implementation _UIPencilInteractionSqueeze

- (_UIPencilInteractionSqueeze)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPencilInteraction.m"), 613, CFSTR("%s: init is not allowed on %@"), "-[_UIPencilInteractionSqueeze init]", objc_opt_class());

  return 0;
}

- (_UIPencilHoverState)_hoverState
{
  return self->_hoverState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverState, 0);
}

@end

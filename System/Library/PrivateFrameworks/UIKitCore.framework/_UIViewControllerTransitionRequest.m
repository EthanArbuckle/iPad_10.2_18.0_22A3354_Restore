@implementation _UIViewControllerTransitionRequest

- (_UIViewControllerTransitionRequest)initWithTransitionContext:(id)a3 animator:(id)a4 interactor:(id)a5 interactiveUpdateHandler:(id)a6 keyboardShouldAnimateAlongsideForInteractiveTransitions:(BOOL)a7 keyboardAnimationStyle:(id)a8 pinningInputViewsResponder:(id)a9 extraPinningInputViewsBlock:(id)a10 handoffData:(id)a11
{
  id v17;
  id v18;
  id v19;
  _UIViewControllerTransitionRequest *v20;
  _UIViewControllerTransitionRequest *v21;
  void *v22;
  id interactiveUpdateHandler;
  uint64_t v24;
  id extraPinningInputViewsBlock;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a3;
  v31 = a4;
  v30 = a5;
  v17 = a6;
  v29 = a8;
  v28 = a9;
  v18 = a10;
  v19 = a11;
  v33.receiver = self;
  v33.super_class = (Class)_UIViewControllerTransitionRequest;
  v20 = -[_UIViewControllerTransitionRequest init](&v33, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_transitionContext, a3);
    objc_storeStrong((id *)&v21->_animator, a4);
    objc_storeStrong((id *)&v21->_interactor, a5);
    v22 = _Block_copy(v17);
    interactiveUpdateHandler = v21->_interactiveUpdateHandler;
    v21->_interactiveUpdateHandler = v22;

    v21->_keyboardShouldAnimateAlongsideForInteractiveTransitions = a7;
    objc_storeStrong((id *)&v21->_keyboardAnimationStyle, a8);
    objc_storeStrong((id *)&v21->_pinningInputViewsResponder, a9);
    v24 = objc_msgSend(v18, "copy");
    extraPinningInputViewsBlock = v21->_extraPinningInputViewsBlock;
    v21->_extraPinningInputViewsBlock = (id)v24;

    objc_storeStrong((id *)&v21->_handoffData, a11);
  }

  return v21;
}

- (_UIViewControllerOneToOneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (UIViewControllerAnimatedTransitioning)animator
{
  return self->_animator;
}

- (UIViewControllerInteractiveTransitioning)interactor
{
  return self->_interactor;
}

- (id)interactiveUpdateHandler
{
  return self->_interactiveUpdateHandler;
}

- (BOOL)keyboardShouldAnimateAlongsideForInteractiveTransitions
{
  return self->_keyboardShouldAnimateAlongsideForInteractiveTransitions;
}

- (_UIViewControllerKeyboardAnimationStyle)keyboardAnimationStyle
{
  return self->_keyboardAnimationStyle;
}

- (UIResponder)pinningInputViewsResponder
{
  return self->_pinningInputViewsResponder;
}

- (id)extraPinningInputViewsBlock
{
  return self->_extraPinningInputViewsBlock;
}

- (_UIViewControllerAnimatedTransitionHandoffData)handoffData
{
  return self->_handoffData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffData, 0);
  objc_storeStrong(&self->_extraPinningInputViewsBlock, 0);
  objc_storeStrong((id *)&self->_pinningInputViewsResponder, 0);
  objc_storeStrong((id *)&self->_keyboardAnimationStyle, 0);
  objc_storeStrong(&self->_interactiveUpdateHandler, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end

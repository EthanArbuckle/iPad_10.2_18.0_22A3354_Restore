@implementation _UINavigationControllerVisualStyleIOS

- (_UINavigationControllerVisualStyleIOS)initWithNavigationController:(id)a3
{
  id v4;
  _UINavigationControllerVisualStyleIOS *v5;
  _UINavigationParallaxTransition *v6;
  _UINavigationParallaxTransition *transitionController;
  _UINavigationInteractiveTransition *v8;
  _UINavigationInteractiveTransition *interactionController;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UINavigationControllerVisualStyleIOS;
  v5 = -[_UINavigationControllerVisualStyle initWithNavigationController:](&v13, sel_initWithNavigationController_, v4);
  if (v5)
  {
    v6 = -[_UINavigationParallaxTransition initWithCurrentOperation:]([_UINavigationParallaxTransition alloc], "initWithCurrentOperation:", 0);
    transitionController = v5->_transitionController;
    v5->_transitionController = v6;

    v8 = -[_UINavigationInteractiveTransition initWithViewController:animator:]([_UINavigationInteractiveTransition alloc], "initWithViewController:animator:", v4, 0);
    interactionController = v5->_interactionController;
    v5->_interactionController = v8;

    objc_msgSend(v4, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationInteractiveTransition _setShouldReverseLayoutDirection:](v5->_interactionController, "_setShouldReverseLayoutDirection:", objc_msgSend(v10, "_shouldReverseLayoutDirection"));

    objc_msgSend(v4, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationParallaxTransition _setShouldReverseLayoutDirection:](v5->_transitionController, "_setShouldReverseLayoutDirection:", objc_msgSend(v11, "_shouldReverseLayoutDirection"));

  }
  return v5;
}

- (id)interactionController
{
  return self->_interactionController;
}

- (void)layoutContainerViewSemanticContentAttributeChanged:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[_UINavigationInteractiveTransition _setShouldReverseLayoutDirection:](self->_interactionController, "_setShouldReverseLayoutDirection:", objc_msgSend(v4, "_shouldReverseLayoutDirection"));
  v5 = objc_msgSend(v4, "_shouldReverseLayoutDirection");

  -[_UINavigationParallaxTransition _setShouldReverseLayoutDirection:](self->_transitionController, "_setShouldReverseLayoutDirection:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionController, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
}

- (void)updateTransitionControllerWithOperation:(int64_t)a3
{
  _UINavigationParallaxTransition *transitionController;
  _UINavigationParallaxTransition *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_UINavigationControllerVisualStyle navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationParallaxTransition setOperation:](self->_transitionController, "setOperation:", a3);
  -[_UINavigationParallaxTransition setClipUnderlapWhileTransitioning:](self->_transitionController, "setClipUnderlapWhileTransitioning:", objc_msgSend(v10, "_clipUnderlapWhileTransitioning"));
  -[_UINavigationParallaxTransition setTransitionStyle:](self->_transitionController, "setTransitionStyle:", objc_msgSend(v10, "_builtinTransitionStyle"));
  transitionController = self->_transitionController;
  objc_msgSend(v10, "_builtinTransitionGap");
  -[_UINavigationParallaxTransition setTransitionGap:](transitionController, "setTransitionGap:");
  v6 = self->_transitionController;
  objc_msgSend(v10, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationParallaxTransition _setShouldReverseLayoutDirection:](v6, "_setShouldReverseLayoutDirection:", objc_msgSend(v7, "_shouldReverseLayoutDirection"));

  objc_msgSend(v10, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "_navigationControllerDimmingColorForParallaxTransition:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationParallaxTransition setOverrideDimmingColor:](self->_transitionController, "setOverrideDimmingColor:", v9);

  }
}

- (BOOL)isUsingParallaxTransition
{
  return 1;
}

- (id)transitionController
{
  return self->_transitionController;
}

@end

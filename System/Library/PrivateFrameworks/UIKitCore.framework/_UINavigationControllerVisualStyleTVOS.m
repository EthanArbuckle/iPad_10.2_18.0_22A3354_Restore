@implementation _UINavigationControllerVisualStyleTVOS

- (_UINavigationControllerVisualStyleTVOS)initWithNavigationController:(id)a3
{
  _UINavigationControllerVisualStyleTVOS *v3;
  _UINavigationCrossfadeAnimator *v4;
  _UINavigationCrossfadeAnimator *transitionController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UINavigationControllerVisualStyleTVOS;
  v3 = -[_UINavigationControllerVisualStyle initWithNavigationController:](&v7, sel_initWithNavigationController_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(_UINavigationCrossfadeAnimator);
    transitionController = v3->_transitionController;
    v3->_transitionController = v4;

  }
  return v3;
}

- (id)transitionController
{
  return self->_transitionController;
}

- (BOOL)isUsingParallaxTransition
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionController, 0);
}

@end

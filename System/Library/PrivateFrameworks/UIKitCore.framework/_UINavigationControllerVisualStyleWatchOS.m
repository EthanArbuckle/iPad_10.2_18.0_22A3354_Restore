@implementation _UINavigationControllerVisualStyleWatchOS

- (id)transitionController
{
  return self->_transitionController;
}

- (id)interactionController
{
  return self->_interactionController;
}

- (void)setTransitionController:(id)a3
{
  objc_storeStrong((id *)&self->_transitionController, a3);
}

- (void)setInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_interactionController, a3);
}

- (BOOL)isUsingParallaxTransition
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionController, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
}

@end

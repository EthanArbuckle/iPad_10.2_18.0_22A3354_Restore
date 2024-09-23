@implementation _PXWidgetCompositionUIViewElementTileTransitionContext

- (PXBasicTileAnimationOptions)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_animationOptions, a3);
}

- (id)alongsideAnimation
{
  return self->_alongsideAnimation;
}

- (void)setAlongsideAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)alongsideAnimationCompletion
{
  return self->_alongsideAnimationCompletion;
}

- (void)setAlongsideAnimationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alongsideAnimationCompletion, 0);
  objc_storeStrong(&self->_alongsideAnimation, 0);
  objc_storeStrong((id *)&self->_animationOptions, 0);
}

@end

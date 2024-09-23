@implementation SBSystemApertureSceneElementTransitionParameters

- (BOOL)shouldSetForeground
{
  return self->_shouldSetForeground;
}

- (void)setShouldSetForeground:(BOOL)a3
{
  self->_shouldSetForeground = a3;
}

- (CGSize)sceneSize
{
  double width;
  double height;
  CGSize result;

  width = self->_sceneSize.width;
  height = self->_sceneSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSceneSize:(CGSize)a3
{
  self->_sceneSize = a3;
}

- (BOOL)wantsForeground
{
  return self->_wantsForeground;
}

- (void)setWantsForeground:(BOOL)a3
{
  self->_wantsForeground = a3;
}

- (UIApplicationSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (BSSettings)otherSystemApertureSceneSettingsToApply
{
  return self->_otherSystemApertureSceneSettingsToApply;
}

- (void)setOtherSystemApertureSceneSettingsToApply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherSystemApertureSceneSettingsToApply, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end

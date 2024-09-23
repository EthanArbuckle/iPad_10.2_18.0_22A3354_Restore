@implementation SBUISystemApertureSceneResizeAction

+ (id)sceneResizeActionWithAnimationParameters:(id)a3
{
  id v3;
  SBUISystemApertureSceneResizeAction *v4;

  v3 = a3;
  v4 = -[SBUISystemApertureSceneResizeAction initWithAnimationParameters:]([SBUISystemApertureSceneResizeAction alloc], "initWithAnimationParameters:", v3);

  return v4;
}

+ (id)transientLocalResizeSceneActionWithAnimationParameters:(id)a3
{
  id v3;
  _SBUISystemApertureTransientLocalSceneResizeAction *v4;

  v3 = a3;
  v4 = -[SBUISystemApertureSceneResizeAction initWithAnimationParameters:]([_SBUISystemApertureTransientLocalSceneResizeAction alloc], "initWithAnimationParameters:", v3);

  return v4;
}

+ (id)userInitiatedSceneResizeActionWithAnimationParameters:(id)a3
{
  id v3;
  _SBUISystemApertureUserInitiatedSceneResizeAction *v4;

  v3 = a3;
  v4 = -[SBUISystemApertureSceneResizeAction initWithAnimationParameters:]([_SBUISystemApertureUserInitiatedSceneResizeAction alloc], "initWithAnimationParameters:", v3);

  return v4;
}

- (SBUISystemApertureSceneResizeAction)initWithAnimationParameters:(id)a3
{
  SBUISystemApertureAnimationParameters *v4;
  void *v5;
  SBUISystemApertureSceneResizeAction *v6;
  objc_super v8;

  v4 = (SBUISystemApertureAnimationParameters *)a3;
  -[SBUISystemApertureAnimationParameters BSSettingsRepresentation](v4, "BSSettingsRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SBUISystemApertureSceneResizeAction;
  v6 = -[SBUISystemApertureSceneResizeAction initWithInfo:responder:](&v8, sel_initWithInfo_responder_, v5, 0);

  if (v6)
  {
    if (!v4)
      v4 = -[SBUISystemApertureAnimationParameters initWithFluidBehaviorSettings:tracking:retargeted:]([SBUISystemApertureAnimationParameters alloc], "initWithFluidBehaviorSettings:tracking:retargeted:", 0, 0, 0);
    objc_storeStrong((id *)&v6->_animationParameters, v4);
  }

  return v6;
}

- (SBUISystemApertureAnimationParameters)animationParameters
{
  SBUISystemApertureAnimationParameters *animationParameters;
  SBUISystemApertureAnimationParameters *v4;
  void *v5;
  SBUISystemApertureAnimationParameters *v6;
  SBUISystemApertureAnimationParameters *v7;

  animationParameters = self->_animationParameters;
  if (!animationParameters)
  {
    v4 = [SBUISystemApertureAnimationParameters alloc];
    -[SBUISystemApertureSceneResizeAction info](self, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBUISystemApertureAnimationParameters initWithBSSettingsRepresentation:](v4, "initWithBSSettingsRepresentation:", v5);
    v7 = self->_animationParameters;
    self->_animationParameters = v6;

    animationParameters = self->_animationParameters;
  }
  return animationParameters;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (BOOL)isTransientLocal
{
  return self->_transientLocal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationParameters, 0);
}

@end

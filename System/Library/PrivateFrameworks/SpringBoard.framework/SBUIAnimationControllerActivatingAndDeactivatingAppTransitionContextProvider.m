@implementation SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider

+ (id)transitionContextProviderWithToApplicationSceneEntity:(id)a3 fromApplicationSceneEntity:(id)a4
{
  id v5;
  id v6;
  SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider initWithToApplicationSceneEntity:fromApplicationSceneEntity:]([SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider alloc], "initWithToApplicationSceneEntity:fromApplicationSceneEntity:", v6, v5);

  return v7;
}

- (SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider)initWithToApplicationSceneEntity:(id)a3 fromApplicationSceneEntity:(id)a4
{
  id v7;
  id v8;
  SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider *v9;
  SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider;
  v9 = -[SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_toAppSceneEntity, a3);
    objc_storeStrong((id *)&v10->_fromAppSceneEntity, a4);
  }

  return v10;
}

- (NSSet)toApplicationSceneEntities
{
  if (self->_toAppSceneEntity)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSSet)fromApplicationSceneEntities
{
  if (self->_fromAppSceneEntity)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBApplicationSceneEntity)activatingAppSceneEntity
{
  return self->_toAppSceneEntity;
}

- (void)setActivatingAppSceneEntity:(id)a3
{
  objc_storeStrong((id *)&self->_toAppSceneEntity, a3);
}

- (SBApplicationSceneEntity)deactivatingAppSceneEntity
{
  return self->_fromAppSceneEntity;
}

- (void)setDeactivatingAppSceneEntity:(id)a3
{
  objc_storeStrong((id *)&self->_fromAppSceneEntity, a3);
}

- (SBApplicationSceneEntity)toApplicationSceneEntity
{
  return self->_toApplicationSceneEntity;
}

- (SBApplicationSceneEntity)fromApplicationSceneEntity
{
  return self->_fromApplicationSceneEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromApplicationSceneEntity, 0);
  objc_storeStrong((id *)&self->_toApplicationSceneEntity, 0);
  objc_storeStrong((id *)&self->_fromAppSceneEntity, 0);
  objc_storeStrong((id *)&self->_toAppSceneEntity, 0);
}

@end

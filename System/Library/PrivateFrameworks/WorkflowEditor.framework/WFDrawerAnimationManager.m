@implementation WFDrawerAnimationManager

- (id)defaultHeightAnimation
{
  if (defaultHeightAnimation_onceToken != -1)
    dispatch_once(&defaultHeightAnimation_onceToken, &__block_literal_global_3726);
  return (id)defaultHeightAnimation_defaultAnimation;
}

- (WFDrawerAnimation)heightAnimation
{
  WFDrawerAnimation *heightAnimation;

  heightAnimation = self->_heightAnimation;
  if (heightAnimation)
    return heightAnimation;
  -[WFDrawerAnimationManager defaultHeightAnimation](self, "defaultHeightAnimation");
  return (WFDrawerAnimation *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)pushHeightAnimation:(id)a3
{
  id v6;
  unint64_t heightAnimationPushCount;
  void *v8;
  id v9;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDrawerAnimationManager.m"), 228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animation"));

    v6 = 0;
  }
  heightAnimationPushCount = self->_heightAnimationPushCount;
  self->_heightAnimationPushCount = heightAnimationPushCount + 1;
  if (!heightAnimationPushCount)
  {
    v9 = v6;
    objc_storeStrong((id *)&self->_heightAnimation, a3);
    v6 = v9;
  }

}

- (void)popHeightAnimation
{
  unint64_t heightAnimationPushCount;
  unint64_t v4;
  WFDrawerAnimation *heightAnimation;
  void *v7;

  heightAnimationPushCount = self->_heightAnimationPushCount;
  if (!heightAnimationPushCount)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDrawerAnimationManager.m"), 238, CFSTR("Calls to popHeightAnimation must mirror push calls"));

    heightAnimationPushCount = self->_heightAnimationPushCount;
  }
  v4 = heightAnimationPushCount - 1;
  self->_heightAnimationPushCount = v4;
  if (!v4)
  {
    heightAnimation = self->_heightAnimation;
    self->_heightAnimation = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightAnimation, 0);
}

void __50__WFDrawerAnimationManager_defaultHeightAnimation__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[WFDrawerAnimation animationUsingDefaultSpringWithInitialVelocity:delay:](WFDrawerAnimation, "animationUsingDefaultSpringWithInitialVelocity:delay:", 0.0, 0.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultHeightAnimation_defaultAnimation;
  defaultHeightAnimation_defaultAnimation = v0;

}

@end

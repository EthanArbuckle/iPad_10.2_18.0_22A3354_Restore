@implementation SBUIBlockAnimationController

uint64_t __47__SBUIBlockAnimationController__startAnimation__block_invoke(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "_noteAnimationDidFinish");
  else
    return objc_msgSend(v2, "_noteAnimationDidFail");
}

- (SBUIBlockAnimationController)initWithWorkspaceTransitionRequest:(id)a3 animationSettings:(id)a4 animationBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBUIBlockAnimationController *v12;
  void *v13;
  uint64_t v14;
  id animationBlock;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBlockAnimationController.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animationBlock"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SBUIBlockAnimationController;
  v12 = -[SBUIWorkspaceAnimationController initWithWorkspaceTransitionRequest:](&v18, sel_initWithWorkspaceTransitionRequest_, v9);
  if (v12)
  {
    v13 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v12->_animationSettings, v13);
    if (!v10)

    v14 = objc_msgSend(v11, "copy");
    animationBlock = v12->_animationBlock;
    v12->_animationBlock = (id)v14;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationBlock, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

- (id)animationSettings
{
  return self->_animationSettings;
}

- (void)_startAnimation
{
  void (**animationBlock)(id, SBUIBlockAnimationController *, void *, BSAnimationSettings *, _QWORD *);
  void *v4;
  BSAnimationSettings *animationSettings;
  id v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[5];

  animationBlock = (void (**)(id, SBUIBlockAnimationController *, void *, BSAnimationSettings *, _QWORD *))self->_animationBlock;
  if (animationBlock)
  {
    -[SBUIWorkspaceAnimationController workspaceTransitionRequest](self, "workspaceTransitionRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    animationSettings = self->_animationSettings;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__SBUIBlockAnimationController__startAnimation__block_invoke;
    v9[3] = &unk_1E8E9E980;
    v9[4] = self;
    animationBlock[2](animationBlock, self, v4, animationSettings, v9);

    v6 = self->_animationBlock;
    self->_animationBlock = 0;

  }
  else
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Animation ran with a nil animation block", v8, 2u);
    }

    -[SBUIAnimationController _noteAnimationDidFail](self, "_noteAnimationDidFail");
  }
}

- (void)_didComplete
{
  id animationBlock;
  objc_super v4;

  animationBlock = self->_animationBlock;
  self->_animationBlock = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBUIBlockAnimationController;
  -[SBUIBlockAnimationController _didComplete](&v4, sel__didComplete);
}

- (SBUIBlockAnimationController)initWithWorkspaceTransitionRequest:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99750];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%s is not a valid initializer. You must call -[%@ initWithWorkspaceTransitionRequest:animationSettings:animationBlock:]."), "-[SBUIBlockAnimationController initWithWorkspaceTransitionRequest:]", v7);

  return -[SBUIBlockAnimationController initWithWorkspaceTransitionRequest:animationSettings:animationBlock:](self, "initWithWorkspaceTransitionRequest:animationSettings:animationBlock:", 0, 0, 0);
}

@end

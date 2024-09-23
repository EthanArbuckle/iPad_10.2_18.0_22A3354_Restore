@implementation SBUIWorkspaceAnimationController

- (SBUIWorkspaceAnimationController)initWithWorkspaceTransitionRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIWorkspaceAnimationController;
  return -[SBUIAnimationController initWithTransitionContextProvider:](&v4, sel_initWithTransitionContextProvider_, a3);
}

- (SBUIWorkspaceAnimationController)initWithTransitionContextProvider:(id)a3
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
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%s is not a valid initializer. You must call -[%@ initWithWorkspaceTransitionRequest:]."), "-[SBUIWorkspaceAnimationController initWithTransitionContextProvider:]", v7);

  return -[SBUIWorkspaceAnimationController initWithWorkspaceTransitionRequest:](self, "initWithWorkspaceTransitionRequest:", 0);
}

@end

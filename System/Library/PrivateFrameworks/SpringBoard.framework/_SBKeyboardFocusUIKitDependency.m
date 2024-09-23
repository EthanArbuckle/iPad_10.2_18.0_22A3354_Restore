@implementation _SBKeyboardFocusUIKitDependency

- (BOOL)shouldInitAsync
{
  return 1;
}

- (SBInputUISceneController)inputUISceneController
{
  void *v2;
  void *v3;

  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputUISceneController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBInputUISceneController *)v3;
}

- (void)setSystemShellBehaviorDelegate:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CEAD20], "setSystemShellBehaviorDelegate:", a3);
}

- (id)launchAdvisorWithOmniscientDelegate:(id)a3 sceneDelegate:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D426F8], "launchAdvisorWithOmniscientDelegate:sceneDelegate:", a3, a4);
}

- (UIKeyboardArbiterManager)keyboardArbiterManager
{
  return (UIKeyboardArbiterManager *)objc_msgSend(MEMORY[0x1E0CEA6D0], "sharedArbiterManager");
}

@end

@implementation UIStatusBarManager(SpringBoardFoundation)

- (void)sbf_addObserver:()SpringBoardFoundation
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIStatusBarManager+SpringBoardFoundation.m"), 14, CFSTR("Use a concrete subclass like SBWindowSceneStatusBarManager"));

}

- (void)sbf_removeObserver:()SpringBoardFoundation
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIStatusBarManager+SpringBoardFoundation.m"), 18, CFSTR("Use a concrete subclass like SBWindowSceneStatusBarManager"));

}

@end

@implementation SBSLockScreenContentAction(InProcess)

- (uint64_t)isInProcessAction
{
  return 0;
}

- (uint64_t)applicationSceneEntity
{
  return 0;
}

- (void)setApplicationSceneEntity:()InProcess
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBInProcessSecureAppAction.m"), 48, CFSTR("Can't set an application scene entity on an SBSLockScreenContentAction."));

}

- (uint64_t)hostableEntity
{
  return 0;
}

- (void)setHostableEntity:()InProcess
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBInProcessSecureAppAction.m"), 56, CFSTR("Can't set an application scene entity on an SBSLockScreenContentAction."));

}

@end

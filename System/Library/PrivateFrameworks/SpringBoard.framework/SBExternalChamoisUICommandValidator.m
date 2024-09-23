@implementation SBExternalChamoisUICommandValidator

- (BOOL)validateCommand:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "action");
  if (v4 == sel__handleMoveToOtherDisplayKeyShortcut_)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MOVE_TO_IPAD_DISCOVERABILITY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDiscoverabilityTitle:", v6);

  }
  return v4 == sel__handleMoveToOtherDisplayKeyShortcut_;
}

@end

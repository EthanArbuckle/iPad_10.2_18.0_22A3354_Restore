@implementation PSKeyboardNavigationSearchBar

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB740], 0, sel__escapeKeyPressed);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB728], 0, sel__downArrowKeyPressed);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB7D0], 0, sel__upArrowKeyPressed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsPriorityOverSystemBehavior:", 1);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_escapeKeyPressed
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PSSearchBarEscapeKeyPressedNotification"), self);

}

- (void)_downArrowKeyPressed
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PSSearchBarDownArrowKeyPressedNotification"), self);

}

- (void)_upArrowKeyPressed
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PSSearchBarUpArrowKeyPressedNotification"), self);

}

@end

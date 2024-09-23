@implementation SBTestAlertItem

+ (id)alertItemWithShowInLockScreen:(BOOL)a3 forcesModal:(BOOL)a4 superModal:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  id v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setShouldShowInLockScreen:", v7);
  objc_msgSend(v8, "setForcesModalAlertAppearance:", v6);
  objc_msgSend(v8, "setBehavesSuperModally:", v5);
  return v8;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTestAlertItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  if (self->_message)
  {
    objc_msgSend(v5, "setMessage:");
  }
  else
  {
    if (self->_shouldShowInLockScreen)
      v7 = CFSTR("appears");
    else
      v7 = CFSTR("does not appear");
    if (self->_forcesModalAlertAppearance)
      v8 = CFSTR("forces");
    else
      v8 = CFSTR("does not force");
    if (self->_behavesSuperModally)
      v9 = CFSTR("is");
    else
      v9 = CFSTR("is not");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This alert item %@ on the lockscreen, %@ modal appearance and %@ supermodal"), v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessage:", v10);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__SBTestAlertItem_configure_requirePasscodeForActions___block_invoke;
  v12[3] = &unk_1E8E9DCB0;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", CFSTR("Dismiss"), 1, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v11);

}

uint64_t __55__SBTestAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p - title: %@>"), objc_opt_class(), self, self->_title);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)shouldShowInLockScreen
{
  return self->_shouldShowInLockScreen;
}

- (void)setShouldShowInLockScreen:(BOOL)a3
{
  self->_shouldShowInLockScreen = a3;
}

- (BOOL)forcesModalAlertAppearance
{
  return self->_forcesModalAlertAppearance;
}

- (void)setForcesModalAlertAppearance:(BOOL)a3
{
  self->_forcesModalAlertAppearance = a3;
}

- (BOOL)behavesSuperModally
{
  return self->_behavesSuperModally;
}

- (void)setBehavesSuperModally:(BOOL)a3
{
  self->_behavesSuperModally = a3;
}

- (BOOL)allowMenuButtonDismissal
{
  return self->_allowMenuButtonDismissal;
}

- (void)setAllowMenuButtonDismissal:(BOOL)a3
{
  self->_allowMenuButtonDismissal = a3;
}

- (BOOL)allowLockScreenDismissal
{
  return self->_allowLockScreenDismissal;
}

- (void)setAllowLockScreenDismissal:(BOOL)a3
{
  self->_allowLockScreenDismissal = a3;
}

- (BOOL)reappearsAfterUnlock
{
  return self->_reappearsAfterUnlock;
}

- (void)setReappearsAfterUnlock:(BOOL)a3
{
  self->_reappearsAfterUnlock = a3;
}

- (BOOL)reappearsAfterLock
{
  return self->_reappearsAfterLock;
}

- (void)setReappearsAfterLock:(BOOL)a3
{
  self->_reappearsAfterLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

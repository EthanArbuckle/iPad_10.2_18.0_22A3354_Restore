@implementation SBFLockScreenActionContext

- (SBFLockScreenActionContext)initWithLockLabel:(id)a3 shortLockLabel:(id)a4 action:(id)a5 identifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBFLockScreenActionContext *v15;
  SBFLockScreenActionContext *v16;
  uint64_t v17;
  id action;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBFLockScreenActionContext;
  v15 = -[SBFLockScreenActionContext init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_lockLabel, a3);
    objc_storeStrong((id *)&v16->_shortLockLabel, a4);
    v17 = objc_msgSend(v13, "copy");
    action = v16->_action;
    v16->_action = (id)v17;

    objc_storeStrong((id *)&v16->_identifier, a6);
  }

  return v16;
}

- (NSString)lockLabel
{
  NSString *lockLabel;

  if (lockLabel___once != -1)
    dispatch_once(&lockLabel___once, &__block_literal_global_11);
  if (self->_lockLabel)
    lockLabel = self->_lockLabel;
  else
    lockLabel = (NSString *)lockLabel___defaultLockLabel;
  return lockLabel;
}

void __39__SBFLockScreenActionContext_lockLabel__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AWAY_LOCK_LABEL"), &stru_1E2010FC0, CFSTR("SpringBoard"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)lockLabel___defaultLockLabel;
  lockLabel___defaultLockLabel = v0;

}

- (NSString)shortLockLabel
{
  NSString *shortLockLabel;

  if (shortLockLabel___once != -1)
    dispatch_once(&shortLockLabel___once, &__block_literal_global_6);
  if (self->_shortLockLabel)
    shortLockLabel = self->_shortLockLabel;
  else
    shortLockLabel = (NSString *)shortLockLabel___defaultShortLockLabel;
  return shortLockLabel;
}

void __44__SBFLockScreenActionContext_shortLockLabel__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AWAY_LOCK_LABEL_SHORT"), &stru_1E2010FC0, CFSTR("SpringBoard"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shortLockLabel___defaultShortLockLabel;
  shortLockLabel___defaultShortLockLabel = v0;

}

- (BOOL)hasCustomUnlockLabel
{
  return -[NSString length](self->_lockLabel, "length") != 0;
}

- (void)setLockLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lockLabel, a3);
}

- (void)setShortLockLabel:(id)a3
{
  objc_storeStrong((id *)&self->_shortLockLabel, a3);
}

- (NSString)unlockDestination
{
  return self->_unlockDestination;
}

- (void)setUnlockDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (int)intent
{
  return self->_intent;
}

- (void)setIntent:(int)a3
{
  self->_intent = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)requiresUIUnlock
{
  return self->_requiresUIUnlock;
}

- (void)setRequiresUIUnlock:(BOOL)a3
{
  self->_requiresUIUnlock = a3;
}

- (BOOL)deactivateAwayController
{
  return self->_deactivateAwayController;
}

- (void)setDeactivateAwayController:(BOOL)a3
{
  self->_deactivateAwayController = a3;
}

- (BOOL)canBypassPinLock
{
  return self->_canBypassPinLock;
}

- (void)setCanBypassPinLock:(BOOL)a3
{
  self->_canBypassPinLock = a3;
}

- (BOOL)wantsBiometricPresentation
{
  return self->_wantsBiometricPresentation;
}

- (void)setWantsBiometricPresentation:(BOOL)a3
{
  self->_wantsBiometricPresentation = a3;
}

- (BOOL)confirmedNotInPocket
{
  return self->_confirmedNotInPocket;
}

- (void)setConfirmedNotInPocket:(BOOL)a3
{
  self->_confirmedNotInPocket = a3;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_storeStrong((id *)&self->_shortLockLabel, 0);
  objc_storeStrong((id *)&self->_lockLabel, 0);
}

@end

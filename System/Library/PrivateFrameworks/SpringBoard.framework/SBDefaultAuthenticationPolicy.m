@implementation SBDefaultAuthenticationPolicy

- (BOOL)allowAuthenticationRevocation
{
  void *v2;
  BOOL v3;

  objc_msgSend((id)SBApp, "restartManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldClearBlockStateOnSync
{
  return 1;
}

- (BOOL)usesSecureMode
{
  return 1;
}

- (void)wipeDeviceWithReason:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend((id)SBApp, "userSessionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sessionType");

  if (v4 == 2)
  {
    objc_msgSend((id)SBApp, "userSessionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "disableCurrentUser");

  }
  else
  {
    objc_msgSend((id)SBApp, "performSelector:withObject:afterDelay:", sel_wipeDeviceNowWithReason_, v6, 0.0);
  }

}

- (void)cachePasscode:(id)a3
{
  id v4;
  void *v5;
  SecureBackup *v6;
  SecureBackup *secureBackupHelper;
  SecureBackup *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInSetupMode"))
  {
    objc_msgSend(v5, "noteAuthenticationSucceededWithPasscode:", v4);
    if (!self->_secureBackupHelper)
    {
      v6 = (SecureBackup *)objc_alloc_init(MEMORY[0x1E0D11670]);
      secureBackupHelper = self->_secureBackupHelper;
      self->_secureBackupHelper = v6;

      v8 = self->_secureBackupHelper;
      v11 = *MEMORY[0x1E0D11678];
      v12[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)-[SecureBackup cachePassphraseWithInfo:](v8, "cachePassphraseWithInfo:", v9);

    }
  }
  if (-[SBSoftwareUpdatePasscodePolicyManager softwareUpdatePasscodePolicy](self->_softwareUpdatePasscodePolicyManager, "softwareUpdatePasscodePolicy"))
  {
    -[SBSoftwareUpdatePasscodePolicyManager noteAuthenticationSucceededWithPasscode:](self->_softwareUpdatePasscodePolicyManager, "noteAuthenticationSucceededWithPasscode:", v4);
  }
  if (-[SBiCloudPasscodeRequirementLockoutController desiresPasscode](self->_iCloudPasscodeRequirementLockoutController, "desiresPasscode"))
  {
    -[SBiCloudPasscodeRequirementLockoutController noteAuthenticationSucceededWithPasscode:](self->_iCloudPasscodeRequirementLockoutController, "noteAuthenticationSucceededWithPasscode:", v4);
  }

}

- (void)clearPasscodeCache
{
  SecureBackup *secureBackupHelper;
  id v4;
  SecureBackup *v5;

  secureBackupHelper = self->_secureBackupHelper;
  if (secureBackupHelper)
  {
    v4 = (id)-[SecureBackup uncachePassphraseWithInfo:](secureBackupHelper, "uncachePassphraseWithInfo:", 0);
    v5 = self->_secureBackupHelper;
    self->_secureBackupHelper = 0;

  }
}

- (void)passcodeAuthenticationFailedWithError:(id)a3
{
  void *v3;
  int v4;
  SBDataRecoveryController *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DAA170]);

  if (v4 && objc_msgSend(v6, "code") == -14)
  {
    v5 = objc_alloc_init(SBDataRecoveryController);
    if (-[SBDataRecoveryController dataRecoveryRequired](v5, "dataRecoveryRequired"))
      -[SBDataRecoveryController performDataRecovery](v5, "performDataRecovery");

  }
}

- (SBiCloudPasscodeRequirementLockoutController)iCloudPasscodeRequirementLockoutController
{
  return self->_iCloudPasscodeRequirementLockoutController;
}

- (void)setICloudPasscodeRequirementLockoutController:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudPasscodeRequirementLockoutController, a3);
}

- (SBSoftwareUpdatePasscodePolicyManager)softwareUpdatePasscodePolicyManager
{
  return self->_softwareUpdatePasscodePolicyManager;
}

- (void)setSoftwareUpdatePasscodePolicyManager:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdatePasscodePolicyManager, a3);
}

- (SecureBackup)_secureBackupHelper
{
  return self->_secureBackupHelper;
}

- (void)_setSecureBackupHelper:(id)a3
{
  objc_storeStrong((id *)&self->_secureBackupHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureBackupHelper, 0);
  objc_storeStrong((id *)&self->_softwareUpdatePasscodePolicyManager, 0);
  objc_storeStrong((id *)&self->_iCloudPasscodeRequirementLockoutController, 0);
}

@end

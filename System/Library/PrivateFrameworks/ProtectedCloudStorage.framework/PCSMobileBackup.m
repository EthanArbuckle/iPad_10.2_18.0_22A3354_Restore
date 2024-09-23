@implementation PCSMobileBackup

+ (id)defaultMobileBackup
{
  if (defaultMobileBackup_onceToken != -1)
    dispatch_once(&defaultMobileBackup_onceToken, &__block_literal_global_10);
  return (id)defaultMobileBackup_mb;
}

void __38__PCSMobileBackup_defaultMobileBackup__block_invoke()
{
  PCSMobileBackup *v0;
  void *v1;

  v0 = objc_alloc_init(PCSMobileBackup);
  v1 = (void *)defaultMobileBackup_mb;
  defaultMobileBackup_mb = (uint64_t)v0;

}

- (PCSMobileBackup)init
{
  PCSMobileBackup *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  MBManager *backupManager;
  PCSMobileBackup *v7;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PCSMobileBackup;
  v2 = -[PCSMobileBackup init](&v10, sel_init);
  if (v2)
  {
    if (dlopen("/System/Library/PrivateFrameworks/MobileBackup.framework/MobileBackup", 2)
      && (objc_getClass("MBManager"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = (void *)v3;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Monitoring backup status with MBManager", v9, 2u);
      }
      v5 = objc_msgSend((id)objc_msgSend(v4, "alloc"), "initWithDelegate:", v2);
      backupManager = v2->_backupManager;
      v2->_backupManager = (MBManager *)v5;

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to use MBManager", v9, 2u);
    }
    v7 = v2;
  }

  return v2;
}

- (BOOL)isBackupEnabled
{
  _BOOL4 v2;
  int v3;
  uint8_t v5[16];
  uint8_t buf[16];

  if (_PCSMobileBackupOverride == -1)
  {
    v3 = -[MBManager isBackupEnabled](self->_backupManager, "isBackupEnabled");
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v2)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Mobile backup is enabled", buf, 2u);
      }
      LOBYTE(v2) = 1;
    }
    else if (v2)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Mobile backup is disabled", v5, 2u);
      LOBYTE(v2) = 0;
    }
  }
  else
  {
    LOBYTE(v2) = _PCSMobileBackupOverride != 0;
  }
  return v2;
}

- (MBManager)backupManager
{
  return (MBManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBackupManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupManager, 0);
}

@end

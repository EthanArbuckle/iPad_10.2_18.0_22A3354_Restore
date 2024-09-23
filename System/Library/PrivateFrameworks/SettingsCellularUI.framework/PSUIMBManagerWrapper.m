@implementation PSUIMBManagerWrapper

- (PSUIMBManagerWrapper)init
{
  PSUIMBManagerWrapper *v2;
  uint64_t v3;
  MBManager *backupManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUIMBManagerWrapper;
  v2 = -[PSUIMBManagerWrapper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    backupManager = v2->_backupManager;
    v2->_backupManager = (MBManager *)v3;

  }
  return v2;
}

- (unint64_t)backupOnCellularSupportWithAccount:(id)a3 error:(id *)a4
{
  return -[MBManager backupOnCellularSupportWithAccount:error:](self->_backupManager, "backupOnCellularSupportWithAccount:error:", a3, a4);
}

- (BOOL)isBackupOnCellularEnabledWithError:(id *)a3
{
  return -[MBManager isBackupOnCellularEnabledWithError:](self->_backupManager, "isBackupOnCellularEnabledWithError:", a3);
}

- (BOOL)setBackupOnCellularEnabled:(BOOL)a3 error:(id *)a4
{
  return -[MBManager setBackupOnCellularEnabled:error:](self->_backupManager, "setBackupOnCellularEnabled:error:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupManager, 0);
}

@end

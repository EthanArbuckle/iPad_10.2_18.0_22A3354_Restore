@implementation BYDeviceSetupSourceSession

- (void)setMessageSession:(id)a3
{
  void *v4;

  objc_storeStrong((id *)&self->_messageSession, a3);
  -[BYDeviceSetupSourceSession client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BYDeviceSetupSourceSession invalidate](self, "invalidate");
    -[BYDeviceSetupSourceSession activate](self, "activate");
  }
}

- (void)setFileTransferSessionTemplate:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_fileTransferSessionTemplate, a3);
  -[BYDeviceSetupSourceSession migrationSourceClient](self, "migrationSourceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BYDeviceSetupSourceSession migrationSourceClient](self, "migrationSourceClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFileTransferTemplate:", v7);

  }
}

- (void)activate
{
  NSObject *v3;
  BYBuddyDaemonProximitySourceClient *v4;
  void *v5;
  BYBuddyDaemonMigrationSourceClient *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Proximity setup source session activated", v11, 2u);
  }

  -[BYDeviceSetupSourceSession setCurrentPhase:](self, "setCurrentPhase:", 0);
  v4 = objc_alloc_init(BYBuddyDaemonProximitySourceClient);
  -[BYDeviceSetupSourceSession setClient:](self, "setClient:", v4);

  -[BYDeviceSetupSourceSession client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  v6 = objc_alloc_init(BYBuddyDaemonMigrationSourceClient);
  -[BYDeviceSetupSourceSession setMigrationSourceClient:](self, "setMigrationSourceClient:", v6);

  -[BYDeviceSetupSourceSession migrationSourceClient](self, "migrationSourceClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYDeviceSetupSourceSession fileTransferSessionTemplate](self, "fileTransferSessionTemplate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFileTransferTemplate:", v8);

  -[BYDeviceSetupSourceSession setTimeRemaining:](self, "setTimeRemaining:", -1.0);
  -[BYDeviceSetupSourceSession client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYDeviceSetupSourceSession messageSession](self, "messageSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateWithSharingChannel:", v10);

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Proximity setup source session invalidated", v5, 2u);
  }

  -[BYDeviceSetupSourceSession client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[BYDeviceSetupSourceSession setClient:](self, "setClient:", 0);
}

- (void)updateProgress
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;

  if (-[BYDeviceSetupSourceSession currentPhase](self, "currentPhase") == 1
    && -[BYDeviceSetupSourceSession hasBackupCompleted](self, "hasBackupCompleted"))
  {
    -[BYDeviceSetupSourceSession setCurrentPhase:](self, "setCurrentPhase:", 2);
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[BYDeviceSetupSourceSession backupProgress](self, "backupProgress");
  v4 = v3;
  -[BYDeviceSetupSourceSession syncProgress](self, "syncProgress");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 * 0.200000003 + v4 * 0.800000012);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("percentComplete"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BYDeviceSetupSourceSession timeRemaining](self, "timeRemaining");
  objc_msgSend(v7, "numberWithDouble:", v8 * 60.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("timeRemaining"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BYDeviceSetupSourceSession currentPhase](self, "currentPhase"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("phase"));

  -[BYDeviceSetupSourceSession progressHandler](self, "progressHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[BYDeviceSetupSourceSession progressHandler](self, "progressHandler");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v13);

  }
}

- (void)finishedWithError:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  if (v9)
  {
    v6 = CFSTR("eo");
    v7 = v9;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AAB0];
    v6 = CFSTR("finished");
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v6);
  -[BYDeviceSetupSourceSession progressHandler](self, "progressHandler");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v8)[2](v8, v5);

}

- (void)backupProgress:(double)a3 estimatedTimeRemaining:(int64_t)a4
{
  -[BYDeviceSetupSourceSession setBackupProgress:](self, "setBackupProgress:", a3);
  -[BYDeviceSetupSourceSession setTimeRemaining:](self, "setTimeRemaining:", (double)a4);
  -[BYDeviceSetupSourceSession setHasBackupCompleted:](self, "setHasBackupCompleted:", 0);
  -[BYDeviceSetupSourceSession setCurrentPhase:](self, "setCurrentPhase:", 1);
  -[BYDeviceSetupSourceSession updateProgress](self, "updateProgress");
}

- (void)backupCompletedWithError:(id)a3
{
  -[BYDeviceSetupSourceSession setHasBackupCompleted:](self, "setHasBackupCompleted:", 1);
  -[BYDeviceSetupSourceSession setTimeRemaining:](self, "setTimeRemaining:", -1.0);
  -[BYDeviceSetupSourceSession updateProgress](self, "updateProgress");
}

- (void)syncProgress:(double)a3
{
  -[BYDeviceSetupSourceSession setSyncProgress:](self, "setSyncProgress:", a3);
  -[BYDeviceSetupSourceSession updateProgress](self, "updateProgress");
}

- (void)syncCompletedWithErrors:(id)a3
{
  -[BYDeviceSetupSourceSession setHasSyncCompleted:](self, "setHasSyncCompleted:", 1);
  -[BYDeviceSetupSourceSession updateProgress](self, "updateProgress");
}

- (id)sendObjectHandler
{
  return self->_sendObjectHandler;
}

- (void)setSendObjectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CUMessageSession)messageSession
{
  return self->_messageSession;
}

- (RPFileTransferSession)fileTransferSessionTemplate
{
  return self->_fileTransferSessionTemplate;
}

- (BYBuddyDaemonProximitySourceClient)client
{
  return (BYBuddyDaemonProximitySourceClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BYBuddyDaemonMigrationSourceClient)migrationSourceClient
{
  return self->_migrationSourceClient;
}

- (void)setMigrationSourceClient:(id)a3
{
  objc_storeStrong((id *)&self->_migrationSourceClient, a3);
}

- (double)backupProgress
{
  return self->_backupProgress;
}

- (void)setBackupProgress:(double)a3
{
  self->_backupProgress = a3;
}

- (double)syncProgress
{
  return self->_syncProgress;
}

- (void)setSyncProgress:(double)a3
{
  self->_syncProgress = a3;
}

- (BOOL)hasBackupCompleted
{
  return self->_hasBackupCompleted;
}

- (void)setHasBackupCompleted:(BOOL)a3
{
  self->_hasBackupCompleted = a3;
}

- (BOOL)hasSyncCompleted
{
  return self->_hasSyncCompleted;
}

- (void)setHasSyncCompleted:(BOOL)a3
{
  self->_hasSyncCompleted = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (unint64_t)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(unint64_t)a3
{
  self->_currentPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationSourceClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_fileTransferSessionTemplate, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_sendObjectHandler, 0);
}

@end

@implementation MBEngine

+ (id)stringForEngineType:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  else
    return *(&off_1000DA200 + a3 - 1);
}

+ (id)stringForEngineMode:(int)a3
{
  if ((a3 - 1) > 2)
    return 0;
  else
    return *(&off_1000DA220 + a3 - 1);
}

+ (id)stringForRestoreType:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("Background");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("Foreground");
  else
    return (id)v3;
}

- (MBEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5
{
  id v10;
  id v11;
  id v12;
  MBEngine *v13;
  MBEngine *v14;
  uint64_t v15;
  OS_voucher *clientVoucher;
  uint64_t v17;
  id v18;
  MBPersona *personalPersona;
  void *v21;
  id v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MBEngine;
  v13 = -[MBEngine init](&v23, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_settingsContext, a3);
    objc_storeStrong((id *)&v14->_debugContext, a4);
    objc_storeStrong((id *)&v14->_domainManager, a5);
    v15 = voucher_copy();
    clientVoucher = v14->_clientVoucher;
    v14->_clientVoucher = (OS_voucher *)v15;

    v22 = 0;
    v17 = objc_claimAutoreleasedReturnValue(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", &v22));
    v18 = v22;
    personalPersona = v14->_personalPersona;
    v14->_personalPersona = (MBPersona *)v17;

    if (!v14->_personalPersona)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("MBEngine.m"), 109, CFSTR("Unable to obtain personal persona: %@"), v18);

    }
  }

  return v14;
}

- (MBPersona)persona
{
  return self->_personalPersona;
}

- (int)engineType
{
  -[MBEngine doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isDriveEngine
{
  unsigned int v3;

  v3 = -[MBEngine engineType](self, "engineType");
  if (v3 != 1)
    LOBYTE(v3) = -[MBEngine engineType](self, "engineType") == 4;
  return v3;
}

- (BOOL)isServiceEngine
{
  return -[MBEngine engineType](self, "engineType") == 2 || -[MBEngine engineType](self, "engineType") == 3;
}

- (BOOL)isCloudKitEngine
{
  return -[MBEngine engineType](self, "engineType") == 3;
}

- (BOOL)isDeviceTransferEngine
{
  return -[MBEngine engineType](self, "engineType") == 4;
}

- (int)engineMode
{
  -[MBEngine doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)engineModeString
{
  return (NSString *)+[MBEngine stringForEngineMode:](MBEngine, "stringForEngineMode:", -[MBEngine engineMode](self, "engineMode"));
}

- (BOOL)isBackupEngine
{
  return -[MBEngine engineMode](self, "engineMode") == 1;
}

- (BOOL)isRestoreEngine
{
  return -[MBEngine engineMode](self, "engineMode") == 2;
}

- (int)restoreType
{
  -[MBEngine doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)restoreTypeString
{
  return (NSString *)+[MBEngine stringForRestoreType:](MBEngine, "stringForRestoreType:", -[MBEngine restoreType](self, "restoreType"));
}

- (BOOL)isForegroundRestore
{
  _BOOL4 v3;

  v3 = -[MBEngine isRestoreEngine](self, "isRestoreEngine");
  if (v3)
    LOBYTE(v3) = -[MBEngine restoreType](self, "restoreType") == 1;
  return v3;
}

- (BOOL)isBackgroundRestore
{
  _BOOL4 v3;

  v3 = -[MBEngine isRestoreEngine](self, "isRestoreEngine");
  if (v3)
    LOBYTE(v3) = -[MBEngine restoreType](self, "restoreType") == 2;
  return v3;
}

- (BOOL)isCanceled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  return v2 & 1;
}

- (BOOL)cancelWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL *p_canceled;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  BOOL v15;
  uint8_t buf[4];
  MBEngine *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v6 = v4;
  p_canceled = &self->_canceled;
  v8 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v8 & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    v9 = MBGetDefaultLog(v4, v5);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Canceling %{public}@: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "Canceling %{public}@: %{public}@", self, v6);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine cancelError](self, "cancelError"));
    if (!v11)
    {
      if (!v6)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine engineModeString](self, "engineModeString"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("%@ cancelled"), v12));

      }
      -[MBEngine setCancelError:](self, "setCancelError:", v6);
    }
    do
      v13 = __ldaxr((unsigned __int8 *)p_canceled);
    while (__stlxr(1u, (unsigned __int8 *)p_canceled));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine cancelError](self, "cancelError"));
    if (!v14)
      sub_100088E18();

    v15 = v13 & 1;
  }

  return v15;
}

- (BOOL)cancelWithReason:(int64_t)a3
{
  void *v4;
  MBError *v5;
  void *v6;
  BOOL v7;

  if (a3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine engineModeString](self, "engineModeString"));
    v5 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("%@ cancelled (XPC connection invalidated)"), v4);
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBEngine engineModeString](self, "engineModeString"));
    v5 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("%@ cancelled"), v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

LABEL_7:
  v7 = -[MBEngine cancelWithError:](self, "cancelWithError:", v6);

  return v7;
}

- (BOOL)cancel
{
  return -[MBEngine cancelWithError:](self, "cancelWithError:", 0);
}

- (BOOL)fetchDeviceToDeviceEncryptionSupportedByAccount:(BOOL *)a3 error:(id *)a4
{
  __assert_rtn("-[MBEngine fetchDeviceToDeviceEncryptionSupportedByAccount:error:]", "MBEngine.m", 209, "0 && \"Unexpected call\");
}

- (BOOL)backsUpPrimaryAccount
{
  if (-[MBEngine isDriveEngine](self, "isDriveEngine"))
    return 1;
  else
    return -[MBEngine isServiceEngine](self, "isServiceEngine");
}

- (int64_t)backupPolicy
{
  return -[MBSettingsContext backupPolicy](self->_settingsContext, "backupPolicy");
}

- (unint64_t)enginePolicy
{
  unint64_t v3;

  v3 = -[MBEngine isCloudKitEngine](self, "isCloudKitEngine");
  if (-[MBEngine isDriveEngine](self, "isDriveEngine"))
    v3 |= 2uLL;
  if (-[MBEngine isDeviceTransferEngine](self, "isDeviceTransferEngine"))
    v3 |= 4uLL;
  if (-[MBEngine encrypted](self, "encrypted"))
    v3 |= 0x10uLL;
  if (-[MBEngine isServiceEngine](self, "isServiceEngine"))
    v3 |= 8uLL;
  if ((objc_opt_respondsToSelector(self, "shouldCommitIfPossible") & 1) != 0
    && -[MBEngine shouldCommitIfPossible](self, "shouldCommitIfPossible"))
  {
    v3 |= 0x40uLL;
  }
  if ((id)-[MBEngine backupPolicy](self, "backupPolicy") == (id)1)
    v3 |= 0x20uLL;
  if ((objc_opt_respondsToSelector(self, "isRestoringToSameDevice") & 1) != 0
    && -[MBEngine isRestoringToSameDevice](self, "isRestoringToSameDevice"))
  {
    v3 |= 0x80uLL;
  }
  return v3;
}

- (MBSettingsContext)settingsContext
{
  return self->_settingsContext;
}

- (MBDebugContext)debugContext
{
  return self->_debugContext;
}

- (MBProperties)properties
{
  return self->_properties;
}

- (MBProperties)preflightProperties
{
  return self->_preflightProperties;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (void)setEncrypted:(BOOL)a3
{
  self->_encrypted = a3;
}

- (NSError)cancelError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCancelError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (MBDomainManager)domainManager
{
  return self->_domainManager;
}

- (MBAppManager)appManager
{
  return self->_appManager;
}

- (MBWatchdog)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
  objc_storeStrong((id *)&self->_watchdog, a3);
}

- (MBAnalyticsEvent)analyticsEvent
{
  return self->_analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEvent, a3);
}

- (OS_voucher)clientVoucher
{
  return self->_clientVoucher;
}

- (void)setClientVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_clientVoucher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVoucher, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_cancelError, 0);
  objc_storeStrong((id *)&self->_personalPersona, 0);
  objc_storeStrong((id *)&self->_appManager, 0);
  objc_storeStrong((id *)&self->_domainManager, 0);
  objc_storeStrong((id *)&self->_preflightProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_debugContext, 0);
  objc_storeStrong((id *)&self->_settingsContext, 0);
}

@end

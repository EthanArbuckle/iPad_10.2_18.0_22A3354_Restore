@implementation MISystemAppMigrationState

- (MISystemAppMigrationState)init
{
  MISystemAppMigrationState *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *systemAppMigrationStateQueue;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MISystemAppMigrationState;
  v2 = -[MISystemAppMigrationState init](&v10, "init");
  if (!v2)
    return v2;
  v3 = dispatch_queue_create("com.apple.installd.SystemAppMigrationState", 0);
  systemAppMigrationStateQueue = v2->_systemAppMigrationStateQueue;
  v2->_systemAppMigrationStateQueue = (OS_dispatch_queue *)v3;

  if ((sub_100028314() & 1) == 0)
  {
    if (&_DMIsMigrationNeeded && (DMIsMigrationNeeded() & 1) != 0)
    {
      v2->_systemAppMigrationComplete = 0;
      v5 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v6 = CFSTR("System App Migration is not complete.");
LABEL_12:
        MOLogWrite(v5, 5, "-[MISystemAppMigrationState init]", v6);
        return v2;
      }
      return v2;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "migrationPlistURL"));
    MIRecordCurrentBuildVersion(v8);

  }
  v2->_systemAppMigrationComplete = 1;
  v5 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v6 = CFSTR("System App Migration is complete.");
    goto LABEL_12;
  }
  return v2;
}

+ (id)defaultManager
{
  if (qword_10009DF90 != -1)
    dispatch_once(&qword_10009DF90, &stru_1000855B0);
  return (id)qword_10009DF98;
}

- (void)setSystemAppMigrationComplete:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[MISystemAppMigrationState systemAppMigrationStateQueue](self, "systemAppMigrationStateQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100029450;
  v6[3] = &unk_1000855D8;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (BOOL)systemAppMigrationComplete
{
  MISystemAppMigrationState *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MISystemAppMigrationState systemAppMigrationStateQueue](self, "systemAppMigrationStateQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002969C;
  v5[3] = &unk_100084F90;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)waitForSystemAppMigrationToComplete:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MISystemAppMigrationState systemAppMigrationStateQueue](self, "systemAppMigrationStateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029748;
  block[3] = &unk_100085600;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSMutableArray)blockArray
{
  return self->_blockArray;
}

- (void)setBlockArray:(id)a3
{
  objc_storeStrong((id *)&self->_blockArray, a3);
}

- (OS_dispatch_queue)systemAppMigrationStateQueue
{
  return self->_systemAppMigrationStateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAppMigrationStateQueue, 0);
  objc_storeStrong((id *)&self->_blockArray, 0);
}

@end

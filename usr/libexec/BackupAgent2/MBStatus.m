@implementation MBStatus

+ (int)backupStateWithString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("empty")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("old")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("new")) & 1) == 0)
    objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, CFSTR("Invalid backup state name: %@"), a3));
  return 2;
}

+ (id)stringWithBackupState:(int)a3
{
  if (a3 < 3)
    return off_1000D9CB0[a3];
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBStatus.m"), 40, CFSTR("Invalid backup state: %d"), *(_QWORD *)&a3);
  return 0;
}

+ (int)snapshotStateWithString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("uploading")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("moving")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("removing")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("finished")) & 1) == 0)
    objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, CFSTR("Invalid snapshot state name: %@"), a3));
  return 3;
}

+ (id)stringWithSnapshotState:(int)a3
{
  if (a3 < 4)
    return off_1000D9CC8[a3];
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBStatus.m"), 71, CFSTR("Invalid snapshot state: %d"), *(_QWORD *)&a3);
  return 0;
}

+ (id)status
{
  return objc_alloc_init(MBStatus);
}

+ (MBStatus)statusWithDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  id v5;

  v5 = objc_msgSend(a3, "propertyListAtPath:options:error:", a4, 0);
  if (v5)
    return -[MBStatus initWithPropertyList:]([MBStatus alloc], "initWithPropertyList:", v5);
  else
    return 0;
}

- (MBStatus)init
{
  MBStatus *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBStatus;
  result = -[MBStatus init](&v3, "init");
  if (result)
    result->_version = 3.3;
  return result;
}

- (MBStatus)initWithPropertyList:(id)a3
{
  uint64_t v5;
  MBStatus *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v23;
  const __CFString *v24;
  id v25;
  uint64_t v26;
  objc_super v27;

  v5 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0)
  {
    v23 = objc_alloc((Class)MBException);
    v24 = CFSTR("Status.plist not a dictionary");
    goto LABEL_25;
  }
  v27.receiver = self;
  v27.super_class = (Class)MBStatus;
  v6 = -[MBStatus init](&v27, "init");
  if (v6)
  {
    v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Backup Success"));
    v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Version"));
    if (!v8)
    {
      v6->_version = 0.0;
      v6->_versionAmbiguous = 0;
      goto LABEL_16;
    }
    v9 = v8;
    v10 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      v6->_version = v11;
      if (v11 != 0.0 && (v11 < 2.4 || v11 >= 4.0))
      {
        v25 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 203, CFSTR("Unsupported status version: %0.1f"), *(_QWORD *)&v6->_version);
LABEL_26:
        objc_exception_throw(v25);
      }
      v6->_versionAmbiguous = v7 != 0;
      if (v11 >= 2.0)
      {
        v12 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UUID"));
        v13 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v6->_uuid = (NSString *)v12;
          v14 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Date"));
          v15 = objc_opt_class(NSDate);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            v6->_date = (NSDate *)v14;
            v16 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BackupState"));
            v17 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
            {
              v6->_backupState = +[MBStatus backupStateWithString:](MBStatus, "backupStateWithString:", v16);
              v18 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SnapshotState"));
              v19 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
              {
                v6->_snapshotState = +[MBStatus snapshotStateWithString:](MBStatus, "snapshotStateWithString:", v18);
                v20 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("IsFullBackup"));
                v21 = objc_opt_class(NSNumber);
                if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
                {
                  v6->_fullBackup = objc_msgSend(v20, "BOOLValue");
                  return v6;
                }
                v23 = objc_alloc((Class)MBException);
                v24 = CFSTR("IsFullBackup value not a number");
              }
              else
              {
                v23 = objc_alloc((Class)MBException);
                v24 = CFSTR("SnapshotState not a string");
              }
            }
            else
            {
              v23 = objc_alloc((Class)MBException);
              v24 = CFSTR("BackupState not a string");
            }
          }
          else
          {
            v23 = objc_alloc((Class)MBException);
            v24 = CFSTR("Date value not a date");
          }
        }
        else
        {
          v23 = objc_alloc((Class)MBException);
          v24 = CFSTR("UUID value not a string");
        }
        goto LABEL_25;
      }
LABEL_16:
      v6->_backupState = 1;
      return v6;
    }
    v23 = objc_alloc((Class)MBException);
    v24 = CFSTR("Version value not a NSNumber");
LABEL_25:
    v25 = objc_msgSend(v23, "initWithCode:format:", 11, v24, v26);
    goto LABEL_26;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBStatus;
  -[MBStatus dealloc](&v3, "dealloc");
}

- (NSString)backupStateName
{
  return (NSString *)+[MBStatus stringWithBackupState:](MBStatus, "stringWithBackupState:", self->_backupState);
}

- (BOOL)isBackupEmpty
{
  return self->_backupState == 0;
}

- (BOOL)isBackupOld
{
  return self->_backupState == 1;
}

- (BOOL)isBackupNew
{
  return self->_backupState == 2;
}

- (NSString)snapshotStateName
{
  return (NSString *)+[MBStatus stringWithSnapshotState:](MBStatus, "stringWithSnapshotState:", self->_snapshotState);
}

- (BOOL)isUploading
{
  return self->_snapshotState == 0;
}

- (BOOL)isMoving
{
  return self->_snapshotState == 1;
}

- (BOOL)isRemoving
{
  return self->_snapshotState == 2;
}

- (BOOL)isFinished
{
  return self->_snapshotState == 3;
}

- (id)propertyList
{
  NSMutableDictionary *v3;

  if (self->_version != 3.3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBStatus.m"), 188, CFSTR("Saving old status format?"));
  v3 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%0.1f"), 0x400A666666666666), CFSTR("Version"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", self->_uuid, CFSTR("UUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", self->_date, CFSTR("Date"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", -[MBStatus backupStateName](self, "backupStateName"), CFSTR("BackupState"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", -[MBStatus snapshotStateName](self, "snapshotStateName"), CFSTR("SnapshotState"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_fullBackup), CFSTR("IsFullBackup"));
  return v3;
}

- (BOOL)writeToDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  return objc_msgSend(a3, "uploadPropertyList:toPath:options:error:", -[MBStatus propertyList](self, "propertyList"), a4, 0, a5);
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_opt_class(self);
  -[MBStatus version](self, "version");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: version=%0.1f, date=%@, backupState=%@, snapshotState=%@, fullBackup=%d>"), v3, v4, -[MBStatus date](self, "date"), -[MBStatus backupStateName](self, "backupStateName"), -[MBStatus snapshotStateName](self, "snapshotStateName"), -[MBStatus isFullBackup](self, "isFullBackup"));
}

- (double)version
{
  return self->_version;
}

- (void)setVersion:(double)a3
{
  self->_version = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)backupState
{
  return self->_backupState;
}

- (void)setBackupState:(int)a3
{
  self->_backupState = a3;
}

- (int)snapshotState
{
  return self->_snapshotState;
}

- (void)setSnapshotState:(int)a3
{
  self->_snapshotState = a3;
}

- (BOOL)isVersionAmbiguous
{
  return self->_versionAmbiguous;
}

- (BOOL)isFullBackup
{
  return self->_fullBackup;
}

- (void)setFullBackup:(BOOL)a3
{
  self->_fullBackup = a3;
}

@end

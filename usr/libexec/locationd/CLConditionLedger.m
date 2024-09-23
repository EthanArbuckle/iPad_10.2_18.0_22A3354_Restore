@implementation CLConditionLedger

- (CLConditionLedger)initWithStoreType:(int64_t)a3 domain:(int64_t)a4 monitorConfiguration:(id)a5
{
  CLConditionLedger *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLConditionLedger;
  v9 = -[CLConditionLedger init](&v15, "init");
  if (v9)
  {
    v10 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCLMonitorLedgerPathKey"));
    v11 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCLMonitorLedgerNameKey"));
    v12 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCLMonitorLedgerAccessKey"));
    v13 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCLMonitorLedgerProcessNameKey"));
    if (v11)
    {
      if (v12)
      {
LABEL_4:
        -[CLConditionLedger setLedgerForType:domain:monitor:client:path:](v9, "setLedgerForType:domain:monitor:client:path:", a3, a4, v11, v13, v10);
        v9->_recordTable = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v9->_encryptionKey = (NSData *)objc_msgSend(v12, "copy");
        v9->_ledgerName = (NSString *)objc_msgSend(v11, "copy");
        v9->_readSucceeded = -[CLConditionLedger readConditionsFromFile](v9, "readConditionsFromFile");
        -[CLConditionLedger performMigration](v9, "performMigration");
        return v9;
      }
    }
    else
    {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("CLConditionLedger.mm"), 94, CFSTR("Monitor name is nil"));
      if (v12)
        goto LABEL_4;
    }
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("CLConditionLedger.mm"), 95, CFSTR("Key is nil to read/store %@ monitor's contents"), v11);
    goto LABEL_4;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[NSDictionary count](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"), "count"))-[CLConditionLedger deleteLedgerFile](self, "deleteLedgerFile");

  self->_ledgerFile = 0;
  self->_encryptionKey = 0;

  self->_recordTable = 0;
  self->_ledgerName = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLConditionLedger;
  -[CLConditionLedger dealloc](&v3, "dealloc");
}

- (BOOL)persistentFileReadSucceeded
{
  return self->_readSucceeded;
}

- (BOOL)shouldMigrate
{
  return -[NSNumber intValue](-[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber"), "intValue") < 1;
}

- (void)performMigration
{
  if (-[CLConditionLedger shouldMigrate](self, "shouldMigrate"))
    -[CLConditionLedger setLedgerVersionNumber:](self, "setLedgerVersionNumber:", 1);
}

- (void)setLedgerVersionNumber:(int)a3
{
  self->_ledgerVersionNumber = (NSNumber *)objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", *(_QWORD *)&a3);
}

- (void)setLedgerForType:(int64_t)a3 domain:(int64_t)a4 monitor:(id)a5 client:(id)a6 path:(id)a7
{
  int v14;
  NSURL *v15;
  NSMutableString *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _UNKNOWN **v22;
  NSURL *v23;
  NSObject *v24;
  NSURL *v25;
  NSObject *v26;
  const char *v27;
  NSString *v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;

  if (-[CLConditionLedger ledgerFile](self, "ledgerFile"))
    return;
  v14 = _sandbox_in_a_container();
  v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.monitor"), a5);
  if (a3 == 1 && a4 == 1)
  {
    if (!a7)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLConditionLedger.mm"), 169, CFSTR("#monitor Invalid path for custom store for %@ monitor"), a5);
    v15 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", a7, 1, 0);
    v16 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", &stru_1021D8FB8);
  }
  else
  {
    v16 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("CoreLocation/"));
    if (a3)
    {
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021739A0);
      v17 = qword_1022A01C8;
      if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289026;
        v30 = 0;
        v31 = 2082;
        v32 = "";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Custom store type cannot use on NSSearchPathDirectory\"}", buf, 0x12u);
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021739A0);
      }
      v18 = qword_1022A01C8;
      if (os_signpost_enabled((os_log_t)qword_1022A01C8))
      {
        *(_DWORD *)buf = 68289026;
        v30 = 0;
        v31 = 2082;
        v32 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Custom store type cannot use on NSSearchPathDirectory", "{\"msg%{public}.0s\":\"Custom store type cannot use on NSSearchPathDirectory\"}", buf, 0x12u);
      }
      v19 = 5;
    }
    else if (v14)
    {
      v19 = 9;
    }
    else
    {
      v19 = 5;
    }
    if (a4)
      v20 = 8;
    else
      v20 = 1;
    v15 = -[NSArray firstObject](-[NSFileManager URLsForDirectory:inDomains:](-[CLConditionLedger defaultFileManager](self, "defaultFileManager"), "URLsForDirectory:inDomains:", v19, v20), "firstObject");
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    v21 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v30 = 0;
      v31 = 2082;
      v32 = "";
      v33 = 2114;
      v34 = a6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor App is not sanboxed\", \"client\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    if (!-[CLConditionLedger directoryExists:](self, "directoryExists:", -[NSURL URLByAppendingPathComponent:](v15, "URLByAppendingPathComponent:", v16)))sub_10191A6BC();
    if ((v14 & 1) == 0)
    {
      v22 = CLPContext_ptr;
      -[NSMutableString appendString:](v16, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/"), a6));
      v23 = -[NSURL URLByAppendingPathComponent:](v15, "URLByAppendingPathComponent:", v16);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021739A0);
      v24 = qword_1022A01C8;
      if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        v30 = 0;
        v31 = 2082;
        v32 = "";
        v33 = 2114;
        v34 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor process is not containerized\", \"path\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
      if (!-[CLConditionLedger directoryExists:](self, "directoryExists:", v23))
        sub_10191A54C();
      goto LABEL_34;
    }
  }
  v22 = CLPContext_ptr;
LABEL_34:
  if (!v15)
    sub_10191A380();
  -[NSMutableString appendString:](v16, "appendString:", objc_msgSend(v22[256], "stringWithFormat:", CFSTR("%@"), v28));
  v25 = -[NSURL URLByAppendingPathComponent:](v15, "URLByAppendingPathComponent:", v16);
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021739A0);
  v26 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
  {
    v27 = -[NSString UTF8String](-[NSURL path](v25, "path"), "UTF8String");
    *(_DWORD *)buf = 68289282;
    v30 = 0;
    v31 = 2082;
    v32 = "";
    v33 = 2082;
    v34 = (id)v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor Conditions store\", \"path\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  self->_ledgerFile = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", -[NSURL path](v25, "path"), 0);
}

- (BOOL)directoryExists:(id)a3
{
  NSFileManager *v4;
  BOOL result;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v8 = 0;
  v4 = -[CLConditionLedger defaultFileManager](self, "defaultFileManager");
  if (qword_102306DC0 != -1)
    dispatch_once(&qword_102306DC0, &stru_1021739C0);
  if (-[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a3, 0, qword_102306DB8, &v8)|| objc_msgSend(v8, "code") == (id)516)
  {
    return 1;
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021739A0);
  v6 = qword_1022A01C8;
  v7 = os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v7)
  {
    *(_DWORD *)buf = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #warning unable to check for directory\", \"error\":%{public, location:escape_only}@, \"pathURL\":%{public, location:escape_only}@}", buf, 0x26u);
    return 0;
  }
  return result;
}

- (NSFileManager)defaultFileManager
{
  return +[NSFileManager defaultManager](NSFileManager, "defaultManager");
}

- (BOOL)readConditionsFromFile
{
  NSURL *v3;
  NSURL *v4;
  NSData *v5;
  id v6;
  id v7;
  const void *v8;
  NSUInteger v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  NSURL *v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  unsigned __int8 v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSNumber *v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint8_t buf[4];
  int v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  _BYTE v64[18];

  v3 = -[CLConditionLedger ledgerFile](self, "ledgerFile");
  if (!v3)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    v15 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v60 = 0;
      v61 = 2082;
      v62 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor path is nil for ledger file\"}", buf, 0x12u);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    }
    v16 = qword_1022A01C8;
    v13 = os_signpost_enabled((os_log_t)qword_1022A01C8);
    if (!v13)
      return v13;
    *(_DWORD *)buf = 68289026;
    v60 = 0;
    v61 = 2082;
    v62 = "";
    v17 = "#monitor path is nil for ledger file";
    v18 = "{\"msg%{public}.0s\":\"#monitor path is nil for ledger file\"}";
    v19 = v16;
    v20 = 18;
LABEL_45:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v17, v18, buf, v20);
    goto LABEL_46;
  }
  v4 = v3;
  v58 = 0;
  v5 = +[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v3, 1, &v58);
  if (v58 && objc_msgSend(v58, "code") != (id)260)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    v21 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      v22 = -[NSString UTF8String](-[NSURL path](v4, "path"), "UTF8String");
      *(_DWORD *)buf = 68289538;
      v60 = 0;
      v61 = 2082;
      v62 = "";
      v63 = 2082;
      *(_QWORD *)v64 = v22;
      *(_WORD *)&v64[8] = 2114;
      *(_QWORD *)&v64[10] = v58;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor #Warning Unable to read the contents of file\", \"file\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    }
    v23 = qword_1022A01C8;
    v13 = os_signpost_enabled((os_log_t)qword_1022A01C8);
    if (!v13)
      return v13;
    v24 = -[NSString UTF8String](-[NSURL path](v4, "path"), "UTF8String");
    *(_DWORD *)buf = 68289538;
    v60 = 0;
    v61 = 2082;
    v62 = "";
    v63 = 2082;
    *(_QWORD *)v64 = v24;
    *(_WORD *)&v64[8] = 2114;
    *(_QWORD *)&v64[10] = v58;
    v17 = "#monitor #Warning Unable to read the contents of file";
    v18 = "{\"msg%{public}.0s\":\"#monitor #Warning Unable to read the contents of file\", \"file\":%{public, location:es"
          "cape_only}s, \"error\":%{public, location:escape_only}@}";
LABEL_44:
    v19 = v23;
    v20 = 38;
    goto LABEL_45;
  }
  if (!v5)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    v25 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      v26 = -[NSString UTF8String](-[NSURL path](v4, "path"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      v60 = 0;
      v61 = 2082;
      v62 = "";
      v63 = 2082;
      *(_QWORD *)v64 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor no conditions were saved\", \"file\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    goto LABEL_53;
  }
  v6 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", (char *)-[NSData length](v5, "length") - 32);
  v7 = -[NSData bytes](v5, "bytes");
  v8 = -[NSData bytes](self->_encryptionKey, "bytes");
  v9 = -[NSData length](self->_encryptionKey, "length");
  objc_msgSend(v6, "mutableBytes");
  v10 = CCCryptorGCMOneshotDecrypt(0, v8, v9, v7, 16, 0, 0);
  if (!v10)
  {
    v27 = atomic_load((unsigned __int8 *)&qword_102306DB0);
    if ((v27 & 1) == 0 && __cxa_guard_acquire(&qword_102306DB0))
    {
      v57 = objc_opt_class(CLMonitoringRecord, v38);
      v56 = objc_opt_class(CLMonitoringEvent, v39);
      v55 = objc_opt_class(NSNumber, v40);
      v42 = objc_opt_class(NSDictionary, v41);
      v44 = objc_opt_class(NSString, v43);
      v46 = objc_opt_class(NSDate, v45);
      v48 = objc_opt_class(CLCircularGeographicCondition, v47);
      v50 = objc_opt_class(CLBeaconIdentityCondition, v49);
      v52 = objc_opt_class(CLMinimumAltitudeCondition, v51);
      qword_102306DA8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v57, v56, v55, v42, v44, v46, v48, v50, v52, objc_opt_class(CLCondition, v53), 0);
      __cxa_guard_release(&qword_102306DB0);
    }
    v28 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", qword_102306DA8, v6, &v58);
    if (!v58)
    {
      v29 = v28;
      if (v28)
      {
        v30 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
        objc_msgSend(v30, "addEntriesFromDictionary:", v29);
        if (objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("kCLLedgerVersionNumber")))
        {
          self->_ledgerVersionNumber = (NSNumber *)objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("kCLLedgerVersionNumber"));
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_1021739E0);
          v31 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          {
            v32 = -[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber");
            *(_DWORD *)buf = 68289282;
            v60 = 0;
            v61 = 2082;
            v62 = "";
            v63 = 2114;
            *(_QWORD *)v64 = v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Found ledger version number\", \"ledgerVersion\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
          objc_msgSend(v30, "removeObjectForKey:", CFSTR("kCLLedgerVersionNumber"));
        }
        else
        {
          self->_ledgerVersionNumber = (NSNumber *)&off_10221BC48;
        }
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_1021739A0);
        v36 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
        {
          v37 = objc_msgSend(v30, "count");
          *(_DWORD *)buf = 68289282;
          v60 = 0;
          v61 = 2082;
          v62 = "";
          v63 = 2050;
          *(_QWORD *)v64 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor file has conditions saved\", \"count\":%{public}ld}", buf, 0x1Cu);
        }
        -[NSMutableDictionary addEntriesFromDictionary:](self->_recordTable, "addEntriesFromDictionary:", v30);
LABEL_53:
        LOBYTE(v13) = 1;
        return v13;
      }
    }
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    v33 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      v34 = -[NSString UTF8String](-[NSURL path](v4, "path"), "UTF8String");
      *(_DWORD *)buf = 68289539;
      v60 = 0;
      v61 = 2082;
      v62 = "";
      v63 = 2081;
      *(_QWORD *)v64 = v34;
      *(_WORD *)&v64[8] = 2114;
      *(_QWORD *)&v64[10] = v58;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor #Warning unable to read conditions from file\", \"file\":%{private, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    }
    v23 = qword_1022A01C8;
    v13 = os_signpost_enabled((os_log_t)qword_1022A01C8);
    if (!v13)
      return v13;
    v35 = -[NSString UTF8String](-[NSURL path](v4, "path"), "UTF8String");
    *(_DWORD *)buf = 68289539;
    v60 = 0;
    v61 = 2082;
    v62 = "";
    v63 = 2081;
    *(_QWORD *)v64 = v35;
    *(_WORD *)&v64[8] = 2114;
    *(_QWORD *)&v64[10] = v58;
    v17 = "#monitor #Warning unable to read conditions from file";
    v18 = "{\"msg%{public}.0s\":\"#monitor #Warning unable to read conditions from file\", \"file\":%{private, location:e"
          "scape_only}s, \"error\":%{public, location:escape_only}@}";
    goto LABEL_44;
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021739A0);
  v11 = qword_1022A01C8;
  v12 = os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT);
  LOBYTE(v13) = 0;
  if (v12)
  {
    v14 = -[CLConditionLedger ledgerFile](self, "ledgerFile");
    *(_DWORD *)buf = 68289538;
    v60 = 0;
    v61 = 2082;
    v62 = "";
    v63 = 1026;
    *(_DWORD *)v64 = v10;
    *(_WORD *)&v64[4] = 2114;
    *(_QWORD *)&v64[6] = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #Warning unable to decrypt the conditions\", \"error\":%{public}d, \"ledger\":%{public, location:escape_only}@}", buf, 0x22u);
LABEL_46:
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (BOOL)writeToFile
{
  NSURL *v3;
  id v4;
  NSData *v5;
  NSData *v6;
  id v7;
  char *v8;
  char *v9;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSString *v25;
  unsigned __int8 v26;
  NSObject *v27;
  NSString *v28;
  uint64_t v29;
  NSString *v30;
  uint64_t v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  NSString *v38;
  __int16 v39;
  uint64_t v40;

  v3 = -[CLConditionLedger ledgerFile](self, "ledgerFile");
  if (!v3)
    return (char)v3;
  if (!-[NSDictionary count](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"), "count"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021739E0);
    v22 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      v34 = 0;
      v35 = 2082;
      v36 = "";
      v37 = 2114;
      v38 = -[NSURL path](-[CLConditionLedger ledgerFile](self, "ledgerFile"), "path");
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor nothing to write; Removing existing file\", \"file\":%{public, location:escape_only}@}",
        buf,
        0x1Cu);
    }
    -[CLConditionLedger deleteLedgerFile](self, "deleteLedgerFile");
    goto LABEL_26;
  }
  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v4, "addEntriesFromDictionary:", -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"));
  objc_msgSend(v4, "setObject:forKey:", -[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber"), CFSTR("kCLLedgerVersionNumber"));
  v32 = 0;
  v5 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4), 1, &v32);
  if (v32 || (v6 = v5) == 0)
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    v23 = qword_1022A01C8;
    v24 = os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v3) = 0;
    if (v24)
    {
      v25 = -[NSURL path](-[CLConditionLedger ledgerFile](self, "ledgerFile"), "path");
      *(_DWORD *)buf = 68289538;
      v34 = 0;
      v35 = 2082;
      v36 = "";
      v37 = 2114;
      v38 = v25;
      v39 = 2114;
      v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Unable to store conditions\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
LABEL_41:
      LOBYTE(v3) = 0;
      return (char)v3;
    }
    return (char)v3;
  }
  v7 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", (char *)-[NSData length](v5, "length") + 32);
  v8 = (char *)objc_msgSend(v7, "mutableBytes");
  v9 = (char *)-[NSData length](v6, "length") + (_QWORD)(v8 + 16);
  v10 = SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v8);
  if (v10)
  {
    v11 = v10;
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    v12 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      v34 = 0;
      v35 = 2082;
      v36 = "";
      v37 = 1026;
      LODWORD(v38) = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to init random vector\", \"error\":%{public}d}", buf, 0x18u);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    }
    v13 = qword_1022A01C8;
    if (os_signpost_enabled((os_log_t)qword_1022A01C8))
    {
      *(_DWORD *)buf = 68289282;
      v34 = 0;
      v35 = 2082;
      v36 = "";
      v37 = 1026;
      LODWORD(v38) = v11;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to init random vector", "{\"msg%{public}.0s\":\"#monitor unable to init random vector\", \"error\":%{public}d}", buf, 0x18u);
    }
  }
  v14 = CCCryptorGCMOneshotEncrypt(0, -[NSData bytes](self->_encryptionKey, "bytes"), -[NSData length](self->_encryptionKey, "length"), v8, 16, 0, 0, -[NSData bytes](v6, "bytes"), -[NSData length](v6, "length"), v8 + 16, v9, 16);
  if (v14)
  {
    v15 = v14;
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    v16 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      v34 = 0;
      v35 = 2082;
      v36 = "";
      v37 = 1026;
      LODWORD(v38) = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to encrypt the conditions\", \"error\":%{public}d}", buf, 0x18u);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_1021739A0);
    }
    v17 = qword_1022A01C8;
    LODWORD(v3) = os_signpost_enabled((os_log_t)qword_1022A01C8);
    if ((_DWORD)v3)
    {
      *(_DWORD *)buf = 68289282;
      v34 = 0;
      v35 = 2082;
      v36 = "";
      v37 = 1026;
      LODWORD(v38) = v15;
      v18 = "#monitor unable to encrypt the conditions";
      v19 = "{\"msg%{public}.0s\":\"#monitor unable to encrypt the conditions\", \"error\":%{public}d}";
      v20 = v17;
      v21 = 24;
LABEL_40:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v18, v19, buf, v21);
      goto LABEL_41;
    }
    return (char)v3;
  }
  v26 = objc_msgSend(v7, "writeToURL:options:error:", -[CLConditionLedger ledgerFile](self, "ledgerFile"), 1073741825, &v32);
  if (!v32 && (v26 & 1) != 0)
  {
LABEL_26:
    LOBYTE(v3) = 1;
    return (char)v3;
  }
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021739A0);
  v27 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_ERROR))
  {
    v28 = -[NSURL path](-[CLConditionLedger ledgerFile](self, "ledgerFile"), "path");
    *(_DWORD *)buf = 68289538;
    v34 = 0;
    v35 = 2082;
    v36 = "";
    v37 = 2114;
    v38 = v28;
    v39 = 2114;
    v40 = v32;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#monitor #Warning unable to write to file\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_1021739A0);
  }
  v29 = qword_1022A01C8;
  LODWORD(v3) = os_signpost_enabled((os_log_t)qword_1022A01C8);
  if ((_DWORD)v3)
  {
    v30 = -[NSURL path](-[CLConditionLedger ledgerFile](self, "ledgerFile"), "path");
    *(_DWORD *)buf = 68289538;
    v34 = 0;
    v35 = 2082;
    v36 = "";
    v37 = 2114;
    v38 = v30;
    v39 = 2114;
    v40 = v32;
    v18 = "#monitor #Warning unable to write to file";
    v19 = "{\"msg%{public}.0s\":\"#monitor #Warning unable to write to file\", \"file\":%{public, location:escape_only}@,"
          " \"error\":%{public, location:escape_only}@}";
    v20 = v29;
    v21 = 38;
    goto LABEL_40;
  }
  return (char)v3;
}

- (void)deleteLedgerFile
{
  NSObject *v3;
  NSURL *v4;
  uint64_t v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  NSURL *v11;
  __int16 v12;
  uint64_t v13;

  v5 = 0;
  -[NSFileManager removeItemAtURL:error:](-[CLConditionLedger defaultFileManager](self, "defaultFileManager"), "removeItemAtURL:error:", -[CLConditionLedger ledgerFile](self, "ledgerFile"), &v5);
  if (qword_1022A01C0 != -1)
    dispatch_once(&qword_1022A01C0, &stru_1021739A0);
  v3 = qword_1022A01C8;
  if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[CLConditionLedger ledgerFile](self, "ledgerFile");
    *(_DWORD *)buf = 68289538;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2114;
    v11 = v4;
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor deleting\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
  }
}

- (BOOL)addRecordForMonitoring:(id)a3 identifier:(id)a4 persist:(BOOL)a5
{
  _BOOL4 v5;

  v5 = a5;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordTable, "setObject:forKeyedSubscript:", a3, a4);
  if (v5)
    return -[CLConditionLedger writeToFile](self, "writeToFile");
  else
    return 1;
}

- (void)updateRecord:(id)a3 identifier:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordTable, "setObject:forKeyedSubscript:", a3, a4);
}

- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_recordTable, "removeObjectForKey:", a3);
  return -[CLConditionLedger writeToFile](self, "writeToFile");
}

- (void)updateEvent:(id)a3 forIdentifier:(id)a4
{
  objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_recordTable, "objectForKeyedSubscript:", a4), "updateEvent:", a3);
  -[CLConditionLedger writeToFile](self, "writeToFile");
}

- (id)monitoringRecordForIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_recordTable, "objectForKeyedSubscript:", a3);
}

- (NSDictionary)allMonitoringRecordsByIdentifier
{
  return &self->_recordTable->super;
}

- (NSArray)allMonitoringIdentifiers
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_recordTable, "allKeys");
}

- (NSString)ledgerName
{
  return self->_ledgerName;
}

- (NSNumber)ledgerVersionNumber
{
  return self->_ledgerVersionNumber;
}

- (NSURL)ledgerFile
{
  return self->_ledgerFile;
}

@end

@implementation FTWidgetLingerState

- (FTWidgetLingerState)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTWidgetLingerState init]";
    v7 = 2080;
    v8 = "FTWidgetLingerEventTracker.m";
    v9 = 1024;
    v10 = 35;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTWidgetLingerState init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTWidgetLingerState)initWithTodaySource:(id)a3 appConfigTreatmentID:(id)a4 widgetDisplayMode:(unint64_t)a5 appearanceType:(unint64_t)a6
{
  id v10;
  id v11;
  FTWidgetLingerState *v12;
  NSString *v13;
  NSString *todaySourceIdentifier;
  NSNumber *v15;
  NSNumber *appConfigTreatmentID;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100091DC8();
  v18.receiver = self;
  v18.super_class = (Class)FTWidgetLingerState;
  v12 = -[FTWidgetLingerState init](&v18, "init");
  if (v12)
  {
    v13 = (NSString *)objc_msgSend(v10, "copy");
    todaySourceIdentifier = v12->_todaySourceIdentifier;
    v12->_todaySourceIdentifier = v13;

    v15 = (NSNumber *)objc_msgSend(v11, "copy");
    appConfigTreatmentID = v12->_appConfigTreatmentID;
    v12->_appConfigTreatmentID = v15;

    v12->_widgetDisplayMode = a5;
    v12->_appearanceType = a6;
  }

  return v12;
}

- (NSString)todaySourceIdentifier
{
  return self->_todaySourceIdentifier;
}

- (NSNumber)appConfigTreatmentID
{
  return self->_appConfigTreatmentID;
}

- (unint64_t)widgetDisplayMode
{
  return self->_widgetDisplayMode;
}

- (unint64_t)appearanceType
{
  return self->_appearanceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigTreatmentID, 0);
  objc_storeStrong((id *)&self->_todaySourceIdentifier, 0);
}

@end

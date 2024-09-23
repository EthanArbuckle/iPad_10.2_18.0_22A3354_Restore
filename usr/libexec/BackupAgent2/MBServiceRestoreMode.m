@implementation MBServiceRestoreMode

+ (int)restoreTypeForContainerType:(int)a3
{
  int result;

  result = 1;
  switch(a3)
  {
    case 0:
    case 4:
    case 5:
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Unexpected container type: %d"), *(_QWORD *)&a3);
      result = 0;
      break;
    case 2:
    case 3:
      result = a3;
      break;
    default:
      return result;
  }
  return result;
}

+ (id)foregroundRestoreMode
{
  return -[MBServiceRestoreMode _initWithType:value:errorCode:]([MBServiceRestoreMode alloc], "_initWithType:value:errorCode:", 0, 0, 0);
}

+ (id)foregroundDataSeparatedRestoreMode
{
  return -[MBServiceRestoreMode _initWithType:value:errorCode:]([MBServiceRestoreMode alloc], "_initWithType:value:errorCode:", 6, 0, 0);
}

+ (id)backgroundAppRestoreModeWithBundleID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[MBServiceRestoreMode _initWithType:value:errorCode:]([MBServiceRestoreMode alloc], "_initWithType:value:errorCode:", 1, v3, 0);

  return v4;
}

+ (id)backgroundDataSeparatedAppRestoreModeWithBundleID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[MBServiceRestoreMode _initWithType:value:errorCode:]([MBServiceRestoreMode alloc], "_initWithType:value:errorCode:", 7, v3, 0);

  return v4;
}

+ (id)backgroundAppRestoreModeWithBundleID:(id)a3 errorCode:(int)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[MBServiceRestoreMode _initWithType:value:errorCode:]([MBServiceRestoreMode alloc], "_initWithType:value:errorCode:", 1, v5, v4);

  return v6;
}

+ (id)backgroundAppPluginRestoreModeWithBundleID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[MBServiceRestoreMode _initWithType:value:errorCode:]([MBServiceRestoreMode alloc], "_initWithType:value:errorCode:", 2, v3, 0);

  return v4;
}

+ (id)backgroundAppGroupRestoreModeWithBundleID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[MBServiceRestoreMode _initWithType:value:errorCode:]([MBServiceRestoreMode alloc], "_initWithType:value:errorCode:", 3, v3, 0);

  return v4;
}

+ (id)backgroundContainerRestoreModeWithContainer:(id)a3
{
  id v3;
  uint64_t v4;
  MBServiceRestoreMode *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = +[MBServiceRestoreMode restoreTypeForContainerType:](MBServiceRestoreMode, "restoreTypeForContainerType:", objc_msgSend(v3, "containerType"));
  v5 = [MBServiceRestoreMode alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v7 = -[MBServiceRestoreMode _initWithType:value:errorCode:](v5, "_initWithType:value:errorCode:", v4, v6, 0);
  return v7;
}

+ (id)backgroundFileRestoreModeWithPath:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[MBServiceRestoreMode _initWithType:value:errorCode:]([MBServiceRestoreMode alloc], "_initWithType:value:errorCode:", 4, v3, 0);

  return v4;
}

+ (id)backgroundFilesRestoreModeWithPaths:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[MBServiceRestoreMode _initWithType:values:errorCode:]([MBServiceRestoreMode alloc], "_initWithType:values:errorCode:", 5, v3, 0);

  return v4;
}

+ (id)restoreModeWithType:(int)a3 value:(id)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = -[MBServiceRestoreMode _initWithType:value:errorCode:]([MBServiceRestoreMode alloc], "_initWithType:value:errorCode:", v4, v5, 0);

  return v6;
}

+ (id)stringForType:(int)a3
{
  if ((a3 - 1) > 6)
    return CFSTR("foreground restore");
  else
    return off_1000D9150[a3 - 1];
}

+ (id)stringForErrorCode:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_1000D9188[a3];
}

- (id)_initWithType:(int)a3 value:(id)a4 errorCode:(int)a5
{
  id v9;
  MBServiceRestoreMode *v10;
  MBServiceRestoreMode *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MBServiceRestoreMode;
  v10 = -[MBServiceRestoreMode init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_value, a4);
    v11->_errorCode = a5;
  }

  return v11;
}

- (id)_initWithType:(int)a3 values:(id)a4 errorCode:(int)a5
{
  id v9;
  MBServiceRestoreMode *v10;
  MBServiceRestoreMode *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MBServiceRestoreMode;
  v10 = -[MBServiceRestoreMode init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_values, a4);
    v11->_errorCode = a5;
  }

  return v11;
}

- (id)_typeString
{
  return +[MBServiceRestoreMode stringForType:](MBServiceRestoreMode, "stringForType:", -[MBServiceRestoreMode type](self, "type"));
}

- (NSString)errorString
{
  return (NSString *)+[MBServiceRestoreMode stringForErrorCode:](MBServiceRestoreMode, "stringForErrorCode:", self->_errorCode);
}

- (BOOL)isForeground
{
  int type;

  type = self->_type;
  return !type || type == 6;
}

- (BOOL)isBackgroundApp
{
  int type;

  type = self->_type;
  return type == 1 || type == 7;
}

- (BOOL)isBackgroundFile
{
  return self->_type == 4;
}

- (BOOL)isBackgroundFiles
{
  return self->_type == 5;
}

- (NSString)bundleID
{
  void *v5;

  if (!-[MBServiceRestoreMode isBackgroundApp](self, "isBackgroundApp"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceRestoreMode.m"), 142, CFSTR("Not background app restore"));

  }
  return self->_value;
}

- (NSString)path
{
  void *v5;

  if (!-[MBServiceRestoreMode isBackgroundFile](self, "isBackgroundFile"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceRestoreMode.m"), 147, CFSTR("Not background file restore"));

  }
  return self->_value;
}

- (NSArray)paths
{
  void *v5;

  if (!-[MBServiceRestoreMode isBackgroundFiles](self, "isBackgroundFiles"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceRestoreMode.m"), 152, CFSTR("Not background files restore"));

  }
  return self->_values;
}

- (BOOL)didFail
{
  void *v5;

  if (!-[MBServiceRestoreMode isBackgroundApp](self, "isBackgroundApp"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceRestoreMode.m"), 157, CFSTR("Not background app restore"));

  }
  return self->_errorCode == 1;
}

- (BOOL)wasCancelled
{
  void *v5;

  if (!-[MBServiceRestoreMode isBackgroundApp](self, "isBackgroundApp"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceRestoreMode.m"), 162, CFSTR("Not background app restore"));

  }
  return self->_errorCode == 2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = objc_opt_class(MBServiceRestoreMode);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v6 = objc_msgSend(v4, "type"), v6 == -[MBServiceRestoreMode type](self, "type")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBServiceRestoreMode value](self, "value"));
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBServiceRestoreMode _typeString](self, "_typeString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: type='%@', value=\"%@\", values=\"%@\", errorCode=%d>"), v3, v4, self->_value, self->_values, self->_errorCode));

  return v5;
}

- (int)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end

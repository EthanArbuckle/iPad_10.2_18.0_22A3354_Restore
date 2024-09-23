@implementation CLPersistentDictionary

- (void)markModifiedDirty
{
  self->_modified = 1;
}

- (NSMutableDictionary)underlyingDictionary
{
  return self->_underlyingDictionary;
}

- (void)persist
{
  NSMutableDictionary *v3;
  NSString *v4;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  NSData *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17[2];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  uint64_t v25;

  if (-[CLPersistentDictionary isModified](self, "isModified"))
  {
    v3 = -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary");
    v4 = -[CLPersistentDictionary filename](self, "filename");
    v5 = -[CLPersistentDictionary dataProtection](self, "dataProtection");
    if (byte_102306368 == 1)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102165748);
      v6 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        v22 = 2114;
        v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary saving to file which didn't exist on boot\", \"file\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
    }
    v7 = objc_autoreleasePoolPush();
    sub_100131938(v17, (uint64_t)"CLPersistentDictionary saving to file", 0);
    v16 = 0;
    v8 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v3, 200, 0, &v16);
    if (v16)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102165748);
      v9 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        v22 = 2114;
        v23 = v4;
        v24 = 2114;
        v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary Errors serializing the plist indicate non-plist types being stored therein\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102165748);
      }
      v10 = qword_1022A01D8;
      if (!os_signpost_enabled((os_log_t)qword_1022A01D8))
        goto LABEL_29;
      *(_DWORD *)buf = 68289538;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v4;
      v24 = 2114;
      v25 = v16;
      v11 = "#PersistentDictionary Errors serializing the plist indicate non-plist types being stored therein";
      v12 = "{\"msg%{public}.0s\":\"#PersistentDictionary Errors serializing the plist indicate non-plist types being sto"
            "red therein\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}";
    }
    else
    {
      v13 = 536870913;
      if (v5)
        v13 = 1;
      if (v5 == 1)
        v14 = 1073741825;
      else
        v14 = v13;
      -[NSData writeToFile:options:error:](v8, "writeToFile:options:error:", v4, v14, &v16);
      if (!v16)
        goto LABEL_29;
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102165748);
      v15 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        v22 = 2114;
        v23 = v4;
        v24 = 2114;
        v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary Writing plist to file should never result in an error\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102165748);
      }
      v10 = qword_1022A01D8;
      if (!os_signpost_enabled((os_log_t)qword_1022A01D8))
        goto LABEL_29;
      *(_DWORD *)buf = 68289538;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v4;
      v24 = 2114;
      v25 = v16;
      v11 = "#PersistentDictionary Writing plist to file should never result in an error";
      v12 = "{\"msg%{public}.0s\":\"#PersistentDictionary Writing plist to file should never result in an error\", \"file"
            "\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}";
    }
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, buf, 0x26u);
LABEL_29:
    sub_100131740(v17);
    objc_autoreleasePoolPop(v7);
    -[CLPersistentDictionary markModifiedClean](self, "markModifiedClean");
  }
}

+ (id)persistentDictionaryWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithFilename:withDataProtectionClass:", a3, *(_QWORD *)&a4);
}

- (CLPersistentDictionary)initWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  CLPersistentDictionary *v6;
  CLPersistentDictionary *v7;
  objc_super v9;

  if (!a3)
    sub_101916A9C();
  v9.receiver = self;
  v9.super_class = (Class)CLPersistentDictionary;
  v6 = -[CLPersistentDictionary init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLPersistentDictionary setUnderlyingDictionary:](v6, "setUnderlyingDictionary:", 0);
    v7->_filename = (NSString *)a3;
    v7->_dataProtection = a4;
    -[CLPersistentDictionary refresh](v7, "refresh");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CLPersistentDictionary setUnderlyingDictionary:](self, "setUnderlyingDictionary:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLPersistentDictionary;
  -[CLPersistentDictionary dealloc](&v3, "dealloc");
}

- (id)dictionary
{
  return -[NSMutableDictionary cl_deepMutableCopy](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "cl_deepMutableCopy");
}

- (void)setDictionary:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToDictionary:", -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary")) & 1) == 0)
  {
    -[CLPersistentDictionary setUnderlyingDictionary:](self, "setUnderlyingDictionary:", +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3));
    -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
  }
}

- (void)refresh
{
  NSString *v3;
  NSData *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  id v25;

  -[CLPersistentDictionary markModifiedClean](self, "markModifiedClean");
  v3 = -[CLPersistentDictionary filename](self, "filename");
  v17 = 0;
  v4 = +[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v3, 0, &v17);
  if (!v4)
  {
    if (qword_102306370 != -1)
      dispatch_once(&qword_102306370, &stru_102165768);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102165748);
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v3;
      v24 = 2114;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary #warning Couldn't load plist from file. Defaulting to empty dictionary.\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    goto LABEL_17;
  }
  v5 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 1, 0, &v17);
  if (v17)
    goto LABEL_3;
  v13 = v5;
  v14 = objc_opt_class(NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    goto LABEL_18;
  if (v17)
  {
LABEL_3:
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102165748);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289538;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v3;
      v24 = 2114;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary Deserializing data loaded from file failed. Defaulting to empty dictionary.\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102165748);
    }
    v8 = qword_1022A01D8;
    if (!os_signpost_enabled((os_log_t)qword_1022A01D8))
      goto LABEL_17;
    *(_DWORD *)buf = 68289538;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2114;
    v23 = v3;
    v24 = 2114;
    v25 = v17;
    v9 = "#PersistentDictionary Deserializing data loaded from file failed. Defaulting to empty dictionary.";
    v10 = "{\"msg%{public}.0s\":\"#PersistentDictionary Deserializing data loaded from file failed. Defaulting to empty d"
          "ictionary.\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}";
    v11 = v8;
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102165748);
    v15 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289538;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v3;
      v24 = 2114;
      v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary Data loaded from file isn't a dictionary. Defaulting to empty dictionary.\", \"file\":%{public, location:escape_only}@, \"data\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102165748);
    }
    v16 = qword_1022A01D8;
    if (!os_signpost_enabled((os_log_t)qword_1022A01D8))
      goto LABEL_17;
    *(_DWORD *)buf = 68289538;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2114;
    v23 = v3;
    v24 = 2114;
    v25 = v13;
    v9 = "#PersistentDictionary Data loaded from file isn't a dictionary. Defaulting to empty dictionary.";
    v10 = "{\"msg%{public}.0s\":\"#PersistentDictionary Data loaded from file isn't a dictionary. Defaulting to empty dic"
          "tionary.\", \"file\":%{public, location:escape_only}@, \"data\":%{public, location:escape_only}@}";
    v11 = v16;
  }
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v9, v10, buf, 0x26u);
LABEL_17:
  v13 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
LABEL_18:
  -[CLPersistentDictionary setUnderlyingDictionary:](self, "setUnderlyingDictionary:", v13);
}

- (void)clear
{
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", -[CLPersistentDictionary filename](self, "filename"), 0);
  -[CLPersistentDictionary refresh](self, "refresh");
}

- (BOOL)isModified
{
  return self->_modified;
}

- (void)markModifiedClean
{
  self->_modified = 0;
}

- (NSString)filename
{
  return self->_filename;
}

- (int)dataProtection
{
  return self->_dataProtection;
}

- (void)setUnderlyingDictionary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end

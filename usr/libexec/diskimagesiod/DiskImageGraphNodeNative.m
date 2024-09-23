@implementation DiskImageGraphNodeNative

- (id)toDIShadowNode
{
  DIShadowNode *v3;
  void *v4;
  DIShadowNode *v5;

  v3 = [DIShadowNode alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
  v5 = -[DIShadowNode initWithURL:isCache:](v3, "initWithURL:isCache:", v4, -[DiskImageGraphNode isCache](self, "isCache"));

  return v5;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  objc_super v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3));
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DiskImageGraphNodeNative;
  if (objc_msgSendSuper2(&v11, "validateWithDictionary:error:", v6, a4))
  {
    v8 = 0;
    if (objc_msgSend(v6, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("FilePath"), objc_opt_class(NSString, v7), 0, a4))
    {
      if (objc_msgSend(v6, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Validation failed, input contains unexpected data.")));
        v8 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v9, a4);

      }
      else
      {
        v8 = 1;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (DiskImageGraphNodeNative)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  NSURL *v13;
  NSURL *filePath;
  void *v15;
  DiskImageGraphNodeNative *v16;
  DiskImageGraphNodeNative *v17;
  objc_super v19;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  if (+[DiskImageGraphNodeNative validateWithDictionary:error:](DiskImageGraphNodeNative, "validateWithDictionary:error:", v10, a6))
  {
    v19.receiver = self;
    v19.super_class = (Class)DiskImageGraphNodeNative;
    self = -[DiskImageGraphNode initWithDictionary:updateChangesToDict:workDir:error:](&v19, "initWithDictionary:updateChangesToDict:workDir:error:", v10, v8, v11, a6);
    if (!self)
      goto LABEL_4;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("FilePath")));
    v13 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", v12, v11));
    filePath = self->_filePath;
    self->_filePath = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
    LOBYTE(v12) = objc_msgSend(v15, "checkResourceIsReachableAndReturnError:", a6);

    if ((v12 & 1) == 0)
    {
      v16 = (DiskImageGraphNodeNative *)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 2, CFSTR("Image referenced in the pstack is unreachable."), a6));
    }
    else
    {
LABEL_4:
      v16 = self;
      self = v16;
    }
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (DiskImageGraphNodeNative)initWithURL:(id)a3 tag:(id)a4 UUID:(id)a5 parentNode:(id)a6 metadata:(id)a7 isCache:(BOOL)a8
{
  _BOOL8 v8;
  id v15;
  DiskImageGraphNodeNative *v16;
  DiskImageGraphNodeNative *v17;
  objc_super v19;

  v8 = a8;
  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DiskImageGraphNodeNative;
  v16 = -[DiskImageGraphNode initWithTag:UUID:parentNode:metadata:isCache:](&v19, "initWithTag:UUID:parentNode:metadata:isCache:", a4, a5, a6, a7, v8);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_filePath, a3);

  return v17;
}

- (void)setFilePath:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_filePath, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativeString"));
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("FilePath"));

  }
}

- (BOOL)deleteImage
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
  v20 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", v4, &v20);
  v6 = v20;

  if ((v5 & 1) == 0)
  {
    v7 = *__error();
    if (sub_1000BF0BC())
    {
      v19 = 0;
      v8 = sub_1000BF044();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        v10 = 3;
      else
        v10 = 2;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
      *(_DWORD *)buf = 68158466;
      v22 = 39;
      v23 = 2080;
      v24 = "-[DiskImageGraphNodeNative deleteImage]";
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v12;
      v13 = (char *)_os_log_send_and_compose_impl(v10, &v19, 0, 0, &_mh_execute_header, v9, 16, "%.*s: Failed to delete %@: %@", buf, 38);

      if (v13)
      {
        fprintf(__stderrp, "%s\n", v13);
        free(v13);
      }
    }
    else
    {
      v14 = sub_1000BF044();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
        *(_DWORD *)buf = 68158466;
        v22 = 39;
        v23 = 2080;
        v24 = "-[DiskImageGraphNodeNative deleteImage]";
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%.*s: Failed to delete %@: %@", buf, 0x26u);

      }
    }
    *__error() = v7;
  }

  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DiskImageGraphNodeNative;
  v3 = -[DiskImageGraphNode toDictionary](&v9, "toDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("FilePath"));

  return v5;
}

- (id)URL
{
  return self->_filePath;
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end

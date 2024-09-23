@implementation SDLog

- (SDLog)init
{
  return -[SDLog initWithPath:subdirectory:error:](self, "initWithPath:subdirectory:error:", &stru_10009DC10, &stru_10009DC10, 0);
}

- (SDLog)initWithPath:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  SDLog *v11;
  SDLog *v12;
  void **p_path;
  NSArray *offsets;
  NSArray *sizes;
  uint64_t v16;
  NSString *filename;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *fileType;
  id v23;
  SDLog *v24;
  void *v25;
  uint64_t v26;
  NSDate *creationDate;
  uint64_t v28;
  NSDate *modificationDate;
  NSString *fileOwner;
  uint64_t v31;
  NSString *v32;
  objc_super v34;
  uint8_t buf[4];
  void *v36;

  v9 = a3;
  v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SDLog;
  v11 = -[SDLog init](&v34, "init");
  v12 = v11;
  if (v11)
  {
    p_path = (void **)&v11->_path;
    objc_storeStrong((id *)&v11->_path, a3);
    objc_storeStrong((id *)&v12->_subdirectory, a4);
    offsets = v12->_offsets;
    v12->_offsets = 0;

    sizes = v12->_sizes;
    v12->_sizes = 0;

    v16 = objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v12->_path, "lastPathComponent"));
    filename = v12->_filename;
    v12->_filename = (NSString *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "attributesOfItemAtPath:error:", v12->_path, a5));
    v20 = v19;
    if (v19)
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fileType"));
      fileType = v12->_fileType;
      v12->_fileType = (NSString *)v21;

      if (v12->_fileType == NSFileTypeDirectory)
        v23 = (id)sub_100024694(*p_path);
      else
        v23 = objc_msgSend(v20, "fileSize");
      v12->_sizeBytes = (unint64_t)v23;
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fileCreationDate"));
      creationDate = v12->_creationDate;
      v12->_creationDate = (NSDate *)v26;

      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fileModificationDate"));
      modificationDate = v12->_modificationDate;
      v12->_modificationDate = (NSDate *)v28;

      fileOwner = v12->_fileOwner;
      v12->_fileOwner = 0;

      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", NSFileOwnerAccountName));
      v32 = v12->_fileOwner;
      v12->_fileOwner = (NSString *)v31;

      v24 = v12;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *p_path;
        *(_DWORD *)buf = 138412290;
        v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "couldn't get file attributes for %@", buf, 0xCu);
      }
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (int64_t)compareLogDateDescending:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "creationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDLog creationDate](self, "creationDate"));
  v6 = objc_msgSend(v4, "compare:", v5);

  return (int64_t)v6;
}

- (BOOL)supportsPartialCollection
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDLog path](self, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
  if ((objc_msgSend(v4, "containsString:", CFSTR("log")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDLog path](self, "path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathExtension"));
    v5 = objc_msgSend(v7, "containsString:", CFSTR("txt"));

  }
  return v5;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSString)subdirectory
{
  return self->_subdirectory;
}

- (void)setSubdirectory:(id)a3
{
  objc_storeStrong((id *)&self->_subdirectory, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (unint64_t)sizeBytes
{
  return self->_sizeBytes;
}

- (void)setSizeBytes:(unint64_t)a3
{
  self->_sizeBytes = a3;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
  objc_storeStrong((id *)&self->_fileType, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSString)fileOwner
{
  return self->_fileOwner;
}

- (void)setFileOwner:(id)a3
{
  objc_storeStrong((id *)&self->_fileOwner, a3);
}

- (NSArray)offsets
{
  return self->_offsets;
}

- (void)setOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_offsets, a3);
}

- (NSArray)sizes
{
  return self->_sizes;
}

- (void)setSizes:(id)a3
{
  objc_storeStrong((id *)&self->_sizes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_fileOwner, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_subdirectory, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end

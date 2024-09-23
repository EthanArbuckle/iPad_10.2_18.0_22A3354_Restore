@implementation REMFileAttachment

+ (id)cdEntityName
{
  return CFSTR("REMCDFileAttachment");
}

- (REMFileAttachment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 UTI:(id)a6 fileSize:(unint64_t)a7 fileURL:(id)a8 data:(id)a9
{
  id v15;
  id v16;
  id v17;
  REMFileAttachment *v18;
  REMFileAttachment *v19;
  void **p_fileURL;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v15 = a6;
  v16 = a8;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)REMFileAttachment;
  v18 = -[REMAttachment initWithObjectID:accountID:reminderID:UTI:](&v24, sel_initWithObjectID_accountID_reminderID_UTI_, a3, a4, a5, v15);
  v19 = v18;
  if (v18)
  {
    v18->_fileSize = a7;
    p_fileURL = (void **)&v18->_fileURL;
    objc_storeStrong((id *)&v18->_fileURL, a8);
    v19->_isTemporaryFileURL = 0;
    if (v17)
    {
      +[REMFileAttachment createTemporaryFileWithData:UTI:](REMFileAttachment, "createTemporaryFileWithData:UTI:", v17, v15);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *p_fileURL;
      *p_fileURL = (void *)v21;

      if (*p_fileURL)
        v19->_isTemporaryFileURL = 1;
    }
  }

  return v19;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Unable to remove temporary file because {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

+ (id)createTemporaryFileURLWithUTI:(id)a3
{
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v12;

  v3 = (__CFString *)UTTypeCopyPreferredTagWithClass((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5A88]);
  v12 = 0;
  +[REMPaths createTemporaryFileDirectoryURLIfNeededWithError:](REMPaths, "createTemporaryFileDirectoryURLIfNeededWithError:", &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "globallyUniqueString");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v3)
    {
      objc_msgSend(v8, "URLByAppendingPathExtension:", v3);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[REMFileAttachment createTemporaryFileURLWithUTI:].cold.1();
    v9 = 0;
  }

  return v9;
}

+ (id)createTemporaryFileWithData:(id)a3 UTI:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  v5 = a3;
  +[REMFileAttachment createTemporaryFileURLWithUTI:](REMFileAttachment, "createTemporaryFileURLWithUTI:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = 0;
    objc_msgSend(v5, "writeToURL:options:error:", v6, 1, &v10);
    v7 = v10;
    if (v7)
    {
      +[REMLogStore write](REMLogStore, "write");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[REMFileAttachment createTemporaryFileWithData:UTI:].cold.1();

      v6 = 0;
    }

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMFileAttachment;
  -[REMAttachment encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[REMFileAttachment fileSize](self, "fileSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fileSize"));
  -[REMFileAttachment fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3910]);
    -[REMFileAttachment fileURL](self, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithURL:readonly:", v8, -[REMFileAttachment isTemporaryFileURL](self, "isTemporaryFileURL") ^ 1);

    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("fileURL"));
  }
  objc_msgSend(v4, "encodeBool:forKey:", -[REMFileAttachment isTemporaryFileURL](self, "isTemporaryFileURL"), CFSTR("isTemporaryFileURL"));

}

- (REMFileAttachment)initWithCoder:(id)a3
{
  id v4;
  REMFileAttachment *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURL *fileURL;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)REMFileAttachment;
  v5 = -[REMAttachment initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileSize"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fileSize = objc_msgSend(v6, "unsignedLongLongValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "url");
      v9 = objc_claimAutoreleasedReturnValue();
      fileURL = v5->_fileURL;
      v5->_fileURL = (NSURL *)v9;

    }
    v5->_isTemporaryFileURL = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTemporaryFileURL"));

  }
  return v5;
}

- (id)_deepCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)REMFileAttachment;
  -[REMAttachment _deepCopy](&v17, sel__deepCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFileSize:", -[REMFileAttachment fileSize](self, "fileSize"));
  if (!-[REMFileAttachment isTemporaryFileURL](self, "isTemporaryFileURL")
    || (-[REMFileAttachment fileURL](self, "fileURL"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    -[REMFileAttachment fileURL](self, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v3;
    v14 = v6;
LABEL_9:
    objc_msgSend(v13, "setFileURL:", v14);
    goto LABEL_10;
  }
  -[REMAttachment uti](self, "uti");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMFileAttachment createTemporaryFileURLWithUTI:](REMFileAttachment, "createTemporaryFileURLWithUTI:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v13 = v3;
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMFileAttachment fileURL](self, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v7, "linkItemAtURL:toURL:error:", v8, v6, &v16);
  v9 = v16;

  if (v9)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[REMFileAttachment _deepCopy].cold.1();

    v11 = v3;
    v12 = 0;
  }
  else
  {
    v11 = v3;
    v12 = v6;
  }
  objc_msgSend(v11, "setFileURL:", v12);

LABEL_10:
  objc_msgSend(v3, "setIsTemporaryFileURL:", -[REMFileAttachment isTemporaryFileURL](self, "isTemporaryFileURL"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)REMFileAttachment;
  if (-[REMAttachment isEqual:](&v16, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "fileSize");
    if (v6 == -[REMFileAttachment fileSize](self, "fileSize"))
    {
      objc_msgSend(v5, "fileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMFileAttachment fileURL](self, "fileURL");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        objc_msgSend(v5, "fileURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMFileAttachment fileURL](self, "fileURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      v14 = objc_msgSend(v5, "isTemporaryFileURL");
      v13 = v14 ^ -[REMFileAttachment isTemporaryFileURL](self, "isTemporaryFileURL") ^ 1;
      goto LABEL_9;
    }
LABEL_5:
    LOBYTE(v13) = 0;
LABEL_9:

    goto LABEL_10;
  }
  LOBYTE(v13) = 0;
LABEL_10:

  return v13;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (BOOL)isTemporaryFileURL
{
  return self->_isTemporaryFileURL;
}

- (void)setIsTemporaryFileURL:(BOOL)a3
{
  self->_isTemporaryFileURL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

+ (void)createTemporaryFileURLWithUTI:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Unable to create temporary directory because {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

+ (void)createTemporaryFileWithData:UTI:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Unable to write temporary file because {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_deepCopy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Unable to link temporary file because {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end

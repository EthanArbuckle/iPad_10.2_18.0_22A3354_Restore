@implementation SEMFilesystemBase

- (BOOL)writeObject:(id)a3 toFileWithName:(id)a4 inDirectory:(id)a5
{
  id v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  void *inited;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  char v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend__resolveFileURLFromName_directory_(self, v9, (uint64_t)a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_10:
    v23 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v26 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[SEMFilesystemBase(FileStorage) writeObject:toFileWithName:inDirectory:]";
      v32 = 2112;
      v33 = v8;
      _os_log_error_impl(&dword_2462C4000, v26, OS_LOG_TYPE_ERROR, "%s Cannot archive object: %@ which does not conform to NSSecureCoding.", buf, 0x16u);
    }
    goto LABEL_10;
  }
  v11 = objc_alloc(MEMORY[0x24BDD1618]);
  inited = (void *)objc_msgSend_initRequiringSecureCoding_(v11, v12, 1);
  objc_msgSend_encodeWithCoder_(v8, v14, (uint64_t)inited);
  objc_msgSend_finishEncoding(inited, v15, v16);
  objc_msgSend_encodedData(inited, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v19, v20, v21))
  {
    v29 = 0;
    v23 = objc_msgSend_writeToURL_options_error_(v19, v22, (uint64_t)v10, 0, &v29);
    v24 = v29;
    if ((v23 & 1) == 0)
    {
      v25 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v31 = "-[SEMFilesystemBase(FileStorage) writeObject:toFileWithName:inDirectory:]";
        v32 = 2112;
        v33 = v10;
        v34 = 2112;
        v35 = v24;
        _os_log_error_impl(&dword_2462C4000, v25, OS_LOG_TYPE_ERROR, "%s Failed to write encoded object to file at URL: %@ error: %@", buf, 0x20u);
      }
    }

  }
  else
  {
    v27 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[SEMFilesystemBase(FileStorage) writeObject:toFileWithName:inDirectory:]";
      v32 = 2112;
      v33 = v8;
      _os_log_error_impl(&dword_2462C4000, v27, OS_LOG_TYPE_ERROR, "%s Failed to encode object: %@", buf, 0x16u);
    }
    v23 = 0;
  }

LABEL_15:
  return v23;
}

- (id)_resolveFileURLFromName:(id)a3 directory:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  char v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  int v28;
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend_length(v6, v8, v9))
  {
    v22 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v28 = 136315394;
    v29 = "-[SEMFilesystemBase(FileStorage) _resolveFileURLFromName:directory:]";
    v30 = 2112;
    v31 = v6;
    v23 = "%s Invalid file name: %@";
LABEL_13:
    _os_log_error_impl(&dword_2462C4000, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v28, 0x16u);
    goto LABEL_14;
  }
  if (!v7)
  {
    v24 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend_rootDirectory(self, v10, v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_relativeToURL_(v24, v26, (uint64_t)v6, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  if ((objc_msgSend_isChildOfRootDirectory_(self, v10, (uint64_t)v7) & 1) == 0)
  {
    v22 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v28 = 136315394;
    v29 = "-[SEMFilesystemBase(FileStorage) _resolveFileURLFromName:directory:]";
    v30 = 2112;
    v31 = v7;
    v23 = "%s directory: %@ is not a child directory of filesystem base root directory.";
    goto LABEL_13;
  }
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v7, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_fileExistsAtPath_(v14, v18, (uint64_t)v17);

  if ((v19 & 1) == 0)
  {
    v22 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v28 = 136315394;
      v29 = "-[SEMFilesystemBase(FileStorage) _resolveFileURLFromName:directory:]";
      v30 = 2112;
      v31 = v7;
      v23 = "%s No directory exists at URL: %@";
      goto LABEL_13;
    }
LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }
  objc_msgSend_fileURLWithPath_relativeToURL_(MEMORY[0x24BDBCF48], v20, (uint64_t)v6, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v21;
}

- (BOOL)fileExistsWithName:(id)a3 inDirectory:(id)a4
{
  const char *v5;
  void *v6;
  char v7;

  objc_msgSend__resolveFileURLFromName_directory_(self, a2, (uint64_t)a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = objc_msgSend__fileExistsAtURL_(self, v5, (uint64_t)v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)_fileExistsAtURL:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend_defaultManager(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend_fileExistsAtPath_(v7, v11, (uint64_t)v10);
  return (char)v4;
}

- (id)readFileWithName:(id)a3 objectClass:(Class)a4 inDirectory:(id)a5
{
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  const char *v27;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  void *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v10 = a5;
  if (a4)
  {
    objc_msgSend__resolveFileURLFromName_directory_(self, v9, (uint64_t)v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((objc_msgSend__fileExistsAtURL_(self, v11, (uint64_t)v12) & 1) != 0)
      {
        v35 = 0;
        objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x24BDBCE50], v13, (uint64_t)v12, 0, &v35);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v35;
        v16 = v15;
        if (!v14 || v15)
        {
          v24 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v37 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
            v38 = 2112;
            v39 = v12;
            v40 = 2112;
            v41 = v16;
            _os_log_error_impl(&dword_2462C4000, v24, OS_LOG_TYPE_ERROR, "%s Failed to read binary file at path: %@ due to error: %@", buf, 0x20u);
          }
          v21 = 0;
          goto LABEL_19;
        }
        v17 = objc_alloc(MEMORY[0x24BDD1620]);
        v34 = 0;
        v19 = (void *)objc_msgSend_initForReadingFromData_error_(v17, v18, (uint64_t)v14, &v34);
        v16 = v34;
        if (v16)
        {
          v20 = qword_25441F970;
          if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
            goto LABEL_8;
          *(_DWORD *)buf = 136315650;
          v37 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
          v38 = 2112;
          v39 = v12;
          v40 = 2112;
          v41 = v16;
          v30 = "%s Failed to decode object from binary file contents at path: %@ error: %@";
          v31 = v20;
          v32 = 32;
        }
        else
        {
          if (v19)
          {
            v26 = [a4 alloc];
            v21 = (void *)objc_msgSend_initWithCoder_(v26, v27, (uint64_t)v19);
            if (v21)
              goto LABEL_9;
            v28 = (id)qword_25441F970;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              NSStringFromClass(a4);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v37 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
              v38 = 2112;
              v39 = v33;
              v40 = 2112;
              v41 = v12;
              _os_log_error_impl(&dword_2462C4000, v28, OS_LOG_TYPE_ERROR, "%s Failed to decode object type: %@ for file: '%@'", buf, 0x20u);

            }
LABEL_8:
            v21 = 0;
LABEL_9:

LABEL_19:
            goto LABEL_20;
          }
          v29 = qword_25441F970;
          if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
            goto LABEL_8;
          *(_DWORD *)buf = 136315394;
          v37 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
          v38 = 2112;
          v39 = v12;
          v30 = "%s Failed to get an instance of unarchiver from the serialized data for file: '%@'";
          v31 = v29;
          v32 = 22;
        }
        _os_log_error_impl(&dword_2462C4000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
        goto LABEL_8;
      }
      v23 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
        v38 = 2112;
        v39 = v12;
        _os_log_error_impl(&dword_2462C4000, v23, OS_LOG_TYPE_ERROR, "%s No file exists at path: %@", buf, 0x16u);
      }
    }
    v21 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v22 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
    _os_log_error_impl(&dword_2462C4000, v22, OS_LOG_TYPE_ERROR, "%s Cannot decode object from file with nil objectClass.", buf, 0xCu);
  }
  v21 = 0;
LABEL_21:

  return v21;
}

- (BOOL)writeDictionary:(id)a3 toPlistFileWithName:(id)a4 inDirectory:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend__resolveFileURLFromName_directory_(self, v11, (uint64_t)v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = sub_2462ED6E4((uint64_t)v8, v12, -1, 0);
    else
      v13 = 0;

  }
  else
  {
    v14 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v16 = v14;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315650;
      v22 = "-[SEMFilesystemBase(FileStorage) writeDictionary:toPlistFileWithName:inDirectory:]";
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v20;
      _os_log_error_impl(&dword_2462C4000, v16, OS_LOG_TYPE_ERROR, "%s Unexpected object class: %@ object must be of class: %@", (uint8_t *)&v21, 0x20u);

    }
    v13 = 0;
  }

  return v13;
}

- (id)readDictionaryFromPlistFileWithName:(id)a3 inDirectory:(id)a4
{
  const char *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__resolveFileURLFromName_directory_(self, a2, (uint64_t)a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend__fileExistsAtURL_(self, v5, (uint64_t)v6) & 1) == 0)
  {
    v10 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[SEMFilesystemBase(FileStorage) readDictionaryFromPlistFileWithName:inDirectory:]";
      v21 = 2112;
      v22 = v6;
      _os_log_error_impl(&dword_2462C4000, v10, OS_LOG_TYPE_ERROR, "%s No file exists at path: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  v18 = 0;
  sub_2462ED8D0((uint64_t)v6, 0, (uint64_t)&v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
  }
  else
  {
    if (v7)
    {
      v11 = (void *)qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v13 = v11;
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v20 = "-[SEMFilesystemBase(FileStorage) readDictionaryFromPlistFileWithName:inDirectory:]";
        v21 = 2112;
        v22 = v6;
        v23 = 2112;
        v24 = v15;
        v25 = 2112;
        v26 = v17;
        v27 = 2112;
        v28 = v8;
        _os_log_error_impl(&dword_2462C4000, v13, OS_LOG_TYPE_ERROR, "%s Read Plist file at path: %@ and got unexpected class: %@ expected: %@ error: %@", buf, 0x34u);

      }
    }
    v9 = 0;
  }

LABEL_13:
  return v9;
}

- (SEMFilesystemBase)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMFilesystemBase)initWithRootDirectoryURL:(id)a3
{
  id v4;
  SEMFilesystemBase *v5;
  uint64_t v6;
  id v7;
  NSURL *rootDirectory;
  SEMFilesystemBase *v9;
  NSObject *v10;
  id v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SEMFilesystemBase;
  v5 = -[SEMFilesystemBase init](&v13, sel_init);
  if (!v5)
    goto LABEL_4;
  v12 = 0;
  sub_2462ED484(v4, &v12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  rootDirectory = v5->_rootDirectory;
  v5->_rootDirectory = (NSURL *)v6;

  if (v5->_rootDirectory)
  {

LABEL_4:
    v9 = v5;
    goto LABEL_8;
  }
  v10 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[SEMFilesystemBase initWithRootDirectoryURL:]";
    v16 = 2112;
    v17 = v7;
    _os_log_error_impl(&dword_2462C4000, v10, OS_LOG_TYPE_ERROR, "%s Failed to resolve/create base directory: %@", buf, 0x16u);
  }

  v9 = 0;
LABEL_8:

  return v9;
}

+ (id)baseURLWithTargetDirectoryPath:(id)a3 relativeToDirectoryPath:(id)a4
{
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)MEMORY[0x24BDBCF48];
  v6 = a3;
  objc_msgSend_fileURLWithPath_isDirectory_(v5, v7, (uint64_t)a4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v9, (uint64_t)v6, 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_absoluteURL(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SEMFilesystemBase;
  -[SEMFilesystemBase description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(" rootDirectory: %@"), self->_rootDirectory);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getOrCreateDirectoryWithRelativePath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;
  const char *v9;
  void *v10;
  NSURL *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSURL *rootDirectory;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  NSURL *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6))
  {
    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v7, (uint64_t)v4, 1, self->_rootDirectory);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isChildOfRootDirectory_(self, v9, (uint64_t)v8) & 1) != 0)
    {
      v18 = 0;
      sub_2462ED484(v8, &v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (NSURL *)v18;

      if (!v10)
      {
        v12 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v20 = "-[SEMFilesystemBase getOrCreateDirectoryWithRelativePath:]";
          v21 = 2112;
          v22 = v4;
          v23 = 2112;
          v24 = v11;
          _os_log_error_impl(&dword_2462C4000, v12, OS_LOG_TYPE_ERROR, "%s Failed to get or create directory (path: %@) error: %@", buf, 0x20u);
        }
      }
      v8 = v10;

      v13 = v8;
    }
    else
    {
      v15 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        rootDirectory = self->_rootDirectory;
        *(_DWORD *)buf = 136315650;
        v20 = "-[SEMFilesystemBase getOrCreateDirectoryWithRelativePath:]";
        v21 = 2112;
        v22 = v4;
        v23 = 2112;
        v24 = rootDirectory;
        _os_log_error_impl(&dword_2462C4000, v15, OS_LOG_TYPE_ERROR, "%s Cannot get or create directory (path: %@) which is not a child path of root directory: %@", buf, 0x20u);
      }
      v13 = 0;
    }

  }
  else
  {
    v14 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[SEMFilesystemBase getOrCreateDirectoryWithRelativePath:]";
      v21 = 2112;
      v22 = v4;
      _os_log_error_impl(&dword_2462C4000, v14, OS_LOG_TYPE_ERROR, "%s Cannot get or create directory with invalid path: %@", buf, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

- (BOOL)removeItemAtURL:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  char v18;
  NSURL *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSURL *rootDirectory;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  NSURL *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend_isChildOfRootDirectory_(self, v5, (uint64_t)v4) & 1) != 0)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v4, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_fileExistsAtPath_(v8, v12, (uint64_t)v11);

    if ((v13 & 1) != 0)
    {
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v18 = objc_msgSend_removeItemAtURL_error_(v16, v17, (uint64_t)v4, &v25);
      v19 = (NSURL *)v25;

      if ((v18 & 1) == 0)
      {
        v20 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v27 = "-[SEMFilesystemBase removeItemAtURL:]";
          v28 = 2112;
          v29 = v4;
          v30 = 2112;
          v31 = v19;
          _os_log_error_impl(&dword_2462C4000, v20, OS_LOG_TYPE_ERROR, "%s Failed to remove item at URL: %@ error: %@", buf, 0x20u);
        }
      }

    }
    else
    {
      v22 = qword_25441F970;
      v18 = 1;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[SEMFilesystemBase removeItemAtURL:]";
        v28 = 2112;
        v29 = v4;
        _os_log_impl(&dword_2462C4000, v22, OS_LOG_TYPE_INFO, "%s No item exists at path: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v21 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      rootDirectory = self->_rootDirectory;
      *(_DWORD *)buf = 136315650;
      v27 = "-[SEMFilesystemBase removeItemAtURL:]";
      v28 = 2112;
      v29 = v4;
      v30 = 2112;
      v31 = rootDirectory;
      _os_log_error_impl(&dword_2462C4000, v21, OS_LOG_TYPE_ERROR, "%s Cannot remove item (URL: %@) which is not a child path of root directory: %@", buf, 0x20u);
    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)removeAllContents
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  void *v18;
  char v19;
  void *v20;
  const char *v21;
  char v22;
  id v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootDirectory(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_enumeratorAtPath_(v4, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nextObject(v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v18 = (void *)v15;
    v19 = 1;
    *(_QWORD *)&v17 = 136315650;
    v29 = v17;
    do
    {
      objc_msgSend_stringByAppendingPathComponent_(v10, v16, (uint64_t)v18, v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v22 = objc_msgSend_removeItemAtPath_error_(v4, v21, (uint64_t)v20, &v30);
      v23 = v30;
      if ((v22 & 1) == 0)
      {
        v24 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v29;
          v32 = "-[SEMFilesystemBase removeAllContents]";
          v33 = 2112;
          v34 = v20;
          v35 = 2112;
          v36 = v23;
          _os_log_error_impl(&dword_2462C4000, v24, OS_LOG_TYPE_ERROR, "%s Failed to remove item at path: %@ error: %@", buf, 0x20u);
        }
        v19 = 0;
      }

      objc_msgSend_nextObject(v12, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v27;
    }
    while (v27);
  }
  else
  {
    v19 = 1;
  }

  return v19 & 1;
}

- (BOOL)isChildOfRootDirectory:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  unint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  char isEqualToString;
  const char *v28;
  uint64_t v29;

  v4 = a3;
  objc_msgSend_pathComponents(self->_rootDirectory, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteURL(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathComponents(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend_count(v13, v14, v15);
  if (v16 <= objc_msgSend_count(v7, v17, v18))
  {
    isEqualToString = 0;
  }
  else if (objc_msgSend_count(v7, v19, v20))
  {
    v22 = 0;
    do
    {
      objc_msgSend_objectAtIndex_(v7, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v13, v24, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v23, v26, (uint64_t)v25);

      if ((isEqualToString & 1) == 0)
        break;
      ++v22;
    }
    while (v22 < objc_msgSend_count(v7, v28, v29));
  }
  else
  {
    isEqualToString = 1;
  }

  return isEqualToString;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  _QWORD *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)objc_opt_class();
  v7 = (_QWORD *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v9 = objc_msgSend_copyWithZone_(self->_rootDirectory, v8, (uint64_t)a3);
  v10 = (void *)v7[1];
  v7[1] = v9;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SEMFilesystemBase *v4;
  SEMFilesystemBase *v5;
  const char *v6;
  char isEqualToFileManager;

  v4 = (SEMFilesystemBase *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToFileManager = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToFileManager = objc_msgSend_isEqualToFileManager_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToFileManager = 0;
  }

  return isEqualToFileManager;
}

- (BOOL)isEqualToFileManager:(id)a3
{
  NSURL *rootDirectory;
  void *v4;
  const char *v5;

  if (!a3)
    return 0;
  rootDirectory = self->_rootDirectory;
  objc_msgSend_rootDirectory(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(rootDirectory) = objc_msgSend_isEqual_(rootDirectory, v5, (uint64_t)v4);

  return (char)rootDirectory;
}

- (unint64_t)hash
{
  uint64_t v2;

  return objc_msgSend_hash(self->_rootDirectory, a2, v2);
}

- (NSURL)rootDirectory
{
  return self->_rootDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootDirectory, 0);
}

@end

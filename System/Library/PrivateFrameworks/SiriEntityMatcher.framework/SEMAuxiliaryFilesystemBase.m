@implementation SEMAuxiliaryFilesystemBase

+ (id)temporaryBaseWithName:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *isSaved;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  isSaved = (void *)objc_msgSend_initWithName_isSaved_(v4, v5, (uint64_t)v3, 0);

  return isSaved;
}

+ (id)savedBaseWithName:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *isSaved;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  isSaved = (void *)objc_msgSend_initWithName_isSaved_(v4, v5, (uint64_t)v3, 1);

  return isSaved;
}

- (SEMAuxiliaryFilesystemBase)initWithName:(id)a3 isSaved:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  SEMAuxiliaryFilesystemBase *v23;
  uint64_t v24;
  NSString *name;
  SEMAuxiliaryFilesystemBase *v26;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!objc_msgSend_length(v6, v7, v8))
  {
    v13 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
LABEL_15:
      v26 = 0;
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315394;
    v30 = "-[SEMAuxiliaryFilesystemBase initWithName:isSaved:]";
    v31 = 2112;
    v32 = v6;
    v14 = "%s Invalid name: %@";
LABEL_18:
    _os_log_error_impl(&dword_2462C4000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
    goto LABEL_15;
  }
  if (!v4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("com.apple.siri.vocabulary/%@"), v6);
    goto LABEL_8;
  }
  v10 = (void *)objc_opt_class();
  if ((objc_msgSend_savedBaseExistsWithName_(v10, v11, (uint64_t)v6) & 1) == 0)
  {
    v13 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 136315394;
    v30 = "-[SEMAuxiliaryFilesystemBase initWithName:isSaved:]";
    v31 = 2112;
    v32 = v6;
    v14 = "%s No saved filesystem base exists with name: %@";
    goto LABEL_18;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("Library/Assistant/SiriVocabulary-Staged/%@"), v6);
LABEL_8:
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = (id)CPSharedResourcesDirectory();
  }
  else
  {
    NSTemporaryDirectory();
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  v18 = (void *)objc_opt_class();
  objc_msgSend_baseURLWithTargetDirectoryPath_relativeToDirectoryPath_(v18, v19, (uint64_t)v15, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)SEMAuxiliaryFilesystemBase;
  v23 = -[SEMFilesystemBase initWithRootDirectoryURL:](&v28, sel_initWithRootDirectoryURL_, v20);
  if (v23)
  {
    v24 = objc_msgSend_copy(v6, v21, v22);
    name = v23->_name;
    v23->_name = (NSString *)v24;

    v23->_isSaved = v4;
  }
  self = v23;

  v26 = self;
LABEL_16:

  return v26;
}

- (id)save
{
  uint64_t v2;
  NSObject *v4;
  NSString *name;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  char v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  char v28;
  NSString *v29;
  NSObject *v30;
  const char *v31;
  char v32;
  NSString *v33;
  void *v34;
  const char *v35;
  char v36;
  void *v37;
  const char *v38;
  void *v39;
  NSString *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  NSString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!self->_isSaved)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();
    objc_msgSend__savedBaseDirectoryURLWithName_(v8, v9, (uint64_t)self->_name);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByDeletingLastPathComponent(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_fileExistsAtPath_(v7, v17, (uint64_t)v16);

    if ((v18 & 1) != 0)
    {
      objc_msgSend_path(v10, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_fileExistsAtPath_(v7, v22, (uint64_t)v21);

      if (v23)
      {
        v26 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[SEMAuxiliaryFilesystemBase save]";
          v45 = 2112;
          v46 = (NSString *)v10;
          _os_log_impl(&dword_2462C4000, v26, OS_LOG_TYPE_INFO, "%s Overwriting saved base directory at URL: %@", buf, 0x16u);
        }
        v41 = 0;
        v28 = objc_msgSend_removeItemAtURL_error_(v7, v27, (uint64_t)v10, &v41);
        v29 = (NSString *)v41;
        if ((v28 & 1) == 0)
        {
          v30 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v44 = "-[SEMAuxiliaryFilesystemBase save]";
            v45 = 2112;
            v46 = v29;
            v31 = "%s Failed to remove saved based directory. error: %@";
LABEL_23:
            _os_log_error_impl(&dword_2462C4000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else
      {
        v29 = 0;
      }
    }
    else
    {
      v42 = 0;
      v32 = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v7, v19, (uint64_t)v13, 1, 0, &v42);
      v29 = (NSString *)v42;
      if ((v32 & 1) == 0)
      {
        v30 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[SEMAuxiliaryFilesystemBase save]";
          v45 = 2112;
          v46 = v29;
          v31 = "%s Failed to create save directory. error: %@";
          goto LABEL_23;
        }
LABEL_19:
        v39 = 0;
        goto LABEL_20;
      }
    }
    v33 = v29;
    objc_msgSend_rootDirectory(self, v24, v25);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v29;
    v36 = objc_msgSend_copyItemAtURL_toURL_error_(v7, v35, (uint64_t)v34, v10, &v40);
    v29 = v40;

    if ((v36 & 1) != 0)
    {
      v37 = (void *)objc_opt_class();
      objc_msgSend_savedBaseWithName_(v37, v38, (uint64_t)self->_name);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

      return v39;
    }
    v30 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[SEMAuxiliaryFilesystemBase save]";
      v45 = 2112;
      v46 = v29;
      v31 = "%s Failed to copy base to saved directory. error: %@";
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  v4 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    name = self->_name;
    *(_DWORD *)buf = 136315394;
    v44 = "-[SEMAuxiliaryFilesystemBase save]";
    v45 = 2112;
    v46 = name;
    _os_log_impl(&dword_2462C4000, v4, OS_LOG_TYPE_INFO, "%s base with name: %@ is already saved.", buf, 0x16u);
  }
  return self;
}

- (void)remove
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_rootDirectory(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = objc_msgSend_removeItemAtPath_error_(v9, v10, (uint64_t)v6, &v14);
  v12 = v14;

  if ((v11 & 1) == 0)
  {
    v13 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[SEMAuxiliaryFilesystemBase remove]";
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v12;
      _os_log_error_impl(&dword_2462C4000, v13, OS_LOG_TYPE_ERROR, "%s Failed to remove base directory at path: %@ error: %@", buf, 0x20u);
    }
  }

}

+ (id)_savedBaseDirectoryURLWithName:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("Library/Assistant/SiriVocabulary-Staged/%@"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CPSharedResourcesDirectory();
  objc_msgSend_baseURLWithTargetDirectoryPath_relativeToDirectoryPath_(v4, v8, (uint64_t)v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)savedBaseExistsWithName:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  char isDirectory;
  BOOL v15;
  char v17;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend__savedBaseDirectoryURLWithName_(v4, v5, (uint64_t)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v9, v13, (uint64_t)v12, &v17);

  if (v17)
    v15 = isDirectory;
  else
    v15 = 0;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end

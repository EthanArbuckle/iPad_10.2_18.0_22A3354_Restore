@implementation SCSharingReminderArchiver

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SCSharingReminderArchiver_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___utility;
}

void __43__SCSharingReminderArchiver_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___utility;
  sharedInstance___utility = (uint64_t)v1;

}

- (SCSharingReminderArchiver)init
{
  SCSharingReminderArchiver *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCSharingReminderArchiver;
  v2 = -[SCSharingReminderArchiver init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCSharingReminderArchiver setFileManager:](v2, "setFileManager:", v3);

    v2->_lock._os_unfair_lock_opaque = 0;
    if (!-[SCSharingReminderArchiver sharingReminderDirectoryExists](v2, "sharingReminderDirectoryExists"))
      -[SCSharingReminderArchiver createSharingReminderDirectory](v2, "createSharingReminderDirectory");
  }
  return v2;
}

- (void)getObjectOfClass:(Class)a3 atKey:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, id);
  NSObject *v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;

  v8 = a4;
  v9 = (void (**)(id, _QWORD, id))a5;
  if (v8 && !objc_msgSend(v8, "isEqualToString:", &stru_251662C40))
  {
    -[SCSharingReminderArchiver fileURLForKey:](self, "fileURLForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v11, 0, &v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    os_unfair_lock_unlock(p_lock);
    if (v14)
    {
      SCLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:].cold.3();

      v9[2](v9, 0, v14);
    }
    else
    {
      v18 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a3, v13, &v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v18;
      if (v14)
      {
        SCLogger();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:].cold.2();

        v16 = 0;
      }
      ((void (**)(id, void *, id))v9)[2](v9, v16, v14);

    }
  }
  else
  {
    SCLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:].cold.1();

    +[SCDaemonError errorWithCode:](SCDaemonError, "errorWithCode:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v11);
  }

}

- (id)getObjectOfClass:(Class)a3 atKey:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  id v16;

  v6 = a4;
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "isEqualToString:", &stru_251662C40))
  {
    -[SCSharingReminderArchiver fileURLForKey:](self, "fileURLForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v8, 0, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    os_unfair_lock_unlock(p_lock);
    if (v12)
    {
      SCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:].cold.3();
    }
    else
    {
      v15 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a3, v11, &v15);
      v9 = objc_claimAutoreleasedReturnValue();
      v12 = v15;
      if (!v12)
      {
LABEL_14:

        goto LABEL_15;
      }
      SCLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:].cold.2();

    }
    v9 = 0;
    goto LABEL_14;
  }
  SCLogger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:].cold.1();
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)setObject:(id)a3 atKey:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  os_unfair_lock_s *lock;
  os_unfair_lock_s *locka;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  if (v8 && v9 && !objc_msgSend(v9, "isEqualToString:", &stru_251662C40))
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24;
    if (v13)
    {
      SCLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SCSharingReminderArchiver setObject:atKey:withCompletion:].cold.2();

      v10[2](v10, 0, v13);
    }
    else
    {
      -[SCSharingReminderArchiver fileURLForKey:](self, "fileURLForKey:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      -[SCSharingReminderArchiver fileManager](self, "fileManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "fileExistsAtPath:", v17);

      if (v18)
      {
        v19 = objc_msgSend(v12, "writeToURL:atomically:", v15, 1, lock);
      }
      else
      {
        -[SCSharingReminderArchiver fileManager](self, "fileManager", lock);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v20, "createFileAtPath:contents:attributes:", v21, v12, 0);

      }
      os_unfair_lock_unlock(locka);
      v10[2](v10, v19, 0);

    }
  }
  else
  {
    SCLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SCSharingReminderArchiver setObject:atKey:withCompletion:].cold.1();

    v10[2](v10, 0, 0);
  }

}

- (BOOL)sharingReminderDirectoryExists
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  char v9;

  v9 = 0;
  -[SCSharingReminderArchiver sharingReminderDirectoryURL](self, "sharingReminderDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCSharingReminderArchiver fileManager](self, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v9);

  if (v6 && !v9)
  {
    SCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCSharingReminderArchiver sharingReminderDirectoryExists].cold.1();

  }
  return v6;
}

- (void)createSharingReminderDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Error creating directory: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (id)fileURLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SCSharingReminderArchiver sharingReminderDirectoryURL](self, "sharingReminderDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sharingReminderDirectoryURL
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;

  -[SCSharingReminderArchiver fileManager](self, "fileManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  if (v4)
  {
    SCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCSharingReminderArchiver sharingReminderDirectoryURL].cold.1();

    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.safetycheckd"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)getObjectOfClass:atKey:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Archiver couldn't decode malformed key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getObjectOfClass:atKey:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_2454C0000, v0, v1, "\"Error: %@ while creating decoder for data: %@\");
  OUTLINED_FUNCTION_3();
}

- (void)getObjectOfClass:atKey:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Error reading data at URL: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setObject:atKey:withCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_2454C0000, v0, v1, "\"Archiver couldn't encode malformed args [object: %@ key: %@]\");
  OUTLINED_FUNCTION_3();
}

- (void)setObject:atKey:withCompletion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_2454C0000, v0, v1, "\"Archiver couldn't encode object: %@ error: %@\");
  OUTLINED_FUNCTION_3();
}

- (void)sharingReminderDirectoryExists
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Expected to find directory but found folder instead at path: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sharingReminderDirectoryURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Error getting top level directory: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

@implementation UNCAtomicDataContentProtectionStrategy

- (UNCAtomicDataContentProtectionStrategy)initWithFileProtectionType:(id)a3 excludeFromBackup:(BOOL)a4
{
  id v6;
  UNCAtomicDataContentProtectionStrategy *v7;
  UNCAtomicDataContentProtectionStrategy *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UNCAtomicDataContentProtectionStrategy;
  v7 = -[UNCAtomicDataContentProtectionStrategy init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_excludeFromBackup = a4;
    v7->_dataWritingFileProtection = -[UNCAtomicDataContentProtectionStrategy _dataWritingOptionForFileProtectionType:](v7, "_dataWritingOptionForFileProtectionType:", v6);
  }

  return v8;
}

- (BOOL)dataIsAvailableAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  return v6;
}

- (id)dataAtPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a3);
}

- (BOOL)writeData:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8;
  int v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  NSObject *v14;
  id v16;

  v8 = a4;
  v9 = objc_msgSend(a3, "writeToFile:options:error:", v8, self->_dataWritingFileProtection | 1, a5);
  if (v9 && self->_excludeFromBackup)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BDBCC68];
    v16 = 0;
    v12 = objc_msgSend(v10, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v11, &v16);
    v13 = v16;
    if ((v12 & 1) == 0)
    {
      v14 = *MEMORY[0x24BDF89B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
        -[UNCAtomicDataContentProtectionStrategy writeData:atPath:error:].cold.1((uint64_t)v8, (uint64_t)v13, v14);
    }

  }
  return v9;
}

- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "fileExistsAtPath:", v5)
    && (objc_msgSend(v6, "removeItemAtPath:error:", v5, a4) & 1) == 0)
  {
    v8 = *MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
      -[UNCAtomicDataContentProtectionStrategy removeItemAtPath:error:].cold.1((uint64_t)v5, a4, v8);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)migrateDataAtPath:(id)a3 toPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v7, "moveItemAtPath:toPath:error:", v5, v6, &v10);
  v8 = v10;
  if (v8)
  {
    v9 = *MEMORY[0x24BDF89D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_2499A5000, v9, OS_LOG_TYPE_ERROR, "Migrating repository from: %{public}@ to: %{public}@ failed %{public}@", buf, 0x20u);
    }
  }

}

- (unint64_t)_dataWritingOptionForFileProtectionType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD0CD0]) & 1) != 0)
  {
    v4 = 0x20000000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD0CE0]) & 1) != 0)
  {
    v4 = 0x40000000;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD0CD8]))
  {
    v4 = 805306368;
  }
  else
  {
    v4 = 0x10000000;
  }

  return v4;
}

- (void)writeData:(uint64_t)a1 atPath:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, a2, a3, "Could not set 'exclude from backup' key on %{public}@; error: %{public}@",
    *(_QWORD *)v3,
    *(_QWORD *)&v3[8],
    *(_QWORD *)&v3[16],
    *MEMORY[0x24BDAC8D0]);
}

- (void)removeItemAtPath:(NSObject *)a3 error:.cold.1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, (uint64_t)a2, a3, "Could not delete %{public}@: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end

@implementation NSFileManager(TSUTemporaryDirectoryAdditions)

- (uint64_t)grantUserWritePosixPermissionAtPath:()TSUTemporaryDirectoryAdditions error:
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  v28 = 0;
  v8 = (void *)objc_msgSend(a1, "attributesOfItemAtPath:error:", a3, &v28);
  v9 = (void *)objc_msgSend(v8, "fileType");
  v10 = *MEMORY[0x24BDD0D38];
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0D38]) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0D40]) & 1) == 0
    && !objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0D48]))
  {
    goto LABEL_16;
  }
  v11 = objc_msgSend(v8, "filePosixPermissions");
  v12 = (void *)MEMORY[0x24BDBCE70];
  v13 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11 | 0x80);
  if (objc_msgSend(a1, "setAttributes:ofItemAtPath:error:", objc_msgSend(v12, "dictionaryWithObject:forKey:", v13, *MEMORY[0x24BDD0CC8]), a3, &v28))
  {
    if (objc_msgSend(v9, "isEqualToString:", v10))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v14 = (void *)objc_msgSend(a1, "contentsOfDirectoryAtPath:error:", a3, &v28, 0);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
LABEL_8:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          if (!objc_msgSend(a1, "grantUserWritePosixPermissionAtPath:error:", objc_msgSend(a3, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18)), &v28))goto LABEL_15;
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
            v19 = 1;
            if (v16)
              goto LABEL_8;
            goto LABEL_17;
          }
        }
      }
    }
LABEL_16:
    v19 = 1;
    goto LABEL_17;
  }
LABEL_15:
  v19 = 0;
LABEL_17:
  v20 = v28;
  objc_msgSend(v7, "drain");
  v21 = v28;
  if (a4 && (v19 & 1) == 0)
  {
    v22 = v28;
    if (!v28)
      v22 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 512, 0);
    *a4 = v22;
  }
  return v19;
}

@end

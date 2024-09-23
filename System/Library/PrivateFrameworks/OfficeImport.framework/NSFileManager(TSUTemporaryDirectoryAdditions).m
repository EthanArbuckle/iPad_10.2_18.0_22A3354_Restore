@implementation NSFileManager(TSUTemporaryDirectoryAdditions)

- (uint64_t)tsu_grantUserWritePosixPermissionAtPath:()TSUTemporaryDirectoryAdditions error:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v42 = 0;
  objc_msgSend(a1, "attributesOfItemAtPath:error:", v6, &v42);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v42;
  objc_msgSend(v7, "fileType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDD0D38];
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0D38]) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0D40]) & 1) == 0
    && !objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0D48]))
  {
    v27 = 1;
    goto LABEL_27;
  }
  v34 = a4;
  v11 = objc_msgSend(v7, "filePosixPermissions");
  v12 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11 | 0x80);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithObject:forKey:", v13, *MEMORY[0x24BDD0CC8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v8;
  v15 = objc_msgSend(a1, "setAttributes:ofItemAtPath:error:", v14, v6, &v41);
  v16 = v41;

  if (v15)
  {
    if (!objc_msgSend(v9, "isEqualToString:", v10))
    {
      v27 = 1;
LABEL_26:
      v8 = v16;
      goto LABEL_27;
    }
    v33 = v9;
    v17 = (void *)MEMORY[0x22E2DDB58]();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v36 = 0;
    objc_msgSend(a1, "contentsOfDirectoryAtPath:error:", v6, &v36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v36;
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v20)
    {
      v21 = v20;
      v30 = v17;
      v31 = v16;
      v32 = v7;
      v22 = *(_QWORD *)v38;
      while (2)
      {
        v23 = 0;
        v24 = v19;
        do
        {
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v18);
          objc_msgSend(v6, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v23));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v24;
          v26 = objc_msgSend(a1, "tsu_grantUserWritePosixPermissionAtPath:error:", v25, &v35);
          v19 = v35;

          if ((v26 & 1) == 0)
          {
            v19 = v19;

            v27 = 0;
            v16 = v19;
            v7 = v32;
            goto LABEL_18;
          }
          ++v23;
          v24 = v19;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v21)
          continue;
        break;
      }
      v27 = 1;
      v16 = v31;
      v7 = v32;
LABEL_18:
      v17 = v30;
    }
    else
    {
      v27 = 1;
    }

    objc_autoreleasePoolPop(v17);
    v9 = v33;
  }
  else
  {
    v27 = 0;
  }
  if (!v34 || (v27 & 1) != 0)
    goto LABEL_26;
  if (v16)
  {
    v8 = objc_retainAutorelease(v16);
    v27 = 0;
    *v34 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *v34 = v29;

    v27 = 0;
    v8 = 0;
  }
LABEL_27:

  return v27;
}

@end

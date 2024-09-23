@implementation NSFileManager(UserNotificationsCore)

- (BOOL)unc_securelyCopyFile:()UserNotificationsCore fromURL:toURL:error:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _BOOL8 v17;
  int v18;
  id v20;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "createFileAtPath:contents:attributes:", v11, v12, MEMORY[0x24BDBD1B8]);

  if ((_DWORD)a1)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", v10, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    v15 = v14;
    if (v14)
    {
      if (!a6)
      {
        v17 = 0;
        goto LABEL_13;
      }
      v16 = objc_retainAutorelease(v14);
    }
    else
    {
      v18 = fcopyfile(objc_msgSend(v9, "fileDescriptor"), objc_msgSend(v13, "fileDescriptor"), 0, 0x4000Fu);
      v17 = v18 != -1;
      if (!a6 || v18 != -1)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = 0;
    *a6 = v16;
LABEL_13:

    goto LABEL_14;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 104, 0);
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_14:

  return v17;
}

- (id)unc_contentsSortedByLastModificationDateOfDirectoryAtPath:()UserNotificationsCore error:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(a1, "fileExistsAtPath:", v6))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v22 = 0;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      v12 = *MEMORY[0x24BDD0C98];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(obj);
          objc_msgSend(v6, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          objc_msgSend(v15, "attributesOfItemAtPath:error:", v14, &v26);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v26;

          objc_msgSend(v16, "objectForKey:", v12);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v18)
          {
            v31[0] = CFSTR("path");
            v31[1] = CFSTR("lastModDate");
            v32[0] = v14;
            v32[1] = v18;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v20);

          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v10);
    }

    objc_msgSend(v25, "sortedArrayUsingComparator:", &__block_literal_global_8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v21, "bs_map:", &__block_literal_global_10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v22;
}

@end

@implementation NSFileManager(TVMLKitAdditions)

- (blkcnt_t)tv_onDiskSizeOfFileAtPath:()TVMLKitAdditions status:
{
  int v5;
  stat v7;

  memset(&v7, 0, sizeof(v7));
  v5 = lstat((const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 1, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0), &v7);
  if (a4)
    *a4 = v5;
  if (v5)
    return 0;
  else
    return v7.st_blocks << 9;
}

- (uint64_t)tv_onDiskSizeOfDirectoryAtPath:()TVMLKitAdditions status:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  blkcnt_t st_blocks;
  stat v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorAtPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(v8);
      objc_msgSend(v5, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v19, 0, sizeof(v19));
      v15 = objc_retainAutorelease(v14);
      v16 = lstat((const char *)objc_msgSend(v15, "cStringUsingEncoding:", 1), &v19);
      st_blocks = v19.st_blocks;

      if (v16)
        break;
      v11 += st_blocks << 9;
      if (v10 == ++v13)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
    v11 = 0;
LABEL_11:
    v16 = 0;
  }

  if (a4)
    *a4 = v16;

  return v11;
}

@end

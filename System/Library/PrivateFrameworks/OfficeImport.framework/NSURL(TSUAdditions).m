@implementation NSURL(TSUAdditions)

- (id)tsu_documentIdentifier
{
  char v1;
  id v2;
  id v4;

  v4 = 0;
  v1 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v4, *MEMORY[0x24BDBCBF8], 0);
  v2 = v4;
  if ((v1 & 1) == 0)
  {

    v2 = 0;
  }
  return v2;
}

- (void)tsu_performSecurityScopedResourceAccessUsingBlock:()TSUAdditions
{
  void (**v4)(id);
  int v5;
  void (**v6)(id);

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
    v6[2](v6);
    v4 = v6;
    if (v5)
    {
      objc_msgSend(a1, "stopAccessingSecurityScopedResource");
      v4 = v6;
    }
  }

}

- (void)tsu_performSecurityScopedResourceAccessAsynchronouslyUsingBlock:()TSUAdditions
{
  void (**v4)(id, _QWORD *);
  char v5;
  _QWORD v6[5];
  char v7;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __87__NSURL_TSUAdditions__tsu_performSecurityScopedResourceAccessAsynchronouslyUsingBlock___block_invoke;
    v6[3] = &unk_24F39AD60;
    v7 = v5;
    v6[4] = a1;
    v4[2](v4, v6);

  }
}

- (BOOL)tsu_isFileSizeTooLargeForSharing
{
  return (unint64_t)objc_msgSend(a1, "tsu_fileSize") > 0x40000000;
}

- (uint64_t)tsu_fileSize
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(a1, "tsu_fileSize:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_fileSize:()TSUAdditions error:
{
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  _QWORD *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  v6 = *MEMORY[0x24BDBCC48];
  v7 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v33, *MEMORY[0x24BDBCC48], 0);
  v8 = v33;
  v9 = v8;
  v10 = 0;
  if (v7)
    v10 = objc_msgSend(v8, "unsignedLongLongValue");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v6;
  v12 = 1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", a1, v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v16)
  {
    v17 = v16;
    v26 = a4;
    v18 = *(_QWORD *)v30;
    v12 = 1;
    do
    {
      v19 = 0;
      do
      {
        v20 = v9;
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v19);
        v27 = 0;
        v28 = 0;
        v22 = objc_msgSend(v21, "getResourceValue:forKey:error:", &v28, v6, &v27);
        v9 = v28;

        v23 = v27;
        if (v22)
        {
          v10 += objc_msgSend(v9, "unsignedLongLongValue");
        }
        else
        {
          if ((v12 & 1) == 0)
            goto LABEL_15;
          if (TSUDefaultCat_init_token != -1)
            dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_11);
          if (v26)
          {
            v12 = 0;
            *v26 = objc_retainAutorelease(v23);
          }
          else
          {
LABEL_15:
            v12 = 0;
          }
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v17);
  }

  if (a3)
    *a3 = v10;

  return v12 & 1;
}

- (uint64_t)tsu_isShared
{
  unsigned __int8 v2;

  v2 = 0;
  objc_msgSend(a1, "tsu_isShared:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_isShared:()TSUAdditions error:
{
  char v4;

  v4 = objc_msgSend(0, "BOOLValue");
  if (a3)
    *a3 = v4;
  return 1;
}

- (uint64_t)_isShareRole:()TSUAdditions role:error:
{
  id v7;

  v7 = a4;
  if (TSUDefaultCat_init_token == -1)
  {
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_4);
  if (a5)
LABEL_3:
    *a5 = 0;
LABEL_4:
  if (a3)
    *a3 = 0;

  return 0;
}

- (uint64_t)tsu_isShareCollaborator
{
  unsigned __int8 v2;

  v2 = 0;
  objc_msgSend(a1, "tsu_isShareCollaborator:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_isShareCollaborator:()TSUAdditions error:
{
  return 0;
}

- (uint64_t)tsu_isShareOwner
{
  unsigned __int8 v2;

  v2 = 0;
  objc_msgSend(a1, "tsu_isShareOwner:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_isShareOwner:()TSUAdditions error:
{
  return 0;
}

- (id)tsu_displayName
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "tsu_displayName:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_displayName:()TSUAdditions error:
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v13;

  v7 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
  v8 = *MEMORY[0x24BDBCCC0];
  v13 = 0;
  v9 = objc_msgSend(a1, "getPromisedItemResourceValue:forKey:error:", a3, v8, &v13);
  v10 = v13;
  if ((v9 & 1) != 0)
    goto LABEL_7;
  if (TSUDefaultCat_init_token == -1)
  {
    if (!a3)
      goto LABEL_5;
    goto LABEL_4;
  }
  dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_5);
  if (a3)
  {
LABEL_4:
    objc_msgSend(a1, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByDeletingPathExtension");
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_5:
  if (a4)
    *a4 = objc_retainAutorelease(v10);
LABEL_7:
  if (v7)
    objc_msgSend(a1, "stopAccessingSecurityScopedResource");

  return v9;
}

- (uint64_t)tsu_isDocumentUploaded
{
  unsigned __int8 v2;

  v2 = 0;
  objc_msgSend(a1, "tsu_isDocumentUploaded:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_isDocumentUploaded:()TSUAdditions error:
{
  uint64_t v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__NSURL_TSUAdditions__tsu_isDocumentUploaded_error___block_invoke;
  v8[3] = &unk_24F39AE08;
  v8[4] = a1;
  v8[5] = &v9;
  v8[6] = &v15;
  v8[7] = &v19;
  objc_msgSend(a1, "tsu_performSecurityScopedResourceAccessUsingBlock:", v8);
  if (a4)
    *a4 = objc_retainAutorelease((id)v10[5]);
  _Block_object_dispose(&v9, 8);

  if (a3)
    *a3 = *((_BYTE *)v20 + 24);
  v6 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v6;
}

- (id)tsu_shareOwnerName
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "tsu_shareOwnerName:error:", &v2, 0);
  return v2;
}

- (uint64_t)tsu_shareOwnerName:()TSUAdditions error:
{
  if (TSUDefaultCat_init_token != -1)
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_9);
  *a3 = 0;
  if (a4)
    *a4 = 0;
  return 0;
}

- (BOOL)tsu_setNeedsDocumentIdentifierAndReturnError:()TSUAdditions
{
  int v4;
  int v5;
  int v6;
  stat v8;

  v4 = open((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 0x200000);
  if (v4 < 0)
  {
    v6 = -1;
    if (!a3)
      return v6 == 0;
    goto LABEL_9;
  }
  v5 = v4;
  memset(&v8, 0, sizeof(v8));
  v6 = fstat(v4, &v8);
  if (!v6)
  {
    if ((v8.st_flags & 0x40) != 0)
      v6 = 0;
    else
      v6 = fchflags(v5, v8.st_flags | 0x40);
  }
  close(v5);
  if (a3)
  {
LABEL_9:
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6 == 0;
}

- (id)tsu_fileTypeIdentifierHandlingFileCoordinationPromises
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x24BDBCCF0], 0);
  return v2;
}

- (id)tsu_fileSystemTypeName
{
  id v2;
  void *v3;
  void *v4;
  statfs v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a1, "isFileURL"))
    return 0;
  objc_msgSend(a1, "path");
  memset(&v6, 0, 512);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (!statfs((const char *)objc_msgSend(v2, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0),
          &v6)
    || (objc_msgSend(v2, "stringByDeletingLastPathComponent"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2 = objc_retainAutorelease(v3),
        LODWORD(v3) = statfs((const char *)objc_msgSend(v2, "fileSystemRepresentation"), &v6),
        __error(),
        !(_DWORD)v3))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6.f_fstypename);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!objc_msgSend(a1, "checkResourceIsReachableAndReturnError:", 0))
  {
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  if (TSUDefaultCat_init_token != -1)
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_11);
    goto LABEL_10;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

- (uint64_t)tsu_isOnForeignVolume
{
  return 0;
}

- (uint64_t)tsu_isOnAPFSVolume
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!objc_msgSend(a1, "isFileURL"))
    return 0;
  objc_msgSend(a1, "tsu_fileSystemTypeName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("apfs"));
  else
    v4 = 0;

  return v4;
}

- (id)tsu_reachableFileURLByDeletingUnreachablePathComponents
{
  id v2;
  void *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;

  if (objc_msgSend(a1, "isFileURL"))
  {
    v2 = a1;
    while (1)
    {
      objc_msgSend(v2, "path");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "length");

      if (v4 < 3)
        break;
      if (objc_msgSend(v2, "checkResourceIsReachableAndReturnError:", 0))
      {
        v5 = v2;
        v2 = v5;
        if (v5)
          goto LABEL_10;
      }
      else
      {
        objc_msgSend(v2, "URLByDeletingLastPathComponent");
        v6 = objc_claimAutoreleasedReturnValue();

        v2 = (id)v6;
      }
    }
    v5 = 0;
LABEL_10:

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)tsu_isOnSameVolumeAs:()TSUAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  int v9;
  uint64_t v10;
  id v11;
  const char *v12;
  int v13;
  BOOL v14;
  stat v16;
  stat v17;

  v4 = a3;
  objc_msgSend(a1, "tsu_reachableFileURLByDeletingUnreachablePathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tsu_reachableFileURLByDeletingUnreachablePathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isFileURL") && objc_msgSend(v6, "isFileURL"))
  {
    memset(&v17, 0, sizeof(v17));
    memset(&v16, 0, sizeof(v16));
    objc_msgSend(v5, "path");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");

    if (v8)
    {
      v9 = lstat(v8, &v17);
      if (v9 == -1)
      {
        if (TSUDefaultCat_init_token != -1)
          dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_13_0);
        v9 = -1;
      }
    }
    else
    {
      v9 = -2;
    }
    objc_msgSend(v6, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");

    if (v12)
    {
      v13 = lstat(v12, &v16);
      if (v13 == -1)
      {
        if (TSUDefaultCat_init_token != -1)
          dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_14);
        v13 = -1;
      }
    }
    else
    {
      v13 = -2;
    }
    if (v13 | v9)
      v14 = 0;
    else
      v14 = v17.st_dev == v16.st_dev;
    v10 = v14;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)tsu_fileURLWithPath:()TSUAdditions
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tsu_fileProviderBookmarkableString
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  id v4;
  _QWORD v6[5];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__NSURL_TSUAdditions__tsu_fileProviderBookmarkableString__block_invoke;
  v6[3] = &unk_24F39AEF8;
  v6[4] = a1;
  v8 = &v9;
  v3 = v2;
  v7 = v3;
  objc_msgSend(a1, "tsu_performSecurityScopedResourceAccessAsynchronouslyUsingBlock:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)tsu_removeCachedResourceValueForKeys:()TSUAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "removeCachedResourceValueForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)tsu_isInTrash
{
  void *v2;
  uint64_t v4;
  uint64_t v5;

  v5 = 2;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  LODWORD(a1) = objc_msgSend(v2, "getRelationship:ofDirectory:inDomain:toItemAtURL:error:", &v5, 102, 0, a1, &v4);

  if ((_DWORD)a1)
    return v5 == 0;
  if (TSUDefaultCat_init_token == -1)
    return 0;
  dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_20);
  return 0;
}

@end

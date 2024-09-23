@implementation NSFileManager(RCAdditions)

- (unint64_t)rc_fileExistsAndIsInValidRecordingURL:()RCAdditions
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v14;

  if (a3)
  {
    objc_msgSend(a3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "fileExistsAtPath:", v4))
    {
      v5 = (unint64_t)realpath_DARWIN_EXTSN((const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"), 0);
      if (!v5)
      {
LABEL_14:

        return v5;
      }
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
      objc_msgSend(v6, "stringByStandardizingPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      free((void *)v5);
      if (v7)
      {
        v5 = 1;
        v14 = 1;
        if (objc_msgSend(a1, "fileExistsAtPath:isDirectory:", v7, &v14) && !v14)
        {
          RCRecordingsDirectoryURL();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "path");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringByStandardizingPath");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v7, "hasPrefix:", v10) & 1) != 0)
          {
            v5 = 0;
          }
          else
          {
            RCDiskCacheDirectory();
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringByStandardizingPath");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = objc_msgSend(v7, "hasPrefix:", v12) ^ 1;

          }
        }

        goto LABEL_14;
      }
    }
    v5 = 0;
    goto LABEL_14;
  }
  return 0;
}

- (void)rc_cleanUpTemporaryDirectory
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BD830000, v0, OS_LOG_TYPE_ERROR, "%s -- Failed to get contents of url %@", (uint8_t *)v1, 0x16u);
}

- (id)rc_uniqueFileSystemURLWithPreferredURL:()RCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v4, "rc_URLByStandardizingResolvedPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, MEMORY[0x1E0C9AA60], 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v12), "rc_URLByStandardizingResolvedPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLByDeletingPathExtension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v10);
  }

  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByDeletingPathExtension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pathExtension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  v22 = 1;
  v33 = v21;
  while (1)
  {
    objc_msgSend(v21, "rc_URLByStandardizingResolvedPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLByDeletingPathExtension");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v5, "containsObject:", v25);

    if (!v26)
      break;
    v27 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v17, "stringByAppendingPathComponent:", v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByAppendingFormat:", CFSTR("-%li"), v22, v33);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingPathExtension:", v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fileURLWithPath:", v30);
    v31 = objc_claimAutoreleasedReturnValue();

    ++v22;
    v21 = (id)v31;
  }

  return v21;
}

- (uint64_t)rc_moveToTempAndMarkAsPurgeable:()RCAdditions error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("voicememos-purgeable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(a1, "moveItemAtURL:toURL:error:", v6, v13, a4);
    if ((_DWORD)v14)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = dispatch_queue_create("com.apple.VoiceMemos.purgeableQueue", v15);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__NSFileManager_RCAdditions__rc_moveToTempAndMarkAsPurgeable_error___block_invoke;
      block[3] = &unk_1E769BF30;
      v19 = v13;
      dispatch_async(v16, block);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)rc_cleanUpM4AsInDirectory:()RCAdditions
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  __int128 v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", a3, 0, 0, &__block_literal_global_11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    *(_QWORD *)&v5 = 136315650;
    v15 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "pathExtension", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("m4a"));

        if (v11)
        {
          v16 = 0;
          v12 = _RCCleanUpURL(v9, &v16);
          v13 = v16;
          if (!v12)
          {
            OSLogForCategory(CFSTR("Default"));
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              v22 = "-[NSFileManager(RCAdditions) rc_cleanUpM4AsInDirectory:]";
              v23 = 2112;
              v24 = v9;
              v25 = 2112;
              v26 = v13;
              _os_log_error_impl(&dword_1BD830000, v14, OS_LOG_TYPE_ERROR, "%s -- Failed to clean up file at %@, error = %@", buf, 0x20u);
            }

          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v6);
  }

}

- (uint64_t)rc_path:()RCAdditions isSubpathOf:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  objc_msgSend(a3, "stringByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByStandardizingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "hasPrefix:", v7);
  return v8;
}

@end

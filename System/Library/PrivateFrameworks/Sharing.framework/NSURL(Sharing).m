@implementation NSURL(Sharing)

- (uint64_t)isiWorkDocument
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x1E0C99AD0], 0);
  return objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.iwork"));
}

- (id)fileName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "URLByDeletingPathExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)coordinateReadingWithSaveToTempDir:()Sharing completionHandler:
{
  return objc_msgSend(a1, "coordinateReadingWithSaveToTempDir:options:completionHandler:", a3, 1, a4);
}

- (void)coordinateReadingWithSaveToTempDir:()Sharing options:completionHandler:
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  id v16;

  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke;
  v12[3] = &unk_1E4830E20;
  v15 = a3;
  v13 = 0;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "coordinateReadingItemAtURL:options:error:byAccessor:", a1, a4, &v16, v12);
  v11 = v16;

}

- (id)issueSandboxExtensionData
{
  id v2;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isFileURL") & 1) == 0)
  {
    utilities_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSURL(Sharing) issueSandboxExtensionData].cold.2((uint64_t)a1, v7, v8, v9, v10, v11, v12, v13);

    goto LABEL_12;
  }
  v2 = objc_retainAutorelease(a1);
  objc_msgSend(v2, "fileSystemRepresentation");
  v3 = (const char *)sandbox_extension_issue_file();
  utilities_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[NSURL(Sharing) issueSandboxExtensionData].cold.1((uint64_t)v2, v5);

LABEL_12:
    v6 = 0;
    return v6;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138477827;
    v16 = v2;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "sandbox extension issued successfully for URL:%{private}@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v3, strlen(v3) + 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)valueForQueryKey:()Sharing
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItems");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "name", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v10, "value");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)issueSandboxExtensionData
{
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, a2, a3, "Cannot issue sandbox extension for URL:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end

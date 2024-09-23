@implementation TRINamespaceKeyLocator

+ (id)keyDataForNamespace:(id)a3 asymmetric:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "keyFileURLForNamespace:asymmetric:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 2, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      TRILogCategory_Archiving();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v16 = v13;
        v17 = 2112;
        v18 = v9;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Failed to read key data from file %@ -- %@", buf, 0x16u);

      }
    }

  }
  else
  {
    TRILogCategory_Archiving();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "Couldn't find key for namespace %@", buf, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)keyFileURLForNamespace:(id)a3 asymmetric:(BOOL)a4
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_keyFileSearchLocationsForNamespace:asymmetric:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Archiving();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Searching for namespace key in the following locations: %@", buf, 0xCu);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i));
        if (!access((const char *)objc_msgSend(v10, "fileSystemRepresentation", (_QWORD)v12), 4))
        {
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v10);
          goto LABEL_13;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

+ (id)_keyFileSearchLocationsForNamespace:(id)a3 asymmetric:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[5];

  v4 = a4;
  v23[4] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0DC0B78];
  v7 = a3;
  objc_msgSend(v6, "sharedSystemPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decryptionKeyDirForAppleInternal:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "decryptionKeyDirForAppleInternal:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_fileNameForNamespaceIdentifier:asymmetric:", v7, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_namespaceIdForNamespace:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_fileNameForNamespaceIdentifier:asymmetric:", v14, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringByAppendingPathComponent:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    objc_msgSend(v9, "stringByAppendingPathComponent:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v17;
    objc_msgSend(v11, "stringByAppendingPathComponent:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v18;
    objc_msgSend(v11, "stringByAppendingPathComponent:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v9, "stringByAppendingPathComponent:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    objc_msgSend(v11, "stringByAppendingPathComponent:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (id)_fileNameForNamespaceIdentifier:(id)a3 asymmetric:(BOOL)a4
{
  const __CFString *v4;

  v4 = CFSTR("com.apple.trial.%@.namespacekey");
  if (a4)
    v4 = CFSTR("com.apple.trial.%@.namespacekey.priv");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_namespaceIdForNamespace:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  unsigned int v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = -1;
  TRINamespace_NamespaceId_EnumDescriptor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getValue:forEnumTextFormatName:", &v9, v3);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    TRILogCategory_Archiving();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Unable to find namespace id for namespace name: %@", buf, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

@end

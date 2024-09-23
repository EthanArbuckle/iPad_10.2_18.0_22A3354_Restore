@implementation NSFileManager(SafariNSFileManagerExtras)

- (id)safari_ensureDirectoryExists:()SafariNSFileManagerExtras
{
  id v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[16];
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v6 = objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v14);
  v7 = v14;

  if ((v6 & 1) != 0)
  {
    v8 = v4;
  }
  else
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSFileManager(SafariNSFileManagerExtras) safari_ensureDirectoryExists:].cold.2(v10, v16, v9);
    }

    v11 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSFileManager(SafariNSFileManagerExtras) safari_ensureDirectoryExists:].cold.1(v12, buf, v11);
    }

    v8 = 0;
  }

  return v8;
}

- (id)safari_settingsDirectoryForLibraryDirectory:()SafariNSFileManagerExtras
{
  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Safari"), 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)safari_safariLibraryDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__NSFileManager_SafariNSFileManagerExtras__safari_safariLibraryDirectory__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = a1;
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::onceToken != -1)
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::onceToken, block);
  return (id)-[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::safariLibraryDirectory;
}

- (id)safari_settingsDirectoryURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NSFileManager_SafariNSFileManagerExtras__safari_settingsDirectoryURL__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = a1;
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_settingsDirectoryURL]::onceToken != -1)
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_settingsDirectoryURL]::onceToken, block);
  return (id)-[NSFileManager(SafariNSFileManagerExtras) safari_settingsDirectoryURL]::settingsDirectory;
}

- (id)safari_startPageBackgroundImageFolderURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_mobileSafariContainerDirectoryURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/StartPage"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_mobileSafariContainerDirectoryURL
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "_safari_getMobileSafariContainerDirectoryURL:isContainerized:", &v2, 0);
  return v2;
}

- (void)_safari_getMobileSafariContainerDirectoryURL:()SafariNSFileManagerExtras isContainerized:
{
  if (-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::onceToken == -1)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::onceToken, &__block_literal_global_21);
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL);
LABEL_4:
  if (a4)
    *a4 = -[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::isContainerized;
}

- (id)_safari_libraryDirectoryForHomeDirectory:()SafariNSFileManagerExtras
{
  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)safari_profilesDirectoryURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NSFileManager_SafariNSFileManagerExtras__safari_profilesDirectoryURL__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = a1;
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_profilesDirectoryURL]::onceToken != -1)
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_profilesDirectoryURL]::onceToken, block);
  return (id)-[NSFileManager(SafariNSFileManagerExtras) safari_profilesDirectoryURL]::profilesDirectory;
}

- (id)safari_webExtensionsSettingsDirectoryURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__NSFileManager_SafariNSFileManagerExtras__safari_webExtensionsSettingsDirectoryURL__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = a1;
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_webExtensionsSettingsDirectoryURL]::onceToken != -1)
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_webExtensionsSettingsDirectoryURL]::onceToken, block);
  objc_msgSend(a1, "safari_ensureDirectoryExists:", -[NSFileManager(SafariNSFileManagerExtras) safari_webExtensionsSettingsDirectoryURL]::settingsDirectory);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)safari_startPageBackgroundImageFileURLForDefaultProfile
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_startPageBackgroundImageFolderURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("defaultBackground"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_startPageBackgroundImageFileURLForIdentifier:()SafariNSFileManagerExtras
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "safari_startPageBackgroundImageFolderURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)safari_startPageBackgroundImageMobileAssetFolderURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_startPageBackgroundImageFolderURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("MobileAssetBackgroundImages"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_startPageBackgroundImageThumbnailMobileAssetFolderURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_startPageBackgroundImageFolderURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("MobileAssetBackgroundImageThumbnails"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer
{
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer]::onceToken != -1)
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer]::onceToken, &__block_literal_global_12_0);
  return (id)-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer]::containerURL;
}

- (void)_safari_getPasswordsAppContainerDirectoryURL:()SafariNSFileManagerExtras isContainerized:
{
  if (-[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::onceToken == -1)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::onceToken, &__block_literal_global_13_2);
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)-[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::containerURL);
LABEL_4:
  if (a4)
    *a4 = -[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::isContainerized;
}

- (id)safari_subdirectoryWithName:()SafariNSFileManagerExtras inUserDomainOfDirectory:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E98];
  NSSearchPathForDirectoriesInDomains(a4, 1uLL, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v6, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "safari_ensureDirectoryExists:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)safari_passwordsAppContainerDirectoryURL
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "_safari_getPasswordsAppContainerDirectoryURL:isContainerized:", &v2, 0);
  return v2;
}

- (uint64_t)safari_currentProcessIsContainerized
{
  unsigned __int8 v2;

  v2 = 0;
  objc_msgSend(a1, "_safari_getMobileSafariContainerDirectoryURL:isContainerized:", 0, &v2);
  return v2;
}

- (id)safari_settingsDirectoryForHomeDirectory:()SafariNSFileManagerExtras
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_safari_libraryDirectoryForHomeDirectory:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "safari_settingsDirectoryForLibraryDirectory:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)safari_profileDirectoryURLWithID:()SafariNSFileManagerExtras createIfNeeded:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v12;

  v6 = a3;
  objc_msgSend(a1, "safari_profilesDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v9 = (id)objc_msgSend(a1, "safari_ensureDirectoryExists:", v8);
  }
  else
  {
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a1, "fileExistsAtPath:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = 0;
      goto LABEL_6;
    }
  }
  v12 = v8;
LABEL_6:

  return v12;
}

- (id)safari_nonContaineredSettingsDirectoryURL
{
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_nonContaineredSettingsDirectoryURL]::onceToken != -1)
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_nonContaineredSettingsDirectoryURL]::onceToken, &__block_literal_global_23_0);
  return (id)-[NSFileManager(SafariNSFileManagerExtras) safari_nonContaineredSettingsDirectoryURL]::nonContaineredSettingsDirectoryURL;
}

- (id)safari_productionSafariSettingsDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__NSFileManager_SafariNSFileManagerExtras__safari_productionSafariSettingsDirectory__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = a1;
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_productionSafariSettingsDirectory]::settingsDirectoryInitialized != -1)
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_productionSafariSettingsDirectory]::settingsDirectoryInitialized, block);
  return (id)-[NSFileManager(SafariNSFileManagerExtras) safari_productionSafariSettingsDirectory]::settingsDirectory;
}

- (id)safari_autoFillQuirksDownloadDirectoryURL
{
  void *v0;
  void *v1;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Safari"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)safari_createTemporaryDirectoryWithTemplate:()SafariNSFileManagerExtras
{
  id v4;
  void *v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;

  v4 = a3;
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = strdup((const char *)objc_msgSend(v6, "fileSystemRepresentation"));

  if (mkdtemp(v7))
  {
    objc_msgSend(a1, "stringWithFileSystemRepresentation:length:", v7, strlen(v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    free(v7);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    free(v7);
    v9 = 0;
  }

  return v9;
}

- (_QWORD)safari_subpathOfURL:()SafariNSFileManagerExtras relativeToDirectoryAtURL:error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3608], "safari_fileHandleWithURL:options:createMode:error:", v8, 0, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3608], "safari_fileHandleWithURL:options:createMode:error:", v7, 0, 0, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_fileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_10:
      a5 = 0;
      goto LABEL_16;
    }
    if ((objc_msgSend(v14, "hasPrefix:", v11) & 1) != 0)
    {
      v15 = objc_msgSend(v11, "length");
      if (objc_msgSend(v11, "hasSuffix:", CFSTR("/")))
      {
        objc_msgSend(v14, "substringFromIndex:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        a5 = (_QWORD *)v16;
        goto LABEL_16;
      }
      v21 = objc_msgSend(v14, "rangeOfString:options:range:", CFSTR("/"), 8, v15, objc_msgSend(v14, "length") - v15);
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v14, "substringFromIndex:", v21 + v22);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      if (a5)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0CB3308];
        v26[0] = *MEMORY[0x1E0CB2D50];
        v26[1] = v24;
        v27[0] = CFSTR("URL is not a parent of the tested URL");
        v27[1] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    else if (a5)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB3308];
      v28[0] = *MEMORY[0x1E0CB2D50];
      v28[1] = v18;
      v29[0] = CFSTR("URL is not a parent of the tested URL");
      v29[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      *a5 = v20;

      goto LABEL_10;
    }
LABEL_16:

    goto LABEL_17;
  }
  a5 = 0;
LABEL_17:

  return a5;
}

- (id)safari_createDirectoryWithUniqueName:()SafariNSFileManagerExtras relativeToDirectoryFileHandle:error:
{
  id v7;
  id v8;
  WBSUniqueFilenameEnumerator *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = -[WBSUniqueFilenameEnumerator initWithFilename:]([WBSUniqueFilenameEnumerator alloc], "initWithFilename:", v7);
  v10 = -[WBSUniqueFilenameEnumerator countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v10)
  {
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  v11 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v9);
      v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      v14 = objc_msgSend(v8, "fileDescriptor", (_QWORD)v20);
      v15 = objc_retainAutorelease(v13);
      if (!mkdirat(v14, (const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0x1C0u))
      {
        objc_msgSend(v8, "safari_fileURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "URLByAppendingPathComponent:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_16;
      }
      if (*__error() != 17)
      {
        if (!a5)
          goto LABEL_15;
        objc_msgSend(v8, "safari_fileURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URLByAppendingPathComponent:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        _NSErrorWithFilePathAndErrno();
        v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    v10 = -[WBSUniqueFilenameEnumerator countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    v16 = 0;
    if (v10)
      continue;
    break;
  }
LABEL_16:

  return v16;
}

- (id)safari_moveFileAtSubpath:()SafariNSFileManagerExtras relativeToFileHandle:toUniqueSubpath:relativeToFileHandle:error:
{
  objc_msgSend(a1, "safari_moveFileAtSubpath:relativeToFileHandle:toUniqueSubpath:relativeToFileHandle:error:usingExistingFileRecoveryBlock:", a3, a4, a5, a6, a7, &__block_literal_global_35);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)safari_moveFileAtSubpath:()SafariNSFileManagerExtras relativeToFileHandle:toUniqueSubpath:relativeToFileHandle:error:usingExistingFileRecoveryBlock:
{
  id v12;
  id v13;
  uint64_t (**v14)(id, id, void *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  id v21;
  const char *v22;
  int v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  size_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  void *v45;
  WBSUniqueFilenameEnumerator *obj;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v48 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a8;
  v45 = v12;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = -[WBSUniqueFilenameEnumerator initWithFilename:]([WBSUniqueFilenameEnumerator alloc], "initWithFilename:", v12);
  v15 = -[WBSUniqueFilenameEnumerator countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (!v15)
  {
LABEL_21:
    v29 = 0;
    goto LABEL_25;
  }
  v16 = *(_QWORD *)v50;
  v42 = *(_QWORD *)v50;
  do
  {
    v43 = v15;
    v17 = 0;
    while (2)
    {
      if (*(_QWORD *)v50 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v17);
      v19 = 1;
      do
      {
        v20 = objc_msgSend(v48, "fileDescriptor");
        v21 = objc_retainAutorelease(v47);
        v22 = (const char *)objc_msgSend(v21, "fileSystemRepresentation");
        v23 = objc_msgSend(v13, "fileDescriptor");
        v24 = objc_retainAutorelease(v18);
        if (!renameatx_np(v20, v22, v23, (const char *)objc_msgSend(v24, "fileSystemRepresentation"), 0x14u))
        {
          objc_msgSend(v13, "safari_fileURL");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "URLByAppendingPathComponent:", v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

          goto LABEL_25;
        }
        v25 = *__error();
        if (v25 != 17)
        {
          if (!a7)
            goto LABEL_21;
          objc_msgSend(v48, "safari_fileURL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "URLByAppendingPathComponent:", v21);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "safari_fileURL");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "URLByAppendingPathComponent:", v24);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25 == 63)
          {
            v35 = strnlen((const char *)objc_msgSend(objc_retainAutorelease(v24), "fileSystemRepresentation"), 0x100uLL);
            v36 = v34;
            if (v35 <= 0xFF)
            {
              v37 = objc_retainAutorelease(v34);
              if (strnlen((const char *)objc_msgSend(v37, "fileSystemRepresentation"), 0x401uLL) <= 0x400)
                v36 = v32;
              else
                v36 = v37;
            }
            v30 = v36;
          }
          else
          {
            v30 = 0;
          }
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "path");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, CFSTR("NSSourceFilePathErrorKey"));

          objc_msgSend(v34, "path");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, CFSTR("NSDestinationFilePath"));

          _NSErrorWithFilePathErrnoVariantAndExtraUserInfo();
          *a7 = (id)objc_claimAutoreleasedReturnValue();

          v29 = 0;
          goto LABEL_24;
        }
        objc_msgSend(v13, "safari_fileURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "URLByAppendingPathComponent:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v14[2](v14, v24, v27, v19);

        ++v19;
      }
      while ((v28 & 1) != 0);
      ++v17;
      v16 = v42;
      if (v17 != v43)
        continue;
      break;
    }
    v15 = -[WBSUniqueFilenameEnumerator countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    v29 = 0;
  }
  while (v15);
LABEL_25:

  return v29;
}

- (uint64_t)safari_removeFileAtURL:()SafariNSFileManagerExtras error:
{
  return objc_msgSend(a1, "_safari_removeFileAtURL:onlyIfFileExists:error:", a3, 0, a4);
}

- (uint64_t)safari_removeFileOnlyAtURL:()SafariNSFileManagerExtras error:
{
  return objc_msgSend(a1, "_safari_removeFileAtURL:onlyIfFileExists:error:", a3, 1, a4);
}

- (uint64_t)_safari_removeFileAtURL:()SafariNSFileManagerExtras onlyIfFileExists:error:
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = a3;
  if ((objc_msgSend(v7, "isFileURL") & 1) != 0)
  {
    objc_msgSend(v7, "path");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (unlink((const char *)objc_msgSend(v8, "fileSystemRepresentation")) && ((a4 & 1) != 0 || *__error() != 2))
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
        v9 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 1;
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)safari_pathWithUniqueFilenameForPath:()SafariNSFileManagerExtras
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_filenameByFixingIllegalCharacters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_URLWithUniqueFilename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)safari_frameworksDirectoryURLs
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.Safari.Core"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v3);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.SafariServices.framework"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "bundleURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v7);

  }
  return v0;
}

- (BOOL)safari_removeDirectoryIfEmpty:()SafariNSFileManagerExtras
{
  return rmdir((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation")) == 0;
}

- (void)safari_removeContentsOfDirectory:()SafariNSFileManagerExtras
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  size_t v20;
  id v21;
  _QWORD block[4];
  id v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (void *)MEMORY[0x1B5E27154]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __77__NSFileManager_SafariNSFileManagerExtras__safari_removeContentsOfDirectory___block_invoke;
  v30[3] = &__block_descriptor_40_e27_B24__0__NSURL_8__NSError_16l;
  v30[4] = a2;
  objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 17, v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(v7);
  v15 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138543875;
    v32 = v16;
    v33 = 2048;
    v34 = v17;
    v35 = 2113;
    v36 = v5;
    _os_log_impl(&dword_1B2621000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: about to remove %zu items from %{private}@", buf, 0x20u);

  }
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = dispatch_queue_create("com.apple.Safari.Core.safari_removeContentsOfDirectory", v18);

  v20 = objc_msgSend(v6, "count");
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __77__NSFileManager_SafariNSFileManagerExtras__safari_removeContentsOfDirectory___block_invoke_51;
  block[3] = &unk_1E649D0A0;
  v23 = v6;
  v24 = a1;
  v25 = a2;
  v21 = v6;
  dispatch_apply(v20, v19, block);

}

- (id)safari_createTemporaryDirectoryAppropriateForURL:()SafariNSFileManagerExtras error:
{
  objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, a3, 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)safari_topLevelDirectoriesAtURL:()SafariNSFileManagerExtras
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  id v11;
  id v12;
  char v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v18;
  id v19;
  id v21;
  id obj;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _QWORD v37[4];

  v37[1] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C999D0];
  v37[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __76__NSFileManager_SafariNSFileManagerExtras__safari_topLevelDirectoriesAtURL___block_invoke;
  v29[3] = &__block_descriptor_40_e27_B24__0__NSURL_8__NSError_16l;
  v29[4] = a2;
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v19, v5, 1, v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v18;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v23 = 0;
        v24 = 0;
        v10 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v24, v4, &v23, v18);
        v11 = v24;
        v12 = v23;
        if (v12)
          v13 = 0;
        else
          v13 = v10;
        if ((v13 & 1) != 0)
        {
          if (objc_msgSend(v11, "BOOLValue"))
            objc_msgSend(v21, "addObject:", v9);
        }
        else
        {
          v14 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "safari_privacyPreservingDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543875;
            v31 = v15;
            v32 = 2113;
            v33 = v9;
            v34 = 2114;
            v35 = v16;
            _os_log_error_impl(&dword_1B2621000, v14, OS_LOG_TYPE_ERROR, "%{public}@: error while getting NSURLIsDirectoryKey resource value for %{private}@: %{public}@", buf, 0x20u);

          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v6);
  }

  return v21;
}

- (void)safari_ensureDirectoryExists:()SafariNSFileManagerExtras .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B2621000, log, OS_LOG_TYPE_DEBUG, "Couldn't create directory %@", buf, 0xCu);

  OUTLINED_FUNCTION_0_3();
}

- (void)safari_ensureDirectoryExists:()SafariNSFileManagerExtras .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Couldn't create directory with error %{public}@", buf, 0xCu);

  OUTLINED_FUNCTION_0_3();
}

@end

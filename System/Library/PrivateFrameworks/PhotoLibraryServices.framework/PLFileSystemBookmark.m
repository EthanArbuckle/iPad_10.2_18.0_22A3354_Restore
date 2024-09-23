@implementation PLFileSystemBookmark

- (BOOL)supportsCloudUpload
{
  return 0;
}

- (id)fileSystemURL
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) == 0 && !MEMORY[0x19AEC0720]())
  {
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetsdClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourceClient");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[PLFileSystemBookmark objectID](self, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v10 = objc_msgSend(v5, "sandboxExtensionForFileSystemBookmark:bookmarkURL:sandboxExtensionToken:error:", v9, &v16, &v15, &v14);
    v6 = v16;
    v11 = v15;
    v12 = v14;

    v4 = 0;
    if (v10)
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D732D0]), "initWithURL:sandboxExtensionToken:consume:", v6, v11, 1);

    goto LABEL_10;
  }
  v18 = 0;
  -[PLFileSystemBookmark bookmarkData](self, "bookmarkData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[PLURL URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:](PLURL, "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v3, 256, 0, &v18, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;

  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    -[PLManagedObject shortObjectIDURI](self, "shortObjectIDURI");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v5;
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error resolving bookmark data for %@. Error: %@", buf, 0x16u);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v4, "startAccessingSecurityScopedResource");
LABEL_11:

  return v4;
}

+ (id)entityName
{
  return CFSTR("FileSystemBookmark");
}

+ (id)fileSystemBookmarkFromURL:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "startAccessingSecurityScopedResource");
  v36 = 0;
  objc_msgSend(v6, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v36;
  v35 = 0;
  v11 = *MEMORY[0x1E0C99D08];
  v34 = 0;
  v12 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v35, v11, &v34);
  v13 = v35;
  v14 = v34;
  v15 = v14;
  v16 = 0;
  if (!v12)
  {
    if (!v8)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(v6, "stopAccessingSecurityScopedResource");
    if (v9)
      goto LABEL_4;
    goto LABEL_12;
  }
  v30 = a1;
  v31 = v14;
  v32 = v10;
  objc_msgSend(v13, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D73208];
  objc_msgSend(v6, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "realPathForPath:error:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "hasPrefix:", v18))
  {
    v29 = v7;
    objc_msgSend(v21, "pathComponents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pathComponents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "count");
    v25 = v24 - objc_msgSend(v23, "count");
    if (v25 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v30, CFSTR("PLFileSystemBookmark.m"), 116, CFSTR("URL must be relative to the volume"));

    }
    objc_msgSend(v22, "subarrayWithRange:", objc_msgSend(v23, "count"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsJoinedByString:", CFSTR("/"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v29;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v30, CFSTR("PLFileSystemBookmark.m"), 121, CFSTR("url path %@ does not have volume path prefix %@"), v21, v18);
    v16 = 0;
  }

  v15 = v31;
  v10 = v32;
  if (v8)
    goto LABEL_11;
LABEL_3:
  if (v9)
  {
LABEL_4:
    +[PLManagedObject insertInManagedObjectContext:](PLFileSystemBookmark, "insertInManagedObjectContext:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBookmarkData:", v9);
    objc_msgSend(v17, "setPathRelativeToVolume:", v16);
    goto LABEL_15;
  }
LABEL_12:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v38 = v6;
    v39 = 2112;
    v40 = v10;
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error creating bookmark data for %@: %@", buf, 0x16u);
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PLFileSystemBookmark resource](self, "resource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PLAssetJournalEntryPayload *v7;
  void *v8;
  PLAssetJournalEntryPayload *v9;

  v4 = a3;
  -[PLFileSystemBookmark resource](self, "resource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isValidForJournalPersistence"))
  {
    v7 = [PLAssetJournalEntryPayload alloc];
    -[PLFileSystemBookmark resource](self, "resource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PLAssetJournalEntryPayload initWithInternalResource:filesystemBookmark:changedKeys:](v7, "initWithInternalResource:filesystemBookmark:changedKeys:", v8, self, v4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end

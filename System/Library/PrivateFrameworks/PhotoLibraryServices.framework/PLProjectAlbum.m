@implementation PLProjectAlbum

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLProjectAlbumJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLManagedAlbum isValidForPersistence](self, "isValidForPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLProjectAlbumJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (void)awakeFromInsert
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLProjectAlbum;
  -[PLGenericAlbum awakeFromInsert](&v3, sel_awakeFromInsert);
  -[PLGenericAlbum setKindValue:](self, "setKindValue:", 1508);
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  return (a3 & 1) == 0;
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLProjectAlbum;
  -[PLManagedAlbum willSave](&v9, sel_willSave);
  -[PLProjectAlbum managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend(v3, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "projectAlbumRootFolderInLibrary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PLProjectAlbum isInserted](self, "isInserted"))
    {
      objc_msgSend(v6, "childCollections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", self);

      if ((v8 & 1) == 0)
        objc_msgSend(v6, "addChildCollectionsObject:", self);
    }

  }
}

- (void)prepareForDeletion
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v3 = -[PLProjectAlbum setProjectPreviewImageData:error:](self, "setProjectPreviewImageData:error:", 0, &v8);
  v4 = v8;
  if (!v3)
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[PLProjectAlbum uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Clean up project preview image failed for project %@, error %@", buf, 0x16u);

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)PLProjectAlbum;
  -[PLManagedAlbum prepareForDeletion](&v7, sel_prepareForDeletion);

}

- (id)projectPreviewImageData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PLProjectAlbum projectRenderUuid](self, "projectRenderUuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoDirectoryWithType:", 15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLProjectAlbum _previewImageFilename](self, "_previewImageFilename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)duplicateProjectPreviewImageData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLProjectAlbum _previewImageFilename](self, "_previewImageFilename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v6;
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoDirectoryWithType:createIfNeeded:error:", 15, 1, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "stringByAppendingPathComponent:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathExtension:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v17 = objc_msgSend(v16, "copyItemAtPath:toPath:error:", v12, v15, &v22);
      v18 = v22;

      if ((v17 & 1) == 0)
      {
        PLBackendGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v18;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Unable to copy rendered preview data with error %@", buf, 0xCu);
        }

        v8 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v18);
      }

      v8 = v8;
      v20 = v8;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)setProjectPreviewImageData:(id)a3 error:(id *)a4
{
  const __CFData *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  CGImageSource *v12;
  CGImageSource *v13;
  CGImage *ImageAtIndex;
  CGImage *v15;
  size_t Width;
  size_t Height;
  BOOL v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v37;
  id v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = (const __CFData *)a3;
  -[PLGenericAlbum photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v9 = 1;
  objc_msgSend(v8, "photoDirectoryWithType:createIfNeeded:error:", 15, 1, &v38);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v38;

  if (!v10)
  {
LABEL_23:
    if (!a4)
      goto LABEL_25;
LABEL_24:
    *a4 = objc_retainAutorelease(v11);
    goto LABEL_25;
  }
  if (!v6)
    goto LABEL_14;
  v12 = CGImageSourceCreateWithData(v6, 0);
  if (!v12)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR("Unable to read image data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.backend"), 0, v32);
    v33 = objc_claimAutoreleasedReturnValue();

LABEL_22:
    v9 = 0;
    v11 = (id)v33;
    goto LABEL_23;
  }
  v13 = v12;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, 0);
  if (!ImageAtIndex)
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0CB2D50];
    v42 = CFSTR("Unable to read image data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.backend"), 0, v35);
    v33 = objc_claimAutoreleasedReturnValue();

    CFRelease(v13);
    goto LABEL_22;
  }
  v15 = ImageAtIndex;
  Width = CGImageGetWidth(ImageAtIndex);
  Height = CGImageGetHeight(v15);
  v18 = Width == 1024 && Height == 1024;
  v19 = v18;
  if (!v18)
  {
    v37 = v19;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid image size, project preview images must be %ld x %ld"), 1024, 1024);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.backend"), 0, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v23;
    v19 = v37;
  }
  CGImageRelease(v15);
  CFRelease(v13);
  if (!v19)
  {
    v9 = 0;
    if (!a4)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_14:
  -[PLProjectAlbum projectRenderUuid](self, "projectRenderUuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[PLProjectAlbum _previewImageFilename](self, "_previewImageFilename");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeItemAtPath:error:", v26, 0);

    -[PLProjectAlbum setProjectRenderUuid:](self, "setProjectRenderUuid:", 0);
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLProjectAlbum setProjectRenderUuid:](self, "setProjectRenderUuid:", v28);

    -[PLProjectAlbum _previewImageFilename](self, "_previewImageFilename");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[__CFData writeToFile:atomically:](v6, "writeToFile:atomically:", v30, 0);
  }
  v9 = 1;
  if (a4)
    goto LABEL_24;
LABEL_25:

  return v9;
}

- (id)_previewImageFilename
{
  void *v2;
  void *v3;

  -[PLProjectAlbum projectRenderUuid](self, "projectRenderUuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("tiff"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsAssetOrderKeys
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1508;
}

+ (id)entityName
{
  return CFSTR("ProjectAlbum");
}

+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4 documentType:(id)a5 projectExtensionIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObject insertInManagedObjectContext:](PLProjectAlbum, "insertInManagedObjectContext:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "setUuid:", v9);
    objc_msgSend(v13, "setProjectDocumentType:", v10);
    objc_msgSend(v13, "setProjectExtensionIdentifier:", v11);
  }

  return v13;
}

+ (BOOL)cleanupOrphanedProjectPreviewImagesInLibrary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  int v50;
  NSObject *v51;
  BOOL v52;
  char v54;
  id v55;
  void *v56;
  id *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  char v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  id v75;
  char v76;
  uint8_t v77[128];
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  const __CFString *v83;
  _QWORD v84[2];
  _QWORD v85[8];

  v85[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoDirectoryWithType:createIfNeeded:error:", 15, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v79 = v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Running maintenance on project render directory: %@", buf, 0xCu);
  }

  v76 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v7, &v76);

  if (v10 && v76)
  {
    +[PLProjectAlbum fetchRequest](PLProjectAlbum, "fetchRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("projectRenderUuid"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3880];
    v85[0] = CFSTR("com.apple.photos.projects.legacy.calendar");
    v85[1] = CFSTR("com.apple.photos.projects.legacy.prints");
    v85[2] = CFSTR("com.apple.photos.projects.legacy.card");
    v85[3] = CFSTR("com.apple.photos.projects.legacy.book");
    v85[4] = CFSTR("com.apple.photos.projects.slideshow");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateWithFormat:", CFSTR("NOT %K IN %@"), CFSTR("projectDocumentType"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB3528];
    v59 = (void *)v15;
    v60 = (void *)v12;
    v84[0] = v12;
    v84[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v18);

    v83 = CFSTR("projectRenderUuid");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPropertiesToFetch:", v19);

    objc_msgSend(v11, "setFetchBatchSize:", 100);
    objc_msgSend(v5, "managedObjectContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0;
    objc_msgSend(v20, "executeFetchRequest:error:", v11, &v75);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v75;

    v61 = (void *)v21;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v22;
      objc_msgSend(v23, "contentsOfDirectoryAtPath:error:", v7, &v74);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v74;

      v64 = v24 != 0;
      v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v24);

      if (v24)
      {
        v55 = v25;
        v56 = v11;
        v63 = v7;
        v57 = a4;
        v58 = v5;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v27 = v61;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v71;
          do
          {
            v31 = 0;
            v62 = v29;
            do
            {
              if (*(_QWORD *)v71 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v31);
              v33 = (void *)MEMORY[0x19AEC1554]();
              objc_msgSend(v32, "_previewImageFilename");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v26, "containsObject:", v34))
              {
                objc_msgSend(v26, "removeObject:", v34);
              }
              else
              {
                PLBackendGetLog();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v32, "uuid");
                  v36 = v30;
                  v37 = v26;
                  v38 = v27;
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "projectRenderUuid");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v79 = v39;
                  v80 = 2112;
                  v81 = v40;
                  _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "Project %@ has a render uuid (%@) but is missing corresponding image file, resetting render uuid", buf, 0x16u);

                  v27 = v38;
                  v26 = v37;
                  v30 = v36;
                  v29 = v62;
                }

                objc_msgSend(v32, "setProjectRenderUuid:", 0);
              }

              objc_autoreleasePoolPop(v33);
              ++v31;
            }
            while (v29 != v31);
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
          }
          while (v29);
        }

        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v26 = v26;
        v41 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v67;
          v22 = v55;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v67 != v43)
                objc_enumerationMutation(v26);
              v45 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              if ((objc_msgSend(v45, "hasPrefix:", CFSTR(".")) & 1) == 0)
              {
                objc_msgSend(v63, "stringByAppendingPathComponent:", v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                PLBackendGetLog();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v79 = v45;
                  _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_DEFAULT, "Removing orphaned project render image: %@", buf, 0xCu);
                }

                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = v22;
                v64 = objc_msgSend(v48, "removeItemAtPath:error:", v46, &v65);
                v49 = v65;

                v22 = v49;
              }
            }
            v42 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
          }
          while (v42);
        }
        else
        {
          v22 = v55;
        }

        a4 = v57;
        v5 = v58;
        v7 = v63;
        v11 = v56;
        v54 = v64;
      }
      else
      {
        v54 = 0;
        v22 = v25;
      }
    }
    else
    {
      v26 = 0;
      v54 = 0;
    }

    v52 = v54 & 1;
    if (!a4)
      goto LABEL_40;
LABEL_39:
    *a4 = objc_retainAutorelease(v22);
    goto LABEL_40;
  }
  if (v76)
    v50 = 0;
  else
    v50 = v10;
  if (v50 == 1)
  {
    PLBackendGetLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v7;
      _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_ERROR, "Project data directory path points to a file: %@", buf, 0xCu);
    }

  }
  v22 = 0;
  v52 = 1;
  if (a4)
    goto LABEL_39;
LABEL_40:

  return v52;
}

+ (id)albumSupportsAssetOrderKeysPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 1508);
}

+ (id)validKindsForPersistence
{
  pl_dispatch_once();
  return (id)validKindsForPersistence_pl_once_object_21;
}

void __42__PLProjectAlbum_validKindsForPersistence__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(MEMORY[0x1E0C9AA60], "copy");
  v1 = (void *)validKindsForPersistence_pl_once_object_21;
  validKindsForPersistence_pl_once_object_21 = v0;

}

@end

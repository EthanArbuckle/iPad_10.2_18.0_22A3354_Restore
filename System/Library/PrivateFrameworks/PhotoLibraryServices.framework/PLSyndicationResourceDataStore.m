@implementation PLSyndicationResourceDataStore

+ (BOOL)_markSyndicationResourceAsLocallyAvailableWithURL:(id)a3 resource:(id)a4 inode:(unint64_t)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PLPrimaryResourceDataStoreKey *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  const __CFString *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSyndicationResourceDataStore.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    if (v13)
    {
LABEL_3:
      if (!a5)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSyndicationResourceDataStore.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

  if (a5)
LABEL_4:
    objc_msgSend(v13, "setFileID:", a5);
LABEL_5:
  v14 = objc_msgSend(v13, "resourceType");
  v15 = objc_msgSend(v13, "version");
  v16 = objc_msgSend(v13, "recipeID");
  objc_msgSend(v13, "uniformTypeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLResourceInstaller generatedValidatedExternalSyndicationResourceOfType:version:recipeID:fileURL:requireFileToBePresent:uniformTypeIdentifier:](PLResourceInstaller, "generatedValidatedExternalSyndicationResourceOfType:version:recipeID:fileURL:requireFileToBePresent:uniformTypeIdentifier:", v14, v15, v16, v11, 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = [PLPrimaryResourceDataStoreKey alloc];
    objc_msgSend(v13, "asset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PLPrimaryResourceDataStoreKey initFromExistingLocationOfExternalResource:asset:](v19, "initFromExistingLocationOfExternalResource:asset:", v18, v20);

    -[NSObject keyData](v21, "keyData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDataStoreKeyData:", v22);

    objc_msgSend(v13, "setDataLength:", objc_msgSend(v18, "dataLength"));
    objc_msgSend(v13, "setSyndicationLocalAvailabilityWithAvailable:", 1);
    objc_msgSend(v13, "fileURL");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      if ((-[__CFString isEqual:](v23, "isEqual:", v11) & 1) != 0)
      {
        PLSyndicationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "singleLineDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v26;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "[resource] marked resource as locally available: %@", buf, 0xCu);

        }
        v27 = 1;
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Resource data store key url: (%@) does not match initial syndication resource url: (%@)"), v24, v11);
      v28 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = CFSTR("Failed to store syndication resource data store key data, url is nil");
    }

    v24 = (__CFString *)v28;
  }
  else
  {
    v24 = CFSTR("Failed to generate external resource, file may not be present");
  }
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CB2938]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74600], 4, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  PLSyndicationGetLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v13, "singleLineDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v32;
    v39 = 2112;
    v40 = v30;
    _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "[resource] failed to mark resource (%@) as locally available with error: %@", buf, 0x16u);

  }
  v33 = v30;
  v25 = v33;
  v27 = 0;
  if (a6)
    *a6 = objc_retainAutorelease(v33);
  v21 = v25;
LABEL_20:

  return v27;
}

+ (BOOL)_unpackPVTBundleAtURL:(id)a3 primaryURL:(id *)a4 secondaryURL:(id *)a5 error:(id *)a6
{
  objc_class *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  char v27;
  uint8_t v29[8];
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = (objc_class *)MEMORY[0x1E0D75318];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithBundleAtURL:", v10);

  if (v11
    && (objc_msgSend(v11, "imagePath"), (v12 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v13 = (void *)v12,
        objc_msgSend(v11, "videoPath"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    PLSyndicationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "[resource] found image and video complement in live photo bundle", v29, 2u);
    }

    v16 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v11, "imagePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPath:isDirectory:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v11, "videoPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileURLWithPath:isDirectory:", v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = 1;
  }
  else
  {
    PLSyndicationGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "[resource] unable to unpack live photo bundle", v29, 2u);
    }

    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D74600];
    v30 = *MEMORY[0x1E0CB2938];
    v31[0] = CFSTR("Unable to unpack live photo bundle");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 4, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v21 = 0;
    v18 = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v18);
  if (a5)
    *a5 = objc_retainAutorelease(v21);
  if (a6)
    v27 = v23;
  else
    v27 = 1;
  if ((v27 & 1) == 0)
    *a6 = objc_retainAutorelease(v22);

  return v23;
}

+ (void)_provideFileURLAndUnwrapLivePhotoIfNeededForBundleID:(id)a3 syndicationIdentifier:(id)a4 typeIdentifier:(id)a5 isLivePhoto:(BOOL)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = a5;
  PLSyndicationGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v27 = v13;
    v28 = 2114;
    v29 = v14;
    v30 = 2048;
    v31 = a7;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "[resource] making file provider request with bundleID: %{public}@, syndicationID: %{public}@, options: %lu", buf, 0x20u);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __162__PLSyndicationResourceDataStore__provideFileURLAndUnwrapLivePhotoIfNeededForBundleID_syndicationIdentifier_typeIdentifier_isLivePhoto_options_completionHandler___block_invoke;
  v21[3] = &unk_1E3671360;
  v24 = v15;
  v25 = a1;
  v22 = v13;
  v23 = v14;
  v18 = v14;
  v19 = v13;
  v20 = v15;
  objc_msgSend(a1, "_provideFileURLForBundleID:itemIdentifier:typeIdentifier:options:completionHandler:", v19, v18, v16, a7, v21);

}

+ (BOOL)_shouldUseDataInterfaceForBundleID:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.Stickers"));
}

+ (void)_provideFileURLForBundleID:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(a1, "_shouldUseDataInterfaceForBundleID:", v12))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __117__PLSyndicationResourceDataStore__provideFileURLForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
    v17[3] = &unk_1E3671390;
    v18 = v15;
    objc_msgSend(a1, "_provideTemporaryFileURLFromDataForBundleID:itemIdentifier:typeIdentifier:options:completionHandler:", v12, v13, v14, a6, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "provideFileURLForBundle:itemIdentifier:typeIdentifier:options:completionHandler:", v12, v13, v14, a6, v15);

  }
}

+ (void)_addTemporaryURL:(id)a3 itemIdentifier:(id)a4 error:(id)a5 toResults:(id)a6 andFileHandles:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v13)
    {
LABEL_3:
      objc_msgSend(v13, "path");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = open((const char *)objc_msgSend(v18, "fileSystemRepresentation"), 0);

      if ((v19 & 0x80000000) != 0)
      {
        v21 = *__error();
        PLSyndicationGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          v38 = v21;
          v39 = 2112;
          v40 = v23;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "open failed with errno %d for file at path %@", buf, 0x12u);

        }
        if (!v15)
        {
          v24 = v21;
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v26 = *MEMORY[0x1E0CB2FE0];
          v35 = *MEMORY[0x1E0CB3308];
          v36 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, v24, v27);
          v15 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v19, 1);
        objc_msgSend(v17, "addObject:", v20);

      }
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AD8]), "initWithFileURL:andError:", v13, v15);
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSyndicationResourceDataStore.m"), 334, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

    if (v13)
      goto LABEL_3;
  }
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSyndicationResourceDataStore.m"), 350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  v30 = objc_alloc(MEMORY[0x1E0CA6AD8]);
  v31 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "fileURLWithPath:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v30, "initWithFileURL:andError:", v33, v15);

LABEL_14:
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v28, v14);

}

+ (void)_provideFileURLsForBundleID:(id)a3 itemIdentifiers:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  dispatch_queue_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  void *context;
  void *v31;
  id v32;
  id obj;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(a1, "_shouldUseDataInterfaceForBundleID:", v12))
  {
    v31 = v15;
    v34 = v14;
    v35 = v12;
    context = (void *)MEMORY[0x19AEC1554]();
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("+[PLSyndicationResourceDataStore _provideFileURLsForBundleID:itemIdentifiers:typeIdentifier:options:completionHandler:]", v17);

    v19 = dispatch_group_create();
    v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v32 = v13;
    obj = v13;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v49;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v49 != v23)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v24);
          dispatch_group_enter(v19);
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke;
          v41[3] = &unk_1E36713E0;
          v42 = v19;
          v26 = v18;
          v47 = a1;
          v43 = v26;
          v44 = v25;
          v45 = v16;
          v46 = v20;
          objc_msgSend(a1, "_provideTemporaryFileURLFromDataForBundleID:itemIdentifier:typeIdentifier:options:completionHandler:", v35, v25, v34, a6, v41, context);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v22);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_3;
    block[3] = &unk_1E3671878;
    v40 = v31;
    v37 = v16;
    v38 = v20;
    v39 = obj;
    v27 = v20;
    v28 = v16;
    dispatch_group_notify(v19, v18, block);

    v15 = v31;
    objc_autoreleasePoolPop(context);
    v14 = v34;
    v12 = v35;
    v13 = v32;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "provideFileURLsForBundle:itemIdentifiers:typeIdentifier:options:completionHandler:", v12, v13, v14, a6, v15);

  }
}

+ (void)_provideTemporaryFileURLFromDataForBundleID:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __134__PLSyndicationResourceDataStore__provideTemporaryFileURLFromDataForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  v19[3] = &unk_1E3671430;
  v20 = v12;
  v21 = v11;
  v22 = v13;
  v23 = v14;
  v24 = a6;
  v15 = v13;
  v16 = v14;
  v17 = v11;
  v18 = v12;
  PLUTIAndSizeFromCSSearchableItemIdentifier(v18, v17, v19);

}

+ (BOOL)_safeCopyItemAtURL:(id)a3 toURLAndReplaceIfNeeded:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void **v25;
  uint64_t *v26;
  void *v27;
  id v28;
  BOOL v29;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8 || (unint64_t)objc_msgSend(v9, "count") < 6)
    goto LABEL_12;
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D743E0]))
    goto LABEL_11;
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74650]) & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D74648]);

  if (!v14)
  {
LABEL_12:
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D74600];
    v41 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid url for syndication data store: %@"), v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v23;
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = &v42;
    v26 = &v41;
    goto LABEL_13;
  }
  if (!v7
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "path"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v15, "fileExistsAtPath:", v16),
        v16,
        v15,
        !v17))
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D74600];
    v43 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid copy from url: %@"), v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v23;
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = &v44;
    v26 = &v43;
    goto LABEL_13;
  }
  v40 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v19, &v40);

  if (v40)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D74600];
    v45 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("copy to url is a directory: %@"), v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v23;
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = (void **)v46;
    v26 = &v45;
LABEL_13:
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 0, v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeItemAtURL:error:", v8, 0);

  }
  objc_msgSend(v8, "URLByDeletingLastPathComponent");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v34 = objc_msgSend(v33, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v32, 1, 0, &v39);
  v28 = v39;

  if (v34)
  {
    v38 = 0;
    v35 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v7, v8, &v38);
    v36 = v38;
    v37 = v36;
    if (v35)
    {

      v29 = 1;
      goto LABEL_17;
    }

    v28 = v37;
  }
  else
  {

  }
LABEL_14:
  if (a5)
    *a5 = objc_retainAutorelease(v28);

  v29 = 0;
LABEL_17:

  return v29;
}

+ (void)provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs:(id)a3 destURLs:(id)a4 options:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  qos_class_t v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id obj;
  _QWORD block[4];
  id v42;
  _QWORD *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  NSObject *v47;
  id v48;
  _QWORD *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  uint64_t v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v38 = a4;
  v39 = a5;
  v37 = a6;
  v36 = a7;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v58 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v18);
        }
        objc_msgSend(v19, "addObject:", v17);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    }
    while (v14);
  }

  v20 = dispatch_group_create();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__77216;
  v55[4] = __Block_byref_object_dispose__77217;
  v56 = 0;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v21 = v13;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v52 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
        dispatch_group_enter(v20);
        objc_msgSend(v21, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = PLSyndicationCSProvideOptionsFromRequestOptions(v39, v25);
        PLSyndicationGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = objc_msgSend(v26, "count");
          *(_DWORD *)buf = 134218498;
          v62 = v29;
          v63 = 2114;
          v64 = v25;
          v65 = 2048;
          v66 = v27;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_INFO, "[resource] issuing batch request for %tu fileURLs for bundle ID %{public}@ with options 0x%tx", buf, 0x20u);
        }

        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __155__PLSyndicationResourceDataStore_provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs_destURLs_options_resultHandler_completionHandler___block_invoke;
        v44[3] = &unk_1E3671480;
        v44[4] = v25;
        v30 = v26;
        v45 = v30;
        v46 = v38;
        v50 = a1;
        v48 = v37;
        v49 = v55;
        v47 = v20;
        objc_msgSend(a1, "_provideFileURLsForBundleID:itemIdentifiers:typeIdentifier:options:completionHandler:", v25, v30, &stru_1E36789C0, v27, v44);

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    }
    while (v22);
  }

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(v31, v32, 0);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = dispatch_queue_create("PLSyndicationResourceDataStore-provideURLs", v33);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __155__PLSyndicationResourceDataStore_provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs_destURLs_options_resultHandler_completionHandler___block_invoke_99;
  block[3] = &unk_1E36714A8;
  v42 = v36;
  v43 = v55;
  v35 = v36;
  dispatch_group_notify(v20, v34, block);

  _Block_object_dispose(v55, 8);
}

+ (BOOL)markResource:(id)a3 purgeableAndLocallyAvailableWithFileURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v13 = 0;
  if (!+[PLCacheDeleteSupport markPurgeableForFileAtURL:withUrgency:outInode:](PLCacheDeleteSupport, "markPurgeableForFileAtURL:withUrgency:outInode:", v8, 0, &v13))
  {
    PLSyndicationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "[resource] failed to mark file purgeable at url: %@", buf, 0xCu);
    }

  }
  v12 = 0;
  v10 = objc_msgSend(a1, "_markSyndicationResourceAsLocallyAvailableWithURL:resource:inode:error:", v8, v7, v13, &v12);

  return v10;
}

+ (unsigned)storeClassID
{
  return 3;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  uint64_t v3;
  int v4;
  void *v5;

  v3 = a3;
  if (a3 >= 0x10u)
    v4 = 16;
  else
    v4 = a3;
  if (v4 == 3 || v4 == 4 || v4 == 16)
    v5 = (void *)objc_opt_class();
  else
    v5 = 0;
  return objc_msgSend(v5, "keyLengthWithDataPreview:", v3);
}

+ (id)supportedRecipes
{
  return (id)MEMORY[0x1E0C9AA60];
}

void __155__PLSyndicationResourceDataStore_provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs_destURLs_options_resultHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  char v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  int v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  NSObject *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v55 = a2;
  v4 = a3;
  PLSyndicationGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v69 = v6;
    v70 = 2048;
    v71 = objc_msgSend(v55, "count");
    v72 = 2112;
    v73 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[resource] batch request for bundle ID %{public}@ returned %tu results, error: %@", buf, 0x20u);
  }

  if (!v55)
  {
    v45 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v46 = v4;
    v7 = *(id *)(v45 + 40);
    *(_QWORD *)(v45 + 40) = v46;
    goto LABEL_49;
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v7 = *(id *)(a1 + 40);
  v56 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
  if (v56)
  {
    v47 = v4;
    v54 = *(_QWORD *)v65;
    v49 = *MEMORY[0x1E0CB2938];
    v50 = *MEMORY[0x1E0D74600];
    v48 = *MEMORY[0x1E0D75488];
    obj = v7;
    while (1)
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v65 != v54)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v55, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "url");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v13 = 0;
            v14 = 1;
            goto LABEL_17;
          }
          objc_msgSend(v11, "error");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          PLSyndicationGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "error");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v69 = v9;
            v70 = 2112;
            v71 = (uint64_t)v19;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "[resource] batch result for item identifier %{public}@ returned error %@", buf, 0x16u);

          }
        }
        else
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v76 = v49;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no batch result for item identifier: %@"), v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", v50, 4, v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          PLSyndicationGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v69 = v9;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "[resource] no batch result for item identifier %{public}@", buf, 0xCu);
          }
        }

        v14 = 0;
LABEL_17:
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v20;
        if (!v14)
        {
          v29 = v13;
          v30 = 0;
          v28 = 0;
          v27 = 0;
          v31 = 0;
          v32 = 0;
          goto LABEL_45;
        }
        v21 = v20;
        if (objc_msgSend(v20, "count") != 2)
        {
          v29 = v13;
          PLSyndicationGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v34 = objc_msgSend(v21, "count");
            *(_DWORD *)buf = 134217984;
            v69 = v34;
            _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "[resource] invalid number of destination URLs provided: %tu", buf, 0xCu);
          }
          v30 = 0;
          v53 = 0;
          v27 = 0;
          v31 = 0;
          v32 = 0;
          goto LABEL_44;
        }
        objc_msgSend(v11, "url");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pathExtension");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v48);

        if ((v24 & 1) == 0)
        {
          v29 = v13;
          objc_msgSend(v11, "url");
          v27 = (id)objc_claimAutoreleasedReturnValue();
          v28 = 0;
LABEL_27:
          v53 = v28;
          objc_msgSend(v27, "lastPathComponent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
          v31 = objc_claimAutoreleasedReturnValue();
          v35 = *(void **)(a1 + 80);
          v60 = 0;
          v36 = objc_msgSend(v35, "_safeCopyItemAtURL:toURLAndReplaceIfNeeded:error:", v27, v31, &v60);
          v37 = v60;
          v38 = v37;
          if ((v36 & 1) != 0)
          {

            if (!v28)
            {
              v30 = 0;
              goto LABEL_37;
            }
            objc_msgSend(v57, "objectAtIndexedSubscript:", 1);
            v33 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v39 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v39, "removeItemAtURL:error:", v33, 0);

            v40 = *(void **)(a1 + 80);
            v59 = 0;
            LOBYTE(v39) = objc_msgSend(v40, "_safeCopyItemAtURL:toURLAndReplaceIfNeeded:error:", v28, v33, &v59);
            v41 = v59;
            v42 = v41;
            if ((v39 & 1) != 0)
            {

              v30 = v33;
LABEL_37:
              PLSyndicationGetLog();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v69 = v9;
                v70 = 2112;
                v71 = (uint64_t)v31;
                _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "[resource] delivering individual result of batch download for identifier: %{public}@, primary url: %@", buf, 0x16u);
              }
            }
            else
            {
              PLSyndicationGetLog();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138544130;
                v69 = v9;
                v70 = 2112;
                v71 = (uint64_t)v53;
                v72 = 2112;
                v73 = v33;
                v74 = 2112;
                v75 = v42;
                _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "[resource] failed to copy secondary resource for identifier: %{public}@ from url: %@ to url: %@, error: %@", buf, 0x2Au);
              }

              if (!v29)
                v29 = v42;

              v30 = 0;
            }
          }
          else
          {
            PLSyndicationGetLog();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138544130;
              v69 = v9;
              v70 = 2112;
              v71 = (uint64_t)v27;
              v72 = 2112;
              v73 = v31;
              v74 = 2112;
              v75 = v38;
              _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_ERROR, "[resource] failed to copy primary resource for identifier: %{public}@ from url: %@ to url: %@, error: %@", buf, 0x2Au);
            }

            if (!v29)
              v29 = v38;

            v30 = 0;
            v33 = v31;
            v31 = 0;
          }
LABEL_44:

          v28 = v53;
          goto LABEL_45;
        }
        v25 = *(void **)(a1 + 80);
        objc_msgSend(v11, "url");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0;
        v63 = 0;
        v61 = v13;
        v52 = objc_msgSend(v25, "_unpackPVTBundleAtURL:primaryURL:secondaryURL:error:", v26, &v63, &v62, &v61);
        v27 = v63;
        v28 = v62;
        v29 = v61;

        v30 = 0;
        v31 = 0;
        v32 = 0;
        if (v52)
          goto LABEL_27;
LABEL_45:
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

      }
      v7 = obj;
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
      if (!v56)
      {
        v4 = v47;
        break;
      }
    }
  }
LABEL_49:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __155__PLSyndicationResourceDataStore_provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs_destURLs_options_resultHandler_completionHandler___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __134__PLSyndicationResourceDataStore__provideTemporaryFileURLFromDataForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v7)
  {
    PLSyndicationGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v51 = 0;
      v52 = 2114;
      v53 = v20;
      v54 = 2114;
      v55 = v21;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "UTI not found for syndication ingest: %{public}@ item %{public}@ bundleID %{public}@", buf, 0x20u);
    }

    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D74498];
    v48 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UTI not found for syndication ingest of item %@ bundleID %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 49504, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (!v8 || objc_msgSend(v8, "integerValue") > 0x100000)
  {
    PLSyndicationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v51 = v8;
      v52 = 2114;
      v53 = v11;
      v54 = 2114;
      v55 = v12;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Invalid size for syndication ingest: %{public}@ item %{public}@ bundleID %{public}@", buf, 0x20u);
    }

    if (v8)
      v13 = 49502;
    else
      v13 = 49503;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D74498];
    v46 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid size for syndication ingest: %@ for item %@ bundleID %@"), v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v13, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v26 = objc_msgSend(v8, "integerValue");
    objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(a1 + 32);
    v37 = *(_QWORD *)(a1 + 40);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __134__PLSyndicationResourceDataStore__provideTemporaryFileURLFromDataForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_69;
    v38[3] = &unk_1E3671408;
    v29 = *(_QWORD *)(a1 + 48);
    v30 = *(_QWORD *)(a1 + 64);
    v42 = *(id *)(a1 + 56);
    v43 = v26;
    v39 = *(id *)(a1 + 32);
    v40 = *(id *)(a1 + 40);
    v41 = v18;
    objc_msgSend(v27, "provideDataForBundle:itemIdentifier:typeIdentifier:options:completionHandler:", v37, v28, v29, v30, v38);

    v31 = v42;
  }
  else
  {
    v32 = *(_QWORD *)(a1 + 56);
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0D74498];
    v44 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nil UTType for syndication ingest of item %@ bundleID %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 49504, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v32 + 16))(v32, 0, v36);

  }
LABEL_14:

}

void __134__PLSyndicationResourceDataStore__provideTemporaryFileURLFromDataForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke_69(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (objc_msgSend(v5, "length") != a1[8])
    {
      PLSyndicationGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = a1[8];
        v9 = objc_msgSend(v5, "length");
        v10 = a1[4];
        v11 = (void *)a1[5];
        *(_DWORD *)buf = 134218754;
        v42 = v8;
        v43 = 2048;
        v44 = v9;
        v45 = 2114;
        v46 = v10;
        v47 = 2114;
        v48 = v11;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Warning: CoreSpotlight size %td != data length %tu for item %{public}@ bundleID %{public}@", buf, 0x2Au);
      }

    }
    if ((unint64_t)objc_msgSend(v5, "length") <= 0x100000)
    {
      NSTemporaryDirectory();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingPathComponent:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "stringByAppendingPathExtensionForType:", a1[6]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      PLSyndicationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(v5, "length");
        v27 = a1[4];
        v28 = a1[5];
        *(_DWORD *)buf = 134218754;
        v42 = v26;
        v43 = 2114;
        v44 = v27;
        v45 = 2114;
        v46 = v28;
        v47 = 2112;
        v48 = v20;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "Writing temporary file for ingest %tu bytes, item %{public}@ bundleID %{public}@ to %@", buf, 0x2Au);
      }

      v38 = 0;
      v29 = objc_msgSend(v5, "writeToFile:options:error:", v20, 0, &v38);
      v30 = v38;
      PLSyndicationGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v29)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v33 = objc_msgSend(v5, "length");
          v34 = a1[4];
          v35 = (void *)a1[5];
          *(_DWORD *)buf = 134218754;
          v42 = v33;
          v43 = 2112;
          v44 = (uint64_t)v20;
          v45 = 2114;
          v46 = v34;
          v47 = 2114;
          v48 = v35;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_INFO, "%tu bytes written to path %@ for item %{public}@ bundleID %{public}@", buf, 0x2Au);
        }

        v36 = a1[7];
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v20);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v36 + 16))(v36, v37, 0);

      }
      else
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v42 = (uint64_t)v20;
          v43 = 2112;
          v44 = (uint64_t)v30;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Data write to file %@ failed: %@", buf, 0x16u);
        }

        (*(void (**)(void))(a1[7] + 16))();
      }

    }
    else
    {
      PLSyndicationGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_msgSend(v5, "length");
        v14 = a1[4];
        v15 = a1[5];
        *(_DWORD *)buf = 134218498;
        v42 = v13;
        v43 = 2114;
        v44 = v14;
        v45 = 2114;
        v46 = v15;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Invalid size for syndication ingest: %tu item %{public}@ bundleID %{public}@", buf, 0x20u);
      }

      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D74498];
      v39 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Data size %tu exceeds max allowable size for syndication ingest of item %@ bundleID %@"), objc_msgSend(v5, "length"), a1[4], a1[5]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 49502, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(a1[7] + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(NSObject **)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_2;
  v13[3] = &unk_1E36713B8;
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v14 = v5;
  v15 = v9;
  v19 = *(_QWORD *)(a1 + 72);
  v16 = v6;
  v17 = v10;
  v18 = *(id *)(a1 + 64);
  v11 = v6;
  v12 = v5;
  dispatch_group_async(v7, v8, v13);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "error");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(v7, "url");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
            goto LABEL_10;
          objc_msgSend(v7, "url");
          v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          unlink((const char *)objc_msgSend(v8, "fileSystemRepresentation"));
        }

LABEL_10:
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

uint64_t __119__PLSyndicationResourceDataStore__provideFileURLsForBundleID_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 72), "_addTemporaryURL:itemIdentifier:error:toResults:andFileHandles:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __117__PLSyndicationResourceDataStore__provideFileURLForBundleID_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = v4;
  if (v4)
  {
    unlink((const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"));
    v3 = v4;
  }

}

void __162__PLSyndicationResourceDataStore__provideFileURLAndUnwrapLivePhotoIfNeededForBundleID_syndicationIdentifier_typeIdentifier_isLivePhoto_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  __CFString *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  int v15;
  void *v16;
  id v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  char v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLSyndicationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "[resource] error from provideFileURL: %@", buf, 0xCu);
    }
LABEL_12:
    LOBYTE(v8) = 0;
    goto LABEL_13;
  }
  if (!objc_msgSend(MEMORY[0x1E0D732C8], "fileURLHasSecurityScope:", v5))
  {
    PLSyndicationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "path");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "[resource] providerURL does not have security scope for path %@", buf, 0xCu);

    }
    goto LABEL_12;
  }
  v8 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
  PLSyndicationGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v8)
      v9 = CFSTR("was");
    else
      v9 = CFSTR("was not");
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "[resource] providerURL has security scope. accessing %@ started for URL path %@", buf, 0x16u);

  }
LABEL_13:

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __162__PLSyndicationResourceDataStore__provideFileURLAndUnwrapLivePhotoIfNeededForBundleID_syndicationIdentifier_typeIdentifier_isLivePhoto_options_completionHandler___block_invoke_49;
  v23[3] = &unk_1E3671338;
  v25 = *(id *)(a1 + 48);
  v26 = v8;
  v12 = v5;
  v24 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v23);
  objc_msgSend(v12, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D75488]);

  if (v15)
  {
    v16 = *(void **)(a1 + 56);
    v21 = 0;
    v22 = 0;
    v20 = v6;
    objc_msgSend(v16, "_unpackPVTBundleAtURL:primaryURL:secondaryURL:error:", v12, &v22, &v21, &v20);
    v17 = v22;
    v18 = v21;
    v19 = v20;

    v6 = v19;
  }
  else
  {
    v17 = v12;
    v18 = 0;
  }
  ((void (**)(_QWORD, id, id, __CFString *))v13)[2](v13, v17, v18, v6);

}

uint64_t __162__PLSyndicationResourceDataStore__provideFileURLAndUnwrapLivePhotoIfNeededForBundleID_syndicationIdentifier_typeIdentifier_isLivePhoto_options_completionHandler___block_invoke_49(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  return result;
}

- (id)_getDestinationURLAndFixLocalAvailabilityIfNeededForResource:(id)a3 fileIdentifier:(id *)a4 isLocallyAvailable:(BOOL *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  char v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v37;
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationResourceDataStore.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

  }
  objc_msgSend(v10, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "resourceType");
  v13 = objc_msgSend(v10, "version");
  v14 = objc_msgSend(v10, "recipeID");
  objc_msgSend(v10, "uniformTypeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "syndicationFileIdentifierForResourceType:version:recipeID:utiString:", v12, v13, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__77216;
  v60 = __Block_byref_object_dispose__77217;
  v61 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__77216;
  v50 = __Block_byref_object_dispose__77217;
  v51 = 0;
  objc_msgSend(v11, "pathManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __135__PLSyndicationResourceDataStore__getDestinationURLAndFixLocalAvailabilityIfNeededForResource_fileIdentifier_isLocallyAvailable_error___block_invoke;
  v41[3] = &unk_1E3671310;
  v43 = &v56;
  v44 = &v46;
  v45 = &v52;
  v19 = v17;
  v42 = v19;
  objc_msgSend(v18, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v19, 1, v41);

  if (*((_BYTE *)v53 + 24) && (objc_msgSend(v10, "isLocallyAvailable") & 1) == 0)
  {
    PLSyndicationGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "singleLineDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v57[5];
      *(_DWORD *)buf = 138412546;
      v63 = v21;
      v64 = 2112;
      v65 = v22;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "[resource] fixing model for resource (%@), file exists but is not marked locally available at URL: %@", buf, 0x16u);

    }
    objc_msgSend((id)objc_opt_class(), "_markSyndicationResourceAsLocallyAvailableWithURL:resource:inode:error:", v57[5], v10, 0, 0);
    if (objc_msgSend(v10, "hasInvalidFileID"))
    {
      PLSyndicationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "singleLineDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v57[5];
        *(_DWORD *)buf = 138412546;
        v63 = v24;
        v64 = 2112;
        v65 = v25;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "[resource] found resource (%@) with invalid fileID, attempting to mark purgeable for file url: %@", buf, 0x16u);

      }
      v40 = 0;
      if (+[PLCacheDeleteSupport markPurgeableForFileAtURL:withUrgency:outInode:](PLCacheDeleteSupport, "markPurgeableForFileAtURL:withUrgency:outInode:", v57[5], 0, &v40))
      {
        objc_msgSend(v10, "setFileID:", v40);
      }
      else
      {
        PLSyndicationGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (void *)v57[5];
          *(_DWORD *)buf = 138412290;
          v63 = v27;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "[resource] failed to mark file purgeable at url: %@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v10, "managedObjectContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "hasChanges");

    if (v29)
    {
      objc_msgSend(v10, "managedObjectContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v31 = objc_msgSend(v30, "save:", &v39);
      v32 = v39;

      if ((v31 & 1) == 0)
      {
        PLSyndicationGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "singleLineDescription");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v63 = v34;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "[resource] failed to save changes to fix local availability for resource: %@", buf, 0xCu);

        }
      }

    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v19);
  if (a5)
    *a5 = *((_BYTE *)v53 + 24);
  if (a6)
    *a6 = objc_retainAutorelease((id)v47[5]);
  v35 = (id)v57[5];

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v35;
}

- (BOOL)_copyAndMarkPurgeableItemAtURL:(id)a3 withPathManager:(id)a4 destFileIdentifier:(id)a5 inode:(unint64_t *)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationResourceDataStore.m"), 456, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    if (v15)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationResourceDataStore.m"), 455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  if (!v14)
    goto LABEL_10;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationResourceDataStore.m"), 457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destFileIdentifier"));

LABEL_4:
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 1;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__77216;
  v37 = __Block_byref_object_dispose__77217;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __112__PLSyndicationResourceDataStore__copyAndMarkPurgeableItemAtURL_withPathManager_destFileIdentifier_inode_error___block_invoke;
  v23[3] = &unk_1E3671458;
  v16 = v13;
  v24 = v16;
  v26 = &v39;
  v27 = &v33;
  v28 = &v29;
  v17 = v15;
  v25 = v17;
  objc_msgSend(v14, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v17, 2, v23);
  if (a6)
    *a6 = v30[3];
  if (a7)
    *a7 = objc_retainAutorelease((id)v34[5]);
  v18 = *((_BYTE *)v40 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v18;
}

- (BOOL)_copyAndMarkAsLocallyAvailablePairedLivePhotoResourceForRequestedResource:(id)a3 requestedVideoComplement:(BOOL)a4 sourceURL:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  id *v26;
  BOOL v28;
  id v29;
  char v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  BOOL v34;
  id v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  _QWORD v52[4];
  BOOL v53;
  uint8_t buf[4];
  const __CFString *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v7 = a4;
  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathManager");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __149__PLSyndicationResourceDataStore__copyAndMarkAsLocallyAvailablePairedLivePhotoResourceForRequestedResource_requestedVideoComplement_sourceURL_error___block_invoke;
  v52[3] = &__block_descriptor_33_e28_B16__0__PLInternalResource_8l;
  v53 = v7;
  objc_msgSend(v11, "firstPersistedResourceMatching:", v52);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    LOBYTE(v49) = 0;
    v50 = 0;
    v51 = 0;
    -[PLSyndicationResourceDataStore _getDestinationURLAndFixLocalAvailabilityIfNeededForResource:fileIdentifier:isLocallyAvailable:error:](self, "_getDestinationURLAndFixLocalAvailabilityIfNeededForResource:fileIdentifier:isLocallyAvailable:error:", v12, &v51, &v49, &v50);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v51;
    v15 = v50;
    v16 = v15;
    v17 = v13 != 0;
    if (!v13)
    {
      PLSyndicationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "uuid");
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "singleLineDescription");
        v43 = v10;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v24;
        v56 = 2112;
        v57 = v25;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "[resource] unable to resolve destination url for asset %{public}@, resource: %@", buf, 0x16u);

        v10 = v43;
      }
      goto LABEL_16;
    }
    if ((_BYTE)v49)
    {
      PLSyndicationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = CFSTR("video complement");
        if (v7)
          v19 = CFSTR("image");
        *(_DWORD *)buf = 138543362;
        v55 = v19;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "[resource] paired %{public}@ resource is already locally available", buf, 0xCu);
      }
LABEL_16:

      goto LABEL_17;
    }
    v48 = v15;
    v49 = 0;
    v44 = v10;
    v28 = -[PLSyndicationResourceDataStore _copyAndMarkPurgeableItemAtURL:withPathManager:destFileIdentifier:inode:error:](self, "_copyAndMarkPurgeableItemAtURL:withPathManager:destFileIdentifier:inode:error:", v10, v46, v14, &v49, &v48);
    v29 = v48;

    if (!v28)
    {
      v42 = v29;
      PLSyndicationGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        if (v7)
          v38 = CFSTR("image");
        else
          v38 = CFSTR("video complement");
        objc_msgSend(v11, "uuid", v29);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v38;
        v56 = 2114;
        v57 = v39;
        _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "[resource] unable to copy paired %{public}@ url for asset: %{public}@", buf, 0x16u);

      }
      v17 = 0;
      v10 = v44;
      v26 = a6;
      v35 = v42;
LABEL_42:

      v16 = v35;
      if (!v26)
        goto LABEL_19;
      goto LABEL_18;
    }
    v47 = v29;
    v30 = objc_msgSend((id)objc_opt_class(), "_markSyndicationResourceAsLocallyAvailableWithURL:resource:inode:error:", v13, v12, v49, &v47);
    v31 = v47;

    PLSyndicationGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if ((v30 & 1) != 0)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v34 = !v7;
        v35 = v31;
        if (v34)
          v36 = CFSTR("video complement");
        else
          v36 = CFSTR("image");
        objc_msgSend(v11, "uuid");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v36;
        v56 = 2114;
        v57 = v37;
        _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "[resource] marked paired %{public}@ resource as locally available for asset: %{public}@", buf, 0x16u);

        v17 = 1;
        goto LABEL_41;
      }
      v17 = 1;
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v34 = !v7;
        v35 = v31;
        if (v34)
          v40 = CFSTR("video complement");
        else
          v40 = CFSTR("image");
        objc_msgSend(v11, "uuid");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v40;
        v56 = 2114;
        v57 = v41;
        _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "[resource] unable to mark paired %{public}@ resource as locally available for asset: %{public}@", buf, 0x16u);

        v17 = 0;
        goto LABEL_41;
      }
      v17 = 0;
    }
    v35 = v31;
LABEL_41:
    v10 = v44;
    v26 = a6;
    goto LABEL_42;
  }
  PLSyndicationGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = v10;
    if (v7)
      v22 = CFSTR("image");
    else
      v22 = CFSTR("video complement");
    objc_msgSend(v11, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v22;
    v10 = v21;
    v56 = 2114;
    v57 = v23;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "[resource] unable to find paired %{public}@ resource for live photo to copy for asset: %{public}@", buf, 0x16u);

  }
  v14 = 0;
  v13 = 0;
  v16 = 0;
  v17 = 0;
LABEL_17:
  v26 = a6;
  if (a6)
LABEL_18:
    *v26 = objc_retainAutorelease(v16);
LABEL_19:

  return v17;
}

- (id)_errorForUnderlyingError:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (id)*MEMORY[0x1E0D74600];
  if ((PLUnderlyingErrorIsSyndicationMessagesNeedsDownload(v3) & 1) == 0)
  {
    if (PLUnderlyingErrorIsSyndicationMessagesDownloadTimeout(v3))
      v5 = 9;
    else
      v5 = 4;
    if (v3)
      goto LABEL_3;
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v5 = 6;
  if (!v3)
    goto LABEL_8;
LABEL_3:
  v9 = *MEMORY[0x1E0CB3388];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)name
{
  return CFSTR("Syndication");
}

- (id)descriptionForSubtype:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = CFSTR("medium image derivative");
  v4 = CFSTR("original video complement");
  if ((_DWORD)a3 != 18)
    v4 = 0;
  if ((_DWORD)a3 != 4)
    v3 = v4;
  v5 = CFSTR("unknown");
  v6 = CFSTR("original resource");
  if ((_DWORD)a3 != 1)
    v6 = 0;
  if ((_DWORD)a3)
    v5 = v6;
  if ((int)a3 <= 3)
    return (id)v5;
  else
    return (id)v3;
}

- (id)keyFromKeyStruct:(const void *)a3
{
  return -[PLPrimaryResourceDataStoreKey initWithKeyStruct:]([PLPrimaryResourceDataStoreKey alloc], "initWithKeyStruct:", a3);
}

- (id)resourceDataForKey:(id)a3 assetID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99D50];
  -[PLSyndicationResourceDataStore resourceURLForKey:assetID:](self, "resourceURLForKey:assetID:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v7, "dataWithContentsOfURL:options:error:", v8, 2, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (!v9)
  {
    PLSyndicationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "[resource] failed to read data for resource with asset: %{public}@, error: %@", buf, 0x16u);

    }
  }

  return v9;
}

- (id)resourceURLForKey:(id)a3 assetID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationResourceDataStore.m"), 781, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  objc_msgSend(v7, "fileURLForAssetID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)expectedFileURLForResource:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PLSyndicationResourceDataStore *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "bundleScope") == 3)
  {
    v21 = objc_alloc(MEMORY[0x1E0D73278]);
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "bundleScope");
    objc_msgSend(v6, "uniformTypeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "version");
    v13 = objc_msgSend(v6, "resourceType");
    v20 = self;
    v14 = objc_msgSend(v6, "recipeID");
    objc_msgSend(v7, "originalFilename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v21, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v8, v9, v11, v12, v13, v14, v15);

    -[PLResourceDataStore pathManager](v20, "pathManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "readOnlyUrlWithIdentifier:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3, *(_QWORD *)&a4);
}

- (id)virtualResourcesForAsset:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canStoreExternalResource:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  int v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationResourceDataStore.m"), 823, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalResource"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationResourceDataStore.m"), 824, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

LABEL_3:
  objc_msgSend(v14, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v13, "uniformTypeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[PLResourceDataStore guessUTIForExternalResource:forAssetKind:](self, "guessUTIForExternalResource:forAssetKind:", v13, objc_msgSend(v14, "kind"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setUniformTypeIdentifier:", v18);

      PLImageManagerGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v13;
        v57 = 2114;
        v58 = v20;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "[RM] guessed UTI for external resource: %{public}@ for asset uuid: %{public}@", buf, 0x16u);

      }
    }
    if (objc_msgSend(v15, "assumeNoExistingResources"))
    {
      objc_msgSend(v14, "objectID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLInternalResource insertResourceForAssetObjectID:resourceIdentity:inManagedObjectContext:](PLInternalResource, "insertResourceForAssetObjectID:resourceIdentity:inManagedObjectContext:", v21, v13, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v14, "fetchOrCreateResourceWithIdentity:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v22, "isInserted"))
      objc_msgSend(v22, "ensureInitialValuesForSyndication");
    objc_msgSend(v13, "codecFourCharCode");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v13, "codecFourCharCode");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCodecFourCharCodeName:", v31);

    }
    objc_msgSend(v22, "setUnorientedWidth:", objc_msgSend(v13, "unorientedWidth"));
    objc_msgSend(v22, "setUnorientedHeight:", objc_msgSend(v13, "unorientedHeight"));
    objc_msgSend(v22, "setDataLength:", objc_msgSend(v13, "dataLength"));
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "BOOLForKey:", CFSTR("PADisablePhotosBlastDoorProcessing"));

    if ((v33 & 1) != 0 || objc_msgSend(v13, "version"))
      v34 = 1;
    else
      v34 = objc_msgSend(v13, "recipeID") & 1;
    objc_msgSend(v13, "fileURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v36 = 1;
    if (v35 && v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileURL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v37, "fileExistsAtPath:", v39);

      if (v40)
      {
        v28 = -[PLPrimaryResourceDataStoreKey initFromExistingLocationOfExternalResource:asset:]([PLPrimaryResourceDataStoreKey alloc], "initFromExistingLocationOfExternalResource:asset:", v13, v14);
        if (v28)
        {
          objc_msgSend(v22, "dataStoreKey");
          v41 = objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            v42 = (void *)v41;
            objc_msgSend(v22, "dataStoreKey");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v28, "isEqualToKey:", v43);

            if ((v44 & 1) == 0)
            {
              objc_msgSend(v22, "dataStoreKey");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "assetID");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "fileURLForAssetID:", v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "assetID");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "fileURLForAssetID:", v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(MEMORY[0x1E0D73208], "fileURL:isEqualToFileURL:", v47, v49) & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to overwrite syndication store resource with existing key: %@ with new key: %@), on resource: %@.  Store will orphan the previous key."), v47, v49, v22);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                PLSimulateCrash();

              }
            }
          }
          v36 = 0;
          goto LABEL_34;
        }
      }
      else
      {
        v28 = 0;
      }
      v36 = 1;
    }
LABEL_34:
    objc_msgSend(v28, "keyData");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDataStoreKeyData:", v51);

    if ((v36 & 1) != 0)
    {
      objc_msgSend(v22, "setSyndicationLocalAvailabilityWithAvailable:", 0);
      if (!a7)
        goto LABEL_39;
    }
    else
    {
      objc_msgSend(v22, "setSyndicationLocalAvailabilityWithAvailable:", 1);
      objc_msgSend(v22, "setLocalAvailabilityTarget:", 0);
      if (!a7)
      {
LABEL_39:
        v29 = v22 != 0;
        goto LABEL_40;
      }
    }
    *a7 = objc_retainAutorelease(v22);
    goto LABEL_39;
  }
  PLSyndicationGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v14, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v56 = v24;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "asset %{public}@ managed object context is nil, cannot complete storing external resource", buf, 0xCu);

  }
  v25 = (void *)MEMORY[0x1E0CB35C8];
  v26 = *MEMORY[0x1E0D74498];
  v59 = *MEMORY[0x1E0CB2938];
  v60[0] = CFSTR("asset managed object context is nil");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 47001, v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (a6)
  {
    v28 = objc_retainAutorelease(v27);
    v29 = 0;
    *a6 = v28;
  }
  else
  {
    v29 = 0;
  }
LABEL_40:

  return v29;
}

- (id)_requestLocalAvailabilityChangeForSyndicationOriginalResource:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  PLSyndicationResourceDataStore *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _BYTE *v55;
  BOOL v56;
  char v57;
  BOOL v58;
  id v59;
  id v60;
  char v61;
  _BYTE buf[24];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v43 = a4;
  v9 = a5;
  objc_msgSend(v8, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filename");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  objc_msgSend(v8, "objectID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v59 = 0;
  v60 = 0;
  -[PLSyndicationResourceDataStore _getDestinationURLAndFixLocalAvailabilityIfNeededForResource:fileIdentifier:isLocallyAvailable:error:](self, "_getDestinationURLAndFixLocalAvailabilityIfNeededForResource:fileIdentifier:isLocallyAvailable:error:", v8, &v60, &v61, &v59);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v60;
  v41 = v59;
  if (v13)
  {
    if (v61)
    {
      PLSyndicationGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v43, "taskIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2112;
        v63 = v13;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ original resource for asset %{public}@ is already local at url: %@", buf, 0x20u);

      }
      (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v13);
    }
    else
    {
      v24 = objc_msgSend(v10, "kind") == 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v63) = 0;
      LOBYTE(v63) = objc_msgSend(v10, "kindSubtype") == 2;
      v25 = objc_msgSend(v8, "resourceType") == 3;
      objc_msgSend(v10, "additionalAttributes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "syndicationIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "additionalAttributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "importedByBundleIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v27) = v25;
      objc_msgSend(v8, "photoLibrary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v24;
      v34 = PLSyndicationCSProvideOptionsFromRequestOptions(v43, v37);
      v33 = (void *)objc_opt_class();
      objc_msgSend(v10, "uniformTypeIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke;
      v44[3] = &unk_1E36714F8;
      v56 = v12;
      v31 = v28;
      v45 = v31;
      v46 = v10;
      v55 = buf;
      v47 = v43;
      v48 = self;
      v57 = (char)v27;
      v49 = v40;
      v50 = v38;
      v51 = v39;
      v52 = v13;
      v58 = v35;
      v53 = v42;
      v54 = v9;
      objc_msgSend(v33, "_provideFileURLAndUnwrapLivePhotoIfNeededForBundleID:syndicationIdentifier:typeIdentifier:isLivePhoto:options:completionHandler:", v37, v36, v29, v30, v34, v44);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    PLSyndicationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v43, "taskIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "singleLineDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 2112;
      v63 = v18;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "[resource] %{public}@ unable to resolve destination url for asset %{public}@, resource: %@", buf, 0x20u);

    }
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "singleLineDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Unable to resolve destination url for syndication asset: %@, resource: %@"), v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PLResourceDataStoreErrorCreate();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v23, 0, 0);

  }
  return 0;
}

- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PLPhotoLibraryBundle *v13;
  PLPhotoLibraryBundle *libraryBundle;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString **v26;
  uint64_t *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  __CFString *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  unsigned int v62;
  __CFString *v63;
  __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  unsigned int v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  _QWORD v111[4];
  id v112;
  id v113;
  id v114;
  PLSyndicationResourceDataStore *v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  char v121;
  uint64_t v122;
  const __CFString *v123;
  uint64_t v124;
  const __CFString *v125;
  uint64_t v126;
  const __CFString *v127;
  uint64_t v128;
  void *v129;
  uint8_t buf[4];
  void *v131;
  __int16 v132;
  void *v133;
  __int16 v134;
  __CFString *v135;
  uint64_t v136;
  _QWORD v137[4];

  v137[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (!v9)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0D74600];
    v136 = *MEMORY[0x1E0CB2938];
    v137[0] = CFSTR("nil resource");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, &v136, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 4, v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v11 + 2))(v11, v31, 0, 0);
LABEL_43:

    goto LABEL_60;
  }
  if (!self->_libraryBundle)
  {
    objc_msgSend(v9, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "libraryBundle");
    v13 = (PLPhotoLibraryBundle *)objc_claimAutoreleasedReturnValue();
    libraryBundle = self->_libraryBundle;
    self->_libraryBundle = v13;

  }
  objc_msgSend(v9, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniformTypeIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_5;
  v32 = objc_msgSend(v15, "kind");
  if (v32 - 2 < 2)
  {
    PLSyndicationGetLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "taskIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v15, "kind");
      if (v52 > 3)
        v53 = 0;
      else
        v53 = off_1E3663E10[(unsigned __int16)v52];
      v58 = v53;
      *(_DWORD *)buf = 138543874;
      v131 = v50;
      v132 = 2114;
      v133 = v51;
      v134 = 2114;
      v135 = v58;
      _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "[resource] %{public}@ asset (%{public}@) of type %{public}@ missing UTI, request will fail", buf, 0x20u);

    }
    goto LABEL_39;
  }
  if (v32 > 1)
  {
LABEL_39:
    v59 = (void *)MEMORY[0x1E0CB35C8];
    v60 = *MEMORY[0x1E0D74600];
    v128 = *MEMORY[0x1E0CB2938];
    v61 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "uuid");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v15, "kind");
    if (v62 > 3)
      v63 = 0;
    else
      v63 = off_1E3663E10[(unsigned __int16)v62];
    v64 = v63;
    objc_msgSend(v61, "stringWithFormat:", CFSTR("asset %@ missing UTI and invalid type %@"), v31, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = v65;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "errorWithDomain:code:userInfo:", v60, 4, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v11 + 2))(v11, v67, 0, 0);

    goto LABEL_43;
  }
  PLSyndicationGetLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v10, "taskIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v15, "kind");
    if (v36 > 3)
      v37 = 0;
    else
      v37 = off_1E3663E10[(unsigned __int16)v36];
    v57 = v37;
    *(_DWORD *)buf = 138543874;
    v131 = v34;
    v132 = 2114;
    v133 = v35;
    v134 = 2114;
    v135 = v57;
    _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "[resource] %{public}@ asset (%{public}@) of type %{public}@ missing UTI, request will attempt to continue", buf, 0x20u);

  }
LABEL_5:
  if (PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v15))
  {
    objc_msgSend(v15, "uniformTypeIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (void *)MEMORY[0x1E0CEC3F8];
      objc_msgSend(v15, "uniformTypeIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "typeWithIdentifier:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "conformsToType:", *MEMORY[0x1E0CEC5B8]);

      if (v22)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0D74600];
        v126 = *MEMORY[0x1E0CB2938];
        v127 = CFSTR("Unable to decode syndication RAW image");
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v127;
        v27 = &v126;
        goto LABEL_32;
      }
    }
  }
  if (objc_msgSend(v9, "dataStoreSubtype") != 1 && objc_msgSend(v9, "dataStoreSubtype") != 18)
  {
    v38 = objc_msgSend(v9, "dataStoreSubtype");
    PLSyndicationGetLog();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v38 == 4)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "taskIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uuid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v131 = v41;
        v132 = 2114;
        v133 = v42;
        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ on demand request for derivative image for asset: %{public}@", buf, 0x16u);

      }
      v121 = 0;
      v119 = 0;
      v120 = 0;
      -[PLSyndicationResourceDataStore _getDestinationURLAndFixLocalAvailabilityIfNeededForResource:fileIdentifier:isLocallyAvailable:error:](self, "_getDestinationURLAndFixLocalAvailabilityIfNeededForResource:fileIdentifier:isLocallyAvailable:error:", v9, &v120, &v121, &v119);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v120;
      v45 = v119;
      v46 = v45;
      if (v43)
      {
        if (v121)
        {
          PLSyndicationGetLog();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "taskIdentifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v131 = v48;
            v132 = 2112;
            v133 = v43;
            _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ resource is already local at url: %@", buf, 0x16u);

          }
          (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v43);
        }
        else
        {
          v107 = v44;
          objc_msgSend(v9, "asset");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "syndicationOriginalResource");
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          v105 = v78;
          if (v78)
          {
            v109 = v46;
            v110 = v43;
            objc_msgSend(v78, "objectID");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "photoLibrary");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "asset");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = objc_msgSend(v9, "resourceType");
            v80 = objc_msgSend(v9, "version");
            v81 = objc_msgSend(v9, "recipeID");
            objc_msgSend(v9, "uniformTypeIdentifier");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "identifier");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = 0;
            objc_msgSend(v79, "syndicationResourceURLForResourceType:version:recipeID:utiString:error:", v101, v80, v81, v83, &v118);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v118;

            v102 = v85;
            if (v84)
            {
              v111[0] = MEMORY[0x1E0C809B0];
              v111[1] = 3221225472;
              v111[2] = __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke;
              v111[3] = &unk_1E3671548;
              v112 = v10;
              v113 = v103;
              v114 = v104;
              v115 = self;
              v117 = v11;
              v116 = v84;
              v86 = v105;
              v87 = -[PLSyndicationResourceDataStore _requestLocalAvailabilityChangeForSyndicationOriginalResource:options:completion:](self, "_requestLocalAvailabilityChangeForSyndicationOriginalResource:options:completion:", v105, v112, v111);

              v88 = v112;
              v44 = v107;
              v89 = v84;
            }
            else
            {
              v89 = 0;
              v86 = v105;
              v88 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v88, "setObject:forKeyedSubscript:", CFSTR("missing destination url"), *MEMORY[0x1E0CB2938]);
              if (v85)
                objc_msgSend(v88, "setObject:forKeyedSubscript:", v85, *MEMORY[0x1E0CB3388]);
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74600], 4, v88);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *, _QWORD, _QWORD))v11 + 2))(v11, v99, 0, 0);

              v44 = v107;
            }
            v46 = v109;

            v43 = v110;
            v98 = v103;
            v97 = v104;
          }
          else
          {
            PLSyndicationGetLog();
            v90 = objc_claimAutoreleasedReturnValue();
            v44 = v107;
            if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v9, "asset");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "syndicationDescription");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v131 = v92;
              _os_log_impl(&dword_199541000, v90, OS_LOG_TYPE_FAULT, "Syndication asset %{public}@ missing original resource", buf, 0xCu);

              v44 = v107;
            }

            v93 = (void *)MEMORY[0x1E0CB35C8];
            v94 = *MEMORY[0x1E0D74600];
            v124 = *MEMORY[0x1E0CB2938];
            v125 = CFSTR("missing original resource");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
            v95 = objc_claimAutoreleasedReturnValue();
            v96 = v93;
            v97 = (void *)v95;
            objc_msgSend(v96, "errorWithDomain:code:userInfo:", v94, 4, v95);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *, _QWORD, _QWORD))v11 + 2))(v11, v98, 0, 0);
            v86 = 0;
          }

        }
      }
      else
      {
        v108 = v45;
        PLSyndicationGetLog();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "taskIdentifier");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uuid");
          v106 = v44;
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "singleLineDescription");
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v131 = v69;
          v132 = 2114;
          v133 = v70;
          v134 = 2112;
          v135 = v71;
          _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_ERROR, "[resource] %{public}@ unable to resolve destination url for asset %{public}@, resource: %@", buf, 0x20u);

          v44 = v106;
        }

        v72 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v15, "uuid");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "singleLineDescription");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "stringWithFormat:", CFSTR("Unable to resolve destination url for syndication asset: %@, resource: %@"), v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v108;
        PLResourceDataStoreErrorCreate();
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD, _QWORD))v11 + 2))(v11, v76, 0, 0);

        v43 = 0;
      }

      goto LABEL_59;
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "taskIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "singleLineDescription");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v131 = v54;
      v132 = 2112;
      v133 = v55;
      _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "[resource] %{public}@ resource (%@) unsupported by syndication data store", buf, 0x16u);

    }
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D74600];
    v122 = *MEMORY[0x1E0CB2938];
    v123 = CFSTR("resource unuspported by syndication data store");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v123;
    v27 = &v122;
LABEL_32:
    objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 4, v44);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v11 + 2))(v11, v56, 0, 0);

LABEL_59:
    goto LABEL_60;
  }
  v28 = -[PLSyndicationResourceDataStore _requestLocalAvailabilityChangeForSyndicationOriginalResource:options:completion:](self, "_requestLocalAvailabilityChangeForSyndicationOriginalResource:options:completion:", v9, v10, v11);
LABEL_60:

  return 0;
}

- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3
{
  return 1;
}

- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4
{
  return 0;
}

- (BOOL)canStreamResource:(id)a3
{
  return 0;
}

- (BOOL)canMarkAsynchronousLocalRenderAsOptionalForProgress:(id)a3
{
  return 0;
}

- (id)imageConversionClientForResourceGenerator:(id)a3
{
  id v4;
  PLSyndicationResourceDataStore *v5;
  PAImageConversionServiceClient *v6;
  PAImageConversionServiceClient *imageConversionServiceClient;
  PAImageConversionServiceClient *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_imageConversionServiceClient)
  {
    v6 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E0D47BE8]);
    imageConversionServiceClient = v5->_imageConversionServiceClient;
    v5->_imageConversionServiceClient = v6;

  }
  objc_sync_exit(v5);

  v8 = v5->_imageConversionServiceClient;
  return v8;
}

- (id)videoConversionClientForResourceGenerator:(id)a3
{
  id v4;
  PLSyndicationResourceDataStore *v5;
  PAVideoConversionServiceClient *v6;
  PAVideoConversionServiceClient *videoConversionServiceClient;
  PAVideoConversionServiceClient *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_videoConversionServiceClient)
  {
    v6 = (PAVideoConversionServiceClient *)objc_alloc_init(MEMORY[0x1E0D47C30]);
    videoConversionServiceClient = v5->_videoConversionServiceClient;
    v5->_videoConversionServiceClient = v6;

  }
  objc_sync_exit(v5);

  v8 = v5->_videoConversionServiceClient;
  return v8;
}

- (id)metadataForResourceGenerator:(id)a3 fromFileURL:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0D75140];
  v6 = a4;
  v7 = [v5 alloc];
  -[PLPhotoLibraryBundle timeZoneLookup](self->_libraryBundle, "timeZoneLookup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", v6, 0, 13, v8, 1, 1);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
}

void __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  PLSyndicationGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "taskIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ request for derivative image made original resource available, requesting sanitization", buf, 0xCu);

    }
    v10 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_126;
    v14[3] = &unk_1E3676D00;
    v15 = v10;
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v16 = v11;
    v17 = v12;
    v18 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 72);
    v19 = *(id *)(a1 + 64);
    objc_msgSend(v15, "performBlock:", v14);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "taskIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "[resource] %{public}@ unable to make original resource available, will fail request for derivative image, error: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_126(uint64_t a1)
{
  void *v2;
  void *v3;
  PLSyndicationSanitizedResourceGenerator *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[PLSyndicationSanitizedResourceGenerator initWithDelegate:]([PLSyndicationSanitizedResourceGenerator alloc], "initWithDelegate:", *(_QWORD *)(a1 + 48));
    PLSyndicationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 56), "taskIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "singleLineDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ attempting to generate sanitized derivatives from resource: %@", buf, 0x16u);

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_128;
    v15[3] = &unk_1E3671520;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 72);
    v18 = *(id *)(a1 + 64);
    -[PLSyndicationSanitizedResourceGenerator generateAndStoreDerivativeResourcesForSyndicationResource:completion:](v4, "generateAndStoreDerivativeResourcesForSyndicationResource:completion:", v3, v15);

    v8 = v16;
  }
  else
  {
    PLSyndicationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 56), "taskIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "[resource] %{public}@ unable to refetch original resource (%@)", buf, 0x16u);

    }
    v12 = *(_QWORD *)(a1 + 72);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D74600];
    v20 = *MEMORY[0x1E0CB2938];
    v21 = CFSTR("unable to referch original resource");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v4 = (PLSyndicationSanitizedResourceGenerator *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 4, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v12 + 16))(v12, v8, 0, 0);
  }

}

void __96__PLSyndicationResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_128(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void (*v17)(void);
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v7;
  }
  v11 = v10;

  if (objc_msgSend(v11, "hasChanges"))
  {
    v20 = 0;
    v12 = objc_msgSend(v11, "save:", &v20);
    v13 = v20;
    v14 = v13;
    if ((v12 & 1) == 0)
    {
      if (!v8)
        v8 = v13;
      PLSyndicationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "taskIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "[resource] %{public}@ failed to save changes with error %@", buf, 0x16u);

      }
    }

  }
  if (a2)
  {
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    PLSyndicationGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "taskIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "[resource] %{public}@ failed to generate derivatives with error: %@", buf, 0x16u);

    }
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v17();

}

void __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  char v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  id obj;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  id *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v55 = 0;
  v56 = (id *)&v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__77216;
  v59 = __Block_byref_object_dispose__77217;
  v9 = a4;
  v60 = v9;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 1;
  if (v7)
  {
    if (*(_BYTE *)(a1 + 120))
    {
      v10 = *(void **)(a1 + 32);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke_2;
      v48[3] = &unk_1E3677C18;
      v49 = v7;
      v50 = *(id *)(a1 + 40);
      objc_msgSend(v10, "performTransactionAndWait:", v48);

    }
    if (v8)
      goto LABEL_13;
  }
  else
  {
    PLSyndicationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "taskIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v56[5];
      *(_DWORD *)buf = 138543618;
      v62 = v12;
      v63 = 2112;
      v64 = v13;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "[resource] %{public}@ did not receive file url from provider, error: %@", buf, 0x16u);

    }
    *((_BYTE *)v52 + 24) = 0;
    if (v8)
      goto LABEL_13;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
  {
    PLSyndicationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "taskIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v56[5];
      *(_DWORD *)buf = 138543618;
      v62 = v15;
      v63 = 2112;
      v64 = v16;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "[resource] %{public}@ did not receive video complement file url from provider, error: %@", buf, 0x16u);

    }
    *((_BYTE *)v52 + 24) = 0;
    v47 = 0;
    goto LABEL_24;
  }
LABEL_13:
  v17 = *((unsigned __int8 *)v52 + 24);
  v47 = 0;
  if (!v17)
  {
LABEL_24:
    v29 = *(_QWORD *)(a1 + 104);
    objc_msgSend(*(id *)(a1 + 56), "_errorForUnderlyingError:", v56[5]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v29 + 16))(v29, v30, 0, 0);

    goto LABEL_25;
  }
  PLSyndicationGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "taskIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v62 = v19;
    v63 = 2112;
    v64 = v7;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ received file url from spotlight provider: %@", buf, 0x16u);

  }
  if (*(_BYTE *)(a1 + 121))
    v20 = v8;
  else
    v20 = v7;
  v21 = *(void **)(a1 + 56);
  v22 = *(_QWORD *)(a1 + 64);
  v23 = *(_QWORD *)(a1 + 72);
  v24 = v56;
  obj = v56[5];
  v25 = objc_msgSend(v21, "_copyAndMarkPurgeableItemAtURL:withPathManager:destFileIdentifier:inode:error:", v20, v22, v23, &v47, &obj);
  objc_storeStrong(v24 + 5, obj);
  if ((v25 & 1) == 0)
  {
    *((_BYTE *)v52 + 24) = 0;
    goto LABEL_24;
  }
  if (!*((_BYTE *)v52 + 24))
    goto LABEL_24;
  v26 = *(void **)(a1 + 32);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke_117;
  v31[3] = &unk_1E36714D0;
  v32 = v26;
  v27 = *(id *)(a1 + 80);
  v40 = &v55;
  v28 = *(_QWORD *)(a1 + 56);
  v33 = v27;
  v34 = v28;
  v35 = *(id *)(a1 + 88);
  v41 = &v51;
  v44 = *(_BYTE *)(a1 + 122);
  v42 = *(_QWORD *)(a1 + 112);
  v43 = v47;
  v36 = v8;
  v37 = *(id *)(a1 + 48);
  v38 = *(id *)(a1 + 96);
  v45 = *(_BYTE *)(a1 + 121);
  v39 = v7;
  objc_msgSend(v32, "performTransactionAndWait:", v31);

  if (!*((_BYTE *)v52 + 24))
    goto LABEL_24;
  (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
LABEL_25:
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

}

void __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLSyndicationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543618;
    v6 = v4;
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] setting filename and directory for asset: %{public}@ with original filename: %@", (uint8_t *)&v5, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "setSyndicationFilenameAndDirectoryWithOriginalFilename:", v2);

}

void __115__PLSyndicationResourceDataStore__requestLocalAvailabilityChangeForSyndicationOriginalResource_options_completion___block_invoke_117(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!v5
    || (v6 = (void *)objc_opt_class(),
        v7 = *(_QWORD *)(a1 + 56),
        v8 = *(_QWORD *)(a1 + 120),
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8),
        v30 = *(id *)(v9 + 40),
        v10 = objc_msgSend(v6, "_markSyndicationResourceAsLocallyAvailableWithURL:resource:inode:error:", v7, v5, v8, &v30), objc_storeStrong((id *)(v9 + 40), v30), (v10 & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(a1 + 128))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
    {
      v11 = *(void **)(a1 + 64);
      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0CEC3F8];
        objc_msgSend(v11, "pathExtension");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "typeWithFilenameExtension:conformingToType:", v13, *MEMORY[0x1E0CEC568]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 && (objc_msgSend(v14, "isDynamic") & 1) == 0)
        {
          objc_msgSend(v5, "asset");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "becomeSyndicationLivePhotoWithVideoComplementContentType:", v14);

          PLSyndicationGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          v15 = v27;
          if (v26)
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 72), "taskIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v33 = v28;
              _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ received video complement URL, promoted photo to live photo", buf, 0xCu);

            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
            goto LABEL_13;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v29 = *(void **)(a1 + 80);
            objc_msgSend(v14, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v33 = v29;
            v34 = 2114;
            v35 = v16;
            v18 = "[resource] failed to promote asset to live photo: %{public}@, content type: %{public}@";
            goto LABEL_11;
          }
        }
        else
        {
          PLSyndicationGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 64), "pathExtension");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = *(void **)(a1 + 80);
            *(_DWORD *)buf = 138543618;
            v33 = v16;
            v34 = 2114;
            v35 = v17;
            v18 = "[resource] ignoring video complement with unexpected uti for file extension: %{public}@, asset: %{public}@";
LABEL_11:
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);

          }
        }

LABEL_13:
      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
  {
    PLSyndicationGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 72), "taskIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v20;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "[resource] %{public}@ attempting to make live photo paired resource locally available as well", buf, 0xCu);

    }
    v21 = objc_msgSend(*(id *)(a1 + 48), "_copyAndMarkAsLocallyAvailablePairedLivePhotoResourceForRequestedResource:requestedVideoComplement:sourceURL:error:", v5);
    v22 = 0;
    if ((v21 & 1) == 0)
    {
      PLSyndicationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 72), "taskIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v24;
        v34 = 2112;
        v35 = v22;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "[resource] %{public}@ failed to make paired live photo resource available with error: %@", buf, 0x16u);

      }
    }

  }
}

BOOL __149__PLSyndicationResourceDataStore__copyAndMarkAsLocallyAvailablePairedLivePhotoResourceForRequestedResource_requestedVideoComplement_sourceURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 v5;

  v3 = a2;
  LODWORD(a1) = *(unsigned __int8 *)(a1 + 32);
  v4 = objc_msgSend(v3, "resourceType");
  if ((_DWORD)a1)
  {
    if (v4)
      goto LABEL_6;
  }
  else if (v4 != 3)
  {
    goto LABEL_6;
  }
  if (!objc_msgSend(v3, "recipeID"))
  {
    v5 = objc_msgSend(v3, "version") == 0;
    goto LABEL_7;
  }
LABEL_6:
  v5 = 0;
LABEL_7:

  return v5;
}

void __112__PLSyndicationResourceDataStore__copyAndMarkPurgeableItemAtURL_withPathManager_destFileIdentifier_inode_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = a1[4];
    v22 = 0;
    v8 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v7, v5, &v22);
    v9 = v22;
    if ((v8 & 1) == 0)
    {
      v18 = PLIsErrorOrUnderlyingErrorFileExists();
      PLSyndicationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v10 = v19;
      if (!v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v5;
          v25 = 2112;
          v26 = v9;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "[resource] error copying file to url: %@, error: %@", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
        v20 = *(_QWORD *)(a1[7] + 8);
        v21 = v9;
        v10 = *(NSObject **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v21;
        goto LABEL_16;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        v11 = "[resource] file already exists at url: %@";
        v12 = v10;
        v13 = OS_LOG_TYPE_INFO;
        goto LABEL_12;
      }
LABEL_16:

      goto LABEL_17;
    }
    if (!+[PLCacheDeleteSupport markPurgeableForFileAtURL:withUrgency:outInode:](PLCacheDeleteSupport, "markPurgeableForFileAtURL:withUrgency:outInode:", v5, 0, *(_QWORD *)(a1[8] + 8) + 24))
    {
      PLSyndicationGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        v11 = "[resource] failed to mark file purgeable at url: %@";
        v12 = v10;
        v13 = OS_LOG_TYPE_ERROR;
LABEL_12:
        _os_log_impl(&dword_199541000, v12, v13, v11, buf, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else
  {
    PLSyndicationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)a1[5];
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "[resource] unable to obtain access to file identifier: %{public}@ error: %@", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    v16 = *(_QWORD *)(a1[7] + 8);
    v17 = v6;
    v9 = *(id *)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v17;
  }
LABEL_17:

}

void __135__PLSyndicationResourceDataStore__getDestinationURLAndFixLocalAvailabilityIfNeededForResource_fileIdentifier_isLocallyAvailable_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v9, &v14);

    if (v14)
    {
      PLSyndicationGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = a1[4];
        *(_DWORD *)buf = 138543362;
        v16 = v11;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "[resource] file identifier points to a directory: %{public}@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    }
  }
  else
  {
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = a1[4];
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "[resource] unable to obtain access to file identifier: %{public}@ error: %@", buf, 0x16u);
    }

  }
}

@end

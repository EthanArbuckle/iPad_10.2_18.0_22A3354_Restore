@implementation PLSpotlightMemoryTranslator

+ (id)spotlightSearchableItemFromMemory:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v26;
  uint8_t buf[4];
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightMemoryTranslator.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("memory"));

  }
  if ((objc_msgSend(v5, "isEligibleForSearchIndexing") & 1) == 0)
  {
    PLSearchBackendModelTranslationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_13:
      v22 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v5, "uuid");
    v23 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v23;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Unsupported Memory. Not indexing Memory: %@", buf, 0xCu);
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v5, "keyAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject length](v7, "length"))
  {
    PLSearchBackendModelTranslationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "uuid");
      v24 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v24;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "No assets found for Memory. Not indexing Memory: %@", buf, 0xCu);

    }
    goto LABEL_12;
  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setPhotosResultType:", CFSTR("com.apple.photos.search.result.collection.memory"));
  objc_msgSend(v5, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E36789C0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPhotosTitle:", v10);

  objc_msgSend(v8, "photosTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(v5, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photosTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightTranslatorUtilities tagCSSearchableItem:entityInstanceIdentifier:typeIdentifier:typeDisplayName:displayTitle:displaySubtitle:](PLSpotlightTranslatorUtilities, "tagCSSearchableItem:entityInstanceIdentifier:typeIdentifier:typeDisplayName:displayTitle:displaySubtitle:", v8, v13, CFSTR("MemoryEntity"), v14, v15, v16);

  }
  objc_msgSend(v5, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "libraryServicesManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", objc_msgSend(v18, "wellKnownPhotoLibraryIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(MEMORY[0x1E0CA6B48]);
  objc_msgSend(v5, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v21, v19, v8);

LABEL_14:
  return v22;
}

@end

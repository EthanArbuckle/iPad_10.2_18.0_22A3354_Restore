@implementation PLSpotlightHighlightTranslator

+ (id)spotlightSearchableItemFromHighlight:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightHighlightTranslator.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("highlight"));

  }
  if ((objc_msgSend(v5, "isEligibleForSearchIndexing") & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPhotosTitle:", v7);

    objc_msgSend(v6, "setPhotosResultType:", CFSTR("com.apple.photos.search.result.collection.highlight"));
    objc_msgSend(v5, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", objc_msgSend(v9, "wellKnownPhotoLibraryIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CA6B48]);
    objc_msgSend(v5, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v12, v10, v6);

  }
  else
  {
    PLSearchBackendModelTranslationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Unsupported Highlight. Not indexing Highlight: %@", buf, 0xCu);

    }
    v13 = 0;
  }

  return v13;
}

@end

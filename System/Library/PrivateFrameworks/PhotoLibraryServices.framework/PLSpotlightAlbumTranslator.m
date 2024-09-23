@implementation PLSpotlightAlbumTranslator

+ (id)spotlightSearchableItemFromAlbum:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAlbumTranslator.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("album"));

  }
  objc_msgSend(a1, "_keyAssetUUIDForAlbum:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v5, "localizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "setPhotosTitle:", v8);
    }
    else
    {
      objc_msgSend(v5, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPhotosTitle:", v12);

    }
    objc_msgSend(v7, "setPhotosResultType:", CFSTR("com.apple.photos.search.result.collection.album"));
    objc_msgSend(v7, "photosTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
      goto LABEL_16;
    if (objc_msgSend(v5, "kindValue") == 2)
    {
      objc_msgSend(v5, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photosTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("AlbumEntity");
    }
    else
    {
      if (objc_msgSend(v5, "kindValue") != 1505)
      {
LABEL_16:
        objc_msgSend(v5, "photoLibrary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "libraryServicesManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", objc_msgSend(v20, "wellKnownPhotoLibraryIdentifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_alloc(MEMORY[0x1E0CA6B48]);
        objc_msgSend(v5, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v22, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v23, v21, v7);

        goto LABEL_17;
      }
      objc_msgSend(v5, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photosTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("SharedAlbumEntity");
    }
    +[PLSpotlightTranslatorUtilities tagCSSearchableItem:entityInstanceIdentifier:typeIdentifier:typeDisplayName:displayTitle:displaySubtitle:](PLSpotlightTranslatorUtilities, "tagCSSearchableItem:entityInstanceIdentifier:typeIdentifier:typeDisplayName:displayTitle:displaySubtitle:", v7, v15, v18, v16, v17, 0);

    goto LABEL_16;
  }
  PLSearchBackendModelTranslationGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v10;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "No assets found for Album. Not translating Album: %@", buf, 0xCu);

  }
  v11 = 0;
LABEL_17:

  return v11;
}

+ (id)_keyAssetUUIDForAlbum:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "keyAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v3, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

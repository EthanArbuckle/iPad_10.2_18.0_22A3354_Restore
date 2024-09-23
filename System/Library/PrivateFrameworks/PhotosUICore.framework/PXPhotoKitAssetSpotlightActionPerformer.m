@implementation PXPhotoKitAssetSpotlightActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3
{
  return 1;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  _BYTE buf[24];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a5, "selectionManager", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = objc_msgSend(v7, "identifier");
  *(_QWORD *)&buf[8] = 0;
  *(_QWORD *)&buf[16] = 0;
  v39 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v7, "objectAtIndexPath:", buf);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[PXPhotoKitAssetSpotlightActionPerformer _owningAppBundleIdentifierForAsset:](PXPhotoKitAssetSpotlightActionPerformer, "_owningAppBundleIdentifierForAsset:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    +[PXPhotoKitAssetSpotlightActionPerformer _appIconForBundleIdentifier:](PXPhotoKitAssetSpotlightActionPerformer, "_appIconForBundleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject setImage:forState:](v11, "setImage:forState:", v10, 0);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v11);
      PXLocalizedStringFromTable(CFSTR("PXSpotlightPhotosIconAXDescription"), CFSTR("PhotosUICore"));
      v33 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccessibilityLabel:", v13);

      -[NSObject setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[NSObject centerXAnchor](v11, "centerXAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "customView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "centerXAnchor");
      v35 = v5;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v16);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject centerYAnchor](v11, "centerYAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "customView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "centerYAnchor");
      v34 = v6;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      -[NSObject widthAnchor](v11, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToConstant:", 32.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject heightAnchor](v11, "heightAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToConstant:", 32.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0CB3718];
      v37[0] = v36;
      v37[1] = v20;
      v26 = v7;
      v27 = v8;
      v28 = v9;
      v29 = (void *)v20;
      v37[2] = v22;
      v37[3] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v25;
      v5 = v35;
      objc_msgSend(v31, "activateConstraints:", v30);

      v6 = v34;
      v10 = v33;

      v9 = v28;
      v8 = v27;
      v7 = v26;
    }
    else
    {
      PLUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "PXPhotoKitAssetSpotlightActionPerformer: Unable to create 'open in app' button for Spotlight 1Up display without app icon image for asset: %@ with bundle identifier %@", buf, 0x16u);
      }
      v12 = 0;
    }

  }
  else
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v39 = (uint64_t)v5;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "PXPhotoKitAssetSpotlightActionPerformer: Unable to locate asset in datasource: %@ with selection snapshot: %@, selection manager: %@ for Spotlight 'open in app' 1Up action", buf, 0x20u);
    }
    v12 = 0;
  }

  return v12;
}

+ (id)_bundleIdentifierForAsset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier");

  if (v5 == 3)
  {
    objc_msgSend(v3, "curationProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "importedByBundleIdentifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      PLUIGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412546;
        v11 = v3;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "PXPhotoKitAssetSpotlightActionPerformer: Could not locate bundle identifier for syndicated asset: %@ in the asset curation properties: %@", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  else
  {
    v7 = CFSTR("com.apple.mobileslideshow");
  }

  return v7;
}

+ (id)_owningAppBundleIdentifierForAsset:(id)a3
{
  void *v3;
  __CFString *v4;
  void *v5;
  int v6;

  objc_msgSend(a1, "_bundleIdentifierForAsset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
    PLSyndicationAllEquivalentFileProviderLocalAndCloudBundleIDs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {

      v4 = CFSTR("com.apple.DocumentsApp");
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_appIconForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CGImage *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 32.0, 32.0, 3.0);
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareImagesForImageDescriptors:", v6);

  objc_msgSend(v4, "imageForDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "placeholder") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("appstore.app"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (CGImage *)objc_msgSend(v8, "CGImage");

  }
  else
  {
    v9 = (CGImage *)objc_msgSend(v7, "CGImage");
  }
  CGImageRetain(v9);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "PXPhotoKitAssetSpotlightActionPerformer: Unable to retrieve app icon for app with bundle identifier: %@ for Spotlight 1Up", (uint8_t *)&v13, 0xCu);
    }

    v10 = 0;
  }
  CGImageRelease(v9);

  return v10;
}

@end

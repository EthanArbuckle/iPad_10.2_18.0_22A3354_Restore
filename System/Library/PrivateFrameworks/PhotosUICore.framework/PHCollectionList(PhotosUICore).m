@implementation PHCollectionList(PhotosUICore)

- (id)px_localizedTitle
{
  BOOL v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;

  v2 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  if (!objc_msgSend(a1, "px_isTopLevelFolder"))
  {
    if (!objc_msgSend(a1, "px_isProjectsFolder"))
    {
      objc_msgSend(a1, "localizedTitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    v3 = CFSTR("PXCollectionProjectsTitle");
    if (v2)
      goto LABEL_6;
LABEL_8:
    v4 = CFSTR("PhotosUICore");
    goto LABEL_9;
  }
  if (!v2)
  {
    v3 = CFSTR("PXMyAlbumsOutlineTitle");
    goto LABEL_8;
  }
  v3 = CFSTR("PXCollectionAlbumsTitle");
LABEL_6:
  v4 = CFSTR("LemonadeLocalizable");
LABEL_9:
  PXLocalizedStringFromTable(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (const)px_navigationURLHost
{
  return CFSTR("folder");
}

- (__CFString)px_navigationWellKnownName
{
  __CFString **v2;
  __CFString *v3;

  if ((objc_msgSend(a1, "px_isMediaTypesFolder") & 1) != 0)
  {
    v2 = PXProgrammaticNavigationWellKnownNameMediaTypes;
  }
  else if ((objc_msgSend(a1, "px_isSharedAlbumsAndActivityFolder") & 1) != 0)
  {
    v2 = PXProgrammaticNavigationWellKnownNameSharedAlbums;
  }
  else
  {
    if (!objc_msgSend(a1, "px_isTopLevelFolder"))
    {
      v3 = 0;
      return v3;
    }
    v2 = &PXProgrammaticNavigationWellKnownNameMyAlbums;
  }
  v3 = *v2;
  return v3;
}

- (BOOL)px_fetchIsEmptyWithOptions:()PhotosUICore
{
  void *v4;
  void *v5;
  _BOOL8 v6;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 0;

  return v6;
}

- (uint64_t)px_isSharedAlbumsFolder
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXSharedAlbumsVirtualCollection"));

  return v2;
}

- (uint64_t)px_isSharedAlbumsAndActivityFolder
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXSharedAlbumsAndActivityVirtualCollection"));

  return v2;
}

- (uint64_t)px_isMediaTypesFolder
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXMediaTypesVirtualCollection"));

  return v2;
}

- (uint64_t)px_isUtilitiesFolder
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXTransientCollectionIdentifierUtilities"));

  return v2;
}

- (BOOL)px_isProjectsFolder
{
  return objc_msgSend(a1, "collectionListType") == 2 && objc_msgSend(a1, "collectionListSubtype") == 1000000300;
}

- (uint64_t)px_isContentSyndicationFolder
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXContentSyndicationVirtualCollection"));

  return v2;
}

- (uint64_t)px_isAllMacSyncedAlbumsFolder
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXMacSyncedAlbumsVirtualCollection"));

  return v2;
}

- (uint64_t)px_isTripsVirtualCollection
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXTransientCollectionIdentifierTrips"));

  return v2;
}

- (uint64_t)px_isFeaturedPhotosCollection
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXFeaturedPhotosVirtualCollection"));

  return v2;
}

- (uint64_t)px_isWallpaperSuggestionsVirtualCollection
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXTransientCollectionIdentifierWallpaperSuggestions"));

  return v2;
}

- (uint64_t)px_isBookmarksVirtualCollection
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "transientIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PXTransientCollectionIdentifierBookmarks"));

  return v2;
}

- (uint64_t)px_isContainedInCollectionList:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a1, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIncludeRootFolder:", 1);
  v7 = a1;
  do
  {
    v8 = objc_msgSend(v7, "isEqual:", v4);
    if ((v8 & 1) != 0)
      break;
    objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionListsContainingCollection:options:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  while (v10);

  return v8;
}

- (uint64_t)px_isTransientCollectionWithIdentifier:()PhotosUICore
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "isTransient"))
  {
    objc_msgSend(a1, "transientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)px_transientIdentifierForWellKnownFolderName:()PhotosUICore
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = px_transientIdentifierForWellKnownFolderName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&px_transientIdentifierForWellKnownFolderName__onceToken, &__block_literal_global_523);
  objc_msgSend((id)px_transientIdentifierForWellKnownFolderName__transientIdentifiers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_otherAlbumsCollectionListWithDeletedCollection:()PhotosUICore withHiddenCollection:withDuplicatesCollection:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CD14E0], "_otherAlbumAssetCollectionsIncludingRecentlyDeleted:includeHidden:includeDuplicates:includingSharedLibrary:includingDebugAlbums:", a3, a4, a5, a3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXNavigationListGadgetOtherAlbumsTitle"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD14E0], "transientCollectionListWithCollections:title:identifier:photoLibrary:", v5, v6, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_isValidGazeRectPredicate
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0CB3880];
  DCIM_NSStringFromCGRect();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  DCIM_NSStringFromCGRect();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DCIM_NSStringFromCGRect();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "predicateWithFormat:", CFSTR("%K != %@ && %K != %@ && %K != %@"), CFSTR("gazeRectString"), v1, CFSTR("gazeRectString"), v2, CFSTR("gazeRectString"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_otherAlbumAssetCollectionsIncludingRecentlyDeleted:()PhotosUICore includeHidden:includeDuplicates:includingSharedLibrary:includingDebugAlbums:
{
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int v102;
  int v103;
  int v104;
  int v105;
  void *v107;
  void *v108;
  uint8_t buf[4];
  void *v110;
  void *v111;
  _QWORD v112[3];
  void *v113;
  void *v114;
  void *v115;
  _QWORD v116[3];

  v116[1] = *MEMORY[0x1E0C80C00];
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7 && PFOSVariantHasInternalUI())
  {
    v104 = a4;
    +[PXAlbumsDebugUISettings sharedInstance](PXAlbumsDebugUISettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "showUtilitiesDebugAlbum");

    if (v15)
    {
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(curationScore == 0.25)"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setInternalPredicate:", v17);

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 1);
      v19 = a3;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSortDescriptors:", v20);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v21, CFSTR("Internal - Utilities"), CFSTR("PXDebugAlbum"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v22);

      a3 = v19;
    }
    +[PXAlbumsDebugUISettings sharedInstance](PXAlbumsDebugUISettings, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "showBestKeyFrameDebugAlbum");

    if (v24)
    {
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(playbackStyle == %d AND videoKeyFrameTimeScale != %d AND mediaAnalysisAttributes.mediaAnalysisVersion >= %llu)"), 3, *(unsigned int *)(MEMORY[0x1E0CA2E18] + 8), 28);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setInternalPredicate:", v26);

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
      v28 = a3;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSortDescriptors:", v29);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v30, CFSTR("Internal - Best Key Frame"), CFSTR("PXDebugAlbum"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v31);

      a3 = v28;
    }
    +[PXAlbumsDebugUISettings sharedInstance](PXAlbumsDebugUISettings, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "showDreamyDebugAlbum");

    if (v33)
    {
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setIncludeAssetSourceTypes:", 16);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
      v36 = a3;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setSortDescriptors:", v37);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v38, CFSTR("Internal - Dreamy"), CFSTR("PXDebugAlbum"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v39);

      a3 = v36;
    }
    +[PXAlbumsDebugUISettings sharedInstance](PXAlbumsDebugUISettings, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "showGazeDebugAlbum");

    v102 = a3;
    if (v41)
    {
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setWantsIncrementalChangeDetails:", 0);
      objc_msgSend(v42, "setIncludeTorsoAndFaceDetectionData:", 1);
      objc_msgSend(v42, "setIncludedDetectionTypes:", &unk_1E53EA9B0);
      objc_msgSend(a1, "_isValidGazeRectPredicate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setInternalPredicate:", v43);

      objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesWithOptions:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setSortDescriptors:", v47);

      v48 = *MEMORY[0x1E0CD1A50];
      v112[0] = *MEMORY[0x1E0CD19F0];
      v112[1] = v48;
      v112[2] = *MEMORY[0x1E0CD1978];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 3);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setFetchPropertySets:", v49);

      v50 = (void *)MEMORY[0x1E0CD1390];
      objc_msgSend(v44, "fetchedObjects");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "fetchAssetsForFaces:options:", v51, v45);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v52, CFSTR("Internal - Has Gaze"), CFSTR("PXDebugAlbum"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v53);

      a3 = v102;
    }
    +[PXAlbumsDebugUISettings sharedInstance](PXAlbumsDebugUISettings, "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "showCustomDebugAlbum");

    a4 = v104;
    if (v55)
    {
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXAlbumsDebugUISettings sharedInstance](PXAlbumsDebugUISettings, "sharedInstance");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "customDebugInternalPredicate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "length");

      if (v59)
      {
        v60 = (void *)MEMORY[0x1E0CB3880];
        +[PXAlbumsDebugUISettings sharedInstance](PXAlbumsDebugUISettings, "sharedInstance");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "customDebugInternalPredicate");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "predicateWithFormat:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setInternalPredicate:", v63);
      }
      else
      {
        +[PXAlbumsDebugUISettings sharedInstance](PXAlbumsDebugUISettings, "sharedInstance");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "customDebugPredicate");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "length");

        if (!v66)
        {
LABEL_17:
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = v68;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setSortDescriptors:", v69);

          objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v56);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = (void *)MEMORY[0x1E0CB3940];
          +[PXAlbumsDebugUISettings sharedInstance](PXAlbumsDebugUISettings, "sharedInstance");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "customDebugAlbumTitle");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "stringWithFormat:", CFSTR("Internal - %@"), v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v70, v74, CFSTR("PXDebugAlbum"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v75);

          a3 = v102;
          a4 = v104;
          goto LABEL_18;
        }
        v67 = (void *)MEMORY[0x1E0CB3880];
        +[PXAlbumsDebugUISettings sharedInstance](PXAlbumsDebugUISettings, "sharedInstance");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "customDebugPredicate");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "predicateWithFormat:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setPredicate:", v63);
      }

      goto LABEL_17;
    }
  }
LABEL_18:
  if (!a6)
    goto LABEL_28;
  +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v77, "canShowInternalUI"))
    goto LABEL_26;
  v78 = objc_msgSend(v76, "showDebugAlbums");

  if (v78)
  {
    v105 = a4;
    v79 = (void *)MEMORY[0x1E0CD15E0];
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "fetchActiveLibraryScopeWithOptions:", v80);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v77, "firstObject");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    PLUserSmartAlbumGetLog();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v81, "localIdentifier");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v110 = v83;
      _os_log_impl(&dword_1A6789000, v82, OS_LOG_TYPE_DEFAULT, "Suggestions by Photos ablum uses library scope: %@", buf, 0xCu);

    }
    if (v81)
    {
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v103 = a3;
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v85;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setSortDescriptors:", v86);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("libraryScopeShareState"), 8388612);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setInternalPredicate:", v87);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v84);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v88, CFSTR("Internal Only - Added by user in Camera"), CFSTR("PXSharedLibraryAddedByUserInCameraDebugAlbum"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v89);

      objc_msgSend(v13, "librarySpecificFetchOptions");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = v91;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setSortDescriptors:", v92);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("libraryScopeShareState"), 8388616);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setInternalPredicate:", v93);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v90);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v94, CFSTR("Internal Only - Suggestions by Camera"), CFSTR("PXSharedLibrarySuggestedByCameraDebugAlbum"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v95);

      a3 = v103;
    }

    a4 = v105;
LABEL_26:

  }
LABEL_28:
  objc_msgSend(v13, "px_virtualCollections");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "importHistoryCollection");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObject:", v97);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "px_otherAlbumsSubtypes");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v98 = &unk_1E53EA9C8;
  }
  else
  {
    v98 = 0;
  }
  if ((a5 & 1) == 0)
  {
    v99 = (void *)objc_msgSend(v98, "mutableCopy");
    objc_msgSend(v99, "removeObject:", &unk_1E53EEFD0);

    v98 = v99;
  }
  if (objc_msgSend(v98, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "px_fetchAssetCollectionsWithAlbumSubtypes:photoLibrary:", v98, v13);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v100);

  }
  return v12;
}

+ (id)px_otherAlbumsCollectionListIncludeDeleted:()PhotosUICore includeHidden:includeDuplicates:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__onceToken != -1)
    dispatch_once(&px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__onceToken, &__block_literal_global_575_229178);
  v8 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithObjects:", v12);

  objc_msgSend((id)px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__otherAlbumsCollectionDictionary, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend((id)objc_opt_class(), "_otherAlbumsCollectionListWithDeletedCollection:withHiddenCollection:withDuplicatesCollection:", a3, a4, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__otherAlbumsCollectionDictionary, "setObject:forKeyedSubscript:", v14, v13);
  }

  return v14;
}

@end

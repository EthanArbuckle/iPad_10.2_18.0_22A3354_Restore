@implementation PHMemoryChangeRequest(PhotosUICore)

+ (uint64_t)px_creationRequestForAssetCollection:()PhotosUICore
{
  return objc_msgSend(MEMORY[0x1E0CD1640], "px_creationRequestForAssetCollection:displayTitleInfo:people:", a3, 0, 0);
}

+ (uint64_t)px_creationRequestForAssetCollection:()PhotosUICore displayTitleInfo:people:
{
  return objc_msgSend(MEMORY[0x1E0CD1640], "px_creationRequestForAssetCollection:displayTitleInfo:people:ignoreCuration:", a3, 0, a5, 0);
}

+ (id)px_creationRequestForAssetCollection:()PhotosUICore displayTitleInfo:people:ignoreCuration:
{
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  void (**v26)(_QWORD);
  __CFString *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  uint64_t v31;
  __CFString *v32;
  __CFString *v33;
  unint64_t v34;
  __CFString *v35;
  NSObject *v36;
  __CFString *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  __CFString *v54;
  NSObject *log;
  void *v56;
  __CFString *v57;
  __CFString *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __CFString *v67;
  void *v68;
  id v69;
  id v70;
  _QWORD aBlock[4];
  __CFString *v72;
  id v73;
  _QWORD *v74;
  _QWORD v75[5];
  id v76;
  uint8_t buf[4];
  __CFString *v78;
  __int16 v79;
  __CFString *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  __CFString *v84;
  __int16 v85;
  __CFString *v86;
  __int16 v87;
  __CFString *v88;
  _QWORD v89[4];

  v89[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v69 = a4;
  v67 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v66);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v63, "showUnsavedSyndicatedContentInMemories");
  objc_msgSend(v66, "px_standardLibrarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIncludeGuestAssets:", v10);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    objc_msgSend(v69, "title");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "subtitle");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "fontName");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v9, "assetCollectionType") == 6 && MEMORY[0x1A85CC160](objc_msgSend(v9, "type")))
    {
      objc_msgSend(v9, "localizedSubtitle");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedTitle");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "localizedTitle");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedSubtitle");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "titleFontName");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = -[__CFString length](v12, "length");
  v14 = (_QWORD *)MEMORY[0x1E0CD1CD0];
  v15 = (_QWORD *)MEMORY[0x1E0CD1CC0];
  if (v13 || !-[__CFString count](v67, "count"))
  {
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v12, *v14);
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v68, *v15);
    objc_msgSend(MEMORY[0x1E0CD1640], "preferredAttributesForMemoryCreationFromAssetCollection:proposedAttributes:", v9, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[__CFString fetchedObjects](v67, "fetchedObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities memoryTitleStringFromPeople:](PXPeopleUtilities, "memoryTitleStringFromPeople:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(off_1E50B3470, "defaultHelper");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "titleForDisplayableText:titleCategory:options:", v17, 2, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v20 = v64;
      objc_msgSend(v64, "setObject:forKeyedSubscript:", v19, *v14);
      v17 = (void *)v19;
    }
    else
    {
      PLMemoriesGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v67;
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEFAULT, "Empty string returned for people %@", buf, 0xCu);
      }

      v20 = v64;
    }
    objc_msgSend(MEMORY[0x1E0CD1640], "preferredAttributesForMemoryCreationFromPeople:proposedAttributes:", v67, v20);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD13B8], "titleFontNameForTitleCategory:", 2);
    v22 = objc_claimAutoreleasedReturnValue();

    v62 = (void *)v22;
  }
  if (v65)
  {
    objc_msgSend(v65, "objectForKeyedSubscript:", *v14);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "objectForKeyedSubscript:", *v15);
    v24 = objc_claimAutoreleasedReturnValue();

    v68 = (void *)v24;
    v12 = (__CFString *)v23;
  }
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = __Block_byref_object_copy__83497;
  v75[4] = __Block_byref_object_dispose__83498;
  v76 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__PHMemoryChangeRequest_PhotosUICore__px_creationRequestForAssetCollection_displayTitleInfo_people_ignoreCuration___block_invoke;
  aBlock[3] = &unk_1E5123398;
  v74 = v75;
  v25 = (__CFString *)v9;
  v72 = v25;
  v61 = v11;
  v73 = v61;
  v26 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchRepresentativeAssetsInAssetCollection:", v25);
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString count](v27, "count"))
  {
    v26[2](v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count") == 0;

    if (!v29)
    {
      PLUIGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v78 = v27;
        v79 = 2112;
        v80 = v25;
        _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_FAULT, "photoanalysisd returned invalid representative assets:%@ for assetCollection:%@", buf, 0x16u);
      }

      v26[2](v26);
      v31 = objc_claimAutoreleasedReturnValue();

      v27 = (__CFString *)v31;
    }
  }
  v26[2](v26);
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  v34 = *MEMORY[0x1E0CD1F00];
  if (a6 && -[__CFString count](v32, "count") <= v34)
  {
    v33 = v33;
    v35 = v33;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD1640], "_fetchCuratedAssetsForAssetCollection:people:includeGuestAssets:", v25, v67, v10);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString count](v35, "count") > v34)
    {
      PXAssertGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v78 = v35;
        v79 = 2112;
        v80 = v25;
        _os_log_fault_impl(&dword_1A6789000, v36, OS_LOG_TYPE_FAULT, "Unexpected number of curated assets fetched %@ for assetCollection:%@", buf, 0x16u);
      }

    }
    if (-[__CFString count](v33, "count") > v34)
    {
      v37 = v35;

      v33 = v37;
      v35 = v33;
      v27 = v33;
    }
  }
  if (!-[__CFString count](v35, "count"))
  {
    v26[2](v26);
    v38 = objc_claimAutoreleasedReturnValue();

    v35 = (__CFString *)v38;
  }
  if (-[__CFString length](v12, "length"))
  {
    if ((a6 & 1) != 0)
      goto LABEL_45;
  }
  else
  {

    v12 = CFSTR(" ");
    if ((a6 & 1) != 0)
    {
LABEL_45:
      -[__CFString firstObject](v35, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
  }
  if (-[__CFString supportsFastKeyAssetCuration](v25, "supportsFastKeyAssetCuration"))
  {
    v39 = (void *)MEMORY[0x1E0CD1390];
    -[__CFString fetchedObjects](v67, "fetchedObjects");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "fetchKeyCuratedAssetInAssetCollection:referencePersons:", v25, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLUIGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v25;
      _os_log_impl(&dword_1A6789000, v42, OS_LOG_TYPE_DEFAULT, "%@ doesn't support fast key asset curation, falling back to uncurated key asset (for memory creation)", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v25, v61);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v41, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
    goto LABEL_45;
LABEL_46:
  if (-[__CFString length](v12, "length")
    && v43
    && -[__CFString count](v35, "count")
    && -[__CFString count](v27, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD1640], "creationRequestForMemoryWithTitle:subtitle:creationDate:category:subcategory:representativeAssets:curatedAssets:extendedCuratedAssets:keyAsset:", v12, v68, v60, 0, 0, v27, v35, v33, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0CD1640], "_shouldSetCustomUserAssetsForAssetCollection:", v25))
      objc_msgSend(v44, "setCustomUserAssets:", v35);
    if (v62)
    {
      objc_msgSend(MEMORY[0x1E0CD1630], "movieDataWithTitleFontName:", v62);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setMovieData:", v45);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = v25;
      objc_msgSend(v44, "setPhotosGraphVersion:", -[__CFString photosGraphVersion](v59, "photosGraphVersion"));
      -[__CFString photosGraphProperties](v59, "photosGraphProperties");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        v70 = 0;
        v56 = v46;
        objc_msgSend(MEMORY[0x1E0CD1630], "px_photosGraphDataFromProperties:error:", v46, &v70);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (__CFString *)v70;
        if (v47)
        {
          objc_msgSend(v44, "setPhotosGraphData:", v47);
        }
        else
        {
          PXAssertGetLog();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            log = v50;
            -[__CFString uuid](v59, "uuid");
            v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v78 = v54;
            v79 = 2112;
            v80 = v57;
            _os_log_fault_impl(&dword_1A6789000, log, OS_LOG_TYPE_FAULT, "Failed to pass photosGraphProperties from %@ to newly created memory: %@", buf, 0x16u);

            v50 = log;
          }

        }
        v46 = v56;
      }

    }
    -[__CFString fetchedObjects](v67, "fetchedObjects");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
    {
      v53 = v51;
    }
    else
    {
      v89[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 1);
      v53 = objc_claimAutoreleasedReturnValue();
    }
    v48 = v53;

    objc_msgSend(v44, "setQueryHintObjects:", v48);
  }
  else
  {
    PXAssertGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138413570;
      v78 = a1;
      v79 = 2112;
      v80 = v12;
      v81 = 2112;
      v82 = v43;
      v83 = 2112;
      v84 = v27;
      v85 = 2112;
      v86 = v35;
      v87 = 2112;
      v88 = v25;
      _os_log_fault_impl(&dword_1A6789000, v48, OS_LOG_TYPE_FAULT, "%@ error creating memory title:%@ keyAsset:%@ representativeAssets:%@ curatedAssets:%@ from assetCollection:%@", buf, 0x3Eu);
    }
    v44 = 0;
  }

  _Block_object_dispose(v75, 8);
  return v44;
}

+ (id)_fetchCuratedAssetsForAssetCollection:()PhotosUICore people:includeGuestAssets:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PXPhotosAssetsFetcherConfiguration *v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotosAssetsFetcher sharedFetcherForPhotoLibrary:](PXPhotosAssetsFetcher, "sharedFetcherForPhotoLibrary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    v11 = 20;
  else
    v11 = 16;
  if (+[PXStoryPHAssetCollectionAssetsProducer shouldApplyDetailsViewContextForAssetCollection:](PXStoryPHAssetCollectionAssetsProducer, "shouldApplyDetailsViewContextForAssetCollection:", v8))
  {
    v11 |= 0x20uLL;
  }
  v12 = objc_alloc_init(PXPhotosAssetsFetcherConfiguration);
  -[PXPhotosAssetsFetcherConfiguration setCurationKind:](v12, "setCurationKind:", 2);
  -[PXPhotosAssetsFetcherConfiguration setOptions:](v12, "setOptions:", v11);
  objc_msgSend(v7, "fetchedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosAssetsFetcherConfiguration setReferencePersons:](v12, "setReferencePersons:", v13);
  -[PXPhotosAssetsFetcherConfiguration setCurationType:](v12, "setCurationType:", 1);
  objc_msgSend(v10, "fetchAssetsInContainer:configuration:", v8, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)_shouldSetCustomUserAssetsForAssetCollection:()PhotosUICore
{
  id v3;
  void *v4;
  int v5;
  _BOOL8 v6;

  v3 = a3;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowCustomUserAssets");

  v6 = v5
    && (objc_msgSend(v3, "customSortKey") != 1 || (objc_msgSend(v3, "customSortAscending") & 1) == 0)
    && (unint64_t)(objc_msgSend(v3, "assetCollectionType") - 7) < 0xFFFFFFFFFFFFFFFDLL;

  return v6;
}

@end

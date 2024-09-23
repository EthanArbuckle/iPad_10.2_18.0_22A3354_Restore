@implementation PHAsset(PhotosUICore)

- (uint64_t)px_isUnsavedSyndicatedAsset
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "treatEveryAssetAsGuest") & 1) != 0)
  {
    v5 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v2, "dataSourceType") == 6)
  {
    v6 = objc_msgSend(a1, "isMomentSharedAsset");
    goto LABEL_7;
  }
  if (objc_msgSend(v2, "dataSourceType") == 7)
  {
    v5 = objc_msgSend(a1, "sourceType") == 2;
    goto LABEL_8;
  }
  objc_msgSend(a1, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wellKnownPhotoLibraryIdentifier");

  if (v4 != 3)
  {
    v6 = objc_msgSend(a1, "isGuestAsset");
LABEL_7:
    v5 = v6;
    goto LABEL_8;
  }
  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  v5 = objc_msgSend(a1, "isSyndicatedAssetSavedToUserLibrary") ^ 1;
LABEL_8:

  return v5;
}

- (id)px_adjustmentUuid
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "hasAdjustments"))
  {
    objc_msgSend(a1, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "adjustmentVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v6;
  }
  return v2;
}

- (id)px_singleLineMailingAddress
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "photosOneUpProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "addressWithoutUnitedStatesZipCode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)px_displayType
{
  uint64_t result;
  int v3;
  uint64_t v4;

  switch(objc_msgSend(a1, "playbackStyle"))
  {
    case 0:
      result = 1;
      break;
    case 1:
    case 3:
      if (objc_msgSend(a1, "playbackVariation") == 3)
        result = 5;
      else
        result = 1;
      break;
    case 2:
      result = 6;
      break;
    case 4:
      result = 2;
      break;
    case 5:
      v3 = objc_msgSend(a1, "playbackVariation");
      v4 = 2;
      if (v3 == 2)
        v4 = 3;
      if (v3 == 1)
        result = 4;
      else
        result = v4;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (uint64_t)px_currentVariationType
{
  int v1;

  v1 = objc_msgSend(a1, "playbackVariation");
  if ((v1 - 1) < 3)
    return (unsigned __int16)(v1 - 1) + 1;
  else
    return 0;
}

- (BOOL)px_isMomentSharedAsset
{
  return objc_msgSend(a1, "sourceType") == 8;
}

- (BOOL)px_isSyndicationPhotoLibraryAsset
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "photoLibrary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "wellKnownPhotoLibraryIdentifier") == 3;

  return v2;
}

- (uint64_t)px_isSyndicatedAsset
{
  if ((objc_msgSend(a1, "px_isSyndicationPhotoLibraryAsset") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "px_isUnsavedSyndicatedAsset");
}

- (uint64_t)px_wasSavedThroughSyndication
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;

  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "dataSourceType") == 6 || objc_msgSend(v2, "dataSourceType") == 7)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "wellKnownPhotoLibraryIdentifier");

    objc_msgSend(a1, "fetchPropertySetsIfNeeded");
    if (v4 == 3)
    {
      v5 = objc_msgSend(a1, "isSyndicatedAssetSavedToUserLibrary");
    }
    else
    {
      objc_msgSend(a1, "curationProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "syndicationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(a1, "isGuestAsset") ^ 1;
      if (v7)
        v5 = v8;
      else
        v5 = 0;
    }
  }

  return v5;
}

- (uint64_t)px_wasSavedThroughExternalApp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "curationProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syndicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importedByBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importedByDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (PLShouldConstructDisplayNameForAppBundle() && !v3)
  {
    if ((objc_msgSend(a1, "px_isSyndicatedAsset") & 1) != 0)
      v6 = 0;
    else
      v6 = objc_msgSend(a1, "px_wasSavedThroughSyndication") ^ 1;
  }

  return v6;
}

- (uint64_t)px_canLoadSyndicationAttributionInfo
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  if ((objc_msgSend(a1, "px_isSyndicatedAsset") & 1) != 0
    || (result = objc_msgSend(a1, "px_wasSavedThroughSyndication"), (_DWORD)result))
  {
    objc_msgSend(a1, "curationProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "importedByBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D71FC0]);
    return v5;
  }
  return result;
}

- (id)px_slHighlightWithError:()PhotosUICore
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  char *v16;
  uint64_t v17;
  uint32_t denom;
  uint32_t numer;
  NSObject *v20;
  NSObject *v21;
  id v23;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  PLSyndicationGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SLHighlightFetching", ", buf, 2u);
  }

  v9 = mach_absolute_time();
  objc_msgSend(a1, "curationProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syndicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8878]), "initWithCSSearchableItemUniqueIdentifier:error:", v11, &v23);
  v13 = v23;
  v14 = v13;
  if (!v12)
  {
    if (v13)
      *a3 = objc_retainAutorelease(v13);
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "uuid");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v16;
      v27 = 2114;
      v28 = *(double *)&v11;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "SLHighlight was nil for syndicated asset: %{public}@ with syndication identifier: %{public}@ with error: %@", buf, 0x20u);

    }
  }
  v17 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v20 = v8;
  v21 = v20;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v21, OS_SIGNPOST_INTERVAL_END, v6, "SLHighlightFetching", ", buf, 2u);
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "SLHighlightFetching";
    v27 = 2048;
    v28 = (float)((float)((float)((float)(v17 - v9) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v12;
}

- (id)px_debugStringForValueList:()PhotosUICore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void (**v30)(void *, id);
  void (**v31)(void *, id);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char isKindOfClass;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  __CFString *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id obja;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  _QWORD aBlock[4];
  id v79;
  id v80;
  id v81;
  _BYTE v82[128];
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[2];
  uint64_t v96;
  _QWORD v97[5];

  v97[3] = *MEMORY[0x1E0C80C00];
  obja = a3;
  v66 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setAlignment:", 1);
  objc_msgSend(v6, "setParagraphSpacing:", 3.0);
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setAlignment:", 0);
  objc_msgSend(v8, "setFirstLineHeadIndent:", 0.0);
  objc_msgSend(v8, "setHeadIndent:", 10.0);
  v9 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
  objc_msgSend(v9, "boldSystemFontOfSize:");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.7, 0.0, 1.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.8, 0.0, 0.0, 1.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.8, 0.5, 0.0, 1.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0DC1178];
  v95[0] = *MEMORY[0x1E0DC1138];
  v11 = v95[0];
  v95[1] = v12;
  v97[0] = v10;
  v97[1] = v4;
  v57 = v4;
  v96 = *MEMORY[0x1E0DC1140];
  v13 = v96;
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v95, 3);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v93[0] = v11;
  v93[1] = v12;
  v94[0] = v10;
  v94[1] = v6;
  v56 = v6;
  v93[2] = v13;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v94[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v91[0] = v11;
  v16 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
  objc_msgSend(v16, "systemFontOfSize:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v17;
  v92[1] = v8;
  v91[1] = v12;
  v91[2] = v13;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v92[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v89[0] = v11;
  v89[1] = v12;
  v54 = (void *)v10;
  v55 = v8;
  v90[0] = v10;
  v90[1] = v8;
  v89[2] = v13;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v90[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  v87 = v13;
  v88 = v60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v22;
  objc_msgSend(v22, "addEntriesFromDictionary:", v23);

  v24 = (void *)objc_msgSend(v21, "mutableCopy");
  v85 = v13;
  v86 = v59;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v24;
  objc_msgSend(v24, "addEntriesFromDictionary:", v25);

  v26 = (void *)objc_msgSend(v21, "mutableCopy");
  v83 = v13;
  v84 = v58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v26;
  objc_msgSend(v26, "addEntriesFromDictionary:", v27);

  v28 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PHAsset_PhotosUICore__px_debugStringForValueList___block_invoke;
  aBlock[3] = &unk_1E51250A8;
  v53 = v64;
  v79 = v53;
  v29 = v66;
  v80 = v29;
  v52 = v51;
  v81 = v52;
  v30 = (void (**)(void *, id))_Block_copy(aBlock);
  v74[0] = v28;
  v74[1] = 3221225472;
  v74[2] = __52__PHAsset_PhotosUICore__px_debugStringForValueList___block_invoke_2;
  v74[3] = &unk_1E51250A8;
  v50 = v19;
  v75 = v50;
  v67 = v29;
  v76 = v67;
  v65 = v21;
  v77 = v65;
  v31 = (void (**)(void *, id))_Block_copy(v74);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = obja;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v71;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v71 != v34)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v35);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        objc_msgSend(v36, "label", v50, v52, v53);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        if ((isKindOfClass & 1) != 0)
        {
          v31[2](v31, v38);

          v38 = v36;
          v39 = objc_msgSend(v38, "highlightStyle");
          v40 = v65;
          switch(v39)
          {
            case 0:
              goto LABEL_12;
            case 1:
              v40 = v63;
              goto LABEL_12;
            case 2:
              v40 = v61;
              goto LABEL_12;
            case 3:
              v40 = v62;
LABEL_12:
              v41 = v40;
              break;
            default:
              v41 = 0;
              break;
          }
          v42 = objc_alloc(MEMORY[0x1E0CB3498]);
          objc_msgSend(v38, "string");
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (!v43)
            v43 = CFSTR("??");
          -[__CFString stringByAppendingString:](v43, "stringByAppendingString:", CFSTR("\n"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v42, "initWithString:attributes:", v45, v41);

          objc_msgSend(v67, "appendAttributedString:", v46);
        }
        else
        {
          v30[2](v30, v38);
        }

        ++v35;
      }
      while (v33 != v35);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      v33 = v47;
    }
    while (v47);
  }

  v48 = v67;
  return v48;
}

- (__CFString)px_exportFilename
{
  __CFString *v2;
  uint64_t v3;

  objc_msgSend(a1, "originalFilename");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v2, "length"))
  {
    objc_msgSend(a1, "filename");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v3;
  }
  if (!-[__CFString length](v2, "length"))
  {

    v2 = CFSTR("unknown");
  }
  return v2;
}

- (id)px_detailedDebugDescriptionInLibrary:()PhotosUICore
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset+PhotosUICore.m"), 422, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "_deferredProcessingStringWithEnum:", objc_msgSend(a1, "deferredProcessingNeeded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Deferred Processing Details: %@"), v7);

  if (!objc_msgSend(a1, "deferredProcessingNeeded") && objc_msgSend(a1, "isPhoto"))
  {
    objc_msgSend(a1, "_imageProcessingFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Processing"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("\nFinal Image: %@"), v10);

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("\nCapture Type: %@"), v11);

    }
  }
  objc_msgSend(v6, "appendString:", CFSTR("\n\n"));
  objc_msgSend(a1, "detailedDebugDescriptionInLibrary:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v12);

  return v6;
}

- (id)px_curationDebugString
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "px_curationDebugValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_debugStringForValueList:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)px_curationDebugValues
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  float v57;
  void *v58;
  void *v59;
  uint64_t v60;
  double v61;
  double v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  __CFString *v86;
  __CFString *v87;
  void *v88;
  float v89;
  double v90;
  long double v91;
  float v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  __CFString *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __CFString *v110;
  __CFString *v111;
  uint64_t v112;
  void *v113;
  const __CFString *v114;
  uint64_t v115;
  void *v116;
  const __CFString *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  float v121;
  float v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  float v130;
  float v131;
  float v132;
  void *v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  void *v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  float v154;
  float v155;
  float v156;
  float v157;
  float v158;
  float v159;
  float v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  float v191;
  void *v192;
  void *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  uint64_t v197;
  void *v198;
  void *v199;
  uint64_t v200;
  void *v201;
  void *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  uint64_t v206;
  void *v207;
  void *v208;
  uint64_t v209;
  void *v210;
  void *v211;
  uint64_t v212;
  void *v213;
  void *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  uint64_t v218;
  void *v219;
  void *v220;
  uint64_t v221;
  void *v222;
  void *v223;
  uint64_t v224;
  void *v225;
  void *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  uint64_t v230;
  void *v231;
  void *v232;
  uint64_t v233;
  void *v234;
  void *v235;
  uint64_t v236;
  void *v237;
  void *v238;
  uint64_t v239;
  void *v240;
  void *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  uint64_t v245;
  void *v246;
  void *v247;
  uint64_t v248;
  void *v249;
  void *v250;
  uint64_t v251;
  void *v252;
  void *v253;
  void *v254;
  uint64_t v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  const __CFString *v269;
  uint64_t v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  __CFString *v280;
  unsigned int v281;
  void *v282;
  unsigned int v283;
  void *v284;
  unsigned int v285;
  void *v286;
  unsigned int v287;
  void *v288;
  unsigned int v289;
  void *v290;
  unsigned int v291;
  void *v292;
  uint64_t v293;
  void *v294;
  void *v295;
  void *v296;
  _OWORD v297[3];
  _OWORD v298[3];
  CMTime time;
  id v300[2];

  if (px_curationDebugValues_onceToken != -1)
    dispatch_once(&px_curationDebugValues_onceToken, &__block_literal_global_182_93591);
  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v300[0] = 0;
  objc_msgSend(v2, "curationDebugInformationForAssetLocalIdentifier:error:", v3, v300);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v300[0];

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isUtility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v291 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isUtilityForMemories"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v289 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTragicFailure"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v287 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("avoidForKeyAsset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v283 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("avoidForKeyAssetReason"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("avoidForMemoryKeyAsset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v285 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSafeForWidgetDisplay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v281 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isBlurryMedia"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(a1, "mediaAnalysisProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "blurrinessScore");
  v17 = v16;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharpnessThreshold"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  v21 = CFSTR("NO");
  if (v14)
    v21 = CFSTR("YES");
  v22 = CFSTR(">");
  if (v14)
    v22 = CFSTR("<");
  v269 = v21;
  v23 = 3;
  if (!v14)
    v23 = 0;
  v293 = v23;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%.2f %@ %.2f)"), v269, *(_QWORD *)&v17, v22, v20);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_opt_new();
  objc_msgSend(a1, "uuid");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:", v25);

  objc_msgSend(v24, "addValueWithLabel:", CFSTR("General"));
  objc_msgSend(a1, "mediaType");
  PHAssetMediaTypeDebugDescription();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "capitalizedString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Type"), v27);

  objc_msgSend(a1, "mediaSubtypes");
  PHAssetMediaSubtypesDebugDescription();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "capitalizedString");
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v30 = -[__CFString length](v29, "length");
  v31 = CFSTR("None");
  if (v30)
    v31 = v29;
  v32 = v31;

  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Subtype"), v32);
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Creation Date"), &stru_1E5149688);
  v33 = (void *)px_curationDebugValues_dateFormatter;
  objc_msgSend(a1, "creationDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringFromDate:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("    UTC"), v35);

  v36 = (void *)px_curationDebugValues_dateFormatter;
  objc_msgSend(a1, "localCreationDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringFromDate:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("    Local"), v38);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dx%d"), objc_msgSend(a1, "pixelWidth"), objc_msgSend(a1, "pixelHeight"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Resolution"), v39);

  objc_msgSend(v24, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", CFSTR("Favorite"), objc_msgSend(a1, "isFavorite"), 1, 1, 0);
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:", CFSTR("Has Adjustments"), objc_msgSend(a1, "hasAdjustments"));
  objc_msgSend(a1, "_deferredProcessingStringWithEnum:", objc_msgSend(a1, "deferredProcessingNeeded"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Deferred Processing Needed"), v40);

  if (!objc_msgSend(a1, "deferredProcessingNeeded") && objc_msgSend(a1, "isPhoto"))
  {
    objc_msgSend(a1, "_imageProcessingFlags");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("Processing"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ProcessingHighlight"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Final Image"), v43, objc_msgSend(v44, "unsignedIntegerValue"));

      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("Type"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Capture Type"), v45);

      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("SemDev"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", CFSTR("Semantic Enhance"), objc_msgSend(v46, "BOOLValue"), 1, 1, 0);

    }
  }
  v295 = (void *)v10;
  if (objc_msgSend(a1, "isPhotoIris"))
  {
    objc_msgSend(a1, "_videoDeferredProcessingNeededString:", objc_msgSend(a1, "videoDeferredProcessingNeeded"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Video Deferred Processing Needed"), v47);

    v48 = objc_alloc(MEMORY[0x1E0D75318]);
    objc_msgSend(a1, "fileURLForVideoComplementFile");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "path");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "mainFileURL");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "path");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v48, "initWithPathToVideo:pathToImage:", v50, v52);

    v10 = (uint64_t)v295;
    objc_msgSend(v24, "addValueWithLabel:integerValue:", CFSTR("   Frames Interpolated"), (int)objc_msgSend(v53, "numberOfFramesRecoveredWithError:", 0));

  }
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:", CFSTR("Spatial"), objc_msgSend(a1, "isSpatialMedia"));
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:", CFSTR("Included in Cloud Feeds"), objc_msgSend(a1, "isIncludedInCloudFeeds"));
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", CFSTR("Utility"), v291, 0, 0, 1);
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", CFSTR("Utility for Memories"), v289, 0, 0, 1);
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", CFSTR("Is Tragic Failure"), v287, 0, 0, 1);
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", CFSTR("Avoid For Key Asset"), v283, 0, 0, 1);
  if (v10)
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("\tReason"), v10, 3);
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", CFSTR("Avoid For Memory Key Asset"), v285, 0, 0, 1);
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", CFSTR("Safe For Widget Display"), v281, 1, 0, 1);
  objc_msgSend(a1, "curationScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Persisted Curation Score"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("curationScoreWithContext"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "doubleValue");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("    live with context"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("curationScoreWithoutContext"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "doubleValue");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("    live without context"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("curationScoreForMemories"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "doubleValue");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("    for memories"));

  objc_msgSend(a1, "highlightVisibilityScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Persisted Highlight Visibility Score"));
  objc_msgSend(a1, "overallAestheticScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Aesthetic Score"), v57);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("libraryTopTierAestheticScore"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "doubleValue");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("    Library Top-tier score"));

  v59 = (void *)MEMORY[0x1E0CD1420];
  v60 = *MEMORY[0x1E0D77FB8];
  objc_msgSend(a1, "locationCoordinate");
  v62 = v61;
  objc_msgSend(a1, "locationCoordinate");
  objc_msgSend(v59, "poiGeoHashWithGeoHashSize:latitude:longitude:", v60, v62);
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "iconicScoreProperties");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "iconicScore");
  v292 = (void *)v63;
  objc_msgSend(v64, "stringWithFormat:", CFSTR("%f (%@)"), v66, v63);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Iconic Score"), v67);

  objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Blurry"), v296, v293);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("squareCropScore"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "doubleValue");
  v70 = v69;

  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Square Crop Score"), v70);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("3x4CropScore"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "doubleValue");
  v73 = v72;

  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("3x4 Crop Score"), v73);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("3x2CropScore"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "doubleValue");
  v76 = v75;

  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("3x2 Crop Score"), v76);
  objc_msgSend(a1, "curationProperties");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "px_isSyndicatedAsset"))
  {
    objc_msgSend(v24, "addValueWithLabel:", CFSTR("Guest Asset"));
    objc_msgSend(v15, "syndicationProcessingValue");
    PHAssetMediaAnalysisSyndicationProcessingValueDescription();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Processing Value"), v78);

    objc_msgSend(v15, "syndicationProcessingVersion");
    PHAssetSyndicationProcessingVersionDescription();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Processing Version"), v79);

    objc_msgSend(v77, "syndicationIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Syndication Identifier"), v80);

  }
  objc_msgSend(v77, "importedByBundleIdentifier");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    objc_msgSend(v24, "addValueWithLabel:", CFSTR("Imported Asset"));
    objc_msgSend(v24, "addValueWithLabel:BOOLValue:", CFSTR("Relevant"), (objc_msgSend(v15, "syndicationProcessingValue") & 0x3CF1) != 0);
    objc_msgSend(v15, "syndicationProcessingValue");
    PHAssetMediaAnalysisSyndicationProcessingValueDescription();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Processing Value"), v82);

    objc_msgSend(v15, "syndicationProcessingVersion");
    PNExternalAssetRelevanceProcessingVersionDescription();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Processing Version"), v83);

    objc_msgSend(v77, "importedByDisplayName");
    v84 = objc_claimAutoreleasedReturnValue();
    v85 = (void *)v84;
    v86 = CFSTR("nil");
    if (v84)
      v86 = (__CFString *)v84;
    v87 = v86;

    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Imported Display Name"), v87);
    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Imported Bundle Identifier"), v81);
  }
  v294 = v81;
  objc_msgSend(v24, "addValueWithLabel:", CFSTR("User Activity"));
  objc_msgSend(a1, "assetUserActivityProperties");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:integerValue:", CFSTR("View Count"), objc_msgSend(v88, "viewCount"));
  objc_msgSend(v24, "addValueWithLabel:integerValue:", CFSTR("Play Count"), objc_msgSend(v88, "playCount"));
  v288 = v88;
  objc_msgSend(v24, "addValueWithLabel:integerValue:", CFSTR("Share Count"), objc_msgSend(v88, "shareCount"));
  objc_msgSend(v24, "addValueWithLabel:", CFSTR("User Behavior"));
  objc_msgSend(v77, "behavioralScore");
  v90 = v89;
  v91 = fmod(v89, 0.1) * 100.0;
  v290 = v77;
  objc_msgSend(v77, "interactionScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Interaction Score"), v92);
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Behavioral Score"), v90);
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Semantic Score"), (double)v91);
  objc_msgSend(v24, "addValueWithLabel:", CFSTR("People"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceAnalysisVersions"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("current"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "integerValue");

  v286 = v93;
  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("latest"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu (%lu)"), v95, v97);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Face Analysis Version"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peopleNames"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v282 = v98;
  if (objc_msgSend(v98, "count"))
  {
    v99 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v98, "componentsJoinedByString:", CFSTR("\n    "));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "stringWithFormat:", CFSTR("\n    %@"), v100);
    v101 = (const __CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v101 = CFSTR("-");
  }
  v280 = (__CFString *)v101;
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("People"), v101);
  objc_msgSend(v24, "addValueWithLabel:", CFSTR("Scenes"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneAnalysisVersions"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneTaxonomyDigest"));
  v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("current"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v104, "integerValue");

  v279 = v102;
  objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("latest"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu (%lu)"), v105, v107);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Scene Analysis Version"));
  if ((unint64_t)-[__CFString length](v103, "length") >= 8)
  {
    -[__CFString substringToIndex:](v103, "substringToIndex:", 8);
    v108 = objc_claimAutoreleasedReturnValue();

    v103 = (__CFString *)v108;
  }
  v109 = -[__CFString length](v103, "length");
  v110 = CFSTR("unavailable");
  if (v109)
    v110 = v103;
  v111 = v110;

  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Taxonomy Digest Prefix"), v111);
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Sceneprint distances"), &stru_1E5149688);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneprintDistanceToPreviousAsset"));
  v112 = objc_claimAutoreleasedReturnValue();
  v113 = (void *)v112;
  if (v112)
    v114 = (const __CFString *)v112;
  else
    v114 = CFSTR("-");
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("    to previous"), v114);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneprintDistanceToNextAsset"));
  v115 = objc_claimAutoreleasedReturnValue();
  v116 = (void *)v115;
  if (v115)
    v117 = (const __CFString *)v115;
  else
    v117 = CFSTR("-");
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("    to next:"), v117);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classification"));
  v118 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sceneClassificationStringWithClassifications:", v118);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Scene Classifications"));
  objc_msgSend(a1, "_junkClassificationStringWithClassifications:", v118);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Junk Classifications"));
  v277 = (void *)v118;
  objc_msgSend(a1, "_sdClassificationStringWithClassifications:", v118);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("\nSD City Nature Classifications"));
  objc_msgSend(v24, "addValueWithLabel:", CFSTR("Media Analysis"));
  objc_msgSend(v15, "mediaAnalysisTimeStamp");
  v119 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:integerValue:", CFSTR("ImageVersion"), (int)objc_msgSend(v15, "mediaAnalysisImageVersion"));
  objc_msgSend(v24, "addValueWithLabel:integerValue:", CFSTR("Version"), objc_msgSend(v15, "mediaAnalysisVersion"));
  if (v119)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v119, 1, 1);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Timestamp"), v120);

  }
  else
  {
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Timestamp"), CFSTR("(null)"), 2);
  }
  objc_msgSend(v15, "autoplaySuggestionScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Autoplay Suggestion"), v121);
  objc_msgSend(v15, "videoStickerSuggestionScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Live Sticker Suggestion"), v122);
  if (v15)
    objc_msgSend(v15, "bestKeyFrameTime");
  else
    memset(&time, 0, sizeof(time));
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Best Key Frame Time"), CMTimeGetSeconds(&time));
  if (v15)
    objc_msgSend(v15, "bestVideoTimeRange");
  else
    memset(v298, 0, sizeof(v298));
  objc_msgSend(a1, "stringMinutesTimeRangeFromTimeRange:", v298);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Best Video Time Range"), v123);

  v273 = (void *)v119;
  if (v15)
    objc_msgSend(v15, "animatedStickerTimeRange");
  else
    memset(v297, 0, sizeof(v297));
  objc_msgSend(a1, "stringMinutesTimeRangeFromTimeRange:", v297);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Best Animated Sticker Time Range"), v124);

  objc_msgSend(v15, "bestPlaybackRect");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%.*f, %.*f}, {%.*f, %.*f}}"), 3, v125, 3, v126, 3, v127, 3, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Best Playback Rect"), v129);

  objc_msgSend(v15, "videoScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Video Score"), v130);
  objc_msgSend(v15, "audioScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Audio Score"), v131);
  objc_msgSend(v15, "activityScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Activity Score"), v132);
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Video Face Count"), (double)(unint64_t)objc_msgSend(v15, "faceCount"));
  objc_msgSend(v15, "audioClassification");
  PHAssetMediaAnalysisStringsWithMultipleAudioClassifications();
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "componentsJoinedByString:", CFSTR(" | "));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Audio Classification"), v133);

  objc_msgSend(v15, "blurrinessScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Sharpness"), v134);
  objc_msgSend(v15, "exposureScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Exposure"), v135);
  objc_msgSend(v15, "wallpaperScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Wallpaper"), v136);
  objc_msgSend(v15, "settlingEffectScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("SettlingEffectScore"), v137);
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("ProbableRotationDirection"), (double)(int)objc_msgSend(v15, "probableRotationDirection"));
  objc_msgSend(v15, "probableRotationDirectionConfidence");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("\tConfidence"), v138);
  objc_msgSend(v24, "addValueWithLabel:", CFSTR("Aesthetic Scores"));
  objc_msgSend(a1, "aestheticProperties");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "wellFramedSubjectScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Well framed subject"), v140);
  objc_msgSend(v139, "wellChosenSubjectScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Well chosen background"), v141);
  objc_msgSend(v139, "tastefullyBlurredScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Tastefully blurred"), v142);
  objc_msgSend(v139, "sharplyFocusedSubjectScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Sharply focused subject"), v143);
  objc_msgSend(v139, "wellTimedShotScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Well timed shot"), v144);
  objc_msgSend(v139, "pleasantLightingScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Pleasant lighting"), v145);
  objc_msgSend(v139, "pleasantReflectionsScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Pleasant reflection"), v146);
  objc_msgSend(v139, "harmoniousColorScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Harmonious color"), v147);
  objc_msgSend(v139, "livelyColorScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Lively color"), v148);
  objc_msgSend(v139, "pleasantSymmetryScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Pleasant symmetry"), v149);
  objc_msgSend(v139, "pleasantPatternScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Pleasant pattern"), v150);
  objc_msgSend(v139, "immersivenessScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Immersiveness"), v151);
  objc_msgSend(v139, "pleasantPerspectiveScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Pleasant perspective"), v152);
  objc_msgSend(v139, "pleasantPostProcessingScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Pleasant postprocessing"), v153);
  objc_msgSend(v139, "noiseScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Noise"), v154);
  objc_msgSend(v139, "failureScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Failure"), v155);
  objc_msgSend(v139, "pleasantCompositionScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Pleasant composition"), v156);
  objc_msgSend(v139, "interestingSubjectScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Interesting subject"), v157);
  objc_msgSend(v139, "intrusiveObjectPresenceScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Intrusive object presence"), v158);
  objc_msgSend(v139, "pleasantCameraTiltScore");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Pleasant camera tilt"), v159);
  objc_msgSend(v139, "lowLight");
  objc_msgSend(v24, "addValueWithLabel:highlightedScore:", CFSTR("Low light"), v160);
  objc_msgSend(v24, "addValueWithLabel:", CFSTR("Miscellaneous"));
  objc_msgSend(a1, "preferredCropRect");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%.*f, %.*f}, {%.*f, %.*f}}"), 3, v161, 3, v162, 3, v163, 3, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Preferred Crop Rect"), v165);

  objc_msgSend(a1, "acceptableCropRect");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%.*f, %.*f}, {%.*f, %.*f}}"), 3, v166, 3, v167, 3, v168, 3, v169);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Acceptable Crop Rect"), v170);

  if (objc_msgSend(a1, "isPhotoIris"))
  {
    v171 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "variationSuggestionStatesDetails");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "stringWithFormat:", CFSTR("%@"), v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();

    if (v173)
    {
      objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Variation Suggestions"), v173);

    }
  }
  objc_msgSend(a1, "croppingDebugDescription");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Crop Scores"), v174);

  objc_msgSend(a1, "_userFeedbackScoreInfo");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("User Feedback Score"), v175);

  objc_msgSend(v24, "addValueWithLabel:", CFSTR("OCR"));
  v176 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "characterRecognitionProperties");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v177, "algorithmVersion"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("algorithmVersion"), v178);

  objc_msgSend(a1, "characterRecognitionProperties");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "adjustmentVersion");
  v180 = (void *)objc_claimAutoreleasedReturnValue();

  if (v180)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v180, 1, 1);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("adjustmentVersion"), v181);

  }
  objc_msgSend(a1, "_ocrStrings");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Text"), v182);

  objc_msgSend(a1, "_qrCodeStrings");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Codes"), v183);

  objc_msgSend(v24, "addValueWithLabel:", CFSTR("Visual Search"));
  v184 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "visualSearchProperties");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v185, "algorithmVersion"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("algorithmVersion"), v186);

  objc_msgSend(a1, "visualSearchProperties");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "adjustmentVersion");
  v188 = (void *)objc_claimAutoreleasedReturnValue();

  if (v188)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v188, 1, 1);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("adjustmentVersion"), v189);

  }
  objc_msgSend(a1, "visualSearchProperties");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "stickerConfidenceScore");
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", CFSTR("Sticker Confidence Score"), v191);

  if (v4)
  {
    objc_msgSend(v24, "addValueWithLabel:", CFSTR("Wallpaper Suggestions"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopPeoplePortraitReason"));
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopPeoplePortraitPass"));
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v193, "BOOLValue"))
      v194 = 1;
    else
      v194 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Top People Portrait"), v192, v194);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopPeopleLandscapeReason"));
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopPeopleLandscapePass"));
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v196, "BOOLValue"))
      v197 = 1;
    else
      v197 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Top People Landscape"), v195, v197);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopPetPortraitReason"));
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopPetPortraitPass"));
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v199, "BOOLValue"))
      v200 = 1;
    else
      v200 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Top Pet Portrait"), v198, v200);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopPetLandscapeReason"));
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopPetLandscapePass"));
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v202, "BOOLValue"))
      v203 = 1;
    else
      v203 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Top Pet Landscape"), v201, v203);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopNaturePortraitReason"));
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopNaturePortraitPass"));
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v205, "BOOLValue"))
      v206 = 1;
    else
      v206 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Top Nature Portrait"), v204, v206);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopNatureLandscapeReason"));
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopNatureLandscapePass"));
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v208, "BOOLValue"))
      v209 = 1;
    else
      v209 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Top Nature Landscape"), v207, v209);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopCityscapePortraitReason"));
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopCityscapePortraitPass"));
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v211, "BOOLValue"))
      v212 = 1;
    else
      v212 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Top City Portrait"), v210, v212);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopCityscapeLandscapeReason"));
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSTopCityscapeLandscapePass"));
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v214, "BOOLValue"))
      v215 = 1;
    else
      v215 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Top City Landscape"), v213, v215);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSPeoplePortraitReason"));
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSPeoplePortraitPass"));
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v217, "BOOLValue"))
      v218 = 1;
    else
      v218 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("People Portrait"), v216, v218);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSPeopleLandscapeReason"));
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSPeopleLandscapePass"));
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v220, "BOOLValue"))
      v221 = 1;
    else
      v221 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("People Landscape"), v219, v221);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSPetPortraitReason"));
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSPetPortraitPass"));
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v223, "BOOLValue"))
      v224 = 1;
    else
      v224 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Pet Portrait"), v222, v224);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSPetLandscapeReason"));
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSPetLandscapePass"));
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v226, "BOOLValue"))
      v227 = 1;
    else
      v227 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Pet Landscape"), v225, v227);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSNaturePortraitReason"));
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSNaturePortraitPass"));
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v229, "BOOLValue"))
      v230 = 1;
    else
      v230 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Nature Portrait"), v228, v230);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSNatureLandscapeReason"));
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSNatureLandscapePass"));
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v232, "BOOLValue"))
      v233 = 1;
    else
      v233 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Nature Landscape"), v231, v233);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSCityscapePortraitReason"));
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSCityscapePortraitPass"));
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v235, "BOOLValue"))
      v236 = 1;
    else
      v236 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("City Portrait"), v234, v236);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSCityscapeLandscapeReason"));
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSCityscapeLandscapePass"));
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v238, "BOOLValue"))
      v239 = 1;
    else
      v239 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("City Landscape"), v237, v239);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSSettlingEffectPortraitReason"));
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSSettlingEffectPortraitPass"));
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v241, "BOOLValue"))
      v242 = 1;
    else
      v242 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Settling Effect Portrait"), v240, v242);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSSettlingEffectLandscapeReason"));
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSSettlingEffectLandscapePass"));
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v244, "BOOLValue"))
      v245 = 1;
    else
      v245 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Settling Effect Landscape"), v243, v245);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSMePortraitReason"));
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSMePortraitPass"));
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v247, "BOOLValue"))
      v248 = 1;
    else
      v248 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Me Portrait"), v246, v248);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSMeLandscapeReason"));
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WSMeLandscapePass"));
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v250, "BOOLValue"))
      v251 = 1;
    else
      v251 = 2;
    objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Me Landscape"), v249, v251);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSWallpaperPropertiesVersions"));
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    v253 = v252;
    if (v252)
    {
      objc_msgSend(v252, "objectForKeyedSubscript:", CFSTR("current"));
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      v255 = objc_msgSend(v254, "integerValue");

      objc_msgSend(v253, "objectForKeyedSubscript:", CFSTR("persisted"));
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      v271 = v139;
      v257 = v4;
      v258 = v15;
      v259 = v188;
      v260 = v180;
      v261 = objc_msgSend(v256, "integerValue");

      v262 = 1;
      if (v261 != v255)
        v262 = 2;
      if (v261)
        v263 = v262;
      else
        v263 = 3;
      v270 = v261;
      v180 = v260;
      v188 = v259;
      v15 = v258;
      v4 = v257;
      v139 = v271;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu (%lu)"), v270, v255);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("\nWallpaper Properties Version"), v264, v263);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSWallpaperPropertiesTimestamp"));
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Time stamp"), v265);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSWallpaperProperties"));
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v266, "description");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addValueWithLabel:stringValue:", CFSTR("Properties"), v267);

      v81 = v294;
    }

  }
  return v24;
}

- (id)stringMinutesTimeRangeFromTimeRange:()PhotosUICore
{
  uint64_t Seconds;
  __int128 v5;
  Float64 v6;
  CMTimeRange time;
  CMTime v9;

  *(_OWORD *)&time.start.value = *(_OWORD *)a3;
  time.start.epoch = *(_QWORD *)(a3 + 16);
  Seconds = (uint64_t)CMTimeGetSeconds(&time.start);
  v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&time.start.value = *(_OWORD *)a3;
  *(_OWORD *)&time.start.epoch = v5;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)(a3 + 32);
  CMTimeRangeGetEnd(&v9, &time);
  v6 = CMTimeGetSeconds(&v9);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02ld:%02ld-%02ld:%02ld"), Seconds / 60, Seconds % 60, (uint64_t)v6 / 60, (uint64_t)v6 % 60);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (__CFString)_ocrStrings
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_ocrStrings_onceToken != -1)
    dispatch_once(&_ocrStrings_onceToken, &__block_literal_global_672);
  if (!_ocrStrings_observationClass)
    return (__CFString *)0;
  objc_msgSend(a1, "characterRecognitionProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characterRecognitionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", _ocrStrings_observationClass, v3, &v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v13;
    if (v4)
    {
      objc_msgSend(v4, "getTranscript");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLUIGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v10;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Failed to unarchive VNDocumentObservation data for asset:%{public}@ with error: %@", buf, 0x16u);

      }
      objc_msgSend(v5, "localizedDescription");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (__CFString *)v6;

  }
  else
  {
    v8 = 0;
  }
  v11 = &stru_1E5149688;
  if (v8)
    v11 = v8;
  v12 = v11;

  return v12;
}

- (__CFString)_qrCodeStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "characterRecognitionProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "machineReadableCodeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v25 = a1;
      v32 = 0;
      v27 = v6;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v4, v6, &v32);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v32;
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v29;
        v13 = *MEMORY[0x1E0CEE278];
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v15, "symbology");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v13);

            if (v17)
            {
              objc_msgSend(v15, "payloadStringValue");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v18);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        }
        while (v11);
      }

      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        PLUIGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v25, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v21;
          v35 = 2112;
          v36 = v26;
          _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Failed to unarchive VNDocumentObservation data for asset:%{public}@ with error: %@", buf, 0x16u);

        }
        objc_msgSend(v26, "localizedDescription");
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      v6 = v27;
    }
    else
    {
      v19 = 0;
    }
    v23 = &stru_1E5149688;
    if (v19)
      v23 = v19;
    v22 = v23;

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_sceneClassificationStringWithClassifications:()PhotosUICore
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  id v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v35;
    v23 = *(_QWORD *)v35;
    do
    {
      v7 = 0;
      v25 = v5;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
        if (objc_msgSend(v8, "rangeOfString:", CFSTR(" - ")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v27 = v7;
          v9 = v24;
          objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("->"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v31;
            do
            {
              v14 = 0;
              v15 = v9;
              do
              {
                if (*(_QWORD *)v31 != v13)
                  objc_enumerationMutation(v10);
                v16 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * v14);
                v29 = 0.0;
                v17 = v16;
                if (objc_msgSend(v16, "hasSuffix:", CFSTR(")")))
                {
                  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v16);
                  v28 = v16;
                  objc_msgSend(v18, "scanUpToString:intoString:", CFSTR(" ("), &v28);
                  v17 = v28;

                  objc_msgSend(v18, "scanString:intoString:", CFSTR("("), 0);
                  objc_msgSend(v18, "scanDouble:", &v29);

                }
                objc_msgSend(v15, "objectForKeyedSubscript:", v17);
                v19 = (id)objc_claimAutoreleasedReturnValue();
                if (!v19)
                {
                  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v17);
                }
                v9 = v19;

                if (v17 != v16)
                {
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("_name"));
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("_confidence"));

                }
                ++v14;
                v15 = v9;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v12);
          }

          v6 = v23;
          v5 = v25;
          v7 = v27;
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v5);
  }

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("\n"));
  ProcessLevel(v21, v24, 1);

  return v21;
}

- (id)_sdClassificationStringWithClassifications:()PhotosUICore
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("SD - "), (_QWORD)v18);
        v13 = v4;
        if ((v12 & 1) == 0)
        {
          v14 = objc_msgSend(v11, "hasPrefix:", CFSTR("City Nature - "));
          v13 = v5;
          if (!v14)
            continue;
        }
        objc_msgSend(v13, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v5, "sortUsingSelector:", sel_compare_);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v15, "addObject:", &stru_1E5149688);
  objc_msgSend(v15, "addObjectsFromArray:", v4);
  objc_msgSend(v15, "addObjectsFromArray:", v5);
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n    "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_junkClassificationStringWithClassifications:()PhotosUICore
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v5)
  {
    v25 = 0;
    v7 = 0;
    v27 = 0;
    goto LABEL_31;
  }
  v6 = v5;
  v25 = 0;
  v7 = 0;
  v27 = 0;
  v8 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      if (objc_msgSend(v10, "hasPrefix:", CFSTR("Junk - "), v19))
      {
        objc_msgSend(v10, "substringFromIndex:", 7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hasPrefix:", CFSTR("Negative"))
          && (objc_msgSend(v11, "hasPrefix:", CFSTR("Negative Internal")) & 1) == 0)
        {
          v15 = v10;

          v27 = v15;
        }
        else if (objc_msgSend(v11, "hasPrefix:", CFSTR("Non Memorable")))
        {
          v12 = v10;

          v7 = v12;
        }
        else if (objc_msgSend(v11, "hasPrefix:", CFSTR("Poor Quality")))
        {
          v14 = v10;

          v25 = v14;
        }
        else
        {
          objc_msgSend(v23, "addObject:", v10);
        }

      }
      else
      {
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("NSFW - ")))
        {
          v13 = v26;
        }
        else if (objc_msgSend(v10, "hasPrefix:", CFSTR("TE - ")))
        {
          v13 = v24;
        }
        else if (objc_msgSend(v10, "hasPrefix:", CFSTR("PL - ")))
        {
          v13 = v22;
        }
        else if (objc_msgSend(v10, "hasPrefix:", CFSTR("IVS NSFW - ")))
        {
          v13 = v21;
        }
        else
        {
          if (!objc_msgSend(v10, "hasPrefix:", CFSTR("Meme - ")))
            continue;
          v13 = v19;
        }
        objc_msgSend(v13, "addObject:", v10);
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v6);
LABEL_31:

  objc_msgSend(v23, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v23, "insertObject:atIndex:", &stru_1E5149688, 0);
  if (v25)
    objc_msgSend(v23, "insertObject:atIndex:", v25, 1);
  if (v7)
    objc_msgSend(v23, "insertObject:atIndex:", v7, 1);
  if (v27)
    objc_msgSend(v23, "insertObject:atIndex:", v27, 1);
  objc_msgSend(v26, "sortUsingSelector:", sel_compare_, v19);
  objc_msgSend(v24, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v22, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v21, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v20, "sortUsingSelector:", sel_compare_);
  v16 = (void *)objc_msgSend(v23, "mutableCopy");
  objc_msgSend(v16, "addObjectsFromArray:", v26);
  objc_msgSend(v16, "addObjectsFromArray:", v24);
  objc_msgSend(v16, "addObjectsFromArray:", v22);
  objc_msgSend(v16, "addObjectsFromArray:", v21);
  objc_msgSend(v16, "addObjectsFromArray:", v20);
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n    "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (const)_deferredProcessingStringWithEnum:()PhotosUICore
{
  if ((a3 - 1) > 0xA)
    return CFSTR("None");
  else
    return off_1E5125150[(unsigned __int16)(a3 - 1)];
}

- (const)_videoDeferredProcessingNeededString:()PhotosUICore
{
  const __CFString *v3;

  v3 = &stru_1E5149688;
  if (a3 == 1)
    v3 = CFSTR("Frame Drop Recovery");
  if (a3)
    return v3;
  else
    return CFSTR("None");
}

- (uint64_t)px_shotWithNightMode
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v6;

  objc_msgSend(a1, "originalImageProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v2 = objc_msgSend(MEMORY[0x1E0D75100], "readMetadataType:fromCGImageProperties:value:error:", 15, v1, &v6, 0);
  v3 = v6;
  v4 = v3;
  if ((_DWORD)v2)
    v2 = objc_msgSend(v3, "intValue") == 11;

  return v2;
}

- (id)_imageProcessingFlags
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  id v15;
  id v16;

  objc_msgSend(a1, "originalImageProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E53ECFD8, CFSTR("ProcessingHighlight"));
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0D75100], "readMetadataType:fromCGImageProperties:value:error:", 7, v1, &v16, 0);
  v3 = v16;
  v4 = objc_msgSend(v3, "integerValue");
  v5 = v4;
  if ((v4 & 0x1000) == 0)
  {
    if ((v4 & 0x2000) != 0)
      v6 = CFSTR("DF Final Image");
    else
      v6 = CFSTR("Non-Deferred");
    if ((v4 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E53ECFF0, CFSTR("ProcessingHighlight"));
  v6 = CFSTR("Proxy");
  if ((v5 & 0x8000) != 0)
LABEL_8:
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SemDev"));
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%d)"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("Processing"));

  v15 = 0;
  v8 = objc_msgSend(MEMORY[0x1E0D75100], "readMetadataType:fromCGImageProperties:value:error:", 15, v1, &v15, 0);
  v9 = v15;
  v10 = v9;
  if (v8 && (v11 = objc_msgSend(v9, "intValue") - 1, v11 <= 0xB))
    v12 = off_1E51251A8[v11];
  else
    v12 = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("Type"));

  return v2;
}

- (id)_userFeedbackScoreInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  void *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludedDetectionTypes:", v4);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInAsset:options:", a1, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v11), "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v9);
  }

  objc_msgSend(a1, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v13;
  v31 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0CD17F8]);
  objc_msgSend(a1, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithPhotoLibrary:", v16);

  objc_msgSend(a1, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scoreForAssetUUIDs:personsUUIDsByAssetUUIDs:", v19, v14);
  v21 = v20;

  objc_msgSend(MEMORY[0x1E0CD17F8], "descriptionForScore:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%.2f)"), v22, *(_QWORD *)&v21, (_QWORD)v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)px_navigationURLQueryItemWithPrefix:()PhotosUICore
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = &stru_1E5149688;
  if (a3)
    v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(a1, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItemWithName:value:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)px_navigationURLWithContainerCollection:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("photos://asset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_navigationURLQueryItemWithPrefix:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  if (v4)
  {
    objc_msgSend(v4, "px_navigationURLQueryItemWithPrefix:", CFSTR("album"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  objc_msgSend(v5, "setQueryItems:", v6);
  objc_msgSend(v5, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)px_coreDataBrowserURL
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("coredatabrowser"));
  objc_msgSend(v2, "setPath:", CFSTR("/entity/Asset/"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("key"), CFSTR("uuid"));
  v4 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(a1, "uuid", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("value"), v5);
  v15[1] = v6;
  v7 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(a1, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("storeURL"), v10);
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQueryItems:", v12);

  objc_msgSend(v2, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)px_searchDebugString
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "px_searchDebugValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_debugStringForValueList:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)px_searchDebugValues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const __CFString *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const __CFString *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  const __CFString *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  const __CFString *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const __CFString *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const __CFString *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const __CFString *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const __CFString *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  const __CFString *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  const __CFString *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  const __CFString *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  const __CFString *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  const __CFString *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  const __CFString *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  void *v139;
  const __CFString *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  const __CFString *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  const __CFString *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const __CFString *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  const __CFString *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const __CFString *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const __CFString *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  void *v171;
  const __CFString *v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  void *v176;
  const __CFString *v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  void *v181;
  const __CFString *v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  void *v186;
  const __CFString *v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  void *v191;
  const __CFString *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  void *v196;
  const __CFString *v197;
  uint64_t v198;
  void *v199;
  uint64_t v200;
  void *v201;
  const __CFString *v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  void *v206;
  const __CFString *v207;
  uint64_t v208;
  void *v209;
  uint64_t v210;
  void *v211;
  const __CFString *v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  void *v216;
  const __CFString *v217;
  void *v219;
  id v220;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = 0;
  objc_msgSend(v3, "searchDebugInformationForAssetLocalIdentifier:error:", v4, &v220);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v220;

  if (v5)
  {
    objc_msgSend(a1, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:", v7);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("GENERAL"));
    v8 = *MEMORY[0x1E0D72C18];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C18]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = CFSTR("(null)");
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v8, v11);

    v12 = *MEMORY[0x1E0D72CD8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CD8]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (const __CFString *)v13;
    else
      v15 = CFSTR("(null)");
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v12, v15);

    v16 = *MEMORY[0x1E0D72B98];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72B98]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v16, objc_msgSend(v17, "BOOLValue"));

    v18 = *MEMORY[0x1E0D72D48];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D48]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v18, objc_msgSend(v19, "BOOLValue"));

    v20 = *MEMORY[0x1E0D72D10];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D10]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v20, objc_msgSend(v21, "BOOLValue"));
    else
      objc_msgSend(v2, "addValueWithLabel:stringValue:", v20, CFSTR("(null)"));
    v23 = *MEMORY[0x1E0D72C00];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C00]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = v24;
    if (v24)
    {
      objc_msgSend(v24, "doubleValue");
      objc_msgSend(v2, "addValueWithLabel:doubleValue:", v23);
    }
    else
    {
      objc_msgSend(v2, "addValueWithLabel:stringValue:", v23, CFSTR("(null)"));
    }
    objc_msgSend(v2, "addValueWithLabel:", CFSTR("EMBEDDINGS"));
    v25 = *MEMORY[0x1E0D72B90];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72B90]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v25, objc_msgSend(v26, "BOOLValue"));

    v27 = *MEMORY[0x1E0D72C28];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C28]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v27, objc_msgSend(v28, "integerValue"));

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("VERSIONS"));
    v29 = *MEMORY[0x1E0D72CF8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CF8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v29, objc_msgSend(v30, "integerValue"));

    v31 = *MEMORY[0x1E0D72C48];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C48]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v31, objc_msgSend(v32, "integerValue"));

    v33 = *MEMORY[0x1E0D72CA0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CA0]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v33, objc_msgSend(v34, "integerValue"));

    v35 = *MEMORY[0x1E0D72C98];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C98]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v35, objc_msgSend(v36, "integerValue"));

    v37 = *MEMORY[0x1E0D72CC8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CC8]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v37, objc_msgSend(v38, "integerValue"));

    v39 = *MEMORY[0x1E0D72CD0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CD0]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v39, objc_msgSend(v40, "integerValue"));

    v41 = *MEMORY[0x1E0D72BD0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BD0]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v41, objc_msgSend(v42, "integerValue"));

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("OTHER"));
    v43 = *MEMORY[0x1E0D72C50];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C50]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v43, objc_msgSend(v44, "BOOLValue"));

    v45 = *MEMORY[0x1E0D72C08];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C08]);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v46;
    if (v46)
      v48 = (const __CFString *)v46;
    else
      v48 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v45, v48);

    v49 = *MEMORY[0x1E0D72C20];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C20]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    objc_msgSend(v2, "addValueWithLabel:doubleValue:", v49);

    v51 = *MEMORY[0x1E0D72BA0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BA0]);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v52;
    if (v52)
      v54 = (const __CFString *)v52;
    else
      v54 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v51, v54);

    v55 = *MEMORY[0x1E0D72BD8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BD8]);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v56;
    if (v56)
      v58 = (const __CFString *)v56;
    else
      v58 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v55, v58);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("SCORES"));
    v59 = *MEMORY[0x1E0D72C10];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C10]);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "doubleValue");
    objc_msgSend(v2, "addValueWithLabel:doubleValue:", v59);

    v61 = *MEMORY[0x1E0D72BA8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BA8]);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "doubleValue");
    objc_msgSend(v2, "addValueWithLabel:doubleValue:", v61);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("DATES"));
    v63 = *MEMORY[0x1E0D72BE0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BE0]);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)v64;
    if (v64)
      v66 = (const __CFString *)v64;
    else
      v66 = CFSTR("(null)");
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v63, v66);

    v67 = *MEMORY[0x1E0D72BE8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BE8]);
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = (void *)v68;
    if (v68)
      v70 = (const __CFString *)v68;
    else
      v70 = CFSTR("(null)");
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v67, v70);

    v71 = *MEMORY[0x1E0D72BF0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BF0]);
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = (void *)v72;
    if (v72)
      v74 = (const __CFString *)v72;
    else
      v74 = CFSTR("(null)");
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v71, v74);

    v75 = *MEMORY[0x1E0D72D08];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D08]);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v76);
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = (void *)v77;
    if (v77)
      v79 = (const __CFString *)v77;
    else
      v79 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v75, v79);

    v80 = *MEMORY[0x1E0D72C70];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C70]);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v81);
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)v82;
    if (v82)
      v84 = (const __CFString *)v82;
    else
      v84 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v80, v84);

    v85 = *MEMORY[0x1E0D72D28];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D28]);
    v86 = objc_claimAutoreleasedReturnValue();
    v87 = (void *)v86;
    if (v86)
      v88 = (const __CFString *)v86;
    else
      v88 = CFSTR("(null)");
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v85, v88);

    v89 = *MEMORY[0x1E0D72D30];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D30]);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "doubleValue");
    objc_msgSend(v2, "addValueWithLabel:doubleValue:", v89);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("USER TEXT"));
    v91 = *MEMORY[0x1E0D72D38];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D38]);
    v92 = objc_claimAutoreleasedReturnValue();
    v93 = (void *)v92;
    if (v92)
      v94 = (const __CFString *)v92;
    else
      v94 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v91, v94);

    v95 = *MEMORY[0x1E0D72C58];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C58]);
    v96 = objc_claimAutoreleasedReturnValue();
    v97 = (void *)v96;
    if (v96)
      v98 = (const __CFString *)v96;
    else
      v98 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v95, v98);

    v99 = *MEMORY[0x1E0D72BF8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BF8]);
    v100 = objc_claimAutoreleasedReturnValue();
    v101 = (void *)v100;
    if (v100)
      v102 = (const __CFString *)v100;
    else
      v102 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v99, v102);

    v103 = *MEMORY[0x1E0D72C78];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C78]);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v104);
    v105 = objc_claimAutoreleasedReturnValue();
    v106 = (void *)v105;
    if (v105)
      v107 = (const __CFString *)v105;
    else
      v107 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v103, v107);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("MEDIA TYPES"));
    v108 = *MEMORY[0x1E0D72CA8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CA8]);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v109);
    v110 = objc_claimAutoreleasedReturnValue();
    v111 = (void *)v110;
    if (v110)
      v112 = (const __CFString *)v110;
    else
      v112 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v108, v112);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("LOCATIONS"));
    v113 = *MEMORY[0x1E0D72CE0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CE0]);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v113, objc_msgSend(v114, "BOOLValue"));

    objc_msgSend(v5, "objectForKeyedSubscript:", v113);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (v115)
      objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v20, objc_msgSend(v22, "BOOLValue"));
    else
      objc_msgSend(v2, "addValueWithLabel:stringValue:", v20, CFSTR("(null)"));
    v116 = *MEMORY[0x1E0D72C88];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C88]);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v117);
    v118 = objc_claimAutoreleasedReturnValue();
    v119 = (void *)v118;
    if (v118)
      v120 = (const __CFString *)v118;
    else
      v120 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v116, v120);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("BUSINESSES"));
    v121 = *MEMORY[0x1E0D72BC8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BC8]);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v122);
    v123 = objc_claimAutoreleasedReturnValue();
    v124 = (void *)v123;
    if (v123)
      v125 = (const __CFString *)v123;
    else
      v125 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v121, v125);

    v126 = *MEMORY[0x1E0D72BC0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BC0]);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v127);
    v128 = objc_claimAutoreleasedReturnValue();
    v129 = (void *)v128;
    if (v128)
      v130 = (const __CFString *)v128;
    else
      v130 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v126, v130);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("PUBLIC EVENTS"));
    v131 = *MEMORY[0x1E0D72C38];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C38]);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v132);
    v133 = objc_claimAutoreleasedReturnValue();
    v134 = (void *)v133;
    if (v133)
      v135 = (const __CFString *)v133;
    else
      v135 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v131, v135);

    v136 = *MEMORY[0x1E0D72C30];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C30]);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v137);
    v138 = objc_claimAutoreleasedReturnValue();
    v139 = (void *)v138;
    if (v138)
      v140 = (const __CFString *)v138;
    else
      v140 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v136, v140);

    v141 = *MEMORY[0x1E0D72C40];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C40]);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v142);
    v143 = objc_claimAutoreleasedReturnValue();
    v144 = (void *)v143;
    if (v143)
      v145 = (const __CFString *)v143;
    else
      v145 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v141, v145);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("MEANINGS"));
    v146 = *MEMORY[0x1E0D72C90];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C90]);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v147);
    v148 = objc_claimAutoreleasedReturnValue();
    v149 = (void *)v148;
    if (v148)
      v150 = (const __CFString *)v148;
    else
      v150 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v146, v150);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("SHARED LIBRARY"));
    v151 = *MEMORY[0x1E0D72C80];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C80]);
    v152 = objc_claimAutoreleasedReturnValue();
    v153 = (void *)v152;
    if (v152)
      v154 = (const __CFString *)v152;
    else
      v154 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v151, v154);

    v155 = *MEMORY[0x1E0D72D18];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D18]);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithPersons:", v156);
    v157 = objc_claimAutoreleasedReturnValue();
    v158 = (void *)v157;
    if (v157)
      v159 = (const __CFString *)v157;
    else
      v159 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v155, v159);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("SAVED FROM APP"));
    v160 = *MEMORY[0x1E0D72CF0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CF0]);
    v161 = objc_claimAutoreleasedReturnValue();
    v162 = (void *)v161;
    if (v161)
      v163 = (const __CFString *)v161;
    else
      v163 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v160, v163);

    v164 = *MEMORY[0x1E0D72CE8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CE8]);
    v165 = objc_claimAutoreleasedReturnValue();
    v166 = (void *)v165;
    if (v165)
      v167 = (const __CFString *)v165;
    else
      v167 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v164, v167);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("PEOPLE"));
    v168 = *MEMORY[0x1E0D72CC0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CC0]);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithPersons:", v169);
    v170 = objc_claimAutoreleasedReturnValue();
    v171 = (void *)v170;
    if (v170)
      v172 = (const __CFString *)v170;
    else
      v172 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v168, v172);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("OCR TEXT CONTENT"));
    v173 = *MEMORY[0x1E0D72D20];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D20]);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v174);
    v175 = objc_claimAutoreleasedReturnValue();
    v176 = (void *)v175;
    if (v175)
      v177 = (const __CFString *)v175;
    else
      v177 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v173, v177);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("UTILITIES"));
    v178 = *MEMORY[0x1E0D72D40];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D40]);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v179);
    v180 = objc_claimAutoreleasedReturnValue();
    v181 = (void *)v180;
    if (v180)
      v182 = (const __CFString *)v180;
    else
      v182 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v178, v182);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("SCENES"));
    v183 = *MEMORY[0x1E0D72D00];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D00]);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithScenes:", v184);
    v185 = objc_claimAutoreleasedReturnValue();
    v186 = (void *)v185;
    if (v185)
      v187 = (const __CFString *)v185;
    else
      v187 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v183, v187);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("ALBUMS"));
    v188 = *MEMORY[0x1E0D72BB8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BB8]);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v189);
    v190 = objc_claimAutoreleasedReturnValue();
    v191 = (void *)v190;
    if (v190)
      v192 = (const __CFString *)v190;
    else
      v192 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v188, v192);

    v193 = *MEMORY[0x1E0D72BB0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72BB0]);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v194);
    v195 = objc_claimAutoreleasedReturnValue();
    v196 = (void *)v195;
    if (v195)
      v197 = (const __CFString *)v195;
    else
      v197 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v193, v197);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("MEMORIES"));
    v198 = *MEMORY[0x1E0D72CB8];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CB8]);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v199);
    v200 = objc_claimAutoreleasedReturnValue();
    v201 = (void *)v200;
    if (v200)
      v202 = (const __CFString *)v200;
    else
      v202 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v198, v202);

    v203 = *MEMORY[0x1E0D72CB0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72CB0]);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v204);
    v205 = objc_claimAutoreleasedReturnValue();
    v206 = (void *)v205;
    if (v205)
      v207 = (const __CFString *)v205;
    else
      v207 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v203, v207);

    objc_msgSend(v2, "addValueWithLabel:", CFSTR("HIGHLIGHTS"));
    v208 = *MEMORY[0x1E0D72C68];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C68]);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v209);
    v210 = objc_claimAutoreleasedReturnValue();
    v211 = (void *)v210;
    if (v210)
      v212 = (const __CFString *)v210;
    else
      v212 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v208, v212);

    v213 = *MEMORY[0x1E0D72C60];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D72C60]);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_searchDebugStringWithValues:", v214);
    v215 = objc_claimAutoreleasedReturnValue();
    v216 = (void *)v215;
    if (v215)
      v217 = (const __CFString *)v215;
    else
      v217 = &stru_1E5149688;
    objc_msgSend(v2, "addValueWithLabel:stringValue:", v213, v217);

  }
  else
  {
    objc_msgSend(v6, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addValueWithLabel:stringValue:highlightStyle:", CFSTR("Error"), v22, 3);
  }

  return v2;
}

- (__CFString)_searchDebugStringWithValues:()PhotosUICore
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("\n    "));
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR(",\n    "));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendString:](v5, "appendString:", v6);

    }
    else
    {
      v5 = &stru_1E5149688;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (__CFString)_searchDebugStringWithPersons:()PhotosUICore
{
  id v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("\n"));
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v19 = v4;
      obj = v4;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v22 != v8)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("photosPersonIdentifier"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("photosPersonIdentifier: %@\n"), v12);

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("displayName"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("  displayName: %@\n"), v13);

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nameAlternatives"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("  nameAlternatives: %@\n"), v14);

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("faceAttributes"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("  faceAttributes: %@\n"), v15);

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("personType"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("  personType: %@\n"), v16);

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("  contactIdentifier: %@\n"), v17);

            -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("%@\n"), v11);
          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v7);
      }

      v4 = v19;
    }
    else
    {
      v5 = &stru_1E5149688;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (__CFString)_searchDebugStringWithScenes:()PhotosUICore
{
  id v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("\n"));
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v20 = v4;
      obj = v4;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v23 != v8)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("sceneIdentifier: %@\n"), v12);

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sceneType_humanReadable"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sceneType"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("  sceneType: %@ (%@)\n"), v13, v14);

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("label"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("  label: %@\n"), v15);

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("synonyms"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("  synonyms: %@\n"), v16);

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("confidence"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("  confidence: %@\n"), v17);

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("boundingBox"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("  boundingBox: %@\n"), v18);

            -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("%@\n"), v11);
          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v7);
      }

      v4 = v20;
    }
    else
    {
      v5 = &stru_1E5149688;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)px_fetchAssetsInArray:()PhotosUICore photoLibrary:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0CD1620];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v7, v6, v9, 0, 0, 0);

  return v10;
}

+ (id)px_fetchPlacesAssetsInAssetCollection:()PhotosUICore options:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
LABEL_3:
      v8 = (void *)objc_msgSend(v7, "copy");
      goto LABEL_6;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CD1570];
    objc_msgSend(v6, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchOptionsWithPhotoLibrary:orObject:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setIncludePlacesSmartAlbum:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000203, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(v5, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSharingFilter:", objc_msgSend(0, "sharingFilter"));
LABEL_6:
  objc_msgSend(v8, "setIncludeHiddenAssets:", 0);
  objc_msgSend(v8, "setChunkSizeForFetch:", 5000);
  objc_msgSend(v8, "sortDescriptors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "internalSortDescriptorForPropertyKey:ascending:", CFSTR("creationDate"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInternalSortDescriptors:", v16);

  }
  v17 = *MEMORY[0x1E0CD1A40];
  v21[0] = *MEMORY[0x1E0CD19C0];
  v21[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v18);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)px_orderedAssetsFromAssets:()PhotosUICore sortDescriptors:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v14[4];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  memset(v14, 0, sizeof(v14));
  if (objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", v14, v15, 16)
    && (objc_msgSend(**((id **)&v14[0] + 1), "photoLibrary"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    objc_msgSend(v7, "px_standardLibrarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSortDescriptors:", v6);
    objc_msgSend(v9, "setIncludeHiddenAssets:", 1);
    objc_msgSend(v9, "setIncludeGuestAssets:", 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "fetchedObjectIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithObjectIDs:options:", v10, v9);
    }
    else
    {
      PXMap();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v10, v9);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchAssetsWithLocalIdentifiers:options:", MEMORY[0x1E0C9AA60], v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)addressWithoutUnitedStatesZipCode:()PhotosUICore
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("  \\d{5}(-\\d{4})?, United States$"), 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (!objc_msgSend(v3, "length") || v5)
  {
    if (v5)
    {
      PLUIGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Can't remove United States zip code with error: %@", buf, 0xCu);
      }

    }
    v6 = v3;
  }
  else
  {
    objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), CFSTR(", United States"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  return v8;
}

+ (void)px_generateResourceFilesForAssets:()PhotosUICore completionHandler:
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  __CFString *v57;
  id v58;
  id v59;
  NSObject *group;
  id v61;
  id obj;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  _QWORD block[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  NSObject *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v47 = a4;
  group = dispatch_group_create();
  v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v59 = objc_alloc_init(MEMORY[0x1E0CD1470]);
  objc_msgSend(v59, "setNetworkAccessAllowed:", 1);
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v5;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v83;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v83 != v48)
          objc_enumerationMutation(obj);
        v56 = v6;
        v7 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v6);
        objc_msgSend(v7, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSTemporaryDirectory();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "photoLibrary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "photoLibrary");
        v12 = objc_claimAutoreleasedReturnValue();

        v54 = (void *)v12;
        objc_msgSend(v7, "px_detailedDebugDescriptionInLibrary:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v8;
        objc_msgSend(v8, "stringByAppendingString:", CFSTR(".detailedDebugDescription.txt"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v10;
        objc_msgSend(v10, "stringByAppendingPathComponent:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "count"))
        {
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v79;
            while (2)
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v79 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "originalFilename");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v22, "hasPrefix:", CFSTR("IMG")))
                {
                  objc_msgSend(v22, "stringByDeletingPathExtension");
                  v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "stringByAppendingPathComponent:");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "stringByAppendingString:", CFSTR(".detailedDebugDescription.txt"));
                  v24 = objc_claimAutoreleasedReturnValue();

                  v15 = (void *)v24;
                  goto LABEL_17;
                }

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
              if (v19)
                continue;
              break;
            }
          }
          v57 = &stru_1E5149688;
LABEL_17:

        }
        else
        {
          v57 = &stru_1E5149688;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v64, 1, 0, 0);

        if ((v26 & 1) == 0)
          NSLog(CFSTR("Failed to create temporary directory for TTR Image Quality Feedback"));
        v52 = v15;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v15);
        v27 = objc_claimAutoreleasedReturnValue();
        v77 = 0;
        v53 = v13;
        objc_msgSend(v13, "writeToURL:atomically:encoding:error:", v27, 1, 4, &v77);
        v50 = v77;
        if (!v50)
          objc_msgSend(v61, "addObject:", v27);
        v51 = (void *)v27;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v58 = v16;
        v65 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
        if (v65)
        {
          v63 = *(_QWORD *)v74;
          do
          {
            for (j = 0; j != v65; ++j)
            {
              if (*(_QWORD *)v74 != v63)
                objc_enumerationMutation(v58);
              v29 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
              objc_msgSend(v29, "originalFilename");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "privateFileURL");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "pathExtension");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
              {
                objc_msgSend(v30, "stringByDeletingPathExtension");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "stringByAppendingPathExtension:", v32);
                v34 = objc_claimAutoreleasedReturnValue();

                v30 = (void *)v34;
              }
              objc_msgSend(v30, "stringByDeletingPathExtension");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(obj, "count") >= 2
                && ((objc_msgSend(v30, "hasPrefix:", CFSTR("Adjustments")) & 1) != 0
                 || (objc_msgSend(v30, "hasPrefix:", CFSTR("FullSize")) & 1) != 0
                 || objc_msgSend(v30, "hasPrefix:", CFSTR("Penultimate"))))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v57, v30);
                v36 = objc_claimAutoreleasedReturnValue();

                v30 = (void *)v36;
              }
              objc_msgSend(v64, "stringByAppendingPathComponent:", v35);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "stringByAppendingPathComponent:", v30);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v37, 1, 0, 0);

              if ((v41 & 1) == 0)
                NSLog(CFSTR("Failed to create temporary directory for TTR Image Quality Feedback"));
              dispatch_group_enter(group);
              objc_msgSend(MEMORY[0x1E0CD1458], "defaultManager");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v69[0] = MEMORY[0x1E0C809B0];
              v69[1] = 3221225472;
              v69[2] = __77__PHAsset_PhotosUICore__px_generateResourceFilesForAssets_completionHandler___block_invoke;
              v69[3] = &unk_1E5125110;
              v70 = v39;
              v71 = v61;
              v72 = group;
              v43 = v39;
              objc_msgSend(v42, "writeDataForAssetResource:toFile:options:completionHandler:", v29, v43, v59, v69);

            }
            v65 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
          }
          while (v65);
        }

        v6 = v56 + 1;
      }
      while (v56 + 1 != v49);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    }
    while (v49);
  }

  dispatch_get_global_queue(0, 0);
  v44 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PHAsset_PhotosUICore__px_generateResourceFilesForAssets_completionHandler___block_invoke_2;
  block[3] = &unk_1E5148CE0;
  v67 = v61;
  v68 = v47;
  v45 = v61;
  v46 = v47;
  dispatch_group_notify(group, v44, block);

}

@end

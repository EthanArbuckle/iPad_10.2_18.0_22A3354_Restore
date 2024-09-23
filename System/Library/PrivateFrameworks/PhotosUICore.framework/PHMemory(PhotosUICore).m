@implementation PHMemory(PhotosUICore)

- (id)px_photosGraphDataByMutatingPropertiesUsingBlock:()PhotosUICore error:
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "photosGraphProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;

  v6[2](v6, v11);
  objc_msgSend((id)objc_opt_class(), "px_photosGraphDataFromProperties:error:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)px_mutatedPhotosGraphPropertiesWithRejectReason:()PhotosUICore
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PHMemory_PhotosUICore__px_mutatedPhotosGraphPropertiesWithRejectReason___block_invoke;
  v9[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
  v9[4] = a3;
  objc_msgSend(a1, "px_photosGraphDataByMutatingPropertiesUsingBlock:error:", v9, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = a1;
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Unable to archive photosGraphData from memory: %@ –– with error: %@", buf, 0x16u);
    }

  }
  return v4;
}

- (void)px_assignStoryTitleCategoryIfNeeded
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  objc_msgSend(a1, "storyTitleCategory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "generateNextStoryTitleStyleIndex");
    PFStoryTitleCategoryGenerateWithWrappedIndex();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__PHMemory_PhotosUICore__px_assignStoryTitleCategoryIfNeeded__block_invoke;
    v10[3] = &unk_1E5148D08;
    v10[4] = a1;
    v11 = v4;
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __61__PHMemory_PhotosUICore__px_assignStoryTitleCategoryIfNeeded__block_invoke_133;
    v7[3] = &unk_1E5147B40;
    v2 = v11;
    v8 = v2;
    v9 = a1;
    objc_msgSend(v5, "performChanges:completionHandler:", v10, v7);

  }
}

- (id)px_blockableFeatureActions
{
  id v2;
  id v3;
  id v4;
  id v5;
  void (**v6)(void *, const __CFString *, const __CFString *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  id v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PHMemory_PhotosUICore__px_blockableFeatureActions__block_invoke;
  aBlock[3] = &unk_1E5124E68;
  v4 = v3;
  v32 = v4;
  v5 = v2;
  v33 = v5;
  v6 = (void (**)(void *, const __CFString *, const __CFString *))_Block_copy(aBlock);
  if (objc_msgSend(a1, "hasBlockableFeature"))
  {
    objc_msgSend(a1, "userFeedbackProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userFeedback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v26 = v5;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(a1, "blockableFeatures");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v9);
            v14 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "type");
            if (v14 <= 511)
            {
              if (v14 == 16)
              {
                v6[2](v6, CFSTR("PXBlockMemoryActionTitleThisDay"), CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate"));
              }
              else if (v14 == 32)
              {
                v6[2](v6, CFSTR("PXBlockMemoryActionTitleThisHoliday"), CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureHoliday"));
              }
            }
            else if (v14 == 512)
            {
              v6[2](v6, CFSTR("PXBlockMemoryActionTitleThisDateInterval"), CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval"));
            }
            else if (v14 == 4096 || v14 == 0x20000)
            {
              v6[2](v6, CFSTR("PXBlockMemoryActionTitleThisPlace"), CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePlace"));
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v11);
      }

      v5 = v26;
    }
  }
  objc_msgSend(a1, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "librarySpecificFetchOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFetchPropertySets:", v17);

  objc_msgSend(v16, "setPersonContext:", 3);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIncludedDetectionTypes:", v18);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsForAssetCollection:options:", a1, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fetchedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleWidgetUtilities verifiedPersonsFromMergeCandidatesForPersons:](PXPeopleWidgetUtilities, "verifiedPersonsFromMergeCandidatesForPersons:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "count");
  if (v22)
  {
    if (v22 == 1)
      v23 = CFSTR("PXBlockMemoryActionTitleThisPerson");
    else
      v23 = CFSTR("PXBlockMemoryActionTitlePeople");
    v6[2](v6, v23, CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePerson"));
  }

  if (!objc_msgSend(v5, "count"))
    v6[2](v6, CFSTR("PXBlockMemoryActionTitleGeneric"), CFSTR("PXAssetCollectionActionTypeBlockMemory"));
  v24 = v5;

  return v24;
}

- (uint64_t)px_isTrip
{
  return objc_msgSend(MEMORY[0x1E0D77F08], "supportsCollection:", a1);
}

- (uint64_t)px_canPerformFeatureLessAction
{
  return objc_msgSend(a1, "px_isTrip") ^ 1;
}

- (uint64_t)px_canEditFavoriteState
{
  uint64_t v2;
  _BOOL4 v3;

  v2 = objc_msgSend(a1, "px_isTrip") ^ 1;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v3 = objc_msgSend(a1, "pendingState") != 2 || objc_msgSend(a1, "featuredState") != 2;
    return v2 & v3;
  }
  return v2;
}

+ (uint64_t)px_photosGraphDataFromProperties:()PhotosUICore error:
{
  return objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

- (const)px_navigationURLHost
{
  return CFSTR("memory");
}

@end

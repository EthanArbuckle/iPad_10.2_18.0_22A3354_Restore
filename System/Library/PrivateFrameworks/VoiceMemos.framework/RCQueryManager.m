@implementation RCQueryManager

+ (id)evictionDateBeforeFetchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_defaultRecordingsFetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("evictionDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToFetch:", v6);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil AND %K <= %@"), CFSTR("evictionDate"), CFSTR("evictionDate"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v7);
  return v5;
}

+ (id)deletedRecordingsFetchRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_defaultRecordingsFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "playablePredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deletedRecordingsPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rc_and:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v6);

  objc_msgSend(a1, "defaultResidentRecordingsFetchedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPropertiesToFetch:", v7);

  objc_msgSend(a1, "defaultSortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v8);

  objc_msgSend(v3, "setFetchBatchSize:", 100);
  return v3;
}

+ (id)playableRecordingsFetchRequestWithSubPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(a1, "_defaultRecordingsFetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("evictionDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "playablePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rc_and:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  objc_msgSend(a1, "defaultResidentRecordingsFetchedProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToFetch:", v9);

  objc_msgSend(a1, "defaultSortDescriptors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v10);

  objc_msgSend(v5, "setFetchBatchSize:", 100);
  if (v4)
  {
    objc_msgSend(v5, "predicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rc_and:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v12);

  }
  return v5;
}

+ (NSArray)defaultSortDescriptors
{
  if (defaultSortDescriptors_onceToken != -1)
    dispatch_once(&defaultSortDescriptors_onceToken, &__block_literal_global_16);
  return (NSArray *)(id)defaultSortDescriptors_sortDescriptors;
}

+ (id)_defaultRecordingsFetchRequest
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CloudRecording"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultFetchedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPropertiesToFetch:", v4);

  return v3;
}

+ (NSArray)defaultFetchedProperties
{
  if (defaultFetchedProperties_onceToken != -1)
    dispatch_once(&defaultFetchedProperties_onceToken, &__block_literal_global_24);
  return (NSArray *)(id)defaultFetchedProperties_properties;
}

+ (id)playablePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("flags != nil && bitwiseAnd:with:(flags, %@) != 0"), &unk_1E76A9650);
}

+ (id)defaultResidentRecordingsFetchedProperties
{
  if (defaultResidentRecordingsFetchedProperties_onceToken != -1)
    dispatch_once(&defaultResidentRecordingsFetchedProperties_onceToken, &__block_literal_global_25);
  return (id)defaultResidentRecordingsFetchedProperties_properties;
}

+ (id)deletedRecordingsPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("evictionDate"));
}

void __40__RCQueryManager_defaultSortDescriptors__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("customLabelForSorting"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)defaultSortDescriptors_sortDescriptors;
  defaultSortDescriptors_sortDescriptors = v2;

}

void __60__RCQueryManager_defaultResidentRecordingsFetchedProperties__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("customLabelForSorting");
  v2[1] = CFSTR("date");
  v2[2] = CFSTR("localDuration");
  v2[3] = CFSTR("sharedFlags");
  v2[4] = CFSTR("uniqueID");
  v2[5] = CFSTR("evictionDate");
  v2[6] = CFSTR("flags");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultResidentRecordingsFetchedProperties_properties;
  defaultResidentRecordingsFetchedProperties_properties = v0;

}

void __42__RCQueryManager_defaultFetchedProperties__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("customLabelForSorting");
  v2[1] = CFSTR("date");
  v2[2] = CFSTR("localDuration");
  v2[3] = CFSTR("sharedFlags");
  v2[4] = CFSTR("uniqueID");
  v2[5] = CFSTR("evictionDate");
  v2[6] = CFSTR("flags");
  v2[7] = CFSTR("path");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultFetchedProperties_properties;
  defaultFetchedProperties_properties = v0;

}

+ (id)recordingsForFileNameFetchRequest:(id)a3
{
  return (id)objc_msgSend(a1, "_recordingsWithPredicateFormat:", CFSTR("%K == %@"), CFSTR("path"), a3);
}

+ (id)recordingsWithUniqueIDFetchRequest:(id)a3
{
  return (id)objc_msgSend(a1, "_recordingsWithPredicateFormat:", CFSTR("%K == %@"), CFSTR("uniqueID"), a3);
}

+ (id)recordingsWithUniqueIDsFetchRequest:(id)a3
{
  return (id)objc_msgSend(a1, "_recordingsWithPredicateFormat:", CFSTR("%K IN %@"), CFSTR("uniqueID"), a3);
}

+ (id)allDeletedRecordingsFetchRequest
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "deletedRecordingsPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultRecordingsFetchRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allCustomLabelsFetchRequest
{
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_defaultRecordingsFetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("customLabelForSorting");
  v5[1] = CFSTR("evictionDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v3);

  return v2;
}

+ (id)recordingWithNameFetchRequest:(id)a3 searchOption:(int)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0CB35D0];
  v7 = a3;
  objc_msgSend(v6, "expressionForKeyPath:", CFSTR("customLabelForSorting"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3518];
  v11 = _predicateOperatorTypeForSearchOption(a4);
  objc_msgSend(v10, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v8, v9, 0, v11, _predicateOptionsForSearchOption(a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultRecordingsFetchRequest:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)recordingsInFolderFetchRequest:(id)a3
{
  return (id)objc_msgSend(a1, "_recordingsWithPredicateFormat:", CFSTR("folder.uuid == %@"), a3);
}

+ (id)visibleRecordingsFetchRequest
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "playablePredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultRecordingsFetchRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "defaultSortDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v5);

  return v4;
}

+ (id)recordingsNeedingAssetExportFetchRequest
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil && bitwiseAnd:with:(%K, %@) == %@"), CFSTR("flags"), CFSTR("flags"), &unk_1E76A9620, &unk_1E76A9620);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultRecordingsFetchRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = CFSTR("flags");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v5);

  return v4;
}

+ (id)recordingsWithNilEncryptedTitleOrCustomLabelFetchRequest
{
  return (id)objc_msgSend(a1, "_recordingsWithPredicateFormat:", CFSTR("%K == nil || %K == nil"), CFSTR("encryptedTitle"), CFSTR("customLabel"));
}

+ (id)recordingsWithNilAudioFuturesFetchRequest
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_recordingsWithPredicateFormat:", CFSTR("%K == nil"), CFSTR("audioFuture"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("audioFuture");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v3);

  return v2;
}

+ (id)encryptedFieldsMigrationsFetchRequest
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Migration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil && bitwiseAnd:with:(%K, %@) == %@"), CFSTR("flags"), CFSTR("flags"), &unk_1E76A9638, &unk_1E76A9638);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  return v2;
}

+ (id)recordingsWithTitleFetchRequest:(id)a3
{
  const __CFString *v3;

  v3 = CFSTR("nil");
  if (a3)
    v3 = (const __CFString *)a3;
  return (id)objc_msgSend(a1, "_recordingsWithPredicateFormat:", CFSTR("%K == %@"), CFSTR("customLabelForSorting"), v3);
}

+ (id)userDefinedFoldersFetchRequest
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_foldersWithPredicateFormat:", CFSTR("%K != NULL && %K != NULL"), CFSTR("encryptedName"), CFSTR("uuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldRefreshRefetchedObjects:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rank"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v4);

  return v2;
}

+ (id)foldersWithNameFetchRequest:(id)a3 searchOption:(int)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0CB35D0];
  v7 = a3;
  objc_msgSend(v6, "expressionForKeyPath:", CFSTR("encryptedName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3518];
  v11 = _predicateOperatorTypeForSearchOption(a4);
  objc_msgSend(v10, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v8, v9, 0, v11, _predicateOptionsForSearchOption(a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultFolderFetchRequest:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)foldersWithUUIDFetchRequest:(id)a3
{
  return (id)objc_msgSend(a1, "_foldersWithPredicateFormat:", CFSTR("%K == %@"), CFSTR("uuid"), a3);
}

+ (id)foldersWithhRankFetchRequest:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_foldersWithPredicateFormat:", CFSTR("%K == %@"), CFSTR("rank"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allFoldersForSortingFetchRequest
{
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_defaultFolderFetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("rank");
  v5[1] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v3);

  return v2;
}

+ (id)customLabelSearchPredicateWithString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K contains[cd] %@"), CFSTR("customLabelForSorting"), a3);
}

+ (id)cacheDeletedOnWatchPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("flags != nil && bitwiseAnd:with:(flags, %@) == %@"), &unk_1E76A9668, &unk_1E76A9680);
}

+ (id)watchOSPredicate
{
  return SharedFlagsBitwiseAndCompoundPredicate(64);
}

+ (id)musicMemoPredicate
{
  return SharedFlagsBitwiseAndCompoundPredicate(4);
}

+ (id)favoritePredicate
{
  return SharedFlagsBitwiseAndCompoundPredicate(1);
}

+ (id)recordingsInFolderPredicate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ == folder.uuid"), a3);
}

+ (id)_defaultRecordingsFetchRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_defaultRecordingsFetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v4);

  return v5;
}

+ (id)_defaultFolderFetchRequest
{
  void *v2;

  if (_defaultFolderFetchRequest_onceToken != -1)
    dispatch_once(&_defaultFolderFetchRequest_onceToken, &__block_literal_global_39);
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Folder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", _defaultFolderFetchRequest_defaultFolderPropertiesToFetch);
  return v2;
}

void __44__RCQueryManager__defaultFolderFetchRequest__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("encryptedName");
  v2[1] = CFSTR("rank");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_defaultFolderFetchRequest_defaultFolderPropertiesToFetch;
  _defaultFolderFetchRequest_defaultFolderPropertiesToFetch = v0;

}

+ (id)_defaultFolderFetchRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_defaultFolderFetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v4);

  return v5;
}

+ (id)_recordingsWithPredicateFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "_defaultRecordingsFetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:arguments:", v4, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

+ (id)_foldersWithPredicateFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "_defaultFolderFetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:arguments:", v4, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

@end

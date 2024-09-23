@implementation PLCloudFeedEntry

- (void)willSave
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLCloudFeedEntry;
  -[PLManagedObject willSave](&v7, sel_willSave);
  if ((-[PLCloudFeedEntry isDeleted](self, "isDeleted") & 1) == 0 && (MEMORY[0x19AEC0720]() & 1) == 0)
  {
    -[PLCloudFeedEntry changedValues](self, "changedValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[PLCloudFeedEntry isInserted](self, "isInserted") & 1) == 0)
    {
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = CFSTR("entryAssets");
        goto LABEL_6;
      }
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:

        return;
      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entryLikeComments"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v4 = CFSTR("entryComments");
LABEL_6:
        objc_msgSend(v3, "objectForKeyedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5)
          goto LABEL_12;
        goto LABEL_11;
      }

    }
LABEL_11:
    -[PLCloudFeedEntry recalcIsMine](self, "recalcIsMine");
    goto LABEL_12;
  }
}

- (void)recalcIsMine
{
  uint64_t v3;
  void *v4;
  void *v5;
  PLCloudFeedEntry *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  switch(-[PLCloudFeedEntry entryType](self, "entryType"))
  {
    case 1:
      -[PLCloudFeedEntry entity](self, "entity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCloudFeedAssetsEntry entity](PLCloudFeedAssetsEntry, "entity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "isKindOfEntity:", v5);

      if ((_DWORD)v3)
      {
        -[PLCloudFeedEntry entryAssets](self, "entryAssets");
        v6 = (PLCloudFeedEntry *)objc_claimAutoreleasedReturnValue();
        -[PLCloudFeedEntry firstObject](v6, "firstObject");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v7, "cloudIsMyAsset");
        goto LABEL_20;
      }
      break;
    case 2:
      -[PLCloudFeedEntry entity](self, "entity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCloudFeedCommentsEntry entity](PLCloudFeedCommentsEntry, "entity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "isKindOfEntity:", v9);

      if ((_DWORD)v3)
      {
        v6 = self;
        -[PLCloudFeedEntry entryComments](v6, "entryComments");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
          -[PLCloudFeedEntry entryComments](v6, "entryComments");
        else
          -[PLCloudFeedEntry entryLikeComments](v6, "entryLikeComments");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v7 = v11;
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          while (2)
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "isMyComment", (_QWORD)v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "BOOLValue");

              if (!v17)
              {
                v3 = 0;
                goto LABEL_19;
              }
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v13)
              continue;
            break;
          }
        }
        v3 = 1;
LABEL_19:

LABEL_20:
      }
      break;
    case 4:
    case 7:
      v3 = 1;
      break;
    default:
      break;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, (_QWORD)v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v18, CFSTR("entryIsMine"), 0);

}

- (NSURL)URIRepresentation
{
  void *v2;
  void *v3;

  -[PLCloudFeedEntry objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (int64_t)entryType
{
  void *v2;
  int64_t v3;

  -[PLCloudFeedEntry entryTypeNumber](self, "entryTypeNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)entryPriority
{
  void *v2;
  int64_t v3;

  -[PLCloudFeedEntry entryPriorityNumber](self, "entryPriorityNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)shouldBeRemovedFromPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCloudFeedEntry entryDate](self, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && ((-[PLCloudFeedEntry entryAlbumGUID](self, "entryAlbumGUID"), (v6 = objc_claimAutoreleasedReturnValue()) == 0)
     || (v7 = (void *)v6,
         +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v6, v4), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v7, v8)))
  {
    -[PLCloudFeedEntry entryInvitationRecordGUID](self, "entryInvitationRecordGUID");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v16[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCloudSharedAlbumInvitationRecord cloudSharedAlbumInvitationRecordsWithGUIDs:inLibrary:](PLCloudSharedAlbumInvitationRecord, "cloudSharedAlbumInvitationRecordsWithGUIDs:inLibrary:", v11, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

+ (id)entriesSortDescriptorsAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v3 = a3;
  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryPriorityNumber"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)allEntriesInLibrary:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allEntriesInManagedObjectContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateIncludingOnlyEntryTypes:(id)a3
{
  return (id)objc_msgSend(a1, "predicateIncludingOnlyEntryTypes:noIndex:", a3, 0);
}

+ (id)predicateIncludingOnlyEntryTypes:(id)a3 noIndex:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    if (v4)
      v11 = CFSTR("(noindex:(entryTypeNumber) = %d)");
    else
      v11 = CFSTR("entryTypeNumber = %d");
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "intValue");
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)predicateExcludingEntryTypes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "intValue");
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entryTypeNumber != %d"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)predicateIncludingOnlyCommentsAndLikesFromOthers
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryTypeNumber = %d AND entryIsMine = NO)"), 2);
}

+ (id)predicateIncludingOnlyAssetsAddedByOthers
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryTypeNumber = %d AND entryIsMine = NO)"), 1);
}

+ (id)notificationPredicateForFilter:(int64_t)a3
{
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[3];

  v3 = 0;
  v17[2] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1:
      v5 = &unk_1E3764250;
      goto LABEL_4;
    case 3:
      v5 = &unk_1E3764268;
LABEL_4:
      objc_msgSend(a1, "predicateIncludingOnlyEntryTypes:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      v7 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(a1, "predicateIncludingOnlyCommentsAndLikesFromOthers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v8;
      objc_msgSend(a1, "predicateIncludingOnlyEntryTypes:", &unk_1E3764280);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "orPredicateWithSubpredicates:", v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 5:
      v11 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(a1, "predicateIncludingOnlyCommentsAndLikesFromOthers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "predicateIncludingOnlyAssetsAddedByOthers", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v12;
      objc_msgSend(a1, "predicateIncludingOnlyEntryTypes:", &unk_1E3764298);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "orPredicateWithSubpredicates:", v14);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      break;
    case 6:
      objc_msgSend(a1, "predicateExcludingEntryTypes:", &unk_1E37642B0);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v3 = (void *)v6;
      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)fetchesForFilter:(int64_t)a3 inManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  PLCloudFeedEntryFetch *v8;
  void *v9;
  PLCloudFeedEntryFetch *v10;
  void *v11;
  uint64_t v12;
  PLCloudFeedEntryFetch *v13;
  void *v14;
  PLCloudFeedEntryFetch *v15;
  void *v16;
  PLCloudFeedEntryFetch *v17;
  void *v18;
  PLCloudFeedEntryFetch *v19;
  void *v20;
  PLCloudFeedEntryFetch *v21;
  void *v22;
  PLCloudFeedEntryFetch *v23;
  void *v24;
  PLCloudFeedEntryFetch *v25;
  void *v26;
  PLCloudFeedEntryFetch *v27;
  void *v28;
  PLCloudFeedEntryFetch *v29;
  void *v30;
  _QWORD v32[3];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0:
    case 2:
      v8 = [PLCloudFeedEntryFetch alloc];
      +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PLCloudFeedEntryFetch initWithPredicate:entity:](v8, "initWithPredicate:entity:", 0, v9);

      objc_msgSend(v7, "addObject:", v10);
      goto LABEL_12;
    case 1:
      v11 = &unk_1E37642C8;
      goto LABEL_5;
    case 3:
      v11 = &unk_1E37642E0;
LABEL_5:
      objc_msgSend(a1, "predicateIncludingOnlyEntryTypes:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      objc_msgSend(a1, "predicateIncludingOnlyCommentsAndLikesFromOthers");
      v10 = (PLCloudFeedEntryFetch *)objc_claimAutoreleasedReturnValue();
      v13 = [PLCloudFeedEntryFetch alloc];
      +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedCommentsEntry, "entityInManagedObjectContext:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PLCloudFeedEntryFetch initWithPredicate:entity:](v13, "initWithPredicate:entity:", v10, v14);

      objc_msgSend(a1, "predicateIncludingOnlyEntryTypes:noIndex:", &unk_1E37642F8, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = [PLCloudFeedEntryFetch alloc];
      +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PLCloudFeedEntryFetch initWithPredicate:entity:](v17, "initWithPredicate:entity:", v16, v18);

      v33[0] = v15;
      v33[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v20);
      goto LABEL_8;
    case 5:
      objc_msgSend(a1, "predicateIncludingOnlyCommentsAndLikesFromOthers");
      v10 = (PLCloudFeedEntryFetch *)objc_claimAutoreleasedReturnValue();
      v21 = [PLCloudFeedEntryFetch alloc];
      +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedCommentsEntry, "entityInManagedObjectContext:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PLCloudFeedEntryFetch initWithPredicate:entity:](v21, "initWithPredicate:entity:", v10, v22);

      objc_msgSend(a1, "predicateIncludingOnlyAssetsAddedByOthers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = [PLCloudFeedEntryFetch alloc];
      +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedAssetsEntry, "entityInManagedObjectContext:", v6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PLCloudFeedEntryFetch initWithPredicate:entity:](v23, "initWithPredicate:entity:", v16, v24);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(noindex:(entryTypeNumber) = %d) OR (noindex:(entryTypeNumber) = %d)"), 5, 6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = [PLCloudFeedEntryFetch alloc];
      +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[PLCloudFeedEntryFetch initWithPredicate:entity:](v25, "initWithPredicate:entity:", v20, v26);

      v32[0] = v15;
      v32[1] = v19;
      v32[2] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v28);

LABEL_8:
      goto LABEL_11;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryTypeNumber != %d) AND (entryTypeNumber != %d)"), 4, 7);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v10 = (PLCloudFeedEntryFetch *)v12;
      v29 = [PLCloudFeedEntryFetch alloc];
      +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PLCloudFeedEntryFetch initWithPredicate:entity:](v29, "initWithPredicate:entity:", v10, v30);

      objc_msgSend(v7, "addObject:", v15);
LABEL_11:

LABEL_12:
      break;
    default:
      break;
  }

  return v7;
}

+ (id)recentEntriesInLibrary:(id)a3 earliestDate:(id)a4 latestDate:(id)a5 limit:(unint64_t)a6 filter:(int64_t)a7 sortDescriptors:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v37 = a4;
  v14 = a5;
  v15 = a8;
  v16 = v13;
  objc_msgSend(v13, "managedObjectContext");
  v17 = objc_claimAutoreleasedReturnValue();
  if (a6 <= 0x64)
    v18 = 100;
  else
    v18 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18);
  v34 = (void *)v17;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudFeedEntry fetchesForFilter:inManagedObjectContext:](PLCloudFeedEntry, "fetchesForFilter:inManagedObjectContext:", a7, v17);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v23, "predicate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "entity");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCloudFeedEntry _recentEntriesInLibrary:forEntity:usingPredicate:earliestDate:latestDate:limit:sortDescriptors:](PLCloudFeedEntry, "_recentEntriesInLibrary:forEntity:usingPredicate:earliestDate:latestDate:limit:sortDescriptors:", v16, v25, v24, v37, v14, a6, v15);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26 && objc_msgSend(v26, "count"))
          objc_msgSend(v35, "addObjectsFromArray:", v27);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v20);
  }
  if ((unint64_t)objc_msgSend(obj, "count") < 2)
  {
    v29 = v35;
  }
  else
  {
    v28 = v15;
    v29 = v35;
    if (!v28)
    {
      +[PLCloudFeedEntry entriesSortDescriptorsAscending:](PLCloudFeedEntry, "entriesSortDescriptorsAscending:", 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v35, "sortUsingDescriptors:", v28);
    if (a6 && objc_msgSend(v35, "count") > a6)
    {
      objc_msgSend(v35, "subarrayWithRange:", 0, a6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "mutableCopy");

      v29 = (void *)v31;
    }

  }
  v32 = (void *)objc_msgSend(v29, "copy");

  return v32;
}

+ (id)_recentEntriesInLibrary:(id)a3 forEntity:(id)a4 usingPredicate:(id)a5 earliestDate:(id)a6 latestDate:(id)a7 limit:(unint64_t)a8 sortDescriptors:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  id v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(v14, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEntity:", v15);
  v46 = v14;
  v44 = v17;
  v45 = v16;
  v43 = v18;
  if (v17 && v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryDate > %@) AND (entryDate <= %@)"), v17, v18);
  }
  else if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryDate > %@)"), v17, v40);
  }
  else
  {
    if (!v18)
    {
      v22 = 0;
      v24 = v16 != 0;
      v23 = 1;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryDate <= %@)"), v18, v40);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;
  v24 = v16 != 0;
  if (!v16 && v22)
  {
    v25 = v22;
    v41 = v25;
    goto LABEL_20;
  }
LABEL_12:
  v41 = v22;
  if (v24 && v23)
  {
    v25 = v16;
    if (!v25)
    {
LABEL_21:
      if (!a8)
        goto LABEL_23;
      goto LABEL_22;
    }
LABEL_20:
    objc_msgSend(v20, "setPredicate:", v25);
    goto LABEL_21;
  }
  v26 = !v24;
  if (!v22)
    v26 = 1;
  if ((v26 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0CB3528];
    v55[0] = v22;
    v55[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "andPredicateWithSubpredicates:", v28);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_21;
    goto LABEL_20;
  }
  v25 = 0;
  if (a8)
LABEL_22:
    objc_msgSend(v20, "setFetchLimit:", a8);
LABEL_23:
  v42 = v25;
  v29 = v19;
  v30 = v29;
  if (!v29)
  {
    +[PLCloudFeedEntry entriesSortDescriptorsAscending:](PLCloudFeedEntry, "entriesSortDescriptorsAscending:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "setSortDescriptors:", v30);
  objc_msgSend(v20, "setRelationshipKeyPathsForPrefetching:", &unk_1E3764310);
  v51 = 0;
  objc_msgSend(v21, "executeFetchRequest:error:", v20, &v51);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v51;
  if (!v31)
  {
    PLCloudFeedGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v32;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "error fetching recent asset entries: %@", buf, 0xCu);
    }

  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v34 = v31;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v48 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(v21, "refreshObject:mergeChanges:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "hasChanges"));
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v36);
  }

  return v34;
}

+ (id)recentAssetsEntriesInLibrary:(id)a3 limit:(int64_t)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C97B48];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedAssetsEntry, "entityInManagedObjectContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEntity:", v9);

  objc_msgSend(v7, "setFetchLimit:", a4);
  +[PLCloudFeedEntry entriesSortDescriptorsAscending:](PLCloudFeedEntry, "entriesSortDescriptorsAscending:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);
  v15 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v7, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (!v11)
  {
    PLCloudFeedGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "error fetching recent asset entries: %@", buf, 0xCu);
    }

  }
  return v11;
}

+ (id)firstEntryWithType:(int64_t)a3 albumGUID:(id)a4 inLibrary:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0C97B48];
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v8, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEntity:", v12);

  objc_msgSend(v10, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entryTypeNumber = %d) AND (entryAlbumGUID = %@)"), a3, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v13);
  v19 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v10, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  if (v14)
  {
    objc_msgSend(v14, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLCloudFeedGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "error fetching recent asset entries: %@", buf, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)allEntriesInManagedObjectContext:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C97B48];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  +[PLManagedObject entityInManagedObjectContext:](PLCloudFeedEntry, "entityInManagedObjectContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntity:", v6);

  objc_msgSend(v5, "setFetchBatchSize:", 100);
  +[PLCloudFeedEntry entriesSortDescriptorsAscending:](PLCloudFeedEntry, "entriesSortDescriptorsAscending:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);
  v12 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (!v8)
  {
    PLCloudFeedGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "error fetching all entries: %@", buf, 0xCu);
    }

  }
  return v8;
}

+ (id)entryWithURIRepresentation:(id)a3 inLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(a4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectIDForURIRepresentation:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "objectWithID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)entityName
{
  return CFSTR("CloudFeedEntry");
}

@end

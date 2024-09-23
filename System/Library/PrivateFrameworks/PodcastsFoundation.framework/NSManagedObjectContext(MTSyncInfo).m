@implementation NSManagedObjectContext(MTSyncInfo)

- (uint64_t)currentSyncAnchorRevision
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(a1, "_largestRevisionForRevisionProperty:", CFSTR("updateRevision"));
  result = objc_msgSend(a1, "_largestRevisionForRevisionProperty:", CFSTR("artworkUpdateRevision"));
  if (v2 > result)
    return v2;
  return result;
}

- (uint64_t)allOrderedSyncInfoSinceRevision:()MTSyncInfo
{
  return objc_msgSend(a1, "_allOrderedSyncInfoSinceRevision:revisionProperty:", a3, CFSTR("updateRevision"));
}

- (uint64_t)allOrderedSyncInfoWithArtworkUpdatesSinceRevision:()MTSyncInfo
{
  return objc_msgSend(a1, "_allOrderedSyncInfoSinceRevision:revisionProperty:", a3, CFSTR("artworkUpdateRevision"));
}

- (id)syncInfosByUuids:()MTSyncInfo
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("(%K in %@)"), CFSTR("uuid"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:", CFSTR("MTSyncInfo"), v6, MEMORY[0x1E0C9AA60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_allOrderedSyncInfoSinceRevision:()MTSyncInfo revisionProperty:
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K > %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:", CFSTR("MTSyncInfo"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (uint64_t)_largestRevisionForRevisionProperty:()MTSyncInfo
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "truePredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTSyncInfo"), v5, v7, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "valueForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end

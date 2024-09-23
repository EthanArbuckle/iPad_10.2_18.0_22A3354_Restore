@implementation PXPhotosResultRecord

- (id)includedOids
{
  return 0;
}

- (id)excludedOids
{
  return 0;
}

- (id)curatedOids
{
  return 0;
}

- (id)manualOrderUUIDs
{
  return 0;
}

- (id)exposedFetchResult
{
  return 0;
}

- (id)curatedRefetchCondition
{
  return 0;
}

- (id)fetchResult
{
  return 0;
}

- (id)curatedFetchResult
{
  return 0;
}

- (id)keyAssetsFetchResult
{
  return 0;
}

- (int64_t)keyAssetIndex
{
  return -1;
}

- (BOOL)wantsCuration
{
  return 0;
}

- (int64_t)curationLength
{
  return 0;
}

- (BOOL)isCurated
{
  return 0;
}

- (BOOL)reverseSortOrder
{
  return 0;
}

- (BOOL)ensureKeyAssetAtBeginning
{
  return 0;
}

- (id)filteredFetchResult
{
  return 0;
}

- (id)inclusionPredicate
{
  return 0;
}

- (PHFetchResult)exposedFetchResultBeforeFiltering
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;
  id v17;
  objc_super v18;

  v16 = (id)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosResultRecord;
  -[PXPhotosResultRecord description](&v18, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultRecord fetchResult](self, "fetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultRecord curatedFetchResult](self, "curatedFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultRecord keyAssetsFetchResult](self, "keyAssetsFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultRecord includedOids](self, "includedOids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultRecord excludedOids](self, "excludedOids");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPhotosResultRecord wantsCuration](self, "wantsCuration"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  if (-[PXPhotosResultRecord reverseSortOrder](self, "reverseSortOrder"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  -[PXPhotosResultRecord filteredFetchResult](self, "filteredFetchResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultRecord exposedFetchResult](self, "exposedFetchResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ fetchResult:%@ curatedFetchResult:%@ keyAssetsFetchResult:%@ includedOids:%@ excludedOids:%@ wantsCuration:%@ reverseSortOrder:%@ filteredFetchResult:%@ exposedFetchResult:%@>"), v15, v3, v4, v5, v6, v7, v9, v11, v12, v13);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end

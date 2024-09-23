@implementation QLCacheFileProviderFileIdentifier(SQLRequests)

- (uint64_t)statementToFindCacheIdInDatabase:()SQLRequests
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "prepareStatement:", "SELECT rowid, version FROM provider_files WHERE fileProviderId=? AND itemId=?");
  if (v5)
  {
    objc_msgSend(a1, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "providerDomainID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bindObject:atIndex:inStatement:", v7, 1, v5);

    objc_msgSend(a1, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bindObject:atIndex:inStatement:", v9, 2, v5);

  }
  return v5;
}

+ (uint64_t)cacheIdFromRowId:()SQLRequests
{
  return a3;
}

+ (uint64_t)whereClauseToFindCacheId
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fileProviderId=? AND itemId=?"));
}

+ (const)queryStringToFindCacheIds
{
  return CFSTR("SELECT rowid, fileProviderId, itemId, version FROM provider_files WHERE ");
}

- (void)bindInFindCacheIdStatement:()SQLRequests database:startingAtIndex:gettingNextIndex:
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a4;
  objc_msgSend(a1, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "providerDomainID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindObject:atIndex:inStatement:", v12, a5, a3);

  objc_msgSend(a1, "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindObject:atIndex:inStatement:", v14, (a5 + 1), a3);

  if (a6)
    *a6 = a5 + 2;
}

+ (const)tableName
{
  return CFSTR("provider_files");
}

+ (uint64_t)rowIdFromCacheId:()SQLRequests
{
  return a3;
}

+ (uint64_t)removeFromDatabase:()SQLRequests fileWithCacheId:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "prepareStatement:", "DELETE FROM provider_files WHERE rowid=?");
  v10 = v6;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v5, "bindUnsignedLongLong:atIndex:inStatement:", a4, 1, v6);
    v8 = objc_msgSend(v5, "stepStatement:", v7);
    objc_msgSend(v5, "finalizeStatement:", &v10);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end

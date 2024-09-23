@implementation QLCacheBasicFileIdentifier(SQLRequests)

- (void)bindInFindCacheIdStatement:()SQLRequests database:startingAtIndex:gettingNextIndex:
{
  id v10;

  v10 = a4;
  objc_msgSend(v10, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(a1, "fileId"), a5, a3);

  if (a6)
    *a6 = a5 + 1;
}

+ (uint64_t)whereClauseToFindCacheId
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fileId=?"));
}

- (uint64_t)statementToFindCacheIdInDatabase:()SQLRequests
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "prepareStatement:", "SELECT rowid, version FROM basic_files WHERE fileId=?");
  if (v5)
    objc_msgSend(v4, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(a1, "fileId"), 1, v5);

  return v5;
}

+ (const)queryStringToFindCacheIds
{
  return CFSTR("SELECT rowid, fileId, fsid, version FROM basic_files WHERE ");
}

+ (unint64_t)cacheIdFromRowId:()SQLRequests
{
  return a3 | 0x8000000000000000;
}

+ (uint64_t)rowIdFromCacheId:()SQLRequests
{
  return a3 & 0x7FFFFFFFFFFFFFFFLL;
}

+ (const)tableName
{
  return CFSTR("basic_files");
}

+ (uint64_t)removeFromDatabase:()SQLRequests fileWithCacheId:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "prepareStatement:", "DELETE FROM basic_files WHERE rowid=?");
  v10 = v6;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v5, "bindUnsignedLongLong:atIndex:inStatement:", a4 & 0x7FFFFFFFFFFFFFFFLL, 1, v6);
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

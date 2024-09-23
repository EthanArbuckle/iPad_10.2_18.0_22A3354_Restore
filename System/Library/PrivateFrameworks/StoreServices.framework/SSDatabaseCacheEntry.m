@implementation SSDatabaseCacheEntry

- (SSDatabaseCacheEntry)initWithLookupKey:(id)a3 inDatabase:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend((id)objc_opt_class(), "_fetchPersistentID:inDatabase:", a3, a4);
  if (v6)
    return -[SSSQLiteEntity initWithPersistentID:inDatabase:](self, "initWithPersistentID:inDatabase:", v6, a4);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDatabaseCacheEntry;
  -[SSDatabaseCacheEntry dealloc](&v3, sel_dealloc);
}

- (void)setPersistentCache:(id)a3
{
  SSPersistentCache *persistentCache;

  persistentCache = self->_persistentCache;
  if (persistentCache != a3)
  {

    self->_persistentCache = (SSPersistentCache *)a3;
  }
}

- (id)dataBlob:(BOOL *)a3
{
  id result;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  result = -[SSSQLiteEntity persistentID](self, "persistentID");
  if (result)
  {
    v13[0] = SSDatabaseCacheEntryLookupKey;
    v13[1] = SSDatabaseCacheEntryDataBlob;
    v13[2] = SSDatabaseCacheEntryDataBlobSize;
    v13[3] = SSDatabaseCacheEntryDateExpired;
    v13[4] = SSDatabaseCacheEntryDateRetired;
    -[SSSQLiteEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v9, v13, 5);
    result = (id)objc_msgSend(v9, "length");
    if (result)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v7 = (uint64_t)v6;
      if (objc_msgSend(v12, "longLongValue") <= (uint64_t)v6)
      {
        if (a3)
          *a3 = 1;
        -[SSSQLiteEntity deleteFromDatabase](self, "deleteFromDatabase");
        return 0;
      }
      else
      {
        v8 = objc_msgSend(v11, "longLongValue");
        if (a3)
          *a3 = v8 <= v7;
        result = v10;
        if (!v10)
          return -[SSPersistentCache dataForKey:](self->_persistentCache, "dataForKey:", v9);
      }
    }
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ : %p> - Persistent ID: %llu"), objc_opt_class(), self, -[SSSQLiteEntity persistentID](self, "persistentID"));
}

+ (unint64_t)_fetchPersistentID:(id)a3 inDatabase:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (objc_msgSend(a3, "length"))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ? LIMIT 1;"),
                   SSDatabaseCacheEntryPID,
                   objc_msgSend((id)objc_opt_class(), "databaseTable"),
                   SSDatabaseCacheEntryLookupKey);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__SSDatabaseCacheEntry__fetchPersistentID_inDatabase___block_invoke;
    v10[3] = &unk_1E47BE980;
    v10[4] = a3;
    v10[5] = a4;
    v10[6] = &v11;
    objc_msgSend(a4, "prepareStatementForSQL:cache:usingBlock:", v7, 1, v10);

  }
  v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __54__SSDatabaseCacheEntry__fetchPersistentID_inDatabase___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;

  sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"), -1, 0);
  result = objc_msgSend(*(id *)(a1 + 40), "statementHasRowAfterStepping:", a2);
  if ((_DWORD)result)
  {
    result = sqlite3_column_type(a2, 0);
    if ((_DWORD)result == 1)
    {
      result = sqlite3_column_int64(a2, 0);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    }
  }
  return result;
}

+ (id)databaseTable
{
  return CFSTR("database_cache");
}

+ (id)allPropertyKeys
{
  if (allPropertyKeys_onceToken_1 != -1)
    dispatch_once(&allPropertyKeys_onceToken_1, &__block_literal_global_37);
  return (id)allPropertyKeys__allProperties;
}

id __39__SSDatabaseCacheEntry_allPropertyKeys__block_invoke()
{
  id result;
  _QWORD v1[9];

  v1[8] = *MEMORY[0x1E0C80C00];
  v1[0] = SSDatabaseCacheEntryPID;
  v1[1] = SSDatabaseCacheEntryLookupKey;
  v1[2] = SSDatabaseCacheEntryDataBlob;
  v1[3] = SSDatabaseCacheEntryDataBlobSize;
  v1[4] = SSDatabaseCacheEntryDateInserted;
  v1[5] = SSDatabaseCacheEntryDateExpired;
  v1[6] = SSDatabaseCacheEntryDateRetired;
  v1[7] = SSDatabaseCacheEntryUserInfo;
  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 8);
  allPropertyKeys__allProperties = (uint64_t)result;
  return result;
}

@end

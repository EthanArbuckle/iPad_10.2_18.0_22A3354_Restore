@implementation QLCacheBasicVersionedFileIdentifier(SQLRequests)

- (uint64_t)initWithSteppedStatement:()SQLRequests database:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;

  v6 = a4;
  v7 = objc_msgSend(v6, "unsignedLongLongFromColumn:inStatement:", 1, a3);
  v8 = objc_msgSend(v6, "unsignedLongLongFromColumn:inStatement:", 2, a3);
  v9 = (void *)objc_msgSend(v6, "newDataFromColumn:inStatement:copyBytes:", 3, a3, 0);

  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[QLCacheBasicVersionedFileIdentifier(SQLRequests) initWithSteppedStatement:database:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD3270]), "initWithFileId:fsid:", v7, __ROR8__(v8, 32));
  v20 = objc_msgSend(a1, "initWithFileIdentifier:version:", v19, v10);

  return v20;
}

- (uint64_t)statementToInsertIntoDatabase:()SQLRequests
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(a1, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "prepareStatement:", "INSERT INTO basic_files (fileId, fsid, version) VALUES (?, ?, ?)");
  if (v9)
  {
    v10 = __ROR8__(objc_msgSend(v8, "fsid"), 32);
    objc_msgSend(v4, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v8, "fileId"), 1, v9);
    objc_msgSend(v4, "bindUnsignedLongLong:atIndex:inStatement:", v10, 2, v9);
    objc_msgSend(v4, "bindObject:atIndex:inStatement:", v7, 3, v9);
  }

  return v9;
}

- (uint64_t)statementToUpdateRecordWithCacheIdentifier:()SQLRequests inDatabase:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(a1, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "prepareStatement:", "UPDATE basic_files SET fileId=?, fsid=?, version=? WHERE rowid=?");
  objc_msgSend(a1, "fileIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v13 = __ROR8__(objc_msgSend(v11, "fsid"), 32);
    objc_msgSend(v6, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v12, "fileId"), 1, v10);
    objc_msgSend(v6, "bindUnsignedLongLong:atIndex:inStatement:", v13, 2, v10);
    objc_msgSend(v6, "bindObject:atIndex:inStatement:", v9, 3, v10);
    objc_msgSend(v6, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(MEMORY[0x1E0CD3270], "rowIdFromCacheId:", a3), 4, v10);
  }

  return v10;
}

- (void)initWithSteppedStatement:()SQLRequests database:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D54AE000, a1, a3, "Failed to unarchive version from data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end

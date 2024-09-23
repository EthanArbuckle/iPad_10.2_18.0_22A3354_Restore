@implementation _PASSqliteKeyValueCursor

+ (const)sqliteCreateTableStatement
{
  return "CREATE TABLE x(key PRIMARY KEY NOT NULL, value, pointer HIDDEN NOT NULL) WITHOUT ROWID";
}

+ (BOOL)hasKey
{
  return 1;
}

- (BOOL)currentIndexEof
{
  void *v2;
  BOOL v3;

  -[_PASSqliteKeyValueCursor currentIndexedKey](self, "currentIndexedKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)outputKey
{
  void *v4;
  void *v5;
  void *v7;

  v4 = (void *)MEMORY[0x1A1AFDC98]();
  -[_PASSqliteKeyValueCursor currentIndexedKey](self, "currentIndexedKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteCollections.m"), 1152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputKey != nil"));

  }
  return v5;
}

@end

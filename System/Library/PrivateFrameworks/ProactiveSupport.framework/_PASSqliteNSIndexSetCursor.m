@implementation _PASSqliteNSIndexSetCursor

- (void)setCollection:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AFDC98]();
  v6.receiver = self;
  v6.super_class = (Class)_PASSqliteNSIndexSetCursor;
  -[_PASSqliteCollectionsCursor setCollection:](&v6, sel_setCollection_, v4);
  -[_PASSqliteRowIdIndexSetCursor setIndexSet:](self, "setIndexSet:", v4);
  objc_autoreleasePoolPop(v5);

}

+ (const)sqliteMethodName
{
  return "_pas_nsindexset";
}

+ (double)baseEstimatedRows
{
  return 200.0;
}

+ (double)baseEstimatedCost
{
  return 10.0;
}

- (id)currentIndexedValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_PASSqliteRowIdIndexSetCursor currentIndexedRowId](self, "currentIndexedRowId"));
}

+ (const)sqliteCreateTableStatement
{
  return "CREATE TABLE x(value INTEGER PRIMARY KEY ASC NOT NULL, pointer HIDDEN NOT NULL)";
}

@end

@implementation _PASSqliteRowIdCursor

- (BOOL)currentIndexEof
{
  return -[_PASSqliteRowIdCursor currentIndexedRowId](self, "currentIndexedRowId") == 0x7FFFFFFFFFFFFFFFLL;
}

+ (const)sqliteCreateTableStatement
{
  return "CREATE TABLE x(value, pointer HIDDEN NOT NULL)";
}

+ (BOOL)hasRowId
{
  return 1;
}

- (unint64_t)outputRowId
{
  void *v4;
  unint64_t v5;

  -[_PASSqliteCollectionsCursor stayOnOrStepToOutputRow](self);
  if (-[_PASSqliteRowIdCursor currentIndexEof](self, "currentIndexEof"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = (void *)MEMORY[0x1A1AFDC98]();
  v5 = -[_PASSqliteRowIdCursor currentIndexedRowId](self, "currentIndexedRowId");
  objc_autoreleasePoolPop(v4);
  return v5;
}

@end

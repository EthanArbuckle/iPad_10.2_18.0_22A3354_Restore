@implementation _PASSqliteNSOrderedSetCursor

- (id)currentIndexedValue
{
  void *v3;
  void *v4;

  -[_PASSqliteCollectionsCursor collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", -[_PASSqliteRowIdIndexSetCursor currentIndexedRowId](self, "currentIndexedRowId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setCollection:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PASSqliteNSOrderedSetCursor;
  v4 = a3;
  -[_PASSqliteCollectionsCursor setCollection:](&v8, sel_setCollection_, v4);
  v5 = objc_alloc(MEMORY[0x1E0CB36B8]);
  v6 = objc_msgSend(v4, "count", v8.receiver, v8.super_class);

  v7 = (void *)objc_msgSend(v5, "initWithIndexesInRange:", 0, v6);
  -[_PASSqliteRowIdIndexSetCursor setIndexSet:](self, "setIndexSet:", v7);

}

- (void)applyConstraint:(int)a3 withArgument:(id)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v6 = a4;
  if (a3 == 71)
  {
    v13 = v6;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = 1;
    v6 = (id)v7;
  }
  else
  {
    v8 = a3 == 2;
    if (a3 != 72 && a3 != 2)
      goto LABEL_12;
  }
  v14 = v6;
  if (!v6)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = !v8;
  if (v14 != v9)
    v10 = 1;
  if ((v10 & 1) != 0
    && (-[_PASSqliteCollectionsCursor collection](self, "collection"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "indexOfObject:", v14),
        v11,
        v12 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[_PASSqliteRowIdIndexSetCursor matchOneRow:](self, "matchOneRow:", v12);
  }
  else
  {
LABEL_10:
    -[_PASSqliteRowIdIndexSetCursor matchNoRows](self, "matchNoRows");
  }
  v6 = v14;
LABEL_12:

}

+ (const)sqliteCreateTableStatement
{
  return "CREATE TABLE x(value UNIQUE, pointer HIDDEN NOT NULL)";
}

+ (const)sqliteMethodName
{
  return "_pas_nsorderedset";
}

+ (id)planningInfoForValueConstraint:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 - 71) < 2 || a3 == 2)
    return -[_PASSqliteCollectionsConstraintPlanInfo initWithEstimatedRows:estimatedCost:unique:omit:]([_PASSqliteCollectionsConstraintPlanInfo alloc], "initWithEstimatedRows:estimatedCost:unique:omit:", 1, 1, 0.00001, 0.00001, v3, v4);
  else
    return 0;
}

@end

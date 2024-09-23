@implementation _PASSqliteCollectionsCursor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_collection, 0);
}

+ (BOOL)hasKey
{
  return 0;
}

- (_PASSqliteCollectionsCursor)init
{
  _PASSqliteCollectionsCursor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PASSqliteCollectionsCursor;
  result = -[_PASSqliteCollectionsCursor init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_foundOutputRow = 0;
  return result;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong(&self->_collection, a3);
}

+ (double)baseEstimatedRows
{
  return 20.0;
}

+ (double)baseEstimatedCost
{
  return 1.0;
}

- (_BYTE)outputValue
{
  _BYTE *v1;
  void *v2;
  void *v4;

  v1 = a1;
  if (a1)
  {
    -[_PASSqliteCollectionsCursor stayOnOrStepToOutputRow](a1);
    if (v1[9])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_outputValue, v1, CFSTR("_PASSqliteCollections.m"), 389, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_eof"));

    }
    v2 = (void *)MEMORY[0x1A1AFDC98]();
    objc_msgSend(v1, "currentIndexedValue");
    v1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v2);
  }
  return v1;
}

- (void)stayOnOrStepToOutputRow
{
  void *v2;
  char v3;
  void *v4;

  if (a1)
  {
    while (!a1[9] && !a1[8])
    {
      a1[8] = 0;
      v2 = (void *)MEMORY[0x1A1AFDC98]();
      if (objc_msgSend(a1, "currentIndexEof"))
      {
        a1[9] = 1;
        objc_autoreleasePoolPop(v2);
        return;
      }
      v3 = objc_msgSend(a1, "currentIndexedRowSatisfiesConstraints");
      objc_autoreleasePoolPop(v2);
      if ((v3 & 1) != 0)
        return;
      v4 = (void *)MEMORY[0x1A1AFDC98]();
      objc_msgSend(a1, "stepIndexedRow");
      objc_autoreleasePoolPop(v4);
    }
  }
}

- (BOOL)currentIndexedRowSatisfiesConstraints
{
  return 1;
}

- (id)collection
{
  return self->_collection;
}

- (unint64_t)outputRowId
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)outputKey
{
  return 0;
}

+ (BOOL)hasRowId
{
  return 0;
}

+ (id)planningInfoForValueConstraint:(int)a3
{
  return 0;
}

+ (id)planningInfoForRowIdConstraint:(int)a3
{
  return 0;
}

+ (id)planningInfoForKeyConstraint:(int)a3
{
  return 0;
}

+ (BOOL)canOrderByValue:(BOOL)a3
{
  return 0;
}

+ (BOOL)canOrderByRowId:(BOOL)a3
{
  return 0;
}

+ (BOOL)canOrderByKey:(BOOL)a3
{
  return 0;
}

@end

@implementation _PASSqliteNSArrayCursor

- (void)setCollection:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PASSqliteNSArrayCursor;
  v4 = a3;
  -[_PASSqliteCollectionsCursor setCollection:](&v8, sel_setCollection_, v4);
  v5 = objc_alloc(MEMORY[0x1E0CB36B8]);
  v6 = objc_msgSend(v4, "count", v8.receiver, v8.super_class);

  v7 = (void *)objc_msgSend(v5, "initWithIndexesInRange:", 0, v6);
  -[_PASSqliteRowIdIndexSetCursor setIndexSet:](self, "setIndexSet:", v7);

}

- (_PASSqliteNSArrayCursor)init
{
  _PASSqliteNSArrayCursor *v2;
  _PASSqliteNSArrayCursor *v3;
  id equalTo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PASSqliteNSArrayCursor;
  v2 = -[_PASSqliteRowIdIndexSetCursor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    equalTo = v2->_equalTo;
    v2->_equalTo = 0;

  }
  return v3;
}

+ (const)sqliteMethodName
{
  return "_pas_nsarray";
}

+ (id)planningInfoForValueConstraint:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 72 || a3 == 2)
    return -[_PASSqliteCollectionsConstraintPlanInfo initWithEstimatedRows:estimatedCost:unique:omit:]([_PASSqliteCollectionsConstraintPlanInfo alloc], "initWithEstimatedRows:estimatedCost:unique:omit:", 0, 1, 0.00001, 0.95, v3, v4);
  else
    return 0;
}

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

- (BOOL)currentIndexedRowSatisfiesConstraints
{
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PASSqliteNSArrayCursor;
  if (!-[_PASSqliteCollectionsCursor currentIndexedRowSatisfiesConstraints](&v6, sel_currentIndexedRowSatisfiesConstraints))return 0;
  if (!self->_equalTo)
    return 1;
  -[_PASSqliteNSArrayCursor currentIndexedValue](self, "currentIndexedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", self->_equalTo);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_equalTo, 0);
}

- (void)applyConstraint:(int)a3 withArgument:(id)a4
{
  id v7;
  void *v8;
  id v9;
  char v10;
  id v11;

  v7 = a4;
  v8 = v7;
  if (a3 == 72 || a3 == 2)
  {
    v11 = v7;
    if (!v7)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (a3 == 2 && v9 == v11)
      goto LABEL_8;
    if (!self->_equalTo)
    {
      objc_storeStrong(&self->_equalTo, a4);
      goto LABEL_9;
    }
    v10 = objc_msgSend(self->_equalTo, "isEqual:", v11);
    v8 = v11;
    if ((v10 & 1) == 0)
    {
LABEL_8:
      -[_PASSqliteRowIdIndexSetCursor matchNoRows](self, "matchNoRows");
LABEL_9:
      v8 = v11;
    }
  }

}

@end

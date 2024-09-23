@implementation _PASSqliteNSSetCursor

- (void)setCollection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id currentValue;
  objc_super v9;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      v6 = (void *)MEMORY[0x1A1AFDC98]();
      objc_msgSend(v5, "anyObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      currentValue = self->_currentValue;
      self->_currentValue = v7;

      objc_autoreleasePoolPop(v6);
    }
    else
    {
      objc_storeStrong((id *)&self->_set, a3);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)_PASSqliteNSSetCursor;
  -[_PASSqliteCollectionsCursor setCollection:](&v9, sel_setCollection_, v5);

}

- (void)applyConstraint:(int)a3 withArgument:(id)a4
{
  id v6;
  void *v7;
  id v8;
  char v9;
  id currentValue;
  NSSet *set;
  _BOOL4 v12;
  NSSet *v13;
  id v14;
  void *v15;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 72:
      goto LABEL_4;
    case 71:
      v15 = v6;
      set = self->_set;
      self->_set = 0;

      currentValue = self->_currentValue;
      self->_currentValue = 0;
      goto LABEL_10;
    case 2:
LABEL_4:
      v8 = self->_currentValue;
      v15 = v7;
      if (v8)
      {
        v9 = objc_msgSend(v8, "isEqual:", v7);
        v7 = v15;
        if ((v9 & 1) == 0)
        {
          currentValue = self->_currentValue;
          self->_currentValue = 0;
LABEL_10:

          v7 = v15;
        }
      }
      else
      {
        v12 = -[NSSet containsObject:](self->_set, "containsObject:", v7);
        v13 = self->_set;
        self->_set = 0;

        v7 = v15;
        if (v12)
        {
          v14 = v15;
          currentValue = self->_currentValue;
          self->_currentValue = v14;
          goto LABEL_10;
        }
      }
      break;
  }

}

- (void)finalizeConstraints
{
  NSSet *set;
  NSEnumerator *v4;
  NSEnumerator *valuesEnumerator;

  set = self->_set;
  if (set)
  {
    -[NSSet objectEnumerator](set, "objectEnumerator");
    v4 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    valuesEnumerator = self->_valuesEnumerator;
    self->_valuesEnumerator = v4;

    -[_PASSqliteNSSetCursor stepIndexedRow](self, "stepIndexedRow");
  }
}

- (BOOL)currentIndexEof
{
  return self->_currentValue == 0;
}

- (id)currentIndexedValue
{
  return self->_currentValue;
}

- (BOOL)currentIndexedRowSatisfiesConstraints
{
  id currentValue;
  id v5;
  void *v7;
  objc_super v8;

  currentValue = self->_currentValue;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (currentValue == v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteCollections.m"), 1095, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_currentValue != [NSNull null]"));

  }
  v8.receiver = self;
  v8.super_class = (Class)_PASSqliteNSSetCursor;
  return -[_PASSqliteCollectionsCursor currentIndexedRowSatisfiesConstraints](&v8, sel_currentIndexedRowSatisfiesConstraints);
}

- (void)stepIndexedRow
{
  void *v3;
  id currentValue;

  -[NSEnumerator nextObject](self->_valuesEnumerator, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  currentValue = self->_currentValue;
  self->_currentValue = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesEnumerator, 0);
  objc_storeStrong(&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

+ (const)sqliteCreateTableStatement
{
  return "CREATE TABLE x(value PRIMARY KEY NOT NULL, pointer HIDDEN NOT NULL) WITHOUT ROWID";
}

+ (const)sqliteMethodName
{
  return "_pas_nsset";
}

+ (id)planningInfoForValueConstraint:(int)a3
{
  _PASSqliteCollectionsConstraintPlanInfo *v3;
  _PASSqliteCollectionsConstraintPlanInfo *v4;
  double v5;
  double v6;
  uint64_t v7;

  v3 = 0;
  if (a3 > 70)
  {
    if (a3 == 71)
    {
      v4 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
      v5 = 0.0;
      v6 = 0.0;
      goto LABEL_9;
    }
    if (a3 != 72)
      return v3;
LABEL_7:
    v4 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
    v5 = 0.00001;
    v6 = 0.00001;
LABEL_9:
    v7 = 1;
    goto LABEL_10;
  }
  if (a3 == 2)
    goto LABEL_7;
  if (a3 == 70)
  {
    v4 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
    v5 = 1.0;
    v6 = 1.0;
    v7 = 0;
LABEL_10:
    v3 = -[_PASSqliteCollectionsConstraintPlanInfo initWithEstimatedRows:estimatedCost:unique:omit:](v4, "initWithEstimatedRows:estimatedCost:unique:omit:", v7, 1, v5, v6);
  }
  return v3;
}

@end

@implementation _PASSqliteRowIdIndexSetCursor

- (void)finalizeConstraints
{
  NSIndexSet *indexSet;
  unint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PASSqliteRowIdIndexSetCursor;
  -[_PASSqliteCollectionsCursor finalizeConstraints](&v5, sel_finalizeConstraints);
  indexSet = self->_indexSet;
  if (self->_isDescending)
    v4 = -[NSIndexSet lastIndex](indexSet, "lastIndex");
  else
    v4 = -[NSIndexSet firstIndex](indexSet, "firstIndex");
  self->_currentIndex = v4;
}

- (_PASSqliteRowIdIndexSetCursor)init
{
  _PASSqliteRowIdIndexSetCursor *v2;
  _PASSqliteRowIdIndexSetCursor *v3;
  uint64_t v4;
  NSIndexSet *indexSet;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PASSqliteRowIdIndexSetCursor;
  v2 = -[_PASSqliteCollectionsCursor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentIndex = 0;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v4 = objc_claimAutoreleasedReturnValue();
    indexSet = v3->_indexSet;
    v3->_indexSet = (NSIndexSet *)v4;

    v3->_isDescending = 0;
  }
  return v3;
}

- (void)setIndexSet:(id)a3
{
  NSMutableIndexSet *mutableIndexSet;
  id v6;

  objc_storeStrong((id *)&self->_indexSet, a3);
  v6 = a3;
  mutableIndexSet = self->_mutableIndexSet;
  self->_mutableIndexSet = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableIndexSet, 0);
  objc_storeStrong((id *)&self->_indexSet, 0);
}

- (void)stepIndexedRow
{
  _BOOL4 isDescending;
  NSIndexSet *indexSet;
  unint64_t v5;
  unint64_t v6;

  isDescending = self->_isDescending;
  indexSet = self->_indexSet;
  v5 = -[_PASSqliteRowIdIndexSetCursor currentIndexedRowId](self, "currentIndexedRowId");
  if (isDescending)
    v6 = -[NSIndexSet indexLessThanIndex:](indexSet, "indexLessThanIndex:", v5);
  else
    v6 = -[NSIndexSet indexGreaterThanIndex:](indexSet, "indexGreaterThanIndex:", v5);
  self->_currentIndex = v6;
}

- (unint64_t)currentIndexedRowId
{
  return self->_currentIndex;
}

- (NSMutableIndexSet)mutableIndexSet
{
  NSMutableIndexSet *mutableIndexSet;
  NSMutableIndexSet *v4;
  NSMutableIndexSet *v5;

  mutableIndexSet = self->_mutableIndexSet;
  if (!mutableIndexSet)
  {
    v4 = (NSMutableIndexSet *)-[NSIndexSet mutableCopy](self->_indexSet, "mutableCopy");
    v5 = self->_mutableIndexSet;
    self->_mutableIndexSet = v4;

    objc_storeStrong((id *)&self->_indexSet, self->_mutableIndexSet);
    mutableIndexSet = self->_mutableIndexSet;
  }
  return mutableIndexSet;
}

- (void)matchNoRows
{
  NSIndexSet *v3;
  NSIndexSet *indexSet;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v3 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  indexSet = self->_indexSet;
  self->_indexSet = v3;

}

- (void)matchOneRow:(unint64_t)a3
{
  NSIndexSet *v5;
  NSIndexSet *indexSet;

  if (-[NSIndexSet containsIndex:](self->_indexSet, "containsIndex:"))
  {
    if (-[NSIndexSet count](self->_indexSet, "count") >= 2)
    {
      v5 = (NSIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", a3);
      indexSet = self->_indexSet;
      self->_indexSet = v5;

    }
  }
  else
  {
    -[_PASSqliteRowIdIndexSetCursor matchNoRows](self, "matchNoRows");
  }
}

- (void)applyRowIdConstraint:(int)a3 withArgument:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v12 = a4;
  if (a3 > 0x20)
    goto LABEL_10;
  if (((1 << a3) & 0x100010110) == 0)
  {
    if (a3 == 2)
    {
LABEL_13:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_PASSqliteRowIdIndexSetCursor matchOneRow:](self, "matchOneRow:", objc_msgSend(v12, "unsignedIntegerValue"));
        goto LABEL_23;
      }
LABEL_22:
      -[_PASSqliteRowIdIndexSetCursor matchNoRows](self, "matchNoRows");
      goto LABEL_23;
    }
LABEL_10:
    if (a3 != 72)
    {
      if (a3 != 71)
        goto LABEL_23;
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  if (-[NSIndexSet count](self->_indexSet, "count"))
  {
    HIDWORD(v6) = a3;
    LODWORD(v6) = a3 - 4;
    v7 = objc_msgSend(v12, "unsignedIntegerValue");
    switch((v6 >> 2))
    {
      case 0u:
        if (-[NSIndexSet lastIndex](self->_indexSet, "lastIndex") <= v7)
          goto LABEL_22;
        if (-[NSIndexSet firstIndex](self->_indexSet, "firstIndex") <= v7)
        {
          -[_PASSqliteRowIdIndexSetCursor mutableIndexSet](self, "mutableIndexSet");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v10 = v7 + 1;
          v11 = 0;
          goto LABEL_26;
        }
        break;
      case 1u:
        if (-[NSIndexSet firstIndex](self->_indexSet, "firstIndex") > v7)
          goto LABEL_22;
        if (-[NSIndexSet lastIndex](self->_indexSet, "lastIndex") > v7)
        {
          -[_PASSqliteRowIdIndexSetCursor mutableIndexSet](self, "mutableIndexSet");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v11 = v7 + 1;
          v10 = 0x7FFFFFFFFFFFFFFDLL - v7;
          goto LABEL_26;
        }
        break;
      case 3u:
        if (-[NSIndexSet firstIndex](self->_indexSet, "firstIndex") >= v7)
          goto LABEL_22;
        if (-[NSIndexSet lastIndex](self->_indexSet, "lastIndex") >= v7)
        {
          -[_PASSqliteRowIdIndexSetCursor mutableIndexSet](self, "mutableIndexSet");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v10 = 0x7FFFFFFFFFFFFFFELL - v7;
          v11 = v7;
          goto LABEL_26;
        }
        break;
      case 7u:
        if (-[NSIndexSet lastIndex](self->_indexSet, "lastIndex") < v7)
          goto LABEL_22;
        if (-[NSIndexSet firstIndex](self->_indexSet, "firstIndex") < v7)
        {
          -[_PASSqliteRowIdIndexSetCursor mutableIndexSet](self, "mutableIndexSet");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v11 = 0;
          v10 = v7;
LABEL_26:
          objc_msgSend(v8, "removeIndexesInRange:", v11, v10);

        }
        break;
      default:
        break;
    }
  }
LABEL_23:

}

- (void)applyRowIdSort:(BOOL)a3
{
  self->_isDescending = a3;
}

+ (id)planningInfoForRowIdConstraint:(int)a3
{
  _PASSqliteCollectionsConstraintPlanInfo *v4;
  _PASSqliteCollectionsConstraintPlanInfo *v5;
  double v6;
  double v7;
  uint64_t v8;
  _PASSqliteCollectionsConstraintPlanInfo *v9;
  double v10;

  v4 = 0;
  if (a3 > 69)
  {
    switch(a3)
    {
      case 'H':
LABEL_11:
        v9 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
        objc_msgSend(a1, "costFactorForRandomAccess");
        v7 = v10;
        v6 = 0.00001;
        v5 = v9;
LABEL_13:
        v8 = 1;
        goto LABEL_14;
      case 'G':
        v5 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
        v6 = 0.0;
        v7 = 0.0;
        goto LABEL_13;
      case 'F':
        v5 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
        v6 = 1.0;
        v7 = 1.0;
        goto LABEL_9;
    }
  }
  else if (a3 <= 0x20)
  {
    if (((1 << a3) & 0x100010110) != 0)
    {
      v5 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
      v6 = 0.5;
      v7 = 0.5;
LABEL_9:
      v8 = 0;
LABEL_14:
      v4 = -[_PASSqliteCollectionsConstraintPlanInfo initWithEstimatedRows:estimatedCost:unique:omit:](v5, "initWithEstimatedRows:estimatedCost:unique:omit:", v8, 1, v6, v7);
      return v4;
    }
    if (a3 == 2)
      goto LABEL_11;
  }
  return v4;
}

+ (BOOL)canOrderByRowId:(BOOL)a3
{
  return 1;
}

+ (double)costFactorForRandomAccess
{
  return 0.0;
}

@end

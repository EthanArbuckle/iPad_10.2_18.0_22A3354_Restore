@implementation WBSMutableOrderedSet

- (void)addObject:(id)a3
{
  id v4;
  NSMutableOrderedSet *mutableOrderedSet;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  mutableOrderedSet = self->_mutableOrderedSet;
  v10 = v4;
  if (!mutableOrderedSet)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v7 = self->_mutableOrderedSet;
    self->_mutableOrderedSet = v6;

    v4 = v10;
    mutableOrderedSet = self->_mutableOrderedSet;
  }
  if (self->_maximumCount)
  {
    v8 = -[NSMutableOrderedSet count](mutableOrderedSet, "count");
    mutableOrderedSet = self->_mutableOrderedSet;
    if (v8 > self->_maximumCount)
    {
      -[NSMutableOrderedSet removeObjectAtIndex:](mutableOrderedSet, "removeObjectAtIndex:", 0);
      mutableOrderedSet = self->_mutableOrderedSet;
    }
    v4 = v10;
  }
  v9 = -[NSMutableOrderedSet indexOfObject:](mutableOrderedSet, "indexOfObject:", v4);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableOrderedSet addObject:](self->_mutableOrderedSet, "addObject:", v10);
  else
    -[WBSMutableOrderedSet _moveObjectAtIndexToLast:](self, "_moveObjectAtIndexToLast:", v9);

}

- (WBSMutableOrderedSet)initWithMaximumCount:(unint64_t)a3
{
  WBSMutableOrderedSet *v4;
  WBSMutableOrderedSet *v5;
  WBSMutableOrderedSet *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSMutableOrderedSet;
  v4 = -[WBSMutableOrderedSet init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maximumCount = a3;
    v6 = v4;
  }

  return v5;
}

- (NSArray)array
{
  void *v2;
  void *v3;

  -[NSMutableOrderedSet array](self->_mutableOrderedSet, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (WBSMutableOrderedSet)init
{
  return -[WBSMutableOrderedSet initWithMaximumCount:](self, "initWithMaximumCount:", 0);
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableOrderedSet count](self->_mutableOrderedSet, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[WBSMutableOrderedSet _moveObjectAtIndexToLast:](self, "_moveObjectAtIndexToLast:", a3);
    -[NSMutableOrderedSet objectAtIndex:](self->_mutableOrderedSet, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)objectAtIndexWithoutAffectingRecency:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableOrderedSet count](self->_mutableOrderedSet, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_mutableOrderedSet, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = -[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:", v4);
  if (v5)
    -[WBSMutableOrderedSet _moveObjectAtIndexToLast:](self, "_moveObjectAtIndexToLast:", -[NSMutableOrderedSet indexOfObject:](self->_mutableOrderedSet, "indexOfObject:", v4));

  return v5;
}

- (void)removeObject:(id)a3
{
  -[NSMutableOrderedSet removeObject:](self->_mutableOrderedSet, "removeObject:", a3);
}

- (void)removeObjectsInArray:(id)a3
{
  -[NSMutableOrderedSet removeObjectsInArray:](self->_mutableOrderedSet, "removeObjectsInArray:", a3);
}

- (void)markObjectAsRecentlyUsed:(id)a3
{
  uint64_t v4;

  v4 = -[NSMutableOrderedSet indexOfObject:](self->_mutableOrderedSet, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[WBSMutableOrderedSet _moveObjectAtIndexToLast:](self, "_moveObjectAtIndexToLast:", v4);
}

- (void)_moveObjectAtIndexToLast:(unint64_t)a3
{
  uint64_t v5;
  id v6;

  v5 = -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count") - 1;
  if (v5 != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:](self->_mutableOrderedSet, "moveObjectsAtIndexes:toIndex:", v6, v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableOrderedSet, 0);
}

@end

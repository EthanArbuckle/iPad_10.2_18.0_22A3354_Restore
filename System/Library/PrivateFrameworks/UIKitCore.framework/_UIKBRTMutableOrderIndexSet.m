@implementation _UIKBRTMutableOrderIndexSet

- (_UIKBRTMutableOrderIndexSet)init
{
  _UIKBRTMutableOrderIndexSet *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *indexSet;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKBRTMutableOrderIndexSet;
  v2 = -[_UIKBRTMutableOrderIndexSet init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    indexSet = v2->_indexSet;
    v2->_indexSet = v3;

    v2->_reversed = 0;
  }
  return v2;
}

- (_UIKBRTMutableOrderIndexSet)initWithIndexesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _UIKBRTMutableOrderIndexSet *v5;
  uint64_t v6;
  NSMutableIndexSet *indexSet;
  objc_super v9;

  length = a3.length;
  location = a3.location;
  v9.receiver = self;
  v9.super_class = (Class)_UIKBRTMutableOrderIndexSet;
  v5 = -[_UIKBRTMutableOrderIndexSet init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", location, length);
    indexSet = v5->_indexSet;
    v5->_indexSet = (NSMutableIndexSet *)v6;

    v5->_reversed = 0;
  }
  return v5;
}

- (unint64_t)count
{
  return -[NSMutableIndexSet count](self->_indexSet, "count");
}

- (unint64_t)lowestIndex
{
  return -[NSMutableIndexSet firstIndex](self->_indexSet, "firstIndex");
}

- (unint64_t)highestIndex
{
  return -[NSMutableIndexSet lastIndex](self->_indexSet, "lastIndex");
}

- (unint64_t)beginningIndex
{
  _BOOL4 reversed;
  NSMutableIndexSet *indexSet;

  reversed = self->_reversed;
  indexSet = self->_indexSet;
  if (reversed)
    return -[NSMutableIndexSet lastIndex](indexSet, "lastIndex");
  else
    return -[NSMutableIndexSet firstIndex](indexSet, "firstIndex");
}

- (unint64_t)endingIndex
{
  _BOOL4 reversed;
  NSMutableIndexSet *indexSet;

  reversed = self->_reversed;
  indexSet = self->_indexSet;
  if (reversed)
    return -[NSMutableIndexSet firstIndex](indexSet, "firstIndex");
  else
    return -[NSMutableIndexSet lastIndex](indexSet, "lastIndex");
}

- (void)addIndex:(unint64_t)a3
{
  -[NSMutableIndexSet addIndex:](self->_indexSet, "addIndex:", a3);
}

- (void)removeIndex:(unint64_t)a3
{
  -[NSMutableIndexSet removeIndex:](self->_indexSet, "removeIndex:", a3);
}

- (void)removeIndexes:(id)a3
{
  -[NSMutableIndexSet removeIndexes:](self->_indexSet, "removeIndexes:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIKBRTMutableOrderIndexSet;
  -[_UIKBRTMutableOrderIndexSet description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = "YES";
  if (!self->_reversed)
    v5 = "NO";
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", reversed=%s, %@"), v5, self->_indexSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableIndexSet)indexSet
{
  return self->_indexSet;
}

- (BOOL)reversed
{
  return self->_reversed;
}

- (void)setReversed:(BOOL)a3
{
  self->_reversed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSet, 0);
}

@end

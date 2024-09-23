@implementation PFAIPresentationHintCollector

- (PFAIPresentationHintCollector)init
{
  PFAIPresentationHintCollector *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFAIPresentationHintCollector;
  v2 = -[PFAIPresentationHintCollector init](&v4, "init");
  if (v2)
  {
    v2->mIdrefStart = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mLineBreakIndexes = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    v2->mStartIndexes = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    v2->mLastLineBreakHint = 0x7FFFFFFFFFFFFFFFLL;
    v2->mHintCollections = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->mHintCollectionIdrefs = (TSUPointerKeyDictionary *)objc_alloc_init((Class)TSUPointerKeyDictionary);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIPresentationHintCollector;
  -[PFAIPresentationHintCollector dealloc](&v3, "dealloc");
}

- (void)addStartHint:(unint64_t)a3 withIdref:(id)a4 textStorage:(id)a5
{
  unsigned __int8 v9;

  self->mLastStartIdref = 0;
  if (a4)
  {
    self->mLastStartHintAdded = -[NSMutableIndexSet containsIndex:](self->mStartIndexes, "containsIndex:", a3) ^ 1;
    if ((-[NSMutableIndexSet containsIndex:](self->mLineBreakIndexes, "containsIndex:", a3) & 1) != 0
      || (v9 = -[NSMutableIndexSet containsIndex:](self->mStartIndexes, "containsIndex:", a3), !a3)
      || (v9 & 1) != 0
      || (IsParagraphBreakingCharacter(objc_msgSend(a5, "characterAtIndex:", a3 - 1)) & 1) == 0)
    {
      self->mLastStartHint = a3;
      self->mLastStartIdref = (NSString *)a4;
    }
    -[NSMutableIndexSet addIndex:](self->mStartIndexes, "addIndex:", a3);
    -[NSMutableDictionary setObject:forKey:](self->mIdrefStart, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), a4);
  }
}

- (void)addLineBreakHint:(unint64_t)a3 textStorage:(id)a4
{
  unsigned __int8 v7;

  self->mLastLineBreakHintAdded = -[NSMutableIndexSet containsIndex:](self->mLineBreakIndexes, "containsIndex:") ^ 1;
  v7 = -[NSMutableIndexSet containsIndex:](self->mLineBreakIndexes, "containsIndex:", a3);
  if (!a3 || (v7 & 1) != 0 || (IsParagraphBreakingCharacter(objc_msgSend(a4, "characterAtIndex:", a3 - 1)) & 1) == 0)
    self->mLastLineBreakHint = a3;
  -[NSMutableIndexSet addIndex:](self->mLineBreakIndexes, "addIndex:", a3);

  self->mLastStartIdref = 0;
  self->mLastStartHint = 0x7FFFFFFFFFFFFFFFLL;
}

- (id)lineBreaksForIdref:(id)a3 fromIndexSet:(id)a4
{
  id v6;
  id v7;
  id v8;
  id i;

  v6 = -[NSMutableDictionary objectForKey:](self->mIdrefStart, "objectForKey:", a3);
  if (!v6)
    return 0;
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = objc_alloc_init((Class)NSMutableIndexSet);
  for (i = -[NSMutableIndexSet indexGreaterThanIndex:](self->mStartIndexes, "indexGreaterThanIndex:", v7);
        v7 < i;
        v7 = objc_msgSend(a4, "indexGreaterThanIndex:", v7))
  {
    objc_msgSend(v8, "addIndex:", v7);
  }
  if (i != (id)0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "addIndex:", i);
  return v8;
}

- (id)lineBreaksForIdref:(id)a3
{
  return -[PFAIPresentationHintCollector lineBreaksForIdref:fromIndexSet:](self, "lineBreaksForIdref:fromIndexSet:", a3, self->mLineBreakIndexes);
}

- (void)updateLastLineBreakHintWithIndex:(unint64_t)a3 textStorage:(id)a4
{
  unint64_t mLastLineBreakHint;
  unint64_t mLastStartHint;

  if (a3 && IsParagraphBreakingCharacter(objc_msgSend(a4, "characterAtIndex:", a3 - 1)))
  {
    mLastLineBreakHint = self->mLastLineBreakHint;
    if (mLastLineBreakHint != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (mLastLineBreakHint + 1 == a3)
      {
        if (self->mLastLineBreakHintAdded)
          -[NSMutableIndexSet removeIndex:](self->mLineBreakIndexes, "removeIndex:");
        -[NSMutableIndexSet addIndex:](self->mLineBreakIndexes, "addIndex:", a3);
      }
      self->mLastLineBreakHint = 0x7FFFFFFFFFFFFFFFLL;
    }
    mLastStartHint = self->mLastStartHint;
    if (mLastStartHint != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (mLastStartHint + 1 == a3)
      {
        if (self->mLastStartHintAdded)
          -[NSMutableIndexSet removeIndex:](self->mStartIndexes, "removeIndex:");
        -[NSMutableIndexSet addIndex:](self->mStartIndexes, "addIndex:", a3);
        -[NSMutableDictionary setObject:forKey:](self->mIdrefStart, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), self->mLastStartIdref);
      }
      self->mLastStartHint = 0x7FFFFFFFFFFFFFFFLL;

      self->mLastStartIdref = 0;
    }
  }
}

- (void)addHintCollection:(id)a3 idref:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      -[NSMutableArray addObject:](self->mHintCollections, "addObject:");
      -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->mHintCollectionIdrefs, "setObject:forUncopiedKey:", a4, a3);
    }
  }
}

- (id)handleExtraIndexForTrailingParagraph:(id)a3 textStorage:(id)a4
{
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  unsigned int v10;
  unsigned int v11;
  id v12;

  v6 = (char *)objc_msgSend(a4, "length");
  v7 = v6 - 2;
  if ((unint64_t)v6 >= 2)
  {
    v8 = v6;
    if (objc_msgSend(a3, "containsIndex:", v6))
    {
      v9 = v8 - 1;
      v10 = objc_msgSend(a4, "characterAtIndex:", v9);
      v11 = objc_msgSend(a4, "characterAtIndex:", v7);
      if (v11 <= 0xC && ((1 << v11) & 0x1420) != 0 && v10 == 160)
      {
        objc_msgSend(a4, "deleteRange:undoTransaction:", v9, 1, 0);
        v12 = objc_msgSend(objc_alloc((Class)NSMutableIndexSet), "initWithIndexSet:", a3);
        objc_msgSend(v12, "removeIndex:", objc_msgSend(a3, "lastIndex"));
        return v12;
      }
    }
  }
  return a3;
}

- (id)repairedIndexesForHintCollection:(id)a3 textStorage:(id)a4
{
  id v7;
  char *v8;

  v7 = -[PFAIPresentationHintCollector lineBreaksForIdref:fromIndexSet:](self, "lineBreaksForIdref:fromIndexSet:", -[TSUPointerKeyDictionary objectForKey:](self->mHintCollectionIdrefs, "objectForKey:"), self->mLineBreakIndexes);
  v8 = (char *)objc_msgSend(a3, "hintsCount") + 1;
  if (objc_msgSend(v7, "count") == v8)
    return v7;
  else
    return -[PFAIPresentationHintCollector handleExtraIndexForTrailingParagraph:textStorage:](self, "handleExtraIndexForTrailingParagraph:textStorage:", v7, a4);
}

- (void)processHintCollectionsWithStorage:(id)a3
{
  NSMutableArray *mHintCollections;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (a3)
  {
    -[NSMutableIndexSet addIndex:](self->mLineBreakIndexes, "addIndex:", objc_msgSend(a3, "length"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    mHintCollections = self->mHintCollections;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mHintCollections, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(mHintCollections);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          v11 = -[PFAIPresentationHintCollector repairedIndexesForHintCollection:textStorage:](self, "repairedIndexesForHintCollection:textStorage:", v10, a3);
          if (v11)
            objc_msgSend(v10, "applePubUpdateRangesWithLineBreakIndexes:textStorage:", v11, a3);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mHintCollections, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
}

@end

@implementation REElementQueue

- (void)setMaximumRelevantElementsCount:(int64_t)a3
{
  self->_maximumRelevantElementsCount = a3;
}

- (REElementQueue)initWithMaximumRelevantElementsCount:(int64_t)a3 comparators:(id)a4
{
  id v6;
  REElementQueue *v7;
  REElementQueue *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  id v17;
  void *v18;
  REOrderingArray *v19;
  void *v20;
  uint64_t v21;
  REOrderingArray *relevantElements;
  uint64_t v23;
  NSMutableSet *hiddenElements;
  int64_t v25;
  REElementQueue *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)REElementQueue;
  v7 = -[REElementQueue init](&v32, sel_init);
  v8 = v7;
  if (v7)
  {
    v27 = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      v14 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v16 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v33[0] = v14;
          v33[1] = 3221225472;
          v33[2] = __REElementComparatorInverter_block_invoke;
          v33[3] = &unk_24CF90A30;
          v34 = v16;
          v17 = v16;
          v18 = (void *)MEMORY[0x2199B2434](v33);

          objc_msgSend(v9, "addObject:", v18);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v12);
    }

    v19 = [REOrderingArray alloc];
    v20 = (void *)objc_msgSend(v9, "copy");
    v21 = -[REOrderingArray initWithComparators:](v19, "initWithComparators:", v20);
    v8 = v27;
    relevantElements = v27->_relevantElements;
    v27->_relevantElements = (REOrderingArray *)v21;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    hiddenElements = v27->_hiddenElements;
    v27->_hiddenElements = (NSMutableSet *)v23;

    v25 = 0x7FFFFFFFFFFFFFFFLL;
    if ((unint64_t)a3 < 0x7FFFFFFFFFFFFFFFLL)
      v25 = a3;
    v27->_maximumRelevantElementsCount = v25;

  }
  return v8;
}

- (int64_t)count
{
  unint64_t v3;

  v3 = -[REOrderingArray count](self->_relevantElements, "count");
  return -[NSMutableSet count](self->_hiddenElements, "count") + v3;
}

- (int64_t)visibleCount
{
  int64_t result;

  result = -[REOrderingArray count](self->_relevantElements, "count");
  if ((unint64_t)result >= self->_maximumRelevantElementsCount)
    return self->_maximumRelevantElementsCount;
  return result;
}

- (BOOL)containsElement:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (-[NSMutableSet containsObject:](self->_hiddenElements, "containsObject:", v4) & 1) != 0
    || -[REOrderingArray containsObject:](self->_relevantElements, "containsObject:", v4);

  return v5;
}

- (NSArray)allElements
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableSet count](self->_hiddenElements, "count") + -[REOrderingArray count](self->_relevantElements, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[REOrderingArray count](self->_relevantElements, "count"))
  {
    v4 = 0;
    do
    {
      -[REOrderingArray objectAtIndex:](self->_relevantElements, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[REOrderingArray count](self->_relevantElements, "count"));
  }
  -[NSMutableSet allObjects](self->_hiddenElements, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v7;
}

- (id)elementAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[REElementQueue visibleCount](self, "visibleCount") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[REOrderingArray objectAtIndexedSubscript:](self->_relevantElements, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)indexOfElement:(id)a3
{
  int64_t v4;
  int64_t v5;
  int64_t v6;

  v4 = -[REOrderingArray indexOfObject:](self->_relevantElements, "indexOfObject:", a3);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    if (v4 < -[REElementQueue visibleCount](self, "visibleCount"))
      return v6;
  }
  return v5;
}

- (void)performBatchUpdates:(id)a3
{
  -[REOrderingArray performBatchUpdates:](self->_relevantElements, "performBatchUpdates:", a3);
}

- (void)addElement:(id)a3 hidden:(BOOL)a4
{
  uint64_t v4;

  v4 = 8;
  if (a4)
    v4 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "addObject:", a3);
}

- (void)removeElement:(id)a3
{
  NSMutableSet *hiddenElements;
  int v5;
  uint64_t v6;
  id v7;

  hiddenElements = self->_hiddenElements;
  v7 = a3;
  v5 = -[NSMutableSet containsObject:](hiddenElements, "containsObject:", v7);
  v6 = 8;
  if (v5)
    v6 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v6), "removeObject:", v7);

}

- (void)updatePositionForElement:(id)a3 hidden:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (!-[NSMutableSet containsObject:](self->_hiddenElements, "containsObject:"))
  {
    if (v4)
    {
      -[REElementQueue removeElement:](self, "removeElement:", v7);
      -[NSMutableSet addObject:](self->_hiddenElements, "addObject:", v7);
    }
    else
    {
      -[REOrderingArray updateObject:](self->_relevantElements, "updateObject:", v7);
    }
    goto LABEL_7;
  }
  v6 = v7;
  if (!v4)
  {
    -[NSMutableSet removeObject:](self->_hiddenElements, "removeObject:", v7);
    -[REElementQueue addElement:hidden:](self, "addElement:hidden:", v7, 0);
LABEL_7:
    v6 = v7;
  }

}

- (void)updateAllElements
{
  -[REOrderingArray sortAllObjects](self->_relevantElements, "sortAllObjects");
}

- (int64_t)maximumRelevantElementsCount
{
  return self->_maximumRelevantElementsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenElements, 0);
  objc_storeStrong((id *)&self->_relevantElements, 0);
}

@end

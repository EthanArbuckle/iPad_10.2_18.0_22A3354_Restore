@implementation REOrderingArray

- (REOrderingArray)initWithComparators:(id)a3
{
  id v5;
  REOrderingArray *v6;
  REOrderingArray *v7;
  NSArray *orderedObjects;
  REDependencyGraph *v9;
  REDependencyGraph *dependencyGraph;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)REOrderingArray;
  v6 = -[REOrderingArray init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_comparators, a3);
    orderedObjects = v7->_orderedObjects;
    v7->_orderedObjects = (NSArray *)MEMORY[0x24BDBD1A8];

    v9 = -[REDependencyGraph initWithPointerFunctions:]([REDependencyGraph alloc], "initWithPointerFunctions:", 0);
    dependencyGraph = v7->_dependencyGraph;
    v7->_dependencyGraph = v9;

  }
  return v7;
}

- (unint64_t)count
{
  return -[NSArray count](self->_orderedObjects, "count");
}

- (BOOL)containsObject:(id)a3
{
  return -[REDependencyGraph containsItem:](self->_dependencyGraph, "containsItem:", a3);
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[NSArray indexOfObject:](self->_orderedObjects, "indexOfObject:", a3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_orderedObjects, "objectAtIndexedSubscript:", a3);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_orderedObjects, "objectAtIndexedSubscript:", a3);
}

- (void)_createDependenciesForObject:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  REDependencyGraph *dependencyGraph;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  REOrderingArray *v13;
  id v14;

  v4 = a3;
  if (-[NSArray count](self->_comparators, "count") >= 2)
  {
    v5 = 1;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_comparators, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      dependencyGraph = self->_dependencyGraph;
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __48__REOrderingArray__createDependenciesForObject___block_invoke;
      v11[3] = &unk_24CF8BF08;
      v9 = v4;
      v13 = self;
      v14 = v7;
      v12 = v9;
      v10 = v7;
      -[REDependencyGraph enumerateObjectsUsingBlock:](dependencyGraph, "enumerateObjectsUsingBlock:", v11);

      ++v5;
    }
    while (v5 < -[NSArray count](self->_comparators, "count"));
  }

}

void __48__REOrderingArray__createDependenciesForObject___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  if ((id)a1[4] != v3)
  {
    v7 = v3;
    v4 = (*(uint64_t (**)(void))(a1[6] + 16))();
    if (v4 == -1)
    {
      v6 = (id)a1[4];
      v5 = v7;
      goto LABEL_6;
    }
    v3 = v7;
    if (v4 == 1)
    {
      v5 = (id)a1[4];
      v6 = v7;
LABEL_6:
      objc_msgSend(*(id *)(a1[5] + 16), "markItem:dependentOnItem:", v6, v5);
      v3 = v7;
    }
  }

}

- (void)addObject:(id)a3
{
  REDependencyGraph *dependencyGraph;
  id v5;

  dependencyGraph = self->_dependencyGraph;
  v5 = a3;
  -[REDependencyGraph addItem:](dependencyGraph, "addItem:", v5);
  -[REOrderingArray _createDependenciesForObject:](self, "_createDependenciesForObject:", v5);

  -[REOrderingArray _performOrMarkUpdate](self, "_performOrMarkUpdate");
}

- (void)removeObject:(id)a3
{
  -[REDependencyGraph removeItem:](self->_dependencyGraph, "removeItem:", a3);
  -[REOrderingArray _performOrMarkUpdate](self, "_performOrMarkUpdate");
}

- (void)updateObject:(id)a3
{
  REDependencyGraph *dependencyGraph;
  id v5;

  dependencyGraph = self->_dependencyGraph;
  v5 = a3;
  -[REDependencyGraph removeItem:](dependencyGraph, "removeItem:", v5);
  -[REDependencyGraph addItem:](self->_dependencyGraph, "addItem:", v5);
  -[REOrderingArray _createDependenciesForObject:](self, "_createDependenciesForObject:", v5);

  -[REOrderingArray _performOrMarkUpdate](self, "_performOrMarkUpdate");
}

- (void)performBatchUpdates:(id)a3
{
  id v4;
  unint64_t batchCount;
  id v6;

  v4 = a3;
  batchCount = self->_batchCount;
  self->_batchCount = batchCount + 1;
  v6 = v4;
  if (v4)
  {
    (*((void (**)(void))v4 + 2))();
    batchCount = self->_batchCount - 1;
  }
  self->_batchCount = batchCount;
  if (!batchCount && self->_needsUpdate)
    -[REOrderingArray _updateContentOrder](self, "_updateContentOrder");

}

- (void)_performOrMarkUpdate
{
  if (self->_batchCount)
    self->_needsUpdate = 1;
  else
    -[REOrderingArray _updateContentOrder](self, "_updateContentOrder");
}

- (void)_updateContentOrder
{
  void *v3;
  REDependencyGraph *dependencyGraph;
  id v5;
  NSArray *v6;
  NSArray *orderedObjects;
  _QWORD v8[4];
  id v9;

  self->_needsUpdate = 0;
  -[NSArray firstObject](self->_comparators, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dependencyGraph = self->_dependencyGraph;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__REOrderingArray__updateContentOrder__block_invoke;
  v8[3] = &unk_24CF8BF30;
  v9 = v3;
  v5 = v3;
  -[REDependencyGraph topologicalSortedItemsWithComparator:](dependencyGraph, "topologicalSortedItemsWithComparator:", v8);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  orderedObjects = self->_orderedObjects;
  self->_orderedObjects = v6;

}

uint64_t __38__REOrderingArray__updateContentOrder__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSArray)comparators
{
  return self->_comparators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparators, 0);
  objc_storeStrong((id *)&self->_dependencyGraph, 0);
  objc_storeStrong((id *)&self->_orderedObjects, 0);
}

@end

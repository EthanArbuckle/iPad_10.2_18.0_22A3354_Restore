@implementation _UICollectionLayoutDynamicsConfiguration

- (_UICollectionLayoutDynamicsConfiguration)init
{
  _UICollectionLayoutDynamicsConfiguration *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *behaviorDict;
  NSMutableArray *v5;
  NSMutableArray *dirtyItems;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICollectionLayoutDynamicsConfiguration;
  v2 = -[_UICollectionLayoutDynamicsConfiguration init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    behaviorDict = v2->_behaviorDict;
    v2->_behaviorDict = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dirtyItems = v2->_dirtyItems;
    v2->_dirtyItems = v5;

  }
  return v2;
}

- (id)behaviorsForItem:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v11;

  if (a3)
  {
    v5 = *((_QWORD *)a3 + 2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutHelpers.m"), 1212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

    v5 = 0;
  }
  +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutDynamicsConfiguration behaviorDict](self, "behaviorDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setBehaviors:(id)a3 forItem:(id)a4
{
  void *v8;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutHelpers.m"), 1220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  -[NSMutableArray addObject:](self->_dirtyItems, "addObject:", a4);
  -[_UICollectionLayoutDynamicsConfiguration _setBehaviors:forItem:](self, "_setBehaviors:forItem:", a3, a4);
}

- (NSArray)dynamicItems
{
  return self->_items;
}

- (void)setDynamicItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void)_setBehaviors:(id)a3 forItem:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v9;
  id v10;

  if (a4)
  {
    v6 = *((_QWORD *)a4 + 2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutHelpers.m"), 1236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

    v6 = 0;
  }
  +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!a3)
    a3 = (id)MEMORY[0x1E0C9AA60];
  -[_UICollectionLayoutDynamicsConfiguration behaviorDict](self, "behaviorDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, v10);

}

- (void)_reset
{
  void *v3;
  NSArray *items;

  -[NSMutableArray removeAllObjects](self->_dirtyItems, "removeAllObjects");
  -[_UICollectionLayoutDynamicsConfiguration behaviorDict](self, "behaviorDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  items = self->_items;
  self->_items = (NSArray *)MEMORY[0x1E0C9AA60];

}

- (id)_dirtyItems
{
  return self->_dirtyItems;
}

- (CGRect)previousVisibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousVisibleBounds.origin.x;
  y = self->_previousVisibleBounds.origin.y;
  width = self->_previousVisibleBounds.size.width;
  height = self->_previousVisibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousVisibleBounds:(CGRect)a3
{
  self->_previousVisibleBounds = a3;
}

- (CGRect)currentVisibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentVisibleBounds.origin.x;
  y = self->_currentVisibleBounds.origin.y;
  width = self->_currentVisibleBounds.size.width;
  height = self->_currentVisibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentVisibleBounds:(CGRect)a3
{
  self->_currentVisibleBounds = a3;
}

- (NSMutableDictionary)behaviorDict
{
  return self->_behaviorDict;
}

- (void)setBehaviorDict:(id)a3
{
  objc_storeStrong((id *)&self->_behaviorDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorDict, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dirtyItems, 0);
}

@end

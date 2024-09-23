@implementation _UICollectionCompositionalLayoutSolverResolveResult

- (id)indexPathsForDeletedSupplememtariesForElementKind:(id *)a1
{
  id *v2;
  void *v4;
  void *v5;
  id *v6;
  void *v8;

  v2 = a1;
  if (a1)
  {
    if (!objc_msgSend(a2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_indexPathsForDeletedSupplememtariesForElementKind_, v2, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3939, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    objc_msgSend(v2[3], "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (id *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    v2 = v6;

  }
  return v2;
}

- (id)indexPathsForDeletedDecorationsForElementKind:(id *)a1
{
  id *v2;
  void *v4;
  void *v5;
  id *v6;
  void *v8;

  v2 = a1;
  if (a1)
  {
    if (!objc_msgSend(a2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_indexPathsForDeletedDecorationsForElementKind_, v2, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3944, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    objc_msgSend(v2[4], "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (id *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    v2 = v6;

  }
  return v2;
}

- (id)indexPathsForInsertedSupplememtariesForElementKind:(id *)a1
{
  id *v2;
  void *v4;
  void *v5;
  id *v6;
  void *v8;

  v2 = a1;
  if (a1)
  {
    if (!objc_msgSend(a2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_indexPathsForInsertedSupplememtariesForElementKind_, v2, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3949, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    objc_msgSend(v2[1], "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (id *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    v2 = v6;

  }
  return v2;
}

- (id)indexPathsForInsertedDecorationsForElementKind:(id *)a1
{
  id *v2;
  void *v4;
  void *v5;
  id *v6;
  void *v8;

  v2 = a1;
  if (a1)
  {
    if (!objc_msgSend(a2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_indexPathsForInsertedDecorationsForElementKind_, v2, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3954, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    objc_msgSend(v2[2], "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (id *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    v2 = v6;

  }
  return v2;
}

- (_UICollectionCompositionalLayoutSolverResolveResult)init
{
  _UICollectionCompositionalLayoutSolverResolveResult *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *insertedSupplementaryElementKindIndexPathsDict;
  NSMutableDictionary *v5;
  NSMutableDictionary *insertedDecorationElementKindIndexPathsDict;
  NSMutableDictionary *v7;
  NSMutableDictionary *deletedSupplementaryElementKindIndexPathsDict;
  NSMutableDictionary *v9;
  NSMutableDictionary *deletedDecorationElementKindIndexPathsDict;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UICollectionCompositionalLayoutSolverResolveResult;
  v2 = -[_UICollectionCompositionalLayoutSolverResolveResult init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    insertedSupplementaryElementKindIndexPathsDict = v2->_insertedSupplementaryElementKindIndexPathsDict;
    v2->_insertedSupplementaryElementKindIndexPathsDict = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    insertedDecorationElementKindIndexPathsDict = v2->_insertedDecorationElementKindIndexPathsDict;
    v2->_insertedDecorationElementKindIndexPathsDict = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deletedSupplementaryElementKindIndexPathsDict = v2->_deletedSupplementaryElementKindIndexPathsDict;
    v2->_deletedSupplementaryElementKindIndexPathsDict = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deletedDecorationElementKindIndexPathsDict = v2->_deletedDecorationElementKindIndexPathsDict;
    v2->_deletedDecorationElementKindIndexPathsDict = v9;

  }
  return v2;
}

- (void)setSectionsWereRequeried:(BOOL)a3
{
  self->_sectionsWereRequeried = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedDecorationElementKindIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_deletedSupplementaryElementKindIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_insertedDecorationElementKindIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_insertedSupplementaryElementKindIndexPathsDict, 0);
}

- (void)addInsertedAuxillaryOfElementKind:(uint64_t)a3 atIndexPath:(int)a4 isSupplementary:
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (!a1)
    return;
  if (!objc_msgSend(a2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_addInsertedAuxillaryOfElementKind_atIndexPath_isSupplementary_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3923, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    if (a3)
      goto LABEL_4;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_addInsertedAuxillaryOfElementKind_atIndexPath_isSupplementary_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3924, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    goto LABEL_4;
  }
  if (!a3)
    goto LABEL_11;
LABEL_4:
  if (a4)
    v8 = 8;
  else
    v8 = 16;
  objc_msgSend(*(id *)(a1 + v8), "objectForKeyedSubscript:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + v8), "setObject:forKeyedSubscript:", v12, a2);
    v9 = v12;
  }
  v13 = v9;
  objc_msgSend(v9, "addObject:", a3);

}

- (void)addDeletedAuxillaryOfElementKind:(uint64_t)a3 atIndexPath:(int)a4 isSupplementary:
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (!a1)
    return;
  if (!objc_msgSend(a2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_addDeletedAuxillaryOfElementKind_atIndexPath_isSupplementary_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3907, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    if (a3)
      goto LABEL_4;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_addDeletedAuxillaryOfElementKind_atIndexPath_isSupplementary_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3908, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    goto LABEL_4;
  }
  if (!a3)
    goto LABEL_11;
LABEL_4:
  if (a4)
    v8 = 24;
  else
    v8 = 32;
  objc_msgSend(*(id *)(a1 + v8), "objectForKeyedSubscript:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + v8), "setObject:forKeyedSubscript:", v12, a2);
    v9 = v12;
  }
  v13 = v9;
  objc_msgSend(v9, "addObject:", a3);

}

- (void)setContentOffsetAdjustment:(CGPoint)a3
{
  self->_contentOffsetAdjustment = a3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: insertedSupplementaries: %@; insertedDecorations: %@; deletedSupplementaries: %@; deletedDecorations: %@>"),
    v5,
    self,
    self->_insertedSupplementaryElementKindIndexPathsDict,
    self->_insertedDecorationElementKindIndexPathsDict,
    self->_deletedSupplementaryElementKindIndexPathsDict,
    self->_deletedDecorationElementKindIndexPathsDict);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

@implementation _UICollectionLayoutUpdateContainerOffsetResult

- (void)addInvalidatedSupplementaryForKind:(id)a3 indexPath:(id)a4
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3633, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3634, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

LABEL_3:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_invalidatedSupplementaryIndexesDict, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_invalidatedSupplementaryIndexesDict, "setObject:forKeyedSubscript:", v11, a3);
    v8 = v11;
  }
  v12 = v8;
  objc_msgSend(v8, "addObject:", a4);

}

- (NSSet)invalidatedAuxillaryKinds
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_invalidatedSupplementaryIndexesDict, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (_UICollectionLayoutUpdateContainerOffsetResult)init
{
  _UICollectionLayoutUpdateContainerOffsetResult *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *invalidatedSupplementaryIndexesDict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICollectionLayoutUpdateContainerOffsetResult;
  v2 = -[_UICollectionLayoutUpdateContainerOffsetResult init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    invalidatedSupplementaryIndexesDict = v2->_invalidatedSupplementaryIndexesDict;
    v2->_invalidatedSupplementaryIndexesDict = v3;

  }
  return v2;
}

- (id)indexPathsForInvalidatedSupplementariesOfKind:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v11;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3627, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_invalidatedSupplementaryIndexesDict, "objectForKeyedSubscript:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatedSupplementaryIndexesDict, 0);
}

@end

@implementation _UIDiffableSectionBoundaryMoveDetector

- (NSSet)movePairs
{
  return self->_movePairs;
}

- (_UIDiffableSectionBoundaryMoveDetector)initWithItemDiffer:(id)a3 beforeDataSourceState:(id)a4 afterDataSourceState:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UIDiffableSectionBoundaryMoveDetector *v12;
  _UIDiffableSectionBoundaryMoveDetector *v13;
  uint64_t v14;
  NSSet *movePairs;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_UIDiffableSectionBoundaryMoveDetector;
  v12 = -[_UIDiffableSectionBoundaryMoveDetector init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_differ, a3);
    objc_storeStrong((id *)&v13->_beforeState, a4);
    objc_storeStrong((id *)&v13->_afterState, a5);
    -[_UIDiffableSectionBoundaryMoveDetector _computeMovePairsFoundation](v13, "_computeMovePairsFoundation");
    v14 = objc_claimAutoreleasedReturnValue();
    movePairs = v13->_movePairs;
    v13->_movePairs = (NSSet *)v14;

  }
  return v13;
}

- (id)_computeMovePairsFoundation
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *__p;
  char *v53;
  char *v54;

  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_beforeState, "dataSourceSnapshot");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceState dataSourceSnapshot](self->_afterState, "dataSourceSnapshot");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIIdentifierDiffer hasChanges]((_BOOL8)self->_differ);
  v5 = objc_msgSend(v47, "numberOfSections");
  if (v5 == objc_msgSend(v48, "numberOfSections") && objc_msgSend(v47, "isEqual:", v48))
  {
    -[_UIDiffableDataSourceState sections](self->_beforeState, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDiffableDataSourceState sections](self->_afterState, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToOrderedSet:", v7);

  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v48, "numberOfItems") && ((v4 | v8 ^ 1) & 1) != 0)
  {
    -[_UIDiffableDataSourceState identifiers](self->_beforeState, "identifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDiffableDataSourceState identifiers](self->_afterState, "identifiers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDiffableDataSourceState sections](self->_beforeState, "sections");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDiffableDataSourceState sections](self->_afterState, "sections");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v47, "numberOfItems");
    if (v10 != objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableSectionBoundaryMoveDetector.mm"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSnapshot.numberOfItems == initialIdentifiers.count"));

    }
    v11 = objc_msgSend(v47, "numberOfSections");
    if (v11 != objc_msgSend(v51, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableSectionBoundaryMoveDetector.mm"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSnapshot.numberOfSections == initialSections.count"));

    }
    v12 = objc_msgSend(v48, "numberOfItems");
    if (v12 != objc_msgSend(v45, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableSectionBoundaryMoveDetector.mm"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalSnapshot.numberOfItems == finalIdentifiers.count"));

    }
    v13 = objc_msgSend(v48, "numberOfSections");
    if (v13 != objc_msgSend(v50, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableSectionBoundaryMoveDetector.mm"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalSnapshot.numberOfSections == finalSections.count"));

    }
    v14 = objc_msgSend(v45, "count");
    v46 = objc_msgSend(v47, "numberOfSections");
    v15 = objc_msgSend(v48, "numberOfSections");
    __p = 0;
    v53 = 0;
    v54 = 0;
    std::vector<long>::reserve(&__p, v14);
    if (v15 >= 1)
    {
      for (i = 0; i != v15; ++i)
      {
        v17 = objc_msgSend(v48, "rangeForSection:", i);
        v19 = v17 + v18;
        if (v17 < v17 + v18)
        {
          v20 = v53;
          do
          {
            if (v20 >= v54)
            {
              v22 = (char *)__p;
              v23 = (v20 - (_BYTE *)__p) >> 3;
              v24 = v23 + 1;
              if ((unint64_t)(v23 + 1) >> 61)
                abort();
              v25 = v54 - (_BYTE *)__p;
              if ((v54 - (_BYTE *)__p) >> 2 > v24)
                v24 = v25 >> 2;
              if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
                v26 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v26 = v24;
              if (v26)
              {
                v27 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)&v54, v26);
                v22 = (char *)__p;
                v20 = v53;
              }
              else
              {
                v27 = 0;
              }
              v28 = &v27[8 * v23];
              *(_QWORD *)v28 = i;
              v21 = v28 + 8;
              while (v20 != v22)
              {
                v29 = *((_QWORD *)v20 - 1);
                v20 -= 8;
                *((_QWORD *)v28 - 1) = v29;
                v28 -= 8;
              }
              __p = v28;
              v53 = v21;
              v54 = &v27[8 * v26];
              if (v22)
                operator delete(v22);
            }
            else
            {
              *(_QWORD *)v20 = i;
              v21 = v20 + 8;
            }
            v53 = v21;
            ++v17;
            v20 = v21;
          }
          while (v17 != v19);
        }
      }
    }
    v49 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (v46 >= 1)
    {
      for (j = 0; j != v46; ++j)
      {
        v31 = objc_msgSend(v47, "rangeForSection:", j);
        v33 = v32;
        if (v31 < v31 + v32)
        {
          do
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", v31);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[_UIDiffableDataSourceState indexOfItemIdentifier:](self->_afterState, "indexOfItemIdentifier:", v34);
            if (v35 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v36 = *((_QWORD *)__p + v35);
              objc_msgSend(v51, "objectAtIndexedSubscript:", j);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "objectAtIndexedSubscript:", v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v37, "isEqual:", v38) & 1) == 0)
              {
                v39 = -[_UIIdentifierDifferMovePair initWithFromIndex:toIndex:]([_UIIdentifierDifferMovePair alloc], v31, v35);
                objc_msgSend(v49, "addObject:", v39);

              }
            }

            ++v31;
            --v33;
          }
          while (v33);
        }
      }
    }
    if (__p)
    {
      v53 = (char *)__p;
      operator delete(__p);
    }

  }
  else
  {
    self->_didShortCircuit = 1;
    v49 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  return v49;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movePairs, 0);
  objc_storeStrong((id *)&self->_afterState, 0);
  objc_storeStrong((id *)&self->_beforeState, 0);
  objc_storeStrong((id *)&self->_differ, 0);
}

- (BOOL)didShortCircuit
{
  return self->_didShortCircuit;
}

@end

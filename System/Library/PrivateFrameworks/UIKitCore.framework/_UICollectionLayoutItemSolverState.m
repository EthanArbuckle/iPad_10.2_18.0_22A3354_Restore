@implementation _UICollectionLayoutItemSolverState

- (_QWORD)itemFrames
{
  _QWORD *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[1];
    if (!v2)
    {
      -[_UICollectionLayoutItemSolverState _generateMemoizedSolutionFramesBasedData]((uint64_t)a1);
      v2 = (void *)v1[1];
    }
    a1 = v2;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_preferredSizeGroupingRanges, 0);
  objc_storeStrong((id *)&self->_solutionFrames, 0);
  objc_storeStrong((id *)&self->_geometricIndexer, 0);
  objc_storeStrong((id *)&self->_supplementaryFrameOffsets, 0);
  objc_storeStrong((id *)&self->_supplementaryDictByKindIndex, 0);
  objc_storeStrong((id *)&self->_auxillaryFrames, 0);
  objc_storeStrong((id *)&self->_itemFrames, 0);
}

- (id)initWithSolutionFrames:(void *)a3 itemFrameCount:(void *)a4 supplementaryFrameCount:(void *)a5 solvedFittingFrame:(void *)a6 preferredSizeGroupingRanges:(double)a7 additionalOffsetForOutermostGroup:(double)a8 errorDescription:(double)a9
{
  id *v23;
  id *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  objc_super v30;

  if (!a1)
    return 0;
  v30.receiver = a1;
  v30.super_class = (Class)_UICollectionLayoutItemSolverState;
  v23 = (id *)objc_msgSendSuper2(&v30, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong(v23 + 6, a2);
    v24[7] = a3;
    v24[8] = a4;
    *((double *)v24 + 13) = a7;
    *((double *)v24 + 14) = a8;
    *((double *)v24 + 15) = a9;
    *((double *)v24 + 16) = a10;
    v25 = objc_msgSend(a5, "copy");
    v26 = v24[9];
    v24[9] = (id)v25;

    *((double *)v24 + 11) = a11;
    *((double *)v24 + 12) = a12;
    v27 = objc_msgSend(a6, "copy");
    v28 = v24[10];
    v24[10] = (id)v27;

  }
  return v24;
}

- (void)_generateMemoizedSolutionFramesBasedData
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  id v29;
  _UICollectionLayoutAuxillaryOffsets *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateMemoizedSolutionFramesBasedData, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1725, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_supplementaryDictByKindIndex"));

    }
    if (*(_QWORD *)(a1 + 16))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateMemoizedSolutionFramesBasedData, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1726, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_auxillaryFrames"));

    }
    if (*(_QWORD *)(a1 + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateMemoizedSolutionFramesBasedData, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1727, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_itemFrames"));

    }
    if (!*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateMemoizedSolutionFramesBasedData, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1728, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_solutionFrames"));

    }
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = (_QWORD *)a1;
    v4 = *(id *)(a1 + 48);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v32;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD **)(*((_QWORD *)&v31 + 1) + 8 * v8);
          if (v9)
          {
            v10 = v9[4];
            if (v10 == 1)
            {
              objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v8));
            }
            else if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v8));
              -[_UICollectionLayoutFramesQueryResult auxillaryItem](v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v11)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateMemoizedSolutionFramesBasedData, v28, CFSTR("_UICollectionLayoutItemSolver.m"), 1747, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auxillaryItem"));

              }
              objc_msgSend(v11, "elementKind");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v12, "length"))
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateMemoizedSolutionFramesBasedData, v28, CFSTR("_UICollectionLayoutItemSolver.m"), 1749, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

              }
              +[_UICollectionLayoutFramesQueryResult kindIndexKeyForKind:index:]((uint64_t)_UICollectionLayoutFramesQueryResult, v12, v9[2]);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateMemoizedSolutionFramesBasedData, v28, CFSTR("_UICollectionLayoutItemSolver.m"), 1752, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kindIndexKey"));

              }
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v9, v13);
              -[_UICollectionLayoutAuxillaryOffsets incrementCountForElementKind:]((uint64_t)v30, v12);

            }
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v6);
    }

    v16 = (void *)v28[1];
    v28[1] = v2;
    v17 = v2;

    v18 = (void *)v28[2];
    v28[2] = v3;
    v19 = v3;

    v20 = (void *)v28[3];
    v28[3] = v29;
    v21 = v29;

    v22 = (void *)v28[4];
    v28[4] = v30;

  }
}

- (_QWORD)auxillaryFrames
{
  _QWORD *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      -[_UICollectionLayoutItemSolverState _generateMemoizedSolutionFramesBasedData]((uint64_t)a1);
      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)supplementaryFrameOffsets
{
  _QWORD *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[4];
    if (!v2)
    {
      -[_UICollectionLayoutItemSolverState _generateMemoizedSolutionFramesBasedData]((uint64_t)a1);
      v2 = (void *)v1[4];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)supplementaryDictByKindIndex
{
  _QWORD *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[3];
    if (!v2)
    {
      -[_UICollectionLayoutItemSolverState _generateMemoizedSolutionFramesBasedData]((uint64_t)a1);
      v2 = (void *)v1[3];
    }
    a1 = v2;
  }
  return a1;
}

@end

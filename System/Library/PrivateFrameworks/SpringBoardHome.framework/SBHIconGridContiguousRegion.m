@implementation SBHIconGridContiguousRegion

- (SBHIconGridContiguousRegion)initWithGridCellIndexes:(id)a3 inGridRange:(SBHIconGridRange)a4 gridSize:(SBHIconGridSize)a5
{
  uint64_t v6;
  unint64_t cellIndex;
  id v9;
  SBHIconGridContiguousRegion *v10;
  uint64_t v11;
  NSIndexSet *gridCellIndexes;
  objc_super v14;

  v6 = *(_QWORD *)&a4.size.columns;
  cellIndex = a4.cellIndex;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBHIconGridContiguousRegion;
  v10 = -[SBHIconGridContiguousRegion init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    gridCellIndexes = v10->_gridCellIndexes;
    v10->_gridCellIndexes = (NSIndexSet *)v11;

    v10->_gridRange.cellIndex = cellIndex;
    *(_QWORD *)&v10->_gridRange.size.columns = v6;
    v10->_gridSize = a5;
  }

  return v10;
}

- (SBHIconGridContiguousRegion)init
{
  id v3;
  SBHIconGridContiguousRegion *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  v4 = -[SBHIconGridContiguousRegion initWithGridCellIndexes:inGridRange:gridSize:](self, "initWithGridCellIndexes:inGridRange:gridSize:", v3, 0x7FFFFFFFFFFFFFFFLL, 0, 0);

  return v4;
}

- (unint64_t)count
{
  if (self)
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  return -[SBHIconGridContiguousRegion count](self, "count");
}

- (BOOL)isEmpty
{
  return -[SBHIconGridContiguousRegion count](self, "count") == 0;
}

- (BOOL)hasEmptyGridCells
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v3 = -[SBHIconGridContiguousRegion startGridCellIndex](self, "startGridCellIndex");
  v4 = -[SBHIconGridContiguousRegion endGridCellIndex](self, "endGridCellIndex");
  v5 = v3 + 1;
  do
  {
    v6 = v5;
    if (v5 >= v4)
      break;
    v7 = -[SBHIconGridContiguousRegion containsGridCellIndex:](self, "containsGridCellIndex:", v5);
    v5 = v6 + 1;
  }
  while (v7);
  return v6 < v4;
}

- (unint64_t)startGridCellIndex
{
  if (self)
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  return -[SBHIconGridContiguousRegion firstIndex](self, "firstIndex");
}

- (unint64_t)endGridCellIndex
{
  if (self)
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  return -[SBHIconGridContiguousRegion lastIndex](self, "lastIndex");
}

- (BOOL)containsGridCellIndex:(unint64_t)a3
{
  if (self)
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  return -[SBHIconGridContiguousRegion containsIndex:](self, "containsIndex:", a3);
}

- (BOOL)isGridCellIndexInternal:(unint64_t)a3
{
  return -[SBHIconGridContiguousRegion isGridCellIndexInternal:directions:](self, "isGridCellIndexInternal:directions:", a3, 15);
}

- (BOOL)isGridCellIndexInternal:(unint64_t)a3 directions:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int i;
  _QWORD v16[2];

  v8 = 0;
  v9 = 0;
  v10 = -[SBHIconGridContiguousRegion gridSize](self, "gridSize");
  while (1)
  {
    v11 = qword_1D0192FF8[v9];
    if (((a4 >> v11) & 1) != 0)
      break;
LABEL_7:
    v8 = v9++ > 2;
    if (v9 == 4)
      return 1;
  }
  v16[0] = a3;
  v16[1] = 65537;
  v5 = v5 & 0xFFFFFFFF00000000 | v10;
  v12 = v11;
  for (i = v5; SBHIconGridRangeOffset(v16, v12, 1, i); i = v4)
  {
    if (-[SBHIconGridContiguousRegion containsGridCellIndex:](self, "containsGridCellIndex:", v16[0]))
      goto LABEL_7;
    v4 = v4 & 0xFFFFFFFF00000000 | v10;
    v12 = v11;
  }
  return v8;
}

- (void)enumerateGridCellIndexesUsingBlock:(id)a3
{
  if (self)
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  -[SBHIconGridContiguousRegion enumerateIndexesUsingBlock:](self, "enumerateIndexesUsingBlock:", a3);
}

- (void)enumerateGridCellIndexesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  if (self)
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  -[SBHIconGridContiguousRegion enumerateIndexesWithOptions:usingBlock:](self, "enumerateIndexesWithOptions:usingBlock:", a3, a4);
}

- (void)enumerateEmptyGridCellIndexesUsingBlock:(id)a3
{
  id v4;
  NSIndexSet *gridCellIndexes;
  NSIndexSet *v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned __int16 v10;
  unint64_t v11;
  unint64_t v12;
  NSIndexSet *v13;
  id v14;
  _QWORD v15[4];
  NSIndexSet *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;

  v4 = a3;
  if (self)
    gridCellIndexes = self->_gridCellIndexes;
  else
    gridCellIndexes = 0;
  v6 = gridCellIndexes;
  v7 = -[SBHIconGridContiguousRegion gridRange](self, "gridRange");
  v9 = v8;
  v10 = (unsigned __int16)-[SBHIconGridContiguousRegion gridSize](self, "gridSize");
  v11 = -[SBHIconGridContiguousRegion startGridCellIndex](self, "startGridCellIndex");
  v12 = -[SBHIconGridContiguousRegion endGridCellIndex](self, "endGridCellIndex");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__SBHIconGridContiguousRegion_enumerateEmptyGridCellIndexesUsingBlock___block_invoke;
  v15[3] = &unk_1E8D8B230;
  v18 = v11;
  v19 = v12;
  v16 = v6;
  v17 = v4;
  v14 = v4;
  v13 = v6;
  SBHIconGridRangeEnumerateCellIndexes(v7, v9, v10, v15);

}

uint64_t __71__SBHIconGridContiguousRegion_enumerateEmptyGridCellIndexesUsingBlock___block_invoke(uint64_t result, unint64_t a2)
{
  uint64_t v2;

  if (*(_QWORD *)(result + 48) <= a2)
  {
    v2 = result;
    if (*(_QWORD *)(result + 56) >= a2)
    {
      result = objc_msgSend(*(id *)(result + 32), "containsIndex:", a2);
      if ((result & 1) == 0)
        return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
    }
  }
  return result;
}

- (id)subcontiguousRegionWithGridRange:(SBHIconGridRange)a3
{
  int size;
  unint64_t cellIndex;
  SBHIconGridSize v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  SBHIconGridSize v25;

  size = (int)a3.size;
  cellIndex = a3.cellIndex;
  v6 = (SBHIconGridSize)-[SBHIconGridContiguousRegion gridSize](self, "gridSize");
  v7 = -[SBHIconGridContiguousRegion gridRange](self, "gridRange");
  v8 = v6;
  v10 = SBHIconGridRangeIntersection(v7, v9, cellIndex, size, v6.columns);
  v12 = v11;
  v13 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __64__SBHIconGridContiguousRegion_subcontiguousRegionWithGridRange___block_invoke;
  v21 = &unk_1E8D8B258;
  v23 = v10;
  v24 = v12;
  v25 = v6;
  v22 = v13;
  v14 = v13;
  -[SBHIconGridContiguousRegion enumerateGridCellIndexesUsingBlock:](self, "enumerateGridCellIndexesUsingBlock:", &v18);
  v15 = objc_alloc((Class)objc_opt_class());
  v16 = (void *)objc_msgSend(v15, "initWithGridCellIndexes:inGridRange:gridSize:", v14, v10, v12, v8, v18, v19, v20, v21);

  return v16;
}

uint64_t __64__SBHIconGridContiguousRegion_subcontiguousRegionWithGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = SBHIconGridRangeContainsCellIndex(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_DWORD *)(a1 + 56));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
  return result;
}

- (id)contiguousRegionByRemovingGridCellIndexes:(id)a3
{
  id v4;
  SBHIconGridSize v5;
  NSIndexSet *gridCellIndexes;
  void *v7;
  id v8;
  SBHIconGridContiguousRegion *v9;
  _QWORD v11[5];
  SBHIconGridSize v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (SBHIconGridSize)-[SBHIconGridContiguousRegion gridSize](self, "gridSize");
    if (self)
      gridCellIndexes = self->_gridCellIndexes;
    else
      gridCellIndexes = 0;
    v7 = (void *)-[NSIndexSet mutableCopy](gridCellIndexes, "mutableCopy");
    objc_msgSend(v7, "removeIndexes:", v4);
    v13 = 0;
    v14 = &v13;
    v15 = 0x3010000000;
    v16 = &unk_1D01C8D52;
    v17 = xmmword_1D01912E0;
    DWORD2(v17) = 65537;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__SBHIconGridContiguousRegion_contiguousRegionByRemovingGridCellIndexes___block_invoke;
    v11[3] = &unk_1E8D8B280;
    v11[4] = &v13;
    v12 = v5;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v11);
    v8 = objc_alloc((Class)objc_opt_class());
    v9 = (SBHIconGridContiguousRegion *)objc_msgSend(v8, "initWithGridCellIndexes:inGridRange:gridSize:", v7, v14[4], v14[5], *(unsigned int *)&v5);
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v9 = self;
  }

  return v9;
}

unint64_t __73__SBHIconGridContiguousRegion_contiguousRegionByRemovingGridCellIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t result;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(_QWORD *)(v3 + 32);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(v3 + 32) = a2;
  }
  else
  {
    result = SBHIconGridRangeUnion(result, *(_QWORD *)(v3 + 40), a2, 65537, *(_DWORD *)(a1 + 40));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v5 + 32) = result;
    *(_QWORD *)(v5 + 40) = v6;
  }
  return result;
}

- (id)layoutDescription
{
  unint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  SBHIconGridSize v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  uint64_t v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SBHIconGridContiguousRegion gridRange](self, "gridRange");
  v6 = v5;
  v7 = (SBHIconGridSize)-[SBHIconGridContiguousRegion gridSize](self, "gridSize");
  if (v6 >= 0x10000)
  {
    v8 = 0;
    v9 = v7;
    do
    {
      v2 = v2 & 0xFFFFFFFF00000000 | v9;
      v10 = SBHIconGridRangeMinCellIndexOnRow(v15, v6, v2, v8);
      if ((_WORD)v6)
      {
        v11 = v10;
        v12 = (unsigned __int16)v6;
        do
        {
          if (-[SBHIconGridContiguousRegion containsGridCellIndex:](self, "containsGridCellIndex:", v11))
            v13 = CFSTR("*\t");
          else
            v13 = CFSTR("-\t");
          objc_msgSend(v4, "appendString:", v13);
          ++v11;
          --v12;
        }
        while (v12);
      }
      objc_msgSend(v4, "appendString:", CFSTR("\n"));
      ++v8;
    }
    while (v8 != WORD1(v6));
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconGridContiguousRegion *v4;
  void *v5;
  char isKindOfClass;
  SBHIconGridContiguousRegion *v7;
  NSIndexSet *gridCellIndexes;
  NSIndexSet *v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  BOOL v16;

  v4 = (SBHIconGridContiguousRegion *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (self)
        gridCellIndexes = self->_gridCellIndexes;
      else
        gridCellIndexes = 0;
      v9 = gridCellIndexes;
      v10 = BSEqualObjects();

      if (v10)
      {
        v11 = -[SBHIconGridContiguousRegion gridRange](self, "gridRange");
        v13 = v12;
        v14 = -[SBHIconGridContiguousRegion gridRange](v7, "gridRange");
        v16 = SBHIconGridRangeEqualToIconGridRange(v11, v13, v14, v15);
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  if (self)
    self = (SBHIconGridContiguousRegion *)self->_gridCellIndexes;
  return -[SBHIconGridContiguousRegion hash](self, "hash");
}

- (NSString)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  -[SBHIconGridContiguousRegion appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v3);
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  NSIndexSet *gridCellIndexes;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  if (self)
    gridCellIndexes = self->_gridCellIndexes;
  else
    gridCellIndexes = 0;
  v11 = v4;
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", gridCellIndexes, CFSTR("gridCellIndexes"));
  v7 = -[SBHIconGridContiguousRegion gridRange](self, "gridRange");
  SBHStringForIconGridRange(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v11, "appendObject:withName:", v9, CFSTR("gridRange"));

}

- (SBHIconGridRange)gridRange
{
  uint64_t v2;
  unint64_t cellIndex;
  SBHIconGridRange result;

  v2 = *(_QWORD *)&self->_gridRange.size.columns;
  cellIndex = self->_gridRange.cellIndex;
  result.size = (SBHIconGridSize)v2;
  result.cellIndex = cellIndex;
  return result;
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridCellIndexes, 0);
}

@end

@implementation SBIconListGridCellInfo

- (unint64_t)indexOfFirstUsedGridCellInGridRange:(SBHIconGridRange)a3
{
  int size;
  unint64_t cellIndex;
  unsigned __int16 v6;
  unint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  size = (int)a3.size;
  cellIndex = a3.cellIndex;
  v6 = (unsigned __int16)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SBIconListGridCellInfo_indexOfFirstUsedGridCellInGridRange___block_invoke;
  v9[3] = &unk_1E8D8AAD0;
  v9[4] = self;
  v9[5] = &v10;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v6, v9);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

uint64_t __62__SBIconListGridCellInfo_indexOfFirstUsedGridCellInGridRange___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)iconIndexForGridCellIndex:(unint64_t)a3
{
  unsigned __int16 *v3;
  unsigned __int16 *extraIconIndexes;
  unint64_t result;

  if (a3 > 0x3F)
  {
    extraIconIndexes = self->_extraIconIndexes;
    if (!extraIconIndexes || a3 - 64 >= self->_extraIconIndexesSize)
      return 0x7FFFFFFFFFFFFFFFLL;
    v3 = &extraIconIndexes[a3 - 64];
  }
  else
  {
    v3 = &self->_indexes[a3];
  }
  result = *v3;
  if (!*v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  if ((_DWORD)result == 0xFFFF)
    return 0;
  return result;
}

uint64_t __51__SBIconListGridCellInfo_setIconIndex_inGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconIndex:forGridCellIndex:", *(_QWORD *)(a1 + 40), a2);
}

- (void)setIconIndex:(unint64_t)a3 inGridRange:(SBHIconGridRange)a4
{
  int size;
  unint64_t cellIndex;
  unsigned __int16 v8;
  _QWORD v9[6];

  size = (int)a4.size;
  cellIndex = a4.cellIndex;
  v8 = (unsigned __int16)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__SBIconListGridCellInfo_setIconIndex_inGridRange___block_invoke;
  v9[3] = &unk_1E8D8A390;
  v9[4] = self;
  v9[5] = a3;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v8, v9);
}

- (void)setIconIndex:(unint64_t)a3 forGridCellIndex:(unint64_t)a4
{
  unint64_t v4;
  unint64_t maxGridCellIndex;
  BOOL v9;

  v4 = a4;
  setIndex((char *)a4, a3, (uint64_t)self->_indexes, 0, (void **)&self->_extraIconIndexes, &self->_extraIconIndexesSize);
  if (self)
    maxGridCellIndex = self->_maxGridCellIndex;
  else
    maxGridCellIndex = 0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = maxGridCellIndex >= v4 && maxGridCellIndex != 0x7FFFFFFFFFFFFFFFLL;
    if (!self || v9)
      return;
LABEL_16:
    self->_maxGridCellIndex = v4;
    return;
  }
  if (maxGridCellIndex <= v4)
  {
    while (maxGridCellIndex)
    {
      if (-[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", --maxGridCellIndex) != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_19;
    }
    maxGridCellIndex = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:
    v4 = maxGridCellIndex;
    if (self)
      goto LABEL_16;
  }
}

- (void)setGridCellIndex:(unint64_t)a3 forIconIndex:(unint64_t)a4
{
  setIndex((char *)a4, a3, (uint64_t)self->_indexes, 64, (void **)&self->_extraGridCellIndexes, &self->_extraGridCellIndexesSize);
}

uint64_t __45__SBIconListGridCellInfo_numberOfUsedColumns__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3
{
  unsigned __int16 *v3;
  unsigned __int16 *extraGridCellIndexes;
  unint64_t result;

  if (a3 > 0x3F)
  {
    extraGridCellIndexes = self->_extraGridCellIndexes;
    if (!extraGridCellIndexes || a3 - 64 >= self->_extraGridCellIndexesSize)
      return 0x7FFFFFFFFFFFFFFFLL;
    v3 = &extraGridCellIndexes[a3 - 64];
  }
  else
  {
    v3 = &self->_indexes[a3 + 64];
  }
  result = *v3;
  if (!*v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  if ((_DWORD)result == 0xFFFF)
    return 0;
  return result;
}

- (SBIconCoordinate)coordinateForGridCellIndex:(unint64_t)a3
{
  unint64_t v3;
  int64_t v4;
  SBIconCoordinate result;

  v3 = SBIconCoordinateMakeWithGridCellIndex(a3, -[SBIconListGridCellInfo gridSize](self, "gridSize"));
  result.row = v4;
  result.column = v3;
  return result;
}

- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3
{
  return SBIconCoordinateGetGridCellIndex(a3.column, a3.row, -[SBIconListGridCellInfo gridSize](self, "gridSize"));
}

- (SBIconApproximateLayoutPosition)approximateLayoutPositionForCoordinate:(SBIconCoordinate)a3
{
  unint64_t row;
  unint64_t column;
  SBHIconGridSize v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  SBIconApproximateLayoutPosition result;

  row = a3.row;
  column = a3.column;
  v5 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v6 = v5.rows / 3u;
  if (HIWORD(*(unsigned int *)&v5) <= 4u && v5.rows % 3u)
  {
    if (row > *(unsigned int *)&v5 >> 17)
    {
      v7 = 3;
      goto LABEL_10;
    }
LABEL_9:
    v7 = 1;
    goto LABEL_10;
  }
  if (row <= v6)
    goto LABEL_9;
  if (row <= 2 * v6)
    v7 = 2;
  else
    v7 = 3;
LABEL_10:
  v8 = v5.columns / 3u;
  if (v5.columns <= 4u && v5.columns % 3u)
  {
    if (column > v5.columns >> 1)
    {
      v9 = 3;
      goto LABEL_19;
    }
LABEL_18:
    v9 = 1;
    goto LABEL_19;
  }
  if (column <= v8)
    goto LABEL_18;
  if (column <= 2 * v8)
    v9 = 2;
  else
    v9 = 3;
LABEL_19:
  result.vertical = v7;
  result.horizontal = v9;
  return result;
}

- (SBIconListGridCellInfo)init
{
  return -[SBIconListGridCellInfo initWithGridSize:](self, "initWithGridSize:", 0);
}

- (unint64_t)numberOfUsedColumns
{
  unint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = (unint64_t)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v4 = (unsigned __int16)v3;
  v5 = (-[SBIconListGridCellInfo numberOfUsedRows](self, "numberOfUsedRows") << 16) | 1;
  v6 = v3;
  do
  {
    v7 = v4;
    if (!v4)
      break;
    --v4;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__SBIconListGridCellInfo_numberOfUsedColumns__block_invoke;
    v10[3] = &unk_1E8D8AAD0;
    v3 = v3 & 0xFFFFFFFF00000000 | v6;
    v10[4] = self;
    v10[5] = &v11;
    SBHIconGridRangeEnumerateCellIndexes(v7 - 1, v5, v3, v10);
    v8 = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  while (!v8);
  return v7;
}

- (unint64_t)numberOfUsedRows
{
  unsigned __int16 v3;
  unint64_t maxGridCellIndex;

  v3 = (unsigned __int16)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  if (self)
  {
    maxGridCellIndex = self->_maxGridCellIndex;
    if (maxGridCellIndex == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  else
  {
    maxGridCellIndex = 0;
  }
  return maxGridCellIndex / v3 + 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outOfBoundsIconIndexes, 0);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_extraGridCellIndexes);
  free(self->_extraIconIndexes);
  v3.receiver = self;
  v3.super_class = (Class)SBIconListGridCellInfo;
  -[SBIconListGridCellInfo dealloc](&v3, sel_dealloc);
}

- (SBIconListGridCellInfo)initWithGridSize:(SBHIconGridSize)a3
{
  SBIconListGridCellInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIconListGridCellInfo;
  result = -[SBIconListGridCellInfo init](&v5, sel_init);
  if (result)
  {
    result->_gridSize = a3;
    result->_maxGridCellIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)setIconIndex:(unint64_t)a3 inContiguousRegion:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SBIconListGridCellInfo_setIconIndex_inContiguousRegion___block_invoke;
  v4[3] = &unk_1E8D8A390;
  v4[4] = self;
  v4[5] = a3;
  objc_msgSend(a4, "enumerateGridCellIndexesUsingBlock:", v4);
}

uint64_t __58__SBIconListGridCellInfo_setIconIndex_inContiguousRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconIndex:forGridCellIndex:", *(_QWORD *)(a1 + 40), a2);
}

- (SBHIconGridSize)usedGridSize
{
  unsigned __int16 v3;

  v3 = -[SBIconListGridCellInfo numberOfUsedColumns](self, "numberOfUsedColumns");
  return (SBHIconGridSize)(v3 | ((unsigned __int16)-[SBIconListGridCellInfo numberOfUsedRows](self, "numberOfUsedRows") << 16));
}

- (void)clearAllIconAndGridCellIndexes
{
  unsigned __int16 *extraGridCellIndexes;
  unsigned __int16 *extraIconIndexes;

  extraGridCellIndexes = self->_extraGridCellIndexes;
  if (extraGridCellIndexes)
  {
    free(extraGridCellIndexes);
    self->_extraGridCellIndexes = 0;
    self->_extraGridCellIndexesSize = 0;
  }
  extraIconIndexes = self->_extraIconIndexes;
  if (extraIconIndexes)
  {
    free(extraIconIndexes);
    self->_extraIconIndexes = 0;
    self->_extraIconIndexesSize = 0;
  }
  *(_OWORD *)&self->_indexes[120] = 0u;
  *(_OWORD *)&self->_indexes[112] = 0u;
  *(_OWORD *)&self->_indexes[104] = 0u;
  *(_OWORD *)&self->_indexes[96] = 0u;
  *(_OWORD *)&self->_indexes[88] = 0u;
  *(_OWORD *)&self->_indexes[80] = 0u;
  *(_OWORD *)&self->_indexes[72] = 0u;
  *(_OWORD *)&self->_indexes[64] = 0u;
  *(_OWORD *)&self->_indexes[56] = 0u;
  *(_OWORD *)&self->_indexes[48] = 0u;
  *(_OWORD *)&self->_indexes[40] = 0u;
  *(_OWORD *)&self->_indexes[32] = 0u;
  *(_OWORD *)&self->_indexes[24] = 0u;
  *(_OWORD *)&self->_indexes[16] = 0u;
  *(_OWORD *)&self->_indexes[8] = 0u;
  *(_OWORD *)self->_indexes = 0u;
}

- (unint64_t)getIconIndexes:(unint64_t *)a3 inGridRange:(SBHIconGridRange)a4
{
  int size;
  unint64_t cellIndex;
  unsigned __int16 v8;
  unint64_t v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];

  size = (int)a4.size;
  cellIndex = a4.cellIndex;
  v8 = (unsigned __int16)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__SBIconListGridCellInfo_getIconIndexes_inGridRange___block_invoke;
  v11[3] = &unk_1E8D8B320;
  v11[4] = self;
  v11[5] = v16;
  v11[6] = &v12;
  v11[7] = a3;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v8, v11);
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);
  return v9;
}

uint64_t __53__SBIconListGridCellInfo_getIconIndexes_inGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6 + 1;
  *(_QWORD *)(v4 + 8 * v6) = result;
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return result;
}

- (unint64_t)getUniqueIconIndexes:(unint64_t *)a3 inGridRange:(SBHIconGridRange)a4
{
  uint64_t v4;
  unint64_t cellIndex;
  unsigned int Area;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v19;
  _BYTE v21[256];
  uint64_t v22;

  v4 = *(_QWORD *)&a4.size.columns;
  cellIndex = a4.cellIndex;
  v22 = *MEMORY[0x1E0C80C00];
  Area = SBHIconGridSizeGetArea(*(_DWORD *)&a4.size);
  v8 = Area;
  if (Area >= 0x20)
  {
    v9 = malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
    v10 = -[SBIconListGridCellInfo getIconIndexes:inGridRange:](self, "getIconIndexes:inGridRange:", v9, cellIndex, v4, v9);
  }
  else
  {
    v9 = v21;
    v10 = -[SBIconListGridCellInfo getIconIndexes:inGridRange:](self, "getIconIndexes:inGridRange:", v21, cellIndex, v4, 0);
  }
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0;
  if ((_DWORD)v8 && v11)
  {
    v14 = 0;
    v15 = 0;
    v13 = 0;
    do
    {
      v16 = *(_QWORD *)&v9[8 * v14];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        ++v15;
        if ((objc_msgSend(v12, "containsObject:", v17) & 1) == 0)
        {
          objc_msgSend(v12, "addObject:", v17);
          a3[v13++] = v16;
        }
      }

      ++v14;
    }
    while (v14 < v8 && v15 < v11);
  }
  free(v19);

  return v13;
}

- (void)setIconIndexes:(unint64_t *)a3 inGridRange:(SBHIconGridRange)a4
{
  int size;
  unint64_t cellIndex;
  unsigned __int16 v8;
  _QWORD v9[7];
  _QWORD v10[4];

  size = (int)a4.size;
  cellIndex = a4.cellIndex;
  v8 = (unsigned __int16)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SBIconListGridCellInfo_setIconIndexes_inGridRange___block_invoke;
  v9[3] = &unk_1E8D8B348;
  v9[5] = v10;
  v9[6] = a3;
  v9[4] = self;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v8, v9);
  _Block_object_dispose(v10, 8);
}

uint64_t __53__SBIconListGridCellInfo_setIconIndexes_inGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  return objc_msgSend(*(id *)(a1 + 32), "setIconIndex:forGridCellIndex:", *(_QWORD *)(v2 + 8 * v4), a2);
}

- (unint64_t)iconIndexForCoordinate:(SBIconCoordinate)a3
{
  unint64_t v4;

  v4 = -[SBIconListGridCellInfo gridCellIndexForCoordinate:](self, "gridCellIndexForCoordinate:", a3.column, a3.row);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", v4);
}

- (unint64_t)numberOfUsedGridCellsInRow:(unint64_t)a3
{
  return -[SBIconListGridCellInfo numberOfUsedGridCellsInRow:columnRange:](self, "numberOfUsedGridCellsInRow:columnRange:", a3, 0, -[SBIconListGridCellInfo numberOfUsedColumns](self, "numberOfUsedColumns"));
}

- (unint64_t)numberOfUsedGridCellsInRow:(unint64_t)a3 columnRange:(_NSRange)a4
{
  NSUInteger length;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if (!a4.length)
    return 0;
  length = a4.length;
  v6 = 0;
  v7 = 0;
  v8 = a3 + 1;
  do
  {
    if (-[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", -[SBIconListGridCellInfo gridCellIndexForCoordinate:](self, "gridCellIndexForCoordinate:", ++v7, v8)) != 0x7FFFFFFFFFFFFFFFLL)++v6;
  }
  while (length != v7);
  return v6;
}

- (unint64_t)numberOfUsedGridCellsInColumn:(unint64_t)a3
{
  return -[SBIconListGridCellInfo numberOfUsedGridCellsInColumn:rowRange:](self, "numberOfUsedGridCellsInColumn:rowRange:", a3, 0, -[SBIconListGridCellInfo gridSize](self, "gridSize") >> 16);
}

- (unint64_t)numberOfUsedGridCellsInColumn:(unint64_t)a3 rowRange:(_NSRange)a4
{
  NSUInteger length;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if (!a4.length)
    return 0;
  length = a4.length;
  v6 = 0;
  v7 = 0;
  v8 = a3 + 1;
  do
  {
    if (-[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", -[SBIconListGridCellInfo gridCellIndexForCoordinate:](self, "gridCellIndexForCoordinate:", v8, ++v7)) != 0x7FFFFFFFFFFFFFFFLL)++v6;
  }
  while (length != v7);
  return v6;
}

- (unint64_t)numberOfUsedGridCellsInGridRange:(SBHIconGridRange)a3
{
  int size;
  unint64_t cellIndex;
  unsigned __int16 v6;
  unint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  size = (int)a3.size;
  cellIndex = a3.cellIndex;
  v6 = (unsigned __int16)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SBIconListGridCellInfo_numberOfUsedGridCellsInGridRange___block_invoke;
  v9[3] = &unk_1E8D8AAD0;
  v9[4] = self;
  v9[5] = &v10;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v6, v9);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __59__SBIconListGridCellInfo_numberOfUsedGridCellsInGridRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (unint64_t)maxGridCellIndexForIconIndex:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = -[SBIconListGridCellInfo gridCellIndexForIconIndex:](self, "gridCellIndexForIconIndex:", a3);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    do
    {
      v5 = v4;
      v7 = -[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", v6);
      v4 = v6++;
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }
  return v5;
}

- (SBHIconGridSize)gridSizeForGridCellIndex:(unint64_t)a3
{
  SBHIconGridSize v3;

  -[SBIconListGridCellInfo gridRangeForGridCellIndex:](self, "gridRangeForGridCellIndex:", a3);
  return v3;
}

- (SBHIconGridRange)gridRangeForGridCellIndex:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int16 v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD aBlock[11];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  SBHIconGridRange result;

  v5 = -[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = v5;
    v9 = (unsigned __int16)-[SBIconListGridCellInfo gridSize](self, "gridSize");
    v10 = -[SBIconListGridCellInfo numberOfUsedRows](self, "numberOfUsedRows");
    v11 = -[SBIconListGridCellInfo numberOfUsedColumns](self, "numberOfUsedColumns");
    v12 = -[SBIconListGridCellInfo coordinateForGridCellIndex:](self, "coordinateForGridCellIndex:", a3);
    v18 = 0;
    v19 = &v18;
    v20 = 0x3010000000;
    v22 = a3;
    v23 = 65537;
    v21 = &unk_1D01C8D52;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__SBIconListGridCellInfo_gridRangeForGridCellIndex___block_invoke;
    aBlock[3] = &unk_1E8D8B370;
    aBlock[6] = v12;
    aBlock[7] = v13;
    aBlock[8] = v10;
    aBlock[9] = v11;
    aBlock[10] = v8;
    aBlock[4] = self;
    aBlock[5] = &v18;
    v14 = _Block_copy(aBlock);
    (*((void (**)(void *, _QWORD, uint64_t, uint64_t, _QWORD))v14 + 2))(v14, 0, -1, 0x10000, -v9);
    (*((void (**)(void *, _QWORD, uint64_t, uint64_t, _QWORD))v14 + 2))(v14, 0, 1, 0x10000, 0);
    (*((void (**)(void *, uint64_t, _QWORD, uint64_t, uint64_t))v14 + 2))(v14, -1, 0, 1, -1);
    (*((void (**)(void *, uint64_t, _QWORD, uint64_t, _QWORD))v14 + 2))(v14, 1, 0, 1, 0);
    v6 = v19[4];
    v7 = v19[5];

    _Block_object_dispose(&v18, 8);
  }
  v15 = v6;
  v16 = v7;
  result.size = (SBHIconGridSize)v16;
  result.cellIndex = v15;
  return result;
}

uint64_t __52__SBIconListGridCellInfo_gridRangeForGridCellIndex___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(result + 48);
  v6 = *(_QWORD *)(result + 56);
  if (v6 + a3 >= 1 && v5 + a2 >= 1)
  {
    v12 = result;
    v13 = 2 * a3;
    v14 = 2 * a2;
    do
    {
      if ((unint64_t)(a3 + v6) > *(_QWORD *)(v12 + 64))
        break;
      if ((unint64_t)(a2 + v5) > *(_QWORD *)(v12 + 72))
        break;
      result = objc_msgSend(*(id *)(v12 + 32), "iconIndexForGridCellIndex:", objc_msgSend(*(id *)(v12 + 32), "gridCellIndexForCoordinate:"));
      if (result != *(_QWORD *)(v12 + 80))
        break;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 40) + 8) + 32) += a5;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 40) + 8) + 42) += HIWORD(a4);
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 40) + 8) + 40) += a4;
      if (v13 + v6 < 1)
        break;
      v15 = v14 + v5;
      v6 += a3;
      v5 += a2;
    }
    while (v15 > 0);
  }
  return result;
}

- (BOOL)isLayoutOutOfBounds
{
  SBHIconGridSize v3;
  unsigned __int16 columns;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  columns = v3.columns;
  v5 = HIWORD(*(unsigned int *)&v3);
  v6 = -[SBIconListGridCellInfo numberOfUsedRows](self, "numberOfUsedRows");
  v7 = -[SBIconListGridCellInfo numberOfUsedColumns](self, "numberOfUsedColumns");
  return v6 > v5 || v7 > columns || -[NSMutableIndexSet count](self->_outOfBoundsIconIndexes, "count") != 0;
}

- (unint64_t)indexOfOutOfBoundsIconInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;

  if (!a3.length)
    return 0x7FFFFFFFFFFFFFFFLL;
  length = a3.length;
  location = a3.location;
  v6 = 0;
  while (!-[SBIconListGridCellInfo isOutOfBoundsAtIconIndex:](self, "isOutOfBoundsAtIconIndex:", location + v6))
  {
    if (length == ++v6)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

- (id)indexesOfOutOfBoundsIconInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id i;

  length = a3.length;
  location = a3.location;
  for (i = objc_alloc_init(MEMORY[0x1E0CB3788]); length; --length)
  {
    if (-[SBIconListGridCellInfo isOutOfBoundsAtIconIndex:](self, "isOutOfBoundsAtIconIndex:", location))
      objc_msgSend(i, "addIndex:", location);
    ++location;
  }
  return i;
}

- (NSIndexSet)indexesOfOutOfBoundsIcons
{
  return (NSIndexSet *)self->_outOfBoundsIconIndexes;
}

- (BOOL)isOutOfBoundsAtIconIndex:(unint64_t)a3
{
  SBHIconGridSize v6;
  unsigned __int16 columns;
  unint64_t v8;
  unint64_t v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  uint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;

  if ((-[NSMutableIndexSet containsIndex:](self->_outOfBoundsIconIndexes, "containsIndex:") & 1) != 0)
    return 1;
  v6 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  columns = v6.columns;
  v8 = HIWORD(*(unsigned int *)&v6);
  v9 = -[SBIconListGridCellInfo gridCellIndexForIconIndex:](self, "gridCellIndexForIconIndex:", a3);
  -[SBIconListGridCellInfo gridRangeForGridCellIndex:](self, "gridRangeForGridCellIndex:", v9);
  v11 = v10;
  v14 = -[SBIconListGridCellInfo coordinateForGridCellIndex:](self, "coordinateForGridCellIndex:", v9) + v13 - 2;
  return v12 + (unint64_t)v11 - 2 >= v8 || v14 >= columns;
}

- (void)enumerateOutOfBoundsIconIndexesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v5;
  NSUInteger length;
  NSUInteger location;
  void (**v9)(id, unint64_t, _BYTE *);
  unint64_t v10;
  BOOL v11;
  unint64_t i;
  BOOL v13;
  char v14;
  char v15;

  v5 = a4;
  length = a3.length;
  location = a3.location;
  v9 = (void (**)(id, unint64_t, _BYTE *))a5;
  if ((v5 & 2) != 0)
  {
    if (location + length > location)
    {
      for (i = location + length - 1; ; --i)
      {
        if (-[SBIconListGridCellInfo isOutOfBoundsAtIconIndex:](self, "isOutOfBoundsAtIconIndex:", i))
        {
          v15 = 0;
          v9[2](v9, i, &v15);
          if (v15)
            v13 = 0;
          else
            v13 = i > location;
          if (!v13)
            break;
        }
        else if (i <= location)
        {
          break;
        }
      }
    }
  }
  else if (length)
  {
    v10 = 0;
    do
    {
      while (!-[SBIconListGridCellInfo isOutOfBoundsAtIconIndex:](self, "isOutOfBoundsAtIconIndex:", v10 + location))
      {
        if (++v10 >= length)
          goto LABEL_23;
      }
      v14 = 0;
      v9[2](v9, v10 + location, &v14);
      ++v10;
      if (v14)
        v11 = 1;
      else
        v11 = v10 >= length;
    }
    while (!v11);
  }
LABEL_23:

}

- (unint64_t)firstEmptyGridCellIndex
{
  return -[SBIconListGridCellInfo indexOfFirstEmptyGridCellRangeOfSize:](self, "indexOfFirstEmptyGridCellRangeOfSize:", 65537);
}

- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3
{
  return -[SBIconListGridCellInfo indexOfFirstEmptyGridCellRangeOfSize:flipped:](self, "indexOfFirstEmptyGridCellRangeOfSize:flipped:", *(unsigned int *)&a3, 0);
}

- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3 flipped:(BOOL)a4
{
  return -[SBIconListGridCellInfo indexOfFirstEmptyGridCellRangeOfSize:inGridRange:flipped:](self, "indexOfFirstEmptyGridCellRangeOfSize:inGridRange:flipped:", *(unsigned int *)&a3, 0, -[SBIconListGridCellInfo gridSize](self, "gridSize"), a4);
}

- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3 inGridRange:(SBHIconGridRange)a4 flipped:(BOOL)a5
{
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__SBIconListGridCellInfo_indexOfFirstEmptyGridCellRangeOfSize_inGridRange_flipped___block_invoke;
  v7[3] = &unk_1E8D8B398;
  v7[4] = &v8;
  -[SBIconListGridCellInfo enumerateEmptyGridCellRangesOfSize:inGridRange:flipped:usingBlock:](self, "enumerateEmptyGridCellRangesOfSize:inGridRange:flipped:usingBlock:", *(unsigned int *)&a3, a4.cellIndex, *(_QWORD *)&a4.size.columns, a5, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __83__SBIconListGridCellInfo_indexOfFirstEmptyGridCellRangeOfSize_inGridRange_flipped___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (unint64_t)indexOfFirstEmptyGridCellRangeOfSize:(SBHIconGridSize)a3 inGridCellIndexRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  SBHIconGridSize v8;
  _QWORD v10[6];

  length = a4.length;
  location = a4.location;
  v8 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__SBIconListGridCellInfo_indexOfFirstEmptyGridCellRangeOfSize_inGridCellIndexRange___block_invoke;
  v10[3] = &__block_descriptor_48_e51_B32__0_SBHIconGridRange_Q_SBHIconGridSize_SS__8_Q24l;
  v10[4] = location;
  v10[5] = length;
  return -[SBIconListGridCellInfo indexOfFirstGridCellRangeOfSize:inGridRange:passingTest:](self, "indexOfFirstGridCellRangeOfSize:inGridRange:passingTest:", *(unsigned int *)&a3, 0, *(unsigned int *)&v8, v10);
}

BOOL __84__SBIconListGridCellInfo_indexOfFirstEmptyGridCellRangeOfSize_inGridCellIndexRange___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  BOOL v6;

  v4 = *(_QWORD *)(a1 + 32);
  v6 = a2 >= v4;
  v5 = a2 - v4;
  v6 = !v6 || v5 >= *(_QWORD *)(a1 + 40);
  return !v6 && *a4 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateEmptyGridCellRangesOfSize:(SBHIconGridSize)a3 inGridRange:(SBHIconGridRange)a4 flipped:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL4 v6;
  int size;
  unint64_t cellIndex;
  id v11;
  unsigned __int16 v12;
  unsigned int Area;
  unsigned int v14;
  char *v15;
  char *v16;
  char v17;
  id v18;
  _QWORD v19[5];
  id v20;
  char *v21;
  unsigned int v22;
  char v23;
  uint64_t v24;

  v6 = a5;
  size = (int)a4.size;
  cellIndex = a4.cellIndex;
  v24 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = (unsigned __int16)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  Area = SBHIconGridSizeGetArea(*(_DWORD *)&a3);
  v14 = Area;
  if (Area >= 0x20)
  {
    v15 = (char *)malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
    v16 = v15;
  }
  else
  {
    v15 = 0;
    v16 = &v23;
  }
  if (v6)
    v17 = 3;
  else
    v17 = 1;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__SBIconListGridCellInfo_enumerateEmptyGridCellRangesOfSize_inGridRange_flipped_usingBlock___block_invoke;
  v19[3] = &unk_1E8D8B3E0;
  v20 = v11;
  v21 = v16;
  v22 = v14;
  v19[4] = self;
  v18 = v11;
  SBHIconGridRangeEnumerateSubranges(cellIndex, size, *(_DWORD *)&a3, v12, v17, v19);
  free(v15);

}

uint64_t __92__SBIconListGridCellInfo_enumerateEmptyGridCellRangesOfSize_inGridRange_flipped_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "getIconIndexes:inGridRange:", *(_QWORD *)(a1 + 48), a2, a3);
  v5 = *(unsigned int *)(a1 + 56);
  if (!(_DWORD)v5)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = *(uint64_t **)(a1 + 48);
  while (1)
  {
    v7 = *v6++;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      break;
    if (!--v5)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

- (unint64_t)numberOfEmptyGridCells
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SBIconListGridCellInfo_numberOfEmptyGridCells__block_invoke;
  v4[3] = &unk_1E8D8B408;
  v4[4] = &v5;
  -[SBIconListGridCellInfo enumerateEmptyGridCellIndexesUsingBlock:](self, "enumerateEmptyGridCellIndexesUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __48__SBIconListGridCellInfo_numberOfEmptyGridCells__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (unint64_t)indexOfFirstGridCellRangeOfSize:(SBHIconGridSize)a3 inGridRange:(SBHIconGridRange)a4 passingTest:(id)a5
{
  unint64_t cellIndex;
  id v8;
  unint64_t v9;

  cellIndex = a4.cellIndex;
  v8 = a5;
  v9 = -[SBIconListGridCellInfo indexOfFirstGridCellRangeOfSize:inGridCellIndexRange:passingTest:](self, "indexOfFirstGridCellRangeOfSize:inGridCellIndexRange:passingTest:", *(unsigned int *)&a3, cellIndex, SBHIconGridSizeGetArea(-[SBIconListGridCellInfo gridSize](self, "gridSize")) - cellIndex, v8);

  return v9;
}

- (unint64_t)indexOfFirstGridCellRangeOfSize:(SBHIconGridSize)a3 inGridCellIndexRange:(_NSRange)a4 passingTest:(id)a5
{
  NSUInteger location;
  unint64_t v6;
  uint64_t (**v8)(id, unint64_t, uint64_t, _BYTE *);
  SBHIconGridSize v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int Area;
  char *v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int i;
  unint64_t v22;
  int v24;
  int columns;
  unsigned int v26;
  unsigned int v27;
  SBIconListGridCellInfo *v28;
  NSUInteger length;
  NSUInteger v30;
  char v31;
  uint64_t v32;

  length = a4.length;
  location = a4.location;
  v6 = *(_QWORD *)&a3.columns;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t (**)(id, unint64_t, uint64_t, _BYTE *))a5;
  v9 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v28 = self;
  v30 = location;
  v10 = -[SBIconListGridCellInfo coordinateForGridCellIndex:](self, "coordinateForGridCellIndex:", location);
  v12 = v11;
  v13 = v6;
  Area = SBHIconGridSizeGetArea(v6);
  if (Area >= 0x20)
    v15 = (char *)malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
  else
    v15 = &v31;
  v16 = v12 - 1;
  v27 = (unsigned __int16)(v9.rows - WORD1(v6) + 1);
  if (v27 > (unsigned __int16)(v12 - 1))
  {
    v17 = v9;
    v18 = (unsigned __int16)(v9.columns - v6 + 1);
    columns = v9.columns;
    v26 = (unsigned __int16)(v10 - 1);
    v24 = v10 - 1;
    v19 = (unsigned __int16)v16 * v9.columns + v26;
    do
    {
      if (v18 > v26)
      {
        v20 = v19;
        for (i = v24; v18 > (unsigned __int16)i; ++i)
        {
          v22 = v20;
          v6 = v6 & 0xFFFFFFFF00000000 | v17;
          if (SBHIconGridRangeContainsIconGridRange(0, v17, v20, v13, v6))
          {
            if (v22 < v30 || v22 - v30 >= length)
              break;
            -[SBIconListGridCellInfo getIconIndexes:inGridRange:](v28, "getIconIndexes:inGridRange:", v15, v22, v13);
            if ((v8[2](v8, v22, v13, v15) & 1) != 0)
              goto LABEL_15;
          }
          v20 = v22 + 1;
        }
      }
      ++v16;
      v19 += columns;
    }
    while (v27 > (unsigned __int16)v16);
  }
  v22 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  return v22;
}

- (unint64_t)indexOfLastUsedGridCellInGridRange:(SBHIconGridRange)a3
{
  int size;
  unint64_t cellIndex;
  unsigned __int16 v6;
  unint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  size = (int)a3.size;
  cellIndex = a3.cellIndex;
  v6 = (unsigned __int16)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SBIconListGridCellInfo_indexOfLastUsedGridCellInGridRange___block_invoke;
  v9[3] = &unk_1E8D8B430;
  v9[4] = self;
  v9[5] = &v10;
  SBHIconGridRangeEnumerateSubranges(cellIndex, size, 65537, v6, 4, v9);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __61__SBIconListGridCellInfo_indexOfLastUsedGridCellInGridRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)lastUsedGridCellIndex
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unsigned __int16 v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[SBIconListGridCellInfo numberOfUsedRows](self, "numberOfUsedRows");
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    v5 = v3;
    v6 = (unsigned __int16)-[SBIconListGridCellInfo gridSize](self, "gridSize");
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__SBIconListGridCellInfo_lastUsedGridCellIndex__block_invoke;
    v8[3] = &unk_1E8D8AAD0;
    v8[4] = self;
    v8[5] = &v9;
    SBHIconGridRangeEnumerateCellIndexes((v5 - 1) * v6, v6 | 0x10000, v6, v8);
    v4 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  return v4;
}

uint64_t __47__SBIconListGridCellInfo_lastUsedGridCellIndex__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return result;
}

- (unint64_t)firstTrailingEmptyGridCellIndex
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  SBHIconGridSize v7;

  v3 = -[SBIconListGridCellInfo lastUsedGridCellIndex](self, "lastUsedGridCellIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = v3;
  v6 = v3 + 1;
  v7 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  if (v6 < HIWORD(*(unsigned int *)&v7) * v7.columns)
    return v5 + 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateEmptyGridCellIndexesUsingBlock:(id)a3
{
  void (**v4)(id, unint64_t, _BYTE *);
  SBHIconGridSize v5;
  unint64_t maxGridCellIndex;
  unsigned int Area;
  unint64_t v8;
  BOOL v9;
  char v10;

  v4 = (void (**)(id, unint64_t, _BYTE *))a3;
  v5 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  if (*(unsigned int *)&v5 <= 0xFFFEFFFF)
  {
    Area = SBHIconGridSizeGetArea(*(_DWORD *)&v5);
    maxGridCellIndex = Area;
    if (!Area)
      goto LABEL_15;
  }
  else
  {
    if (!self)
      goto LABEL_15;
    maxGridCellIndex = self->_maxGridCellIndex;
    if (!maxGridCellIndex)
      goto LABEL_15;
  }
  v8 = 0;
  do
  {
    while (-[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", v8) != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (++v8 >= maxGridCellIndex)
        goto LABEL_15;
    }
    v10 = 0;
    v4[2](v4, v8++, &v10);
    if (v10)
      v9 = 1;
    else
      v9 = v8 >= maxGridCellIndex;
  }
  while (!v9);
LABEL_15:

}

- (unint64_t)countOfIconsOfSize:(SBHIconGridSize)a3
{
  unint64_t v3;
  unint64_t maxGridCellIndex;
  unint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unsigned __int16 v14;
  unint64_t v15;

  if (self)
  {
    maxGridCellIndex = self->_maxGridCellIndex;
    if (maxGridCellIndex == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    v7 = *(_QWORD *)&a3.columns;
    v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    if (maxGridCellIndex)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        v11 = -[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", v9);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = v11;
          if ((objc_msgSend(v8, "containsIndex:", v11) & 1) == 0
            && -[SBIconListGridCellInfo gridRangeForGridCellIndex:](self, "gridRangeForGridCellIndex:", v9) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v14 = v13;
            v3 = v3 & 0xFFFFFFFF00000000 | v13;
            v7 = v7 & 0xFFFFFFFF00000000 | v10;
            if (SBHIconGridSizeEqualToIconGridSize(v3, v7))
            {
              objc_msgSend(v8, "addIndex:", v12);
              v9 = v9 + v14 - 1;
            }
          }
        }
        ++v9;
      }
      while (v9 < maxGridCellIndex);
    }
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  }
  v15 = objc_msgSend(v8, "count");

  return v15;
}

- (void)addEmptyColumns:(unint64_t)a3
{
  SBHIconGridSize v5;
  uint64_t columns;
  unint64_t v7;
  unsigned int v8;
  unsigned int Area;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  if (a3)
  {
    v5 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
    columns = v5.columns;
    v7 = v5.columns + a3;
    if (__CFADD__(v5.columns, a3) || v7 >= 0x10000)
    {
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Too many columns to addEmptyColumns: %lu (prior: %lu)"), a3, v5.columns);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v24);
    }
    v8 = v5;
    Area = SBHIconGridSizeGetArea(*(_DWORD *)&v5);
    if (Area)
    {
      v10 = Area - 1;
      do
      {
        -[SBIconListGridCellInfo coordinateForGridCellIndex:](self, "coordinateForGridCellIndex:", v10);
        v12 = v10 + (v11 - 1) * a3;
        v13 = -[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", v10);
        -[SBIconListGridCellInfo setIconIndex:forGridCellIndex:](self, "setIconIndex:forGridCellIndex:", v13, v12);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          -[SBIconListGridCellInfo setGridCellIndex:forIconIndex:](self, "setGridCellIndex:forIconIndex:", v12, v13);
        --v10;
      }
      while (v10 != -1);
    }
    self->_gridSize.columns = v7;
    if (v8 >= 0x10000)
    {
      v14 = 0;
      v15 = HIWORD(v8);
      if (a3 <= 1)
        v16 = 1;
      else
        v16 = a3;
      if (v15 <= 1)
        v17 = 1;
      else
        v17 = v15;
      v18 = columns + 1;
      do
      {
        ++v14;
        v19 = v18;
        v20 = v16;
        do
        {
          -[SBIconListGridCellInfo setIconIndex:forGridCellIndex:](self, "setIconIndex:forGridCellIndex:", 0x7FFFFFFFFFFFFFFFLL, -[SBIconListGridCellInfo gridCellIndexForCoordinate:](self, "gridCellIndexForCoordinate:", v19++, v14));
          --v20;
        }
        while (v20);
      }
      while (v14 != v17);
    }
  }
}

- (void)addEmptyRows:(unint64_t)a3
{
  uint64_t rows;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  rows = self->_gridSize.rows;
  v4 = rows + a3;
  if (__CFADD__(rows, a3) || v4 >= 0x10000)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Too many rows to addEmptyRows: %lu (prior: %lu)"), a3, rows);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v8);
  }
  self->_gridSize.rows = v4;
}

- (SBIconApproximateLayoutPosition)approximateLayoutPositionForGridCellIndex:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  SBIconApproximateLayoutPosition result;

  v4 = -[SBIconListGridCellInfo coordinateForGridCellIndex:](self, "coordinateForGridCellIndex:", a3);
  v6 = -[SBIconListGridCellInfo approximateLayoutPositionForCoordinate:](self, "approximateLayoutPositionForCoordinate:", v4, v5);
  result.vertical = v7;
  result.horizontal = v6;
  return result;
}

- (void)markIconIndexAsOutOfBounds:(unint64_t)a3
{
  NSMutableIndexSet *outOfBoundsIconIndexes;
  NSMutableIndexSet *v6;
  NSMutableIndexSet *v7;

  outOfBoundsIconIndexes = self->_outOfBoundsIconIndexes;
  if (!outOfBoundsIconIndexes)
  {
    v6 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    v7 = self->_outOfBoundsIconIndexes;
    self->_outOfBoundsIconIndexes = v6;

    outOfBoundsIconIndexes = self->_outOfBoundsIconIndexes;
  }
  -[NSMutableIndexSet addIndex:](outOfBoundsIconIndexes, "addIndex:", a3);
}

- (id)contiguousRegionForGridCellIndex:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v8;
  SBHIconGridSize v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBHIconGridContiguousRegion *v21;
  SBHIconGridSize v23;
  id v24;
  SBIconListGridCellInfo *v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];

  -[SBIconListGridCellInfo gridSize](self, "gridSize");
  v8 = 0x1E0CB3000uLL;
  v24 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v25 = self;
  v9 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v23 = v9;
  if (objc_msgSend(v10, "count"))
  {
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    v27 = 0;
    v13 = v9;
    do
    {
      objc_msgSend(v10, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      objc_msgSend(v10, "removeLastObject");
      if ((objc_msgSend(v12, "containsIndex:", v15) & 1) == 0)
      {
        objc_msgSend(v12, "addIndex:", v15);
        if (-[SBIconListGridCellInfo iconIndexForGridCellIndex:](v25, "iconIndexForGridCellIndex:", v15) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v24, "addIndex:", v15);
          v11 = v11 & 0xFFFFFFFF00000000 | v13;
          v26 = SBHIconGridRangeAddCellIndex(v26, v27, v15, v11);
          v27 = v16;
          v31[0] = v15;
          v31[1] = 65537;
          v8 = v8 & 0xFFFFFFFF00000000 | v13;
          if (SBHIconGridRangeOffset(v31, 0, 1, v8))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31[0]);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
          v30[0] = v15;
          v30[1] = 65537;
          v5 = v5 & 0xFFFFFFFF00000000 | v13;
          if (SBHIconGridRangeOffset(v30, 1, 1, v5))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30[0]);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v18);

          }
          v29[0] = v15;
          v29[1] = 65537;
          v4 = v4 & 0xFFFFFFFF00000000 | v13;
          if (SBHIconGridRangeOffset(v29, 2, 1, v4))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29[0]);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v19);

          }
          v28[0] = v15;
          v28[1] = 65537;
          v3 = v3 & 0xFFFFFFFF00000000 | v13;
          if (SBHIconGridRangeOffset(v28, 3, 1, v3))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28[0]);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v20);

          }
        }
      }
    }
    while (objc_msgSend(v10, "count"));
  }
  else
  {
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    v27 = 0;
  }
  if (objc_msgSend(v24, "count"))
    v21 = -[SBHIconGridContiguousRegion initWithGridCellIndexes:inGridRange:gridSize:]([SBHIconGridContiguousRegion alloc], "initWithGridCellIndexes:inGridRange:gridSize:", v24, v26, v27, *(unsigned int *)&v23);
  else
    v21 = 0;

  return v21;
}

- (id)iconIndexesForContiguousRegion:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0CB3788];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__SBIconListGridCellInfo_iconIndexesForContiguousRegion___block_invoke;
  v11[3] = &unk_1E8D894B8;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateGridCellIndexesUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

uint64_t __57__SBIconListGridCellInfo_iconIndexesForContiguousRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", result);
  return result;
}

- (id)subgridCellInfoForGridRange:(SBHIconGridRange)a3
{
  uint64_t v3;
  unint64_t cellIndex;
  void *v6;
  SBHIconGridSize v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  SBHIconGridSize v19;

  v3 = *(_QWORD *)&a3.size.columns;
  cellIndex = a3.cellIndex;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGridSize:", *(_DWORD *)&a3.size);
  v7 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__SBIconListGridCellInfo_subgridCellInfoForGridRange___block_invoke;
  v14[3] = &unk_1E8D8B458;
  v14[4] = self;
  v17 = cellIndex;
  v18 = v3;
  v19 = v7;
  v9 = v6;
  v15 = v9;
  v16 = v8;
  LOWORD(v6) = v7.columns;
  v10 = v8;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, v3, (unsigned __int16)v6, v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

uint64_t __54__SBIconListGridCellInfo_subgridCellInfoForGridRange___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = result;
    v6 = SBHIconGridRangeRelativeCellIndexForCellIndex(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a2, *(_DWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 40), "setIconIndex:forGridCellIndex:", v5, v6);
    result = objc_msgSend(*(id *)(a1 + 48), "containsIndex:", v5);
    if ((result & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setGridCellIndex:forIconIndex:", v6, v5);
      return objc_msgSend(*(id *)(a1 + 48), "addIndex:", v5);
    }
  }
  return result;
}

- (NSString)layoutDescription
{
  SBHIconGridSize v3;
  unsigned __int16 columns;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  char v12;
  _BOOL4 v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 i;
  int v20;
  unint64_t v21;
  char v22;
  NSMutableIndexSet *outOfBoundsIconIndexes;
  id v24;
  int v26;
  unint64_t v27;
  char v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;

  v3 = (SBHIconGridSize)-[SBIconListGridCellInfo gridSize](self, "gridSize");
  columns = v3.columns;
  v5 = HIWORD(*(unsigned int *)&v3);
  v6 = -[SBIconListGridCellInfo numberOfUsedRows](self, "numberOfUsedRows");
  v7 = -[SBIconListGridCellInfo numberOfUsedColumns](self, "numberOfUsedColumns");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 <= v5)
    v9 = v5;
  else
    v9 = v6;
  if (v7 <= columns)
    v7 = columns;
  v10 = v7 * v6;
  v26 = columns;
  v27 = v9;
  v11 = v5 > 2 * columns || columns > (2 * v5);
  v12 = v11;
  v28 = v12;
  v13 = v11 || v7 * v6 != 0;
  v14 = v9 * v7;
  if ((_DWORD)v5 == 0xFFFF)
    v14 = 0;
  v15 = (v7 * v6 != 0) ^ v13;
  if (!v13)
    v10 = v14;
  if (v10)
  {
    do
    {
      v15 = (v15 + 1);
      v16 = v10 >= 0xA;
      v10 /= 0xAuLL;
    }
    while (v16);
  }
  if (!v27)
    goto LABEL_36;
  v17 = 0;
  v18 = 0;
  for (i = 0; i < v27; ++i)
  {
    objc_msgSend(v8, "appendFormat:", CFSTR("%*lu|\t"), v15, v26 * i);
    if (!v7)
      goto LABEL_35;
    v20 = 0;
    while (1)
    {
      v21 = -[SBIconListGridCellInfo iconIndexForGridCellIndex:](self, "iconIndexForGridCellIndex:", v17);
      if (v21 != 65534)
        break;
      objc_msgSend(v8, "appendString:", CFSTR("X\t"));
LABEL_34:
      ++v17;
      if (v7 <= (unsigned __int16)++v20)
        goto LABEL_35;
    }
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("%lu\t"), v21);
      v18 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v8, "appendFormat:", CFSTR("-\t"), 0x7FFFFFFFFFFFFFFFLL);
    if (++v18 == 2 * v26)
      v22 = v28;
    else
      v22 = 0;
    if ((v22 & 1) == 0)
      goto LABEL_34;
    i = v5 - 1;
    v18 = (2 * v26);
LABEL_35:
    objc_msgSend(v8, "appendString:", CFSTR("\n"));
  }
LABEL_36:
  if (-[NSMutableIndexSet count](self->_outOfBoundsIconIndexes, "count"))
  {
    objc_msgSend(v8, "appendString:", CFSTR("OOB: "));
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 1;
    outOfBoundsIconIndexes = self->_outOfBoundsIconIndexes;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __43__SBIconListGridCellInfo_layoutDescription__block_invoke;
    v29[3] = &unk_1E8D8B480;
    v31 = v32;
    v24 = v8;
    v30 = v24;
    -[NSMutableIndexSet enumerateIndexesUsingBlock:](outOfBoundsIconIndexes, "enumerateIndexesUsingBlock:", v29);
    objc_msgSend(v24, "appendString:", CFSTR("\n"));

    _Block_object_dispose(v32, 8);
  }
  return (NSString *)v8;
}

uint64_t __43__SBIconListGridCellInfo_layoutDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t result;

  v4 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 8) + 8) + 24))
    return objc_msgSend(v3, "appendFormat:", CFSTR(", %lu"), a2);
  result = objc_msgSend(v3, "appendFormat:", CFSTR("%lu"), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SBIconListGridCellInfo *v4;
  void *v5;
  char isKindOfClass;
  SBIconListGridCellInfo *v7;
  BOOL v8;
  unsigned __int16 *extraGridCellIndexes;
  unsigned __int16 *v11;
  unsigned __int16 *extraIconIndexes;
  unsigned __int16 *v13;

  v4 = (SBIconListGridCellInfo *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = 0;
      if (SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&self->_gridSize, *(_DWORD *)&v7->_gridSize)
        && self->_maxGridCellIndex == v7->_maxGridCellIndex
        && self->_extraGridCellIndexesSize == v7->_extraGridCellIndexesSize
        && self->_extraIconIndexesSize == v7->_extraIconIndexesSize
        && !bcmp(self->_indexes, v7->_indexes, 0x100uLL))
      {
        extraGridCellIndexes = self->_extraGridCellIndexes;
        if (!extraGridCellIndexes
          || (v11 = v7->_extraGridCellIndexes) == 0
          || !bcmp(extraGridCellIndexes, v11, self->_extraGridCellIndexesSize))
        {
          extraIconIndexes = self->_extraIconIndexes;
          if (!extraIconIndexes
            || (v13 = v7->_extraIconIndexes) == 0
            || !bcmp(extraIconIndexes, v13, self->_extraIconIndexesSize))
          {
            v8 = 1;
          }
        }
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint32x4_t v2;
  uint32x4_t v3;

  v2 = vmovl_u16(*(uint16x4_t *)&self->_indexes[64]);
  v3 = vmovl_u16(*(uint16x4_t *)self->_indexes);
  return vaddvq_s64(vaddq_s64((int64x2_t)vaddl_u32(*(uint32x2_t *)v3.i8, *(uint32x2_t *)v2.i8), (int64x2_t)vaddl_high_u32(v3, v2)))+ self->_gridSize.columns+ self->_maxGridCellIndex+ self->_gridSize.rows+ self->_extraGridCellIndexesSize+ self->_extraIconIndexesSize;
}

- (NSString)description
{
  return (NSString *)-[SBIconListGridCellInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  size_t extraGridCellIndexesSize;
  void *v7;
  size_t extraIconIndexesSize;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  memmove((void *)(v4 + 8), self->_indexes, 0x100uLL);
  if (self->_extraGridCellIndexes)
  {
    extraGridCellIndexesSize = self->_extraGridCellIndexesSize;
    if (extraGridCellIndexesSize)
    {
      v7 = malloc_type_calloc(extraGridCellIndexesSize, 2uLL, 0x1000040BDFB0063uLL);
      *(_QWORD *)(v5 + 264) = v7;
      if (!v7)
        goto LABEL_11;
      memmove(v7, self->_extraGridCellIndexes, self->_extraGridCellIndexesSize);
      *(_QWORD *)(v5 + 272) = self->_extraGridCellIndexesSize;
    }
  }
  if (!self->_extraIconIndexes)
    goto LABEL_10;
  extraIconIndexesSize = self->_extraIconIndexesSize;
  if (!extraIconIndexesSize)
    goto LABEL_10;
  v9 = malloc_type_calloc(extraIconIndexesSize, 2uLL, 0x1000040BDFB0063uLL);
  *(_QWORD *)(v5 + 280) = v9;
  if (!v9)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  memmove(v9, self->_extraIconIndexes, self->_extraIconIndexesSize);
  *(_QWORD *)(v5 + 288) = self->_extraIconIndexesSize;
LABEL_10:
  *(SBHIconGridSize *)(v5 + 304) = self->_gridSize;
  *(_QWORD *)(v5 + 336) = self->_maxGridCellIndex;
  v10 = -[NSMutableIndexSet mutableCopy](self->_outOfBoundsIconIndexes, "mutableCopy");
  v11 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v10;

  v12 = (id)v5;
LABEL_12:

  return v12;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListGridCellInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconListGridCellInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  -[SBIconListGridCellInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBHStringForIconGridSize(*(_DWORD *)&self->_gridSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("gridSize"));

  v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBIconListGridCellInfo numberOfUsedRows](self, "numberOfUsedRows"), CFSTR("numberOfUsedRows"));
  v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBIconListGridCellInfo numberOfUsedColumns](self, "numberOfUsedColumns"), CFSTR("numberOfUsedColumns"));
  v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBIconListGridCellInfo isLayoutOutOfBounds](self, "isLayoutOutOfBounds"), CFSTR("isLayoutOutOfBounds"), 1);
  return v4;
}

- (void)setFirstEmptyGridCellIndex:(unint64_t)a3
{
  self->_firstEmptyGridCellIndex = a3;
}

- (void)setLastUsedGridCellIndex:(unint64_t)a3
{
  self->_lastUsedGridCellIndex = a3;
}

- (void)setFirstTrailingEmptyGridCellIndex:(unint64_t)a3
{
  self->_firstTrailingEmptyGridCellIndex = a3;
}

@end

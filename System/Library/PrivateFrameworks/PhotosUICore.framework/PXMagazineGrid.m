@implementation PXMagazineGrid

- (PXMagazineGrid)initWithNumberOfColumns:(int64_t)a3 size:(unint64_t)a4
{
  PXMagazineGrid *v7;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXMagazineGrid;
  v7 = -[PXMagazineGrid init](&v10, sel_init);
  if (v7)
  {
    if (a3 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PXMagazineGrid.m"), 27, CFSTR("We should have at least one column"));

    }
    v7->_numberOfColumns = a3;
    v7->_table = 0;
    -[PXMagazineGrid resetWithSize:](v7, "resetWithSize:", a4);
  }
  return v7;
}

- (void)dealloc
{
  int64_t *table;
  objc_super v4;

  table = self->_table;
  if (table)
  {
    free(table);
    self->_table = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXMagazineGrid;
  -[PXMagazineGrid dealloc](&v4, sel_dealloc);
}

- (void)setNumberOfColumns:(int64_t)a3
{
  void *v6;

  if (self->_numberOfColumns != a3)
  {
    if (a3 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMagazineGrid.m"), 46, CFSTR("We should have at least one column"));

    }
    self->_numberOfColumns = a3;
  }
}

- (void)resetWithSize:(unint64_t)a3
{
  unint64_t numberOfColumns;
  int64_t maxRows;
  int64_t v6;
  unint64_t v7;
  int64_t *v8;

  numberOfColumns = self->_numberOfColumns;
  maxRows = self->_maxRows;
  v6 = 16 * a3 / numberOfColumns;
  if (!maxRows || v6 > maxRows)
  {
    if (v6 <= 100)
      v6 = 100;
    v7 = 8 * (numberOfColumns + numberOfColumns * v6);
    self->_tableSizeInBytes = v7;
    self->_maxRows = v6;
    v8 = (int64_t *)malloc_type_realloc(self->_table, v7, 0x65992504uLL);
    self->_table = v8;
    memset(v8, 255, self->_tableSizeInBytes);
  }
}

- (void)enlargeTable
{
  int64_t *table;
  unint64_t numberOfColumns;
  unint64_t tableSizeInBytes;
  int64_t v6;
  unint64_t v7;
  int64_t *v8;

  numberOfColumns = self->_numberOfColumns;
  table = self->_table;
  tableSizeInBytes = self->_tableSizeInBytes;
  v6 = self->_maxRows + 0x400 / (8 * numberOfColumns);
  v7 = 8 * numberOfColumns * v6 + 8 * numberOfColumns;
  self->_tableSizeInBytes = v7;
  self->_maxRows = v6;
  v8 = (int64_t *)malloc_type_realloc(table, v7, 0xE41B0DCFuLL);
  self->_table = v8;
  memset((char *)v8 + tableSizeInBytes, 255, self->_tableSizeInBytes - tableSizeInBytes);
}

- (void)setTileIdentifier:(unint64_t)a3 forArea:(PXMagazineRect *)a4
{
  int64_t var0;
  int64_t v8;
  int64_t var1;
  uint64_t v10;
  int64_t *table;

  if (a4->var1.var1 + a4->var0.var1 >= self->_maxRows)
    -[PXMagazineGrid enlargeTable](self, "enlargeTable");
  var0 = a4->var1.var0;
  if (var0 >= 1)
  {
    v8 = 0;
    var1 = a4->var1.var1;
    do
    {
      if (var1 >= 1)
      {
        v10 = 0;
        table = self->_table;
        do
        {
          table[a4->var0.var0 + v8 + (v10 + a4->var0.var1) * self->_numberOfColumns] = a3;
          ++v10;
          var1 = a4->var1.var1;
        }
        while (v10 < var1);
        var0 = a4->var1.var0;
      }
      ++v8;
    }
    while (v8 < var0);
  }
}

- (void)clearArea:(PXMagazineRect *)a3
{
  PXMagazineSize var1;
  _OWORD v4[2];

  var1 = a3->var1;
  v4[0] = a3->var0;
  v4[1] = var1;
  -[PXMagazineGrid setTileIdentifier:forArea:](self, "setTileIdentifier:forArea:", -1, v4);
}

- (BOOL)nextEmptyTileX:(int64_t *)a3 Y:(int64_t *)a4 maxWidth:(int64_t *)a5
{
  BOOL v6;
  BOOL result;
  int64_t *table;
  unint64_t numberOfColumns;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t *v15;
  int64_t v16;

  if (a3)
    v6 = a4 == 0;
  else
    v6 = 1;
  result = !v6;
  if (v6)
    return result;
  *a4 = 0;
  *a3 = 0;
  numberOfColumns = self->_numberOfColumns;
  table = self->_table;
  v10 = numberOfColumns * self->_maxRows;
  if (!v10)
  {
LABEL_12:
    v12 = 0;
    if (!a5)
      return result;
    goto LABEL_15;
  }
  v11 = 0;
  while (table[v11] != -1)
  {
    if (v10 == ++v11)
      goto LABEL_12;
  }
  *a4 = v11 / numberOfColumns;
  v12 = v11 % self->_numberOfColumns;
  *a3 = v12;
  if (a5)
  {
LABEL_15:
    v13 = self->_numberOfColumns;
    if (v12 + 1 >= v13)
    {
      v16 = 1;
    }
    else
    {
      v14 = v13 - v12;
      v15 = &table[v12 + *a4 * v13];
      v16 = 1;
      while (v15[v16] == -1)
      {
        if (v14 == ++v16)
        {
          v16 = v14;
          break;
        }
      }
    }
    *a5 = v16;
  }
  return result;
}

- (BOOL)isPerfectEnding
{
  return -[PXMagazineGrid endingType](self, "endingType") == 2;
}

- (BOOL)isGoodEnding
{
  return -[PXMagazineGrid endingType](self, "endingType") == 1;
}

- (BOOL)_hasAnyTilesUsedInArea:(PXMagazineRect *)a3
{
  int64_t var0;
  uint64_t v4;
  BOOL v5;
  unint64_t numberOfColumns;
  int64_t *v7;
  uint64_t v8;
  int64_t var1;

  var0 = a3->var1.var0;
  if (var0 < 1)
  {
    return 0;
  }
  else
  {
    v4 = 0;
    v5 = 1;
    while (a3->var1.var1 < 1)
    {
LABEL_7:
      v5 = ++v4 < var0;
      if (v4 == var0)
        return v5;
    }
    numberOfColumns = self->_numberOfColumns;
    v7 = &self->_table[a3->var0.var0 + v4 + a3->var0.var1 * numberOfColumns];
    v8 = 8 * numberOfColumns;
    var1 = a3->var1.var1;
    while (*v7 == -1)
    {
      v7 = (int64_t *)((char *)v7 + v8);
      if (!--var1)
        goto LABEL_7;
    }
  }
  return v5;
}

- (int64_t)_numberOfEmptyTilesInArea:(PXMagazineRect *)a3
{
  int64_t var0;
  uint64_t v4;
  int64_t v5;
  unint64_t numberOfColumns;
  int64_t *v7;
  uint64_t v8;
  int64_t var1;

  var0 = a3->var1.var0;
  if (var0 < 1)
    return 0;
  v4 = 0;
  v5 = 0;
  do
  {
    if (a3->var1.var1 >= 1)
    {
      numberOfColumns = self->_numberOfColumns;
      v7 = &self->_table[a3->var0.var0 + v4 + a3->var0.var1 * numberOfColumns];
      v8 = 8 * numberOfColumns;
      var1 = a3->var1.var1;
      do
      {
        if (*v7 == -1)
          ++v5;
        v7 = (int64_t *)((char *)v7 + v8);
        --var1;
      }
      while (var1);
    }
    ++v4;
  }
  while (v4 != var0);
  return v5;
}

- (BOOL)_hasAnyEmptyTilesInArea:(PXMagazineRect *)a3
{
  int64_t var0;
  uint64_t v4;
  BOOL v5;
  unint64_t numberOfColumns;
  int64_t *v7;
  uint64_t v8;
  int64_t var1;

  var0 = a3->var1.var0;
  if (var0 < 1)
  {
    return 0;
  }
  else
  {
    v4 = 0;
    v5 = 1;
    while (a3->var1.var1 < 1)
    {
LABEL_7:
      v5 = ++v4 < var0;
      if (v4 == var0)
        return v5;
    }
    numberOfColumns = self->_numberOfColumns;
    v7 = &self->_table[a3->var0.var0 + v4 + a3->var0.var1 * numberOfColumns];
    v8 = 8 * numberOfColumns;
    var1 = a3->var1.var1;
    while (*v7 != -1)
    {
      v7 = (int64_t *)((char *)v7 + v8);
      if (!--var1)
        goto LABEL_7;
    }
  }
  return v5;
}

- (int64_t)_numberOfEmptyTilesAtTheEnd
{
  int64_t v3;
  unint64_t v4;
  unint64_t numberOfColumns;
  int64_t v6;
  _QWORD v8[4];

  v3 = 0;
  v4 = -[PXMagazineGrid _rowsUsed](self, "_rowsUsed") - 1;
  do
  {
    if ((v4 & 0x8000000000000000) != 0)
      break;
    numberOfColumns = self->_numberOfColumns;
    v8[0] = 0;
    v8[1] = v4;
    v8[2] = numberOfColumns;
    v8[3] = 1;
    v6 = -[PXMagazineGrid _numberOfEmptyTilesInArea:](self, "_numberOfEmptyTilesInArea:", v8);
    v3 += v6;
    --v4;
  }
  while (v6);
  return v3;
}

- (unint64_t)endingType
{
  unint64_t v3;
  unint64_t numberOfColumns;
  _BOOL4 v5;
  unint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];

  if (-[PXMagazineGrid _isEmptyGrid](self, "_isEmptyGrid"))
    return 2;
  v3 = -[PXMagazineGrid _rowsUsed](self, "_rowsUsed");
  numberOfColumns = self->_numberOfColumns;
  v11[0] = 0;
  v11[1] = v3 - 1;
  v11[2] = numberOfColumns;
  v11[3] = 1;
  if (!-[PXMagazineGrid _hasAnyEmptyTilesInArea:](self, "_hasAnyEmptyTilesInArea:", v11))
    return 2;
  v9 = 0;
  v10 = 0;
  v8 = 0;
  v5 = -[PXMagazineGrid nextEmptyTileX:Y:maxWidth:](self, "nextEmptyTileX:Y:maxWidth:", &v9, &v8, &v10);
  result = 0;
  if (v5)
  {
    if (v10 + v9 == self->_numberOfColumns)
    {
      v7 = (v3 - v8) * v10;
      return v7 == -[PXMagazineGrid _numberOfEmptyTilesAtTheEnd](self, "_numberOfEmptyTilesAtTheEnd");
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unint64_t)_rowsUsed
{
  size_t v3;
  unint64_t maxRows;
  unint64_t v5;
  int64_t *table;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = 8 * self->_numberOfColumns;
  memset((char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), 255, v3);
  maxRows = self->_maxRows;
  if (!maxRows)
    return 0;
  v5 = 0;
  table = self->_table;
  while (memcmp(table, (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3))
  {
    ++v5;
    table = (int64_t *)((char *)table + v3);
    if (maxRows == v5)
      return maxRows;
  }
  return v5;
}

- (BOOL)_isEmptyGrid
{
  return *self->_table == -1;
}

@end

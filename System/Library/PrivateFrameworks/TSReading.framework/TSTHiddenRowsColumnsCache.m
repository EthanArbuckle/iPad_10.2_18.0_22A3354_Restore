@implementation TSTHiddenRowsColumnsCache

- (TSTHiddenRowsColumnsCache)init
{
  TSTHiddenRowsColumnsCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTHiddenRowsColumnsCache;
  v2 = -[TSTHiddenRowsColumnsCache init](&v4, sel_init);
  if (v2)
  {
    v2->mHiddenRows = -[TSTHiddenDimensionCache initWithUserHiddenInformation:]([TSTHiddenDimensionCache alloc], "initWithUserHiddenInformation:", 1);
    v2->mHiddenColumns = -[TSTHiddenDimensionCache initWithUserHiddenInformation:]([TSTHiddenDimensionCache alloc], "initWithUserHiddenInformation:", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->mHiddenRows = 0;
  self->mHiddenColumns = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTHiddenRowsColumnsCache;
  -[TSTHiddenRowsColumnsCache dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSTHiddenRowsColumnsCache *v4;

  v4 = -[TSTHiddenRowsColumnsCache init](+[TSTHiddenRowsColumnsCache allocWithZone:](TSTHiddenRowsColumnsCache, "allocWithZone:", a3), "init");
  v4->mHiddenColumns = (TSTHiddenDimensionCache *)-[TSTHiddenDimensionCache copy](self->mHiddenColumns, "copy");
  v4->mHiddenRows = (TSTHiddenDimensionCache *)-[TSTHiddenDimensionCache copy](self->mHiddenRows, "copy");
  return v4;
}

- (BOOL)isRowHidden:(unsigned __int16)a3
{
  return -[TSTHiddenDimensionCache isIndexHidden:](self->mHiddenRows, "isIndexHidden:", a3);
}

- (BOOL)isRowUserHidden:(unsigned __int16)a3
{
  return -[TSTHiddenDimensionCache isIndexUserHidden:](self->mHiddenRows, "isIndexUserHidden:", a3);
}

- (BOOL)isColumnHidden:(unsigned __int8)a3
{
  return -[TSTHiddenDimensionCache isIndexHidden:](self->mHiddenColumns, "isIndexHidden:", a3);
}

- (unsigned)numberRowsHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache numberHiddenIndicesInRange:](self->mHiddenRows, "numberHiddenIndicesInRange:", a3.var0.var0, a3.var1.var1);
}

- (unsigned)numberRowsUserHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache numberUserHiddenIndicesInRange:](self->mHiddenRows, "numberUserHiddenIndicesInRange:", a3.var0.var0, a3.var1.var1);
}

- (unsigned)numberColumnsHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache numberHiddenIndicesInRange:](self->mHiddenColumns, "numberHiddenIndicesInRange:", a3.var0.var1, a3.var1.var0);
}

- (BOOL)anyRowsHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache anyHiddenIndicesInRange:](self->mHiddenRows, "anyHiddenIndicesInRange:", a3.var0.var0, a3.var1.var1);
}

- (BOOL)anyRowsUserHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache anyUserHiddenIndicesInRange:](self->mHiddenRows, "anyUserHiddenIndicesInRange:", a3.var0.var0, a3.var1.var1);
}

- (BOOL)anyColumnsHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache anyHiddenIndicesInRange:](self->mHiddenColumns, "anyHiddenIndicesInRange:", a3.var0.var1, a3.var1.var0);
}

- (unsigned)previousVisibleRow:(unsigned __int16)a3
{
  return -[TSTHiddenDimensionCache findPreviousVisibleIndex:](self->mHiddenRows, "findPreviousVisibleIndex:", a3);
}

- (unsigned)nextVisibleRow:(unsigned __int16)a3
{
  return -[TSTHiddenDimensionCache findNextVisibleIndex:](self->mHiddenRows, "findNextVisibleIndex:", a3);
}

- (unsigned)previousVisibleColumn:(unsigned __int8)a3
{
  return -[TSTHiddenDimensionCache findPreviousVisibleIndex:](self->mHiddenColumns, "findPreviousVisibleIndex:", a3);
}

- (unsigned)nextVisibleColumn:(unsigned __int8)a3
{
  return -[TSTHiddenDimensionCache findNextVisibleIndex:](self->mHiddenColumns, "findNextVisibleIndex:", a3);
}

- (unsigned)previousNthVisibleRow:(unsigned __int16)a3 fromRowIndex:(unsigned __int16)a4
{
  return -[TSTHiddenDimensionCache findNthPreviousVisibleIndex:fromIndex:](self->mHiddenRows, "findNthPreviousVisibleIndex:fromIndex:", a3, a4);
}

- (unsigned)previousNthVisibleColumn:(unsigned __int16)a3 fromColumnIndex:(unsigned __int8)a4
{
  return -[TSTHiddenDimensionCache findNthPreviousVisibleIndex:fromIndex:](self->mHiddenColumns, "findNthPreviousVisibleIndex:fromIndex:", a3, a4);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)visibleCellOffsetBy:(id)a3 fromCellID:(id)a4
{
  unsigned __int16 var0;
  uint64_t v5;
  uint64_t v6;
  uint64_t var1;
  TSTHiddenDimensionCache *mHiddenColumns;
  char v11;
  unsigned int v12;
  TSTHiddenDimensionCache *mHiddenRows;
  unsigned __int16 v14;

  var0 = a4.var0;
  v5 = *(_QWORD *)&a4.var0 >> 16;
  v6 = a4.var0;
  if (a4.var0 == 0xFFFFLL || (*(_DWORD *)&a4 & 0xFF0000) == 0xFF0000)
  {
    v12 = *(_DWORD *)&a4 & 0xFF000000;
  }
  else
  {
    var1 = a3.var1;
    if (a3.var0)
    {
      mHiddenColumns = self->mHiddenColumns;
      if (a3.var0 < 1)
        v11 = -[TSTHiddenDimensionCache findNthPreviousVisibleIndex:fromIndex:](mHiddenColumns, "findNthPreviousVisibleIndex:fromIndex:", -a3.var0, a4.var1);
      else
        v11 = -[TSTHiddenDimensionCache findNthNextVisibleIndex:fromIndex:](mHiddenColumns, "findNthNextVisibleIndex:fromIndex:", a3.var0, a4.var1);
      LOBYTE(v5) = v11;
    }
    if ((_DWORD)var1)
    {
      mHiddenRows = self->mHiddenRows;
      if ((int)var1 < 1)
        v14 = -[TSTHiddenDimensionCache findNthPreviousVisibleIndex:fromIndex:](mHiddenRows, "findNthPreviousVisibleIndex:fromIndex:", -(uint64_t)(*(_QWORD *)&a3 & 0xFFFFFFFF00000000) >> 32, v6);
      else
        v14 = -[TSTHiddenDimensionCache findNthNextVisibleIndex:fromIndex:](mHiddenRows, "findNthNextVisibleIndex:fromIndex:", var1, v6);
      var0 = v14;
    }
    v12 = 0;
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v12 | (v5 << 16) | var0);
}

- (NSIndexSet)visibleRowIndices
{
  return -[TSTHiddenDimensionCache visibleIndices](self->mHiddenRows, "visibleIndices");
}

- (NSIndexSet)visibleColumnIndices
{
  return -[TSTHiddenDimensionCache visibleIndices](self->mHiddenColumns, "visibleIndices");
}

- (unsigned)numberOfVisibleRowsFromHeader:(unsigned __int16)a3
{
  return -[TSTHiddenDimensionCache numberOfVisibleIndicesToMarkIndexFrom:](self->mHiddenRows, "numberOfVisibleIndicesToMarkIndexFrom:", a3);
}

- (void)pushAndValidate:(id)a3
{
  -[TSTHiddenRowsColumnsCache push](self, "push");
  -[TSTHiddenRowsColumnsCache validate:](self, "validate:", a3);
}

- (void)push
{
  id AssociatedObject;
  void *v4;
  uint64_t v5;

  AssociatedObject = objc_getAssociatedObject(self, "TSTHiddenRowsColumnsCacheStackKey");
  if (!AssociatedObject)
  {
    AssociatedObject = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    objc_setAssociatedObject(self, "TSTHiddenRowsColumnsCacheStackKey", AssociatedObject, (void *)1);
  }
  if (objc_msgSend(AssociatedObject, "count"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTHiddenRowsColumnsCache push]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTHiddenRowsColumnsCache.m"), 249, CFSTR("really we should only be pushing one"));
  }
  objc_msgSend(AssociatedObject, "addObject:", (id)-[TSTHiddenRowsColumnsCache copy](self, "copy"));
}

- (void)swap
{
  id AssociatedObject;
  void *v4;
  id *v5;
  id *v6;

  AssociatedObject = objc_getAssociatedObject(self, "TSTHiddenRowsColumnsCacheStackKey");
  if (AssociatedObject)
  {
    v4 = AssociatedObject;
    v5 = (id *)(id)objc_msgSend(AssociatedObject, "lastObject");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v4, "removeLastObject");
      objc_msgSend(v4, "addObject:", (id)-[TSTHiddenRowsColumnsCache copy](self, "copy"));

      self->mHiddenColumns = (TSTHiddenDimensionCache *)v6[2];
      self->mHiddenRows = (TSTHiddenDimensionCache *)v6[1];

    }
  }
}

- (void)pop
{
  id AssociatedObject;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  AssociatedObject = objc_getAssociatedObject(self, "TSTHiddenRowsColumnsCacheStackKey");
  if (AssociatedObject)
  {
    v4 = AssociatedObject;
    v5 = objc_msgSend(AssociatedObject, "lastObject");
    if (v5)
    {
      v6 = v5;

      self->mHiddenColumns = (TSTHiddenDimensionCache *)*(id *)(v6 + 16);
      self->mHiddenRows = (TSTHiddenDimensionCache *)*(id *)(v6 + 8);
      objc_msgSend(v4, "removeLastObject");
    }
    if (!objc_msgSend(v4, "count"))
      objc_setAssociatedObject(self, "TSTHiddenRowsColumnsCacheStackKey", 0, (void *)0x301);
  }
}

- (void)validate:(id)a3
{
  char v5;
  uint64_t v6;
  TSTHiddenDimensionCache *mHiddenColumns;
  TSTHiddenDimensionCache *mHiddenRows;
  _QWORD v9[5];
  _QWORD v10[5];

  -[TSTHiddenDimensionCache setCount:](self->mHiddenRows, "setCount:", TSTMasterLayoutGetTableNumberOfRows((uint64_t)a3));
  -[TSTHiddenDimensionCache setMarkIndex:](self->mHiddenRows, "setMarkIndex:", TSTMasterLayoutGetTableNumberOfHeaderRows((unsigned __int16 *)a3));
  -[TSTHiddenDimensionCache setCount:](self->mHiddenColumns, "setCount:", TSTMasterLayoutGetTableNumberOfColumns((uint64_t)a3));
  v5 = objc_msgSend(a3, "isDynamicallyHidingRowsCols");
  v6 = MEMORY[0x24BDAC760];
  if ((v5 & 1) != 0 || objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfHiddenColumns"))
  {
    mHiddenColumns = self->mHiddenColumns;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __38__TSTHiddenRowsColumnsCache_validate___block_invoke;
    v10[3] = &unk_24D82F540;
    v10[4] = a3;
    -[TSTHiddenDimensionCache setAllInvalidValuesUsingBlock:](mHiddenColumns, "setAllInvalidValuesUsingBlock:", v10);
  }
  else
  {
    -[TSTHiddenDimensionCache setAllValuesToZero](self->mHiddenColumns, "setAllValuesToZero");
  }
  if ((objc_msgSend(a3, "isDynamicallyHidingRowsCols") & 1) != 0
    || objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfHiddenRows"))
  {
    mHiddenRows = self->mHiddenRows;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __38__TSTHiddenRowsColumnsCache_validate___block_invoke_2;
    v9[3] = &unk_24D82F540;
    v9[4] = a3;
    -[TSTHiddenDimensionCache setAllInvalidValuesUsingBlock:](mHiddenRows, "setAllInvalidValuesUsingBlock:", v9);
  }
  else
  {
    -[TSTHiddenDimensionCache setAllValuesToZero](self->mHiddenRows, "setAllValuesToZero");
  }
}

uint64_t __38__TSTHiddenRowsColumnsCache_validate___block_invoke(uint64_t a1, unsigned __int8 a2)
{
  return TSTMasterLayoutIsColumnHiddenWorker(*(void **)(a1 + 32), a2);
}

uint64_t __38__TSTHiddenRowsColumnsCache_validate___block_invoke_2(uint64_t a1, unsigned __int16 a2)
{
  return TSTMasterLayoutIsRowHiddenWorker(*(void **)(a1 + 32), a2);
}

- (void)validateChangeDescriptors:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[6];
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "changeDescriptor");
        v12 = (void *)objc_msgSend(v10, "cellRegion");
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __55__TSTHiddenRowsColumnsCache_validateChangeDescriptors___block_invoke;
        v13[3] = &unk_24D82F1D8;
        v14 = v11;
        v13[4] = self;
        v13[5] = v10;
        objc_msgSend(v12, "enumerateCellRangesUsingBlock:", v13);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
}

uint64_t __55__TSTHiddenRowsColumnsCache_validateChangeDescriptors___block_invoke(uint64_t result, unint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;

  switch(*(_DWORD *)(result + 48))
  {
    case 1:
      v15 = *(void **)(*(_QWORD *)(result + 32) + 16);
      v16 = BYTE2(a2);
      v17 = WORD2(a2);
      goto LABEL_11;
    case 2:
      v18 = *(void **)(*(_QWORD *)(result + 32) + 16);
      v19 = BYTE2(a2);
      v20 = WORD2(a2);
      goto LABEL_13;
    case 3:
    case 6:
      v2 = *(void **)(*(_QWORD *)(result + 32) + 16);
      v3 = BYTE2(a2);
      v4 = WORD2(a2);
      v5 = (objc_msgSend(*(id *)(result + 40), "cellID") >> 16);
      v6 = v2;
      v7 = v3;
      v8 = v4;
      goto LABEL_4;
    case 5:
      v12 = *(void **)(*(_QWORD *)(result + 32) + 16);
      v14 = BYTE2(a2);
      v13 = WORD2(a2);
      goto LABEL_9;
    case 7:
    case 0x17:
      v9 = *(void **)(*(_QWORD *)(result + 32) + 8);
      v10 = HIWORD(a2);
      v11 = (unsigned __int16)a2;
      v5 = (unsigned __int16)objc_msgSend(*(id *)(result + 40), "cellID");
      v6 = v9;
      v7 = v11;
      v8 = v10;
LABEL_4:
      result = objc_msgSend(v6, "moveRangeFrom:toIndex:", v7, v8, v5);
      break;
    case 0x15:
      v15 = *(void **)(*(_QWORD *)(result + 32) + 8);
      v17 = HIWORD(a2);
      v16 = (unsigned __int16)a2;
LABEL_11:
      result = objc_msgSend(v15, "deleteRange:", v16, v17);
      break;
    case 0x16:
      v18 = *(void **)(*(_QWORD *)(result + 32) + 8);
      v20 = HIWORD(a2);
      v19 = (unsigned __int16)a2;
LABEL_13:
      result = objc_msgSend(v18, "insertRange:", v19, v20);
      break;
    case 0x19:
    case 0x1A:
      v12 = *(void **)(*(_QWORD *)(result + 32) + 8);
      v13 = HIWORD(a2);
      v14 = (unsigned __int16)a2;
LABEL_9:
      result = objc_msgSend(v12, "invalidate:", v14, v13);
      break;
    default:
      return result;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p hiddenColumns=%@ hiddenRows=%@>"), NSStringFromClass(v4), self, -[TSTHiddenDimensionCache description](self->mHiddenColumns, "description"), -[TSTHiddenDimensionCache description](self->mHiddenRows, "description"));
}

@end

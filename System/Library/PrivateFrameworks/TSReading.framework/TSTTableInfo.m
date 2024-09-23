@implementation TSTTableInfo

- (id)tabularTextRepresentation
{
  unint64_t v2;
  TSTCellIterator *v3;
  id v4;
  __CFString *v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  __CFString **v13;
  void *v14;
  void *v15;
  TSTTableModel *v17;
  _BYTE v18[4];
  unsigned __int16 v19;
  unsigned __int16 v20;
  uint64_t v21;
  int v22;
  unsigned int v23;

  v17 = -[TSTTableInfo tableModel](self, "tableModel");
  v3 = -[TSTCellIterator initWithTableModel:range:flags:]([TSTCellIterator alloc], "initWithTableModel:range:flags:", v17, -[TSTTableModel range](v17, "range"), 128);
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (-[TSTCellIterator getNext:](v3, "getNext:", v18))
  {
    v5 = 0;
    v6 = 0xFFFF;
    do
    {
      v7 = v21;
      v8 = v19;
      v9 = v20;
      v11 = v22;
      v10 = v23;
      if (v6 == v19)
      {
        objc_msgSend(v4, "appendString:", v5);
      }
      else
      {
        if (v6 != 0xFFFF)
          objc_msgSend(v4, "appendString:", CFSTR("\n"));
        v6 = v8;
      }
      v12 = v8 | (v9 << 16);
      if ((_WORD)v11 == 0xFFFF
        || (*(_QWORD *)&v11 & 0xFF0000) == 0xFF0000
        || v10 < 0x10000
        || !(_WORD)v10
        || ((v12 ^ v11) & 0xFFFFFF) == 0)
      {
        if (v7 && *(_DWORD *)(v7 + 104) == 267)
          TSTCellCoerceCellToTextFormat(v7);
        v2 = v2 & 0xFFFFFFFF00000000 | v12;
        v14 = (void *)TSTTableStringForCellAtCellID((uint64_t)v17, v7, v2);
        if (v14)
        {
          v15 = v14;
          if (objc_msgSend(v14, "rangeOfString:", CFSTR("\n")) == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v4, "appendString:", v15);
          else
            objc_msgSend(v4, "appendFormat:", CFSTR("\"%@\"), v15);
        }
        v13 = TSTTableInfoTextArchiving_TabSpacing;
      }
      else
      {
        v13 = &TSTTableInfoTextArchiving_MergeCellSpacing;
      }
      v5 = *v13;
    }
    while (-[TSTCellIterator getNext:](v3, "getNext:", v18));
  }

  return v4;
}

- (TSTTableInfo)initWithContext:(id)a3 geometry:(id)a4 rows:(unsigned __int16)a5 columns:(unsigned __int16)a6 styles:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  char *v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  v8 = a6;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TSTTableInfo;
  v12 = -[TSDDrawableInfo initWithContext:geometry:](&v17, sel_initWithContext_geometry_);
  if (v12)
  {
    *((_QWORD *)v12 + 18) = -[TSTTableModel initWithContext:rows:columns:styles:tableInfo:]([TSTTableModel alloc], "initWithContext:rows:columns:styles:tableInfo:", a3, v9, v8, a7, v12);
    *(_DWORD *)(v12 + 154) = 0xFFFFFF;
    *(_DWORD *)(v12 + 158) = 0xFFFFFF;
    *((_QWORD *)v12 + 21) = 0;
    *((_QWORD *)v12 + 22) = 0;
    *((_QWORD *)v12 + 23) = -[TSTEditingState initWithTableInfo:]([TSTEditingState alloc], "initWithTableInfo:", v12);
    objc_msgSend(a4, "size");
    v14 = v13;
    objc_msgSend(a4, "size");
    TSTTableInitDefaultHeightAndWidth((TSTTableInfo *)v12, v14, v15);
  }
  return (TSTTableInfo *)v12;
}

- (id)initForTestingWithContext:(id)a3 rows:(unsigned __int16)a4 columns:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  TSDInfoGeometry *v9;
  char *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v9 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", 0.0, 0.0, 100.0, 200.0);
  v12.receiver = self;
  v12.super_class = (Class)TSTTableInfo;
  v10 = -[TSDDrawableInfo initWithContext:geometry:](&v12, sel_initWithContext_geometry_, a3, v9);
  if (v10)
  {
    *((_QWORD *)v10 + 18) = -[TSTTableModel initWithContext:rows:columns:styles:tableInfo:]([TSTTableModel alloc], "initWithContext:rows:columns:styles:tableInfo:", a3, v6, v5, +[TSTTableStyleNetwork networkWithContext:presetIndex:colors:alternate:](TSTTableStyleNetwork, "networkWithContext:presetIndex:colors:alternate:", a3, 0, 0, 2), v10);
    *(_DWORD *)(v10 + 154) = 0xFFFFFF;
    *(_DWORD *)(v10 + 158) = 0xFFFFFF;
    *((_QWORD *)v10 + 21) = 0;
    *((_QWORD *)v10 + 22) = 0;
    *((_QWORD *)v10 + 23) = -[TSTEditingState initWithTableInfo:]([TSTEditingState alloc], "initWithTableInfo:", v10);
  }

  return v10;
}

- (TSTTableInfo)initWithContext:(id)a3 geometry:(id)a4 styles:(id)a5
{
  double v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  id v13;
  id v14;
  unsigned int v15;
  double v16;

  objc_msgSend(a4, "size");
  v10 = (unint64_t)(v9 / 22.0);
  objc_msgSend(a4, "size");
  v12 = (unint64_t)(v11 / 98.0);
  v13 = +[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration");
  v14 = (id)objc_msgSend(a4, "mutableCopy");
  if (v12 > objc_msgSend(v13, "maxNumberOfColumns"))
  {
    v15 = objc_msgSend(v13, "maxNumberOfColumns");
    LOBYTE(v12) = v15;
    v16 = (double)v15 * 98.0;
    objc_msgSend(v14, "size");
    objc_msgSend(v14, "setSize:", v16);
  }
  if (v10 > objc_msgSend(v13, "maxNumberOfRows"))
  {
    LOWORD(v10) = objc_msgSend(v13, "maxNumberOfRows");
    objc_msgSend(v14, "size");
    objc_msgSend(v14, "setSize:");
  }
  return -[TSTTableInfo initWithContext:geometry:rows:columns:styles:](self, "initWithContext:geometry:rows:columns:styles:", a3, v14, (unsigned __int16)v10, v12, a5);
}

- (TSTTableInfo)initWithContext:(id)a3 geometry:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableInfo initWithContext:geometry:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableInfo.mm"), 225, CFSTR("call - (id) initWithContext: (TSPObjectContext *) context geometry: (TSDInfoGeometry *) geometry styles:(TSTTableStyleNetwork *)styles please"));
  return 0;
}

- (TSTTableInfo)initWithContext:(id)a3 otherTableInfo:(id)a4
{
  char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTTableInfo;
  v5 = -[TSDDrawableInfo initWithContext:geometry:](&v7, sel_initWithContext_geometry_, a3, objc_msgSend(a4, "geometry"));
  if (v5)
  {
    *((_QWORD *)v5 + 18) = *((id *)a4 + 18);
    *(_DWORD *)(v5 + 154) = 0xFFFFFF;
    *(_DWORD *)(v5 + 158) = 0xFFFFFF;
    *((_QWORD *)v5 + 21) = 0;
    *((_QWORD *)v5 + 22) = 0;
    *((_QWORD *)v5 + 23) = -[TSTEditingState initWithTableInfo:]([TSTEditingState alloc], "initWithTableInfo:", v5);
  }
  return (TSTTableInfo *)v5;
}

- (TSTTableInfo)initWithContext:(id)a3 fromSourceInfo:(id)a4 cellRegion:(id)a5 carrySelection:(BOOL)a6
{
  char *v10;
  double v11;
  int v12;
  int v13;
  double v14;
  TSDInfoGeometry *v15;
  TSDInfoGeometry *v16;
  uint64_t v17;
  TSTTableSelection *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)TSTTableInfo;
  v10 = -[TSDDrawableInfo initWithContext:geometry:](&v29, sel_initWithContext_geometry_, a3, objc_msgSend(a4, "geometry"));
  if (v10)
  {
    *((_QWORD *)v10 + 18) = -[TSTTableModel initWithContext:fromSourceModel:region:tableInfo:]([TSTTableModel alloc], "initWithContext:fromSourceModel:region:tableInfo:", a3, objc_msgSend(a4, "tableModel"), a5, v10);
    *(_DWORD *)(v10 + 154) = 0xFFFFFF;
    *(_DWORD *)(v10 + 158) = 0xFFFFFF;
    *((_QWORD *)v10 + 21) = 0;
    *((_QWORD *)v10 + 22) = 0;
    v11 = 0.0;
    if (objc_msgSend(*((id *)v10 + 18), "numberOfRows"))
    {
      v12 = 0;
      do
        v11 = v11 + TSTTableHeightOfRow(*((_QWORD *)v10 + 18), (unsigned __int16)v12++, 0);
      while (objc_msgSend(*((id *)v10 + 18), "numberOfRows") > (unsigned __int16)v12);
    }
    if (objc_msgSend(*((id *)v10 + 18), "numberOfColumns"))
    {
      v13 = 0;
      v14 = 0.0;
      do
        v14 = v14 + TSTTableWidthOfColumn(*((_QWORD *)v10 + 18), v13++, 0);
      while (objc_msgSend(*((id *)v10 + 18), "numberOfColumns") > v13);
    }
    v15 = [TSDInfoGeometry alloc];
    objc_msgSend((id)objc_msgSend(a4, "geometry"), "position");
    v16 = -[TSDInfoGeometry initWithPosition:size:](v15, "initWithPosition:size:");
    objc_msgSend(v10, "setGeometry:resizeInternal:", v16, 0);

    *((_QWORD *)v10 + 23) = -[TSTEditingState initForPasteboardFromSourceInfo:stylesheet:]([TSTEditingState alloc], "initForPasteboardFromSourceInfo:stylesheet:", v10, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "tableModel"), "bodyTextStyle"), "stylesheet"));
    if (a6)
    {
      v17 = objc_msgSend(a5, "boundingCellRange");
      v18 = -[TSTTableSelection initWithTableModel:andPreviousSelection:offsetBy:]([TSTTableSelection alloc], "initWithTableModel:andPreviousSelection:offsetBy:", *((_QWORD *)v10 + 18), objc_msgSend((id)objc_msgSend(a4, "editingState"), "selection"), -BYTE2(v17) - ((unint64_t)(unsigned __int16)v17 << 32));
      objc_msgSend(*((id *)v10 + 23), "setSelection:", v18);
      objc_msgSend(*((id *)v10 + 23), "changeEditingMode:", objc_msgSend((id)objc_msgSend(a4, "editingState"), "editingMode"));

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = (void *)objc_msgSend(v10, "allWPStorages", 0);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "setParentInfo:", v10);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v21);
    }
  }
  return (TSTTableInfo *)v10;
}

- (TSTTableInfo)initWithContext:(id)a3 fromSourceInfo:(id)a4 carrySelection:(BOOL)a5
{
  _BOOL8 v5;
  id v9;

  v5 = a5;
  if (a5)
    v9 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "editingState"), "selection"), "cellRegion");
  else
    v9 = +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", objc_msgSend((id)objc_msgSend(a4, "tableModel"), "range"));
  return -[TSTTableInfo initWithContext:fromSourceInfo:cellRegion:carrySelection:](self, "initWithContext:fromSourceInfo:cellRegion:carrySelection:", a3, a4, v9, v5);
}

- (void)dealloc
{
  TSTMasterLayout *mMasterLayout;
  TSTTablePartitioner *mPartitioner;
  objc_super v5;

  mMasterLayout = self->mMasterLayout;
  if (mMasterLayout)
  {
    -[TSTMasterLayout wasRemovedFromDocumentRoot](mMasterLayout, "wasRemovedFromDocumentRoot");
    -[TSTMasterLayout setTableInfo:](self->mMasterLayout, "setTableInfo:", 0);

    self->mMasterLayout = 0;
  }

  mPartitioner = self->mPartitioner;
  if (mPartitioner)
  {

    self->mPartitioner = 0;
  }

  self->mEditingState = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSTTableInfo;
  -[TSDDrawableInfo dealloc](&v5, sel_dealloc);
}

- (id)copyWithContext:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v5 = -[TSTTableInfo zone](self, "zone");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", v5), "initWithContext:fromSourceInfo:carrySelection:", a3, self, 0);
  v7 = (_QWORD *)v6;
  if (v6)
  {

    v7[11] = -[TSDExteriorTextWrap copyWithZone:](-[TSDDrawableInfo exteriorTextWrap](self, "exteriorTextWrap"), "copyWithZone:", v5);
  }
  return v7;
}

- (void)setupTableModelForPrototypeIndex:(int64_t)a3
{
  TSTTableModel *v4;
  TSTTableModel *v5;
  unint64_t v6;
  TSTCell *v7;
  int mPrivate;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  __int128 v14;
  __int128 v15;
  int v16;

  v4 = -[TSTTableInfo tableModel](self, "tableModel");
  v5 = v4;
  switch(a3)
  {
    case 0:
      -[TSTTableModel setNumberOfHeaderRows:](v4, "setNumberOfHeaderRows:", 1);
      -[TSTTableModel setNumberOfHeaderColumns:](v5, "setNumberOfHeaderColumns:", 1);
      break;
    case 1:
    case 4:
      -[TSTTableModel setNumberOfHeaderRows:](v4, "setNumberOfHeaderRows:", 1);
      break;
    case 3:
      -[TSTTableModel setNumberOfHeaderRows:](v4, "setNumberOfHeaderRows:", 1);
      -[TSTTableModel setNumberOfHeaderColumns:](v5, "setNumberOfHeaderColumns:", 1);
      -[TSTTableModel setNumberOfFooterRows:](v5, "setNumberOfFooterRows:", 1);
      break;
    default:
      break;
  }
  if (objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "headersFrozenByDefault"))
  {
    -[TSTTableModel setHeaderRowsFrozen:](v5, "setHeaderRowsFrozen:", 1);
    -[TSTTableModel setHeaderColumnsFrozen:](v5, "setHeaderColumnsFrozen:", 1);
  }
  -[TSTTableModel setRepeatingHeaderRowsEnabled:](v5, "setRepeatingHeaderRowsEnabled:", 1);
  -[TSTTableModel setRepeatingHeaderColumnsEnabled:](v5, "setRepeatingHeaderColumnsEnabled:", 1);
  if (a3 == 4)
  {
    v6 = -[TSTTableModel numberOfRows](v5, "numberOfRows");
    v7 = objc_alloc_init(TSTCell);
    TSTCellClearValue((uint64_t)v7);
    *((_BYTE *)&v7->mPrivate + 1) = 6;
    v16 = 0;
    v15 = 0u;
    v14 = 0u;
    v13 = 263;
    TSTCellSetExplicitFormat((uint64_t)v7, (uint64_t)&v13);
    mPrivate = (int)v7->mPrivate;
    if ((mPrivate & 0xFF00) == 0)
    {
      TSTCellClearValue((uint64_t)v7);
      *((_BYTE *)&v7->mPrivate + 1) = 6;
      mPrivate = (int)v7->mPrivate;
    }
    if ((mPrivate & 0xFF00) == 0x600)
    {
      v7->mPrivate.mValue.mDate = 0;
    }
    else
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void TSTCellSetBoolValue(TSTCell *, BOOL)");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 939, CFSTR("can't set BOOL value to non-BOOL cell: %p"), v7);
    }
    TSTTableSetWidthOfColumn((uint64_t)v5, 1, 147.0);
    TSTTableSetWidthOfColumn((uint64_t)v5, 0, 49.0);
    if (v6 >= 2)
    {
      v11 = v6;
      for (i = 1; i != v11; ++i)
      {
        v6 = v6 & 0xFFFFFFFF00000000 | i;
        TSTTableSetCellAtCellID((uint64_t)v5, v7, v6);
      }
    }

  }
}

+ (unsigned)numberOfRowsForProtoIndex:(unint64_t)a3
{
  if (objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration", a3), "createLargeDefaultTables"))return 10;
  else
    return 5;
}

+ (unsigned)numberOfColumnsForProtoIndex:(unint64_t)a3
{
  if (objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration", a3), "createLargeDefaultTables"))return 5;
  else
    return 4;
}

+ (id)geometryForPrototypeIndex:(int64_t)a3 withCanvasPoint:(CGPoint)a4
{
  double y;
  double x;
  unsigned int v8;
  double v9;

  y = a4.y;
  x = a4.x;
  v8 = objc_msgSend(a1, "numberOfRowsForProtoIndex:");
  v9 = (float)((float)objc_msgSend(a1, "numberOfColumnsForProtoIndex:", a3) * 98.0);
  return -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", x - v9 * 0.5, y - (float)((float)v8 * 22.0) * 0.5, v9, (float)((float)v8 * 22.0));
}

+ (id)tablePrototypeWithIndex:(int64_t)a3 context:(id)a4 geometry:(id)a5 styles:(id)a6
{
  TSTTableInfo *v7;

  v7 = -[TSTTableInfo initWithContext:geometry:rows:columns:styles:]([TSTTableInfo alloc], "initWithContext:geometry:rows:columns:styles:", a4, a5, objc_msgSend(a1, "numberOfRowsForProtoIndex:"), objc_msgSend(a1, "numberOfColumnsForProtoIndex:", a3), a6);
  -[TSTTableInfo setupTableModelForPrototypeIndex:](v7, "setupTableModelForPrototypeIndex:", a3);
  return v7;
}

- (void)p_didLoadRichTextPayloadTable:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_msgSend(a3, "allRichTextPayloadStorages", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setParentInfo:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)shiftGeometryToIncludeTableNameHeight
{
  TSDInfoGeometry *v3;
  double v4;
  double v5;
  TSDInfoGeometry *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  TSDInfoGeometry *v13;

  v3 = -[TSDDrawableInfo geometry](self, "geometry");
  if (-[TSTTableModel tableNameEnabled](-[TSTTableInfo tableModel](self, "tableModel"), "tableNameEnabled"))
  {
    +[TSTMasterLayout tableNameTextSize:](TSTMasterLayout, "tableNameTextSize:", self->mTableModel);
    v5 = v4;
    v6 = [TSDInfoGeometry alloc];
    -[TSDInfoGeometry position](v3, "position");
    v8 = v7;
    -[TSDInfoGeometry position](v3, "position");
    v10 = v9 - v5;
    -[TSDInfoGeometry size](v3, "size");
    v13 = -[TSDInfoGeometry initWithPosition:size:](v6, "initWithPosition:size:", v8, v10, v11, v12);
    -[TSTTableInfo setGeometry:](self, "setGeometry:", v13);

  }
}

- (void)shiftGeometryToExcludeTableNameHeight
{
  TSDInfoGeometry *v3;
  double v4;
  double v5;
  TSDInfoGeometry *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  TSDInfoGeometry *v13;

  v3 = -[TSDDrawableInfo geometry](self, "geometry");
  +[TSTMasterLayout tableNameTextSize:](TSTMasterLayout, "tableNameTextSize:", self->mTableModel);
  v5 = v4;
  v6 = [TSDInfoGeometry alloc];
  -[TSDInfoGeometry position](v3, "position");
  v8 = v7;
  -[TSDInfoGeometry position](v3, "position");
  v10 = v5 + v9;
  -[TSDInfoGeometry size](v3, "size");
  v13 = -[TSDInfoGeometry initWithPosition:size:](v6, "initWithPosition:size:", v8, v10, v11, v12);
  -[TSTTableInfo setGeometry:](self, "setGeometry:", v13);

}

- (double)masterLayoutEffectiveTableNameHeight
{
  double result;

  +[TSTMasterLayout effectiveTableNameHeightForModel:](TSTMasterLayout, "effectiveTableNameHeightForModel:", self->mTableModel);
  return result;
}

- (BOOL)isSafeToConvertToImage
{
  int v3;

  v3 = -[TSTTableModel numberOfColumns](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfColumns");
  return -[TSTTableModel numberOfRows](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfRows")
       * v3 < 0x7D0;
}

- (BOOL)isSafeToConvertToAttributedString
{
  int v3;

  v3 = -[TSTTableModel numberOfColumns](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfColumns");
  return -[TSTTableModel numberOfRows](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfRows")
       * v3 < 0xFA0;
}

- (BOOL)isSafeToConvertToText
{
  int v3;

  v3 = -[TSTTableModel numberOfColumns](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfColumns");
  return -[TSTTableModel numberOfRows](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfRows")
       * v3 < 0xFA0;
}

- (TSKDocumentRoot)documentRoot
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableInfo;
  return (TSKDocumentRoot *)-[TSPObject documentRoot](&v3, sel_documentRoot);
}

- (TSTTableModel)tableModel
{
  return self->mTableModel;
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (Class)editorClass
{
  return 0;
}

- (BOOL)supportsHyperlinks
{
  return 0;
}

- (TSTTablePartitioner)partitioner
{
  TSTTablePartitioner *result;

  result = self->mPartitioner;
  if (!result)
  {
    result = -[TSTTablePartitioner initWithInfo:]([TSTTablePartitioner alloc], "initWithInfo:", self);
    self->mPartitioner = result;
  }
  return result;
}

+ (BOOL)canPartition
{
  return 1;
}

- (void)clearPartitioner
{

  self->mPartitioner = 0;
}

- (TSTMasterLayout)masterLayout
{
  TSTMasterLayout *result;

  result = self->mMasterLayout;
  if (!result)
  {
    result = -[TSTMasterLayout initWithInfo:]([TSTMasterLayout alloc], "initWithInfo:", self);
    self->mMasterLayout = result;
  }
  return result;
}

- (int)elementKind
{
  return 4;
}

- (BOOL)supportsAttachedComments
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 animationFilter:(id)a4
{
  return +[TSTAnimation stageCountForTextureDeliveryStyle:andTable:](TSTAnimation, "stageCountForTextureDeliveryStyle:andTable:", a3, -[TSTTableInfo tableModel](self, "tableModel", a3, a4));
}

- (id)textureDeliveryStylesLocalized:(BOOL)a3 animationFilter:(id)a4
{
  return +[TSTAnimation textureDeliveryStylesLocalized:](TSTAnimation, "textureDeliveryStylesLocalized:", a3, a4);
}

- (unint64_t)textureDeliveryStyleFromDeliveryString:(id)a3
{
  return +[TSTAnimation textureDeliveryStyleFromDeliveryString:](TSTAnimation, "textureDeliveryStyleFromDeliveryString:", a3);
}

- (BOOL)reverseChunkingIsSupported
{
  return 0;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a4, a3);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableInfo mixedObjectWithFraction:ofObject:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableInfo.mm"), 763, CFSTR("%@ does not support %s!"), objc_opt_class(), "-[TSTTableInfo mixedObjectWithFraction:ofObject:]");
  return 0;
}

- (void)setGeometry:(id)a3 resizeInternal:(BOOL)a4 scaleFactor:(CGSize)a5
{
  -[TSTTableInfo setGeometry:resizeInternal:scaleFactor:shouldClearObjectPlaceholderFlag:](self, "setGeometry:resizeInternal:scaleFactor:shouldClearObjectPlaceholderFlag:", a3, a4, 1, a5.width, a5.height);
}

- (void)setGeometry:(id)a3 resizeInternal:(BOOL)a4 scaleFactor:(CGSize)a5 shouldClearObjectPlaceholderFlag:(BOOL)a6
{
  _BOOL4 v6;
  TSDInfoGeometry *v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v16;
  double v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  TSDInfoGeometry *v30;
  double v31;
  double v32;
  _BOOL8 v33;
  objc_super v34;
  objc_super v35;

  v6 = a6;
  v7 = (TSDInfoGeometry *)a3;
  -[TSDInfoGeometry size](-[TSDDrawableInfo geometry](self, "geometry", a3, a4, a5.width, a5.height), "size");
  v10 = v9;
  v12 = v11;
  -[TSDInfoGeometry size](v7, "size");
  if (v10 != v14 || v12 != v13)
  {
    v16 = -[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows");
    v17 = (float)((float)(v16 - -[TSTTableModel numberOfHiddenRows](self->mTableModel, "numberOfHiddenRows")) * 8.0);
    v18 = -[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns");
    v19 = (float)((float)(v18 - -[TSTTableModel numberOfHiddenColumns](self->mTableModel, "numberOfHiddenColumns")) * 8.0);
    -[TSDInfoGeometry size](v7, "size");
    v21 = v20;
    v23 = v22;
    -[TSDInfoGeometry size](v7, "size");
    v25 = v24;
    -[TSDInfoGeometry size](v7, "size");
    v27 = v26;
    -[TSDInfoGeometry angle](v7, "angle");
    if (v28 != 0.0 || (v27 >= v17 ? (v29 = v25 < v19) : (v29 = 1), v29))
    {
      if (v27 < v17)
        v23 = v17;
      if (v25 < v19)
        v21 = v19;
      v30 = [TSDInfoGeometry alloc];
      -[TSDInfoGeometry position](v7, "position");
      v7 = -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v30, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", -[TSDInfoGeometry widthValid](v7, "widthValid"), -[TSDInfoGeometry heightValid](v7, "heightValid"), -[TSDInfoGeometry horizontalFlip](v7, "horizontalFlip"), -[TSDInfoGeometry verticalFlip](v7, "verticalFlip"), v31, v32, v21, v23, 0.0);
      if (v6)
        goto LABEL_11;
LABEL_17:
      v33 = -[TSDDrawableInfo matchesObjectPlaceholderGeometry](self, "matchesObjectPlaceholderGeometry");
      v34.receiver = self;
      v34.super_class = (Class)TSTTableInfo;
      -[TSDDrawableInfo setGeometry:](&v34, sel_setGeometry_, v7);
      -[TSDDrawableInfo setMatchesObjectPlaceholderGeometry:](self, "setMatchesObjectPlaceholderGeometry:", v33);
      goto LABEL_18;
    }
  }
  if (!v6)
    goto LABEL_17;
LABEL_11:
  v35.receiver = self;
  v35.super_class = (Class)TSTTableInfo;
  -[TSDDrawableInfo setGeometry:](&v35, sel_setGeometry_, v7);
LABEL_18:
  -[TSTTablePartitioner setScaleToFit:](-[TSTTableInfo partitioner](self, "partitioner"), "setScaleToFit:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (void)setGeometry:(id)a3 resizeInternal:(BOOL)a4
{
  -[TSTTableInfo setGeometry:resizeInternal:scaleFactor:](self, "setGeometry:resizeInternal:scaleFactor:", a3, a4, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (void)setGeometry:(id)a3
{
  -[TSTTableInfo setGeometry:resizeInternal:](self, "setGeometry:resizeInternal:", a3, 1);
}

- (void)setContentWritingDirection:(int64_t)a3
{
  TSTTableModel *v5;
  TSSPropertyMap *v6;
  _QWORD v7[6];

  v5 = -[TSTTableInfo tableModel](self, "tableModel");
  v6 = objc_alloc_init(TSSPropertyMap);
  -[TSSPropertyMap setIntValue:forProperty:](v6, "setIntValue:forProperty:", a3, 798);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__TSTTableInfo_setContentWritingDirection___block_invoke;
  v7[3] = &unk_24D82F6F8;
  v7[4] = v5;
  v7[5] = v6;
  -[TSTTableInfo performBlockWithStylesheetForAddingStyles:](self, "performBlockWithStylesheetForAddingStyles:", v7);

}

uint64_t __43__TSTTableInfo_setContentWritingDirection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTableStyle:", objc_msgSend(a2, "variationOfStyle:propertyMap:", objc_msgSend(*(id *)(a1 + 32), "tableStyle"), *(_QWORD *)(a1 + 40)));
}

- (int64_t)contentWritingDirection
{
  int v2;

  v2 = -[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](-[TSTTableInfo tableModel](self, "tableModel"), "tableStyle"), "intValueForProperty:", 798);
  return v2 != 0x80000000 && v2 != -1 && v2 == 1;
}

- (void)scaleInfoGeometry:(CGSize)a3
{
  double height;
  double width;
  TSDInfoGeometry *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  TSDInfoGeometry *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  TSDInfoGeometry *v23;

  height = a3.height;
  width = a3.width;
  if ((*MEMORY[0x24BDBF148] != a3.width || *(double *)(MEMORY[0x24BDBF148] + 8) != a3.height)
    && (a3.width != 1.0 || a3.height != 1.0))
  {
    v8 = -[TSDDrawableInfo geometry](self, "geometry");
    -[TSDInfoGeometry size](v8, "size");
    v10 = width * v9;
    -[TSDInfoGeometry size](v8, "size");
    v12 = height * v11;
    v13 = [TSDInfoGeometry alloc];
    -[TSDInfoGeometry position](v8, "position");
    v15 = v14;
    v17 = v16;
    v18 = -[TSDInfoGeometry widthValid](v8, "widthValid");
    v19 = -[TSDInfoGeometry heightValid](v8, "heightValid");
    v20 = -[TSDInfoGeometry horizontalFlip](v8, "horizontalFlip");
    v21 = -[TSDInfoGeometry verticalFlip](v8, "verticalFlip");
    -[TSDInfoGeometry angle](v8, "angle");
    v23 = -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v13, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", v18, v19, v20, v21, v15, v17, v10, v12, v22);
    -[TSTTableInfo setGeometry:resizeInternal:](self, "setGeometry:resizeInternal:", v23, 1);

  }
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  TSTTableModel *v7;
  int v8;
  int v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = -[TSTTableInfo tableModel](self, "tableModel");
  v8 = -[TSTTableModel numberOfColumns](v7, "numberOfColumns");
  if (v8 == -[TSTTableModel numberOfHeaderColumns](v7, "numberOfHeaderColumns"))
    -[TSTTableModel setNumberOfHeaderColumns:](v7, "setNumberOfHeaderColumns:", (unsigned __int16)(-[TSTTableModel numberOfHeaderColumns](v7, "numberOfHeaderColumns") - 1));
  v9 = -[TSTTableModel numberOfRows](v7, "numberOfRows");
  v10 = -[TSTTableModel numberOfHeaderRows](v7, "numberOfHeaderRows");
  if (-[TSTTableModel numberOfFooterRows](v7, "numberOfFooterRows") + v10 == v9)
  {
    if (-[TSTTableModel numberOfFooterRows](v7, "numberOfFooterRows"))
      -[TSTTableModel setNumberOfFooterRows:](v7, "setNumberOfFooterRows:", (unsigned __int16)(-[TSTTableModel numberOfFooterRows](v7, "numberOfFooterRows") - 1));
    else
      -[TSTTableModel setNumberOfHeaderRows:](v7, "setNumberOfHeaderRows:", (unsigned __int16)(-[TSTTableModel numberOfHeaderRows](v7, "numberOfHeaderRows") - 1));
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = -[TSTTableInfo allWPStorages](self, "allWPStorages");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v16, "willBeAddedToDocumentRoot:dolcContext:", a3, a4);
        objc_msgSend(v16, "setParentInfo:", self);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }
  -[TSWPStorage willBeAddedToDocumentRoot:dolcContext:](-[TSTEditingState editingStorage](self->mEditingState, "editingStorage"), "willBeAddedToDocumentRoot:dolcContext:", a3, a4);
  -[TSTMasterLayout willBeAddedToDocumentRoot:](self->mMasterLayout, "willBeAddedToDocumentRoot:", a3);
  v17.receiver = self;
  v17.super_class = (Class)TSTTableInfo;
  -[TSDDrawableInfo willBeAddedToDocumentRoot:context:](&v17, sel_willBeAddedToDocumentRoot_context_, a3, a4);
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)TSTTableInfo;
  -[TSDDrawableInfo wasAddedToDocumentRoot:context:](&v17, sel_wasAddedToDocumentRoot_context_);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("kObjectWasAddedToDocumentNotification"), a3, 0);
  if (TSTTableNumberOfComments(-[TSTTableInfo tableModel](self, "tableModel")))
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("kTSDAnnotationInvalidatedNotification"), a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = -[TSTTableInfo allWPStorages](self, "allWPStorages", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "wasAddedToDocumentRoot:dolcContext:", a3, a4);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }
  -[TSWPStorage wasAddedToDocumentRoot:dolcContext:](-[TSTEditingState editingStorage](self->mEditingState, "editingStorage"), "wasAddedToDocumentRoot:dolcContext:", a3, a4);
  if (!-[TSTEditingState selection](self->mEditingState, "selection"))
  {
    -[TSTEditingState setSelection:](self->mEditingState, "setSelection:", -[TSTTableSelection initWithTableModel:selectionType:]([TSTTableSelection alloc], "initWithTableModel:selectionType:", -[TSTTableInfo tableModel](self, "tableModel"), 5));
    -[TSTEditingState changeEditingMode:](self->mEditingState, "changeEditingMode:", 0);
  }
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_opt_respondsToSelector();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[TSTTableInfo allWPStorages](self, "allWPStorages");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "willBeRemovedFromDocumentRoot:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[TSWPStorage willBeRemovedFromDocumentRoot:](-[TSTEditingState editingStorage](self->mEditingState, "editingStorage"), "willBeRemovedFromDocumentRoot:", a3);
  v10.receiver = self;
  v10.super_class = (Class)TSTTableInfo;
  -[TSDDrawableInfo willBeRemovedFromDocumentRoot:](&v10, sel_willBeRemovedFromDocumentRoot_, a3);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("kObjectWasRemovedFromDocumentNotification"), a3, 0);
  if (TSTTableNumberOfComments(-[TSTTableInfo tableModel](self, "tableModel")))
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("kTSDAnnotationInvalidatedNotification"), a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = -[TSTTableInfo allWPStorages](self, "allWPStorages");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "wasRemovedFromDocumentRoot:", a3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  -[TSWPStorage wasRemovedFromDocumentRoot:](-[TSTEditingState editingStorage](self->mEditingState, "editingStorage"), "wasRemovedFromDocumentRoot:", a3);
  -[TSTMasterLayout wasRemovedFromDocumentRoot](self->mMasterLayout, "wasRemovedFromDocumentRoot");
  v11.receiver = self;
  v11.super_class = (Class)TSTTableInfo;
  -[TSDDrawableInfo wasRemovedFromDocumentRoot:](&v11, sel_wasRemovedFromDocumentRoot_, a3);
}

- (id)childEnumerator
{
  return (id)objc_msgSend(-[TSTTableInfo allWPStorages](self, "allWPStorages"), "objectEnumerator");
}

- (void)acceptVisitor:(id)a3
{
  objc_msgSend(a3, "visitTSTTableInfo:", self);
}

- (id)searchForString:(id)a3 options:(unint64_t)a4 onHit:(id)a5
{
  +[TSTFindReplace searchInfo:forString:options:hitBlock:](TSTFindReplace, "searchInfo:forString:options:hitBlock:", self, a3, a4, a5);
  return 0;
}

- (id)searchForAnnotationsWithHitBlock:(id)a3
{
  +[TSTFindReplace searchInfo:forAnnotationsWithHitBlock:](TSTFindReplace, "searchInfo:forAnnotationsWithHitBlock:", self, a3);
  return 0;
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5
{
  objc_msgSend(a1, "bootstrapPresetsOfKind:inTheme:alternate:reservedCount:", a3, a4, *(_QWORD *)&a5, 0);
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5 reservedCount:(unint64_t)a6
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TSTTableStylePreset *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;

  v7 = *(_QWORD *)&a5;
  v10 = objc_msgSend(a4, "stylesheet");
  v11 = objc_msgSend(a4, "context");
  v12 = 6 - a6;
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 6 - a6);
  if (objc_msgSend(a3, "isEqual:", String))
  {
    v18 = a3;
    if (a6 != 6)
    {
      v13 = 0;
      if (v12 <= 1)
        v14 = 1;
      else
        v14 = v12;
      do
      {
        v15 = -[TSTTableStylePreset initWithStyleNetwork:index:]([TSTTableStylePreset alloc], "initWithStyleNetwork:index:", +[TSTTableStyleNetwork createStylesInStylesheet:presetIndex:colors:alternate:](TSTTableStyleNetwork, "createStylesInStylesheet:presetIndex:colors:alternate:", v10, v13, objc_msgSend(a4, "colors"), v7), v13);
        if (-[TSPObject context](v15, "context") != (TSPObjectContext *)v11)
        {
          v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTTableInfo bootstrapPresetsOfKind:inTheme:alternate:reservedCount:]");
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableInfo.mm"), 1252, CFSTR("expected equality between %s and %s"), "p.context", "context");
        }
        objc_msgSend(v19, "addObject:", v15);

        ++v13;
      }
      while (v14 != v13);
    }
    objc_msgSend(a4, "setPresets:ofKind:", v19, v18);
  }

}

+ (id)presetKinds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", String);
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  -[TSTTableModel adoptStylesheet:withMapper:](-[TSTTableInfo tableModel](self, "tableModel"), "adoptStylesheet:withMapper:", a3, a4);
  -[TSTEditingState adoptStylesheet:withMapper:](-[TSTTableInfo editingState](self, "editingState"), "adoptStylesheet:withMapper:", a3, a4);
}

- (id)referencedStyles
{
  TSTTableModel *v2;
  id v3;
  void *v4;
  TSTCellIterator *v5;
  uint64_t v6;
  char v8[8];
  uint64_t v9;

  v2 = -[TSTTableInfo tableModel](self, "tableModel");
  v3 = +[TSTTableStyleNetwork networkFromTableModel:](TSTTableStyleNetwork, "networkFromTableModel:", v2);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", objc_msgSend(v3, "styleArray"));
  v5 = -[TSTCellIterator initWithTableModel:flags:]([TSTCellIterator alloc], "initWithTableModel:flags:", v2, 352);
  if (TSTCellIteratorGetNextCell(v5, v8))
  {
    do
    {
      v6 = v9;
      if (v9)
      {
        if (*(_QWORD *)(v9 + 40))
          objc_msgSend(v4, "addObject:");
        if (*(_QWORD *)(v6 + 56))
          objc_msgSend(v4, "addObject:");
      }
    }
    while ((TSTCellIteratorGetNextCell(v5, v8) & 1) != 0);
  }

  return v4;
}

- (void)replaceReferencedStylesUsingBlock:(id)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  TSTTableStyleNetwork *v14;
  TSTCellIterator *v15;
  TSTEphemeralCellMap *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BYTE v28[4];
  unsigned int v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(+[TSTTableStyleNetwork networkFromTableModel:](TSTTableStyleNetwork, "networkFromTableModel:", -[TSTTableInfo tableModel](self, "tableModel")), "styleArray");
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend((id)v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation((id)v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v13 = (*((uint64_t (**)(id, uint64_t))a3 + 2))(a3, v12);
        v9 |= v13 != v12;
        objc_msgSend(v6, "addObject:", v13);
      }
      v8 = objc_msgSend((id)v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
    if ((v9 & 1) != 0)
    {
      v5 = [TSTTableStyleNetwork alloc];
      v14 = (TSTTableStyleNetwork *)objc_msgSend((id)v5, "initWithContext:fromArray:presetIndex:", -[TSPObject context](self, "context"), v6, -[TSTTableModel presetIndex](-[TSTTableInfo tableModel](self, "tableModel"), "presetIndex"));
      -[TSTTableModel resetStyles:](-[TSTTableInfo tableModel](self, "tableModel"), "resetStyles:", v14);

    }
  }
  v15 = -[TSTCellIterator initWithTableModel:flags:]([TSTCellIterator alloc], "initWithTableModel:flags:", -[TSTTableInfo tableModel](self, "tableModel"), 48);
  v16 = -[TSTEphemeralCellMap initWithCapacity:]([TSTEphemeralCellMap alloc], "initWithCapacity:", 1);
  if (-[TSTCellIterator getNext:](v15, "getNext:", v28))
  {
    do
    {
      v17 = v30;
      if (!v30)
        continue;
      v18 = *(_QWORD *)(v30 + 40);
      if (v18)
      {
        objc_opt_class();
        (*((void (**)(id, uint64_t))a3 + 2))(a3, v18);
        v19 = TSUDynamicCast();
        v17 = v30;
        if (v19 != v18)
        {
          v20 = (void *)v19;
          v21 = *(void **)(v30 + 40);
          if (v21 != (void *)v19)
          {

            *(_QWORD *)(v17 + 40) = v20;
            *(_DWORD *)(v17 + 32) = 0;
            v17 = v30;
            if (!v30)
              goto LABEL_24;
          }
          v22 = 1;
          goto LABEL_19;
        }
        if (!v30)
          continue;
      }
      v22 = 0;
LABEL_19:
      v23 = *(_QWORD *)(v17 + 56);
      if (v23)
      {
        objc_opt_class();
        (*((void (**)(id, uint64_t))a3 + 2))(a3, v23);
        v24 = TSUDynamicCast();
        if (v24 != v23)
        {
          v25 = (void *)v24;
          v26 = v30;
          v27 = *(void **)(v30 + 56);
          if (v27 != (void *)v24)
          {

            *(_QWORD *)(v26 + 56) = v25;
            *(_DWORD *)(v26 + 48) = 0;
          }
LABEL_24:
          v5 = v5 & 0xFFFFFFFF00000000 | v29;
          -[TSTEphemeralCellMap addCell:andCellID:](v16, "addCell:andCellID:", v30, v5);
          continue;
        }
      }
      if (v22)
        goto LABEL_24;
    }
    while (-[TSTCellIterator getNext:](v15, "getNext:", v28));
  }

}

- (id)childCommandForApplyThemeCommand:(id)a3
{
  return 0;
}

- (id)descriptionForPasteboard
{
  void *v3;
  objc_super v5;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)TSTTableInfo;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", -[TSDDrawableInfo descriptionForPasteboard](&v5, sel_descriptionForPasteboard));
  v6[0] = kTSTDescriptionHasFormulas;
  v7[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v6[1] = kTSTDescriptionNumberOfRows;
  v7[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows"));
  v6[2] = kTSTDescriptionNumberOfColumns;
  v7[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns"));
  v6[3] = kTSTDescriptionHasMergeRanges;
  v7[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TSTTableModel hasMergeRanges](self->mTableModel, "hasMergeRanges"));
  v6[4] = kTSTDescriptionFullyFilteredTable;
  v7[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  objc_msgSend(v3, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 5));
  return v3;
}

- (id)descriptionForExactCopy
{
  $CA3468F20078D5D2DB35E78E73CA60DA v3;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v4;
  __CFString *v5;
  __CFString *v6;
  $CA3468F20078D5D2DB35E78E73CA60DA v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v3 = -[TSTTableModel range](-[TSTTableInfo tableModel](self, "tableModel"), "range");
  if (-[TSTEditingState selection](-[TSTTableInfo editingState](self, "editingState"), "selection"))
    v4 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTCellRegion boundingCellRange](-[TSTTableSelection cellRegion](-[TSTEditingState selection](-[TSTTableInfo editingState](self, "editingState"), "selection"), "cellRegion"), "boundingCellRange");
  else
    v4 = 0;
  v5 = (__CFString *)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x24BDBD240], -[TSTTableModel tableID](-[TSTTableInfo tableModel](self, "tableModel"), "tableID"));
  v6 = v5;
  v10[0] = v5;
  v9[0] = kTSTDescriptionSourceTableID;
  v9[1] = kTSTDescriptionSourceRange;
  v8 = v3;
  v10[1] = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8, 8);
  v9[2] = kTSTDescriptionSourceOrigin;
  v8.var0 = v4;
  v10[2] = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8, 4);
  v9[3] = kTSTDescriptionSourceNumHeaderRows;
  v10[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[TSTTableModel numberOfHeaderRows](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfHeaderRows"));
  v9[4] = kTSTDescriptionSourceNumHeaderColumns;
  v10[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[TSTTableModel numberOfHeaderColumns](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfHeaderColumns"));
  v9[5] = kTSTDescriptionSourceNumFooterRows;
  v10[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[TSTTableModel numberOfFooterRows](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfFooterRows"));
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
}

- (id)descriptionForPasteboardWithSource:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  v5 = -[TSTTableInfo descriptionForPasteboard](self, "descriptionForPasteboard");
  if (v4)
  {
    v6 = objc_msgSend(v4, "descriptionForExactCopy");
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v5);
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);
  }
  return v5;
}

- (id)childInfos
{
  return 0;
}

- (void)setEditingCellID:(id)a3
{
  if (a3.var0 == 0xFFFF || (*(_QWORD *)&a3.var0 & 0xFF0000) == 0xFF0000)
    self->mPreviousEditingCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)0xFFFFFF;
  else
    self->mPreviousEditingCellID = self->mEditingCellID;
  self->mEditingCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)editingCellRange
{
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v3;
  unint64_t v4;
  BOOL v5;

  v3 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTTableInfo editingCellID](self, "editingCellID");
  v4 = TSTTableMergeRangeAtCellID((uint64_t)-[TSTTableInfo tableModel](self, "tableModel"), *(_DWORD *)&v3);
  if ((_WORD)v4 == 0xFFFF)
    return ($CA3468F20078D5D2DB35E78E73CA60DA)(*(unsigned int *)&v3 | 0x1000100000000);
  v5 = (v4 & 0xFF0000) == 0xFF0000 || HIWORD(v4) == 0;
  if (v5 || (v4 & 0xFFFF00000000) == 0)
    return ($CA3468F20078D5D2DB35E78E73CA60DA)(*(unsigned int *)&v3 | 0x1000100000000);
  return ($CA3468F20078D5D2DB35E78E73CA60DA)v4;
}

- (void)setFormulaEditing:(BOOL)a3
{
  void *v5;
  uint64_t v6;

  if (self->mIsFormulaEditing == a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableInfo setFormulaEditing:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableInfo.mm"), 1553, CFSTR("Calling setFormulaEditing with the same value as existing.  These should be paired up."));
  }
  self->mIsFormulaEditing = a3;
}

- (void)setHasReference:(BOOL)a3
{
  if (self->mHasReference != a3)
    self->mHasReference = a3;
}

- (void)willCopyWithOtherDrawables:(id)a3
{
  -[TSTTableModel setDrawableIsBeingCopied:](-[TSTTableInfo tableModel](self, "tableModel", a3), "setDrawableIsBeingCopied:", 1);
}

- (void)didCopy
{
  -[TSTTableModel setDrawableIsBeingCopied:](-[TSTTableInfo tableModel](self, "tableModel"), "setDrawableIsBeingCopied:", 0);
}

- (BOOL)autoListRecognition
{
  return 1;
}

- (BOOL)autoListTermination
{
  return 1;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (id)allWPStorages
{
  return -[TSTTableModel allRichTextPayloadStorages](-[TSTTableInfo tableModel](self, "tableModel"), "allRichTextPayloadStorages");
}

- (void)didReplaceTextsInStoragesWithPlaceHolderString
{
  -[TSUConcurrentCache removeAllObjects](-[TSTMasterLayout dupContentCache](self->mMasterLayout, "dupContentCache"), "removeAllObjects");
  -[TSUConcurrentCache removeAllObjects](-[TSTMasterLayout cellIDToWPColumnCache](self->mMasterLayout, "cellIDToWPColumnCache"), "removeAllObjects");
}

- (void)performBlockWithStylesheetForAddingStyles:(id)a3
{
  TSKDocumentRoot *v5;
  uint64_t v6;
  TSSStylesheet *v7;

  v5 = -[TSTTableInfo documentRoot](self, "documentRoot");
  v6 = -[TSKDocumentRoot stylesheet](v5, "stylesheet");
  v7 = -[TSSTheme stylesheet](-[TSKDocumentRoot theme](v5, "theme"), "stylesheet");
  if (-[TSDDrawableInfo isThemeContent](self, "isThemeContent"))
  {
    if (-[TSSStylesheet isLocked](v7, "isLocked"))
    {
      -[TSSStylesheet setIsLocked:](v7, "setIsLocked:", 0);
      (*((void (**)(id, TSSStylesheet *))a3 + 2))(a3, v7);
      -[TSSStylesheet setIsLocked:](v7, "setIsLocked:", 1);
      return;
    }
  }
  else
  {
    v7 = (TSSStylesheet *)v6;
  }
  (*((void (**)(id, TSSStylesheet *))a3 + 2))(a3, v7);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)editingCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mEditingCellID;
}

- (TSTEditingState)editingState
{
  return self->mEditingState;
}

- (void)setEditingState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)previousEditingCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mPreviousEditingCellID;
}

- (BOOL)isFormulaEditing
{
  return self->mIsFormulaEditing;
}

- (BOOL)hasReference
{
  return self->mHasReference;
}

@end

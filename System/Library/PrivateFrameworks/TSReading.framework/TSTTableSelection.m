@implementation TSTTableSelection

- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6 baseRegion:(id)a7 selectionType:(int)a8
{
  void *v14;
  uint64_t v15;
  TSTTableSelection *v16;
  objc_super v18;

  if (!a3)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 56, CFSTR("invalid nil value for '%s'"), "table");
  }
  v18.receiver = self;
  v18.super_class = (Class)TSTTableSelection;
  v16 = -[TSTTableSelection init](&v18, sel_init);
  if (v16)
  {
    v16->mCellRegion = (TSTCellRegion *)a4;
    v16->mAnchorCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a5;
    v16->mCursorCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a6;
    v16->mBaseRegion = (TSTCellRegion *)a7;
    v16->mSelectionType = a8;
    v16->mSearchReferenceRange.location = 0;
    v16->mSearchReferenceRange.length = 0;
  }
  return v16;
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6 baseRegion:(id)a7
{
  return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:](self, "initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:", a3, a4, *(unsigned int *)&a5, *(unsigned int *)&a6, a7, 0);
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6 selectionType:(int)a7
{
  return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:](self, "initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:", a3, a4, *(unsigned int *)&a5, *(unsigned int *)&a6, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", 0), *(_QWORD *)&a7);
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4 anchorCellID:(id)a5 cursorCellID:(id)a6
{
  return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:](self, "initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:", a3, a4, *(unsigned int *)&a5, *(unsigned int *)&a6, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", 0));
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellRange:(id)a4 type:(int)a5 anchorCellID:(id)a6 cursorCellID:(id)a7
{
  uint64_t v9;

  v9 = *(_QWORD *)&a5;
  if (a3 && (a5 - 3) <= 0xFFFFFFFD)
    a4 = ($CA3468F20078D5D2DB35E78E73CA60DA)TSTTableExpandCellRangeToCoverMergedCells((uint64_t)a3, *(_QWORD *)&a4);
  return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:](self, "initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:", a3, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a4), *(unsigned int *)&a6, *(unsigned int *)&a7, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", 0), v9);
}

- (TSTTableSelection)initWithTableModel:(id)a3 selectionType:(int)a4
{
  uint64_t v4;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  TSTTableSelection *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  if (a4 == 4)
    goto LABEL_5;
  if (a4 != 5)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableSelection initWithTableModel:selectionType:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 148, CFSTR("expected equality between %s and %s"), "selectionType", "kTableNameSelection");
LABEL_5:
    v8 = +[TSTCellRegion invalidRegion](TSTCellRegion, "invalidRegion");
    v11 = self;
    v12 = a3;
    v10 = 0xFFFFFFLL;
    v9 = 0xFFFFFFLL;
    v13 = v4;
    return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:selectionType:](v11, "initWithTableModel:cellRegion:anchorCellID:cursorCellID:selectionType:", v12, v8, v10, v9, v13);
  }
  v7 = objc_msgSend(a3, "range");
  v8 = +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", v7);
  v9 = (v7 + ((v7 >> 16) & 0xFF0000) + 16711680) & 0xFF0000 | (unsigned __int16)(v7 + HIWORD(v7) - 1);
  v10 = v7;
  v11 = self;
  v12 = a3;
  v13 = 5;
  return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:selectionType:](v11, "initWithTableModel:cellRegion:anchorCellID:cursorCellID:selectionType:", v12, v8, v10, v9, v13);
}

- (TSTTableSelection)initWithTableModel:(id)a3 andCellRange:(id)a4
{
  return -[TSTTableSelection initWithTableModel:cellRange:type:anchorCellID:cursorCellID:](self, "initWithTableModel:cellRange:type:anchorCellID:cursorCellID:", a3, a4, 0, *(_DWORD *)&a4.var0, *(_DWORD *)&a4.var0);
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellID:(id)a4 selectionType:(int)a5
{
  return -[TSTTableSelection initWithTableModel:cellRange:type:anchorCellID:cursorCellID:](self, "initWithTableModel:cellRange:type:anchorCellID:cursorCellID:", a3, *(unsigned int *)&a4 | 0x1000100000000, *(_QWORD *)&a5, *(unsigned int *)&a4, *(unsigned int *)&a4);
}

- (TSTTableSelection)initWithTableModel:(id)a3 andCellID:(id)a4
{
  return -[TSTTableSelection initWithTableModel:cellRange:type:anchorCellID:cursorCellID:](self, "initWithTableModel:cellRange:type:anchorCellID:cursorCellID:", a3, *(unsigned int *)&a4 | 0x1000100000000, 0, *(unsigned int *)&a4, *(unsigned int *)&a4);
}

- (TSTTableSelection)initWithTableModel:(id)a3 startingRowIndex:(unsigned __int16)a4 numberOfRows:(unsigned __int16)a5
{
  uint64_t v5;
  unsigned int v6;
  int v9;

  v5 = a5;
  v6 = a4;
  v9 = objc_msgSend(a3, "numberOfColumns");
  if ((int)(objc_msgSend(a3, "numberOfRows") - v6) <= (int)v5)
    v5 = objc_msgSend(a3, "numberOfRows") - v6;
  return -[TSTTableSelection initWithTableModel:cellRange:type:anchorCellID:cursorCellID:](self, "initWithTableModel:cellRange:type:anchorCellID:cursorCellID:", a3, ((unint64_t)v9 << 32) | (v5 << 48) | v6, 1, v6, ((v9 << 16) - 1) & 0xFF0000 | (unsigned __int16)(v6 + v5 - 1));
}

- (TSTTableSelection)initWithTableModel:(id)a3 startingColumnIndex:(unsigned __int16)a4 numberOfColumns:(unsigned __int16)a5
{
  unsigned __int16 v5;
  uint64_t v9;
  uint64_t v10;

  v5 = a5;
  if ((int)(objc_msgSend(a3, "numberOfColumns") - a4) <= a5)
    v5 = objc_msgSend(a3, "numberOfColumns") - a4;
  v9 = objc_msgSend(a3, "numberOfRows");
  if (v5 >= 0xFFu)
    v10 = 255;
  else
    v10 = v5;
  return -[TSTTableSelection initWithTableModel:cellRange:type:anchorCellID:cursorCellID:](self, "initWithTableModel:cellRange:type:anchorCellID:cursorCellID:", a3, (v10 << 32) | (v9 << 48) | ((unint64_t)a4 << 16), 2, (unint64_t)a4 << 16, ((a4 << 16) + ((_DWORD)v10 << 16) + 16711680) & 0xFF0000 | (unsigned __int16)(v9 - 1));
}

- (TSTTableSelection)initWithTableModel:(id)a3 rowOrColumn:(int)a4 index:(unsigned int)a5 count:(unsigned int)a6
{
  void *v7;
  uint64_t v8;

  if (a4 == 2)
    return -[TSTTableSelection initWithTableModel:startingColumnIndex:numberOfColumns:](self, "initWithTableModel:startingColumnIndex:numberOfColumns:", a3, a5, (unsigned __int16)a6);
  if (a4 == 1)
    return -[TSTTableSelection initWithTableModel:startingRowIndex:numberOfRows:](self, "initWithTableModel:startingRowIndex:numberOfRows:", a3, (unsigned __int16)a5, (unsigned __int16)a6);
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableSelection initWithTableModel:rowOrColumn:index:count:]");
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 218, CFSTR("Invalid selection type used with rowOrColumn initializer."));
  return 0;
}

- (TSTTableSelection)initWithTableModel:(id)a3 andPreviousSelection:(id)a4 offsetBy:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v16;
  int v17;
  uint64_t v18;
  uint64_t v21;

  v8 = objc_msgSend((id)objc_msgSend(a4, "cellRegion"), "regionOffsetBy:", a5);
  v9 = objc_msgSend(a4, "anchorCellID");
  v10 = a5.var0 + BYTE2(v9);
  v11 = a5.var1 + (unsigned __int16)v9;
  v12 = objc_msgSend(a4, "cursorCellID");
  v13 = objc_msgSend((id)objc_msgSend(a4, "baseRegion"), "regionOffsetBy:", a5);
  v14 = objc_msgSend(a4, "selectionType");
  v16 = v11 <= 0xFFFF && v11 >= 0 && (v10 & 0xFFFF0000) == 0;
  v17 = a5.var1 + (unsigned __int16)v12;
  if (v16)
    v18 = (v10 << 16) | v11;
  else
    v18 = 0xFFFFFFLL;
  if (v17 <= 0xFFFF && v17 >= 0 && ((a5.var0 + BYTE2(v12)) & 0xFFFF0000) == 0)
    v21 = ((LOBYTE(a5.var0) + BYTE2(v12)) << 16) | v17;
  else
    v21 = 0xFFFFFFLL;
  return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:](self, "initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:", a3, v8, v18, v21, v13, v14);
}

- (TSTTableSelection)initWithTableModel:(id)a3 cellRegion:(id)a4
{
  return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:](self, "initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:", a3, a4, objc_msgSend(a4, "suitableAnchor"), objc_msgSend(a4, "suitableCursor"), +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", 0), 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableSelection;
  -[TSTTableSelection dealloc](&v3, sel_dealloc);
}

- (id)selectionByExtendingWithCellRange:(id)a3 inTable:(id)a4 selectionType:(int)a5 cursorCell:(id)a6
{
  uint64_t v7;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  TSTCellRegion *v14;
  uint64_t v15;

  v7 = *(_QWORD *)&a5;
  if (a3.var0.var0 == 0xFFFF
    || (*(_QWORD *)&a3 & 0xFF0000) == 0xFF0000
    || !a3.var1.var1
    || (*(_QWORD *)&a3 & 0xFFFF00000000) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableSelection selectionByExtendingWithCellRange:inTable:selectionType:cursorCell:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 372, CFSTR("Can't extend a selection with an invalid cell range"));
  }
  v13 = -[TSTCellRegion containsCellID:](-[TSTTableSelection cellRegion](self, "cellRegion"), "containsCellID:", -[TSTTableSelection anchorCellID](self, "anchorCellID"));
  v14 = -[TSTTableSelection baseRegion](self, "baseRegion");
  if (v13)
    v15 = -[TSTCellRegion regionByAddingRange:](v14, "regionByAddingRange:", a3);
  else
    v15 = -[TSTCellRegion regionBySubtractingRange:](v14, "regionBySubtractingRange:", a3);
  return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:]([TSTTableSelection alloc], "initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:", a4, v15, -[TSTTableSelection anchorCellID](self, "anchorCellID"), *(unsigned int *)&a6, -[TSTTableSelection baseRegion](self, "baseRegion"), v7);
}

- (id)selectionByAddingCellRange:(id)a3 inTable:(id)a4 withAnchor:(id)a5 cursor:(id)a6 selectionType:(int)a7
{
  uint64_t v7;
  void *v13;
  uint64_t v14;

  v7 = *(_QWORD *)&a7;
  if (a3.var0.var0 == 0xFFFF
    || (*(_QWORD *)&a3 & 0xFF0000) == 0xFF0000
    || !a3.var1.var1
    || (*(_QWORD *)&a3 & 0xFFFF00000000) == 0)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableSelection selectionByAddingCellRange:inTable:withAnchor:cursor:selectionType:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 396, CFSTR("Can't extend a selection with an invalid cell range"));
  }
  return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:]([TSTTableSelection alloc], "initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:", a4, -[TSTCellRegion regionByAddingRange:](-[TSTTableSelection cellRegion](self, "cellRegion"), "regionByAddingRange:", a3), *(unsigned int *)&a5, *(unsigned int *)&a6, -[TSTTableSelection cellRegion](self, "cellRegion"), v7);
}

- (id)selectionByRemovingCellRange:(id)a3 inTable:(id)a4 withAnchor:(id)a5 cursor:(id)a6 selectionType:(int)a7
{
  uint64_t v7;
  void *v13;
  uint64_t v14;

  v7 = *(_QWORD *)&a7;
  if (a3.var0.var0 == 0xFFFF
    || (*(_QWORD *)&a3 & 0xFF0000) == 0xFF0000
    || !a3.var1.var1
    || (*(_QWORD *)&a3 & 0xFFFF00000000) == 0)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableSelection selectionByRemovingCellRange:inTable:withAnchor:cursor:selectionType:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableSelection.mm"), 410, CFSTR("Can't remove an invalid cell range"));
  }
  return -[TSTTableSelection initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:]([TSTTableSelection alloc], "initWithTableModel:cellRegion:anchorCellID:cursorCellID:baseRegion:selectionType:", a4, -[TSTCellRegion regionBySubtractingRange:](-[TSTTableSelection cellRegion](self, "cellRegion"), "regionBySubtractingRange:", a3), *(unsigned int *)&a5, *(unsigned int *)&a6, -[TSTTableSelection cellRegion](self, "cellRegion"), v7);
}

- (id)selectionByMovingInTableInfo:(id)a3 inDirection:(int)a4 withModifierKeys:(int)a5 forReferenceMove:(BOOL)a6
{
  return -[TSTTableSelection selectionByMovingInTableInfo:inDirection:withModifierKeys:forReferenceMove:suppressWrap:](self, "selectionByMovingInTableInfo:inDirection:withModifierKeys:forReferenceMove:suppressWrap:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, 0);
}

- (id)selectionByMovingInTableInfo:(id)a3 inDirection:(int)a4 withModifierKeys:(int)a5 forReferenceMove:(BOOL)a6 suppressWrap:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  char v9;
  unint64_t v13;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v14;
  int v15;
  int v16;
  $CA3468F20078D5D2DB35E78E73CA60DA v17;
  uint64_t v18;
  char v19;
  int v20;
  $CA3468F20078D5D2DB35E78E73CA60DA v21;
  unsigned __int16 v22;
  unint64_t v23;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  char v28;
  unsigned __int8 var1;
  char v30;
  unint64_t v31;
  unint64_t v32;
  unsigned int v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  int v38;
  unint64_t v39;
  void *v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned __int8 v44;
  char v45;
  unsigned __int16 var0;
  __int16 v47;
  __int16 v48;
  __int16 v49;
  int v50;
  unsigned __int16 v51;
  __int16 v52;
  __int16 v53;
  __int16 v54;
  __int16 v55;
  TSTTableSelection *v56;
  unsigned int v57;
  char v58;
  int v59;
  unint64_t v60;
  unsigned int v61;
  void *v62;
  void *v63;
  void *v64;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unsigned int v71;
  unsigned __int16 v72;
  unsigned int v73;
  unint64_t v74;
  unsigned int v75;
  unint64_t v76;
  unint64_t v77;
  TSTTableSelection *v78;
  unint64_t v79;
  unint64_t v80;
  TSTTableSelection *v81;
  unint64_t v83;
  unsigned int v84;
  TSTTableSelection *v85;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v86;
  void *v87;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v87 = (void *)objc_msgSend(a3, "tableModel");
  v13 = objc_msgSend(v87, "range");
  v14 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTTableSelection cursorCellID](self, "cursorCellID");
  v86 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTTableSelection anchorCellID](self, "anchorCellID");
  v15 = v9 & 0xC;
  v16 = -[TSTTableSelection selectionType](self, "selectionType");
  v85 = self;
  if ((v9 & 1) != 0 || v16 != 1)
  {
    v20 = -[TSTTableSelection selectionType](self, "selectionType");
    v19 = v9;
    if ((v9 & 1) == 0 && v20 == 2)
    {
      v21 = -[TSTCellRegion boundingCellRange](-[TSTTableSelection cellRegion](self, "cellRegion"), "boundingCellRange");
      if (v8)
        v22 = (LOBYTE(v21.var1.var0) + v21.var0.var1 - 1) - v21.var0.var1 + 1;
      else
        v22 = 1;
      if (a4 == 2)
      {
        if (v15)
          v43 = HIDWORD(v13) + WORD1(v13) + 255;
        else
          LOBYTE(v43) = TSTTableColumnRightOfColumn(v87, LOBYTE(v21.var1.var0) + v21.var0.var1 - 1);
        if ((_BYTE)v43 == 0xFF)
          v58 = -1;
        else
          v58 = v43 - v22 + 1;
        if (v8)
          LOBYTE(v23) = v58;
        else
          LOBYTE(v23) = v43;
      }
      else
      {
        if (a4 != 1)
          goto LABEL_19;
        if (v15)
          v23 = v13 >> 16;
        else
          LOBYTE(v23) = TSTTableColumnLeftOfColumn(v87, v21.var0.var1);
      }
      if ((_BYTE)v23 != 0xFF)
      {
        v56 = -[TSTTableSelection initWithTableModel:startingColumnIndex:numberOfColumns:]([TSTTableSelection alloc], "initWithTableModel:startingColumnIndex:numberOfColumns:", v87, v23, v22);
        return v56;
      }
      return 0;
    }
LABEL_19:
    v24 = v86;
    v25 = HIWORD(*(unsigned int *)&v86);
    if (v15)
    {
      v26 = HIBYTE(*(unsigned int *)&v86);
      v27 = HIBYTE(*(unsigned int *)&v14);
      v28 = v19;
      switch(a4)
      {
        case 1:
          if (v8)
          {
            if (v14.var1 >= v86.var1)
              var1 = v86.var1;
            else
              var1 = v14.var1;
            v30 = var1 - BYTE2(v13);
            LOBYTE(v31) = v14.var1 - v30;
            LOBYTE(v25) = v86.var1 - v30;
LABEL_94:
            LOWORD(v42) = v86.var0;
            LOWORD(v50) = v14.var0;
          }
          else
          {
            v27 = 0;
            v31 = v13 >> 16;
            LOWORD(v42) = v86.var0;
            LOWORD(v50) = v14.var0;
          }
          break;
        case 2:
          if (v8)
          {
            if (v14.var1 <= v86.var1)
              v44 = v86.var1;
            else
              v44 = v14.var1;
            v45 = BYTE4(v13) + BYTE2(v13) - 1 - v44;
            LOBYTE(v31) = v45 + v14.var1;
            LOBYTE(v25) = v45 + v86.var1;
          }
          else
          {
            v27 = 0;
            LODWORD(v31) = HIDWORD(v13) + WORD1(v13) + 255;
          }
          goto LABEL_94;
        case 3:
          if (v14.var0 >= v86.var0)
            var0 = v86.var0;
          else
            var0 = v14.var0;
          v47 = var0 - v13;
          v48 = v14.var0 - v47;
          v49 = v86.var0 - v47;
          if (v8)
            LOWORD(v42) = v49;
          else
            LOWORD(v42) = v86.var0;
          if (v8)
            LOWORD(v50) = v48;
          else
            LOWORD(v50) = v13;
          goto LABEL_67;
        case 4:
          if (v14.var0 <= v86.var0)
            v51 = v86.var0;
          else
            v51 = v14.var0;
          v52 = ~v51 + v13 + HIWORD(v13);
          v53 = v52 + v14.var0;
          v54 = v52 + v86.var0;
          if (v8)
            LOWORD(v42) = v54;
          else
            LOWORD(v42) = v86.var0;
          if (v8)
            LOWORD(v50) = v53;
          else
            LOWORD(v50) = v13 + HIWORD(v13) - 1;
LABEL_67:
          LOBYTE(v31) = v14.var1;
          if (!v8)
            v27 = 0;
          break;
        default:
          goto LABEL_159;
      }
      goto LABEL_160;
    }
    v28 = v19;
    if ((v19 & 1) != 0)
    {
      v32 = v13;
      if (-[TSTTableSelection selectionType](v85, "selectionType") == 1)
      {
        if (a4 == 4)
        {
          v33 = TSTTableCellBelowCell((uint64_t *)v87, *(unsigned int *)&v14);
        }
        else
        {
          if (a4 != 3)
          {
            v27 = HIBYTE(*(unsigned int *)&v14);
            LOWORD(v50) = v14.var0;
            goto LABEL_108;
          }
          v33 = TSTTableCellAboveCell((uint64_t *)v87, *(unsigned int *)&v14);
        }
        LOWORD(v50) = v33;
        v27 = HIBYTE(v33);
LABEL_108:
        v24 = v86;
        LOBYTE(v25) = v86.var1;
        v26 = HIBYTE(*(unsigned int *)&v86);
        LODWORD(v31) = HIDWORD(v13) + WORD1(v13) + 255;
LABEL_135:
        LOWORD(v42) = v24.var0;
        goto LABEL_160;
      }
      if (-[TSTTableSelection selectionType](v85, "selectionType") == 2)
      {
        if (a4 == 2)
        {
          v57 = TSTTableCellRightOfCell((uint64_t *)v87, *(unsigned int *)&v14);
        }
        else
        {
          if (a4 != 1)
          {
            v27 = HIBYTE(*(unsigned int *)&v14);
            LODWORD(v31) = HIWORD(*(unsigned int *)&v14);
            goto LABEL_134;
          }
          v57 = TSTTableCellLeftOfCell((uint64_t *)v87, *(unsigned int *)&v14);
        }
        LODWORD(v31) = HIWORD(v57);
        v27 = HIBYTE(v57);
LABEL_134:
        v24 = v86;
        LOBYTE(v25) = v86.var1;
        v26 = HIBYTE(*(unsigned int *)&v86);
        v50 = v13 + HIWORD(v13) - 1;
        goto LABEL_135;
      }
      v59 = a4 - 1;
      v83 = v32;
      switch(a4)
      {
        case 1:
          v60 = v14;
          v61 = TSTTableCellLeftOfCell((uint64_t *)v87, *(unsigned int *)&v14);
          goto LABEL_137;
        case 2:
          v60 = v14;
          v61 = TSTTableCellRightOfCell((uint64_t *)v87, *(unsigned int *)&v14);
LABEL_137:
          LOWORD(v50) = v61;
          v84 = HIBYTE(v61);
          LODWORD(v31) = HIWORD(v61);
          v65 = v86;
          v66 = TSTCellRangeUnionCellID(*(unsigned int *)&v86 | 0x1000100000000, v60);
          v67 = v66 & 0xFFFF000000000000;
          v68 = 0x100000000;
          LODWORD(v69) = HIWORD(*(unsigned int *)&v14);
          goto LABEL_142;
        case 3:
          v70 = v14;
          v71 = TSTTableCellAboveCell((uint64_t *)v87, *(unsigned int *)&v14);
          goto LABEL_140;
        case 4:
          v70 = v14;
          v71 = TSTTableCellBelowCell((uint64_t *)v87, *(unsigned int *)&v14);
LABEL_140:
          LOWORD(v50) = v71;
          v84 = HIBYTE(v71);
          LODWORD(v31) = HIWORD(v71);
          v65 = v86;
          v66 = TSTCellRangeUnionCellID(*(unsigned int *)&v86 | 0x1000100000000, v70);
          v69 = v66 >> 16;
          v68 = v66 & 0xFFFFFFFF00000000;
          v67 = 0x1000000000000;
          v72 = v14.var0;
          break;
        default:
          v84 = HIBYTE(*(unsigned int *)&v14);
          v65 = v86;
          v66 = TSTCellRangeUnionCellID(*(unsigned int *)&v86 | 0x1000100000000, *(unsigned int *)&v14);
          v69 = v66 >> 16;
          v68 = v66 & 0xFFFFFFFF00000000;
          v67 = v66 & 0xFFFF000000000000;
          LODWORD(v31) = HIWORD(*(unsigned int *)&v14);
          LOWORD(v50) = v14.var0;
LABEL_142:
          v72 = v66;
          break;
      }
      v73 = HIBYTE(*(unsigned int *)&v65);
      v74 = TSTTableExpandCellRangeToCoverMergedCells((uint64_t)v87, v67 | v66 & 0xFF000000 | v68 & 0xFFFF00000000 | ((unint64_t)v69 << 16) | v72);
      if (HIWORD(v74))
      {
        v27 = v84;
        if ((v74 & 0xFFFF00000000) != 0)
        {
          v26 = v73;
          if ((unsigned __int16)v50 >= (unsigned __int16)v74
            && (unsigned __int16)(v74 - 1 + HIWORD(v74)) >= (unsigned __int16)v50
            && v31 >= BYTE2(v74)
            && (v75 = HIDWORD(v74) + WORD1(v74) + 255,
                v31 <= (BYTE4(v74) + BYTE2(v74) - 1)))
          {
            switch(v59)
            {
              case 0:
                if (BYTE2(v74) == BYTE2(v83))
                  goto LABEL_185;
                LOBYTE(v31) = BYTE2(v74) - 1;
                goto LABEL_149;
              case 1:
                LOBYTE(v25) = v86.var1;
                if (v75 != (BYTE4(v83) + BYTE2(v83) - 1))
                {
                  LOBYTE(v31) = v75 + 1;
                  v24 = v86;
                  goto LABEL_135;
                }
                v27 = HIBYTE(*(unsigned int *)&v14);
                v24 = v86;
LABEL_159:
                LOWORD(v42) = v24.var0;
                LOWORD(v50) = v14.var0;
                LODWORD(v31) = HIWORD(*(unsigned int *)&v14);
                break;
              case 2:
                if ((unsigned __int16)v74 == (unsigned __int16)v83)
                  goto LABEL_185;
                v24 = v86;
                LOWORD(v42) = v86.var0;
                LOWORD(v50) = v74 - 1;
                goto LABEL_150;
              case 3:
                LOWORD(v50) = HIWORD(v74) + v74;
                if ((unsigned __int16)(HIWORD(v74) + v74) != (unsigned __int16)(v83 + HIWORD(v83)))
                  goto LABEL_149;
LABEL_185:
                v27 = HIBYTE(*(unsigned int *)&v14);
                v24 = v86;
                goto LABEL_104;
              default:
                goto LABEL_149;
            }
          }
          else
          {
LABEL_149:
            v24 = v86;
            LOWORD(v42) = v86.var0;
LABEL_150:
            LOBYTE(v25) = v86.var1;
          }
          goto LABEL_160;
        }
        v24 = v86;
        LOWORD(v42) = v86.var0;
        LOBYTE(v25) = v86.var1;
      }
      else
      {
        v24 = v86;
        LOWORD(v42) = v86.var0;
        LOBYTE(v25) = v86.var1;
        v27 = v84;
      }
      v26 = v73;
      goto LABEL_160;
    }
    v35 = objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "arrowKeysWrap") & !v7;
    v36 = objc_msgSend(a3, "masterLayout");
    v24 = v86;
    if (((*(_DWORD *)&v86 ^ *(_DWORD *)&v14) & 0xFFFFFF) != 0)
      v37 = 0;
    else
      v37 = v35;
    if (v8)
      v38 = v37;
    else
      v38 = v35;
    v26 = HIBYTE(*(unsigned int *)&v86);
    v39 = v13;
    switch(a4)
    {
      case 1:
        v40 = (void *)v36;
        if (v8)
        {
          v41 = TSTTableCellLeftOfCell((uint64_t *)v87, *(unsigned int *)&v14);
          v42 = TSTTableCellLeftOfCell((uint64_t *)v87, *(unsigned int *)&v86);
          v24 = v86;
          v25 = HIWORD(v42);
          v26 = HIBYTE(v42);
        }
        else
        {
          v25 = TSTTableCellLeftOfCell((uint64_t *)v87, *(unsigned int *)&v86);
          v26 = HIBYTE(*(unsigned int *)&v86);
          v41 = v25;
          v24 = v86;
          LOWORD(v42) = v86.var0;
          LOBYTE(v25) = v86.var1;
        }
        v27 = HIBYTE(v41);
        LODWORD(v31) = HIWORD(v41);
        if ((_WORD)v41 != 0xFFFF && (*(_QWORD *)&v41 & 0xFF0000) != 0xFF0000 || !v38)
          goto LABEL_130;
        LOWORD(v42) = TSTTableRowAboveRow(v87, v24.var0);
        LOBYTE(v25) = TSTMasterLayoutPreviousVisibleColumn(v40, (BYTE4(v39) + BYTE2(v39) - 1));
        goto LABEL_129;
      case 2:
        v62 = (void *)v36;
        if (v8)
        {
          v41 = TSTTableCellRightOfCell((uint64_t *)v87, *(unsigned int *)&v14);
          v42 = TSTTableCellRightOfCell((uint64_t *)v87, *(unsigned int *)&v86);
          v24 = v86;
          v25 = HIWORD(v42);
          v26 = HIBYTE(v42);
        }
        else
        {
          v25 = TSTTableCellRightOfCell((uint64_t *)v87, *(unsigned int *)&v86);
          v26 = HIBYTE(*(unsigned int *)&v86);
          v41 = v25;
          v24 = v86;
          LOWORD(v42) = v86.var0;
          LOBYTE(v25) = v86.var1;
        }
        v27 = HIBYTE(v41);
        LODWORD(v31) = HIWORD(v41);
        if ((_WORD)v41 != 0xFFFF && (*(_QWORD *)&v41 & 0xFF0000) != 0xFF0000 || !v38)
          goto LABEL_130;
        LOWORD(v42) = TSTTableRowBelowRow(v87, v24.var0);
        LOBYTE(v25) = TSTMasterLayoutNextVisibleColumn(v62, 0);
        goto LABEL_129;
      case 3:
        v63 = (void *)v36;
        if (v8)
        {
          v41 = TSTTableCellAboveCell((uint64_t *)v87, *(unsigned int *)&v14);
          v42 = TSTTableCellAboveCell((uint64_t *)v87, *(unsigned int *)&v86);
          v24 = v86;
          v25 = HIWORD(v42);
          v26 = HIBYTE(v42);
        }
        else
        {
          v25 = TSTTableCellAboveCell((uint64_t *)v87, *(unsigned int *)&v86);
          v26 = HIBYTE(*(unsigned int *)&v86);
          v41 = v25;
          v24 = v86;
          LOWORD(v42) = v86.var0;
          LOBYTE(v25) = v86.var1;
        }
        v27 = HIBYTE(v41);
        LODWORD(v31) = HIWORD(v41);
        if ((_WORD)v41 != 0xFFFF && (*(_QWORD *)&v41 & 0xFF0000) != 0xFF0000 || !v38)
          goto LABEL_130;
        LOWORD(v42) = TSTMasterLayoutPreviousVisibleRow(v63, (unsigned __int16)(v39 + HIWORD(v39) - 1));
        LOBYTE(v25) = TSTTableColumnLeftOfColumn(v87, v86.var1);
        goto LABEL_129;
      case 4:
        v64 = (void *)v36;
        if (v8)
        {
          v41 = TSTTableCellBelowCell((uint64_t *)v87, *(unsigned int *)&v14);
          v42 = TSTTableCellBelowCell((uint64_t *)v87, *(unsigned int *)&v86);
          v24 = v86;
          v25 = HIWORD(v42);
          v26 = HIBYTE(v42);
        }
        else
        {
          v25 = TSTTableCellBelowCell((uint64_t *)v87, *(unsigned int *)&v86);
          v26 = HIBYTE(*(unsigned int *)&v86);
          v41 = v25;
          v24 = v86;
          LOWORD(v42) = v86.var0;
          LOBYTE(v25) = v86.var1;
        }
        v27 = HIBYTE(v41);
        LODWORD(v31) = HIWORD(v41);
        if (((_WORD)v41 == 0xFFFF || (*(_QWORD *)&v41 & 0xFF0000) == 0xFF0000) && v38)
        {
          LOWORD(v42) = TSTMasterLayoutNextVisibleRow(v64, 0);
          LOBYTE(v25) = TSTTableColumnRightOfColumn(v87, v86.var1);
LABEL_129:
          v24 = v86;
          v26 = v27;
          LOWORD(v50) = v42;
          LOBYTE(v31) = v25;
        }
        else
        {
LABEL_130:
          LOWORD(v50) = v41;
        }
        break;
      default:
        v27 = HIBYTE(*(unsigned int *)&v14);
LABEL_104:
        LOWORD(v42) = v24.var0;
        LOWORD(v50) = v14.var0;
        LODWORD(v31) = HIWORD(*(unsigned int *)&v14);
        goto LABEL_150;
    }
LABEL_160:
    if ((_WORD)v50 != 0xFFFF && (_BYTE)v31 != 0xFF)
    {
      v76 = (unsigned __int16)v50 | ((unint64_t)v27 << 24) | ((unint64_t)v31 << 16);
      if ((v28 & 1) != 0)
      {
        v77 = TSTCellRangeUnionCellID(*(unsigned int *)&v24 | 0x1000100000000, (unsigned __int16)v50 | ((unint64_t)v27 << 24) | ((unint64_t)v31 << 16));
        if (-[TSTTableSelection selectionType](v85, "selectionType") == 1)
        {
          v78 = v85;
        }
        else
        {
          v78 = v85;
          if (-[TSTTableSelection selectionType](v85, "selectionType") != 2)
            v77 = TSTTableExpandCellRangeToCoverMergedCells((uint64_t)v87, v77);
        }
        if (!-[TSTCellRegion equalsCellRange:](-[TSTTableSelection cellRegion](v78, "cellRegion", v83), "equalsCellRange:", v77)|| ((v76 ^ -[TSTTableSelection cursorCellID](v78, "cursorCellID")) & 0xFFFFFFLL) != 0)
        {
          return -[TSTTableSelection selectionByExtendingWithCellRange:inTable:selectionType:cursorCell:](v78, "selectionByExtendingWithCellRange:inTable:selectionType:cursorCell:", v77, v87, -[TSTTableSelection selectionType](v78, "selectionType"), v76);
        }
      }
      else
      {
        if (!v8)
        {
          v56 = -[TSTTableSelection initWithTableModel:andCellID:]([TSTTableSelection alloc], "initWithTableModel:andCellID:", v87, (unsigned __int16)v50 | ((unint64_t)v27 << 24) | ((unint64_t)v31 << 16));
          return v56;
        }
        if ((_WORD)v42 != 0xFFFF && (_BYTE)v25 != 0xFF)
        {
          v79 = (unsigned __int16)v42 | ((unint64_t)v26 << 24) | ((unint64_t)v25 << 16);
          v80 = TSTCellRangeUnionCellID(v79 | 0x1000100000000, (unsigned __int16)v50 | ((unint64_t)v27 << 24) | ((unint64_t)v31 << 16));
          if (-[TSTTableSelection selectionType](v85, "selectionType") == 1)
          {
            v81 = v85;
          }
          else
          {
            v81 = v85;
            if (-[TSTTableSelection selectionType](v85, "selectionType") != 2)
              v80 = TSTTableExpandCellRangeToCoverMergedCells((uint64_t)v87, v80);
          }
          if (!-[TSTCellRegion equalsCellRange:](-[TSTTableSelection cellRegion](v81, "cellRegion", v83), "equalsCellRange:", v80))
          {
            v56 = -[TSTTableSelection initWithTableModel:cellRange:type:anchorCellID:cursorCellID:]([TSTTableSelection alloc], "initWithTableModel:cellRange:type:anchorCellID:cursorCellID:", v87, v80, -[TSTTableSelection selectionType](v81, "selectionType"), v79, v76);
            return v56;
          }
        }
      }
    }
    return 0;
  }
  v17 = -[TSTCellRegion boundingCellRange](-[TSTTableSelection cellRegion](self, "cellRegion"), "boundingCellRange");
  if (v8)
    v18 = *(unsigned int *)&v17.var1.var1;
  else
    v18 = 1;
  if (a4 != 4)
  {
    v19 = v9;
    if (a4 == 3)
    {
      if ((v9 & 0xC) == 0)
        LOWORD(v13) = TSTTableRowAboveRow(v87, v17.var0.var0);
      goto LABEL_76;
    }
    goto LABEL_19;
  }
  if ((v9 & 0xC) != 0)
    v34 = v13 + HIWORD(v13) - 1;
  else
    LOWORD(v34) = TSTTableRowBelowRow(v87, v17.var0.var0 + v17.var1.var1 - 1);
  if ((_WORD)v34 == 0xFFFF)
    v55 = -1;
  else
    v55 = v34 - v18 + 1;
  if (v8)
    LOWORD(v13) = v55;
  else
    LOWORD(v13) = v34;
LABEL_76:
  if ((_WORD)v13 == 0xFFFF)
    return 0;
  v56 = -[TSTTableSelection initWithTableModel:startingRowIndex:numberOfRows:]([TSTTableSelection alloc], "initWithTableModel:startingRowIndex:numberOfRows:", v87, (unsigned __int16)v13, v18);
  return v56;
}

- (void)enumerateSelectedCellsInTable:(id)a3 usingBlock:(id)a4
{
  -[TSTTableSelection enumerateSelectedCellsInTable:withFlags:usingBlock:](self, "enumerateSelectedCellsInTable:withFlags:usingBlock:", a3, 0, a4);
}

- (void)enumerateSelectedCellsInTable:(id)a3 withFlags:(unint64_t)a4 usingBlock:(id)a5
{
  unint64_t v6;
  TSTCellIterator *v7;
  char v8;
  _BYTE v9[4];
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;

  v6 = (unint64_t)a3;
  v7 = -[TSTCellIterator initWithTableModel:region:flags:]([TSTCellIterator alloc], "initWithTableModel:region:flags:", a3, self->mCellRegion, a4);
  v8 = 0;
  do
  {
    if (!-[TSTCellIterator getNext:](v7, "getNext:", v9))
      break;
    v6 = v6 & 0xFFFFFFFF00000000 | v10;
    (*((void (**)(id, unint64_t, uint64_t, char *, uint64_t))a5 + 2))(a5, v6, v11, &v8, v12);
  }
  while (!v8);

}

- (void)insert:(int)a3 atIndex:(unsigned __int16)a4 count:(unsigned __int16)a5
{
  unsigned int v5;
  unsigned int v6;
  $CA3468F20078D5D2DB35E78E73CA60DA v9;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int mSelectionType;

  v5 = a5;
  v6 = a4;
  v9 = -[TSTCellRegion boundingCellRange](self->mCellRegion, "boundingCellRange");
  var0 = v9.var0;
  v11 = HIDWORD(*(unint64_t *)&v9);
  v12 = HIWORD(*(unint64_t *)&v9);
  if (!a3)
  {
    mSelectionType = self->mSelectionType;
    if (mSelectionType)
    {
      if (mSelectionType == 2)
      {
        v12 += v5;
        goto LABEL_26;
      }
      if (mSelectionType != 1 || *(unint64_t *)&v9 >> 49 == 0)
        goto LABEL_26;
    }
    else if (!(*(unint64_t *)&v9 >> 49))
    {
      goto LABEL_26;
    }
    if (v9.var0.var0 <= v6 && v5 + v6 <= v9.var0.var0 + v12)
      v12 = v12 + v5;
    goto LABEL_26;
  }
  v13 = self->mSelectionType;
  if (!v13)
  {
    if ((*(_QWORD *)&v9 & 0xFFFE00000000) == 0)
      goto LABEL_26;
LABEL_14:
    if (v9.var0.var1 <= v6 && v5 + v6 <= v9.var0.var1 + v9.var1.var0)
      LOWORD(v11) = v9.var1.var0 + v5;
    goto LABEL_26;
  }
  if (v13 == 1)
  {
    LOWORD(v11) = v9.var1.var0 + v5;
    goto LABEL_26;
  }
  if (v13 == 2 && (*(_QWORD *)&v9 & 0xFFFE00000000) != 0)
    goto LABEL_14;
LABEL_26:

  self->mCellRegion = 0;
  self->mCellRegion = (TSTCellRegion *)+[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", ((unint64_t)(unsigned __int16)v11 << 32) | (v12 << 48) | *(unsigned int *)&var0);
}

- (void)remove:(int)a3 atIndex:(unsigned __int16)a4 count:(unsigned __int16)a5
{
  int v5;
  unsigned int v6;
  $CA3468F20078D5D2DB35E78E73CA60DA v9;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0;
  unsigned __int16 v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int16 var1;
  unsigned int v16;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 v17;
  unsigned int v18;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 v19;
  unsigned int v20;
  unsigned int v21;
  unsigned __int16 v22;
  unint64_t v23;
  unsigned __int16 v24;
  BOOL v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned int v28;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 v29;
  unsigned int v30;
  unsigned int v31;
  unsigned __int16 v32;
  BOOL v33;

  v5 = a5;
  v6 = a4;
  v9 = -[TSTCellRegion boundingCellRange](self->mCellRegion, "boundingCellRange");
  var0 = v9.var0;
  v11 = v9.var0.var0;
  v12 = *(unint64_t *)&v9 >> 16;
  v13 = HIDWORD(*(unint64_t *)&v9);
  v14 = HIWORD(*(unint64_t *)&v9);
  if (a3)
    var1 = v9.var0.var1;
  else
    var1 = v9.var0.var0;
  if ((self->mSelectionType - 3) < 0xFFFFFFFE || v6 < var1)
  {
    v16 = var1;
    goto LABEL_15;
  }
  v16 = var1;
  if (a3)
    v17 = v9.var1;
  else
    v17 = *($201E9A47BE70A2B12CCA2F48B75AA2F7 *)&v9.var1.var1;
  if (v5 + v6 > var1 + v17.var0)
  {
LABEL_15:
    if (v6 >= var1)
    {
      if (a3)
        v29 = v9.var1;
      else
        v29 = *($201E9A47BE70A2B12CCA2F48B75AA2F7 *)&v9.var1.var1;
      v30 = v16 + v29.var0;
      v31 = v6 - v30 + *(_DWORD *)&v29;
      if (a3)
        v32 = v31;
      else
        v32 = v9.var1.var0;
      if (a3)
        v31 = *(_DWORD *)&v9.var1.var1;
      v33 = v30 >= v6 && v6 + v5 >= v30;
      if (v33)
        LOWORD(v13) = v32;
      if (v33)
        v14 = v31;
      else
        v14 = v14;
    }
    else
    {
      v18 = v6 + v5;
      if (a3)
        v19 = v9.var1;
      else
        v19 = *($201E9A47BE70A2B12CCA2F48B75AA2F7 *)&v9.var1.var1;
      v20 = v16 + v19.var0;
      v21 = *(_DWORD *)&v19 - (v18 - v16);
      v22 = v9.var0.var0 - (v18 - v16);
      LOBYTE(v23) = v9.var0.var1 - (v18 - v16);
      if (a3)
        v24 = v21;
      else
        v24 = v9.var1.var0;
      if (a3)
      {
        v21 = *(_DWORD *)&v9.var1.var1;
        v22 = v9.var0.var0;
      }
      else
      {
        v23 = *(unint64_t *)&v9 >> 16;
      }
      v25 = v18 >= v16;
      if (v18 >= v16)
        v26 = v24;
      else
        v26 = v9.var1.var0;
      if (!v25)
      {
        v21 = *(_DWORD *)&v9.var1.var1;
        v22 = v9.var0.var0;
        v23 = *(unint64_t *)&v9 >> 16;
      }
      if (a3)
        v27 = 0;
      else
        v27 = v9.var1.var0;
      if (a3)
        v28 = *(_DWORD *)&v9.var1.var1;
      else
        v28 = 0;
      if (v18 > v20)
        LOWORD(v13) = v27;
      else
        LOWORD(v13) = v26;
      if (v18 > v20)
        v14 = v28;
      else
        v14 = v21;
      if (v18 > v20)
        v11 = v9.var0.var0;
      else
        v11 = v22;
      if (v18 <= v20)
        LOBYTE(v12) = v23;
    }
    goto LABEL_72;
  }
  if (v5 == v17.var0)
  {
    if (var1)
    {
      if (a3)
      {
        LOBYTE(v12) = v9.var0.var1 - 1;
LABEL_69:
        LOWORD(v13) = 1;
        goto LABEL_72;
      }
      v11 = v9.var0.var0 - 1;
    }
    else if (a3)
    {
      goto LABEL_69;
    }
    v14 = 1;
    goto LABEL_72;
  }
  if (a3)
  {
    LOWORD(v13) = v17.var0 - v5;
    v14 = v14;
  }
  else
  {
    v14 = (*(_DWORD *)&v17 - v5);
  }
LABEL_72:

  self->mCellRegion = 0;
  self->mCellRegion = (TSTCellRegion *)+[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", ((unint64_t)(unsigned __int16)v13 << 32) | (v14 << 48) | *(_DWORD *)&var0 & 0xFF000000 | ((unint64_t)v12 << 16) | v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSTTableSelection *v5;

  v5 = -[TSTTableSelection init](+[TSTTableSelection allocWithZone:](TSTTableSelection, "allocWithZone:"), "init");
  v5->mCellRegion = (TSTCellRegion *)-[TSTCellRegion copyWithZone:](self->mCellRegion, "copyWithZone:", a3);
  v5->mSelectionType = self->mSelectionType;
  v5->mAnchorCellID = self->mAnchorCellID;
  v5->mBaseRegion = (TSTCellRegion *)-[TSTCellRegion copyWithZone:](self->mBaseRegion, "copyWithZone:", a3);
  v5->mCursorCellID = self->mCursorCellID;
  v5->mSearchReferenceRange = self->mSearchReferenceRange;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
    LOBYTE(v5) = -[TSTTableSelection isEqualToSelection:](self, "isEqualToSelection:", a3);
  return v5;
}

- (BOOL)isEqualToSelection:(id)a3
{
  if (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class())
    && objc_msgSend(a3, "selectionType") == self->mSelectionType
    && objc_msgSend((id)objc_msgSend(a3, "cellRegion"), "equalsCellRegion:", self->mCellRegion)
    && ((*(_DWORD *)&self->mAnchorCellID ^ objc_msgSend(a3, "anchorCellID")) & 0xFFFFFF) == 0
    && ((*(_DWORD *)&self->mCursorCellID ^ objc_msgSend(a3, "cursorCellID")) & 0xFFFFFF) == 0)
  {
    return objc_msgSend((id)objc_msgSend(a3, "baseRegion"), "equalsCellRegion:", self->mBaseRegion);
  }
  else
  {
    return 0;
  }
}

- (BOOL)areCellsInTheSameRegionInTable:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA v4;
  int v5;
  int v6;

  v4 = -[TSTCellRegion boundingCellRange](self->mCellRegion, "boundingCellRange");
  v5 = objc_msgSend(a3, "tableAreaForCellID:", *(_DWORD *)&v4.var0);
  v6 = objc_msgSend(a3, "tableAreaForCellID:", (*(_DWORD *)&v4.var0 + (*(_DWORD *)&v4.var0.var1 & 0xFF0000u) + 16711680) & 0xFF0000 | (unsigned __int16)(v4.var0.var0 + v4.var1.var1 - 1));
  if (v5 == 4 && v6 == 1)
    return 1;
  return v5 == 5 && v6 == 3 || v5 == v6;
}

- (BOOL)containsSelection:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
    LOBYTE(v5) = -[TSTCellRegion containsCellRegion:](self->mCellRegion, "containsCellRegion:", objc_msgSend(a3, "cellRegion"));
  return v5;
}

- (BOOL)containsCell:(id)a3
{
  return -[TSTCellRegion containsCellID:](-[TSTTableSelection cellRegion](self, "cellRegion"), "containsCellID:", *(unsigned int *)&a3);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t mSelectionType;
  const __CFString *v7;
  id v8;
  id v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  mSelectionType = self->mSelectionType;
  if (mSelectionType > 5)
    v7 = CFSTR("<unknown>");
  else
    v7 = off_24D82F010[mSelectionType];
  v8 = -[TSTCellRegion description](self->mCellRegion, "description");
  v9 = -[TSTCellRegion description](self->mBaseRegion, "description");
  v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), BYTE2(*(_DWORD *)&self->mAnchorCellID), (unsigned __int16)*(_DWORD *)&self->mAnchorCellID);
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p type: %@ region: %@ base region: %@ anchor: %@ cursor: %@>"), v5, self, v7, v8, v9, v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), BYTE2(*(_DWORD *)&self->mCursorCellID), (unsigned __int16)*(_DWORD *)&self->mCursorCellID));
}

- (BOOL)intersectsPartialMergeRangeInTable:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *i;
  unint64_t v8;

  if ((self->mSelectionType - 1) > 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v4 = TSTTableMergeRangesForCellRange((uint64_t)a3, -[TSTCellRegion boundingCellRange](self->mCellRegion, "boundingCellRange"));
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = (void *)objc_msgSend(v4, "iterator");
      for (i = v6; ; v6 = i)
      {
        v8 = objc_msgSend(v6, "nextMergeRegion");
        LOBYTE(v5) = 0;
        if ((_WORD)v8 == 0xFFFF)
          break;
        if ((v8 & 0xFF0000) == 0xFF0000)
          break;
        LOBYTE(v5) = 0;
        if (!HIWORD(v8) || (v8 & 0xFFFF00000000) == 0)
          break;
        if (-[TSTCellRegion intersectsCellRange:](self->mCellRegion, "intersectsCellRange:", v8)
          && !-[TSTCellRegion containsCellRange:](self->mCellRegion, "containsCellRange:", v8))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
      }
    }
  }
  return v5;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)isAtEndOfLine
{
  return 0;
}

- (TSTCellRegion)cellRegion
{
  return self->mCellRegion;
}

- (int)selectionType
{
  return self->mSelectionType;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)anchorCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mAnchorCellID;
}

- (TSTCellRegion)baseRegion
{
  return self->mBaseRegion;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cursorCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mCursorCellID;
}

- (_NSRange)searchReferenceRange
{
  _NSRange *p_mSearchReferenceRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_mSearchReferenceRange = &self->mSearchReferenceRange;
  location = self->mSearchReferenceRange.location;
  length = p_mSearchReferenceRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSearchReferenceRange:(_NSRange)a3
{
  self->mSearchReferenceRange = a3;
}

@end

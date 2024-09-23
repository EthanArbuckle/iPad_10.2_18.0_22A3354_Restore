@implementation OABRTable

- (OABRTable)initWithSourceTable:(id)a3 targetTable:(id)a4 state:(id)a5
{
  id v9;
  id v10;
  id v11;
  OABRTable *v12;
  OABRTable *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OABRTable;
  v12 = -[OABRTable init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mSrcTable, a3);
    objc_storeStrong((id *)&v13->mTgtTable, a4);
    objc_storeStrong((id *)&v13->mState, a5);
  }

  return v13;
}

- (void)map
{
  void *v3;
  void *v4;
  int v5;

  -[OADTable tableProperties](self->mTgtTable, "tableProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightToLeft:", *((unsigned __int8 *)EshGroupProperties::getTableProperties((EshGroupProperties *)(-[ESDContainer eshGroup](self->mSrcTable, "eshGroup")+ 288))+ 2));

  -[OABRTable readAnchor](self, "readAnchor");
  -[OABRTable mapScale](self, "mapScale");
  -[OABRTable readCoordinates](self, "readCoordinates");
  -[OABRTable readCellsAndLines](self, "readCellsAndLines");
  -[OABRTable validateTable](self, "validateTable");
  -[OABRTable createTargetTableContents](self, "createTargetTableContents");
  -[OADTable tableProperties](self->mTgtTable, "tableProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rightToLeft");

  if (v5)
    -[OADTable flipTableRTL](self->mTgtTable, "flipTableRTL");
}

- (void)readAnchor
{
  +[OABContent readFromContainer:toDrawable:state:](OABContent, "readFromContainer:toDrawable:state:", self->mSrcTable, self->mTgtTable, self->mState);
  -[objc_class readClientDataFromGroup:toGroup:state:](-[OABReaderState client](self->mState, "client"), "readClientDataFromGroup:toGroup:state:", self->mSrcTable, self->mTgtTable, self->mState);
}

- (void)mapScale
{
  CGRect *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  int32x2_t v21;
  int32x2_t v22;
  CGFloat Height;
  int32x2_t v24;
  int64x2_t v25;
  float64x2_t v26;
  CGFloat Width;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v3 = (CGRect *)MEMORY[0x24BDBF090];
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[OADDrawable clientData](self->mTgtTable, "clientData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[OADDrawable clientData](self->mTgtTable, "clientData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v4 = v10;
    v5 = v11;
    v6 = v12;
    v7 = v13;

  }
  v28.origin.x = v4;
  v28.origin.y = v5;
  v28.size.width = v6;
  v28.size.height = v7;
  if (CGRectEqualToRect(v28, *v3))
  {
    -[OADDrawable drawableProperties](self->mTgtTable, "drawableProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "orientedBounds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v4 = v16;
    v5 = v17;
    v6 = v18;
    v7 = v19;

    v29.origin.x = v4;
    v29.origin.y = v5;
    v29.size.width = v6;
    v29.size.height = v7;
    if (CGRectEqualToRect(v29, *v3))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Table bounds must be available in order to read the table"), &stru_24F3BFFF8);
  }
  v20 = *(_QWORD *)(-[ESDContainer eshGroup](self->mSrcTable, "eshGroup") + 280);
  v21 = *(int32x2_t *)(v20 + 28);
  v22 = *(int32x2_t *)(v20 + 36);
  v30.origin.x = v4;
  v30.origin.y = v5;
  v30.size.width = v6;
  v30.size.height = v7;
  Width = CGRectGetWidth(v30);
  v31.origin.x = v4;
  v31.origin.y = v5;
  v31.size.width = v6;
  v31.size.height = v7;
  Height = CGRectGetHeight(v31);
  v24 = vsub_s32(v22, v21);
  v25.i64[0] = v24.i32[0];
  v25.i64[1] = v24.i32[1];
  v26.f64[0] = Width;
  v26.f64[1] = Height;
  self->mScale = (CGPoint)vdivq_f64(v26, vcvtq_f64_s64(v25));
}

- (void)readCoordinates
{
  id v3;
  id v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  EshContentProperties *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OABTableSortedIntArray *v14;
  OABTableSortedIntArray *mXCoords;
  OABTableSortedIntArray *v16;
  OABTableSortedIntArray *mYCoords;
  void *v18;
  void *v19;
  void *v20;
  int mColumnCount;
  int mRowCount;
  _QWORD v23[2];
  __int16 v24;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v5 = -[ESDContainer childCount](self->mSrcTable, "childCount");
  if (v5 >= 2)
  {
    for (i = 1; i != v5; ++i)
    {
      -[ESDContainer childAt:](self->mSrcTable, "childAt:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "eshShape");
      if (!v8)
      {

        v4 = 0;
        v3 = 0;
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Could not read shape"), &stru_24F3BFFF8);
      }
      v9 = (EshContentProperties *)(v8 + 424);
      if (EshShapeProperties::getShapeType((EshShapeProperties *)v9) == 1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", EshContentProperties::getLeft(v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", EshContentProperties::getRight(v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", EshContentProperties::getTop(v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", EshContentProperties::getBottom(v9));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

      }
    }
  }
  self->mColumnCount = objc_msgSend(v3, "count") - 1;
  self->mRowCount = objc_msgSend(v4, "count") - 1;
  v14 = -[OABTableSortedIntArray initWithIntSet:]([OABTableSortedIntArray alloc], "initWithIntSet:", v3);
  mXCoords = self->mXCoords;
  self->mXCoords = v14;

  v16 = -[OABTableSortedIntArray initWithIntSet:]([OABTableSortedIntArray alloc], "initWithIntSet:", v4);
  mYCoords = self->mYCoords;
  self->mYCoords = v16;

  v18 = (void *)operator new();
  OABTable2DArray<EshShape *>::OABTable2DArray((uint64_t)v18, self->mColumnCount, self->mRowCount + 1, 0);
  self->mHorzLines = v18;
  v19 = (void *)operator new();
  OABTable2DArray<EshShape *>::OABTable2DArray((uint64_t)v19, self->mColumnCount + 1, self->mRowCount, 0);
  self->mVertLines = v19;
  v20 = (void *)operator new();
  mRowCount = self->mRowCount;
  mColumnCount = self->mColumnCount;
  v23[0] = 0;
  v23[1] = 0;
  v24 = 0;
  OABTable2DArray<OABTableCell>::OABTable2DArray((uint64_t)v20, mColumnCount, mRowCount, (uint64_t)v23);
  self->mCells = v20;

}

- (void)readCellsAndLines
{
  OABRTable *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  EshShapeProperties *v6;
  int v7;
  int *mCells;
  int v9;
  int v10;
  int v11;
  _BOOL8 v12;
  id v13;
  void **v14;
  void **v15;
  OABRTable *v16;
  int v17;
  void *v18;
  int v19;
  _BOOL8 v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  void *v27;

  v2 = self;
  v3 = -[ESDContainer childCount](self->mSrcTable, "childCount");
  if (v3 >= 2)
  {
    v22 = v3;
    v4 = 1;
    do
    {
      -[ESDContainer childAt:](v2->mSrcTable, "childAt:", v4, v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v27, "eshShape");
      v6 = (EshShapeProperties *)(v5 + 424);
      v24 = -[OABTableSortedIntArray indexOfInt:](v2->mXCoords, "indexOfInt:", EshContentProperties::getLeft((EshContentProperties *)(v5 + 424)));
      v26 = -[OABTableSortedIntArray indexOfInt:](v2->mXCoords, "indexOfInt:", EshContentProperties::getRight((EshContentProperties *)(v5 + 424)));
      v23 = v4;
      v7 = -[OABTableSortedIntArray indexOfInt:](v2->mYCoords, "indexOfInt:", EshContentProperties::getTop((EshContentProperties *)(v5 + 424)));
      v25 = -[OABTableSortedIntArray indexOfInt:](v2->mYCoords, "indexOfInt:", EshContentProperties::getBottom((EshContentProperties *)(v5 + 424)));
      mCells = (int *)v2->mCells;
      if (v24 >= *mCells || v7 >= mCells[1])
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("index out of bounds in cell coordinates"), &stru_24F3BFFF8);
      if (EshShapeProperties::getShapeType(v6) == 1)
      {
        if (v26 > v24)
        {
          v9 = v24;
          do
          {
            if (v25 > v7)
            {
              v10 = 0;
              if (v9 == v24)
                v11 = v26 - v24;
              else
                v11 = 1;
              do
              {
                v12 = *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)v2->mCells, v9, v7 + v10) == 0;
                TCVerifyInputMeetsCondition(v12);
                v13 = v27;
                v14 = (void **)OABTable2DArray<OABTableCell>::element((uint64_t)v2->mCells, v9, v7 + v10);
                v15 = v14;
                v16 = v2;
                if (v10)
                  v17 = 1;
                else
                  v17 = v25 - v7;
                v18 = *v14;
                *v14 = v13;

                *((_DWORD *)v15 + 2) = v11;
                *((_DWORD *)v15 + 3) = v17;
                v2 = v16;
                *((_BYTE *)v15 + 16) = v9 > v24;
                *((_BYTE *)v15 + 17) = v7 + v10++ > v7;
              }
              while (v25 - v7 != v10);
            }
            ++v9;
          }
          while (v9 != v26);
        }
      }
      else if (EshShapeProperties::getShapeType(v6) == 20 && (v26 == v24 || v25 == v7))
      {
        v19 = v24;
        if (v26 > v24)
        {
          do
          {
            v20 = *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)v2->mHorzLines, v19, v7) == 0;
            TCVerifyInputMeetsCondition(v20);
            *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)v2->mHorzLines, v19++, v7) = v5;
          }
          while (v26 != v19);
        }
        if (v25 > v7)
        {
          do
          {
            v21 = *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)v2->mVertLines, v24, v7) == 0;
            TCVerifyInputMeetsCondition(v21);
            *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)v2->mVertLines, v24, v7++) = v5;
          }
          while (v25 != v7);
        }
      }

      v4 = v23 + 1;
    }
    while (v23 + 1 != v22);
  }
}

- (void)dealloc
{
  _QWORD *mHorzLines;
  uint64_t v4;
  _QWORD *mVertLines;
  uint64_t v6;
  void *mCells;
  uint64_t v8;
  objc_super v9;

  mHorzLines = self->mHorzLines;
  if (mHorzLines)
  {
    v4 = mHorzLines[1];
    if (v4)
      MEMORY[0x22E2DD3F0](v4, 0x20C8093837F09);
    MEMORY[0x22E2DD408](mHorzLines, 0x1080C4057E67DB5);
  }
  mVertLines = self->mVertLines;
  if (mVertLines)
  {
    v6 = mVertLines[1];
    if (v6)
      MEMORY[0x22E2DD3F0](v6, 0x20C8093837F09);
    MEMORY[0x22E2DD408](mVertLines, 0x1080C4057E67DB5);
  }
  mCells = self->mCells;
  if (mCells)
  {
    v8 = OABTable2DArray<OABTableCell>::~OABTable2DArray((uint64_t)mCells);
    MEMORY[0x22E2DD408](v8, 0x1020C405730B0C9);
  }
  v9.receiver = self;
  v9.super_class = (Class)OABRTable;
  -[OABRTable dealloc](&v9, sel_dealloc);
}

- (void)validateTable
{
  int mRowCount;
  int v4;
  int mColumnCount;
  int i;
  _BOOL8 v7;
  int v8;
  int v9;
  int j;
  _QWORD *v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  _BOOL8 v19;
  BOOL v20;
  int v21;
  int v22;
  int v23;
  int v24;
  _QWORD *v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v32;
  _BOOL8 v33;

  mRowCount = self->mRowCount;
  if (mRowCount >= 1)
  {
    v4 = 0;
    mColumnCount = self->mColumnCount;
    do
    {
      if (mColumnCount >= 1)
      {
        for (i = 0; i < mColumnCount; ++i)
        {
          v7 = *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, i, v4) != 0;
          TCVerifyInputMeetsCondition(v7);
          mColumnCount = self->mColumnCount;
        }
        mRowCount = self->mRowCount;
      }
      ++v4;
    }
    while (v4 < mRowCount);
  }
  if ((mRowCount & 0x80000000) == 0)
  {
    v8 = 0;
    v9 = self->mColumnCount;
    do
    {
      if (v9 >= 1)
      {
        for (j = 0; j < v9; ++j)
        {
          v11 = (_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)self->mHorzLines, j, v8);
          if (v8 && *v11 && v8 < self->mRowCount)
          {
            v12 = *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j, v8 - 1);
            v13 = v12 != *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j, v8);
            TCVerifyInputMeetsCondition(v13);
          }
          if (j < self->mColumnCount - 1)
          {
            if (v8)
            {
              v14 = *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j, v8 - 1);
              v15 = v14 != *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j + 1, v8 - 1);
            }
            else
            {
              v15 = 0;
            }
            if (v8 >= self->mRowCount)
            {
              v17 = 0;
            }
            else
            {
              v16 = *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j, v8);
              v17 = v16 != *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, j + 1, v8);
            }
            if (!v15 && !v17)
            {
              v18 = *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)self->mHorzLines, j, v8);
              v19 = v18 == *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)self->mHorzLines, j + 1, v8);
              TCVerifyInputMeetsCondition(v19);
            }
          }
          v9 = self->mColumnCount;
        }
        mRowCount = self->mRowCount;
      }
      v20 = v8++ < mRowCount;
    }
    while (v20);
    if (mRowCount >= 1)
    {
      v21 = 0;
      v22 = self->mColumnCount;
      do
      {
        v23 = v21 + 1;
        if ((v22 & 0x80000000) == 0)
        {
          v24 = 0;
          do
          {
            v25 = (_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)self->mVertLines, v24, v21);
            if (v24 && *v25 && v24 < self->mColumnCount)
            {
              v26 = *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24 - 1, v21);
              v27 = v26 != *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24, v21);
              TCVerifyInputMeetsCondition(v27);
            }
            if (v21 < self->mRowCount - 1)
            {
              if (v24)
              {
                v28 = *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24 - 1, v21);
                v29 = v28 != *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24 - 1, v21 + 1);
              }
              else
              {
                v29 = 0;
              }
              if (v24 >= self->mColumnCount)
              {
                v31 = 0;
              }
              else
              {
                v30 = *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24, v21);
                v31 = v30 != *(_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v24, v21 + 1);
              }
              if (!v29 && !v31 && v24 < self->mColumnCount)
              {
                v32 = *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)self->mVertLines, v24, v21);
                v33 = v32 == *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)self->mVertLines, v24, v21 + 1);
                TCVerifyInputMeetsCondition(v33);
              }
            }
            v22 = self->mColumnCount;
            v20 = v24++ < v22;
          }
          while (v20);
          mRowCount = self->mRowCount;
        }
        ++v21;
      }
      while (v23 < mRowCount);
    }
  }
}

- (void)createTargetTableContents
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  void *v7;
  CGFloat v8;
  uint64_t v9;
  int v10;
  CGFloat v11;
  int v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  OADTextBody *v16;
  void *v17;
  void *v18;
  OADTableCellProperties *v19;
  OABShapeManager *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;

  if (self->mColumnCount >= 1)
  {
    v3 = 0;
    do
    {
      v4 = (v3 + 1);
      v5 = -[OABTableSortedIntArray intAtIndex:](self->mXCoords, "intAtIndex:", v4);
      v6 = -[OABTableSortedIntArray intAtIndex:](self->mXCoords, "intAtIndex:", v3);
      -[OADTable grid](self->mTgtTable, "grid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addColumn");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->mScale.x * (float)(v5 - v6);
      *(float *)&v8 = v8;
      objc_msgSend(v7, "setWidth:", v8);

      v3 = v4;
    }
    while ((int)v4 < self->mColumnCount);
  }
  if (self->mRowCount >= 1)
  {
    v9 = 0;
    do
    {
      -[OADTable addRow](self->mTgtTable, "addRow");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v9 + 1;
      v10 = -[OABTableSortedIntArray intAtIndex:](self->mYCoords, "intAtIndex:");
      v11 = self->mScale.y * (float)(v10 - -[OABTableSortedIntArray intAtIndex:](self->mYCoords, "intAtIndex:", v9));
      *(float *)&v11 = v11;
      objc_msgSend(v29, "setHeight:", v11);
      if (self->mColumnCount >= 1)
      {
        v12 = 0;
        do
        {
          objc_msgSend(v29, "addCell");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (_QWORD *)OABTable2DArray<OABTableCell>::element((uint64_t)self->mCells, v12, v9);
          objc_msgSend(v13, "setRowSpan:", *((unsigned int *)v14 + 3));
          objc_msgSend(v13, "setGridSpan:", *((unsigned int *)v14 + 2));
          objc_msgSend(v13, "setHorzMerge:", *((unsigned __int8 *)v14 + 16));
          objc_msgSend(v13, "setVertMerge:", *((unsigned __int8 *)v14 + 17));
          if (!(*((unsigned __int8 *)v14 + 16) | *((unsigned __int8 *)v14 + 17)))
          {
            v15 = objc_msgSend((id)*v14, "eshShape");
            -[objc_class readClientDataFromTableCell:toTableCell:state:](-[OABReaderState client](self->mState, "client"), "readClientDataFromTableCell:toTableCell:state:", *v14, v13, self->mState);
            objc_msgSend(v13, "textBody");
            v16 = (OADTextBody *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              v16 = objc_alloc_init(OADTextBody);
              objc_msgSend(v13, "setTextBody:", v16);
            }
            -[OADTextBody properties](v16, "properties");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[OABTextBodyProperties readTextBodyProperties:textBox:useDefaults:state:](OABTextBodyProperties, "readTextBodyProperties:textBox:useDefaults:state:", v17, v15 + 272, 1, self->mState);

            -[OADTextBody properties](v16, "properties");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTextBody setProperties:](v16, "setProperties:", v18);

            v19 = objc_alloc_init(OADTableCellProperties);
            v20 = -[OABShapeManager initWithShape:]([OABShapeManager alloc], "initWithShape:", v15);
            +[OABFill readFillFromFillPropertiesManager:state:](OABFill, "readFillFromFillPropertiesManager:state:", v20, self->mState);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTableCellProperties setFill:](v19, "setFill:", v21);
            -[OABRTable readStrokeFromShape:](self, "readStrokeFromShape:", *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)self->mVertLines, v12, v9));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTableCellProperties setLeftStroke:](v19, "setLeftStroke:", v22);

            -[OABRTable readStrokeFromShape:](self, "readStrokeFromShape:", *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)self->mVertLines, v12 + *((_DWORD *)v14 + 2), v9));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTableCellProperties setRightStroke:](v19, "setRightStroke:", v23);

            -[OABRTable readStrokeFromShape:](self, "readStrokeFromShape:", *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)self->mHorzLines, v12, v9));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTableCellProperties setTopStroke:](v19, "setTopStroke:", v24);

            -[OABRTable readStrokeFromShape:](self, "readStrokeFromShape:", *(_QWORD *)OABTable2DArray<EshShape *>::element((uint64_t)self->mHorzLines, v12, *((_DWORD *)v14 + 3) + (int)v9));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTableCellProperties setBottomStroke:](v19, "setBottomStroke:", v25);

            -[OADTextBody properties](v16, "properties");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTableCellProperties setTextAnchor:](v19, "setTextAnchor:", objc_msgSend(v26, "textAnchorType"));

            objc_msgSend(v13, "setProperties:", v19);
          }

          ++v12;
        }
        while (v12 < self->mColumnCount);
      }

      v9 = v27;
    }
    while (v27 < self->mRowCount);
  }
}

- (id)readStrokeFromShape:(void *)a3
{
  OABShapeManager *v4;
  OADStroke *v5;

  if (a3)
  {
    v4 = -[OABShapeManager initWithShape:]([OABShapeManager alloc], "initWithShape:", a3);
    +[OABStroke readStrokeFromShapeBaseManager:state:](OABStroke, "readStrokeFromShapeBaseManager:state:", v4, self->mState);
    v5 = (OADStroke *)objc_claimAutoreleasedReturnValue();
    if (-[OADStroke isCapOverridden](v5, "isCapOverridden") && -[OADStroke cap](v5, "cap") != 2)
      -[OADStroke setCap:](v5, "setCap:", 2);
  }
  else
  {
    v5 = objc_alloc_init(OADStroke);
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v4 = (OABShapeManager *)objc_claimAutoreleasedReturnValue();
    -[OADStroke setFill:](v5, "setFill:", v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mYCoords, 0);
  objc_storeStrong((id *)&self->mXCoords, 0);
  objc_storeStrong((id *)&self->mState, 0);
  objc_storeStrong((id *)&self->mTgtTable, 0);
  objc_storeStrong((id *)&self->mSrcTable, 0);
}

@end

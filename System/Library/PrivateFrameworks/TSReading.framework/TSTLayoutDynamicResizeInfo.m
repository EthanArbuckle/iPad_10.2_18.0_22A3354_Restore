@implementation TSTLayoutDynamicResizeInfo

- (TSTLayoutDynamicResizeInfo)initWithMasterLayout:(id)a3
{
  TSTLayoutDynamicResizeInfo *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTLayoutDynamicResizeInfo;
  v4 = -[TSTLayoutDynamicResizeInfo init](&v7, sel_init);
  if (v4)
  {
    v4->mTableRowsBehavior = objc_msgSend(a3, "tableRowsBehavior");
    v5 = +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", TSTMasterLayoutGetRange((uint64_t)a3));
    -[TSTLayoutDynamicResizeInfo p_captureRowColumnInformation:columnRegion:rowRegion:](v4, "p_captureRowColumnInformation:columnRegion:rowRegion:", a3, v5, v5);
    v4->mValid = 1;
  }
  return v4;
}

- (TSTLayoutDynamicResizeInfo)initWithMasterLayout:(id)a3 columnRegion:(id)a4
{
  TSTLayoutDynamicResizeInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSTLayoutDynamicResizeInfo;
  v6 = -[TSTLayoutDynamicResizeInfo init](&v8, sel_init);
  if (v6)
  {
    v6->mTableRowsBehavior = objc_msgSend(a3, "tableRowsBehavior");
    -[TSTLayoutDynamicResizeInfo p_captureRowColumnInformation:columnRegion:rowRegion:](v6, "p_captureRowColumnInformation:columnRegion:rowRegion:", a3, a4, 0);
    v6->mValid = 1;
  }
  return v6;
}

- (TSTLayoutDynamicResizeInfo)initWithMasterLayout:(id)a3 rowRegion:(id)a4
{
  TSTLayoutDynamicResizeInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSTLayoutDynamicResizeInfo;
  v6 = -[TSTLayoutDynamicResizeInfo init](&v8, sel_init);
  if (v6)
  {
    v6->mTableRowsBehavior = objc_msgSend(a3, "tableRowsBehavior");
    -[TSTLayoutDynamicResizeInfo p_captureRowColumnInformation:columnRegion:rowRegion:](v6, "p_captureRowColumnInformation:columnRegion:rowRegion:", a3, 0, a4);
    v6->mValid = 1;
  }
  return v6;
}

- (TSTLayoutDynamicResizeInfo)initWithDynamicResizeInfo:(id)a3
{
  TSTLayoutDynamicResizeInfo *v4;
  TSTLayoutDynamicResizeInfo *v5;
  uint64_t v6;
  double *v7;
  double *v8;
  double *v9;
  uint64_t v10;
  double *v11;
  double *v12;
  double *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TSTLayoutDynamicResizeInfo;
  v4 = -[TSTLayoutDynamicResizeInfo init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mValid = *((_BYTE *)a3 + 8);
    v4->mTableRowsBehavior = *((_DWORD *)a3 + 3);
    v4->mRowRegion = (TSTCellRegion *)*((id *)a3 + 2);
    v5->mStartRowIndex = *((_WORD *)a3 + 12);
    v6 = *((unsigned __int16 *)a3 + 13);
    v5->mNumberOfRows = v6;
    if (v6)
    {
      v7 = (double *)malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
      v5->mCapturedRowHeights = v7;
      memcpy(v7, *((const void **)a3 + 4), 8 * v5->mNumberOfRows);
      v8 = (double *)malloc_type_malloc(8 * v5->mNumberOfRows, 0x100004000313F17uLL);
      v5->mCurrentRowHeights = v8;
      memcpy(v8, *((const void **)a3 + 5), 8 * v5->mNumberOfRows);
      v9 = (double *)malloc_type_malloc(8 * v5->mNumberOfRows, 0x100004000313F17uLL);
      v5->mMinimumRowHeights = v9;
      memcpy(v9, *((const void **)a3 + 6), 8 * v5->mNumberOfRows);
    }
    else
    {
      v5->mCapturedRowHeights = 0;
      v5->mCurrentRowHeights = 0;
      v5->mMinimumRowHeights = 0;
    }
    v5->mCapturedRowHeightTotal = *((double *)a3 + 7);
    v5->mColumnRegion = (TSTCellRegion *)*((id *)a3 + 8);
    v5->mStartColumnIndex = *((_BYTE *)a3 + 72);
    v10 = *((unsigned __int16 *)a3 + 37);
    v5->mNumberOfColumns = v10;
    if (v10)
    {
      v11 = (double *)malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
      v5->mCapturedColumnWidths = v11;
      memcpy(v11, *((const void **)a3 + 10), 8 * v5->mNumberOfColumns);
      v12 = (double *)malloc_type_malloc(8 * v5->mNumberOfColumns, 0x100004000313F17uLL);
      v5->mCurrentColumnWidths = v12;
      memcpy(v12, *((const void **)a3 + 11), 8 * v5->mNumberOfColumns);
      v13 = (double *)malloc_type_malloc(8 * v5->mNumberOfColumns, 0x100004000313F17uLL);
      v5->mMinimumColumnWidths = v13;
      memcpy(v13, *((const void **)a3 + 12), 8 * v5->mNumberOfColumns);
    }
    else
    {
      v5->mCapturedColumnWidths = 0;
      v5->mCurrentColumnWidths = 0;
      v5->mMinimumColumnWidths = 0;
    }
    v5->mCapturedColumnWidthTotal = *((double *)a3 + 13);
  }
  return v5;
}

- (void)dealloc
{
  double *mCapturedRowHeights;
  double *mCurrentRowHeights;
  double *mMinimumRowHeights;
  double *mCapturedColumnWidths;
  double *mCurrentColumnWidths;
  double *mMinimumColumnWidths;
  objc_super v9;

  mCapturedRowHeights = self->mCapturedRowHeights;
  if (mCapturedRowHeights)
  {
    free(mCapturedRowHeights);
    self->mCapturedRowHeights = 0;
  }
  mCurrentRowHeights = self->mCurrentRowHeights;
  if (mCurrentRowHeights)
  {
    free(mCurrentRowHeights);
    self->mCurrentRowHeights = 0;
  }
  mMinimumRowHeights = self->mMinimumRowHeights;
  if (mMinimumRowHeights)
  {
    free(mMinimumRowHeights);
    self->mMinimumRowHeights = 0;
  }
  self->mCapturedRowHeightTotal = 0.0;
  self->mNumberOfRows = 0;

  mCapturedColumnWidths = self->mCapturedColumnWidths;
  if (mCapturedColumnWidths)
  {
    free(mCapturedColumnWidths);
    self->mCapturedColumnWidths = 0;
  }
  mCurrentColumnWidths = self->mCurrentColumnWidths;
  if (mCurrentColumnWidths)
  {
    free(mCurrentColumnWidths);
    self->mCurrentColumnWidths = 0;
  }
  mMinimumColumnWidths = self->mMinimumColumnWidths;
  if (mMinimumColumnWidths)
  {
    free(mMinimumColumnWidths);
    self->mMinimumColumnWidths = 0;
  }
  self->mCapturedColumnWidthTotal = 0.0;
  self->mNumberOfColumns = 0;
  v9.receiver = self;
  v9.super_class = (Class)TSTLayoutDynamicResizeInfo;
  -[TSTLayoutDynamicResizeInfo dealloc](&v9, sel_dealloc);
}

- (void)p_captureRowColumnInformation:(id)a3 columnRegion:(id)a4 rowRegion:(id)a5
{
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double *v16;
  char v17;
  double *v18;
  void *v19;
  double *v20;
  double *v21;
  unsigned int mNumberOfColumns;
  int v23;
  _QWORD v24[13];
  _QWORD v25[13];
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  __int16 v42;

  v9 = (void *)objc_msgSend(a3, "tableInfo");
  v10 = 1.0;
  if (objc_msgSend(v9, "partitioner"))
  {
    v11 = 1.0;
    if (objc_msgSend((id)objc_msgSend(v9, "partitioner"), "scaleIsValid"))
    {
      objc_msgSend((id)objc_msgSend(v9, "partitioner"), "scaleToFit");
      v11 = v12;
      objc_msgSend((id)objc_msgSend(v9, "partitioner"), "scaleToFit");
      v10 = v13;
    }
  }
  else
  {
    v11 = 1.0;
  }
  if (a5)
  {
    self->mRowRegion = (TSTCellRegion *)a5;
    self->mStartRowIndex = objc_msgSend(a5, "boundingCellRange");
    self->mNumberOfRows = (unint64_t)objc_msgSend(a5, "boundingCellRange") >> 48;
    self->mNumberOfResizableRows = objc_msgSend(a5, "numberOfIntersectingRows");
    v14 = malloc_type_malloc(8 * self->mNumberOfRows, 0x100004000313F17uLL);
    v15 = malloc_type_calloc(self->mNumberOfRows, 8uLL, 0x100004000313F17uLL);
    v16 = (double *)malloc_type_calloc(self->mNumberOfRows, 8uLL, 0x100004000313F17uLL);
    if (self->mNumberOfRows)
      memset_pattern16(v14, &unk_217C2BD80, 8 * self->mNumberOfRows);
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0xBFF0000000000000;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0xBFF0000000000000;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v17 = objc_msgSend(a3, "isGrouped");
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __83__TSTLayoutDynamicResizeInfo_p_captureRowColumnInformation_columnRegion_rowRegion___block_invoke;
    v25[3] = &unk_24D82EEB0;
    v25[9] = &v27;
    v25[10] = v14;
    v25[4] = self;
    v25[5] = a3;
    *(double *)&v25[11] = v10;
    v26 = v17;
    v25[12] = v16;
    v25[6] = &v35;
    v25[7] = &v39;
    v25[8] = &v31;
    objc_msgSend(a5, "enumerateRowsUsingBlock:", v25);
    self->mCapturedRowHeights = (double *)v14;
    memcpy(v15, v14, 8 * self->mNumberOfRows);
    self->mCurrentRowHeights = (double *)v15;
    self->mMinimumRowHeights = v16;
    *(_QWORD *)&self->mCapturedRowHeightTotal = v28[3];
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
  }
  if (a4)
  {
    self->mColumnRegion = (TSTCellRegion *)a4;
    self->mStartColumnIndex = objc_msgSend(a4, "boundingCellRange") >> 16;
    self->mNumberOfColumns = (unint64_t)objc_msgSend(a4, "boundingCellRange") >> 32;
    self->mNumberOfResizableColumns = objc_msgSend(a4, "numberOfIntersectingColumns");
    v18 = (double *)malloc_type_malloc(8 * self->mNumberOfColumns, 0x100004000313F17uLL);
    v19 = malloc_type_calloc(self->mNumberOfColumns, 8uLL, 0x100004000313F17uLL);
    v20 = (double *)malloc_type_calloc(self->mNumberOfColumns, 8uLL, 0x100004000313F17uLL);
    v21 = v20;
    mNumberOfColumns = self->mNumberOfColumns;
    if (self->mNumberOfColumns)
    {
      v23 = 0;
      do
        v18[v23++] = -1.0;
      while (mNumberOfColumns > v23);
    }
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    LOBYTE(v42) = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0xBFF0000000000000;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0xBFF0000000000000;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __83__TSTLayoutDynamicResizeInfo_p_captureRowColumnInformation_columnRegion_rowRegion___block_invoke_2;
    v24[3] = &unk_24D82EED8;
    v24[9] = &v27;
    v24[10] = v18;
    v24[4] = self;
    v24[5] = a3;
    *(double *)&v24[11] = v11;
    v24[12] = v20;
    v24[6] = &v35;
    v24[7] = &v39;
    v24[8] = &v31;
    objc_msgSend(a4, "enumerateColumnsUsingBlock:", v24);
    self->mCapturedColumnWidths = v18;
    memcpy(v19, v18, 8 * self->mNumberOfColumns);
    self->mCurrentColumnWidths = (double *)v19;
    self->mMinimumColumnWidths = v21;
    *(_QWORD *)&self->mCapturedColumnWidthTotal = v28[3];
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
  }
}

double __83__TSTLayoutDynamicResizeInfo_p_captureRowColumnInformation_columnRegion_rowRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v4;
  double v5;
  uint64_t v6;
  int v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double result;

  v4 = a2 - *(_WORD *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = TSTMasterLayoutHeightOfRow(*(TSTMasterLayout **)(a1 + 40), a2, 0, 0, 1, 1);
  v6 = *(_QWORD *)(a1 + 80);
  *(double *)(v6 + 8 * v4) = v5;
  if (v5 == 0.0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8 * v4) = 0;
    --*(_WORD *)(*(_QWORD *)(a1 + 32) + 28);
  }
  else
  {
    *(double *)(v6 + 8 * v4) = v5 / *(double *)(a1 + 88);
    v7 = objc_msgSend(*(id *)(a1 + 40), "tableRowsBehavior");
    v8 = 8.0;
    if (v7 == 1 && !*(_BYTE *)(a1 + 104))
      TSTMasterLayoutFittingHeightOfRow(*(void **)(a1 + 40), a2);
    v9 = *(_QWORD *)(a1 + 96);
    *(double *)(v9 + 8 * v4) = v8;
    *(double *)(v9 + 8 * v4) = v8 / *(double *)(a1 + 88);
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < 0.0
      || (_DWORD)a2 - 1 != *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = TSTMasterLayoutStrokeHeightOfGridRow(*(TSTMasterLayout **)(a1 + 40), a2, 0, 0xFFFFFFFF);
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = TSTMasterLayoutStrokeHeightOfGridRow(*(TSTMasterLayout **)(a1 + 40), (int)a2 + 1, 0, 0xFFFFFFFF);
    *(double *)(*(_QWORD *)(a1 + 96) + 8 * v4) = *(double *)(*(_QWORD *)(a1 + 96) + 8 * v4)
                                                 + (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                 * 0.5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
    v6 = *(_QWORD *)(a1 + 80);
  }
  v10 = *(double *)(v6 + 8 * v4);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  result = v10 + *(double *)(v11 + 24);
  *(double *)(v11 + 24) = result;
  return result;
}

double __83__TSTLayoutDynamicResizeInfo_p_captureRowColumnInformation_columnRegion_rowRegion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned __int8 v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double result;

  v2 = a2;
  v4 = a2 - *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
  v5 = TSTMasterLayoutWidthOfColumn(*(_QWORD *)(a1 + 40), a2, 1, 0, 1);
  v6 = *(_QWORD *)(a1 + 80);
  *(double *)(v6 + 8 * v4) = v5;
  if (v5 == 0.0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8 * v4) = 0;
    --*(_WORD *)(*(_QWORD *)(a1 + 32) + 76);
  }
  else
  {
    *(double *)(v6 + 8 * v4) = v5 / *(double *)(a1 + 88);
    v7 = *(_QWORD *)(a1 + 96);
    *(_QWORD *)(v7 + 8 * v4) = 0x4020000000000000;
    *(double *)(v7 + 8 * v4) = 8.0 / *(double *)(a1 + 88);
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < 0.0
      || v2 - 1 != *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = TSTMasterLayoutStrokeWidthOfGridColumn(*(TSTMasterLayout **)(a1 + 40), v2, 0, 0xFFFFFFFF);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = TSTMasterLayoutStrokeWidthOfGridColumn(*(TSTMasterLayout **)(a1 + 40), v2 + 1, 0, 0xFFFFFFFF);
    *(double *)(*(_QWORD *)(a1 + 96) + 8 * v4) = *(double *)(*(_QWORD *)(a1 + 96) + 8 * v4)
                                                 + (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                 * 0.5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
    v6 = *(_QWORD *)(a1 + 80);
  }
  v8 = *(double *)(v6 + 8 * v4);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  result = v8 + *(double *)(v9 + 24);
  *(double *)(v9 + 24) = result;
  return result;
}

- (BOOL)valid
{
  return self->mValid;
}

- (void)invalidate
{
  self->mValid = 0;
}

- (BOOL)hasHeightForRow:(unsigned __int16)a3
{
  unsigned int mStartRowIndex;
  BOOL v4;
  unsigned __int16 v5;

  mStartRowIndex = self->mStartRowIndex;
  v4 = a3 >= mStartRowIndex;
  v5 = a3 - mStartRowIndex;
  return v4 && self->mNumberOfRows > v5 && self->mCapturedRowHeights[v5] > 0.0;
}

- (BOOL)hasWidthForColumn:(unsigned __int8)a3
{
  unsigned int mStartColumnIndex;
  BOOL v4;
  unsigned __int8 v5;

  mStartColumnIndex = self->mStartColumnIndex;
  v4 = a3 >= mStartColumnIndex;
  v5 = a3 - mStartColumnIndex;
  return v4 && self->mNumberOfColumns > v5 && self->mCapturedColumnWidths[v5] > 0.0;
}

- (double)getRowInitialHeight:(unsigned __int16)a3
{
  double *mCapturedRowHeights;
  double result;
  unsigned int mStartRowIndex;

  mCapturedRowHeights = self->mCapturedRowHeights;
  result = 0.0;
  if (mCapturedRowHeights)
  {
    mStartRowIndex = self->mStartRowIndex;
    if (mStartRowIndex <= a3 && self->mNumberOfRows + mStartRowIndex > a3)
      return mCapturedRowHeights[a3 - mStartRowIndex];
  }
  return result;
}

- (double)getColumnInitialWidth:(unsigned __int8)a3
{
  double *mCapturedColumnWidths;
  double result;
  unsigned int mStartColumnIndex;

  mCapturedColumnWidths = self->mCapturedColumnWidths;
  result = 0.0;
  if (mCapturedColumnWidths)
  {
    mStartColumnIndex = self->mStartColumnIndex;
    if (mStartColumnIndex <= a3 && self->mNumberOfColumns + mStartColumnIndex > a3)
      return mCapturedColumnWidths[a3 - mStartColumnIndex];
  }
  return result;
}

- (double)getRowHeight:(unsigned __int16)a3
{
  double *mCurrentRowHeights;
  double result;
  unsigned int mStartRowIndex;

  mCurrentRowHeights = self->mCurrentRowHeights;
  result = 0.0;
  if (mCurrentRowHeights)
  {
    mStartRowIndex = self->mStartRowIndex;
    if (mStartRowIndex <= a3 && self->mNumberOfRows + mStartRowIndex > a3)
      return mCurrentRowHeights[a3 - mStartRowIndex];
  }
  return result;
}

- (double)getColumnWidth:(unsigned __int8)a3
{
  double *mCurrentColumnWidths;
  double result;
  unsigned int mStartColumnIndex;

  mCurrentColumnWidths = self->mCurrentColumnWidths;
  result = 0.0;
  if (mCurrentColumnWidths)
  {
    mStartColumnIndex = self->mStartColumnIndex;
    if (mStartColumnIndex <= a3 && self->mNumberOfColumns + mStartColumnIndex > a3)
      return mCurrentColumnWidths[a3 - mStartColumnIndex];
  }
  return result;
}

- (double)getRowHeightResize:(unsigned __int16)a3
{
  double v3;
  int v4;
  unsigned int mStartRowIndex;

  v3 = 0.0;
  if (self->mCurrentRowHeights)
  {
    v4 = a3;
    mStartRowIndex = self->mStartRowIndex;
    if (mStartRowIndex <= a3
      && self->mNumberOfRows + mStartRowIndex > a3
      && -[TSTLayoutDynamicResizeInfo hasHeightForRow:](self, "hasHeightForRow:", a3))
    {
      return self->mCurrentRowHeights[v4 - self->mStartRowIndex] - self->mCapturedRowHeights[v4 - self->mStartRowIndex];
    }
  }
  return v3;
}

- (double)getColumnWidthResize:(unsigned __int8)a3
{
  double v3;
  int v4;
  unsigned int mStartColumnIndex;

  v3 = 0.0;
  if (self->mCurrentColumnWidths)
  {
    v4 = a3;
    mStartColumnIndex = self->mStartColumnIndex;
    if (mStartColumnIndex <= a3
      && self->mNumberOfColumns + mStartColumnIndex > a3
      && -[TSTLayoutDynamicResizeInfo hasWidthForColumn:](self, "hasWidthForColumn:", a3))
    {
      return self->mCurrentColumnWidths[v4 - self->mStartColumnIndex]
           - self->mCapturedColumnWidths[v4 - self->mStartColumnIndex];
    }
  }
  return v3;
}

- (double)applyRowTotalHeight:(double)a3
{
  double result;

  -[TSTLayoutDynamicResizeInfo applyResizeHeightFactor:](self, "applyResizeHeightFactor:", a3 / self->mCapturedRowHeightTotal);
  return result;
}

- (double)applyColumnTotalWidth:(double)a3
{
  double result;

  -[TSTLayoutDynamicResizeInfo applyResizeWidthFactor:](self, "applyResizeWidthFactor:", a3 / self->mCapturedColumnWidthTotal);
  return result;
}

- (CGSize)capturedTableSize
{
  double mCapturedColumnWidthTotal;
  double mCapturedRowHeightTotal;
  CGSize result;

  mCapturedColumnWidthTotal = self->mCapturedColumnWidthTotal;
  mCapturedRowHeightTotal = self->mCapturedRowHeightTotal;
  result.height = mCapturedRowHeightTotal;
  result.width = mCapturedColumnWidthTotal;
  return result;
}

- (void)enumerateColumnWidthsUsingBlock:(id)a3
{
  unsigned __int8 mStartColumnIndex;
  char v6;

  v6 = 0;
  mStartColumnIndex = self->mStartColumnIndex;
  do
  {
    if (self->mNumberOfColumns + self->mStartColumnIndex <= mStartColumnIndex)
      break;
    if (-[TSTLayoutDynamicResizeInfo hasWidthForColumn:](self, "hasWidthForColumn:", mStartColumnIndex))
    {
      -[TSTLayoutDynamicResizeInfo getColumnWidth:](self, "getColumnWidth:", mStartColumnIndex);
      (*((void (**)(id, _QWORD, char *))a3 + 2))(a3, mStartColumnIndex, &v6);
    }
    ++mStartColumnIndex;
  }
  while (!v6);
}

- (void)enumerateRowHeightsUsingBlock:(id)a3
{
  unsigned __int16 mStartRowIndex;
  char v6;

  v6 = 0;
  mStartRowIndex = self->mStartRowIndex;
  do
  {
    if (self->mNumberOfRows + self->mStartRowIndex <= mStartRowIndex)
      break;
    if (-[TSTLayoutDynamicResizeInfo hasHeightForRow:](self, "hasHeightForRow:", mStartRowIndex))
    {
      -[TSTLayoutDynamicResizeInfo getRowHeight:](self, "getRowHeight:", mStartRowIndex);
      (*((void (**)(id, _QWORD, char *))a3 + 2))(a3, mStartRowIndex, &v6);
    }
    ++mStartRowIndex;
  }
  while (!v6);
}

- (id)rowHeights
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__25;
  v10 = __Block_byref_object_dispose__25;
  v11 = 0;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__TSTLayoutDynamicResizeInfo_rowHeights__block_invoke;
  v5[3] = &unk_24D82EF00;
  v5[4] = &v6;
  -[TSTLayoutDynamicResizeInfo enumerateRowHeightsUsingBlock:](self, "enumerateRowHeightsUsingBlock:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__TSTLayoutDynamicResizeInfo_rowHeights__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:"));
}

- (id)columnWidths
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__25;
  v10 = __Block_byref_object_dispose__25;
  v11 = 0;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__TSTLayoutDynamicResizeInfo_columnWidths__block_invoke;
  v5[3] = &unk_24D82EF28;
  v5[4] = &v6;
  -[TSTLayoutDynamicResizeInfo enumerateColumnWidthsUsingBlock:](self, "enumerateColumnWidthsUsingBlock:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__TSTLayoutDynamicResizeInfo_columnWidths__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:"));
}

@end

@implementation OADTableStyleResolver

- (OADTableStyleResolver)initWithTable:(id)a3
{
  id v5;
  OADTableStyleResolver *v6;
  OADTableStyleResolver *v7;
  uint64_t v8;
  OADTableProperties *mTableProperties;
  uint64_t v10;
  OADTableStyle *mTableStyle;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OADTableStyleResolver;
  v6 = -[OADTableStyleResolver init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mTable, a3);
    -[OADTable tableProperties](v7->mTable, "tableProperties");
    v8 = objc_claimAutoreleasedReturnValue();
    mTableProperties = v7->mTableProperties;
    v7->mTableProperties = (OADTableProperties *)v8;

    -[OADTableProperties style](v7->mTableProperties, "style");
    v10 = objc_claimAutoreleasedReturnValue();
    mTableStyle = v7->mTableStyle;
    v7->mTableStyle = (OADTableStyle *)v10;

    -[OADTable grid](v7->mTable, "grid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7->mColumnCount = objc_msgSend(v12, "columnCount");
    v7->mRowCount = -[OADTable rowCount](v7->mTable, "rowCount");

  }
  return v7;
}

- (void)dealloc
{
  char *mCellMatrix;
  char *mCellStyles;
  char *v5;
  char *v6;
  objc_super v7;
  void **v8;

  mCellMatrix = (char *)self->mCellMatrix;
  if (mCellMatrix)
  {
    v8 = (void **)(mCellMatrix + 8);
    std::vector<OADTableCell * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x22E2DD408](mCellMatrix, 0x1080C409938AC02);
  }
  mCellStyles = (char *)self->mCellStyles;
  if (mCellStyles)
  {
    v8 = (void **)(mCellStyles + 8);
    std::vector<OADTableCell * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x22E2DD408](mCellStyles, 0x1080C409938AC02);
  }
  v5 = (char *)self->mStrokes[0];
  if (v5)
  {
    v8 = (void **)(v5 + 8);
    std::vector<OADTableCell * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x22E2DD408](v5, 0x1080C409938AC02);
  }
  v6 = (char *)self->mStrokes[1];
  if (v6)
  {
    v8 = (void **)(v6 + 8);
    std::vector<OADTableCell * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x22E2DD408](v6, 0x1080C409938AC02);
  }
  v7.receiver = self;
  v7.super_class = (Class)OADTableStyleResolver;
  -[OADTableStyleResolver dealloc](&v7, sel_dealloc);
}

- (void)fixVectorAtExtremePositionFlags
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[OADTableStyle firstRowStyle](self->mTableStyle, "firstRowStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[OADTableProperties setFirstRow:](self->mTableProperties, "setFirstRow:", 0);
  -[OADTableStyle lastRowStyle](self->mTableStyle, "lastRowStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[OADTableProperties setLastRow:](self->mTableProperties, "setLastRow:", 0);
  -[OADTableStyle firstColumnStyle](self->mTableStyle, "firstColumnStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[OADTableProperties setFirstColumn:](self->mTableProperties, "setFirstColumn:", 0);
  -[OADTableStyle lastColumnStyle](self->mTableStyle, "lastColumnStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[OADTableProperties setLastColumn:](self->mTableProperties, "setLastColumn:", 0);
}

- (void)loadCells
{
  int *v3;
  uint64_t v4;
  void *v5;
  unsigned int i;
  void *v7;
  uint64_t j;
  uint64_t k;
  id *v10;

  v3 = (int *)operator new();
  OADTFTemplateMatrix<OADTableCell * {__strong}>::OADTFTemplateMatrix(v3, self->mRowCount, self->mColumnCount, 0);
  self->mCellMatrix = v3;
  if (self->mRowCount >= 1)
  {
    v4 = 0;
    do
    {
      -[OADTable rowAtIndex:](self->mTable, "rowAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; objc_msgSend(v5, "cellCount") > (unint64_t)i; ++i)
      {
        objc_msgSend(v5, "cellAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTopRow:", v4);
        objc_msgSend(v7, "setLeftColumn:", i);
        if ((objc_msgSend(v7, "horzMerge") & 1) == 0 && (objc_msgSend(v7, "vertMerge") & 1) == 0)
        {
          for (j = 0; j < (int)objc_msgSend(v7, "rowSpan"); ++j)
          {
            for (k = 0; k < (int)objc_msgSend(v7, "gridSpan"); ++k)
            {
              v10 = (id *)OADTFTemplateMatrix<OADTableCell * {__strong}>::operator[]((uint64_t)self->mCellMatrix, (j + v4) | ((unint64_t)(i + k) << 32));
              objc_storeStrong(v10, v7);
            }
          }
        }

      }
      ++v4;
    }
    while (v4 < self->mRowCount);
  }
}

- (id)sourceCellAtI1:(int)a3 i2:(int)a4 dir1:(int)a5
{
  uint64_t v7;

  OADTMatrixPos::OADTMatrixPos(&v7, a3, a4, a5);
  if ((v7 & 0x80000000) != 0 || (int)v7 >= self->mRowCount || v7 < 0 || SHIDWORD(v7) >= self->mColumnCount)
    return 0;
  else
    return *(id *)OADTFTemplateMatrix<OADTableCell * {__strong}>::operator[]((uint64_t)self->mCellMatrix, v7);
}

- (int)cellCountAlongDir:(int)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 36;
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)applyCellStyleFromPart:(int)a3 dir1:(int)a4 fromI1:(int)a5 fromI2:(int)a6 dir1Span:(int)a7 dir2Span:(int)a8
{
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  _DWORD v21[2];

  -[OADTableStyle partStyle:](self->mTableStyle, "partStyle:", *(_QWORD *)&a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    OADTMatrixPos::OADTMatrixPos(v21, a5, a6, a4);
    OADTMatrixPos::OADTMatrixPos(&v19, a7, a8, a4);
    v15 = v19;
    if (v19 >= 1)
    {
      v16 = 0;
      v17 = v20;
      do
      {
        if (v17 >= 1)
        {
          v18 = 0;
          do
          {
            objc_msgSend(*(id *)OADTFTemplateMatrix<OADTablePartStyle * {__strong}>::operator[]((uint64_t)self->mCellStyles, (v21[0] + v16) | ((unint64_t)(v18 + v21[1]) << 32)), "applyOverridesFrom:", v14);
            ++v18;
            v17 = v20;
          }
          while (v18 < v20);
          v15 = v19;
        }
        ++v16;
      }
      while (v16 < v15);
    }
  }

}

- (void)applyWholeTableCellStyle
{
  -[OADTableStyleResolver applyCellStyleFromPart:dir1:fromI1:fromI2:dir1Span:dir2Span:](self, "applyCellStyleFromPart:dir1:fromI1:fromI2:dir1Span:dir2Span:", 1, 0, 0, 0, self->mRowCount, self->mColumnCount);
}

- (void)applyCellStyleOfBandsNormalToDir:(int)a3 parity:(int)a4 part:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  _BOOL4 v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  if (-[OADTableProperties hasBandsNormalToDir:](self->mTableProperties, "hasBandsNormalToDir:"))
  {
    v9 = -[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:", v7, 0);
    if (v9)
      v10 = 2;
    else
      v10 = 1;
    if (a4 == 2)
      v11 = v10;
    else
      v11 = v9;
    v12 = -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:", v7);
    if (-[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:", v7, 1))
    {
      v13 = -2;
    }
    else
    {
      v13 = -1;
    }
    v14 = v13 + v12;
    v15 = -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:", (_DWORD)v7 == 0);
    if ((int)v11 <= v14)
    {
      v16 = v15;
      do
      {
        -[OADTableStyleResolver applyCellStyleFromPart:dir1:fromI1:fromI2:dir1Span:dir2Span:](self, "applyCellStyleFromPart:dir1:fromI1:fromI2:dir1Span:dir2Span:", v5, v7, v11, 0, 1, v16);
        v11 = (v11 + 2);
      }
      while ((int)v11 <= v14);
    }
  }
}

- (void)applyBandCellStyles
{
  -[OADTableStyleResolver applyCellStyleOfBandsNormalToDir:parity:part:](self, "applyCellStyleOfBandsNormalToDir:parity:part:", 0, 1, 2);
  -[OADTableStyleResolver applyCellStyleOfBandsNormalToDir:parity:part:](self, "applyCellStyleOfBandsNormalToDir:parity:part:", 0, 2, 3);
  -[OADTableStyleResolver applyCellStyleOfBandsNormalToDir:parity:part:](self, "applyCellStyleOfBandsNormalToDir:parity:part:", 1, 1, 4);
  -[OADTableStyleResolver applyCellStyleOfBandsNormalToDir:parity:part:](self, "applyCellStyleOfBandsNormalToDir:parity:part:", 1, 2, 5);
}

- (void)applyCellStyleOfExtremeVectorNormalToDir:(int)a3 atExtremePos:(int)a4 part:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v9;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  if (-[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:"))
  {
    if (a4 == 1)
      v9 = -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:", v7) - 1;
    else
      v9 = 0;
    -[OADTableStyleResolver applyCellStyleFromPart:dir1:fromI1:fromI2:dir1Span:dir2Span:](self, "applyCellStyleFromPart:dir1:fromI1:fromI2:dir1Span:dir2Span:", v5, v7, v9, 0, 1, -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:", (_DWORD)v7 == 0));
  }
}

- (void)applyExtremeVectorCellStyles
{
  -[OADTableStyleResolver applyCellStyleOfExtremeVectorNormalToDir:atExtremePos:part:](self, "applyCellStyleOfExtremeVectorNormalToDir:atExtremePos:part:", 1, 1, 9);
  -[OADTableStyleResolver applyCellStyleOfExtremeVectorNormalToDir:atExtremePos:part:](self, "applyCellStyleOfExtremeVectorNormalToDir:atExtremePos:part:", 1, 0, 8);
  -[OADTableStyleResolver applyCellStyleOfExtremeVectorNormalToDir:atExtremePos:part:](self, "applyCellStyleOfExtremeVectorNormalToDir:atExtremePos:part:", 0, 1, 7);
  -[OADTableStyleResolver applyCellStyleOfExtremeVectorNormalToDir:atExtremePos:part:](self, "applyCellStyleOfExtremeVectorNormalToDir:atExtremePos:part:", 0, 0, 6);
}

- (void)applyCornerCellStyleWithRowPos:(int)a3 columnPos:(int)a4 part:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  if (-[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:", 0, *(_QWORD *)&a3)&& -[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:", 1, v6))
  {
    if (a3)
    {
      v9 = (self->mRowCount - 1);
      if ((_DWORD)v6)
      {
LABEL_5:
        v10 = (self->mColumnCount - 1);
LABEL_9:
        -[OADTableStyleResolver applyCellStyleFromPart:dir1:fromI1:fromI2:dir1Span:dir2Span:](self, "applyCellStyleFromPart:dir1:fromI1:fromI2:dir1Span:dir2Span:", v5, 0, v9, v10, 1, 1);
        return;
      }
    }
    else
    {
      v9 = 0;
      if ((_DWORD)v6)
        goto LABEL_5;
    }
    v10 = 0;
    goto LABEL_9;
  }
}

- (void)applyCornerCellStyles
{
  -[OADTableStyleResolver applyCornerCellStyleWithRowPos:columnPos:part:](self, "applyCornerCellStyleWithRowPos:columnPos:part:", 1, 1, 13);
  -[OADTableStyleResolver applyCornerCellStyleWithRowPos:columnPos:part:](self, "applyCornerCellStyleWithRowPos:columnPos:part:", 1, 0, 12);
  -[OADTableStyleResolver applyCornerCellStyleWithRowPos:columnPos:part:](self, "applyCornerCellStyleWithRowPos:columnPos:part:", 0, 1, 11);
  -[OADTableStyleResolver applyCornerCellStyleWithRowPos:columnPos:part:](self, "applyCornerCellStyleWithRowPos:columnPos:part:", 0, 0, 10);
}

- (void)applyCellStyles
{
  int *v3;
  int mRowCount;
  uint64_t v5;
  uint64_t mColumnCount;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void **v11;
  void *v12;

  v3 = (int *)operator new();
  OADTFTemplateMatrix<OADTablePartStyle * {__strong}>::OADTFTemplateMatrix(v3, self->mRowCount, self->mColumnCount, 0);
  self->mCellStyles = v3;
  mRowCount = self->mRowCount;
  if (mRowCount >= 1)
  {
    v5 = 0;
    LODWORD(mColumnCount) = self->mColumnCount;
    do
    {
      if ((int)mColumnCount >= 1)
      {
        v7 = 0;
        v8 = 0;
        do
        {
          +[OADTablePartStyle defaultStyle](OADTablePartStyle, "defaultStyle");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "shallowCopy");
          v11 = (void **)OADTFTemplateMatrix<OADTablePartStyle * {__strong}>::operator[]((uint64_t)self->mCellStyles, v7 | v5);
          v12 = *v11;
          *v11 = (void *)v10;

          ++v8;
          mColumnCount = self->mColumnCount;
          v7 += 0x100000000;
        }
        while (v8 < mColumnCount);
        mRowCount = self->mRowCount;
      }
      ++v5;
    }
    while (v5 < mRowCount);
  }
  -[OADTableStyleResolver applyWholeTableCellStyle](self, "applyWholeTableCellStyle");
  -[OADTableStyleResolver applyBandCellStyles](self, "applyBandCellStyles");
  -[OADTableStyleResolver applyExtremeVectorCellStyles](self, "applyExtremeVectorCellStyles");
  -[OADTableStyleResolver applyCornerCellStyles](self, "applyCornerCellStyles");
}

- (OADTMatrixPos)dominantCellInRowRange:(_NSRange)a3 columnRange:(_NSRange)a4
{
  int length;
  NSUInteger location;
  int v6;
  unsigned int v7;
  _BOOL4 v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  BOOL v14;
  int v15;
  int v16;
  _BOOL4 v17;
  int v18;
  _BOOL4 v19;
  _BOOL4 v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;

  length = a4.length;
  location = a4.location;
  v6 = a3.length;
  v7 = a3.location;
  if (a3.length != 1 || a4.length != 1)
  {
    v9 = -[OADTableProperties firstRow](self->mTableProperties, "firstRow");
    v10 = -[OADTableProperties lastRow](self->mTableProperties, "lastRow") ? self->mRowCount - 1 : -1;
    v11 = v9 - 1;
    v12 = -[OADTableProperties firstColumn](self->mTableProperties, "firstColumn") - 1;
    v13 = -[OADTableProperties lastColumn](self->mTableProperties, "lastColumn") ? self->mColumnCount - 1 : -1;
    v14 = v7 == v11 && (_DWORD)location == v12;
    if (!v14)
    {
      v15 = location + length - 1;
      if (v7 == v11 && v15 == v13)
      {
        location = (location + length - 1);
      }
      else
      {
        v16 = v7 + v6 - 1;
        if (v16 == v10 && (_DWORD)location == v12)
        {
          v7 = v7 + v6 - 1;
        }
        else
        {
          v17 = v7 == v11;
          if (v7 == v11)
            v18 = v11;
          else
            v18 = v10;
          v14 = v16 == v10;
          v19 = v16 == v10;
          if (v14)
            v17 = 1;
          v14 = v15 == v13;
          v20 = v15 == v13;
          if (v14)
            v21 = v13;
          else
            v21 = location;
          if (v19 && v20)
          {
            v22 = v10;
          }
          else
          {
            v13 = location;
            v22 = v18;
          }
          if ((_DWORD)location == v12)
            v23 = v12;
          else
            v23 = v21;
          if (v17)
            location = v13;
          else
            location = v23;
          if (v17)
            v7 = v22;
        }
      }
    }
  }
  return (OADTMatrixPos)(v7 | (location << 32));
}

- (id)strokeOfSegmentNormalToDir1:(int)a3 i1:(int)a4 fromI2:(int)a5
{
  return *(id *)OADTFTemplateMatrix<OADStroke * {__strong}>::operator[]((uint64_t)self->mStrokes[a3], a4 | (*(_QWORD *)&a5 << 32));
}

- (void)setStroke:(id)a3 ofSegmentNormalToDir1:(int)a4 i1:(int)a5 fromI2:(int)a6
{
  uint64_t v6;
  id v10;
  void **v11;
  void *v12;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = (void **)OADTFTemplateMatrix<OADStroke * {__strong}>::operator[]((uint64_t)self->mStrokes[a4], a5 | (unint64_t)(v6 << 32));
  v12 = *v11;
  *v11 = v10;

}

- (void)applyStroke:(int)a3 fromPart:(int)a4 normalToDir1:(int)a5 i1:(int)a6 fromI2:(int)a7 dir2Span:(int)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v13 = *(_QWORD *)&a3;
  -[OADTableStyle partStyle:](self->mTableStyle, "partStyle:", *(_QWORD *)&a4);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cellStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "borderStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stroke:", v13);
  v17 = objc_claimAutoreleasedReturnValue();

  v21 = (id)v17;
  if (!v17)
  {
    if (a4 != 1)
    {
      v21 = 0;
      goto LABEL_11;
    }
    +[OADTableCellBorderStyle defaultAxisParallelStroke](OADTableCellBorderStyle, "defaultAxisParallelStroke");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = (a8 + v9);
  if (a8 >= 1)
  {
    v19 = v9;
    do
    {
      -[OADTableStyleResolver setStroke:ofSegmentNormalToDir1:i1:fromI2:](self, "setStroke:ofSegmentNormalToDir1:i1:fromI2:", v21, v11, v10, v19);
      v19 = (v19 + 1);
    }
    while ((int)v19 < (int)v18);
  }
  if (a8 < 0)
  {
    do
    {
      -[OADTableStyleResolver setStroke:ofSegmentNormalToDir1:i1:fromI2:](self, "setStroke:ofSegmentNormalToDir1:i1:fromI2:", v21, v11, v10, v18);
      v18 = (v18 + 1);
    }
    while ((int)v18 < (int)v9);
  }
LABEL_11:

}

- (void)applyStroke:(int)a3 fromPart:(int)a4 normalToDir1:(int)a5 i1:(int)a6 fromI2:(int)a7 toI2:(int)a8
{
  -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, (a8 - a7));
}

- (void)applyStrokesFromPart:(int)a3 fromPos:(OADTMatrixPos)a4 toPos:(OADTMatrixPos)a5
{
  uint64_t v7;
  uint64_t var1;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = *(_QWORD *)&a3;
  var1 = a4.var1;
  v10 = a5.var1;
  -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:", 3, *(_QWORD *)&a3, 0, a4, a4.var1, a5.var1);
  -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:", 4, v7, 0, a5, var1, v10);
  -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:", 1, v7, 1, var1, a4, a5);
  -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:", 2, v7, 1, v10, a4, a5);
  v11 = (a4.var0 + 1);
  if ((int)v11 < a5.var0)
  {
    do
    {
      -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:", 5, v7, 0, v11, var1, v10);
      v11 = (v11 + 1);
    }
    while (a5.var0 != (_DWORD)v11);
  }
  v12 = (var1 + 1);
  if ((int)v12 < (int)v10)
  {
    do
    {
      -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:", 6, v7, 1, v12, a4, a5);
      v12 = (v12 + 1);
    }
    while ((_DWORD)v10 != (_DWORD)v12);
  }
}

- (void)createStrokeMatrices
{
  int *v3;
  int *v4;

  v3 = (int *)operator new();
  OADTFTemplateMatrix<OADStroke * {__strong}>::OADTFTemplateMatrix(v3, self->mRowCount + 1, self->mColumnCount, 0);
  self->mStrokes[0] = v3;
  v4 = (int *)operator new();
  OADTFTemplateMatrix<OADStroke * {__strong}>::OADTFTemplateMatrix(v4, self->mColumnCount + 1, self->mRowCount, 0);
  self->mStrokes[1] = v4;
}

- (void)applyWholeTableStrokes
{
  -[OADTableStyleResolver applyStrokesFromPart:fromPos:toPos:](self, "applyStrokesFromPart:fromPos:toPos:", 1, 0, self->mRowCount | ((unint64_t)self->mColumnCount << 32));
}

- (int)cellParityRelativeToDir1:(int)a3 i1:(int)a4 i2:(int)a5
{
  uint64_t v5;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  BOOL v14;
  int v15;

  v5 = *(_QWORD *)&a3;
  -[OADTableStyleResolver sourceCellAtI1:i2:dir1:](self, "sourceCellAtI1:i2:dir1:", *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7
    || (!(_DWORD)v5
      ? (v9 = objc_msgSend(v7, "topRow"), v10 = objc_msgSend(v8, "rowSpan"))
      : (v9 = objc_msgSend(v7, "leftColumn"), v10 = objc_msgSend(v8, "gridSpan")),
        (v11 = v10,
         v12 = -[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:", v5, 0), v13 = -[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:", v5, 1), !v9)? (v14 = v12): (v14 = 0), v14 || v13 && v11 + v9 == -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:", v5)))
  {
    v15 = 0;
  }
  else if (((v9 & 1) == 0) != v12)
  {
    v15 = 1;
  }
  else
  {
    v15 = 2;
  }

  return v15;
}

- (void)applyStrokesOfBandsNormalToDir:(int)a3 parity:(int)a4 part:(int)a5
{
  uint64_t v6;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  _BOOL4 v21;
  unsigned int v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  int v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  int v30;
  int v31;
  _BOOL4 v32;
  unsigned int v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  int v37;

  v6 = *(_QWORD *)&a3;
  v8 = -[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:", *(_QWORD *)&a3, 0);
  v9 = -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:", v6);
  if (-[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:", v6, 1))
  {
    v10 = -2;
  }
  else
  {
    v10 = -1;
  }
  v11 = v10 + v9;
  HIDWORD(v36) = v6 == 0;
  v12 = -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:");
  LODWORD(v36) = v8;
  v37 = v11;
  if (v11 >= v8)
  {
    if ((_DWORD)v6)
      v13 = 3;
    else
      v13 = 1;
    if ((_DWORD)v6)
      v14 = 5;
    else
      v14 = 6;
    if ((_DWORD)v6)
      v15 = 4;
    else
      v15 = 2;
    v16 = v36;
    do
    {
      if ((v12 & 0x80000000) == 0)
      {
        v17 = -1;
        do
        {
          v18 = (v17 + 1);
          v19 = -[OADTableStyleResolver cellParityRelativeToDir1:i1:i2:](self, "cellParityRelativeToDir1:i1:i2:", v6, v16, v36);
          v20 = -[OADTableStyleResolver cellParityRelativeToDir1:i1:i2:](self, "cellParityRelativeToDir1:i1:i2:", v6, v16, v18);
          v21 = v20 == a4 || v19 != a4;
          if (v19 != a4 && v20 == a4)
            v22 = v13;
          else
            v22 = 0;
          if (v19 == a4 && v20 == a4)
            v22 = v14;
          if (v21)
            v23 = v22;
          else
            v23 = v15;
          if ((_DWORD)v23)
            -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:", v23, a5, HIDWORD(v36), v18, v16, 1);
          v17 = v18;
        }
        while (v12 != (_DWORD)v18);
      }
      v24 = (_DWORD)v16 == v37;
      v16 = (v16 + 1);
    }
    while (!v24);
  }
  if (v12 >= 1)
  {
    v25 = 0;
    HIDWORD(v36) = v37 + 1;
    if ((_DWORD)v6)
      v26 = 1;
    else
      v26 = 3;
    if ((_DWORD)v6)
      v27 = 6;
    else
      v27 = 5;
    if ((_DWORD)v6)
      v28 = 2;
    else
      v28 = 4;
    do
    {
      v29 = v36;
      if (SHIDWORD(v36) >= (int)v36)
      {
        do
        {
          v30 = -[OADTableStyleResolver cellParityRelativeToDir1:i1:i2:](self, "cellParityRelativeToDir1:i1:i2:", v6, (v29 - 1), v25, v36);
          v31 = -[OADTableStyleResolver cellParityRelativeToDir1:i1:i2:](self, "cellParityRelativeToDir1:i1:i2:", v6, v29, v25);
          v32 = v31 == a4 || v30 != a4;
          if (v30 != a4 && v31 == a4)
            v33 = v26;
          else
            v33 = 0;
          if (v30 == a4 && v31 == a4)
            v33 = v27;
          if (v32)
            v34 = v33;
          else
            v34 = v28;
          if ((_DWORD)v34)
            -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:", v34, a5, v6, v29, v25, 1);
          v35 = (int)v29 <= v37;
          v29 = (v29 + 1);
        }
        while (v35);
      }
      v25 = (v25 + 1);
    }
    while ((_DWORD)v25 != v12);
  }
}

- (void)applyBandStrokes
{
  if (-[OADTableProperties hasBandsNormalToDir:](self->mTableProperties, "hasBandsNormalToDir:", 0))
  {
    -[OADTableStyleResolver applyStrokesOfBandsNormalToDir:parity:part:](self, "applyStrokesOfBandsNormalToDir:parity:part:", 0, 1, 2);
    -[OADTableStyleResolver applyStrokesOfBandsNormalToDir:parity:part:](self, "applyStrokesOfBandsNormalToDir:parity:part:", 0, 2, 3);
  }
  if (-[OADTableProperties hasBandsNormalToDir:](self->mTableProperties, "hasBandsNormalToDir:", 1))
  {
    -[OADTableStyleResolver applyStrokesOfBandsNormalToDir:parity:part:](self, "applyStrokesOfBandsNormalToDir:parity:part:", 1, 1, 4);
    -[OADTableStyleResolver applyStrokesOfBandsNormalToDir:parity:part:](self, "applyStrokesOfBandsNormalToDir:parity:part:", 1, 2, 5);
  }
}

- (void)applyStrokeOfExtremeVectorNormalToDir:(int)a3 atExtremePos:(int)a4
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  int v32;
  id v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  unsigned int v41;
  int v42;
  _BOOL4 v43;

  v5 = *(_QWORD *)&a3;
  if (-[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:"))
  {
    if (a4 == 1)
    {
      v7 = -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:", v5);
      v8 = -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:", v5) - 1;
      if ((_DWORD)v5)
        v9 = 5;
      else
        v9 = 6;
      v36 = v9;
      if ((_DWORD)v5)
        v10 = 1;
      else
        v10 = 3;
      v40 = v10;
      if ((_DWORD)v5)
        v11 = 4;
      else
        v11 = 2;
      if ((_DWORD)v5)
        v12 = 3;
      else
        v12 = 1;
      if ((_DWORD)v5)
        v13 = 2;
      else
        v13 = 4;
      if ((_DWORD)v5)
        v14 = 9;
      else
        v14 = 7;
      v15 = -1;
    }
    else
    {
      v8 = 0;
      v7 = 0;
      if ((_DWORD)v5)
        v16 = 5;
      else
        v16 = 6;
      v36 = v16;
      if ((_DWORD)v5)
        v17 = 2;
      else
        v17 = 4;
      v40 = v17;
      if ((_DWORD)v5)
        v11 = 4;
      else
        v11 = 2;
      if ((_DWORD)v5)
        v12 = 3;
      else
        v12 = 1;
      if ((_DWORD)v5)
        v13 = 1;
      else
        v13 = 3;
      if ((_DWORD)v5)
        v14 = 8;
      else
        v14 = 6;
      v15 = 1;
    }
    v42 = -[OADTableStyleResolver cellCountAlongDir:](self, "cellCountAlongDir:", (_DWORD)v5 == 0);
    -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:toI2:", v13, v14, v5, v7, 0);
    -[OADTableStyleResolver sourceCellAtI1:i2:dir1:](self, "sourceCellAtI1:i2:dir1:", v8, 0, v5);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:", v12, v14, (_DWORD)v5 == 0, 0, v7, objc_msgSend(v33, "spanAlongDir:", v5) * v15);
    v43 = v5 == 0;
    v41 = v14;
    -[OADTableStyleResolver sourceCellAtI1:i2:dir1:](self, "sourceCellAtI1:i2:dir1:", v8, (v42 - 1), v5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15;
    -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:", v11, v41, (_DWORD)v5 == 0, v42, v7, objc_msgSend(v37, "spanAlongDir:", v5) * v15);
    v19 = v37;
    if (v42 >= 1)
    {
      v20 = 0;
      do
      {
        -[OADTableStyleResolver sourceCellAtI1:i2:dir1:](self, "sourceCellAtI1:i2:dir1:", v8, v20, v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "spanAlongDir:", v5);
        v23 = objc_msgSend(v21, "spanAlongDir:", (_DWORD)v5 == 0);
        -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:", v40, v41, v5, (v7 + v22 * v18), v20, v23);
        v20 = (v23 + v20);

      }
      while ((int)v20 < v42);
      v24 = 0;
      v34 = v5;
      v35 = v8;
      while (1)
      {
        -[OADTableStyleResolver sourceCellAtI1:i2:dir1:](self, "sourceCellAtI1:i2:dir1:", v8, v24, v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v25;
        v26 = objc_msgSend(v25, "spanAlongDir:", v5);
        v24 = objc_msgSend(v25, "spanAlongDir:", v43) + v24;
        if ((int)v24 >= v42)
          break;
        -[OADTableStyleResolver sourceCellAtI1:i2:dir1:](self, "sourceCellAtI1:i2:dir1:", v8, v24, v5);
        v27 = v7;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v38, "spanAlongDir:", v5);
        v29 = v28;
        if (v26 >= v28)
          v30 = v28;
        else
          v30 = v26;
        v31 = (v30 * v18);
        -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:", v36, v41, v43, v24, v27, v31);
        if (v26 <= v29)
          v32 = v29;
        else
          v32 = v26;
        -[OADTableStyleResolver applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:](self, "applyStroke:fromPart:normalToDir1:i1:fromI2:dir2Span:", v40, v41, v43, v24, (v31 + v27), ((v32 - v30) * v18));

        v7 = v27;
        v5 = v34;
        v8 = v35;
        v19 = v37;
      }

    }
  }
}

- (void)applyExtremeVectorStrokes
{
  -[OADTableStyleResolver applyStrokeOfExtremeVectorNormalToDir:atExtremePos:](self, "applyStrokeOfExtremeVectorNormalToDir:atExtremePos:", 1, 1);
  -[OADTableStyleResolver applyStrokeOfExtremeVectorNormalToDir:atExtremePos:](self, "applyStrokeOfExtremeVectorNormalToDir:atExtremePos:", 1, 0);
  -[OADTableStyleResolver applyStrokeOfExtremeVectorNormalToDir:atExtremePos:](self, "applyStrokeOfExtremeVectorNormalToDir:atExtremePos:", 0, 1);
  -[OADTableStyleResolver applyStrokeOfExtremeVectorNormalToDir:atExtremePos:](self, "applyStrokeOfExtremeVectorNormalToDir:atExtremePos:", 0, 0);
}

- (void)applyCornerStrokesWithRowPos:(int)a3 columnPos:(int)a4 part:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  id v13;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  if (-[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:", 0, *(_QWORD *)&a3)&& -[OADTableProperties hasVectorNormalToDir:atExtremePos:](self->mTableProperties, "hasVectorNormalToDir:atExtremePos:", 1, v6))
  {
    if (a3)
    {
      v9 = (self->mRowCount - 1);
      if ((_DWORD)v6)
      {
LABEL_5:
        v10 = (self->mColumnCount - 1);
LABEL_9:
        -[OADTableStyleResolver sourceCellAtI1:i2:dir1:](self, "sourceCellAtI1:i2:dir1:", v9, v10, 0);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v13, "topRow");
        v12 = objc_msgSend(v13, "leftColumn");
        -[OADTableStyleResolver applyStrokesFromPart:fromPos:toPos:](self, "applyStrokesFromPart:fromPos:toPos:", v5, v11 | (unint64_t)(v12 << 32), (objc_msgSend(v13, "rowSpan") + v11) | ((unint64_t)(objc_msgSend(v13, "gridSpan")+ v12) << 32));

        return;
      }
    }
    else
    {
      v9 = 0;
      if ((_DWORD)v6)
        goto LABEL_5;
    }
    v10 = 0;
    goto LABEL_9;
  }
}

- (void)applyCornerStrokes
{
  -[OADTableStyleResolver applyCornerStrokesWithRowPos:columnPos:part:](self, "applyCornerStrokesWithRowPos:columnPos:part:", 1, 1, 13);
  -[OADTableStyleResolver applyCornerStrokesWithRowPos:columnPos:part:](self, "applyCornerStrokesWithRowPos:columnPos:part:", 1, 0, 12);
  -[OADTableStyleResolver applyCornerStrokesWithRowPos:columnPos:part:](self, "applyCornerStrokesWithRowPos:columnPos:part:", 0, 1, 11);
  -[OADTableStyleResolver applyCornerStrokesWithRowPos:columnPos:part:](self, "applyCornerStrokesWithRowPos:columnPos:part:", 0, 0, 10);
}

- (void)applyStyleStrokes
{
  -[OADTableStyleResolver createStrokeMatrices](self, "createStrokeMatrices");
  -[OADTableStyleResolver applyWholeTableStrokes](self, "applyWholeTableStrokes");
  -[OADTableStyleResolver applyBandStrokes](self, "applyBandStrokes");
  -[OADTableStyleResolver applyExtremeVectorStrokes](self, "applyExtremeVectorStrokes");
  -[OADTableStyleResolver applyCornerStrokes](self, "applyCornerStrokes");
}

- (void)applyTextStyle:(id)a3 toParagraph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADTableStyleResolver applyTextStyle:toParagraph:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADTableStyleFlattener.mm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 731, 0, "Abstract method not overridden by %@", v10);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v11 = (void *)MEMORY[0x24BDBCE88];
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v14, "-[OADTableStyleResolver applyTextStyle:toParagraph:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)applyTextStyle:(id)a3 toCell:(id)a4
{
  id v6;
  void *v7;
  unsigned int i;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "textBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; objc_msgSend(v7, "paragraphCount") > (unint64_t)i; ++i)
  {
    objc_msgSend(v7, "paragraphAtIndex:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTableStyleResolver applyTextStyle:toParagraph:](self, "applyTextStyle:toParagraph:", v10, v9);

  }
}

- (void)applyResolvedPartStyle:(id)a3 leftStroke:(id)a4 rightStroke:(id)a5 topStroke:(id)a6 bottomStroke:(id)a7 toCell:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;

  a3;
  a4;
  a5;
  v13 = a6;
  v14 = a7;
  v15 = a8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADTableStyleResolver applyResolvedPartStyle:leftStroke:rightStroke:topStroke:bottomStroke:toCell:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADTableStyleFlattener.mm");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 749, 0, "Abstract method not overridden by %@", v25);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v19 = (void *)MEMORY[0x24BDBCE88];
  v20 = (void *)MEMORY[0x24BDD17C8];
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[OADTableStyleResolver applyResolvedPartStyle:leftStroke:rightStroke:topStroke:bottomStroke:toCell:]");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v23, 0);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v24);
}

- (void)applyResolvedStyling
{
  int mRowCount;
  uint64_t v4;
  uint64_t mColumnCount;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  mRowCount = self->mRowCount;
  if (mRowCount >= 1)
  {
    v4 = 0;
    LODWORD(mColumnCount) = self->mColumnCount;
    do
    {
      if ((int)mColumnCount >= 1)
      {
        v6 = 0;
        v7 = 0;
        do
        {
          v8 = *(id *)OADTFTemplateMatrix<OADTableCell * {__strong}>::operator[]((uint64_t)self->mCellMatrix, v6 | v4);
          if (v4 == objc_msgSend(v8, "topRow") && v7 == objc_msgSend(v8, "leftColumn"))
          {
            v9 = *(id *)OADTFTemplateMatrix<OADTablePartStyle * {__strong}>::operator[]((uint64_t)self->mCellStyles, -[OADTableStyleResolver dominantCellInRowRange:columnRange:](self, "dominantCellInRowRange:columnRange:", (int)objc_msgSend(v8, "topRow"), (int)objc_msgSend(v8, "rowSpan"), (int)objc_msgSend(v8, "leftColumn"), (int)objc_msgSend(v8, "gridSpan")));
            -[OADTableStyleResolver strokeOfSegmentNormalToDir1:i1:fromI2:](self, "strokeOfSegmentNormalToDir1:i1:fromI2:", 1, v7, v4);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTableStyleResolver strokeOfSegmentNormalToDir1:i1:fromI2:](self, "strokeOfSegmentNormalToDir1:i1:fromI2:", 1, v7 + objc_msgSend(v8, "gridSpan"), v4);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTableStyleResolver strokeOfSegmentNormalToDir1:i1:fromI2:](self, "strokeOfSegmentNormalToDir1:i1:fromI2:", 0, v4, v7);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTableStyleResolver strokeOfSegmentNormalToDir1:i1:fromI2:](self, "strokeOfSegmentNormalToDir1:i1:fromI2:", 0, objc_msgSend(v8, "rowSpan") + v4, v7);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADTableStyleResolver applyResolvedPartStyle:leftStroke:rightStroke:topStroke:bottomStroke:toCell:](self, "applyResolvedPartStyle:leftStroke:rightStroke:topStroke:bottomStroke:toCell:", v9, v10, v11, v12, v13, v8);

          }
          ++v7;
          mColumnCount = self->mColumnCount;
          v6 += 0x100000000;
        }
        while (v7 < mColumnCount);
        mRowCount = self->mRowCount;
      }
      ++v4;
    }
    while (v4 < mRowCount);
  }
}

- (void)flatten
{
  -[OADTableStyleResolver fixVectorAtExtremePositionFlags](self, "fixVectorAtExtremePositionFlags");
  -[OADTableStyleResolver loadCells](self, "loadCells");
  -[OADTableStyleResolver applyCellStyles](self, "applyCellStyles");
  -[OADTableStyleResolver applyStyleStrokes](self, "applyStyleStrokes");
  -[OADTableStyleResolver applyResolvedStyling](self, "applyResolvedStyling");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTableStyle, 0);
  objc_storeStrong((id *)&self->mTableProperties, 0);
  objc_storeStrong((id *)&self->mTable, 0);
}

@end

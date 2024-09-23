@implementation EDRowBlock

+ (id)rowBlock
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (EDRowBlock)init
{
  EDRowBlock *v2;
  const __CFAllocator *v3;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EDRowBlock;
  v2 = -[EDRowBlock init](&v7, sel_init);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v2->mPackedData = Mutable;
    if (Mutable)
    {
      CFDataIncreaseLength(Mutable, 48);
      MutableBytePtr = CFDataGetMutableBytePtr(v2->mPackedData);
      if (MutableBytePtr)
        *((_DWORD *)MutableBytePtr + 4) = 24;
    }
    v2->mCellOffsets = CFDataCreateMutable(v3, 0);
  }
  return v2;
}

- (void)setIndex:(unint64_t)a3
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v7;
  BOOL v8;

  mPackedData = self->mPackedData;
  if (mPackedData && self->mCellOffsets)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    v7 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (MutableBytePtr)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (!v8)
      *((_QWORD *)MutableBytePtr + 1) = a3;
  }
}

- (EDRowInfo)rowInfoWithRowNumber:(unsigned int)a3
{
  return -[EDRowBlock rowInfoWithRowNumber:createIfNil:](self, "rowInfoWithRowNumber:createIfNil:", *(_QWORD *)&a3, 0);
}

- (EDRowInfo)rowInfoWithRowNumber:(unsigned int)a3 createIfNil:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v7;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = -[EDRowBlock indexOfRowInfoWithRowNumber:](self, "indexOfRowInfoWithRowNumber:");
  if ((_DWORD)v7 != -1)
    return -[EDRowBlock rowInfoAtIndex:](self, "rowInfoAtIndex:", v7);
  if (v4)
    return -[EDRowBlock addRowInfoWithRowNumber:cellCountHint:](self, "addRowInfoWithRowNumber:cellCountHint:", v5, 0);
  return 0;
}

- (unsigned)indexOfRowInfoWithRowNumber:(unsigned int)a3
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v7;
  BOOL v8;
  uint64_t v9;
  UInt8 *v10;
  unsigned int v11;
  unsigned int v12;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    if (!self->mCellOffsets
      || ((MutableBytePtr = CFDataGetMutableBytePtr(mPackedData),
           v7 = CFDataGetMutableBytePtr(self->mCellOffsets),
           MutableBytePtr)
        ? (v8 = v7 == 0)
        : (v8 = 1),
          v8))
    {
      LODWORD(mPackedData) = 0;
    }
    else
    {
      v11 = *(_DWORD *)MutableBytePtr;
      v10 = MutableBytePtr + 24;
      v9 = v11;
      while (1)
      {
        if (!v9)
        {
LABEL_12:
          LODWORD(mPackedData) = -1;
          return mPackedData;
        }
        v12 = *(_DWORD *)&v10[24 * (v9 - 1) + 4];
        if (v12 == a3)
          break;
        --v9;
        if (v12 < a3)
          goto LABEL_12;
      }
      LODWORD(mPackedData) = v9 - 1;
    }
  }
  return mPackedData;
}

- (EDRowInfo)addRowInfoWithRowNumber:(unsigned int)a3 cellCountHint:(unsigned int)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFData *mPackedData;
  __CFData *v12;
  UInt8 *MutableBytePtr;
  UInt8 *v14;
  uint64_t v15;
  UInt8 *v16;
  unint64_t v17;
  uint64_t v18;
  UInt8 *v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  BOOL v23;
  int v24;
  unint64_t v25;
  UInt8 *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  BOOL v30;
  uint64_t v31;
  _DWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  UInt8 *v37;
  uint64_t v38;
  const EDCellHeader *v39;
  int32x2_t v40;
  int32x2_t v41;
  int32x2_t v43;

  if (-[EDRowBlock firstRowNumber](self, "firstRowNumber") != -1
    && -[EDRowBlock firstRowNumber](self, "firstRowNumber") + 32 <= a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[EDRowBlock addRowInfoWithRowNumber:cellCountHint:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Excel/DOM/EDRowBlock.mm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 277, 0, "Trying to add too many rows to the end of a row block!");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if (-[EDRowBlock firstRowNumber](self, "firstRowNumber") != -1
    && a3 + 32 <= -[EDRowBlock lastRowNumber](self, "lastRowNumber"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[EDRowBlock addRowInfoWithRowNumber:cellCountHint:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Excel/DOM/EDRowBlock.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 278, 0, "Trying to add too many rows to the start of a row block!");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if (a4)
  {
    mPackedData = self->mPackedData;
    if (mPackedData)
    {
      if (self->mCellOffsets)
      {
        CFDataIncreaseLength(mPackedData, 8 * a4 + 24);
        CFDataIncreaseLength(self->mCellOffsets, 4 * a4);
      }
    }
  }
  v12 = self->mPackedData;
  if (!v12 || !self->mCellOffsets)
    return 0;
  MutableBytePtr = CFDataGetMutableBytePtr(v12);
  v14 = CFDataGetMutableBytePtr(self->mCellOffsets);
  v15 = 0;
  if (!MutableBytePtr)
    return (EDRowInfo *)v15;
  v16 = v14;
  if (!v14)
    return (EDRowInfo *)v15;
  v17 = (unint64_t)&MutableBytePtr[CFDataGetLength(self->mPackedData)];
  v19 = MutableBytePtr + 24;
  v18 = *(unsigned int *)MutableBytePtr;
  v20 = v18 + 1;
  v21 = 24 * v18;
  do
  {
    if (!v21)
    {
      v20 = 0;
      goto LABEL_29;
    }
    v22 = *(_DWORD *)&MutableBytePtr[v21 + 4];
    v23 = v22 == a3;
    if (v22 >= a3)
      v24 = 0;
    else
      v24 = 6;
    if (v23)
      v24 = 1;
    if (v23)
      v15 = (uint64_t)&MutableBytePtr[v21];
    --v20;
    v21 -= 24;
  }
  while (!v24);
  if (v24 != 6)
    return (EDRowInfo *)v15;
LABEL_29:
  v25 = *((unsigned int *)MutableBytePtr + 4) + 24;
  if (v25 > CFDataGetLength(self->mPackedData))
  {
    CFDataIncreaseLength(self->mPackedData, 24);
    v26 = CFDataGetMutableBytePtr(self->mPackedData);
    if (v26)
    {
      MutableBytePtr = v26;
      v17 = (unint64_t)&v26[CFDataGetLength(self->mPackedData)];
      v19 = MutableBytePtr + 24;
      goto LABEL_32;
    }
    return 0;
  }
LABEL_32:
  v27 = v20;
  v28 = 24 * v20 + 24;
  v29 = *((_DWORD *)MutableBytePtr + 4);
  if (v29 > v28)
  {
    memmove(&v19[24 * v20 + 24], &v19[24 * v20], v29 - v28);
    v29 = *((_DWORD *)MutableBytePtr + 4);
  }
  *((_DWORD *)MutableBytePtr + 4) = v29 + 24;
  v30 = __CFADD__(*(_DWORD *)MutableBytePtr, 1);
  v31 = (*(_DWORD *)MutableBytePtr + 1);
  *(_DWORD *)MutableBytePtr = v31;
  if (!v30)
  {
    v32 = MutableBytePtr + 36;
    v33 = v31;
    do
    {
      *v32 += 24;
      v32 += 6;
      --v33;
    }
    while (v33);
  }
  v34 = 24 * v20;
  do
  {
    v35 = v34 - 24;
    if (!v34)
    {
      v41 = (int32x2_t)(24 * v31 + 24);
      goto LABEL_46;
    }
    v36 = *(_DWORD *)&v19[v34 - 16];
    v34 -= 24;
  }
  while (!v36);
  v37 = &v19[v35];
  v38 = *(unsigned int *)&v16[4 * (v36 - 1) + *(unsigned int *)&v19[v35 + 16]];
  v39 = (const EDCellHeader *)&MutableBytePtr[*(unsigned int *)&v19[v35 + 12] + v38];
  if ((unint64_t)&v39[1] > v17)
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
  v40.i32[0] = sizeofEDCell(v39) + v38;
  v40.i32[1] = 4 * v36;
  v41 = vadd_s32(v40, *(int32x2_t *)(v37 + 12));
LABEL_46:
  v43 = v41;
  v15 = (uint64_t)&v19[24 * v27];
  initEDRowInfo(v15, a3);
  *(int32x2_t *)(v15 + 12) = v43;
  return (EDRowInfo *)v15;
}

- (EDCellHeader)addCellWithColumnNumber:(unsigned int)a3 type:(int)a4 isFormulaCell:(BOOL)a5 rowInfo:(EDRowInfo *)a6 rowBlocks:(id)a7
{
  _BOOL4 v8;
  uint64_t v10;
  id v12;
  __CFData *mPackedData;
  unsigned int *MutableBytePtr;
  UInt8 *v15;
  EDCellHeader *v16;
  UInt8 *v17;
  CFIndex Length;
  CFIndex var4;
  unsigned int var2;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t var3;
  const EDCellHeader *v28;
  int v29;
  int v30;
  unsigned int v31;
  EDRowInfo *v32;
  unint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unint64_t v36;
  unsigned int v37;
  UInt8 *v38;
  unsigned int v39;
  uint64_t var1;
  int v41;
  EDRowInfo *v42;
  unsigned int v43;
  EDCellHeader *v44;
  uint64_t v45;
  int v46;
  CFIndex v47;
  unsigned int *v48;
  unint64_t v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;

  v8 = a5;
  v10 = *(_QWORD *)&a3;
  v12 = a7;
  if (!*a6)
    goto LABEL_24;
  if (maximumAllowedColumnNumber() < v10)
    goto LABEL_24;
  mPackedData = self->mPackedData;
  if (!mPackedData || !self->mCellOffsets)
    goto LABEL_24;
  MutableBytePtr = (unsigned int *)CFDataGetMutableBytePtr(mPackedData);
  v15 = CFDataGetMutableBytePtr(self->mCellOffsets);
  v16 = 0;
  if (!MutableBytePtr)
    goto LABEL_25;
  v17 = v15;
  if (!v15)
    goto LABEL_25;
  Length = CFDataGetLength(self->mPackedData);
  var4 = (*a6)->var4;
  if (CFDataGetLength(self->mCellOffsets) < var4)
  {
LABEL_23:
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
    goto LABEL_24;
  }
  var2 = (*a6)->var2;
  if (var2)
  {
    while (1)
    {
      v21 = columnNumberForEDCell((const EDCellHeader *)((char *)MutableBytePtr
                                                       + (*a6)->var3
                                                       + *(unsigned int *)&v17[4 * var2 - 4 + (*a6)->var4]));
      if (v21 == (_DWORD)v10)
        break;
      if (v21 < v10)
      {
        v51 = var2;
        goto LABEL_15;
      }
      if (!--var2)
        goto LABEL_13;
    }
    v51 = var2 - 1;
    -[EDRowBlock removeCellAtIndex:rowInfo:](self, "removeCellAtIndex:rowInfo:");
  }
  else
  {
LABEL_13:
    v51 = 0;
  }
LABEL_15:
  v47 = Length;
  v52 = sizeofEDCellType(a4, v8);
  v22 = MutableBytePtr[4];
  v49 = ((char *)*a6 - (char *)MutableBytePtr - 24) / 0x18uLL;
  v23 = v52;
  if (v22 + v52 <= CFDataGetLength(self->mPackedData))
  {
    v48 = (unsigned int *)((char *)MutableBytePtr + v47);
  }
  else
  {
    CFDataIncreaseLength(self->mPackedData, 32);
    MutableBytePtr = (unsigned int *)CFDataGetMutableBytePtr(self->mPackedData);
    if (!MutableBytePtr)
      goto LABEL_24;
    v48 = (unsigned int *)((char *)MutableBytePtr + CFDataGetLength(self->mPackedData));
    *a6 = (EDRowInfo *)&MutableBytePtr[6 * v49 + 6];
    v23 = v52;
  }
  v24 = CFDataGetLength(self->mCellOffsets);
  if ((unint64_t)MutableBytePtr[5] + 4 > v24)
  {
    CFDataIncreaseLength(self->mCellOffsets, 16);
    v17 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (v17)
    {
      v24 = CFDataGetLength(self->mCellOffsets);
      goto LABEL_22;
    }
LABEL_24:
    v16 = 0;
    goto LABEL_25;
  }
LABEL_22:
  v25 = (*a6)->var4;
  if (v24 < v25)
    goto LABEL_23;
  var3 = (*a6)->var3;
  v53 = (*a6)->var3;
  if (v51)
  {
    v45 = *(unsigned int *)&v17[4 * v51 - 4 + v25];
    v28 = (const EDCellHeader *)((char *)MutableBytePtr + var3 + v45);
    if (&v28[1] > (const EDCellHeader *)v48)
    {
      v44 = (EDCellHeader *)((char *)MutableBytePtr + var3 + v45);
      +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
      v28 = v44;
    }
    v29 = sizeofEDCell(v28);
    v30 = v45 + v53;
    v46 = v29;
    v53 = v30 + v29;
  }
  else
  {
    v46 = 0;
  }
  if (-[EDRowBlock startOfCellsOrThrow](self, "startOfCellsOrThrow") > v53 || v53 > MutableBytePtr[4])
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
  updateRowInfoOffsetsInPackedDataForNewCell(MutableBytePtr, v48, v49, v23, 4);
  v31 = MutableBytePtr[4];
  if (v53 < v31)
    memmove((char *)MutableBytePtr + v53 + v23, (char *)MutableBytePtr + v53, v31 - v53);
  v32 = *a6;
  v33 = (*a6)->var4;
  v34 = (*a6)->var4;
  if (v24 <= v33)
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
    v32 = *a6;
    v34 = (*a6)->var4;
  }
  v35 = v24 - v34;
  v36 = v51 + 1;
  v50 = v35;
  if (v36 >= v35)
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
    v32 = *a6;
    v34 = (*a6)->var4;
  }
  v37 = v33 + 4 * v51;
  v38 = &v17[v34];
  v39 = MutableBytePtr[5];
  if (v39 > v37)
  {
    memmove(&v38[4 * v36], &v38[4 * v51], v39 - v37);
    v32 = *a6;
    v39 = MutableBytePtr[5];
  }
  var1 = v32->var1;
  ++v32->var2;
  MutableBytePtr[4] += v23;
  MutableBytePtr[5] = v39 + 4;
  objc_msgSend(v12, "updateMaxPopulatedRow:column:", var1, v10);
  if (v51)
    v41 = *(_DWORD *)&v38[4 * v51 - 4] + v46;
  else
    v41 = 0;
  *(_DWORD *)&v38[4 * v51] = v41;
  v42 = *a6;
  v43 = (*a6)->var2;
  if (v43 >= v50)
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
    v42 = *a6;
    v43 = (*a6)->var2;
  }
  if (v36 < v43)
  {
    do
      *(_DWORD *)&v38[4 * v36++] += v23;
    while (v36 < v42->var2);
  }
  v16 = (EDCellHeader *)((char *)MutableBytePtr + v42->var3 + *(unsigned int *)&v38[4 * v51]);
  initEDCell((int *)v16, v10, a4, v8);
LABEL_25:

  return v16;
}

- (unint64_t)startOfCellsOrThrow
{
  __CFData *mPackedData;

  mPackedData = self->mPackedData;
  if (!mPackedData)
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
    mPackedData = self->mPackedData;
  }
  if ((unint64_t)CFDataGetLength(mPackedData) <= 0x17)
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
  return 24 * *(unsigned int *)CFDataGetMutableBytePtr(self->mPackedData) + 24;
}

- (unsigned)firstRowNumber
{
  EDRowInfo *v2;

  v2 = -[EDRowBlock rowInfoAtIndex:](self, "rowInfoAtIndex:", 0);
  if (v2)
    return v2->var1;
  else
    return -1;
}

- (EDRowInfo)rowInfoAtIndex:(unsigned int)a3
{
  EDRowInfo *result;
  UInt8 *MutableBytePtr;
  UInt8 *v7;
  BOOL v8;

  result = (EDRowInfo *)self->mPackedData;
  if (result)
  {
    if (!self->mCellOffsets)
      return 0;
    MutableBytePtr = CFDataGetMutableBytePtr((CFMutableDataRef)result);
    v7 = CFDataGetMutableBytePtr(self->mCellOffsets);
    v8 = !MutableBytePtr || v7 == 0;
    if (v8 || *(_DWORD *)MutableBytePtr <= a3)
      return 0;
    else
      return (EDRowInfo *)&MutableBytePtr[24 * a3 + 24];
  }
  return result;
}

- (unint64_t)index
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v5;
  BOOL v6;

  mPackedData = self->mPackedData;
  if (mPackedData
    && self->mCellOffsets
    && ((MutableBytePtr = CFDataGetMutableBytePtr(mPackedData),
         v5 = CFDataGetMutableBytePtr(self->mCellOffsets),
         MutableBytePtr)
      ? (v6 = v5 == 0)
      : (v6 = 1),
        !v6))
  {
    return *((_QWORD *)MutableBytePtr + 1);
  }
  else
  {
    return -1;
  }
}

- (unsigned)lastRowNumber
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v5;
  BOOL v6;

  mPackedData = self->mPackedData;
  if (mPackedData
    && self->mCellOffsets
    && ((MutableBytePtr = CFDataGetMutableBytePtr(mPackedData),
         v5 = CFDataGetMutableBytePtr(self->mCellOffsets),
         MutableBytePtr)
      ? (v6 = v5 == 0)
      : (v6 = 1),
        !v6 && *(_DWORD *)MutableBytePtr))
  {
    return *(_DWORD *)&MutableBytePtr[24 * (*(_DWORD *)MutableBytePtr - 1) + 28];
  }
  else
  {
    return -1;
  }
}

- (EDCellHeader)cellAtIndex:(unsigned int)a3 rowInfo:(EDRowInfo *)a4
{
  EDCellHeader *result;
  UInt8 *MutableBytePtr;
  UInt8 *v9;

  if (!a4)
    return 0;
  if (a4->var2 <= a3)
    return 0;
  result = (EDCellHeader *)self->mPackedData;
  if (!result)
    return result;
  if (!self->mCellOffsets)
    return 0;
  MutableBytePtr = CFDataGetMutableBytePtr((CFMutableDataRef)result);
  v9 = CFDataGetMutableBytePtr(self->mCellOffsets);
  result = 0;
  if (MutableBytePtr)
  {
    if (v9)
      return (EDCellHeader *)&MutableBytePtr[a4->var3 + *(unsigned int *)&v9[4 * a3 + a4->var4]];
  }
  return result;
}

- (EDCellHeader)cellWithColumnNumber:(unsigned int)a3 rowInfo:(EDRowInfo *)a4
{
  uint64_t v6;

  v6 = -[EDRowBlock indexOfCellWithColumnNumber:rowInfo:](self, "indexOfCellWithColumnNumber:rowInfo:", *(_QWORD *)&a3);
  if ((_DWORD)v6 == -1)
    return 0;
  else
    return -[EDRowBlock cellAtIndex:rowInfo:](self, "cellAtIndex:rowInfo:", v6, a4);
}

- (unsigned)indexOfCellWithColumnNumber:(unsigned int)a3 rowInfo:(EDRowInfo *)a4
{
  uint64_t v7;
  EDCellHeader *v8;

  v7 = -[EDRowBlock expectedIndexOfCellWithColumnNumber:rowInfo:](self, "expectedIndexOfCellWithColumnNumber:rowInfo:");
  v8 = -[EDRowBlock cellAtIndex:rowInfo:](self, "cellAtIndex:rowInfo:", v7, a4);
  if (!v8 || columnNumberForEDCell(v8) != a3)
    LODWORD(v7) = -1;
  return v7;
}

- (unsigned)expectedIndexOfCellWithColumnNumber:(unsigned int)a3 rowInfo:(EDRowInfo *)a4
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v9;
  unsigned int v10;
  UInt8 *v11;
  signed int v12;
  signed int i;
  int v14;
  unsigned int v15;

  if (!a4)
    return -1;
  mPackedData = self->mPackedData;
  if (!mPackedData || !self->mCellOffsets)
    return -1;
  MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
  v9 = CFDataGetMutableBytePtr(self->mCellOffsets);
  v10 = -1;
  if (MutableBytePtr)
  {
    v11 = v9;
    if (v9)
    {
      v12 = a4->var2 - 1;
      if (v12 < 0)
      {
        return 0;
      }
      else
      {
        for (i = 0; i <= v12; v15 > a3 ? (v12 = v10 - 1) : (i = v10 + 1))
        {
          v14 = v12 + i;
          if (v12 + i < 0 != __OFADD__(v12, i))
            ++v14;
          v10 = v14 >> 1;
          v15 = columnNumberForEDCell((const EDCellHeader *)&MutableBytePtr[a4->var3
                                                                          + *(unsigned int *)&v11[4 * (v14 >> 1)
                                                                                                + a4->var4]]);
          if (v15 == a3)
            break;
        }
      }
    }
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[EDRowBlock doneWithContent](self, "doneWithContent");
  v3.receiver = self;
  v3.super_class = (Class)EDRowBlock;
  -[EDRowBlock dealloc](&v3, sel_dealloc);
}

- (void)doneWithContent
{
  __CFData *mPackedData;
  __CFData *mCellOffsets;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    CFRelease(mPackedData);
    self->mPackedData = 0;
  }
  mCellOffsets = self->mCellOffsets;
  if (mCellOffsets)
  {
    CFRelease(mCellOffsets);
    self->mCellOffsets = 0;
  }
}

- (unsigned)rowCount
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v5;
  BOOL v6;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    if (!self->mCellOffsets
      || ((MutableBytePtr = CFDataGetMutableBytePtr(mPackedData),
           v5 = CFDataGetMutableBytePtr(self->mCellOffsets),
           MutableBytePtr)
        ? (v6 = v5 == 0)
        : (v6 = 1),
          v6))
    {
      LODWORD(mPackedData) = 0;
    }
    else
    {
      LODWORD(mPackedData) = *(_DWORD *)MutableBytePtr;
    }
  }
  return mPackedData;
}

- (void)removeCellAtIndex:(unsigned int)a3 rowInfo:(EDRowInfo *)a4
{
  __CFData *mPackedData;
  unsigned int *MutableBytePtr;
  UInt8 *v9;
  UInt8 *v11;
  unsigned int *v12;
  uint64_t v13;
  const EDCellHeader *v14;
  unint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  EDRowInfo *v19;
  unsigned int var2;
  uint64_t var4;
  uint64_t v22;
  UInt8 *v23;
  unint64_t v24;
  int32x2_t v25;
  uint64_t v26;

  mPackedData = self->mPackedData;
  if (mPackedData && self->mCellOffsets)
  {
    MutableBytePtr = (unsigned int *)CFDataGetMutableBytePtr(mPackedData);
    v9 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (MutableBytePtr && v9 != 0)
    {
      v11 = v9;
      v12 = (unsigned int *)((char *)MutableBytePtr + CFDataGetLength(self->mPackedData));
      v13 = *(unsigned int *)&v11[4 * a3 + (*a4)->var4];
      v14 = (const EDCellHeader *)((char *)MutableBytePtr + (*a4)->var3 + v13);
      if (&v14[1] > (const EDCellHeader *)v12)
        +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
      v15 = a3;
      v16 = sizeofEDCell(v14);
      updateRowInfoOffsetsInPackedDataForNewCell(MutableBytePtr, v12, ((char *)*a4 - (char *)MutableBytePtr - 24) / 0x18uLL, -v16, -4);
      v17 = ((*a4)->var3 + v13);
      -[EDRowBlock checkCellOffsetOrThrow:](self, "checkCellOffsetOrThrow:", v17);
      v18 = MutableBytePtr[4];
      if (v18 > v17 + v16)
        memmove((char *)MutableBytePtr + v17, (char *)MutableBytePtr + v17 + v16, v18 - ((_DWORD)v17 + v16));
      v19 = *a4;
      var2 = (*a4)->var2 - 1;
      v19->var2 = var2;
      var4 = v19->var4;
      v22 = var4 + 4 * a3;
      v23 = &v11[var4];
      v24 = MutableBytePtr[5];
      if (v22 + 4 < v24)
      {
        memmove(&v23[4 * a3], &v23[4 * a3 + 4], (v24 - v22) - 4);
        v19 = *a4;
        var2 = (*a4)->var2;
      }
      if (var2 > a3)
      {
        do
          *(_DWORD *)&v23[4 * v15++] -= v16;
        while (v15 < v19->var2);
      }
      v25 = *(int32x2_t *)(MutableBytePtr + 4);
      LODWORD(v26) = vsub_s32(v25, (int32x2_t)(v16 | 0x300000000)).u32[0];
      HIDWORD(v26) = vadd_s32(v25, (int32x2_t)0x300000003).i32[1];
      *((_QWORD *)MutableBytePtr + 2) = v26;
    }
  }
}

- (void)checkCellOffsetOrThrow:(unint64_t)a3
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v7;
  unint64_t v9;

  mPackedData = self->mPackedData;
  if (mPackedData && self->mCellOffsets)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    v7 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (MutableBytePtr && v7 != 0)
    {
      if ((unint64_t)CFDataGetLength(self->mPackedData) <= 0x17)
        +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
      if (-[EDRowBlock startOfCellsOrThrow](self, "startOfCellsOrThrow") > a3
        || (v9 = *((unsigned int *)MutableBytePtr + 4), v9 <= a3))
      {
        +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
        v9 = *((unsigned int *)MutableBytePtr + 4);
      }
      if (v9 - 8 <= a3)
        +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
    }
  }
}

- (unsigned)minRowNumber
{
  return -[EDRowBlock firstRowNumber](self, "firstRowNumber") & 0xFFFFFFE0;
}

- (unsigned)maxRowNumber
{
  return -[EDRowBlock minRowNumber](self, "minRowNumber") + 31;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDRowBlock;
  -[EDRowBlock description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)unarchiveFromData:(__CFData *)a3 offset:(unint64_t *)a4
{
  const UInt8 *BytePtr;
  const UInt8 *v8;
  const UInt8 *v9;
  unint64_t v10;
  unsigned int v11;
  CFIndex v12;
  uint64_t v13;

  if (a3)
  {
    BytePtr = CFDataGetBytePtr(a3);
    if (BytePtr)
    {
      v8 = BytePtr;
      CFDataSetLength(self->mPackedData, 0);
      CFDataSetLength(self->mCellOffsets, 0);
      v9 = &v8[*a4];
      v10 = *a4 + *((unsigned int *)v9 + 4) + *((unsigned int *)v9 + 5);
      if (v10 <= CFDataGetLength(a3))
      {
        CFDataAppendBytes(self->mPackedData, v9, *((unsigned int *)v9 + 4));
        v13 = *((unsigned int *)v9 + 4);
        v12 = *((unsigned int *)v9 + 5);
        *a4 += v13;
        CFDataAppendBytes(self->mCellOffsets, &v9[v13], v12);
        v11 = *((_DWORD *)v9 + 5);
      }
      else
      {
        v11 = *((_DWORD *)v9 + 5) + *((_DWORD *)v9 + 4);
      }
      *a4 += v11;
    }
  }
}

- (void)archiveByAppendingToMutableData:(__CFData *)a3
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v7;
  BOOL v8;
  const UInt8 *v9;

  mPackedData = self->mPackedData;
  if (mPackedData && self->mCellOffsets)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    v7 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (MutableBytePtr)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (!v8)
    {
      v9 = v7;
      CFDataAppendBytes(a3, MutableBytePtr, *((unsigned int *)MutableBytePtr + 4));
      CFDataAppendBytes(a3, v9, *((unsigned int *)MutableBytePtr + 5));
    }
  }
}

- (void)incrementIndex
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v5;
  BOOL v6;

  mPackedData = self->mPackedData;
  if (mPackedData && self->mCellOffsets)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    v5 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (MutableBytePtr)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (!v6)
      ++*((_QWORD *)MutableBytePtr + 1);
  }
}

@end

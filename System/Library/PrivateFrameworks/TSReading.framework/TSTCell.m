@implementation TSTCell

+ (id)cell
{
  return objc_alloc_init(TSTCell);
}

- (TSTCell)init
{
  TSTCell *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTCell;
  result = -[TSTCell init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->mPrivate = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mBaseFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mMultipleChoiceListFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mControlFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mCustomFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mDurationFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mDateFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mNumberFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mCurrencyFormatRef = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct.mData = 0u;
    *($76458E206EE951DA8EFCFE88747349CE *)((char *)&result->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct
                                         + 24) = 0u;
    *(_OWORD *)&result->mPrivate.mCommentStorage = 0u;
    *(_OWORD *)&result->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType = 0u;
    *(_OWORD *)&result->mPrivate.mTextStyle = 0u;
    *(_OWORD *)&result->mPrivate.mRichTextPayload = 0u;
    *($82AF1FAED7C1313D7653AE9686A01569 *)((char *)&result->mPrivate.mValue + 8) = 0u;
    *(_OWORD *)&result->mPrivate.mCellStyle = 0u;
    result->mPrivate.mStrokePresetNumber = -1;
  }
  return result;
}

- (TSTCell)initWithCell:(id)a3
{
  TSTCell *v4;

  v4 = -[TSTCell init](self, "init");
  if (v4)
    TSTCellCopy((uint64_t)a3, (uint64_t)v4);
  return v4;
}

- (TSTCell)initWithStorageRef:(TSTCellStorage *)a3 dataStore:(id)a4
{
  TSTCell *v6;
  TSTCell *v7;

  v6 = -[TSTCell init](self, "init");
  v7 = v6;
  if (v6)
    -[TSTCell inflateFromStorageRef:dataStore:](v6, "inflateFromStorageRef:dataStore:", a3, a4);
  return v7;
}

- (void)dealloc
{
  double v3;
  objc_super v4;

  v3 = TSTCellClear((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)TSTCell;
  -[TSTCell dealloc](&v4, sel_dealloc, v3);
}

- (void)inflateFromStorageRef:(TSTCellStorage *)a3 dataStore:(id)a4
{
  TSTCellInflateFromStorageRef((uint64_t)self, &a3->var0.var0, (id *)a4);
}

- (void)inflateFromStorageRef:(TSTCellStorage *)a3 dataStore:(id)a4 suppressingFormulaInflation:(BOOL)a5
{
  TSTCellInflateFromStorageRef((uint64_t)self, &a3->var0.var0, (id *)a4);
}

- (void)writeToStorageRef:(TSTCellStorage *)a3
{
  TSTCellToCellStorage((uint64_t)self, &a3->var0.var0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSTCell initWithCell:](+[TSTCell allocWithZone:](TSTCell, "allocWithZone:", a3), "initWithCell:", self);
}

- (BOOL)isCellContentsEqualToCell:(id)a3
{
  int v5;
  int v6;
  char isEqual;
  __int128 *v8;
  $F03D4CA5AAEDD23196D77D4402B24C2D *p_mCurrentCellFormat;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  __int128 *v15;
  __int128 v16;
  int mPrivate;
  int v18;
  double mDouble;
  void *v20;
  uint64_t v21;
  NSString *mString;
  int v23;
  const __CFString *v24;
  NSDate *mDate;
  uint64_t v26;
  double v27;
  unint64_t v28;
  int v29;
  TSTRichTextPayload *mRichTextPayload;
  uint64_t v31;
  int v33;
  int v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 *v41;
  __int128 v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 *v46;
  __int128 v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  _OWORD v54[2];
  uint64_t v55;
  _OWORD v56[2];
  uint64_t v57;
  _OWORD v58[2];
  uint64_t v59;
  _OWORD v60[2];
  uint64_t v61;
  _BYTE v62[56];
  _BYTE v63[56];
  double v64;
  __int128 v65;
  double v66;
  $A2C45A798B4E598950266309F807F0CD mNumberFormatStruct;
  _OWORD v68[2];
  uint64_t v69;
  _OWORD v70[2];
  uint64_t v71;
  _OWORD v72[2];
  uint64_t v73;
  _OWORD v74[2];
  uint64_t v75;

  if (self)
  {
    v5 = *((unsigned __int8 *)&self->mPrivate + 1);
    if (a3)
    {
LABEL_3:
      v6 = *((unsigned __int8 *)a3 + 9);
      goto LABEL_6;
    }
  }
  else
  {
    v5 = 0;
    if (a3)
      goto LABEL_3;
  }
  v6 = 0;
LABEL_6:
  if (v5 != v6)
    return 0;
  if (!self)
  {
LABEL_9:
    v8 = &TSUInvalidFormat;
    p_mCurrentCellFormat = &self->mPrivate.mCellFormats.mCurrentCellFormat;
    if (!self)
      p_mCurrentCellFormat = ($F03D4CA5AAEDD23196D77D4402B24C2D *)&TSUInvalidFormat;
    v10 = *(_OWORD *)&p_mCurrentCellFormat->var0.mMultipleChoiceListFormatStruct.mData;
    v56[0] = *(_OWORD *)&p_mCurrentCellFormat->mFormatType;
    v56[1] = v10;
    v57 = *((_QWORD *)&p_mCurrentCellFormat->var0.mMultipleChoiceListFormatStruct + 3);
    if (a3)
      v8 = (__int128 *)((char *)a3 + 104);
    v11 = v8[1];
    v54[0] = *v8;
    v54[1] = v11;
    v55 = *((_QWORD *)v8 + 4);
    v12 = v56;
    v13 = v54;
    return TSUEqualFormatStructs((uint64_t)v12, (uint64_t)v13);
  }
  isEqual = 1;
  switch(*((_BYTE *)&self->mPrivate + 1))
  {
    case 0:
      goto LABEL_9;
    case 2:
      v14 = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct.mData;
      v74[0] = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType;
      v74[1] = v14;
      v75 = *((_QWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 3);
      v15 = (__int128 *)((char *)a3 + 104);
      if (!a3)
        v15 = &TSUInvalidFormat;
      v16 = v15[1];
      v72[0] = *v15;
      v72[1] = v16;
      v73 = *((_QWORD *)v15 + 4);
      if (!TSUEqualFormatStructs((uint64_t)v74, (uint64_t)v72))
        return 0;
      mPrivate = (int)self->mPrivate;
      if ((mPrivate & 0xFB00) == 0x200 || (v18 = BYTE1(mPrivate), v18 == 7))
      {
        mDouble = self->mPrivate.mValue.mDouble;
      }
      else
      {
        mDouble = 0.0;
        if (v18)
        {
          v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "double TSTCellDoubleValue(TSTCell *)");
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 897, CFSTR("can't get value from non-value cell: %p"), self);
        }
      }
      if (a3)
      {
        v33 = *((_DWORD *)a3 + 2);
        if ((v33 & 0xFB00) == 0x200 || (v34 = BYTE1(v33), v34 == 7))
        {
          v35 = *((double *)a3 + 2);
        }
        else
        {
          v35 = 0.0;
          if (v34)
          {
            v36 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "double TSTCellDoubleValue(TSTCell *)");
            objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 897, CFSTR("can't get value from non-value cell: %p"), a3);
          }
        }
      }
      else
      {
        v50 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v51 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "double TSTCellDoubleValue(TSTCell *)");
        objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 889, CFSTR("invalid nil value for '%s'"), "cell");
        v35 = 0.0;
      }
      return mDouble == v35;
    case 3:
      mString = self->mPrivate.mValue.mString.mString;
      if (a3 && (v23 = *((unsigned __int8 *)a3 + 9), *((_BYTE *)a3 + 9)))
      {
        if (v23 == 9)
        {
          v24 = (const __CFString *)objc_msgSend(*((id *)a3 + 9), "string");
        }
        else if (v23 == 3)
        {
          v24 = (const __CFString *)*((_QWORD *)a3 + 3);
        }
        else
        {
          v52 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v53 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSTCellStringValue(TSTCell *)");
          objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 972, CFSTR("can't get string from non-string cell: %p"), a3);
          v24 = 0;
        }
      }
      else
      {
        v24 = &stru_24D82FEB0;
      }
      return -[NSString isEqualToString:](mString, "isEqualToString:", v24);
    case 5:
      mDate = self->mPrivate.mValue.mDate;
      if (!a3 || !*((_BYTE *)a3 + 9))
        goto LABEL_56;
      if (*((_BYTE *)a3 + 9) == 5)
      {
        v26 = *((_QWORD *)a3 + 2);
      }
      else
      {
        v38 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v39 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSDate *TSTCellDateValue(TSTCell *)");
        objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 1021, CFSTR("can't get date value from a non-date cell: %p"), a3);
LABEL_56:
        v26 = 0;
      }
      if (!-[NSDate isEqualToDate:](mDate, "isEqualToDate:", v26))
        return 0;
      v40 = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct.mData;
      v70[0] = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType;
      v70[1] = v40;
      v71 = *((_QWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 3);
      v41 = (__int128 *)((char *)a3 + 104);
      if (!a3)
        v41 = &TSUInvalidFormat;
      v42 = v41[1];
      v68[0] = *v41;
      v68[1] = v42;
      v69 = *((_QWORD *)v41 + 4);
      v12 = v70;
      v13 = v68;
      return TSUEqualFormatStructs((uint64_t)v12, (uint64_t)v13);
    case 6:
      v27 = self->mPrivate.mValue.mDouble;
      if (!a3 || !*((_BYTE *)a3 + 9))
        goto LABEL_62;
      if (*((_BYTE *)a3 + 9) == 6)
      {
        if ((v27 != 0.0) != (*((double *)a3 + 2) != 0.0))
          return 0;
        goto LABEL_65;
      }
      v43 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v44 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSTCellBoolValue(TSTCell *)");
      objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 925, CFSTR("can't get BOOL value from non-BOOL cell: %p"), a3);
LABEL_62:
      if (v27 == 0.0)
      {
LABEL_65:
        v45 = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct.mData;
        v60[0] = *(_OWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType;
        v60[1] = v45;
        v61 = *((_QWORD *)&self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 3);
        v46 = (__int128 *)((char *)a3 + 104);
        if (!a3)
          v46 = &TSUInvalidFormat;
        v47 = v46[1];
        v58[0] = *v46;
        v58[1] = v47;
        v59 = *((_QWORD *)v46 + 4);
        v12 = v60;
        v13 = v58;
        return TSUEqualFormatStructs((uint64_t)v12, (uint64_t)v13);
      }
      return 0;
    case 7:
      v28 = ((unint64_t)*MEMORY[0x24BEB4018] << 32) | 4;
      mNumberFormatStruct.mCurrencyCode = (NSString *)0x1000000001;
      *((_QWORD *)&mNumberFormatStruct + 1) = v28;
      v66 = self->mPrivate.mValue.mDouble;
      if (self->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType == 268)
        mNumberFormatStruct = self->mPrivate.mCellFormats.mCurrentCellFormat.var0.mNumberFormatStruct;
      v64 = 0.0;
      v65 = 0uLL;
      if (!a3)
      {
        *(_QWORD *)&v65 = 0x1000000001;
        *((_QWORD *)&v65 + 1) = v28;
        goto LABEL_69;
      }
      v29 = *((unsigned __int8 *)a3 + 9);
      *(_QWORD *)&v65 = 0x1000000001;
      *((_QWORD *)&v65 + 1) = v28;
      if (!v29)
      {
LABEL_69:
        v64 = 0.0;
        goto LABEL_70;
      }
      if (v29 != 7)
      {
        v48 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v49 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSTDurationWrapper TSTCellDurationValue(TSTCell *)");
        objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 1064, CFSTR("can't get duration value from a non-duration cell: %p"), a3);
        goto LABEL_69;
      }
      v64 = *((double *)a3 + 2);
      if (*((_DWORD *)a3 + 26) == 268)
        v65 = *((_OWORD *)a3 + 7);
LABEL_70:
      TSUFormat::TSUFormat();
      TSUFormat::TSUFormat();
      if (v66 == v64)
        isEqual = TSUFormat::isEqual((TSUFormat *)v63, (const TSUFormat *)v62);
      else
        isEqual = 0;
      TSUFormat::~TSUFormat((TSUFormat *)v62);
      TSUFormat::~TSUFormat((TSUFormat *)v63);
      return isEqual;
    case 9:
      mRichTextPayload = self->mPrivate.mRichTextPayload;
      if (a3)
        v31 = *((_QWORD *)a3 + 9);
      else
        v31 = 0;
      return -[TSTRichTextPayload isEqual:](mRichTextPayload, "isEqual:", v31);
    default:
      return isEqual;
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  int mPrivate;
  const __CFString *v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    mPrivate = (int)self->mPrivate;
    if (BYTE1(mPrivate) <= 9u)
      __asm { BR              X14 }
    v7 = CFSTR("<unknown cell type>");
    v8 = 0;
  }
  else
  {
    v7 = CFSTR("<empty>");
    v8 = CFSTR("No content");
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p: value type %@ value %@>"), v5, self, v8, v7);
}

@end

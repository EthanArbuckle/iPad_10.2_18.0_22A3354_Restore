@implementation TSTTableDataFormat

- (id)initObjectWithFormat:(id *)a3
{
  TSTTableDataFormat *v4;
  TSTTableDataFormat *v5;
  uint64_t v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSTTableDataFormat;
  v4 = -[TSTTableDataFormat init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *((_QWORD *)&a3->var1.var7 + 3);
    v7 = *(_OWORD *)&a3->var1.var7.var2;
    *(_OWORD *)&v4->mFormat.mFormatType = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v4->mFormat.var0.mMultipleChoiceListFormatStruct.mData = v7;
    *((_QWORD *)&v4->mFormat.var0.mMultipleChoiceListFormatStruct + 3) = v6;
    TSUFormatStructRetain();
    v5->super.mRefCount = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  return TSUFormatStructHash();
}

- (BOOL)isEqual:(id)a3
{
  $F03D4CA5AAEDD23196D77D4402B24C2D *p_mFormat;
  int mFormatType;
  char *v7;
  _BOOL4 v8;
  double mMinimum;
  double mMaximum;
  double v11;
  double v12;
  unsigned __int16 v13;
  uint64_t v14;
  int mCurrencyCode;
  int v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  BOOL v22;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_mFormat = &self->mFormat;
    mFormatType = self->mFormat.mFormatType;
    v7 = (char *)a3 + 16;
    if (mFormatType == *((_DWORD *)a3 + 4))
    {
      LOBYTE(v8) = 1;
      mMinimum = self->mFormat.var0.mControlFormatStruct.mMinimum;
      mMaximum = self->mFormat.var0.mControlFormatStruct.mMaximum;
      v11 = *((double *)a3 + 3);
      v12 = *((double *)a3 + 4);
      v13 = LOWORD(mMaximum);
      v14 = *((_QWORD *)v7 + 2);
      mCurrencyCode = p_mFormat->var0.mNumberFormatStruct.mCurrencyCode;
      v16 = *((_QWORD *)v7 + 1);
      switch(mFormatType)
      {
        case 254:
          goto LABEL_7;
        case 255:
          goto LABEL_10;
        case 256:
        case 257:
        case 258:
        case 259:
          if (*(_QWORD *)&mMinimum != *(_QWORD *)&v11)
          {
            v8 = -[NSString isEqualToString:](p_mFormat->var0.mNumberFormatStruct.mCurrencyCode, "isEqualToString:");
            if (!v8)
              return v8;
          }
          if ((((unsigned __int16)v14 ^ v13) & 0x1FFF) != 0)
            break;
LABEL_7:
          LOBYTE(v8) = 1;
          return v8;
        case 260:
        case 263:
        case 267:
          return v8;
        case 261:
          v8 = -[NSString isEqualToString:](p_mFormat->var0.mDateFormatStruct.mDateTimeFormat, "isEqualToString:", *((_QWORD *)v7 + 2));
          if (!v8)
            return v8;
          if (((v16 ^ mCurrencyCode) & 1) != 0)
            break;
          v17 = ((v16 ^ mCurrencyCode) & 2) == 0;
LABEL_44:
          LOBYTE(v8) = v17;
          return v8;
        case 262:
          v17 = mCurrencyCode == v16;
          goto LABEL_44;
        case 264:
        case 265:
          v22 = mMinimum == v11
             && mMaximum == v12
             && p_mFormat->var0.mControlFormatStruct.mIncrement == *((double *)v7 + 3)
             && p_mFormat->var0.mControlFormatStruct.mDisplayFormatType == *((_DWORD *)v7 + 8);
          if (!v22
            || ((v7[36] ^ *((_BYTE *)&p_mFormat->var0.mMultipleChoiceListFormatStruct + 28)) & 3) != 0)
          {
            break;
          }
          v17 = ((v7[36] ^ *((_BYTE *)&p_mFormat->var0.mMultipleChoiceListFormatStruct + 28)) & 0xC) == 0;
          goto LABEL_44;
        case 266:
          v17 = LODWORD(mMinimum) == LODWORD(v11) && HIDWORD(mMinimum) == HIDWORD(v11);
          goto LABEL_44;
        case 268:
          if (HIDWORD(mMaximum) != HIDWORD(v14)
            || HIDWORD(mMinimum) != HIDWORD(v11)
            || LODWORD(mMaximum) != (_DWORD)v14)
          {
            break;
          }
          v17 = ((v16 ^ mCurrencyCode) & 1) == 0;
          goto LABEL_44;
        case 269:
          if (LOWORD(v11) != LOWORD(mMinimum))
            break;
          v17 = ((LODWORD(v11) ^ LODWORD(mMinimum)) & 0x10000) == 0;
          goto LABEL_44;
        case 270:
        case 271:
        case 272:
          v17 = LODWORD(mMinimum) == LODWORD(v11);
          goto LABEL_44;
        default:
          if (LODWORD(mMinimum) < 2)
            return v8;
LABEL_10:
          v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUEqualFormatStructs(TSUFormatStruct, TSUFormatStruct)");
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Binaries/AlderShared/install/Root/usr/local/include/TSFrameworks/TSUtility/TSUFormatUtilities.h"), 191, CFSTR("We should have dealt with any types earlier."));
          break;
      }
    }
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("refCount: %d   mFormat: %@"), self->super.mRefCount, NSStringForTSUFormatType());
}

- (void)dealloc
{
  objc_super v3;
  objc_super v4[3];
  uint64_t v5;

  v3 = *(objc_super *)&self->mFormat.var0.mMultipleChoiceListFormatStruct.mData;
  v4[1] = *(objc_super *)&self->mFormat.mFormatType;
  v4[2] = v3;
  v5 = *((_QWORD *)&self->mFormat.var0.mMultipleChoiceListFormatStruct + 3);
  TSUFormatStructRelease();
  v4[0].receiver = self;
  v4[0].super_class = (Class)TSTTableDataFormat;
  -[objc_super dealloc](v4, sel_dealloc);
}

@end

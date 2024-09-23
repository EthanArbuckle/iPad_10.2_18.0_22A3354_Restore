@implementation OITSUFormatObject

+ (id)defaultDateFormat:(id)a3
{
  uint64_t v4;
  _QWORD v6[5];

  if (!a3)
  {
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormatStructDate TSUDefaultFormatStructDate(OITSULocale *)");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFormatStructUtilities.h"), 89, 0, "A locale is required.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v6[0] = 261;
  v6[1] = 0;
  v6[2] = TSUDefaultDateTimeFormat(a3);
  v6[3] = 0;
  v6[4] = 0;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTSUFormatFormatStruct:", v6);
}

+ (id)defaultDurationFormat
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  v3 = 268;
  v4 = xmmword_22A4BD170;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTSUFormatFormatStruct:", &v3);
}

- (OITSUFormatObject)init
{
  OITSUFormatObject *v2;
  OITSUFormatObject *v3;
  uint64_t v4;
  OITSUFormatObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OITSUFormatObject;
  v2 = -[OITSUFormatObject init](&v7, sel_init);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFormatObject init]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFormatObject.m"), 48, 0, "don't call this. call initWithFormatStruct");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v5 = v3;
  }
  return 0;
}

- (OITSUFormatObject)initWithTSUFormatFormatStruct:(id *)a3 useExpandedContents:(BOOL)a4
{
  char *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[2];
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)OITSUFormatObject;
  v6 = -[OITSUFormatObject init](&v13, sel_init);
  if (v6)
  {
    v7 = *(_OWORD *)&a3->var1.var7.var2;
    v11[0] = *(_OWORD *)&a3->var0;
    v11[1] = v7;
    v12 = *((_QWORD *)&a3->var1.var7 + 3);
    TSUFormatStructRetain((id *)v11);
    v8 = *(_OWORD *)&a3->var0;
    v9 = *(_OWORD *)&a3->var1.var7.var2;
    *((_QWORD *)v6 + 5) = *((_QWORD *)&a3->var1.var7 + 3);
    *(_OWORD *)(v6 + 24) = v9;
    *(_OWORD *)(v6 + 8) = v8;
    v6[48] = a4;
  }
  return (OITSUFormatObject *)v6;
}

- (OITSUFormatObject)initWithTSUFormatFormatStruct:(id *)a3
{
  __int128 v3;
  _OWORD v5[2];
  uint64_t v6;

  v3 = *(_OWORD *)&a3->var1.var7.var2;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v3;
  v6 = *((_QWORD *)&a3->var1.var7 + 3);
  return -[OITSUFormatObject initWithTSUFormatFormatStruct:useExpandedContents:](self, "initWithTSUFormatFormatStruct:useExpandedContents:", v5, 0);
}

- (void)dealloc
{
  __int128 v3;
  objc_super v4;
  _OWORD v5[2];
  uint64_t v6;

  v3 = *(_OWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct.mData;
  v5[0] = *(_OWORD *)&self->mFormatStruct.mFormatType;
  v5[1] = v3;
  v6 = *((_QWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 3);
  TSUFormatStructRelease((id *)v5);
  v4.receiver = self;
  v4.super_class = (Class)OITSUFormatObject;
  -[OITSUFormatObject dealloc](&v4, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  OITSUMutableFormatObject *v4;
  _OWORD v6[2];
  uint64_t v7;

  v4 = [OITSUMutableFormatObject alloc];
  if (self)
  {
    -[OITSUFormatObject formatStruct](self, "formatStruct");
  }
  else
  {
    v7 = 0;
    memset(v6, 0, sizeof(v6));
  }
  return -[OITSUFormatObject initWithTSUFormatFormatStruct:useExpandedContents:](v4, "initWithTSUFormatFormatStruct:useExpandedContents:", v6, self->mUseExpandedContents);
}

- ($37D1E9AA147035CEEFF2BA7CE0E7535D)formatStruct
{
  __int128 v3;

  v3 = *((_OWORD *)&self->var1.var7 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var1.var7.var2 = v3;
  *((_QWORD *)&retstr->var1.var7 + 3) = *(_QWORD *)&self[1].var0;
  return self;
}

- (void)p_setFormatStruct:(id *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v5 = *(_OWORD *)&a3->var1.var7.var2;
  v9 = *(_OWORD *)&a3->var0;
  v10 = v5;
  v11 = *((_QWORD *)&a3->var1.var7 + 3);
  TSUFormatStructRetain((id *)&v9);
  v6 = *(_OWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct.mData;
  v9 = *(_OWORD *)&self->mFormatStruct.mFormatType;
  v10 = v6;
  v11 = *((_QWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 3);
  TSUFormatStructRelease((id *)&v9);
  v7 = *(_OWORD *)&a3->var0;
  v8 = *(_OWORD *)&a3->var1.var7.var2;
  *((_QWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 3) = *((_QWORD *)&a3->var1.var7 + 3);
  *(_OWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct.mData = v8;
  *(_OWORD *)&self->mFormatStruct.mFormatType = v7;
}

- (unint64_t)hash
{
  NSString *mDateTimeFormat;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  if (self->mUseExpandedContents && (self->mFormatStruct.mFormatType - 270) <= 2)
  {
    mDateTimeFormat = self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat;
    if (mDateTimeFormat)
      return -[NSString hash](mDateTimeFormat, "hash") ^ self->mFormatStruct.var0.mCustomFormatStruct.mAppliedConditionKey;
  }
  v5 = *(_OWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct.mData;
  v6[0] = *(_OWORD *)&self->mFormatStruct.mFormatType;
  v6[1] = v5;
  v7 = *((_QWORD *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 3);
  return TSUFormatStructHash((unsigned int *)v6);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int mUseExpandedContents;
  int mAppliedConditionKey;
  NSString *mDateTimeFormat;
  BOOL v12;
  uint64_t v13;
  int mFormatType;
  NSString *v15;
  NSUUID *mCustomFormatKey;
  double v17;
  int v19;
  __int128 v20;
  double v21;
  int v22;
  unsigned __int8 v23;
  NSString *v24;
  unsigned __int8 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  __int128 v32;
  double v33;
  __int128 v34;
  double mIncrement;

  v5 = objc_opt_class();
  v6 = TSUSpecificCast(v5, a3);
  if (v6 || (v7 = objc_opt_class(), v8 = TSUSpecificCast(v7, a3), (v6 = v8) != 0))
  {
    mUseExpandedContents = self->mUseExpandedContents;
    if (mUseExpandedContents == objc_msgSend(v6, "useExpandedContents"))
    {
      if (self->mUseExpandedContents
        && (self->mFormatStruct.mFormatType - 270) <= 2
        && self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat
        && (objc_msgSend(v6, "formatStruct"), (v31 - 270) <= 2)
        && (objc_msgSend(v6, "formatStruct"), v30))
      {
        objc_msgSend(v6, "formatStruct");
        v28 = v26;
        v29 = v27;
        v34 = *(_OWORD *)&self->mFormatStruct.var0.mNumberFormatStruct;
        mIncrement = self->mFormatStruct.var0.mControlFormatStruct.mIncrement;
        LODWORD(v8) = TSUFormatStructCustomEqualKeys((void **)&v34, (void **)&v28);
        if (!(_DWORD)v8)
          return (char)v8;
        mAppliedConditionKey = self->mFormatStruct.var0.mCustomFormatStruct.mAppliedConditionKey;
        objc_msgSend(v6, "formatStruct");
        if (mAppliedConditionKey == v25)
        {
          mDateTimeFormat = self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat;
          objc_msgSend(v6, "formatStruct");
          v12 = mDateTimeFormat == v24;
LABEL_39:
          LOBYTE(v8) = v12;
          return (char)v8;
        }
      }
      else
      {
        objc_msgSend(v6, "formatStruct");
        mFormatType = self->mFormatStruct.mFormatType;
        if (mFormatType == v19)
        {
          LOBYTE(v8) = 1;
          mCustomFormatKey = self->mFormatStruct.var0.mCustomFormatStruct.mCustomFormatKey;
          v15 = self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat;
          v17 = self->mFormatStruct.var0.mControlFormatStruct.mIncrement;
          switch(mFormatType)
          {
            case 256:
            case 257:
            case 258:
            case 259:
              if (((v20 ^ mCustomFormatKey) & 0x1FFFFFFF) != 0)
                goto LABEL_36;
              return (char)v8;
            case 261:
              LODWORD(v8) = -[NSString isEqualToString:](self->mFormatStruct.var0.mDateFormatStruct.mDateTimeFormat, "isEqualToString:", *((_QWORD *)&v20 + 1), v17);
              if (!(_DWORD)v8)
                return (char)v8;
              if (((v20 ^ mCustomFormatKey) & 1) != 0)
                goto LABEL_36;
              v12 = ((v20 ^ mCustomFormatKey) & 2) == 0;
              break;
            case 262:
              v12 = v20 == mCustomFormatKey;
              goto LABEL_39;
            case 264:
            case 265:
              LOBYTE(v8) = 0;
              if (*(double *)&mCustomFormatKey == *(double *)&v20
                && *(double *)&v15 == *((double *)&v20 + 1)
                && v17 == v21
                && self->mFormatStruct.var0.mControlFormatStruct.mDisplayFormatType == v22)
              {
                LOBYTE(v8) = ((v23 ^ *((_BYTE *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 28)) & 3) == 0
                          && ((v23 ^ *((_BYTE *)&self->mFormatStruct.var0.mMultipleChoiceListFormatStruct + 28)) & 0xC) == 0;
              }
              return (char)v8;
            case 266:
              if ((NSUUID *)v20 != mCustomFormatKey)
                goto LABEL_36;
              if (HIDWORD(mCustomFormatKey))
                return (char)v8;
              v12 = *((_QWORD *)&v20 + 1) == (_QWORD)v15;
              goto LABEL_39;
            case 268:
              if (HIDWORD(v20) != HIDWORD(v15))
                goto LABEL_36;
              LOBYTE(v8) = 0;
              if (*(_QWORD *)((char *)&v20 + 4) != __PAIR64__(v15, HIDWORD(mCustomFormatKey)))
                return (char)v8;
              v12 = ((v20 ^ mCustomFormatKey) & 1) == 0;
              goto LABEL_39;
            case 269:
              if ((unsigned __int16)v20 != (unsigned __int16)mCustomFormatKey)
                goto LABEL_36;
              v12 = ((((unsigned __int16)v20 | (BYTE2(v20) << 16)) ^ mCustomFormatKey) & 0x10000) == 0;
              goto LABEL_39;
            case 270:
            case 271:
            case 272:
              *(_QWORD *)&v34 = self->mFormatStruct.var0.mCustomFormatStruct.mCustomFormatKey;
              *((_QWORD *)&v34 + 1) = v15;
              mIncrement = v17;
              v32 = v20;
              v33 = v21;
              LOBYTE(v8) = TSUFormatStructCustomEqualKeys((void **)&v34, (void **)&v32);
              return (char)v8;
            default:
              return (char)v8;
          }
          goto LABEL_39;
        }
      }
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUFormatObject isEqual:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFormatObject.m"), 112, 0, "The useExpandedContents flag depends on external context, and should be the same for all formats compared in that context.");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
LABEL_36:
    LOBYTE(v8) = 0;
  }
  return (char)v8;
}

- (BOOL)useExpandedContents
{
  return self->mUseExpandedContents;
}

@end

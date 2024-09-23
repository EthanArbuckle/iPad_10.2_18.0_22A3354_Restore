@implementation EDFormula

+ (id)formula
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (EDFormula)init
{
  EDFormula *v2;
  EDFormula *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EDFormula;
  v2 = -[EDFormula init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[EDFormula setupTokensWithTokensCount:tokensWithDataCount:extendedDataLength:extendedDataCount:](v2, "setupTokensWithTokensCount:tokensWithDataCount:extendedDataLength:extendedDataCount:", 0, 0, 0, 0);
  return v3;
}

- (BOOL)setupTokensWithTokensCount:(unsigned int)a3 tokensWithDataCount:(unsigned int)a4 extendedDataLength:(unsigned int)a5 extendedDataCount:(unsigned int)a6
{
  __CFData *mPackedData;
  unsigned __int16 *Mutable;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  unsigned int v17;

  mPackedData = self->mPackedData;
  Mutable = (unsigned __int16 *)mPackedData;
  if (!mPackedData)
  {
    Mutable = (unsigned __int16 *)CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    self->mPackedData = (__CFData *)Mutable;
  }
  v13 = 6 * a3;
  v14 = v13 + 4 * a4 + 2 * a6 + a5 + 20;
  if (mPackedData)
  {
    if (!Mutable)
      return (char)Mutable;
    Mutable = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)Mutable);
    if (!Mutable)
      return (char)Mutable;
    v15 = *Mutable + Mutable[2] + *(_DWORD *)(Mutable + 5) + 20;
    v16 = v14 >= v15;
    v17 = v14 - v15;
    if (v16)
      v14 = v17;
    else
      v14 = 0;
    Mutable = (unsigned __int16 *)self->mPackedData;
  }
  CFDataIncreaseLength((CFMutableDataRef)Mutable, v14);
  Mutable = (unsigned __int16 *)self->mPackedData;
  if (Mutable)
  {
    Mutable = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)Mutable);
    if (Mutable)
    {
      if (!mPackedData)
      {
        *Mutable = 0;
        *((_BYTE *)Mutable + 2) = 0;
        Mutable[2] = 0;
      }
      *(_DWORD *)(Mutable + 7) = v13;
      *(_DWORD *)(Mutable + 5) = v13;
      *(_DWORD *)(Mutable + 3) = 0;
      *((_BYTE *)Mutable + 18) &= 0xF8u;
      LOBYTE(Mutable) = 1;
    }
  }
  return (char)Mutable;
}

- (BOOL)copyTokenFromXlPtg:(XlPtg *)a3
{
  uint64_t NumberOfExtendedDataEntries;
  char *mPackedData;
  uint64_t v7;
  uint64_t v8;
  char *ExtendedData;
  char *v10;
  char *v11;
  size_t __n;

  if (a3)
  {
    NumberOfExtendedDataEntries = XlPtg::getNumberOfExtendedDataEntries(a3);
    LODWORD(mPackedData) = -[EDFormula addToken:extendedDataLength:extendedDataCount:](self, "addToken:extendedDataLength:extendedDataCount:", a3->var1, XlPtg::getTotalSizeOfExtendedData(a3), NumberOfExtendedDataEntries);
    if ((_DWORD)mPackedData)
    {
      mPackedData = (char *)self->mPackedData;
      if (mPackedData)
      {
        mPackedData = (char *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
        if (mPackedData)
        {
          if ((_DWORD)NumberOfExtendedDataEntries)
          {
            v7 = 0;
            v8 = (*(_DWORD *)(mPackedData + 6) - 1);
            do
            {
              LODWORD(__n) = 0;
              ExtendedData = XlPtg::getExtendedData(a3, v7, (unsigned int *)&__n);
              if (ExtendedData)
              {
                v10 = ExtendedData;
                v11 = -[EDFormula setExtendedDataAtIndex:extendedDataIndex:length:](self, "setExtendedDataAtIndex:extendedDataIndex:length:", v8, v7, __n);
                if (v11)
                  memcpy(v11, v10, __n);
              }
              v7 = (v7 + 1);
            }
            while ((_DWORD)NumberOfExtendedDataEntries != (_DWORD)v7);
          }
          LOBYTE(mPackedData) = 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(mPackedData) = 1;
  }
  return (char)mPackedData;
}

- (BOOL)addToken:(int)a3 extendedDataLength:(unsigned int)a4 extendedDataCount:(unsigned int)a5
{
  unsigned __int16 *mPackedData;
  __int16 v9;
  unsigned __int16 *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  CFIndex v19;
  unsigned int v20;
  int v21;
  int v22;
  unint64_t v23;

  mPackedData = (unsigned __int16 *)self->mPackedData;
  if (mPackedData)
  {
    v9 = a3;
    mPackedData = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
    {
      v10 = mPackedData;
      v11 = 2 * a5 + 4;
      if (!a5)
        v11 = 0;
      v12 = v11 + a4;
      v13 = *mPackedData;
      v14 = mPackedData[2];
      v15 = (char *)mPackedData + v13 + v14;
      v16 = (v13 + v14 + 20);
      v17 = &v15[6 * *(unsigned int *)(mPackedData + 3)] - ((char *)mPackedData + v16) + 26;
      v18 = *(unsigned int *)(mPackedData + 7);
      if (v17 <= v18)
        v19 = v12;
      else
        v19 = v12 + 6;
      v20 = v16 + *(_DWORD *)(mPackedData + 5) + v19;
      if (v20 <= CFDataGetLength(self->mPackedData)
        || (CFDataIncreaseLength(self->mPackedData, v19),
            mPackedData = (unsigned __int16 *)CFDataGetMutableBytePtr(self->mPackedData),
            (v10 = mPackedData) != 0))
      {
        if (v17 > v18)
        {
          v21 = *v10 + v10[2] + 20;
          memmove((char *)v10 + (v21 + *(_DWORD *)(v10 + 7)) + 6, (char *)v10 + (v21 + *(_DWORD *)(v10 + 7)), (*(_DWORD *)(v10 + 5) - *(_DWORD *)(v10 + 7)));
          *(int32x2_t *)(v10 + 5) = vadd_s32(*(int32x2_t *)(v10 + 5), (int32x2_t)0x600000006);
        }
        v22 = *(_DWORD *)(v10 + 3);
        *(_DWORD *)(v10 + 3) = v22 + 1;
        v23 = (unint64_t)&v10[3 * v22] + *v10 + (unint64_t)v10[2];
        *(_WORD *)(v23 + 20) = v9;
        *(_DWORD *)(v23 + 22) = -1;
        if (a5)
          -[EDFormula setupExtendedDataForTokenAtIndex:extendedDataLength:extendedDataCount:](self, "setupExtendedDataForTokenAtIndex:extendedDataLength:extendedDataCount:");
        LOBYTE(mPackedData) = 1;
      }
    }
  }
  return (char)mPackedData;
}

- (void)setupExtendedDataForTokenAtIndex:(unsigned int)a3 extendedDataLength:(unsigned int)a4 extendedDataCount:(unsigned int)a5
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v11;
  unsigned int v12;
  UInt8 *v13;
  unsigned int v14;
  _WORD *v15;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
    {
      v11 = MutableBytePtr;
      v12 = *(unsigned __int16 *)MutableBytePtr
          + *((unsigned __int16 *)MutableBytePtr + 2)
          + *(_DWORD *)(MutableBytePtr + 10)
          + 20;
      if (v12 + a4 + 2 * a5 + 4 > CFDataGetLength(self->mPackedData))
      {
        CFDataIncreaseLength(self->mPackedData, a4 + 2 * a5 + 4);
        v11 = CFDataGetMutableBytePtr(self->mPackedData);
      }
      v13 = &v11[v12];
      *(_WORD *)v13 = a4;
      *((_WORD *)v13 + 1) = a5;
      *(_DWORD *)&v11[6 * a3 + 22 + *(unsigned __int16 *)v11 + (unint64_t)*((unsigned __int16 *)v11 + 2)] = v12 - (*(unsigned __int16 *)v11 + *((unsigned __int16 *)v11 + 2) + *(_DWORD *)(v11 + 14)) - 20;
      *(_DWORD *)(v11 + 10) += a4 + 2 * a5 + 4;
      if (a5)
      {
        v14 = 0;
        v15 = v13 + 6;
        do
        {
          *(v15 - 1) = 0;
          v15 += v14++ < a5 - 1;
        }
        while (a5 != v14);
      }
    }
  }
}

- (char)setExtendedDataAtIndex:(unsigned int)a3 extendedDataIndex:(unsigned int)a4 length:(unsigned int)a5
{
  uint64_t v7;
  char *result;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unsigned __int16 *v14;
  _WORD *v15;
  int v16;
  unsigned __int16 *v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  size_t v23;
  UInt8 *MutableBytePtr;
  unint64_t v25;
  unsigned __int16 *v26;
  unsigned int v27;
  unsigned int v28;
  _WORD *v29;
  _WORD *v30;

  v7 = *(_QWORD *)&a3;
  result = -[EDFormula tokenAtIndex:](self, "tokenAtIndex:");
  if (result)
  {
    v10 = result;
    if (*(_DWORD *)(result + 2) == -1)
      return 0;
    result = (char *)self->mPackedData;
    if (!result)
      return result;
    result = (char *)CFDataGetMutableBytePtr((CFMutableDataRef)result);
    if (!result)
      return result;
    v11 = *(unsigned int *)(result + 14);
    v12 = *(unsigned int *)(v10 + 2);
    v13 = &result[v11 + *(unsigned __int16 *)result + *((unsigned __int16 *)result + 2) + v12];
    if (*((unsigned __int16 *)v13 + 11) <= a4)
      return 0;
    v14 = (unsigned __int16 *)(v13 + 20);
    v15 = v13 + 26;
    v16 = 0;
    if (a4)
    {
      v17 = v14 + 2;
      v18 = a4;
      do
      {
        v19 = *v17;
        v16 += v19;
        v17 = (_WORD *)((char *)v15 + v19);
        v15 = v17 + 1;
        --v18;
      }
      while (v18);
    }
    *(v15 - 1) = a5;
    v20 = v16 + a5;
    v21 = *v14;
    if (v20 > v21)
    {
      v22 = (_DWORD)v11
          + (_DWORD)v12
          + *(unsigned __int16 *)result
          + *((unsigned __int16 *)result + 2)
          + 24;
      v23 = v21 + 2 * v14[1];
      -[EDFormula setupExtendedDataForTokenAtIndex:extendedDataLength:extendedDataCount:](self, "setupExtendedDataForTokenAtIndex:extendedDataLength:extendedDataCount:", v7);
      MutableBytePtr = CFDataGetMutableBytePtr(self->mPackedData);
      v25 = (unint64_t)&MutableBytePtr[*(unsigned __int16 *)MutableBytePtr
                                            + 20
                                            + (unint64_t)*((unsigned __int16 *)MutableBytePtr + 2)];
      v14 = (unsigned __int16 *)(v25
                               + *(unsigned int *)(MutableBytePtr + 14)
                               + *(unsigned int *)(v25 + 6 * v7 + 2));
      v26 = v14 + 2;
      memcpy(v14 + 2, &MutableBytePtr[v22], v23);
      v15 = v14 + 3;
      if (a4)
      {
        v27 = a4;
        do
        {
          v26 = (_WORD *)((char *)v15 + *v26);
          v15 = v26 + 1;
          --v27;
        }
        while (v27);
      }
    }
    v28 = a4 + 1;
    if (a4 + 1 < v14[1])
    {
      v29 = v15;
      do
      {
        v30 = (_WORD *)((char *)v29 + (unsigned __int16)*(v29 - 1));
        *v30 = 0;
        v29 = v30 + 1;
        ++v28;
      }
      while (v28 < v14[1]);
    }
    bzero(v15, a5);
    if (a5)
      return (char *)v15;
    else
      return 0;
  }
  return result;
}

- (EDToken)tokenAtIndex:(unsigned int)a3
{
  EDToken *result;

  result = (EDToken *)self->mPackedData;
  if (result)
  {
    result = (EDToken *)CFDataGetMutableBytePtr((CFMutableDataRef)result);
    if (result)
    {
      if (*(unsigned int *)((char *)&result->var1 + 2) <= a3)
        return 0;
      else
        return (EDToken *)((char *)result + 6 * a3 + result->var0 + (unint64_t)LOWORD(result->var1) + 20);
    }
  }
  return result;
}

- (unsigned)tokenCount
{
  char *mPackedData;

  mPackedData = (char *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (char *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
      LODWORD(mPackedData) = *(_DWORD *)(mPackedData + 6);
  }
  return mPackedData;
}

- (int)tokenTypeAtIndex:(unsigned int)a3
{
  EDToken *v3;

  v3 = -[EDFormula tokenAtIndex:](self, "tokenAtIndex:", *(_QWORD *)&a3);
  if (v3)
    LODWORD(v3) = v3->var0;
  return (int)v3;
}

- (char)lastExtendedDataForTokenAtIndex:(unsigned int)a3 length:(unsigned int *)a4
{
  char *result;
  char *v7;
  char *v8;
  int v9;
  char *v10;
  uint64_t v11;
  char *v12;
  unsigned int v13;

  *a4 = 0;
  result = -[EDFormula tokenAtIndex:](self, "tokenAtIndex:", *(_QWORD *)&a3);
  if (result)
  {
    v7 = result;
    if (*(_DWORD *)(result + 2) == -1)
      return 0;
    result = (char *)self->mPackedData;
    if (result)
    {
      result = (char *)CFDataGetMutableBytePtr((CFMutableDataRef)result);
      if (result)
      {
        v8 = &result[*(unsigned int *)(result + 14)
                   + *(unsigned __int16 *)result
                   + (unint64_t)*((unsigned __int16 *)result + 2)
                   + *(unsigned int *)(v7 + 2)];
        v9 = *((unsigned __int16 *)v8 + 11);
        if (*((_WORD *)v8 + 11))
        {
          v10 = v8 + 20;
          v11 = *((unsigned __int16 *)v8 + 12);
          result = v10 + 6;
          while (--v9)
          {
            v12 = &result[v11];
            v13 = *(unsigned __int16 *)v12;
            result = v12 + 2;
            v11 = v13;
          }
          *a4 = v11;
          return result;
        }
        return 0;
      }
    }
  }
  return result;
}

- (void)updateContainsRelativeReferences:(BOOL)a3
{
  __CFData *mPackedData;
  _BOOL4 v4;
  UInt8 *MutableBytePtr;
  UInt8 v6;
  char v7;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    v4 = a3;
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
    {
      v6 = MutableBytePtr[18];
      if (v4 | ((v6 & 2) >> 1))
        v7 = 2;
      else
        v7 = 0;
      MutableBytePtr[18] = v7 | v6 & 0xFD;
    }
  }
}

- (void)setCleaned:(BOOL)a3
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
      MutableBytePtr[18] = MutableBytePtr[18] & 0xFE | a3;
  }
}

- (id)warning
{
  if (-[EDFormula warningType](self, "warningType"))
    return (id)kWarningMessageUnsupportedFormulas;
  else
    return 0;
}

- (int)warningType
{
  unsigned __int8 *mPackedData;

  mPackedData = (unsigned __int8 *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
      LODWORD(mPackedData) = mPackedData[2];
  }
  return (int)mPackedData;
}

- (BOOL)isContainsRelativeReferences
{
  unsigned __int8 *mPackedData;

  mPackedData = (unsigned __int8 *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
      LODWORD(mPackedData) = (mPackedData[18] >> 1) & 1;
  }
  return (char)mPackedData;
}

- (EDFormula)initWithFormula:(id)a3
{
  CFDataRef *v4;
  EDFormula *v5;
  objc_super v7;

  v4 = (CFDataRef *)a3;
  v7.receiver = self;
  v7.super_class = (Class)EDFormula;
  v5 = -[EDFormula init](&v7, sel_init);
  if (v5)
    v5->mPackedData = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v4[1]);

  return v5;
}

- (void)dealloc
{
  __CFData *mPackedData;
  objc_super v4;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    CFRelease(mPackedData);
    self->mPackedData = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)EDFormula;
  -[EDFormula dealloc](&v4, sel_dealloc);
}

- (BOOL)isSupportedFormula
{
  __CFData *mPackedData;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (__CFData *)CFDataGetMutableBytePtr(mPackedData);
    if (mPackedData)
      LOBYTE(mPackedData) = *((_BYTE *)mPackedData + 2) == 0;
  }
  return (char)mPackedData;
}

- (BOOL)isCleaned
{
  __CFData *mPackedData;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (__CFData *)CFDataGetMutableBytePtr(mPackedData);
    if (mPackedData)
      LOBYTE(mPackedData) = *((_BYTE *)mPackedData + 18) & 1;
  }
  return (char)mPackedData;
}

- (void)setWarning:(int)a3
{
  __CFData *mPackedData;
  UInt8 v4;
  UInt8 *MutableBytePtr;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    v4 = a3;
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
      MutableBytePtr[2] = v4;
  }
}

- (void)removeAllTokens
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
    {
      *(_QWORD *)(MutableBytePtr + 6) = 0;
      *(_DWORD *)(MutableBytePtr + 14) = 0;
      MutableBytePtr[18] &= 0xF8u;
    }
  }
}

- (BOOL)replaceTokenAtIndex:(unsigned int)a3 withFormula:(id)a4 formulaTokenIndex:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  CFMutableDataRef *v8;
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int16 *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  size_t v23;
  int v24;
  char *v25;
  char *v26;
  unsigned int v27;
  char *v28;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = (CFMutableDataRef *)a4;
  mPackedData = self->mPackedData;
  if (mPackedData
    && (MutableBytePtr = CFDataGetMutableBytePtr(mPackedData)) != 0
    && (v11 = CFDataGetMutableBytePtr(v8[1])) != 0)
  {
    v12 = (unint64_t)&v11[*(unsigned __int16 *)v11 + 20 + (unint64_t)*((unsigned __int16 *)v11 + 2)];
    v13 = *(unsigned int *)(v12 + 6 * v5 + 2);
    if ((_DWORD)v13 == -1)
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
    }
    else
    {
      v14 = (unsigned __int16 *)(v12 + *(unsigned int *)(v11 + 14) + v13);
      v15 = v14[1];
      v16 = *v14;
    }
    v18 = *(unsigned __int16 *)MutableBytePtr;
    v19 = *((unsigned __int16 *)MutableBytePtr + 2);
    v20 = -[CFMutableDataRef tokenTypeAtIndex:](v8, "tokenTypeAtIndex:", v5);
    v21 = (uint64_t)&MutableBytePtr[6 * v6 + v18 + v19];
    *(_WORD *)(v21 + 20) = v20;
    *(_DWORD *)(v21 + 22) = -1;
    -[EDFormula setupExtendedDataForTokenAtIndex:extendedDataLength:extendedDataCount:](self, "setupExtendedDataForTokenAtIndex:extendedDataLength:extendedDataCount:", v6, v16, v15);
    if ((_DWORD)v15)
    {
      v22 = 0;
      do
      {
        v23 = v14[2];
        if ((_DWORD)v22)
        {
          v24 = v22;
          v25 = (char *)(v14 + 3);
          do
          {
            v26 = &v25[v23];
            v27 = *(unsigned __int16 *)v26;
            v25 = v26 + 2;
            v23 = v27;
            --v24;
          }
          while (v24);
          if (v23)
          {
LABEL_16:
            v28 = -[EDFormula setExtendedDataAtIndex:extendedDataIndex:length:](self, "setExtendedDataAtIndex:extendedDataIndex:length:", v6, v22, v23);
            if (v28)
              memcpy(v28, v25, v23);
          }
        }
        else
        {
          v25 = (char *)(v14 + 3);
          if (v14[2])
            goto LABEL_16;
        }
        v22 = (v22 + 1);
      }
      while ((_DWORD)v22 != (_DWORD)v15);
    }
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)isCleanedWithEvaluationStack
{
  unsigned __int8 *mPackedData;

  mPackedData = (unsigned __int8 *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
      LODWORD(mPackedData) = (mPackedData[18] >> 2) & 1;
  }
  return (char)mPackedData;
}

- (void)updateCleanedWithEvaluationStack:(BOOL)a3
{
  __CFData *mPackedData;
  _BOOL4 v4;
  UInt8 *MutableBytePtr;
  UInt8 v6;
  char v7;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    v4 = a3;
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
    {
      v6 = MutableBytePtr[18];
      if (v4 | ((v6 & 4) >> 2))
        v7 = 4;
      else
        v7 = 0;
      MutableBytePtr[18] = v7 | v6 & 0xFB;
    }
  }
}

- (char)addToken:(int)a3 extendedDataLength:(unsigned int)a4
{
  uint64_t v4;
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;

  v4 = *(_QWORD *)&a4;
  if (-[EDFormula addToken:extendedDataLength:extendedDataCount:](self, "addToken:extendedDataLength:extendedDataCount:", *(_QWORD *)&a3, *(_QWORD *)&a4, a4 != 0)&& (mPackedData = self->mPackedData) != 0&& (MutableBytePtr = CFDataGetMutableBytePtr(mPackedData)) != 0)
  {
    return -[EDFormula setExtendedDataAtIndex:extendedDataIndex:length:](self, "setExtendedDataAtIndex:extendedDataIndex:length:", (*(_DWORD *)(MutableBytePtr + 6) - 1), 0, v4);
  }
  else
  {
    return 0;
  }
}

- (BOOL)copyTokenAtIndex:(unsigned int)a3 fromFormula:(id)a4
{
  uint64_t v4;
  __CFData **v6;
  __CFData **v7;
  __CFData *v8;
  UInt8 *MutableBytePtr;
  unint64_t v10;
  uint64_t v11;
  unsigned __int16 *v12;
  uint64_t v13;
  uint64_t v14;
  __CFData *mPackedData;
  UInt8 *v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  int v20;
  char *v21;
  char *v22;
  unsigned int v23;
  char *v24;
  BOOL v25;

  v4 = *(_QWORD *)&a3;
  v6 = (__CFData **)a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6[1];
    if (v8)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(v8);
      if (MutableBytePtr)
      {
        v10 = (unint64_t)&MutableBytePtr[*(unsigned __int16 *)MutableBytePtr
                                              + 20
                                              + (unint64_t)*((unsigned __int16 *)MutableBytePtr + 2)];
        v11 = *(unsigned int *)(v10 + 6 * v4 + 2);
        if ((_DWORD)v11 == -1)
        {
          v12 = 0;
          v13 = 0;
          v14 = 0;
        }
        else
        {
          v12 = (unsigned __int16 *)(v10 + *(unsigned int *)(MutableBytePtr + 14) + v11);
          v13 = v12[1];
          v14 = *v12;
        }
        if (!-[EDFormula addToken:extendedDataLength:extendedDataCount:](self, "addToken:extendedDataLength:extendedDataCount:", objc_msgSend(v7, "tokenTypeAtIndex:", v4), v14, v13)|| (mPackedData = self->mPackedData) == 0|| (v16 = CFDataGetMutableBytePtr(mPackedData)) == 0)
        {
          v25 = 0;
          goto LABEL_24;
        }
        if ((_DWORD)v13)
        {
          v17 = 0;
          v18 = (*(_DWORD *)(v16 + 6) - 1);
          while (1)
          {
            v19 = v12[2];
            if ((_DWORD)v17)
            {
              v20 = v17;
              v21 = (char *)(v12 + 3);
              do
              {
                v22 = &v21[v19];
                v23 = *(unsigned __int16 *)v22;
                v21 = v22 + 2;
                v19 = v23;
                --v20;
              }
              while (v20);
              if (v19)
              {
LABEL_18:
                v24 = -[EDFormula setExtendedDataAtIndex:extendedDataIndex:length:](self, "setExtendedDataAtIndex:extendedDataIndex:length:", v18, v17, v19);
                if (v24)
                  memcpy(v24, v21, v19);
              }
            }
            else
            {
              v21 = (char *)(v12 + 3);
              if (v12[2])
                goto LABEL_18;
            }
            v17 = (v17 + 1);
            v25 = 1;
            if ((_DWORD)v17 == (_DWORD)v13)
              goto LABEL_24;
          }
        }
      }
    }
  }
  v25 = 1;
LABEL_24:

  return v25;
}

- (void)setOriginalFormulaString:(id)a3
{
  id v4;
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  int v7;
  UInt8 *v8;
  __int16 v9;

  v4 = a3;
  if (!((unint64_t)objc_msgSend(v4, "length") >> 16))
  {
    mPackedData = self->mPackedData;
    if (mPackedData)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
      if (MutableBytePtr)
      {
        v7 = *(unsigned __int16 *)MutableBytePtr;
        v9 = 0;
        +[ECPackedDataUtils writeString:toPackedData:packedDataSize:atIndex:withPreviousLength:outLength:](ECPackedDataUtils, "writeString:toPackedData:packedDataSize:atIndex:withPreviousLength:outLength:", v4, self->mPackedData, v7 + *((unsigned __int16 *)MutableBytePtr + 2) + *(_DWORD *)(MutableBytePtr + 10) + 20, 20);
        v8 = CFDataGetMutableBytePtr(self->mPackedData);
        *(_WORD *)v8 = v9;
      }
    }
  }

}

- (id)originalFormulaString
{
  __CFData *mPackedData;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (__CFData *)CFDataGetMutableBytePtr(mPackedData);
    if (mPackedData)
    {
      +[ECPackedDataUtils readStringFromData:atOffset:withLength:](ECPackedDataUtils, "readStringFromData:atOffset:withLength:", mPackedData, 20, *(unsigned __int16 *)mPackedData);
      mPackedData = (__CFData *)objc_claimAutoreleasedReturnValue();
    }
  }
  return mPackedData;
}

- (void)setWarningParameter:(id)a3
{
  id v4;
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  int v7;
  int v8;
  UInt8 *v9;
  __int16 v10;

  v4 = a3;
  if (!((unint64_t)objc_msgSend(v4, "length") >> 16))
  {
    mPackedData = self->mPackedData;
    if (mPackedData)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
      if (MutableBytePtr)
      {
        v7 = *((unsigned __int16 *)MutableBytePtr + 2);
        v8 = *(unsigned __int16 *)MutableBytePtr + 20;
        v10 = 0;
        +[ECPackedDataUtils writeString:toPackedData:packedDataSize:atIndex:withPreviousLength:outLength:](ECPackedDataUtils, "writeString:toPackedData:packedDataSize:atIndex:withPreviousLength:outLength:", v4, self->mPackedData, (v8 + v7 + *(_DWORD *)(MutableBytePtr + 10)));
        v9 = CFDataGetMutableBytePtr(self->mPackedData);
        *((_WORD *)v9 + 2) = v10;
      }
    }
  }

}

- (BOOL)removeTokenAtIndex:(unsigned int)a3
{
  unsigned __int16 *mPackedData;
  unsigned __int16 *v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned __int16 *v10;
  int v11;
  uint64_t v12;
  int v13;

  mPackedData = (unsigned __int16 *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
    {
      v5 = mPackedData;
      v6 = *(_DWORD *)(mPackedData + 3);
      if (v6 <= a3)
      {
        LOBYTE(mPackedData) = 0;
      }
      else
      {
        v7 = (unint64_t)mPackedData + *mPackedData + (unint64_t)mPackedData[2] + 20;
        v8 = v7 + 6 * a3;
        v9 = *(unsigned int *)(v8 + 2);
        if ((_DWORD)v9 == -1)
          v10 = 0;
        else
          v10 = (unsigned __int16 *)(v7 + *(unsigned int *)(v5 + 7) + v9);
        v11 = v6 - 1;
        if (v11 != a3)
        {
          memmove((void *)v8, (const void *)(v8 + 6), 6 * (v11 - a3));
          v11 = *(_DWORD *)(v5 + 3) - 1;
        }
        *(_DWORD *)(v5 + 3) = v11;
        if (v10)
        {
          v12 = *v10 + 2 * v10[1] + 4;
          v13 = *(_DWORD *)(v5 + 5);
          if ((char *)v5 + *v5 + v5[2] + v13 + 20 == (char *)v10 + v12)
            *(_DWORD *)(v5 + 5) = v13 - v12;
        }
        LOBYTE(mPackedData) = 1;
      }
    }
  }
  return (char)mPackedData;
}

- (BOOL)addArrayWithCol:(int)a3 andRow:(int)a4
{
  char *v7;
  char *v8;
  int v9;

  -[EDFormula addToken:extendedDataLength:extendedDataCount:](self, "addToken:extendedDataLength:extendedDataCount:", 96, 8, (a3 + 1 + (a3 + 1) * a4 + 2));
  v7 = -[EDFormula setExtendedDataForLastTokenAtIndex:length:](self, "setExtendedDataForLastTokenAtIndex:length:", 0, 4);
  v8 = -[EDFormula setExtendedDataForLastTokenAtIndex:length:](self, "setExtendedDataForLastTokenAtIndex:length:", 1, 4);
  if (a3 <= 255)
    v9 = a3;
  else
    v9 = 0;
  *(_DWORD *)v7 = v9;
  *(_DWORD *)v8 = a4;
  return 1;
}

- (char)setExtendedDataForLastTokenAtIndex:(unsigned int)a3 length:(unsigned int)a4
{
  return -[EDFormula setExtendedDataAtIndex:extendedDataIndex:length:](self, "setExtendedDataAtIndex:extendedDataIndex:length:", -[EDFormula tokenCount](self, "tokenCount") - 1, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (char)extendedDataForTokenAtIndex:(unsigned int)a3 extendedDataIndex:(unsigned int)a4 length:(unsigned int *)a5
{
  char *result;
  char *v9;
  char *v10;
  BOOL v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unsigned int v15;

  *a5 = 0;
  result = -[EDFormula tokenAtIndex:](self, "tokenAtIndex:", *(_QWORD *)&a3);
  if (result)
  {
    v9 = result;
    if (*(_DWORD *)(result + 2) == -1)
      return 0;
    result = (char *)self->mPackedData;
    if (result)
    {
      result = (char *)CFDataGetMutableBytePtr((CFMutableDataRef)result);
      if (result)
      {
        v10 = &result[*(unsigned int *)(result + 14)
                    + *(unsigned __int16 *)result
                    + (unint64_t)*((unsigned __int16 *)result + 2)
                    + *(unsigned int *)(v9 + 2)];
        if (*((_WORD *)v10 + 11))
          v11 = *((unsigned __int16 *)v10 + 11) > a4;
        else
          v11 = 0;
        if (!v11)
          return 0;
        v12 = v10 + 20;
        v13 = *((unsigned __int16 *)v10 + 12);
        for (result = v12 + 6; a4; --a4)
        {
          v14 = &result[v13];
          v15 = *(unsigned __int16 *)v14;
          result = v14 + 2;
          v13 = v15;
        }
        *a5 = v13;
      }
    }
  }
  return result;
}

- (void)replaceTokenTypeAtIndex:(unsigned int)a3 withType:(int)a4
{
  unsigned __int16 v4;
  EDToken *v5;

  v4 = a4;
  v5 = -[EDFormula tokenAtIndex:](self, "tokenAtIndex:", *(_QWORD *)&a3);
  if (v5)
    v5->var0 = v4;
}

- (unsigned)countExtendedDataForTokenAtIndex:(unsigned int)a3
{
  EDToken *mPackedData;
  EDToken *v5;

  mPackedData = -[EDFormula tokenAtIndex:](self, "tokenAtIndex:", *(_QWORD *)&a3);
  if (mPackedData)
  {
    v5 = mPackedData;
    if (*(_DWORD *)(&mPackedData->var0 + 1) == -1)
    {
      LODWORD(mPackedData) = 0;
    }
    else
    {
      mPackedData = (EDToken *)self->mPackedData;
      if (mPackedData)
      {
        mPackedData = (EDToken *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
        if (mPackedData)
          LODWORD(mPackedData) = *(unsigned __int16 *)((char *)&mPackedData[2].var1
                                                     + *(unsigned int *)((char *)&mPackedData[1].var1 + 2)
                                                     + mPackedData->var0
                                                     + (unint64_t)LOWORD(mPackedData->var1)
                                                     + *(unsigned int *)(&v5->var0 + 1)
                                                     + 2);
      }
    }
  }
  return mPackedData;
}

- (BOOL)replaceTokenAtIndex:(unsigned int)a3 withFormula:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  EDFormula *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  BOOL v16;
  __CFData *mPackedData;
  __CFData *MutableCopy;

  v6 = a4;
  if (-[EDFormula tokenCount](self, "tokenCount") <= a3
    || (-[EDFormula warning](self, "warning"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v8 = 0;
  }
  else
  {
    v10 = objc_alloc_init(EDFormula);
    if (!v10)
      goto LABEL_24;
    if (a3)
    {
      v11 = 0;
      v12 = 0;
      do
      {
        if (!-[EDFormula copyTokenAtIndex:fromFormula:](v10, "copyTokenAtIndex:fromFormula:", v12, self))
          break;
        v12 = (v12 + 1);
        v11 = v12 >= a3;
      }
      while (a3 != (_DWORD)v12);
    }
    else
    {
      v11 = 1;
    }
    v13 = 0;
    while ((v11 & (v13 < objc_msgSend(v6, "tokenCount"))) != 0)
    {
      v14 = -[EDFormula copyTokenAtIndex:fromFormula:](v10, "copyTokenAtIndex:fromFormula:", v13, v6);
      v13 = (v13 + 1);
      if (!v14)
      {
        v11 = 0;
        break;
      }
    }
    v15 = a3 + 1;
    while ((v11 & (v15 < -[EDFormula tokenCount](self, "tokenCount"))) != 0)
    {
      v16 = -[EDFormula copyTokenAtIndex:fromFormula:](v10, "copyTokenAtIndex:fromFormula:", v15, self);
      v15 = (v15 + 1);
      if (!v16)
        goto LABEL_24;
    }
    if (v11)
    {
      mPackedData = self->mPackedData;
      if (mPackedData)
        CFRelease(mPackedData);
      MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v10->mPackedData);
      self->mPackedData = MutableCopy;
      v8 = MutableCopy != 0;
    }
    else
    {
LABEL_24:
      v8 = 0;
    }

  }
  return v8;
}

- (void)populateXlPtg:(XlPtg *)a3 index:(unsigned int)a4
{
  __CFData *mPackedData;
  uint64_t v6;
  UInt8 *MutableBytePtr;
  UInt8 *v9;
  EDToken *v10;
  uint64_t v11;
  UInt8 *v12;
  char *v13;
  int v14;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    v6 = *(_QWORD *)&a4;
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (a3)
    {
      v9 = MutableBytePtr;
      if (MutableBytePtr)
      {
        XlPtg::XlPtg(a3);
        v10 = -[EDFormula tokenAtIndex:](self, "tokenAtIndex:", v6);
        if (v10)
        {
          a3->var1 = v10->var0;
          v11 = *(unsigned int *)(&v10->var0 + 1);
          if ((_DWORD)v11 != -1)
          {
            v12 = &v9[*(unsigned int *)(v9 + 14)
                    + *(unsigned __int16 *)v9
                    + (unint64_t)*((unsigned __int16 *)v9 + 2)
                    + v11];
            v14 = *((unsigned __int16 *)v12 + 10);
            v13 = (char *)(v12 + 20);
            if (v14)
            {
              if (*((_WORD *)v13 + 1))
                XlPtg::setExtendedData(a3, v13 + 4, *((_WORD *)v13 + 1));
            }
          }
        }
      }
    }
  }
}

- (void)xlPtgs
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;
  UInt8 *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  XlPtg *v10;
  unint64_t v11;
  XlPtg **v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  char *v18;
  unsigned int v19;
  uint64_t v20;
  XlPtg **v21;
  char *v22;
  char *v23;
  XlPtg *v24;
  uint64_t v25;
  UInt8 *v26;
  unsigned __int16 v27;
  unsigned int v28;
  char *v29;
  unsigned int v30;
  char *v31;
  char *v32;
  unsigned int v33;

  mPackedData = self->mPackedData;
  if (!mPackedData)
    return 0;
  MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
  if (!MutableBytePtr)
    return 0;
  v4 = MutableBytePtr;
  v5 = *(unsigned int *)(MutableBytePtr + 6);
  if (!(_DWORD)v5)
    return 0;
  v6 = (void **)operator new();
  v7 = 0;
  *v6 = 0;
  v6[1] = 0;
  v6[2] = 0;
  do
  {
    v8 = (unint64_t)&v4[*(unsigned __int16 *)v4 + 20 + (unint64_t)*((unsigned __int16 *)v4 + 2)];
    v9 = *(unsigned __int16 *)(v8 + 6 * v7);
    v10 = (XlPtg *)operator new();
    XlPtg::XlPtg((uint64_t)v10, v9);
    v12 = (XlPtg **)v6[1];
    v11 = (unint64_t)v6[2];
    if ((unint64_t)v12 >= v11)
    {
      v14 = (char *)v12 - (_BYTE *)*v6;
      v15 = (v11 - (unint64_t)*v6) >> 3;
      v16 = 2 * v15;
      if (2 * (int)v15 <= (v14 >> 3) + 1)
        v16 = (v14 >> 3) + 1;
      if (v15 >= 0x7FFFFFFF)
        v17 = 0xFFFFFFFFLL;
      else
        v17 = v16;
      if ((_DWORD)v17)
      {
        v18 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>((uint64_t)(v6 + 2), v17);
        v20 = v19;
      }
      else
      {
        v18 = 0;
        v20 = 0;
      }
      v21 = (XlPtg **)&v18[v14 & 0x7FFFFFFF8];
      *v21 = v10;
      v13 = v21 + 1;
      v23 = (char *)*v6;
      v22 = (char *)v6[1];
      if (v22 != *v6)
      {
        do
        {
          v24 = (XlPtg *)*((_QWORD *)v22 - 1);
          v22 -= 8;
          *--v21 = v24;
        }
        while (v22 != v23);
        v22 = (char *)*v6;
      }
      *v6 = v21;
      v6[1] = v13;
      v6[2] = &v18[8 * v20];
      if (v22)
        operator delete(v22);
    }
    else
    {
      *v12 = v10;
      v13 = v12 + 1;
    }
    v6[1] = v13;
    v25 = *(unsigned int *)(v8 + 6 * v7 + 2);
    if ((_DWORD)v25 != -1)
    {
      v26 = &v4[*(unsigned int *)(v4 + 14)
              + 20
              + *(unsigned __int16 *)v4
              + (unint64_t)*((unsigned __int16 *)v4 + 2)
              + v25];
      if (*(_WORD *)v26)
      {
        v27 = *(_WORD *)&v4[*(unsigned int *)(v4 + 14)
                          + 22
                          + *(unsigned __int16 *)v4
                          + (unint64_t)*((unsigned __int16 *)v4 + 2)
                          + v25];
        if (*((_WORD *)v26 + 1))
        {
          v28 = 0;
          v29 = (char *)(v26 + 6);
          v30 = *((unsigned __int16 *)v26 + 2);
          do
          {
            if (v30)
            {
              v31 = XlPtg::addDataItem(v10, v30);
              memcpy(v31, v29, v30);
              v27 = *((_WORD *)v26 + 1);
            }
            if (v28 < v27 - 1)
            {
              v32 = &v29[v30];
              v33 = *(unsigned __int16 *)v32;
              v29 = v32 + 2;
              v30 = v33;
            }
            ++v28;
          }
          while (v28 < v27);
        }
      }
    }
    ++v7;
  }
  while (v7 != v5);
  return v6;
}

- (BOOL)convertTokensToSharedAtRow:(unsigned int)a3 column:(unsigned int)a4
{
  unsigned __int16 *mPackedData;
  char v5;
  __int16 v6;
  unsigned __int16 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  _WORD *v15;
  unsigned int v16;
  uint64_t v17;

  mPackedData = (unsigned __int16 *)self->mPackedData;
  if (mPackedData)
  {
    v5 = a4;
    v6 = a3;
    mPackedData = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
    {
      v7 = mPackedData;
      v8 = *(unsigned int *)(mPackedData + 3);
      if (!(_DWORD)v8)
      {
        LOBYTE(mPackedData) = 0;
        return (char)mPackedData;
      }
      v9 = 0;
      v10 = 6 * v8;
      while (1)
      {
        v11 = (char *)v7 + *v7 + (unint64_t)v7[2];
        v12 = &v11[v9];
        v13 = *(unsigned int *)&v11[v9 + 22];
        if ((_DWORD)v13 == -1)
          goto LABEL_19;
        v14 = &v11[*(unsigned int *)(v7 + 7) + 20 + v13];
        if (!*(_WORD *)v14 || !*((_WORD *)v14 + 1))
          goto LABEL_19;
        v15 = v14 + 6;
        v16 = *((unsigned __int16 *)v12 + 10);
        if (v16 <= 0x44)
          break;
        switch(v16)
        {
          case 'e':
            goto LABEL_16;
          case 'd':
            goto LABEL_17;
          case 'E':
            goto LABEL_16;
        }
LABEL_19:
        v9 += 6;
        if (v10 == v9)
        {
          LOBYTE(mPackedData) = 1;
          return (char)mPackedData;
        }
      }
      if (v16 == 36)
      {
LABEL_17:
        v17 = 8;
      }
      else if (v16 == 37)
      {
LABEL_16:
        adjustRowAndColumn(v15, (unsigned __int16 *)v14 + 5, v6, v5);
        v15 = v14 + 8;
        v17 = 12;
      }
      else
      {
        v17 = 8;
        if (v16 != 68)
          goto LABEL_19;
      }
      adjustRowAndColumn(v15, (unsigned __int16 *)&v14[v17], v6, v5);
      *((_WORD *)v12 + 10) = v16 + 8;
      goto LABEL_19;
    }
  }
  return (char)mPackedData;
}

- (id)warningParameter
{
  unsigned __int16 *mPackedData;

  mPackedData = (unsigned __int16 *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
    {
      +[ECPackedDataUtils readStringFromData:atOffset:withLength:](ECPackedDataUtils, "readStringFromData:atOffset:withLength:", mPackedData, *mPackedData + 20, mPackedData[2]);
      mPackedData = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
    }
  }
  return mPackedData;
}

- (BOOL)isSharedFormula
{
  return 0;
}

- (BOOL)isBaseFormula
{
  return 0;
}

- (unsigned)firstTokenIndexForArgAtIndex:(unsigned int)a3
{
  id v3;
  void *v4;
  id v5;
  unsigned int v6;

  +[EDTokenTree buildSubtree:formula:](EDTokenTree, "buildSubtree:formula:", *(_QWORD *)&a3, self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    while (1)
    {
      objc_msgSend(v3, "firstChild");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
        break;
      v5 = v4;

      v3 = v5;
    }
  }
  v6 = objc_msgSend(v3, "tokenIndex");

  return v6;
}

- (id)saveArgs:(unsigned int)a3 andDelete:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  if (a3)
  {
    v4 = a4;
    +[EDFormula formula](EDFormula, "formula");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EDFormula tokenCount](self, "tokenCount");
    LODWORD(v9) = v8;
    if (v8)
    {
      v10 = 0;
      v11 = v8 - 1;
      v12 = v8 - 1;
      while (1)
      {
        v13 = -[EDFormula firstTokenIndexForArgAtIndex:](self, "firstTokenIndexForArgAtIndex:", v12 - (v10 != 0));
        v12 = v13;
        if (!(_DWORD)v13)
          break;
        if (a3 == ++v10)
        {
          if (v13 > v11)
            goto LABEL_9;
          break;
        }
      }
      v14 = v13;
      do
      {
        objc_msgSend(v7, "copyTokenAtIndex:fromFormula:", v14, self);
        v14 = (v14 + 1);
      }
      while ((_DWORD)v9 != (_DWORD)v14);
LABEL_9:
      if (v4 && (int)v11 >= v12)
      {
        do
        {
          v9 = (v9 - 1);
          -[EDFormula removeTokenAtIndex:](self, "removeTokenAtIndex:", v9);
        }
        while ((int)v9 > v12);
      }
      v15 = v7;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (BOOL)insertExternalName:(unint64_t)a3 withLink:(unint64_t)a4 atIndex:(unsigned int)a5
{
  __int16 v5;
  __int16 v6;
  void *v8;
  char *v9;
  char *v10;
  int v11;
  uint64_t v12;

  v5 = a4;
  v6 = a3;
  if (a5)
  {
    -[EDFormula saveArgs:andDelete:](self, "saveArgs:andDelete:", *(_QWORD *)&a5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[EDFormula addToken:extendedDataLength:](self, "addToken:extendedDataLength:", 57, 6);
  v10 = v9;
  if (v9)
  {
    *(_WORD *)v9 = v5;
    *((_WORD *)v9 + 1) = v6;
    *((_WORD *)v9 + 2) = 0;
    if (v8)
    {
      v11 = objc_msgSend(v8, "tokenCount");
      if (v11)
      {
        v12 = 0;
        do
        {
          -[EDFormula copyTokenAtIndex:fromFormula:](self, "copyTokenAtIndex:fromFormula:", v12, v8);
          v12 = (v12 + 1);
        }
        while (v11 != (_DWORD)v12);
      }
    }
  }

  return v10 != 0;
}

- (BOOL)convertToList:(unsigned int)a3
{
  return -[EDFormula convertToList:withFinalParen:](self, "convertToList:withFinalParen:", *(_QWORD *)&a3, 1);
}

- (BOOL)convertToList:(unsigned int)a3 withFinalParen:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v8;
  char v9;
  unsigned int v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  int v24;
  char *v25;
  unint64_t v26;
  void *v27;
  char *v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int i;
  unsigned int v36;
  int v37;
  uint64_t v38;
  char *__p;
  char *v40;
  char *v41;

  v4 = a4;
  if (a3 > 2)
  {
    v8 = -[EDFormula tokenCount](self, "tokenCount");
    if (v8 >= a3)
    {
      v10 = v8;
      v41 = 0;
      v11 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)&v41, 1uLL);
      v12 = v10 - 1;
      *(_DWORD *)v11 = v12;
      __p = v11;
      v41 = &v11[4 * v13];
      v40 = v11 + 4;
      while (1)
      {
        v14 = -[EDFormula firstTokenIndexForArgAtIndex:](self, "firstTokenIndexForArgAtIndex:", v12);
        v15 = v40;
        if (!v14)
          break;
        v12 = v14 - 1;
        if (v40 >= v41)
        {
          v17 = __p;
          v18 = (v40 - __p) >> 2;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
            std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
          v20 = v41 - __p;
          if ((v41 - __p) >> 1 > v19)
            v19 = v20 >> 1;
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
            v21 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v21 = v19;
          if (v21)
          {
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)&v41, v21);
            v17 = __p;
            v15 = v40;
          }
          else
          {
            v22 = 0;
          }
          v23 = &v22[4 * v18];
          *(_DWORD *)v23 = v12;
          v16 = v23 + 4;
          while (v15 != v17)
          {
            v24 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v23 - 1) = v24;
            v23 -= 4;
          }
          __p = v23;
          v41 = &v22[4 * v21];
          if (v17)
            operator delete(v17);
        }
        else
        {
          *(_DWORD *)v40 = v12;
          v16 = v40 + 4;
        }
        v40 = v16;
        v25 = __p;
        v26 = (v16 - __p) >> 2;
        if (v26 >= a3)
          goto LABEL_30;
      }
      v25 = __p;
      v26 = (v40 - __p) >> 2;
LABEL_30:
      if (v26 == a3)
      {
        +[EDFormula formula](EDFormula, "formula");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v40;
        if (v40 == __p)
        {
          v34 = 0;
        }
        else
        {
          v29 = 0;
          v30 = 0;
          v31 = 0;
          do
          {
            v33 = *((_DWORD *)v28 - 1);
            v28 -= 4;
            v32 = v33;
            v34 = v33;
            if (v29)
            {
              for (i = v31 + 1; i < v32; i = v36)
              {
                v36 = i + 1;
                objc_msgSend(v27, "copyTokenAtIndex:fromFormula:");
              }
              v34 = v30;
            }
            objc_msgSend(v27, "copyTokenAtIndex:fromFormula:", v32, self);
            if (++v29 >= 2)
              objc_msgSend(v27, "addToken:extendedDataLength:", 16, 0);
            v30 = v34;
            v31 = v32;
          }
          while (v28 != __p);
        }
        if (v34 < v10)
        {
          do
          {
            -[EDFormula removeTokenAtIndex:](self, "removeTokenAtIndex:", v34);
            --v10;
          }
          while ((_DWORD)v34 != v10);
        }
        v37 = objc_msgSend(v27, "tokenCount");
        if (v37)
        {
          v38 = 0;
          do
          {
            -[EDFormula copyTokenAtIndex:fromFormula:](self, "copyTokenAtIndex:fromFormula:", v38, v27);
            v38 = (v38 + 1);
          }
          while (v37 != (_DWORD)v38);
        }
        if (v4)
          v9 = addOperator(self, 21);
        else
          v9 = 1;

        v25 = __p;
        if (!__p)
          return v9;
      }
      else
      {
        v9 = 0;
        if (!v25)
          return v9;
      }
      operator delete(v25);
      return v9;
    }
    return 0;
  }
  else
  {
    if (a3 == 2)
      addOperator(self, 16);
    if (v4)
      return addOperator(self, 21);
    return 1;
  }
}

- (BOOL)convertLastRefsToArea
{
  unsigned int v3;
  int v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  char *v9;
  char *v10;
  int v11;
  BOOL v12;
  BOOL v13;
  int v15;

  v3 = -[EDFormula tokenCount](self, "tokenCount");
  v4 = -[EDFormula tokenTypeAtIndex:](self, "tokenTypeAtIndex:", v3 - 2);
  v5 = v3 - 1;
  v6 = -[EDFormula tokenTypeAtIndex:](self, "tokenTypeAtIndex:", v5);
  v7 = v3 >= 2;
  v8 = v3 - 2;
  if (v7 && (v6 == 90 || v6 == 68) && (v4 == 68 || v4 == 90))
  {
    v15 = 0;
    v9 = -[EDFormula extendedDataForTokenAtIndex:extendedDataIndex:length:](self, "extendedDataForTokenAtIndex:extendedDataIndex:length:", v8, 0, &v15);
    v10 = -[EDFormula extendedDataForTokenAtIndex:extendedDataIndex:length:](self, "extendedDataForTokenAtIndex:extendedDataIndex:length:", v5, 0, &v15);
    if (v4 == 90)
    {
      v11 = refTypeOf(90);
      v12 = addArea3DOperandFromRef3DExtendedData(self, v11, (unsigned __int16 *)v9, (unsigned __int16 *)v10);
    }
    else
    {
      v12 = addAreaOperandFromRefExtendedData(self, (unsigned __int16 *)v9, (unsigned __int16 *)v10);
    }
    v13 = v12;
    -[EDFormula removeTokenAtIndex:](self, "removeTokenAtIndex:", v5);
    -[EDFormula removeTokenAtIndex:](self, "removeTokenAtIndex:", v8);
  }
  else
  {
    -[EDFormula setWarning:](self, "setWarning:", 6);
    return 0;
  }
  return v13;
}

- (id)lastTokenRefOrArea3dLinkRefIsValid:(BOOL *)a3 withEDLinks:(id)a4
{
  id v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  void *v10;
  char v11;
  char v12;
  char *v13;
  BOOL v14;
  int v16;

  v6 = a4;
  v7 = -[EDFormula tokenCount](self, "tokenCount");
  if (!v7)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v8 = v7 - 1;
  v9 = -[EDFormula tokenTypeAtIndex:](self, "tokenTypeAtIndex:", v8);
  v10 = 0;
  v11 = v9 - 22;
  if ((v9 - 22) <= 0x2F)
  {
    if (((1 << v11) & 0xC0000000C001) != 0)
      goto LABEL_10;
    if (((1 << v11) & 0x3000000000) != 0)
    {
LABEL_7:
      v16 = 0;
      v13 = -[EDFormula extendedDataForTokenAtIndex:extendedDataIndex:length:](self, "extendedDataForTokenAtIndex:extendedDataIndex:length:", v8, 0, &v16);
      if (v13)
      {
        objc_msgSend(v6, "referenceAtIndex:", *(unsigned __int16 *)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  v12 = v9 - 90;
  if ((v9 - 90) > 0x21)
    goto LABEL_15;
  if (((1 << v12) & 0x300000003) != 0)
    goto LABEL_7;
  if (((1 << v12) & 0xC00) == 0)
  {
LABEL_15:
    v10 = 0;
    if (!a3)
      goto LABEL_13;
    v14 = 0;
    goto LABEL_12;
  }
LABEL_10:
  if (a3)
  {
    v14 = v10 != 0;
LABEL_12:
    *a3 = v14;
  }
LABEL_13:

  return v10;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDFormula;
  -[EDFormula description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)convertToIntersect:(unsigned int)a3
{
  return 0;
}

- (BOOL)shrinkSpanningRefAtArgIndex:(unsigned int)a3
{
  return 0;
}

- (BOOL)addInfixOperator:(int)a3 atIndex:(unsigned int)a4 factor:(double)a5
{
  return 0;
}

- (BOOL)wrapArgumentsWithOperator:(int)a3 argumentCount:(unsigned int)a4 atIndex:(unsigned int)a5
{
  return 0;
}

- (BOOL)fixTableOfConstantsRefs
{
  return 0;
}

- (BOOL)uppercaseArgAtIndex:(unsigned int)a3
{
  return 0;
}

- (BOOL)insertName:(unint64_t)a3 atIndex:(unsigned int)a4
{
  return 0;
}

- (void)unarchiveFromData:(__CFData *)a3 offset:(unint64_t *)a4
{
  const UInt8 *BytePtr;
  const UInt8 *v7;
  const UInt8 *v8;
  CFIndex v9;

  if (a3)
  {
    BytePtr = CFDataGetBytePtr(a3);
    if (BytePtr)
    {
      v7 = BytePtr;
      CFDataSetLength(self->mPackedData, 0);
      v8 = &v7[*a4];
      v9 = *(unsigned __int16 *)v8 + *((unsigned __int16 *)v8 + 2) + *(_DWORD *)(v8 + 10) + 20;
      CFDataAppendBytes(self->mPackedData, v8, v9);
      *a4 += v9;
    }
  }
}

- (void)archiveByAppendingToMutableData:(__CFData *)a3
{
  __CFData *mPackedData;
  UInt8 *MutableBytePtr;

  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
      CFDataAppendBytes(a3, MutableBytePtr, *(unsigned __int16 *)MutableBytePtr+ *((unsigned __int16 *)MutableBytePtr + 2)+ *(_DWORD *)(MutableBytePtr + 10)+ 20);
  }
}

@end

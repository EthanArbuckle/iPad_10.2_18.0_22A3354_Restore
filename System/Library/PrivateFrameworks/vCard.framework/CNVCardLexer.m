@implementation CNVCardLexer

+ (id)singleByteTokens
{
  if (singleByteTokens_cn_once_token_1 != -1)
    dispatch_once(&singleByteTokens_cn_once_token_1, &__block_literal_global_5);
  return (id)singleByteTokens_cn_once_object_1;
}

void __32__CNVCardLexer_singleByteTokens__block_invoke()
{
  uint64_t v0;
  void *v1;

  buildTokenTable(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)singleByteTokens_cn_once_object_1;
  singleByteTokens_cn_once_object_1 = v0;

}

+ (id)utf16Tokens
{
  if (utf16Tokens_cn_once_token_2 != -1)
    dispatch_once(&utf16Tokens_cn_once_token_2, &__block_literal_global_1);
  return (id)utf16Tokens_cn_once_object_2;
}

void __27__CNVCardLexer_utf16Tokens__block_invoke()
{
  uint64_t v0;
  void *v1;

  buildTokenTable(1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)utf16Tokens_cn_once_object_2;
  utf16Tokens_cn_once_object_2 = v0;

}

+ (id)returnDelimiterData
{
  if (returnDelimiterData_cn_once_token_3 != -1)
    dispatch_once(&returnDelimiterData_cn_once_token_3, &__block_literal_global_2_0);
  return (id)returnDelimiterData_cn_once_object_3;
}

void __35__CNVCardLexer_returnDelimiterData__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", "\n", 1);
  v1 = (void *)returnDelimiterData_cn_once_object_3;
  returnDelimiterData_cn_once_object_3 = v0;

}

- (id)os_log
{
  if (os_log_cn_once_token_4 != -1)
    dispatch_once(&os_log_cn_once_token_4, &__block_literal_global_4);
  return (id)os_log_cn_once_object_4;
}

void __22__CNVCardLexer_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.vcard", "lexer");
  v1 = (void *)os_log_cn_once_object_4;
  os_log_cn_once_object_4 = (uint64_t)v0;

}

- (CNVCardLexer)initWithData:(id)a3
{
  id v4;
  CNVCardLexer *v5;
  unint64_t v6;
  CNVCardLexer *v7;
  uint64_t v8;
  NSMutableData *data;
  uint64_t v10;
  char v11;
  unint64_t length;
  unint64_t v13;
  char *bytes;
  uint64_t v15;
  NSArray *activeTokenSets;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNVCardLexer;
  v5 = -[CNVCardLexer init](&v18, sel_init);
  if (v5 && (v6 = objc_msgSend(v4, "length"), v5->_length = v6, v6 >= 0xB))
  {
    v8 = objc_msgSend(v4, "mutableCopy");
    data = v5->_data;
    v5->_data = (NSMutableData *)v8;

    v5->_bytes = (char *)-[NSMutableData mutableBytes](v5->_data, "mutableBytes");
    v5->_unicode = 0;
    v10 = +[CNVCardDataAnalyzer analyzeData:](CNVCardDataAnalyzer, "analyzeData:", v4);
    if ((v10 | 0x4000000) == 0x94000100)
    {
      v5->_unicode = 1;
      if (v10 == 2483028224)
      {
        length = v5->_length;
        if (length >= 2)
        {
          v13 = length >> 1;
          bytes = v5->_bytes;
          do
          {
            *(_WORD *)bytes = bswap32(*(unsigned __int16 *)bytes) >> 16;
            bytes += 2;
            --v13;
          }
          while (v13);
        }
      }
    }
    if ((v11 & 1) != 0)
      v5->_cursor = 2;
    if (v5->_unicode)
      +[CNVCardLexer utf16Tokens](CNVCardLexer, "utf16Tokens");
    else
      +[CNVCardLexer singleByteTokens](CNVCardLexer, "singleByteTokens");
    v15 = objc_claimAutoreleasedReturnValue();
    activeTokenSets = v5->_activeTokenSets;
    v5->_activeTokenSets = (NSArray *)v15;

    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)cursor
{
  return self->_cursor;
}

- (int64_t)errorCount
{
  return self->_errorCount;
}

- (id)tokenSetForLength:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  void *v6;

  v5 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 6 && ((0x55u >> v5) & 1) != 0)
  {
    -[NSArray objectAtIndex:](self->_activeTokenSets, "objectAtIndex:", qword_1D3C2D460[v5], v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int)nextTokenPeekSingle:(BOOL)a3 length:(int64_t)a4
{
  unint64_t cursor;
  uint64_t *p_cursor;
  unint64_t length;
  unint64_t v9;
  BOOL v10;
  int v11;
  unint64_t v12;
  int v13;
  const __CFArray *v14;
  const __CFArray *v15;
  CFIndex Count;
  CFIndex v17;
  CFIndex v18;
  _QWORD *ValueAtIndex;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  unint64_t v26;
  BOOL v27;
  BOOL v28;
  BOOL v30;
  char v31;
  int result;
  NSObject *v33;
  _BYTE v35[8];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  p_cursor = (uint64_t *)&self->_cursor;
  cursor = self->_cursor;
  self->_peekedPoint = cursor;
  length = self->_length;
  if (a4 <= 0)
    v9 = 7;
  else
    v9 = a4;
  v10 = cursor >= length;
  if (cursor >= length)
    v11 = 65537;
  else
    v11 = 0;
  if (v10)
  {
    v27 = 1;
    v13 = 90;
    if (a3)
      goto LABEL_34;
    goto LABEL_33;
  }
  v12 = 1;
  do
  {
    v13 = self->_bytes[cursor];
    *(_WORD *)&v35[v12 - 1] = v13;
    v14 = -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", v12);
    if (v14)
    {
      v15 = v14;
      Count = CFArrayGetCount(v14);
      if (Count >= 1)
      {
        v17 = Count;
        v18 = 0;
        while (2)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v15, v18);
          v20 = (unsigned __int8 *)ValueAtIndex[1];
          v21 = v35;
          do
          {
            while (1)
            {
              v23 = *v20++;
              v22 = v23;
              v25 = *v21++;
              v24 = v25;
              if (v25 != v22)
                break;
              if (!v22)
                goto LABEL_22;
            }
          }
          while ((v24 - 97) <= 0x19 && v24 && v22 == (v24 - 32));
          if (!v24)
          {
LABEL_22:
            v11 = *(_DWORD *)ValueAtIndex;
            goto LABEL_23;
          }
          if (++v18 != v17)
            continue;
          break;
        }
      }
    }
    v11 = 0;
LABEL_23:
    v26 = self->_length;
    cursor = self->_peekedPoint + 1;
    self->_peekedPoint = cursor;
    v27 = cursor >= v26;
    v28 = v27 || v12++ >= v9;
  }
  while (!v28 && v11 == 0);
  if (!a3)
LABEL_33:
    *p_cursor = cursor;
LABEL_34:
  if (a4)
    v30 = 0;
  else
    v30 = v11 == 0;
  v31 = !v30 || v27;
  if (v30)
    result = 65537;
  else
    result = v11;
  if ((v31 & 1) == 0)
  {
    -[CNVCardLexer os_log](self, "os_log");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[CNVCardLexer nextTokenPeekSingle:length:].cold.1(p_cursor, v13, v33);

    ++self->_errorCount;
    return 65538;
  }
  return result;
}

- (int)nextTokenPeekUnicode:(BOOL)a3 length:(int64_t)a4
{
  unint64_t cursor;
  int64_t v7;
  unint64_t length;
  BOOL v9;
  int v10;
  uint64_t v11;
  char *bytes;
  int v13;
  unint64_t v14;
  int v15;
  _WORD *v16;
  const __CFArray *v17;
  const __CFArray *v18;
  CFIndex Count;
  CFIndex v20;
  CFIndex v21;
  _QWORD *ValueAtIndex;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unint64_t v29;
  BOOL v30;
  BOOL v31;
  int v33;
  BOOL v34;
  char v35;
  int result;
  NSObject *v37;
  unint64_t v38;
  uint8_t buf[4];
  unint64_t v41;
  __int16 v42;
  int v43;
  _WORD v44[8];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  cursor = self->_cursor;
  self->_peekedPoint = cursor;
  if (a4 <= 0)
    v7 = 7;
  else
    v7 = a4;
  length = self->_length;
  v9 = cursor >= length;
  if (cursor >= length)
    v10 = 65537;
  else
    v10 = 0;
  if (v9)
  {
    v15 = 0;
    v33 = 0;
    v30 = 1;
    if (a3)
      goto LABEL_34;
    goto LABEL_33;
  }
  v11 = 1;
  do
  {
    bytes = self->_bytes;
    v13 = bytes[cursor];
    v14 = cursor + 1;
    self->_peekedPoint = v14;
    v15 = bytes[v14];
    v16 = &v44[v11];
    *(v16 - 1) = v15 | ((_WORD)v13 << 8);
    *v16 = 0;
    v17 = -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", v11);
    if (v17)
    {
      v18 = v17;
      Count = CFArrayGetCount(v17);
      if (Count)
      {
        v20 = Count;
        v21 = 0;
        while (2)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v18, v21);
          v23 = (unsigned __int16 *)ValueAtIndex[1];
          v24 = v44;
          while (1)
          {
            while (1)
            {
              v26 = *v23++;
              v25 = v26;
              v28 = *v24++;
              v27 = v28;
              if (v28 != v25)
                break;
              if (!v25)
                goto LABEL_22;
            }
            if ((v27 - 97) > 0x19)
              break;
            if (v25 != (v27 - 32))
              goto LABEL_20;
          }
          if (!v27)
          {
LABEL_22:
            v10 = *(_DWORD *)ValueAtIndex;
            goto LABEL_23;
          }
LABEL_20:
          if (++v21 != v20)
            continue;
          break;
        }
      }
    }
    v10 = 0;
LABEL_23:
    v29 = self->_length;
    cursor = self->_peekedPoint + 1;
    self->_peekedPoint = cursor;
    v30 = cursor >= v29;
    v31 = !v30 && v11++ < v7;
  }
  while (v31 && v10 == 0);
  v33 = v13 << 8;
  if (!a3)
LABEL_33:
    self->_cursor = cursor;
LABEL_34:
  if (a4)
    v34 = 0;
  else
    v34 = v10 == 0;
  v35 = !v34 || v30;
  if (v34)
    result = 65537;
  else
    result = v10;
  if ((v35 & 1) == 0)
  {
    -[CNVCardLexer os_log](self, "os_log");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = self->_cursor;
      *(_DWORD *)buf = 134218240;
      v41 = v38;
      v42 = 1024;
      v43 = v33 | v15;
      _os_log_error_impl(&dword_1D3C07000, v37, OS_LOG_TYPE_ERROR, "vCard Syntax Error, character %ld : %C", buf, 0x12u);
    }

    ++self->_errorCount;
    return 65538;
  }
  return result;
}

- (int)peekAtNextToken
{
  return -[CNVCardLexer nextTokenPeek:](self, "nextTokenPeek:", 1);
}

- (int)readNextToken
{
  return -[CNVCardLexer nextTokenPeek:](self, "nextTokenPeek:", 0);
}

- (int)nextTokenPeek:(BOOL)a3
{
  return -[CNVCardLexer nextTokenPeek:length:](self, "nextTokenPeek:length:", a3, 0);
}

- (int)nextTokenPeek:(BOOL)a3 length:(int64_t)a4
{
  if (self->_unicode)
    return -[CNVCardLexer nextTokenPeekUnicode:length:](self, "nextTokenPeekUnicode:length:", a3, a4);
  else
    return -[CNVCardLexer nextTokenPeekSingle:length:](self, "nextTokenPeekSingle:length:", a3, a4);
}

- (id)nextQuotedPrintableData
{
  char *bytes;
  unint64_t cursor;
  unsigned int v4;
  unint64_t v5;
  void *v7;
  unsigned int v9;
  unint64_t v10;
  char *v11;
  char v12;
  char v13;
  char v14;
  char v15;
  unint64_t v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  char v20;
  char v21;
  char v22;

  bytes = self->_bytes;
  cursor = self->_cursor;
  v4 = bytes[cursor];
  v5 = cursor + 1;
  self->_cursor = cursor + 1;
  if (v4 == 61)
  {
    v5 = cursor + 4;
    if (cursor + 4 >= self->_length || bytes[cursor + 2] != 13 || bytes[cursor + 3] != 10)
      goto LABEL_12;
    self->_cursor = v5;
    v4 = bytes[v5];
  }
  if (v4 == 13 || v4 == 10)
  {
    -[CNVCardLexer advancePastEOL](self, "advancePastEOL");
    goto LABEL_12;
  }
  v9 = bytes[v5];
  if (v9 != 61)
    goto LABEL_19;
  v10 = v5 + 3;
  if (v5 + 3 >= self->_length || (v11 = &bytes[v5], v11[1] != 13) || v11[2] != 10)
  {
LABEL_12:
    v7 = 0;
    return v7;
  }
  self->_cursor = v10;
  v9 = bytes[v10];
  v5 = v10;
LABEL_19:
  if (v4 <= 0x40)
    v12 = 64;
  else
    v12 = 9;
  v13 = v12 + v4;
  if (v9 <= 0x40)
    v14 = -48;
  else
    v14 = -55;
  if (v9 > 0x60)
    v14 = -87;
  v15 = v9 + 16 * v13 + v14;
  v22 = v15;
  v16 = v5 + 1;
  self->_cursor = v5 + 1;
  if (v15 == 92)
  {
    if (v16 < self->_length)
    {
      v22 = bytes[v16];
      self->_cursor = v5 + 2;
    }
    goto LABEL_44;
  }
  if (v15 != 13 || v5 + 3 >= self->_length)
  {
LABEL_44:
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v22, 1);
    return v7;
  }
  if (bytes[v16] == 61)
  {
    v17 = bytes[v5 + 2];
    v18 = bytes[v5 + 3];
    if (v17 <= 0x40)
      v19 = 64;
    else
      v19 = 9;
    v20 = v19 + v17;
    if (v18 <= 0x40)
      v21 = -48;
    else
      v21 = -55;
    if (v18 > 0x60)
      v21 = -87;
    if ((v21 + v18 + 16 * v20) == 10)
      self->_cursor = v5 + 4;
  }
  +[CNVCardLexer returnDelimiterData](CNVCardLexer, "returnDelimiterData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)nextEscapedCharacter
{
  char *bytes;
  unint64_t cursor;
  int v5;
  unint64_t v6;
  _BOOL4 unicode;
  void *v8;
  char *v9;
  uint64_t v10;
  _BYTE v12[2];
  char v13;

  if (-[CNVCardLexer advancedPastToken:](self, "advancedPastToken:", 0x8000))
    -[CNVCardLexer advancedPastToken:](self, "advancedPastToken:", 0x4000);
  bytes = self->_bytes;
  cursor = self->_cursor;
  v5 = bytes[cursor];
  v13 = bytes[cursor];
  v6 = cursor + 1;
  self->_cursor = cursor + 1;
  unicode = self->_unicode;
  if (self->_unicode)
  {
    v5 = bytes[v6];
    v13 = bytes[v6];
    self->_cursor = cursor + 2;
  }
  if (v5 == 110)
  {
    LOBYTE(v5) = 10;
    v13 = 10;
  }
  if (unicode)
  {
    v12[0] = 0;
    v12[1] = v5;
    v8 = (void *)MEMORY[0x1E0C99D50];
    v9 = v12;
    v10 = 2;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99D50];
    v9 = &v13;
    v10 = 1;
  }
  objc_msgSend(v8, "dataWithBytes:length:", v9, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)nextSingleByteStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 maximumValueLength:(unint64_t)a7
{
  _BOOL4 v7;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  const __CFArray *v13;
  id v14;
  unint64_t cursor;
  uint64_t v16;
  char v17;
  CFIndex Count;
  CFIndex v19;
  CFIndex v20;
  _QWORD *ValueAtIndex;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v42;
  _BYTE v43[2];

  v7 = a6;
  v42 = a4;
  if ((a5 & 0x80) != 0 && self->_bytes[self->_cursor] == 34)
  {
    -[CNVCardLexer nextQuotedStringValueInEncoding:](self, "nextQuotedStringValueInEncoding:", a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[CNVCardLexer emptyRangeStartingAtCursor](self, "emptyRangeStartingAtCursor", a3);
  v12 = v11;
  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v13 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v43[1] = 0;
  cursor = self->_cursor;
  if (cursor >= self->_length)
  {
LABEL_38:
    v32 = 0;
    self->_cursor = self->_peekedPoint;
    goto LABEL_39;
  }
  v16 = 0;
  v39 = 0;
  v17 = 1;
  while (1)
  {
    v43[0] = self->_bytes[cursor];
    Count = CFArrayGetCount(v13);
    if (Count < 1)
    {
LABEL_17:
      v28 = 0;
      if (!v7)
        goto LABEL_23;
    }
    else
    {
      v19 = Count;
      v20 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v13, v20);
        v22 = (unsigned __int8 *)ValueAtIndex[1];
        v23 = v43;
        do
        {
          while (1)
          {
            v25 = *v22++;
            v24 = v25;
            v27 = *v23++;
            v26 = v27;
            if (v27 != v24)
              break;
            if (!v24)
              goto LABEL_19;
          }
        }
        while ((v26 - 97) <= 0x19 && v26 && v24 == (v26 - 32));
        if (v26)
        {
          if (++v20 != v19)
            continue;
          goto LABEL_17;
        }
        break;
      }
LABEL_19:
      v28 = *(_DWORD *)ValueAtIndex;
      if (!v7)
        goto LABEL_23;
    }
    if ((v28 & 0x4000) != 0)
      break;
    v17 &= (v28 & a5) != 0;
    if ((v28 & a5) == 0)
      v16 = 0;
LABEL_23:
    if (v42 && v28 == 1025)
    {
      -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", v10, v12, v14);
      -[CNVCardLexer appendNextQuotedPrintableDataToData:](self, "appendNextQuotedPrintableDataToData:", v14);
    }
    else
    {
      if (v28 != 513)
        goto LABEL_33;
      -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", v10, v12, v14);
      -[CNVCardLexer appendNextEscapedCharacterToData:](self, "appendNextEscapedCharacterToData:", v14);
    }
    v10 = -[CNVCardLexer emptyRangeStartingAtCursor](self, "emptyRangeStartingAtCursor");
    v12 = v29;
LABEL_37:
    cursor = self->_cursor;
    if (cursor >= self->_length)
      goto LABEL_38;
  }
  v30 = (v17 & 1) == 0;
  v17 = (v17 & 1) != 0;
  v31 = v39;
  if (!v30)
    v31 = v39 + 1;
  v39 = v31;
  if (v30)
    ++v16;
LABEL_33:
  if ((v28 & a5) != 0)
  {
    -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", v10, v12, v14);
    -[CNVCardLexer stringFromData:encoding:prefixLength:suffixLength:](self, "stringFromData:encoding:prefixLength:suffixLength:", v14, v38, v39, v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardLexer clipAtGraphemeClusters:maximumValueLength:addEllipsisIfClipped:](self, "clipAtGraphemeClusters:maximumValueLength:addEllipsisIfClipped:", v33, a7, 1);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_39;
  }
  if (a7 == -1 || v12 < a7 + 20)
  {
    ++v12;
    ++self->_cursor;
    goto LABEL_37;
  }
  -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", v10, v12, v14);
  -[CNVCardLexer stringByRoundingData:toNextWholeCharacterUsingEncoding:prefixLength:suffixLength:maximumValueLength:](self, "stringByRoundingData:toNextWholeCharacterUsingEncoding:prefixLength:suffixLength:maximumValueLength:", v14, v38, v39, v16, a7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringByAppendingString:", CFSTR("…"));
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v35)
    v37 = (__CFString *)v35;
  else
    v37 = CFSTR("…");
  v32 = v37;

  ++self->_cursor;
  -[CNVCardLexer skipToStopTokens:](self, "skipToStopTokens:", a5);
LABEL_39:

  return v32;
}

- (void)skipToStopTokens:(int)a3
{
  unint64_t i;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  _QWORD *ValueAtIndex;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  const __CFArray *theArray;
  _BYTE v18[2];

  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  theArray = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v18[1] = 0;
  for (i = self->_cursor; i < self->_length; self->_cursor = i)
  {
    v18[0] = self->_bytes[i];
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
        v10 = (unsigned __int8 *)ValueAtIndex[1];
        v11 = v18;
        do
        {
          while (1)
          {
            v13 = *v10++;
            v12 = v13;
            v15 = *v11++;
            v14 = v15;
            if (v15 != v12)
              break;
            if (!v12)
              goto LABEL_15;
          }
        }
        while ((v14 - 97) <= 0x19 && v14 && v12 == (v14 - 32));
        if (!v14)
        {
LABEL_15:
          v16 = *(_DWORD *)ValueAtIndex;
          goto LABEL_16;
        }
        if (++v8 != v7)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_16:
    if ((v16 & a3) != 0)
      break;
    i = self->_cursor + 1;
  }

}

- (void)appendDataInRange:(_NSRange)a3 toData:(id)a4
{
  objc_msgSend(a4, "appendBytes:length:", &self->_bytes[a3.location], a3.length);
}

- (void)appendNextQuotedPrintableDataToData:(id)a3
{
  id v4;
  id v5;

  ++self->_cursor;
  v4 = a3;
  -[CNVCardLexer nextQuotedPrintableData](self, "nextQuotedPrintableData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v5);

}

- (void)appendNextEscapedCharacterToData:(id)a3
{
  id v4;
  id v5;

  ++self->_cursor;
  v4 = a3;
  -[CNVCardLexer nextEscapedCharacter](self, "nextEscapedCharacter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v5);

}

- (_NSRange)emptyRangeStartingAtCursor
{
  NSUInteger cursor;
  NSUInteger v3;
  _NSRange result;

  cursor = self->_cursor;
  v3 = 0;
  result.length = v3;
  result.location = cursor;
  return result;
}

- (id)stringByRoundingData:(id)a3 toNextWholeCharacterUsingEncoding:(unint64_t)a4 prefixLength:(unint64_t)a5 suffixLength:(unint64_t)a6 maximumValueLength:(unint64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v20;

  v12 = a3;
  -[CNVCardLexer stringFromData:encoding:prefixLength:suffixLength:](self, "stringFromData:encoding:prefixLength:suffixLength:", v12, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v16 = objc_msgSend(v12, "length");
    if (v16)
    {
      v17 = v16 - 1;
      do
      {
        objc_msgSend(v12, "subdataWithRange:", 0, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNVCardLexer stringFromData:encoding:prefixLength:suffixLength:](self, "stringFromData:encoding:prefixLength:suffixLength:", v18, a4, a5, a6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v17-- != 0;
      }
      while (!v13 && v20);
    }
    else
    {
      v13 = 0;
    }
  }
  -[CNVCardLexer clipAtGraphemeClusters:maximumValueLength:addEllipsisIfClipped:](self, "clipAtGraphemeClusters:maximumValueLength:addEllipsisIfClipped:", v13, a7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)clipAtGraphemeClusters:(id)a3 maximumValueLength:(unint64_t)a4 addEllipsisIfClipped:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;

  v5 = a5;
  v7 = a3;
  v8 = v7;
  if (a4 == -1 || objc_msgSend(v7, "length") <= a4)
  {
    v12 = v8;
  }
  else
  {
    v9 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", 0, a4);
    objc_msgSend(v8, "substringWithRange:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v5)
    {
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("…"));
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v13;
    }
  }

  return v12;
}

- (id)unicodeStringByRoundingData:(id)a3 toNextWholeCharacterUsingEncoding:(unint64_t)a4 prefixLength:(unint64_t)a5 suffixLength:(unint64_t)a6 maximumValueLength:(unint64_t)a7
{
  void *v9;
  void *v10;

  -[CNVCardLexer stringFromData:encoding:prefixLength:suffixLength:](self, "stringFromData:encoding:prefixLength:suffixLength:", a3, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardLexer clipAtGraphemeClusters:maximumValueLength:addEllipsisIfClipped:](self, "clipAtGraphemeClusters:maximumValueLength:addEllipsisIfClipped:", v9, a7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)stringFromData:(id)a3 encoding:(unint64_t)a4 prefixLength:(unint64_t)a5 suffixLength:(unint64_t)a6
{
  void *v8;
  void *v9;

  -[CNVCardLexer trimData:withPrefixLength:suffixLength:](self, "trimData:withPrefixLength:suffixLength:", a3, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardLexer stringFromSubData:encoding:](self, "stringFromSubData:encoding:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)trimData:(id)a3 withPrefixLength:(unint64_t)a4 suffixLength:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = v8;
  if (a5 | a4)
  {
    v10 = -[CNVCardLexer rangeWithLength:lTrim:rTrim:](self, "rangeWithLength:lTrim:rTrim:", objc_msgSend(v8, "length"), a4, a5);
    objc_msgSend(v9, "subdataWithRange:", v10, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v8;
  }
  v13 = v12;

  return v13;
}

- (_NSRange)rangeWithLength:(unint64_t)a3 lTrim:(unint64_t)a4 rTrim:(unint64_t)a5
{
  NSUInteger v6;
  _NSRange result;

  v6 = a3 - (a4 + a5);
  result.length = v6;
  result.location = a4;
  return result;
}

- (id)stringFromSubData:(id)a3 encoding:(unint64_t)a4
{
  id v4;
  uint64_t v5;
  objc_class *v7;
  void *v8;

  if (a4 == 4000100)
  {
    v4 = a3;
    +[CNVCardData stringFromUTF7Data:](CNVCardData, "stringFromUTF7Data:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (objc_class *)MEMORY[0x1E0CB3940];
    v4 = a3;
    v5 = objc_msgSend([v7 alloc], "initWithData:encoding:", v4, a4);
  }
  v8 = (void *)v5;

  return v8;
}

- (id)nextQuotedStringValueInEncoding:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(CFSTR("\"), "dataUsingEncoding:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNVCardLexer expandRange:untilNextByteIs:](self, "expandRange:untilNextByteIs:", objc_msgSend(v5, "length") + self->_cursor, 0, v5);
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", v6, v8, v9);
  self->_cursor = v6 + v8 + objc_msgSend(v5, "length");
  -[CNVCardLexer stringFromSubData:encoding:](self, "stringFromSubData:encoding:", v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (_NSRange)expandRange:(_NSRange)a3 untilNextByteIs:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = objc_msgSend(v7, "length");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &self->_bytes[location + length], v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (location + length < self->_length)
  {
    while ((objc_msgSend(v9, "isEqualToData:", v7) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &self->_bytes[location + v8 + length], v8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v11;
      length += v8;
      v10 = length;
      if (location + length >= self->_length)
        goto LABEL_6;
    }
  }
  v10 = length;
  v11 = v9;
LABEL_6:

  v12 = location;
  v13 = v10;
  result.length = v13;
  result.location = v12;
  return result;
}

- (id)nextUnicodeStringStopTokens:(int)a3 quotedPrintable:(BOOL)a4 trim:(BOOL)a5 maximumValueLength:(unint64_t)a6
{
  _BOOL4 v6;
  unint64_t cursor;
  char *bytes;
  const __CFArray *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char *v17;
  CFIndex Count;
  CFIndex v19;
  CFIndex v20;
  _QWORD *ValueAtIndex;
  unsigned __int16 *v22;
  unsigned __int16 *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  unint64_t v38;
  uint64_t v39;
  _BOOL4 v42;
  _BYTE v43[2];
  __int16 v44;

  v6 = a5;
  v42 = a4;
  if ((a3 & 0x80) != 0)
  {
    bytes = self->_bytes;
    cursor = self->_cursor;
    if (!bytes[cursor] && bytes[cursor + 1] == 34)
    {
      -[CNVCardLexer nextQuotedStringValueInEncoding:](self, "nextQuotedStringValueInEncoding:", 2415919360);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    cursor = self->_cursor;
  }
  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v11 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v13 = self->_cursor;
  if (v13 >= self->_length)
  {
LABEL_40:
    v32 = 0;
    self->_cursor = self->_peekedPoint;
    goto LABEL_41;
  }
  v14 = 0;
  v15 = 0;
  v38 = 2 * a6 + 20;
  v39 = 0;
  v16 = 1;
  while (1)
  {
    v17 = &self->_bytes[v13];
    v43[1] = *v17;
    v43[0] = v17[1];
    Count = CFArrayGetCount(v11);
    if (Count)
    {
      v19 = Count;
      v20 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v11, v20);
        v22 = (unsigned __int16 *)ValueAtIndex[1];
        v23 = (unsigned __int16 *)v43;
        while (1)
        {
          while (1)
          {
            v25 = *v22++;
            v24 = v25;
            v27 = *v23++;
            v26 = v27;
            if (v27 != v24)
              break;
            if (!v24)
              goto LABEL_21;
          }
          if ((v26 - 97) > 0x19)
            break;
          if (v24 != (v26 - 32))
            goto LABEL_18;
        }
        if (v26)
        {
LABEL_18:
          if (++v20 != v19)
            continue;
          goto LABEL_19;
        }
        break;
      }
LABEL_21:
      v28 = *(_DWORD *)ValueAtIndex;
      if (!v6)
        goto LABEL_25;
    }
    else
    {
LABEL_19:
      v28 = 0;
      if (!v6)
        goto LABEL_25;
    }
    if ((v28 & 0x4000) != 0)
      break;
    v16 &= (v28 & a3) != 0;
    if ((v28 & a3) == 0)
      v15 = 0;
LABEL_25:
    if (v42 && v28 == 1025)
    {
      ++self->_cursor;
      -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", cursor, v14, v12);
      -[CNVCardLexer appendNextQuotedPrintableDataToData:](self, "appendNextQuotedPrintableDataToData:", v12);
    }
    else
    {
      if (v28 != 513)
        goto LABEL_35;
      ++self->_cursor;
      -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", cursor, v14, v12);
      -[CNVCardLexer appendNextEscapedCharacterToData:](self, "appendNextEscapedCharacterToData:", v12);
    }
    cursor = -[CNVCardLexer emptyRangeStartingAtCursor](self, "emptyRangeStartingAtCursor");
    v14 = v29;
LABEL_39:
    v13 = self->_cursor;
    if (v13 >= self->_length)
      goto LABEL_40;
  }
  v30 = v39;
  v31 = (v16 & 1) == 0;
  v16 = (v16 & 1) != 0;
  if (!v31)
    v30 = v39 + 2;
  v39 = v30;
  if (v31)
    v15 += 2;
LABEL_35:
  if ((v28 & a3) != 0)
  {
    -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", cursor, v14, v12);
    -[CNVCardLexer stringFromData:encoding:prefixLength:suffixLength:](self, "stringFromData:encoding:prefixLength:suffixLength:", v12, 2415919360, v39, v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardLexer clipAtGraphemeClusters:maximumValueLength:addEllipsisIfClipped:](self, "clipAtGraphemeClusters:maximumValueLength:addEllipsisIfClipped:", v33, a6, 1);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_41;
  }
  if (a6 == -1 || v14 != v38)
  {
    v14 += 2;
    self->_cursor += 2;
    goto LABEL_39;
  }
  -[CNVCardLexer appendDataInRange:toData:](self, "appendDataInRange:toData:", cursor, v38, v12);
  -[CNVCardLexer unicodeStringByRoundingData:toNextWholeCharacterUsingEncoding:prefixLength:suffixLength:maximumValueLength:](self, "unicodeStringByRoundingData:toNextWholeCharacterUsingEncoding:prefixLength:suffixLength:maximumValueLength:", v12, 2415919360, v39, v15, a6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringByAppendingString:", CFSTR("…"));
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v35)
    v37 = (__CFString *)v35;
  else
    v37 = CFSTR("…");
  v32 = v37;

  self->_cursor += 2;
  -[CNVCardLexer unicodeSkipToStopTokens:](self, "unicodeSkipToStopTokens:", a3);
LABEL_41:

  return v32;
}

- (void)unicodeSkipToStopTokens:(int)a3
{
  unint64_t i;
  char *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  _QWORD *ValueAtIndex;
  unsigned __int16 *v11;
  unsigned __int16 *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  const __CFArray *theArray;
  _BYTE v19[2];
  __int16 v20;

  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  theArray = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  for (i = self->_cursor; i < self->_length; self->_cursor = i)
  {
    v6 = &self->_bytes[i];
    v19[1] = *v6;
    v19[0] = v6[1];
    Count = CFArrayGetCount(theArray);
    if (Count)
    {
      v8 = Count;
      v9 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v9);
        v11 = (unsigned __int16 *)ValueAtIndex[1];
        v12 = (unsigned __int16 *)v19;
        while (1)
        {
          while (1)
          {
            v14 = *v11++;
            v13 = v14;
            v16 = *v12++;
            v15 = v16;
            if (v16 != v13)
              break;
            if (!v13)
              goto LABEL_15;
          }
          if ((v15 - 97) > 0x19)
            break;
          if (v13 != (v15 - 32))
            goto LABEL_13;
        }
        if (!v15)
        {
LABEL_15:
          v17 = *(_DWORD *)ValueAtIndex;
          goto LABEL_16;
        }
LABEL_13:
        if (++v9 != v8)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_16:
    if ((v17 & a3) != 0)
      break;
    i = self->_cursor + 2;
  }

}

- (BOOL)_applyNextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 maximumValueLength:(unint64_t)a7 intoString:(id)a8
{
  _BOOL8 v9;
  uint64_t v10;
  _BOOL8 v11;
  id v14;
  void *v15;
  BOOL v16;
  unint64_t v17;

  v9 = a6;
  v10 = *(_QWORD *)&a5;
  v11 = a4;
  v14 = a8;
  if (self->_unicode)
  {
    -[CNVCardLexer nextUnicodeStringStopTokens:quotedPrintable:trim:maximumValueLength:](self, "nextUnicodeStringStopTokens:quotedPrintable:trim:maximumValueLength:", v10, v11, v9, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_cn_appendNonNilString:", v15);
    if ((-[CNVCardLexer nextTokenPeekUnicode:length:](self, "nextTokenPeekUnicode:length:", 1, 1) & 0x8000) != 0)
    {
      -[CNVCardLexer advancePastEOL](self, "advancePastEOL");
      if ((-[CNVCardLexer nextTokenPeekUnicode:length:](self, "nextTokenPeekUnicode:length:", 1, 1) & 0x4000) == 0)
      {
        v16 = 0;
        v17 = self->_cursor - 2;
LABEL_9:
        self->_cursor = v17;
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else
  {
    -[CNVCardLexer nextSingleByteStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:](self, "nextSingleByteStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:", a3, v11, v10, v9, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_cn_appendNonNilString:", v15);
    if ((-[CNVCardLexer nextTokenPeekSingle:length:](self, "nextTokenPeekSingle:length:", 1, 1) & 0x8000) != 0)
    {
      -[CNVCardLexer advancePastEOL](self, "advancePastEOL");
      if ((-[CNVCardLexer nextTokenPeekSingle:length:](self, "nextTokenPeekSingle:length:", 1, 1) & 0x4000) == 0)
      {
        v16 = 0;
        v17 = self->_cursor - 1;
        goto LABEL_9;
      }
LABEL_10:
      -[CNVCardLexer advanceToPeekPoint](self, "advanceToPeekPoint");
      v16 = 1;
      goto LABEL_11;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)nextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 maximumValueLength:(unint64_t)a7
{
  _BOOL4 v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v13;
  unint64_t cursor;
  _BOOL4 v15;
  unint64_t v16;
  NSObject *v18;

  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  cursor = self->_cursor;
  while (1)
  {
    v15 = -[CNVCardLexer _applyNextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:intoString:](self, "_applyNextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:intoString:", a3, v10, v9, 0, a7, v13);
    v16 = self->_cursor;
    if (v15 && v16 <= cursor)
      break;
    cursor = self->_cursor;
    if (!v15)
    {
      if (!v8)
        return v13;
      goto LABEL_6;
    }
  }
  -[CNVCardLexer os_log](self, "os_log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    -[CNVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:].cold.1(cursor, v16, v18);

  if (v8)
LABEL_6:
    objc_msgSend(v13, "_cn_trim");
  return v13;
}

- (int)tokenAtCursor
{
  unint64_t cursor;
  const __CFArray *v4;
  const __CFArray *v5;
  char *v6;
  CFIndex v7;
  CFIndex i;
  _QWORD *ValueAtIndex;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  CFIndex Count;
  CFIndex v17;
  CFIndex v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  _BYTE v26[2];
  _BYTE v27[2];
  __int16 v28;

  cursor = self->_cursor;
  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!self->_unicode)
  {
    v26[1] = 0;
    v26[0] = self->_bytes[cursor];
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v17 = Count;
      v18 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v18);
        v19 = (unsigned __int8 *)ValueAtIndex[1];
        v20 = v26;
        do
        {
          while (1)
          {
            v22 = *v19++;
            v21 = v22;
            v24 = *v20++;
            v23 = v24;
            if (v24 != v21)
              break;
            if (!v21)
              goto LABEL_26;
          }
        }
        while ((v23 - 97) <= 0x19 && v23 && v21 == (v23 - 32));
        if (!v23)
        {
LABEL_26:
          LODWORD(v7) = *(_DWORD *)ValueAtIndex;
          goto LABEL_27;
        }
        if (++v18 != v17)
          continue;
        break;
      }
    }
    goto LABEL_25;
  }
  v28 = 0;
  v6 = &self->_bytes[cursor];
  v27[1] = *v6;
  v27[0] = v6[1];
  v7 = CFArrayGetCount(v4);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
      v10 = (unsigned __int16 *)ValueAtIndex[1];
      v11 = (unsigned __int16 *)v27;
      while (1)
      {
        while (1)
        {
          v13 = *v10++;
          v12 = v13;
          v15 = *v11++;
          v14 = v15;
          if (v15 != v12)
            break;
          if (!v12)
            goto LABEL_26;
        }
        if ((v14 - 97) > 0x19)
          break;
        if (v12 != (v14 - 32))
          goto LABEL_12;
      }
      if (!v14)
        goto LABEL_26;
LABEL_12:
      ;
    }
LABEL_25:
    LODWORD(v7) = 0;
  }
LABEL_27:

  return v7;
}

- (unsigned)charAtPosition:(unint64_t)a3 withOffset:(int64_t)a4
{
  char *bytes;
  int v5;

  bytes = self->_bytes;
  if (self->_unicode)
    return bswap32(*(unsigned __int16 *)&bytes[2 * a4 + a3]) >> 16;
  else
    LOWORD(v5) = bytes[a4 + a3];
  return v5;
}

- (id)stringWithRange:(_NSRange)a3 encoding:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[CNVCardLexer dataWithRange:](self, "dataWithRange:", a3.location, a3.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, a4);

  return v6;
}

- (id)dataWithRange:(_NSRange)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", &self->_bytes[a3.location], a3.length, 0);
}

- (id)nextArraySeperatedByToken:(int)a3 stoppingAt:(int)a4 inEncoding:(unint64_t)a5 maximumValueLength:(unint64_t)a6
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");
  while ((-[CNVCardLexer tokenAtCursorIgnoringLineFolding](self, "tokenAtCursorIgnoringLineFolding") & a4) == 0)
  {
    if (self->_cursor >= self->_length)
      break;
    -[CNVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:](self, "nextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:", a5, 0, a4 | a3, 1, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "length"))
      objc_msgSend(v11, "addObject:", v13);
    if ((-[CNVCardLexer tokenAtCursor](self, "tokenAtCursor") & a3) != 0)
    {
      if (self->_unicode)
        v14 = 2;
      else
        v14 = 1;
      self->_cursor += v14;
    }

  }
  return v11;
}

- (int)tokenAtCursorIgnoringLineFolding
{
  int result;
  unint64_t cursor;

  result = -[CNVCardLexer tokenAtCursor](self, "tokenAtCursor");
  if ((result & 0x8000) != 0)
  {
    cursor = self->_cursor;
    -[CNVCardLexer advancePastEOL](self, "advancePastEOL");
    if ((-[CNVCardLexer nextTokenPeek:length:](self, "nextTokenPeek:length:", 1, 1) & 0x4000) != 0)
      -[CNVCardLexer advanceToPeekPoint](self, "advanceToPeekPoint");
    else
      self->_cursor = cursor;
    return -[CNVCardLexer tokenAtCursor](self, "tokenAtCursor");
  }
  return result;
}

- (id)nextUnicodeBase64Line:(BOOL *)a3
{
  void *v5;
  const __CFArray *v6;
  unint64_t i;
  char *bytes;
  unint64_t v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  _QWORD *ValueAtIndex;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  _BYTE v22[2];
  __int16 v23;

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v6 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  for (i = self->_cursor; i < self->_length; self->_cursor = i)
  {
    bytes = self->_bytes;
    v22[1] = bytes[i];
    v9 = i + 1;
    self->_cursor = v9;
    v22[0] = bytes[v9];
    Count = CFArrayGetCount(v6);
    if (Count)
    {
      v11 = Count;
      v12 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v12);
        v14 = (unsigned __int16 *)ValueAtIndex[1];
        v15 = (unsigned __int16 *)v22;
        while (1)
        {
          while (1)
          {
            v17 = *v14++;
            v16 = v17;
            v19 = *v15++;
            v18 = v19;
            if (v19 != v16)
              break;
            if (!v16)
              goto LABEL_15;
          }
          if ((v18 - 97) > 0x19)
            break;
          if (v16 != (v18 - 32))
            goto LABEL_13;
        }
        if (v18)
        {
LABEL_13:
          if (++v12 != v11)
            continue;
          goto LABEL_17;
        }
        break;
      }
LABEL_15:
      v20 = *(_DWORD *)ValueAtIndex;
      if (*(_DWORD *)ValueAtIndex == 1025)
      {
        *a3 = 1;
        goto LABEL_20;
      }
      if (!v20)
        goto LABEL_17;
      if ((v20 & 0x8000) != 0)
      {
        --self->_cursor;
        break;
      }
    }
    else
    {
LABEL_17:
      objc_msgSend(v5, "appendBytes:length:", v22, 1);
    }
LABEL_20:
    i = self->_cursor + 1;
  }

  return v5;
}

- (id)nextSingleByteBase64Line:(BOOL *)a3
{
  void *v5;
  const __CFArray *v6;
  unint64_t i;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  _QWORD *ValueAtIndex;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  _BYTE v20[2];

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v6 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v20[1] = 0;
  for (i = self->_cursor; i < self->_length; self->_cursor = i)
  {
    v20[0] = self->_bytes[i];
    Count = CFArrayGetCount(v6);
    if (Count < 1)
    {
LABEL_17:
      objc_msgSend(v5, "appendBytes:length:", v20, 1);
    }
    else
    {
      v9 = Count;
      v10 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v10);
        v12 = (unsigned __int8 *)ValueAtIndex[1];
        v13 = v20;
        do
        {
          while (1)
          {
            v15 = *v12++;
            v14 = v15;
            v17 = *v13++;
            v16 = v17;
            if (v17 != v14)
              break;
            if (!v14)
              goto LABEL_15;
          }
        }
        while ((v16 - 97) <= 0x19 && v16 && v14 == (v16 - 32));
        if (v16)
        {
          if (++v10 != v9)
            continue;
          goto LABEL_17;
        }
        break;
      }
LABEL_15:
      v18 = *(_DWORD *)ValueAtIndex;
      if (*(_DWORD *)ValueAtIndex == 1025)
      {
        *a3 = 1;
        goto LABEL_20;
      }
      if (!v18)
        goto LABEL_17;
      if ((v18 & 0x8000) != 0)
        break;
    }
LABEL_20:
    i = self->_cursor + 1;
  }

  return v5;
}

- (id)nextBase64Line:(BOOL *)a3
{
  if (self->_unicode)
    -[CNVCardLexer nextUnicodeBase64Line:](self, "nextUnicodeBase64Line:", a3);
  else
    -[CNVCardLexer nextSingleByteBase64Line:](self, "nextSingleByteBase64Line:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)nextBase64Data
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t cursor;
  char v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  do
  {
    v5 = v4;
    -[CNVCardLexer nextBase64Line:](self, "nextBase64Line:", &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;
    objc_msgSend(v3, "appendData:", v4);
    +[CNVCardLexer returnDelimiterData](CNVCardLexer, "returnDelimiterData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v6);

    cursor = self->_cursor;
    -[CNVCardLexer advanceToEOL](self, "advanceToEOL");
    -[CNVCardLexer advancePastEOL](self, "advancePastEOL");
    if (!-[CNVCardLexer advanceToString](self, "advanceToString"))
    {
      v9 = 1;
      self->_cursor = cursor;
      break;
    }
  }
  while (!v9);

  return v3;
}

- (void)advanceToPeekPoint
{
  self->_cursor = self->_peekedPoint;
}

- (int64_t)advanceToUnicodeString
{
  const __CFArray *v3;
  unint64_t cursor;
  int64_t v5;
  char *bytes;
  unint64_t v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  _QWORD *ValueAtIndex;
  unsigned __int16 *v12;
  unsigned __int16 *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unint64_t length;
  _BYTE v20[2];
  __int16 v21;

  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v3 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  cursor = self->_cursor;
  self->_peekedPoint = cursor;
  if (cursor >= self->_length)
  {
LABEL_17:
    v5 = 0;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      bytes = self->_bytes;
      v20[1] = bytes[cursor];
      v7 = cursor + 1;
      self->_peekedPoint = v7;
      v20[0] = bytes[v7];
      Count = CFArrayGetCount(v3);
      if (!Count)
        break;
      v9 = Count;
      v10 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, v10);
        v12 = (unsigned __int16 *)ValueAtIndex[1];
        v13 = (unsigned __int16 *)v20;
        while (1)
        {
          while (1)
          {
            v15 = *v12++;
            v14 = v15;
            v17 = *v13++;
            v16 = v17;
            if (v17 != v14)
              break;
            if (!v14)
              goto LABEL_15;
          }
          if ((v16 - 97) > 0x19)
            break;
          if (v14 != (v16 - 32))
            goto LABEL_13;
        }
        if (v16)
        {
LABEL_13:
          if (++v10 != v9)
            continue;
          goto LABEL_18;
        }
        break;
      }
LABEL_15:
      if ((*((_BYTE *)ValueAtIndex + 1) & 0x40) == 0)
        break;
      ++v5;
      length = self->_length;
      cursor = self->_peekedPoint + 1;
      self->_peekedPoint = cursor;
      if (cursor >= length)
        goto LABEL_17;
    }
LABEL_18:
    cursor = self->_peekedPoint - 1;
    self->_peekedPoint = cursor;
  }
  self->_cursor = cursor;

  return v5;
}

- (int64_t)advanceToSingleByteString
{
  const __CFArray *v3;
  unint64_t cursor;
  int64_t v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  _QWORD *ValueAtIndex;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unint64_t length;
  _BYTE v18[2];

  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v3 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v18[1] = 0;
  cursor = self->_cursor;
  self->_peekedPoint = cursor;
  if (cursor >= self->_length)
  {
LABEL_17:
    v5 = 0;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      v18[0] = self->_bytes[cursor];
      Count = CFArrayGetCount(v3);
      if (Count < 1)
        break;
      v7 = Count;
      v8 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, v8);
        v10 = (unsigned __int8 *)ValueAtIndex[1];
        v11 = v18;
        do
        {
          while (1)
          {
            v13 = *v10++;
            v12 = v13;
            v15 = *v11++;
            v14 = v15;
            if (v15 != v12)
              break;
            if (!v12)
              goto LABEL_15;
          }
        }
        while ((v14 - 97) <= 0x19 && v14 && v12 == (v14 - 32));
        if (v14)
        {
          if (++v8 != v7)
            continue;
          goto LABEL_18;
        }
        break;
      }
LABEL_15:
      if ((*((_BYTE *)ValueAtIndex + 1) & 0x40) == 0)
        break;
      ++v5;
      length = self->_length;
      cursor = self->_peekedPoint + 1;
      self->_peekedPoint = cursor;
      if (cursor >= length)
        goto LABEL_17;
    }
LABEL_18:
    cursor = self->_peekedPoint;
  }
  self->_cursor = cursor;

  return v5;
}

- (int64_t)advanceToString
{
  if (self->_unicode)
    return -[CNVCardLexer advanceToUnicodeString](self, "advanceToUnicodeString");
  else
    return -[CNVCardLexer advanceToSingleByteString](self, "advanceToSingleByteString");
}

- (BOOL)advanceToToken:(int)a3 throughTypes:(int64_t)a4
{
  int v7;
  int v8;
  BOOL result;
  _BOOL4 v11;

  v7 = 0;
  while (v7 != a3)
  {
    v8 = -[CNVCardLexer readNextToken](self, "readNextToken");
    if (v8 == a3)
      break;
    v7 = v8;
    result = 0;
    v11 = (v7 & a4) == 0 && a4 != 0;
    if ((v7 - 65537) < 2 || v11)
      return result;
  }
  return 1;
}

- (BOOL)advanceToEOLUnicode
{
  unint64_t length;
  unint64_t cursor;
  char *bytes;
  unsigned int v5;

  length = self->_length;
  cursor = self->_cursor;
  if (cursor >= length)
    return 0;
  bytes = self->_bytes;
  while (1)
  {
    v5 = __rev16(*(unsigned __int16 *)&bytes[cursor]);
    if (v5 == 10 || v5 == 13)
      break;
    cursor += 2;
    self->_cursor = cursor;
    if (cursor >= length)
      return 0;
  }
  return 1;
}

- (BOOL)advanceToEOLSingle
{
  unint64_t length;
  unint64_t cursor;
  char *bytes;
  BOOL v5;
  int v6;

  length = self->_length;
  cursor = self->_cursor;
  if (cursor >= length)
  {
    return 0;
  }
  else
  {
    bytes = self->_bytes;
    v5 = 1;
    do
    {
      v6 = bytes[cursor];
      if (v6 == 10 || v6 == 13)
        break;
      self->_cursor = ++cursor;
      v5 = cursor < length;
    }
    while (length != cursor);
  }
  return v5;
}

- (BOOL)advanceToEOL
{
  if (self->_unicode)
    return -[CNVCardLexer advanceToEOLUnicode](self, "advanceToEOLUnicode");
  else
    return -[CNVCardLexer advanceToEOLSingle](self, "advanceToEOLSingle");
}

- (BOOL)advancePastEOLUnicode
{
  const __CFArray *v3;
  unint64_t cursor;
  unint64_t length;
  char *bytes;
  unint64_t v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  _QWORD *ValueAtIndex;
  unsigned __int16 *v12;
  unsigned __int16 *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  BOOL v18;
  _BYTE v20[2];
  __int16 v21;

  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v3 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  cursor = self->_cursor;
  self->_peekedPoint = cursor;
  length = self->_length;
  while (1)
  {
    if (cursor >= length)
    {
      v18 = 0;
      goto LABEL_19;
    }
    bytes = self->_bytes;
    v20[1] = bytes[cursor];
    v7 = cursor + 1;
    self->_peekedPoint = v7;
    v20[0] = bytes[v7];
    Count = CFArrayGetCount(v3);
    if (!Count)
      break;
    v9 = Count;
    v10 = 0;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v10);
      v12 = (unsigned __int16 *)ValueAtIndex[1];
      v13 = (unsigned __int16 *)v20;
      while (1)
      {
        while (1)
        {
          v15 = *v12++;
          v14 = v15;
          v17 = *v13++;
          v16 = v17;
          if (v17 != v14)
            break;
          if (!v14)
            goto LABEL_15;
        }
        if ((v16 - 97) > 0x19)
          break;
        if (v14 != (v16 - 32))
          goto LABEL_13;
      }
      if (v16)
      {
LABEL_13:
        if (++v10 != v9)
          continue;
        goto LABEL_18;
      }
      break;
    }
LABEL_15:
    if ((*((_BYTE *)ValueAtIndex + 1) & 0x80) == 0)
      break;
    length = self->_length;
    cursor = self->_peekedPoint + 1;
    self->_peekedPoint = cursor;
  }
LABEL_18:
  cursor = self->_peekedPoint - 1;
  self->_peekedPoint = cursor;
  v18 = 1;
LABEL_19:
  self->_cursor = cursor;

  return v18;
}

- (BOOL)advancePastEOLSingle
{
  const __CFArray *v3;
  unint64_t i;
  unint64_t length;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  _QWORD *ValueAtIndex;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  BOOL v16;
  _BYTE v18[2];

  self->_peekedPoint = self->_cursor;
  -[CNVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v3 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v18[1] = 0;
  length = self->_length;
  for (i = self->_peekedPoint; ; self->_peekedPoint = i)
  {
    if (i >= length)
    {
      v16 = 0;
      goto LABEL_19;
    }
    v18[0] = self->_bytes[i];
    Count = CFArrayGetCount(v3);
    if (Count < 1)
      break;
    v7 = Count;
    v8 = 0;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, v8);
      v10 = (unsigned __int8 *)ValueAtIndex[1];
      v11 = v18;
      do
      {
        while (1)
        {
          v13 = *v10++;
          v12 = v13;
          v15 = *v11++;
          v14 = v15;
          if (v15 != v12)
            break;
          if (!v12)
            goto LABEL_15;
        }
      }
      while ((v14 - 97) <= 0x19 && v14 && v12 == (v14 - 32));
      if (v14)
      {
        if (++v8 != v7)
          continue;
        goto LABEL_18;
      }
      break;
    }
LABEL_15:
    if ((*((_BYTE *)ValueAtIndex + 1) & 0x80) == 0)
      break;
    length = self->_length;
    i = self->_peekedPoint + 1;
  }
LABEL_18:
  i = self->_peekedPoint;
  v16 = 1;
LABEL_19:
  self->_cursor = i;

  return v16;
}

- (BOOL)advancePastEOL
{
  if (self->_unicode)
    return -[CNVCardLexer advancePastEOLUnicode](self, "advancePastEOLUnicode");
  else
    return -[CNVCardLexer advancePastEOLSingle](self, "advancePastEOLSingle");
}

- (BOOL)atEOF
{
  unint64_t length;

  length = self->_length;
  return !length || self->_cursor >= length;
}

- (BOOL)advancedPastToken:(int)a3
{
  unint64_t cursor;
  unint64_t v4;
  uint64_t v7;

  cursor = self->_cursor;
  v4 = cursor;
  if (cursor < self->_length)
  {
    while ((-[CNVCardLexer tokenAtCursor](self, "tokenAtCursor") & a3) != 0)
    {
      if (self->_unicode)
        v7 = 2;
      else
        v7 = 1;
      v4 = self->_cursor + v7;
      self->_cursor = v4;
      if (v4 >= self->_length)
        return v4 > cursor;
    }
    v4 = self->_cursor;
  }
  return v4 > cursor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTokenSets, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)nextTokenPeekSingle:(os_log_t)log length:.cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_error_impl(&dword_1D3C07000, log, OS_LOG_TYPE_ERROR, "vCard syntax error, character %ld : %c", (uint8_t *)&v4, 0x12u);
}

- (void)nextStringInEncoding:(os_log_t)log quotedPrintable:stopTokens:trim:maximumValueLength:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_fault_impl(&dword_1D3C07000, log, OS_LOG_TYPE_FAULT, "Cursor did not move (%lu --> %lu), but lexar did not detect a value boundary", (uint8_t *)&v3, 0x16u);
}

@end

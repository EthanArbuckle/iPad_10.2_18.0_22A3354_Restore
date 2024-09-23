@implementation WordPieceTokenizerObjc

- (WordPieceTokenizerObjc)initWithVocab:(id)a3
{
  id v5;
  WordPieceTokenizerObjc *v6;
  WordPieceTokenizerObjc *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WordPieceTokenizerObjc;
  v6 = -[WordPieceTokenizerObjc init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vocab, a3);
    -[WordPieceTokenizerObjc startId](v7, "startId");
    v7->_startId = v8;
    -[WordPieceTokenizerObjc endId](v7, "endId");
    v7->_endId = v9;
    -[WordPieceTokenizerObjc padId](v7, "padId");
    v7->_padId = v10;
    -[WordPieceTokenizerObjc unkId](v7, "unkId");
    v7->_unkId = v11;
  }

  return v7;
}

- (id)tokenize:(id)a3 withLength:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  int v11;
  int v12;
  char *v13;
  unint64_t v14;
  _QWORD *v15;
  _DWORD *v16;
  _QWORD *v17;
  char *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  TokenizerOutputObjc *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *memptr;

  v6 = a3;
  v31 = 0;
  memptr = 0;
  if (a4 >= 0x200)
    v7 = 512;
  else
    v7 = a4;
  v29 = 0;
  v30 = 0;
  v28 = 0;
  malloc_type_posix_memalign(&memptr, 8uLL, 4 * v7, 0x133F7CD2uLL);
  malloc_type_posix_memalign(&v31, 8uLL, 16 * v7, 0x511E587uLL);
  malloc_type_posix_memalign(&v30, 8uLL, 16 * v7, 0x8EFFA18uLL);
  malloc_type_posix_memalign(&v29, 8uLL, 16 * v7, 0x8287CA6AuLL);
  v8 = malloc_type_posix_memalign(&v28, 8uLL, 8 * v7, 0x7D4EE911uLL);
  if (v7)
  {
    v9 = v29;
    *(_QWORD *)v29 = 0;
    v9[1] = 0;
    *(float *)memptr = self->_startId;
    *(_QWORD *)v28 = -1;
  }
  v10 = (void *)MEMORY[0x24959EBFC](v8);
  LODWORD(v27) = -[WordPieceTokenizerObjc toWordTokens:wordTokensUTF8:fromInput:withLength:](self, "toWordTokens:wordTokensUTF8:fromInput:withLength:", v31, v30, v6, v7);
  v11 = -[WordPieceTokenizerObjc tokenizeToIds:ranges:wordIndexes:fromString:wordTokens:wordTokensUTF8:wordCount:length:](self, "tokenizeToIds:ranges:wordIndexes:fromString:wordTokens:wordTokensUTF8:wordCount:length:", memptr, v29, v28, v6, v31, v30, v27, v7);
  v12 = v7 - 1;
  if (v7 > v11)
    v12 = v11;
  v13 = (char *)v29;
  v14 = v12;
  if (v7 <= v12)
  {
    v16 = memptr;
    v17 = v28;
  }
  else
  {
    v15 = (char *)v29 + 16 * v12;
    *v15 = 0;
    v15[1] = 0;
    v16 = memptr;
    *((_DWORD *)memptr + v14) = LODWORD(self->_endId);
    v17 = v28;
    *((_QWORD *)v28 + v14) = -1;
  }
  LODWORD(v14) = v14 + 1;
  if (v7 > (int)v14)
  {
    v14 = (int)v14;
    v18 = &v13[16 * (int)v14];
    do
    {
      *(_QWORD *)v18 = 0;
      *((_QWORD *)v18 + 1) = 0;
      v18 += 16;
      v16[v14] = LODWORD(self->_padId);
      v17[v14++] = -1;
    }
    while (v7 > v14);
  }
  objc_autoreleasePoolPop(v10);
  free(v31);
  free(v30);
  v19 = objc_alloc(MEMORY[0x24BDBCE50]);
  v20 = (void *)objc_msgSend(v19, "initWithBytesNoCopy:length:freeWhenDone:", memptr, 4 * v7, 1);
  v21 = objc_alloc(MEMORY[0x24BDBCE50]);
  v22 = (void *)objc_msgSend(v21, "initWithBytesNoCopy:length:freeWhenDone:", v29, 16 * v7, 1);
  v23 = objc_alloc(MEMORY[0x24BDBCE50]);
  v24 = (void *)objc_msgSend(v23, "initWithBytesNoCopy:length:freeWhenDone:", v28, 8 * v7, 1);
  v25 = -[TokenizerOutputObjc initWithTokenIds:tokenRanges:wordIndexes:]([TokenizerOutputObjc alloc], "initWithTokenIds:tokenRanges:wordIndexes:", v20, v22, v24);

  return v25;
}

- (int)toWordTokens:(_NSRange *)a3 wordTokensUTF8:(_NSRange *)a4 fromInput:(id)a5 withLength:(unint64_t)a6
{
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  NSUInteger v13;
  _NSRange *v14;
  NSUInteger v15;
  _NSRange *v16;
  int v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;

  v9 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3010000000;
  v19[4] = 0;
  v19[5] = 0;
  v19[3] = &unk_24891DF97;
  _PASIterateLongChars();
  v10 = v29;
  v11 = v37;
  v12 = *((_DWORD *)v37 + 6);
  if (v29[3])
  {
    if (v12 >= a6)
    {
      v17 = 0;
    }
    else
    {
      v13 = v21[3];
      v14 = &a4[v12];
      v14->location = v25[3];
      v14->length = v13;
      v15 = v10[3];
      v16 = &a3[v12];
      v16->location = v33[3];
      v16->length = v15;
      v17 = 1;
    }
    v12 += v17;
    *((_DWORD *)v11 + 6) = v12;
  }
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v12;
}

void __75__WordPieceTokenizerObjc_toWordTokens_wordTokensUTF8_fromInput_withLength___block_invoke(uint64_t a1, UTF32Char theChar, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int IsLongCharacterMember;
  uint64_t v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  int v30;
  uint64_t v31;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(_QWORD *)(v9 + 32);
  v11 = *(_QWORD *)(v9 + 40);
  if (theChar - 0x10000 < 0x100000)
  {
LABEL_2:
    v12 = 4;
    goto LABEL_9;
  }
  if ((theChar - 2048) >> 11 >= 0x1F)
  {
    if (theChar - 128 >= 0x780)
    {
      if (theChar >= 0x80)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          __75__WordPieceTokenizerObjc_toWordTokens_wordTokensUTF8_fromInput_withLength___block_invoke_cold_1(theChar);
        goto LABEL_2;
      }
      v12 = 1;
    }
    else
    {
      v12 = 2;
    }
  }
  else
  {
    v12 = 3;
  }
LABEL_9:
  if (*(_QWORD *)(a1 + 80) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v13 = v11 + v10;
    IsLongCharacterMember = CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 88), theChar);
    if (theChar == 176 || IsLongCharacterMember)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v12;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += a5;
    }
    else
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = *(_DWORD *)(v15 + 24);
        v17 = *(_QWORD *)(a1 + 80);
        v18 = v16;
        if (v17 > v16)
        {
          v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          v20 = (_QWORD *)(*(_QWORD *)(a1 + 96) + 16 * v16);
          *v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          v20[1] = v19;
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v16 = *(_DWORD *)(v15 + 24);
          v17 = *(_QWORD *)(a1 + 80);
          v18 = v16;
        }
        if (v17 <= v18)
        {
          v23 = 0;
        }
        else
        {
          v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v22 = (_QWORD *)(*(_QWORD *)(a1 + 104) + 16 * v18);
          *v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          v22[1] = v21;
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v16 = *(_DWORD *)(v15 + 24);
          v23 = 1;
        }
        *(_DWORD *)(v15 + 24) = v16 + v23;
      }
      if (!CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 112), theChar))
      {
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v25 = *(_DWORD *)(v24 + 24);
        v26 = *(_QWORD *)(a1 + 80);
        v27 = v25;
        if (v26 > v25)
        {
          v28 = (_QWORD *)(*(_QWORD *)(a1 + 96) + 16 * v25);
          *v28 = v13;
          v28[1] = v12;
          v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v25 = *(_DWORD *)(v24 + 24);
          v26 = *(_QWORD *)(a1 + 80);
          v27 = v25;
        }
        if (v26 <= v27)
        {
          v30 = 0;
        }
        else
        {
          v29 = (_QWORD *)(*(_QWORD *)(a1 + 104) + 16 * v27);
          *v29 = a4;
          v29[1] = a5;
          v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v25 = *(_DWORD *)(v24 + 24);
          v30 = 1;
        }
        *(_DWORD *)(v24 + 24) = v25 + v30;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v12 + v13;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a4 + a5;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v31 + 32) = v13;
    *(_QWORD *)(v31 + 40) = v12;
  }
}

- (int)tokenizeToIds:(float *)a3 ranges:(_NSRange *)a4 wordIndexes:(int64_t *)a5 fromString:(id)a6 wordTokens:(_NSRange *)a7 wordTokensUTF8:(_NSRange *)a8 wordCount:(int)a9 length:(unint64_t)a10
{
  unint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  _NSRange *v16;
  int64_t v17;
  unsigned __int16 *v18;
  const __CFAllocator *v19;
  unint64_t v20;
  uint64_t v21;
  _NSRange *v22;
  unint64_t length;
  int v24;
  _NSRange *v25;
  NSUInteger location;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  _BOOL4 v31;
  unint64_t v32;
  const UniChar *v33;
  NSUInteger v34;
  __CFString *v35;
  const __CFString *v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  int v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  unsigned int v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  _NSRange *v49;
  NSUInteger v50;
  int v51;
  unint64_t v52;
  unint64_t v53;
  unsigned __int16 *v54;
  int v55;
  int v56;
  id v58;
  unint64_t v59;
  int v60;
  _NSRange *v61;
  id v65;
  uint64_t v66;
  unint64_t v67;
  _NSRange *v68;
  int64x2_t v69;
  int v70;
  NSUInteger v71;
  NSUInteger v72;
  NSUInteger v73;
  uint64_t v74;
  void *v75;

  v12 = a9;
  v65 = a6;
  v13 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 206));
  objc_msgSend(CFSTR("##"), "getCharacters:range:", objc_msgSend(v13, "mutableBytes"), 0, 2);
  v75 = (void *)objc_opt_new();
  v58 = objc_retainAutorelease(v13);
  v74 = objc_msgSend(v58, "mutableBytes");
  LODWORD(v14) = 1;
  if (a9 >= 1)
  {
    v15 = a10;
    if (a10 != 1)
    {
      v16 = a8;
      v17 = 0;
      v18 = (unsigned __int16 *)(v74 + 4);
      v19 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
      v20 = 1;
      v21 = 1;
      v61 = a8;
      v68 = a7;
      do
      {
        v22 = &a7[v17];
        length = v22->length;
        if (length < 0x65)
        {
          v25 = v16;
          v69 = (int64x2_t)v16[v17];
          location = v22->location;
          v27 = length + v22->location;
          objc_msgSend(v65, "getCharacters:range:", v18, v22->location);
          if (location >= v27)
          {
            v14 = v21;
            v16 = v25;
            v12 = a9;
            a7 = v68;
          }
          else
          {
            v28 = v27;
            v59 = v20;
            v29 = v69.i64[0];
            v66 = vaddvq_s64(v69);
            v60 = v21;
            LODWORD(v14) = v21;
            v30 = location;
            v71 = location;
            v67 = v27;
            while (1)
            {
              v73 = v29;
              v70 = v14;
              v31 = v30 == location;
              v72 = v30;
              v32 = v28 - v30;
              if (!v32)
                break;
              v33 = (const UniChar *)(v74 + 4 * v31);
              v34 = v66 - v73;
              while (1)
              {
                v35 = v75;
                v36 = CFStringCreateWithCharactersNoCopy(0, v33, v32 + 2 * (v72 != v71), v19);
                CFStringReplaceAll(v35, v36);

                CFRelease(v36);
                v37 = -[BurstTrieDictionary payloadForString:](self->_vocab, "payloadForString:", v35);
                if (v37 != -1)
                  break;
                if (v32 == 1)
                {
                  v38 = *v18;
                }
                else
                {
                  v39 = *(unsigned __int16 *)(v74 + 2 * v32);
                  v40 = v18[v32 - 1];
                  v41 = (v39 & 0xFC00) == 0xD800 && (v40 & 0xFC00) == 56320;
                  v38 = v40 + (v39 << 10) - 56613888;
                  if (!v41)
                    v38 = v18[v32 - 1];
                }
                if (HIWORD(v38))
                  v42 = -2;
                else
                  v42 = -1;
                if (v38 - 128 < 0x780)
                  v43 = -2;
                else
                  v43 = -1;
                v44 = (v38 - 2048) >> 11 > 0x1E;
                v45 = v38 - 0x10000;
                v46 = -3;
                if (v44)
                  v46 = v43;
                v47 = v45 >= 0x100000;
                v48 = -4;
                if (v47)
                  v48 = v46;
                v34 += v48;
                v32 += v42;
                if (!v32)
                  goto LABEL_40;
              }
              if (v70 >= a10)
              {
                v51 = 0;
                v12 = a9;
                a7 = v68;
                v52 = v67;
                v50 = v73;
              }
              else
              {
                v49 = &a4[v70];
                v50 = v73;
                v49->location = v73;
                v49->length = v34;
                a5[v70] = v17;
                a3[v70] = (float)v37;
                v51 = 1;
                v12 = a9;
                a7 = v68;
                v52 = v67;
              }
              v53 = v52 - (v32 + v72);
              v54 = &v18[v32];
              v30 = v32 + v72;
              memmove(v18, v54, 2 * v53);
              v28 = v67;
              v14 = (v51 + v70);
              v29 = v34 + v50;
              v15 = a10;
              location = v71;
              v16 = v61;
              if (v67 <= v30)
                goto LABEL_44;
            }
LABEL_40:
            v15 = a10;
            if (v59 >= a10)
            {
              v55 = 0;
            }
            else
            {
              a4[v59] = (_NSRange)v69;
              a5[v59] = v17;
              a3[v59] = self->_unkId;
              v55 = 1;
            }
            v16 = v61;
            v12 = a9;
            a7 = v68;
            v14 = (v55 + v60);
          }
        }
        else
        {
          if (v20 >= v15)
          {
            v24 = 0;
          }
          else
          {
            a4[v20] = v16[v17];
            a5[v20] = v17;
            a3[v20] = self->_unkId;
            v24 = 1;
          }
          v14 = (v24 + v21);
        }
LABEL_44:
        if (++v17 >= v12)
          break;
        v20 = (int)v14;
        v21 = v14;
      }
      while ((int)v14 != v15);
    }
  }
  v56 = v14;

  return v56;
}

- (float)startId
{
  return (float)-[BurstTrieDictionary payloadForString:](self->_vocab, "payloadForString:", CFSTR("[CLS]"));
}

- (float)endId
{
  return (float)-[BurstTrieDictionary payloadForString:](self->_vocab, "payloadForString:", CFSTR("[SEP]"));
}

- (float)padId
{
  return (float)-[BurstTrieDictionary payloadForString:](self->_vocab, "payloadForString:", CFSTR("[PAD]"));
}

- (float)unkId
{
  return (float)-[BurstTrieDictionary payloadForString:](self->_vocab, "payloadForString:", CFSTR("[UNK]"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
}

void __75__WordPieceTokenizerObjc_toWordTokens_wordTokensUTF8_fromInput_withLength___block_invoke_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_2488EF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "WordPieceTokenizer: Invalid UTF32 character %u", (uint8_t *)v1, 8u);
}

@end

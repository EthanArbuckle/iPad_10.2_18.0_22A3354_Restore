@implementation PMLWordPieceTokenizer

- (PMLWordPieceTokenizer)initWithVocab:(id)a3
{
  id v6;
  PMLWordPieceTokenizer *v7;
  PMLWordPieceTokenizer *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLWordPieceTokenizer.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vocab"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PMLWordPieceTokenizer;
  v7 = -[PMLWordPieceTokenizer init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_vocab, a3);

  return v8;
}

- (id)tokenize:(id)a3 withLength:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  int v15;
  int v16;
  id v17;
  uint64_t v18;
  void *memptr;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 >= 0x200)
    v7 = 512;
  else
    v7 = a4;
  v8 = (4 * v7) | 3;
  memptr = 0;
  v20 = 0;
  if (v8 > 0x194)
  {
    v15 = malloc_type_posix_memalign(&memptr, 8uLL, 4 * v7, 0x100004052888210uLL);
    LOBYTE(v20) = 0;
    if (v15)
      goto LABEL_17;
    v9 = (char *)memptr;
  }
  else
  {
    v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v9, (4 * v7) | 3);
  }
  v10 = (16 * v7) | 7;
  memptr = 0;
  v20 = 0;
  if (v10 <= 0x328)
  {
    v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v11, (16 * v7) | 7);
    goto LABEL_8;
  }
  v16 = malloc_type_posix_memalign(&memptr, 8uLL, 16 * v7, 0x1000040451B5BE8uLL);
  LOBYTE(v20) = 0;
  if (v16)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  v11 = (char *)memptr;
LABEL_8:
  v12 = (void *)MEMORY[0x2199EA600]();
  +[PMLSparseVector sparseVectorFromDense:length:](PMLSparseVector, "sparseVectorFromDense:length:", v9, -[PMLWordPieceTokenizer tokenizeToIds:fromString:tokens:tokenCount:length:](self, "tokenizeToIds:fromString:tokens:tokenCount:length:", v9, v6, v11, -[PMLWordPieceTokenizer toTokens:fromInput:withLength:](self, "toTokens:fromInput:withLength:", v11, v6, v7), v7));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v12);
  if (v8 >= 0x195)
    free(v9);
  if (v10 >= 0x329)
    free(v11);

  return v13;
}

- (int)toTokens:(_NSRange *)a3 fromInput:(id)a4 withLength:(unint64_t)a5
{
  id v7;
  NSUInteger v8;
  uint64_t *v9;
  int v10;
  _NSRange *v11;
  int v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;

  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  _PASIterateLongChars();
  v8 = v15[3];
  v9 = v23;
  v10 = *((_DWORD *)v23 + 6);
  if (v8)
  {
    if (v10 >= a5)
    {
      v12 = 0;
    }
    else
    {
      v11 = &a3[v10];
      v11->location = v19[3];
      v11->length = v8;
      v12 = 1;
    }
    v10 += v12;
    *((_DWORD *)v9 + 6) = v10;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (int)tokenizeToIds:(float *)a3 fromString:(id)a4 tokens:(_NSRange *)a5 tokenCount:(int)a6 length:(unint64_t)a7
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFAllocator *v16;
  unint64_t v17;
  unint64_t v18;
  _NSRange *v19;
  unint64_t length;
  unsigned int v21;
  int v22;
  NSUInteger location;
  unint64_t v24;
  NSUInteger v25;
  unint64_t v26;
  const UniChar *v27;
  __CFString *v28;
  const __CFString *v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  int v33;
  unint64_t v34;
  void *v35;
  void *v36;
  SEL v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v46;
  id v47;
  char *__dst;
  NSUInteger v49;

  v47 = a4;
  v10 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 206));
  objc_msgSend(CFSTR("##"), "getCharacters:range:", objc_msgSend(v10, "mutableBytes"), 0, 2);
  v11 = (void *)objc_opt_new();
  v12 = objc_retainAutorelease(v10);
  v46 = objc_msgSend(v12, "mutableBytes");
  LODWORD(v13) = 0;
  v39 = v12;
  if (a6 >= 1)
  {
    v38 = a2;
    if (a7)
    {
      v14 = 0;
      v15 = 0;
      __dst = (char *)(v46 + 4);
      v16 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
      v17 = a6;
      v18 = 0;
      v43 = v17;
      v44 = a7;
      do
      {
        v19 = &a5[v14];
        length = v19->length;
        if (length < 0x65)
        {
          location = v19->location;
          v24 = length + v19->location;
          objc_msgSend(v47, "getCharacters:range:", __dst, v19->location);
          if (location >= v24)
          {
            v13 = v15;
          }
          else
          {
            v40 = v24;
            v41 = v18;
            v25 = location;
            v42 = v15;
            LODWORD(v13) = v15;
            v49 = location;
            while (1)
            {
              v26 = v24 - v25;
              if (v24 == v25)
                break;
              v27 = (const UniChar *)(v46 + 4 * (v25 == location));
              while (1)
              {
                v28 = v11;
                v29 = CFStringCreateWithCharactersNoCopy(0, v27, 2 * (v25 != v49) + v26, v16);
                CFStringReplaceAll(v28, v29);

                CFRelease(v29);
                v30 = -[PMLWordPieceVocabProtocol payloadForString:](self->_vocab, "payloadForString:", v28);
                if (v30 != -1)
                  break;
                if (!--v26)
                  goto LABEL_24;
              }
              a7 = v44;
              if ((int)v13 >= v44)
              {
                v31 = 0;
              }
              else
              {
                a3[(int)v13] = (float)v30;
                v31 = 1;
              }
              v17 = v43;
              v25 += v26;
              v24 = v40;
              memmove(__dst, &__dst[2 * v26], 2 * (v40 - v25));
              v13 = (v31 + v13);
              location = v49;
              if (v40 <= v25)
                goto LABEL_30;
            }
LABEL_24:
            v32 = -[PMLWordPieceVocabProtocol payloadForString:](self->_vocab, "payloadForString:", CFSTR("[UNK]"));
            if (v32 == -1)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v38, self, CFSTR("PMLWordPieceTokenizer.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unkToken != PMLWordPieceVocabNotFound"));

            }
            a7 = v44;
            if (v41 >= v44)
            {
              v33 = 0;
            }
            else
            {
              a3[v41] = (float)v32;
              v33 = 1;
            }
            v17 = v43;
            v13 = (v33 + v42);
          }
        }
        else
        {
          v21 = -[PMLWordPieceVocabProtocol payloadForString:](self->_vocab, "payloadForString:", CFSTR("[UNK]"));
          if (v21 == -1)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v34 = v18;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v38, self, CFSTR("PMLWordPieceTokenizer.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unkToken != PMLWordPieceVocabNotFound"));

            v18 = v34;
          }
          if (v18 >= a7)
          {
            v22 = 0;
          }
          else
          {
            a3[v18] = (float)v21;
            v22 = 1;
          }
          v13 = (v22 + v15);
        }
LABEL_30:
        if (++v14 >= v17)
          break;
        v18 = (int)v13;
        v15 = v13;
      }
      while ((int)v13 != a7);
    }
  }

  return v13;
}

- (unsigned)startId
{
  unsigned int v4;
  void *v6;

  v4 = -[PMLWordPieceVocabProtocol payloadForString:](self->_vocab, "payloadForString:", CFSTR("[CLS]"));
  if (v4 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLWordPieceTokenizer.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startId != PMLWordPieceVocabNotFound"));

  }
  return v4;
}

- (unsigned)endId
{
  unsigned int v4;
  void *v6;

  v4 = -[PMLWordPieceVocabProtocol payloadForString:](self->_vocab, "payloadForString:", CFSTR("[SEP]"));
  if (v4 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLWordPieceTokenizer.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endId != PMLWordPieceVocabNotFound"));

  }
  return v4;
}

- (unsigned)padId
{
  unsigned int v4;
  void *v6;

  v4 = -[PMLWordPieceVocabProtocol payloadForString:](self->_vocab, "payloadForString:", CFSTR("[PAD]"));
  if (v4 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLWordPieceTokenizer.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("padId != PMLWordPieceVocabNotFound"));

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
}

uint64_t __55__PMLWordPieceTokenizer_toTokens_fromInput_withLength___block_invoke(uint64_t result, UTF32Char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  _QWORD *v17;
  int v18;

  if (*(_QWORD *)(result + 56) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v8 = result;
    result = CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(result + 64), a2);
    v9 = *(_QWORD *)(*(_QWORD *)(v8 + 40) + 8);
    v10 = *(_QWORD *)(v9 + 24);
    if (a2 == 176 || (_DWORD)result)
    {
      *(_QWORD *)(v9 + 24) = v10 + a5;
    }
    else
    {
      if (v10)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(v8 + 32) + 8);
        v12 = *(_DWORD *)(v11 + 24);
        if (*(_QWORD *)(v8 + 56) <= (unint64_t)v12)
        {
          v14 = 0;
        }
        else
        {
          v13 = (_QWORD *)(*(_QWORD *)(v8 + 72) + 16 * v12);
          *v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 48) + 8) + 24);
          v13[1] = v10;
          v11 = *(_QWORD *)(*(_QWORD *)(v8 + 32) + 8);
          v12 = *(_DWORD *)(v11 + 24);
          v14 = 1;
        }
        *(_DWORD *)(v11 + 24) = v12 + v14;
      }
      result = CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(v8 + 80), a2);
      if (!(_DWORD)result)
      {
        v15 = *(_QWORD *)(*(_QWORD *)(v8 + 32) + 8);
        v16 = *(_DWORD *)(v15 + 24);
        if (*(_QWORD *)(v8 + 56) <= (unint64_t)v16)
        {
          v18 = 0;
        }
        else
        {
          v17 = (_QWORD *)(*(_QWORD *)(v8 + 72) + 16 * v16);
          *v17 = a4;
          v17[1] = a5;
          v15 = *(_QWORD *)(*(_QWORD *)(v8 + 32) + 8);
          v16 = *(_DWORD *)(v15 + 24);
          v18 = 1;
        }
        *(_DWORD *)(v15 + 24) = v16 + v18;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 48) + 8) + 24) = a4 + a5;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 40) + 8) + 24) = 0;
    }
  }
  return result;
}

@end

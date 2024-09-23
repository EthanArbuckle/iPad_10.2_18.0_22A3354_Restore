@implementation PMLHashingVectorizer

- (PMLHashingVectorizer)initWithBucketSize:(int)a3 ngrams:(int)a4 localeForNonwordTokens:(id)a5 tokenizeNewlines:(BOOL)a6
{
  uint64_t v7;
  uint64_t v8;

  LOBYTE(v8) = a6;
  LOBYTE(v7) = 0;
  return -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:](self, "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", *(_QWORD *)&a3, 0, 0, 1, a4, 1, v7, a5, v8, 0, 0, 0, 2, 0);
}

- (PMLHashingVectorizer)initWithBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9 idVectorLength:(unint64_t)a10 extraIdOptions:(unint64_t)a11 vectorizerStrategy:(unint64_t)a12 vectorNormalization:(int64_t)a13 vocab:(id)a14
{
  NSUInteger length;
  id v18;
  id v19;
  PMLHashingVectorizer *v20;
  PMLHashingVectorizer *v21;
  unint64_t v22;
  int32x2_t v23;
  int8x16_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSUInteger location;
  NSUInteger v34;
  NSUInteger v35;
  objc_super v36;

  length = a5.length;
  location = a5.location;
  v34 = a4.length;
  v35 = a4.location;
  v18 = a8;
  v19 = a14;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLHashingVectorizer.m"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("buckets > 0"));

  }
  if (a11 >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLHashingVectorizer.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extraIdOptions < PMLHashingVectorizerIdOptionLimit"));

  }
  if (a12 >= 7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLHashingVectorizer.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vectorizerStrategy < PMLHashingVectorizerStrategyLimit"));

  }
  if ((unint64_t)(a13 - 5) <= 0xFFFFFFFFFFFFFFF9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLHashingVectorizer.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vectorNormalization >= PMLVectorNormalizationNone && vectorNormalization < PMLVectorNormalizationLimit"));

  }
  if ((!v35 || !v34) && (!location || !length))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLHashingVectorizer.m"), 381, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(characterNGramRange.location && characterNGramRange.length) || (tokenNGramRange.location && tokenNGramRange.length)"));

  }
  if (a12 == 6 && !v19)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLHashingVectorizer.m"), 382, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vectorizerStrategy != PMLHashingVectorizerStrategyWordPiece || vocab != nil"));

  }
  v36.receiver = self;
  v36.super_class = (Class)PMLHashingVectorizer;
  v20 = -[PMLHashingVectorizer init](&v36, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_buckets = a3;
    v20->_characterNGramRange.location = v35;
    v20->_characterNGramRange.length = v34;
    v20->_tokenNGramRange.location = location;
    v20->_tokenNGramRange.length = length;
    v20->_shouldNormalizeTokens = a6;
    v20->_shouldNormalizeCharacters = a7;
    objc_storeStrong((id *)&v20->_localeForNonwordTokens, a8);
    v21->_tokenizeNewlines = a9;
    if (a10)
      v22 = a10;
    else
      v22 = a3;
    v21->_idVectorLength = v22;
    v21->_extraIdOptions = a11;
    v21->_vectorizerStrategy = a12;
    v21->_vectorNormalization = a13;
    v21->_paddingId = ((uint64_t)(a11 << 63) >> 63) & a3;
    v23 = vadd_s32(vdup_n_s32(a3), (int32x2_t)0x200000001);
    v24.i64[0] = v23.i32[0];
    v24.i64[1] = v23.i32[1];
    *(int8x16_t *)&v21->_endId = vbicq_s8(v24, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(a11), (int8x16_t)xmmword_215A00360)));
    objc_storeStrong((id *)&v21->_vocab, a14);
  }

  return v21;
}

- (void)setVectorizerNormalization:(int64_t)a3
{
  self->_vectorNormalization = a3;
}

- (id)transform:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  PMLHashingVectorizer *v7;
  id v8;
  uint64_t v9;
  PMLHashingVectorizer *v10;
  id v11;
  uint64_t v12;
  uint8_t v14[16];

  v4 = a3;
  switch(self->_vectorizerStrategy)
  {
    case 0uLL:
      v7 = self;
      v8 = v4;
      v9 = 1;
      goto LABEL_8;
    case 1uLL:
      v7 = self;
      v8 = v4;
      v9 = 0;
LABEL_8:
      -[PMLHashingVectorizer transformWithFrequency:shouldDecrement:](v7, "transformWithFrequency:shouldDecrement:", v8, v9);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2uLL:
    case 3uLL:
      -[PMLHashingVectorizer transformSequentialNGrams:](self, "transformSequentialNGrams:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4uLL:
      v10 = self;
      v11 = v4;
      v12 = 1;
      goto LABEL_11;
    case 5uLL:
      v10 = self;
      v11 = v4;
      v12 = 0;
LABEL_11:
      -[PMLHashingVectorizer transformBagOfIds:shouldDecrement:](v10, "transformBagOfIds:shouldDecrement:", v11, v12);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 6uLL:
      -[PMLHashingVectorizer transformWithWordPiece:](self, "transformWithWordPiece:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v6 = (void *)v5;
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_fault_impl(&dword_2159BB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "PMLHashingVectorizer: unknown vectorizer strategy", v14, 2u);
      }
      v6 = 0;
      break;
  }

  return v6;
}

- (id)transformWithFrequency:(id)a3 shouldDecrement:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int v10;
  uint64_t buckets;
  void *v12;
  _QWORD v14[4];
  __int128 v15;
  __int128 v16;

  v6 = a3;
  v16 = 0uLL;
  hashingVectorizeTokens(v6, &v16, self->_buckets, self->_tokenNGramRange.location, LODWORD(self->_tokenNGramRange.length) + LODWORD(self->_tokenNGramRange.location), self->_localeForNonwordTokens, self->_tokenizeNewlines, self->_shouldNormalizeTokens, a4, 0);
  hashingVectorizeCharacters(v6, (uint64_t)&v16, self->_buckets, self->_characterNGramRange.location, LODWORD(self->_characterNGramRange.length) + LODWORD(self->_characterNGramRange.location), self->_shouldNormalizeCharacters, a4, 0);
  qsort(*((void **)&v16 + 1), v16, 8uLL, (int (__cdecl *)(const void *, const void *))compareHashAndCounts);
  v7 = v16;
  if ((_DWORD)v16)
  {
    v8 = 0;
    v9 = (int *)(*((_QWORD *)&v16 + 1) + 4);
    do
    {
      v10 = *v9;
      v9 += 2;
      if (v10)
        ++v8;
      --v7;
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  buckets = self->_buckets;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__PMLHashingVectorizer_transformWithFrequency_shouldDecrement___block_invoke;
  v14[3] = &__block_descriptor_48_e13_v24__0_q8_f16l;
  v15 = v16;
  +[PMLSparseVector sparseVectorWithLength:numberOfNonZeroValues:block:](PMLSparseVector, "sparseVectorWithLength:numberOfNonZeroValues:block:", buckets, v8, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  free(*((void **)&v16 + 1));
  objc_msgSend(v12, "scaleWithVectorNormalization:", self->_vectorNormalization);

  return v12;
}

- (id)transformSequentialNGrams:(id)a3
{
  id v4;
  void *v5;
  unint64_t vectorizerStrategy;
  void *v7;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;

  v4 = a3;
  v5 = v4;
  v11 = 0uLL;
  vectorizerStrategy = self->_vectorizerStrategy;
  if (vectorizerStrategy == 3)
  {
    hashingVectorizeCharacters(v4, (uint64_t)&v11, self->_buckets, self->_characterNGramRange.location, LODWORD(self->_characterNGramRange.length) + LODWORD(self->_characterNGramRange.location), self->_shouldNormalizeTokens, 0, 1);
  }
  else if (vectorizerStrategy == 2)
  {
    hashingVectorizeTokens(v4, &v11, self->_buckets, self->_tokenNGramRange.location, LODWORD(self->_tokenNGramRange.length) + LODWORD(self->_tokenNGramRange.location), self->_localeForNonwordTokens, self->_tokenizeNewlines, self->_shouldNormalizeTokens, 0, 1);
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__PMLHashingVectorizer_transformSequentialNGrams___block_invoke;
  v9[3] = &__block_descriptor_56_e13_v24__0_q8_f16l;
  v9[4] = v11;
  v10 = v11;
  +[PMLSparseVector sparseVectorWithLength:numberOfNonZeroValues:block:](PMLSparseVector, "sparseVectorWithLength:numberOfNonZeroValues:block:", v11, v11, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  free(*((void **)&v11 + 1));
  objc_msgSend(v7, "addStartId:endId:paddingId:withMaxVectorLength:", self->_startId, self->_endId, self->_paddingId, self->_idVectorLength);

  return v7;
}

- (id)transformBagOfIds:(id)a3 shouldDecrement:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v10;
  void *v11;

  v4 = a4;
  v7 = a3;
  if (self->_endId)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLHashingVectorizer.m"), 612, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_endId == 0"));

  }
  if (self->_startId)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLHashingVectorizer.m"), 613, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_startId == 0"));

  }
  -[PMLHashingVectorizer transformWithFrequency:shouldDecrement:](self, "transformWithFrequency:shouldDecrement:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertToBagOfIds");
  objc_msgSend(v8, "addStartId:endId:paddingId:withMaxVectorLength:", self->_startId, self->_endId, self->_paddingId, self->_idVectorLength);

  return v8;
}

- (id)transformBatch:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[PMLHashingVectorizer transform:](self, "transform:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)transformWithWordPiece:(id)a3
{
  id v4;
  PMLWordPieceTokenizer *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = -[PMLWordPieceTokenizer initWithVocab:]([PMLWordPieceTokenizer alloc], "initWithVocab:", self->_vocab);
  -[PMLWordPieceTokenizer tokenize:withLength:](v5, "tokenize:withLength:", v4, self->_idVectorLength);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_startId)
    v7 = -[PMLWordPieceTokenizer startId](v5, "startId");
  else
    v7 = 0;
  if (self->_endId)
    v8 = -[PMLWordPieceTokenizer endId](v5, "endId");
  else
    v8 = 0;
  if (self->_paddingId)
    v9 = -[PMLWordPieceTokenizer padId](v5, "padId");
  else
    v9 = 0;
  objc_msgSend(v6, "addStartId:endId:paddingId:withMaxVectorLength:", v7, v8, v9, self->_idVectorLength);

  return v6;
}

- (id)toPlistWithChunks:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLocale *localeForNonwordTokens;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[13];
  _QWORD v23[15];

  v23[13] = *MEMORY[0x24BDAC8D0];
  v22[0] = CFSTR("BUCKET_SIZE");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_buckets);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v22[1] = CFSTR("NGRAM_SIZE");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_tokenNGramRange.length);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v20;
  v22[2] = CFSTR("CHARACTER_NGRAM_LOCATION");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_characterNGramRange.location);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v19;
  v22[3] = CFSTR("CHARACTER_NGRAM_LENGTH");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_characterNGramRange.length);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  v22[4] = CFSTR("CHARACTER_NORMALIZATION");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldNormalizeCharacters);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v17;
  v22[5] = CFSTR("TOKEN_NGRAM_LOCATION");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_tokenNGramRange.location);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v16;
  v22[6] = CFSTR("TOKEN_NGRAM_LENGTH");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_tokenNGramRange.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v4;
  v22[7] = CFSTR("TOKEN_NORMALIZATION");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldNormalizeTokens);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v5;
  v22[8] = CFSTR("SHOULD_TOKENIZE_NEWLINES");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_tokenizeNewlines);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v6;
  v22[9] = CFSTR("ID_VECTOR_LENGTH");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_idVectorLength);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v7;
  v22[10] = CFSTR("EXTRA_ID_OPTIONS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_extraIdOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v8;
  v22[11] = CFSTR("VECTORIZER_STRATEGY");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_vectorizerStrategy);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[11] = v9;
  v22[12] = CFSTR("VECTOR_NORMALIZATION");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_vectorNormalization);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[12] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  localeForNonwordTokens = self->_localeForNonwordTokens;
  if (localeForNonwordTokens)
  {
    -[NSLocale localeIdentifier](localeForNonwordTokens, "localeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("NON_WORD_TOKENS_LOCALE"));

  }
  return v12;
}

- (PMLHashingVectorizer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  PMLHashingVectorizer *v42;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  int v49;
  unsigned int v50;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BUCKET_SIZE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v6, "intValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NGRAM_SIZE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CHARACTER_NGRAM_LOCATION"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &unk_24D3EAD00;
  v49 = objc_msgSend(v9, "intValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CHARACTER_NGRAM_LENGTH"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = &unk_24D3EAD00;
  v48 = objc_msgSend(v11, "intValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TOKEN_NGRAM_LOCATION"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &unk_24D3EAD18;
  v47 = objc_msgSend(v13, "intValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TOKEN_NGRAM_LENGTH"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v46 = objc_msgSend(v15, "intValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v17, "intValue");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TOKEN_NORMALIZATION"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
    v18 = (void *)MEMORY[0x24BDBD1C8];
  v20 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CHARACTER_NORMALIZATION"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = (void *)MEMORY[0x24BDBD1C0];
  if (!v21)
    v21 = (void *)MEMORY[0x24BDBD1C0];
  v24 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SHOULD_TOKENIZE_NEWLINES"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = v23;
  v27 = objc_msgSend(v25, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ID_VECTOR_LENGTH"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (!v28)
    v28 = &unk_24D3EAD00;
  v30 = objc_msgSend(v28, "intValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EXTRA_ID_OPTIONS"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (!v31)
    v31 = &unk_24D3EAD00;
  v33 = objc_msgSend(v31, "intValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VECTORIZER_STRATEGY"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
    v34 = &unk_24D3EAD30;
  v36 = objc_msgSend(v34, "intValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VECTOR_NORMALIZATION"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (!v37)
    v37 = &unk_24D3EAD48;
  v39 = objc_msgSend(v37, "intValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NON_WORD_TOKENS_LOCALE"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = 0;
  }
  LOBYTE(v45) = v27;
  LOBYTE(v44) = v24;
  v42 = -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:](self, "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", v50, v49, v48, v47, v46, v20, v44, v41, v45, v30, v33, v36, v39, 0);

  return v42;
}

- (BOOL)isEqualToHashingVectorizer:(id)a3
{
  id *v4;
  id *v5;
  BOOL v7;
  NSLocale *localeForNonwordTokens;
  NSLocale *v9;
  NSLocale *v10;
  NSLocale *v11;
  char v12;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4 || self->_buckets != *((_DWORD *)v4 + 2) || (id)self->_vectorizerStrategy != v4[11])
    goto LABEL_22;
  if ((id)self->_characterNGramRange.location != v4[2] || self->_characterNGramRange.length != (_QWORD)v4[3])
    goto LABEL_22;
  v7 = 0;
  if ((id)self->_tokenNGramRange.location == v4[4] && (id)self->_tokenNGramRange.length == v4[5])
  {
    if (self->_shouldNormalizeTokens != *((unsigned __int8 *)v4 + 48)
      || self->_shouldNormalizeCharacters != *((unsigned __int8 *)v4 + 49))
    {
      goto LABEL_22;
    }
    localeForNonwordTokens = self->_localeForNonwordTokens;
    v9 = (NSLocale *)v4[7];
    if (localeForNonwordTokens == v9)
    {

    }
    else
    {
      v10 = v9;
      v11 = localeForNonwordTokens;
      v12 = -[NSLocale isEqual:](v11, "isEqual:", v10);

      if ((v12 & 1) == 0)
      {
LABEL_22:
        v7 = 0;
        goto LABEL_23;
      }
    }
    if (self->_tokenizeNewlines != *((unsigned __int8 *)v5 + 64)
      || (id)self->_idVectorLength != v5[9]
      || (id)self->_extraIdOptions != v5[10]
      || (id)self->_vectorizerStrategy != v5[11])
    {
      goto LABEL_22;
    }
    v7 = self->_vectorNormalization == (_QWORD)v5[12];
  }
LABEL_23:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PMLHashingVectorizer *v4;
  PMLHashingVectorizer *v5;
  BOOL v6;

  v4 = (PMLHashingVectorizer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PMLHashingVectorizer isEqualToHashingVectorizer:](self, "isEqualToHashingVectorizer:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = self->_vectorizerStrategy - self->_buckets + 32 * self->_buckets;
  v4 = self->_characterNGramRange.location - v3 + 32 * v3;
  v5 = self->_characterNGramRange.length - v4 + 32 * v4;
  v6 = self->_tokenNGramRange.location - v5 + 32 * v5;
  v7 = self->_shouldNormalizeTokens
     - (self->_tokenNGramRange.length
      - v6
      + 32 * v6)
     + 32 * (self->_tokenNGramRange.length - v6 + 32 * v6);
  v8 = self->_shouldNormalizeCharacters - v7 + 32 * v7;
  v9 = -[NSLocale hash](self->_localeForNonwordTokens, "hash");
  v10 = self->_tokenizeNewlines - (v9 - v8 + 32 * v8) + 32 * (v9 - v8 + 32 * v8);
  v11 = self->_idVectorLength - v10 + 32 * v10;
  v12 = self->_extraIdOptions - v11 + 32 * v11;
  v13 = self->_vectorizerStrategy - v12 + 32 * v12;
  return self->_vectorNormalization - v13 + 32 * v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_localeForNonwordTokens, 0);
}

float __50__PMLHashingVectorizer_transformSequentialNGrams___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  float result;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = 0;
    v5 = *(unsigned int **)(a1 + 48);
    do
    {
      *(_QWORD *)(a2 + 8 * v4) = v4;
      v6 = *v5;
      v5 += 2;
      result = (float)v6;
      *(float *)(a3 + 4 * v4++) = (float)v6;
    }
    while (v3 != v4);
  }
  return result;
}

uint64_t __63__PMLHashingVectorizer_transformWithFrequency_shouldDecrement___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
  int *v5;
  int v6;

  v3 = *(unsigned int *)(result + 32);
  if ((_DWORD)v3)
  {
    v4 = 0;
    v5 = (int *)(*(_QWORD *)(result + 40) + 4);
    do
    {
      v6 = *v5;
      if (*v5)
      {
        *(_QWORD *)(a2 + 8 * v4) = *(v5 - 1);
        *(float *)(a3 + 4 * v4++) = (float)v6;
      }
      v5 += 2;
      --v3;
    }
    while (v3);
  }
  return result;
}

+ (id)withBucketSize:(int)a3 andNgramOrder:(int)a4
{
  uint64_t v5;
  uint64_t v6;

  LOBYTE(v6) = 0;
  LOBYTE(v5) = 0;
  return -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:]([PMLHashingVectorizer alloc], "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", *(_QWORD *)&a3, 0, 0, a4, 1, 1, v5, 0, v6, 0, 0, 2, -1, 0);
}

+ (id)withBucketSize:(int)a3 andCharNgramOrder:(int)a4
{
  uint64_t v5;
  uint64_t v6;

  LOBYTE(v6) = 0;
  LOBYTE(v5) = 0;
  return -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:]([PMLHashingVectorizer alloc], "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", *(_QWORD *)&a3, a4, 1, 0, 0, 1, v5, 0, v6, 0, 0, 3, -1, 0);
}

+ (id)withBucketSize:(int)a3 andNgrams:(int)a4
{
  return -[PMLHashingVectorizer initWithBucketSize:ngrams:localeForNonwordTokens:tokenizeNewlines:]([PMLHashingVectorizer alloc], "initWithBucketSize:ngrams:localeForNonwordTokens:tokenizeNewlines:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0, 0);
}

+ (id)withBucketSize:(int)a3 ngrams:(int)a4 localeForNonwordTokens:(id)a5 tokenizeNewlines:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  PMLHashingVectorizer *v10;

  v6 = a6;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v9 = a5;
  v10 = -[PMLHashingVectorizer initWithBucketSize:ngrams:localeForNonwordTokens:tokenizeNewlines:]([PMLHashingVectorizer alloc], "initWithBucketSize:ngrams:localeForNonwordTokens:tokenizeNewlines:", v8, v7, v9, v6);

  return v10;
}

+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9 idVectorLength:(unint64_t)a10 extraIdOptions:(unint64_t)a11 vectorizerStrategy:(unint64_t)a12 vectorNormalization:(int64_t)a13
{
  NSUInteger location;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  id v17;
  PMLHashingVectorizer *v18;
  uint64_t v20;
  uint64_t v21;
  NSUInteger length;
  _BOOL4 v23;

  v23 = a6;
  length = a5.length;
  location = a5.location;
  v14 = a4.length;
  v15 = a4.location;
  v16 = *(_QWORD *)&a3;
  v17 = a8;
  LOBYTE(v21) = a9;
  LOBYTE(v20) = a7;
  v18 = -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:]([PMLHashingVectorizer alloc], "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", v16, v15, v14, location, length, v23, v20, v17, v21, a10, a11, a12, a13, 0);

  return v18;
}

+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9 idVectorLength:(unint64_t)a10 extraIdOptions:(unint64_t)a11 vectorizerStrategy:(unint64_t)a12 vectorNormalization:(int64_t)a13 vocab:(id)a14
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v16;
  id v17;
  id v18;
  PMLHashingVectorizer *v19;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v24;

  v24 = a6;
  length = a4.length;
  location = a4.location;
  v16 = *(_QWORD *)&a3;
  v17 = a14;
  v18 = a8;
  LOBYTE(v22) = a9;
  LOBYTE(v21) = a7;
  v19 = -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:]([PMLHashingVectorizer alloc], "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", v16, location, length, a5.location, a5.length, v24, v21, v18, v22, a10, a11, a12, a13, v17);

  return v19;
}

+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9
{
  _BOOL8 v9;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  id v15;
  PMLHashingVectorizer *v16;
  uint64_t v18;
  uint64_t v19;

  v9 = a6;
  length = a5.length;
  location = a5.location;
  v12 = a4.length;
  v13 = a4.location;
  v14 = *(_QWORD *)&a3;
  v15 = a8;
  LOBYTE(v19) = a9;
  LOBYTE(v18) = a7;
  v16 = -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:]([PMLHashingVectorizer alloc], "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", v14, v13, v12, location, length, v9, v18, v15, v19, 0, 0, 0, 2, 0);

  return v16;
}

+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7
{
  uint64_t v8;
  uint64_t v9;

  LOBYTE(v9) = 0;
  LOBYTE(v8) = a7;
  return +[PMLHashingVectorizer withBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:](PMLHashingVectorizer, "withBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:", *(_QWORD *)&a3, a4.location, a4.length, a5.location, a5.length, a6, v8, 0, v9);
}

@end

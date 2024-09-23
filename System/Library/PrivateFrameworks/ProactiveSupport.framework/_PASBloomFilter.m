@implementation _PASBloomFilter

- (_PASBloomFilter)initWithData:(id)a3 numBits:(unsigned int)a4 hashFunctionCode:(unsigned int)a5 numHashFunctions:(int)a6
{
  id v11;
  _PASBloomFilter *v12;
  _PASBloomFilter *v13;
  int v14;
  void *v15;
  _PASBloomFilter *v16;
  objc_super v18;
  uint8_t buf[4];
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_PASBloomFilter;
  v12 = -[_PASBloomFilter init](&v18, sel_init);
  v13 = v12;
  if (!v12)
  {
LABEL_11:
    v16 = v13;
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v12->_data, a3);
  v13->_numBits = a4;
  v13->_numHashFunctions = a6;
  if (a6 <= 4)
    v14 = 4;
  else
    v14 = a6;
  v13->_hashArrayLength = v14;
  if (a5 == 1)
  {
    v15 = computeHashes_MURMUR3_X86_32;
LABEL_9:
    v13->_computeHashes = v15;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v20 = a5;
      _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Hash function code: %i", buf, 8u);
    }
    goto LABEL_11;
  }
  if (a5 == 2)
  {
    v15 = computeHashes_MURMUR3_X64_128;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v20 = a5;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported hash function code: %i", buf, 8u);
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (id)initDummy
{
  _PASBloomFilter *v2;
  _PASBloomFilter *v3;
  NSData *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PASBloomFilter;
  v2 = -[_PASBloomFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    data = v2->_data;
    v2->_data = 0;

    *(_QWORD *)&v3->_numBits = 0;
    v3->_hashArrayLength = 0;
    v3->_computeHashes = computeHashes_NOOP;
  }
  return v3;
}

- (id)newHashesArray
{
  return -[_PASBloomFilterHashArray initWithCapacity:]([_PASBloomFilterHashArray alloc], "initWithCapacity:", self->_hashArrayLength);
}

- (int)numHashes
{
  return self->_numHashFunctions;
}

- (id)computeHashesForString:(id)a3 reuse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  _PASRepairString(v6);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  -[_PASBloomFilter _computeHashesWithSeed:bytes:length:reuse:](self, "_computeHashesWithSeed:bytes:length:reuse:", 1, v10, strlen(v10), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);

  return v11;
}

- (id)computeHashesWithSeed:(int)a3 forData:(id)a4 reuse:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = *(_QWORD *)&a3;
  v8 = objc_retainAutorelease(a4);
  v9 = a5;
  v10 = v8;
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  -[_PASBloomFilter _computeHashesWithSeed:bytes:length:reuse:](self, "_computeHashesWithSeed:bytes:length:reuse:", v6, v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_computeHashesWithSeed:(int)a3 bytes:(const void *)a4 length:(unint64_t)a5 reuse:(id)a6
{
  uint64_t v8;
  id v11;
  void *v13;

  v8 = *(_QWORD *)&a3;
  v11 = a6;
  if (!v11)
  {
    v11 = -[_PASBloomFilter newHashesArray](self, "newHashesArray");
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASBloomFilter.m"), 261, CFSTR("newHashesArray unexpectedly returned nil"));

      v11 = 0;
    }
  }
  if (self->_numHashFunctions)
    ((void (*)(uint64_t, _QWORD, uint64_t, const void *, unint64_t))self->_computeHashes)(objc_msgSend(objc_retainAutorelease(v11), "hashes"), self->_numHashFunctions, v8, a4, a5);
  return v11;
}

- (BOOL)getWithHashes:(id)a3
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  char v13;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "hashes");
  v13 = 0;
  v5 = 1;
  if (self->_numHashFunctions >= 1)
  {
    v6 = v4;
    v7 = 0;
    while (1)
    {
      v8 = *(_DWORD *)(v6 + 4 * v7);
      if (v8 < 0)
        v8 = -v8;
      v9 = v8 % self->_numBits;
      v10 = 1 << (v9 & 7);
      -[NSData getBytes:range:](self->_data, "getBytes:range:", &v13, (v9 >> 3) + 16, 1);
      v11 = (v13 & v10);
      v13 &= v10;
      if (!v11)
        break;
      if (++v7 >= self->_numHashFunctions)
        return 1;
    }
    return 0;
  }
  return v5;
}

- (id)combineHashesWithSeed:(int)a3 hashA:(id)a4 hashB:(id)a5 reuse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v12)
    v12 = -[_PASBloomFilter newHashesArray](self, "newHashesArray");
  v13 = objc_retainAutorelease(v12);
  v14 = objc_msgSend(v13, "hashes");
  v15 = objc_retainAutorelease(v10);
  v16 = objc_msgSend(v15, "hashes");
  v17 = objc_retainAutorelease(v11);
  v18 = objc_msgSend(v17, "hashes");
  if (self->_numHashFunctions >= 1)
  {
    v19 = 0;
    do
    {
      v20 = 715827883 * ((int)v19 * (int)v19 - 1) * (int)v19;
      *(_DWORD *)(v14 + 4 * v19) = *(_DWORD *)(v16 + 4 * v19)
                                 + HIDWORD(v20)
                                 + (v20 >> 63)
                                 + *(_DWORD *)(v18 + 4 * v19) * (a3 + v19);
      ++v19;
    }
    while (v19 < self->_numHashFunctions);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (id)bloomFilterWithData:(id)a3
{
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  _PASBloomFilter *v13;
  _PASBloomFilter *v15;
  void *v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASBloomFilter.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v17 = 0uLL;
  objc_msgSend(v5, "getBytes:range:", &v17, 0, 16);
  v6 = v17;
  if ((_DWORD)v17 == 390004919)
  {
    LODWORD(v17) = -1224720617;
    *(int8x8_t *)((char *)&v17 + 4) = vrev32_s8(*(int8x8_t *)((char *)&v17 + 4));
    HIDWORD(v17) = bswap32(HIDWORD(v17));
    v7 = DWORD1(v17);
  }
  else
  {
    if ((_DWORD)v17 != -1224720617)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        v19 = v6;
        v20 = 1024;
        v21 = -1224720617;
        v10 = MEMORY[0x1E0C81028];
        v11 = "Bad header, %i vs. %i.";
        v12 = 14;
LABEL_19:
        _os_log_error_impl(&dword_1A0957000, v10, OS_LOG_TYPE_ERROR, v11, buf, v12);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    v7 = DWORD1(v17);
  }
  if ((v7 - 1) >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = v7;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Unsupported hash function code: %i.";
      goto LABEL_18;
    }
  }
  else
  {
    v8 = DWORD2(v17);
    if (objc_msgSend(v5, "length") - 16 == v8)
    {
      v9 = HIDWORD(v17);
      if ((HIDWORD(v17) - 65) > 0xFFFFFFBF)
      {
        v15 = [_PASBloomFilter alloc];
        v13 = -[_PASBloomFilter initWithData:numBits:hashFunctionCode:numHashFunctions:](v15, "initWithData:numBits:hashFunctionCode:numHashFunctions:", v5, (8 * DWORD2(v17)), DWORD1(v17), HIDWORD(v17));
        goto LABEL_21;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v19 = v9;
        v10 = MEMORY[0x1E0C81028];
        v11 = "Unexpected number of hash functions: %i.";
LABEL_18:
        v12 = 8;
        goto LABEL_19;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = DWORD2(v17);
      v10 = MEMORY[0x1E0C81028];
      v11 = "Unexpected capacity: %i.";
      goto LABEL_18;
    }
  }
LABEL_20:
  v13 = 0;
LABEL_21:

  return v13;
}

+ (id)bloomFilterWithPathToFile:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASBloomFilter.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASBloomFilter: loading bloom filter from path '%@'", buf, 0xCu);
  }
  v14 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 8, &v14);
  v7 = v14;
  v8 = v7;
  if (v6)
  {
    +[_PASBloomFilter bloomFilterWithData:](_PASBloomFilter, "bloomFilterWithData:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v7, "code") == 2
      && (objc_msgSend(v8, "domain"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB2FE0]),
          v10,
          v11))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "No bloom filter file at path '%@'", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v8;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not load bloom filter at path '%@'. Error: %@", buf, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

@end

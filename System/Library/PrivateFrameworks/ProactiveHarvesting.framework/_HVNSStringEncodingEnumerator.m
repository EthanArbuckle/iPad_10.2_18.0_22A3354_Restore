@implementation _HVNSStringEncodingEnumerator

- (_HVNSStringEncodingEnumerator)initWithString:(id)a3 encoding:(unint64_t)a4 nullTerminated:(BOOL)a5
{
  id v9;
  _HVNSStringEncodingEnumerator *v10;
  _HVNSStringEncodingEnumerator *v11;
  uint64_t v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HVNSStringEncodingEnumerator;
  v10 = -[_HVNSStringEncodingEnumerator init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_string, a3);
    v11->_encoding = a4;
    v12 = objc_msgSend(v9, "length");
    v11->_remaining.location = 0;
    v11->_remaining.length = v12;
    v11->_needsBOM = a4 == 10;
    v11->_needsNullTermination = a5;
  }

  return v11;
}

- (id)nullTerminationIfNeeded
{
  void *v2;

  if (self->_needsNullTermination)
  {
    self->_needsNullTermination = 0;
    nullByteData();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)nextObject
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  id v5;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  unint64_t v13;
  _BYTE v14[4096];
  uint64_t v15;

  v2 = MEMORY[0x24BDAC7A8](self, a2);
  v3 = v2;
  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (_QWORD *)(v2 + 24);
  if (!*(_QWORD *)(v2 + 32))
  {
    objc_msgSend((id)v2, "nullTerminationIfNeeded");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (*(_BYTE *)(v2 + 40))
  {
    *(_BYTE *)(v2 + 40) = 0;
    if (bomData__pasOnceToken3 != -1)
      dispatch_once(&bomData__pasOnceToken3, &__block_literal_global_35_1669);
    v5 = (id)bomData__pasExprOnceResult;
    return v5;
  }
  v7 = (void *)MEMORY[0x22074FDF0]();
  bzero(v14, 0x1000uLL);
  v13 = 0;
  v12 = 0uLL;
  if (objc_msgSend(*(id *)(v3 + 8), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v14, 4096, &v13, *(_QWORD *)(v3 + 16), 0, *v4, v4[1], &v12))
  {
    if (!*((_QWORD *)&v12 + 1))
    {
      v8 = v13;
      if (v13 <= 0xFFF)
      {
        if (*(_BYTE *)(v3 + 41))
        {
          *(_BYTE *)(v3 + 41) = 0;
          v13 = v8 + 1;
          v14[v8] = 0;
        }
      }
    }
    *(_OWORD *)v4 = v12;
    v9 = objc_alloc(MEMORY[0x24BDBCE50]);
    v10 = objc_msgSend(v9, "initWithBytes:length:", v14, v13);
  }
  else
  {
    objc_msgSend((id)v3, "nullTerminationIfNeeded");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_autoreleasePoolPop(v7);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end

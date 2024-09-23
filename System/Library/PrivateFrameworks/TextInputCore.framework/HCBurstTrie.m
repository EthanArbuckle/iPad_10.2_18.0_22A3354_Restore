@implementation HCBurstTrie

- (HCBurstTrie)init
{
  HCBurstTrie *v2;
  HCBurstTrie *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HCBurstTrie;
  v2 = -[HCBurstTrie init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HCBurstTrie _createUnderlyingBurstTrie](v2, "_createUnderlyingBurstTrie");
    v3->_keysAdded = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_burstTrie)
    CFBurstTrieRelease();
  v3.receiver = self;
  v3.super_class = (Class)HCBurstTrie;
  -[HCBurstTrie dealloc](&v3, sel_dealloc);
}

- (id)payloadForKey:(id)a3
{
  id v3;
  int v4;
  void *v5;

  if (self->_burstTrie
    && (v3 = a3, objc_msgSend(v3, "length"), v4 = CFBurstTrieContains(), v3, v4))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)count
{
  unint64_t result;

  result = (unint64_t)self->_burstTrie;
  if (result)
    return CFBurstTrieGetCount();
  return result;
}

- (BOOL)writeToFile:(id)a3
{
  id v3;
  FILE *v4;
  BOOL v5;

  objc_msgSend(a3, "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = fopen((const char *)objc_msgSend(v3, "UTF8String"), "wb+");

  fileno(v4);
  v5 = CFBurstTrieSerializeWithFileDescriptor() != 0;
  fclose(v4);
  return v5;
}

- (void)_createUnderlyingBurstTrie
{
  self->_burstTrie = (_CFBurstTrie *)CFBurstTrieCreate();
}

- (unint64_t)keysAdded
{
  return self->_keysAdded;
}

- (_CFBurstTrie)burstTrie
{
  return self->_burstTrie;
}

- (void)setBurstTrie:(_CFBurstTrie *)a3
{
  self->_burstTrie = a3;
}

+ (id)burstTrieFromFile:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _CFBurstTrie *v9;
  HCBurstTrie *v10;
  id v12;

  v3 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "dataWithContentsOfFile:options:error:", v4, 8, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "bytes");
  v8 = CFBurstTrieCreateFromMapBytes();
  if (v8)
  {
    v9 = (_CFBurstTrie *)v8;
    v10 = objc_alloc_init(HCBurstTrie);
    if (v10->_burstTrie)
      CFBurstTrieRelease();
    v10->_burstTrie = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end

@implementation HCHuffmanCoder

void __43__HCHuffmanCoder_coderMatchingName_locale___block_invoke(uint64_t a1, const void *a2, int a3, int a4, CFStringRef theString1, _BYTE *a6)
{
  CFTypeRef v9;
  uint64_t v10;
  void *v11;

  if (CFStringCompare(theString1, CFSTR("DifferentialPrivacyHuffmanCoder"), 0) == kCFCompareEqualTo)
  {
    v9 = CFRetain(a2);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a6 = 1;
  }
}

+ (id)coderMatchingName:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5278;
  v20 = __Block_byref_object_dispose__5279;
  v21 = 0;
  v15 = MEMORY[0x1E0C809B0];
  LDEnumerateAssetDataItems();
  if (v17[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.triemap"), v6, v15, 3221225472, __43__HCHuffmanCoder_coderMatchingName_locale___block_invoke, &unk_1EA0FEF88, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.htbl"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17[5], "URLByAppendingPathComponent:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17[5], "URLByAppendingPathComponent:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "coderFromBurstTrieFile:indexTableFile:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "+[HCHuffmanCoder coderMatchingName:locale:]";
      v24 = 2112;
      v25 = v14;
      _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Couldn't find a Huffman coder for locale: '%@'", buf, 0x16u);

    }
    v12 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v12;
}

+ (id)characterCoderForLocale:(id)a3
{
  return (id)objc_msgSend(a1, "coderMatchingName:locale:", CFSTR("chars"), a3);
}

- (HCHuffmanCoder)init
{
  return -[HCHuffmanCoder initWithBurstTrie:indexTable:](self, "initWithBurstTrie:indexTable:", 0, 0);
}

- (HCHuffmanCoder)initWithBurstTrie:(id)a3 indexTable:(id)a4
{
  id v7;
  id v8;
  HCHuffmanCoder *v9;
  HCHuffmanCoder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HCHuffmanCoder;
  v9 = -[HCHuffmanCoder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_burstTrie, a3);
    objc_storeStrong((id *)&v10->_indexTable, a4);
  }

  return v10;
}

- (unint64_t)count
{
  unint64_t v3;

  v3 = -[HCBurstTrie count](self->_burstTrie, "count");
  -[HCIndexTable count](self->_indexTable, "count");
  return v3;
}

- (NSUUID)versionUUID
{
  void *v2;
  void *v3;

  -[HCHuffmanCoder indexTable](self, "indexTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "versionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)codeForKey:(id)a3
{
  id v4;
  HCBurstTrie *burstTrie;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  burstTrie = self->_burstTrie;
  if (burstTrie && self->_indexTable)
  {
    -[HCBurstTrie payloadForKey:](burstTrie, "payloadForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[HCIndexTable codeAtIndex:](self->_indexTable, "codeAtIndex:", objc_msgSend(v6, "unsignedIntValue") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)stringCodeForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HCHuffmanCoder codeForKey:](self, "codeForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    _createBinaryStringForHuffmanCode(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HCBurstTrie)burstTrie
{
  return self->_burstTrie;
}

- (void)setBurstTrie:(id)a3
{
  objc_storeStrong((id *)&self->_burstTrie, a3);
}

- (HCIndexTable)indexTable
{
  return self->_indexTable;
}

- (void)setIndexTable:(id)a3
{
  objc_storeStrong((id *)&self->_indexTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexTable, 0);
  objc_storeStrong((id *)&self->_burstTrie, 0);
}

+ (id)wordCoderForLocale:(id)a3
{
  return (id)objc_msgSend(a1, "coderMatchingName:locale:", CFSTR("words"), a3);
}

+ (id)coderFromBurstTrieFile:(id)a3 indexTableFile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  HCHuffmanCoder *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[HCBurstTrie burstTrieFromFile:](HCBurstTrie, "burstTrieFromFile:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HCIndexTable indexTableFromFile:](HCIndexTable, "indexTableFromFile:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "+[HCHuffmanCoder coderFromBurstTrieFile:indexTableFile:]";
      _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Could not load the huffman coder from the supplied file paths.", (uint8_t *)&v11, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v9 = -[HCHuffmanCoder initWithBurstTrie:indexTable:]([HCHuffmanCoder alloc], "initWithBurstTrie:indexTable:", v6, v7);
  }

  return v9;
}

@end

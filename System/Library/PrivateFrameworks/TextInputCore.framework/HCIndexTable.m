@implementation HCIndexTable

- (HCIndexTable)init
{
  HCIndexTable *v2;
  HCIndexTable *v3;
  unint64_t *begin;
  vector<unsigned long long, std::allocator<unsigned long long>> *p_mutableHuffmanCodes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HCIndexTable;
  v2 = -[HCIndexTable init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    p_mutableHuffmanCodes = &v2->_mutableHuffmanCodes;
    begin = v2->_mutableHuffmanCodes.__begin_;
    if (begin)
    {
      v3->_mutableHuffmanCodes.__end_ = begin;
      operator delete(begin);
    }
    p_mutableHuffmanCodes->__begin_ = 0;
    v3->_mutableHuffmanCodes.__end_ = 0;
    v3->_mutableHuffmanCodes.__end_cap_.__value_ = 0;
  }
  return v3;
}

- (HCIndexTable)initWithHuffmanCodesMemoryMappedData:(id)a3
{
  id v4;
  HCIndexTable *v5;
  uint64_t v6;
  NSData *huffmanCodesMemoryMappedData;
  HCIndexTable *v8;
  HCIndexTable *v9;

  v4 = a3;
  v5 = -[HCIndexTable init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    huffmanCodesMemoryMappedData = v5->_huffmanCodesMemoryMappedData;
    v5->_huffmanCodesMemoryMappedData = (NSData *)v6;

  }
  if (-[HCIndexTable isValid](v5, "isValid"))
    v8 = v5;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (BOOL)isValid
{
  unsigned __int8 v2;
  const HCIndexTableFileHeader *v3;
  int v6;
  HCIndexTable *v7;

  if ((v2 & 1) == 0)
  {
    v7 = self;
    self = v7;
    if (v6)
    {
      -[HCIndexTable isValid]::staticHeader = kHCIndexTableFileHeaderSignature;
      -[HCIndexTable isValid]::staticHeader = kHCIndexTableFileHeaderSupportedSchemaVersion;
      self = v7;
    }
  }
  v3 = -[HCIndexTable fileHeader](self, "fileHeader");
  return v3->var1 == -[HCIndexTable isValid]::staticHeader && v3->var0 == -[HCIndexTable isValid]::staticHeader;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[HCIndexTable huffmanCodesMemoryMappedData](self, "huffmanCodesMemoryMappedData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "length") >> 3;

  return v3;
}

- (id)codeAtIndex:(unint64_t)a3
{
  void *v5;
  const unint64_t *v6;

  if (-[HCIndexTable count](self, "count") - 1 >= a3)
  {
    v6 = -[HCIndexTable huffmanCodes](self, "huffmanCodes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6[a3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)writeToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const HCIndexTableFileHeader *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createFileAtPath:contents:attributes:", v6, 0, 0);

  v7 = (void *)MEMORY[0x1E0CB3608];
  objc_msgSend(v4, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileHandleForWritingAtPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[HCIndexTable fileHeader](self, "fileHeader");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, 24, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v9, "writeData:error:", v11, &v21);
    v12 = v21;
    if (v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[HCIndexTable writeToFile:]";
      v24 = 2112;
      v25 = v17;
      _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_mutableHuffmanCodes.__begin_, (char *)self->_mutableHuffmanCodes.__end_ - (char *)self->_mutableHuffmanCodes.__begin_, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v9, "writeData:error:", v13, &v20);
    v14 = v20;

    v15 = v14 == 0;
    if (v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[HCIndexTable writeToFile:]";
      v24 = 2112;
      v25 = v18;
      _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  %@", buf, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[HCIndexTable writeToFile:]";
      v24 = 2112;
      v25 = v19;
      _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Couldn't open file '%@' for writing.", buf, 0x16u);

    }
    v15 = 0;
  }

  return v15;
}

- (const)fileHeader
{
  -[NSData length](self->_huffmanCodesMemoryMappedData, "length");
  return (const HCIndexTableFileHeader *)-[NSData bytes](self->_huffmanCodesMemoryMappedData, "bytes");
}

- (NSUUID)versionUUID
{
  const HCIndexTableFileHeader *v2;

  v2 = -[HCIndexTable fileHeader](self, "fileHeader") + 6;
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v2);
}

- (const)huffmanCodes
{
  -[NSData length](self->_huffmanCodesMemoryMappedData, "length");
  -[HCIndexTable count](self, "count");
  -[NSData length](self->_huffmanCodesMemoryMappedData, "length");
  return (const unint64_t *)(-[NSData bytes](self->_huffmanCodesMemoryMappedData, "bytes") + 24);
}

- (NSData)huffmanCodesMemoryMappedData
{
  return self->_huffmanCodesMemoryMappedData;
}

- (void).cxx_destruct
{
  unint64_t *begin;

  objc_storeStrong((id *)&self->_versionUUID, 0);
  objc_storeStrong((id *)&self->_huffmanCodesMemoryMappedData, 0);
  begin = self->_mutableHuffmanCodes.__begin_;
  if (begin)
  {
    self->_mutableHuffmanCodes.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (id)indexTableFromFile:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  HCIndexTable *v7;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "dataWithContentsOfFile:options:error:", v4, 8, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v12 = "+[HCIndexTable indexTableFromFile:]";
      v13 = 2112;
      v14 = v9;
      _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Error while loading index map from file: '%@'", buf, 0x16u);

    }
    v7 = 0;
  }
  else
  {
    v7 = -[HCIndexTable initWithHuffmanCodesMemoryMappedData:]([HCIndexTable alloc], "initWithHuffmanCodesMemoryMappedData:", v5);
  }

  return v7;
}

@end

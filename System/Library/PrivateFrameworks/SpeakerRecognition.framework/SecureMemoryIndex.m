@implementation SecureMemoryIndex

- (SecureMemoryIndex)initWithResourcePath:(id)a3 memoryIndexes:(id)a4
{
  id v7;
  id v8;
  SecureMemoryIndex *v9;
  SecureMemoryIndex *v10;
  uint64_t v11;
  NSMutableArray *mIndexes;
  NSMutableArray *v13;
  NSMutableArray *mIndexData;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SecureMemoryIndex;
  v9 = -[SecureMemoryIndex init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourcePath, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v8);
    mIndexes = v10->_mIndexes;
    v10->_mIndexes = (NSMutableArray *)v11;

    v10->_memoryIndexCount = -[NSMutableArray count](v10->_mIndexes, "count");
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mIndexData = v10->_mIndexData;
    v10->_mIndexData = v13;

    -[SecureMemoryIndex iterateMemoryIndexes:](v10, "iterateMemoryIndexes:", &__block_literal_global_3387);
  }

  return v10;
}

- (SecureMemoryIndex)init
{
  void *v3;
  SecureMemoryIndex *v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("garbage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SecureMemoryIndex initWithResourcePath:memoryIndexes:](self, "initWithResourcePath:memoryIndexes:", v3, MEMORY[0x24BDBD1A8]);

  return v4;
}

- (id)_santizedIndexName:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("mindex:"))
    && (v4 = objc_msgSend(v3, "length"), v4 > objc_msgSend(CFSTR("mindex:"), "length")))
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)-[NSMutableArray description](self->_mIndexes, "description");
}

- (id)makeResources
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SecureMemoryIndex_makeResources__block_invoke;
  v7[3] = &unk_24CC850E0;
  v8 = v3;
  v4 = v3;
  -[SecureMemoryIndex iterateMemoryIndexes:](self, "iterateMemoryIndexes:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)iterateMemoryIndexes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  v5 = objc_initWeak(&location, self);
  -[SecureMemoryIndex mIndexData](self, "mIndexData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = objc_loadWeakRetained(&location);
  objc_msgSend(v8, "mIndexData");
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __42__SecureMemoryIndex_iterateMemoryIndexes___block_invoke;
    v15[3] = &unk_24CC85108;
    v16 = v4;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    -[SecureMemoryIndex mIndexes](self, "mIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __42__SecureMemoryIndex_iterateMemoryIndexes___block_invoke_2;
    v12[3] = &unk_24CC85130;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);

}

- (void)insertMemoryIndex:(const char *)a3 resource:(const float *)a4 size:(unsigned int)a5
{
  void *v8;
  SecureMemoryIndexDataBridge *v9;
  void *v10;
  id v11;

  if (a3)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SecureMemoryIndexDataBridge initWithIndexName:data:dataLength:]([SecureMemoryIndexDataBridge alloc], "initWithIndexName:data:dataLength:", v11, v8, a5);
      -[SecureMemoryIndex mIndexData](self, "mIndexData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);

    }
  }
}

- (void)insertMemoryIndex:(id)a3 resource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  SecureMemoryIndexDataBridge *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)CSLogContextFacilityCoreSpeechExclave;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[SecureMemoryIndex mIndexData](self, "mIndexData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[SecureMemoryIndex insertMemoryIndex:resource:]";
    v16 = 1024;
    v17 = v10 != 0;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v14, 0x12u);

  }
  v11 = -[SecureMemoryIndexDataBridge initWithIndexName:data:dataLength:]([SecureMemoryIndexDataBridge alloc], "initWithIndexName:data:dataLength:", v6, v7, objc_msgSend(v7, "length"));
  -[SecureMemoryIndex mIndexData](self, "mIndexData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);

  -[SecureMemoryIndex mIndexes](self, "mIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v6);

}

- (unint64_t)indexCount
{
  void *v2;
  unint64_t v3;

  -[SecureMemoryIndex mIndexes](self, "mIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSURL)resourcePath
{
  return self->_resourcePath;
}

- (void)setResourcePath:(id)a3
{
  objc_storeStrong((id *)&self->_resourcePath, a3);
}

- (NSMutableArray)mIndexes
{
  return self->_mIndexes;
}

- (void)setMIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_mIndexes, a3);
}

- (NSMutableArray)mIndexData
{
  return self->_mIndexData;
}

- (void)setMIndexData:(id)a3
{
  objc_storeStrong((id *)&self->_mIndexData, a3);
}

- (unint64_t)memoryIndexCount
{
  return self->_memoryIndexCount;
}

- (void)setMemoryIndexCount:(unint64_t)a3
{
  self->_memoryIndexCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mIndexData, 0);
  objc_storeStrong((id *)&self->_mIndexes, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

uint64_t __42__SecureMemoryIndex_iterateMemoryIndexes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__SecureMemoryIndex_iterateMemoryIndexes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  SecureMemoryIndexDataBridge *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  int v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_santizedIndexName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "resourcePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)CSLogContextFacilityCoreSpeechExclave;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v11, "absoluteString");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = 136315394;
      v29 = "-[SecureMemoryIndex iterateMemoryIndexes:]_block_invoke";
      v30 = 2080;
      v31 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s reading memory index from %s", (uint8_t *)&v28, 0x16u);

    }
    if (v12 && objc_msgSend(v12, "length"))
    {
      if (*(_QWORD *)(a1 + 32))
      {
        v16 = -[SecureMemoryIndexDataBridge initWithIndexName:data:dataLength:]([SecureMemoryIndexDataBridge alloc], "initWithIndexName:data:dataLength:", v6, v12, objc_msgSend(v12, "length"));
        v17 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v17, "mIndexData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v16);

        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
    }
    else
    {
      v19 = (void *)CSLogContextFacilityCoreSpeechExclave;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_ERROR))
      {
        v23 = v19;
        objc_msgSend(v11, "absoluteString");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v25 = objc_msgSend(v24, "UTF8String");
        v28 = 136315394;
        v29 = "-[SecureMemoryIndex iterateMemoryIndexes:]_block_invoke";
        v30 = 2080;
        v31 = v25;
        _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s ERROR!!!! %s", (uint8_t *)&v28, 0x16u);

      }
      *a4 = 1;
    }

  }
  else
  {
    v20 = (void *)CSLogContextFacilityCoreSpeechExclave;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_retainAutorelease(v6);
      v27 = v20;
      v28 = 136315394;
      v29 = "-[SecureMemoryIndex iterateMemoryIndexes:]_block_invoke_2";
      v30 = 2080;
      v31 = objc_msgSend(v26, "cStringUsingEncoding:", 4);
      _os_log_error_impl(&dword_2117D4000, v27, OS_LOG_TYPE_ERROR, "%s ERROR!!!! Missing index name %s", (uint8_t *)&v28, 0x16u);

    }
    v21 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v21, "mIndexData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeAllObjects");

    *a4 = 1;
  }

}

void __34__SecureMemoryIndex_makeResources__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v5, v4);
}

@end

@implementation WBSPasswordBreachBloomFilter

- (WBSPasswordBreachBloomFilter)initWithSerializedRepresentation:(id)a3
{
  id v4;
  WBSPasswordBreachBloomFilter *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  unsigned int v29;
  unsigned int v30;
  __int16 v31;
  unsigned __int16 v32;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 0xD)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99DB0]);
    objc_msgSend(v4, "subdataWithRange:", 0, 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:", v7);

    objc_msgSend(v8, "open");
    v32 = 0;
    if ((objc_msgSend(v8, "safari_readNetworkOrderUInt16:", &v32) & 1) != 0)
    {
      if (v32 == 45326)
      {
        v31 = 0;
        if ((objc_msgSend(v8, "safari_readNetworkOrderUInt16:", &v31) & 1) != 0)
        {
          if (v31 == 1)
          {
            v30 = 0;
            if ((objc_msgSend(v8, "safari_readNetworkOrderUInt32:", &v30) & 1) != 0)
            {
              v29 = 0;
              if ((objc_msgSend(v8, "safari_readNetworkOrderUInt32:", &v29) & 1) != 0)
              {
                objc_msgSend(v4, "subdataWithRange:", 12, objc_msgSend(v4, "length") - 12);
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                self = -[WBSPasswordBreachBloomFilter initWithCapacity:errorDenominator:bucketData:](self, "initWithCapacity:errorDenominator:bucketData:", v29, v30, v9);

                v5 = self;
LABEL_23:

                goto LABEL_24;
              }
              v27 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:].cold.1();
            }
            else
            {
              v26 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:].cold.2();
            }
          }
          else
          {
            v19 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:].cold.3((uint64_t)&v31, v19, v20, v21, v22, v23, v24, v25);
          }
        }
        else
        {
          v18 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:].cold.4();
        }
      }
      else
      {
        v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:].cold.5((uint64_t)&v32, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:].cold.6();
    }
    v5 = 0;
    goto LABEL_23;
  }
  v5 = 0;
LABEL_24:

  return v5;
}

- (WBSPasswordBreachBloomFilter)initWithCapacity:(unsigned int)a3 errorDenominator:(unsigned int)a4 bucketData:(id)a5
{
  id v8;
  WBSPasswordBreachBloomFilter *v9;
  WBSPasswordBreachBloomFilter *v10;
  NSObject *v11;
  NSObject *v12;
  unsigned int v13;
  size_t v14;
  uint64_t v15;
  NSData *bucketData;
  void *v17;
  uint64_t v18;
  NSData *v19;
  WBSPasswordBreachBloomFilter *v20;
  NSObject *v21;
  objc_super v23;

  v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)WBSPasswordBreachBloomFilter;
  v9 = -[WBSPasswordBreachBloomFilter init](&v23, sel_init);
  v10 = v9;
  if (!v9)
  {
LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  if (!a3)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachBloomFilter initWithCapacity:errorDenominator:bucketData:].cold.1();
    goto LABEL_15;
  }
  if (a4 <= 1)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachBloomFilter initWithCapacity:errorDenominator:bucketData:].cold.2();
    goto LABEL_15;
  }
  v9->_capacity = a3;
  v9->_errorDenominator = a4;
  v13 = (log(1.0 / (double)a4) * (double)a3 / -0.480453014);
  v10->_hashCount = vcvtpd_u64_f64((double)v13 / (double)a3 * 0.693147181);
  v10->_bucketCount = v13;
  v14 = vcvtpd_u64_f64((double)v13 * 0.125);
  if (v8)
  {
    if (objc_msgSend(v8, "length") != v14)
    {
      v21 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachBloomFilter initWithCapacity:errorDenominator:bucketData:].cold.3();
      goto LABEL_15;
    }
    v15 = objc_msgSend(v8, "copy");
    bucketData = v10->_bucketData;
    v10->_bucketData = (NSData *)v15;

  }
  else
  {
    v17 = malloc_type_calloc(v14, 1uLL, 0x100004077774924uLL);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, v14);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v10->_bucketData;
    v10->_bucketData = (NSData *)v18;

    free(v17);
  }
  v20 = v10;
LABEL_16:

  return v20;
}

- (BOOL)_getBucketAtIndex:(unsigned int)a3
{
  char v3;
  unsigned __int8 v6;

  v3 = a3 & 7;
  v6 = 0;
  -[NSData getBytes:range:](self->_bucketData, "getBytes:range:", &v6, a3 >> 3, 1);
  return (v6 >> v3) & 1;
}

- (void)_setBucketAtIndex:(unsigned int)a3 inBuffer:(char *)a4
{
  a4[(unint64_t)a3 >> 3] |= 1 << (a3 & 7);
}

- (void)_enumerateBucketIndexesForData:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, char *);
  unsigned int v8;
  int v9;
  int v10;
  unint64_t v11;
  char v12;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, char *))a4;
  v8 = WBSPasswordBreachMurmur3HashWithSeed(v6, 0);
  v9 = WBSPasswordBreachMurmur3HashWithSeed(v6, v8);
  v12 = 0;
  if (self->_hashCount)
  {
    v10 = v9;
    v11 = 0;
    do
    {
      v7[2](v7, v8 % self->_bucketCount, &v12);
      if (v12)
        break;
      ++v11;
      v8 += v10;
    }
    while (v11 < self->_hashCount);
  }

}

- (void)addData:(id)a3
{
  NSData *bucketData;
  id v5;
  NSData *v6;
  uint64_t v7;
  NSData *v8;
  NSData *v9;
  _QWORD v10[6];

  bucketData = self->_bucketData;
  v5 = a3;
  v6 = (NSData *)objc_retainAutorelease((id)-[NSData mutableCopy](bucketData, "mutableCopy"));
  v7 = -[NSData mutableBytes](v6, "mutableBytes");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__WBSPasswordBreachBloomFilter_addData___block_invoke;
  v10[3] = &unk_1E649D840;
  v10[4] = self;
  v10[5] = v7;
  -[WBSPasswordBreachBloomFilter _enumerateBucketIndexesForData:withBlock:](self, "_enumerateBucketIndexesForData:withBlock:", v5, v10);

  v8 = self->_bucketData;
  self->_bucketData = v6;
  v9 = v6;

}

uint64_t __40__WBSPasswordBreachBloomFilter_addData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBucketAtIndex:inBuffer:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)containsData:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__WBSPasswordBreachBloomFilter_containsData___block_invoke;
  v6[3] = &unk_1E649D868;
  v6[4] = self;
  v6[5] = &v7;
  -[WBSPasswordBreachBloomFilter _enumerateBucketIndexesForData:withBlock:](self, "_enumerateBucketIndexesForData:withBlock:", v4, v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

uint64_t __45__WBSPasswordBreachBloomFilter_containsData___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_getBucketAtIndex:", a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (BOOL)containsLowercaseHexStringForData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "safari_stringAsHexWithData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WBSPasswordBreachBloomFilter containsData:](self, "containsData:", v6);

  return (char)self;
}

- (NSData)serializedRepresentation
{
  void *v3;
  NSUInteger v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToMemory");
  objc_msgSend(v3, "open");
  if ((objc_msgSend(v3, "safari_writeNetworkOrderUInt16:", 45326) & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachBloomFilter serializedRepresentation].cold.5();
    goto LABEL_17;
  }
  if ((objc_msgSend(v3, "safari_writeNetworkOrderUInt16:", 1) & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachBloomFilter serializedRepresentation].cold.4();
    goto LABEL_17;
  }
  if ((objc_msgSend(v3, "safari_writeNetworkOrderUInt32:", self->_errorDenominator) & 1) == 0)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachBloomFilter serializedRepresentation].cold.3();
    goto LABEL_17;
  }
  if ((objc_msgSend(v3, "safari_writeNetworkOrderUInt32:", self->_capacity) & 1) == 0)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachBloomFilter serializedRepresentation].cold.2();
    goto LABEL_17;
  }
  v4 = -[NSData length](self->_bucketData, "length");
  if (objc_msgSend(v3, "write:maxLength:", -[NSData bytes](self->_bucketData, "bytes"), v4) != v4)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachBloomFilter serializedRepresentation].cold.1();
LABEL_17:
    v5 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v3, "close");
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x1E0C99868]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return (NSData *)v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; capcity = %u; errorDenominator = %u, hashCount = %lu, bucketCount = %lu>"),
    v5,
    self,
    self->_capacity,
    self->_errorDenominator,
    self->_hashCount,
    self->_bucketCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketData, 0);
}

- (void)initWithSerializedRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Failed to read capacity.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithSerializedRepresentation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Failed to read error denominator.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithSerializedRepresentation:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B2621000, a2, a3, "Unexpected version number %{public}d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)initWithSerializedRepresentation:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Failed to read version.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithSerializedRepresentation:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B2621000, a2, a3, "Invalid magic number %{public}d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)initWithSerializedRepresentation:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Failed to read magic number.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCapacity:errorDenominator:bucketData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Invalid bloom filter capacity.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCapacity:errorDenominator:bucketData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Invalid bloom filter error rate.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCapacity:errorDenominator:bucketData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Bucket data is the wrong length for the specified parameters.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)serializedRepresentation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Failed to write magic number.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end

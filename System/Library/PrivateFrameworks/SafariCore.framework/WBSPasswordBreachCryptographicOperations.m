@implementation WBSPasswordBreachCryptographicOperations

- (WBSPasswordBreachCryptographicOperations)initWithConfiguration:(id)a3
{
  id v5;
  WBSPasswordBreachCryptographicOperations *v6;
  WBSPasswordBreachCryptographicOperations *v7;
  WBSPasswordBreachCryptographicOperations *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordBreachCryptographicOperations;
  v6 = -[WBSPasswordBreachCryptographicOperations init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_blindingKeys = (cc_blinding_keys_ctx *)CCECCryptorGenerateBlindingKeys();
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_blindingKeys)
    CCECCryptorBlindingKeysRelease();
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordBreachCryptographicOperations;
  -[WBSPasswordBreachCryptographicOperations dealloc](&v3, sel_dealloc);
}

- (id)encodePasswordForHighFrequencyBucket:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordBreachConfiguration highFrequencyBucketHashSalt](self->_configuration, "highFrequencyBucketHashSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safari_scryptHashWithSalt:N:r:p:keyLength:", v6, -[WBSPasswordBreachConfiguration highFrequencyBucketHashWorkFactor](self->_configuration, "highFrequencyBucketHashWorkFactor"), -[WBSPasswordBreachConfiguration highFrequencyBucketScryptBlockSizeR](self->_configuration, "highFrequencyBucketScryptBlockSizeR"), -[WBSPasswordBreachConfiguration highFrequencyBucketScryptParallelismFactorP](self->_configuration, "highFrequencyBucketScryptParallelismFactorP"), 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_bucketIdentifierWithBitCount:(unint64_t)a3 ofData:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unsigned int v8;

  v8 = 0;
  objc_msgSend(a4, "getBytes:length:", &v8, 4);
  v5 = bswap32(v8) >> -(char)a3;
  v8 = v5;
  v6 = a3 >> 2;
  if ((a3 & 3) != 0)
    v6 = (v6 + 1);
  else
    v6 = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*x"), v6, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_encodePasswordForLowFrequencyBucket:(id)a3 withHashSmoothingBits:(unsigned __int8)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WBSPair *v11;
  unsigned __int8 v13;

  v13 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "appendBytes:length:", &v13, 1);
  -[WBSPasswordBreachConfiguration lowFrequencyBucketHashSalt](self->_configuration, "lowFrequencyBucketHashSalt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safari_scryptHashWithSalt:N:r:p:keyLength:", v8, -[WBSPasswordBreachConfiguration lowFrequencyBucketHashWorkFactor](self->_configuration, "lowFrequencyBucketHashWorkFactor"), -[WBSPasswordBreachConfiguration lowFrequencyBucketScryptBlockSizeR](self->_configuration, "lowFrequencyBucketScryptBlockSizeR"), -[WBSPasswordBreachConfiguration lowFrequencyBucketScryptParallelismFactorP](self->_configuration, "lowFrequencyBucketScryptParallelismFactorP"), 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordBreachCryptographicOperations _bucketIdentifierWithBitCount:ofData:](self, "_bucketIdentifierWithBitCount:ofData:", -[WBSPasswordBreachConfiguration lowFrequencyBucketIdentifierBitCount](self->_configuration, "lowFrequencyBucketIdentifierBitCount"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WBSPair initWithFirst:second:]([WBSPair alloc], "initWithFirst:second:", v10, v9);

  return v11;
}

- (id)encodePasswordForLowFrequencyBucket:(id)a3
{
  void *v4;
  WBSPair *v5;
  void *v6;
  void *v7;
  void *v8;
  WBSPair *v9;

  -[WBSPasswordBreachCryptographicOperations _encodePasswordForLowFrequencyBucket:withHashSmoothingBits:](self, "_encodePasswordForLowFrequencyBucket:withHashSmoothingBits:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [WBSPair alloc];
  objc_msgSend(v4, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordBreachCryptographicOperations _blindPasswordHash:](self, "_blindPasswordHash:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WBSPair initWithFirst:second:](v5, "initWithFirst:second:", v6, v8);

  return v9;
}

- (id)_exportKeyFromCryptor:(_CCECCryptor *)a3
{
  int v3;
  int v4;
  NSObject *v5;
  _BYTE v7[256];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CCECCryptorExportKey();
  if (v3)
  {
    v4 = v3;
    v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[WBSPasswordBreachCryptographicOperations _exportKeyFromCryptor:].cold.1(v4, v5);
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, 256);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_exportHashToCurve:(id)a3
{
  id v4;
  WBSScopeExitHandler *v5;
  _CCECCryptor *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = objc_alloc_init(WBSScopeExitHandler);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__WBSPasswordBreachCryptographicOperations__exportHashToCurve___block_invoke;
  v9[3] = &unk_1E649A1E8;
  v9[4] = &v10;
  -[WBSScopeExitHandler setHandler:](v5, "setHandler:", v9);
  v6 = -[WBSPasswordBreachCryptographicOperations _hashToCurve:](self, "_hashToCurve:", v4);
  v11[3] = (uint64_t)v6;
  if (v6)
  {
    -[WBSPasswordBreachCryptographicOperations _exportKeyFromCryptor:](self, "_exportKeyFromCryptor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __63__WBSPasswordBreachCryptographicOperations__exportHashToCurve___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
    JUMPOUT(0x1B5E26758);
  return result;
}

- (_CCECCryptor)_hashToCurve:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _CCECCryptor *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(CFSTR("P256-SHA256-SSWU-RO-PBAv1"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "length");
  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v3, "length");
  v6 = objc_retainAutorelease(v3);
  objc_msgSend(v6, "bytes");

  v7 = (_CCECCryptor *)CCECCryptorH2C();
  if (!v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[WBSPasswordBreachCryptographicOperations _hashToCurve:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  return v7;
}

- (id)_blindPasswordHash:(id)a3
{
  id v4;
  WBSScopeExitHandler *v5;
  _CCECCryptor *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v5 = objc_alloc_init(WBSScopeExitHandler);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__WBSPasswordBreachCryptographicOperations__blindPasswordHash___block_invoke;
  v18[3] = &unk_1E649DA68;
  v18[4] = &v23;
  v18[5] = &v19;
  -[WBSScopeExitHandler setHandler:](v5, "setHandler:", v18);
  v6 = -[WBSPasswordBreachCryptographicOperations _hashToCurve:](self, "_hashToCurve:", v4);
  v24[3] = (uint64_t)v6;
  if (!v6)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v7 = CCECCryptorBlind();
  v20[3] = v7;
  if (!v7)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[WBSPasswordBreachCryptographicOperations _blindPasswordHash:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_6;
  }
  -[WBSPasswordBreachCryptographicOperations _exportKeyFromCryptor:](self, "_exportKeyFromCryptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v8;
}

uint64_t __63__WBSPasswordBreachCryptographicOperations__blindPasswordHash___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    MEMORY[0x1B5E26758]();
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (result)
    JUMPOUT(0x1B5E26758);
  return result;
}

- (id)unblindHash:(id)a3
{
  id v4;
  WBSScopeExitHandler *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];

  v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v5 = objc_alloc_init(WBSScopeExitHandler);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__WBSPasswordBreachCryptographicOperations_unblindHash___block_invoke;
  v19[3] = &unk_1E649DA68;
  v19[4] = v24;
  v19[5] = &v20;
  -[WBSScopeExitHandler setHandler:](v5, "setHandler:", v19);
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");
  v7 = CCECCryptorImportKey();
  if ((_DWORD)v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachCryptographicOperations unblindHash:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v16 = CCECCryptorUnblind();
    v21[3] = v16;
    if (v16)
    {
      -[WBSPasswordBreachCryptographicOperations _exportKeyFromCryptor:](self, "_exportKeyFromCryptor:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v18 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachCryptographicOperations unblindHash:].cold.1(v18);
  }
  v15 = 0;
LABEL_7:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);

  return v15;
}

uint64_t __56__WBSPasswordBreachCryptographicOperations_unblindHash___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    MEMORY[0x1B5E26758]();
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (result)
    JUMPOUT(0x1B5E26758);
  return result;
}

+ (BOOL)isValidScryptHashWorkFactor:(unint64_t)a3 blockSizeR:(unint64_t)a4 parallelismFactorP:(unint64_t)a5
{
  return ccscrypt_storage_size() > 0;
}

- (id)generateFakeEncodedPasswordForHighFrequencyBucket
{
  size_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = -[WBSPasswordBreachConfiguration fakePasswordLengthBytes](self->_configuration, "fakePasswordLengthBytes");
  v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], v2, v3);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachCryptographicOperations generateFakeEncodedPasswordForHighFrequencyBucket].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v3, v2);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)generateFakeEncodedPasswordForLowFrequencyBucket
{
  void *v3;
  void *v4;
  void *v5;
  WBSPair *v6;

  -[WBSPasswordBreachCryptographicOperations generateFakeEncodedPasswordForHighFrequencyBucket](self, "generateFakeEncodedPasswordForHighFrequencyBucket");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WBSPasswordBreachCryptographicOperations _bucketIdentifierWithBitCount:ofData:](self, "_bucketIdentifierWithBitCount:ofData:", -[WBSPasswordBreachConfiguration lowFrequencyBucketIdentifierBitCount](self->_configuration, "lowFrequencyBucketIdentifierBitCount"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSPasswordBreachCryptographicOperations _blindPasswordHash:](self, "_blindPasswordHash:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = -[WBSPair initWithFirst:second:]([WBSPair alloc], "initWithFirst:second:", v4, v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)_exportKeyFromCryptor:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1B2621000, a2, OS_LOG_TYPE_FAULT, "Failed to export key. CCECCryptorExportKey returned status %{public}d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

- (void)_hashToCurve:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_1B2621000, a1, a3, "Failed to map password to curve.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_blindPasswordHash:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_1B2621000, a1, a3, "Failed to blind hash.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)unblindHash:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Failed to unblind server blinded hash.", v1, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)unblindHash:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B2621000, a2, a3, "Failed to import server blinded key. CCECCryptorImportKey returned status %{public}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)generateFakeEncodedPasswordForHighFrequencyBucket
{
  OUTLINED_FUNCTION_3(&dword_1B2621000, a2, a3, "Failed to generate random bytes for fake password: %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end

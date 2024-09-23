@implementation TPTypedSignedData

- (TPTypedSignedData)initWithData:(id)a3 sig:(id)a4 pubkey:(id)a5 sigTypeName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TPTypedSignedData *v15;
  TPTypedSignedData *v16;
  void *v17;
  id v18;
  const char *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *sigValidationQueue;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TPTypedSignedData;
  v15 = -[TPTypedSignedData init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_data, a3);
    objc_storeStrong((id *)&v16->_sig, a4);
    objc_storeStrong((id *)&v16->_sigTypeName, a6);
    objc_storeStrong((id *)&v16->_lastSigValidationPubkey, a5);
    v16->_lastSigValidationResult = v13 != 0;
    v17 = (void *)MEMORY[0x1DF0E9908]();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.security.TPTypedSignedData_%@"), v14);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create(v19, v20);
    sigValidationQueue = v16->_sigValidationQueue;
    v16->_sigValidationQueue = (OS_dispatch_queue *)v21;

    objc_autoreleasePoolPop(v17);
  }

  return v16;
}

- (TPTypedSignedData)initWithData:(id)a3 key:(id)a4 signatureTypeName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  TPTypedSignedData *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  typesafeSignature(v11, v10, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "publicKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[TPTypedSignedData initWithData:sig:pubkey:sigTypeName:](self, "initWithData:sig:pubkey:sigTypeName:", v10, v13, v14, v12);

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (TPTypedSignedData)initWithData:(id)a3 sig:(id)a4 signatureTypeName:(id)a5
{
  return -[TPTypedSignedData initWithData:sig:pubkey:sigTypeName:](self, "initWithData:sig:pubkey:sigTypeName:", a3, a4, 0, a5);
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  char v16;
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[TPTypedSignedData sigValidationQueue](self, "sigValidationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__TPTypedSignedData_checkSignatureWithKey___block_invoke;
  block[3] = &unk_1EA8BF568;
  block[4] = self;
  v7 = v4;
  v18 = v7;
  v19 = &v25;
  v20 = &v21;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v26 + 24))
  {
    v8 = *((_BYTE *)v22 + 24) != 0;
  }
  else
  {
    -[TPTypedSignedData sig](self, "sig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPTypedSignedData data](self, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPTypedSignedData sigTypeName](self, "sigTypeName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = checkTypesafeSignature(v7, v9, v10, v11);

    -[TPTypedSignedData sigValidationQueue](self, "sigValidationQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __43__TPTypedSignedData_checkSignatureWithKey___block_invoke_2;
    v14[3] = &unk_1EA8BF590;
    v14[4] = self;
    v15 = v7;
    v16 = v8;
    dispatch_sync(v12, v14);

  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v8;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)sig
{
  return self->_sig;
}

- (NSString)sigTypeName
{
  return self->_sigTypeName;
}

- (TPPublicKey)lastSigValidationPubkey
{
  return self->_lastSigValidationPubkey;
}

- (void)setLastSigValidationPubkey:(id)a3
{
  objc_storeStrong((id *)&self->_lastSigValidationPubkey, a3);
}

- (BOOL)lastSigValidationResult
{
  return self->_lastSigValidationResult;
}

- (void)setLastSigValidationResult:(BOOL)a3
{
  self->_lastSigValidationResult = a3;
}

- (OS_dispatch_queue)sigValidationQueue
{
  return self->_sigValidationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigValidationQueue, 0);
  objc_storeStrong((id *)&self->_lastSigValidationPubkey, 0);
  objc_storeStrong((id *)&self->_sigTypeName, 0);
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

void __43__TPTypedSignedData_checkSignatureWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "lastSigValidationPubkey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "lastSigValidationResult");
  }
}

uint64_t __43__TPTypedSignedData_checkSignatureWithKey___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLastSigValidationPubkey:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setLastSigValidationResult:", *(unsigned __int8 *)(a1 + 48));
}

@end

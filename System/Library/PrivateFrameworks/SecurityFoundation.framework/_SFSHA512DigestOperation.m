@implementation _SFSHA512DigestOperation

+ (id)digest:(id)a3
{
  id v3;
  _SFSHA512DigestOperation *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_SFSHA512DigestOperation);
  -[_SFSHA512DigestOperation addData:](v4, "addData:", v3);

  -[_SFSHA512DigestOperation hashValue](v4, "hashValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA512DigestOperation)init
{
  _SFSHA512DigestOperation *v2;
  SFSHA512DigestOperation_Ivars *v3;
  id sha512DigestOperationInternal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFSHA512DigestOperation;
  v2 = -[_SFSHA512DigestOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SFSHA512DigestOperation_Ivars);
    sha512DigestOperationInternal = v2->_sha512DigestOperationInternal;
    v2->_sha512DigestOperationInternal = v3;

    CC_SHA512_Init((CC_SHA512_CTX *)((char *)v2->_sha512DigestOperationInternal + 8));
  }
  return v2;
}

- (_SFSHA512DigestOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFSHA512DigestOperation;
  return -[_SFSHA512DigestOperation init](&v4, sel_init, a3);
}

+ (int64_t)outputSize
{
  return 0;
}

+ (int64_t)blockSize
{
  return 0;
}

- (NSData)hashValue
{
  char *sha512DigestOperationInternal;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CC_SHA512_CTX v13;
  unsigned __int8 md[64];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  sha512DigestOperationInternal = (char *)self->_sha512DigestOperationInternal;
  *(_OWORD *)v13.count = *(_OWORD *)(sha512DigestOperationInternal + 8);
  v3 = *(_OWORD *)(sha512DigestOperationInternal + 40);
  v4 = *(_OWORD *)(sha512DigestOperationInternal + 72);
  v5 = *(_OWORD *)(sha512DigestOperationInternal + 24);
  *(_OWORD *)&v13.hash[4] = *(_OWORD *)(sha512DigestOperationInternal + 56);
  *(_OWORD *)&v13.hash[6] = v4;
  *(_OWORD *)v13.hash = v5;
  *(_OWORD *)&v13.hash[2] = v3;
  v6 = *(_OWORD *)(sha512DigestOperationInternal + 104);
  v7 = *(_OWORD *)(sha512DigestOperationInternal + 136);
  v8 = *(_OWORD *)(sha512DigestOperationInternal + 88);
  *(_OWORD *)&v13.wbuf[4] = *(_OWORD *)(sha512DigestOperationInternal + 120);
  *(_OWORD *)&v13.wbuf[6] = v7;
  *(_OWORD *)v13.wbuf = v8;
  *(_OWORD *)&v13.wbuf[2] = v6;
  v9 = *(_OWORD *)(sha512DigestOperationInternal + 168);
  v10 = *(_OWORD *)(sha512DigestOperationInternal + 200);
  v11 = *(_OWORD *)(sha512DigestOperationInternal + 152);
  *(_OWORD *)&v13.wbuf[12] = *(_OWORD *)(sha512DigestOperationInternal + 184);
  *(_OWORD *)&v13.wbuf[14] = v10;
  *(_OWORD *)&v13.wbuf[8] = v11;
  *(_OWORD *)&v13.wbuf[10] = v9;
  CC_SHA512_Final(md, &v13);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 64);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addData:(id)a3
{
  CC_SHA512_CTX *v3;
  id v4;
  const void *v5;
  CC_LONG v6;

  v3 = (CC_SHA512_CTX *)((char *)self->_sha512DigestOperationInternal + 8);
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  CC_SHA512_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x1E0CD6DC0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sha512DigestOperationInternal, 0);
}

@end

@implementation _SFSHA224DigestOperation

+ (id)digest:(id)a3
{
  id v3;
  _SFSHA224DigestOperation *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_SFSHA224DigestOperation);
  -[_SFSHA224DigestOperation addData:](v4, "addData:", v3);

  -[_SFSHA224DigestOperation hashValue](v4, "hashValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA224DigestOperation)init
{
  _SFSHA224DigestOperation *v2;
  SFSHA224DigestOperation_Ivars *v3;
  id sha224DigestOperationInternal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFSHA224DigestOperation;
  v2 = -[_SFSHA224DigestOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SFSHA224DigestOperation_Ivars);
    sha224DigestOperationInternal = v2->_sha224DigestOperationInternal;
    v2->_sha224DigestOperationInternal = v3;

    CC_SHA224_Init((CC_SHA256_CTX *)((char *)v2->_sha224DigestOperationInternal + 8));
  }
  return v2;
}

- (_SFSHA224DigestOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFSHA224DigestOperation;
  return -[_SFSHA224DigestOperation init](&v4, sel_init, a3);
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
  char *sha224DigestOperationInternal;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CC_SHA256_CTX v9;
  unsigned __int8 md[28];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sha224DigestOperationInternal = (char *)self->_sha224DigestOperationInternal;
  v3 = *(_OWORD *)(sha224DigestOperationInternal + 40);
  v4 = *(_OWORD *)(sha224DigestOperationInternal + 24);
  *(_OWORD *)v9.count = *(_OWORD *)(sha224DigestOperationInternal + 8);
  *(_OWORD *)&v9.hash[2] = v4;
  *(_OWORD *)&v9.hash[6] = v3;
  v5 = *(_OWORD *)(sha224DigestOperationInternal + 56);
  v6 = *(_OWORD *)(sha224DigestOperationInternal + 72);
  v7 = *(_OWORD *)(sha224DigestOperationInternal + 88);
  *(_QWORD *)&v9.wbuf[14] = *((_QWORD *)sha224DigestOperationInternal + 13);
  *(_OWORD *)&v9.wbuf[6] = v6;
  *(_OWORD *)&v9.wbuf[10] = v7;
  *(_OWORD *)&v9.wbuf[2] = v5;
  CC_SHA224_Final(md, &v9);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 28);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addData:(id)a3
{
  CC_SHA256_CTX *v3;
  id v4;
  const void *v5;
  CC_LONG v6;

  v3 = (CC_SHA256_CTX *)((char *)self->_sha224DigestOperationInternal + 8);
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  CC_SHA224_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x1E0CD6DA8];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sha224DigestOperationInternal, 0);
}

@end

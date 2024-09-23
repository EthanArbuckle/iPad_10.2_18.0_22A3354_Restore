@implementation _SFSHA1DigestOperation

+ (id)digest:(id)a3
{
  id v3;
  _SFSHA1DigestOperation *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_SFSHA1DigestOperation);
  -[_SFSHA1DigestOperation addData:](v4, "addData:", v3);

  -[_SFSHA1DigestOperation hashValue](v4, "hashValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA1DigestOperation)init
{
  _SFSHA1DigestOperation *v2;
  SFSHA1DigestOperation_Ivars *v3;
  id sha1DigestOperationInternal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFSHA1DigestOperation;
  v2 = -[_SFSHA1DigestOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SFSHA1DigestOperation_Ivars);
    sha1DigestOperationInternal = v2->_sha1DigestOperationInternal;
    v2->_sha1DigestOperationInternal = v3;

    CC_SHA1_Init((CC_SHA1_CTX *)((char *)v2->_sha1DigestOperationInternal + 8));
  }
  return v2;
}

- (_SFSHA1DigestOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFSHA1DigestOperation;
  return -[_SFSHA1DigestOperation init](&v4, sel_init, a3);
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
  char *sha1DigestOperationInternal;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  CC_SHA1_CTX v8;
  unsigned __int8 md[20];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sha1DigestOperationInternal = (char *)self->_sha1DigestOperationInternal;
  v3 = *(_OWORD *)(sha1DigestOperationInternal + 24);
  *(_OWORD *)&v8.h0 = *(_OWORD *)(sha1DigestOperationInternal + 8);
  *(_OWORD *)&v8.h4 = v3;
  v4 = *(_OWORD *)(sha1DigestOperationInternal + 56);
  v5 = *(_OWORD *)(sha1DigestOperationInternal + 88);
  v6 = *(_OWORD *)(sha1DigestOperationInternal + 40);
  *(_OWORD *)&v8.data[9] = *(_OWORD *)(sha1DigestOperationInternal + 72);
  *(_OWORD *)&v8.data[13] = v5;
  *(_OWORD *)&v8.data[1] = v6;
  *(_OWORD *)&v8.data[5] = v4;
  CC_SHA1_Final(md, &v8);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addData:(id)a3
{
  CC_SHA1_CTX *v3;
  id v4;
  const void *v5;
  CC_LONG v6;

  v3 = (CC_SHA1_CTX *)((char *)self->_sha1DigestOperationInternal + 8);
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  CC_SHA1_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x1E0CD6DA0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sha1DigestOperationInternal, 0);
}

@end

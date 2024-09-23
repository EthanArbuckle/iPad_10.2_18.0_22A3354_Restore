@implementation _SFMD5DigestOperation

+ (id)digest:(id)a3
{
  id v3;
  _SFMD5DigestOperation *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_SFMD5DigestOperation);
  -[_SFMD5DigestOperation addData:](v4, "addData:", v3);

  -[_SFMD5DigestOperation hashValue](v4, "hashValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)outputSize
{
  return 0;
}

+ (int64_t)blockSize
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFMD5DigestOperation)init
{
  _SFMD5DigestOperation *v2;
  SFMD5DigestOperation_Ivars *v3;
  id md5DigestOperationInternal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFMD5DigestOperation;
  v2 = -[_SFMD5DigestOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SFMD5DigestOperation_Ivars);
    md5DigestOperationInternal = v2->_md5DigestOperationInternal;
    v2->_md5DigestOperationInternal = v3;

    CC_MD5_Init((CC_MD5_CTX *)((char *)v2->_md5DigestOperationInternal + 8));
  }
  return v2;
}

- (_SFMD5DigestOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFMD5DigestOperation;
  return -[_SFMD5DigestOperation init](&v4, sel_init, a3);
}

- (NSData)hashValue
{
  CC_MD5_CTX v3;
  unsigned __int8 md[16];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(&v3, 0, sizeof(v3));
  CC_MD5_Final(md, &v3);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 16);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addData:(id)a3
{
  CC_MD5_CTX *v3;
  id v4;
  const void *v5;
  CC_LONG v6;

  v3 = (CC_MD5_CTX *)((char *)self->_md5DigestOperationInternal + 8);
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  CC_MD5_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x1E0CD6D98];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_md5DigestOperationInternal, 0);
}

@end

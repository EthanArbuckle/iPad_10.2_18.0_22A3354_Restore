@implementation ICContentKeyNonceResponse

- (ICContentKeyNonceResponse)initWithResponseDictionary:(id)a3
{
  id v4;
  ICContentKeyNonceResponse *v5;
  void *v6;
  uint64_t v7;
  NSData *nonceData;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICContentKeyNonceResponse;
  v5 = -[ICContentKeyNonceResponse init](&v10, sel_init);
  if (v5)
  {
    v5->_status = objc_msgSend(v4, "ic_integerValueForKey:", CFSTR("status"));
    objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("nonce"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
      nonceData = v5->_nonceData;
      v5->_nonceData = (NSData *)v7;

    }
  }

  return v5;
}

- (int64_t)status
{
  return self->_status;
}

- (NSData)nonceData
{
  return self->_nonceData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonceData, 0);
}

@end

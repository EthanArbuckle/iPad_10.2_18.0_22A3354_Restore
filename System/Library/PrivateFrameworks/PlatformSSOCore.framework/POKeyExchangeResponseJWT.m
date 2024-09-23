@implementation POKeyExchangeResponseJWT

- (POKeyExchangeResponseJWT)initWithString:(id)a3
{
  POKeyExchangeResponseJWT *v3;
  const __CFAllocator *Default;
  const __CFAllocator *v5;
  id v6;
  void *v7;
  void *v8;
  POKeyExchangeResponseJWTBody *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)POKeyExchangeResponseJWT;
  v3 = -[POJWT initWithString:](&v11, sel_initWithString_, a3);
  if (v3)
  {
    Default = CFAllocatorGetDefault();
    v5 = (const __CFAllocator *)SecCFAllocatorZeroize();
    CFAllocatorSetDefault(v5);
    v6 = objc_alloc(MEMORY[0x24BDBCE50]);
    -[POJWT rawBody](v3, "rawBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "psso_initWithBase64URLEncodedString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[_POJWTBodyBase initWithJWTData:]([POKeyExchangeResponseJWTBody alloc], "initWithJWTData:", v8);
      -[POKeyExchangeResponseJWT setDecodedBody:](v3, "setDecodedBody:", v9);

    }
    CFAllocatorSetDefault(Default);

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[POJWT decodedHeader](self, "decodedHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[POKeyExchangeResponseJWT decodedBody](self, "decodedBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POJWT stringRepresentation](self, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@\n%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateDecodedBody
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFAllocator *Default;
  const __CFAllocator *v8;
  id v9;
  void *v10;
  POKeyExchangeResponseJWTBody *v11;
  id v12;

  -[POJWT rawBody](self, "rawBody");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[POJWT decodedHeader](self, "decodedHeader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      Default = CFAllocatorGetDefault();
      v8 = (const __CFAllocator *)SecCFAllocatorZeroize();
      CFAllocatorSetDefault(v8);
      v9 = objc_alloc(MEMORY[0x24BDBCE50]);
      -[POJWT rawBody](self, "rawBody");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "psso_initWithBase64URLEncodedString:", v10);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v11 = -[_POJWTBodyBase initWithJWTData:]([POKeyExchangeResponseJWTBody alloc], "initWithJWTData:", v12);
        -[POKeyExchangeResponseJWT setDecodedBody:](self, "setDecodedBody:", v11);

      }
      CFAllocatorSetDefault(Default);

    }
  }
}

- (id)mutableCopy
{
  POMutableKeyExchangeResponseJWT *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(POMutableKeyExchangeResponseJWT);
  -[POKeyExchangeResponseJWT decodedBody](self, "decodedBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[POMutableKeyExchangeResponseJWT setBody:](v3, "setBody:", v5);

  -[POJWT decodedHeader](self, "decodedHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[POMutableJWT setHeader:](v3, "setHeader:", v7);

  return v3;
}

- (POKeyExchangeResponseJWTBody)decodedBody
{
  return (POKeyExchangeResponseJWTBody *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDecodedBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodedBody, 0);
}

@end

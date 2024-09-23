@implementation POKeyRequestJWT

- (POKeyRequestJWT)initWithString:(id)a3
{
  POKeyRequestJWT *v3;
  id v4;
  void *v5;
  void *v6;
  POKeyRequestJWTBody *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)POKeyRequestJWT;
  v3 = -[POJWT initWithString:](&v9, sel_initWithString_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCE50]);
    -[POJWT rawBody](v3, "rawBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "psso_initWithBase64URLEncodedString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[_POJWTBodyBase initWithJWTData:]([POKeyRequestJWTBody alloc], "initWithJWTData:", v6);
      -[POKeyRequestJWT setDecodedBody:](v3, "setDecodedBody:", v7);

    }
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
  -[POKeyRequestJWT decodedBody](self, "decodedBody");
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
  POKeyRequestJWTBody *v11;
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
        v11 = -[_POJWTBodyBase initWithJWTData:]([POKeyRequestJWTBody alloc], "initWithJWTData:", v12);
        -[POKeyRequestJWT setDecodedBody:](self, "setDecodedBody:", v11);

      }
      CFAllocatorSetDefault(Default);

    }
  }
}

- (id)mutableCopy
{
  POMutableKeyRequestJWT *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(POMutableKeyRequestJWT);
  -[POKeyRequestJWT decodedBody](self, "decodedBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[POMutableKeyRequestJWT setBody:](v3, "setBody:", v5);

  -[POJWT decodedHeader](self, "decodedHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[POMutableJWT setHeader:](v3, "setHeader:", v7);

  return v3;
}

- (POKeyRequestJWTBody)decodedBody
{
  return (POKeyRequestJWTBody *)objc_getProperty(self, a2, 80, 1);
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

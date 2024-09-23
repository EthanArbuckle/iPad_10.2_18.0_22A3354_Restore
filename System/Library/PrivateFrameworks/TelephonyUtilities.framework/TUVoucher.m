@implementation TUVoucher

- (TUVoucher)initWithHandle:(id)a3 tokenPrefixedURI:(id)a4 data:(id)a5 encryptedData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TUVoucher *v15;
  uint64_t v16;
  NSData *encryptedData;
  uint64_t v18;
  NSString *tokenPrefixedURI;
  uint64_t v20;
  NSData *unsafeData;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)TUVoucher;
  v15 = -[TUVoucher init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    encryptedData = v15->_encryptedData;
    v15->_encryptedData = (NSData *)v16;

    objc_storeStrong((id *)&v15->_handle, a3);
    v18 = objc_msgSend(v12, "copy");
    tokenPrefixedURI = v15->_tokenPrefixedURI;
    v15->_tokenPrefixedURI = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    unsafeData = v15->_unsafeData;
    v15->_unsafeData = (NSData *)v20;

  }
  return v15;
}

- (TUVoucher)initWithVoucher:(id)a3
{
  id v4;
  TUVoucher *v5;
  void *v6;
  uint64_t v7;
  NSData *encryptedData;
  void *v9;
  uint64_t v10;
  TUHandle *handle;
  void *v12;
  uint64_t v13;
  NSString *tokenPrefixedURI;
  void *v15;
  uint64_t v16;
  NSData *unsafeData;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUVoucher;
  v5 = -[TUVoucher init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "encryptedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    encryptedData = v5->_encryptedData;
    v5->_encryptedData = (NSData *)v7;

    objc_msgSend(v4, "handle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v10;

    objc_msgSend(v4, "tokenPrefixedURI");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    tokenPrefixedURI = v5->_tokenPrefixedURI;
    v5->_tokenPrefixedURI = (NSString *)v13;

    objc_msgSend(v4, "unsafeData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    unsafeData = v5->_unsafeData;
    v5->_unsafeData = (NSData *)v16;

  }
  return v5;
}

- (NSData)data
{
  return self->_unsafeData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUVoucher)initWithCoder:(id)a3
{
  id v4;
  TUVoucher *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSData *encryptedData;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  TUHandle *handle;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *tokenPrefixedURI;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSData *unsafeData;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TUVoucher;
  v5 = -[TUVoucher init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_encryptedData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    encryptedData = v5->_encryptedData;
    v5->_encryptedData = (NSData *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_handle);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_tokenPrefixedURI);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    tokenPrefixedURI = v5->_tokenPrefixedURI;
    v5->_tokenPrefixedURI = (NSString *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_unsafeData);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    unsafeData = v5->_unsafeData;
    v5->_unsafeData = (NSData *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *encryptedData;
  id v5;
  void *v6;
  TUHandle *handle;
  void *v8;
  NSString *tokenPrefixedURI;
  void *v10;
  NSData *unsafeData;
  id v12;

  encryptedData = self->_encryptedData;
  v5 = a3;
  NSStringFromSelector(sel_encryptedData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", encryptedData, v6);

  handle = self->_handle;
  NSStringFromSelector(sel_handle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", handle, v8);

  tokenPrefixedURI = self->_tokenPrefixedURI;
  NSStringFromSelector(sel_tokenPrefixedURI);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", tokenPrefixedURI, v10);

  unsafeData = self->_unsafeData;
  NSStringFromSelector(sel_unsafeData);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", unsafeData, v12);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUVoucher initWithVoucher:](+[TUVoucher allocWithZone:](TUVoucher, "allocWithZone:", a3), "initWithVoucher:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUVoucher handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v4, v5);

  NSStringFromSelector(sel_tokenPrefixedURI);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUVoucher tokenPrefixedURI](self, "tokenPrefixedURI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v6, v7);

  -[TUVoucher data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" unsafeDataHash=%tu"), objc_msgSend(v8, "hash"));

  -[TUVoucher encryptedData](self, "encryptedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" encryptedDataHash=%tu"), objc_msgSend(v9, "hash"));

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[NSData hash](self->_encryptedData, "hash");
  v4 = -[TUHandle hash](self->_handle, "hash") ^ v3;
  v5 = -[NSString hash](self->_tokenPrefixedURI, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_unsafeData, "hash");
}

- (id)messagingData
{
  void *v2;
  void *v3;

  +[CSDMessagingVoucher voucherWithTUVoucher:](CSDMessagingVoucher, "voucherWithTUVoucher:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)voucherFromMessagingData:(id)a3
{
  id v3;
  CSDMessagingVoucher *v4;
  void *v5;

  v3 = a3;
  v4 = -[CSDMessagingVoucher initWithData:]([CSDMessagingVoucher alloc], "initWithData:", v3);

  -[CSDMessagingVoucher tuVoucher](v4, "tuVoucher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  TUVoucher *v4;
  BOOL v5;

  v4 = (TUVoucher *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TUVoucher isEqualToVoucher:](self, "isEqualToVoucher:", v4);
  }

  return v5;
}

- (BOOL)isEqualToVoucher:(id)a3
{
  id v4;
  NSData *encryptedData;
  void *v6;
  TUHandle *handle;
  void *v8;
  NSString *tokenPrefixedURI;
  void *v10;
  NSData *unsafeData;
  void *v12;
  BOOL v13;

  v4 = a3;
  encryptedData = self->_encryptedData;
  objc_msgSend(v4, "encryptedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSData isEqualToData:](encryptedData, "isEqualToData:", v6))
  {
    handle = self->_handle;
    objc_msgSend(v4, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TUHandle isEqualToHandle:](handle, "isEqualToHandle:", v8))
    {
      tokenPrefixedURI = self->_tokenPrefixedURI;
      objc_msgSend(v4, "tokenPrefixedURI");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](tokenPrefixedURI, "isEqualToString:", v10))
      {
        unsafeData = self->_unsafeData;
        objc_msgSend(v4, "unsafeData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[NSData isEqualToData:](unsafeData, "isEqualToData:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSString)tokenPrefixedURI
{
  return self->_tokenPrefixedURI;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (NSData)unsafeData
{
  return self->_unsafeData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsafeData, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_tokenPrefixedURI, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end

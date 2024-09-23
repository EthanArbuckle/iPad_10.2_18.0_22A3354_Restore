@implementation CSDMessagingVoucher

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasTokenPrefixedURI
{
  return self->_tokenPrefixedURI != 0;
}

- (BOOL)hasUnsafeData
{
  return self->_unsafeData != 0;
}

- (BOOL)hasEncryptedData
{
  return self->_encryptedData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CSDMessagingVoucher;
  -[CSDMessagingVoucher description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDMessagingVoucher dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CSDMessagingHandle *handle;
  void *v5;
  NSString *tokenPrefixedURI;
  NSData *unsafeData;
  NSData *encryptedData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  handle = self->_handle;
  if (handle)
  {
    -[CSDMessagingHandle dictionaryRepresentation](handle, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("handle"));

  }
  tokenPrefixedURI = self->_tokenPrefixedURI;
  if (tokenPrefixedURI)
    objc_msgSend(v3, "setObject:forKey:", tokenPrefixedURI, CFSTR("tokenPrefixedURI"));
  unsafeData = self->_unsafeData;
  if (unsafeData)
    objc_msgSend(v3, "setObject:forKey:", unsafeData, CFSTR("unsafeData"));
  encryptedData = self->_encryptedData;
  if (encryptedData)
    objc_msgSend(v3, "setObject:forKey:", encryptedData, CFSTR("encryptedData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CSDMessagingVoucherReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_handle)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tokenPrefixedURI)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_unsafeData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_encryptedData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    v4 = v5;
  }
  if (self->_tokenPrefixedURI)
  {
    objc_msgSend(v5, "setTokenPrefixedURI:");
    v4 = v5;
  }
  if (self->_unsafeData)
  {
    objc_msgSend(v5, "setUnsafeData:");
    v4 = v5;
  }
  if (self->_encryptedData)
  {
    objc_msgSend(v5, "setEncryptedData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CSDMessagingHandle copyWithZone:](self->_handle, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_tokenPrefixedURI, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_unsafeData, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSData copyWithZone:](self->_encryptedData, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  CSDMessagingHandle *handle;
  NSString *tokenPrefixedURI;
  NSData *unsafeData;
  NSData *encryptedData;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((handle = self->_handle, !((unint64_t)handle | v4[2]))
     || -[CSDMessagingHandle isEqual:](handle, "isEqual:"))
    && ((tokenPrefixedURI = self->_tokenPrefixedURI, !((unint64_t)tokenPrefixedURI | v4[3]))
     || -[NSString isEqual:](tokenPrefixedURI, "isEqual:"))
    && ((unsafeData = self->_unsafeData, !((unint64_t)unsafeData | v4[4]))
     || -[NSData isEqual:](unsafeData, "isEqual:")))
  {
    encryptedData = self->_encryptedData;
    if ((unint64_t)encryptedData | v4[1])
      v9 = -[NSData isEqual:](encryptedData, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[CSDMessagingHandle hash](self->_handle, "hash");
  v4 = -[NSString hash](self->_tokenPrefixedURI, "hash") ^ v3;
  v5 = -[NSData hash](self->_unsafeData, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_encryptedData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CSDMessagingHandle *handle;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  handle = self->_handle;
  v6 = v4[2];
  v7 = v4;
  if (handle)
  {
    if (!v6)
      goto LABEL_7;
    -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[CSDMessagingVoucher setHandle:](self, "setHandle:");
  }
  v4 = v7;
LABEL_7:
  if (v4[3])
  {
    -[CSDMessagingVoucher setTokenPrefixedURI:](self, "setTokenPrefixedURI:");
    v4 = v7;
  }
  if (v4[4])
  {
    -[CSDMessagingVoucher setUnsafeData:](self, "setUnsafeData:");
    v4 = v7;
  }
  if (v4[1])
  {
    -[CSDMessagingVoucher setEncryptedData:](self, "setEncryptedData:");
    v4 = v7;
  }

}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)tokenPrefixedURI
{
  return self->_tokenPrefixedURI;
}

- (void)setTokenPrefixedURI:(id)a3
{
  objc_storeStrong((id *)&self->_tokenPrefixedURI, a3);
}

- (NSData)unsafeData
{
  return self->_unsafeData;
}

- (void)setUnsafeData:(id)a3
{
  objc_storeStrong((id *)&self->_unsafeData, a3);
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void)setEncryptedData:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsafeData, 0);
  objc_storeStrong((id *)&self->_tokenPrefixedURI, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
}

+ (id)voucherWithTUVoucher:(id)a3
{
  id v3;
  CSDMessagingVoucher *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(CSDMessagingVoucher);
  objc_msgSend(v3, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSDMessagingHandle handleWithTUHandle:](CSDMessagingHandle, "handleWithTUHandle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDMessagingVoucher setHandle:](v4, "setHandle:", v6);

  objc_msgSend(v3, "tokenPrefixedURI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDMessagingVoucher setTokenPrefixedURI:](v4, "setTokenPrefixedURI:", v7);

  objc_msgSend(v3, "unsafeData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDMessagingVoucher setUnsafeData:](v4, "setUnsafeData:", v8);

  objc_msgSend(v3, "encryptedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSDMessagingVoucher setEncryptedData:](v4, "setEncryptedData:", v9);
  return v4;
}

- (TUVoucher)tuVoucher
{
  TUVoucher *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TUVoucher *v9;

  v3 = [TUVoucher alloc];
  -[CSDMessagingVoucher handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tuHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDMessagingVoucher tokenPrefixedURI](self, "tokenPrefixedURI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDMessagingVoucher unsafeData](self, "unsafeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDMessagingVoucher encryptedData](self, "encryptedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TUVoucher initWithHandle:tokenPrefixedURI:data:encryptedData:](v3, "initWithHandle:tokenPrefixedURI:data:encryptedData:", v5, v6, v7, v8);

  return v9;
}

@end

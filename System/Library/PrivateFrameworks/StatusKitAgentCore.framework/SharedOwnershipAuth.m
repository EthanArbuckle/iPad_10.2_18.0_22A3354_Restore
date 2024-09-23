@implementation SharedOwnershipAuth

- (BOOL)hasSimpleJwt
{
  return self->_simpleJwt != 0;
}

- (BOOL)hasChannelPublicKey
{
  return self->_channelPublicKey != 0;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
}

- (BOOL)hasSignNonce
{
  return self->_signNonce != 0;
}

- (BOOL)hasServerEncryptionKey
{
  return self->_serverEncryptionKey != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SharedOwnershipAuth;
  -[SharedOwnershipAuth description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SharedOwnershipAuth dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *simpleJwt;
  NSData *channelPublicKey;
  NSData *nonce;
  NSData *signNonce;
  NSData *serverEncryptionKey;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  simpleJwt = self->_simpleJwt;
  if (simpleJwt)
    objc_msgSend(v3, "setObject:forKey:", simpleJwt, CFSTR("simple_jwt"));
  channelPublicKey = self->_channelPublicKey;
  if (channelPublicKey)
    objc_msgSend(v4, "setObject:forKey:", channelPublicKey, CFSTR("channel_public_key"));
  nonce = self->_nonce;
  if (nonce)
    objc_msgSend(v4, "setObject:forKey:", nonce, CFSTR("nonce"));
  signNonce = self->_signNonce;
  if (signNonce)
    objc_msgSend(v4, "setObject:forKey:", signNonce, CFSTR("sign_nonce"));
  serverEncryptionKey = self->_serverEncryptionKey;
  if (serverEncryptionKey)
    objc_msgSend(v4, "setObject:forKey:", serverEncryptionKey, CFSTR("server_encryption_key"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SharedOwnershipAuthReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_simpleJwt)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_channelPublicKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_nonce)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_signNonce)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_serverEncryptionKey)
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
  if (self->_simpleJwt)
  {
    objc_msgSend(v4, "setSimpleJwt:");
    v4 = v5;
  }
  if (self->_channelPublicKey)
  {
    objc_msgSend(v5, "setChannelPublicKey:");
    v4 = v5;
  }
  if (self->_nonce)
  {
    objc_msgSend(v5, "setNonce:");
    v4 = v5;
  }
  if (self->_signNonce)
  {
    objc_msgSend(v5, "setSignNonce:");
    v4 = v5;
  }
  if (self->_serverEncryptionKey)
  {
    objc_msgSend(v5, "setServerEncryptionKey:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_simpleJwt, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSData copyWithZone:](self->_channelPublicKey, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSData copyWithZone:](self->_nonce, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSData copyWithZone:](self->_signNonce, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSData copyWithZone:](self->_serverEncryptionKey, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *simpleJwt;
  NSData *channelPublicKey;
  NSData *nonce;
  NSData *signNonce;
  NSData *serverEncryptionKey;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((simpleJwt = self->_simpleJwt, !((unint64_t)simpleJwt | v4[5]))
     || -[NSString isEqual:](simpleJwt, "isEqual:"))
    && ((channelPublicKey = self->_channelPublicKey, !((unint64_t)channelPublicKey | v4[1]))
     || -[NSData isEqual:](channelPublicKey, "isEqual:"))
    && ((nonce = self->_nonce, !((unint64_t)nonce | v4[2])) || -[NSData isEqual:](nonce, "isEqual:"))&& ((signNonce = self->_signNonce, !((unint64_t)signNonce | v4[4]))|| -[NSData isEqual:](signNonce, "isEqual:")))
  {
    serverEncryptionKey = self->_serverEncryptionKey;
    if ((unint64_t)serverEncryptionKey | v4[3])
      v10 = -[NSData isEqual:](serverEncryptionKey, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_simpleJwt, "hash");
  v4 = -[NSData hash](self->_channelPublicKey, "hash") ^ v3;
  v5 = -[NSData hash](self->_nonce, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_signNonce, "hash");
  return v6 ^ -[NSData hash](self->_serverEncryptionKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[5])
    -[SharedOwnershipAuth setSimpleJwt:](self, "setSimpleJwt:");
  if (v4[1])
    -[SharedOwnershipAuth setChannelPublicKey:](self, "setChannelPublicKey:");
  if (v4[2])
    -[SharedOwnershipAuth setNonce:](self, "setNonce:");
  if (v4[4])
    -[SharedOwnershipAuth setSignNonce:](self, "setSignNonce:");
  if (v4[3])
    -[SharedOwnershipAuth setServerEncryptionKey:](self, "setServerEncryptionKey:");

}

- (NSString)simpleJwt
{
  return self->_simpleJwt;
}

- (void)setSimpleJwt:(id)a3
{
  objc_storeStrong((id *)&self->_simpleJwt, a3);
}

- (NSData)channelPublicKey
{
  return self->_channelPublicKey;
}

- (void)setChannelPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_channelPublicKey, a3);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (NSData)signNonce
{
  return self->_signNonce;
}

- (void)setSignNonce:(id)a3
{
  objc_storeStrong((id *)&self->_signNonce, a3);
}

- (NSData)serverEncryptionKey
{
  return self->_serverEncryptionKey;
}

- (void)setServerEncryptionKey:(id)a3
{
  objc_storeStrong((id *)&self->_serverEncryptionKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleJwt, 0);
  objc_storeStrong((id *)&self->_signNonce, 0);
  objc_storeStrong((id *)&self->_serverEncryptionKey, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_channelPublicKey, 0);
}

@end

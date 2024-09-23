@implementation PCSManateePrivateKey

- (BOOL)hasPrivateKey
{
  return self->_privateKey != 0;
}

- (BOOL)hasPublicKeyInfo
{
  return self->_publicKeyInfo != 0;
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
  v8.super_class = (Class)PCSManateePrivateKey;
  -[PCSManateePrivateKey description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSManateePrivateKey dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *privateKey;
  NSData *publicKeyInfo;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  privateKey = self->_privateKey;
  if (privateKey)
    objc_msgSend(v3, "setObject:forKey:", privateKey, CFSTR("privateKey"));
  publicKeyInfo = self->_publicKeyInfo;
  if (publicKeyInfo)
    objc_msgSend(v4, "setObject:forKey:", publicKeyInfo, CFSTR("publicKeyInfo"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PCSManateePrivateKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_privateKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_publicKeyInfo)
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
  if (self->_privateKey)
  {
    objc_msgSend(v4, "setPrivateKey:");
    v4 = v5;
  }
  if (self->_publicKeyInfo)
  {
    objc_msgSend(v5, "setPublicKeyInfo:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_privateKey, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_publicKeyInfo, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *privateKey;
  NSData *publicKeyInfo;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((privateKey = self->_privateKey, !((unint64_t)privateKey | v4[1]))
     || -[NSData isEqual:](privateKey, "isEqual:")))
  {
    publicKeyInfo = self->_publicKeyInfo;
    if ((unint64_t)publicKeyInfo | v4[2])
      v7 = -[NSData isEqual:](publicKeyInfo, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_privateKey, "hash");
  return -[NSData hash](self->_publicKeyInfo, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[PCSManateePrivateKey setPrivateKey:](self, "setPrivateKey:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[PCSManateePrivateKey setPublicKeyInfo:](self, "setPublicKeyInfo:");
    v4 = v5;
  }

}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(id)a3
{
  objc_storeStrong((id *)&self->_privateKey, a3);
}

- (NSData)publicKeyInfo
{
  return self->_publicKeyInfo;
}

- (void)setPublicKeyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_publicKeyInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyInfo, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
}

@end

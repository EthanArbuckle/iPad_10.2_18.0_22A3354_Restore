@implementation TPPBPolicyRedactionAuthenticatedCiphertext

- (BOOL)hasCiphertext
{
  return self->_ciphertext != 0;
}

- (BOOL)hasAuthenticationCode
{
  return self->_authenticationCode != 0;
}

- (BOOL)hasInitializationVector
{
  return self->_initializationVector != 0;
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
  v8.super_class = (Class)TPPBPolicyRedactionAuthenticatedCiphertext;
  -[TPPBPolicyRedactionAuthenticatedCiphertext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPolicyRedactionAuthenticatedCiphertext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *ciphertext;
  NSData *authenticationCode;
  NSData *initializationVector;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  ciphertext = self->_ciphertext;
  if (ciphertext)
    objc_msgSend(v3, "setObject:forKey:", ciphertext, CFSTR("ciphertext"));
  authenticationCode = self->_authenticationCode;
  if (authenticationCode)
    objc_msgSend(v4, "setObject:forKey:", authenticationCode, CFSTR("authenticationCode"));
  initializationVector = self->_initializationVector;
  if (initializationVector)
    objc_msgSend(v4, "setObject:forKey:", initializationVector, CFSTR("initializationVector"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyRedactionAuthenticatedCiphertextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_ciphertext)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_authenticationCode)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_initializationVector)
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
  if (self->_ciphertext)
  {
    objc_msgSend(v4, "setCiphertext:");
    v4 = v5;
  }
  if (self->_authenticationCode)
  {
    objc_msgSend(v5, "setAuthenticationCode:");
    v4 = v5;
  }
  if (self->_initializationVector)
  {
    objc_msgSend(v5, "setInitializationVector:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_ciphertext, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_authenticationCode, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSData copyWithZone:](self->_initializationVector, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *ciphertext;
  NSData *authenticationCode;
  NSData *initializationVector;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((ciphertext = self->_ciphertext, !((unint64_t)ciphertext | v4[2]))
     || -[NSData isEqual:](ciphertext, "isEqual:"))
    && ((authenticationCode = self->_authenticationCode, !((unint64_t)authenticationCode | v4[1]))
     || -[NSData isEqual:](authenticationCode, "isEqual:")))
  {
    initializationVector = self->_initializationVector;
    if ((unint64_t)initializationVector | v4[3])
      v8 = -[NSData isEqual:](initializationVector, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_ciphertext, "hash");
  v4 = -[NSData hash](self->_authenticationCode, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_initializationVector, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[TPPBPolicyRedactionAuthenticatedCiphertext setCiphertext:](self, "setCiphertext:");
  if (v4[1])
    -[TPPBPolicyRedactionAuthenticatedCiphertext setAuthenticationCode:](self, "setAuthenticationCode:");
  if (v4[3])
    -[TPPBPolicyRedactionAuthenticatedCiphertext setInitializationVector:](self, "setInitializationVector:");

}

- (NSData)ciphertext
{
  return self->_ciphertext;
}

- (void)setCiphertext:(id)a3
{
  objc_storeStrong((id *)&self->_ciphertext, a3);
}

- (NSData)authenticationCode
{
  return self->_authenticationCode;
}

- (void)setAuthenticationCode:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationCode, a3);
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
  objc_storeStrong((id *)&self->_initializationVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_ciphertext, 0);
  objc_storeStrong((id *)&self->_authenticationCode, 0);
}

@end

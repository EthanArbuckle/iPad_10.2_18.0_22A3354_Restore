@implementation PCSManateeShareableIdentity

- (BOOL)hasEncryptionPrivateKey
{
  return self->_encryptionPrivateKey != 0;
}

- (BOOL)hasSigningPrivateKey
{
  return self->_signingPrivateKey != 0;
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
  v8.super_class = (Class)PCSManateeShareableIdentity;
  -[PCSManateeShareableIdentity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSManateeShareableIdentity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PCSManateePrivateKey *encryptionPrivateKey;
  void *v5;
  PCSManateePrivateKey *signingPrivateKey;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  encryptionPrivateKey = self->_encryptionPrivateKey;
  if (encryptionPrivateKey)
  {
    -[PCSManateePrivateKey dictionaryRepresentation](encryptionPrivateKey, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("encryptionPrivateKey"));

  }
  signingPrivateKey = self->_signingPrivateKey;
  if (signingPrivateKey)
  {
    -[PCSManateePrivateKey dictionaryRepresentation](signingPrivateKey, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("signingPrivateKey"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PCSManateeShareableIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_encryptionPrivateKey)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_signingPrivateKey)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_encryptionPrivateKey)
  {
    objc_msgSend(v4, "setEncryptionPrivateKey:");
    v4 = v5;
  }
  if (self->_signingPrivateKey)
  {
    objc_msgSend(v5, "setSigningPrivateKey:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PCSManateePrivateKey copyWithZone:](self->_encryptionPrivateKey, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PCSManateePrivateKey copyWithZone:](self->_signingPrivateKey, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PCSManateePrivateKey *encryptionPrivateKey;
  PCSManateePrivateKey *signingPrivateKey;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((encryptionPrivateKey = self->_encryptionPrivateKey, !((unint64_t)encryptionPrivateKey | v4[1]))
     || -[PCSManateePrivateKey isEqual:](encryptionPrivateKey, "isEqual:")))
  {
    signingPrivateKey = self->_signingPrivateKey;
    if ((unint64_t)signingPrivateKey | v4[2])
      v7 = -[PCSManateePrivateKey isEqual:](signingPrivateKey, "isEqual:");
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
  unint64_t v3;

  v3 = -[PCSManateePrivateKey hash](self->_encryptionPrivateKey, "hash");
  return -[PCSManateePrivateKey hash](self->_signingPrivateKey, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PCSManateePrivateKey *encryptionPrivateKey;
  uint64_t v6;
  PCSManateePrivateKey *signingPrivateKey;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  encryptionPrivateKey = self->_encryptionPrivateKey;
  v6 = v4[1];
  v9 = v4;
  if (encryptionPrivateKey)
  {
    if (!v6)
      goto LABEL_7;
    -[PCSManateePrivateKey mergeFrom:](encryptionPrivateKey, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PCSManateeShareableIdentity setEncryptionPrivateKey:](self, "setEncryptionPrivateKey:");
  }
  v4 = v9;
LABEL_7:
  signingPrivateKey = self->_signingPrivateKey;
  v8 = v4[2];
  if (signingPrivateKey)
  {
    if (v8)
    {
      -[PCSManateePrivateKey mergeFrom:](signingPrivateKey, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PCSManateeShareableIdentity setSigningPrivateKey:](self, "setSigningPrivateKey:");
    goto LABEL_12;
  }

}

- (PCSManateePrivateKey)encryptionPrivateKey
{
  return self->_encryptionPrivateKey;
}

- (void)setEncryptionPrivateKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionPrivateKey, a3);
}

- (PCSManateePrivateKey)signingPrivateKey
{
  return self->_signingPrivateKey;
}

- (void)setSigningPrivateKey:(id)a3
{
  objc_storeStrong((id *)&self->_signingPrivateKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingPrivateKey, 0);
  objc_storeStrong((id *)&self->_encryptionPrivateKey, 0);
}

@end

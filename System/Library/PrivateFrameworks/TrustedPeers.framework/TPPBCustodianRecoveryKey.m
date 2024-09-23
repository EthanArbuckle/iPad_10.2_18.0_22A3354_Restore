@implementation TPPBCustodianRecoveryKey

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasSigningPublicKey
{
  return self->_signingPublicKey != 0;
}

- (BOOL)hasEncryptionPublicKey
{
  return self->_encryptionPublicKey != 0;
}

- (int)kind
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_kind;
  else
    return 0;
}

- (void)setKind:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_kind = a3;
}

- (void)setHasKind:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKind
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)kindAsString:(int)a3
{
  if (a3 < 3)
    return off_1EA8BF6D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKind:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOVERY_KEY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INHERITANCE_KEY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)TPPBCustodianRecoveryKey;
  -[TPPBCustodianRecoveryKey description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBCustodianRecoveryKey dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuid;
  NSData *signingPublicKey;
  NSData *encryptionPublicKey;
  uint64_t kind;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  signingPublicKey = self->_signingPublicKey;
  if (signingPublicKey)
    objc_msgSend(v4, "setObject:forKey:", signingPublicKey, CFSTR("signing_public_key"));
  encryptionPublicKey = self->_encryptionPublicKey;
  if (encryptionPublicKey)
    objc_msgSend(v4, "setObject:forKey:", encryptionPublicKey, CFSTR("encryption_public_key"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    kind = self->_kind;
    if (kind >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_kind);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1EA8BF6D0[kind];
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("kind"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBCustodianRecoveryKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_signingPublicKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_encryptionPublicKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v5;
  }
  if (self->_signingPublicKey)
  {
    objc_msgSend(v5, "setSigningPublicKey:");
    v4 = v5;
  }
  if (self->_encryptionPublicKey)
  {
    objc_msgSend(v5, "setEncryptionPublicKey:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_kind;
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSData copyWithZone:](self->_signingPublicKey, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSData copyWithZone:](self->_encryptionPublicKey, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_kind;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuid;
  NSData *signingPublicKey;
  NSData *encryptionPublicKey;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_12;
  }
  signingPublicKey = self->_signingPublicKey;
  if ((unint64_t)signingPublicKey | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](signingPublicKey, "isEqual:"))
      goto LABEL_12;
  }
  encryptionPublicKey = self->_encryptionPublicKey;
  if ((unint64_t)encryptionPublicKey | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](encryptionPublicKey, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_kind == *((_DWORD *)v4 + 4))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_uuid, "hash");
  v4 = -[NSData hash](self->_signingPublicKey, "hash");
  v5 = -[NSData hash](self->_encryptionPublicKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_kind;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[TPPBCustodianRecoveryKey setUuid:](self, "setUuid:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[TPPBCustodianRecoveryKey setSigningPublicKey:](self, "setSigningPublicKey:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[TPPBCustodianRecoveryKey setEncryptionPublicKey:](self, "setEncryptionPublicKey:");
    v4 = v5;
  }
  if ((v4[10] & 1) != 0)
  {
    self->_kind = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSData)signingPublicKey
{
  return self->_signingPublicKey;
}

- (void)setSigningPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_signingPublicKey, a3);
}

- (NSData)encryptionPublicKey
{
  return self->_encryptionPublicKey;
}

- (void)setEncryptionPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionPublicKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_signingPublicKey, 0);
  objc_storeStrong((id *)&self->_encryptionPublicKey, 0);
}

@end

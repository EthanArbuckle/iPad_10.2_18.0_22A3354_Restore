@implementation PCSEnvelopedKeyMaterial

- (int)version
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_version;
  else
    return 0;
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)versionAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("HKDF_SIV_GCM_HMAC_256");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsVersion:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HKDF_SIV_GCM_HMAC_256"));

  return v4;
}

- (BOOL)hasMasterKeyId
{
  return self->_masterKeyId != 0;
}

- (BOOL)hasEncryptedSeed
{
  return self->_encryptedSeed != 0;
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
  v8.super_class = (Class)PCSEnvelopedKeyMaterial;
  -[PCSEnvelopedKeyMaterial description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSEnvelopedKeyMaterial dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int version;
  __CFString *v5;
  NSData *masterKeyId;
  NSData *encryptedSeed;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    version = self->_version;
    if (version)
    {
      if (version == 1)
      {
        v5 = CFSTR("HKDF_SIV_GCM_HMAC_256");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_version);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("UNKNOWN");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

  }
  masterKeyId = self->_masterKeyId;
  if (masterKeyId)
    objc_msgSend(v3, "setObject:forKey:", masterKeyId, CFSTR("masterKeyId"));
  encryptedSeed = self->_encryptedSeed;
  if (encryptedSeed)
    objc_msgSend(v3, "setObject:forKey:", encryptedSeed, CFSTR("encryptedSeed"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PCSEnvelopedKeyMaterialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_masterKeyId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_encryptedSeed)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v5 = v4;
  if (self->_masterKeyId)
  {
    objc_msgSend(v4, "setMasterKeyId:");
    v4 = v5;
  }
  if (self->_encryptedSeed)
  {
    objc_msgSend(v5, "setEncryptedSeed:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_version;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_masterKeyId, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSData copyWithZone:](self->_encryptedSeed, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *masterKeyId;
  NSData *encryptedSeed;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  masterKeyId = self->_masterKeyId;
  if ((unint64_t)masterKeyId | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](masterKeyId, "isEqual:"))
    goto LABEL_11;
  encryptedSeed = self->_encryptedSeed;
  if ((unint64_t)encryptedSeed | *((_QWORD *)v4 + 1))
    v7 = -[NSData isEqual:](encryptedSeed, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_masterKeyId, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_encryptedSeed, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[7] & 1) != 0)
  {
    self->_version = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PCSEnvelopedKeyMaterial setMasterKeyId:](self, "setMasterKeyId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PCSEnvelopedKeyMaterial setEncryptedSeed:](self, "setEncryptedSeed:");
    v4 = v5;
  }

}

- (NSData)masterKeyId
{
  return self->_masterKeyId;
}

- (void)setMasterKeyId:(id)a3
{
  objc_storeStrong((id *)&self->_masterKeyId, a3);
}

- (NSData)encryptedSeed
{
  return self->_encryptedSeed;
}

- (void)setEncryptedSeed:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedSeed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterKeyId, 0);
  objc_storeStrong((id *)&self->_encryptedSeed, 0);
}

@end

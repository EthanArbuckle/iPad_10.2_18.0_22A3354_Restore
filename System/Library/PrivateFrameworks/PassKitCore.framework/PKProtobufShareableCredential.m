@implementation PKProtobufShareableCredential

- (BOOL)hasEncryptedPushProvisioningTarget
{
  return self->_encryptedPushProvisioningTarget != 0;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 5)
    return off_1E2ACBE48[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AVAILABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONSUMED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REVOKED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXPIRED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCredentialIdentifierHash
{
  return self->_credentialIdentifierHash != 0;
}

- (BOOL)hasOwnerDisplayName
{
  return self->_ownerDisplayName != 0;
}

- (BOOL)hasCredentialIdentifier
{
  return self->_credentialIdentifier != 0;
}

- (BOOL)hasCardConfigurationIdentifier
{
  return self->_cardConfigurationIdentifier != 0;
}

- (BOOL)hasSharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier != 0;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
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
  v8.super_class = (Class)PKProtobufShareableCredential;
  -[PKProtobufShareableCredential description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShareableCredential dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *encryptedPushProvisioningTarget;
  uint64_t status;
  __CFString *v7;
  NSString *credentialIdentifierHash;
  NSString *ownerDisplayName;
  NSString *credentialIdentifier;
  NSString *cardConfigurationIdentifier;
  NSString *sharingInstanceIdentifier;
  NSString *nonce;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  encryptedPushProvisioningTarget = self->_encryptedPushProvisioningTarget;
  if (encryptedPushProvisioningTarget)
    objc_msgSend(v3, "setObject:forKey:", encryptedPushProvisioningTarget, CFSTR("encryptedPushProvisioningTarget"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    status = self->_status;
    if (status >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2ACBE48[status];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("status"));

  }
  credentialIdentifierHash = self->_credentialIdentifierHash;
  if (credentialIdentifierHash)
    objc_msgSend(v4, "setObject:forKey:", credentialIdentifierHash, CFSTR("credentialIdentifierHash"));
  ownerDisplayName = self->_ownerDisplayName;
  if (ownerDisplayName)
    objc_msgSend(v4, "setObject:forKey:", ownerDisplayName, CFSTR("ownerDisplayName"));
  credentialIdentifier = self->_credentialIdentifier;
  if (credentialIdentifier)
    objc_msgSend(v4, "setObject:forKey:", credentialIdentifier, CFSTR("credentialIdentifier"));
  cardConfigurationIdentifier = self->_cardConfigurationIdentifier;
  if (cardConfigurationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", cardConfigurationIdentifier, CFSTR("cardConfigurationIdentifier"));
  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  if (sharingInstanceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifier"));
  nonce = self->_nonce;
  if (nonce)
    objc_msgSend(v4, "setObject:forKey:", nonce, CFSTR("nonce"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufShareableCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_encryptedPushProvisioningTarget)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_credentialIdentifierHash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_ownerDisplayName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_credentialIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_cardConfigurationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sharingInstanceIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_nonce)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_encryptedPushProvisioningTarget)
  {
    objc_msgSend(v4, "setEncryptedPushProvisioningTarget:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_status;
    *((_BYTE *)v4 + 68) |= 1u;
  }
  if (self->_credentialIdentifierHash)
  {
    objc_msgSend(v5, "setCredentialIdentifierHash:");
    v4 = v5;
  }
  if (self->_ownerDisplayName)
  {
    objc_msgSend(v5, "setOwnerDisplayName:");
    v4 = v5;
  }
  if (self->_credentialIdentifier)
  {
    objc_msgSend(v5, "setCredentialIdentifier:");
    v4 = v5;
  }
  if (self->_cardConfigurationIdentifier)
  {
    objc_msgSend(v5, "setCardConfigurationIdentifier:");
    v4 = v5;
  }
  if (self->_sharingInstanceIdentifier)
  {
    objc_msgSend(v5, "setSharingInstanceIdentifier:");
    v4 = v5;
  }
  if (self->_nonce)
  {
    objc_msgSend(v5, "setNonce:");
    v4 = v5;
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_encryptedPushProvisioningTarget, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_status;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_credentialIdentifierHash, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_ownerDisplayName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_credentialIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[NSString copyWithZone:](self->_cardConfigurationIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  v16 = -[NSString copyWithZone:](self->_sharingInstanceIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[NSString copyWithZone:](self->_nonce, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *encryptedPushProvisioningTarget;
  NSString *credentialIdentifierHash;
  NSString *ownerDisplayName;
  NSString *credentialIdentifier;
  NSString *cardConfigurationIdentifier;
  NSString *sharingInstanceIdentifier;
  NSString *nonce;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  encryptedPushProvisioningTarget = self->_encryptedPushProvisioningTarget;
  if ((unint64_t)encryptedPushProvisioningTarget | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](encryptedPushProvisioningTarget, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_status != *((_DWORD *)v4 + 16))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  credentialIdentifierHash = self->_credentialIdentifierHash;
  if ((unint64_t)credentialIdentifierHash | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](credentialIdentifierHash, "isEqual:"))
  {
    goto LABEL_21;
  }
  ownerDisplayName = self->_ownerDisplayName;
  if ((unint64_t)ownerDisplayName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](ownerDisplayName, "isEqual:"))
      goto LABEL_21;
  }
  credentialIdentifier = self->_credentialIdentifier;
  if ((unint64_t)credentialIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](credentialIdentifier, "isEqual:"))
      goto LABEL_21;
  }
  cardConfigurationIdentifier = self->_cardConfigurationIdentifier;
  if ((unint64_t)cardConfigurationIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](cardConfigurationIdentifier, "isEqual:"))
      goto LABEL_21;
  }
  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  if ((unint64_t)sharingInstanceIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](sharingInstanceIdentifier, "isEqual:"))
      goto LABEL_21;
  }
  nonce = self->_nonce;
  if ((unint64_t)nonce | *((_QWORD *)v4 + 5))
    v12 = -[NSString isEqual:](nonce, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;

  v3 = -[NSString hash](self->_encryptedPushProvisioningTarget, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_status;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_credentialIdentifierHash, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_ownerDisplayName, "hash");
  v8 = -[NSString hash](self->_credentialIdentifier, "hash");
  v9 = v8 ^ -[NSString hash](self->_cardConfigurationIdentifier, "hash");
  v10 = v7 ^ v9 ^ -[NSString hash](self->_sharingInstanceIdentifier, "hash");
  return v10 ^ -[NSString hash](self->_nonce, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[PKProtobufShareableCredential setEncryptedPushProvisioningTarget:](self, "setEncryptedPushProvisioningTarget:");
    v4 = v5;
  }
  if ((v4[17] & 1) != 0)
  {
    self->_status = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufShareableCredential setCredentialIdentifierHash:](self, "setCredentialIdentifierHash:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PKProtobufShareableCredential setOwnerDisplayName:](self, "setOwnerDisplayName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufShareableCredential setCredentialIdentifier:](self, "setCredentialIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PKProtobufShareableCredential setCardConfigurationIdentifier:](self, "setCardConfigurationIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[PKProtobufShareableCredential setSharingInstanceIdentifier:](self, "setSharingInstanceIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PKProtobufShareableCredential setNonce:](self, "setNonce:");
    v4 = v5;
  }

}

- (NSString)encryptedPushProvisioningTarget
{
  return self->_encryptedPushProvisioningTarget;
}

- (void)setEncryptedPushProvisioningTarget:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedPushProvisioningTarget, a3);
}

- (NSString)credentialIdentifierHash
{
  return self->_credentialIdentifierHash;
}

- (void)setCredentialIdentifierHash:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifierHash, a3);
}

- (NSString)ownerDisplayName
{
  return self->_ownerDisplayName;
}

- (void)setOwnerDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_ownerDisplayName, a3);
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifier, a3);
}

- (NSString)cardConfigurationIdentifier
{
  return self->_cardConfigurationIdentifier;
}

- (void)setCardConfigurationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cardConfigurationIdentifier, a3);
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, a3);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerDisplayName, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_encryptedPushProvisioningTarget, 0);
  objc_storeStrong((id *)&self->_credentialIdentifierHash, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_cardConfigurationIdentifier, 0);
}

@end

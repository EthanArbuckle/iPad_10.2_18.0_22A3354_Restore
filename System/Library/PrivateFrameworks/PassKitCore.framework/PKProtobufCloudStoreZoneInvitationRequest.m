@implementation PKProtobufCloudStoreZoneInvitationRequest

- (BOOL)hasInvitation
{
  return self->_invitation != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
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
  v8.super_class = (Class)PKProtobufCloudStoreZoneInvitationRequest;
  -[PKProtobufCloudStoreZoneInvitationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCloudStoreZoneInvitationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  PKProtobufCloudStoreZoneInvitation *invitation;
  void *v6;
  void *v7;
  NSString *errorDomain;
  NSString *errorDescription;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  invitation = self->_invitation;
  if (invitation)
  {
    -[PKProtobufCloudStoreZoneInvitation dictionaryRepresentation](invitation, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("invitation"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_errorCode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("errorCode"));

  }
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v3, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufCloudStoreZoneInvitationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_invitation)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v4 = v5;
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v4[10] = self->_version;
  v5 = v4;
  if (self->_invitation)
  {
    objc_msgSend(v4, "setInvitation:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v5, "setErrorDomain:");
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_version;
  v6 = -[PKProtobufCloudStoreZoneInvitation copyWithZone:](self->_invitation, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_errorCode;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PKProtobufCloudStoreZoneInvitation *invitation;
  NSString *errorDomain;
  NSString *errorDescription;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if (self->_version != *((_DWORD *)v4 + 10))
    goto LABEL_14;
  invitation = self->_invitation;
  if ((unint64_t)invitation | *((_QWORD *)v4 + 4))
  {
    if (!-[PKProtobufCloudStoreZoneInvitation isEqual:](invitation, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](errorDomain, "isEqual:"))
  {
    goto LABEL_14;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](errorDescription, "isEqual:");
  else
    v8 = 1;
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  unsigned int version;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  version = self->_version;
  v4 = -[PKProtobufCloudStoreZoneInvitation hash](self->_invitation, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_errorCode;
  else
    v5 = 0;
  v6 = 2654435761 * version;
  v7 = v4 ^ v5 ^ -[NSString hash](self->_errorDomain, "hash");
  return v7 ^ -[NSString hash](self->_errorDescription, "hash") ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  PKProtobufCloudStoreZoneInvitation *invitation;
  uint64_t v6;
  _DWORD *v7;

  v4 = a3;
  self->_version = v4[10];
  invitation = self->_invitation;
  v6 = *((_QWORD *)v4 + 4);
  v7 = v4;
  if (invitation)
  {
    if (!v6)
      goto LABEL_7;
    -[PKProtobufCloudStoreZoneInvitation mergeFrom:](invitation, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PKProtobufCloudStoreZoneInvitationRequest setInvitation:](self, "setInvitation:");
  }
  v4 = v7;
LABEL_7:
  if ((v4[11] & 1) != 0)
  {
    self->_errorCode = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufCloudStoreZoneInvitationRequest setErrorDomain:](self, "setErrorDomain:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufCloudStoreZoneInvitationRequest setErrorDescription:](self, "setErrorDescription:");
    v4 = v7;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (PKProtobufCloudStoreZoneInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end

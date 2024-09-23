@implementation PKProtobufSubcredentialInvitationMessage

- (BOOL)hasPhoneInvitation
{
  return self->_phoneInvitation != 0;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_status;
  else
    return 5;
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
  if (a3 < 6)
    return off_1E2ACA998[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PENDING")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPIRED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REVOKED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CANCELLED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDataString
{
  return self->_dataString != 0;
}

- (BOOL)hasWatchInvitation
{
  return self->_watchInvitation != 0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasPassThumbnailImage
{
  return self->_passThumbnailImage != 0;
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
  v8.super_class = (Class)PKProtobufSubcredentialInvitationMessage;
  -[PKProtobufSubcredentialInvitationMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufSubcredentialInvitationMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *phoneInvitation;
  uint64_t status;
  __CFString *v7;
  NSString *dataString;
  NSString *watchInvitation;
  NSString *uniqueIdentifier;
  NSData *passThumbnailImage;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  phoneInvitation = self->_phoneInvitation;
  if (phoneInvitation)
    objc_msgSend(v3, "setObject:forKey:", phoneInvitation, CFSTR("phoneInvitation"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    status = self->_status;
    if (status >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2ACA998[status];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("status"));

  }
  dataString = self->_dataString;
  if (dataString)
    objc_msgSend(v3, "setObject:forKey:", dataString, CFSTR("dataString"));
  watchInvitation = self->_watchInvitation;
  if (watchInvitation)
    objc_msgSend(v3, "setObject:forKey:", watchInvitation, CFSTR("watchInvitation"));
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  passThumbnailImage = self->_passThumbnailImage;
  if (passThumbnailImage)
    objc_msgSend(v3, "setObject:forKey:", passThumbnailImage, CFSTR("passThumbnailImage"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufSubcredentialInvitationMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_phoneInvitation)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v4 = v5;
  if (self->_dataString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_watchInvitation)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_uniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_passThumbnailImage)
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
  v4[12] = self->_version;
  v5 = v4;
  if (self->_phoneInvitation)
  {
    objc_msgSend(v4, "setPhoneInvitation:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_status;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (self->_dataString)
  {
    objc_msgSend(v5, "setDataString:");
    v4 = v5;
  }
  if (self->_watchInvitation)
  {
    objc_msgSend(v5, "setWatchInvitation:");
    v4 = v5;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v5, "setUniqueIdentifier:");
    v4 = v5;
  }
  if (self->_passThumbnailImage)
  {
    objc_msgSend(v5, "setPassThumbnailImage:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 48) = self->_version;
  v6 = -[NSString copyWithZone:](self->_phoneInvitation, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_status;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_dataString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_watchInvitation, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSData copyWithZone:](self->_passThumbnailImage, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *phoneInvitation;
  NSString *dataString;
  NSString *watchInvitation;
  NSString *uniqueIdentifier;
  NSData *passThumbnailImage;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if (self->_version != *((_DWORD *)v4 + 12))
    goto LABEL_18;
  phoneInvitation = self->_phoneInvitation;
  if ((unint64_t)phoneInvitation | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](phoneInvitation, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_status != *((_DWORD *)v4 + 8))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  dataString = self->_dataString;
  if ((unint64_t)dataString | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](dataString, "isEqual:"))
    goto LABEL_18;
  watchInvitation = self->_watchInvitation;
  if ((unint64_t)watchInvitation | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](watchInvitation, "isEqual:"))
      goto LABEL_18;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:"))
      goto LABEL_18;
  }
  passThumbnailImage = self->_passThumbnailImage;
  if ((unint64_t)passThumbnailImage | *((_QWORD *)v4 + 2))
    v10 = -[NSData isEqual:](passThumbnailImage, "isEqual:");
  else
    v10 = 1;
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  unsigned int version;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;

  version = self->_version;
  v4 = -[NSString hash](self->_phoneInvitation, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_status;
  else
    v5 = 0;
  v6 = 2654435761 * version;
  v7 = v4 ^ v5 ^ -[NSString hash](self->_dataString, "hash");
  v8 = v7 ^ -[NSString hash](self->_watchInvitation, "hash") ^ v6;
  v9 = -[NSString hash](self->_uniqueIdentifier, "hash");
  return v8 ^ v9 ^ -[NSData hash](self->_passThumbnailImage, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  self->_version = v4[12];
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufSubcredentialInvitationMessage setPhoneInvitation:](self, "setPhoneInvitation:");
    v4 = v5;
  }
  if ((v4[16] & 1) != 0)
  {
    self->_status = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PKProtobufSubcredentialInvitationMessage setDataString:](self, "setDataString:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[PKProtobufSubcredentialInvitationMessage setWatchInvitation:](self, "setWatchInvitation:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PKProtobufSubcredentialInvitationMessage setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufSubcredentialInvitationMessage setPassThumbnailImage:](self, "setPassThumbnailImage:");
    v4 = v5;
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

- (NSString)phoneInvitation
{
  return self->_phoneInvitation;
}

- (void)setPhoneInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_phoneInvitation, a3);
}

- (NSString)dataString
{
  return self->_dataString;
}

- (void)setDataString:(id)a3
{
  objc_storeStrong((id *)&self->_dataString, a3);
}

- (NSString)watchInvitation
{
  return self->_watchInvitation;
}

- (void)setWatchInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_watchInvitation, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSData)passThumbnailImage
{
  return self->_passThumbnailImage;
}

- (void)setPassThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_passThumbnailImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchInvitation, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneInvitation, 0);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_dataString, 0);
}

@end

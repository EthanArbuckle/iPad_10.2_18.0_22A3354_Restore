@implementation PKProtobufAppletSubcredentialSharingInvitation

- (BOOL)hasInvitation
{
  return self->_invitation != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasPartnerIdentifier
{
  return self->_partnerIdentifier != 0;
}

- (BOOL)hasPairedReaderIdentifier
{
  return self->_pairedReaderIdentifier != 0;
}

- (BOOL)hasRecipientName
{
  return self->_recipientName != 0;
}

- (BOOL)hasSharingSessionIdentifier
{
  return self->_sharingSessionIdentifier != 0;
}

- (void)setEntitlement:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_entitlement = a3;
}

- (void)setHasEntitlement:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntitlement
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)deviceType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_deviceType;
  else
    return 0;
}

- (void)setDeviceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deviceType = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)deviceTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("PHONE");
  if (a3 == 1)
  {
    v3 = CFSTR("WATCH");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDeviceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHONE")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH"));

  return v4;
}

- (BOOL)hasIssuer
{
  return self->_issuer != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (void)setSupportedRadioTechnologies:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportedRadioTechnologies = a3;
}

- (void)setHasSupportedRadioTechnologies:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportedRadioTechnologies
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasBrandIdentifier
{
  return self->_brandIdentifier != 0;
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
  v8.super_class = (Class)PKProtobufAppletSubcredentialSharingInvitation;
  -[PKProtobufAppletSubcredentialSharingInvitation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufAppletSubcredentialSharingInvitation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *invitation;
  NSString *identifier;
  NSString *partnerIdentifier;
  NSString *pairedReaderIdentifier;
  NSString *recipientName;
  NSData *sharingSessionIdentifier;
  char has;
  void *v12;
  int deviceType;
  __CFString *v14;
  NSString *issuer;
  NSString *deviceModel;
  void *v17;
  NSString *brandIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  invitation = self->_invitation;
  if (invitation)
    objc_msgSend(v3, "setObject:forKey:", invitation, CFSTR("invitation"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  partnerIdentifier = self->_partnerIdentifier;
  if (partnerIdentifier)
    objc_msgSend(v3, "setObject:forKey:", partnerIdentifier, CFSTR("partnerIdentifier"));
  pairedReaderIdentifier = self->_pairedReaderIdentifier;
  if (pairedReaderIdentifier)
    objc_msgSend(v3, "setObject:forKey:", pairedReaderIdentifier, CFSTR("pairedReaderIdentifier"));
  recipientName = self->_recipientName;
  if (recipientName)
    objc_msgSend(v3, "setObject:forKey:", recipientName, CFSTR("recipientName"));
  sharingSessionIdentifier = self->_sharingSessionIdentifier;
  if (sharingSessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sharingSessionIdentifier, CFSTR("sharingSessionIdentifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_entitlement);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("entitlement"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    deviceType = self->_deviceType;
    if (deviceType)
    {
      if (deviceType == 1)
      {
        v14 = CFSTR("WATCH");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deviceType);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = CFSTR("PHONE");
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("deviceType"));

  }
  issuer = self->_issuer;
  if (issuer)
    objc_msgSend(v3, "setObject:forKey:", issuer, CFSTR("issuer"));
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("deviceModel"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_supportedRadioTechnologies);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("supportedRadioTechnologies"));

  }
  brandIdentifier = self->_brandIdentifier;
  if (brandIdentifier)
    objc_msgSend(v3, "setObject:forKey:", brandIdentifier, CFSTR("brandIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufAppletSubcredentialSharingInvitationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  id v6;

  v6 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_invitation)
    PBDataWriterWriteDataField();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  v4 = v6;
  if (self->_partnerIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_pairedReaderIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_recipientName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_sharingSessionIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_issuer)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_deviceModel)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_brandIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  v4[23] = self->_version;
  v6 = v4;
  if (self->_invitation)
  {
    objc_msgSend(v4, "setInvitation:");
    v4 = v6;
  }
  if (self->_identifier)
  {
    objc_msgSend(v6, "setIdentifier:");
    v4 = v6;
  }
  if (self->_partnerIdentifier)
  {
    objc_msgSend(v6, "setPartnerIdentifier:");
    v4 = v6;
  }
  if (self->_pairedReaderIdentifier)
  {
    objc_msgSend(v6, "setPairedReaderIdentifier:");
    v4 = v6;
  }
  if (self->_recipientName)
  {
    objc_msgSend(v6, "setRecipientName:");
    v4 = v6;
  }
  if (self->_sharingSessionIdentifier)
  {
    objc_msgSend(v6, "setSharingSessionIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[7] = self->_entitlement;
    *((_BYTE *)v4 + 96) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[6] = self->_deviceType;
    *((_BYTE *)v4 + 96) |= 1u;
  }
  if (self->_issuer)
  {
    objc_msgSend(v6, "setIssuer:");
    v4 = v6;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v6, "setDeviceModel:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[22] = self->_supportedRadioTechnologies;
    *((_BYTE *)v4 + 96) |= 4u;
  }
  if (self->_brandIdentifier)
  {
    objc_msgSend(v6, "setBrandIdentifier:");
    v4 = v6;
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
  char has;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 92) = self->_version;
  v6 = -[NSData copyWithZone:](self->_invitation, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_partnerIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  v12 = -[NSString copyWithZone:](self->_pairedReaderIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSString copyWithZone:](self->_recipientName, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  v16 = -[NSData copyWithZone:](self->_sharingSessionIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v16;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_entitlement;
    *(_BYTE *)(v5 + 96) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_deviceType;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  v19 = -[NSString copyWithZone:](self->_issuer, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  v21 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_supportedRadioTechnologies;
    *(_BYTE *)(v5 + 96) |= 4u;
  }
  v23 = -[NSString copyWithZone:](self->_brandIdentifier, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v23;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *invitation;
  NSString *identifier;
  NSString *partnerIdentifier;
  NSString *pairedReaderIdentifier;
  NSString *recipientName;
  NSData *sharingSessionIdentifier;
  NSString *issuer;
  NSString *deviceModel;
  NSString *brandIdentifier;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if (self->_version != *((_DWORD *)v4 + 23))
    goto LABEL_36;
  invitation = self->_invitation;
  if ((unint64_t)invitation | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](invitation, "isEqual:"))
      goto LABEL_36;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_36;
  }
  partnerIdentifier = self->_partnerIdentifier;
  if ((unint64_t)partnerIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](partnerIdentifier, "isEqual:"))
      goto LABEL_36;
  }
  pairedReaderIdentifier = self->_pairedReaderIdentifier;
  if ((unint64_t)pairedReaderIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](pairedReaderIdentifier, "isEqual:"))
      goto LABEL_36;
  }
  recipientName = self->_recipientName;
  if ((unint64_t)recipientName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](recipientName, "isEqual:"))
      goto LABEL_36;
  }
  sharingSessionIdentifier = self->_sharingSessionIdentifier;
  if ((unint64_t)sharingSessionIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](sharingSessionIdentifier, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_entitlement != *((_DWORD *)v4 + 7))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
LABEL_36:
    v14 = 0;
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_deviceType != *((_DWORD *)v4 + 6))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_36;
  }
  issuer = self->_issuer;
  if ((unint64_t)issuer | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](issuer, "isEqual:"))
    goto LABEL_36;
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_supportedRadioTechnologies != *((_DWORD *)v4 + 22))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    goto LABEL_36;
  }
  brandIdentifier = self->_brandIdentifier;
  if ((unint64_t)brandIdentifier | *((_QWORD *)v4 + 1))
    v14 = -[NSString isEqual:](brandIdentifier, "isEqual:");
  else
    v14 = 1;
LABEL_37:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v13;
  uint64_t v14;
  unsigned int version;

  version = self->_version;
  v14 = -[NSData hash](self->_invitation, "hash");
  v13 = -[NSString hash](self->_identifier, "hash");
  v3 = -[NSString hash](self->_partnerIdentifier, "hash");
  v4 = -[NSString hash](self->_pairedReaderIdentifier, "hash");
  v5 = -[NSString hash](self->_recipientName, "hash");
  v6 = -[NSData hash](self->_sharingSessionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_entitlement;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_deviceType;
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:
  v9 = -[NSString hash](self->_issuer, "hash");
  v10 = -[NSString hash](self->_deviceModel, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_supportedRadioTechnologies;
  else
    v11 = 0;
  return v14 ^ v13 ^ v3 ^ v4 ^ (2654435761 * version) ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_brandIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  char v5;
  _DWORD *v6;

  v4 = a3;
  self->_version = v4[23];
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setInvitation:](self, "setInvitation:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setIdentifier:](self, "setIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setPartnerIdentifier:](self, "setPartnerIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setPairedReaderIdentifier:](self, "setPairedReaderIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setRecipientName:](self, "setRecipientName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setSharingSessionIdentifier:](self, "setSharingSessionIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 96);
  if ((v5 & 2) != 0)
  {
    self->_entitlement = v4[7];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 96);
  }
  if ((v5 & 1) != 0)
  {
    self->_deviceType = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setIssuer:](self, "setIssuer:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setDeviceModel:](self, "setDeviceModel:");
    v4 = v6;
  }
  if ((v4[24] & 4) != 0)
  {
    self->_supportedRadioTechnologies = v4[22];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setBrandIdentifier:](self, "setBrandIdentifier:");
    v4 = v6;
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

- (NSData)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_partnerIdentifier, a3);
}

- (NSString)pairedReaderIdentifier
{
  return self->_pairedReaderIdentifier;
}

- (void)setPairedReaderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, a3);
}

- (NSString)recipientName
{
  return self->_recipientName;
}

- (void)setRecipientName:(id)a3
{
  objc_storeStrong((id *)&self->_recipientName, a3);
}

- (NSData)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (void)setSharingSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, a3);
}

- (unsigned)entitlement
{
  return self->_entitlement;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
  objc_storeStrong((id *)&self->_issuer, a3);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (unsigned)supportedRadioTechnologies
{
  return self->_supportedRadioTechnologies;
}

- (NSString)brandIdentifier
{
  return self->_brandIdentifier;
}

- (void)setBrandIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_brandIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_recipientName, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_brandIdentifier, 0);
}

@end

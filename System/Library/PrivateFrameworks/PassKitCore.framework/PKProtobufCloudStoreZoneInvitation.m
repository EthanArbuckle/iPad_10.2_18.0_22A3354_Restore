@implementation PKProtobufCloudStoreZoneInvitation

- (BOOL)hasShareURL
{
  return self->_shareURL != 0;
}

- (BOOL)hasShareInvitationToken
{
  return self->_shareInvitationToken != 0;
}

- (BOOL)hasContainerIdentifier
{
  return self->_containerIdentifier != 0;
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (void)setDateCreated:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateCreated = a3;
}

- (void)setHasDateCreated:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateCreated
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)PKProtobufCloudStoreZoneInvitation;
  -[PKProtobufCloudStoreZoneInvitation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCloudStoreZoneInvitation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *shareURL;
  NSData *shareInvitationToken;
  NSString *containerIdentifier;
  NSString *zoneName;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  shareURL = self->_shareURL;
  if (shareURL)
    objc_msgSend(v3, "setObject:forKey:", shareURL, CFSTR("shareURL"));
  shareInvitationToken = self->_shareInvitationToken;
  if (shareInvitationToken)
    objc_msgSend(v3, "setObject:forKey:", shareInvitationToken, CFSTR("shareInvitationToken"));
  containerIdentifier = self->_containerIdentifier;
  if (containerIdentifier)
    objc_msgSend(v3, "setObject:forKey:", containerIdentifier, CFSTR("containerIdentifier"));
  zoneName = self->_zoneName;
  if (zoneName)
    objc_msgSend(v3, "setObject:forKey:", zoneName, CFSTR("zoneName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateCreated);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dateCreated"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufCloudStoreZoneInvitationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_shareURL)
    PBDataWriterWriteStringField();
  if (self->_shareInvitationToken)
    PBDataWriterWriteDataField();
  v4 = v5;
  if (self->_containerIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_zoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
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
  if (self->_shareURL)
  {
    objc_msgSend(v4, "setShareURL:");
    v4 = v5;
  }
  if (self->_shareInvitationToken)
  {
    objc_msgSend(v5, "setShareInvitationToken:");
    v4 = v5;
  }
  if (self->_containerIdentifier)
  {
    objc_msgSend(v5, "setContainerIdentifier:");
    v4 = v5;
  }
  if (self->_zoneName)
  {
    objc_msgSend(v5, "setZoneName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_dateCreated;
    *((_BYTE *)v4 + 56) |= 1u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_version;
  v6 = -[NSString copyWithZone:](self->_shareURL, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSData copyWithZone:](self->_shareInvitationToken, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_containerIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_dateCreated;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *shareURL;
  NSData *shareInvitationToken;
  NSString *containerIdentifier;
  NSString *zoneName;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if (self->_version != *((_DWORD *)v4 + 10))
    goto LABEL_15;
  shareURL = self->_shareURL;
  if ((unint64_t)shareURL | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](shareURL, "isEqual:"))
      goto LABEL_15;
  }
  shareInvitationToken = self->_shareInvitationToken;
  if ((unint64_t)shareInvitationToken | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](shareInvitationToken, "isEqual:"))
      goto LABEL_15;
  }
  containerIdentifier = self->_containerIdentifier;
  if ((unint64_t)containerIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](containerIdentifier, "isEqual:"))
      goto LABEL_15;
  }
  zoneName = self->_zoneName;
  if ((unint64_t)zoneName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](zoneName, "isEqual:"))
      goto LABEL_15;
  }
  v9 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) != 0 && self->_dateCreated == *((double *)v4 + 1))
    {
      v9 = 1;
      goto LABEL_16;
    }
LABEL_15:
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unsigned int version;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  double dateCreated;
  double v10;
  long double v11;
  double v12;

  version = self->_version;
  v4 = -[NSString hash](self->_shareURL, "hash");
  v5 = -[NSData hash](self->_shareInvitationToken, "hash");
  v6 = -[NSString hash](self->_containerIdentifier, "hash");
  v7 = -[NSString hash](self->_zoneName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    dateCreated = self->_dateCreated;
    v10 = -dateCreated;
    if (dateCreated >= 0.0)
      v10 = self->_dateCreated;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  return v4 ^ v5 ^ v6 ^ v7 ^ (2654435761 * version) ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_version = *((_DWORD *)v4 + 10);
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[PKProtobufCloudStoreZoneInvitation setShareURL:](self, "setShareURL:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufCloudStoreZoneInvitation setShareInvitationToken:](self, "setShareInvitationToken:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufCloudStoreZoneInvitation setContainerIdentifier:](self, "setContainerIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PKProtobufCloudStoreZoneInvitation setZoneName:](self, "setZoneName:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_dateCreated = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
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

- (NSString)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareURL, a3);
}

- (NSData)shareInvitationToken
{
  return self->_shareInvitationToken;
}

- (void)setShareInvitationToken:(id)a3
{
  objc_storeStrong((id *)&self->_shareInvitationToken, a3);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_zoneName, a3);
}

- (double)dateCreated
{
  return self->_dateCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_shareInvitationToken, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end

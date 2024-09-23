@implementation APPBInstallAttribution

- (BOOL)hasAdNetworkId
{
  return self->_adNetworkId != 0;
}

- (void)setCampaignId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_campaignId = a3;
}

- (void)setHasCampaignId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCampaignId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasAttributionSignature
{
  return self->_attributionSignature != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setAdamId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdamId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSourceAppAdamId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sourceAppAdamId = a3;
}

- (void)setHasSourceAppAdamId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSourceAppAdamId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBInstallAttribution;
  v3 = -[APPBInstallAttribution description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBInstallAttribution dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *adNetworkId;
  void *v6;
  NSString *version;
  NSString *attributionSignature;
  NSString *uuid;
  char has;
  void *v11;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  adNetworkId = self->_adNetworkId;
  if (adNetworkId)
    objc_msgSend(v3, "setObject:forKey:", adNetworkId, CFSTR("adNetworkId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_campaignId));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("campaignId"));

  }
  version = self->_version;
  if (version)
    objc_msgSend(v4, "setObject:forKey:", version, CFSTR("version"));
  attributionSignature = self->_attributionSignature;
  if (attributionSignature)
    objc_msgSend(v4, "setObject:forKey:", attributionSignature, CFSTR("attributionSignature"));
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v4, "setObject:forKey:", uuid, CFSTR("uuid"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_13;
LABEL_17:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_sourceAppAdamId));
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("sourceAppAdamId"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v4;
    goto LABEL_14;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_adamId));
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("adamId"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 8) != 0)
  {
LABEL_14:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timestamp"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBInstallAttributionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *adNetworkId;
  NSString *version;
  NSString *attributionSignature;
  NSString *uuid;
  char has;
  id v10;

  v4 = a3;
  adNetworkId = self->_adNetworkId;
  v10 = v4;
  if (adNetworkId)
  {
    PBDataWriterWriteStringField(v4, adNetworkId, 1);
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v10, self->_campaignId, 2);
    v4 = v10;
  }
  version = self->_version;
  if (version)
  {
    PBDataWriterWriteStringField(v10, version, 3);
    v4 = v10;
  }
  attributionSignature = self->_attributionSignature;
  if (attributionSignature)
  {
    PBDataWriterWriteStringField(v10, attributionSignature, 4);
    v4 = v10;
  }
  uuid = self->_uuid;
  if (uuid)
  {
    PBDataWriterWriteStringField(v10, uuid, 5);
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_13;
LABEL_17:
    PBDataWriterWriteUint64Field(v10, self->_sourceAppAdamId, 7);
    v4 = v10;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  PBDataWriterWriteUint64Field(v10, self->_adamId, 6);
  v4 = v10;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 8) != 0)
  {
LABEL_14:
    PBDataWriterWriteUint64Field(v10, self->_timestamp, 9);
    v4 = v10;
  }
LABEL_15:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_adNetworkId)
  {
    objc_msgSend(v4, "setAdNetworkId:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_campaignId;
    *((_BYTE *)v4 + 72) |= 2u;
  }
  if (self->_version)
  {
    objc_msgSend(v6, "setVersion:");
    v4 = v6;
  }
  if (self->_attributionSignature)
  {
    objc_msgSend(v6, "setAttributionSignature:");
    v4 = v6;
  }
  if (self->_uuid)
  {
    objc_msgSend(v6, "setUuid:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_13;
LABEL_17:
    *((_QWORD *)v4 + 3) = self->_sourceAppAdamId;
    *((_BYTE *)v4 + 72) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  *((_QWORD *)v4 + 1) = self->_adamId;
  *((_BYTE *)v4 + 72) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 8) != 0)
  {
LABEL_14:
    *((_QWORD *)v4 + 4) = self->_timestamp;
    *((_BYTE *)v4 + 72) |= 8u;
  }
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_adNetworkId, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[2] = self->_campaignId;
    *((_BYTE *)v5 + 72) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v9 = (void *)v5[8];
  v5[8] = v8;

  v10 = -[NSString copyWithZone:](self->_attributionSignature, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  v12 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    v5[3] = self->_sourceAppAdamId;
    *((_BYTE *)v5 + 72) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v5;
    goto LABEL_6;
  }
  v5[1] = self->_adamId;
  *((_BYTE *)v5 + 72) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    v5[4] = self->_timestamp;
    *((_BYTE *)v5 + 72) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *adNetworkId;
  NSString *version;
  NSString *attributionSignature;
  NSString *uuid;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_29;
  adNetworkId = self->_adNetworkId;
  if ((unint64_t)adNetworkId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](adNetworkId, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_campaignId != *((_QWORD *)v4 + 2))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
LABEL_29:
    v9 = 0;
    goto LABEL_30;
  }
  version = self->_version;
  if ((unint64_t)version | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](version, "isEqual:"))
    goto LABEL_29;
  attributionSignature = self->_attributionSignature;
  if ((unint64_t)attributionSignature | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](attributionSignature, "isEqual:"))
      goto LABEL_29;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_adamId != *((_QWORD *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_sourceAppAdamId != *((_QWORD *)v4 + 3))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_29;
  }
  v9 = (*((_BYTE *)v4 + 72) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_timestamp != *((_QWORD *)v4 + 4))
      goto LABEL_29;
    v9 = 1;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_adNetworkId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761u * self->_campaignId;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_version, "hash");
  v6 = -[NSString hash](self->_attributionSignature, "hash");
  v7 = -[NSString hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_10:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v8 = 2654435761u * self->_adamId;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v9 = 2654435761u * self->_sourceAppAdamId;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_7:
  v10 = 2654435761u * self->_timestamp;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  char v5;
  unint64_t *v6;

  v4 = (unint64_t *)a3;
  v6 = v4;
  if (v4[5])
  {
    -[APPBInstallAttribution setAdNetworkId:](self, "setAdNetworkId:");
    v4 = v6;
  }
  if ((v4[9] & 2) != 0)
  {
    self->_campaignId = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (v4[8])
  {
    -[APPBInstallAttribution setVersion:](self, "setVersion:");
    v4 = v6;
  }
  if (v4[6])
  {
    -[APPBInstallAttribution setAttributionSignature:](self, "setAttributionSignature:");
    v4 = v6;
  }
  if (v4[7])
  {
    -[APPBInstallAttribution setUuid:](self, "setUuid:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 1) == 0)
  {
    if ((v4[9] & 4) == 0)
      goto LABEL_13;
LABEL_17:
    self->_sourceAppAdamId = v4[3];
    *(_BYTE *)&self->_has |= 4u;
    if ((v4[9] & 8) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  self->_adamId = v4[1];
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((v5 & 8) != 0)
  {
LABEL_14:
    self->_timestamp = v4[4];
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_15:

}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (void)setAdNetworkId:(id)a3
{
  objc_storeStrong((id *)&self->_adNetworkId, a3);
}

- (unint64_t)campaignId
{
  return self->_campaignId;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (void)setAttributionSignature:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSignature, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unint64_t)adamId
{
  return self->_adamId;
}

- (unint64_t)sourceAppAdamId
{
  return self->_sourceAppAdamId;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
}

@end

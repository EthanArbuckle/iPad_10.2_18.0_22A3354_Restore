@implementation TRANSITPbTransitTile

- (void)dealloc
{
  objc_super v3;

  -[TRANSITPbTransitTile setDEPRECATEDFingerprints:](self, "setDEPRECATEDFingerprints:", 0);
  -[TRANSITPbTransitTile setFingerprints:](self, "setFingerprints:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbTransitTile;
  -[TRANSITPbTransitTile dealloc](&v3, "dealloc");
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTileX:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_tileX = a3;
}

- (void)setHasTileX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTileX
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTileY:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_tileY = a3;
}

- (void)setHasTileY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTileY
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (unint64_t)securityKey
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_securityKey;
  else
    return -1;
}

- (void)setSecurityKey:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_securityKey = a3;
}

- (void)setHasSecurityKey:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecurityKey
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setGenerationTimeSecs:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_generationTimeSecs = a3;
}

- (void)setHasGenerationTimeSecs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGenerationTimeSecs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setExpirationAgeSecs:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_expirationAgeSecs = a3;
}

- (void)setHasExpirationAgeSecs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasExpirationAgeSecs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasDEPRECATEDFingerprints
{
  return self->_dEPRECATEDFingerprints != 0;
}

- (BOOL)hasFingerprints
{
  return self->_fingerprints != 0;
}

- (unint64_t)marketId
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_marketId;
  else
    return 0;
}

- (void)setMarketId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_marketId = a3;
}

- (void)setHasMarketId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMarketId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbTransitTile;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[TRANSITPbTransitTile description](&v3, "description"), -[TRANSITPbTransitTile dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;
  TRANSITPbLocationFingerprintsV1 *dEPRECATEDFingerprints;
  TRANSITPbLocationFingerprints *fingerprints;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_version), CFSTR("version"));
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tileX), CFSTR("tileX"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tileY), CFSTR("tileY"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_securityKey), CFSTR("securityKey"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_generationTimeSecs), CFSTR("generationTimeSecs"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_expirationAgeSecs), CFSTR("expirationAgeSecs"));
LABEL_8:
  dEPRECATEDFingerprints = self->_dEPRECATEDFingerprints;
  if (dEPRECATEDFingerprints)
    objc_msgSend(v3, "setObject:forKey:", -[TRANSITPbLocationFingerprintsV1 dictionaryRepresentation](dEPRECATEDFingerprints, "dictionaryRepresentation"), CFSTR("DEPRECATED_fingerprints"));
  fingerprints = self->_fingerprints;
  if (fingerprints)
    objc_msgSend(v3, "setObject:forKey:", -[TRANSITPbLocationFingerprints dictionaryRepresentation](fingerprints, "dictionaryRepresentation"), CFSTR("fingerprints"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_marketId), CFSTR("marketId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10054A1E8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  TRANSITPbLocationFingerprintsV1 *dEPRECATEDFingerprints;
  TRANSITPbLocationFingerprints *fingerprints;

  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_version, 1);
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_tileX, 2);
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field(a3, self->_tileY, 3);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field(a3, self->_securityKey, 4);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_18:
  PBDataWriterWriteDoubleField(a3, 5, self->_generationTimeSecs);
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field(a3, self->_expirationAgeSecs, 6);
LABEL_8:
  dEPRECATEDFingerprints = self->_dEPRECATEDFingerprints;
  if (dEPRECATEDFingerprints)
    PBDataWriterWriteSubmessage(a3, dEPRECATEDFingerprints, 7);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field(a3, self->_marketId, 8);
  fingerprints = self->_fingerprints;
  if (fingerprints)
    PBDataWriterWriteSubmessage(a3, fingerprints, 9);
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_version;
    *((_BYTE *)a3 + 68) |= 0x40u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 14) = self->_tileX;
  *((_BYTE *)a3 + 68) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 15) = self->_tileY;
  *((_BYTE *)a3 + 68) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 3) = self->_securityKey;
  *((_BYTE *)a3 + 68) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_18:
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_generationTimeSecs;
  *((_BYTE *)a3 + 68) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)a3 + 10) = self->_expirationAgeSecs;
    *((_BYTE *)a3 + 68) |= 8u;
  }
LABEL_8:
  if (self->_dEPRECATEDFingerprints)
    objc_msgSend(a3, "setDEPRECATEDFingerprints:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_marketId;
    *((_BYTE *)a3 + 68) |= 2u;
  }
  if (self->_fingerprints)
    objc_msgSend(a3, "setFingerprints:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id *v6;
  char has;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_version;
    *((_BYTE *)v5 + 68) |= 0x40u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 14) = self->_tileX;
  *((_BYTE *)v5 + 68) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v5 + 15) = self->_tileY;
  *((_BYTE *)v5 + 68) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v5[3] = (id)self->_securityKey;
  *((_BYTE *)v5 + 68) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  v5[1] = *(id *)&self->_generationTimeSecs;
  *((_BYTE *)v5 + 68) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 10) = self->_expirationAgeSecs;
    *((_BYTE *)v5 + 68) |= 8u;
  }
LABEL_8:

  v6[4] = -[TRANSITPbLocationFingerprintsV1 copyWithZone:](self->_dEPRECATEDFingerprints, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6[2] = (id)self->_marketId;
    *((_BYTE *)v6 + 68) |= 2u;
  }

  v6[6] = -[TRANSITPbLocationFingerprints copyWithZone:](self->_fingerprints, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  char has;
  TRANSITPbLocationFingerprintsV1 *dEPRECATEDFingerprints;
  TRANSITPbLocationFingerprints *fingerprints;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 0x40) == 0 || self->_version != *((_DWORD *)a3 + 16))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 68) & 0x40) != 0)
    {
LABEL_42:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 0x10) == 0 || self->_tileX != *((_DWORD *)a3 + 14))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 68) & 0x10) != 0)
    {
      goto LABEL_42;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 0x20) == 0 || self->_tileY != *((_DWORD *)a3 + 15))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 68) & 0x20) != 0)
    {
      goto LABEL_42;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 4) == 0 || self->_securityKey != *((_QWORD *)a3 + 3))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 68) & 4) != 0)
    {
      goto LABEL_42;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 1) == 0 || self->_generationTimeSecs != *((double *)a3 + 1))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 68) & 1) != 0)
    {
      goto LABEL_42;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 8) == 0 || self->_expirationAgeSecs != *((_DWORD *)a3 + 10))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 68) & 8) != 0)
    {
      goto LABEL_42;
    }
    dEPRECATEDFingerprints = self->_dEPRECATEDFingerprints;
    if ((unint64_t)dEPRECATEDFingerprints | *((_QWORD *)a3 + 4))
    {
      v5 = -[TRANSITPbLocationFingerprintsV1 isEqual:](dEPRECATEDFingerprints, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 2) == 0 || self->_marketId != *((_QWORD *)a3 + 2))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 68) & 2) != 0)
    {
      goto LABEL_42;
    }
    fingerprints = self->_fingerprints;
    if ((unint64_t)fingerprints | *((_QWORD *)a3 + 6))
      LOBYTE(v5) = -[TRANSITPbLocationFingerprints isEqual:](fingerprints, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double generationTimeSecs;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v4 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_tileX;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_tileY;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_13:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_14:
    v12 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_13;
LABEL_5:
  v7 = 2654435761u * self->_securityKey;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_14;
LABEL_6:
  generationTimeSecs = self->_generationTimeSecs;
  v9 = -generationTimeSecs;
  if (generationTimeSecs >= 0.0)
    v9 = self->_generationTimeSecs;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_17:
  if ((has & 8) != 0)
    v13 = 2654435761 * self->_expirationAgeSecs;
  else
    v13 = 0;
  v14 = -[TRANSITPbLocationFingerprintsV1 hash](self->_dEPRECATEDFingerprints, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v15 = 2654435761u * self->_marketId;
  else
    v15 = 0;
  return v5 ^ v4 ^ v6 ^ v7 ^ v12 ^ v13 ^ v15 ^ v14 ^ -[TRANSITPbLocationFingerprints hash](self->_fingerprints, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  TRANSITPbLocationFingerprintsV1 *dEPRECATEDFingerprints;
  uint64_t v7;
  TRANSITPbLocationFingerprints *fingerprints;
  uint64_t v9;

  v5 = *((_BYTE *)a3 + 68);
  if ((v5 & 0x40) != 0)
  {
    self->_version = *((_DWORD *)a3 + 16);
    *(_BYTE *)&self->_has |= 0x40u;
    v5 = *((_BYTE *)a3 + 68);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 68) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_tileX = *((_DWORD *)a3 + 14);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 68);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_tileY = *((_DWORD *)a3 + 15);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 68);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_securityKey = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 68);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  self->_generationTimeSecs = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 68) & 8) != 0)
  {
LABEL_7:
    self->_expirationAgeSecs = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_8:
  dEPRECATEDFingerprints = self->_dEPRECATEDFingerprints;
  v7 = *((_QWORD *)a3 + 4);
  if (dEPRECATEDFingerprints)
  {
    if (v7)
      -[TRANSITPbLocationFingerprintsV1 mergeFrom:](dEPRECATEDFingerprints, "mergeFrom:");
  }
  else if (v7)
  {
    -[TRANSITPbTransitTile setDEPRECATEDFingerprints:](self, "setDEPRECATEDFingerprints:");
  }
  if ((*((_BYTE *)a3 + 68) & 2) != 0)
  {
    self->_marketId = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  fingerprints = self->_fingerprints;
  v9 = *((_QWORD *)a3 + 6);
  if (fingerprints)
  {
    if (v9)
      -[TRANSITPbLocationFingerprints mergeFrom:](fingerprints, "mergeFrom:");
  }
  else if (v9)
  {
    -[TRANSITPbTransitTile setFingerprints:](self, "setFingerprints:");
  }
}

- (int)version
{
  return self->_version;
}

- (int)tileX
{
  return self->_tileX;
}

- (int)tileY
{
  return self->_tileY;
}

- (double)generationTimeSecs
{
  return self->_generationTimeSecs;
}

- (int)expirationAgeSecs
{
  return self->_expirationAgeSecs;
}

- (TRANSITPbLocationFingerprintsV1)dEPRECATEDFingerprints
{
  return self->_dEPRECATEDFingerprints;
}

- (void)setDEPRECATEDFingerprints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (TRANSITPbLocationFingerprints)fingerprints
{
  return self->_fingerprints;
}

- (void)setFingerprints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end

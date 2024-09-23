@implementation CLCompanionSyncInterestZone

- (void)dealloc
{
  objc_super v3;

  -[CLCompanionSyncInterestZone setZoneIdentifier:](self, "setZoneIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLCompanionSyncInterestZone;
  -[CLCompanionSyncInterestZone dealloc](&v3, "dealloc");
}

- (unsigned)authMask
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_authMask;
  else
    return 0;
}

- (void)setAuthMask:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_authMask = a3;
}

- (void)setHasAuthMask:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAuthMask
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCorrectiveCompensationMask:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_correctiveCompensationMask = a3;
}

- (void)setHasCorrectiveCompensationMask:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCorrectiveCompensationMask
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setZoneType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_zoneType = a3;
}

- (void)setHasZoneType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasZoneType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLatitude
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRadius:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRadius
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPhenolicLocation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_phenolicLocation = a3;
}

- (void)setHasPhenolicLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPhenolicLocation
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setServiceMaskOperator:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_serviceMaskOperator = a3;
}

- (void)setHasServiceMaskOperator:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasServiceMaskOperator
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setProvenance:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_provenance = a3;
}

- (void)setHasProvenance:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasProvenance
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)clearClient
{
  return (*(_WORD *)&self->_has & 0x200) != 0 && self->_clearClient;
}

- (void)setClearClient:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_clearClient = a3;
}

- (void)setHasClearClient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasClearClient
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCompanionSyncInterestZone;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CLCompanionSyncInterestZone description](&v3, "description"), -[CLCompanionSyncInterestZone dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *zoneIdentifier;
  __int16 has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
    objc_msgSend(v3, "setObject:forKey:", zoneIdentifier, CFSTR("zoneIdentifier"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_authMask), CFSTR("authMask"));
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 0x100) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_correctiveCompensationMask), CFSTR("correctiveCompensationMask"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_zoneType), CFSTR("zoneType"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude), CFSTR("latitude"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude), CFSTR("longitude"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_radius), CFSTR("radius"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_phenolicLocation), CFSTR("phenolicLocation"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
LABEL_23:
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_provenance), CFSTR("provenance"));
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return v4;
    goto LABEL_13;
  }
LABEL_22:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_serviceMaskOperator), CFSTR("serviceMaskOperator"));
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_23;
LABEL_12:
  if ((has & 0x200) != 0)
LABEL_13:
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_clearClient), CFSTR("clearClient"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10068A390((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *zoneIdentifier;
  __int16 has;

  zoneIdentifier = self->_zoneIdentifier;
  if (!zoneIdentifier)
    sub_1019043C0();
  PBDataWriterWriteStringField(a3, zoneIdentifier, 1);
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_authMask, 2);
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_4:
      if ((has & 0x100) == 0)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field(a3, self->_correctiveCompensationMask, 3);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field(a3, self->_zoneType, 4);
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField(a3, 5, self->_latitude);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField(a3, 6, self->_longitude);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField(a3, 7, self->_radius);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field(a3, self->_phenolicLocation, 8);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(a3, self->_serviceMaskOperator, 9);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      return;
LABEL_22:
    PBDataWriterWriteBOOLField(a3, self->_clearClient, 11);
    return;
  }
LABEL_21:
  PBDataWriterWriteUint32Field(a3, self->_provenance, 10);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    goto LABEL_22;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  objc_msgSend(a3, "setZoneIdentifier:", self->_zoneIdentifier);
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_authMask;
    *((_WORD *)a3 + 36) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 9) = self->_correctiveCompensationMask;
  *((_WORD *)a3 + 36) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 16) = self->_zoneType;
  *((_WORD *)a3 + 36) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_latitude;
  *((_WORD *)a3 + 36) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_longitude;
  *((_WORD *)a3 + 36) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_radius;
  *((_WORD *)a3 + 36) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 12) = self->_phenolicLocation;
  *((_WORD *)a3 + 36) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 11) = self->_serviceMaskOperator;
  *((_WORD *)a3 + 36) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      return;
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)a3 + 10) = self->_provenance;
  *((_WORD *)a3 + 36) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    return;
LABEL_11:
  *((_BYTE *)a3 + 68) = self->_clearClient;
  *((_WORD *)a3 + 36) |= 0x200u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  __int16 has;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");

  v5[7] = -[NSString copyWithZone:](self->_zoneIdentifier, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_authMask;
    *((_WORD *)v5 + 36) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 9) = self->_correctiveCompensationMask;
  *((_WORD *)v5 + 36) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 16) = self->_zoneType;
  *((_WORD *)v5 + 36) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v5[1] = *(id *)&self->_latitude;
  *((_WORD *)v5 + 36) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v5[2] = *(id *)&self->_longitude;
  *((_WORD *)v5 + 36) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v5[3] = *(id *)&self->_radius;
  *((_WORD *)v5 + 36) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 12) = self->_phenolicLocation;
  *((_WORD *)v5 + 36) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
LABEL_21:
    *((_DWORD *)v5 + 10) = self->_provenance;
    *((_WORD *)v5 + 36) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return v5;
    goto LABEL_11;
  }
LABEL_20:
  *((_DWORD *)v5 + 11) = self->_serviceMaskOperator;
  *((_WORD *)v5 + 36) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x200) != 0)
  {
LABEL_11:
    *((_BYTE *)v5 + 68) = self->_clearClient;
    *((_WORD *)v5 + 36) |= 0x200u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *zoneIdentifier;
  __int16 has;
  __int16 v8;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    zoneIdentifier = self->_zoneIdentifier;
    if (!((unint64_t)zoneIdentifier | *((_QWORD *)a3 + 7))
      || (v5 = -[NSString isEqual:](zoneIdentifier, "isEqual:")) != 0)
    {
      has = (__int16)self->_has;
      v8 = *((_WORD *)a3 + 36);
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_authMask != *((_DWORD *)a3 + 8))
          goto LABEL_51;
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_51;
      }
      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_correctiveCompensationMask != *((_DWORD *)a3 + 9))
          goto LABEL_51;
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_51;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 36) & 0x100) == 0 || self->_zoneType != *((_DWORD *)a3 + 16))
          goto LABEL_51;
      }
      else if ((*((_WORD *)a3 + 36) & 0x100) != 0)
      {
        goto LABEL_51;
      }
      if ((has & 1) != 0)
      {
        if ((v8 & 1) == 0 || self->_latitude != *((double *)a3 + 1))
          goto LABEL_51;
      }
      else if ((v8 & 1) != 0)
      {
        goto LABEL_51;
      }
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_longitude != *((double *)a3 + 2))
          goto LABEL_51;
      }
      else if ((v8 & 2) != 0)
      {
        goto LABEL_51;
      }
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_radius != *((double *)a3 + 3))
          goto LABEL_51;
      }
      else if ((v8 & 4) != 0)
      {
        goto LABEL_51;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_phenolicLocation != *((_DWORD *)a3 + 12))
          goto LABEL_51;
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_51;
      }
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_serviceMaskOperator != *((_DWORD *)a3 + 11))
          goto LABEL_51;
      }
      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_51;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_provenance != *((_DWORD *)a3 + 10))
          goto LABEL_51;
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_51;
      }
      LOBYTE(v5) = (v8 & 0x200) == 0;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 36) & 0x200) == 0)
        {
LABEL_51:
          LOBYTE(v5) = 0;
          return v5;
        }
        if (self->_clearClient)
        {
          if (!*((_BYTE *)a3 + 68))
            goto LABEL_51;
        }
        else if (*((_BYTE *)a3 + 68))
        {
          goto LABEL_51;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 has;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double latitude;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  double longitude;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  double radius;
  double v20;
  long double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = -[NSString hash](self->_zoneIdentifier, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v5 = 2654435761 * self->_authMask;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_correctiveCompensationMask;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
LABEL_11:
      v7 = 0;
      if ((has & 1) != 0)
        goto LABEL_5;
LABEL_12:
      v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_11;
LABEL_4:
  v7 = 2654435761 * self->_zoneType;
  if ((has & 1) == 0)
    goto LABEL_12;
LABEL_5:
  latitude = self->_latitude;
  v9 = -latitude;
  if (latitude >= 0.0)
    v9 = self->_latitude;
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
LABEL_15:
  if ((has & 2) != 0)
  {
    longitude = self->_longitude;
    v15 = -longitude;
    if (longitude >= 0.0)
      v15 = self->_longitude;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((has & 4) != 0)
  {
    radius = self->_radius;
    v20 = -radius;
    if (radius >= 0.0)
      v20 = self->_radius;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  if ((has & 0x80) != 0)
  {
    v23 = 2654435761 * self->_phenolicLocation;
    if ((has & 0x40) != 0)
    {
LABEL_33:
      v24 = 2654435761 * self->_serviceMaskOperator;
      if ((has & 0x20) != 0)
        goto LABEL_34;
LABEL_38:
      v25 = 0;
      if ((has & 0x200) != 0)
        goto LABEL_35;
LABEL_39:
      v26 = 0;
      return v5 ^ v3 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v23 ^ v24 ^ v25 ^ v26;
    }
  }
  else
  {
    v23 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_33;
  }
  v24 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_38;
LABEL_34:
  v25 = 2654435761 * self->_provenance;
  if ((has & 0x200) == 0)
    goto LABEL_39;
LABEL_35:
  v26 = 2654435761 * self->_clearClient;
  return v5 ^ v3 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  if (*((_QWORD *)a3 + 7))
    -[CLCompanionSyncInterestZone setZoneIdentifier:](self, "setZoneIdentifier:");
  v5 = *((_WORD *)a3 + 36);
  if ((v5 & 8) != 0)
  {
    self->_authMask = *((_DWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 8u;
    v5 = *((_WORD *)a3 + 36);
    if ((v5 & 0x10) == 0)
    {
LABEL_5:
      if ((v5 & 0x100) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_5;
  }
  self->_correctiveCompensationMask = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_zoneType = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 36);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  self->_latitude = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  self->_longitude = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  self->_radius = *((double *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  self->_phenolicLocation = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  self->_serviceMaskOperator = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      return;
    goto LABEL_13;
  }
LABEL_23:
  self->_provenance = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 36) & 0x200) == 0)
    return;
LABEL_13:
  self->_clearClient = *((_BYTE *)a3 + 68);
  *(_WORD *)&self->_has |= 0x200u;
}

- (NSString)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (unsigned)correctiveCompensationMask
{
  return self->_correctiveCompensationMask;
}

- (unsigned)zoneType
{
  return self->_zoneType;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)radius
{
  return self->_radius;
}

- (unsigned)phenolicLocation
{
  return self->_phenolicLocation;
}

- (unsigned)serviceMaskOperator
{
  return self->_serviceMaskOperator;
}

- (unsigned)provenance
{
  return self->_provenance;
}

@end

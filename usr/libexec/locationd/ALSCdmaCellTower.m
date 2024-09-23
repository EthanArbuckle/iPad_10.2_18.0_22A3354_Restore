@implementation ALSCdmaCellTower

- (void)dealloc
{
  objc_super v3;

  -[ALSCdmaCellTower setLocation:](self, "setLocation:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALSCdmaCellTower;
  -[ALSCdmaCellTower dealloc](&v3, "dealloc");
}

- (void)setMcc:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMcc
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSid:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_sid = a3;
}

- (void)setHasSid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSid
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNid:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_nid = a3;
}

- (void)setHasNid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNid
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBsid:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bsid = a3;
}

- (void)setHasBsid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBsid
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setZoneid:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_zoneid = a3;
}

- (void)setHasZoneid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasZoneid
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setBandclass:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bandclass = a3;
}

- (void)setHasBandclass:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBandclass
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setChannel:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPnoffset:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_pnoffset = a3;
}

- (void)setHasPnoffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPnoffset
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSCdmaCellTower;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSCdmaCellTower description](&v3, "description"), -[ALSCdmaCellTower dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;
  ALSLocation *location;
  $9A7F0227EFB4DBDE183E01B489D06990 v6;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mcc), CFSTR("mcc"));
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sid), CFSTR("sid"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_nid), CFSTR("nid"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_bsid), CFSTR("bsid"));
LABEL_6:
  location = self->_location;
  if (location)
    objc_msgSend(v3, "setObject:forKey:", -[ALSLocation dictionaryRepresentation](location, "dictionaryRepresentation"), CFSTR("location"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_zoneid), CFSTR("zoneid"));
  *(_BYTE *)&v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_bandclass), CFSTR("bandclass"));
    *(_BYTE *)&v6 = self->_has;
  }
LABEL_11:
  if ((*(_BYTE *)&v6 & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_channel), CFSTR("channel"));
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_13;
  }
  if ((*(_BYTE *)&v6 & 0x20) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pnoffset), CFSTR("pnoffset"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100EDC410((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  ALSLocation *location;
  $9A7F0227EFB4DBDE183E01B489D06990 v7;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_mcc, 1);
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_sid, 3);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteInt32Field(a3, self->_nid, 4);
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field(a3, self->_bsid, 5);
LABEL_6:
  location = self->_location;
  if (location)
    PBDataWriterWriteSubmessage(a3, location, 6);
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v7 & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteInt32Field(a3, self->_zoneid, 7);
  *(_BYTE *)&v7 = self->_has;
  if ((*(_BYTE *)&v7 & 1) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field(a3, self->_bandclass, 8);
    *(_BYTE *)&v7 = self->_has;
  }
LABEL_11:
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      return;
LABEL_19:
    PBDataWriterWriteInt32Field(a3, self->_pnoffset, 10);
    return;
  }
  PBDataWriterWriteInt32Field(a3, self->_channel, 9);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_19;
}

- (void)copyTo:(id)a3
{
  char has;
  $9A7F0227EFB4DBDE183E01B489D06990 v6;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_mcc;
    *((_BYTE *)a3 + 52) |= 8u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 11) = self->_sid;
  *((_BYTE *)a3 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  *((_DWORD *)a3 + 9) = self->_nid;
  *((_BYTE *)a3 + 52) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 3) = self->_bsid;
    *((_BYTE *)a3 + 52) |= 2u;
  }
LABEL_6:
  if (self->_location)
    objc_msgSend(a3, "setLocation:");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_DWORD *)a3 + 12) = self->_zoneid;
  *((_BYTE *)a3 + 52) |= 0x80u;
  *(_BYTE *)&v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
LABEL_10:
    *((_DWORD *)a3 + 2) = self->_bandclass;
    *((_BYTE *)a3 + 52) |= 1u;
    *(_BYTE *)&v6 = self->_has;
  }
LABEL_11:
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      return;
    goto LABEL_13;
  }
  *((_DWORD *)a3 + 4) = self->_channel;
  *((_BYTE *)a3 + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_13:
    *((_DWORD *)a3 + 10) = self->_pnoffset;
    *((_BYTE *)a3 + 52) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id *v6;
  char has;
  $9A7F0227EFB4DBDE183E01B489D06990 v8;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_mcc;
    *((_BYTE *)v5 + 52) |= 8u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 11) = self->_sid;
  *((_BYTE *)v5 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  *((_DWORD *)v5 + 9) = self->_nid;
  *((_BYTE *)v5 + 52) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 3) = self->_bsid;
    *((_BYTE *)v5 + 52) |= 2u;
  }
LABEL_6:

  v6[3] = -[ALSLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v8 & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_DWORD *)v6 + 12) = self->_zoneid;
  *((_BYTE *)v6 + 52) |= 0x80u;
  *(_BYTE *)&v8 = self->_has;
  if ((*(_BYTE *)&v8 & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v6 + 2) = self->_bandclass;
    *((_BYTE *)v6 + 52) |= 1u;
    *(_BYTE *)&v8 = self->_has;
  }
LABEL_9:
  if ((*(_BYTE *)&v8 & 4) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_channel;
    *((_BYTE *)v6 + 52) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v6;
    goto LABEL_11;
  }
  if ((*(_BYTE *)&v8 & 0x20) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 10) = self->_pnoffset;
    *((_BYTE *)v6 + 52) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  char has;
  ALSLocation *location;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 8) == 0 || self->_mcc != *((_DWORD *)a3 + 8))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 52) & 8) != 0)
    {
      goto LABEL_44;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x40) == 0 || self->_sid != *((_DWORD *)a3 + 11))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 52) & 0x40) != 0)
    {
      goto LABEL_44;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x10) == 0 || self->_nid != *((_DWORD *)a3 + 9))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 52) & 0x10) != 0)
    {
      goto LABEL_44;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_bsid != *((_DWORD *)a3 + 3))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 52) & 2) != 0)
    {
      goto LABEL_44;
    }
    location = self->_location;
    if ((unint64_t)location | *((_QWORD *)a3 + 3))
    {
      v5 = -[ALSLocation isEqual:](location, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if (has < 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x80) == 0 || self->_zoneid != *((_DWORD *)a3 + 12))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 52) & 0x80) != 0)
    {
LABEL_44:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_bandclass != *((_DWORD *)a3 + 2))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 52) & 1) != 0)
    {
      goto LABEL_44;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_channel != *((_DWORD *)a3 + 4))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 52) & 4) != 0)
    {
      goto LABEL_44;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 52) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x20) == 0 || self->_pnoffset != *((_DWORD *)a3 + 10))
        goto LABEL_44;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761 * self->_mcc;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_sid;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_nid;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_bsid;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[ALSLocation hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    v8 = 2654435761 * self->_zoneid;
    if ((*(_BYTE *)&self->_has & 1) == 0)
    {
LABEL_12:
      v9 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_13;
LABEL_17:
      v10 = 0;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_14;
LABEL_18:
      v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_12;
  }
  v9 = 2654435761 * self->_bandclass;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_17;
LABEL_13:
  v10 = 2654435761 * self->_channel;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_18;
LABEL_14:
  v11 = 2654435761 * self->_pnoffset;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  ALSLocation *location;
  uint64_t v7;
  int v8;

  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 8) != 0)
  {
    self->_mcc = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)a3 + 52);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 52) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_sid = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_nid = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 52) & 2) != 0)
  {
LABEL_5:
    self->_bsid = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_6:
  location = self->_location;
  v7 = *((_QWORD *)a3 + 3);
  if (location)
  {
    if (v7)
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v7)
  {
    -[ALSCdmaCellTower setLocation:](self, "setLocation:");
  }
  v8 = *((char *)a3 + 52);
  if ((v8 & 0x80000000) == 0)
  {
    if ((v8 & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  self->_zoneid = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 0x80u;
  LOBYTE(v8) = *((_BYTE *)a3 + 52);
  if ((v8 & 1) != 0)
  {
LABEL_17:
    self->_bandclass = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    LOBYTE(v8) = *((_BYTE *)a3 + 52);
  }
LABEL_18:
  if ((v8 & 4) == 0)
  {
    if ((v8 & 0x20) == 0)
      return;
    goto LABEL_20;
  }
  self->_channel = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 52) & 0x20) != 0)
  {
LABEL_20:
    self->_pnoffset = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 0x20u;
  }
}

- (int)mcc
{
  return self->_mcc;
}

- (int)sid
{
  return self->_sid;
}

- (int)nid
{
  return self->_nid;
}

- (int)bsid
{
  return self->_bsid;
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)zoneid
{
  return self->_zoneid;
}

- (int)bandclass
{
  return self->_bandclass;
}

- (int)channel
{
  return self->_channel;
}

- (int)pnoffset
{
  return self->_pnoffset;
}

@end

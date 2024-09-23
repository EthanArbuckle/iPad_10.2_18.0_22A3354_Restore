@implementation ALSCdmaEvdoTower

- (void)dealloc
{
  objc_super v3;

  -[ALSCdmaEvdoTower setSectorid:](self, "setSectorid:", 0);
  -[ALSCdmaEvdoTower setLocation:](self, "setLocation:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALSCdmaEvdoTower;
  -[ALSCdmaEvdoTower dealloc](&v3, "dealloc");
}

- (BOOL)hasSectorid
{
  return self->_sectorid != 0;
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
  *(_BYTE *)&self->_has |= 2u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPnoffset:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_pnoffset = a3;
}

- (void)setHasPnoffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPnoffset
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSCdmaEvdoTower;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSCdmaEvdoTower description](&v3, "description"), -[ALSCdmaEvdoTower dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *sectorid;
  char has;
  ALSLocation *location;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  sectorid = self->_sectorid;
  if (sectorid)
    objc_msgSend(v3, "setObject:forKey:", sectorid, CFSTR("sectorid"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_bandclass), CFSTR("bandclass"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_channel), CFSTR("channel"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_6:
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pnoffset), CFSTR("pnoffset"));
LABEL_7:
  location = self->_location;
  if (location)
    objc_msgSend(v4, "setObject:forKey:", -[ALSLocation dictionaryRepresentation](location, "dictionaryRepresentation"), CFSTR("location"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100EE6198((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *sectorid;
  char has;
  ALSLocation *location;

  sectorid = self->_sectorid;
  if (sectorid)
    PBDataWriterWriteStringField(a3, sectorid, 1);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_bandclass, 2);
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field(a3, self->_channel, 3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field(a3, self->_pnoffset, 4);
LABEL_7:
  location = self->_location;
  if (location)
    PBDataWriterWriteSubmessage(a3, location, 5);
}

- (void)copyTo:(id)a3
{
  char has;

  if (self->_sectorid)
    objc_msgSend(a3, "setSectorid:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_bandclass;
    *((_BYTE *)a3 + 40) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 3) = self->_channel;
  *((_BYTE *)a3 + 40) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 6) = self->_pnoffset;
    *((_BYTE *)a3 + 40) |= 4u;
  }
LABEL_7:
  if (self->_location)
    objc_msgSend(a3, "setLocation:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  char has;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");

  v5[4] = -[NSString copyWithZone:](self->_sectorid, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *((_DWORD *)v5 + 3) = self->_channel;
    *((_BYTE *)v5 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 2) = self->_bandclass;
  *((_BYTE *)v5 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 6) = self->_pnoffset;
    *((_BYTE *)v5 + 40) |= 4u;
  }
LABEL_5:

  v5[2] = -[ALSLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *sectorid;
  ALSLocation *location;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    sectorid = self->_sectorid;
    if (!((unint64_t)sectorid | *((_QWORD *)a3 + 4))
      || (v5 = -[NSString isEqual:](sectorid, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_bandclass != *((_DWORD *)a3 + 2))
          goto LABEL_21;
      }
      else if ((*((_BYTE *)a3 + 40) & 1) != 0)
      {
LABEL_21:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_channel != *((_DWORD *)a3 + 3))
          goto LABEL_21;
      }
      else if ((*((_BYTE *)a3 + 40) & 2) != 0)
      {
        goto LABEL_21;
      }
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_pnoffset != *((_DWORD *)a3 + 6))
          goto LABEL_21;
      }
      else if ((*((_BYTE *)a3 + 40) & 4) != 0)
      {
        goto LABEL_21;
      }
      location = self->_location;
      if ((unint64_t)location | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[ALSLocation isEqual:](location, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_sectorid, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[ALSLocation hash](self->_location, "hash");
  }
  v4 = 2654435761 * self->_bandclass;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_channel;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_pnoffset;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[ALSLocation hash](self->_location, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  ALSLocation *location;
  uint64_t v7;

  if (*((_QWORD *)a3 + 4))
    -[ALSCdmaEvdoTower setSectorid:](self, "setSectorid:");
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) != 0)
  {
    self->_bandclass = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_channel = *((_DWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 40) & 4) != 0)
  {
LABEL_6:
    self->_pnoffset = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_7:
  location = self->_location;
  v7 = *((_QWORD *)a3 + 2);
  if (location)
  {
    if (v7)
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v7)
  {
    -[ALSCdmaEvdoTower setLocation:](self, "setLocation:");
  }
}

- (NSString)sectorid
{
  return self->_sectorid;
}

- (void)setSectorid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
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

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

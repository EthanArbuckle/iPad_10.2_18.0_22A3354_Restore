@implementation ALSLteCellTower

- (void)dealloc
{
  objc_super v3;

  -[ALSLteCellTower setLocation:](self, "setLocation:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALSLteCellTower;
  -[ALSLteCellTower dealloc](&v3, "dealloc");
}

- (void)setMcc:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMcc
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMnc:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMnc
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCellID:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cellID = a3;
}

- (void)setHasCellID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCellID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTacID:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_tacID = a3;
}

- (void)setHasTacID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTacID
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setUarfcn:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_uarfcn = a3;
}

- (void)setHasUarfcn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUarfcn
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPid:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_pid = a3;
}

- (void)setHasPid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPid
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSLteCellTower;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSLteCellTower description](&v3, "description"), -[ALSLteCellTower dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;
  ALSLocation *location;
  char v6;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mcc), CFSTR("mcc"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mnc), CFSTR("mnc"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_cellID), CFSTR("cellID"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tacID), CFSTR("tacID"));
LABEL_6:
  location = self->_location;
  if (location)
    objc_msgSend(v3, "setObject:forKey:", -[ALSLocation dictionaryRepresentation](location, "dictionaryRepresentation"), CFSTR("location"));
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_uarfcn), CFSTR("uarfcn"));
    v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pid), CFSTR("pid"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F0B28C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  ALSLocation *location;
  char v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_mcc, 1);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_mnc, 2);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_14:
  PBDataWriterWriteInt32Field(a3, self->_cellID, 3);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field(a3, self->_tacID, 4);
LABEL_6:
  location = self->_location;
  if (location)
    PBDataWriterWriteSubmessage(a3, location, 5);
  v7 = (char)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_uarfcn, 6);
    v7 = (char)self->_has;
  }
  if ((v7 & 8) != 0)
    PBDataWriterWriteInt32Field(a3, self->_pid, 7);
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_mcc;
    *((_BYTE *)a3 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_mnc;
  *((_BYTE *)a3 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  *((_DWORD *)a3 + 2) = self->_cellID;
  *((_BYTE *)a3 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 9) = self->_tacID;
    *((_BYTE *)a3 + 44) |= 0x10u;
  }
LABEL_6:
  if (self->_location)
    objc_msgSend(a3, "setLocation:");
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_uarfcn;
    *((_BYTE *)a3 + 44) |= 0x20u;
    v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_pid;
    *((_BYTE *)a3 + 44) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id *v6;
  char has;
  char v8;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_mcc;
    *((_BYTE *)v5 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_mnc;
  *((_BYTE *)v5 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  *((_DWORD *)v5 + 2) = self->_cellID;
  *((_BYTE *)v5 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 9) = self->_tacID;
    *((_BYTE *)v5 + 44) |= 0x10u;
  }
LABEL_6:

  v6[2] = -[ALSLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_uarfcn;
    *((_BYTE *)v6 + 44) |= 0x20u;
    v8 = (char)self->_has;
  }
  if ((v8 & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_pid;
    *((_BYTE *)v6 + 44) |= 8u;
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
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_mcc != *((_DWORD *)a3 + 6))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
LABEL_34:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_mnc != *((_DWORD *)a3 + 7))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
      goto LABEL_34;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_cellID != *((_DWORD *)a3 + 2))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
      goto LABEL_34;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_tacID != *((_DWORD *)a3 + 9))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_34;
    }
    location = self->_location;
    if ((unint64_t)location | *((_QWORD *)a3 + 2))
    {
      v5 = -[ALSLocation isEqual:](location, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x20) == 0 || self->_uarfcn != *((_DWORD *)a3 + 10))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x20) != 0)
    {
      goto LABEL_34;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_pid != *((_DWORD *)a3 + 8))
        goto LABEL_34;
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

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_mcc;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_mnc;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_cellID;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_tacID;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[ALSLocation hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v8 = 2654435761 * self->_uarfcn;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_12;
LABEL_14:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_12:
  v9 = 2654435761 * self->_pid;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  ALSLocation *location;
  uint64_t v7;
  char v8;

  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 2) != 0)
  {
    self->_mcc = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mnc = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_cellID = *((_DWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
  {
LABEL_5:
    self->_tacID = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_6:
  location = self->_location;
  v7 = *((_QWORD *)a3 + 2);
  if (location)
  {
    if (v7)
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v7)
  {
    -[ALSLteCellTower setLocation:](self, "setLocation:");
  }
  v8 = *((_BYTE *)a3 + 44);
  if ((v8 & 0x20) != 0)
  {
    self->_uarfcn = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 0x20u;
    v8 = *((_BYTE *)a3 + 44);
  }
  if ((v8 & 8) != 0)
  {
    self->_pid = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
}

- (int)mcc
{
  return self->_mcc;
}

- (int)mnc
{
  return self->_mnc;
}

- (int)cellID
{
  return self->_cellID;
}

- (int)tacID
{
  return self->_tacID;
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int)uarfcn
{
  return self->_uarfcn;
}

- (int)pid
{
  return self->_pid;
}

@end

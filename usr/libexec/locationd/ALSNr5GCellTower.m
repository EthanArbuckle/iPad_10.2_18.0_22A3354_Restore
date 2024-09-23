@implementation ALSNr5GCellTower

- (void)dealloc
{
  objc_super v3;

  -[ALSNr5GCellTower setLocation:](self, "setLocation:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALSNr5GCellTower;
  -[ALSNr5GCellTower dealloc](&v3, "dealloc");
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

- (void)setCellID:(int64_t)a3
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

- (void)setNrarfcn:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_nrarfcn = a3;
}

- (void)setHasNrarfcn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNrarfcn
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSNr5GCellTower;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSNr5GCellTower description](&v3, "description"), -[ALSNr5GCellTower dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;
  ALSLocation *location;

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
      goto LABEL_13;
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
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_cellID), CFSTR("cellID"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tacID), CFSTR("tacID"));
LABEL_6:
  location = self->_location;
  if (location)
    objc_msgSend(v3, "setObject:forKey:", -[ALSLocation dictionaryRepresentation](location, "dictionaryRepresentation"), CFSTR("location"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_nrarfcn), CFSTR("nrarfcn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1014626D4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  ALSLocation *location;

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
      goto LABEL_12;
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
LABEL_12:
  PBDataWriterWriteInt64Field(a3, self->_cellID, 3);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field(a3, self->_tacID, 4);
LABEL_6:
  location = self->_location;
  if (location)
    PBDataWriterWriteSubmessage(a3, location, 5);
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field(a3, self->_nrarfcn, 6);
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_mcc;
    *((_BYTE *)a3 + 40) |= 2u;
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
  *((_DWORD *)a3 + 7) = self->_mnc;
  *((_BYTE *)a3 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  *((_QWORD *)a3 + 1) = self->_cellID;
  *((_BYTE *)a3 + 40) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 9) = self->_tacID;
    *((_BYTE *)a3 + 40) |= 0x10u;
  }
LABEL_6:
  if (self->_location)
    objc_msgSend(a3, "setLocation:");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_nrarfcn;
    *((_BYTE *)a3 + 40) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id *v6;
  char has;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_mcc;
    *((_BYTE *)v5 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_mnc;
  *((_BYTE *)v5 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  v5[1] = (id)self->_cellID;
  *((_BYTE *)v5 + 40) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 9) = self->_tacID;
    *((_BYTE *)v5 + 40) |= 0x10u;
  }
LABEL_6:

  v6[2] = -[ALSLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_nrarfcn;
    *((_BYTE *)v6 + 40) |= 8u;
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
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_mcc != *((_DWORD *)a3 + 6))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_mnc != *((_DWORD *)a3 + 7))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
      goto LABEL_29;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_cellID != *((_QWORD *)a3 + 1))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
      goto LABEL_29;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x10) == 0 || self->_tacID != *((_DWORD *)a3 + 9))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
    {
      goto LABEL_29;
    }
    location = self->_location;
    if ((unint64_t)location | *((_QWORD *)a3 + 2))
    {
      v5 = -[ALSLocation isEqual:](location, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_nrarfcn != *((_DWORD *)a3 + 8))
        goto LABEL_29;
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
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v8 = 2654435761 * self->_nrarfcn;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  ALSLocation *location;
  uint64_t v7;

  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_mcc = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mnc = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_cellID = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
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
    -[ALSNr5GCellTower setLocation:](self, "setLocation:");
  }
  if ((*((_BYTE *)a3 + 40) & 8) != 0)
  {
    self->_nrarfcn = *((_DWORD *)a3 + 8);
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

- (int64_t)cellID
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

- (int)nrarfcn
{
  return self->_nrarfcn;
}

@end

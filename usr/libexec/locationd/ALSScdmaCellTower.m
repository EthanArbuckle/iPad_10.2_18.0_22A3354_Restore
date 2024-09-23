@implementation ALSScdmaCellTower

- (void)dealloc
{
  objc_super v3;

  -[ALSScdmaCellTower setLocation:](self, "setLocation:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALSScdmaCellTower;
  -[ALSScdmaCellTower dealloc](&v3, "dealloc");
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setArfcn:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArfcn
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPsc:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPsc
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSScdmaCellTower;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSScdmaCellTower description](&v3, "description"), -[ALSScdmaCellTower dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  ALSLocation *location;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mcc), CFSTR("mcc"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mnc), CFSTR("mnc"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_cellID), CFSTR("cellID"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lacID), CFSTR("lacID"));
  location = self->_location;
  if (location)
    objc_msgSend(v3, "setObject:forKey:", -[ALSLocation dictionaryRepresentation](location, "dictionaryRepresentation"), CFSTR("location"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_arfcn), CFSTR("arfcn"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_psc), CFSTR("psc"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1012FBA18((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  ALSLocation *location;
  char has;

  PBDataWriterWriteInt32Field(a3, self->_mcc, 1);
  PBDataWriterWriteInt32Field(a3, self->_mnc, 2);
  PBDataWriterWriteInt32Field(a3, self->_cellID, 3);
  PBDataWriterWriteInt32Field(a3, self->_lacID, 4);
  location = self->_location;
  if (location)
    PBDataWriterWriteSubmessage(a3, location, 5);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_arfcn, 11);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field(a3, self->_psc, 12);
}

- (void)copyTo:(id)a3
{
  char has;

  *((_DWORD *)a3 + 8) = self->_mcc;
  *((_DWORD *)a3 + 9) = self->_mnc;
  *((_DWORD *)a3 + 3) = self->_cellID;
  *((_DWORD *)a3 + 4) = self->_lacID;
  if (self->_location)
    objc_msgSend(a3, "setLocation:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_arfcn;
    *((_BYTE *)a3 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_psc;
    *((_BYTE *)a3 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)v5 + 8) = self->_mcc;
  *((_DWORD *)v5 + 9) = self->_mnc;
  *((_DWORD *)v5 + 3) = self->_cellID;
  *((_DWORD *)v5 + 4) = self->_lacID;

  *((_QWORD *)v5 + 3) = -[ALSLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_arfcn;
    *((_BYTE *)v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_psc;
    *((_BYTE *)v5 + 44) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  ALSLocation *location;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_mcc != *((_DWORD *)a3 + 8)
      || self->_mnc != *((_DWORD *)a3 + 9)
      || self->_cellID != *((_DWORD *)a3 + 3)
      || self->_lacID != *((_DWORD *)a3 + 4))
    {
      goto LABEL_17;
    }
    location = self->_location;
    if (!((unint64_t)location | *((_QWORD *)a3 + 3))
      || (v5 = -[ALSLocation isEqual:](location, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_arfcn != *((_DWORD *)a3 + 2))
          goto LABEL_17;
      }
      else if ((*((_BYTE *)a3 + 44) & 1) != 0)
      {
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 2) == 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_psc != *((_DWORD *)a3 + 10))
          goto LABEL_17;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t mcc;
  uint64_t mnc;
  uint64_t cellID;
  uint64_t lacID;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  mcc = self->_mcc;
  mnc = self->_mnc;
  cellID = self->_cellID;
  lacID = self->_lacID;
  v7 = -[ALSLocation hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_arfcn;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    return (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * cellID) ^ (2654435761 * lacID) ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v9 = 2654435761 * self->_psc;
  return (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * cellID) ^ (2654435761 * lacID) ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  ALSLocation *location;
  uint64_t v6;
  char v7;

  self->_mcc = *((_DWORD *)a3 + 8);
  self->_mnc = *((_DWORD *)a3 + 9);
  self->_cellID = *((_DWORD *)a3 + 3);
  self->_lacID = *((_DWORD *)a3 + 4);
  location = self->_location;
  v6 = *((_QWORD *)a3 + 3);
  if (location)
  {
    if (v6)
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v6)
  {
    -[ALSScdmaCellTower setLocation:](self, "setLocation:");
  }
  v7 = *((_BYTE *)a3 + 44);
  if ((v7 & 1) != 0)
  {
    self->_arfcn = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)a3 + 44);
  }
  if ((v7 & 2) != 0)
  {
    self->_psc = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (int)mcc
{
  return self->_mcc;
}

- (void)setMcc:(int)a3
{
  self->_mcc = a3;
}

- (int)mnc
{
  return self->_mnc;
}

- (void)setMnc:(int)a3
{
  self->_mnc = a3;
}

- (int)cellID
{
  return self->_cellID;
}

- (void)setCellID:(int)a3
{
  self->_cellID = a3;
}

- (int)lacID
{
  return self->_lacID;
}

- (void)setLacID:(int)a3
{
  self->_lacID = a3;
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)arfcn
{
  return self->_arfcn;
}

- (int)psc
{
  return self->_psc;
}

@end

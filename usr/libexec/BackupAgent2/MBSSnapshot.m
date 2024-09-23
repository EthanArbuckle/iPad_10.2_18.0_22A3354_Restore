@implementation MBSSnapshot

- (void)dealloc
{
  objc_super v3;

  -[MBSSnapshot setAttributes:](self, "setAttributes:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MBSSnapshot;
  -[MBSSnapshot dealloc](&v3, "dealloc");
}

- (void)setSnapshotID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_snapshotID = a3;
}

- (void)setHasSnapshotID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSnapshotID
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setQuotaReserved:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_quotaReserved = a3;
}

- (void)setHasQuotaReserved:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasQuotaReserved
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLastModified:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastModified = a3;
}

- (void)setHasLastModified:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastModified
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAttributes
{
  return self->_attributes != 0;
}

- (void)setCommitted:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_committed = a3;
}

- (void)setHasCommitted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCommitted
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBSSnapshot;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[MBSSnapshot description](&v3, "description"), -[MBSSnapshot dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;
  MBSSnapshotAttributes *attributes;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_snapshotID), CFSTR("snapshotID"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_quotaReserved), CFSTR("quotaReserved"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_lastModified), CFSTR("lastModified"));
LABEL_5:
  attributes = self->_attributes;
  if (attributes)
    objc_msgSend(v3, "setObject:forKey:", -[MBSSnapshotAttributes dictionaryRepresentation](attributes, "dictionaryRepresentation"), CFSTR("attributes"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_committed), CFSTR("committed"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000A7A0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  MBSSnapshotAttributes *attributes;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_snapshotID, 1);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field(a3, self->_quotaReserved, 2);
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field(a3, self->_lastModified, 3);
LABEL_5:
  attributes = self->_attributes;
  if (attributes)
    PBDataWriterWriteSubmessage(a3, attributes, 5);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(a3, self->_committed, 6);
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_snapshotID;
    *((_BYTE *)a3 + 44) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 3) = self->_quotaReserved;
  *((_BYTE *)a3 + 44) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_QWORD *)a3 + 2) = self->_lastModified;
    *((_BYTE *)a3 + 44) |= 2u;
  }
LABEL_5:
  if (self->_attributes)
    objc_msgSend(a3, "setAttributes:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_committed;
    *((_BYTE *)a3 + 44) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id *v6;
  char has;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_snapshotID;
    *((_BYTE *)v5 + 44) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = (id)self->_quotaReserved;
  *((_BYTE *)v5 + 44) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5[2] = (id)self->_lastModified;
    *((_BYTE *)v5 + 44) |= 2u;
  }
LABEL_5:

  v6[4] = -[MBSSnapshotAttributes copyWithZone:](self->_attributes, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6[1] = (id)self->_committed;
    *((_BYTE *)v6 + 44) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  char has;
  MBSSnapshotAttributes *attributes;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self));
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_snapshotID != *((_DWORD *)a3 + 10))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 44) & 8) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_quotaReserved != *((_QWORD *)a3 + 3))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
      goto LABEL_24;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_lastModified != *((_QWORD *)a3 + 2))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      goto LABEL_24;
    }
    attributes = self->_attributes;
    if ((unint64_t)attributes | *((_QWORD *)a3 + 4))
    {
      v5 = -[MBSSnapshotAttributes isEqual:](attributes, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 1) == 0;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_committed != *((_QWORD *)a3 + 1))
        goto LABEL_24;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_snapshotID;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_quotaReserved;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_lastModified;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[MBSSnapshotAttributes hash](self->_attributes, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_committed;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  MBSSnapshotAttributes *attributes;
  uint64_t v7;

  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 8) != 0)
  {
    self->_snapshotID = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)a3 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_quotaReserved = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 44) & 2) != 0)
  {
LABEL_4:
    self->_lastModified = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  attributes = self->_attributes;
  v7 = *((_QWORD *)a3 + 4);
  if (attributes)
  {
    if (v7)
      -[MBSSnapshotAttributes mergeFrom:](attributes, "mergeFrom:");
  }
  else if (v7)
  {
    -[MBSSnapshot setAttributes:](self, "setAttributes:");
  }
  if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
    self->_committed = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unsigned)snapshotID
{
  return self->_snapshotID;
}

- (unint64_t)quotaReserved
{
  return self->_quotaReserved;
}

- (unint64_t)lastModified
{
  return self->_lastModified;
}

- (MBSSnapshotAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)committed
{
  return self->_committed;
}

@end

@implementation PersistentAddressBookAddress

- (void)setRecordID:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_recordID = a3;
}

- (void)setHasRecordID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecordID
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAddressID:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_addressID = a3;
}

- (void)setHasAddressID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAddressID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setPosition:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPosition
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PersistentAddressBookAddress;
  v3 = -[PersistentAddressBookAddress description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentAddressBookAddress dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *syncIdentifier;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_recordID));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("recordID"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_addressID));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("addressID"));

  }
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
    objc_msgSend(v3, "setObject:forKey:", syncIdentifier, CFSTR("syncIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_position));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("position"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100A59E84((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSString *syncIdentifier;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(v6, self->_recordID, 1);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field(v6, self->_addressID, 2);
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
    PBDataWriterWriteStringField(v6, syncIdentifier, 3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField(v6, 4, self->_position);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[5] = self->_recordID;
    *((_BYTE *)v4 + 32) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[4] = self->_addressID;
    *((_BYTE *)v4 + 32) |= 2u;
  }
  if (self->_syncIdentifier)
  {
    v6 = v4;
    objc_msgSend(v4, "setSyncIdentifier:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_position;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[5] = self->_recordID;
    *((_BYTE *)v5 + 32) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[4] = self->_addressID;
    *((_BYTE *)v5 + 32) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_syncIdentifier, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6[1] = *(_QWORD *)&self->_position;
    *((_BYTE *)v6 + 32) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *syncIdentifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_19;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 32);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_recordID != *((_DWORD *)v4 + 5))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_addressID != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](syncIdentifier, "isEqual:"))
    {
LABEL_19:
      v8 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 32);
  }
  v8 = (v6 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_position != *((double *)v4 + 1))
      goto LABEL_19;
    v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  double position;
  double v8;
  long double v9;
  double v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_recordID;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_addressID;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_syncIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    position = self->_position;
    v8 = -position;
    if (position >= 0.0)
      v8 = self->_position;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_recordID = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_addressID = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[PersistentAddressBookAddress setSyncIdentifier:](self, "setSyncIdentifier:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_position = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (int)recordID
{
  return self->_recordID;
}

- (int)addressID
{
  return self->_addressID;
}

- (NSString)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentifier, a3);
}

- (double)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
}

@end

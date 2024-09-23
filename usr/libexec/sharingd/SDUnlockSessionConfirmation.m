@implementation SDUnlockSessionConfirmation

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupportsACK:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportsACK = a3;
}

- (void)setHasSupportsACK:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsACK
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSuppressNotification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_suppressNotification = a3;
}

- (void)setHasSuppressNotification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSuppressNotification
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDUnlockSessionConfirmation;
  v3 = -[SDUnlockSessionConfirmation description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionConfirmation dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("version"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sessionID));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sessionID"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_supportsACK));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("supportsACK"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_success));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("success"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_suppressNotification));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("suppressNotification"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSessionConfirmationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_version, 1);
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_sessionID, 2);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteBOOLField(v5, self->_supportsACK, 4);
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteBOOLField(v5, self->_success, 3);
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField(v5, self->_suppressNotification, 5);
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_version;
    *((_BYTE *)v4 + 20) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_sessionID;
  *((_BYTE *)v4 + 20) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    *((_BYTE *)v4 + 17) = self->_supportsACK;
    *((_BYTE *)v4 + 20) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *((_BYTE *)v4 + 16) = self->_success;
  *((_BYTE *)v4 + 20) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *((_BYTE *)v4 + 18) = self->_suppressNotification;
    *((_BYTE *)v4 + 20) |= 0x10u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_version;
    *((_BYTE *)result + 20) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_sessionID;
  *((_BYTE *)result + 20) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_BYTE *)result + 16) = self->_success;
  *((_BYTE *)result + 20) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_BYTE *)result + 17) = self->_supportsACK;
  *((_BYTE *)result + 20) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_6:
  *((_BYTE *)result + 18) = self->_suppressNotification;
  *((_BYTE *)result + 20) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_version != *((_DWORD *)v4 + 3))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_sessionID != *((_DWORD *)v4 + 2))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_30;
    if (self->_success)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 8) == 0)
      goto LABEL_30;
    if (self->_supportsACK)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 8) != 0)
  {
    goto LABEL_30;
  }
  v6 = (*((_BYTE *)v4 + 20) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 0x10) != 0)
    {
      if (self->_suppressNotification)
      {
        if (!*((_BYTE *)v4 + 18))
          goto LABEL_30;
      }
      else if (*((_BYTE *)v4 + 18))
      {
        goto LABEL_30;
      }
      v6 = 1;
      goto LABEL_31;
    }
LABEL_30:
    v6 = 0;
  }
LABEL_31:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_sessionID;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_success;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_supportsACK;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_suppressNotification;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 20);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionID = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    self->_supportsACK = *((_BYTE *)v4 + 17);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 20) & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_success = *((_BYTE *)v4 + 16);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 0x10) != 0)
  {
LABEL_6:
    self->_suppressNotification = *((_BYTE *)v4 + 18);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_7:

}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (BOOL)success
{
  return self->_success;
}

- (BOOL)supportsACK
{
  return self->_supportsACK;
}

- (BOOL)suppressNotification
{
  return self->_suppressNotification;
}

@end

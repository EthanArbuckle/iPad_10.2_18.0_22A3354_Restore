@implementation ICIAMSynchronizeMessagesRequest

- (void)setCommandSerialNumber:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_commandSerialNumber = a3;
}

- (void)setHasCommandSerialNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCommandSerialNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDSID:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dSID = a3;
}

- (void)setHasDSID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDSID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasDeviceID
{
  return self->_deviceID != 0;
}

- (void)setActiveCommandsOnly:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_activeCommandsOnly = a3;
}

- (void)setHasActiveCommandsOnly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActiveCommandsOnly
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICIAMSynchronizeMessagesRequest;
  -[ICIAMSynchronizeMessagesRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMSynchronizeMessagesRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *deviceID;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_commandSerialNumber);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("commandSerialNumber"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dSID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("DSID"));

  }
  deviceID = self->_deviceID;
  if (deviceID)
    objc_msgSend(v3, "setObject:forKey:", deviceID, CFSTR("deviceID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_activeCommandsOnly);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("activeCommandsOnly"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMSynchronizeMessagesRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_deviceID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_commandSerialNumber;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_dSID;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  if (self->_deviceID)
  {
    v6 = v4;
    objc_msgSend(v4, "setDeviceID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_activeCommandsOnly;
    *((_BYTE *)v4 + 36) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_commandSerialNumber;
    *(_BYTE *)(v5 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_dSID;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_deviceID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v6 + 32) = self->_activeCommandsOnly;
    *(_BYTE *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *deviceID;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 36);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_commandSerialNumber != *((_QWORD *)v4 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_dSID != *((_QWORD *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_17;
  }
  deviceID = self->_deviceID;
  if ((unint64_t)deviceID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceID, "isEqual:"))
      goto LABEL_17;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 36);
  }
  v8 = (v6 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_activeCommandsOnly)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_17;
      }
      else if (*((_BYTE *)v4 + 32))
      {
        goto LABEL_17;
      }
      v8 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v8 = 0;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_commandSerialNumber;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_dSID;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_deviceID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_activeCommandsOnly;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_commandSerialNumber = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_dSID = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[ICIAMSynchronizeMessagesRequest setDeviceID:](self, "setDeviceID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    self->_activeCommandsOnly = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (int64_t)commandSerialNumber
{
  return self->_commandSerialNumber;
}

- (int64_t)dSID
{
  return self->_dSID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (BOOL)activeCommandsOnly
{
  return self->_activeCommandsOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end

@implementation ICIAMApplicationMessageSyncCommand

- (int)commandType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_commandType;
  else
    return 0;
}

- (void)setCommandType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_commandType = a3;
}

- (void)setHasCommandType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCommandType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)commandTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E438B658[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCommandType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Add")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Remove")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoveAll")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Reset")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasApplicationMessage
{
  return self->_applicationMessage != 0;
}

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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICIAMApplicationMessageSyncCommand;
  -[ICIAMApplicationMessageSyncCommand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMApplicationMessageSyncCommand dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t commandType;
  __CFString *v5;
  ICIAMApplicationMessage *applicationMessage;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    commandType = self->_commandType;
    if (commandType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_commandType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E438B658[commandType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("commandType"));

  }
  applicationMessage = self->_applicationMessage;
  if (applicationMessage)
  {
    -[ICIAMApplicationMessage dictionaryRepresentation](applicationMessage, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("applicationMessage"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_commandSerialNumber);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("commandSerialNumber"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMApplicationMessageSyncCommandReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_applicationMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[6] = self->_commandType;
    *((_BYTE *)v4 + 28) |= 2u;
  }
  if (self->_applicationMessage)
  {
    v5 = v4;
    objc_msgSend(v4, "setApplicationMessage:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_commandSerialNumber;
    *((_BYTE *)v4 + 28) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_commandType;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  v7 = -[ICIAMApplicationMessage copyWithZone:](self->_applicationMessage, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_commandSerialNumber;
    *(_BYTE *)(v6 + 28) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  ICIAMApplicationMessage *applicationMessage;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 28);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_commandType != *((_DWORD *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  applicationMessage = self->_applicationMessage;
  if ((unint64_t)applicationMessage | *((_QWORD *)v4 + 2))
  {
    if (!-[ICIAMApplicationMessage isEqual:](applicationMessage, "isEqual:"))
    {
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 28);
  }
  v8 = (v6 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_commandSerialNumber != *((_QWORD *)v4 + 1))
      goto LABEL_14;
    v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_commandType;
  else
    v3 = 0;
  v4 = -[ICIAMApplicationMessage hash](self->_applicationMessage, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_commandSerialNumber;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;
  ICIAMApplicationMessage *applicationMessage;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((v4[7] & 2) != 0)
  {
    self->_commandType = v4[6];
    *(_BYTE *)&self->_has |= 2u;
  }
  applicationMessage = self->_applicationMessage;
  v7 = v5[2];
  if (applicationMessage)
  {
    if (!v7)
      goto LABEL_9;
    v8 = v5;
    -[ICIAMApplicationMessage mergeFrom:](applicationMessage, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    v8 = v5;
    -[ICIAMApplicationMessageSyncCommand setApplicationMessage:](self, "setApplicationMessage:");
  }
  v5 = v8;
LABEL_9:
  if ((*((_BYTE *)v5 + 28) & 1) != 0)
  {
    self->_commandSerialNumber = v5[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (ICIAMApplicationMessage)applicationMessage
{
  return self->_applicationMessage;
}

- (void)setApplicationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_applicationMessage, a3);
}

- (int64_t)commandSerialNumber
{
  return self->_commandSerialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationMessage, 0);
}

@end

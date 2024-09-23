@implementation ChannelActivityUpdate

- (void)setCurrentVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_currentVersion = a3;
}

- (void)setHasCurrentVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCurrentVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPrevVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_prevVersion = a3;
}

- (void)setHasPrevVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrevVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasEncryptedUpdatePayload
{
  return self->_encryptedUpdatePayload != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ChannelActivityUpdate;
  -[ChannelActivityUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChannelActivityUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *encryptedUpdatePayload;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_currentVersion);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("current_version"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_prevVersion);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("prev_version"));

  }
  encryptedUpdatePayload = self->_encryptedUpdatePayload;
  if (encryptedUpdatePayload)
    objc_msgSend(v3, "setObject:forKey:", encryptedUpdatePayload, CFSTR("encrypted_update_payload"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_encryptedUpdatePayload)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

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
    v4[1] = self->_currentVersion;
    *((_BYTE *)v4 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_prevVersion;
    *((_BYTE *)v4 + 32) |= 2u;
  }
  if (self->_encryptedUpdatePayload)
  {
    v6 = v4;
    objc_msgSend(v4, "setEncryptedUpdatePayload:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_currentVersion;
    *(_BYTE *)(v5 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_prevVersion;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_encryptedUpdatePayload, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *encryptedUpdatePayload;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_currentVersion != *((_QWORD *)v4 + 1))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_prevVersion != *((_QWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  encryptedUpdatePayload = self->_encryptedUpdatePayload;
  if ((unint64_t)encryptedUpdatePayload | *((_QWORD *)v4 + 3))
    v6 = -[NSData isEqual:](encryptedUpdatePayload, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_currentVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSData hash](self->_encryptedUpdatePayload, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761u * self->_prevVersion;
  return v3 ^ v2 ^ -[NSData hash](self->_encryptedUpdatePayload, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) != 0)
  {
    self->_currentVersion = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_prevVersion = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[ChannelActivityUpdate setEncryptedUpdatePayload:](self, "setEncryptedUpdatePayload:");
    v4 = v6;
  }

}

- (unint64_t)currentVersion
{
  return self->_currentVersion;
}

- (unint64_t)prevVersion
{
  return self->_prevVersion;
}

- (NSData)encryptedUpdatePayload
{
  return self->_encryptedUpdatePayload;
}

- (void)setEncryptedUpdatePayload:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedUpdatePayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedUpdatePayload, 0);
}

@end

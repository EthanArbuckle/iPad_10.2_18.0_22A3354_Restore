@implementation SharedChannelPublishOffGridPayloadRequest

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0;
}

- (void)setNotificationDisplayEpochSeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_notificationDisplayEpochSeconds = a3;
}

- (void)setHasNotificationDisplayEpochSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNotificationDisplayEpochSeconds
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelPublishOffGridPayloadRequest;
  -[SharedChannelPublishOffGridPayloadRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SharedChannelPublishOffGridPayloadRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encryptionKey;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  encryptionKey = self->_encryptionKey;
  if (encryptionKey)
    objc_msgSend(v3, "setObject:forKey:", encryptionKey, CFSTR("encryption_key"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_notificationDisplayEpochSeconds);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("notification_display_epoch_seconds"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelPublishOffGridPayloadRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_encryptionKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_encryptionKey)
  {
    v5 = v4;
    objc_msgSend(v4, "setEncryptionKey:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_notificationDisplayEpochSeconds;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_encryptionKey, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_notificationDisplayEpochSeconds;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *encryptionKey;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  encryptionKey = self->_encryptionKey;
  if ((unint64_t)encryptionKey | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](encryptionKey, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_notificationDisplayEpochSeconds == *((_QWORD *)v4 + 1))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSData hash](self->_encryptionKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_notificationDisplayEpochSeconds;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[SharedChannelPublishOffGridPayloadRequest setEncryptionKey:](self, "setEncryptionKey:");
    v4 = v5;
  }
  if ((v4[3] & 1) != 0)
  {
    self->_notificationDisplayEpochSeconds = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKey, a3);
}

- (unint64_t)notificationDisplayEpochSeconds
{
  return self->_notificationDisplayEpochSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKey, 0);
}

@end

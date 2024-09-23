@implementation TVRMSNowPlayingArtworkAvailableMessage

- (void)setSessionIdentifier:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionIdentifier = a3;
}

- (void)setHasSessionIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionIdentifier
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasArtworkIdentifier
{
  return self->_artworkIdentifier != 0;
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
  v8.super_class = (Class)TVRMSNowPlayingArtworkAvailableMessage;
  -[TVRMSNowPlayingArtworkAvailableMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSNowPlayingArtworkAvailableMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *artworkIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sessionIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sessionIdentifier"));

  }
  artworkIdentifier = self->_artworkIdentifier;
  if (artworkIdentifier)
    objc_msgSend(v3, "setObject:forKey:", artworkIdentifier, CFSTR("artworkIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSNowPlayingArtworkAvailableMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_artworkIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_sessionIdentifier;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  if (self->_artworkIdentifier)
  {
    v5 = v4;
    objc_msgSend(v4, "setArtworkIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_sessionIdentifier;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_artworkIdentifier, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *artworkIdentifier;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  artworkIdentifier = self->_artworkIdentifier;
  if ((unint64_t)artworkIdentifier | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](artworkIdentifier, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_sessionIdentifier;
  else
    v2 = 0;
  return -[NSString hash](self->_artworkIdentifier, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[5] & 1) != 0)
  {
    self->_sessionIdentifier = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[TVRMSNowPlayingArtworkAvailableMessage setArtworkIdentifier:](self, "setArtworkIdentifier:");
    v4 = v5;
  }

}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_artworkIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
}

@end

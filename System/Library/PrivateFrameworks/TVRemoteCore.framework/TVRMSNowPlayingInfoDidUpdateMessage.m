@implementation TVRMSNowPlayingInfoDidUpdateMessage

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

- (BOOL)hasNowPlayingInfo
{
  return self->_nowPlayingInfo != 0;
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
  v8.super_class = (Class)TVRMSNowPlayingInfoDidUpdateMessage;
  -[TVRMSNowPlayingInfoDidUpdateMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSNowPlayingInfoDidUpdateMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  TVRMSNowPlayingInfoMessage *nowPlayingInfo;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sessionIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sessionIdentifier"));

  }
  nowPlayingInfo = self->_nowPlayingInfo;
  if (nowPlayingInfo)
  {
    -[TVRMSNowPlayingInfoMessage dictionaryRepresentation](nowPlayingInfo, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("nowPlayingInfo"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSNowPlayingInfoDidUpdateMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_nowPlayingInfo)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_nowPlayingInfo)
  {
    v5 = v4;
    objc_msgSend(v4, "setNowPlayingInfo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_sessionIdentifier;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[TVRMSNowPlayingInfoMessage copyWithZone:](self->_nowPlayingInfo, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  TVRMSNowPlayingInfoMessage *nowPlayingInfo;
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
  nowPlayingInfo = self->_nowPlayingInfo;
  if ((unint64_t)nowPlayingInfo | *((_QWORD *)v4 + 1))
    v6 = -[TVRMSNowPlayingInfoMessage isEqual:](nowPlayingInfo, "isEqual:");
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
  return -[TVRMSNowPlayingInfoMessage hash](self->_nowPlayingInfo, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  TVRMSNowPlayingInfoMessage *nowPlayingInfo;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_sessionIdentifier = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  nowPlayingInfo = self->_nowPlayingInfo;
  v7 = v5[1];
  if (nowPlayingInfo)
  {
    if (v7)
    {
      v8 = v5;
      -[TVRMSNowPlayingInfoMessage mergeFrom:](nowPlayingInfo, "mergeFrom:");
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    -[TVRMSNowPlayingInfoDidUpdateMessage setNowPlayingInfo:](self, "setNowPlayingInfo:");
    goto LABEL_8;
  }

}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (TVRMSNowPlayingInfoMessage)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)setNowPlayingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

@end

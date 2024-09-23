@implementation ChannelActivityDeactivationRequest

- (BOOL)hasAuthCredential
{
  return self->_authCredential != 0;
}

- (BOOL)hasChannelIdentity
{
  return self->_channelIdentity != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setClientTimestampSeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clientTimestampSeconds = a3;
}

- (void)setHasClientTimestampSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientTimestampSeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAdopter
{
  return self->_adopter != 0;
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
  v8.super_class = (Class)ChannelActivityDeactivationRequest;
  -[ChannelActivityDeactivationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChannelActivityDeactivationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  AuthCredential *authCredential;
  void *v5;
  ChannelIdentity *channelIdentity;
  void *v7;
  NSData *uuid;
  void *v9;
  NSString *adopter;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  authCredential = self->_authCredential;
  if (authCredential)
  {
    -[AuthCredential dictionaryRepresentation](authCredential, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("auth_credential"));

  }
  channelIdentity = self->_channelIdentity;
  if (channelIdentity)
  {
    -[ChannelIdentity dictionaryRepresentation](channelIdentity, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("channel_identity"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_clientTimestampSeconds);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("client_timestamp_seconds"));

  }
  adopter = self->_adopter;
  if (adopter)
    objc_msgSend(v3, "setObject:forKey:", adopter, CFSTR("adopter"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityDeactivationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_authCredential)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_channelIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_adopter)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_authCredential)
  {
    objc_msgSend(v4, "setAuthCredential:");
    v4 = v5;
  }
  if (self->_channelIdentity)
  {
    objc_msgSend(v5, "setChannelIdentity:");
    v4 = v5;
  }
  if (self->_uuid)
  {
    objc_msgSend(v5, "setUuid:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_clientTimestampSeconds;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_adopter)
  {
    objc_msgSend(v5, "setAdopter:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[AuthCredential copyWithZone:](self->_authCredential, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[ChannelIdentity copyWithZone:](self->_channelIdentity, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_clientTimestampSeconds;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_adopter, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  AuthCredential *authCredential;
  ChannelIdentity *channelIdentity;
  NSData *uuid;
  NSString *adopter;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  authCredential = self->_authCredential;
  if ((unint64_t)authCredential | *((_QWORD *)v4 + 3))
  {
    if (!-[AuthCredential isEqual:](authCredential, "isEqual:"))
      goto LABEL_15;
  }
  channelIdentity = self->_channelIdentity;
  if ((unint64_t)channelIdentity | *((_QWORD *)v4 + 4))
  {
    if (!-[ChannelIdentity isEqual:](channelIdentity, "isEqual:"))
      goto LABEL_15;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_clientTimestampSeconds != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  adopter = self->_adopter;
  if ((unint64_t)adopter | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](adopter, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[AuthCredential hash](self->_authCredential, "hash");
  v4 = -[ChannelIdentity hash](self->_channelIdentity, "hash");
  v5 = -[NSData hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_clientTimestampSeconds;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_adopter, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  AuthCredential *authCredential;
  uint64_t v6;
  ChannelIdentity *channelIdentity;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  authCredential = self->_authCredential;
  v6 = v4[3];
  v9 = v4;
  if (authCredential)
  {
    if (!v6)
      goto LABEL_7;
    -[AuthCredential mergeFrom:](authCredential, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[ChannelActivityDeactivationRequest setAuthCredential:](self, "setAuthCredential:");
  }
  v4 = v9;
LABEL_7:
  channelIdentity = self->_channelIdentity;
  v8 = v4[4];
  if (channelIdentity)
  {
    if (!v8)
      goto LABEL_13;
    -[ChannelIdentity mergeFrom:](channelIdentity, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[ChannelActivityDeactivationRequest setChannelIdentity:](self, "setChannelIdentity:");
  }
  v4 = v9;
LABEL_13:
  if (v4[5])
  {
    -[ChannelActivityDeactivationRequest setUuid:](self, "setUuid:");
    v4 = v9;
  }
  if ((v4[6] & 1) != 0)
  {
    self->_clientTimestampSeconds = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[ChannelActivityDeactivationRequest setAdopter:](self, "setAdopter:");
    v4 = v9;
  }

}

- (AuthCredential)authCredential
{
  return self->_authCredential;
}

- (void)setAuthCredential:(id)a3
{
  objc_storeStrong((id *)&self->_authCredential, a3);
}

- (ChannelIdentity)channelIdentity
{
  return self->_channelIdentity;
}

- (void)setChannelIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_channelIdentity, a3);
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unint64_t)clientTimestampSeconds
{
  return self->_clientTimestampSeconds;
}

- (NSString)adopter
{
  return self->_adopter;
}

- (void)setAdopter:(id)a3
{
  objc_storeStrong((id *)&self->_adopter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_channelIdentity, 0);
  objc_storeStrong((id *)&self->_authCredential, 0);
  objc_storeStrong((id *)&self->_adopter, 0);
}

@end

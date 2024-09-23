@implementation DecryptedParticipantPayload

- (BOOL)hasTokenUri
{
  return self->_tokenUri != 0;
}

- (BOOL)hasPresenceIdentifier
{
  return self->_presenceIdentifier != 0;
}

- (BOOL)hasChannelIdentifier
{
  return self->_channelIdentifier != 0;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasClientPayload
{
  return self->_clientPayload != 0;
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
  v8.super_class = (Class)DecryptedParticipantPayload;
  -[DecryptedParticipantPayload description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DecryptedParticipantPayload dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *tokenUri;
  NSString *presenceIdentifier;
  NSString *channelIdentifier;
  void *v8;
  NSData *clientPayload;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  tokenUri = self->_tokenUri;
  if (tokenUri)
    objc_msgSend(v3, "setObject:forKey:", tokenUri, CFSTR("token_uri"));
  presenceIdentifier = self->_presenceIdentifier;
  if (presenceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", presenceIdentifier, CFSTR("presence_identifier"));
  channelIdentifier = self->_channelIdentifier;
  if (channelIdentifier)
    objc_msgSend(v4, "setObject:forKey:", channelIdentifier, CFSTR("channel_identifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("timestamp"));

  }
  clientPayload = self->_clientPayload;
  if (clientPayload)
    objc_msgSend(v4, "setObject:forKey:", clientPayload, CFSTR("client_payload"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return DecryptedParticipantPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_tokenUri)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_presenceIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_channelIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_clientPayload)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_tokenUri)
  {
    objc_msgSend(v4, "setTokenUri:");
    v4 = v5;
  }
  if (self->_presenceIdentifier)
  {
    objc_msgSend(v5, "setPresenceIdentifier:");
    v4 = v5;
  }
  if (self->_channelIdentifier)
  {
    objc_msgSend(v5, "setChannelIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_timestamp;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_clientPayload)
  {
    objc_msgSend(v5, "setClientPayload:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_tokenUri, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_presenceIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_channelIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v12 = -[NSData copyWithZone:](self->_clientPayload, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *tokenUri;
  NSString *presenceIdentifier;
  NSString *channelIdentifier;
  NSData *clientPayload;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  tokenUri = self->_tokenUri;
  if ((unint64_t)tokenUri | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](tokenUri, "isEqual:"))
      goto LABEL_15;
  }
  presenceIdentifier = self->_presenceIdentifier;
  if ((unint64_t)presenceIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](presenceIdentifier, "isEqual:"))
      goto LABEL_15;
  }
  channelIdentifier = self->_channelIdentifier;
  if ((unint64_t)channelIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](channelIdentifier, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  clientPayload = self->_clientPayload;
  if ((unint64_t)clientPayload | *((_QWORD *)v4 + 3))
    v9 = -[NSData isEqual:](clientPayload, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_tokenUri, "hash");
  v4 = -[NSString hash](self->_presenceIdentifier, "hash");
  v5 = -[NSString hash](self->_channelIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_timestamp;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSData hash](self->_clientPayload, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  v5 = v4;
  if (v4[5])
  {
    -[DecryptedParticipantPayload setTokenUri:](self, "setTokenUri:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[DecryptedParticipantPayload setPresenceIdentifier:](self, "setPresenceIdentifier:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[DecryptedParticipantPayload setChannelIdentifier:](self, "setChannelIdentifier:");
    v4 = v5;
  }
  if ((v4[6] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[3])
  {
    -[DecryptedParticipantPayload setClientPayload:](self, "setClientPayload:");
    v4 = v5;
  }

}

- (NSString)tokenUri
{
  return self->_tokenUri;
}

- (void)setTokenUri:(id)a3
{
  objc_storeStrong((id *)&self->_tokenUri, a3);
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (void)setPresenceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presenceIdentifier, a3);
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (void)setChannelIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_channelIdentifier, a3);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)clientPayload
{
  return self->_clientPayload;
}

- (void)setClientPayload:(id)a3
{
  objc_storeStrong((id *)&self->_clientPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenUri, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientPayload, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end

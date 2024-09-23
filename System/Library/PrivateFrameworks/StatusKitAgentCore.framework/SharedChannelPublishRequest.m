@implementation SharedChannelPublishRequest

- (BOOL)hasAuthCredential
{
  return self->_authCredential != 0;
}

- (BOOL)hasChannelPublishPayload
{
  return self->_channelPublishPayload != 0;
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
  v8.super_class = (Class)SharedChannelPublishRequest;
  -[SharedChannelPublishRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SharedChannelPublishRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  ChannelPublishPayload *channelPublishPayload;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  authCredential = self->_authCredential;
  if (authCredential)
  {
    -[AuthCredential dictionaryRepresentation](authCredential, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("auth_credential"));

  }
  channelPublishPayload = self->_channelPublishPayload;
  if (channelPublishPayload)
  {
    -[ChannelPublishPayload dictionaryRepresentation](channelPublishPayload, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("channel_publish_payload"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelPublishRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_channelPublishPayload)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_channelPublishPayload)
  {
    objc_msgSend(v5, "setChannelPublishPayload:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[AuthCredential copyWithZone:](self->_authCredential, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[ChannelPublishPayload copyWithZone:](self->_channelPublishPayload, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  AuthCredential *authCredential;
  ChannelPublishPayload *channelPublishPayload;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((authCredential = self->_authCredential, !((unint64_t)authCredential | v4[1]))
     || -[AuthCredential isEqual:](authCredential, "isEqual:")))
  {
    channelPublishPayload = self->_channelPublishPayload;
    if ((unint64_t)channelPublishPayload | v4[2])
      v7 = -[ChannelPublishPayload isEqual:](channelPublishPayload, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[AuthCredential hash](self->_authCredential, "hash");
  return -[ChannelPublishPayload hash](self->_channelPublishPayload, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  AuthCredential *authCredential;
  uint64_t v6;
  ChannelPublishPayload *channelPublishPayload;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  authCredential = self->_authCredential;
  v6 = v4[1];
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
    -[SharedChannelPublishRequest setAuthCredential:](self, "setAuthCredential:");
  }
  v4 = v9;
LABEL_7:
  channelPublishPayload = self->_channelPublishPayload;
  v8 = v4[2];
  if (channelPublishPayload)
  {
    if (v8)
    {
      -[ChannelPublishPayload mergeFrom:](channelPublishPayload, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SharedChannelPublishRequest setChannelPublishPayload:](self, "setChannelPublishPayload:");
    goto LABEL_12;
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

- (ChannelPublishPayload)channelPublishPayload
{
  return self->_channelPublishPayload;
}

- (void)setChannelPublishPayload:(id)a3
{
  objc_storeStrong((id *)&self->_channelPublishPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelPublishPayload, 0);
  objc_storeStrong((id *)&self->_authCredential, 0);
}

@end

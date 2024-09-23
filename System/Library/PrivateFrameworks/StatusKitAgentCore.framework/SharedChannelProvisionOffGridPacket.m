@implementation SharedChannelProvisionOffGridPacket

- (BOOL)hasPublishPayload
{
  return self->_publishPayload != 0;
}

- (BOOL)hasChannelTopic
{
  return self->_channelTopic != 0;
}

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (BOOL)hasCommitmentSalt
{
  return self->_commitmentSalt != 0;
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
  v8.super_class = (Class)SharedChannelProvisionOffGridPacket;
  -[SharedChannelProvisionOffGridPacket description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SharedChannelProvisionOffGridPacket dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *publishPayload;
  NSString *channelTopic;
  NSData *channelId;
  NSData *commitmentSalt;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  publishPayload = self->_publishPayload;
  if (publishPayload)
    objc_msgSend(v3, "setObject:forKey:", publishPayload, CFSTR("publish_payload"));
  channelTopic = self->_channelTopic;
  if (channelTopic)
    objc_msgSend(v4, "setObject:forKey:", channelTopic, CFSTR("channel_topic"));
  channelId = self->_channelId;
  if (channelId)
    objc_msgSend(v4, "setObject:forKey:", channelId, CFSTR("channel_id"));
  commitmentSalt = self->_commitmentSalt;
  if (commitmentSalt)
    objc_msgSend(v4, "setObject:forKey:", commitmentSalt, CFSTR("commitment_salt"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelProvisionOffGridPacketReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_publishPayload)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_channelTopic)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_channelId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_commitmentSalt)
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
  if (self->_publishPayload)
  {
    objc_msgSend(v4, "setPublishPayload:");
    v4 = v5;
  }
  if (self->_channelTopic)
  {
    objc_msgSend(v5, "setChannelTopic:");
    v4 = v5;
  }
  if (self->_channelId)
  {
    objc_msgSend(v5, "setChannelId:");
    v4 = v5;
  }
  if (self->_commitmentSalt)
  {
    objc_msgSend(v5, "setCommitmentSalt:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_publishPayload, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_channelTopic, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSData copyWithZone:](self->_channelId, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSData copyWithZone:](self->_commitmentSalt, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *publishPayload;
  NSString *channelTopic;
  NSData *channelId;
  NSData *commitmentSalt;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((publishPayload = self->_publishPayload, !((unint64_t)publishPayload | v4[4]))
     || -[NSData isEqual:](publishPayload, "isEqual:"))
    && ((channelTopic = self->_channelTopic, !((unint64_t)channelTopic | v4[2]))
     || -[NSString isEqual:](channelTopic, "isEqual:"))
    && ((channelId = self->_channelId, !((unint64_t)channelId | v4[1]))
     || -[NSData isEqual:](channelId, "isEqual:")))
  {
    commitmentSalt = self->_commitmentSalt;
    if ((unint64_t)commitmentSalt | v4[3])
      v9 = -[NSData isEqual:](commitmentSalt, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_publishPayload, "hash");
  v4 = -[NSString hash](self->_channelTopic, "hash") ^ v3;
  v5 = -[NSData hash](self->_channelId, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_commitmentSalt, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[4])
    -[SharedChannelProvisionOffGridPacket setPublishPayload:](self, "setPublishPayload:");
  if (v4[2])
    -[SharedChannelProvisionOffGridPacket setChannelTopic:](self, "setChannelTopic:");
  if (v4[1])
    -[SharedChannelProvisionOffGridPacket setChannelId:](self, "setChannelId:");
  if (v4[3])
    -[SharedChannelProvisionOffGridPacket setCommitmentSalt:](self, "setCommitmentSalt:");

}

- (NSData)publishPayload
{
  return self->_publishPayload;
}

- (void)setPublishPayload:(id)a3
{
  objc_storeStrong((id *)&self->_publishPayload, a3);
}

- (NSString)channelTopic
{
  return self->_channelTopic;
}

- (void)setChannelTopic:(id)a3
{
  objc_storeStrong((id *)&self->_channelTopic, a3);
}

- (NSData)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_channelId, a3);
}

- (NSData)commitmentSalt
{
  return self->_commitmentSalt;
}

- (void)setCommitmentSalt:(id)a3
{
  objc_storeStrong((id *)&self->_commitmentSalt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishPayload, 0);
  objc_storeStrong((id *)&self->_commitmentSalt, 0);
  objc_storeStrong((id *)&self->_channelTopic, 0);
  objc_storeStrong((id *)&self->_channelId, 0);
}

@end

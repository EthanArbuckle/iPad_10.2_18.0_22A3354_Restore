@implementation SharedChannelProvisionStoragePacketInfo

- (void)setPacketId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_packetId = a3;
}

- (void)setHasPacketId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPacketId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEncryptedPacket
{
  return self->_encryptedPacket != 0;
}

- (BOOL)hasChannelTopicCommitment
{
  return self->_channelTopicCommitment != 0;
}

- (BOOL)hasInitializationVector
{
  return self->_initializationVector != 0;
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
  v8.super_class = (Class)SharedChannelProvisionStoragePacketInfo;
  -[SharedChannelProvisionStoragePacketInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SharedChannelProvisionStoragePacketInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encryptedPacket;
  NSData *channelTopicCommitment;
  NSData *initializationVector;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetId);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("packet_id"));

  }
  encryptedPacket = self->_encryptedPacket;
  if (encryptedPacket)
    objc_msgSend(v3, "setObject:forKey:", encryptedPacket, CFSTR("encrypted_packet"));
  channelTopicCommitment = self->_channelTopicCommitment;
  if (channelTopicCommitment)
    objc_msgSend(v3, "setObject:forKey:", channelTopicCommitment, CFSTR("channel_topic_commitment"));
  initializationVector = self->_initializationVector;
  if (initializationVector)
    objc_msgSend(v3, "setObject:forKey:", initializationVector, CFSTR("initialization_vector"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelProvisionStoragePacketInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_encryptedPacket)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_channelTopicCommitment)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_initializationVector)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_packetId;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_encryptedPacket)
  {
    objc_msgSend(v4, "setEncryptedPacket:");
    v4 = v5;
  }
  if (self->_channelTopicCommitment)
  {
    objc_msgSend(v5, "setChannelTopicCommitment:");
    v4 = v5;
  }
  if (self->_initializationVector)
  {
    objc_msgSend(v5, "setInitializationVector:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_packetId;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_encryptedPacket, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSData copyWithZone:](self->_channelTopicCommitment, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[NSData copyWithZone:](self->_initializationVector, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *encryptedPacket;
  NSData *channelTopicCommitment;
  NSData *initializationVector;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_packetId != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  encryptedPacket = self->_encryptedPacket;
  if ((unint64_t)encryptedPacket | *((_QWORD *)v4 + 3)
    && !-[NSData isEqual:](encryptedPacket, "isEqual:"))
  {
    goto LABEL_13;
  }
  channelTopicCommitment = self->_channelTopicCommitment;
  if ((unint64_t)channelTopicCommitment | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](channelTopicCommitment, "isEqual:"))
      goto LABEL_13;
  }
  initializationVector = self->_initializationVector;
  if ((unint64_t)initializationVector | *((_QWORD *)v4 + 4))
    v8 = -[NSData isEqual:](initializationVector, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_packetId;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_encryptedPacket, "hash") ^ v3;
  v5 = -[NSData hash](self->_channelTopicCommitment, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_initializationVector, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((v4[5] & 1) != 0)
  {
    self->_packetId = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (v4[3])
  {
    -[SharedChannelProvisionStoragePacketInfo setEncryptedPacket:](self, "setEncryptedPacket:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[SharedChannelProvisionStoragePacketInfo setChannelTopicCommitment:](self, "setChannelTopicCommitment:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[SharedChannelProvisionStoragePacketInfo setInitializationVector:](self, "setInitializationVector:");
    v4 = v5;
  }

}

- (unint64_t)packetId
{
  return self->_packetId;
}

- (NSData)encryptedPacket
{
  return self->_encryptedPacket;
}

- (void)setEncryptedPacket:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedPacket, a3);
}

- (NSData)channelTopicCommitment
{
  return self->_channelTopicCommitment;
}

- (void)setChannelTopicCommitment:(id)a3
{
  objc_storeStrong((id *)&self->_channelTopicCommitment, a3);
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
  objc_storeStrong((id *)&self->_initializationVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_encryptedPacket, 0);
  objc_storeStrong((id *)&self->_channelTopicCommitment, 0);
}

@end

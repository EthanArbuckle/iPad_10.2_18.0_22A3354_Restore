@implementation SharedChannelProvisionOffGridPacketInfo

- (BOOL)hasPacketId
{
  return self->_packetId != 0;
}

- (BOOL)hasEncryptedPacket
{
  return self->_encryptedPacket != 0;
}

- (void)setPacketExpirationTimestampMillis:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_packetExpirationTimestampMillis = a3;
}

- (void)setHasPacketExpirationTimestampMillis:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPacketExpirationTimestampMillis
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCommitmentSalt
{
  return self->_commitmentSalt != 0;
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
  v8.super_class = (Class)SharedChannelProvisionOffGridPacketInfo;
  -[SharedChannelProvisionOffGridPacketInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SharedChannelProvisionOffGridPacketInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *packetId;
  NSData *encryptedPacket;
  void *v7;
  NSData *commitmentSalt;
  NSData *initializationVector;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  packetId = self->_packetId;
  if (packetId)
    objc_msgSend(v3, "setObject:forKey:", packetId, CFSTR("packet_id"));
  encryptedPacket = self->_encryptedPacket;
  if (encryptedPacket)
    objc_msgSend(v4, "setObject:forKey:", encryptedPacket, CFSTR("encrypted_packet"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetExpirationTimestampMillis);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("packet_expiration_timestamp_millis"));

  }
  commitmentSalt = self->_commitmentSalt;
  if (commitmentSalt)
    objc_msgSend(v4, "setObject:forKey:", commitmentSalt, CFSTR("commitment_salt"));
  initializationVector = self->_initializationVector;
  if (initializationVector)
    objc_msgSend(v4, "setObject:forKey:", initializationVector, CFSTR("initialization_vector"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelProvisionOffGridPacketInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_packetId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_encryptedPacket)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_commitmentSalt)
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
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_packetId)
  {
    objc_msgSend(v4, "setPacketId:");
    v4 = v5;
  }
  if (self->_encryptedPacket)
  {
    objc_msgSend(v5, "setEncryptedPacket:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_packetExpirationTimestampMillis;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_commitmentSalt)
  {
    objc_msgSend(v5, "setCommitmentSalt:");
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
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_packetId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSData copyWithZone:](self->_encryptedPacket, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_packetExpirationTimestampMillis;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v10 = -[NSData copyWithZone:](self->_commitmentSalt, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSData copyWithZone:](self->_initializationVector, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *packetId;
  NSData *encryptedPacket;
  NSData *commitmentSalt;
  NSData *initializationVector;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  packetId = self->_packetId;
  if ((unint64_t)packetId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](packetId, "isEqual:"))
      goto LABEL_15;
  }
  encryptedPacket = self->_encryptedPacket;
  if ((unint64_t)encryptedPacket | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](encryptedPacket, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_packetExpirationTimestampMillis != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  commitmentSalt = self->_commitmentSalt;
  if ((unint64_t)commitmentSalt | *((_QWORD *)v4 + 2)
    && !-[NSData isEqual:](commitmentSalt, "isEqual:"))
  {
    goto LABEL_15;
  }
  initializationVector = self->_initializationVector;
  if ((unint64_t)initializationVector | *((_QWORD *)v4 + 4))
    v9 = -[NSData isEqual:](initializationVector, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_packetId, "hash");
  v4 = -[NSData hash](self->_encryptedPacket, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_packetExpirationTimestampMillis;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSData hash](self->_commitmentSalt, "hash");
  return v6 ^ -[NSData hash](self->_initializationVector, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  v5 = v4;
  if (v4[5])
  {
    -[SharedChannelProvisionOffGridPacketInfo setPacketId:](self, "setPacketId:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[SharedChannelProvisionOffGridPacketInfo setEncryptedPacket:](self, "setEncryptedPacket:");
    v4 = v5;
  }
  if ((v4[6] & 1) != 0)
  {
    self->_packetExpirationTimestampMillis = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[SharedChannelProvisionOffGridPacketInfo setCommitmentSalt:](self, "setCommitmentSalt:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[SharedChannelProvisionOffGridPacketInfo setInitializationVector:](self, "setInitializationVector:");
    v4 = v5;
  }

}

- (NSData)packetId
{
  return self->_packetId;
}

- (void)setPacketId:(id)a3
{
  objc_storeStrong((id *)&self->_packetId, a3);
}

- (NSData)encryptedPacket
{
  return self->_encryptedPacket;
}

- (void)setEncryptedPacket:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedPacket, a3);
}

- (unint64_t)packetExpirationTimestampMillis
{
  return self->_packetExpirationTimestampMillis;
}

- (NSData)commitmentSalt
{
  return self->_commitmentSalt;
}

- (void)setCommitmentSalt:(id)a3
{
  objc_storeStrong((id *)&self->_commitmentSalt, a3);
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
  objc_storeStrong((id *)&self->_packetId, 0);
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_encryptedPacket, 0);
  objc_storeStrong((id *)&self->_commitmentSalt, 0);
}

@end

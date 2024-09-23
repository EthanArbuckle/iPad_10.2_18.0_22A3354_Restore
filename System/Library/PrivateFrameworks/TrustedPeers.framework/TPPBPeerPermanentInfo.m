@implementation TPPBPeerPermanentInfo

- (void)setEpoch:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEpoch
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSigningPubKey
{
  return self->_signingPubKey != 0;
}

- (BOOL)hasEncryptionPubKey
{
  return self->_encryptionPubKey != 0;
}

- (BOOL)hasMachineId
{
  return self->_machineId != 0;
}

- (BOOL)hasModelId
{
  return self->_modelId != 0;
}

- (void)setCreationTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationTime = a3;
}

- (void)setHasCreationTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationTime
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TPPBPeerPermanentInfo;
  -[TPPBPeerPermanentInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerPermanentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *signingPubKey;
  NSData *encryptionPubKey;
  NSString *machineId;
  NSString *modelId;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_epoch);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("epoch"));

  }
  signingPubKey = self->_signingPubKey;
  if (signingPubKey)
    objc_msgSend(v3, "setObject:forKey:", signingPubKey, CFSTR("signing_pub_key"));
  encryptionPubKey = self->_encryptionPubKey;
  if (encryptionPubKey)
    objc_msgSend(v3, "setObject:forKey:", encryptionPubKey, CFSTR("encryption_pub_key"));
  machineId = self->_machineId;
  if (machineId)
    objc_msgSend(v3, "setObject:forKey:", machineId, CFSTR("machine_id"));
  modelId = self->_modelId;
  if (modelId)
    objc_msgSend(v3, "setObject:forKey:", modelId, CFSTR("model_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_creationTime);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("creation_time"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPeerPermanentInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_signingPubKey)
    PBDataWriterWriteDataField();
  if (self->_encryptionPubKey)
    PBDataWriterWriteDataField();
  if (self->_machineId)
    PBDataWriterWriteStringField();
  if (self->_modelId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = self->_epoch;
    *((_BYTE *)v4 + 56) |= 2u;
  }
  v5 = v4;
  if (self->_signingPubKey)
  {
    objc_msgSend(v4, "setSigningPubKey:");
    v4 = v5;
  }
  if (self->_encryptionPubKey)
  {
    objc_msgSend(v5, "setEncryptionPubKey:");
    v4 = v5;
  }
  if (self->_machineId)
  {
    objc_msgSend(v5, "setMachineId:");
    v4 = v5;
  }
  if (self->_modelId)
  {
    objc_msgSend(v5, "setModelId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_creationTime;
    *((_BYTE *)v4 + 56) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_epoch;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v7 = -[NSData copyWithZone:](self->_signingPubKey, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v7;

  v9 = -[NSData copyWithZone:](self->_encryptionPubKey, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_machineId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_modelId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v13;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_creationTime;
    *(_BYTE *)(v6 + 56) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *signingPubKey;
  NSData *encryptionPubKey;
  NSString *machineId;
  NSString *modelId;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_epoch != *((_QWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  signingPubKey = self->_signingPubKey;
  if ((unint64_t)signingPubKey | *((_QWORD *)v4 + 6)
    && !-[NSData isEqual:](signingPubKey, "isEqual:"))
  {
    goto LABEL_19;
  }
  encryptionPubKey = self->_encryptionPubKey;
  if ((unint64_t)encryptionPubKey | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](encryptionPubKey, "isEqual:"))
      goto LABEL_19;
  }
  machineId = self->_machineId;
  if ((unint64_t)machineId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](machineId, "isEqual:"))
      goto LABEL_19;
  }
  modelId = self->_modelId;
  if ((unint64_t)modelId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](modelId, "isEqual:"))
      goto LABEL_19;
  }
  v9 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_creationTime != *((_QWORD *)v4 + 1))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_epoch;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_signingPubKey, "hash");
  v5 = -[NSData hash](self->_encryptionPubKey, "hash");
  v6 = -[NSString hash](self->_machineId, "hash");
  v7 = -[NSString hash](self->_modelId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761u * self->_creationTime;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((v4[7] & 2) != 0)
  {
    self->_epoch = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (v4[6])
  {
    -[TPPBPeerPermanentInfo setSigningPubKey:](self, "setSigningPubKey:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[TPPBPeerPermanentInfo setEncryptionPubKey:](self, "setEncryptionPubKey:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[TPPBPeerPermanentInfo setMachineId:](self, "setMachineId:");
    v4 = v5;
  }
  if (v4[5])
  {
    -[TPPBPeerPermanentInfo setModelId:](self, "setModelId:");
    v4 = v5;
  }
  if ((v4[7] & 1) != 0)
  {
    self->_creationTime = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (NSData)signingPubKey
{
  return self->_signingPubKey;
}

- (void)setSigningPubKey:(id)a3
{
  objc_storeStrong((id *)&self->_signingPubKey, a3);
}

- (NSData)encryptionPubKey
{
  return self->_encryptionPubKey;
}

- (void)setEncryptionPubKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionPubKey, a3);
}

- (NSString)machineId
{
  return self->_machineId;
}

- (void)setMachineId:(id)a3
{
  objc_storeStrong((id *)&self->_machineId, a3);
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
  objc_storeStrong((id *)&self->_modelId, a3);
}

- (unint64_t)creationTime
{
  return self->_creationTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingPubKey, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
  objc_storeStrong((id *)&self->_machineId, 0);
  objc_storeStrong((id *)&self->_encryptionPubKey, 0);
}

@end

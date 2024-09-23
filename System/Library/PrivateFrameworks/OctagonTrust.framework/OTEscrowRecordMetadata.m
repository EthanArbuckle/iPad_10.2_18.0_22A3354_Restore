@implementation OTEscrowRecordMetadata

- (BOOL)hasBackupKeybagDigest
{
  return self->_backupKeybagDigest != 0;
}

- (BOOL)hasClientMetadata
{
  return self->_clientMetadata != 0;
}

- (void)setSecureBackupUsesMultipleIcscs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_secureBackupUsesMultipleIcscs = a3;
}

- (void)setHasSecureBackupUsesMultipleIcscs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSecureBackupUsesMultipleIcscs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasBottleId
{
  return self->_bottleId != 0;
}

- (void)setSecureBackupTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_secureBackupTimestamp = a3;
}

- (void)setHasSecureBackupTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecureBackupTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEscrowedSpki
{
  return self->_escrowedSpki != 0;
}

- (BOOL)hasPeerInfo
{
  return self->_peerInfo != 0;
}

- (BOOL)hasBottleValidity
{
  return self->_bottleValidity != 0;
}

- (BOOL)hasSerial
{
  return self->_serial != 0;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasPasscodeGeneration
{
  return self->_passcodeGeneration != 0;
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
  v8.super_class = (Class)OTEscrowRecordMetadata;
  -[OTEscrowRecordMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTEscrowRecordMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *backupKeybagDigest;
  OTEscrowRecordMetadataClientMetadata *clientMetadata;
  void *v7;
  void *v8;
  NSString *bottleId;
  void *v10;
  NSData *escrowedSpki;
  NSData *peerInfo;
  NSString *bottleValidity;
  NSString *serial;
  NSString *build;
  OTEscrowRecordMetadataPasscodeGeneration *passcodeGeneration;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  backupKeybagDigest = self->_backupKeybagDigest;
  if (backupKeybagDigest)
    objc_msgSend(v3, "setObject:forKey:", backupKeybagDigest, CFSTR("backup_keybag_digest"));
  clientMetadata = self->_clientMetadata;
  if (clientMetadata)
  {
    -[OTEscrowRecordMetadataClientMetadata dictionaryRepresentation](clientMetadata, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("client_metadata"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_secureBackupUsesMultipleIcscs);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("secure_backup_uses_multiple_icscs"));

  }
  bottleId = self->_bottleId;
  if (bottleId)
    objc_msgSend(v4, "setObject:forKey:", bottleId, CFSTR("bottle_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_secureBackupTimestamp);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("secure_backup_timestamp"));

  }
  escrowedSpki = self->_escrowedSpki;
  if (escrowedSpki)
    objc_msgSend(v4, "setObject:forKey:", escrowedSpki, CFSTR("escrowed_spki"));
  peerInfo = self->_peerInfo;
  if (peerInfo)
    objc_msgSend(v4, "setObject:forKey:", peerInfo, CFSTR("peer_info"));
  bottleValidity = self->_bottleValidity;
  if (bottleValidity)
    objc_msgSend(v4, "setObject:forKey:", bottleValidity, CFSTR("bottle_validity"));
  serial = self->_serial;
  if (serial)
    objc_msgSend(v4, "setObject:forKey:", serial, CFSTR("serial"));
  build = self->_build;
  if (build)
    objc_msgSend(v4, "setObject:forKey:", build, CFSTR("build"));
  passcodeGeneration = self->_passcodeGeneration;
  if (passcodeGeneration)
  {
    -[OTEscrowRecordMetadataPasscodeGeneration dictionaryRepresentation](passcodeGeneration, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("passcodeGeneration"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTEscrowRecordMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_backupKeybagDigest)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_clientMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_bottleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_escrowedSpki)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_peerInfo)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_bottleValidity)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_serial)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_passcodeGeneration)
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
  if (self->_backupKeybagDigest)
  {
    objc_msgSend(v4, "setBackupKeybagDigest:");
    v4 = v5;
  }
  if (self->_clientMetadata)
  {
    objc_msgSend(v5, "setClientMetadata:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_secureBackupUsesMultipleIcscs;
    *((_BYTE *)v4 + 96) |= 2u;
  }
  if (self->_bottleId)
  {
    objc_msgSend(v5, "setBottleId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_secureBackupTimestamp;
    *((_BYTE *)v4 + 96) |= 1u;
  }
  if (self->_escrowedSpki)
  {
    objc_msgSend(v5, "setEscrowedSpki:");
    v4 = v5;
  }
  if (self->_peerInfo)
  {
    objc_msgSend(v5, "setPeerInfo:");
    v4 = v5;
  }
  if (self->_bottleValidity)
  {
    objc_msgSend(v5, "setBottleValidity:");
    v4 = v5;
  }
  if (self->_serial)
  {
    objc_msgSend(v5, "setSerial:");
    v4 = v5;
  }
  if (self->_build)
  {
    objc_msgSend(v5, "setBuild:");
    v4 = v5;
  }
  if (self->_passcodeGeneration)
  {
    objc_msgSend(v5, "setPasscodeGeneration:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_backupKeybagDigest, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[OTEscrowRecordMetadataClientMetadata copyWithZone:](self->_clientMetadata, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_secureBackupUsesMultipleIcscs;
    *(_BYTE *)(v5 + 96) |= 2u;
  }
  v10 = -[NSString copyWithZone:](self->_bottleId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_secureBackupTimestamp;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  v12 = -[NSData copyWithZone:](self->_escrowedSpki, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[NSData copyWithZone:](self->_peerInfo, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v14;

  v16 = -[NSString copyWithZone:](self->_bottleValidity, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  v18 = -[NSString copyWithZone:](self->_serial, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v18;

  v20 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v20;

  v22 = -[OTEscrowRecordMetadataPasscodeGeneration copyWithZone:](self->_passcodeGeneration, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v22;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *backupKeybagDigest;
  OTEscrowRecordMetadataClientMetadata *clientMetadata;
  char has;
  char v8;
  NSString *bottleId;
  NSData *escrowedSpki;
  NSData *peerInfo;
  NSString *bottleValidity;
  NSString *serial;
  NSString *build;
  OTEscrowRecordMetadataPasscodeGeneration *passcodeGeneration;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  backupKeybagDigest = self->_backupKeybagDigest;
  if ((unint64_t)backupKeybagDigest | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](backupKeybagDigest, "isEqual:"))
      goto LABEL_31;
  }
  clientMetadata = self->_clientMetadata;
  if ((unint64_t)clientMetadata | *((_QWORD *)v4 + 7))
  {
    if (!-[OTEscrowRecordMetadataClientMetadata isEqual:](clientMetadata, "isEqual:"))
      goto LABEL_31;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 96);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_secureBackupUsesMultipleIcscs != *((_QWORD *)v4 + 2))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_31;
  }
  bottleId = self->_bottleId;
  if ((unint64_t)bottleId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](bottleId, "isEqual:"))
    {
LABEL_31:
      v16 = 0;
      goto LABEL_32;
    }
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 96);
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_secureBackupTimestamp != *((_QWORD *)v4 + 1))
      goto LABEL_31;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_31;
  }
  escrowedSpki = self->_escrowedSpki;
  if ((unint64_t)escrowedSpki | *((_QWORD *)v4 + 8)
    && !-[NSData isEqual:](escrowedSpki, "isEqual:"))
  {
    goto LABEL_31;
  }
  peerInfo = self->_peerInfo;
  if ((unint64_t)peerInfo | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](peerInfo, "isEqual:"))
      goto LABEL_31;
  }
  bottleValidity = self->_bottleValidity;
  if ((unint64_t)bottleValidity | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](bottleValidity, "isEqual:"))
      goto LABEL_31;
  }
  serial = self->_serial;
  if ((unint64_t)serial | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](serial, "isEqual:"))
      goto LABEL_31;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](build, "isEqual:"))
      goto LABEL_31;
  }
  passcodeGeneration = self->_passcodeGeneration;
  if ((unint64_t)passcodeGeneration | *((_QWORD *)v4 + 9))
    v16 = -[OTEscrowRecordMetadataPasscodeGeneration isEqual:](passcodeGeneration, "isEqual:");
  else
    v16 = 1;
LABEL_32:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;

  v3 = -[NSData hash](self->_backupKeybagDigest, "hash");
  v4 = -[OTEscrowRecordMetadataClientMetadata hash](self->_clientMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761u * self->_secureBackupUsesMultipleIcscs;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_bottleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_secureBackupTimestamp;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSData hash](self->_escrowedSpki, "hash");
  v10 = v8 ^ v9 ^ -[NSData hash](self->_peerInfo, "hash");
  v11 = -[NSString hash](self->_bottleValidity, "hash");
  v12 = v11 ^ -[NSString hash](self->_serial, "hash");
  v13 = v12 ^ -[NSString hash](self->_build, "hash");
  return v10 ^ v13 ^ -[OTEscrowRecordMetadataPasscodeGeneration hash](self->_passcodeGeneration, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  OTEscrowRecordMetadataClientMetadata *clientMetadata;
  uint64_t v6;
  OTEscrowRecordMetadataPasscodeGeneration *passcodeGeneration;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[3])
  {
    -[OTEscrowRecordMetadata setBackupKeybagDigest:](self, "setBackupKeybagDigest:");
    v4 = v9;
  }
  clientMetadata = self->_clientMetadata;
  v6 = v4[7];
  if (clientMetadata)
  {
    if (!v6)
      goto LABEL_9;
    -[OTEscrowRecordMetadataClientMetadata mergeFrom:](clientMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[OTEscrowRecordMetadata setClientMetadata:](self, "setClientMetadata:");
  }
  v4 = v9;
LABEL_9:
  if ((v4[12] & 2) != 0)
  {
    self->_secureBackupUsesMultipleIcscs = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (v4[4])
  {
    -[OTEscrowRecordMetadata setBottleId:](self, "setBottleId:");
    v4 = v9;
  }
  if ((v4[12] & 1) != 0)
  {
    self->_secureBackupTimestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[8])
  {
    -[OTEscrowRecordMetadata setEscrowedSpki:](self, "setEscrowedSpki:");
    v4 = v9;
  }
  if (v4[10])
  {
    -[OTEscrowRecordMetadata setPeerInfo:](self, "setPeerInfo:");
    v4 = v9;
  }
  if (v4[5])
  {
    -[OTEscrowRecordMetadata setBottleValidity:](self, "setBottleValidity:");
    v4 = v9;
  }
  if (v4[11])
  {
    -[OTEscrowRecordMetadata setSerial:](self, "setSerial:");
    v4 = v9;
  }
  if (v4[6])
  {
    -[OTEscrowRecordMetadata setBuild:](self, "setBuild:");
    v4 = v9;
  }
  passcodeGeneration = self->_passcodeGeneration;
  v8 = v4[9];
  if (passcodeGeneration)
  {
    if (v8)
    {
      -[OTEscrowRecordMetadataPasscodeGeneration mergeFrom:](passcodeGeneration, "mergeFrom:");
LABEL_30:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[OTEscrowRecordMetadata setPasscodeGeneration:](self, "setPasscodeGeneration:");
    goto LABEL_30;
  }

}

- (NSData)backupKeybagDigest
{
  return self->_backupKeybagDigest;
}

- (void)setBackupKeybagDigest:(id)a3
{
  objc_storeStrong((id *)&self->_backupKeybagDigest, a3);
}

- (OTEscrowRecordMetadataClientMetadata)clientMetadata
{
  return self->_clientMetadata;
}

- (void)setClientMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_clientMetadata, a3);
}

- (unint64_t)secureBackupUsesMultipleIcscs
{
  return self->_secureBackupUsesMultipleIcscs;
}

- (NSString)bottleId
{
  return self->_bottleId;
}

- (void)setBottleId:(id)a3
{
  objc_storeStrong((id *)&self->_bottleId, a3);
}

- (unint64_t)secureBackupTimestamp
{
  return self->_secureBackupTimestamp;
}

- (NSData)escrowedSpki
{
  return self->_escrowedSpki;
}

- (void)setEscrowedSpki:(id)a3
{
  objc_storeStrong((id *)&self->_escrowedSpki, a3);
}

- (NSData)peerInfo
{
  return self->_peerInfo;
}

- (void)setPeerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_peerInfo, a3);
}

- (NSString)bottleValidity
{
  return self->_bottleValidity;
}

- (void)setBottleValidity:(id)a3
{
  objc_storeStrong((id *)&self->_bottleValidity, a3);
}

- (NSString)serial
{
  return self->_serial;
}

- (void)setSerial:(id)a3
{
  objc_storeStrong((id *)&self->_serial, a3);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (OTEscrowRecordMetadataPasscodeGeneration)passcodeGeneration
{
  return self->_passcodeGeneration;
}

- (void)setPasscodeGeneration:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeGeneration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serial, 0);
  objc_storeStrong((id *)&self->_peerInfo, 0);
  objc_storeStrong((id *)&self->_passcodeGeneration, 0);
  objc_storeStrong((id *)&self->_escrowedSpki, 0);
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_bottleValidity, 0);
  objc_storeStrong((id *)&self->_bottleId, 0);
  objc_storeStrong((id *)&self->_backupKeybagDigest, 0);
}

@end

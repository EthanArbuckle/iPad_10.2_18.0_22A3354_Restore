@implementation NETSchemaNETNetworkConnectionStateReadySnapshotCaptured

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasConnectionInfo
{
  return self->_connectionInfo != 0;
}

- (void)deleteConnectionInfo
{
  -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured setConnectionInfo:](self, "setConnectionInfo:", 0);
}

- (void)setConnectionEstablishmentPreviousAttemptCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_connectionEstablishmentPreviousAttemptCount = a3;
}

- (BOOL)hasConnectionEstablishmentPreviousAttemptCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConnectionEstablishmentPreviousAttemptCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteConnectionEstablishmentPreviousAttemptCount
{
  -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured setConnectionEstablishmentPreviousAttemptCount:](self, "setConnectionEstablishmentPreviousAttemptCount:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setConnectionEstablishmentAttemptDelay:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_connectionEstablishmentAttemptDelay = a3;
}

- (BOOL)hasConnectionEstablishmentAttemptDelay
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasConnectionEstablishmentAttemptDelay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteConnectionEstablishmentAttemptDelay
{
  -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured setConnectionEstablishmentAttemptDelay:](self, "setConnectionEstablishmentAttemptDelay:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETNetworkConnectionStateReadySnapshotCapturedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  id v7;

  v7 = a3;
  -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured connectionInfo](self, "connectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $AEA512359A756F3D67654F283937F996 has;
  unsigned int v14;
  unsigned int connectionEstablishmentPreviousAttemptCount;
  int v16;
  unsigned int connectionEstablishmentAttemptDelay;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured connectionInfo](self, "connectionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured connectionInfo](self, "connectionInfo");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured connectionInfo](self, "connectionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    connectionEstablishmentPreviousAttemptCount = self->_connectionEstablishmentPreviousAttemptCount;
    if (connectionEstablishmentPreviousAttemptCount == objc_msgSend(v4, "connectionEstablishmentPreviousAttemptCount"))
    {
      has = self->_has;
      v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v16)
  {
    connectionEstablishmentAttemptDelay = self->_connectionEstablishmentAttemptDelay;
    if (connectionEstablishmentAttemptDelay != objc_msgSend(v4, "connectionEstablishmentAttemptDelay"))
      goto LABEL_16;
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_connectionInfo, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_connectionEstablishmentPreviousAttemptCount;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_connectionEstablishmentAttemptDelay;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured connectionEstablishmentAttemptDelay](self, "connectionEstablishmentAttemptDelay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("connectionEstablishmentAttemptDelay"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured connectionEstablishmentPreviousAttemptCount](self, "connectionEstablishmentPreviousAttemptCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("connectionEstablishmentPreviousAttemptCount"));

  }
  if (self->_connectionInfo)
  {
    -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured connectionInfo](self, "connectionInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("connectionInfo"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NETSchemaNETNetworkConnectionStateReadySnapshotCaptured;
  v5 = -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured setConnectionInfo:](v5, "setConnectionInfo:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionEstablishmentPreviousAttemptCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured setConnectionEstablishmentPreviousAttemptCount:](v5, "setConnectionEstablishmentPreviousAttemptCount:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionEstablishmentAttemptDelay"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured setConnectionEstablishmentAttemptDelay:](v5, "setConnectionEstablishmentAttemptDelay:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (NSString)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)connectionEstablishmentPreviousAttemptCount
{
  return self->_connectionEstablishmentPreviousAttemptCount;
}

- (unsigned)connectionEstablishmentAttemptDelay
{
  return self->_connectionEstablishmentAttemptDelay;
}

- (void)setHasConnectionInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInfo, 0);
}

@end

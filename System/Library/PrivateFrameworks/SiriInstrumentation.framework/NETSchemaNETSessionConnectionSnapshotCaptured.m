@implementation NETSchemaNETSessionConnectionSnapshotCaptured

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NETSchemaNETSessionConnectionSnapshotCaptured;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETSessionConnectionSnapshotCaptured network](self, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NETSchemaNETSessionConnectionSnapshotCaptured deleteNetwork](self, "deleteNetwork");
  -[NETSchemaNETSessionConnectionSnapshotCaptured networkInterfaces](self, "networkInterfaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETSessionConnectionSnapshotCaptured setNetworkInterfaces:](self, "setNetworkInterfaces:", v10);

  return v5;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (BOOL)hasSequenceNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSequenceNumber
{
  -[NETSchemaNETSessionConnectionSnapshotCaptured setSequenceNumber:](self, "setSequenceNumber:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSnapshotTriggerReason:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_snapshotTriggerReason = a3;
}

- (BOOL)hasSnapshotTriggerReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSnapshotTriggerReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSnapshotTriggerReason
{
  -[NETSchemaNETSessionConnectionSnapshotCaptured setSnapshotTriggerReason:](self, "setSnapshotTriggerReason:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasNetwork
{
  return self->_network != 0;
}

- (void)deleteNetwork
{
  -[NETSchemaNETSessionConnectionSnapshotCaptured setNetwork:](self, "setNetwork:", 0);
}

- (void)clearNetworkInterfaces
{
  -[NSArray removeAllObjects](self->_networkInterfaces, "removeAllObjects");
}

- (void)addNetworkInterfaces:(id)a3
{
  id v4;
  NSArray *networkInterfaces;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  networkInterfaces = self->_networkInterfaces;
  v8 = v4;
  if (!networkInterfaces)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_networkInterfaces;
    self->_networkInterfaces = v6;

    v4 = v8;
    networkInterfaces = self->_networkInterfaces;
  }
  -[NSArray addObject:](networkInterfaces, "addObject:", v4);

}

- (unint64_t)networkInterfacesCount
{
  return -[NSArray count](self->_networkInterfaces, "count");
}

- (id)networkInterfacesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_networkInterfaces, "objectAtIndexedSubscript:", a3);
}

- (void)setProvider:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_provider = a3;
}

- (BOOL)hasProvider
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasProvider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteProvider
{
  -[NETSchemaNETSessionConnectionSnapshotCaptured setProvider:](self, "setProvider:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETSessionConnectionSnapshotCapturedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[NETSchemaNETSessionConnectionSnapshotCaptured network](self, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NETSchemaNETSessionConnectionSnapshotCaptured network](self, "network");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_networkInterfaces;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $3FE4AC2A28AB7145BB3CBBF3A232859D has;
  unsigned int v6;
  unsigned int sequenceNumber;
  int v8;
  int snapshotTriggerReason;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  int v24;
  int provider;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = self->_has;
  v6 = v4[36];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    sequenceNumber = self->_sequenceNumber;
    if (sequenceNumber != objc_msgSend(v4, "sequenceNumber"))
      goto LABEL_19;
    has = self->_has;
    v6 = v4[36];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_19;
  if (v8)
  {
    snapshotTriggerReason = self->_snapshotTriggerReason;
    if (snapshotTriggerReason != objc_msgSend(v4, "snapshotTriggerReason"))
      goto LABEL_19;
  }
  -[NETSchemaNETSessionConnectionSnapshotCaptured network](self, "network");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "network");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_18;
  -[NETSchemaNETSessionConnectionSnapshotCaptured network](self, "network");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NETSchemaNETSessionConnectionSnapshotCaptured network](self, "network");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "network");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_19;
  }
  else
  {

  }
  -[NETSchemaNETSessionConnectionSnapshotCaptured networkInterfaces](self, "networkInterfaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkInterfaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[NETSchemaNETSessionConnectionSnapshotCaptured networkInterfaces](self, "networkInterfaces");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[NETSchemaNETSessionConnectionSnapshotCaptured networkInterfaces](self, "networkInterfaces");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkInterfaces");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_19;
  }
  else
  {

  }
  v24 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v24 == ((v4[36] >> 2) & 1))
  {
    if (!v24 || (provider = self->_provider, provider == objc_msgSend(v4, "provider")))
    {
      v22 = 1;
      goto LABEL_20;
    }
  }
LABEL_19:
  v22 = 0;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_sequenceNumber;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_snapshotTriggerReason;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NETSchemaNETSessionConnectionNetwork hash](self->_network, "hash");
  v6 = -[NSArray hash](self->_networkInterfaces, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_provider;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char has;
  int v16;
  const __CFString *v17;
  const __CFString *v18;
  unsigned int v20;
  const __CFString *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_network)
  {
    -[NETSchemaNETSessionConnectionSnapshotCaptured network](self, "network");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("network"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("network"));

    }
  }
  if (-[NSArray count](self->_networkInterfaces, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = self->_networkInterfaces;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("networkInterfaces"));
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v20 = -[NETSchemaNETSessionConnectionSnapshotCaptured provider](self, "provider") - 1;
    if (v20 > 4)
      v21 = CFSTR("NETPROVIDER_UNKNOWN");
    else
      v21 = off_1E56319C0[v20];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("provider"), (_QWORD)v23);
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_20:
      if ((has & 2) == 0)
        goto LABEL_27;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETSessionConnectionSnapshotCaptured sequenceNumber](self, "sequenceNumber", (_QWORD)v23));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("sequenceNumber"));

  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_27;
LABEL_21:
  v16 = -[NETSchemaNETSessionConnectionSnapshotCaptured snapshotTriggerReason](self, "snapshotTriggerReason", (_QWORD)v23);
  v17 = CFSTR("NETSNAPSHOTSTATE_UNKNOWN");
  if (v16 == 1)
    v17 = CFSTR("NETSNAPSHOTSTATE_SIRI_REQUEST_END");
  if (v16 == 2)
    v18 = CFSTR("NETSNAPSHOTSTATE_SESSION_FAILED");
  else
    v18 = v17;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("snapshotTriggerReason"));
LABEL_27:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v23);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETSessionConnectionSnapshotCaptured dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETSessionConnectionSnapshotCaptured)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETSessionConnectionSnapshotCaptured *v5;
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
    self = -[NETSchemaNETSessionConnectionSnapshotCaptured initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETSessionConnectionSnapshotCaptured)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETSessionConnectionSnapshotCaptured *v5;
  void *v6;
  void *v7;
  void *v8;
  NETSchemaNETSessionConnectionNetwork *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NETSchemaNETNetworkInterface *v17;
  void *v18;
  NETSchemaNETSessionConnectionSnapshotCaptured *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NETSchemaNETSessionConnectionSnapshotCaptured;
  v5 = -[NETSchemaNETSessionConnectionSnapshotCaptured init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionSnapshotCaptured setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snapshotTriggerReason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionSnapshotCaptured setSnapshotTriggerReason:](v5, "setSnapshotTriggerReason:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("network"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NETSchemaNETSessionConnectionNetwork initWithDictionary:]([NETSchemaNETSessionConnectionNetwork alloc], "initWithDictionary:", v8);
      -[NETSchemaNETSessionConnectionSnapshotCaptured setNetwork:](v5, "setNetwork:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkInterfaces"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v8;
      v22 = v6;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[NETSchemaNETNetworkInterface initWithDictionary:]([NETSchemaNETNetworkInterface alloc], "initWithDictionary:", v16);
              -[NETSchemaNETSessionConnectionSnapshotCaptured addNetworkInterfaces:](v5, "addNetworkInterfaces:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v13);
      }

      v6 = v22;
      v8 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("provider"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionSnapshotCaptured setProvider:](v5, "setProvider:", objc_msgSend(v18, "intValue"));
    v19 = v5;

  }
  return v5;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int)snapshotTriggerReason
{
  return self->_snapshotTriggerReason;
}

- (NETSchemaNETSessionConnectionNetwork)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (NSArray)networkInterfaces
{
  return self->_networkInterfaces;
}

- (void)setNetworkInterfaces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)provider
{
  return self->_provider;
}

- (void)setHasNetwork:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkInterfaces, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

@end

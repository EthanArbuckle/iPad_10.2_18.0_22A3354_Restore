@implementation NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured

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
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v14, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured resolutions](self, "resolutions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured setResolutions:](self, "setResolutions:", v7);

  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured proxyConfiguration](self, "proxyConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suppressMessage");

  if (v10)
    -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured deleteProxyConfiguration](self, "deleteProxyConfiguration");
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured connectionEstablishmentProtocols](self, "connectionEstablishmentProtocols");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured setConnectionEstablishmentProtocols:](self, "setConnectionEstablishmentProtocols:", v12);

  return v5;
}

- (void)clearResolution
{
  -[NSArray removeAllObjects](self->_resolutions, "removeAllObjects");
}

- (void)addResolution:(id)a3
{
  id v4;
  NSArray *resolutions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  resolutions = self->_resolutions;
  v8 = v4;
  if (!resolutions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_resolutions;
    self->_resolutions = v6;

    v4 = v8;
    resolutions = self->_resolutions;
  }
  -[NSArray addObject:](resolutions, "addObject:", v4);

}

- (unint64_t)resolutionCount
{
  return -[NSArray count](self->_resolutions, "count");
}

- (id)resolutionAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_resolutions, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasProxyConfiguration
{
  return self->_proxyConfiguration != 0;
}

- (void)deleteProxyConfiguration
{
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured setProxyConfiguration:](self, "setProxyConfiguration:", 0);
}

- (void)setDurationInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_durationInMs = a3;
}

- (BOOL)hasDurationInMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDurationInMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDurationInMs
{
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured setDurationInMs:](self, "setDurationInMs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearConnectionEstablishmentProtocols
{
  -[NSArray removeAllObjects](self->_connectionEstablishmentProtocols, "removeAllObjects");
}

- (void)addConnectionEstablishmentProtocols:(id)a3
{
  id v4;
  NSArray *connectionEstablishmentProtocols;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  connectionEstablishmentProtocols = self->_connectionEstablishmentProtocols;
  v8 = v4;
  if (!connectionEstablishmentProtocols)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_connectionEstablishmentProtocols;
    self->_connectionEstablishmentProtocols = v6;

    v4 = v8;
    connectionEstablishmentProtocols = self->_connectionEstablishmentProtocols;
  }
  -[NSArray addObject:](connectionEstablishmentProtocols, "addObject:", v4);

}

- (unint64_t)connectionEstablishmentProtocolsCount
{
  return -[NSArray count](self->_connectionEstablishmentProtocols, "count");
}

- (id)connectionEstablishmentProtocolsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_connectionEstablishmentProtocols, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugNetworkConnectionStateReadySnapshotCapturedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_resolutions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured proxyConfiguration](self, "proxyConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured proxyConfiguration](self, "proxyConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_connectionEstablishmentProtocols;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t durationInMs;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured resolutions](self, "resolutions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolutions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured resolutions](self, "resolutions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured resolutions](self, "resolutions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolutions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured proxyConfiguration](self, "proxyConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxyConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured proxyConfiguration](self, "proxyConfiguration");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured proxyConfiguration](self, "proxyConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxyConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    durationInMs = self->_durationInMs;
    if (durationInMs != objc_msgSend(v4, "durationInMs"))
      goto LABEL_20;
  }
  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured connectionEstablishmentProtocols](self, "connectionEstablishmentProtocols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionEstablishmentProtocols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured connectionEstablishmentProtocols](self, "connectionEstablishmentProtocols");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured connectionEstablishmentProtocols](self, "connectionEstablishmentProtocols");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectionEstablishmentProtocols");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSArray hash](self->_resolutions, "hash");
  v4 = -[NETSchemaNETProxyConfiguration hash](self->_proxyConfiguration, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_durationInMs;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_connectionEstablishmentProtocols, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_connectionEstablishmentProtocols, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = self->_connectionEstablishmentProtocols;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("connectionEstablishmentProtocols"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured durationInMs](self, "durationInMs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("durationInMs"));

  }
  if (self->_proxyConfiguration)
  {
    -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured proxyConfiguration](self, "proxyConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("proxyConfiguration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("proxyConfiguration"));

    }
  }
  if (-[NSArray count](self->_resolutions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = self->_resolutions;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v25);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v16, "addObject:", v22);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v23);

          }
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("resolution"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v25);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *v5;
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
    self = -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NETSchemaNETEstablishmentResolution *v13;
  void *v14;
  NETSchemaNETProxyConfiguration *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  NETSchemaNETHandShakeProtocol *v24;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *v25;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured;
  v5 = -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolution"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v34 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[NETSchemaNETEstablishmentResolution initWithDictionary:]([NETSchemaNETEstablishmentResolution alloc], "initWithDictionary:", v12);
              -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured addResolution:](v5, "addResolution:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("proxyConfiguration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[NETSchemaNETProxyConfiguration initWithDictionary:]([NETSchemaNETProxyConfiguration alloc], "initWithDictionary:", v14);
      -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured setProxyConfiguration:](v5, "setProxyConfiguration:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("durationInMs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured setDurationInMs:](v5, "setDurationInMs:", objc_msgSend(v16, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionEstablishmentProtocols"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v6;
      v28 = v4;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = -[NETSchemaNETHandShakeProtocol initWithDictionary:]([NETSchemaNETHandShakeProtocol alloc], "initWithDictionary:", v23);
              -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured addConnectionEstablishmentProtocols:](v5, "addConnectionEstablishmentProtocols:", v24);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        }
        while (v20);
      }

      v6 = v27;
      v4 = v28;
    }
    v25 = v5;

  }
  return v5;
}

- (NSArray)resolutions
{
  return self->_resolutions;
}

- (void)setResolutions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NETSchemaNETProxyConfiguration)proxyConfiguration
{
  return self->_proxyConfiguration;
}

- (void)setProxyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_proxyConfiguration, a3);
}

- (unint64_t)durationInMs
{
  return self->_durationInMs;
}

- (NSArray)connectionEstablishmentProtocols
{
  return self->_connectionEstablishmentProtocols;
}

- (void)setConnectionEstablishmentProtocols:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasProxyConfiguration:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionEstablishmentProtocols, 0);
  objc_storeStrong((id *)&self->_proxyConfiguration, 0);
  objc_storeStrong((id *)&self->_resolutions, 0);
}

@end

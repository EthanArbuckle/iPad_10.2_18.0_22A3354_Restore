@implementation NETSchemaNETDebugSessionConnectionSnapshotCaptured

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
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NETSchemaNETDebugSessionConnectionSnapshotCaptured;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v18, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured network](self, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured deleteNetwork](self, "deleteNetwork");
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured networkInterfaces](self, "networkInterfaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured setNetworkInterfaces:](self, "setNetworkInterfaces:", v10);

  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured pingInfo](self, "pingInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured deletePingInfo](self, "deletePingInfo");
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured quality](self, "quality");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySensitiveConditionsPolicy:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "suppressMessage");

  if (v16)
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured deleteQuality](self, "deleteQuality");

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
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured setSequenceNumber:](self, "setSequenceNumber:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasNetwork
{
  return self->_network != 0;
}

- (void)deleteNetwork
{
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured setNetwork:](self, "setNetwork:", 0);
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

- (BOOL)hasPingInfo
{
  return self->_pingInfo != 0;
}

- (void)deletePingInfo
{
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured setPingInfo:](self, "setPingInfo:", 0);
}

- (BOOL)hasQuality
{
  return self->_quality != 0;
}

- (void)deleteQuality
{
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured setQuality:](self, "setQuality:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugSessionConnectionSnapshotCapturedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured network](self, "network");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_networkInterfaces;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured pingInfo](self, "pingInfo", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured pingInfo](self, "pingInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured quality](self, "quality");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured quality](self, "quality");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int sequenceNumber;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    sequenceNumber = self->_sequenceNumber;
    if (sequenceNumber != objc_msgSend(v4, "sequenceNumber"))
      goto LABEL_25;
  }
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured network](self, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_24;
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured network](self, "network");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured network](self, "network");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "network");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_25;
  }
  else
  {

  }
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured networkInterfaces](self, "networkInterfaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkInterfaces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_24;
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured networkInterfaces](self, "networkInterfaces");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured networkInterfaces](self, "networkInterfaces");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkInterfaces");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_25;
  }
  else
  {

  }
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured pingInfo](self, "pingInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pingInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_24;
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured pingInfo](self, "pingInfo");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured pingInfo](self, "pingInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pingInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_25;
  }
  else
  {

  }
  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured quality](self, "quality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quality");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured quality](self, "quality");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_28:
      v28 = 1;
      goto LABEL_26;
    }
    v24 = (void *)v23;
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured quality](self, "quality");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quality");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_28;
  }
  else
  {
LABEL_24:

  }
LABEL_25:
  v28 = 0;
LABEL_26:

  return v28;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_sequenceNumber;
  else
    v3 = 0;
  v4 = -[NETSchemaNETDebugSessionConnectionNetwork hash](self->_network, "hash") ^ v3;
  v5 = -[NSArray hash](self->_networkInterfaces, "hash");
  v6 = v4 ^ v5 ^ -[NETSchemaNETDebugSessionConnectionPingInfo hash](self->_pingInfo, "hash");
  return v6 ^ -[NETSchemaNETDebugSessionConnectionQuality hash](self->_quality, "hash");
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured network](self, "network");
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
  if (self->_pingInfo)
  {
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured pingInfo](self, "pingInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("pingInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("pingInfo"));

    }
  }
  if (self->_quality)
  {
    -[NETSchemaNETDebugSessionConnectionSnapshotCaptured quality](self, "quality");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("quality"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("quality"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugSessionConnectionSnapshotCaptured sequenceNumber](self, "sequenceNumber"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("sequenceNumber"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v23);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETDebugSessionConnectionSnapshotCaptured dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *v5;
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
    self = -[NETSchemaNETDebugSessionConnectionSnapshotCaptured initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *v5;
  void *v6;
  void *v7;
  NETSchemaNETDebugSessionConnectionNetwork *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NETSchemaNETDebugNetworkInterface *v16;
  void *v17;
  NETSchemaNETDebugSessionConnectionPingInfo *v18;
  void *v19;
  NETSchemaNETDebugSessionConnectionQuality *v20;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NETSchemaNETDebugSessionConnectionSnapshotCaptured;
  v5 = -[NETSchemaNETDebugSessionConnectionSnapshotCaptured init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugSessionConnectionSnapshotCaptured setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("network"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[NETSchemaNETDebugSessionConnectionNetwork initWithDictionary:]([NETSchemaNETDebugSessionConnectionNetwork alloc], "initWithDictionary:", v7);
      -[NETSchemaNETDebugSessionConnectionSnapshotCaptured setNetwork:](v5, "setNetwork:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkInterfaces"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v7;
      v24 = v6;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[NETSchemaNETDebugNetworkInterface initWithDictionary:]([NETSchemaNETDebugNetworkInterface alloc], "initWithDictionary:", v15);
              -[NETSchemaNETDebugSessionConnectionSnapshotCaptured addNetworkInterfaces:](v5, "addNetworkInterfaces:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v12);
      }

      v7 = v23;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pingInfo"), v23, v24, (_QWORD)v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[NETSchemaNETDebugSessionConnectionPingInfo initWithDictionary:]([NETSchemaNETDebugSessionConnectionPingInfo alloc], "initWithDictionary:", v17);
      -[NETSchemaNETDebugSessionConnectionSnapshotCaptured setPingInfo:](v5, "setPingInfo:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("quality"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[NETSchemaNETDebugSessionConnectionQuality initWithDictionary:]([NETSchemaNETDebugSessionConnectionQuality alloc], "initWithDictionary:", v19);
      -[NETSchemaNETDebugSessionConnectionSnapshotCaptured setQuality:](v5, "setQuality:", v20);

    }
    v21 = v5;

  }
  return v5;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NETSchemaNETDebugSessionConnectionNetwork)network
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

- (NETSchemaNETDebugSessionConnectionPingInfo)pingInfo
{
  return self->_pingInfo;
}

- (void)setPingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_pingInfo, a3);
}

- (NETSchemaNETDebugSessionConnectionQuality)quality
{
  return self->_quality;
}

- (void)setQuality:(id)a3
{
  objc_storeStrong((id *)&self->_quality, a3);
}

- (void)setHasNetwork:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPingInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_pingInfo, 0);
  objc_storeStrong((id *)&self->_networkInterfaces, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

@end

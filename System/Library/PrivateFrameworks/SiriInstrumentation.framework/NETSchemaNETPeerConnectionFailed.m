@implementation NETSchemaNETPeerConnectionFailed

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NETSchemaNETPeerConnectionFailed;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETPeerConnectionFailed connectedBtDevices](self, "connectedBtDevices", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NETSchemaNETPeerConnectionFailed setConnectedBtDevices:](self, "setConnectedBtDevices:", v7);
  return v5;
}

- (void)clearConnectedBtDevices
{
  -[NSArray removeAllObjects](self->_connectedBtDevices, "removeAllObjects");
}

- (void)addConnectedBtDevices:(id)a3
{
  id v4;
  NSArray *connectedBtDevices;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  connectedBtDevices = self->_connectedBtDevices;
  v8 = v4;
  if (!connectedBtDevices)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_connectedBtDevices;
    self->_connectedBtDevices = v6;

    v4 = v8;
    connectedBtDevices = self->_connectedBtDevices;
  }
  -[NSArray addObject:](connectedBtDevices, "addObject:", v4);

}

- (unint64_t)connectedBtDevicesCount
{
  return -[NSArray count](self->_connectedBtDevices, "count");
}

- (id)connectedBtDevicesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_connectedBtDevices, "objectAtIndexedSubscript:", a3);
}

- (void)setIsCloudConnected:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 1u;
  self->_isCloudConnected = a3;
}

- (BOOL)hasIsCloudConnected
{
  return *(&self->_isPreferringBtClassic + 1);
}

- (void)setHasIsCloudConnected:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xFE | a3;
}

- (void)deleteIsCloudConnected
{
  -[NETSchemaNETPeerConnectionFailed setIsCloudConnected:](self, "setIsCloudConnected:", 0);
  *(&self->_isPreferringBtClassic + 1) &= ~1u;
}

- (void)setIsConnected:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 2u;
  self->_isConnected = a3;
}

- (BOOL)hasIsConnected
{
  return (*((unsigned __int8 *)&self->_isPreferringBtClassic + 1) >> 1) & 1;
}

- (void)setHasIsConnected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xFD | v3;
}

- (void)deleteIsConnected
{
  -[NETSchemaNETPeerConnectionFailed setIsConnected:](self, "setIsConnected:", 0);
  *(&self->_isPreferringBtClassic + 1) &= ~2u;
}

- (void)setHasDevice:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 4u;
  self->_hasDevice = a3;
}

- (BOOL)hasHasDevice
{
  return (*((unsigned __int8 *)&self->_isPreferringBtClassic + 1) >> 2) & 1;
}

- (void)setHasHasDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xFB | v3;
}

- (void)deleteHasDevice
{
  -[NETSchemaNETPeerConnectionFailed setHasDevice:](self, "setHasDevice:", 0);
  *(&self->_isPreferringBtClassic + 1) &= ~4u;
}

- (void)setTimeSinceLastNearbyChangeInSeconds:(double)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 8u;
  self->_timeSinceLastNearbyChangeInSeconds = a3;
}

- (BOOL)hasTimeSinceLastNearbyChangeInSeconds
{
  return (*((unsigned __int8 *)&self->_isPreferringBtClassic + 1) >> 3) & 1;
}

- (void)setHasTimeSinceLastNearbyChangeInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xF7 | v3;
}

- (void)deleteTimeSinceLastNearbyChangeInSeconds
{
  -[NETSchemaNETPeerConnectionFailed setTimeSinceLastNearbyChangeInSeconds:](self, "setTimeSinceLastNearbyChangeInSeconds:", 0.0);
  *(&self->_isPreferringBtClassic + 1) &= ~8u;
}

- (void)setIsNearby:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 0x10u;
  self->_isNearby = a3;
}

- (BOOL)hasIsNearby
{
  return (*((unsigned __int8 *)&self->_isPreferringBtClassic + 1) >> 4) & 1;
}

- (void)setHasIsNearby:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xEF | v3;
}

- (void)deleteIsNearby
{
  -[NETSchemaNETPeerConnectionFailed setIsNearby:](self, "setIsNearby:", 0);
  *(&self->_isPreferringBtClassic + 1) &= ~0x10u;
}

- (void)setIsPreferringBtClassic:(BOOL)a3
{
  *(&self->_isPreferringBtClassic + 1) |= 0x20u;
  self->_isPreferringBtClassic = a3;
}

- (BOOL)hasIsPreferringBtClassic
{
  return (*((unsigned __int8 *)&self->_isPreferringBtClassic + 1) >> 5) & 1;
}

- (void)setHasIsPreferringBtClassic:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isPreferringBtClassic + 1) = *(&self->_isPreferringBtClassic + 1) & 0xDF | v3;
}

- (void)deleteIsPreferringBtClassic
{
  -[NETSchemaNETPeerConnectionFailed setIsPreferringBtClassic:](self, "setIsPreferringBtClassic:", 0);
  *(&self->_isPreferringBtClassic + 1) &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETPeerConnectionFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_connectedBtDevices;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *(&self->_isPreferringBtClassic + 1);
  if ((v10 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = *(&self->_isPreferringBtClassic + 1);
    if ((v10 & 2) == 0)
    {
LABEL_10:
      if ((v10 & 4) == 0)
        goto LABEL_11;
      goto LABEL_18;
    }
  }
  else if ((*(&self->_isPreferringBtClassic + 1) & 2) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteBOOLField();
  v10 = *(&self->_isPreferringBtClassic + 1);
  if ((v10 & 4) == 0)
  {
LABEL_11:
    if ((v10 & 8) == 0)
      goto LABEL_12;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  v10 = *(&self->_isPreferringBtClassic + 1);
  if ((v10 & 8) == 0)
  {
LABEL_12:
    if ((v10 & 0x10) == 0)
      goto LABEL_13;
LABEL_20:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isPreferringBtClassic + 1) & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  v10 = *(&self->_isPreferringBtClassic + 1);
  if ((v10 & 0x10) != 0)
    goto LABEL_20;
LABEL_13:
  if ((v10 & 0x20) != 0)
LABEL_14:
    PBDataWriterWriteBOOLField();
LABEL_15:

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
  unsigned int v13;
  unsigned int v14;
  int isCloudConnected;
  int v16;
  int isConnected;
  int v18;
  int hasDevice;
  int v20;
  double timeSinceLastNearbyChangeInSeconds;
  double v22;
  int v23;
  int isNearby;
  int v25;
  int isPreferringBtClassic;
  BOOL v27;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[NETSchemaNETPeerConnectionFailed connectedBtDevices](self, "connectedBtDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedBtDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_32;
  }
  -[NETSchemaNETPeerConnectionFailed connectedBtDevices](self, "connectedBtDevices");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NETSchemaNETPeerConnectionFailed connectedBtDevices](self, "connectedBtDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectedBtDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_32;
  }
  else
  {

  }
  v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
  v14 = v4[34];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_32:
    v27 = 0;
    goto LABEL_33;
  }
  if ((v13 & 1) != 0)
  {
    isCloudConnected = self->_isCloudConnected;
    if (isCloudConnected != objc_msgSend(v4, "isCloudConnected"))
      goto LABEL_32;
    v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
    v14 = v4[34];
  }
  v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_32;
  if (v16)
  {
    isConnected = self->_isConnected;
    if (isConnected != objc_msgSend(v4, "isConnected"))
      goto LABEL_32;
    v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
    v14 = v4[34];
  }
  v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_32;
  if (v18)
  {
    hasDevice = self->_hasDevice;
    if (hasDevice != objc_msgSend(v4, "hasDevice"))
      goto LABEL_32;
    v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
    v14 = v4[34];
  }
  v20 = (v13 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_32;
  if (v20)
  {
    timeSinceLastNearbyChangeInSeconds = self->_timeSinceLastNearbyChangeInSeconds;
    objc_msgSend(v4, "timeSinceLastNearbyChangeInSeconds");
    if (timeSinceLastNearbyChangeInSeconds != v22)
      goto LABEL_32;
    v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
    v14 = v4[34];
  }
  v23 = (v13 >> 4) & 1;
  if (v23 != ((v14 >> 4) & 1))
    goto LABEL_32;
  if (v23)
  {
    isNearby = self->_isNearby;
    if (isNearby == objc_msgSend(v4, "isNearby"))
    {
      v13 = *((unsigned __int8 *)&self->_isPreferringBtClassic + 1);
      v14 = v4[34];
      goto LABEL_28;
    }
    goto LABEL_32;
  }
LABEL_28:
  v25 = (v13 >> 5) & 1;
  if (v25 != ((v14 >> 5) & 1))
    goto LABEL_32;
  if (v25)
  {
    isPreferringBtClassic = self->_isPreferringBtClassic;
    if (isPreferringBtClassic != objc_msgSend(v4, "isPreferringBtClassic"))
      goto LABEL_32;
  }
  v27 = 1;
LABEL_33:

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double timeSinceLastNearbyChangeInSeconds;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = -[NSArray hash](self->_connectedBtDevices, "hash");
  v4 = *(&self->_isPreferringBtClassic + 1);
  if ((v4 & 1) != 0)
  {
    v5 = 2654435761 * self->_isCloudConnected;
    if ((*(&self->_isPreferringBtClassic + 1) & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_isConnected;
      if ((*(&self->_isPreferringBtClassic + 1) & 4) != 0)
        goto LABEL_4;
LABEL_11:
      v7 = 0;
      if ((*(&self->_isPreferringBtClassic + 1) & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
    if ((*(&self->_isPreferringBtClassic + 1) & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(&self->_isPreferringBtClassic + 1) & 4) == 0)
    goto LABEL_11;
LABEL_4:
  v7 = 2654435761 * self->_hasDevice;
  if ((*(&self->_isPreferringBtClassic + 1) & 8) == 0)
    goto LABEL_12;
LABEL_5:
  timeSinceLastNearbyChangeInSeconds = self->_timeSinceLastNearbyChangeInSeconds;
  v9 = -timeSinceLastNearbyChangeInSeconds;
  if (timeSinceLastNearbyChangeInSeconds >= 0.0)
    v9 = self->_timeSinceLastNearbyChangeInSeconds;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_15:
  if ((v4 & 0x10) != 0)
  {
    v13 = 2654435761 * self->_isNearby;
    if ((v4 & 0x20) != 0)
      goto LABEL_17;
LABEL_19:
    v14 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14;
  }
  v13 = 0;
  if ((v4 & 0x20) == 0)
    goto LABEL_19;
LABEL_17:
  v14 = 2654435761 * self->_isPreferringBtClassic;
  return v5 ^ v3 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14;
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
  char v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_connectedBtDevices, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = self->_connectedBtDevices;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("connectedBtDevices"));
  }
  v12 = *(&self->_isPreferringBtClassic + 1);
  if ((v12 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETPeerConnectionFailed hasDevice](self, "hasDevice"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasDevice"));

    v12 = *(&self->_isPreferringBtClassic + 1);
    if ((v12 & 1) == 0)
    {
LABEL_15:
      if ((v12 & 2) == 0)
        goto LABEL_16;
      goto LABEL_23;
    }
  }
  else if (!*(&self->_isPreferringBtClassic + 1))
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETPeerConnectionFailed isCloudConnected](self, "isCloudConnected", (_QWORD)v21));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isCloudConnected"));

  v12 = *(&self->_isPreferringBtClassic + 1);
  if ((v12 & 2) == 0)
  {
LABEL_16:
    if ((v12 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETPeerConnectionFailed isConnected](self, "isConnected", (_QWORD)v21));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isConnected"));

  v12 = *(&self->_isPreferringBtClassic + 1);
  if ((v12 & 0x10) == 0)
  {
LABEL_17:
    if ((v12 & 0x20) == 0)
      goto LABEL_18;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETPeerConnectionFailed isPreferringBtClassic](self, "isPreferringBtClassic", (_QWORD)v21));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("isPreferringBtClassic"));

    if ((*(&self->_isPreferringBtClassic + 1) & 8) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETPeerConnectionFailed isNearby](self, "isNearby", (_QWORD)v21));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isNearby"));

  v12 = *(&self->_isPreferringBtClassic + 1);
  if ((v12 & 0x20) != 0)
    goto LABEL_25;
LABEL_18:
  if ((v12 & 8) != 0)
  {
LABEL_19:
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[NETSchemaNETPeerConnectionFailed timeSinceLastNearbyChangeInSeconds](self, "timeSinceLastNearbyChangeInSeconds", (_QWORD)v21);
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("timeSinceLastNearbyChangeInSeconds"));

  }
LABEL_20:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v21);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETPeerConnectionFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETPeerConnectionFailed)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETPeerConnectionFailed *v5;
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
    self = -[NETSchemaNETPeerConnectionFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETPeerConnectionFailed)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETPeerConnectionFailed *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NETSchemaNETBluetoothDevice *v13;
  NETSchemaNETBluetoothDevice *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NETSchemaNETPeerConnectionFailed *v21;
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
  v27.super_class = (Class)NETSchemaNETPeerConnectionFailed;
  v5 = -[NETSchemaNETPeerConnectionFailed init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectedBtDevices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v24;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [NETSchemaNETBluetoothDevice alloc];
              v14 = -[NETSchemaNETBluetoothDevice initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v23);
              -[NETSchemaNETPeerConnectionFailed addConnectedBtDevices:](v5, "addConnectedBtDevices:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCloudConnected"), (_QWORD)v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETPeerConnectionFailed setIsCloudConnected:](v5, "setIsCloudConnected:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isConnected"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETPeerConnectionFailed setIsConnected:](v5, "setIsConnected:", objc_msgSend(v16, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasDevice"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETPeerConnectionFailed setHasDevice:](v5, "setHasDevice:", objc_msgSend(v17, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastNearbyChangeInSeconds"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "doubleValue");
      -[NETSchemaNETPeerConnectionFailed setTimeSinceLastNearbyChangeInSeconds:](v5, "setTimeSinceLastNearbyChangeInSeconds:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNearby"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETPeerConnectionFailed setIsNearby:](v5, "setIsNearby:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPreferringBtClassic"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETPeerConnectionFailed setIsPreferringBtClassic:](v5, "setIsPreferringBtClassic:", objc_msgSend(v20, "BOOLValue"));
    v21 = v5;

  }
  return v5;
}

- (NSArray)connectedBtDevices
{
  return self->_connectedBtDevices;
}

- (void)setConnectedBtDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isCloudConnected
{
  return self->_isCloudConnected;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (BOOL)hasDevice
{
  return self->_hasDevice;
}

- (double)timeSinceLastNearbyChangeInSeconds
{
  return self->_timeSinceLastNearbyChangeInSeconds;
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (BOOL)isPreferringBtClassic
{
  return self->_isPreferringBtClassic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedBtDevices, 0);
}

@end

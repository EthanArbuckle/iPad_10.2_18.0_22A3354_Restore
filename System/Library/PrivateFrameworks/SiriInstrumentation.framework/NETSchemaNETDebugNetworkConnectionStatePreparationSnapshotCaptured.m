@implementation NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured pathGateways](self, "pathGateways", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setPathGateways:](self, "setPathGateways:", v7);

  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured pathInterfaces](self, "pathInterfaces");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setPathInterfaces:](self, "setPathInterfaces:", v9);
  return v5;
}

- (void)setIsExpensive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isExpensive = a3;
}

- (BOOL)hasIsExpensive
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsExpensive:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsExpensive
{
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setIsExpensive:](self, "setIsExpensive:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearPathGateways
{
  -[NSArray removeAllObjects](self->_pathGateways, "removeAllObjects");
}

- (void)addPathGateways:(id)a3
{
  id v4;
  NSArray *pathGateways;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  pathGateways = self->_pathGateways;
  v8 = v4;
  if (!pathGateways)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pathGateways;
    self->_pathGateways = v6;

    v4 = v8;
    pathGateways = self->_pathGateways;
  }
  -[NSArray addObject:](pathGateways, "addObject:", v4);

}

- (unint64_t)pathGatewaysCount
{
  return -[NSArray count](self->_pathGateways, "count");
}

- (id)pathGatewaysAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_pathGateways, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasConnectionInfo
{
  return self->_connectionInfo != 0;
}

- (void)deleteConnectionInfo
{
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setConnectionInfo:](self, "setConnectionInfo:", 0);
}

- (void)setHasIpv6:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasIpv6 = a3;
}

- (BOOL)hasHasIpv6
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHasIpv6:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteHasIpv6
{
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setHasIpv6:](self, "setHasIpv6:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setHasIpv4:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasIpv4 = a3;
}

- (BOOL)hasHasIpv4
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHasIpv4:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteHasIpv4
{
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setHasIpv4:](self, "setHasIpv4:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsConstrained:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isConstrained = a3;
}

- (BOOL)hasIsConstrained
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsConstrained:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsConstrained
{
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setIsConstrained:](self, "setIsConstrained:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)clearPathInterfaces
{
  -[NSArray removeAllObjects](self->_pathInterfaces, "removeAllObjects");
}

- (void)addPathInterfaces:(id)a3
{
  id v4;
  NSArray *pathInterfaces;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  pathInterfaces = self->_pathInterfaces;
  v8 = v4;
  if (!pathInterfaces)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pathInterfaces;
    self->_pathInterfaces = v6;

    v4 = v8;
    pathInterfaces = self->_pathInterfaces;
  }
  -[NSArray addObject:](pathInterfaces, "addObject:", v4);

}

- (unint64_t)pathInterfacesCount
{
  return -[NSArray count](self->_pathInterfaces, "count");
}

- (id)pathInterfacesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_pathInterfaces, "objectAtIndexedSubscript:", a3);
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_status = a3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteStatus
{
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setStatus:](self, "setStatus:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCapturedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char has;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_pathGateways;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
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
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured connectionInfo](self, "connectionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_14:
      if ((has & 8) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_15:
    PBDataWriterWriteBOOLField();
LABEL_16:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_pathInterfaces;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int isExpensive;
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
  $2CB15FF963A334E3A0C63BFF0EB2303A has;
  int v19;
  unsigned int v20;
  int hasIpv6;
  int v22;
  int hasIpv4;
  int v24;
  int isConstrained;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  BOOL v31;
  int v33;
  int status;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != (v4[52] & 1))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isExpensive = self->_isExpensive;
    if (isExpensive != objc_msgSend(v4, "isExpensive"))
      goto LABEL_31;
  }
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured pathGateways](self, "pathGateways");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathGateways");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured pathGateways](self, "pathGateways");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured pathGateways](self, "pathGateways");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathGateways");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_31;
  }
  else
  {

  }
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured connectionInfo](self, "connectionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured connectionInfo](self, "connectionInfo");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured connectionInfo](self, "connectionInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectionInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_31;
  }
  else
  {

  }
  has = self->_has;
  v19 = (*(unsigned int *)&has >> 1) & 1;
  v20 = v4[52];
  if (v19 != ((v20 >> 1) & 1))
    goto LABEL_31;
  if (v19)
  {
    hasIpv6 = self->_hasIpv6;
    if (hasIpv6 != objc_msgSend(v4, "hasIpv6"))
      goto LABEL_31;
    has = self->_has;
    v20 = v4[52];
  }
  v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v20 >> 2) & 1))
    goto LABEL_31;
  if (v22)
  {
    hasIpv4 = self->_hasIpv4;
    if (hasIpv4 != objc_msgSend(v4, "hasIpv4"))
      goto LABEL_31;
    has = self->_has;
    v20 = v4[52];
  }
  v24 = (*(unsigned int *)&has >> 3) & 1;
  if (v24 != ((v20 >> 3) & 1))
    goto LABEL_31;
  if (v24)
  {
    isConstrained = self->_isConstrained;
    if (isConstrained != objc_msgSend(v4, "isConstrained"))
      goto LABEL_31;
  }
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured pathInterfaces](self, "pathInterfaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathInterfaces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured pathInterfaces](self, "pathInterfaces");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured pathInterfaces](self, "pathInterfaces");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathInterfaces");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_31;
  }
  else
  {

  }
  v33 = (*(_BYTE *)&self->_has >> 4) & 1;
  if (v33 == ((v4[52] >> 4) & 1))
  {
    if (!v33 || (status = self->_status, status == objc_msgSend(v4, "status")))
    {
      v31 = 1;
      goto LABEL_32;
    }
  }
LABEL_31:
  v31 = 0;
LABEL_32:

  return v31;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_isExpensive;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_pathGateways, "hash");
  v5 = -[NSString hash](self->_connectionInfo, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v6 = 2654435761 * self->_hasIpv6;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v7 = 2654435761 * self->_hasIpv4;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_isConstrained;
    goto LABEL_11;
  }
LABEL_10:
  v8 = 0;
LABEL_11:
  v9 = -[NSArray hash](self->_pathInterfaces, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v10 = 2654435761 * self->_status;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  unsigned int v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_connectionInfo)
  {
    -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured connectionInfo](self, "connectionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("connectionInfo"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured hasIpv4](self, "hasIpv4"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("hasIpv4"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured hasIpv6](self, "hasIpv6"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("hasIpv6"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured isConstrained](self, "isConstrained"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("isConstrained"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured isExpensive](self, "isExpensive"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isExpensive"));

  }
LABEL_8:
  if (-[NSArray count](self->_pathGateways, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v9 = self->_pathGateways;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pathGateways"));
  }
  if (-[NSArray count](self->_pathInterfaces, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = self->_pathInterfaces;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "dictionaryRepresentation");
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
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("pathInterfaces"));
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v24 = -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured status](self, "status") - 1;
    if (v24 > 3)
      v25 = CFSTR("NETPATHSTATUS_UNKNOWN");
    else
      v25 = off_1E5631688[v24];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("status"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *v5;
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
    self = -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NETSchemaNETEndpoint *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  NETSchemaNETPathInterface *v28;
  void *v29;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured;
  v5 = -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExpensive"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setIsExpensive:](v5, "setIsExpensive:", objc_msgSend(v6, "BOOLValue"));
    v37 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pathGateways"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v8 = v7;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v43 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[NETSchemaNETEndpoint initWithDictionary:]([NETSchemaNETEndpoint alloc], "initWithDictionary:", v14);
              -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured addPathGateways:](v5, "addPathGateways:", v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v11);
      }

      v7 = v8;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setConnectionInfo:](v5, "setConnectionInfo:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasIpv6"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setHasIpv6:](v5, "setHasIpv6:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasIpv4"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setHasIpv4:](v5, "setHasIpv4:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isConstrained"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setIsConstrained:](v5, "setIsConstrained:", objc_msgSend(v20, "BOOLValue"));
    v36 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pathInterfaces"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v19;
      v33 = v18;
      v34 = v16;
      v35 = v7;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v39 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = -[NETSchemaNETPathInterface initWithDictionary:]([NETSchemaNETPathInterface alloc], "initWithDictionary:", v27);
              -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured addPathInterfaces:](v5, "addPathInterfaces:", v28);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        }
        while (v24);
      }

      v7 = v35;
      v19 = v32;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"), v32, v33, v34, v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setStatus:](v5, "setStatus:", objc_msgSend(v29, "intValue"));
    v30 = v5;

  }
  return v5;
}

- (BOOL)isExpensive
{
  return self->_isExpensive;
}

- (NSArray)pathGateways
{
  return self->_pathGateways;
}

- (void)setPathGateways:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)hasIpv6
{
  return self->_hasIpv6;
}

- (BOOL)hasIpv4
{
  return self->_hasIpv4;
}

- (BOOL)isConstrained
{
  return self->_isConstrained;
}

- (NSArray)pathInterfaces
{
  return self->_pathInterfaces;
}

- (void)setPathInterfaces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)status
{
  return self->_status;
}

- (void)setHasConnectionInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathInterfaces, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_pathGateways, 0);
}

@end

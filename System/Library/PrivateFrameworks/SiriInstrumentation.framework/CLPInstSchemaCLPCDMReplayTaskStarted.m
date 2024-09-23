@implementation CLPInstSchemaCLPCDMReplayTaskStarted

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
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLPInstSchemaCLPCDMReplayTaskStarted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v14, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPInstSchemaCLPCDMReplayTaskStarted pluginTaskAsset](self, "pluginTaskAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CLPInstSchemaCLPCDMReplayTaskStarted deletePluginTaskAsset](self, "deletePluginTaskAsset");
  -[CLPInstSchemaCLPCDMReplayTaskStarted availableSiriAssets](self, "availableSiriAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPInstSchemaCLPCDMReplayTaskStarted setAvailableSiriAssets:](self, "setAvailableSiriAssets:", v10);

  -[CLPInstSchemaCLPCDMReplayTaskStarted habitualUsages](self, "habitualUsages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPInstSchemaCLPCDMReplayTaskStarted setHabitualUsages:](self, "setHabitualUsages:", v12);

  return v5;
}

- (BOOL)hasPluginTaskAsset
{
  return self->_pluginTaskAsset != 0;
}

- (void)deletePluginTaskAsset
{
  -[CLPInstSchemaCLPCDMReplayTaskStarted setPluginTaskAsset:](self, "setPluginTaskAsset:", 0);
}

- (void)clearAvailableSiriAssets
{
  -[NSArray removeAllObjects](self->_availableSiriAssets, "removeAllObjects");
}

- (void)addAvailableSiriAssets:(id)a3
{
  id v4;
  NSArray *availableSiriAssets;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  availableSiriAssets = self->_availableSiriAssets;
  v8 = v4;
  if (!availableSiriAssets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_availableSiriAssets;
    self->_availableSiriAssets = v6;

    v4 = v8;
    availableSiriAssets = self->_availableSiriAssets;
  }
  -[NSArray addObject:](availableSiriAssets, "addObject:", v4);

}

- (unint64_t)availableSiriAssetsCount
{
  return -[NSArray count](self->_availableSiriAssets, "count");
}

- (id)availableSiriAssetsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_availableSiriAssets, "objectAtIndexedSubscript:", a3);
}

- (void)setReplayType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_replayType = a3;
}

- (BOOL)hasReplayType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReplayType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteReplayType
{
  -[CLPInstSchemaCLPCDMReplayTaskStarted setReplayType:](self, "setReplayType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearHabitualUsage
{
  -[NSArray removeAllObjects](self->_habitualUsages, "removeAllObjects");
}

- (void)addHabitualUsage:(id)a3
{
  id v4;
  NSArray *habitualUsages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  habitualUsages = self->_habitualUsages;
  v8 = v4;
  if (!habitualUsages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_habitualUsages;
    self->_habitualUsages = v6;

    v4 = v8;
    habitualUsages = self->_habitualUsages;
  }
  -[NSArray addObject:](habitualUsages, "addObject:", v4);

}

- (unint64_t)habitualUsageCount
{
  return -[NSArray count](self->_habitualUsages, "count");
}

- (id)habitualUsageAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_habitualUsages, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCDMReplayTaskStartedReadFrom(self, (uint64_t)a3);
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
  -[CLPInstSchemaCLPCDMReplayTaskStarted pluginTaskAsset](self, "pluginTaskAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CLPInstSchemaCLPCDMReplayTaskStarted pluginTaskAsset](self, "pluginTaskAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_availableSiriAssets;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_habitualUsages;
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
  int replayType;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[CLPInstSchemaCLPCDMReplayTaskStarted pluginTaskAsset](self, "pluginTaskAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginTaskAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[CLPInstSchemaCLPCDMReplayTaskStarted pluginTaskAsset](self, "pluginTaskAsset");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CLPInstSchemaCLPCDMReplayTaskStarted pluginTaskAsset](self, "pluginTaskAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pluginTaskAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  -[CLPInstSchemaCLPCDMReplayTaskStarted availableSiriAssets](self, "availableSiriAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableSiriAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[CLPInstSchemaCLPCDMReplayTaskStarted availableSiriAssets](self, "availableSiriAssets");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[CLPInstSchemaCLPCDMReplayTaskStarted availableSiriAssets](self, "availableSiriAssets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availableSiriAssets");
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
    replayType = self->_replayType;
    if (replayType != objc_msgSend(v4, "replayType"))
      goto LABEL_20;
  }
  -[CLPInstSchemaCLPCDMReplayTaskStarted habitualUsages](self, "habitualUsages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "habitualUsages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[CLPInstSchemaCLPCDMReplayTaskStarted habitualUsages](self, "habitualUsages");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[CLPInstSchemaCLPCDMReplayTaskStarted habitualUsages](self, "habitualUsages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "habitualUsages");
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
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[SISchemaAsset hash](self->_pluginTaskAsset, "hash");
  v4 = -[NSArray hash](self->_availableSiriAssets, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_replayType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_habitualUsages, "hash");
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
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  const __CFString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_availableSiriAssets, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v5 = self->_availableSiriAssets;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("availableSiriAssets"));
  }
  if (-[NSArray count](self->_habitualUsages, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = self->_habitualUsages;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("habitualUsage"));
  }
  if (self->_pluginTaskAsset)
  {
    -[CLPInstSchemaCLPCDMReplayTaskStarted pluginTaskAsset](self, "pluginTaskAsset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("pluginTaskAsset"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("pluginTaskAsset"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v23 = -[CLPInstSchemaCLPCDMReplayTaskStarted replayType](self, "replayType") - 1;
    if (v23 > 2)
      v24 = CFSTR("CLPREPLAYTYPE_UNKNOWN");
    else
      v24 = off_1E562BF28[v23];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("replayType"), (_QWORD)v26);
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v26);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPCDMReplayTaskStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPCDMReplayTaskStarted)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPCDMReplayTaskStarted *v5;
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
    self = -[CLPInstSchemaCLPCDMReplayTaskStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPCDMReplayTaskStarted)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPCDMReplayTaskStarted *v5;
  void *v6;
  SISchemaAsset *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  SISchemaAsset *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  CLPInstSchemaHabitualUsageByCalendarWeekInformation *v24;
  CLPInstSchemaCLPCDMReplayTaskStarted *v25;
  id v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CLPInstSchemaCLPCDMReplayTaskStarted;
  v5 = -[CLPInstSchemaCLPCDMReplayTaskStarted init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pluginTaskAsset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v6);
      -[CLPInstSchemaCLPCDMReplayTaskStarted setPluginTaskAsset:](v5, "setPluginTaskAsset:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availableSiriAssets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = v8;
    v29 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
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
            v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v14);
              -[CLPInstSchemaCLPCDMReplayTaskStarted addAvailableSiriAssets:](v5, "addAvailableSiriAssets:", v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v11);
      }

      v8 = v28;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("replayType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPCDMReplayTaskStarted setReplayType:](v5, "setReplayType:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("habitualUsage"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v4;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v31 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = -[CLPInstSchemaHabitualUsageByCalendarWeekInformation initWithDictionary:]([CLPInstSchemaHabitualUsageByCalendarWeekInformation alloc], "initWithDictionary:", v23);
              -[CLPInstSchemaCLPCDMReplayTaskStarted addHabitualUsage:](v5, "addHabitualUsage:", v24);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        }
        while (v20);
      }

      v4 = v27;
      v8 = v28;
      v6 = v29;
    }
    v25 = v5;

  }
  return v5;
}

- (SISchemaAsset)pluginTaskAsset
{
  return self->_pluginTaskAsset;
}

- (void)setPluginTaskAsset:(id)a3
{
  objc_storeStrong((id *)&self->_pluginTaskAsset, a3);
}

- (NSArray)availableSiriAssets
{
  return self->_availableSiriAssets;
}

- (void)setAvailableSiriAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)replayType
{
  return self->_replayType;
}

- (NSArray)habitualUsages
{
  return self->_habitualUsages;
}

- (void)setHabitualUsages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasPluginTaskAsset:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_habitualUsages, 0);
  objc_storeStrong((id *)&self->_availableSiriAssets, 0);
  objc_storeStrong((id *)&self->_pluginTaskAsset, 0);
}

@end

@implementation HALSchemaHALCrossDeviceCommandExecutionEnded

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
  v9.super_class = (Class)HALSchemaHALCrossDeviceCommandExecutionEnded;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HALSchemaHALCrossDeviceCommandExecutionEnded selecteds](self, "selecteds", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HALSchemaHALCrossDeviceCommandExecutionEnded setSelecteds:](self, "setSelecteds:", v7);
  return v5;
}

- (void)clearSelected
{
  -[NSArray removeAllObjects](self->_selecteds, "removeAllObjects");
}

- (void)addSelected:(id)a3
{
  id v4;
  NSArray *selecteds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  selecteds = self->_selecteds;
  v8 = v4;
  if (!selecteds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_selecteds;
    self->_selecteds = v6;

    v4 = v8;
    selecteds = self->_selecteds;
  }
  -[NSArray addObject:](selecteds, "addObject:", v4);

}

- (unint64_t)selectedCount
{
  return -[NSArray count](self->_selecteds, "count");
}

- (id)selectedAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_selecteds, "objectAtIndexedSubscript:", a3);
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_action = a3;
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAction
{
  -[HALSchemaHALCrossDeviceCommandExecutionEnded setAction:](self, "setAction:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setActionResult:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_actionResult = a3;
}

- (BOOL)hasActionResult
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasActionResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteActionResult
{
  -[HALSchemaHALCrossDeviceCommandExecutionEnded setActionResult:](self, "setActionResult:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setHomeKitTarget:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_homeKitTarget = a3;
}

- (BOOL)hasHomeKitTarget
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHomeKitTarget:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteHomeKitTarget
{
  -[HALSchemaHALCrossDeviceCommandExecutionEnded setHomeKitTarget:](self, "setHomeKitTarget:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALCrossDeviceCommandExecutionEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
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
  v5 = self->_selecteds;
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

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_10;
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((has & 4) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:

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
  $B585B9BC5008A5A5C2A2D99DD92E089F has;
  unsigned int v14;
  int action;
  int v16;
  int actionResult;
  int v18;
  int homeKitTarget;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[HALSchemaHALCrossDeviceCommandExecutionEnded selecteds](self, "selecteds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selecteds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  -[HALSchemaHALCrossDeviceCommandExecutionEnded selecteds](self, "selecteds");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[HALSchemaHALCrossDeviceCommandExecutionEnded selecteds](self, "selecteds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selecteds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    action = self->_action;
    if (action != objc_msgSend(v4, "action"))
      goto LABEL_20;
    has = self->_has;
    v14 = v4[28];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_20;
  if (v16)
  {
    actionResult = self->_actionResult;
    if (actionResult == objc_msgSend(v4, "actionResult"))
    {
      has = self->_has;
      v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_20;
  if (v18)
  {
    homeKitTarget = self->_homeKitTarget;
    if (homeKitTarget != objc_msgSend(v4, "homeKitTarget"))
      goto LABEL_20;
  }
  v20 = 1;
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSArray hash](self->_selecteds, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_action;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_actionResult;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_homeKitTarget;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[HALSchemaHALCrossDeviceCommandExecutionEnded action](self, "action") - 1;
    if (v5 > 0x14)
      v6 = CFSTR("HALACTION_UNKNOWN");
    else
      v6 = off_1E562F480[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("action"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v7 = -[HALSchemaHALCrossDeviceCommandExecutionEnded actionResult](self, "actionResult") - 1;
  if (v7 > 2)
    v8 = CFSTR("HALACTIONRESULT_UNKNOWN");
  else
    v8 = off_1E562F528[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("actionResult"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    v9 = -[HALSchemaHALCrossDeviceCommandExecutionEnded homeKitTarget](self, "homeKitTarget") - 1;
    if (v9 > 6)
      v10 = CFSTR("HALHOMEKITTARGET_UNKNOWN");
    else
      v10 = off_1E562F540[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("homeKitTarget"));
  }
LABEL_17:
  if (-[NSArray count](self->_selecteds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = self->_selecteds;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v11, "addObject:", v17);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("selected"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v20);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[HALSchemaHALCrossDeviceCommandExecutionEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (HALSchemaHALCrossDeviceCommandExecutionEnded)initWithJSON:(id)a3
{
  void *v4;
  HALSchemaHALCrossDeviceCommandExecutionEnded *v5;
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
    self = -[HALSchemaHALCrossDeviceCommandExecutionEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (HALSchemaHALCrossDeviceCommandExecutionEnded)initWithDictionary:(id)a3
{
  id v4;
  HALSchemaHALCrossDeviceCommandExecutionEnded *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HALSchemaHALDevice *v13;
  HALSchemaHALDevice *v14;
  void *v15;
  void *v16;
  void *v17;
  HALSchemaHALCrossDeviceCommandExecutionEnded *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HALSchemaHALCrossDeviceCommandExecutionEnded;
  v5 = -[HALSchemaHALCrossDeviceCommandExecutionEnded init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [HALSchemaHALDevice alloc];
              v14 = -[HALSchemaHALDevice initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v20);
              -[HALSchemaHALCrossDeviceCommandExecutionEnded addSelected:](v5, "addSelected:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"), (_QWORD)v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALCrossDeviceCommandExecutionEnded setAction:](v5, "setAction:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionResult"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALCrossDeviceCommandExecutionEnded setActionResult:](v5, "setActionResult:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKitTarget"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALCrossDeviceCommandExecutionEnded setHomeKitTarget:](v5, "setHomeKitTarget:", objc_msgSend(v17, "intValue"));
    v18 = v5;

  }
  return v5;
}

- (NSArray)selecteds
{
  return self->_selecteds;
}

- (void)setSelecteds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)action
{
  return self->_action;
}

- (int)actionResult
{
  return self->_actionResult;
}

- (int)homeKitTarget
{
  return self->_homeKitTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selecteds, 0);
}

@end

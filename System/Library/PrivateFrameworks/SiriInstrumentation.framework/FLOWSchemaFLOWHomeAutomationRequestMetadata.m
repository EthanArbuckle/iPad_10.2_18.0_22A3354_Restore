@implementation FLOWSchemaFLOWHomeAutomationRequestMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsHomeAutomationRequestAsynchronous:(BOOL)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 1u;
  self->_isHomeAutomationRequestAsynchronous = a3;
}

- (BOOL)hasIsHomeAutomationRequestAsynchronous
{
  return *(&self->_isIntentSelectionCacheHit + 1);
}

- (void)setHasIsHomeAutomationRequestAsynchronous:(BOOL)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xFE | a3;
}

- (void)deleteIsHomeAutomationRequestAsynchronous
{
  -[FLOWSchemaFLOWHomeAutomationRequestMetadata setIsHomeAutomationRequestAsynchronous:](self, "setIsHomeAutomationRequestAsynchronous:", 0);
  *(&self->_isIntentSelectionCacheHit + 1) &= ~1u;
}

- (void)setTargetedEntityCount:(unsigned int)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 2u;
  self->_targetedEntityCount = a3;
}

- (BOOL)hasTargetedEntityCount
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 1) & 1;
}

- (void)setHasTargetedEntityCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xFD | v3;
}

- (void)deleteTargetedEntityCount
{
  -[FLOWSchemaFLOWHomeAutomationRequestMetadata setTargetedEntityCount:](self, "setTargetedEntityCount:", 0);
  *(&self->_isIntentSelectionCacheHit + 1) &= ~2u;
}

- (void)setFulfilledEntityCount:(unsigned int)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 4u;
  self->_fulfilledEntityCount = a3;
}

- (BOOL)hasFulfilledEntityCount
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 2) & 1;
}

- (void)setHasFulfilledEntityCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xFB | v3;
}

- (void)deleteFulfilledEntityCount
{
  -[FLOWSchemaFLOWHomeAutomationRequestMetadata setFulfilledEntityCount:](self, "setFulfilledEntityCount:", 0);
  *(&self->_isIntentSelectionCacheHit + 1) &= ~4u;
}

- (void)clearTargetedEntityTypes
{
  -[NSArray removeAllObjects](self->_targetedEntityTypes, "removeAllObjects");
}

- (void)addTargetedEntityTypes:(id)a3
{
  id v4;
  NSArray *targetedEntityTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  targetedEntityTypes = self->_targetedEntityTypes;
  v8 = v4;
  if (!targetedEntityTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_targetedEntityTypes;
    self->_targetedEntityTypes = v6;

    v4 = v8;
    targetedEntityTypes = self->_targetedEntityTypes;
  }
  -[NSArray addObject:](targetedEntityTypes, "addObject:", v4);

}

- (unint64_t)targetedEntityTypesCount
{
  return -[NSArray count](self->_targetedEntityTypes, "count");
}

- (id)targetedEntityTypesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_targetedEntityTypes, "objectAtIndexedSubscript:", a3);
}

- (void)setSmallestTargetedContainer:(int)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 8u;
  self->_smallestTargetedContainer = a3;
}

- (BOOL)hasSmallestTargetedContainer
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 3) & 1;
}

- (void)setHasSmallestTargetedContainer:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xF7 | v3;
}

- (void)deleteSmallestTargetedContainer
{
  -[FLOWSchemaFLOWHomeAutomationRequestMetadata setSmallestTargetedContainer:](self, "setSmallestTargetedContainer:", 0);
  *(&self->_isIntentSelectionCacheHit + 1) &= ~8u;
}

- (BOOL)hasTargetAttribute
{
  return self->_targetAttribute != 0;
}

- (void)deleteTargetAttribute
{
  -[FLOWSchemaFLOWHomeAutomationRequestMetadata setTargetAttribute:](self, "setTargetAttribute:", 0);
}

- (void)setConditionType:(int)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 0x10u;
  self->_conditionType = a3;
}

- (BOOL)hasConditionType
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 4) & 1;
}

- (void)setHasConditionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xEF | v3;
}

- (void)deleteConditionType
{
  -[FLOWSchemaFLOWHomeAutomationRequestMetadata setConditionType:](self, "setConditionType:", 0);
  *(&self->_isIntentSelectionCacheHit + 1) &= ~0x10u;
}

- (void)setIsRecurring:(BOOL)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 0x20u;
  self->_isRecurring = a3;
}

- (BOOL)hasIsRecurring
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 5) & 1;
}

- (void)setHasIsRecurring:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xDF | v3;
}

- (void)deleteIsRecurring
{
  -[FLOWSchemaFLOWHomeAutomationRequestMetadata setIsRecurring:](self, "setIsRecurring:", 0);
  *(&self->_isIntentSelectionCacheHit + 1) &= ~0x20u;
}

- (void)setIsIntentSelectionCacheHit:(BOOL)a3
{
  *(&self->_isIntentSelectionCacheHit + 1) |= 0x40u;
  self->_isIntentSelectionCacheHit = a3;
}

- (BOOL)hasIsIntentSelectionCacheHit
{
  return (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 6) & 1;
}

- (void)setHasIsIntentSelectionCacheHit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(&self->_isIntentSelectionCacheHit + 1) = *(&self->_isIntentSelectionCacheHit + 1) & 0xBF | v3;
}

- (void)deleteIsIntentSelectionCacheHit
{
  -[FLOWSchemaFLOWHomeAutomationRequestMetadata setIsIntentSelectionCacheHit:](self, "setIsIntentSelectionCacheHit:", 0);
  *(&self->_isIntentSelectionCacheHit + 1) &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeAutomationRequestMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = *(&self->_isIntentSelectionCacheHit + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isIntentSelectionCacheHit + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 4) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_targetedEntityTypes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if ((*(&self->_isIntentSelectionCacheHit + 1) & 8) != 0)
    PBDataWriterWriteInt32Field();
  -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetAttribute](self, "targetAttribute", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  v12 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v12 & 0x10) == 0)
  {
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x20) == 0)
      goto LABEL_18;
LABEL_25:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  v12 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v12 & 0x20) != 0)
    goto LABEL_25;
LABEL_18:
  if ((v12 & 0x40) != 0)
LABEL_19:
    PBDataWriterWriteBOOLField();
LABEL_20:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int isHomeAutomationRequestAsynchronous;
  int v8;
  unsigned int targetedEntityCount;
  int v10;
  unsigned int fulfilledEntityCount;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int smallestTargetedContainer;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  BOOL v26;
  unsigned int v28;
  int v29;
  unsigned int v30;
  int conditionType;
  int v32;
  int isRecurring;
  int v34;
  int isIntentSelectionCacheHit;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  v5 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
  v6 = v4[54];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_26;
  if ((v5 & 1) != 0)
  {
    isHomeAutomationRequestAsynchronous = self->_isHomeAutomationRequestAsynchronous;
    if (isHomeAutomationRequestAsynchronous != objc_msgSend(v4, "isHomeAutomationRequestAsynchronous"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
    v6 = v4[54];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      targetedEntityCount = self->_targetedEntityCount;
      if (targetedEntityCount != objc_msgSend(v4, "targetedEntityCount"))
        goto LABEL_26;
      v5 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
      v6 = v4[54];
    }
    v10 = (v5 >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1))
      goto LABEL_26;
    if (v10)
    {
      fulfilledEntityCount = self->_fulfilledEntityCount;
      if (fulfilledEntityCount != objc_msgSend(v4, "fulfilledEntityCount"))
        goto LABEL_26;
    }
    -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetedEntityTypes](self, "targetedEntityTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetedEntityTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
      goto LABEL_25;
    -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetedEntityTypes](self, "targetedEntityTypes");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetedEntityTypes](self, "targetedEntityTypes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetedEntityTypes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_26;
    }
    else
    {

    }
    v19 = (*((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1) >> 3) & 1;
    if (v19 != ((v4[54] >> 3) & 1))
      goto LABEL_26;
    if (v19)
    {
      smallestTargetedContainer = self->_smallestTargetedContainer;
      if (smallestTargetedContainer != objc_msgSend(v4, "smallestTargetedContainer"))
        goto LABEL_26;
    }
    -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetAttribute](self, "targetAttribute");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetAttribute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
    {
LABEL_25:

      goto LABEL_26;
    }
    -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetAttribute](self, "targetAttribute");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetAttribute](self, "targetAttribute");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetAttribute");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_26;
    }
    else
    {

    }
    v28 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
    v29 = (v28 >> 4) & 1;
    v30 = v4[54];
    if (v29 == ((v30 >> 4) & 1))
    {
      if (v29)
      {
        conditionType = self->_conditionType;
        if (conditionType != objc_msgSend(v4, "conditionType"))
          goto LABEL_26;
        v28 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
        v30 = v4[54];
      }
      v32 = (v28 >> 5) & 1;
      if (v32 == ((v30 >> 5) & 1))
      {
        if (v32)
        {
          isRecurring = self->_isRecurring;
          if (isRecurring != objc_msgSend(v4, "isRecurring"))
            goto LABEL_26;
          v28 = *((unsigned __int8 *)&self->_isIntentSelectionCacheHit + 1);
          v30 = v4[54];
        }
        v34 = (v28 >> 6) & 1;
        if (v34 == ((v30 >> 6) & 1))
        {
          if (!v34
            || (isIntentSelectionCacheHit = self->_isIntentSelectionCacheHit,
                isIntentSelectionCacheHit == objc_msgSend(v4, "isIntentSelectionCacheHit")))
          {
            v26 = 1;
            goto LABEL_27;
          }
        }
      }
    }
  }
LABEL_26:
  v26 = 0;
LABEL_27:

  return v26;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!*(&self->_isIntentSelectionCacheHit + 1))
  {
    v3 = 0;
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_isHomeAutomationRequestAsynchronous;
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_targetedEntityCount;
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_fulfilledEntityCount;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSArray hash](self->_targetedEntityTypes, "hash");
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 8) != 0)
    v7 = 2654435761 * self->_smallestTargetedContainer;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_targetAttribute, "hash");
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x10) == 0)
  {
    v9 = 0;
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x20) != 0)
      goto LABEL_13;
LABEL_16:
    v10 = 0;
    if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x40) != 0)
      goto LABEL_14;
LABEL_17:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  v9 = 2654435761 * self->_conditionType;
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x20) == 0)
    goto LABEL_16;
LABEL_13:
  v10 = 2654435761 * self->_isRecurring;
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 0x40) == 0)
    goto LABEL_17;
LABEL_14:
  v11 = 2654435761 * self->_isIntentSelectionCacheHit;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v4 & 0x10) != 0)
  {
    v5 = -[FLOWSchemaFLOWHomeAutomationRequestMetadata conditionType](self, "conditionType") - 1;
    if (v5 > 4)
      v6 = CFSTR("FLOWHOMEAUTOMATIONCONDITIONTYPE_UNKNOWN");
    else
      v6 = off_1E562DAE0[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("conditionType"));
    v4 = *(&self->_isIntentSelectionCacheHit + 1);
  }
  if ((v4 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeAutomationRequestMetadata fulfilledEntityCount](self, "fulfilledEntityCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("fulfilledEntityCount"));

    v4 = *(&self->_isIntentSelectionCacheHit + 1);
    if ((v4 & 1) == 0)
    {
LABEL_8:
      if ((v4 & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_14;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWHomeAutomationRequestMetadata isHomeAutomationRequestAsynchronous](self, "isHomeAutomationRequestAsynchronous"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isHomeAutomationRequestAsynchronous"));

  v4 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWHomeAutomationRequestMetadata isIntentSelectionCacheHit](self, "isIntentSelectionCacheHit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isIntentSelectionCacheHit"));

  v4 = *(&self->_isIntentSelectionCacheHit + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 8) == 0)
      goto LABEL_20;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWHomeAutomationRequestMetadata isRecurring](self, "isRecurring"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isRecurring"));

  if ((*(&self->_isIntentSelectionCacheHit + 1) & 8) == 0)
    goto LABEL_20;
LABEL_16:
  v11 = -[FLOWSchemaFLOWHomeAutomationRequestMetadata smallestTargetedContainer](self, "smallestTargetedContainer") - 1;
  if (v11 > 3)
    v12 = CFSTR("FLOWHOMECONTAINERTYPE_UNKNOWN");
  else
    v12 = off_1E562DB08[v11];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("smallestTargetedContainer"));
LABEL_20:
  if (self->_targetAttribute)
  {
    -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetAttribute](self, "targetAttribute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("targetAttribute"));

  }
  if ((*(&self->_isIntentSelectionCacheHit + 1) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetedEntityCount](self, "targetedEntityCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("targetedEntityCount"));

  }
  if (self->_targetedEntityTypes)
  {
    -[FLOWSchemaFLOWHomeAutomationRequestMetadata targetedEntityTypes](self, "targetedEntityTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("targetedEntityTypes"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWHomeAutomationRequestMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWHomeAutomationRequestMetadata)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWHomeAutomationRequestMetadata *v5;
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
    self = -[FLOWSchemaFLOWHomeAutomationRequestMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWHomeAutomationRequestMetadata)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWHomeAutomationRequestMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  FLOWSchemaFLOWHomeAutomationRequestMetadata *v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FLOWSchemaFLOWHomeAutomationRequestMetadata;
  v5 = -[FLOWSchemaFLOWHomeAutomationRequestMetadata init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHomeAutomationRequestAsynchronous"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setIsHomeAutomationRequestAsynchronous:](v5, "setIsHomeAutomationRequestAsynchronous:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetedEntityCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setTargetedEntityCount:](v5, "setTargetedEntityCount:", objc_msgSend(v7, "unsignedIntValue"));
    v27 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fulfilledEntityCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setFulfilledEntityCount:](v5, "setFulfilledEntityCount:", objc_msgSend(v8, "unsignedIntValue"));
    v26 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetedEntityTypes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v6;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = (void *)objc_msgSend(v15, "copy");
              -[FLOWSchemaFLOWHomeAutomationRequestMetadata addTargetedEntityTypes:](v5, "addTargetedEntityTypes:", v16);

            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v12);
      }

      v6 = v25;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smallestTargetedContainer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setSmallestTargetedContainer:](v5, "setSmallestTargetedContainer:", objc_msgSend(v17, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetAttribute"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setTargetAttribute:](v5, "setTargetAttribute:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conditionType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setConditionType:](v5, "setConditionType:", objc_msgSend(v20, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecurring"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setIsRecurring:](v5, "setIsRecurring:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isIntentSelectionCacheHit"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationRequestMetadata setIsIntentSelectionCacheHit:](v5, "setIsIntentSelectionCacheHit:", objc_msgSend(v22, "BOOLValue"));
    v23 = v5;

  }
  return v5;
}

- (BOOL)isHomeAutomationRequestAsynchronous
{
  return self->_isHomeAutomationRequestAsynchronous;
}

- (unsigned)targetedEntityCount
{
  return self->_targetedEntityCount;
}

- (unsigned)fulfilledEntityCount
{
  return self->_fulfilledEntityCount;
}

- (NSArray)targetedEntityTypes
{
  return self->_targetedEntityTypes;
}

- (void)setTargetedEntityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)smallestTargetedContainer
{
  return self->_smallestTargetedContainer;
}

- (NSString)targetAttribute
{
  return self->_targetAttribute;
}

- (void)setTargetAttribute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)conditionType
{
  return self->_conditionType;
}

- (BOOL)isRecurring
{
  return self->_isRecurring;
}

- (BOOL)isIntentSelectionCacheHit
{
  return self->_isIntentSelectionCacheHit;
}

- (void)setHasTargetAttribute:(BOOL)a3
{
  *(&self->_isIntentSelectionCacheHit + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAttribute, 0);
  objc_storeStrong((id *)&self->_targetedEntityTypes, 0);
}

@end

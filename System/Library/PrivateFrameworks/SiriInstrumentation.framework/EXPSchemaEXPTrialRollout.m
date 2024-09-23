@implementation EXPSchemaEXPTrialRollout

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 2);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 4);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 5);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 6);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 7);
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
  v9.super_class = (Class)EXPSchemaEXPTrialRollout;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPSchemaEXPTrialRollout namespaces](self, "namespaces", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EXPSchemaEXPTrialRollout setNamespaces:](self, "setNamespaces:", v7);
  return v5;
}

- (BOOL)hasRolloutId
{
  return self->_rolloutId != 0;
}

- (void)deleteRolloutId
{
  -[EXPSchemaEXPTrialRollout setRolloutId:](self, "setRolloutId:", 0);
}

- (BOOL)hasRampId
{
  return self->_rampId != 0;
}

- (void)deleteRampId
{
  -[EXPSchemaEXPTrialRollout setRampId:](self, "setRampId:", 0);
}

- (void)setDeploymentId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deploymentId = a3;
}

- (BOOL)hasDeploymentId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDeploymentId
{
  -[EXPSchemaEXPTrialRollout setDeploymentId:](self, "setDeploymentId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_status = a3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteStatus
{
  -[EXPSchemaEXPTrialRollout setStatus:](self, "setStatus:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearNamespaces
{
  -[NSArray removeAllObjects](self->_namespaces, "removeAllObjects");
}

- (void)addNamespaces:(id)a3
{
  id v4;
  NSArray *namespaces;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  namespaces = self->_namespaces;
  v8 = v4;
  if (!namespaces)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_namespaces;
    self->_namespaces = v6;

    v4 = v8;
    namespaces = self->_namespaces;
  }
  -[NSArray addObject:](namespaces, "addObject:", v4);

}

- (unint64_t)namespacesCount
{
  return -[NSArray count](self->_namespaces, "count");
}

- (id)namespacesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_namespaces, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return EXPSchemaEXPTrialRolloutReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char has;
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
  -[EXPSchemaEXPTrialRollout rolloutId](self, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[EXPSchemaEXPTrialRollout rampId](self, "rampId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_namespaces;
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

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
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
  $1FB0A35FD2A72A818B09214CCAE01574 has;
  unsigned int v18;
  unsigned int deploymentId;
  int v20;
  int status;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[EXPSchemaEXPTrialRollout rolloutId](self, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[EXPSchemaEXPTrialRollout rolloutId](self, "rolloutId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[EXPSchemaEXPTrialRollout rolloutId](self, "rolloutId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rolloutId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_24;
  }
  else
  {

  }
  -[EXPSchemaEXPTrialRollout rampId](self, "rampId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rampId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[EXPSchemaEXPTrialRollout rampId](self, "rampId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[EXPSchemaEXPTrialRollout rampId](self, "rampId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rampId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_24;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    deploymentId = self->_deploymentId;
    if (deploymentId != objc_msgSend(v4, "deploymentId"))
      goto LABEL_24;
    has = self->_has;
    v18 = v4[40];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_24;
  if (v20)
  {
    status = self->_status;
    if (status != objc_msgSend(v4, "status"))
      goto LABEL_24;
  }
  -[EXPSchemaEXPTrialRollout namespaces](self, "namespaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namespaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  -[EXPSchemaEXPTrialRollout namespaces](self, "namespaces");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {

LABEL_27:
    v27 = 1;
    goto LABEL_25;
  }
  v23 = (void *)v22;
  -[EXPSchemaEXPTrialRollout namespaces](self, "namespaces");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namespaces");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "isEqual:", v25);

  if ((v26 & 1) != 0)
    goto LABEL_27;
LABEL_24:
  v27 = 0;
LABEL_25:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_rolloutId, "hash");
  v4 = -[NSString hash](self->_rampId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_deploymentId;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSArray hash](self->_namespaces, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_status;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSArray hash](self->_namespaces, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  const __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[EXPSchemaEXPTrialRollout deploymentId](self, "deploymentId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("deploymentId"));

  }
  if (-[NSArray count](self->_namespaces, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = self->_namespaces;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v5, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("namespaces"));
  }
  if (self->_rampId)
  {
    -[EXPSchemaEXPTrialRollout rampId](self, "rampId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("rampId"));

  }
  if (self->_rolloutId)
  {
    -[EXPSchemaEXPTrialRollout rolloutId](self, "rolloutId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("rolloutId"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v17 = -[EXPSchemaEXPTrialRollout status](self, "status") - 1;
    if (v17 > 2)
      v18 = CFSTR("EXPROLLOUTALLOCATIONSTATUS_UNKNOWN");
    else
      v18 = off_1E563A020[v17];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("status"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[EXPSchemaEXPTrialRollout dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (EXPSchemaEXPTrialRollout)initWithJSON:(id)a3
{
  void *v4;
  EXPSchemaEXPTrialRollout *v5;
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
    self = -[EXPSchemaEXPTrialRollout initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (EXPSchemaEXPTrialRollout)initWithDictionary:(id)a3
{
  id v4;
  EXPSchemaEXPTrialRollout *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  EXPSchemaEXPTrialRolloutNamespace *v19;
  EXPSchemaEXPTrialRollout *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)EXPSchemaEXPTrialRollout;
  v5 = -[EXPSchemaEXPTrialRollout init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rolloutId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[EXPSchemaEXPTrialRollout setRolloutId:](v5, "setRolloutId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rampId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[EXPSchemaEXPTrialRollout setRampId:](v5, "setRampId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deploymentId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSchemaEXPTrialRollout setDeploymentId:](v5, "setDeploymentId:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSchemaEXPTrialRollout setStatus:](v5, "setStatus:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("namespaces"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v11;
      v23 = v6;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[EXPSchemaEXPTrialRolloutNamespace initWithDictionary:]([EXPSchemaEXPTrialRolloutNamespace alloc], "initWithDictionary:", v18);
              -[EXPSchemaEXPTrialRollout addNamespaces:](v5, "addNamespaces:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v15);
      }

      v6 = v23;
      v11 = v22;
    }
    v20 = v5;

  }
  return v5;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (void)setRolloutId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)rampId
{
  return self->_rampId;
}

- (void)setRampId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)deploymentId
{
  return self->_deploymentId;
}

- (int)status
{
  return self->_status;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (void)setNamespaces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasRolloutId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasRampId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

@end

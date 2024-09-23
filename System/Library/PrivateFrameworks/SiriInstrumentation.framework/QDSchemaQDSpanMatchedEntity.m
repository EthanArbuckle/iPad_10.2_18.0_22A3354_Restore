@implementation QDSchemaQDSpanMatchedEntity

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
  int v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)QDSchemaQDSpanMatchedEntity;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDSpanMatchedEntity sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[QDSchemaQDSpanMatchedEntity deleteSessionScopedUniqueId](self, "deleteSessionScopedUniqueId");
  -[QDSchemaQDSpanMatchedEntity valueType](self, "valueType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[QDSchemaQDSpanMatchedEntity deleteValueType](self, "deleteValueType");
  -[QDSchemaQDSpanMatchedEntity matches](self, "matches");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDSpanMatchedEntity setMatches:](self, "setMatches:", v13);

  return v5;
}

- (BOOL)hasSessionScopedUniqueId
{
  return self->_sessionScopedUniqueId != 0;
}

- (void)deleteSessionScopedUniqueId
{
  -[QDSchemaQDSpanMatchedEntity setSessionScopedUniqueId:](self, "setSessionScopedUniqueId:", 0);
}

- (BOOL)hasValueType
{
  return self->_valueType != 0;
}

- (void)deleteValueType
{
  -[QDSchemaQDSpanMatchedEntity setValueType:](self, "setValueType:", 0);
}

- (void)clearMatches
{
  -[NSArray removeAllObjects](self->_matches, "removeAllObjects");
}

- (void)addMatches:(id)a3
{
  id v4;
  NSArray *matches;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  matches = self->_matches;
  v8 = v4;
  if (!matches)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matches;
    self->_matches = v6;

    v4 = v8;
    matches = self->_matches;
  }
  -[NSArray addObject:](matches, "addObject:", v4);

}

- (unint64_t)matchesCount
{
  return -[NSArray count](self->_matches, "count");
}

- (id)matchesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", a3);
}

- (void)setDataProtectionClass:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dataProtectionClass = a3;
}

- (BOOL)hasDataProtectionClass
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDataProtectionClass:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDataProtectionClass
{
  -[QDSchemaQDSpanMatchedEntity setDataProtectionClass:](self, "setDataProtectionClass:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDSpanMatchedEntityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[QDSchemaQDSpanMatchedEntity sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[QDSchemaQDSpanMatchedEntity sessionScopedUniqueId](self, "sessionScopedUniqueId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[QDSchemaQDSpanMatchedEntity valueType](self, "valueType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[QDSchemaQDSpanMatchedEntity valueType](self, "valueType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_matches;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  int dataProtectionClass;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[QDSchemaQDSpanMatchedEntity sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionScopedUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[QDSchemaQDSpanMatchedEntity sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[QDSchemaQDSpanMatchedEntity sessionScopedUniqueId](self, "sessionScopedUniqueId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionScopedUniqueId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[QDSchemaQDSpanMatchedEntity valueType](self, "valueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[QDSchemaQDSpanMatchedEntity valueType](self, "valueType");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[QDSchemaQDSpanMatchedEntity valueType](self, "valueType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[QDSchemaQDSpanMatchedEntity matches](self, "matches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[QDSchemaQDSpanMatchedEntity matches](self, "matches");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[QDSchemaQDSpanMatchedEntity matches](self, "matches");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matches");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (dataProtectionClass = self->_dataProtectionClass,
          dataProtectionClass == objc_msgSend(v4, "dataProtectionClass")))
    {
      v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[SISchemaUUID hash](self->_sessionScopedUniqueId, "hash");
  v4 = -[QDSchemaQDEntityType hash](self->_valueType, "hash");
  v5 = -[NSArray hash](self->_matches, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_dataProtectionClass;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[QDSchemaQDSpanMatchedEntity dataProtectionClass](self, "dataProtectionClass") - 1;
    if (v4 > 5)
      v5 = CFSTR("QDDATAPROTECTIONCLASS_UNKNOWN");
    else
      v5 = *(&off_1E563DDC8 + v4);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dataProtectionClass"));
  }
  if (-[NSArray count](self->_matches, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = self->_matches;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("matches"));
  }
  if (self->_sessionScopedUniqueId)
  {
    -[QDSchemaQDSpanMatchedEntity sessionScopedUniqueId](self, "sessionScopedUniqueId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("sessionScopedUniqueId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("sessionScopedUniqueId"));

    }
  }
  if (self->_valueType)
  {
    -[QDSchemaQDSpanMatchedEntity valueType](self, "valueType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("valueType"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("valueType"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v21);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[QDSchemaQDSpanMatchedEntity dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (QDSchemaQDSpanMatchedEntity)initWithJSON:(id)a3
{
  void *v4;
  QDSchemaQDSpanMatchedEntity *v5;
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
    self = -[QDSchemaQDSpanMatchedEntity initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (QDSchemaQDSpanMatchedEntity)initWithDictionary:(id)a3
{
  id v4;
  QDSchemaQDSpanMatchedEntity *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  QDSchemaQDEntityType *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  QDSchemaQDEntityMatch *v17;
  void *v18;
  QDSchemaQDSpanMatchedEntity *v19;
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
  v27.super_class = (Class)QDSchemaQDSpanMatchedEntity;
  v5 = -[QDSchemaQDSpanMatchedEntity init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionScopedUniqueId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[QDSchemaQDSpanMatchedEntity setSessionScopedUniqueId:](v5, "setSessionScopedUniqueId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[QDSchemaQDEntityType initWithDictionary:]([QDSchemaQDEntityType alloc], "initWithDictionary:", v8);
      -[QDSchemaQDSpanMatchedEntity setValueType:](v5, "setValueType:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matches"));
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
              v17 = -[QDSchemaQDEntityMatch initWithDictionary:]([QDSchemaQDEntityMatch alloc], "initWithDictionary:", v16);
              -[QDSchemaQDSpanMatchedEntity addMatches:](v5, "addMatches:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v13);
      }

      v8 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataProtectionClass"), v21, v22, (_QWORD)v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[QDSchemaQDSpanMatchedEntity setDataProtectionClass:](v5, "setDataProtectionClass:", objc_msgSend(v18, "intValue"));
    v19 = v5;

  }
  return v5;
}

- (SISchemaUUID)sessionScopedUniqueId
{
  return self->_sessionScopedUniqueId;
}

- (void)setSessionScopedUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionScopedUniqueId, a3);
}

- (QDSchemaQDEntityType)valueType
{
  return self->_valueType;
}

- (void)setValueType:(id)a3
{
  objc_storeStrong((id *)&self->_valueType, a3);
}

- (NSArray)matches
{
  return self->_matches;
}

- (void)setMatches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setHasSessionScopedUniqueId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasValueType:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matches, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_sessionScopedUniqueId, 0);
}

@end

@implementation ODDSiriSchemaODDAssistantExperimentDigestsReported

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
  v15.super_class = (Class)ODDSiriSchemaODDAssistantExperimentDigestsReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported experimentFixedDimensions](self, "experimentFixedDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDAssistantExperimentDigestsReported deleteExperimentFixedDimensions](self, "deleteExperimentFixedDimensions");
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported fixedDimensions](self, "fixedDimensions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDAssistantExperimentDigestsReported deleteFixedDimensions](self, "deleteFixedDimensions");
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported digests](self, "digests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported setDigests:](self, "setDigests:", v13);

  return v5;
}

- (void)setDigestType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_digestType = a3;
}

- (BOOL)hasDigestType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDigestType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDigestType
{
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported setDigestType:](self, "setDigestType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasExperimentFixedDimensions
{
  return self->_experimentFixedDimensions != 0;
}

- (void)deleteExperimentFixedDimensions
{
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported setExperimentFixedDimensions:](self, "setExperimentFixedDimensions:", 0);
}

- (BOOL)hasFixedDimensions
{
  return self->_fixedDimensions != 0;
}

- (void)deleteFixedDimensions
{
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported setFixedDimensions:](self, "setFixedDimensions:", 0);
}

- (void)clearDigests
{
  -[NSArray removeAllObjects](self->_digests, "removeAllObjects");
}

- (void)addDigests:(id)a3
{
  id v4;
  NSArray *digests;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  digests = self->_digests;
  v8 = v4;
  if (!digests)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_digests;
    self->_digests = v6;

    v4 = v8;
    digests = self->_digests;
  }
  -[NSArray addObject:](digests, "addObject:", v4);

}

- (unint64_t)digestsCount
{
  return -[NSArray count](self->_digests, "count");
}

- (id)digestsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_digests, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantExperimentDigestsReportedReadFrom(self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported experimentFixedDimensions](self, "experimentFixedDimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ODDSiriSchemaODDAssistantExperimentDigestsReported experimentFixedDimensions](self, "experimentFixedDimensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported fixedDimensions](self, "fixedDimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ODDSiriSchemaODDAssistantExperimentDigestsReported fixedDimensions](self, "fixedDimensions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_digests;
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

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int digestType;
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
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    digestType = self->_digestType;
    if (digestType != objc_msgSend(v4, "digestType"))
      goto LABEL_20;
  }
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported experimentFixedDimensions](self, "experimentFixedDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentFixedDimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported experimentFixedDimensions](self, "experimentFixedDimensions");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODDSiriSchemaODDAssistantExperimentDigestsReported experimentFixedDimensions](self, "experimentFixedDimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentFixedDimensions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported fixedDimensions](self, "fixedDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fixedDimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported fixedDimensions](self, "fixedDimensions");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ODDSiriSchemaODDAssistantExperimentDigestsReported fixedDimensions](self, "fixedDimensions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fixedDimensions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentDigestsReported digests](self, "digests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "digests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ODDSiriSchemaODDAssistantExperimentDigestsReported digests](self, "digests");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[ODDSiriSchemaODDAssistantExperimentDigestsReported digests](self, "digests");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "digests");
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_digestType;
  else
    v3 = 0;
  v4 = -[ODDSiriSchemaODDExperimentFixedDimensions hash](self->_experimentFixedDimensions, "hash") ^ v3;
  v5 = -[ODDSiriSchemaODDFixedDimensions hash](self->_fixedDimensions, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_digests, "hash");
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
    v4 = -[ODDSiriSchemaODDAssistantExperimentDigestsReported digestType](self, "digestType") - 1;
    if (v4 > 3)
      v5 = CFSTR("ODDEXPERIMENTDIGESTTYPE_UNKNOWN");
    else
      v5 = off_1E563BC18[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("digestType"));
  }
  if (-[NSArray count](self->_digests, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = self->_digests;
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

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("digests"));
  }
  if (self->_experimentFixedDimensions)
  {
    -[ODDSiriSchemaODDAssistantExperimentDigestsReported experimentFixedDimensions](self, "experimentFixedDimensions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("experimentFixedDimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("experimentFixedDimensions"));

    }
  }
  if (self->_fixedDimensions)
  {
    -[ODDSiriSchemaODDAssistantExperimentDigestsReported fixedDimensions](self, "fixedDimensions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("fixedDimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("fixedDimensions"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v21);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssistantExperimentDigestsReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAssistantExperimentDigestsReported)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *v5;
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
    self = -[ODDSiriSchemaODDAssistantExperimentDigestsReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssistantExperimentDigestsReported)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *v5;
  void *v6;
  void *v7;
  ODDSiriSchemaODDExperimentFixedDimensions *v8;
  void *v9;
  ODDSiriSchemaODDFixedDimensions *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  ODDSiriSchemaODDAssistantExperimentDigest *v18;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *v19;
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
  v27.super_class = (Class)ODDSiriSchemaODDAssistantExperimentDigestsReported;
  v5 = -[ODDSiriSchemaODDAssistantExperimentDigestsReported init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("digestType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantExperimentDigestsReported setDigestType:](v5, "setDigestType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentFixedDimensions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[ODDSiriSchemaODDExperimentFixedDimensions initWithDictionary:]([ODDSiriSchemaODDExperimentFixedDimensions alloc], "initWithDictionary:", v7);
      -[ODDSiriSchemaODDAssistantExperimentDigestsReported setExperimentFixedDimensions:](v5, "setExperimentFixedDimensions:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fixedDimensions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[ODDSiriSchemaODDFixedDimensions initWithDictionary:]([ODDSiriSchemaODDFixedDimensions alloc], "initWithDictionary:", v9);
      -[ODDSiriSchemaODDAssistantExperimentDigestsReported setFixedDimensions:](v5, "setFixedDimensions:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("digests"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v9;
      v22 = v6;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = -[ODDSiriSchemaODDAssistantExperimentDigest initWithDictionary:]([ODDSiriSchemaODDAssistantExperimentDigest alloc], "initWithDictionary:", v17);
              -[ODDSiriSchemaODDAssistantExperimentDigestsReported addDigests:](v5, "addDigests:", v18);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v14);
      }

      v6 = v22;
      v9 = v21;
    }
    v19 = v5;

  }
  return v5;
}

- (int)digestType
{
  return self->_digestType;
}

- (ODDSiriSchemaODDExperimentFixedDimensions)experimentFixedDimensions
{
  return self->_experimentFixedDimensions;
}

- (void)setExperimentFixedDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_experimentFixedDimensions, a3);
}

- (ODDSiriSchemaODDFixedDimensions)fixedDimensions
{
  return self->_fixedDimensions;
}

- (void)setFixedDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_fixedDimensions, a3);
}

- (NSArray)digests
{
  return self->_digests;
}

- (void)setDigests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasExperimentFixedDimensions:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasFixedDimensions:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digests, 0);
  objc_storeStrong((id *)&self->_fixedDimensions, 0);
  objc_storeStrong((id *)&self->_experimentFixedDimensions, 0);
}

@end

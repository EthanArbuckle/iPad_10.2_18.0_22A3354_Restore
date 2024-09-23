@implementation ODMSiriSchemaODMSiriCountsReportedAll

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
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODMSiriSchemaODMSiriCountsReportedAll;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMSiriCountsReportedAll aggregationInterval](self, "aggregationInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODMSiriSchemaODMSiriCountsReportedAll deleteAggregationInterval](self, "deleteAggregationInterval");
  -[ODMSiriSchemaODMSiriCountsReportedAll siriCountsAlls](self, "siriCountsAlls");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMSiriCountsReportedAll setSiriCountsAlls:](self, "setSiriCountsAlls:", v10);

  return v5;
}

- (BOOL)hasAggregationInterval
{
  return self->_aggregationInterval != 0;
}

- (void)deleteAggregationInterval
{
  -[ODMSiriSchemaODMSiriCountsReportedAll setAggregationInterval:](self, "setAggregationInterval:", 0);
}

- (void)clearSiriCountsAll
{
  -[NSArray removeAllObjects](self->_siriCountsAlls, "removeAllObjects");
}

- (void)addSiriCountsAll:(id)a3
{
  id v4;
  NSArray *siriCountsAlls;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  siriCountsAlls = self->_siriCountsAlls;
  v8 = v4;
  if (!siriCountsAlls)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_siriCountsAlls;
    self->_siriCountsAlls = v6;

    v4 = v8;
    siriCountsAlls = self->_siriCountsAlls;
  }
  -[NSArray addObject:](siriCountsAlls, "addObject:", v4);

}

- (unint64_t)siriCountsAllCount
{
  return -[NSArray count](self->_siriCountsAlls, "count");
}

- (id)siriCountsAllAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_siriCountsAlls, "objectAtIndexedSubscript:", a3);
}

- (void)clearSegments
{
  -[NSArray removeAllObjects](self->_segments, "removeAllObjects");
}

- (void)addSegments:(int)a3
{
  uint64_t v3;
  NSArray *segments;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  segments = self->_segments;
  if (!segments)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_segments;
    self->_segments = v6;

    segments = self->_segments;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](segments, "addObject:", v8);

}

- (unint64_t)segmentsCount
{
  return -[NSArray count](self->_segments, "count");
}

- (int)segmentsAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriCountsReportedAllReadFrom(self, (uint64_t)a3);
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
  -[ODMSiriSchemaODMSiriCountsReportedAll aggregationInterval](self, "aggregationInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ODMSiriSchemaODMSiriCountsReportedAll aggregationInterval](self, "aggregationInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_siriCountsAlls;
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

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_segments;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16), "intValue", (_QWORD)v17);
        PBDataWriterWriteInt32Field();
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
  id v4;
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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[ODMSiriSchemaODMSiriCountsReportedAll aggregationInterval](self, "aggregationInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggregationInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ODMSiriSchemaODMSiriCountsReportedAll aggregationInterval](self, "aggregationInterval");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODMSiriSchemaODMSiriCountsReportedAll aggregationInterval](self, "aggregationInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aggregationInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[ODMSiriSchemaODMSiriCountsReportedAll siriCountsAlls](self, "siriCountsAlls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriCountsAlls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ODMSiriSchemaODMSiriCountsReportedAll siriCountsAlls](self, "siriCountsAlls");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODMSiriSchemaODMSiriCountsReportedAll siriCountsAlls](self, "siriCountsAlls");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriCountsAlls");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[ODMSiriSchemaODMSiriCountsReportedAll segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "segments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODMSiriSchemaODMSiriCountsReportedAll segments](self, "segments");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[ODMSiriSchemaODMSiriCountsReportedAll segments](self, "segments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "segments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[ODMSiriSchemaODMSiriAggregationInterval hash](self->_aggregationInterval, "hash");
  v4 = -[NSArray hash](self->_siriCountsAlls, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_segments, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aggregationInterval)
  {
    -[ODMSiriSchemaODMSiriCountsReportedAll aggregationInterval](self, "aggregationInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aggregationInterval"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("aggregationInterval"));

    }
  }
  if (-[NSArray count](self->_segments, "count"))
  {
    -[ODMSiriSchemaODMSiriCountsReportedAll segments](self, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("segments"));

  }
  if (-[NSArray count](self->_siriCountsAlls, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = self->_siriCountsAlls;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v9, "addObject:", v15);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("siriCountsAll"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v18);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMSiriCountsReportedAll dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMSiriCountsReportedAll)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMSiriCountsReportedAll *v5;
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
    self = -[ODMSiriSchemaODMSiriCountsReportedAll initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMSiriCountsReportedAll)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMSiriCountsReportedAll *v5;
  void *v6;
  ODMSiriSchemaODMSiriAggregationInterval *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ODMSiriSchemaODMSiriCountsAll *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  ODMSiriSchemaODMSiriCountsReportedAll *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ODMSiriSchemaODMSiriCountsReportedAll;
  v5 = -[ODMSiriSchemaODMSiriCountsReportedAll init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregationInterval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODMSiriSchemaODMSiriAggregationInterval initWithDictionary:]([ODMSiriSchemaODMSiriAggregationInterval alloc], "initWithDictionary:", v6);
      -[ODMSiriSchemaODMSiriCountsReportedAll setAggregationInterval:](v5, "setAggregationInterval:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriCountsAll"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v25 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v31;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v31 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[ODMSiriSchemaODMSiriCountsAll initWithDictionary:]([ODMSiriSchemaODMSiriCountsAll alloc], "initWithDictionary:", v14);
              -[ODMSiriSchemaODMSiriCountsReportedAll addSiriCountsAll:](v5, "addSiriCountsAll:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v11);
      }

      v6 = v25;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("segments"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v27;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v27 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v21);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ODMSiriSchemaODMSiriCountsReportedAll addSegments:](v5, "addSegments:", objc_msgSend(v22, "intValue"));
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        }
        while (v19);
      }

      v6 = v25;
    }
    v23 = v5;

  }
  return v5;
}

- (ODMSiriSchemaODMSiriAggregationInterval)aggregationInterval
{
  return self->_aggregationInterval;
}

- (void)setAggregationInterval:(id)a3
{
  objc_storeStrong((id *)&self->_aggregationInterval, a3);
}

- (NSArray)siriCountsAlls
{
  return self->_siriCountsAlls;
}

- (void)setSiriCountsAlls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasAggregationInterval:(BOOL)a3
{
  self->_hasAggregationInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_siriCountsAlls, 0);
  objc_storeStrong((id *)&self->_aggregationInterval, 0);
}

@end

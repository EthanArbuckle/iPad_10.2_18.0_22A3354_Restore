@implementation FLSchemaFLTaskEvaluationNode

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setEvaluator:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_evaluator = a3;
}

- (BOOL)hasEvaluator
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEvaluator:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEvaluator
{
  -[FLSchemaFLTaskEvaluationNode setEvaluator:](self, "setEvaluator:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setResult:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_result = a3;
}

- (BOOL)hasResult
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteResult
{
  -[FLSchemaFLTaskEvaluationNode setResult:](self, "setResult:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearSources
{
  -[NSArray removeAllObjects](self->_sources, "removeAllObjects");
}

- (void)addSources:(int)a3
{
  uint64_t v3;
  NSArray *sources;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  sources = self->_sources;
  if (!sources)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sources;
    self->_sources = v6;

    sources = self->_sources;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](sources, "addObject:", v8);

}

- (unint64_t)sourcesCount
{
  return -[NSArray count](self->_sources, "count");
}

- (int)sourcesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_sources, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLTaskEvaluationNodeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_sources;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue", (_QWORD)v11);
        PBDataWriterWriteInt32Field();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $B888374F8F070C789160E1F388FAAB2F has;
  unsigned int v6;
  int evaluator;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    evaluator = self->_evaluator;
    if (evaluator != objc_msgSend(v4, "evaluator"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (v9 = self->_result, v9 == objc_msgSend(v4, "result")))
    {
      -[FLSchemaFLTaskEvaluationNode sources](self, "sources");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sources");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[FLSchemaFLTaskEvaluationNode sources](self, "sources");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[FLSchemaFLTaskEvaluationNode sources](self, "sources");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sources");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_evaluator;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSArray hash](self->_sources, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_result;
  return v3 ^ v2 ^ -[NSArray hash](self->_sources, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[FLSchemaFLTaskEvaluationNode evaluator](self, "evaluator") - 1;
    if (v5 > 4)
      v6 = CFSTR("FLEVALUATOR_UNKNOWN");
    else
      v6 = *(&off_1E563EA48 + v5);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("evaluator"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = -[FLSchemaFLTaskEvaluationNode result](self, "result") - 1;
    if (v7 > 2)
      v8 = CFSTR("FLEVALUATIONVOTE_UNKNOWN");
    else
      v8 = *(&off_1E563EA70 + v7);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("result"));
  }
  if (-[NSArray count](self->_sources, "count"))
  {
    -[FLSchemaFLTaskEvaluationNode sources](self, "sources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("sources"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLSchemaFLTaskEvaluationNode dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLSchemaFLTaskEvaluationNode)initWithJSON:(id)a3
{
  void *v4;
  FLSchemaFLTaskEvaluationNode *v5;
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
    self = -[FLSchemaFLTaskEvaluationNode initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLSchemaFLTaskEvaluationNode)initWithDictionary:(id)a3
{
  id v4;
  FLSchemaFLTaskEvaluationNode *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  FLSchemaFLTaskEvaluationNode *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FLSchemaFLTaskEvaluationNode;
  v5 = -[FLSchemaFLTaskEvaluationNode init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLTaskEvaluationNode setEvaluator:](v5, "setEvaluator:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLTaskEvaluationNode setResult:](v5, "setResult:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sources"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v6;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLSchemaFLTaskEvaluationNode addSources:](v5, "addSources:", objc_msgSend(v14, "intValue"));
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v11);
      }

      v6 = v17;
    }
    v15 = v5;

  }
  return v5;
}

- (int)evaluator
{
  return self->_evaluator;
}

- (int)result
{
  return self->_result;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
}

@end

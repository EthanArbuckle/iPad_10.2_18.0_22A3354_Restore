@implementation CAARSchemaCAARTieBreaker

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
  v9.super_class = (Class)CAARSchemaCAARTieBreaker;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAARSchemaCAARTieBreaker actionCandidateBoosts](self, "actionCandidateBoosts", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAARSchemaCAARTieBreaker setActionCandidateBoosts:](self, "setActionCandidateBoosts:", v7);
  return v5;
}

- (BOOL)hasTieBreakerName
{
  return self->_tieBreakerName != 0;
}

- (void)deleteTieBreakerName
{
  -[CAARSchemaCAARTieBreaker setTieBreakerName:](self, "setTieBreakerName:", 0);
}

- (void)clearActionCandidateBoosts
{
  -[NSArray removeAllObjects](self->_actionCandidateBoosts, "removeAllObjects");
}

- (void)addActionCandidateBoosts:(id)a3
{
  id v4;
  NSArray *actionCandidateBoosts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  actionCandidateBoosts = self->_actionCandidateBoosts;
  v8 = v4;
  if (!actionCandidateBoosts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_actionCandidateBoosts;
    self->_actionCandidateBoosts = v6;

    v4 = v8;
    actionCandidateBoosts = self->_actionCandidateBoosts;
  }
  -[NSArray addObject:](actionCandidateBoosts, "addObject:", v4);

}

- (unint64_t)actionCandidateBoostsCount
{
  return -[NSArray count](self->_actionCandidateBoosts, "count");
}

- (id)actionCandidateBoostsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_actionCandidateBoosts, "objectAtIndexedSubscript:", a3);
}

- (void)setIsTieBreakerSupported:(BOOL)a3
{
  *(&self->_wasTieBreakerForcedSkipped + 1) |= 1u;
  self->_isTieBreakerSupported = a3;
}

- (BOOL)hasIsTieBreakerSupported
{
  return *(&self->_wasTieBreakerForcedSkipped + 1);
}

- (void)setHasIsTieBreakerSupported:(BOOL)a3
{
  *(&self->_wasTieBreakerForcedSkipped + 1) = *(&self->_wasTieBreakerForcedSkipped + 1) & 0xFE | a3;
}

- (void)deleteIsTieBreakerSupported
{
  -[CAARSchemaCAARTieBreaker setIsTieBreakerSupported:](self, "setIsTieBreakerSupported:", 0);
  *(&self->_wasTieBreakerForcedSkipped + 1) &= ~1u;
}

- (void)setWasTieBreakerForcedSkipped:(BOOL)a3
{
  *(&self->_wasTieBreakerForcedSkipped + 1) |= 2u;
  self->_wasTieBreakerForcedSkipped = a3;
}

- (BOOL)hasWasTieBreakerForcedSkipped
{
  return (*((unsigned __int8 *)&self->_wasTieBreakerForcedSkipped + 1) >> 1) & 1;
}

- (void)setHasWasTieBreakerForcedSkipped:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_wasTieBreakerForcedSkipped + 1) = *(&self->_wasTieBreakerForcedSkipped + 1) & 0xFD | v3;
}

- (void)deleteWasTieBreakerForcedSkipped
{
  -[CAARSchemaCAARTieBreaker setWasTieBreakerForcedSkipped:](self, "setWasTieBreakerForcedSkipped:", 0);
  *(&self->_wasTieBreakerForcedSkipped + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARTieBreakerReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAARSchemaCAARTieBreaker tieBreakerName](self, "tieBreakerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_actionCandidateBoosts;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *(&self->_wasTieBreakerForcedSkipped + 1);
  if ((v11 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = *(&self->_wasTieBreakerForcedSkipped + 1);
  }
  if ((v11 & 2) != 0)
    PBDataWriterWriteBOOLField();

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
  BOOL v17;
  unsigned int v19;
  unsigned int v20;
  int isTieBreakerSupported;
  int v22;
  int wasTieBreakerForcedSkipped;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[CAARSchemaCAARTieBreaker tieBreakerName](self, "tieBreakerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tieBreakerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[CAARSchemaCAARTieBreaker tieBreakerName](self, "tieBreakerName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CAARSchemaCAARTieBreaker tieBreakerName](self, "tieBreakerName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tieBreakerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[CAARSchemaCAARTieBreaker actionCandidateBoosts](self, "actionCandidateBoosts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionCandidateBoosts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[CAARSchemaCAARTieBreaker actionCandidateBoosts](self, "actionCandidateBoosts");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[CAARSchemaCAARTieBreaker actionCandidateBoosts](self, "actionCandidateBoosts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionCandidateBoosts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = *((unsigned __int8 *)&self->_wasTieBreakerForcedSkipped + 1);
  v20 = v4[26];
  if ((v19 & 1) == (v20 & 1))
  {
    if ((v19 & 1) != 0)
    {
      isTieBreakerSupported = self->_isTieBreakerSupported;
      if (isTieBreakerSupported != objc_msgSend(v4, "isTieBreakerSupported"))
        goto LABEL_12;
      v19 = *((unsigned __int8 *)&self->_wasTieBreakerForcedSkipped + 1);
      v20 = v4[26];
    }
    v22 = (v19 >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22
        || (wasTieBreakerForcedSkipped = self->_wasTieBreakerForcedSkipped,
            wasTieBreakerForcedSkipped == objc_msgSend(v4, "wasTieBreakerForcedSkipped")))
      {
        v17 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_tieBreakerName, "hash");
  v4 = -[NSArray hash](self->_actionCandidateBoosts, "hash");
  if (*(&self->_wasTieBreakerForcedSkipped + 1))
  {
    v5 = 2654435761 * self->_isTieBreakerSupported;
    if ((*(&self->_wasTieBreakerForcedSkipped + 1) & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(&self->_wasTieBreakerForcedSkipped + 1) & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_wasTieBreakerForcedSkipped;
  return v4 ^ v3 ^ v5 ^ v6;
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
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_actionCandidateBoosts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_actionCandidateBoosts;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("actionCandidateBoosts"));
  }
  if (*(&self->_wasTieBreakerForcedSkipped + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARTieBreaker isTieBreakerSupported](self, "isTieBreakerSupported"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isTieBreakerSupported"));

  }
  if (self->_tieBreakerName)
  {
    -[CAARSchemaCAARTieBreaker tieBreakerName](self, "tieBreakerName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("tieBreakerName"));

  }
  if ((*(&self->_wasTieBreakerForcedSkipped + 1) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARTieBreaker wasTieBreakerForcedSkipped](self, "wasTieBreakerForcedSkipped"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("wasTieBreakerForcedSkipped"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v17);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARTieBreaker dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARTieBreaker)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARTieBreaker *v5;
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
    self = -[CAARSchemaCAARTieBreaker initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARTieBreaker)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARTieBreaker *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CAARSchemaCAARScoreBoost *v15;
  void *v16;
  void *v17;
  CAARSchemaCAARTieBreaker *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CAARSchemaCAARTieBreaker;
  v5 = -[CAARSchemaCAARTieBreaker init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tieBreakerName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[CAARSchemaCAARTieBreaker setTieBreakerName:](v5, "setTieBreakerName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCandidateBoosts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v6;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[CAARSchemaCAARScoreBoost initWithDictionary:]([CAARSchemaCAARScoreBoost alloc], "initWithDictionary:", v14);
              -[CAARSchemaCAARTieBreaker addActionCandidateBoosts:](v5, "addActionCandidateBoosts:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v11);
      }

      v6 = v20;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTieBreakerSupported"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARTieBreaker setIsTieBreakerSupported:](v5, "setIsTieBreakerSupported:", objc_msgSend(v16, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasTieBreakerForcedSkipped"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARTieBreaker setWasTieBreakerForcedSkipped:](v5, "setWasTieBreakerForcedSkipped:", objc_msgSend(v17, "BOOLValue"));
    v18 = v5;

  }
  return v5;
}

- (NSString)tieBreakerName
{
  return self->_tieBreakerName;
}

- (void)setTieBreakerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)actionCandidateBoosts
{
  return self->_actionCandidateBoosts;
}

- (void)setActionCandidateBoosts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isTieBreakerSupported
{
  return self->_isTieBreakerSupported;
}

- (BOOL)wasTieBreakerForcedSkipped
{
  return self->_wasTieBreakerForcedSkipped;
}

- (void)setHasTieBreakerName:(BOOL)a3
{
  *(&self->_wasTieBreakerForcedSkipped + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionCandidateBoosts, 0);
  objc_storeStrong((id *)&self->_tieBreakerName, 0);
}

@end

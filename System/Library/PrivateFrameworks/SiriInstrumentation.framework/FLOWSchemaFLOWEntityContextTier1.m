@implementation FLOWSchemaFLOWEntityContextTier1

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
  int v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLOWSchemaFLOWEntityContextTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWEntityContextTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWEntityContextTier1 deleteLinkId](self, "deleteLinkId");
  -[FLOWSchemaFLOWEntityContextTier1 entitiesPresenteds](self, "entitiesPresenteds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWEntityContextTier1 setEntitiesPresenteds:](self, "setEntitiesPresenteds:", v10);

  -[FLOWSchemaFLOWEntityContextTier1 entitySelected](self, "entitySelected");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[FLOWSchemaFLOWEntityContextTier1 deleteEntitySelected](self, "deleteEntitySelected");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[FLOWSchemaFLOWEntityContextTier1 setLinkId:](self, "setLinkId:", 0);
}

- (void)clearEntitiesPresented
{
  -[NSArray removeAllObjects](self->_entitiesPresenteds, "removeAllObjects");
}

- (void)addEntitiesPresented:(id)a3
{
  id v4;
  NSArray *entitiesPresenteds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  entitiesPresenteds = self->_entitiesPresenteds;
  v8 = v4;
  if (!entitiesPresenteds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_entitiesPresenteds;
    self->_entitiesPresenteds = v6;

    v4 = v8;
    entitiesPresenteds = self->_entitiesPresenteds;
  }
  -[NSArray addObject:](entitiesPresenteds, "addObject:", v4);

}

- (unint64_t)entitiesPresentedCount
{
  return -[NSArray count](self->_entitiesPresenteds, "count");
}

- (id)entitiesPresentedAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_entitiesPresenteds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasEntitySelected
{
  return self->_entitySelected != 0;
}

- (void)deleteEntitySelected
{
  -[FLOWSchemaFLOWEntityContextTier1 setEntitySelected:](self, "setEntitySelected:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWEntityContextTier1ReadFrom(self, (uint64_t)a3);
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
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FLOWSchemaFLOWEntityContextTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FLOWSchemaFLOWEntityContextTier1 linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_entitiesPresenteds;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[FLOWSchemaFLOWEntityContextTier1 entitySelected](self, "entitySelected", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FLOWSchemaFLOWEntityContextTier1 entitySelected](self, "entitySelected");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  -[FLOWSchemaFLOWEntityContextTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[FLOWSchemaFLOWEntityContextTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWEntityContextTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[FLOWSchemaFLOWEntityContextTier1 entitiesPresenteds](self, "entitiesPresenteds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitiesPresenteds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[FLOWSchemaFLOWEntityContextTier1 entitiesPresenteds](self, "entitiesPresenteds");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWEntityContextTier1 entitiesPresenteds](self, "entitiesPresenteds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitiesPresenteds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[FLOWSchemaFLOWEntityContextTier1 entitySelected](self, "entitySelected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitySelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWEntityContextTier1 entitySelected](self, "entitySelected");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[FLOWSchemaFLOWEntityContextTier1 entitySelected](self, "entitySelected");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitySelected");
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

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSArray hash](self->_entitiesPresenteds, "hash") ^ v3;
  return v4 ^ -[FLOWSchemaFLOWEntityTier1 hash](self->_entitySelected, "hash");
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
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_entitiesPresenteds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = self->_entitiesPresenteds;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("entitiesPresented"));
  }
  if (self->_entitySelected)
  {
    -[FLOWSchemaFLOWEntityContextTier1 entitySelected](self, "entitySelected");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("entitySelected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("entitySelected"));

    }
  }
  if (self->_linkId)
  {
    -[FLOWSchemaFLOWEntityContextTier1 linkId](self, "linkId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("linkId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v19);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWEntityContextTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWEntityContextTier1)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWEntityContextTier1 *v5;
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
    self = -[FLOWSchemaFLOWEntityContextTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWEntityContextTier1)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWEntityContextTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FLOWSchemaFLOWEntityTier1 *v15;
  void *v16;
  FLOWSchemaFLOWEntityTier1 *v17;
  FLOWSchemaFLOWEntityContextTier1 *v18;
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
  v25.super_class = (Class)FLOWSchemaFLOWEntityContextTier1;
  v5 = -[FLOWSchemaFLOWEntityContextTier1 init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWEntityContextTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitiesPresented"));
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
              v15 = -[FLOWSchemaFLOWEntityTier1 initWithDictionary:]([FLOWSchemaFLOWEntityTier1 alloc], "initWithDictionary:", v14);
              -[FLOWSchemaFLOWEntityContextTier1 addEntitiesPresented:](v5, "addEntitiesPresented:", v15);

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
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySelected"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[FLOWSchemaFLOWEntityTier1 initWithDictionary:]([FLOWSchemaFLOWEntityTier1 alloc], "initWithDictionary:", v16);
      -[FLOWSchemaFLOWEntityContextTier1 setEntitySelected:](v5, "setEntitySelected:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (NSArray)entitiesPresenteds
{
  return self->_entitiesPresenteds;
}

- (void)setEntitiesPresenteds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FLOWSchemaFLOWEntityTier1)entitySelected
{
  return self->_entitySelected;
}

- (void)setEntitySelected:(id)a3
{
  objc_storeStrong((id *)&self->_entitySelected, a3);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasEntitySelected:(BOOL)a3
{
  self->_hasEntitySelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitySelected, 0);
  objc_storeStrong((id *)&self->_entitiesPresenteds, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end

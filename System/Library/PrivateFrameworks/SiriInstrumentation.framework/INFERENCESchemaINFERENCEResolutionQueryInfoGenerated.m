@implementation INFERENCESchemaINFERENCEResolutionQueryInfoGenerated

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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCEResolutionQueryInfoGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated deleteOriginalResolutionContextId](self, "deleteOriginalResolutionContextId");
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated queryId](self, "queryId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated deleteQueryId](self, "deleteQueryId");

  return v5;
}

- (BOOL)hasOriginalResolutionContextId
{
  return self->_originalResolutionContextId != 0;
}

- (void)deleteOriginalResolutionContextId
{
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setOriginalResolutionContextId:](self, "setOriginalResolutionContextId:", 0);
}

- (BOOL)hasQueryId
{
  return self->_queryId != 0;
}

- (void)deleteQueryId
{
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setQueryId:](self, "setQueryId:", 0);
}

- (void)setResolutionState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resolutionState = a3;
}

- (BOOL)hasResolutionState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResolutionState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteResolutionState
{
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setResolutionState:](self, "setResolutionState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setForcePromptType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_forcePromptType = a3;
}

- (BOOL)hasForcePromptType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasForcePromptType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteForcePromptType
{
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setForcePromptType:](self, "setForcePromptType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasRecommenderModelVersion
{
  return self->_recommenderModelVersion != 0;
}

- (void)deleteRecommenderModelVersion
{
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setRecommenderModelVersion:](self, "setRecommenderModelVersion:", 0);
}

- (void)clearAnonymizedRecommendedEntityIdentifier
{
  -[NSArray removeAllObjects](self->_anonymizedRecommendedEntityIdentifiers, "removeAllObjects");
}

- (void)addAnonymizedRecommendedEntityIdentifier:(id)a3
{
  id v4;
  NSArray *anonymizedRecommendedEntityIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  anonymizedRecommendedEntityIdentifiers = self->_anonymizedRecommendedEntityIdentifiers;
  v8 = v4;
  if (!anonymizedRecommendedEntityIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_anonymizedRecommendedEntityIdentifiers;
    self->_anonymizedRecommendedEntityIdentifiers = v6;

    v4 = v8;
    anonymizedRecommendedEntityIdentifiers = self->_anonymizedRecommendedEntityIdentifiers;
  }
  -[NSArray addObject:](anonymizedRecommendedEntityIdentifiers, "addObject:", v4);

}

- (unint64_t)anonymizedRecommendedEntityIdentifierCount
{
  return -[NSArray count](self->_anonymizedRecommendedEntityIdentifiers, "count");
}

- (id)anonymizedRecommendedEntityIdentifierAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_anonymizedRecommendedEntityIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEResolutionQueryInfoGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated queryId](self, "queryId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated queryId](self, "queryId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated recommenderModelVersion](self, "recommenderModelVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_anonymizedRecommendedEntityIdentifiers;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
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
  $B59FB5E837908BB473A427058DAC41A6 has;
  unsigned int v18;
  int resolutionState;
  int v20;
  int forcePromptType;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalResolutionContextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalResolutionContextId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_29;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated queryId](self, "queryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated queryId](self, "queryId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated queryId](self, "queryId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_29;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_29;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    resolutionState = self->_resolutionState;
    if (resolutionState != objc_msgSend(v4, "resolutionState"))
      goto LABEL_29;
    has = self->_has;
    v18 = v4[48];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_29;
  if (v20)
  {
    forcePromptType = self->_forcePromptType;
    if (forcePromptType != objc_msgSend(v4, "forcePromptType"))
      goto LABEL_29;
  }
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated recommenderModelVersion](self, "recommenderModelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recommenderModelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated recommenderModelVersion](self, "recommenderModelVersion");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated recommenderModelVersion](self, "recommenderModelVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recommenderModelVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_29;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated anonymizedRecommendedEntityIdentifiers](self, "anonymizedRecommendedEntityIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymizedRecommendedEntityIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated anonymizedRecommendedEntityIdentifiers](self, "anonymizedRecommendedEntityIdentifiers");
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
  {

LABEL_32:
    v32 = 1;
    goto LABEL_30;
  }
  v28 = (void *)v27;
  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated anonymizedRecommendedEntityIdentifiers](self, "anonymizedRecommendedEntityIdentifiers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymizedRecommendedEntityIdentifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "isEqual:", v30);

  if ((v31 & 1) != 0)
    goto LABEL_32;
LABEL_29:
  v32 = 0;
LABEL_30:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[SISchemaUUID hash](self->_originalResolutionContextId, "hash");
  v4 = -[SISchemaUUID hash](self->_queryId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_resolutionState;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_forcePromptType;
LABEL_6:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_recommenderModelVersion, "hash");
  return v7 ^ -[NSArray hash](self->_anonymizedRecommendedEntityIdentifiers, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_anonymizedRecommendedEntityIdentifiers)
  {
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated anonymizedRecommendedEntityIdentifiers](self, "anonymizedRecommendedEntityIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("anonymizedRecommendedEntityIdentifier"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated forcePromptType](self, "forcePromptType") - 1;
    if (v6 > 7)
      v7 = CFSTR("INFERENCEFORCEPROMPTTYPE_UNKNOWN");
    else
      v7 = off_1E562FCF8[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("forcePromptType"));
  }
  if (self->_originalResolutionContextId)
  {
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originalResolutionContextId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("originalResolutionContextId"));

    }
  }
  if (self->_queryId)
  {
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated queryId](self, "queryId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("queryId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("queryId"));

    }
  }
  if (self->_recommenderModelVersion)
  {
    -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated recommenderModelVersion](self, "recommenderModelVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("recommenderModelVersion"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v16 = -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated resolutionState](self, "resolutionState") - 1;
    if (v16 > 3)
      v17 = CFSTR("INFERENCERESOLUTIONSTATE_UNKNOWN");
    else
      v17 = off_1E562FD38[v16];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("resolutionState"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *v5;
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
    self = -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *v22;
  void *v24;
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
  v32.super_class = (Class)INFERENCESchemaINFERENCEResolutionQueryInfoGenerated;
  v5 = -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalResolutionContextId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setOriginalResolutionContextId:](v5, "setOriginalResolutionContextId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setQueryId:](v5, "setQueryId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolutionState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setResolutionState:](v5, "setResolutionState:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forcePromptType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setForcePromptType:](v5, "setForcePromptType:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommenderModelVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated setRecommenderModelVersion:](v5, "setRecommenderModelVersion:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anonymizedRecommendedEntityIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v11;
      v25 = v10;
      v26 = v8;
      v27 = v6;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v29;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = (void *)objc_msgSend(v20, "copy");
              -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated addAnonymizedRecommendedEntityIdentifier:](v5, "addAnonymizedRecommendedEntityIdentifier:", v21);

            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v17);
      }

      v8 = v26;
      v6 = v27;
      v11 = v24;
      v10 = v25;
    }
    v22 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalResolutionContextId
{
  return self->_originalResolutionContextId;
}

- (void)setOriginalResolutionContextId:(id)a3
{
  objc_storeStrong((id *)&self->_originalResolutionContextId, a3);
}

- (SISchemaUUID)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(id)a3
{
  objc_storeStrong((id *)&self->_queryId, a3);
}

- (int)resolutionState
{
  return self->_resolutionState;
}

- (int)forcePromptType
{
  return self->_forcePromptType;
}

- (NSString)recommenderModelVersion
{
  return self->_recommenderModelVersion;
}

- (void)setRecommenderModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)anonymizedRecommendedEntityIdentifiers
{
  return self->_anonymizedRecommendedEntityIdentifiers;
}

- (void)setAnonymizedRecommendedEntityIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHasOriginalResolutionContextId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasQueryId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasRecommenderModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizedRecommendedEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_recommenderModelVersion, 0);
  objc_storeStrong((id *)&self->_queryId, 0);
  objc_storeStrong((id *)&self->_originalResolutionContextId, 0);
}

@end

@implementation QDSchemaQDRetrievedTool

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
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)QDSchemaQDRetrievedTool;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[QDSchemaQDRetrievedTool deleteToolId](self, "deleteToolId");
  -[QDSchemaQDRetrievedTool sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[QDSchemaQDRetrievedTool deleteSessionScopedUniqueId](self, "deleteSessionScopedUniqueId");
  -[QDSchemaQDRetrievedTool toolSource](self, "toolSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[QDSchemaQDRetrievedTool deleteToolSource](self, "deleteToolSource");
  -[QDSchemaQDRetrievedTool toolDefinition](self, "toolDefinition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[QDSchemaQDRetrievedTool deleteToolDefinition](self, "deleteToolDefinition");

  return v5;
}

- (BOOL)hasSessionScopedUniqueId
{
  return self->_sessionScopedUniqueId != 0;
}

- (void)deleteSessionScopedUniqueId
{
  -[QDSchemaQDRetrievedTool setSessionScopedUniqueId:](self, "setSessionScopedUniqueId:", 0);
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

- (void)deleteToolId
{
  -[QDSchemaQDRetrievedTool setToolId:](self, "setToolId:", 0);
}

- (void)setSubType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_subType = a3;
}

- (BOOL)hasSubType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSubType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSubType
{
  -[QDSchemaQDRetrievedTool setSubType:](self, "setSubType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSimilarityScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_similarityScore = a3;
}

- (BOOL)hasSimilarityScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSimilarityScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSimilarityScore
{
  double v2;

  LODWORD(v2) = 0;
  -[QDSchemaQDRetrievedTool setSimilarityScore:](self, "setSimilarityScore:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSelectionCriteria:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_selectionCriteria = a3;
}

- (BOOL)hasSelectionCriteria
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSelectionCriteria:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSelectionCriteria
{
  -[QDSchemaQDRetrievedTool setSelectionCriteria:](self, "setSelectionCriteria:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasToolSource
{
  return self->_toolSource != 0;
}

- (void)deleteToolSource
{
  -[QDSchemaQDRetrievedTool setToolSource:](self, "setToolSource:", 0);
}

- (BOOL)hasToolDefinition
{
  return self->_toolDefinition != 0;
}

- (void)deleteToolDefinition
{
  -[QDSchemaQDRetrievedTool setToolDefinition:](self, "setToolDefinition:", 0);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return QDSchemaQDRetrievedToolReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[QDSchemaQDRetrievedTool sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QDSchemaQDRetrievedTool sessionScopedUniqueId](self, "sessionScopedUniqueId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[QDSchemaQDRetrievedTool toolId](self, "toolId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteFloatField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_8:
    PBDataWriterWriteInt32Field();
LABEL_9:
  -[QDSchemaQDRetrievedTool toolSource](self, "toolSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[QDSchemaQDRetrievedTool toolSource](self, "toolSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[QDSchemaQDRetrievedTool toolDefinition](self, "toolDefinition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[QDSchemaQDRetrievedTool toolDefinition](self, "toolDefinition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
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
  $9C86F590E7F408A2919FD610F48BCB0E has;
  unsigned int v18;
  int subType;
  int v20;
  float similarityScore;
  float v22;
  int v23;
  int selectionCriteria;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  BOOL v35;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  -[QDSchemaQDRetrievedTool sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionScopedUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[QDSchemaQDRetrievedTool sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[QDSchemaQDRetrievedTool sessionScopedUniqueId](self, "sessionScopedUniqueId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionScopedUniqueId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_33;
  }
  else
  {

  }
  -[QDSchemaQDRetrievedTool toolId](self, "toolId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[QDSchemaQDRetrievedTool toolId](self, "toolId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[QDSchemaQDRetrievedTool toolId](self, "toolId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_33;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_33;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    subType = self->_subType;
    if (subType != objc_msgSend(v4, "subType"))
      goto LABEL_33;
    has = self->_has;
    v18 = v4[56];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_33;
  if (v20)
  {
    similarityScore = self->_similarityScore;
    objc_msgSend(v4, "similarityScore");
    if (similarityScore != v22)
      goto LABEL_33;
    has = self->_has;
    v18 = v4[56];
  }
  v23 = (*(unsigned int *)&has >> 2) & 1;
  if (v23 != ((v18 >> 2) & 1))
    goto LABEL_33;
  if (v23)
  {
    selectionCriteria = self->_selectionCriteria;
    if (selectionCriteria != objc_msgSend(v4, "selectionCriteria"))
      goto LABEL_33;
  }
  -[QDSchemaQDRetrievedTool toolSource](self, "toolSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[QDSchemaQDRetrievedTool toolSource](self, "toolSource");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[QDSchemaQDRetrievedTool toolSource](self, "toolSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolSource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_33;
  }
  else
  {

  }
  -[QDSchemaQDRetrievedTool toolDefinition](self, "toolDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolDefinition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_32:

    goto LABEL_33;
  }
  -[QDSchemaQDRetrievedTool toolDefinition](self, "toolDefinition");
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
  {

LABEL_36:
    v35 = 1;
    goto LABEL_34;
  }
  v31 = (void *)v30;
  -[QDSchemaQDRetrievedTool toolDefinition](self, "toolDefinition");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolDefinition");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "isEqual:", v33);

  if ((v34 & 1) != 0)
    goto LABEL_36;
LABEL_33:
  v35 = 0;
LABEL_34:

  return v35;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  char has;
  uint64_t v6;
  float similarityScore;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v3 = -[SISchemaUUID hash](self->_sessionScopedUniqueId, "hash");
  v4 = -[NSString hash](self->_toolId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v6 = 2654435761 * self->_subType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v11 = 0;
    goto LABEL_11;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  similarityScore = self->_similarityScore;
  v8 = similarityScore;
  if (similarityScore < 0.0)
    v8 = -similarityScore;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_11:
  if ((has & 4) != 0)
    v12 = 2654435761 * self->_selectionCriteria;
  else
    v12 = 0;
  v13 = v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ -[QDSchemaQDToolSource hash](self->_toolSource, "hash");
  return v13 ^ -[QDSchemaQDToolDefinition hash](self->_toolDefinition, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = -[QDSchemaQDRetrievedTool selectionCriteria](self, "selectionCriteria") - 1;
    if (v4 > 4)
      v5 = CFSTR("QDTOOLSELECTIONCRITERIA_UNKNOWN");
    else
      v5 = *(&off_1E563DD78 + v4);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("selectionCriteria"));
  }
  if (self->_sessionScopedUniqueId)
  {
    -[QDSchemaQDRetrievedTool sessionScopedUniqueId](self, "sessionScopedUniqueId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sessionScopedUniqueId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sessionScopedUniqueId"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[QDSchemaQDRetrievedTool similarityScore](self, "similarityScore");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("similarityScore"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v12 = -[QDSchemaQDRetrievedTool subType](self, "subType") - 1;
    if (v12 > 4)
      v13 = CFSTR("QDTOOLSUBTYPE_UNKNOWN");
    else
      v13 = *(&off_1E563DDA0 + v12);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("subType"));
  }
  if (self->_toolDefinition)
  {
    -[QDSchemaQDRetrievedTool toolDefinition](self, "toolDefinition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("toolDefinition"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("toolDefinition"));

    }
  }
  if (self->_toolId)
  {
    -[QDSchemaQDRetrievedTool toolId](self, "toolId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("toolId"));

  }
  if (self->_toolSource)
  {
    -[QDSchemaQDRetrievedTool toolSource](self, "toolSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("toolSource"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("toolSource"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[QDSchemaQDRetrievedTool dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (QDSchemaQDRetrievedTool)initWithJSON:(id)a3
{
  void *v4;
  QDSchemaQDRetrievedTool *v5;
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
    self = -[QDSchemaQDRetrievedTool initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (QDSchemaQDRetrievedTool)initWithDictionary:(id)a3
{
  id v4;
  QDSchemaQDRetrievedTool *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  QDSchemaQDToolSource *v14;
  void *v15;
  QDSchemaQDToolDefinition *v16;
  QDSchemaQDRetrievedTool *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)QDSchemaQDRetrievedTool;
  v5 = -[QDSchemaQDRetrievedTool init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionScopedUniqueId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[QDSchemaQDRetrievedTool setSessionScopedUniqueId:](v5, "setSessionScopedUniqueId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[QDSchemaQDRetrievedTool setToolId:](v5, "setToolId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[QDSchemaQDRetrievedTool setSubType:](v5, "setSubType:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("similarityScore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      -[QDSchemaQDRetrievedTool setSimilarityScore:](v5, "setSimilarityScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectionCriteria"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[QDSchemaQDRetrievedTool setSelectionCriteria:](v5, "setSelectionCriteria:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[QDSchemaQDToolSource initWithDictionary:]([QDSchemaQDToolSource alloc], "initWithDictionary:", v13);
      -[QDSchemaQDRetrievedTool setToolSource:](v5, "setToolSource:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolDefinition"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[QDSchemaQDToolDefinition initWithDictionary:]([QDSchemaQDToolDefinition alloc], "initWithDictionary:", v15);
      -[QDSchemaQDRetrievedTool setToolDefinition:](v5, "setToolDefinition:", v16);

    }
    v17 = v5;

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

- (NSString)toolId
{
  return self->_toolId;
}

- (void)setToolId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)subType
{
  return self->_subType;
}

- (float)similarityScore
{
  return self->_similarityScore;
}

- (int)selectionCriteria
{
  return self->_selectionCriteria;
}

- (QDSchemaQDToolSource)toolSource
{
  return self->_toolSource;
}

- (void)setToolSource:(id)a3
{
  objc_storeStrong((id *)&self->_toolSource, a3);
}

- (QDSchemaQDToolDefinition)toolDefinition
{
  return self->_toolDefinition;
}

- (void)setToolDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_toolDefinition, a3);
}

- (void)setHasSessionScopedUniqueId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasToolSource:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasToolDefinition:(BOOL)a3
{
  self->_hasSessionScopedUniqueId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolDefinition, 0);
  objc_storeStrong((id *)&self->_toolSource, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_sessionScopedUniqueId, 0);
}

@end

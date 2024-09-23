@implementation FLOWSchemaFLOWHomeAutomationRequest

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
  v13.super_class = (Class)FLOWSchemaFLOWHomeAutomationRequest;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestId](self, "homeAutomationRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWHomeAutomationRequest deleteHomeAutomationRequestId](self, "deleteHomeAutomationRequestId");
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestMetadata](self, "homeAutomationRequestMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWHomeAutomationRequest deleteHomeAutomationRequestMetadata](self, "deleteHomeAutomationRequestMetadata");

  return v5;
}

- (BOOL)hasHomeAutomationRequestId
{
  return self->_homeAutomationRequestId != 0;
}

- (void)deleteHomeAutomationRequestId
{
  -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestId:](self, "setHomeAutomationRequestId:", 0);
}

- (void)setHomeAutomationRequestType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_homeAutomationRequestType = a3;
}

- (BOOL)hasHomeAutomationRequestType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHomeAutomationRequestType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteHomeAutomationRequestType
{
  -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestType:](self, "setHomeAutomationRequestType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setHomeAutomationRequestOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_homeAutomationRequestOutcome = a3;
}

- (BOOL)hasHomeAutomationRequestOutcome
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHomeAutomationRequestOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteHomeAutomationRequestOutcome
{
  -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestOutcome:](self, "setHomeAutomationRequestOutcome:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearHomeAutomationRequestErrorReason
{
  -[NSArray removeAllObjects](self->_homeAutomationRequestErrorReasons, "removeAllObjects");
}

- (void)addHomeAutomationRequestErrorReason:(id)a3
{
  id v4;
  NSArray *homeAutomationRequestErrorReasons;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  homeAutomationRequestErrorReasons = self->_homeAutomationRequestErrorReasons;
  v8 = v4;
  if (!homeAutomationRequestErrorReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_homeAutomationRequestErrorReasons;
    self->_homeAutomationRequestErrorReasons = v6;

    v4 = v8;
    homeAutomationRequestErrorReasons = self->_homeAutomationRequestErrorReasons;
  }
  -[NSArray addObject:](homeAutomationRequestErrorReasons, "addObject:", v4);

}

- (unint64_t)homeAutomationRequestErrorReasonCount
{
  return -[NSArray count](self->_homeAutomationRequestErrorReasons, "count");
}

- (id)homeAutomationRequestErrorReasonAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_homeAutomationRequestErrorReasons, "objectAtIndexedSubscript:", a3);
}

- (void)setHomeAutomationRequestDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_homeAutomationRequestDuration = a3;
}

- (BOOL)hasHomeAutomationRequestDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHomeAutomationRequestDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteHomeAutomationRequestDuration
{
  -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestDuration:](self, "setHomeAutomationRequestDuration:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasHomeAutomationRequestMetadata
{
  return self->_homeAutomationRequestMetadata != 0;
}

- (void)deleteHomeAutomationRequestMetadata
{
  -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestMetadata:](self, "setHomeAutomationRequestMetadata:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeAutomationRequestReadFrom(self, (uint64_t)a3);
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
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestId](self, "homeAutomationRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestId](self, "homeAutomationRequestId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_homeAutomationRequestErrorReasons;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestMetadata](self, "homeAutomationRequestMetadata", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestMetadata](self, "homeAutomationRequestMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  $6C85C94BF71D36A64792A0F9B00A6C18 has;
  unsigned int v13;
  int homeAutomationRequestType;
  int v15;
  int homeAutomationRequestOutcome;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  unsigned int homeAutomationRequestDuration;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestId](self, "homeAutomationRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAutomationRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestId](self, "homeAutomationRequestId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestId](self, "homeAutomationRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeAutomationRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_27;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    homeAutomationRequestType = self->_homeAutomationRequestType;
    if (homeAutomationRequestType != objc_msgSend(v4, "homeAutomationRequestType"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[48];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_27;
  if (v15)
  {
    homeAutomationRequestOutcome = self->_homeAutomationRequestOutcome;
    if (homeAutomationRequestOutcome != objc_msgSend(v4, "homeAutomationRequestOutcome"))
      goto LABEL_27;
  }
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestErrorReasons](self, "homeAutomationRequestErrorReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAutomationRequestErrorReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestErrorReasons](self, "homeAutomationRequestErrorReasons");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestErrorReasons](self, "homeAutomationRequestErrorReasons");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeAutomationRequestErrorReasons");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  v22 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v22 != ((v4[48] >> 2) & 1))
    goto LABEL_27;
  if (v22)
  {
    homeAutomationRequestDuration = self->_homeAutomationRequestDuration;
    if (homeAutomationRequestDuration != objc_msgSend(v4, "homeAutomationRequestDuration"))
      goto LABEL_27;
  }
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestMetadata](self, "homeAutomationRequestMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAutomationRequestMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestMetadata](self, "homeAutomationRequestMetadata");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {

LABEL_30:
    v29 = 1;
    goto LABEL_28;
  }
  v25 = (void *)v24;
  -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestMetadata](self, "homeAutomationRequestMetadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAutomationRequestMetadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  if ((v28 & 1) != 0)
    goto LABEL_30;
LABEL_27:
  v29 = 0;
LABEL_28:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_homeAutomationRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_homeAutomationRequestType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_homeAutomationRequestOutcome;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSArray hash](self->_homeAutomationRequestErrorReasons, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_homeAutomationRequestDuration;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[FLOWSchemaFLOWHomeAutomationRequestMetadata hash](self->_homeAutomationRequestMetadata, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  char has;
  unsigned int v14;
  const __CFString *v15;
  unsigned int v16;
  const __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestDuration](self, "homeAutomationRequestDuration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("homeAutomationRequestDuration"));

  }
  if (self->_homeAutomationRequestErrorReasons)
  {
    -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestErrorReasons](self, "homeAutomationRequestErrorReasons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("homeAutomationRequestErrorReason"));

  }
  if (self->_homeAutomationRequestId)
  {
    -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestId](self, "homeAutomationRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("homeAutomationRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("homeAutomationRequestId"));

    }
  }
  if (self->_homeAutomationRequestMetadata)
  {
    -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestMetadata](self, "homeAutomationRequestMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("homeAutomationRequestMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("homeAutomationRequestMetadata"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestOutcome](self, "homeAutomationRequestOutcome") - 1;
    if (v14 > 2)
      v15 = CFSTR("FLOWHOMEAUTOMATIONOUTCOME_UNKOWN");
    else
      v15 = off_1E562DA78[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("homeAutomationRequestOutcome"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v16 = -[FLOWSchemaFLOWHomeAutomationRequest homeAutomationRequestType](self, "homeAutomationRequestType") - 1;
    if (v16 > 9)
      v17 = CFSTR("FLOWHOMEAUTOMATIONREQUESTTYPE_UNKNOWN");
    else
      v17 = off_1E562DA90[v16];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("homeAutomationRequestType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWHomeAutomationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWHomeAutomationRequest)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWHomeAutomationRequest *v5;
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
    self = -[FLOWSchemaFLOWHomeAutomationRequest initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWHomeAutomationRequest)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWHomeAutomationRequest *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FLOWSchemaFLOWHomeAutomationRequestMetadata *v20;
  FLOWSchemaFLOWHomeAutomationRequest *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FLOWSchemaFLOWHomeAutomationRequest;
  v5 = -[FLOWSchemaFLOWHomeAutomationRequest init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeAutomationRequestId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestId:](v5, "setHomeAutomationRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeAutomationRequestType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestType:](v5, "setHomeAutomationRequestType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeAutomationRequestOutcome"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestOutcome:](v5, "setHomeAutomationRequestOutcome:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeAutomationRequestErrorReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v8;
      v24 = v6;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = (void *)objc_msgSend(v16, "copy");
              -[FLOWSchemaFLOWHomeAutomationRequest addHomeAutomationRequestErrorReason:](v5, "addHomeAutomationRequestErrorReason:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v13);
      }

      v8 = v23;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeAutomationRequestDuration"), v23, v24, (_QWORD)v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestDuration:](v5, "setHomeAutomationRequestDuration:", objc_msgSend(v18, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeAutomationRequestMetadata"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[FLOWSchemaFLOWHomeAutomationRequestMetadata initWithDictionary:]([FLOWSchemaFLOWHomeAutomationRequestMetadata alloc], "initWithDictionary:", v19);
      -[FLOWSchemaFLOWHomeAutomationRequest setHomeAutomationRequestMetadata:](v5, "setHomeAutomationRequestMetadata:", v20);

    }
    v21 = v5;

  }
  return v5;
}

- (SISchemaUUID)homeAutomationRequestId
{
  return self->_homeAutomationRequestId;
}

- (void)setHomeAutomationRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_homeAutomationRequestId, a3);
}

- (int)homeAutomationRequestType
{
  return self->_homeAutomationRequestType;
}

- (int)homeAutomationRequestOutcome
{
  return self->_homeAutomationRequestOutcome;
}

- (NSArray)homeAutomationRequestErrorReasons
{
  return self->_homeAutomationRequestErrorReasons;
}

- (void)setHomeAutomationRequestErrorReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)homeAutomationRequestDuration
{
  return self->_homeAutomationRequestDuration;
}

- (FLOWSchemaFLOWHomeAutomationRequestMetadata)homeAutomationRequestMetadata
{
  return self->_homeAutomationRequestMetadata;
}

- (void)setHomeAutomationRequestMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_homeAutomationRequestMetadata, a3);
}

- (void)setHasHomeAutomationRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasHomeAutomationRequestMetadata:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAutomationRequestMetadata, 0);
  objc_storeStrong((id *)&self->_homeAutomationRequestErrorReasons, 0);
  objc_storeStrong((id *)&self->_homeAutomationRequestId, 0);
}

@end

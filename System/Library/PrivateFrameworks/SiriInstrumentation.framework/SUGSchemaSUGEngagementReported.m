@implementation SUGSchemaSUGEngagementReported

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
  v13.super_class = (Class)SUGSchemaSUGEngagementReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUGSchemaSUGEngagementReported userStatistics](self, "userStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SUGSchemaSUGEngagementReported deleteUserStatistics](self, "deleteUserStatistics");
  -[SUGSchemaSUGEngagementReported interaction](self, "interaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SUGSchemaSUGEngagementReported deleteInteraction](self, "deleteInteraction");

  return v5;
}

- (void)setPerformedTimeSince1970InMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_performedTimeSince1970InMs = a3;
}

- (BOOL)hasPerformedTimeSince1970InMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPerformedTimeSince1970InMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePerformedTimeSince1970InMs
{
  -[SUGSchemaSUGEngagementReported setPerformedTimeSince1970InMs:](self, "setPerformedTimeSince1970InMs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasUserStatistics
{
  return self->_userStatistics != 0;
}

- (void)deleteUserStatistics
{
  -[SUGSchemaSUGEngagementReported setUserStatistics:](self, "setUserStatistics:", 0);
}

- (BOOL)hasInteraction
{
  return self->_interaction != 0;
}

- (void)deleteInteraction
{
  -[SUGSchemaSUGEngagementReported setInteraction:](self, "setInteraction:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGEngagementReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  -[SUGSchemaSUGEngagementReported userStatistics](self, "userStatistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUGSchemaSUGEngagementReported userStatistics](self, "userStatistics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGEngagementReported interaction](self, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[SUGSchemaSUGEngagementReported interaction](self, "interaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t performedTimeSince1970InMs;
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    performedTimeSince1970InMs = self->_performedTimeSince1970InMs;
    if (performedTimeSince1970InMs != objc_msgSend(v4, "performedTimeSince1970InMs"))
      goto LABEL_15;
  }
  -[SUGSchemaSUGEngagementReported userStatistics](self, "userStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userStatistics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[SUGSchemaSUGEngagementReported userStatistics](self, "userStatistics");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SUGSchemaSUGEngagementReported userStatistics](self, "userStatistics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userStatistics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[SUGSchemaSUGEngagementReported interaction](self, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SUGSchemaSUGEngagementReported interaction](self, "interaction");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SUGSchemaSUGEngagementReported interaction](self, "interaction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interaction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_performedTimeSince1970InMs;
  else
    v3 = 0;
  v4 = -[SUGSchemaSUGUserStatistics hash](self->_userStatistics, "hash") ^ v3;
  return v4 ^ -[SUGSchemaSUGInteraction hash](self->_interaction, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_interaction)
  {
    -[SUGSchemaSUGEngagementReported interaction](self, "interaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("interaction"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("interaction"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUGSchemaSUGEngagementReported performedTimeSince1970InMs](self, "performedTimeSince1970InMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("performedTimeSince1970InMs"));

  }
  if (self->_userStatistics)
  {
    -[SUGSchemaSUGEngagementReported userStatistics](self, "userStatistics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("userStatistics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("userStatistics"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGEngagementReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGEngagementReported)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGEngagementReported *v5;
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
    self = -[SUGSchemaSUGEngagementReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGEngagementReported)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGEngagementReported *v5;
  void *v6;
  void *v7;
  SUGSchemaSUGUserStatistics *v8;
  void *v9;
  SUGSchemaSUGInteraction *v10;
  SUGSchemaSUGEngagementReported *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUGSchemaSUGEngagementReported;
  v5 = -[SUGSchemaSUGEngagementReported init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performedTimeSince1970InMs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGEngagementReported setPerformedTimeSince1970InMs:](v5, "setPerformedTimeSince1970InMs:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userStatistics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SUGSchemaSUGUserStatistics initWithDictionary:]([SUGSchemaSUGUserStatistics alloc], "initWithDictionary:", v7);
      -[SUGSchemaSUGEngagementReported setUserStatistics:](v5, "setUserStatistics:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interaction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SUGSchemaSUGInteraction initWithDictionary:]([SUGSchemaSUGInteraction alloc], "initWithDictionary:", v9);
      -[SUGSchemaSUGEngagementReported setInteraction:](v5, "setInteraction:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (unint64_t)performedTimeSince1970InMs
{
  return self->_performedTimeSince1970InMs;
}

- (SUGSchemaSUGUserStatistics)userStatistics
{
  return self->_userStatistics;
}

- (void)setUserStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_userStatistics, a3);
}

- (SUGSchemaSUGInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_interaction, a3);
}

- (void)setHasUserStatistics:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasInteraction:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_userStatistics, 0);
}

@end

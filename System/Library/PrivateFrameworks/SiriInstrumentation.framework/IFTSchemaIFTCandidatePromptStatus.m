@implementation IFTSchemaIFTCandidatePromptStatus

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNotPrompted:(BOOL)a3
{
  self->_confirmed = 0;
  self->_picked = 0;
  self->_whichOneof_Candidatepromptstatus = 1;
  self->_notPrompted = a3;
}

- (BOOL)notPrompted
{
  return self->_whichOneof_Candidatepromptstatus == 1 && self->_notPrompted;
}

- (void)deleteNotPrompted
{
  if (self->_whichOneof_Candidatepromptstatus == 1)
  {
    self->_whichOneof_Candidatepromptstatus = 0;
    self->_notPrompted = 0;
  }
}

- (void)setConfirmed:(BOOL)a3
{
  self->_notPrompted = 0;
  self->_picked = 0;
  self->_whichOneof_Candidatepromptstatus = 2;
  self->_confirmed = a3;
}

- (BOOL)confirmed
{
  return self->_whichOneof_Candidatepromptstatus == 2 && self->_confirmed;
}

- (void)deleteConfirmed
{
  if (self->_whichOneof_Candidatepromptstatus == 2)
  {
    self->_whichOneof_Candidatepromptstatus = 0;
    self->_confirmed = 0;
  }
}

- (void)setPicked:(int64_t)a3
{
  self->_notPrompted = 0;
  self->_confirmed = 0;
  self->_whichOneof_Candidatepromptstatus = 3;
  self->_picked = a3;
}

- (int64_t)picked
{
  if (self->_whichOneof_Candidatepromptstatus == 3)
    return self->_picked;
  else
    return 0;
}

- (void)deletePicked
{
  if (self->_whichOneof_Candidatepromptstatus == 3)
  {
    self->_whichOneof_Candidatepromptstatus = 0;
    self->_picked = 0;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTCandidatePromptStatusReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t whichOneof_Candidatepromptstatus;
  id v6;

  v4 = a3;
  whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  v6 = v4;
  if (whichOneof_Candidatepromptstatus == 1)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  }
  if (whichOneof_Candidatepromptstatus == 2)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  }
  if (whichOneof_Candidatepromptstatus == 3)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Candidatepromptstatus;
  int notPrompted;
  int confirmed;
  int64_t picked;
  BOOL v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus,
        whichOneof_Candidatepromptstatus == objc_msgSend(v4, "whichOneof_Candidatepromptstatus"))
    && (notPrompted = self->_notPrompted, notPrompted == objc_msgSend(v4, "notPrompted"))
    && (confirmed = self->_confirmed, confirmed == objc_msgSend(v4, "confirmed")))
  {
    picked = self->_picked;
    v9 = picked == objc_msgSend(v4, "picked");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t whichOneof_Candidatepromptstatus;
  uint64_t v3;

  whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  switch(whichOneof_Candidatepromptstatus)
  {
    case 3uLL:
      return 2654435761 * self->_picked;
    case 2uLL:
      v3 = 9;
      return 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + v3);
    case 1uLL:
      v3 = 8;
      return 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + v3);
  }
  return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t whichOneof_Candidatepromptstatus;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  if (whichOneof_Candidatepromptstatus == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTCandidatePromptStatus confirmed](self, "confirmed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("confirmed"));

    whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  }
  if (whichOneof_Candidatepromptstatus == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTCandidatePromptStatus notPrompted](self, "notPrompted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("notPrompted"));

    whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  }
  if (whichOneof_Candidatepromptstatus == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IFTSchemaIFTCandidatePromptStatus picked](self, "picked"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("picked"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTCandidatePromptStatus dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTCandidatePromptStatus)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTCandidatePromptStatus *v5;
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
    self = -[IFTSchemaIFTCandidatePromptStatus initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTCandidatePromptStatus)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTCandidatePromptStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  IFTSchemaIFTCandidatePromptStatus *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTCandidatePromptStatus;
  v5 = -[IFTSchemaIFTCandidatePromptStatus init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notPrompted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTCandidatePromptStatus setNotPrompted:](v5, "setNotPrompted:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTCandidatePromptStatus setConfirmed:](v5, "setConfirmed:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("picked"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTCandidatePromptStatus setPicked:](v5, "setPicked:", objc_msgSend(v8, "longLongValue"));
    v9 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Candidatepromptstatus
{
  return self->_whichOneof_Candidatepromptstatus;
}

- (BOOL)hasNotPrompted
{
  return self->_hasNotPrompted;
}

- (void)setHasNotPrompted:(BOOL)a3
{
  self->_hasNotPrompted = a3;
}

- (BOOL)hasConfirmed
{
  return self->_hasConfirmed;
}

- (void)setHasConfirmed:(BOOL)a3
{
  self->_hasConfirmed = a3;
}

- (BOOL)hasPicked
{
  return self->_hasPicked;
}

- (void)setHasPicked:(BOOL)a3
{
  self->_hasPicked = a3;
}

@end

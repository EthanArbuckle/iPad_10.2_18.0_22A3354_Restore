@implementation IFTSchemaIFTSystemPromptResolutionUserAction

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
  v9.super_class = (Class)IFTSchemaIFTSystemPromptResolutionUserAction;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTSystemPromptResolutionUserAction requirementAddressed](self, "requirementAddressed", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IFTSchemaIFTSystemPromptResolutionUserAction deleteRequirementAddressed](self, "deleteRequirementAddressed");
  return v5;
}

- (void)setIsActionConfirmed:(BOOL)a3
{
  IFTSchemaIFTSystemPromptResolutionRequirementResolution *requirementAddressed;

  self->_isParameterConfirmed = 0;
  self->_disambiguationIndexSelected = 0;
  requirementAddressed = self->_requirementAddressed;
  self->_requirementAddressed = 0;

  self->_whichOneof_Systempromptresolutionuseraction = 1;
  self->_isActionConfirmed = a3;
}

- (BOOL)isActionConfirmed
{
  return self->_whichOneof_Systempromptresolutionuseraction == 1 && self->_isActionConfirmed;
}

- (void)deleteIsActionConfirmed
{
  if (self->_whichOneof_Systempromptresolutionuseraction == 1)
  {
    self->_whichOneof_Systempromptresolutionuseraction = 0;
    self->_isActionConfirmed = 0;
  }
}

- (void)setIsParameterConfirmed:(BOOL)a3
{
  IFTSchemaIFTSystemPromptResolutionRequirementResolution *requirementAddressed;

  self->_isActionConfirmed = 0;
  self->_disambiguationIndexSelected = 0;
  requirementAddressed = self->_requirementAddressed;
  self->_requirementAddressed = 0;

  self->_whichOneof_Systempromptresolutionuseraction = 3;
  self->_isParameterConfirmed = a3;
}

- (BOOL)isParameterConfirmed
{
  return self->_whichOneof_Systempromptresolutionuseraction == 3 && self->_isParameterConfirmed;
}

- (void)deleteIsParameterConfirmed
{
  if (self->_whichOneof_Systempromptresolutionuseraction == 3)
  {
    self->_whichOneof_Systempromptresolutionuseraction = 0;
    self->_isParameterConfirmed = 0;
  }
}

- (void)setDisambiguationIndexSelected:(int64_t)a3
{
  IFTSchemaIFTSystemPromptResolutionRequirementResolution *requirementAddressed;

  self->_isActionConfirmed = 0;
  self->_isParameterConfirmed = 0;
  requirementAddressed = self->_requirementAddressed;
  self->_requirementAddressed = 0;

  self->_whichOneof_Systempromptresolutionuseraction = 6;
  self->_disambiguationIndexSelected = a3;
}

- (int64_t)disambiguationIndexSelected
{
  if (self->_whichOneof_Systempromptresolutionuseraction == 6)
    return self->_disambiguationIndexSelected;
  else
    return 0;
}

- (void)deleteDisambiguationIndexSelected
{
  if (self->_whichOneof_Systempromptresolutionuseraction == 6)
  {
    self->_whichOneof_Systempromptresolutionuseraction = 0;
    self->_disambiguationIndexSelected = 0;
  }
}

- (void)setRequirementAddressed:(id)a3
{
  unint64_t v3;

  self->_isActionConfirmed = 0;
  self->_isParameterConfirmed = 0;
  self->_disambiguationIndexSelected = 0;
  v3 = 7;
  if (!a3)
    v3 = 0;
  self->_whichOneof_Systempromptresolutionuseraction = v3;
  objc_storeStrong((id *)&self->_requirementAddressed, a3);
}

- (IFTSchemaIFTSystemPromptResolutionRequirementResolution)requirementAddressed
{
  if (self->_whichOneof_Systempromptresolutionuseraction == 7)
    return self->_requirementAddressed;
  else
    return (IFTSchemaIFTSystemPromptResolutionRequirementResolution *)0;
}

- (void)deleteRequirementAddressed
{
  IFTSchemaIFTSystemPromptResolutionRequirementResolution *requirementAddressed;

  if (self->_whichOneof_Systempromptresolutionuseraction == 7)
  {
    self->_whichOneof_Systempromptresolutionuseraction = 0;
    requirementAddressed = self->_requirementAddressed;
    self->_requirementAddressed = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTSystemPromptResolutionUserActionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t whichOneof_Systempromptresolutionuseraction;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  whichOneof_Systempromptresolutionuseraction = self->_whichOneof_Systempromptresolutionuseraction;
  if (whichOneof_Systempromptresolutionuseraction == 1)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Systempromptresolutionuseraction = self->_whichOneof_Systempromptresolutionuseraction;
  }
  if (whichOneof_Systempromptresolutionuseraction == 3)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Systempromptresolutionuseraction = self->_whichOneof_Systempromptresolutionuseraction;
  }
  if (whichOneof_Systempromptresolutionuseraction == 6)
    PBDataWriterWriteInt64Field();
  -[IFTSchemaIFTSystemPromptResolutionUserAction requirementAddressed](self, "requirementAddressed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[IFTSchemaIFTSystemPromptResolutionUserAction requirementAddressed](self, "requirementAddressed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Systempromptresolutionuseraction;
  int isActionConfirmed;
  int isParameterConfirmed;
  int64_t disambiguationIndexSelected;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichOneof_Systempromptresolutionuseraction = self->_whichOneof_Systempromptresolutionuseraction;
    if (whichOneof_Systempromptresolutionuseraction == objc_msgSend(v4, "whichOneof_Systempromptresolutionuseraction"))
    {
      isActionConfirmed = self->_isActionConfirmed;
      if (isActionConfirmed == objc_msgSend(v4, "isActionConfirmed"))
      {
        isParameterConfirmed = self->_isParameterConfirmed;
        if (isParameterConfirmed == objc_msgSend(v4, "isParameterConfirmed"))
        {
          disambiguationIndexSelected = self->_disambiguationIndexSelected;
          if (disambiguationIndexSelected == objc_msgSend(v4, "disambiguationIndexSelected"))
          {
            -[IFTSchemaIFTSystemPromptResolutionUserAction requirementAddressed](self, "requirementAddressed");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "requirementAddressed");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if ((v9 == 0) != (v10 != 0))
            {
              -[IFTSchemaIFTSystemPromptResolutionUserAction requirementAddressed](self, "requirementAddressed");
              v12 = objc_claimAutoreleasedReturnValue();
              if (!v12)
              {

LABEL_14:
                v17 = 1;
                goto LABEL_12;
              }
              v13 = (void *)v12;
              -[IFTSchemaIFTSystemPromptResolutionUserAction requirementAddressed](self, "requirementAddressed");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "requirementAddressed");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqual:", v15);

              if ((v16 & 1) != 0)
                goto LABEL_14;
            }
            else
            {

            }
          }
        }
      }
    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (unint64_t)hash
{
  unint64_t whichOneof_Systempromptresolutionuseraction;
  uint64_t v3;
  uint64_t v4;

  whichOneof_Systempromptresolutionuseraction = self->_whichOneof_Systempromptresolutionuseraction;
  if (whichOneof_Systempromptresolutionuseraction == 6)
  {
    v4 = 2654435761 * self->_disambiguationIndexSelected;
  }
  else
  {
    if (whichOneof_Systempromptresolutionuseraction == 3)
    {
      v3 = 9;
    }
    else
    {
      if (whichOneof_Systempromptresolutionuseraction != 1)
      {
        v4 = 0;
        return -[IFTSchemaIFTSystemPromptResolutionRequirementResolution hash](self->_requirementAddressed, "hash") ^ v4;
      }
      v3 = 8;
    }
    v4 = 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + v3);
  }
  return -[IFTSchemaIFTSystemPromptResolutionRequirementResolution hash](self->_requirementAddressed, "hash") ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t whichOneof_Systempromptresolutionuseraction;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  whichOneof_Systempromptresolutionuseraction = self->_whichOneof_Systempromptresolutionuseraction;
  if (whichOneof_Systempromptresolutionuseraction == 6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IFTSchemaIFTSystemPromptResolutionUserAction disambiguationIndexSelected](self, "disambiguationIndexSelected"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("disambiguationIndexSelected"));

    whichOneof_Systempromptresolutionuseraction = self->_whichOneof_Systempromptresolutionuseraction;
  }
  if (whichOneof_Systempromptresolutionuseraction == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTSystemPromptResolutionUserAction isActionConfirmed](self, "isActionConfirmed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isActionConfirmed"));

    whichOneof_Systempromptresolutionuseraction = self->_whichOneof_Systempromptresolutionuseraction;
  }
  if (whichOneof_Systempromptresolutionuseraction == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTSystemPromptResolutionUserAction isParameterConfirmed](self, "isParameterConfirmed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isParameterConfirmed"));

  }
  if (self->_requirementAddressed)
  {
    -[IFTSchemaIFTSystemPromptResolutionUserAction requirementAddressed](self, "requirementAddressed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("requirementAddressed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("requirementAddressed"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTSystemPromptResolutionUserAction dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTSystemPromptResolutionUserAction)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTSystemPromptResolutionUserAction *v5;
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
    self = -[IFTSchemaIFTSystemPromptResolutionUserAction initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTSystemPromptResolutionUserAction)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTSystemPromptResolutionUserAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  IFTSchemaIFTSystemPromptResolutionRequirementResolution *v10;
  IFTSchemaIFTSystemPromptResolutionUserAction *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTSystemPromptResolutionUserAction;
  v5 = -[IFTSchemaIFTSystemPromptResolutionUserAction init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isActionConfirmed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTSystemPromptResolutionUserAction setIsActionConfirmed:](v5, "setIsActionConfirmed:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isParameterConfirmed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTSystemPromptResolutionUserAction setIsParameterConfirmed:](v5, "setIsParameterConfirmed:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationIndexSelected"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTSystemPromptResolutionUserAction setDisambiguationIndexSelected:](v5, "setDisambiguationIndexSelected:", objc_msgSend(v8, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requirementAddressed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[IFTSchemaIFTSystemPromptResolutionRequirementResolution initWithDictionary:]([IFTSchemaIFTSystemPromptResolutionRequirementResolution alloc], "initWithDictionary:", v9);
      -[IFTSchemaIFTSystemPromptResolutionUserAction setRequirementAddressed:](v5, "setRequirementAddressed:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Systempromptresolutionuseraction
{
  return self->_whichOneof_Systempromptresolutionuseraction;
}

- (BOOL)hasIsActionConfirmed
{
  return self->_hasIsActionConfirmed;
}

- (void)setHasIsActionConfirmed:(BOOL)a3
{
  self->_hasIsActionConfirmed = a3;
}

- (BOOL)hasIsParameterConfirmed
{
  return self->_hasIsParameterConfirmed;
}

- (void)setHasIsParameterConfirmed:(BOOL)a3
{
  self->_hasIsParameterConfirmed = a3;
}

- (BOOL)hasDisambiguationIndexSelected
{
  return self->_hasDisambiguationIndexSelected;
}

- (void)setHasDisambiguationIndexSelected:(BOOL)a3
{
  self->_hasDisambiguationIndexSelected = a3;
}

- (BOOL)hasRequirementAddressed
{
  return self->_hasRequirementAddressed;
}

- (void)setHasRequirementAddressed:(BOOL)a3
{
  self->_hasRequirementAddressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementAddressed, 0);
}

@end

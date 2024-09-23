@implementation IFTSchemaIFTAppRequirement

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSignInRequired:(BOOL)a3
{
  self->_accountSetupRequired = 0;
  self->_userConfirmationRequired = 0;
  self->_whichOneof_Apprequirement = 1;
  self->_signInRequired = a3;
}

- (BOOL)signInRequired
{
  return self->_whichOneof_Apprequirement == 1 && self->_signInRequired;
}

- (void)deleteSignInRequired
{
  if (self->_whichOneof_Apprequirement == 1)
  {
    self->_whichOneof_Apprequirement = 0;
    self->_signInRequired = 0;
  }
}

- (void)setAccountSetupRequired:(BOOL)a3
{
  self->_signInRequired = 0;
  self->_userConfirmationRequired = 0;
  self->_whichOneof_Apprequirement = 2;
  self->_accountSetupRequired = a3;
}

- (BOOL)accountSetupRequired
{
  return self->_whichOneof_Apprequirement == 2 && self->_accountSetupRequired;
}

- (void)deleteAccountSetupRequired
{
  if (self->_whichOneof_Apprequirement == 2)
  {
    self->_whichOneof_Apprequirement = 0;
    self->_accountSetupRequired = 0;
  }
}

- (void)setUserConfirmationRequired:(BOOL)a3
{
  self->_signInRequired = 0;
  self->_accountSetupRequired = 0;
  self->_whichOneof_Apprequirement = 3;
  self->_userConfirmationRequired = a3;
}

- (BOOL)userConfirmationRequired
{
  return self->_whichOneof_Apprequirement == 3 && self->_userConfirmationRequired;
}

- (void)deleteUserConfirmationRequired
{
  if (self->_whichOneof_Apprequirement == 3)
  {
    self->_whichOneof_Apprequirement = 0;
    self->_userConfirmationRequired = 0;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTAppRequirementReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t whichOneof_Apprequirement;
  id v6;

  v4 = a3;
  whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  v6 = v4;
  if (whichOneof_Apprequirement == 1)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  }
  if (whichOneof_Apprequirement == 2)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  }
  if (whichOneof_Apprequirement == 3)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Apprequirement;
  int signInRequired;
  int accountSetupRequired;
  int userConfirmationRequired;
  BOOL v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (whichOneof_Apprequirement = self->_whichOneof_Apprequirement,
        whichOneof_Apprequirement == objc_msgSend(v4, "whichOneof_Apprequirement"))
    && (signInRequired = self->_signInRequired, signInRequired == objc_msgSend(v4, "signInRequired"))
    && (accountSetupRequired = self->_accountSetupRequired,
        accountSetupRequired == objc_msgSend(v4, "accountSetupRequired")))
  {
    userConfirmationRequired = self->_userConfirmationRequired;
    v9 = userConfirmationRequired == objc_msgSend(v4, "userConfirmationRequired");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_whichOneof_Apprequirement - 1;
  if (v2 > 2)
    return 0;
  else
    return 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + *off_1E563DB80[v2]);
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t whichOneof_Apprequirement;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  if (whichOneof_Apprequirement == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTAppRequirement accountSetupRequired](self, "accountSetupRequired"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountSetupRequired"));

    whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  }
  if (whichOneof_Apprequirement == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTAppRequirement signInRequired](self, "signInRequired"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("signInRequired"));

    whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  }
  if (whichOneof_Apprequirement == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTAppRequirement userConfirmationRequired](self, "userConfirmationRequired"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("userConfirmationRequired"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTAppRequirement dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTAppRequirement)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTAppRequirement *v5;
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
    self = -[IFTSchemaIFTAppRequirement initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTAppRequirement)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTAppRequirement *v5;
  void *v6;
  void *v7;
  void *v8;
  IFTSchemaIFTAppRequirement *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTAppRequirement;
  v5 = -[IFTSchemaIFTAppRequirement init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signInRequired"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTAppRequirement setSignInRequired:](v5, "setSignInRequired:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountSetupRequired"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTAppRequirement setAccountSetupRequired:](v5, "setAccountSetupRequired:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userConfirmationRequired"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTAppRequirement setUserConfirmationRequired:](v5, "setUserConfirmationRequired:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Apprequirement
{
  return self->_whichOneof_Apprequirement;
}

- (BOOL)hasSignInRequired
{
  return self->_hasSignInRequired;
}

- (void)setHasSignInRequired:(BOOL)a3
{
  self->_hasSignInRequired = a3;
}

- (BOOL)hasAccountSetupRequired
{
  return self->_hasAccountSetupRequired;
}

- (void)setHasAccountSetupRequired:(BOOL)a3
{
  self->_hasAccountSetupRequired = a3;
}

- (BOOL)hasUserConfirmationRequired
{
  return self->_hasUserConfirmationRequired;
}

- (void)setHasUserConfirmationRequired:(BOOL)a3
{
  self->_hasUserConfirmationRequired = a3;
}

@end

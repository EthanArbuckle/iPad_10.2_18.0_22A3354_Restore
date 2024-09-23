@implementation INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated

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
  v13.super_class = (Class)INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated deleteOriginalResolutionContextId](self, "deleteOriginalResolutionContextId");
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated queryId](self, "queryId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated deleteQueryId](self, "deleteQueryId");

  return v5;
}

- (BOOL)hasOriginalResolutionContextId
{
  return self->_originalResolutionContextId != 0;
}

- (void)deleteOriginalResolutionContextId
{
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated setOriginalResolutionContextId:](self, "setOriginalResolutionContextId:", 0);
}

- (BOOL)hasQueryId
{
  return self->_queryId != 0;
}

- (void)deleteQueryId
{
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated setQueryId:](self, "setQueryId:", 0);
}

- (void)setDisambiguationResolution:(int)a3
{
  self->_confirmationResolution = 0;
  self->_whichResolutiontype = 3;
  self->_disambiguationResolution = a3;
}

- (int)disambiguationResolution
{
  if (self->_whichResolutiontype == 3)
    return self->_disambiguationResolution;
  else
    return 0;
}

- (void)deleteDisambiguationResolution
{
  if (self->_whichResolutiontype == 3)
  {
    self->_whichResolutiontype = 0;
    self->_disambiguationResolution = 0;
  }
}

- (void)setConfirmationResolution:(int)a3
{
  self->_disambiguationResolution = 0;
  self->_whichResolutiontype = 4;
  self->_confirmationResolution = a3;
}

- (int)confirmationResolution
{
  if (self->_whichResolutiontype == 4)
    return self->_confirmationResolution;
  else
    return 0;
}

- (void)deleteConfirmationResolution
{
  if (self->_whichResolutiontype == 4)
  {
    self->_whichResolutiontype = 0;
    self->_confirmationResolution = 0;
  }
}

- (BOOL)hasAnonymizedSelectedEntityIdentifier
{
  return self->_anonymizedSelectedEntityIdentifier != 0;
}

- (void)deleteAnonymizedSelectedEntityIdentifier
{
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated setAnonymizedSelectedEntityIdentifier:](self, "setAnonymizedSelectedEntityIdentifier:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t whichResolutiontype;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated queryId](self, "queryId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated queryId](self, "queryId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  whichResolutiontype = self->_whichResolutiontype;
  if (whichResolutiontype == 3)
  {
    PBDataWriterWriteInt32Field();
    whichResolutiontype = self->_whichResolutiontype;
  }
  if (whichResolutiontype == 4)
    PBDataWriterWriteInt32Field();
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated anonymizedSelectedEntityIdentifier](self, "anonymizedSelectedEntityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichResolutiontype;
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
  int v17;
  int disambiguationResolution;
  int confirmationResolution;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  whichResolutiontype = self->_whichResolutiontype;
  if (whichResolutiontype != objc_msgSend(v4, "whichResolutiontype"))
    goto LABEL_20;
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalResolutionContextId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalResolutionContextId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated queryId](self, "queryId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated queryId](self, "queryId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated queryId](self, "queryId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  disambiguationResolution = self->_disambiguationResolution;
  if (disambiguationResolution != objc_msgSend(v4, "disambiguationResolution"))
    goto LABEL_20;
  confirmationResolution = self->_confirmationResolution;
  if (confirmationResolution != objc_msgSend(v4, "confirmationResolution"))
    goto LABEL_20;
  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated anonymizedSelectedEntityIdentifier](self, "anonymizedSelectedEntityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymizedSelectedEntityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated anonymizedSelectedEntityIdentifier](self, "anonymizedSelectedEntityIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {

LABEL_23:
      v25 = 1;
      goto LABEL_21;
    }
    v21 = (void *)v20;
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated anonymizedSelectedEntityIdentifier](self, "anonymizedSelectedEntityIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anonymizedSelectedEntityIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if ((v24 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v25 = 0;
LABEL_21:

  return v25;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t whichResolutiontype;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_originalResolutionContextId, "hash");
  v4 = -[SISchemaUUID hash](self->_queryId, "hash");
  whichResolutiontype = self->_whichResolutiontype;
  if (whichResolutiontype == 4)
  {
    v7 = 0;
    v6 = 2654435761 * self->_confirmationResolution;
  }
  else if (whichResolutiontype == 3)
  {
    v6 = 0;
    v7 = 2654435761 * self->_disambiguationResolution;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  return v4 ^ v3 ^ v7 ^ v6 ^ -[NSString hash](self->_anonymizedSelectedEntityIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t whichResolutiontype;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_anonymizedSelectedEntityIdentifier)
  {
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated anonymizedSelectedEntityIdentifier](self, "anonymizedSelectedEntityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("anonymizedSelectedEntityIdentifier"));

  }
  whichResolutiontype = self->_whichResolutiontype;
  if (whichResolutiontype == 4)
  {
    v7 = -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated confirmationResolution](self, "confirmationResolution")- 1;
    if (v7 > 3)
      v8 = CFSTR("INFERENCECONFIRMATIONRESOLUTIONTYPE_UNKNOWN");
    else
      v8 = off_1E562FCC0[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("confirmationResolution"));
    whichResolutiontype = self->_whichResolutiontype;
  }
  if (whichResolutiontype == 3)
  {
    v9 = -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated disambiguationResolution](self, "disambiguationResolution")- 1;
    if (v9 > 2)
      v10 = CFSTR("INFERENCEDISAMBIGUATIONRESOLUTIONTYPE_UNKNOWN");
    else
      v10 = off_1E562FCE0[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("disambiguationResolution"));
  }
  if (self->_originalResolutionContextId)
  {
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("originalResolutionContextId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("originalResolutionContextId"));

    }
  }
  if (self->_queryId)
  {
    -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated queryId](self, "queryId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("queryId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("queryId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *v5;
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
    self = -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated;
  v5 = -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalResolutionContextId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated setOriginalResolutionContextId:](v5, "setOriginalResolutionContextId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated setQueryId:](v5, "setQueryId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationResolution"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated setDisambiguationResolution:](v5, "setDisambiguationResolution:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmationResolution"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated setConfirmationResolution:](v5, "setConfirmationResolution:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anonymizedSelectedEntityIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated setAnonymizedSelectedEntityIdentifier:](v5, "setAnonymizedSelectedEntityIdentifier:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichResolutiontype
{
  return self->_whichResolutiontype;
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

- (NSString)anonymizedSelectedEntityIdentifier
{
  return self->_anonymizedSelectedEntityIdentifier;
}

- (void)setAnonymizedSelectedEntityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasOriginalResolutionContextId:(BOOL)a3
{
  self->_hasOriginalResolutionContextId = a3;
}

- (void)setHasQueryId:(BOOL)a3
{
  self->_hasQueryId = a3;
}

- (BOOL)hasDisambiguationResolution
{
  return self->_hasDisambiguationResolution;
}

- (void)setHasDisambiguationResolution:(BOOL)a3
{
  self->_hasDisambiguationResolution = a3;
}

- (BOOL)hasConfirmationResolution
{
  return self->_hasConfirmationResolution;
}

- (void)setHasConfirmationResolution:(BOOL)a3
{
  self->_hasConfirmationResolution = a3;
}

- (void)setHasAnonymizedSelectedEntityIdentifier:(BOOL)a3
{
  self->_hasAnonymizedSelectedEntityIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizedSelectedEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_queryId, 0);
  objc_storeStrong((id *)&self->_originalResolutionContextId, 0);
}

@end

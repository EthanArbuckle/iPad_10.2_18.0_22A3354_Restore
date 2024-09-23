@implementation RFSchemaRFGVisualResponseShownTier1

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RFSchemaRFGVisualResponseShownTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[RFSchemaRFGVisualResponseShownTier1 deleteResponseModel](self, "deleteResponseModel");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[RFSchemaRFGVisualResponseShownTier1 deleteResponseModel](self, "deleteResponseModel");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[RFSchemaRFGVisualResponseShownTier1 deleteResponseModel](self, "deleteResponseModel");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[RFSchemaRFGVisualResponseShownTier1 deleteResponseModel](self, "deleteResponseModel");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[RFSchemaRFGVisualResponseShownTier1 deleteResponseModel](self, "deleteResponseModel");

  return v5;
}

- (BOOL)hasResponseModel
{
  return self->_responseModel != 0;
}

- (void)deleteResponseModel
{
  -[RFSchemaRFGVisualResponseShownTier1 setResponseModel:](self, "setResponseModel:", 0);
}

- (BOOL)hasPatternId
{
  return self->_patternId != 0;
}

- (void)deletePatternId
{
  -[RFSchemaRFGVisualResponseShownTier1 setPatternId:](self, "setPatternId:", 0);
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (void)deleteVersion
{
  -[RFSchemaRFGVisualResponseShownTier1 setVersion:](self, "setVersion:", 0);
}

- (BOOL)hasResponseViewId
{
  return self->_responseViewId != 0;
}

- (void)deleteResponseViewId
{
  -[RFSchemaRFGVisualResponseShownTier1 setResponseViewId:](self, "setResponseViewId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFGVisualResponseShownTier1ReadFrom(self, (uint64_t)a3);
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
  -[RFSchemaRFGVisualResponseShownTier1 responseModel](self, "responseModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[RFSchemaRFGVisualResponseShownTier1 patternId](self, "patternId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[RFSchemaRFGVisualResponseShownTier1 version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[RFSchemaRFGVisualResponseShownTier1 responseViewId](self, "responseViewId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[RFSchemaRFGVisualResponseShownTier1 responseModel](self, "responseModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[RFSchemaRFGVisualResponseShownTier1 responseModel](self, "responseModel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[RFSchemaRFGVisualResponseShownTier1 responseModel](self, "responseModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[RFSchemaRFGVisualResponseShownTier1 patternId](self, "patternId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "patternId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[RFSchemaRFGVisualResponseShownTier1 patternId](self, "patternId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[RFSchemaRFGVisualResponseShownTier1 patternId](self, "patternId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "patternId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[RFSchemaRFGVisualResponseShownTier1 version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[RFSchemaRFGVisualResponseShownTier1 version](self, "version");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[RFSchemaRFGVisualResponseShownTier1 version](self, "version");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[RFSchemaRFGVisualResponseShownTier1 responseViewId](self, "responseViewId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseViewId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[RFSchemaRFGVisualResponseShownTier1 responseViewId](self, "responseViewId");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[RFSchemaRFGVisualResponseShownTier1 responseViewId](self, "responseViewId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseViewId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_responseModel, "hash");
  v4 = -[NSString hash](self->_patternId, "hash") ^ v3;
  v5 = -[NSString hash](self->_version, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_responseViewId, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_patternId)
  {
    -[RFSchemaRFGVisualResponseShownTier1 patternId](self, "patternId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("patternId"));

  }
  if (self->_responseModel)
  {
    -[RFSchemaRFGVisualResponseShownTier1 responseModel](self, "responseModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("responseModel"));

  }
  if (self->_responseViewId)
  {
    -[RFSchemaRFGVisualResponseShownTier1 responseViewId](self, "responseViewId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("responseViewId"));

  }
  if (self->_version)
  {
    -[RFSchemaRFGVisualResponseShownTier1 version](self, "version");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("version"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RFSchemaRFGVisualResponseShownTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RFSchemaRFGVisualResponseShownTier1)initWithJSON:(id)a3
{
  void *v4;
  RFSchemaRFGVisualResponseShownTier1 *v5;
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
    self = -[RFSchemaRFGVisualResponseShownTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RFSchemaRFGVisualResponseShownTier1)initWithDictionary:(id)a3
{
  id v4;
  RFSchemaRFGVisualResponseShownTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RFSchemaRFGVisualResponseShownTier1 *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFSchemaRFGVisualResponseShownTier1;
  v5 = -[RFSchemaRFGVisualResponseShownTier1 init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseModel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[RFSchemaRFGVisualResponseShownTier1 setResponseModel:](v5, "setResponseModel:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[RFSchemaRFGVisualResponseShownTier1 setPatternId:](v5, "setPatternId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[RFSchemaRFGVisualResponseShownTier1 setVersion:](v5, "setVersion:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseViewId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[RFSchemaRFGVisualResponseShownTier1 setResponseViewId:](v5, "setResponseViewId:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (NSString)responseModel
{
  return self->_responseModel;
}

- (void)setResponseModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)patternId
{
  return self->_patternId;
}

- (void)setPatternId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)responseViewId
{
  return self->_responseViewId;
}

- (void)setResponseViewId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasResponseModel:(BOOL)a3
{
  self->_hasResponseModel = a3;
}

- (void)setHasPatternId:(BOOL)a3
{
  self->_hasPatternId = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (void)setHasResponseViewId:(BOOL)a3
{
  self->_hasResponseViewId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseViewId, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
  objc_storeStrong((id *)&self->_responseModel, 0);
}

@end

@implementation FLSchemaFLCandidateCategory

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
  v13.super_class = (Class)FLSchemaFLCandidateCategory;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLSchemaFLCandidateCategory tool](self, "tool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLSchemaFLCandidateCategory deleteTool](self, "deleteTool");
  -[FLSchemaFLCandidateCategory parameter](self, "parameter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLSchemaFLCandidateCategory deleteParameter](self, "deleteParameter");

  return v5;
}

- (void)setTool:(id)a3
{
  FLSchemaFLToolCandidateCategory *v4;
  FLSchemaFLParameterCandidateCategory *parameter;
  FLSchemaFLToolCandidateCategory *tool;

  v4 = (FLSchemaFLToolCandidateCategory *)a3;
  parameter = self->_parameter;
  self->_parameter = 0;

  self->_whichCategory = v4 != 0;
  tool = self->_tool;
  self->_tool = v4;

}

- (FLSchemaFLToolCandidateCategory)tool
{
  if (self->_whichCategory == 1)
    return self->_tool;
  else
    return (FLSchemaFLToolCandidateCategory *)0;
}

- (void)deleteTool
{
  FLSchemaFLToolCandidateCategory *tool;

  if (self->_whichCategory == 1)
  {
    self->_whichCategory = 0;
    tool = self->_tool;
    self->_tool = 0;

  }
}

- (void)setParameter:(id)a3
{
  FLSchemaFLParameterCandidateCategory *v4;
  FLSchemaFLToolCandidateCategory *tool;
  FLSchemaFLParameterCandidateCategory *parameter;

  v4 = (FLSchemaFLParameterCandidateCategory *)a3;
  tool = self->_tool;
  self->_tool = 0;

  self->_whichCategory = 2 * (v4 != 0);
  parameter = self->_parameter;
  self->_parameter = v4;

}

- (FLSchemaFLParameterCandidateCategory)parameter
{
  if (self->_whichCategory == 2)
    return self->_parameter;
  else
    return (FLSchemaFLParameterCandidateCategory *)0;
}

- (void)deleteParameter
{
  FLSchemaFLParameterCandidateCategory *parameter;

  if (self->_whichCategory == 2)
  {
    self->_whichCategory = 0;
    parameter = self->_parameter;
    self->_parameter = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLCandidateCategoryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[FLSchemaFLCandidateCategory tool](self, "tool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLSchemaFLCandidateCategory tool](self, "tool");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLSchemaFLCandidateCategory parameter](self, "parameter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLSchemaFLCandidateCategory parameter](self, "parameter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichCategory;
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
    goto LABEL_13;
  whichCategory = self->_whichCategory;
  if (whichCategory != objc_msgSend(v4, "whichCategory"))
    goto LABEL_13;
  -[FLSchemaFLCandidateCategory tool](self, "tool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tool");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[FLSchemaFLCandidateCategory tool](self, "tool");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLSchemaFLCandidateCategory tool](self, "tool");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tool");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[FLSchemaFLCandidateCategory parameter](self, "parameter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[FLSchemaFLCandidateCategory parameter](self, "parameter");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[FLSchemaFLCandidateCategory parameter](self, "parameter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[FLSchemaFLToolCandidateCategory hash](self->_tool, "hash");
  return -[FLSchemaFLParameterCandidateCategory hash](self->_parameter, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_parameter)
  {
    -[FLSchemaFLCandidateCategory parameter](self, "parameter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("parameter"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("parameter"));

    }
  }
  if (self->_tool)
  {
    -[FLSchemaFLCandidateCategory tool](self, "tool");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("tool"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("tool"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLSchemaFLCandidateCategory dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLSchemaFLCandidateCategory)initWithJSON:(id)a3
{
  void *v4;
  FLSchemaFLCandidateCategory *v5;
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
    self = -[FLSchemaFLCandidateCategory initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLSchemaFLCandidateCategory)initWithDictionary:(id)a3
{
  id v4;
  FLSchemaFLCandidateCategory *v5;
  void *v6;
  FLSchemaFLToolCandidateCategory *v7;
  void *v8;
  FLSchemaFLParameterCandidateCategory *v9;
  FLSchemaFLCandidateCategory *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLSchemaFLCandidateCategory;
  v5 = -[FLSchemaFLCandidateCategory init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tool"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[FLSchemaFLToolCandidateCategory initWithDictionary:]([FLSchemaFLToolCandidateCategory alloc], "initWithDictionary:", v6);
      -[FLSchemaFLCandidateCategory setTool:](v5, "setTool:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLSchemaFLParameterCandidateCategory initWithDictionary:]([FLSchemaFLParameterCandidateCategory alloc], "initWithDictionary:", v8);
      -[FLSchemaFLCandidateCategory setParameter:](v5, "setParameter:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichCategory
{
  return self->_whichCategory;
}

- (BOOL)hasTool
{
  return self->_hasTool;
}

- (void)setHasTool:(BOOL)a3
{
  self->_hasTool = a3;
}

- (BOOL)hasParameter
{
  return self->_hasParameter;
}

- (void)setHasParameter:(BOOL)a3
{
  self->_hasParameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_tool, 0);
}

@end

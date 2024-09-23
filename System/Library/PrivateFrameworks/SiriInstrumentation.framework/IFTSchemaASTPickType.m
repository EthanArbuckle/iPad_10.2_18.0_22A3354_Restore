@implementation IFTSchemaASTPickType

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIndex:(int64_t)a3
{
  self->_none = 0;
  self->_whichOneof_Astpicktype = 1;
  self->_index = a3;
}

- (int64_t)index
{
  if (self->_whichOneof_Astpicktype == 1)
    return self->_index;
  else
    return 0;
}

- (void)deleteIndex
{
  if (self->_whichOneof_Astpicktype == 1)
  {
    self->_whichOneof_Astpicktype = 0;
    self->_index = 0;
  }
}

- (void)setNone:(BOOL)a3
{
  self->_index = 0;
  self->_whichOneof_Astpicktype = 3;
  self->_none = a3;
}

- (BOOL)none
{
  return self->_whichOneof_Astpicktype == 3 && self->_none;
}

- (void)deleteNone
{
  if (self->_whichOneof_Astpicktype == 3)
  {
    self->_whichOneof_Astpicktype = 0;
    self->_none = 0;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaASTPickTypeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t whichOneof_Astpicktype;
  id v6;

  v4 = a3;
  whichOneof_Astpicktype = self->_whichOneof_Astpicktype;
  v6 = v4;
  if (whichOneof_Astpicktype == 1)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    whichOneof_Astpicktype = self->_whichOneof_Astpicktype;
  }
  if (whichOneof_Astpicktype == 3)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Astpicktype;
  int64_t index;
  int none;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (whichOneof_Astpicktype = self->_whichOneof_Astpicktype,
        whichOneof_Astpicktype == objc_msgSend(v4, "whichOneof_Astpicktype"))
    && (index = self->_index, index == objc_msgSend(v4, "index")))
  {
    none = self->_none;
    v8 = none == objc_msgSend(v4, "none");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t whichOneof_Astpicktype;

  whichOneof_Astpicktype = self->_whichOneof_Astpicktype;
  if (whichOneof_Astpicktype == 3)
    return 2654435761 * self->_none;
  if (whichOneof_Astpicktype == 1)
    return 2654435761 * self->_index;
  return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t whichOneof_Astpicktype;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  whichOneof_Astpicktype = self->_whichOneof_Astpicktype;
  if (whichOneof_Astpicktype == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IFTSchemaASTPickType index](self, "index"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("index"));

    whichOneof_Astpicktype = self->_whichOneof_Astpicktype;
  }
  if (whichOneof_Astpicktype == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaASTPickType none](self, "none"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("none"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaASTPickType dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaASTPickType)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaASTPickType *v5;
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
    self = -[IFTSchemaASTPickType initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaASTPickType)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaASTPickType *v5;
  void *v6;
  void *v7;
  IFTSchemaASTPickType *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFTSchemaASTPickType;
  v5 = -[IFTSchemaASTPickType init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaASTPickType setIndex:](v5, "setIndex:", objc_msgSend(v6, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("none"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaASTPickType setNone:](v5, "setNone:", objc_msgSend(v7, "BOOLValue"));
    v8 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Astpicktype
{
  return self->_whichOneof_Astpicktype;
}

- (BOOL)hasIndex
{
  return self->_hasIndex;
}

- (void)setHasIndex:(BOOL)a3
{
  self->_hasIndex = a3;
}

- (BOOL)hasNone
{
  return self->_hasNone;
}

- (void)setHasNone:(BOOL)a3
{
  self->_hasNone = a3;
}

@end

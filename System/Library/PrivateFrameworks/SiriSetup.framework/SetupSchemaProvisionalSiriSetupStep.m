@implementation SetupSchemaProvisionalSiriSetupStep

- (void)setPage:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_page = a3;
}

- (BOOL)hasPage
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPage:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePage
{
  -[SetupSchemaProvisionalSiriSetupStep setPage:](self, "setPage:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SetupSchemaProvisionalSiriSetupStepReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int page;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((v4[12] & 1) == (*(_BYTE *)&self->_has & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0 || (page = self->_page, page == objc_msgSend(v4, "page")))
        v6 = 1;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_page;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[SetupSchemaProvisionalSiriSetupStep page](self, "page") - 1;
    if (v4 > 6)
      v5 = CFSTR("SIRISETUPPAGE_UNKNOWN");
    else
      v5 = off_24EFCFE00[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("page"));
  }
  -[SetupSchemaProvisionalSiriSetupStep willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SetupSchemaProvisionalSiriSetupStep dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (SetupSchemaProvisionalSiriSetupStep)initWithJSON:(id)a3
{
  void *v4;
  SetupSchemaProvisionalSiriSetupStep *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[SetupSchemaProvisionalSiriSetupStep initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SetupSchemaProvisionalSiriSetupStep)initWithDictionary:(id)a3
{
  id v4;
  SetupSchemaProvisionalSiriSetupStep *v5;
  void *v6;
  SetupSchemaProvisionalSiriSetupStep *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SetupSchemaProvisionalSiriSetupStep;
  v5 = -[SetupSchemaProvisionalSiriSetupStep init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("page"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SetupSchemaProvisionalSiriSetupStep setPage:](v5, "setPage:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)page
{
  return self->_page;
}

@end

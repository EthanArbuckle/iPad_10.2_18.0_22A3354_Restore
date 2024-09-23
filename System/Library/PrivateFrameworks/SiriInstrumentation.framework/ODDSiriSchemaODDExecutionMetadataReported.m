@implementation ODDSiriSchemaODDExecutionMetadataReported

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setExtensionName:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_extensionName = a3;
}

- (BOOL)hasExtensionName
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExtensionName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExtensionName
{
  -[ODDSiriSchemaODDExecutionMetadataReported setExtensionName:](self, "setExtensionName:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setExecutionStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_executionStatus = a3;
}

- (BOOL)hasExecutionStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasExecutionStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteExecutionStatus
{
  -[ODDSiriSchemaODDExecutionMetadataReported setExecutionStatus:](self, "setExecutionStatus:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDExecutionMetadataReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $C37309420384595487A40A7013D1E62F has;
  unsigned int v6;
  int extensionName;
  int v8;
  int executionStatus;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    extensionName = self->_extensionName;
    if (extensionName != objc_msgSend(v4, "extensionName"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    executionStatus = self->_executionStatus;
    if (executionStatus != objc_msgSend(v4, "executionStatus"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_extensionName;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_executionStatus;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  const __CFString *v5;
  unsigned int v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if (-[ODDSiriSchemaODDExecutionMetadataReported executionStatus](self, "executionStatus") == 1)
      v5 = CFSTR("ODDEXECUTIONSTATUS_COMPLETED");
    else
      v5 = CFSTR("ODDEXECUTIONSTATUS_UNKNOWN");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("executionStatus"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = -[ODDSiriSchemaODDExecutionMetadataReported extensionName](self, "extensionName") - 1;
    if (v6 > 2)
      v7 = CFSTR("ODDEXTENSIONNAME_UNKNOWN");
    else
      v7 = *(&off_1E563F130 + v6);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("extensionName"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDExecutionMetadataReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDExecutionMetadataReported)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDExecutionMetadataReported *v5;
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
    self = -[ODDSiriSchemaODDExecutionMetadataReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDExecutionMetadataReported)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDExecutionMetadataReported *v5;
  void *v6;
  void *v7;
  ODDSiriSchemaODDExecutionMetadataReported *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ODDSiriSchemaODDExecutionMetadataReported;
  v5 = -[ODDSiriSchemaODDExecutionMetadataReported init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("extensionName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDExecutionMetadataReported setExtensionName:](v5, "setExtensionName:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDExecutionMetadataReported setExecutionStatus:](v5, "setExecutionStatus:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (int)extensionName
{
  return self->_extensionName;
}

- (int)executionStatus
{
  return self->_executionStatus;
}

@end

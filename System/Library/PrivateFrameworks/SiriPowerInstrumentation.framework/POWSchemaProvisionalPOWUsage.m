@implementation POWSchemaProvisionalPOWUsage

- (void)setProcess:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_process = a3;
}

- (BOOL)hasProcess
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasProcess:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteProcess
{
  -[POWSchemaProvisionalPOWUsage setProcess:](self, "setProcess:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasProcessUsage
{
  return self->_processUsage != 0;
}

- (void)deleteProcessUsage
{
  -[POWSchemaProvisionalPOWUsage setProcessUsage:](self, "setProcessUsage:", 0);
}

- (void)setContext:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_context = a3;
}

- (BOOL)hasContext
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasContext:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteContext
{
  -[POWSchemaProvisionalPOWUsage setContext:](self, "setContext:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return POWSchemaProvisionalPOWUsageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[POWSchemaProvisionalPOWUsage processUsage](self, "processUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[POWSchemaProvisionalPOWUsage processUsage](self, "processUsage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int process;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  $9432C02C054E4672B35E85606AF3DCC1 has;
  int context;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((v4[28] & 1) != (*(_BYTE *)&self->_has & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    process = self->_process;
    if (process != objc_msgSend(v4, "process"))
      goto LABEL_15;
  }
  -[POWSchemaProvisionalPOWUsage processUsage](self, "processUsage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processUsage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[POWSchemaProvisionalPOWUsage processUsage](self, "processUsage");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[POWSchemaProvisionalPOWUsage processUsage](self, "processUsage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processUsage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  else
  {

  }
  has = self->_has;
  if (((v4[28] ^ *(unsigned int *)&has) & 2) != 0)
    goto LABEL_15;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    context = self->_context;
    if (context != objc_msgSend(v4, "context"))
      goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_process;
  else
    v3 = 0;
  v4 = -[POWSchemaProvisionalPOWProcessUsage hash](self->_processUsage, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_context;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[POWSchemaProvisionalPOWUsage context](self, "context") - 1;
    if (v5 > 0x31)
      v6 = CFSTR("UNKNOWN");
    else
      v6 = *(&off_1E79D57A0 + v5);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("context"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v7 = -[POWSchemaProvisionalPOWUsage process](self, "process") - 1;
    if (v7 > 7)
      v8 = CFSTR("POWPROCESS_UNKNOWN");
    else
      v8 = *(&off_1E79D5930 + v7);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("process"));
  }
  if (self->_processUsage)
  {
    -[POWSchemaProvisionalPOWUsage processUsage](self, "processUsage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("processUsage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("processUsage"));

    }
  }
  -[POWSchemaProvisionalPOWUsage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POWSchemaProvisionalPOWUsage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POWSchemaProvisionalPOWUsage)initWithJSON:(id)a3
{
  void *v4;
  POWSchemaProvisionalPOWUsage *v5;
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
    self = -[POWSchemaProvisionalPOWUsage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POWSchemaProvisionalPOWUsage)initWithDictionary:(id)a3
{
  id v4;
  POWSchemaProvisionalPOWUsage *v5;
  void *v6;
  void *v7;
  POWSchemaProvisionalPOWProcessUsage *v8;
  void *v9;
  POWSchemaProvisionalPOWUsage *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POWSchemaProvisionalPOWUsage;
  v5 = -[POWSchemaProvisionalPOWUsage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("process"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POWSchemaProvisionalPOWUsage setProcess:](v5, "setProcess:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processUsage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[POWSchemaProvisionalPOWProcessUsage initWithDictionary:]([POWSchemaProvisionalPOWProcessUsage alloc], "initWithDictionary:", v7);
      -[POWSchemaProvisionalPOWUsage setProcessUsage:](v5, "setProcessUsage:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("context"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POWSchemaProvisionalPOWUsage setContext:](v5, "setContext:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (int)process
{
  return self->_process;
}

- (POWSchemaProvisionalPOWProcessUsage)processUsage
{
  return self->_processUsage;
}

- (void)setProcessUsage:(id)a3
{
  objc_storeStrong((id *)&self->_processUsage, a3);
}

- (int)context
{
  return self->_context;
}

- (void)setHasProcessUsage:(BOOL)a3
{
  self->_hasProcessUsage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processUsage, 0);
}

@end

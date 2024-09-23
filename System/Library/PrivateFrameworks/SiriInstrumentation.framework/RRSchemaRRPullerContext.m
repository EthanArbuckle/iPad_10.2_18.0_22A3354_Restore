@implementation RRSchemaRRPullerContext

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
  v13.super_class = (Class)RRSchemaRRPullerContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RRSchemaRRPullerContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RRSchemaRRPullerContext deleteEnded](self, "deleteEnded");
  -[RRSchemaRRPullerContext failed](self, "failed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RRSchemaRRPullerContext deleteFailed](self, "deleteFailed");

  return v5;
}

- (void)setEnded:(id)a3
{
  RRSchemaRRPullerEnded *v4;
  RRSchemaRRPullerFailed *failed;
  RRSchemaRRPullerEnded *ended;

  v4 = (RRSchemaRRPullerEnded *)a3;
  failed = self->_failed;
  self->_failed = 0;

  self->_whichContextevent = 2 * (v4 != 0);
  ended = self->_ended;
  self->_ended = v4;

}

- (RRSchemaRRPullerEnded)ended
{
  if (self->_whichContextevent == 2)
    return self->_ended;
  else
    return (RRSchemaRRPullerEnded *)0;
}

- (void)deleteEnded
{
  RRSchemaRRPullerEnded *ended;

  if (self->_whichContextevent == 2)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setFailed:(id)a3
{
  RRSchemaRRPullerFailed *v4;
  RRSchemaRRPullerEnded *ended;
  unint64_t v6;
  RRSchemaRRPullerFailed *failed;

  v4 = (RRSchemaRRPullerFailed *)a3;
  ended = self->_ended;
  self->_ended = 0;

  v6 = 3;
  if (!v4)
    v6 = 0;
  self->_whichContextevent = v6;
  failed = self->_failed;
  self->_failed = v4;

}

- (RRSchemaRRPullerFailed)failed
{
  if (self->_whichContextevent == 3)
    return self->_failed;
  else
    return (RRSchemaRRPullerFailed *)0;
}

- (void)deleteFailed
{
  RRSchemaRRPullerFailed *failed;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
    failed = self->_failed;
    self->_failed = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaRRPullerContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[RRSchemaRRPullerContext ended](self, "ended");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RRSchemaRRPullerContext ended](self, "ended");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaRRPullerContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RRSchemaRRPullerContext failed](self, "failed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichContextevent;
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
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_13;
  -[RRSchemaRRPullerContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[RRSchemaRRPullerContext ended](self, "ended");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RRSchemaRRPullerContext ended](self, "ended");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[RRSchemaRRPullerContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RRSchemaRRPullerContext failed](self, "failed");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[RRSchemaRRPullerContext failed](self, "failed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failed");
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

  v3 = -[RRSchemaRRPullerEnded hash](self->_ended, "hash");
  return -[RRSchemaRRPullerFailed hash](self->_failed, "hash") ^ v3;
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
  if (self->_ended)
  {
    -[RRSchemaRRPullerContext ended](self, "ended");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ended"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ended"));

    }
  }
  if (self->_failed)
  {
    -[RRSchemaRRPullerContext failed](self, "failed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("failed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("failed"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RRSchemaRRPullerContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RRSchemaRRPullerContext)initWithJSON:(id)a3
{
  void *v4;
  RRSchemaRRPullerContext *v5;
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
    self = -[RRSchemaRRPullerContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RRSchemaRRPullerContext)initWithDictionary:(id)a3
{
  id v4;
  RRSchemaRRPullerContext *v5;
  void *v6;
  RRSchemaRRPullerEnded *v7;
  void *v8;
  RRSchemaRRPullerFailed *v9;
  RRSchemaRRPullerContext *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RRSchemaRRPullerContext;
  v5 = -[RRSchemaRRPullerContext init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[RRSchemaRRPullerEnded initWithDictionary:]([RRSchemaRRPullerEnded alloc], "initWithDictionary:", v6);
      -[RRSchemaRRPullerContext setEnded:](v5, "setEnded:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[RRSchemaRRPullerFailed initWithDictionary:]([RRSchemaRRPullerFailed alloc], "initWithDictionary:", v8);
      -[RRSchemaRRPullerContext setFailed:](v5, "setFailed:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
}

@end

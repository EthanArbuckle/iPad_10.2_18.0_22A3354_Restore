@implementation RRSchemaProvisionalRREntityPoolResolveContext

- (void)setStartedOrChanged:(id)a3
{
  RRSchemaProvisionalRREntityPoolResolveStarted *v4;
  RRSchemaProvisionalRREntityPoolResolveEnded *ended;
  RRSchemaProvisionalRREntityPoolResolveFailed *failed;
  unint64_t v7;
  RRSchemaProvisionalRREntityPoolResolveStarted *startedOrChanged;

  v4 = (RRSchemaProvisionalRREntityPoolResolveStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (RRSchemaProvisionalRREntityPoolResolveStarted)startedOrChanged
{
  if (self->_whichContextevent == 101)
    return self->_startedOrChanged;
  else
    return (RRSchemaProvisionalRREntityPoolResolveStarted *)0;
}

- (void)setEnded:(id)a3
{
  RRSchemaProvisionalRREntityPoolResolveEnded *v4;
  RRSchemaProvisionalRREntityPoolResolveStarted *startedOrChanged;
  RRSchemaProvisionalRREntityPoolResolveFailed *failed;
  unint64_t v7;
  RRSchemaProvisionalRREntityPoolResolveEnded *ended;

  v4 = (RRSchemaProvisionalRREntityPoolResolveEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  ended = self->_ended;
  self->_ended = v4;

}

- (RRSchemaProvisionalRREntityPoolResolveEnded)ended
{
  if (self->_whichContextevent == 102)
    return self->_ended;
  else
    return (RRSchemaProvisionalRREntityPoolResolveEnded *)0;
}

- (void)setFailed:(id)a3
{
  RRSchemaProvisionalRREntityPoolResolveFailed *v4;
  RRSchemaProvisionalRREntityPoolResolveStarted *startedOrChanged;
  RRSchemaProvisionalRREntityPoolResolveEnded *ended;
  unint64_t v7;
  RRSchemaProvisionalRREntityPoolResolveFailed *failed;

  v4 = (RRSchemaProvisionalRREntityPoolResolveFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  failed = self->_failed;
  self->_failed = v4;

}

- (RRSchemaProvisionalRREntityPoolResolveFailed)failed
{
  if (self->_whichContextevent == 103)
    return self->_failed;
  else
    return (RRSchemaProvisionalRREntityPoolResolveFailed *)0;
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRREntityPoolResolveContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[RRSchemaProvisionalRREntityPoolResolveContext startedOrChanged](self, "startedOrChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RRSchemaProvisionalRREntityPoolResolveContext startedOrChanged](self, "startedOrChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaProvisionalRREntityPoolResolveContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RRSchemaProvisionalRREntityPoolResolveContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaProvisionalRREntityPoolResolveContext failed](self, "failed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RRSchemaProvisionalRREntityPoolResolveContext failed](self, "failed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_18;
  -[RRSchemaProvisionalRREntityPoolResolveContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[RRSchemaProvisionalRREntityPoolResolveContext startedOrChanged](self, "startedOrChanged");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RRSchemaProvisionalRREntityPoolResolveContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[RRSchemaProvisionalRREntityPoolResolveContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[RRSchemaProvisionalRREntityPoolResolveContext ended](self, "ended");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[RRSchemaProvisionalRREntityPoolResolveContext ended](self, "ended");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[RRSchemaProvisionalRREntityPoolResolveContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RRSchemaProvisionalRREntityPoolResolveContext failed](self, "failed");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[RRSchemaProvisionalRREntityPoolResolveContext failed](self, "failed");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failed");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[RRSchemaProvisionalRREntityPoolResolveStarted hash](self->_startedOrChanged, "hash");
  v4 = -[RRSchemaProvisionalRREntityPoolResolveEnded hash](self->_ended, "hash") ^ v3;
  return v4 ^ -[RRSchemaProvisionalRREntityPoolResolveFailed hash](self->_failed, "hash");
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
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_ended)
  {
    -[RRSchemaProvisionalRREntityPoolResolveContext ended](self, "ended");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ended"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ended"));

    }
  }
  if (self->_failed)
  {
    -[RRSchemaProvisionalRREntityPoolResolveContext failed](self, "failed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("failed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("failed"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[RRSchemaProvisionalRREntityPoolResolveContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("startedOrChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("startedOrChanged"));

    }
  }
  -[RRSchemaProvisionalRREntityPoolResolveContext willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RRSchemaProvisionalRREntityPoolResolveContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RRSchemaProvisionalRREntityPoolResolveContext)initWithJSON:(id)a3
{
  void *v4;
  RRSchemaProvisionalRREntityPoolResolveContext *v5;
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
    self = -[RRSchemaProvisionalRREntityPoolResolveContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RRSchemaProvisionalRREntityPoolResolveContext)initWithDictionary:(id)a3
{
  id v4;
  RRSchemaProvisionalRREntityPoolResolveContext *v5;
  void *v6;
  RRSchemaProvisionalRREntityPoolResolveStarted *v7;
  void *v8;
  RRSchemaProvisionalRREntityPoolResolveEnded *v9;
  void *v10;
  RRSchemaProvisionalRREntityPoolResolveFailed *v11;
  RRSchemaProvisionalRREntityPoolResolveContext *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RRSchemaProvisionalRREntityPoolResolveContext;
  v5 = -[RRSchemaProvisionalRREntityPoolResolveContext init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[RRSchemaProvisionalRREntityPoolResolveStarted initWithDictionary:]([RRSchemaProvisionalRREntityPoolResolveStarted alloc], "initWithDictionary:", v6);
      -[RRSchemaProvisionalRREntityPoolResolveContext setStartedOrChanged:](v5, "setStartedOrChanged:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[RRSchemaProvisionalRREntityPoolResolveEnded initWithDictionary:]([RRSchemaProvisionalRREntityPoolResolveEnded alloc], "initWithDictionary:", v8);
      -[RRSchemaProvisionalRREntityPoolResolveContext setEnded:](v5, "setEnded:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[RRSchemaProvisionalRREntityPoolResolveFailed initWithDictionary:]([RRSchemaProvisionalRREntityPoolResolveFailed alloc], "initWithDictionary:", v10);
      -[RRSchemaProvisionalRREntityPoolResolveContext setFailed:](v5, "setFailed:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (BOOL)hasStartedOrChanged
{
  return self->_hasStartedOrChanged;
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
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
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

@end

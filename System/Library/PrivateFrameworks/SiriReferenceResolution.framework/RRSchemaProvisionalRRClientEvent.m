@implementation RRSchemaProvisionalRRClientEvent

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[RRSchemaProvisionalRRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 3)
    return CFSTR("com.apple.aiml.siri.rr.provisional.ProvisionalRRClientEvent");
  else
    return *(&off_24CDCC0E8 + v2 - 101);
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)setPullerContext:(id)a3
{
  RRSchemaProvisionalPullerContext *v4;
  RRSchemaProvisionalRREntityPoolReturned *entityPoolReturned;
  RRSchemaProvisionalRREntityPoolResolveContext *entityPoolResolveContext;
  RRSchemaProvisionalRRUsoGraphTier1 *rrUsoGraphTier1;
  unint64_t v8;
  RRSchemaProvisionalPullerContext *pullerContext;

  v4 = (RRSchemaProvisionalPullerContext *)a3;
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  v8 = 101;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  pullerContext = self->_pullerContext;
  self->_pullerContext = v4;

}

- (RRSchemaProvisionalPullerContext)pullerContext
{
  if (self->_whichEvent_Type == 101)
    return self->_pullerContext;
  else
    return (RRSchemaProvisionalPullerContext *)0;
}

- (void)setEntityPoolReturned:(id)a3
{
  RRSchemaProvisionalRREntityPoolReturned *v4;
  RRSchemaProvisionalPullerContext *pullerContext;
  RRSchemaProvisionalRREntityPoolResolveContext *entityPoolResolveContext;
  RRSchemaProvisionalRRUsoGraphTier1 *rrUsoGraphTier1;
  unint64_t v8;
  RRSchemaProvisionalRREntityPoolReturned *entityPoolReturned;

  v4 = (RRSchemaProvisionalRREntityPoolReturned *)a3;
  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  v8 = 102;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = v4;

}

- (RRSchemaProvisionalRREntityPoolReturned)entityPoolReturned
{
  if (self->_whichEvent_Type == 102)
    return self->_entityPoolReturned;
  else
    return (RRSchemaProvisionalRREntityPoolReturned *)0;
}

- (void)setEntityPoolResolveContext:(id)a3
{
  RRSchemaProvisionalRREntityPoolResolveContext *v4;
  RRSchemaProvisionalPullerContext *pullerContext;
  RRSchemaProvisionalRREntityPoolReturned *entityPoolReturned;
  RRSchemaProvisionalRRUsoGraphTier1 *rrUsoGraphTier1;
  unint64_t v8;
  RRSchemaProvisionalRREntityPoolResolveContext *entityPoolResolveContext;

  v4 = (RRSchemaProvisionalRREntityPoolResolveContext *)a3;
  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  v8 = 103;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = v4;

}

- (RRSchemaProvisionalRREntityPoolResolveContext)entityPoolResolveContext
{
  if (self->_whichEvent_Type == 103)
    return self->_entityPoolResolveContext;
  else
    return (RRSchemaProvisionalRREntityPoolResolveContext *)0;
}

- (void)setRrUsoGraphTier1:(id)a3
{
  RRSchemaProvisionalRRUsoGraphTier1 *v4;
  RRSchemaProvisionalPullerContext *pullerContext;
  RRSchemaProvisionalRREntityPoolReturned *entityPoolReturned;
  RRSchemaProvisionalRREntityPoolResolveContext *entityPoolResolveContext;
  unint64_t v8;
  RRSchemaProvisionalRRUsoGraphTier1 *rrUsoGraphTier1;

  v4 = (RRSchemaProvisionalRRUsoGraphTier1 *)a3;
  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  v8 = 104;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = v4;

}

- (RRSchemaProvisionalRRUsoGraphTier1)rrUsoGraphTier1
{
  if (self->_whichEvent_Type == 104)
    return self->_rrUsoGraphTier1;
  else
    return (RRSchemaProvisionalRRUsoGraphTier1 *)0;
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRRClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[RRSchemaProvisionalRRClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RRSchemaProvisionalRRClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaProvisionalRRClientEvent pullerContext](self, "pullerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RRSchemaProvisionalRRClientEvent pullerContext](self, "pullerContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaProvisionalRRClientEvent entityPoolReturned](self, "entityPoolReturned");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RRSchemaProvisionalRRClientEvent entityPoolReturned](self, "entityPoolReturned");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaProvisionalRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RRSchemaProvisionalRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaProvisionalRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[RRSchemaProvisionalRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
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
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_28;
  -[RRSchemaProvisionalRRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[RRSchemaProvisionalRRClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RRSchemaProvisionalRRClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[RRSchemaProvisionalRRClientEvent pullerContext](self, "pullerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pullerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[RRSchemaProvisionalRRClientEvent pullerContext](self, "pullerContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[RRSchemaProvisionalRRClientEvent pullerContext](self, "pullerContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pullerContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[RRSchemaProvisionalRRClientEvent entityPoolReturned](self, "entityPoolReturned");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityPoolReturned");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[RRSchemaProvisionalRRClientEvent entityPoolReturned](self, "entityPoolReturned");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[RRSchemaProvisionalRRClientEvent entityPoolReturned](self, "entityPoolReturned");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityPoolReturned");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[RRSchemaProvisionalRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityPoolResolveContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[RRSchemaProvisionalRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[RRSchemaProvisionalRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityPoolResolveContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[RRSchemaProvisionalRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rrUsoGraphTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RRSchemaProvisionalRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[RRSchemaProvisionalRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rrUsoGraphTier1");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
LABEL_27:

  }
LABEL_28:
  v33 = 0;
LABEL_29:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[RRSchemaProvisionalRRClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[RRSchemaProvisionalPullerContext hash](self->_pullerContext, "hash") ^ v3;
  v5 = -[RRSchemaProvisionalRREntityPoolReturned hash](self->_entityPoolReturned, "hash");
  v6 = v4 ^ v5 ^ -[RRSchemaProvisionalRREntityPoolResolveContext hash](self->_entityPoolResolveContext, "hash");
  return v6 ^ -[RRSchemaProvisionalRRUsoGraphTier1 hash](self->_rrUsoGraphTier1, "hash");
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_entityPoolResolveContext)
  {
    -[RRSchemaProvisionalRRClientEvent entityPoolResolveContext](self, "entityPoolResolveContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityPoolResolveContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("entityPoolResolveContext"));

    }
  }
  if (self->_entityPoolReturned)
  {
    -[RRSchemaProvisionalRRClientEvent entityPoolReturned](self, "entityPoolReturned");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("entityPoolReturned"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityPoolReturned"));

    }
  }
  if (self->_eventMetadata)
  {
    -[RRSchemaProvisionalRRClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("eventMetadata"));

    }
  }
  if (self->_pullerContext)
  {
    -[RRSchemaProvisionalRRClientEvent pullerContext](self, "pullerContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("pullerContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pullerContext"));

    }
  }
  if (self->_rrUsoGraphTier1)
  {
    -[RRSchemaProvisionalRRClientEvent rrUsoGraphTier1](self, "rrUsoGraphTier1");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rrUsoGraphTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("rrUsoGraphTier1"));

    }
  }
  -[RRSchemaProvisionalRRClientEvent willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RRSchemaProvisionalRRClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RRSchemaProvisionalRRClientEvent)initWithJSON:(id)a3
{
  void *v4;
  RRSchemaProvisionalRRClientEvent *v5;
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
    self = -[RRSchemaProvisionalRRClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RRSchemaProvisionalRRClientEvent)initWithDictionary:(id)a3
{
  id v4;
  RRSchemaProvisionalRRClientEvent *v5;
  void *v6;
  RRSchemaProvisionalRRClientEventMetadata *v7;
  void *v8;
  RRSchemaProvisionalPullerContext *v9;
  void *v10;
  RRSchemaProvisionalRREntityPoolReturned *v11;
  void *v12;
  RRSchemaProvisionalRREntityPoolResolveContext *v13;
  void *v14;
  RRSchemaProvisionalRRUsoGraphTier1 *v15;
  RRSchemaProvisionalRRClientEvent *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RRSchemaProvisionalRRClientEvent;
  v5 = -[RRSchemaProvisionalRRClientEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[RRSchemaProvisionalRRClientEventMetadata initWithDictionary:]([RRSchemaProvisionalRRClientEventMetadata alloc], "initWithDictionary:", v6);
      -[RRSchemaProvisionalRRClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pullerContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[RRSchemaProvisionalPullerContext initWithDictionary:]([RRSchemaProvisionalPullerContext alloc], "initWithDictionary:", v8);
      -[RRSchemaProvisionalRRClientEvent setPullerContext:](v5, "setPullerContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPoolReturned"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[RRSchemaProvisionalRREntityPoolReturned initWithDictionary:]([RRSchemaProvisionalRREntityPoolReturned alloc], "initWithDictionary:", v10);
      -[RRSchemaProvisionalRRClientEvent setEntityPoolReturned:](v5, "setEntityPoolReturned:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityPoolResolveContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[RRSchemaProvisionalRREntityPoolResolveContext initWithDictionary:]([RRSchemaProvisionalRREntityPoolResolveContext alloc], "initWithDictionary:", v12);
      -[RRSchemaProvisionalRRClientEvent setEntityPoolResolveContext:](v5, "setEntityPoolResolveContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rrUsoGraphTier1"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[RRSchemaProvisionalRRUsoGraphTier1 initWithDictionary:]([RRSchemaProvisionalRRUsoGraphTier1 alloc], "initWithDictionary:", v14);
      -[RRSchemaProvisionalRRClientEvent setRrUsoGraphTier1:](v5, "setRrUsoGraphTier1:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RRSchemaProvisionalRRClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasPullerContext
{
  return self->_hasPullerContext;
}

- (void)setHasPullerContext:(BOOL)a3
{
  self->_hasPullerContext = a3;
}

- (BOOL)hasEntityPoolReturned
{
  return self->_hasEntityPoolReturned;
}

- (void)setHasEntityPoolReturned:(BOOL)a3
{
  self->_hasEntityPoolReturned = a3;
}

- (BOOL)hasEntityPoolResolveContext
{
  return self->_hasEntityPoolResolveContext;
}

- (void)setHasEntityPoolResolveContext:(BOOL)a3
{
  self->_hasEntityPoolResolveContext = a3;
}

- (BOOL)hasRrUsoGraphTier1
{
  return self->_hasRrUsoGraphTier1;
}

- (void)setHasRrUsoGraphTier1:(BOOL)a3
{
  self->_hasRrUsoGraphTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rrUsoGraphTier1, 0);
  objc_storeStrong((id *)&self->_entityPoolResolveContext, 0);
  objc_storeStrong((id *)&self->_entityPoolReturned, 0);
  objc_storeStrong((id *)&self->_pullerContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 7;
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)getTypeId
{
  return CFSTR("com.apple.aiml.siri.rr.provisional.RRClientEvent");
}

- (id)getVersion
{
  return &unk_24CDD0978;
}

@end

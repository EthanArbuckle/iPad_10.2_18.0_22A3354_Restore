@implementation POWSchemaProvisionalPOWClientEvent

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
  return CFSTR("com.apple.aiml.siri.power.POWClientEvent");
}

- (id)getVersion
{
  return &unk_1E79D94E0;
}

- (id)qualifiedMessageName
{
  if (-[POWSchemaProvisionalPOWClientEvent whichEvent_Type](self, "whichEvent_Type") == 101)
    return CFSTR("com.apple.aiml.siri.power.ProvisionalPOWClientEvent.ProvisionalPOWUsage");
  else
    return CFSTR("com.apple.aiml.siri.power.ProvisionalPOWClientEvent");
}

- (BOOL)hasLink
{
  return self->_link != 0;
}

- (void)deleteLink
{
  -[POWSchemaProvisionalPOWClientEvent setLink:](self, "setLink:", 0);
}

- (void)setUsage:(id)a3
{
  unint64_t v3;

  v3 = 101;
  if (!a3)
    v3 = 0;
  self->_whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_usage, a3);
}

- (POWSchemaProvisionalPOWUsage)usage
{
  if (self->_whichEvent_Type == 101)
    return self->_usage;
  else
    return (POWSchemaProvisionalPOWUsage *)0;
}

- (void)deleteUsage
{
  POWSchemaProvisionalPOWUsage *usage;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    usage = self->_usage;
    self->_usage = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return POWSchemaProvisionalPOWClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[POWSchemaProvisionalPOWClientEvent link](self, "link");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[POWSchemaProvisionalPOWClientEvent link](self, "link");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POWSchemaProvisionalPOWClientEvent usage](self, "usage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[POWSchemaProvisionalPOWClientEvent usage](self, "usage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_13;
  -[POWSchemaProvisionalPOWClientEvent link](self, "link");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "link");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[POWSchemaProvisionalPOWClientEvent link](self, "link");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[POWSchemaProvisionalPOWClientEvent link](self, "link");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "link");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[POWSchemaProvisionalPOWClientEvent usage](self, "usage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[POWSchemaProvisionalPOWClientEvent usage](self, "usage");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[POWSchemaProvisionalPOWClientEvent usage](self, "usage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usage");
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
  uint64_t v3;

  v3 = -[SISchemaRequestLinkInfo hash](self->_link, "hash");
  return -[POWSchemaProvisionalPOWUsage hash](self->_usage, "hash") ^ v3;
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
  if (self->_link)
  {
    -[POWSchemaProvisionalPOWClientEvent link](self, "link");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("link"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("link"));

    }
  }
  if (self->_usage)
  {
    -[POWSchemaProvisionalPOWClientEvent usage](self, "usage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("usage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("usage"));

    }
  }
  -[POWSchemaProvisionalPOWClientEvent willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POWSchemaProvisionalPOWClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POWSchemaProvisionalPOWClientEvent)initWithJSON:(id)a3
{
  void *v4;
  POWSchemaProvisionalPOWClientEvent *v5;
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
    self = -[POWSchemaProvisionalPOWClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POWSchemaProvisionalPOWClientEvent)initWithDictionary:(id)a3
{
  id v4;
  POWSchemaProvisionalPOWClientEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  POWSchemaProvisionalPOWUsage *v9;
  POWSchemaProvisionalPOWClientEvent *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POWSchemaProvisionalPOWClientEvent;
  v5 = -[POWSchemaProvisionalPOWClientEvent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("link"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A498]), "initWithDictionary:", v6);
      -[POWSchemaProvisionalPOWClientEvent setLink:](v5, "setLink:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[POWSchemaProvisionalPOWUsage initWithDictionary:]([POWSchemaProvisionalPOWUsage alloc], "initWithDictionary:", v8);
      -[POWSchemaProvisionalPOWClientEvent setUsage:](v5, "setUsage:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SISchemaRequestLinkInfo)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_storeStrong((id *)&self->_link, a3);
}

- (void)setHasLink:(BOOL)a3
{
  self->_hasLink = a3;
}

- (BOOL)hasUsage
{
  return self->_hasUsage;
}

- (void)setHasUsage:(BOOL)a3
{
  self->_hasUsage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_link, 0);
}

@end

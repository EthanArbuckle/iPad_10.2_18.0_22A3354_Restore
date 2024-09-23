@implementation PLATFORMProvisionalConnectedComponentsWrapper

- (id)qualifiedMessageName
{
  if (-[PLATFORMProvisionalConnectedComponentsWrapper whichEventtype](self, "whichEventtype") == 101)
    return CFSTR("com.apple.aiml.siri.platform.ProvisionalConnectedComponentsWrapper.ProvisionalConnectedComponentsByClock");
  else
    return CFSTR("com.apple.aiml.siri.platform.ProvisionalConnectedComponentsWrapper");
}

- (BOOL)hasClockIdentifier
{
  return self->_clockIdentifier != 0;
}

- (void)deleteClockIdentifier
{
  -[PLATFORMProvisionalConnectedComponentsWrapper setClockIdentifier:](self, "setClockIdentifier:", 0);
}

- (void)setMsg:(id)a3
{
  unint64_t v3;

  v3 = 101;
  if (!a3)
    v3 = 0;
  self->_whichEventtype = v3;
  objc_storeStrong((id *)&self->_msg, a3);
}

- (PLATFORMProvisionalConnectedComponentsByClock)msg
{
  if (self->_whichEventtype == 101)
    return self->_msg;
  else
    return (PLATFORMProvisionalConnectedComponentsByClock *)0;
}

- (void)deleteMsg
{
  PLATFORMProvisionalConnectedComponentsByClock *msg;

  if (self->_whichEventtype == 101)
  {
    self->_whichEventtype = 0;
    msg = self->_msg;
    self->_msg = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PLATFORMProvisionalConnectedComponentsWrapperReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PLATFORMProvisionalConnectedComponentsWrapper clockIdentifier](self, "clockIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLATFORMProvisionalConnectedComponentsWrapper clockIdentifier](self, "clockIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLATFORMProvisionalConnectedComponentsWrapper msg](self, "msg");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLATFORMProvisionalConnectedComponentsWrapper msg](self, "msg");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEventtype;
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
  whichEventtype = self->_whichEventtype;
  if (whichEventtype != objc_msgSend(v4, "whichEventtype"))
    goto LABEL_13;
  -[PLATFORMProvisionalConnectedComponentsWrapper clockIdentifier](self, "clockIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clockIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[PLATFORMProvisionalConnectedComponentsWrapper clockIdentifier](self, "clockIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PLATFORMProvisionalConnectedComponentsWrapper clockIdentifier](self, "clockIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clockIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[PLATFORMProvisionalConnectedComponentsWrapper msg](self, "msg");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "msg");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PLATFORMProvisionalConnectedComponentsWrapper msg](self, "msg");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[PLATFORMProvisionalConnectedComponentsWrapper msg](self, "msg");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "msg");
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

  v3 = -[SISchemaUUID hash](self->_clockIdentifier, "hash");
  return -[PLATFORMProvisionalConnectedComponentsByClock hash](self->_msg, "hash") ^ v3;
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
  if (self->_clockIdentifier)
  {
    -[PLATFORMProvisionalConnectedComponentsWrapper clockIdentifier](self, "clockIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clockIdentifier"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clockIdentifier"));

    }
  }
  if (self->_msg)
  {
    -[PLATFORMProvisionalConnectedComponentsWrapper msg](self, "msg");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("msg"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("msg"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLATFORMProvisionalConnectedComponentsWrapper dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLATFORMProvisionalConnectedComponentsWrapper)initWithJSON:(id)a3
{
  void *v4;
  PLATFORMProvisionalConnectedComponentsWrapper *v5;
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
    self = -[PLATFORMProvisionalConnectedComponentsWrapper initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLATFORMProvisionalConnectedComponentsWrapper)initWithDictionary:(id)a3
{
  id v4;
  PLATFORMProvisionalConnectedComponentsWrapper *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  PLATFORMProvisionalConnectedComponentsByClock *v9;
  PLATFORMProvisionalConnectedComponentsWrapper *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLATFORMProvisionalConnectedComponentsWrapper;
  v5 = -[PLATFORMProvisionalConnectedComponentsWrapper init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clockIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLATFORMProvisionalConnectedComponentsWrapper setClockIdentifier:](v5, "setClockIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("msg"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PLATFORMProvisionalConnectedComponentsByClock initWithDictionary:]([PLATFORMProvisionalConnectedComponentsByClock alloc], "initWithDictionary:", v8);
      -[PLATFORMProvisionalConnectedComponentsWrapper setMsg:](v5, "setMsg:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichEventtype
{
  return self->_whichEventtype;
}

- (SISchemaUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clockIdentifier, a3);
}

- (void)setHasClockIdentifier:(BOOL)a3
{
  self->_hasClockIdentifier = a3;
}

- (BOOL)hasMsg
{
  return self->_hasMsg;
}

- (void)setHasMsg:(BOOL)a3
{
  self->_hasMsg = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msg, 0);
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
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
  return CFSTR("com.apple.aiml.siri.platform.ConnectedComponentsWrapper");
}

- (id)getVersion
{
  return &unk_1E57C58B8;
}

@end

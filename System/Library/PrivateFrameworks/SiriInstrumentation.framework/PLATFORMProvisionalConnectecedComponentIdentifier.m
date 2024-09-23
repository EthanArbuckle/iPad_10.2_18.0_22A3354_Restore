@implementation PLATFORMProvisionalConnectecedComponentIdentifier

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)deleteUuid
{
  -[PLATFORMProvisionalConnectecedComponentIdentifier setUuid:](self, "setUuid:", 0);
}

- (BOOL)hasComponent
{
  return self->_component != 0;
}

- (void)deleteComponent
{
  -[PLATFORMProvisionalConnectecedComponentIdentifier setComponent:](self, "setComponent:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLATFORMProvisionalConnectecedComponentIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PLATFORMProvisionalConnectecedComponentIdentifier uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLATFORMProvisionalConnectecedComponentIdentifier uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLATFORMProvisionalConnectecedComponentIdentifier component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[PLATFORMProvisionalConnectecedComponentIdentifier uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PLATFORMProvisionalConnectecedComponentIdentifier uuid](self, "uuid");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLATFORMProvisionalConnectecedComponentIdentifier uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PLATFORMProvisionalConnectecedComponentIdentifier component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLATFORMProvisionalConnectecedComponentIdentifier component](self, "component");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PLATFORMProvisionalConnectecedComponentIdentifier component](self, "component");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "component");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SISchemaUUID hash](self->_uuid, "hash");
  return -[NSString hash](self->_component, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_component)
  {
    -[PLATFORMProvisionalConnectecedComponentIdentifier component](self, "component");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("component"));

  }
  if (self->_uuid)
  {
    -[PLATFORMProvisionalConnectecedComponentIdentifier uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("uuid"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("uuid"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLATFORMProvisionalConnectecedComponentIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLATFORMProvisionalConnectecedComponentIdentifier)initWithJSON:(id)a3
{
  void *v4;
  PLATFORMProvisionalConnectecedComponentIdentifier *v5;
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
    self = -[PLATFORMProvisionalConnectecedComponentIdentifier initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLATFORMProvisionalConnectecedComponentIdentifier)initWithDictionary:(id)a3
{
  id v4;
  PLATFORMProvisionalConnectecedComponentIdentifier *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  PLATFORMProvisionalConnectecedComponentIdentifier *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLATFORMProvisionalConnectecedComponentIdentifier;
  v5 = -[PLATFORMProvisionalConnectecedComponentIdentifier init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLATFORMProvisionalConnectecedComponentIdentifier setUuid:](v5, "setUuid:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("component"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PLATFORMProvisionalConnectecedComponentIdentifier setComponent:](v5, "setComponent:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (SISchemaUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasUuid:(BOOL)a3
{
  self->_hasUuid = a3;
}

- (void)setHasComponent:(BOOL)a3
{
  self->_hasComponent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end

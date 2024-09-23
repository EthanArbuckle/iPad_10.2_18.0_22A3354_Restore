@implementation SISchemaHardwareInterfaceIdentifier

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasInterfaceVendorID
{
  return self->_interfaceVendorID != 0;
}

- (void)deleteInterfaceVendorID
{
  -[SISchemaHardwareInterfaceIdentifier setInterfaceVendorID:](self, "setInterfaceVendorID:", 0);
}

- (BOOL)hasInterfaceProductID
{
  return self->_interfaceProductID != 0;
}

- (void)deleteInterfaceProductID
{
  -[SISchemaHardwareInterfaceIdentifier setInterfaceProductID:](self, "setInterfaceProductID:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaHardwareInterfaceIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SISchemaHardwareInterfaceIdentifier interfaceVendorID](self, "interfaceVendorID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaHardwareInterfaceIdentifier interfaceProductID](self, "interfaceProductID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
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
  -[SISchemaHardwareInterfaceIdentifier interfaceVendorID](self, "interfaceVendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interfaceVendorID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaHardwareInterfaceIdentifier interfaceVendorID](self, "interfaceVendorID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaHardwareInterfaceIdentifier interfaceVendorID](self, "interfaceVendorID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interfaceVendorID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaHardwareInterfaceIdentifier interfaceProductID](self, "interfaceProductID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interfaceProductID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaHardwareInterfaceIdentifier interfaceProductID](self, "interfaceProductID");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[SISchemaHardwareInterfaceIdentifier interfaceProductID](self, "interfaceProductID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interfaceProductID");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_interfaceVendorID, "hash");
  return -[NSString hash](self->_interfaceProductID, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_interfaceProductID)
  {
    -[SISchemaHardwareInterfaceIdentifier interfaceProductID](self, "interfaceProductID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("interfaceProductID"));

  }
  if (self->_interfaceVendorID)
  {
    -[SISchemaHardwareInterfaceIdentifier interfaceVendorID](self, "interfaceVendorID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("interfaceVendorID"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaHardwareInterfaceIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaHardwareInterfaceIdentifier)initWithJSON:(id)a3
{
  void *v4;
  SISchemaHardwareInterfaceIdentifier *v5;
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
    self = -[SISchemaHardwareInterfaceIdentifier initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaHardwareInterfaceIdentifier)initWithDictionary:(id)a3
{
  id v4;
  SISchemaHardwareInterfaceIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SISchemaHardwareInterfaceIdentifier *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaHardwareInterfaceIdentifier;
  v5 = -[SISchemaHardwareInterfaceIdentifier init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interfaceVendorID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaHardwareInterfaceIdentifier setInterfaceVendorID:](v5, "setInterfaceVendorID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interfaceProductID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaHardwareInterfaceIdentifier setInterfaceProductID:](v5, "setInterfaceProductID:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)interfaceVendorID
{
  return self->_interfaceVendorID;
}

- (void)setInterfaceVendorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)interfaceProductID
{
  return self->_interfaceProductID;
}

- (void)setInterfaceProductID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasInterfaceVendorID:(BOOL)a3
{
  self->_hasInterfaceVendorID = a3;
}

- (void)setHasInterfaceProductID:(BOOL)a3
{
  self->_hasInterfaceProductID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceProductID, 0);
  objc_storeStrong((id *)&self->_interfaceVendorID, 0);
}

@end

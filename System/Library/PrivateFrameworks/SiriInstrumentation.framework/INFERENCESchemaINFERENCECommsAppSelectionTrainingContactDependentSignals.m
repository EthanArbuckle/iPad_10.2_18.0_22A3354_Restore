@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals

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
  v13.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentMessageSignals](self, "contactDependentMessageSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals deleteContactDependentMessageSignals](self, "deleteContactDependentMessageSignals");
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentPhoneCallSignals](self, "contactDependentPhoneCallSignals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals deleteContactDependentPhoneCallSignals](self, "deleteContactDependentPhoneCallSignals");

  return v5;
}

- (BOOL)hasContactDependentMessageSignals
{
  return self->_contactDependentMessageSignals != 0;
}

- (void)deleteContactDependentMessageSignals
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals setContactDependentMessageSignals:](self, "setContactDependentMessageSignals:", 0);
}

- (BOOL)hasContactDependentPhoneCallSignals
{
  return self->_contactDependentPhoneCallSignals != 0;
}

- (void)deleteContactDependentPhoneCallSignals
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals setContactDependentPhoneCallSignals:](self, "setContactDependentPhoneCallSignals:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentMessageSignals](self, "contactDependentMessageSignals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentMessageSignals](self, "contactDependentMessageSignals");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentPhoneCallSignals](self, "contactDependentPhoneCallSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentPhoneCallSignals](self, "contactDependentPhoneCallSignals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
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
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentMessageSignals](self, "contactDependentMessageSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactDependentMessageSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentMessageSignals](self, "contactDependentMessageSignals");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentMessageSignals](self, "contactDependentMessageSignals");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactDependentMessageSignals");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentPhoneCallSignals](self, "contactDependentPhoneCallSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactDependentPhoneCallSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentPhoneCallSignals](self, "contactDependentPhoneCallSignals");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentPhoneCallSignals](self, "contactDependentPhoneCallSignals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactDependentPhoneCallSignals");
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

  v3 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals hash](self->_contactDependentMessageSignals, "hash");
  return -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals hash](self->_contactDependentPhoneCallSignals, "hash") ^ v3;
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
  if (self->_contactDependentMessageSignals)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentMessageSignals](self, "contactDependentMessageSignals");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactDependentMessageSignals"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contactDependentMessageSignals"));

    }
  }
  if (self->_contactDependentPhoneCallSignals)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals contactDependentPhoneCallSignals](self, "contactDependentPhoneCallSignals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contactDependentPhoneCallSignals"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("contactDependentPhoneCallSignals"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *v5;
  void *v6;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *v7;
  void *v8;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *v9;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals;
  v5 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactDependentMessageSignals"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals initWithDictionary:]([INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals setContactDependentMessageSignals:](v5, "setContactDependentMessageSignals:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactDependentPhoneCallSignals"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals initWithDictionary:]([INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals alloc], "initWithDictionary:", v8);
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals setContactDependentPhoneCallSignals:](v5, "setContactDependentPhoneCallSignals:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals)contactDependentMessageSignals
{
  return self->_contactDependentMessageSignals;
}

- (void)setContactDependentMessageSignals:(id)a3
{
  objc_storeStrong((id *)&self->_contactDependentMessageSignals, a3);
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals)contactDependentPhoneCallSignals
{
  return self->_contactDependentPhoneCallSignals;
}

- (void)setContactDependentPhoneCallSignals:(id)a3
{
  objc_storeStrong((id *)&self->_contactDependentPhoneCallSignals, a3);
}

- (void)setHasContactDependentMessageSignals:(BOOL)a3
{
  self->_hasContactDependentMessageSignals = a3;
}

- (void)setHasContactDependentPhoneCallSignals:(BOOL)a3
{
  self->_hasContactDependentPhoneCallSignals = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactDependentPhoneCallSignals, 0);
  objc_storeStrong((id *)&self->_contactDependentMessageSignals, 0);
}

@end

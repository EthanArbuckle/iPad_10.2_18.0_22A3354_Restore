@implementation INFERENCESchemaINFERENCEPromptContext

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
  v13.super_class = (Class)INFERENCESchemaINFERENCEPromptContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEPromptContext confirmationPromptContext](self, "confirmationPromptContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCEPromptContext deleteConfirmationPromptContext](self, "deleteConfirmationPromptContext");
  -[INFERENCESchemaINFERENCEPromptContext disambiguationPromptContext](self, "disambiguationPromptContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCEPromptContext deleteDisambiguationPromptContext](self, "deleteDisambiguationPromptContext");

  return v5;
}

- (void)setTag:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_tag = a3;
}

- (BOOL)hasTag
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTag:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTag
{
  -[INFERENCESchemaINFERENCEPromptContext setTag:](self, "setTag:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setConfirmationPromptContext:(id)a3
{
  INFERENCESchemaINFERENCEConfirmationPromptContext *v4;
  INFERENCESchemaINFERENCEDisambiguationPromptContext *disambiguationPromptContext;
  INFERENCESchemaINFERENCEConfirmationPromptContext *confirmationPromptContext;

  v4 = (INFERENCESchemaINFERENCEConfirmationPromptContext *)a3;
  disambiguationPromptContext = self->_disambiguationPromptContext;
  self->_disambiguationPromptContext = 0;

  self->_whichPromptcontext = 2 * (v4 != 0);
  confirmationPromptContext = self->_confirmationPromptContext;
  self->_confirmationPromptContext = v4;

}

- (INFERENCESchemaINFERENCEConfirmationPromptContext)confirmationPromptContext
{
  if (self->_whichPromptcontext == 2)
    return self->_confirmationPromptContext;
  else
    return (INFERENCESchemaINFERENCEConfirmationPromptContext *)0;
}

- (void)deleteConfirmationPromptContext
{
  INFERENCESchemaINFERENCEConfirmationPromptContext *confirmationPromptContext;

  if (self->_whichPromptcontext == 2)
  {
    self->_whichPromptcontext = 0;
    confirmationPromptContext = self->_confirmationPromptContext;
    self->_confirmationPromptContext = 0;

  }
}

- (void)setDisambiguationPromptContext:(id)a3
{
  INFERENCESchemaINFERENCEDisambiguationPromptContext *v4;
  INFERENCESchemaINFERENCEConfirmationPromptContext *confirmationPromptContext;
  unint64_t v6;
  INFERENCESchemaINFERENCEDisambiguationPromptContext *disambiguationPromptContext;

  v4 = (INFERENCESchemaINFERENCEDisambiguationPromptContext *)a3;
  confirmationPromptContext = self->_confirmationPromptContext;
  self->_confirmationPromptContext = 0;

  v6 = 3;
  if (!v4)
    v6 = 0;
  self->_whichPromptcontext = v6;
  disambiguationPromptContext = self->_disambiguationPromptContext;
  self->_disambiguationPromptContext = v4;

}

- (INFERENCESchemaINFERENCEDisambiguationPromptContext)disambiguationPromptContext
{
  if (self->_whichPromptcontext == 3)
    return self->_disambiguationPromptContext;
  else
    return (INFERENCESchemaINFERENCEDisambiguationPromptContext *)0;
}

- (void)deleteDisambiguationPromptContext
{
  INFERENCESchemaINFERENCEDisambiguationPromptContext *disambiguationPromptContext;

  if (self->_whichPromptcontext == 3)
  {
    self->_whichPromptcontext = 0;
    disambiguationPromptContext = self->_disambiguationPromptContext;
    self->_disambiguationPromptContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEPromptContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[INFERENCESchemaINFERENCEPromptContext confirmationPromptContext](self, "confirmationPromptContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCEPromptContext confirmationPromptContext](self, "confirmationPromptContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEPromptContext disambiguationPromptContext](self, "disambiguationPromptContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[INFERENCESchemaINFERENCEPromptContext disambiguationPromptContext](self, "disambiguationPromptContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t whichPromptcontext;
  int tag;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  whichPromptcontext = self->_whichPromptcontext;
  if (whichPromptcontext != objc_msgSend(v4, "whichPromptcontext"))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    tag = self->_tag;
    if (tag != objc_msgSend(v4, "tag"))
      goto LABEL_16;
  }
  -[INFERENCESchemaINFERENCEPromptContext confirmationPromptContext](self, "confirmationPromptContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confirmationPromptContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_15;
  -[INFERENCESchemaINFERENCEPromptContext confirmationPromptContext](self, "confirmationPromptContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[INFERENCESchemaINFERENCEPromptContext confirmationPromptContext](self, "confirmationPromptContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "confirmationPromptContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_16;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEPromptContext disambiguationPromptContext](self, "disambiguationPromptContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disambiguationPromptContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[INFERENCESchemaINFERENCEPromptContext disambiguationPromptContext](self, "disambiguationPromptContext");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[INFERENCESchemaINFERENCEPromptContext disambiguationPromptContext](self, "disambiguationPromptContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disambiguationPromptContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_tag;
  else
    v3 = 0;
  v4 = -[INFERENCESchemaINFERENCEConfirmationPromptContext hash](self->_confirmationPromptContext, "hash") ^ v3;
  return v4 ^ -[INFERENCESchemaINFERENCEDisambiguationPromptContext hash](self->_disambiguationPromptContext, "hash");
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
  unsigned int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_confirmationPromptContext)
  {
    -[INFERENCESchemaINFERENCEPromptContext confirmationPromptContext](self, "confirmationPromptContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("confirmationPromptContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("confirmationPromptContext"));

    }
  }
  if (self->_disambiguationPromptContext)
  {
    -[INFERENCESchemaINFERENCEPromptContext disambiguationPromptContext](self, "disambiguationPromptContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("disambiguationPromptContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("disambiguationPromptContext"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = -[INFERENCESchemaINFERENCEPromptContext tag](self, "tag") - 1;
    if (v10 > 2)
      v11 = CFSTR("INFERENCEPROMPTTAG_UNKNOWN");
    else
      v11 = off_1E562FCA8[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("tag"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEPromptContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEPromptContext)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEPromptContext *v5;
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
    self = -[INFERENCESchemaINFERENCEPromptContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEPromptContext)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEPromptContext *v5;
  void *v6;
  void *v7;
  INFERENCESchemaINFERENCEConfirmationPromptContext *v8;
  void *v9;
  INFERENCESchemaINFERENCEDisambiguationPromptContext *v10;
  INFERENCESchemaINFERENCEPromptContext *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCEPromptContext;
  v5 = -[INFERENCESchemaINFERENCEPromptContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tag"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPromptContext setTag:](v5, "setTag:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmationPromptContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[INFERENCESchemaINFERENCEConfirmationPromptContext initWithDictionary:]([INFERENCESchemaINFERENCEConfirmationPromptContext alloc], "initWithDictionary:", v7);
      -[INFERENCESchemaINFERENCEPromptContext setConfirmationPromptContext:](v5, "setConfirmationPromptContext:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationPromptContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[INFERENCESchemaINFERENCEDisambiguationPromptContext initWithDictionary:]([INFERENCESchemaINFERENCEDisambiguationPromptContext alloc], "initWithDictionary:", v9);
      -[INFERENCESchemaINFERENCEPromptContext setDisambiguationPromptContext:](v5, "setDisambiguationPromptContext:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (unint64_t)whichPromptcontext
{
  return self->_whichPromptcontext;
}

- (int)tag
{
  return self->_tag;
}

- (BOOL)hasConfirmationPromptContext
{
  return *((_BYTE *)&self->_has + 1);
}

- (void)setHasConfirmationPromptContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasDisambiguationPromptContext
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasDisambiguationPromptContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguationPromptContext, 0);
  objc_storeStrong((id *)&self->_confirmationPromptContext, 0);
}

@end

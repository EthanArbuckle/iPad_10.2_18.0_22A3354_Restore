@implementation FLOWSchemaFLOWPegasusContextTier1

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
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FLOWSchemaFLOWPegasusContextTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWPegasusContextTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWPegasusContextTier1 deleteLinkId](self, "deleteLinkId");
  -[FLOWSchemaFLOWPegasusContextTier1 intentTier1](self, "intentTier1");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWPegasusContextTier1 deleteIntentTier1](self, "deleteIntentTier1");
  -[FLOWSchemaFLOWPegasusContextTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[FLOWSchemaFLOWPegasusContextTier1 deleteKgQAExecutionTier1](self, "deleteKgQAExecutionTier1");
  -[FLOWSchemaFLOWPegasusContextTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[FLOWSchemaFLOWPegasusContextTier1 deleteWebAnswerExecutionTier1](self, "deleteWebAnswerExecutionTier1");
  -[FLOWSchemaFLOWPegasusContextTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[FLOWSchemaFLOWPegasusContextTier1 deleteSportsExecutionTier1](self, "deleteSportsExecutionTier1");
  -[FLOWSchemaFLOWPegasusContextTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[FLOWSchemaFLOWPegasusContextTier1 deleteMapsExecutionTier1](self, "deleteMapsExecutionTier1");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[FLOWSchemaFLOWPegasusContextTier1 setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasIntentTier1
{
  return self->_intentTier1 != 0;
}

- (void)deleteIntentTier1
{
  -[FLOWSchemaFLOWPegasusContextTier1 setIntentTier1:](self, "setIntentTier1:", 0);
}

- (BOOL)hasKgQAExecutionTier1
{
  return self->_kgQAExecutionTier1 != 0;
}

- (void)deleteKgQAExecutionTier1
{
  -[FLOWSchemaFLOWPegasusContextTier1 setKgQAExecutionTier1:](self, "setKgQAExecutionTier1:", 0);
}

- (BOOL)hasWebAnswerExecutionTier1
{
  return self->_webAnswerExecutionTier1 != 0;
}

- (void)deleteWebAnswerExecutionTier1
{
  -[FLOWSchemaFLOWPegasusContextTier1 setWebAnswerExecutionTier1:](self, "setWebAnswerExecutionTier1:", 0);
}

- (BOOL)hasSportsExecutionTier1
{
  return self->_sportsExecutionTier1 != 0;
}

- (void)deleteSportsExecutionTier1
{
  -[FLOWSchemaFLOWPegasusContextTier1 setSportsExecutionTier1:](self, "setSportsExecutionTier1:", 0);
}

- (BOOL)hasMapsExecutionTier1
{
  return self->_mapsExecutionTier1 != 0;
}

- (void)deleteMapsExecutionTier1
{
  -[FLOWSchemaFLOWPegasusContextTier1 setMapsExecutionTier1:](self, "setMapsExecutionTier1:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWPegasusContextTier1ReadFrom(self, (uint64_t)a3);
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
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[FLOWSchemaFLOWPegasusContextTier1 linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWPegasusContextTier1 intentTier1](self, "intentTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 intentTier1](self, "intentTier1");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWPegasusContextTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWPegasusContextTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWPegasusContextTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWPegasusContextTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[FLOWSchemaFLOWPegasusContextTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[FLOWSchemaFLOWPegasusContextTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWPegasusContextTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPegasusContextTier1 intentTier1](self, "intentTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[FLOWSchemaFLOWPegasusContextTier1 intentTier1](self, "intentTier1");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWPegasusContextTier1 intentTier1](self, "intentTier1");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPegasusContextTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kgQAExecutionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[FLOWSchemaFLOWPegasusContextTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[FLOWSchemaFLOWPegasusContextTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kgQAExecutionTier1");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPegasusContextTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webAnswerExecutionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[FLOWSchemaFLOWPegasusContextTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[FLOWSchemaFLOWPegasusContextTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webAnswerExecutionTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPegasusContextTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sportsExecutionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[FLOWSchemaFLOWPegasusContextTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[FLOWSchemaFLOWPegasusContextTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sportsExecutionTier1");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPegasusContextTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsExecutionTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWPegasusContextTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[FLOWSchemaFLOWPegasusContextTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsExecutionTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[PEGASUSSchemaPEGASUSIntentTier1 hash](self->_intentTier1, "hash") ^ v3;
  v5 = -[FLOWSchemaFLOWKGQAExecutionTier1 hash](self->_kgQAExecutionTier1, "hash");
  v6 = v4 ^ v5 ^ -[FLOWSchemaFLOWWebAnswerExecutionTier1 hash](self->_webAnswerExecutionTier1, "hash");
  v7 = -[FLOWSchemaFLOWSportsExecutionTier1 hash](self->_sportsExecutionTier1, "hash");
  return v6 ^ v7 ^ -[FLOWSchemaFLOWMapsExecutionTier1 hash](self->_mapsExecutionTier1, "hash");
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
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_intentTier1)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 intentTier1](self, "intentTier1");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("intentTier1"));

    }
  }
  if (self->_kgQAExecutionTier1)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 kgQAExecutionTier1](self, "kgQAExecutionTier1");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("kgQAExecutionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("kgQAExecutionTier1"));

    }
  }
  if (self->_linkId)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 linkId](self, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("linkId"));

    }
  }
  if (self->_mapsExecutionTier1)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 mapsExecutionTier1](self, "mapsExecutionTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("mapsExecutionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("mapsExecutionTier1"));

    }
  }
  if (self->_sportsExecutionTier1)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 sportsExecutionTier1](self, "sportsExecutionTier1");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("sportsExecutionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("sportsExecutionTier1"));

    }
  }
  if (self->_webAnswerExecutionTier1)
  {
    -[FLOWSchemaFLOWPegasusContextTier1 webAnswerExecutionTier1](self, "webAnswerExecutionTier1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("webAnswerExecutionTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("webAnswerExecutionTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWPegasusContextTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWPegasusContextTier1)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWPegasusContextTier1 *v5;
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
    self = -[FLOWSchemaFLOWPegasusContextTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWPegasusContextTier1)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWPegasusContextTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  PEGASUSSchemaPEGASUSIntentTier1 *v9;
  void *v10;
  FLOWSchemaFLOWKGQAExecutionTier1 *v11;
  void *v12;
  FLOWSchemaFLOWWebAnswerExecutionTier1 *v13;
  void *v14;
  FLOWSchemaFLOWSportsExecutionTier1 *v15;
  void *v16;
  FLOWSchemaFLOWMapsExecutionTier1 *v17;
  FLOWSchemaFLOWPegasusContextTier1 *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FLOWSchemaFLOWPegasusContextTier1;
  v5 = -[FLOWSchemaFLOWPegasusContextTier1 init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWPegasusContextTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentTier1"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PEGASUSSchemaPEGASUSIntentTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSIntentTier1 alloc], "initWithDictionary:", v8);
      -[FLOWSchemaFLOWPegasusContextTier1 setIntentTier1:](v5, "setIntentTier1:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kgQAExecutionTier1"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[FLOWSchemaFLOWKGQAExecutionTier1 initWithDictionary:]([FLOWSchemaFLOWKGQAExecutionTier1 alloc], "initWithDictionary:", v10);
      -[FLOWSchemaFLOWPegasusContextTier1 setKgQAExecutionTier1:](v5, "setKgQAExecutionTier1:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("webAnswerExecutionTier1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[FLOWSchemaFLOWWebAnswerExecutionTier1 initWithDictionary:]([FLOWSchemaFLOWWebAnswerExecutionTier1 alloc], "initWithDictionary:", v12);
      -[FLOWSchemaFLOWPegasusContextTier1 setWebAnswerExecutionTier1:](v5, "setWebAnswerExecutionTier1:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportsExecutionTier1"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[FLOWSchemaFLOWSportsExecutionTier1 initWithDictionary:]([FLOWSchemaFLOWSportsExecutionTier1 alloc], "initWithDictionary:", v14);
      -[FLOWSchemaFLOWPegasusContextTier1 setSportsExecutionTier1:](v5, "setSportsExecutionTier1:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsExecutionTier1"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[FLOWSchemaFLOWMapsExecutionTier1 initWithDictionary:]([FLOWSchemaFLOWMapsExecutionTier1 alloc], "initWithDictionary:", v16);
      -[FLOWSchemaFLOWPegasusContextTier1 setMapsExecutionTier1:](v5, "setMapsExecutionTier1:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (PEGASUSSchemaPEGASUSIntentTier1)intentTier1
{
  return self->_intentTier1;
}

- (void)setIntentTier1:(id)a3
{
  objc_storeStrong((id *)&self->_intentTier1, a3);
}

- (FLOWSchemaFLOWKGQAExecutionTier1)kgQAExecutionTier1
{
  return self->_kgQAExecutionTier1;
}

- (void)setKgQAExecutionTier1:(id)a3
{
  objc_storeStrong((id *)&self->_kgQAExecutionTier1, a3);
}

- (FLOWSchemaFLOWWebAnswerExecutionTier1)webAnswerExecutionTier1
{
  return self->_webAnswerExecutionTier1;
}

- (void)setWebAnswerExecutionTier1:(id)a3
{
  objc_storeStrong((id *)&self->_webAnswerExecutionTier1, a3);
}

- (FLOWSchemaFLOWSportsExecutionTier1)sportsExecutionTier1
{
  return self->_sportsExecutionTier1;
}

- (void)setSportsExecutionTier1:(id)a3
{
  objc_storeStrong((id *)&self->_sportsExecutionTier1, a3);
}

- (FLOWSchemaFLOWMapsExecutionTier1)mapsExecutionTier1
{
  return self->_mapsExecutionTier1;
}

- (void)setMapsExecutionTier1:(id)a3
{
  objc_storeStrong((id *)&self->_mapsExecutionTier1, a3);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasIntentTier1:(BOOL)a3
{
  self->_hasIntentTier1 = a3;
}

- (void)setHasKgQAExecutionTier1:(BOOL)a3
{
  self->_hasKgQAExecutionTier1 = a3;
}

- (void)setHasWebAnswerExecutionTier1:(BOOL)a3
{
  self->_hasWebAnswerExecutionTier1 = a3;
}

- (void)setHasSportsExecutionTier1:(BOOL)a3
{
  self->_hasSportsExecutionTier1 = a3;
}

- (void)setHasMapsExecutionTier1:(BOOL)a3
{
  self->_hasMapsExecutionTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsExecutionTier1, 0);
  objc_storeStrong((id *)&self->_sportsExecutionTier1, 0);
  objc_storeStrong((id *)&self->_webAnswerExecutionTier1, 0);
  objc_storeStrong((id *)&self->_kgQAExecutionTier1, 0);
  objc_storeStrong((id *)&self->_intentTier1, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end

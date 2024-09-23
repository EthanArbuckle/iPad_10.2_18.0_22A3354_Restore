@implementation PEGASUSSchemaPEGASUSIntent

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PEGASUSSchemaPEGASUSIntent;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSIntent linkId](self, "linkId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PEGASUSSchemaPEGASUSIntent deleteLinkId](self, "deleteLinkId");
  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[PEGASUSSchemaPEGASUSIntent setLinkId:](self, "setLinkId:", 0);
}

- (void)setIntentCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_intentCategory = a3;
}

- (BOOL)hasIntentCategory
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIntentCategory:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIntentCategory
{
  -[PEGASUSSchemaPEGASUSIntent setIntentCategory:](self, "setIntentCategory:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)deleteName
{
  -[PEGASUSSchemaPEGASUSIntent setName:](self, "setName:", 0);
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_source = a3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSource
{
  -[PEGASUSSchemaPEGASUSIntent setSource:](self, "setSource:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setConfidence:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_confidence = a3;
}

- (BOOL)hasConfidence
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteConfidence
{
  double v2;

  LODWORD(v2) = 0;
  -[PEGASUSSchemaPEGASUSIntent setConfidence:](self, "setConfidence:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return PEGASUSSchemaPEGASUSIntentReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  id v9;

  v9 = a3;
  -[PEGASUSSchemaPEGASUSIntent linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PEGASUSSchemaPEGASUSIntent linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[PEGASUSSchemaPEGASUSIntent name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v8 = v9;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v8 = v9;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    v8 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int intentCategory;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  $C581A5FE487374A0C1516C663F5F6CD8 has;
  int v21;
  unsigned int v22;
  int source;
  int v24;
  float confidence;
  float v26;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[PEGASUSSchemaPEGASUSIntent linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[PEGASUSSchemaPEGASUSIntent linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSIntent linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    intentCategory = self->_intentCategory;
    if (intentCategory != objc_msgSend(v4, "intentCategory"))
      goto LABEL_15;
  }
  -[PEGASUSSchemaPEGASUSIntent name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  -[PEGASUSSchemaPEGASUSIntent name](self, "name");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PEGASUSSchemaPEGASUSIntent name](self, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_15;
  }
  else
  {

  }
  has = self->_has;
  v21 = (*(unsigned int *)&has >> 1) & 1;
  v22 = v4[40];
  if (v21 == ((v22 >> 1) & 1))
  {
    if (v21)
    {
      source = self->_source;
      if (source != objc_msgSend(v4, "source"))
        goto LABEL_15;
      has = self->_has;
      v22 = v4[40];
    }
    v24 = (*(unsigned int *)&has >> 2) & 1;
    if (v24 == ((v22 >> 2) & 1))
    {
      if (!v24 || (confidence = self->_confidence, objc_msgSend(v4, "confidence"), confidence == v26))
      {
        v18 = 1;
        goto LABEL_16;
      }
    }
  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  float confidence;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_intentCategory;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_source;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_11:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v11;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_6:
  confidence = self->_confidence;
  v8 = confidence;
  if (confidence < 0.0)
    v8 = -confidence;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[PEGASUSSchemaPEGASUSIntent confidence](self, "confidence");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("confidence"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v7 = -[PEGASUSSchemaPEGASUSIntent intentCategory](self, "intentCategory") - 1;
    if (v7 > 2)
      v8 = CFSTR("PEGASUSINTENTCATEGORY_UNKNOWN");
    else
      v8 = off_1E56328C8[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("intentCategory"));
  }
  if (self->_linkId)
  {
    -[PEGASUSSchemaPEGASUSIntent linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("linkId"));

    }
  }
  if (self->_name)
  {
    -[PEGASUSSchemaPEGASUSIntent name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("name"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v14 = -[PEGASUSSchemaPEGASUSIntent source](self, "source") - 1;
    if (v14 > 4)
      v15 = CFSTR("PEGASUSINTENTSOURCE_UNKNOWN");
    else
      v15 = off_1E56328E0[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("source"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSIntent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSIntent)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSIntent *v5;
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
    self = -[PEGASUSSchemaPEGASUSIntent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSIntent)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSIntent *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PEGASUSSchemaPEGASUSIntent *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PEGASUSSchemaPEGASUSIntent;
  v5 = -[PEGASUSSchemaPEGASUSIntent init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PEGASUSSchemaPEGASUSIntent setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentCategory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSIntent setIntentCategory:](v5, "setIntentCategory:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[PEGASUSSchemaPEGASUSIntent setName:](v5, "setName:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSIntent setSource:](v5, "setSource:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[PEGASUSSchemaPEGASUSIntent setConfidence:](v5, "setConfidence:");
    }
    v13 = v5;

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

- (int)intentCategory
{
  return self->_intentCategory;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)source
{
  return self->_source;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end

@implementation CNVSchemaCNVActionCandidate

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
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNVSchemaCNVActionCandidate;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVSchemaCNVActionCandidate actionCandidateId](self, "actionCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CNVSchemaCNVActionCandidate deleteActionCandidateId](self, "deleteActionCandidateId");
  -[CNVSchemaCNVActionCandidate parseHypothesisId](self, "parseHypothesisId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CNVSchemaCNVActionCandidate deleteParseHypothesisId](self, "deleteParseHypothesisId");
  -[CNVSchemaCNVActionCandidate pommesId](self, "pommesId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CNVSchemaCNVActionCandidate deletePommesId](self, "deletePommesId");
  -[CNVSchemaCNVActionCandidate linkMetadata](self, "linkMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CNVSchemaCNVActionCandidate deleteLinkMetadata](self, "deleteLinkMetadata");

  return v5;
}

- (BOOL)hasActionCandidateId
{
  return self->_actionCandidateId != 0;
}

- (void)deleteActionCandidateId
{
  -[CNVSchemaCNVActionCandidate setActionCandidateId:](self, "setActionCandidateId:", 0);
}

- (void)setPlugin:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_plugin = a3;
}

- (BOOL)hasPlugin
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPlugin:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePlugin
{
  -[CNVSchemaCNVActionCandidate setPlugin:](self, "setPlugin:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setParseHypothesisId:(id)a3
{
  SISchemaUUID *v4;
  SISchemaUUID *pommesId;
  unint64_t v6;
  SISchemaUUID *parseHypothesisId;

  v4 = (SISchemaUUID *)a3;
  pommesId = self->_pommesId;
  self->_pommesId = 0;

  v6 = 3;
  if (!v4)
    v6 = 0;
  self->_whichParseid = v6;
  parseHypothesisId = self->_parseHypothesisId;
  self->_parseHypothesisId = v4;

}

- (SISchemaUUID)parseHypothesisId
{
  if (self->_whichParseid == 3)
    return self->_parseHypothesisId;
  else
    return (SISchemaUUID *)0;
}

- (void)deleteParseHypothesisId
{
  SISchemaUUID *parseHypothesisId;

  if (self->_whichParseid == 3)
  {
    self->_whichParseid = 0;
    parseHypothesisId = self->_parseHypothesisId;
    self->_parseHypothesisId = 0;

  }
}

- (void)setPommesId:(id)a3
{
  SISchemaUUID *v4;
  SISchemaUUID *parseHypothesisId;
  SISchemaUUID *pommesId;

  v4 = (SISchemaUUID *)a3;
  parseHypothesisId = self->_parseHypothesisId;
  self->_parseHypothesisId = 0;

  self->_whichParseid = 4 * (v4 != 0);
  pommesId = self->_pommesId;
  self->_pommesId = v4;

}

- (SISchemaUUID)pommesId
{
  if (self->_whichParseid == 4)
    return self->_pommesId;
  else
    return (SISchemaUUID *)0;
}

- (void)deletePommesId
{
  SISchemaUUID *pommesId;

  if (self->_whichParseid == 4)
  {
    self->_whichParseid = 0;
    pommesId = self->_pommesId;
    self->_pommesId = 0;

  }
}

- (void)setAffinityScore:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_affinityScore = a3;
}

- (BOOL)hasAffinityScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAffinityScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAffinityScore
{
  -[CNVSchemaCNVActionCandidate setAffinityScore:](self, "setAffinityScore:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasLinkMetadata
{
  return self->_linkMetadata != 0;
}

- (void)deleteLinkMetadata
{
  -[CNVSchemaCNVActionCandidate setLinkMetadata:](self, "setLinkMetadata:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVActionCandidateReadFrom(self, (uint64_t)a3);
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
  id v13;

  v13 = a3;
  -[CNVSchemaCNVActionCandidate actionCandidateId](self, "actionCandidateId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNVSchemaCNVActionCandidate actionCandidateId](self, "actionCandidateId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[CNVSchemaCNVActionCandidate parseHypothesisId](self, "parseHypothesisId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNVSchemaCNVActionCandidate parseHypothesisId](self, "parseHypothesisId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVActionCandidate pommesId](self, "pommesId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNVSchemaCNVActionCandidate pommesId](self, "pommesId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[CNVSchemaCNVActionCandidate linkMetadata](self, "linkMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[CNVSchemaCNVActionCandidate linkMetadata](self, "linkMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t whichParseid;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int plugin;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  unsigned int affinityScore;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  whichParseid = self->_whichParseid;
  if (whichParseid != objc_msgSend(v4, "whichParseid"))
    goto LABEL_29;
  -[CNVSchemaCNVActionCandidate actionCandidateId](self, "actionCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionCandidateId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_28;
  -[CNVSchemaCNVActionCandidate actionCandidateId](self, "actionCandidateId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CNVSchemaCNVActionCandidate actionCandidateId](self, "actionCandidateId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionCandidateId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_29;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    plugin = self->_plugin;
    if (plugin != objc_msgSend(v4, "plugin"))
      goto LABEL_29;
  }
  -[CNVSchemaCNVActionCandidate parseHypothesisId](self, "parseHypothesisId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parseHypothesisId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_28;
  -[CNVSchemaCNVActionCandidate parseHypothesisId](self, "parseHypothesisId");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[CNVSchemaCNVActionCandidate parseHypothesisId](self, "parseHypothesisId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parseHypothesisId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_29;
  }
  else
  {

  }
  -[CNVSchemaCNVActionCandidate pommesId](self, "pommesId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pommesId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_28;
  -[CNVSchemaCNVActionCandidate pommesId](self, "pommesId");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[CNVSchemaCNVActionCandidate pommesId](self, "pommesId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pommesId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_29;
  }
  else
  {

  }
  v24 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v24 != ((v4[56] >> 1) & 1))
    goto LABEL_29;
  if (v24)
  {
    affinityScore = self->_affinityScore;
    if (affinityScore != objc_msgSend(v4, "affinityScore"))
      goto LABEL_29;
  }
  -[CNVSchemaCNVActionCandidate linkMetadata](self, "linkMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CNVSchemaCNVActionCandidate linkMetadata](self, "linkMetadata");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
    {

LABEL_32:
      v31 = 1;
      goto LABEL_30;
    }
    v27 = (void *)v26;
    -[CNVSchemaCNVActionCandidate linkMetadata](self, "linkMetadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkMetadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if ((v30 & 1) != 0)
      goto LABEL_32;
  }
  else
  {
LABEL_28:

  }
LABEL_29:
  v31 = 0;
LABEL_30:

  return v31;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_actionCandidateId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_plugin;
  else
    v4 = 0;
  v5 = -[SISchemaUUID hash](self->_parseHypothesisId, "hash");
  v6 = -[SISchemaUUID hash](self->_pommesId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_affinityScore;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[CNVSchemaCNVLinkMetadata hash](self->_linkMetadata, "hash");
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
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionCandidateId)
  {
    -[CNVSchemaCNVActionCandidate actionCandidateId](self, "actionCandidateId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionCandidateId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionCandidateId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CNVSchemaCNVActionCandidate affinityScore](self, "affinityScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("affinityScore"));

  }
  if (self->_linkMetadata)
  {
    -[CNVSchemaCNVActionCandidate linkMetadata](self, "linkMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("linkMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("linkMetadata"));

    }
  }
  if (self->_parseHypothesisId)
  {
    -[CNVSchemaCNVActionCandidate parseHypothesisId](self, "parseHypothesisId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("parseHypothesisId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("parseHypothesisId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v14 = -[CNVSchemaCNVActionCandidate plugin](self, "plugin") - 1;
    if (v14 > 0x23)
      v15 = CFSTR("CNVPLUGIN_UNKNOWN");
    else
      v15 = off_1E562C008[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("plugin"));
  }
  if (self->_pommesId)
  {
    -[CNVSchemaCNVActionCandidate pommesId](self, "pommesId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("pommesId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("pommesId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CNVSchemaCNVActionCandidate dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CNVSchemaCNVActionCandidate)initWithJSON:(id)a3
{
  void *v4;
  CNVSchemaCNVActionCandidate *v5;
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
    self = -[CNVSchemaCNVActionCandidate initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CNVSchemaCNVActionCandidate)initWithDictionary:(id)a3
{
  id v4;
  CNVSchemaCNVActionCandidate *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  SISchemaUUID *v10;
  void *v11;
  SISchemaUUID *v12;
  void *v13;
  void *v14;
  CNVSchemaCNVLinkMetadata *v15;
  CNVSchemaCNVActionCandidate *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNVSchemaCNVActionCandidate;
  v5 = -[CNVSchemaCNVActionCandidate init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCandidateId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[CNVSchemaCNVActionCandidate setActionCandidateId:](v5, "setActionCandidateId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plugin"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVActionCandidate setPlugin:](v5, "setPlugin:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parseHypothesisId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v9);
      -[CNVSchemaCNVActionCandidate setParseHypothesisId:](v5, "setParseHypothesisId:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommesId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[CNVSchemaCNVActionCandidate setPommesId:](v5, "setPommesId:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("affinityScore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVActionCandidate setAffinityScore:](v5, "setAffinityScore:", objc_msgSend(v13, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkMetadata"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[CNVSchemaCNVLinkMetadata initWithDictionary:]([CNVSchemaCNVLinkMetadata alloc], "initWithDictionary:", v14);
      -[CNVSchemaCNVActionCandidate setLinkMetadata:](v5, "setLinkMetadata:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichParseid
{
  return self->_whichParseid;
}

- (SISchemaUUID)actionCandidateId
{
  return self->_actionCandidateId;
}

- (void)setActionCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_actionCandidateId, a3);
}

- (int)plugin
{
  return self->_plugin;
}

- (unsigned)affinityScore
{
  return self->_affinityScore;
}

- (CNVSchemaCNVLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (void)setHasActionCandidateId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasParseHypothesisId
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasParseHypothesisId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (BOOL)hasPommesId
{
  return *((_BYTE *)&self->_has + 3);
}

- (void)setHasPommesId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasLinkMetadata:(BOOL)a3
{
  self->_hasActionCandidateId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_pommesId, 0);
  objc_storeStrong((id *)&self->_parseHypothesisId, 0);
  objc_storeStrong((id *)&self->_actionCandidateId, 0);
}

@end

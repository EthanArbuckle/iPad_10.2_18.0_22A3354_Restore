@implementation NLXSchemaNLXLegacyNLContext

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
  v9.super_class = (Class)NLXSchemaNLXLegacyNLContext;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaNLXLegacyNLContext linkId](self, "linkId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[NLXSchemaNLXLegacyNLContext deleteLinkId](self, "deleteLinkId");
  return v5;
}

- (void)setIsDictationPrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isDictationPrompt = a3;
}

- (BOOL)hasIsDictationPrompt
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsDictationPrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsDictationPrompt
{
  -[NLXSchemaNLXLegacyNLContext setIsDictationPrompt:](self, "setIsDictationPrompt:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsStrictPrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isStrictPrompt = a3;
}

- (BOOL)hasIsStrictPrompt
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsStrictPrompt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsStrictPrompt
{
  -[NLXSchemaNLXLegacyNLContext setIsStrictPrompt:](self, "setIsStrictPrompt:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasPreviousDomainName
{
  return self->_previousDomainName != 0;
}

- (void)deletePreviousDomainName
{
  -[NLXSchemaNLXLegacyNLContext setPreviousDomainName:](self, "setPreviousDomainName:", 0);
}

- (void)setIsListenAfterSpeaking:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isListenAfterSpeaking = a3;
}

- (BOOL)hasIsListenAfterSpeaking
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsListenAfterSpeaking:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsListenAfterSpeaking
{
  -[NLXSchemaNLXLegacyNLContext setIsListenAfterSpeaking:](self, "setIsListenAfterSpeaking:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[NLXSchemaNLXLegacyNLContext setLinkId:](self, "setLinkId:", 0);
}

- (void)setLegacyContextSource:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_legacyContextSource = a3;
}

- (BOOL)hasLegacyContextSource
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasLegacyContextSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteLegacyContextSource
{
  -[NLXSchemaNLXLegacyNLContext setLegacyContextSource:](self, "setLegacyContextSource:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaNLXLegacyNLContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[NLXSchemaNLXLegacyNLContext previousDomainName](self, "previousDomainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
  -[NLXSchemaNLXLegacyNLContext linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLXSchemaNLXLegacyNLContext linkId](self, "linkId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $AA31BA2F0F6CBBACEF946895F2D7C1DD has;
  unsigned int v6;
  int isDictationPrompt;
  int v8;
  int isStrictPrompt;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int isListenAfterSpeaking;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  int v26;
  int legacyContextSource;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[44];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isDictationPrompt = self->_isDictationPrompt;
    if (isDictationPrompt != objc_msgSend(v4, "isDictationPrompt"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[44];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_22;
  if (v8)
  {
    isStrictPrompt = self->_isStrictPrompt;
    if (isStrictPrompt != objc_msgSend(v4, "isStrictPrompt"))
      goto LABEL_22;
  }
  -[NLXSchemaNLXLegacyNLContext previousDomainName](self, "previousDomainName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousDomainName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_21;
  -[NLXSchemaNLXLegacyNLContext previousDomainName](self, "previousDomainName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NLXSchemaNLXLegacyNLContext previousDomainName](self, "previousDomainName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousDomainName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  v17 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v17 != ((v4[44] >> 2) & 1))
    goto LABEL_22;
  if (v17)
  {
    isListenAfterSpeaking = self->_isListenAfterSpeaking;
    if (isListenAfterSpeaking != objc_msgSend(v4, "isListenAfterSpeaking"))
      goto LABEL_22;
  }
  -[NLXSchemaNLXLegacyNLContext linkId](self, "linkId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[NLXSchemaNLXLegacyNLContext linkId](self, "linkId");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[NLXSchemaNLXLegacyNLContext linkId](self, "linkId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_22;
  }
  else
  {

  }
  v26 = (*(_BYTE *)&self->_has >> 3) & 1;
  if (v26 == ((v4[44] >> 3) & 1))
  {
    if (!v26
      || (legacyContextSource = self->_legacyContextSource,
          legacyContextSource == objc_msgSend(v4, "legacyContextSource")))
    {
      v24 = 1;
      goto LABEL_23;
    }
  }
LABEL_22:
  v24 = 0;
LABEL_23:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_isDictationPrompt;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_isStrictPrompt;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_previousDomainName, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_isListenAfterSpeaking;
  else
    v6 = 0;
  v7 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v8 = 2654435761 * self->_legacyContextSource;
  else
    v8 = 0;
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NLXSchemaNLXLegacyNLContext isDictationPrompt](self, "isDictationPrompt"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isDictationPrompt"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_16:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NLXSchemaNLXLegacyNLContext isStrictPrompt](self, "isStrictPrompt"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isStrictPrompt"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_11;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NLXSchemaNLXLegacyNLContext isListenAfterSpeaking](self, "isListenAfterSpeaking"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isListenAfterSpeaking"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_16;
LABEL_4:
  if ((has & 8) == 0)
    goto LABEL_11;
LABEL_5:
  v5 = -[NLXSchemaNLXLegacyNLContext legacyContextSource](self, "legacyContextSource");
  v6 = CFSTR("NLXLEGACYCONTEXTSOURCE_UNKNOWN");
  if (v5 == 1)
    v6 = CFSTR("NLXLEGACYCONTEXTSOURCE_MODALITY");
  if (v5 == 2)
    v7 = CFSTR("NLXLEGACYCONTEXTSOURCE_POMMES");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("legacyContextSource"));
LABEL_11:
  if (self->_linkId)
  {
    -[NLXSchemaNLXLegacyNLContext linkId](self, "linkId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("linkId"));

    }
  }
  if (self->_previousDomainName)
  {
    -[NLXSchemaNLXLegacyNLContext previousDomainName](self, "previousDomainName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("previousDomainName"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaNLXLegacyNLContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaNLXLegacyNLContext)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaNLXLegacyNLContext *v5;
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
    self = -[NLXSchemaNLXLegacyNLContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaNLXLegacyNLContext)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaNLXLegacyNLContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SISchemaUUID *v12;
  void *v13;
  NLXSchemaNLXLegacyNLContext *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NLXSchemaNLXLegacyNLContext;
  v5 = -[NLXSchemaNLXLegacyNLContext init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDictationPrompt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaNLXLegacyNLContext setIsDictationPrompt:](v5, "setIsDictationPrompt:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isStrictPrompt"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaNLXLegacyNLContext setIsStrictPrompt:](v5, "setIsStrictPrompt:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousDomainName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[NLXSchemaNLXLegacyNLContext setPreviousDomainName:](v5, "setPreviousDomainName:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isListenAfterSpeaking"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaNLXLegacyNLContext setIsListenAfterSpeaking:](v5, "setIsListenAfterSpeaking:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[NLXSchemaNLXLegacyNLContext setLinkId:](v5, "setLinkId:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("legacyContextSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaNLXLegacyNLContext setLegacyContextSource:](v5, "setLegacyContextSource:", objc_msgSend(v13, "intValue"));
    v14 = v5;

  }
  return v5;
}

- (BOOL)isDictationPrompt
{
  return self->_isDictationPrompt;
}

- (BOOL)isStrictPrompt
{
  return self->_isStrictPrompt;
}

- (NSString)previousDomainName
{
  return self->_previousDomainName;
}

- (void)setPreviousDomainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isListenAfterSpeaking
{
  return self->_isListenAfterSpeaking;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (int)legacyContextSource
{
  return self->_legacyContextSource;
}

- (void)setHasPreviousDomainName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_previousDomainName, 0);
}

@end

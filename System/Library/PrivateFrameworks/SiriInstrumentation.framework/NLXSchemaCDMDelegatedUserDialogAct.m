@implementation NLXSchemaCDMDelegatedUserDialogAct

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
  v9.super_class = (Class)NLXSchemaCDMDelegatedUserDialogAct;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMDelegatedUserDialogAct linkId](self, "linkId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[NLXSchemaCDMDelegatedUserDialogAct deleteLinkId](self, "deleteLinkId");
  return v5;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_asrHypothesisIndex = a3;
}

- (BOOL)hasAsrHypothesisIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAsrHypothesisIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAsrHypothesisIndex
{
  -[NLXSchemaCDMDelegatedUserDialogAct setAsrHypothesisIndex:](self, "setAsrHypothesisIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[NLXSchemaCDMDelegatedUserDialogAct setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasExternalParserId
{
  return self->_externalParserId != 0;
}

- (void)deleteExternalParserId
{
  -[NLXSchemaCDMDelegatedUserDialogAct setExternalParserId:](self, "setExternalParserId:", 0);
}

- (void)setSiriVocabularySpanCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_siriVocabularySpanCount = a3;
}

- (BOOL)hasSiriVocabularySpanCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSiriVocabularySpanCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSiriVocabularySpanCount
{
  -[NLXSchemaCDMDelegatedUserDialogAct setSiriVocabularySpanCount:](self, "setSiriVocabularySpanCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setMentionResolverSpanCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mentionResolverSpanCount = a3;
}

- (BOOL)hasMentionResolverSpanCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMentionResolverSpanCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMentionResolverSpanCount
{
  -[NLXSchemaCDMDelegatedUserDialogAct setMentionResolverSpanCount:](self, "setMentionResolverSpanCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setRewriteType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_rewriteType = a3;
}

- (BOOL)hasRewriteType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasRewriteType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteRewriteType
{
  -[NLXSchemaCDMDelegatedUserDialogAct setRewriteType:](self, "setRewriteType:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setContextMatcherSpanCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_contextMatcherSpanCount = a3;
}

- (BOOL)hasContextMatcherSpanCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasContextMatcherSpanCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteContextMatcherSpanCount
{
  -[NLXSchemaCDMDelegatedUserDialogAct setContextMatcherSpanCount:](self, "setContextMatcherSpanCount:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMDelegatedUserDialogActReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char has;
  id v8;

  v8 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[NLXSchemaCDMDelegatedUserDialogAct linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaCDMDelegatedUserDialogAct linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMDelegatedUserDialogAct externalParserId](self, "externalParserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_10;
LABEL_15:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 0x10) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field();
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int asrHypothesisIndex;
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
  int v17;
  BOOL v18;
  $D7DD38554503B5E0302E971278F53D02 has;
  int v21;
  unsigned int v22;
  unsigned int siriVocabularySpanCount;
  int v24;
  unsigned int mentionResolverSpanCount;
  int v26;
  int rewriteType;
  int v28;
  unsigned int contextMatcherSpanCount;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    asrHypothesisIndex = self->_asrHypothesisIndex;
    if (asrHypothesisIndex != objc_msgSend(v4, "asrHypothesisIndex"))
      goto LABEL_15;
  }
  -[NLXSchemaCDMDelegatedUserDialogAct linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[NLXSchemaCDMDelegatedUserDialogAct linkId](self, "linkId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NLXSchemaCDMDelegatedUserDialogAct linkId](self, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[NLXSchemaCDMDelegatedUserDialogAct externalParserId](self, "externalParserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalParserId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  -[NLXSchemaCDMDelegatedUserDialogAct externalParserId](self, "externalParserId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NLXSchemaCDMDelegatedUserDialogAct externalParserId](self, "externalParserId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externalParserId");
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
  v22 = v4[48];
  if (v21 == ((v22 >> 1) & 1))
  {
    if (v21)
    {
      siriVocabularySpanCount = self->_siriVocabularySpanCount;
      if (siriVocabularySpanCount != objc_msgSend(v4, "siriVocabularySpanCount"))
        goto LABEL_15;
      has = self->_has;
      v22 = v4[48];
    }
    v24 = (*(unsigned int *)&has >> 2) & 1;
    if (v24 == ((v22 >> 2) & 1))
    {
      if (v24)
      {
        mentionResolverSpanCount = self->_mentionResolverSpanCount;
        if (mentionResolverSpanCount != objc_msgSend(v4, "mentionResolverSpanCount"))
          goto LABEL_15;
        has = self->_has;
        v22 = v4[48];
      }
      v26 = (*(unsigned int *)&has >> 3) & 1;
      if (v26 == ((v22 >> 3) & 1))
      {
        if (v26)
        {
          rewriteType = self->_rewriteType;
          if (rewriteType != objc_msgSend(v4, "rewriteType"))
            goto LABEL_15;
          has = self->_has;
          v22 = v4[48];
        }
        v28 = (*(unsigned int *)&has >> 4) & 1;
        if (v28 == ((v22 >> 4) & 1))
        {
          if (!v28
            || (contextMatcherSpanCount = self->_contextMatcherSpanCount,
                contextMatcherSpanCount == objc_msgSend(v4, "contextMatcherSpanCount")))
          {
            v18 = 1;
            goto LABEL_16;
          }
        }
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
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_asrHypothesisIndex;
  else
    v3 = 0;
  v4 = -[SISchemaUUID hash](self->_linkId, "hash");
  v5 = -[NSString hash](self->_externalParserId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_siriVocabularySpanCount;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_mentionResolverSpanCount;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_7;
LABEL_11:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_8;
LABEL_12:
      v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_7:
  v8 = 2654435761 * self->_rewriteType;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_8:
  v9 = 2654435761 * self->_contextMatcherSpanCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v15;
  unsigned int v16;
  const __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMDelegatedUserDialogAct asrHypothesisIndex](self, "asrHypothesisIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asrHypothesisIndex"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMDelegatedUserDialogAct contextMatcherSpanCount](self, "contextMatcherSpanCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contextMatcherSpanCount"));

  }
  if (self->_externalParserId)
  {
    -[NLXSchemaCDMDelegatedUserDialogAct externalParserId](self, "externalParserId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("externalParserId"));

  }
  if (self->_linkId)
  {
    -[NLXSchemaCDMDelegatedUserDialogAct linkId](self, "linkId");
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
  v12 = (char)self->_has;
  if ((v12 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_14;
LABEL_18:
    v16 = -[NLXSchemaCDMDelegatedUserDialogAct rewriteType](self, "rewriteType") - 1;
    if (v16 > 3)
      v17 = CFSTR("CDMREWRITETYPE_UNKNOWN");
    else
      v17 = off_1E5631A38[v16];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rewriteType"));
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_15;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMDelegatedUserDialogAct mentionResolverSpanCount](self, "mentionResolverSpanCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("mentionResolverSpanCount"));

  v12 = (char)self->_has;
  if ((v12 & 8) != 0)
    goto LABEL_18;
LABEL_14:
  if ((v12 & 2) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMDelegatedUserDialogAct siriVocabularySpanCount](self, "siriVocabularySpanCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("siriVocabularySpanCount"));

  }
LABEL_16:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMDelegatedUserDialogAct dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMDelegatedUserDialogAct)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMDelegatedUserDialogAct *v5;
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
    self = -[NLXSchemaCDMDelegatedUserDialogAct initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMDelegatedUserDialogAct)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMDelegatedUserDialogAct *v5;
  void *v6;
  void *v7;
  SISchemaUUID *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NLXSchemaCDMDelegatedUserDialogAct *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NLXSchemaCDMDelegatedUserDialogAct;
  v5 = -[NLXSchemaCDMDelegatedUserDialogAct init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrHypothesisIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMDelegatedUserDialogAct setAsrHypothesisIndex:](v5, "setAsrHypothesisIndex:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v7);
      -[NLXSchemaCDMDelegatedUserDialogAct setLinkId:](v5, "setLinkId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("externalParserId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[NLXSchemaCDMDelegatedUserDialogAct setExternalParserId:](v5, "setExternalParserId:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriVocabularySpanCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMDelegatedUserDialogAct setSiriVocabularySpanCount:](v5, "setSiriVocabularySpanCount:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mentionResolverSpanCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMDelegatedUserDialogAct setMentionResolverSpanCount:](v5, "setMentionResolverSpanCount:", objc_msgSend(v12, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rewriteType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMDelegatedUserDialogAct setRewriteType:](v5, "setRewriteType:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextMatcherSpanCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMDelegatedUserDialogAct setContextMatcherSpanCount:](v5, "setContextMatcherSpanCount:", objc_msgSend(v14, "unsignedIntValue"));
    v15 = v5;

  }
  return v5;
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (NSString)externalParserId
{
  return self->_externalParserId;
}

- (void)setExternalParserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)siriVocabularySpanCount
{
  return self->_siriVocabularySpanCount;
}

- (unsigned)mentionResolverSpanCount
{
  return self->_mentionResolverSpanCount;
}

- (int)rewriteType
{
  return self->_rewriteType;
}

- (unsigned)contextMatcherSpanCount
{
  return self->_contextMatcherSpanCount;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasExternalParserId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalParserId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end

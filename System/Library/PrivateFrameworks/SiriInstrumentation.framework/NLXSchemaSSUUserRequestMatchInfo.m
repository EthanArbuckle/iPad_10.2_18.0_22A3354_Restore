@implementation NLXSchemaSSUUserRequestMatchInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMatchingUtteranceCandidateType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_matchingUtteranceCandidateType = a3;
}

- (BOOL)hasMatchingUtteranceCandidateType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMatchingUtteranceCandidateType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMatchingUtteranceCandidateType
{
  -[NLXSchemaSSUUserRequestMatchInfo setMatchingUtteranceCandidateType:](self, "setMatchingUtteranceCandidateType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumEntities:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numEntities = a3;
}

- (BOOL)hasNumEntities
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumEntities:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumEntities
{
  -[NLXSchemaSSUUserRequestMatchInfo setNumEntities:](self, "setNumEntities:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaSSUUserRequestMatchInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $2A23DE3E5703E746EF07A68D11ACE27F has;
  unsigned int v6;
  int matchingUtteranceCandidateType;
  int v8;
  unsigned int numEntities;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    matchingUtteranceCandidateType = self->_matchingUtteranceCandidateType;
    if (matchingUtteranceCandidateType != objc_msgSend(v4, "matchingUtteranceCandidateType"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    numEntities = self->_numEntities;
    if (numEntities != objc_msgSend(v4, "numEntities"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_matchingUtteranceCandidateType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_numEntities;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[NLXSchemaSSUUserRequestMatchInfo matchingUtteranceCandidateType](self, "matchingUtteranceCandidateType");
    v6 = CFSTR("SSUUTTERANCECANDIDATETYPE_UNKNOWN");
    if (v5 == 1)
      v6 = CFSTR("SSUUTTERANCECANDIDATETYPE_ORIGINAL");
    if (v5 == 2)
      v7 = CFSTR("SSUUTTERANCECANDIDATETYPE_ALTERNATIVE");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("matchingUtteranceCandidateType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaSSUUserRequestMatchInfo numEntities](self, "numEntities"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numEntities"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaSSUUserRequestMatchInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaSSUUserRequestMatchInfo)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaSSUUserRequestMatchInfo *v5;
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
    self = -[NLXSchemaSSUUserRequestMatchInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaSSUUserRequestMatchInfo)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaSSUUserRequestMatchInfo *v5;
  void *v6;
  void *v7;
  NLXSchemaSSUUserRequestMatchInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaSSUUserRequestMatchInfo;
  v5 = -[NLXSchemaSSUUserRequestMatchInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchingUtteranceCandidateType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaSSUUserRequestMatchInfo setMatchingUtteranceCandidateType:](v5, "setMatchingUtteranceCandidateType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numEntities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaSSUUserRequestMatchInfo setNumEntities:](v5, "setNumEntities:", objc_msgSend(v7, "unsignedIntValue"));
    v8 = v5;

  }
  return v5;
}

- (int)matchingUtteranceCandidateType
{
  return self->_matchingUtteranceCandidateType;
}

- (unsigned)numEntities
{
  return self->_numEntities;
}

@end

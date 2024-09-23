@implementation ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore

- (BOOL)hasCurrentTurnId
{
  return self->_currentTurnId != 0;
}

- (void)deleteCurrentTurnId
{
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore setCurrentTurnId:](self, "setCurrentTurnId:", 0);
}

- (BOOL)hasNextTurnId
{
  return self->_nextTurnId != 0;
}

- (void)deleteNextTurnId
{
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore setNextTurnId:](self, "setNextTurnId:", 0);
}

- (void)setUtteranceRestatementScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_utteranceRestatementScore = a3;
}

- (BOOL)hasUtteranceRestatementScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUtteranceRestatementScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteUtteranceRestatementScore
{
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore setUtteranceRestatementScore:](self, "setUtteranceRestatementScore:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSemanticSimilarityScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_semanticSimilarityScore = a3;
}

- (BOOL)hasSemanticSimilarityScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSemanticSimilarityScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSemanticSimilarityScore
{
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore setSemanticSimilarityScore:](self, "setSemanticSimilarityScore:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoreReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  id v10;

  v10 = a3;
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore currentTurnId](self, "currentTurnId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore currentTurnId](self, "currentTurnId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore nextTurnId](self, "nextTurnId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore nextTurnId](self, "nextTurnId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v9 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
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
  BOOL v17;
  $6E5DD1958CD4B9BE9E3C45BBE66BD10A has;
  unsigned int v20;
  double utteranceRestatementScore;
  double v22;
  int v23;
  double semanticSimilarityScore;
  double v25;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore currentTurnId](self, "currentTurnId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTurnId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore currentTurnId](self, "currentTurnId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore currentTurnId](self, "currentTurnId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTurnId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore nextTurnId](self, "nextTurnId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextTurnId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore nextTurnId](self, "nextTurnId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore nextTurnId](self, "nextTurnId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextTurnId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[40];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      utteranceRestatementScore = self->_utteranceRestatementScore;
      objc_msgSend(v4, "utteranceRestatementScore");
      if (utteranceRestatementScore != v22)
        goto LABEL_12;
      has = self->_has;
      v20 = v4[40];
    }
    v23 = (*(unsigned int *)&has >> 1) & 1;
    if (v23 == ((v20 >> 1) & 1))
    {
      if (!v23
        || (semanticSimilarityScore = self->_semanticSimilarityScore,
            objc_msgSend(v4, "semanticSimilarityScore"),
            semanticSimilarityScore == v25))
      {
        v17 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  char has;
  unint64_t v6;
  double utteranceRestatementScore;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double semanticSimilarityScore;
  double v13;
  long double v14;
  double v15;

  v3 = -[SISchemaUUID hash](self->_currentTurnId, "hash");
  v4 = -[SISchemaUUID hash](self->_nextTurnId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    utteranceRestatementScore = self->_utteranceRestatementScore;
    v8 = -utteranceRestatementScore;
    if (utteranceRestatementScore >= 0.0)
      v8 = self->_utteranceRestatementScore;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 2) != 0)
  {
    semanticSimilarityScore = self->_semanticSimilarityScore;
    v13 = -semanticSimilarityScore;
    if (semanticSimilarityScore >= 0.0)
      v13 = self->_semanticSimilarityScore;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
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
  char has;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_currentTurnId)
  {
    -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore currentTurnId](self, "currentTurnId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currentTurnId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("currentTurnId"));

    }
  }
  if (self->_nextTurnId)
  {
    -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore nextTurnId](self, "nextTurnId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("nextTurnId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("nextTurnId"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore semanticSimilarityScore](self, "semanticSimilarityScore");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("semanticSimilarityScore"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore utteranceRestatementScore](self, "utteranceRestatementScore");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("utteranceRestatementScore"));

  }
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore)initWithJSON:(id)a3
{
  void *v4;
  ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore)initWithDictionary:(id)a3
{
  id v4;
  ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore;
  v5 = -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentTurnId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithDictionary:", v6);
      -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore setCurrentTurnId:](v5, "setCurrentTurnId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nextTurnId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithDictionary:", v8);
      -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore setNextTurnId:](v5, "setNextTurnId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceRestatementScore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore setUtteranceRestatementScore:](v5, "setUtteranceRestatementScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticSimilarityScore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "doubleValue");
      -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore setSemanticSimilarityScore:](v5, "setSemanticSimilarityScore:");
    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)currentTurnId
{
  return self->_currentTurnId;
}

- (void)setCurrentTurnId:(id)a3
{
  objc_storeStrong((id *)&self->_currentTurnId, a3);
}

- (SISchemaUUID)nextTurnId
{
  return self->_nextTurnId;
}

- (void)setNextTurnId:(id)a3
{
  objc_storeStrong((id *)&self->_nextTurnId, a3);
}

- (double)utteranceRestatementScore
{
  return self->_utteranceRestatementScore;
}

- (double)semanticSimilarityScore
{
  return self->_semanticSimilarityScore;
}

- (void)setHasCurrentTurnId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasNextTurnId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextTurnId, 0);
  objc_storeStrong((id *)&self->_currentTurnId, 0);
}

@end

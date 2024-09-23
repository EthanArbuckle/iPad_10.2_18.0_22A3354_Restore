@implementation MHSchemaMHVoiceProfileConfusionScore

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasHomeMemberUserId
{
  return self->_homeMemberUserId != 0;
}

- (void)deleteHomeMemberUserId
{
  -[MHSchemaMHVoiceProfileConfusionScore setHomeMemberUserId:](self, "setHomeMemberUserId:", 0);
}

- (void)setSimilarityScore:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_similarityScore = a3;
}

- (BOOL)hasSimilarityScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSimilarityScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSimilarityScore
{
  -[MHSchemaMHVoiceProfileConfusionScore setSimilarityScore:](self, "setSimilarityScore:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceProfileConfusionScoreReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MHSchemaMHVoiceProfileConfusionScore homeMemberUserId](self, "homeMemberUserId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int similarityScore;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[MHSchemaMHVoiceProfileConfusionScore homeMemberUserId](self, "homeMemberUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeMemberUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[MHSchemaMHVoiceProfileConfusionScore homeMemberUserId](self, "homeMemberUserId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MHSchemaMHVoiceProfileConfusionScore homeMemberUserId](self, "homeMemberUserId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeMemberUserId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[20] & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    similarityScore = self->_similarityScore;
    if (similarityScore != objc_msgSend(v4, "similarityScore"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_homeMemberUserId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_similarityScore;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_homeMemberUserId)
  {
    -[MHSchemaMHVoiceProfileConfusionScore homeMemberUserId](self, "homeMemberUserId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("homeMemberUserId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHVoiceProfileConfusionScore similarityScore](self, "similarityScore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("similarityScore"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHVoiceProfileConfusionScore dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHVoiceProfileConfusionScore)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHVoiceProfileConfusionScore *v5;
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
    self = -[MHSchemaMHVoiceProfileConfusionScore initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHVoiceProfileConfusionScore)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHVoiceProfileConfusionScore *v5;
  void *v6;
  void *v7;
  void *v8;
  MHSchemaMHVoiceProfileConfusionScore *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHVoiceProfileConfusionScore;
  v5 = -[MHSchemaMHVoiceProfileConfusionScore init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeMemberUserId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaMHVoiceProfileConfusionScore setHomeMemberUserId:](v5, "setHomeMemberUserId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("similarityScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceProfileConfusionScore setSimilarityScore:](v5, "setSimilarityScore:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)homeMemberUserId
{
  return self->_homeMemberUserId;
}

- (void)setHomeMemberUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)similarityScore
{
  return self->_similarityScore;
}

- (void)setHasHomeMemberUserId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeMemberUserId, 0);
}

@end

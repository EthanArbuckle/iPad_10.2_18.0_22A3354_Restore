@implementation MHSchemaFirstPassChannelSelectionScore

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasChannelString
{
  return self->_channelString != 0;
}

- (void)deleteChannelString
{
  -[MHSchemaFirstPassChannelSelectionScore setChannelString:](self, "setChannelString:", 0);
}

- (void)setFirstPassScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_firstPassScore = a3;
}

- (BOOL)hasFirstPassScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFirstPassScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFirstPassScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaFirstPassChannelSelectionScore setFirstPassScore:](self, "setFirstPassScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaFirstPassChannelSelectionScoreReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MHSchemaFirstPassChannelSelectionScore channelString](self, "channelString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();

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
  float firstPassScore;
  float v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[MHSchemaFirstPassChannelSelectionScore channelString](self, "channelString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channelString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[MHSchemaFirstPassChannelSelectionScore channelString](self, "channelString");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[MHSchemaFirstPassChannelSelectionScore channelString](self, "channelString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "channelString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_11;
    }
    else
    {

    }
    if ((*(_BYTE *)&self->_has & 1) == (v4[20] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (firstPassScore = self->_firstPassScore, objc_msgSend(v4, "firstPassScore"), firstPassScore == v14))
      {
        v15 = 1;
        goto LABEL_12;
      }
    }
  }
  else
  {

  }
LABEL_11:
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  float firstPassScore;
  double v6;
  long double v7;
  double v8;

  v3 = -[NSString hash](self->_channelString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    firstPassScore = self->_firstPassScore;
    v6 = firstPassScore;
    if (firstPassScore < 0.0)
      v6 = -firstPassScore;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_channelString)
  {
    -[MHSchemaFirstPassChannelSelectionScore channelString](self, "channelString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("channelString"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaFirstPassChannelSelectionScore firstPassScore](self, "firstPassScore");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("firstPassScore"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaFirstPassChannelSelectionScore dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaFirstPassChannelSelectionScore)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaFirstPassChannelSelectionScore *v5;
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
    self = -[MHSchemaFirstPassChannelSelectionScore initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaFirstPassChannelSelectionScore)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaFirstPassChannelSelectionScore *v5;
  void *v6;
  void *v7;
  void *v8;
  MHSchemaFirstPassChannelSelectionScore *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaFirstPassChannelSelectionScore;
  v5 = -[MHSchemaFirstPassChannelSelectionScore init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channelString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaFirstPassChannelSelectionScore setChannelString:](v5, "setChannelString:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[MHSchemaFirstPassChannelSelectionScore setFirstPassScore:](v5, "setFirstPassScore:");
    }
    v9 = v5;

  }
  return v5;
}

- (NSString)channelString
{
  return self->_channelString;
}

- (void)setChannelString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (float)firstPassScore
{
  return self->_firstPassScore;
}

- (void)setHasChannelString:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelString, 0);
}

@end

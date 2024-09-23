@implementation INFERENCESchemaINFERENCEEuclidTrialParameters

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasEuclidModelVersion
{
  return self->_euclidModelVersion != 0;
}

- (void)deleteEuclidModelVersion
{
  -[INFERENCESchemaINFERENCEEuclidTrialParameters setEuclidModelVersion:](self, "setEuclidModelVersion:", 0);
}

- (void)setEuclidScoreThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_euclidScoreThreshold = a3;
}

- (BOOL)hasEuclidScoreThreshold
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEuclidScoreThreshold:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEuclidScoreThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEEuclidTrialParameters setEuclidScoreThreshold:](self, "setEuclidScoreThreshold:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEuclidAsrConfidenceThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_euclidAsrConfidenceThreshold = a3;
}

- (BOOL)hasEuclidAsrConfidenceThreshold
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEuclidAsrConfidenceThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEuclidAsrConfidenceThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEEuclidTrialParameters setEuclidAsrConfidenceThreshold:](self, "setEuclidAsrConfidenceThreshold:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCEEuclidTrialParametersReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  id v7;

  v7 = a3;
  -[INFERENCESchemaINFERENCEEuclidTrialParameters euclidModelVersion](self, "euclidModelVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $58C14582DE34C139B269CBF82246E7D5 has;
  unsigned int v14;
  float euclidScoreThreshold;
  float v16;
  int v17;
  float euclidAsrConfidenceThreshold;
  float v19;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[INFERENCESchemaINFERENCEEuclidTrialParameters euclidModelVersion](self, "euclidModelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "euclidModelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[INFERENCESchemaINFERENCEEuclidTrialParameters euclidModelVersion](self, "euclidModelVersion");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[INFERENCESchemaINFERENCEEuclidTrialParameters euclidModelVersion](self, "euclidModelVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "euclidModelVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_15;
    }
    else
    {

    }
    has = self->_has;
    v14 = v4[24];
    if ((*(_BYTE *)&has & 1) == (v14 & 1))
    {
      if ((*(_BYTE *)&has & 1) != 0)
      {
        euclidScoreThreshold = self->_euclidScoreThreshold;
        objc_msgSend(v4, "euclidScoreThreshold");
        if (euclidScoreThreshold != v16)
          goto LABEL_15;
        has = self->_has;
        v14 = v4[24];
      }
      v17 = (*(unsigned int *)&has >> 1) & 1;
      if (v17 == ((v14 >> 1) & 1))
      {
        if (!v17
          || (euclidAsrConfidenceThreshold = self->_euclidAsrConfidenceThreshold,
              objc_msgSend(v4, "euclidAsrConfidenceThreshold"),
              euclidAsrConfidenceThreshold == v19))
        {
          v20 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {

  }
LABEL_15:
  v20 = 0;
LABEL_16:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  float euclidScoreThreshold;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float euclidAsrConfidenceThreshold;
  double v12;
  long double v13;
  double v14;

  v3 = -[NSString hash](self->_euclidModelVersion, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    euclidScoreThreshold = self->_euclidScoreThreshold;
    v7 = euclidScoreThreshold;
    if (euclidScoreThreshold < 0.0)
      v7 = -euclidScoreThreshold;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) != 0)
  {
    euclidAsrConfidenceThreshold = self->_euclidAsrConfidenceThreshold;
    v12 = euclidAsrConfidenceThreshold;
    if (euclidAsrConfidenceThreshold < 0.0)
      v12 = -euclidAsrConfidenceThreshold;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  return v5 ^ v3 ^ v10;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEEuclidTrialParameters euclidAsrConfidenceThreshold](self, "euclidAsrConfidenceThreshold");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("euclidAsrConfidenceThreshold"));

  }
  if (self->_euclidModelVersion)
  {
    -[INFERENCESchemaINFERENCEEuclidTrialParameters euclidModelVersion](self, "euclidModelVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("euclidModelVersion"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEEuclidTrialParameters euclidScoreThreshold](self, "euclidScoreThreshold");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("euclidScoreThreshold"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEEuclidTrialParameters dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEEuclidTrialParameters)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEEuclidTrialParameters *v5;
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
    self = -[INFERENCESchemaINFERENCEEuclidTrialParameters initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEEuclidTrialParameters)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEEuclidTrialParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  INFERENCESchemaINFERENCEEuclidTrialParameters *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INFERENCESchemaINFERENCEEuclidTrialParameters;
  v5 = -[INFERENCESchemaINFERENCEEuclidTrialParameters init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("euclidModelVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[INFERENCESchemaINFERENCEEuclidTrialParameters setEuclidModelVersion:](v5, "setEuclidModelVersion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("euclidScoreThreshold"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[INFERENCESchemaINFERENCEEuclidTrialParameters setEuclidScoreThreshold:](v5, "setEuclidScoreThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("euclidAsrConfidenceThreshold"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[INFERENCESchemaINFERENCEEuclidTrialParameters setEuclidAsrConfidenceThreshold:](v5, "setEuclidAsrConfidenceThreshold:");
    }
    v10 = v5;

  }
  return v5;
}

- (NSString)euclidModelVersion
{
  return self->_euclidModelVersion;
}

- (void)setEuclidModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (float)euclidScoreThreshold
{
  return self->_euclidScoreThreshold;
}

- (float)euclidAsrConfidenceThreshold
{
  return self->_euclidAsrConfidenceThreshold;
}

- (void)setHasEuclidModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_euclidModelVersion, 0);
}

@end

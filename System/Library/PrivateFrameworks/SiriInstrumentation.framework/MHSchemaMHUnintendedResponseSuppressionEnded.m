@implementation MHSchemaMHUnintendedResponseSuppressionEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteModelVersion
{
  -[MHSchemaMHUnintendedResponseSuppressionEnded setModelVersion:](self, "setModelVersion:", 0);
}

- (void)setScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHUnintendedResponseSuppressionEnded setScore:](self, "setScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_threshold = a3;
}

- (BOOL)hasThreshold
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHUnintendedResponseSuppressionEnded setThreshold:](self, "setThreshold:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasMitigationAssetVersion
{
  return self->_mitigationAssetVersion != 0;
}

- (void)deleteMitigationAssetVersion
{
  -[MHSchemaMHUnintendedResponseSuppressionEnded setMitigationAssetVersion:](self, "setMitigationAssetVersion:", 0);
}

- (void)setSpeakerIDThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_speakerIDThreshold = a3;
}

- (BOOL)hasSpeakerIDThreshold
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSpeakerIDThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSpeakerIDThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHUnintendedResponseSuppressionEnded setSpeakerIDThreshold:](self, "setSpeakerIDThreshold:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setSpeakerIdScoreThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_speakerIdScoreThreshold = a3;
}

- (BOOL)hasSpeakerIdScoreThreshold
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSpeakerIdScoreThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteSpeakerIdScoreThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHUnintendedResponseSuppressionEnded setSpeakerIdScoreThreshold:](self, "setSpeakerIdScoreThreshold:", v2);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHUnintendedResponseSuppressionEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MHSchemaMHUnintendedResponseSuppressionEnded modelVersion](self, "modelVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteFloatField();
  -[MHSchemaMHUnintendedResponseSuppressionEnded mitigationAssetVersion](self, "mitigationAssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v7 = (char)self->_has;
  v8 = v9;
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    v8 = v9;
    v7 = (char)self->_has;
  }
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    v8 = v9;
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
  $13047DB1728F224DDA92666FD4C526AE has;
  unsigned int v13;
  float score;
  float v15;
  int v16;
  float threshold;
  float v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  $13047DB1728F224DDA92666FD4C526AE v26;
  int v27;
  unsigned int v28;
  float speakerIDThreshold;
  float v30;
  int v31;
  float speakerIdScoreThreshold;
  float v33;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[MHSchemaMHUnintendedResponseSuppressionEnded modelVersion](self, "modelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_18;
  -[MHSchemaMHUnintendedResponseSuppressionEnded modelVersion](self, "modelVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MHSchemaMHUnintendedResponseSuppressionEnded modelVersion](self, "modelVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    score = self->_score;
    objc_msgSend(v4, "score");
    if (score != v15)
      goto LABEL_19;
    has = self->_has;
    v13 = v4[40];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v13 >> 1) & 1))
    goto LABEL_19;
  if (v16)
  {
    threshold = self->_threshold;
    objc_msgSend(v4, "threshold");
    if (threshold != v18)
      goto LABEL_19;
  }
  -[MHSchemaMHUnintendedResponseSuppressionEnded mitigationAssetVersion](self, "mitigationAssetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mitigationAssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[MHSchemaMHUnintendedResponseSuppressionEnded mitigationAssetVersion](self, "mitigationAssetVersion");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[MHSchemaMHUnintendedResponseSuppressionEnded mitigationAssetVersion](self, "mitigationAssetVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mitigationAssetVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_19;
  }
  else
  {

  }
  v26 = self->_has;
  v27 = (*(unsigned int *)&v26 >> 2) & 1;
  v28 = v4[40];
  if (v27 == ((v28 >> 2) & 1))
  {
    if (v27)
    {
      speakerIDThreshold = self->_speakerIDThreshold;
      objc_msgSend(v4, "speakerIDThreshold");
      if (speakerIDThreshold != v30)
        goto LABEL_19;
      v26 = self->_has;
      v28 = v4[40];
    }
    v31 = (*(unsigned int *)&v26 >> 3) & 1;
    if (v31 == ((v28 >> 3) & 1))
    {
      if (!v31
        || (speakerIdScoreThreshold = self->_speakerIdScoreThreshold,
            objc_msgSend(v4, "speakerIdScoreThreshold"),
            speakerIdScoreThreshold == v33))
      {
        v24 = 1;
        goto LABEL_20;
      }
    }
  }
LABEL_19:
  v24 = 0;
LABEL_20:

  return v24;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  float score;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float threshold;
  double v12;
  long double v13;
  double v14;
  NSUInteger v15;
  char v16;
  unint64_t v17;
  float speakerIDThreshold;
  double v19;
  long double v20;
  double v21;
  unint64_t v22;
  float speakerIdScoreThreshold;
  double v24;
  long double v25;
  double v26;

  v3 = -[NSString hash](self->_modelVersion, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    score = self->_score;
    v7 = score;
    if (score < 0.0)
      v7 = -score;
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
    threshold = self->_threshold;
    v12 = threshold;
    if (threshold < 0.0)
      v12 = -threshold;
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
  v15 = -[NSString hash](self->_mitigationAssetVersion, "hash");
  v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    speakerIDThreshold = self->_speakerIDThreshold;
    v19 = speakerIDThreshold;
    if (speakerIDThreshold < 0.0)
      v19 = -speakerIDThreshold;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  if ((v16 & 8) != 0)
  {
    speakerIdScoreThreshold = self->_speakerIdScoreThreshold;
    v24 = speakerIdScoreThreshold;
    if (speakerIdScoreThreshold < 0.0)
      v24 = -speakerIdScoreThreshold;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    v22 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v17 ^ v22;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_mitigationAssetVersion)
  {
    -[MHSchemaMHUnintendedResponseSuppressionEnded mitigationAssetVersion](self, "mitigationAssetVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mitigationAssetVersion"));

  }
  if (self->_modelVersion)
  {
    -[MHSchemaMHUnintendedResponseSuppressionEnded modelVersion](self, "modelVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("modelVersion"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHUnintendedResponseSuppressionEnded score](self, "score");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("score"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
LABEL_13:
      v16 = (void *)MEMORY[0x1E0CB37E8];
      -[MHSchemaMHUnintendedResponseSuppressionEnded speakerIdScoreThreshold](self, "speakerIdScoreThreshold");
      objc_msgSend(v16, "numberWithFloat:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("speakerIdScoreThreshold"));

      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHUnintendedResponseSuppressionEnded speakerIDThreshold](self, "speakerIDThreshold");
  objc_msgSend(v14, "numberWithFloat:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("speakerIDThreshold"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 2) != 0)
  {
LABEL_9:
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHUnintendedResponseSuppressionEnded threshold](self, "threshold");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("threshold"));

  }
LABEL_10:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHUnintendedResponseSuppressionEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHUnintendedResponseSuppressionEnded)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHUnintendedResponseSuppressionEnded *v5;
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
    self = -[MHSchemaMHUnintendedResponseSuppressionEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHUnintendedResponseSuppressionEnded)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHUnintendedResponseSuppressionEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MHSchemaMHUnintendedResponseSuppressionEnded *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MHSchemaMHUnintendedResponseSuppressionEnded;
  v5 = -[MHSchemaMHUnintendedResponseSuppressionEnded init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaMHUnintendedResponseSuppressionEnded setModelVersion:](v5, "setModelVersion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[MHSchemaMHUnintendedResponseSuppressionEnded setScore:](v5, "setScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("threshold"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[MHSchemaMHUnintendedResponseSuppressionEnded setThreshold:](v5, "setThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mitigationAssetVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[MHSchemaMHUnintendedResponseSuppressionEnded setMitigationAssetVersion:](v5, "setMitigationAssetVersion:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speakerIDThreshold"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[MHSchemaMHUnintendedResponseSuppressionEnded setSpeakerIDThreshold:](v5, "setSpeakerIDThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speakerIdScoreThreshold"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "floatValue");
      -[MHSchemaMHUnintendedResponseSuppressionEnded setSpeakerIdScoreThreshold:](v5, "setSpeakerIdScoreThreshold:");
    }
    v14 = v5;

  }
  return v5;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (float)score
{
  return self->_score;
}

- (float)threshold
{
  return self->_threshold;
}

- (NSString)mitigationAssetVersion
{
  return self->_mitigationAssetVersion;
}

- (void)setMitigationAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)speakerIDThreshold
{
  return self->_speakerIDThreshold;
}

- (float)speakerIdScoreThreshold
{
  return self->_speakerIdScoreThreshold;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasMitigationAssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mitigationAssetVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

@end

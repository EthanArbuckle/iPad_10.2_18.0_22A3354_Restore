@implementation PLUSSchemaPLUSMediaGroundTruthSummary

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_source = a3;
}

- (BOOL)hasSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSource
{
  -[PLUSSchemaPLUSMediaGroundTruthSummary setSource:](self, "setSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setGroundTruthCount:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_groundTruthCount = a3;
}

- (BOOL)hasGroundTruthCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasGroundTruthCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteGroundTruthCount
{
  -[PLUSSchemaPLUSMediaGroundTruthSummary setGroundTruthCount:](self, "setGroundTruthCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setMediaEntityCount:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mediaEntityCount = a3;
}

- (BOOL)hasMediaEntityCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMediaEntityCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMediaEntityCount
{
  -[PLUSSchemaPLUSMediaGroundTruthSummary setMediaEntityCount:](self, "setMediaEntityCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaGroundTruthSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $617A844BD5AE851F84C0C4DED5AF263B has;
  unsigned int v6;
  int source;
  int v8;
  int groundTruthCount;
  int v10;
  int mediaEntityCount;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    source = self->_source;
    if (source != objc_msgSend(v4, "source"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    groundTruthCount = self->_groundTruthCount;
    if (groundTruthCount == objc_msgSend(v4, "groundTruthCount"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    mediaEntityCount = self->_mediaEntityCount;
    if (mediaEntityCount != objc_msgSend(v4, "mediaEntityCount"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_source;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_groundTruthCount;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_mediaEntityCount;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLUSSchemaPLUSMediaGroundTruthSummary mediaEntityCount](self, "mediaEntityCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("mediaEntityCount"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_11;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLUSSchemaPLUSMediaGroundTruthSummary groundTruthCount](self, "groundTruthCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("groundTruthCount"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_6;
LABEL_3:
  if ((has & 1) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = -[PLUSSchemaPLUSMediaGroundTruthSummary source](self, "source") - 1;
  if (v7 > 8)
    v8 = CFSTR("PLUSMEDIAGROUNDTRUTHSOURCE_UNKNOWN");
  else
    v8 = off_1E5639390[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("source"));
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSMediaGroundTruthSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSMediaGroundTruthSummary)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSMediaGroundTruthSummary *v5;
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
    self = -[PLUSSchemaPLUSMediaGroundTruthSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSMediaGroundTruthSummary)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSMediaGroundTruthSummary *v5;
  void *v6;
  void *v7;
  void *v8;
  PLUSSchemaPLUSMediaGroundTruthSummary *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLUSSchemaPLUSMediaGroundTruthSummary;
  v5 = -[PLUSSchemaPLUSMediaGroundTruthSummary init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSMediaGroundTruthSummary setSource:](v5, "setSource:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groundTruthCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSMediaGroundTruthSummary setGroundTruthCount:](v5, "setGroundTruthCount:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaEntityCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSMediaGroundTruthSummary setMediaEntityCount:](v5, "setMediaEntityCount:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (int)source
{
  return self->_source;
}

- (int)groundTruthCount
{
  return self->_groundTruthCount;
}

- (int)mediaEntityCount
{
  return self->_mediaEntityCount;
}

@end

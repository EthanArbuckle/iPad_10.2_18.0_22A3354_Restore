@implementation MHSchemaMHStatisticDistributionInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNum:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_num = a3;
}

- (BOOL)hasNum
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNum:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNum
{
  -[MHSchemaMHStatisticDistributionInfo setNum:](self, "setNum:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setMax:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_max = a3;
}

- (BOOL)hasMax
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMax:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMax
{
  -[MHSchemaMHStatisticDistributionInfo setMax:](self, "setMax:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setMin:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_min = a3;
}

- (BOOL)hasMin
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMin
{
  -[MHSchemaMHStatisticDistributionInfo setMin:](self, "setMin:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setAvg:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_avg = a3;
}

- (BOOL)hasAvg
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAvg:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAvg
{
  -[MHSchemaMHStatisticDistributionInfo setAvg:](self, "setAvg:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setMedian:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_median = a3;
}

- (BOOL)hasMedian
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasMedian:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteMedian
{
  -[MHSchemaMHStatisticDistributionInfo setMedian:](self, "setMedian:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setP95:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_p95 = a3;
}

- (BOOL)hasP95
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasP95:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteP95
{
  -[MHSchemaMHStatisticDistributionInfo setP95:](self, "setP95:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setStd:(float)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_std = a3;
}

- (BOOL)hasStd
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasStd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteStd
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHStatisticDistributionInfo setStd:](self, "setStd:", v2);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (void)setWarmup:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_warmup = a3;
}

- (BOOL)hasWarmup
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasWarmup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (void)deleteWarmup
{
  -[MHSchemaMHStatisticDistributionInfo setWarmup:](self, "setWarmup:", 0);
  *(_BYTE *)&self->_has &= ~0x80u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHStatisticDistributionInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    PBDataWriterWriteFloatField();
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    PBDataWriterWriteUint64Field();
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $00A31DFE5968C3EA491D65367FFC8698 has;
  unsigned int v6;
  unsigned int num;
  int v8;
  unint64_t max;
  int v10;
  unint64_t min;
  int v12;
  unint64_t avg;
  int v14;
  unint64_t median;
  int v16;
  unint64_t p95;
  int v18;
  float std;
  float v20;
  unint64_t warmup;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  has = self->_has;
  v6 = v4[72];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_34;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    num = self->_num;
    if (num != objc_msgSend(v4, "num"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[72];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_34;
  if (v8)
  {
    max = self->_max;
    if (max != objc_msgSend(v4, "max"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[72];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_34;
  if (v10)
  {
    min = self->_min;
    if (min != objc_msgSend(v4, "min"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[72];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_34;
  if (v12)
  {
    avg = self->_avg;
    if (avg != objc_msgSend(v4, "avg"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[72];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_34;
  if (v14)
  {
    median = self->_median;
    if (median != objc_msgSend(v4, "median"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[72];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_34;
  if (v16)
  {
    p95 = self->_p95;
    if (p95 != objc_msgSend(v4, "p95"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[72];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_34;
  if (v18)
  {
    std = self->_std;
    objc_msgSend(v4, "std");
    if (std == v20)
    {
      has = self->_has;
      v6 = v4[72];
      goto LABEL_30;
    }
LABEL_34:
    v22 = 0;
    goto LABEL_35;
  }
LABEL_30:
  if (((v6 ^ *(_DWORD *)&has) & 0x80) != 0)
    goto LABEL_34;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    warmup = self->_warmup;
    if (warmup != objc_msgSend(v4, "warmup"))
      goto LABEL_34;
  }
  v22 = 1;
LABEL_35:

  return v22;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  float std;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_num;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_max;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761u * self->_min;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761u * self->_avg;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761u * self->_median;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_17:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_18:
    v14 = 0;
    goto LABEL_21;
  }
LABEL_16:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_17;
LABEL_7:
  v9 = 2654435761u * self->_p95;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_18;
LABEL_8:
  std = self->_std;
  v11 = std;
  if (std < 0.0)
    v11 = -std;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_21:
  if (has < 0)
    v15 = 2654435761u * self->_warmup;
  else
    v15 = 0;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo avg](self, "avg"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("avg"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo max](self, "max"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("max"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo median](self, "median"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("median"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo min](self, "min"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("min"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHStatisticDistributionInfo num](self, "num"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("num"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHStatisticDistributionInfo std](self, "std");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("std"));

    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo warmup](self, "warmup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("warmup"));

    goto LABEL_9;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo p95](self, "p95"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("p95"));

  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
LABEL_9:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHStatisticDistributionInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHStatisticDistributionInfo)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHStatisticDistributionInfo *v5;
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
    self = -[MHSchemaMHStatisticDistributionInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHStatisticDistributionInfo)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHStatisticDistributionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MHSchemaMHStatisticDistributionInfo *v14;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MHSchemaMHStatisticDistributionInfo;
  v5 = -[MHSchemaMHStatisticDistributionInfo init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("num"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHStatisticDistributionInfo setNum:](v5, "setNum:", objc_msgSend(v6, "unsignedIntValue"));
    v16 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("max"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHStatisticDistributionInfo setMax:](v5, "setMax:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("min"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHStatisticDistributionInfo setMin:](v5, "setMin:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("avg"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHStatisticDistributionInfo setAvg:](v5, "setAvg:", objc_msgSend(v9, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("median"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHStatisticDistributionInfo setMedian:](v5, "setMedian:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p95"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHStatisticDistributionInfo setP95:](v5, "setP95:", objc_msgSend(v11, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("std"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[MHSchemaMHStatisticDistributionInfo setStd:](v5, "setStd:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("warmup"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHStatisticDistributionInfo setWarmup:](v5, "setWarmup:", objc_msgSend(v13, "unsignedLongLongValue"));
    v14 = v5;

  }
  return v5;
}

- (unsigned)num
{
  return self->_num;
}

- (unint64_t)max
{
  return self->_max;
}

- (unint64_t)min
{
  return self->_min;
}

- (unint64_t)avg
{
  return self->_avg;
}

- (unint64_t)median
{
  return self->_median;
}

- (unint64_t)p95
{
  return self->_p95;
}

- (float)std
{
  return self->_std;
}

- (unint64_t)warmup
{
  return self->_warmup;
}

@end

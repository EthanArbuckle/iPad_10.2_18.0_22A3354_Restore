@implementation MHSchemaMHTrailingPacketLatencyInfo

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
  -[MHSchemaMHTrailingPacketLatencyInfo setNum:](self, "setNum:", 0);
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
  -[MHSchemaMHTrailingPacketLatencyInfo setMax:](self, "setMax:", 0);
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
  -[MHSchemaMHTrailingPacketLatencyInfo setMin:](self, "setMin:", 0);
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
  -[MHSchemaMHTrailingPacketLatencyInfo setAvg:](self, "setAvg:", 0);
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
  -[MHSchemaMHTrailingPacketLatencyInfo setMedian:](self, "setMedian:", 0);
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
  -[MHSchemaMHTrailingPacketLatencyInfo setP95:](self, "setP95:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setStd:(unint64_t)a3
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
  -[MHSchemaMHTrailingPacketLatencyInfo setStd:](self, "setStd:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHTrailingPacketLatencyInfoReadFrom(self, (uint64_t)a3);
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
LABEL_15:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteUint64Field();
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $38036CCCB73BCD28FE68E1294AD2D0E3 has;
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
  unint64_t std;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  has = self->_has;
  v6 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    num = self->_num;
    if (num != objc_msgSend(v4, "num"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[64];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_30;
  if (v8)
  {
    max = self->_max;
    if (max != objc_msgSend(v4, "max"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[64];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_30;
  if (v10)
  {
    min = self->_min;
    if (min != objc_msgSend(v4, "min"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[64];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_30;
  if (v12)
  {
    avg = self->_avg;
    if (avg != objc_msgSend(v4, "avg"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[64];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_30;
  if (v14)
  {
    median = self->_median;
    if (median != objc_msgSend(v4, "median"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[64];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_30;
  if (v16)
  {
    p95 = self->_p95;
    if (p95 == objc_msgSend(v4, "p95"))
    {
      has = self->_has;
      v6 = v4[64];
      goto LABEL_26;
    }
LABEL_30:
    v20 = 0;
    goto LABEL_31;
  }
LABEL_26:
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_30;
  if (v18)
  {
    std = self->_std;
    if (std != objc_msgSend(v4, "std"))
      goto LABEL_30;
  }
  v20 = 1;
LABEL_31:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_num;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_max;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_min;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761u * self->_avg;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761u * self->_median;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761u * self->_p95;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761u * self->_std;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo avg](self, "avg"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("avg"));

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo max](self, "max"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("max"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo median](self, "median"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("median"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo min](self, "min"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("min"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo p95](self, "p95"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("p95"));

    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHTrailingPacketLatencyInfo num](self, "num"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("num"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo std](self, "std"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("std"));

  }
LABEL_9:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHTrailingPacketLatencyInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHTrailingPacketLatencyInfo)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHTrailingPacketLatencyInfo *v5;
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
    self = -[MHSchemaMHTrailingPacketLatencyInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHTrailingPacketLatencyInfo)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHTrailingPacketLatencyInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MHSchemaMHTrailingPacketLatencyInfo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MHSchemaMHTrailingPacketLatencyInfo;
  v5 = -[MHSchemaMHTrailingPacketLatencyInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("num"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHTrailingPacketLatencyInfo setNum:](v5, "setNum:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("max"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHTrailingPacketLatencyInfo setMax:](v5, "setMax:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("min"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHTrailingPacketLatencyInfo setMin:](v5, "setMin:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("avg"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHTrailingPacketLatencyInfo setAvg:](v5, "setAvg:", objc_msgSend(v9, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("median"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHTrailingPacketLatencyInfo setMedian:](v5, "setMedian:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p95"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHTrailingPacketLatencyInfo setP95:](v5, "setP95:", objc_msgSend(v11, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("std"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHTrailingPacketLatencyInfo setStd:](v5, "setStd:", objc_msgSend(v12, "unsignedLongLongValue"));
    v13 = v5;

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

- (unint64_t)std
{
  return self->_std;
}

@end

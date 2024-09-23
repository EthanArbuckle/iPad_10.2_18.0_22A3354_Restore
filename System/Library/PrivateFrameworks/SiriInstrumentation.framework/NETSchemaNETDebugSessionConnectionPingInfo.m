@implementation NETSchemaNETDebugSessionConnectionPingInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setPingCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pingCount = a3;
}

- (BOOL)hasPingCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPingCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePingCount
{
  -[NETSchemaNETDebugSessionConnectionPingInfo setPingCount:](self, "setPingCount:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setMeanPingInMs:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_meanPingInMs = a3;
}

- (BOOL)hasMeanPingInMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMeanPingInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMeanPingInMs
{
  -[NETSchemaNETDebugSessionConnectionPingInfo setMeanPingInMs:](self, "setMeanPingInMs:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setUnacknowledgedPingCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_unacknowledgedPingCount = a3;
}

- (BOOL)hasUnacknowledgedPingCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasUnacknowledgedPingCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteUnacknowledgedPingCount
{
  -[NETSchemaNETDebugSessionConnectionPingInfo setUnacknowledgedPingCount:](self, "setUnacknowledgedPingCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugSessionConnectionPingInfoReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $A576B0B9FB53D4C7D76E674710174D20 has;
  unsigned int v6;
  unsigned int pingCount;
  int v8;
  double meanPingInMs;
  double v10;
  int v11;
  unsigned int unacknowledgedPingCount;
  BOOL v13;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    pingCount = self->_pingCount;
    if (pingCount != objc_msgSend(v4, "pingCount"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[28];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    meanPingInMs = self->_meanPingInMs;
    objc_msgSend(v4, "meanPingInMs");
    if (meanPingInMs == v10)
    {
      has = self->_has;
      v6 = v4[28];
      goto LABEL_10;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v11)
  {
    unacknowledgedPingCount = self->_unacknowledgedPingCount;
    if (unacknowledgedPingCount != objc_msgSend(v4, "unacknowledgedPingCount"))
      goto LABEL_14;
  }
  v13 = 1;
LABEL_15:

  return v13;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double meanPingInMs;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_pingCount;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  meanPingInMs = self->_meanPingInMs;
  v6 = -meanPingInMs;
  if (meanPingInMs >= 0.0)
    v6 = self->_meanPingInMs;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0)
    v10 = 2654435761 * self->_unacknowledgedPingCount;
  else
    v10 = 0;
  return v9 ^ v4 ^ v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugSessionConnectionPingInfo pingCount](self, "pingCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pingCount"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[NETSchemaNETDebugSessionConnectionPingInfo meanPingInMs](self, "meanPingInMs");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("meanPingInMs"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugSessionConnectionPingInfo unacknowledgedPingCount](self, "unacknowledgedPingCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("unacknowledgedPingCount"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETDebugSessionConnectionPingInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETDebugSessionConnectionPingInfo)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETDebugSessionConnectionPingInfo *v5;
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
    self = -[NETSchemaNETDebugSessionConnectionPingInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETDebugSessionConnectionPingInfo)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETDebugSessionConnectionPingInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  NETSchemaNETDebugSessionConnectionPingInfo *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NETSchemaNETDebugSessionConnectionPingInfo;
  v5 = -[NETSchemaNETDebugSessionConnectionPingInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pingCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugSessionConnectionPingInfo setPingCount:](v5, "setPingCount:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("meanPingInMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[NETSchemaNETDebugSessionConnectionPingInfo setMeanPingInMs:](v5, "setMeanPingInMs:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unacknowledgedPingCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugSessionConnectionPingInfo setUnacknowledgedPingCount:](v5, "setUnacknowledgedPingCount:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (unsigned)pingCount
{
  return self->_pingCount;
}

- (double)meanPingInMs
{
  return self->_meanPingInMs;
}

- (unsigned)unacknowledgedPingCount
{
  return self->_unacknowledgedPingCount;
}

@end

@implementation NETSchemaNETDebugSessionConnectionNetwork

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setWiFiPhyMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_wiFiPhyMode = a3;
}

- (BOOL)hasWiFiPhyMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasWiFiPhyMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteWiFiPhyMode
{
  -[NETSchemaNETDebugSessionConnectionNetwork setWiFiPhyMode:](self, "setWiFiPhyMode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSignalStrengthBars:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_signalStrengthBars = a3;
}

- (BOOL)hasSignalStrengthBars
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSignalStrengthBars:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSignalStrengthBars
{
  -[NETSchemaNETDebugSessionConnectionNetwork setSignalStrengthBars:](self, "setSignalStrengthBars:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setOpenTimeInMs:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_openTimeInMs = a3;
}

- (BOOL)hasOpenTimeInMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasOpenTimeInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteOpenTimeInMs
{
  -[NETSchemaNETDebugSessionConnectionNetwork setOpenTimeInMs:](self, "setOpenTimeInMs:", 0.0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setConnectedSubflowCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_connectedSubflowCount = a3;
}

- (BOOL)hasConnectedSubflowCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasConnectedSubflowCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteConnectedSubflowCount
{
  -[NETSchemaNETDebugSessionConnectionNetwork setConnectedSubflowCount:](self, "setConnectedSubflowCount:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugSessionConnectionNetworkReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $8C72446B461DADAEF452026161586949 has;
  unsigned int v6;
  int wiFiPhyMode;
  int v8;
  double signalStrengthBars;
  double v10;
  int v11;
  double openTimeInMs;
  double v13;
  int v14;
  unsigned int connectedSubflowCount;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[36];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    wiFiPhyMode = self->_wiFiPhyMode;
    if (wiFiPhyMode != objc_msgSend(v4, "wiFiPhyMode"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[36];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    signalStrengthBars = self->_signalStrengthBars;
    objc_msgSend(v4, "signalStrengthBars");
    if (signalStrengthBars != v10)
      goto LABEL_18;
    has = self->_has;
    v6 = v4[36];
  }
  v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v11)
  {
    openTimeInMs = self->_openTimeInMs;
    objc_msgSend(v4, "openTimeInMs");
    if (openTimeInMs == v13)
    {
      has = self->_has;
      v6 = v4[36];
      goto LABEL_14;
    }
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v14 = (*(unsigned int *)&has >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v14)
  {
    connectedSubflowCount = self->_connectedSubflowCount;
    if (connectedSubflowCount != objc_msgSend(v4, "connectedSubflowCount"))
      goto LABEL_18;
  }
  v16 = 1;
LABEL_19:

  return v16;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double signalStrengthBars;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double openTimeInMs;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_wiFiPhyMode;
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
  signalStrengthBars = self->_signalStrengthBars;
  v6 = -signalStrengthBars;
  if (signalStrengthBars >= 0.0)
    v6 = self->_signalStrengthBars;
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
  {
    openTimeInMs = self->_openTimeInMs;
    v12 = -openTimeInMs;
    if (openTimeInMs >= 0.0)
      v12 = self->_openTimeInMs;
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
  if ((has & 8) != 0)
    v15 = 2654435761 * self->_connectedSubflowCount;
  else
    v15 = 0;
  return v9 ^ v4 ^ v10 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugSessionConnectionNetwork connectedSubflowCount](self, "connectedSubflowCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("connectedSubflowCount"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_8:
      v8 = (void *)MEMORY[0x1E0CB37E8];
      -[NETSchemaNETDebugSessionConnectionNetwork signalStrengthBars](self, "signalStrengthBars");
      objc_msgSend(v8, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("signalStrengthBars"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_13;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[NETSchemaNETDebugSessionConnectionNetwork openTimeInMs](self, "openTimeInMs");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("openTimeInMs"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_8;
LABEL_4:
  if ((has & 1) == 0)
    goto LABEL_13;
LABEL_9:
  v10 = -[NETSchemaNETDebugSessionConnectionNetwork wiFiPhyMode](self, "wiFiPhyMode") - 1;
  if (v10 > 8)
    v11 = CFSTR("NETPHYMODE_UNKNOWN");
  else
    v11 = off_1E56316A8[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("wiFiPhyMode"));
LABEL_13:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETDebugSessionConnectionNetwork dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETDebugSessionConnectionNetwork)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETDebugSessionConnectionNetwork *v5;
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
    self = -[NETSchemaNETDebugSessionConnectionNetwork initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETDebugSessionConnectionNetwork)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETDebugSessionConnectionNetwork *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NETSchemaNETDebugSessionConnectionNetwork *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NETSchemaNETDebugSessionConnectionNetwork;
  v5 = -[NETSchemaNETDebugSessionConnectionNetwork init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wiFiPhyMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugSessionConnectionNetwork setWiFiPhyMode:](v5, "setWiFiPhyMode:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signalStrengthBars"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[NETSchemaNETDebugSessionConnectionNetwork setSignalStrengthBars:](v5, "setSignalStrengthBars:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openTimeInMs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[NETSchemaNETDebugSessionConnectionNetwork setOpenTimeInMs:](v5, "setOpenTimeInMs:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectedSubflowCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugSessionConnectionNetwork setConnectedSubflowCount:](v5, "setConnectedSubflowCount:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (int)wiFiPhyMode
{
  return self->_wiFiPhyMode;
}

- (double)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (double)openTimeInMs
{
  return self->_openTimeInMs;
}

- (unsigned)connectedSubflowCount
{
  return self->_connectedSubflowCount;
}

@end

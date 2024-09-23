@implementation RTSSchemaRTSAccelerationData

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setXAcceleration:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_xAcceleration = a3;
}

- (BOOL)hasXAcceleration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasXAcceleration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteXAcceleration
{
  -[RTSSchemaRTSAccelerationData setXAcceleration:](self, "setXAcceleration:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setYAcceleration:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_yAcceleration = a3;
}

- (BOOL)hasYAcceleration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasYAcceleration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteYAcceleration
{
  -[RTSSchemaRTSAccelerationData setYAcceleration:](self, "setYAcceleration:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setZAcceleration:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_zAcceleration = a3;
}

- (BOOL)hasZAcceleration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasZAcceleration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteZAcceleration
{
  -[RTSSchemaRTSAccelerationData setZAcceleration:](self, "setZAcceleration:", 0.0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return RTSSchemaRTSAccelerationDataReadFrom(self, (uint64_t)a3);
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
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $E4F86EA8EFB2104F2CA202C88427587A has;
  unsigned int v6;
  double xAcceleration;
  double v8;
  int v9;
  double yAcceleration;
  double v11;
  int v12;
  double zAcceleration;
  double v14;
  BOOL v15;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_13;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    xAcceleration = self->_xAcceleration;
    objc_msgSend(v4, "xAcceleration");
    if (xAcceleration != v8)
      goto LABEL_13;
    has = self->_has;
    v6 = v4[32];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      yAcceleration = self->_yAcceleration;
      objc_msgSend(v4, "yAcceleration");
      if (yAcceleration != v11)
        goto LABEL_13;
      has = self->_has;
      v6 = v4[32];
    }
    v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (!v12 || (zAcceleration = self->_zAcceleration, objc_msgSend(v4, "zAcceleration"), zAcceleration == v14))
      {
        v15 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  v15 = 0;
LABEL_14:

  return v15;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double xAcceleration;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double yAcceleration;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double zAcceleration;
  double v16;
  long double v17;
  double v18;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    xAcceleration = self->_xAcceleration;
    v6 = -xAcceleration;
    if (xAcceleration >= 0.0)
      v6 = self->_xAcceleration;
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
  if ((has & 2) != 0)
  {
    yAcceleration = self->_yAcceleration;
    v11 = -yAcceleration;
    if (yAcceleration >= 0.0)
      v11 = self->_yAcceleration;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 4) != 0)
  {
    zAcceleration = self->_zAcceleration;
    v16 = -zAcceleration;
    if (zAcceleration >= 0.0)
      v16 = self->_zAcceleration;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  return v9 ^ v4 ^ v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[RTSSchemaRTSAccelerationData yAcceleration](self, "yAcceleration");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("yAcceleration"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[RTSSchemaRTSAccelerationData xAcceleration](self, "xAcceleration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("xAcceleration"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[RTSSchemaRTSAccelerationData zAcceleration](self, "zAcceleration");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("zAcceleration"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RTSSchemaRTSAccelerationData dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RTSSchemaRTSAccelerationData)initWithJSON:(id)a3
{
  void *v4;
  RTSSchemaRTSAccelerationData *v5;
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
    self = -[RTSSchemaRTSAccelerationData initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RTSSchemaRTSAccelerationData)initWithDictionary:(id)a3
{
  id v4;
  RTSSchemaRTSAccelerationData *v5;
  void *v6;
  void *v7;
  void *v8;
  RTSSchemaRTSAccelerationData *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTSSchemaRTSAccelerationData;
  v5 = -[RTSSchemaRTSAccelerationData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xAcceleration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[RTSSchemaRTSAccelerationData setXAcceleration:](v5, "setXAcceleration:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("yAcceleration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[RTSSchemaRTSAccelerationData setYAcceleration:](v5, "setYAcceleration:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zAcceleration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[RTSSchemaRTSAccelerationData setZAcceleration:](v5, "setZAcceleration:");
    }
    v9 = v5;

  }
  return v5;
}

- (double)xAcceleration
{
  return self->_xAcceleration;
}

- (double)yAcceleration
{
  return self->_yAcceleration;
}

- (double)zAcceleration
{
  return self->_zAcceleration;
}

@end

@implementation SISchemaLocation

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setLatitude:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (BOOL)hasLatitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteLatitude
{
  double v2;

  LODWORD(v2) = 0;
  -[SISchemaLocation setLatitude:](self, "setLatitude:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setLongitude:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_longitude = a3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteLongitude
{
  double v2;

  LODWORD(v2) = 0;
  -[SISchemaLocation setLongitude:](self, "setLongitude:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setHorizontalAccuracyInMeters:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_horizontalAccuracyInMeters = a3;
}

- (BOOL)hasHorizontalAccuracyInMeters
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHorizontalAccuracyInMeters:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteHorizontalAccuracyInMeters
{
  double v2;

  LODWORD(v2) = 0;
  -[SISchemaLocation setHorizontalAccuracyInMeters:](self, "setHorizontalAccuracyInMeters:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return SISchemaLocationReadFrom(self, (uint64_t)a3, v3);
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
    PBDataWriterWriteFloatField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $4147E10AC24541A3F7ABE106D04B30BF has;
  unsigned int v6;
  float latitude;
  float v8;
  int v9;
  float longitude;
  float v11;
  int v12;
  float horizontalAccuracyInMeters;
  float v14;
  BOOL v15;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_13;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    latitude = self->_latitude;
    objc_msgSend(v4, "latitude");
    if (latitude != v8)
      goto LABEL_13;
    has = self->_has;
    v6 = v4[20];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      longitude = self->_longitude;
      objc_msgSend(v4, "longitude");
      if (longitude != v11)
        goto LABEL_13;
      has = self->_has;
      v6 = v4[20];
    }
    v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (!v12
        || (horizontalAccuracyInMeters = self->_horizontalAccuracyInMeters,
            objc_msgSend(v4, "horizontalAccuracyInMeters"),
            horizontalAccuracyInMeters == v14))
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
  float latitude;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float longitude;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float horizontalAccuracyInMeters;
  double v16;
  long double v17;
  double v18;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    latitude = self->_latitude;
    v6 = latitude;
    if (latitude < 0.0)
      v6 = -latitude;
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
    longitude = self->_longitude;
    v11 = longitude;
    if (longitude < 0.0)
      v11 = -longitude;
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
    horizontalAccuracyInMeters = self->_horizontalAccuracyInMeters;
    v16 = horizontalAccuracyInMeters;
    if (horizontalAccuracyInMeters < 0.0)
      v16 = -horizontalAccuracyInMeters;
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
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[SISchemaLocation latitude](self, "latitude");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("latitude"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SISchemaLocation horizontalAccuracyInMeters](self, "horizontalAccuracyInMeters");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("horizontalAccuracyInMeters"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[SISchemaLocation longitude](self, "longitude");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("longitude"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaLocation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaLocation)initWithJSON:(id)a3
{
  void *v4;
  SISchemaLocation *v5;
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
    self = -[SISchemaLocation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaLocation)initWithDictionary:(id)a3
{
  id v4;
  SISchemaLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaLocation *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaLocation;
  v5 = -[SISchemaLocation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latitude"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[SISchemaLocation setLatitude:](v5, "setLatitude:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longitude"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[SISchemaLocation setLongitude:](v5, "setLongitude:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("horizontalAccuracyInMeters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[SISchemaLocation setHorizontalAccuracyInMeters:](v5, "setHorizontalAccuracyInMeters:");
    }
    v9 = v5;

  }
  return v5;
}

- (float)latitude
{
  return self->_latitude;
}

- (float)longitude
{
  return self->_longitude;
}

- (float)horizontalAccuracyInMeters
{
  return self->_horizontalAccuracyInMeters;
}

@end

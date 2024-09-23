@implementation SISchemaDeviceDynamicContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SISchemaDeviceDynamicContext;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDeviceDynamicContext location](self, "location", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaDeviceDynamicContext deleteLocation](self, "deleteLocation");
  return v5;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)deleteLocation
{
  -[SISchemaDeviceDynamicContext setLocation:](self, "setLocation:", 0);
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)deleteCountryCode
{
  -[SISchemaDeviceDynamicContext setCountryCode:](self, "setCountryCode:", 0);
}

- (void)setTimeIntervalSince1970:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeIntervalSince1970 = a3;
}

- (BOOL)hasTimeIntervalSince1970
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTimeIntervalSince1970:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTimeIntervalSince1970
{
  -[SISchemaDeviceDynamicContext setTimeIntervalSince1970:](self, "setTimeIntervalSince1970:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDeviceDynamicContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaDeviceDynamicContext location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaDeviceDynamicContext location](self, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaDeviceDynamicContext countryCode](self, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v7 = v8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  double timeIntervalSince1970;
  double v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SISchemaDeviceDynamicContext location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaDeviceDynamicContext location](self, "location");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaDeviceDynamicContext location](self, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaDeviceDynamicContext countryCode](self, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[SISchemaDeviceDynamicContext countryCode](self, "countryCode");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaDeviceDynamicContext countryCode](self, "countryCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (timeIntervalSince1970 = self->_timeIntervalSince1970,
          objc_msgSend(v4, "timeIntervalSince1970"),
          timeIntervalSince1970 == v20))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  double timeIntervalSince1970;
  double v7;
  long double v8;
  double v9;

  v3 = -[SISchemaLocation hash](self->_location, "hash");
  v4 = -[NSString hash](self->_countryCode, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timeIntervalSince1970 = self->_timeIntervalSince1970;
    v7 = -timeIntervalSince1970;
    if (timeIntervalSince1970 >= 0.0)
      v7 = self->_timeIntervalSince1970;
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
  return v4 ^ v3 ^ v5;
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
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_countryCode)
  {
    -[SISchemaDeviceDynamicContext countryCode](self, "countryCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("countryCode"));

  }
  if (self->_location)
  {
    -[SISchemaDeviceDynamicContext location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("location"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("location"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[SISchemaDeviceDynamicContext timeIntervalSince1970](self, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("timeIntervalSince1970"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaDeviceDynamicContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaDeviceDynamicContext)initWithJSON:(id)a3
{
  void *v4;
  SISchemaDeviceDynamicContext *v5;
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
    self = -[SISchemaDeviceDynamicContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaDeviceDynamicContext)initWithDictionary:(id)a3
{
  id v4;
  SISchemaDeviceDynamicContext *v5;
  void *v6;
  SISchemaLocation *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaDeviceDynamicContext *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaDeviceDynamicContext;
  v5 = -[SISchemaDeviceDynamicContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaLocation initWithDictionary:]([SISchemaLocation alloc], "initWithDictionary:", v6);
      -[SISchemaDeviceDynamicContext setLocation:](v5, "setLocation:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaDeviceDynamicContext setCountryCode:](v5, "setCountryCode:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeIntervalSince1970"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      -[SISchemaDeviceDynamicContext setTimeIntervalSince1970:](v5, "setTimeIntervalSince1970:");
    }
    v11 = v5;

  }
  return v5;
}

- (SISchemaLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (void)setHasLocation:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCountryCode:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end

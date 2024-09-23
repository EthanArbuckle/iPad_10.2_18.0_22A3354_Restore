@implementation _SFPBRFOptionalFloat

- (_SFPBRFOptionalFloat)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFOptionalFloat *v5;
  void *v6;
  void *v7;
  _SFPBRFOptionalFloat *v8;

  v4 = a3;
  v5 = -[_SFPBRFOptionalFloat init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      -[_SFPBRFOptionalFloat setValue:](v5, "setValue:");

    }
    v8 = v5;
  }

  return v5;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBRFOptionalFloatReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  id v5;

  v5 = a3;
  -[_SFPBRFOptionalFloat value](self, "value");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float value;
  float v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    value = self->_value;
    objc_msgSend(v4, "value");
    v7 = value == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  float value;
  BOOL v3;
  double v4;
  double v5;
  long double v6;
  double v7;
  unint64_t result;

  value = self->_value;
  v3 = value < 0.0;
  if (value == 0.0)
    return 0;
  v4 = value;
  v5 = -v4;
  if (!v3)
    v5 = v4;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  result = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      result += (unint64_t)v7;
  }
  else
  {
    result -= (unint64_t)fabs(v7);
  }
  return result;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_value != 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFOptionalFloat value](self, "value");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("value"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFOptionalFloat dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFOptionalFloat)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFOptionalFloat *v5;
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
    self = -[_SFPBRFOptionalFloat initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFOptionalFloat)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFOptionalFloat *v5;
  void *v6;
  _SFPBRFOptionalFloat *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBRFOptionalFloat;
  v5 = -[_SFPBRFOptionalFloat init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[_SFPBRFOptionalFloat setValue:](v5, "setValue:");
    }
    v7 = v5;

  }
  return v5;
}

- (float)value
{
  return self->_value;
}

@end

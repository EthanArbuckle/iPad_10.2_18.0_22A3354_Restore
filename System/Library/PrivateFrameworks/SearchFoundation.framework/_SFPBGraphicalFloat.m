@implementation _SFPBGraphicalFloat

- (_SFPBGraphicalFloat)initWithCGFloat:(double)a3
{
  _SFPBGraphicalFloat *v4;
  _SFPBGraphicalFloat *v5;
  _SFPBGraphicalFloat *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFPBGraphicalFloat;
  v4 = -[_SFPBGraphicalFloat init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[_SFPBGraphicalFloat setDoubleValue:](v4, "setDoubleValue:", a3);
    v6 = v5;
  }

  return v5;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBGraphicalFloatReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[_SFPBGraphicalFloat doubleValue](self, "doubleValue");
  if (v4 != 0.0)
    PBDataWriterWriteDoubleField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double doubleValue;
  double v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    doubleValue = self->_doubleValue;
    objc_msgSend(v4, "doubleValue");
    v7 = doubleValue == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  double doubleValue;
  double v3;
  long double v4;
  double v5;
  unint64_t result;

  doubleValue = self->_doubleValue;
  if (doubleValue == 0.0)
    return 0;
  v3 = -doubleValue;
  if (doubleValue >= 0.0)
    v3 = self->_doubleValue;
  v4 = floor(v3 + 0.5);
  v5 = (v3 - v4) * 1.84467441e19;
  result = 2654435761u * (unint64_t)fmod(v4, 1.84467441e19);
  if (v5 >= 0.0)
  {
    if (v5 > 0.0)
      result += (unint64_t)v5;
  }
  else
  {
    result -= (unint64_t)fabs(v5);
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
  if (self->_doubleValue != 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBGraphicalFloat doubleValue](self, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("doubleValue"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBGraphicalFloat dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBGraphicalFloat)initWithJSON:(id)a3
{
  void *v4;
  _SFPBGraphicalFloat *v5;
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
    self = -[_SFPBGraphicalFloat initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBGraphicalFloat)initWithDictionary:(id)a3
{
  id v4;
  _SFPBGraphicalFloat *v5;
  void *v6;
  _SFPBGraphicalFloat *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBGraphicalFloat;
  v5 = -[_SFPBGraphicalFloat init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doubleValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[_SFPBGraphicalFloat setDoubleValue:](v5, "setDoubleValue:");
    }
    v7 = v5;

  }
  return v5;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

@end

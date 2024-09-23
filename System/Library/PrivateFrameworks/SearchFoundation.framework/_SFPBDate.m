@implementation _SFPBDate

- (_SFPBDate)initWithNSDate:(id)a3
{
  id v4;
  _SFPBDate *v5;
  _SFPBDate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SFPBDate;
  v5 = -[_SFPBDate init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "timeIntervalSince1970");
    -[_SFPBDate setSecondsSince1970:](v5, "setSecondsSince1970:");
    v6 = v5;
  }

  return v5;
}

- (void)setSecondsSince1970:(double)a3
{
  self->_secondsSince1970 = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDateReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[_SFPBDate secondsSince1970](self, "secondsSince1970");
  if (v4 != 0.0)
    PBDataWriterWriteDoubleField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double secondsSince1970;
  double v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    secondsSince1970 = self->_secondsSince1970;
    objc_msgSend(v4, "secondsSince1970");
    v7 = secondsSince1970 == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  double secondsSince1970;
  double v3;
  long double v4;
  double v5;
  unint64_t result;

  secondsSince1970 = self->_secondsSince1970;
  if (secondsSince1970 == 0.0)
    return 0;
  v3 = -secondsSince1970;
  if (secondsSince1970 >= 0.0)
    v3 = self->_secondsSince1970;
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
  if (self->_secondsSince1970 != 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBDate secondsSince1970](self, "secondsSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("secondsSince1970"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBDate dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBDate)initWithJSON:(id)a3
{
  void *v4;
  _SFPBDate *v5;
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
    self = -[_SFPBDate initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBDate)initWithDictionary:(id)a3
{
  id v4;
  _SFPBDate *v5;
  void *v6;
  _SFPBDate *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBDate;
  v5 = -[_SFPBDate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondsSince1970"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[_SFPBDate setSecondsSince1970:](v5, "setSecondsSince1970:");
    }
    v7 = v5;

  }
  return v5;
}

- (double)secondsSince1970
{
  return self->_secondsSince1970;
}

@end

@implementation _SFPBClockImage

- (_SFPBClockImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBClockImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBClockImage *v12;

  v4 = a3;
  v5 = -[_SFPBClockImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "hour");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "hour");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBClockImage setHour:](v5, "setHour:", objc_msgSend(v7, "intValue"));

    }
    objc_msgSend(v4, "minute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "minute");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBClockImage setMinute:](v5, "setMinute:", objc_msgSend(v9, "intValue"));

    }
    objc_msgSend(v4, "second");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "second");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBClockImage setSecond:](v5, "setSecond:", objc_msgSend(v11, "intValue"));

    }
    v12 = v5;
  }

  return v5;
}

- (void)setHour:(int)a3
{
  self->_hour = a3;
}

- (void)setMinute:(int)a3
{
  self->_minute = a3;
}

- (void)setSecond:(int)a3
{
  self->_second = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBClockImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_SFPBClockImage hour](self, "hour"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBClockImage minute](self, "minute"))
    PBDataWriterWriteInt32Field();
  v4 = -[_SFPBClockImage second](self, "second");
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int hour;
  int minute;
  int second;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (hour = self->_hour, hour == objc_msgSend(v4, "hour"))
    && (minute = self->_minute, minute == objc_msgSend(v4, "minute")))
  {
    second = self->_second;
    v8 = second == objc_msgSend(v4, "second");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return (2654435761 * self->_minute) ^ (2654435761 * self->_hour) ^ (2654435761 * self->_second);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_hour)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBClockImage hour](self, "hour"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hour"));

  }
  if (self->_minute)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBClockImage minute](self, "minute"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("minute"));

  }
  if (self->_second)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBClockImage second](self, "second"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("second"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBClockImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBClockImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBClockImage *v5;
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
    self = -[_SFPBClockImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBClockImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBClockImage *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBClockImage *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBClockImage;
  v5 = -[_SFPBClockImage init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hour"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBClockImage setHour:](v5, "setHour:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minute"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBClockImage setMinute:](v5, "setMinute:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("second"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBClockImage setSecond:](v5, "setSecond:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (int)hour
{
  return self->_hour;
}

- (int)minute
{
  return self->_minute;
}

- (int)second
{
  return self->_second;
}

@end

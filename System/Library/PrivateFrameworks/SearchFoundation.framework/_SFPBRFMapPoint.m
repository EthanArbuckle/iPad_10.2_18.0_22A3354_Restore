@implementation _SFPBRFMapPoint

- (_SFPBRFMapPoint)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFMapPoint *v5;
  _SFPBRFMapPoint *v6;

  v4 = a3;
  v5 = -[_SFPBRFMapPoint init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasX"))
    {
      objc_msgSend(v4, "x");
      -[_SFPBRFMapPoint setX:](v5, "setX:");
    }
    if (objc_msgSend(v4, "hasY"))
    {
      objc_msgSend(v4, "y");
      -[_SFPBRFMapPoint setY:](v5, "setY:");
    }
    v6 = v5;
  }

  return v5;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapPointReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  double v4;
  double v5;
  id v6;

  v6 = a3;
  -[_SFPBRFMapPoint x](self, "x");
  if (v4 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_SFPBRFMapPoint y](self, "y");
  if (v5 != 0.0)
    PBDataWriterWriteDoubleField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double x;
  double v6;
  BOOL v7;
  double y;
  double v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (x = self->_x, objc_msgSend(v4, "x"), x == v6))
  {
    y = self->_y;
    objc_msgSend(v4, "y");
    v7 = y == v9;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  double x;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  double y;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  x = self->_x;
  if (x == 0.0)
  {
    v7 = 0;
  }
  else
  {
    v4 = -x;
    if (x >= 0.0)
      v4 = self->_x;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0)
        v7 += (unint64_t)v6;
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  y = self->_y;
  if (y == 0.0)
  {
    v12 = 0;
  }
  else
  {
    v9 = -y;
    if (y >= 0.0)
      v9 = self->_y;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v12 += (unint64_t)v11;
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  return v12 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_x != 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFMapPoint x](self, "x");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("x"));

  }
  if (self->_y != 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFMapPoint y](self, "y");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("y"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFMapPoint dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFMapPoint)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFMapPoint *v5;
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
    self = -[_SFPBRFMapPoint initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFMapPoint)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFMapPoint *v5;
  void *v6;
  void *v7;
  _SFPBRFMapPoint *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBRFMapPoint;
  v5 = -[_SFPBRFMapPoint init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[_SFPBRFMapPoint setX:](v5, "setX:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[_SFPBRFMapPoint setY:](v5, "setY:");
    }
    v8 = v5;

  }
  return v5;
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

@end

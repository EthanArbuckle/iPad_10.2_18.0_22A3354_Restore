@implementation _SFPBStructuredLocation

- (_SFPBStructuredLocation)initWithFacade:(id)a3
{
  id v4;
  _SFPBStructuredLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBLatLng *v9;
  void *v10;
  _SFPBLatLng *v11;
  _SFPBStructuredLocation *v12;

  v4 = a3;
  v5 = -[_SFPBStructuredLocation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBStructuredLocation setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "geoLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBLatLng alloc];
      objc_msgSend(v4, "geoLocation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBLatLng initWithFacade:](v9, "initWithFacade:", v10);
      -[_SFPBStructuredLocation setGeoLocation:](v5, "setGeoLocation:", v11);

    }
    if (objc_msgSend(v4, "hasRadius"))
    {
      objc_msgSend(v4, "radius");
      -[_SFPBStructuredLocation setRadius:](v5, "setRadius:");
    }
    v12 = v5;
  }

  return v5;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setGeoLocation:(id)a3
{
  objc_storeStrong((id *)&self->_geoLocation, a3);
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBStructuredLocationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v8 = a3;
  -[_SFPBStructuredLocation title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBStructuredLocation geoLocation](self, "geoLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBStructuredLocation radius](self, "radius");
  v6 = v8;
  if (v7 != 0.0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  double radius;
  double v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBStructuredLocation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBStructuredLocation title](self, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBStructuredLocation title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBStructuredLocation geoLocation](self, "geoLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geoLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBStructuredLocation geoLocation](self, "geoLocation");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      radius = self->_radius;
      objc_msgSend(v4, "radius");
      v17 = radius == v20;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBStructuredLocation geoLocation](self, "geoLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geoLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double radius;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[_SFPBLatLng hash](self->_geoLocation, "hash");
  radius = self->_radius;
  if (radius == 0.0)
  {
    v9 = 0;
  }
  else
  {
    v6 = -radius;
    if (radius >= 0.0)
      v6 = self->_radius;
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
  }
  return v4 ^ v3 ^ v9;
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
  if (self->_geoLocation)
  {
    -[_SFPBStructuredLocation geoLocation](self, "geoLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("geoLocation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("geoLocation"));

    }
  }
  if (self->_radius != 0.0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBStructuredLocation radius](self, "radius");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("radius"));

  }
  if (self->_title)
  {
    -[_SFPBStructuredLocation title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBStructuredLocation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBStructuredLocation)initWithJSON:(id)a3
{
  void *v4;
  _SFPBStructuredLocation *v5;
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
    self = -[_SFPBStructuredLocation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBStructuredLocation)initWithDictionary:(id)a3
{
  id v4;
  _SFPBStructuredLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBLatLng *v9;
  void *v10;
  _SFPBStructuredLocation *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBStructuredLocation;
  v5 = -[_SFPBStructuredLocation init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBStructuredLocation setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("geoLocation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBLatLng initWithDictionary:]([_SFPBLatLng alloc], "initWithDictionary:", v8);
      -[_SFPBStructuredLocation setGeoLocation:](v5, "setGeoLocation:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("radius"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      -[_SFPBStructuredLocation setRadius:](v5, "setRadius:");
    }
    v11 = v5;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBLatLng)geoLocation
{
  return self->_geoLocation;
}

- (double)radius
{
  return self->_radius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoLocation, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

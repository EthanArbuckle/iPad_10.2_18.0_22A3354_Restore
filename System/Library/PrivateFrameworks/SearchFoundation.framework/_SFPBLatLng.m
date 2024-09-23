@implementation _SFPBLatLng

- (_SFPBLatLng)initWithFacade:(id)a3
{
  id v4;
  _SFPBLatLng *v5;
  _SFPBLatLng *v6;

  v4 = a3;
  v5 = -[_SFPBLatLng init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasLat"))
    {
      objc_msgSend(v4, "lat");
      -[_SFPBLatLng setLat:](v5, "setLat:");
    }
    if (objc_msgSend(v4, "hasLng"))
    {
      objc_msgSend(v4, "lng");
      -[_SFPBLatLng setLng:](v5, "setLng:");
    }
    v6 = v5;
  }

  return v5;
}

- (void)setLat:(double)a3
{
  self->_lat = a3;
}

- (void)setLng:(double)a3
{
  self->_lng = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBLatLngReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  double v4;
  double v5;
  id v6;

  v6 = a3;
  -[_SFPBLatLng lat](self, "lat");
  if (v4 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_SFPBLatLng lng](self, "lng");
  if (v5 != 0.0)
    PBDataWriterWriteDoubleField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double lat;
  double v6;
  BOOL v7;
  double lng;
  double v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (lat = self->_lat, objc_msgSend(v4, "lat"), lat == v6))
  {
    lng = self->_lng;
    objc_msgSend(v4, "lng");
    v7 = lng == v9;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  double lat;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  double lng;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  lat = self->_lat;
  if (lat == 0.0)
  {
    v7 = 0;
  }
  else
  {
    v4 = -lat;
    if (lat >= 0.0)
      v4 = self->_lat;
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
  lng = self->_lng;
  if (lng == 0.0)
  {
    v12 = 0;
  }
  else
  {
    v9 = -lng;
    if (lng >= 0.0)
      v9 = self->_lng;
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
  if (self->_lat != 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBLatLng lat](self, "lat");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lat"));

  }
  if (self->_lng != 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBLatLng lng](self, "lng");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("lng"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBLatLng dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBLatLng)initWithJSON:(id)a3
{
  void *v4;
  _SFPBLatLng *v5;
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
    self = -[_SFPBLatLng initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBLatLng)initWithDictionary:(id)a3
{
  id v4;
  _SFPBLatLng *v5;
  void *v6;
  void *v7;
  _SFPBLatLng *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBLatLng;
  v5 = -[_SFPBLatLng init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[_SFPBLatLng setLat:](v5, "setLat:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lng"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[_SFPBLatLng setLng:](v5, "setLng:");
    }
    v8 = v5;

  }
  return v5;
}

- (double)lat
{
  return self->_lat;
}

- (double)lng
{
  return self->_lng;
}

@end

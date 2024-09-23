@implementation _SFPBMapRegion

- (_SFPBMapRegion)initWithFacade:(id)a3
{
  id v4;
  _SFPBMapRegion *v5;
  _SFPBMapRegion *v6;

  v4 = a3;
  v5 = -[_SFPBMapRegion init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasSouthLat"))
    {
      objc_msgSend(v4, "southLat");
      -[_SFPBMapRegion setSouthLat:](v5, "setSouthLat:");
    }
    if (objc_msgSend(v4, "hasWestLng"))
    {
      objc_msgSend(v4, "westLng");
      -[_SFPBMapRegion setWestLng:](v5, "setWestLng:");
    }
    if (objc_msgSend(v4, "hasNorthLat"))
    {
      objc_msgSend(v4, "northLat");
      -[_SFPBMapRegion setNorthLat:](v5, "setNorthLat:");
    }
    if (objc_msgSend(v4, "hasEastLng"))
    {
      objc_msgSend(v4, "eastLng");
      -[_SFPBMapRegion setEastLng:](v5, "setEastLng:");
    }
    if (objc_msgSend(v4, "hasAltitudeInMeters"))
    {
      objc_msgSend(v4, "altitudeInMeters");
      -[_SFPBMapRegion setAltitudeInMeters:](v5, "setAltitudeInMeters:");
    }
    v6 = v5;
  }

  return v5;
}

- (void)setSouthLat:(double)a3
{
  self->_southLat = a3;
}

- (void)setWestLng:(double)a3
{
  self->_westLng = a3;
}

- (void)setNorthLat:(double)a3
{
  self->_northLat = a3;
}

- (void)setEastLng:(double)a3
{
  self->_eastLng = a3;
}

- (void)setAltitudeInMeters:(double)a3
{
  self->_altitudeInMeters = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMapRegionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  v10 = a3;
  -[_SFPBMapRegion southLat](self, "southLat");
  if (v4 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_SFPBMapRegion westLng](self, "westLng");
  if (v5 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_SFPBMapRegion northLat](self, "northLat");
  if (v6 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_SFPBMapRegion eastLng](self, "eastLng");
  if (v7 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_SFPBMapRegion altitudeInMeters](self, "altitudeInMeters");
  v8 = v10;
  if (v9 != 0.0)
  {
    PBDataWriterWriteDoubleField();
    v8 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double southLat;
  double v6;
  double westLng;
  double v8;
  double northLat;
  double v10;
  double eastLng;
  double v12;
  BOOL v13;
  double altitudeInMeters;
  double v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  southLat = self->_southLat;
  objc_msgSend(v4, "southLat");
  if (southLat != v6)
    goto LABEL_6;
  westLng = self->_westLng;
  objc_msgSend(v4, "westLng");
  if (westLng == v8
    && (northLat = self->_northLat, objc_msgSend(v4, "northLat"), northLat == v10)
    && (eastLng = self->_eastLng, objc_msgSend(v4, "eastLng"), eastLng == v12))
  {
    altitudeInMeters = self->_altitudeInMeters;
    objc_msgSend(v4, "altitudeInMeters");
    v13 = altitudeInMeters == v16;
  }
  else
  {
LABEL_6:
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  double southLat;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  double westLng;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  double northLat;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  double eastLng;
  double v19;
  long double v20;
  double v21;
  unint64_t v22;
  double altitudeInMeters;
  double v24;
  long double v25;
  double v26;
  unint64_t v27;

  southLat = self->_southLat;
  if (southLat == 0.0)
  {
    v7 = 0;
  }
  else
  {
    v4 = -southLat;
    if (southLat >= 0.0)
      v4 = self->_southLat;
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
  westLng = self->_westLng;
  if (westLng == 0.0)
  {
    v12 = 0;
  }
  else
  {
    v9 = -westLng;
    if (westLng >= 0.0)
      v9 = self->_westLng;
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
  northLat = self->_northLat;
  if (northLat == 0.0)
  {
    v17 = 0;
  }
  else
  {
    v14 = -northLat;
    if (northLat >= 0.0)
      v14 = self->_northLat;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v17 += (unint64_t)v16;
    }
    else
    {
      v17 -= (unint64_t)fabs(v16);
    }
  }
  eastLng = self->_eastLng;
  if (eastLng == 0.0)
  {
    v22 = 0;
  }
  else
  {
    v19 = -eastLng;
    if (eastLng >= 0.0)
      v19 = self->_eastLng;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v22 += (unint64_t)v21;
    }
    else
    {
      v22 -= (unint64_t)fabs(v21);
    }
  }
  altitudeInMeters = self->_altitudeInMeters;
  if (altitudeInMeters == 0.0)
  {
    v27 = 0;
  }
  else
  {
    v24 = -altitudeInMeters;
    if (altitudeInMeters >= 0.0)
      v24 = self->_altitudeInMeters;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v27 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v27 += (unint64_t)v26;
    }
    else
    {
      v27 -= (unint64_t)fabs(v26);
    }
  }
  return v12 ^ v7 ^ v17 ^ v22 ^ v27;
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
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_altitudeInMeters != 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBMapRegion altitudeInMeters](self, "altitudeInMeters");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("altitudeInMeters"));

  }
  if (self->_eastLng != 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBMapRegion eastLng](self, "eastLng");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("eastLng"));

  }
  if (self->_northLat != 0.0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBMapRegion northLat](self, "northLat");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("northLat"));

  }
  if (self->_southLat != 0.0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBMapRegion southLat](self, "southLat");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("southLat"));

  }
  if (self->_westLng != 0.0)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBMapRegion westLng](self, "westLng");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("westLng"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMapRegion dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBMapRegion)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMapRegion *v5;
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
    self = -[_SFPBMapRegion initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMapRegion)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMapRegion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBMapRegion *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBMapRegion;
  v5 = -[_SFPBMapRegion init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("southLat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[_SFPBMapRegion setSouthLat:](v5, "setSouthLat:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("westLng"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[_SFPBMapRegion setWestLng:](v5, "setWestLng:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("northLat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[_SFPBMapRegion setNorthLat:](v5, "setNorthLat:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eastLng"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[_SFPBMapRegion setEastLng:](v5, "setEastLng:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("altitudeInMeters"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      -[_SFPBMapRegion setAltitudeInMeters:](v5, "setAltitudeInMeters:");
    }
    v11 = v5;

  }
  return v5;
}

- (double)southLat
{
  return self->_southLat;
}

- (double)westLng
{
  return self->_westLng;
}

- (double)northLat
{
  return self->_northLat;
}

- (double)eastLng
{
  return self->_eastLng;
}

- (double)altitudeInMeters
{
  return self->_altitudeInMeters;
}

@end

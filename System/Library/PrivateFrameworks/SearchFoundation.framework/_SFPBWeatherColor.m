@implementation _SFPBWeatherColor

- (_SFPBWeatherColor)initWithFacade:(id)a3
{
  id v4;
  _SFPBWeatherColor *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBLatLng *v9;
  void *v10;
  _SFPBLatLng *v11;
  void *v12;
  _SFPBDate *v13;
  void *v14;
  _SFPBDate *v15;
  _SFPBWeatherColor *v16;

  v4 = a3;
  v5 = -[_SFPBWeatherColor init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "condition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "condition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWeatherColor setCondition:](v5, "setCondition:", v7);

    }
    objc_msgSend(v4, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBLatLng alloc];
      objc_msgSend(v4, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBLatLng initWithFacade:](v9, "initWithFacade:", v10);
      -[_SFPBWeatherColor setLocation:](v5, "setLocation:", v11);

    }
    objc_msgSend(v4, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBDate alloc];
      objc_msgSend(v4, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBDate initWithNSDate:](v13, "initWithNSDate:", v14);
      -[_SFPBWeatherColor setDate:](v5, "setDate:", v15);

    }
    if (objc_msgSend(v4, "hasCloudCover"))
    {
      objc_msgSend(v4, "cloudCover");
      -[_SFPBWeatherColor setCloudCover:](v5, "setCloudCover:");
    }
    if (objc_msgSend(v4, "hasCloudCoverLowAltPct"))
    {
      objc_msgSend(v4, "cloudCoverLowAltPct");
      -[_SFPBWeatherColor setCloudCoverLowAltPct:](v5, "setCloudCoverLowAltPct:");
    }
    if (objc_msgSend(v4, "hasCloudCoverMidAltPct"))
    {
      objc_msgSend(v4, "cloudCoverMidAltPct");
      -[_SFPBWeatherColor setCloudCoverMidAltPct:](v5, "setCloudCoverMidAltPct:");
    }
    if (objc_msgSend(v4, "hasCloudCoverHighAltPct"))
    {
      objc_msgSend(v4, "cloudCoverHighAltPct");
      -[_SFPBWeatherColor setCloudCoverHighAltPct:](v5, "setCloudCoverHighAltPct:");
    }
    v16 = v5;
  }

  return v5;
}

- (void)setCondition:(id)a3
{
  NSString *v4;
  NSString *condition;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  condition = self->_condition;
  self->_condition = v4;

}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void)setCloudCover:(double)a3
{
  self->_cloudCover = a3;
}

- (void)setCloudCoverLowAltPct:(double)a3
{
  self->_cloudCoverLowAltPct = a3;
}

- (void)setCloudCoverMidAltPct:(double)a3
{
  self->_cloudCoverMidAltPct = a3;
}

- (void)setCloudCoverHighAltPct:(double)a3
{
  self->_cloudCoverHighAltPct = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBWeatherColorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  v12 = a3;
  -[_SFPBWeatherColor condition](self, "condition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBWeatherColor location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBWeatherColor date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBWeatherColor cloudCover](self, "cloudCover");
  if (v7 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_SFPBWeatherColor cloudCoverLowAltPct](self, "cloudCoverLowAltPct");
  if (v8 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_SFPBWeatherColor cloudCoverMidAltPct](self, "cloudCoverMidAltPct");
  if (v9 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_SFPBWeatherColor cloudCoverHighAltPct](self, "cloudCoverHighAltPct");
  v10 = v12;
  if (v11 != 0.0)
  {
    PBDataWriterWriteDoubleField();
    v10 = v12;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  double cloudCover;
  double v25;
  double cloudCoverLowAltPct;
  double v27;
  double cloudCoverMidAltPct;
  double v29;
  double cloudCoverHighAltPct;
  double v31;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBWeatherColor condition](self, "condition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "condition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBWeatherColor condition](self, "condition");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBWeatherColor condition](self, "condition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "condition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBWeatherColor location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBWeatherColor location](self, "location");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBWeatherColor location](self, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBWeatherColor date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[_SFPBWeatherColor date](self, "date");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBWeatherColor date](self, "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  cloudCover = self->_cloudCover;
  objc_msgSend(v4, "cloudCover");
  if (cloudCover == v25)
  {
    cloudCoverLowAltPct = self->_cloudCoverLowAltPct;
    objc_msgSend(v4, "cloudCoverLowAltPct");
    if (cloudCoverLowAltPct == v27)
    {
      cloudCoverMidAltPct = self->_cloudCoverMidAltPct;
      objc_msgSend(v4, "cloudCoverMidAltPct");
      if (cloudCoverMidAltPct == v29)
      {
        cloudCoverHighAltPct = self->_cloudCoverHighAltPct;
        objc_msgSend(v4, "cloudCoverHighAltPct");
        v22 = cloudCoverHighAltPct == v31;
        goto LABEL_18;
      }
    }
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  double cloudCover;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double cloudCoverLowAltPct;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double cloudCoverMidAltPct;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  double cloudCoverHighAltPct;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;

  v3 = -[NSString hash](self->_condition, "hash");
  v4 = -[_SFPBLatLng hash](self->_location, "hash");
  v5 = -[_SFPBDate hash](self->_date, "hash");
  cloudCover = self->_cloudCover;
  if (cloudCover == 0.0)
  {
    v10 = 0;
  }
  else
  {
    v7 = -cloudCover;
    if (cloudCover >= 0.0)
      v7 = self->_cloudCover;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v10 += (unint64_t)v9;
    }
    else
    {
      v10 -= (unint64_t)fabs(v9);
    }
  }
  cloudCoverLowAltPct = self->_cloudCoverLowAltPct;
  if (cloudCoverLowAltPct == 0.0)
  {
    v15 = 0;
  }
  else
  {
    v12 = -cloudCoverLowAltPct;
    if (cloudCoverLowAltPct >= 0.0)
      v12 = self->_cloudCoverLowAltPct;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v15 += (unint64_t)v14;
    }
    else
    {
      v15 -= (unint64_t)fabs(v14);
    }
  }
  cloudCoverMidAltPct = self->_cloudCoverMidAltPct;
  if (cloudCoverMidAltPct == 0.0)
  {
    v20 = 0;
  }
  else
  {
    v17 = -cloudCoverMidAltPct;
    if (cloudCoverMidAltPct >= 0.0)
      v17 = self->_cloudCoverMidAltPct;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v20 += (unint64_t)v19;
    }
    else
    {
      v20 -= (unint64_t)fabs(v19);
    }
  }
  cloudCoverHighAltPct = self->_cloudCoverHighAltPct;
  if (cloudCoverHighAltPct == 0.0)
  {
    v25 = 0;
  }
  else
  {
    v22 = -cloudCoverHighAltPct;
    if (cloudCoverHighAltPct >= 0.0)
      v22 = self->_cloudCoverHighAltPct;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v25 += (unint64_t)v24;
    }
    else
    {
      v25 -= (unint64_t)fabs(v24);
    }
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v15 ^ v20 ^ v25;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cloudCover != 0.0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBWeatherColor cloudCover](self, "cloudCover");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cloudCover"));

  }
  if (self->_cloudCoverHighAltPct != 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBWeatherColor cloudCoverHighAltPct](self, "cloudCoverHighAltPct");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("cloudCoverHighAltPct"));

  }
  if (self->_cloudCoverLowAltPct != 0.0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBWeatherColor cloudCoverLowAltPct](self, "cloudCoverLowAltPct");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cloudCoverLowAltPct"));

  }
  if (self->_cloudCoverMidAltPct != 0.0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBWeatherColor cloudCoverMidAltPct](self, "cloudCoverMidAltPct");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cloudCoverMidAltPct"));

  }
  if (self->_condition)
  {
    -[_SFPBWeatherColor condition](self, "condition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("condition"));

  }
  if (self->_date)
  {
    -[_SFPBWeatherColor date](self, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("date"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("date"));

    }
  }
  if (self->_location)
  {
    -[_SFPBWeatherColor location](self, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("location"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("location"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBWeatherColor dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBWeatherColor)initWithJSON:(id)a3
{
  void *v4;
  _SFPBWeatherColor *v5;
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
    self = -[_SFPBWeatherColor initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBWeatherColor)initWithDictionary:(id)a3
{
  id v4;
  _SFPBWeatherColor *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBLatLng *v9;
  void *v10;
  _SFPBDate *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _SFPBWeatherColor *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SFPBWeatherColor;
  v5 = -[_SFPBWeatherColor init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("condition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBWeatherColor setCondition:](v5, "setCondition:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBLatLng initWithDictionary:]([_SFPBLatLng alloc], "initWithDictionary:", v8);
      -[_SFPBWeatherColor setLocation:](v5, "setLocation:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v10);
      -[_SFPBWeatherColor setDate:](v5, "setDate:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cloudCover"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "doubleValue");
      -[_SFPBWeatherColor setCloudCover:](v5, "setCloudCover:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cloudCoverLowAltPct"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "doubleValue");
      -[_SFPBWeatherColor setCloudCoverLowAltPct:](v5, "setCloudCoverLowAltPct:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cloudCoverMidAltPct"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      -[_SFPBWeatherColor setCloudCoverMidAltPct:](v5, "setCloudCoverMidAltPct:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cloudCoverHighAltPct"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "doubleValue");
      -[_SFPBWeatherColor setCloudCoverHighAltPct:](v5, "setCloudCoverHighAltPct:");
    }
    v16 = v5;

  }
  return v5;
}

- (NSString)condition
{
  return self->_condition;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (_SFPBDate)date
{
  return self->_date;
}

- (double)cloudCover
{
  return self->_cloudCover;
}

- (double)cloudCoverLowAltPct
{
  return self->_cloudCoverLowAltPct;
}

- (double)cloudCoverMidAltPct
{
  return self->_cloudCoverMidAltPct;
}

- (double)cloudCoverHighAltPct
{
  return self->_cloudCoverHighAltPct;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

@end

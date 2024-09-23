@implementation _SFPBTopic

- (_SFPBTopic)initWithSFTopic:(id)a3
{
  id v4;
  _SFPBTopic *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _SFPBLatLng *v10;
  void *v11;
  _SFPBLatLng *v12;
  void *v13;
  void *v14;
  double v15;
  unint64_t v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SFPBTopic;
  v5 = -[_SFPBTopic init](&v19, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      -[_SFPBTopic setType:](v5, "setType:", objc_msgSend(v6, "queryType"));
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTopic setIdentifier:](v5, "setIdentifier:", v7);

      objc_msgSend(v6, "query");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[_SFPBTopic setQuery:](v5, "setQuery:", v8);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v4;
      v10 = [_SFPBLatLng alloc];
      objc_msgSend(v9, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[_SFPBLatLng initWithFacade:](v10, "initWithFacade:", v11);
      -[_SFPBTopic weather](v5, "weather");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLocation:", v12);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSince1970");
      v16 = (unint64_t)v15;
      -[_SFPBTopic flight](v5, "flight");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTimestamp:", v16);

    }
  }

  return v5;
}

- (void)setQuery:(id)a3
{
  NSString *v4;
  NSString *query;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  query = self->_query;
  self->_query = v4;

}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (void)setFlight:(id)a3
{
  _SFPBFlightDetails *v4;
  _SFPBWeatherDetails *weather;
  _SFPBSportsDetail *sports;
  _SFPBFlightDetails *flight;

  v4 = (_SFPBFlightDetails *)a3;
  weather = self->_weather;
  self->_weather = 0;

  sports = self->_sports;
  self->_sports = 0;

  self->_whichDetail = v4 != 0;
  flight = self->_flight;
  self->_flight = v4;

}

- (_SFPBFlightDetails)flight
{
  if (self->_whichDetail == 1)
    return self->_flight;
  else
    return (_SFPBFlightDetails *)0;
}

- (void)setWeather:(id)a3
{
  _SFPBWeatherDetails *v4;
  _SFPBFlightDetails *flight;
  _SFPBSportsDetail *sports;
  _SFPBWeatherDetails *weather;

  v4 = (_SFPBWeatherDetails *)a3;
  flight = self->_flight;
  self->_flight = 0;

  sports = self->_sports;
  self->_sports = 0;

  self->_whichDetail = 2 * (v4 != 0);
  weather = self->_weather;
  self->_weather = v4;

}

- (_SFPBWeatherDetails)weather
{
  if (self->_whichDetail == 2)
    return self->_weather;
  else
    return (_SFPBWeatherDetails *)0;
}

- (void)setSports:(id)a3
{
  _SFPBSportsDetail *v4;
  _SFPBFlightDetails *flight;
  _SFPBWeatherDetails *weather;
  unint64_t v7;
  _SFPBSportsDetail *sports;

  v4 = (_SFPBSportsDetail *)a3;
  flight = self->_flight;
  self->_flight = 0;

  weather = self->_weather;
  self->_weather = 0;

  v7 = 3;
  if (!v4)
    v7 = 0;
  self->_whichDetail = v7;
  sports = self->_sports;
  self->_sports = v4;

}

- (_SFPBSportsDetail)sports
{
  if (self->_whichDetail == 3)
    return self->_sports;
  else
    return (_SFPBSportsDetail *)0;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTopicReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFPBTopic query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  if (-[_SFPBTopic type](self, "type"))
    PBDataWriterWriteInt32Field();
  -[_SFPBTopic identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBTopic flight](self, "flight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBTopic weather](self, "weather");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBTopic sports](self, "sports");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

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
  int type;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[_SFPBTopic query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBTopic query](self, "query");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBTopic query](self, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "query");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_28;
  }
  else
  {

  }
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_28;
  -[_SFPBTopic identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBTopic identifier](self, "identifier");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_SFPBTopic identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[_SFPBTopic flight](self, "flight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBTopic flight](self, "flight");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_SFPBTopic flight](self, "flight");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flight");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[_SFPBTopic weather](self, "weather");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "weather");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBTopic weather](self, "weather");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_SFPBTopic weather](self, "weather");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "weather");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[_SFPBTopic sports](self, "sports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sports");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_27:

    goto LABEL_28;
  }
  -[_SFPBTopic sports](self, "sports");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {

LABEL_31:
    v33 = 1;
    goto LABEL_29;
  }
  v29 = (void *)v28;
  -[_SFPBTopic sports](self, "sports");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sports");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "isEqual:", v31);

  if ((v32 & 1) != 0)
    goto LABEL_31;
LABEL_28:
  v33 = 0;
LABEL_29:

  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_query, "hash");
  v4 = 2654435761 * self->_type;
  v5 = v3 ^ -[NSString hash](self->_identifier, "hash");
  v6 = v5 ^ -[_SFPBFlightDetails hash](self->_flight, "hash");
  v7 = v6 ^ -[_SFPBWeatherDetails hash](self->_weather, "hash");
  return v4 ^ v7 ^ -[_SFPBSportsDetail hash](self->_sports, "hash");
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_flight)
  {
    -[_SFPBTopic flight](self, "flight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("flight"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("flight"));

    }
  }
  if (self->_identifier)
  {
    -[_SFPBTopic identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("identifier"));

  }
  if (self->_query)
  {
    -[_SFPBTopic query](self, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("query"));

  }
  if (self->_sports)
  {
    -[_SFPBTopic sports](self, "sports");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("sports"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("sports"));

    }
  }
  if (self->_type)
  {
    v14 = -[_SFPBTopic type](self, "type");
    if (v14 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E4042130 + v14);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("type"));

  }
  if (self->_weather)
  {
    -[_SFPBTopic weather](self, "weather");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("weather"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("weather"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBTopic dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBTopic)initWithJSON:(id)a3
{
  void *v4;
  _SFPBTopic *v5;
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
    self = -[_SFPBTopic initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBTopic)initWithDictionary:(id)a3
{
  id v4;
  _SFPBTopic *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBFlightDetails *v12;
  void *v13;
  _SFPBWeatherDetails *v14;
  void *v15;
  _SFPBSportsDetail *v16;
  _SFPBTopic *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SFPBTopic;
  v5 = -[_SFPBTopic init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("query"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBTopic setQuery:](v5, "setQuery:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTopic setType:](v5, "setType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[_SFPBTopic setIdentifier:](v5, "setIdentifier:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flight"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[_SFPBFlightDetails initWithDictionary:]([_SFPBFlightDetails alloc], "initWithDictionary:", v11);
      -[_SFPBTopic setFlight:](v5, "setFlight:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weather"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[_SFPBWeatherDetails initWithDictionary:]([_SFPBWeatherDetails alloc], "initWithDictionary:", v13);
      -[_SFPBTopic setWeather:](v5, "setWeather:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sports"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[_SFPBSportsDetail initWithDictionary:]([_SFPBSportsDetail alloc], "initWithDictionary:", v15);
      -[_SFPBTopic setSports:](v5, "setSports:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (NSString)query
{
  return self->_query;
}

- (int)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)whichDetail
{
  return self->_whichDetail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sports, 0);
  objc_storeStrong((id *)&self->_weather, 0);
  objc_storeStrong((id *)&self->_flight, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end

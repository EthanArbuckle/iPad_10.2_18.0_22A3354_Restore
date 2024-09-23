@implementation MOWeather

- (MOWeather)initWithWeatherMO:(id)a3
{
  id v4;
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
  MOWeather *v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weatherIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "weatherSummary"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "weatherSymbolName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "temperature"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windSpeed"));
    self = -[MOWeather initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:](self, "initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:", v6, v7, v8, v9, v10, v11, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceEventIdentifier"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceEventIdentifier"));
      -[MOWeather setSourceEventIdentifier:](self, "setSourceEventIdentifier:", v14);

    }
    if (objc_msgSend(v5, "sourceEventAccessType"))
      -[MOWeather setSourceEventAccessType:](self, "setSourceEventAccessType:", objc_msgSend(v5, "sourceEventAccessType"));
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (MOWeather)initWithStartDate:(id)a3 endDate:(id)a4 temperature:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7 windSpeed:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  MOWeather *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v21 = -[MOWeather initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:](self, "initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:", v20, v19, v18, v16, v15, v17, v14);

  return v21;
}

- (MOWeather)initWithWeatherIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7
{
  return -[MOWeather initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:](self, "initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:", a3, a4, a5, a6, a7, 0, 0);
}

- (MOWeather)initWithWeatherIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7 temperature:(id)a8 windSpeed:(id)a9
{
  id v16;
  id v17;
  MOWeather *v18;
  MOWeather *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MOWeather;
  v18 = -[MOWeather init](&v26, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_weatherIdentifier, a3);
    objc_storeStrong((id *)&v19->_startDate, a4);
    objc_storeStrong((id *)&v19->_endDate, a5);
    objc_storeStrong((id *)&v19->_weatherSummary, a6);
    objc_storeStrong((id *)&v19->_weatherSymbolName, a7);
    objc_storeStrong((id *)&v19->_temperature, a8);
    objc_storeStrong((id *)&v19->_windSpeed, a9);
    v19->_sourceEventAccessType = 5;
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather weatherIdentifier](self, "weatherIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather startDate](self, "startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather endDate](self, "endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather weatherSummary](self, "weatherSummary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather weatherSymbolName](self, "weatherSymbolName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather temperature](self, "temperature"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather windSpeed](self, "windSpeed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOWeather identifier, %@, startDate, %@, endDate, %@, weatherSummary, %@, weatherSymbolName, %@, temperature, %@, windSpeed %@>"), v3, v4, v5, v6, v7, v8, v9));

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *weatherIdentifier;
  id v5;

  weatherIdentifier = self->_weatherIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", weatherIdentifier, CFSTR("weatherIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_weatherSummary, CFSTR("weatherSummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_weatherSymbolName, CFSTR("weatherSymbolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_temperature, CFSTR("temperature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_windSpeed, CFSTR("windSpeed"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sourceEventAccessType, CFSTR("sourceEventAccessType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceEventIdentifier, CFSTR("sourceEventIdentifier"));

}

- (MOWeather)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  MOWeather *v27;
  id v28;
  void *v29;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("weatherIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v8), CFSTR("startDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v11), CFSTR("endDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v14), CFSTR("weatherSummary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v17), CFSTR("weatherSymbolName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSMeasurement, v20), CFSTR("temperature"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSMeasurement, v23), CFSTR("windSpeed"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v27 = -[MOWeather initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:](self, "initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:", v7, v10, v13, v16, v19, v22, v25);
  if (v27)
  {
    v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v26), CFSTR("sourceEventIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[MOWeather setSourceEventIdentifier:](v27, "setSourceEventIdentifier:", v29);

    -[MOWeather setSourceEventAccessType:](v27, "setSourceEventAccessType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceEventAccessType")));
  }

  return v27;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather weatherIdentifier](self, "weatherIdentifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOWeather *v5;
  uint64_t v6;
  MOWeather *v7;
  uint64_t v8;
  MOWeather *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = (MOWeather *)a3;
  v7 = v5;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    if (v5)
    {
      v8 = objc_opt_class(self, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = v7;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather weatherIdentifier](self, "weatherIdentifier"));
        if (v10
          || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather weatherIdentifier](v9, "weatherIdentifier"))) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather weatherIdentifier](self, "weatherIdentifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeather weatherIdentifier](v9, "weatherIdentifier"));
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (v10)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v13 = 1;
        }

        goto LABEL_12;
      }
    }
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (NSUUID)weatherIdentifier
{
  return self->_weatherIdentifier;
}

- (void)setWeatherIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_weatherIdentifier, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSString)weatherSummary
{
  return self->_weatherSummary;
}

- (void)setWeatherSummary:(id)a3
{
  objc_storeStrong((id *)&self->_weatherSummary, a3);
}

- (NSString)weatherSymbolName
{
  return self->_weatherSymbolName;
}

- (void)setWeatherSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_weatherSymbolName, a3);
}

- (NSMeasurement)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(id)a3
{
  objc_storeStrong((id *)&self->_temperature, a3);
}

- (NSMeasurement)windSpeed
{
  return self->_windSpeed;
}

- (void)setWindSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_windSpeed, a3);
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_windSpeed, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_weatherSymbolName, 0);
  objc_storeStrong((id *)&self->_weatherSummary, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_weatherIdentifier, 0);
}

@end

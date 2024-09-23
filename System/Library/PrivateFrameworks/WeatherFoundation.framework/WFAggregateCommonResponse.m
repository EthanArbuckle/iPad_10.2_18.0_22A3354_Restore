@implementation WFAggregateCommonResponse

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[WFAggregateCommonResponse airQualityObservations](self, "airQualityObservations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAirQualityObservations:", v6);

  -[WFAggregateCommonResponse currentObservations](self, "currentObservations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCurrentObservations:", v8);

  v9 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[WFAggregateCommonResponse lastTwentyFourHoursOfObservations](self, "lastTwentyFourHoursOfObservations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:copyItems:", v10, 1);
  objc_msgSend(v4, "setLastTwentyFourHoursOfObservations:", v11);

  v12 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[WFAggregateCommonResponse hourlyForecastedConditions](self, "hourlyForecastedConditions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:copyItems:", v13, 1);
  objc_msgSend(v4, "setHourlyForecastedConditions:", v14);

  v15 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[WFAggregateCommonResponse dailyForecastedConditions](self, "dailyForecastedConditions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithArray:copyItems:", v16, 1);
  objc_msgSend(v4, "setDailyForecastedConditions:", v17);

  v18 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[WFAggregateCommonResponse dailyPollenForecastedConditions](self, "dailyPollenForecastedConditions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithArray:copyItems:", v19, 1);
  objc_msgSend(v4, "setDailyPollenForecastedConditions:", v20);

  v21 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[WFAggregateCommonResponse changeForecasts](self, "changeForecasts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithArray:copyItems:", v22, 1);
  objc_msgSend(v4, "setChangeForecasts:", v23);

  v24 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[WFAggregateCommonResponse severeWeatherEvents](self, "severeWeatherEvents");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithArray:copyItems:", v25, 1);
  objc_msgSend(v4, "setSevereWeatherEvents:", v26);

  -[WFAggregateCommonResponse nextHourPrecipitation](self, "nextHourPrecipitation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setNextHourPrecipitation:", v28);

  -[WFAggregateCommonResponse rawAPIData](self, "rawAPIData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRawAPIData:", v29);

  objc_msgSend(v4, "setResponseWasFromCache:", -[WFAggregateCommonResponse responseWasFromCache](self, "responseWasFromCache"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFAggregateCommonResponse)initWithCoder:(id)a3
{
  id v4;
  WFAggregateCommonResponse *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
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
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)WFAggregateCommonResponse;
  v5 = -[WFResponse initWithCoder:](&v36, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    NSStringFromSelector(sel_airQualityObservations);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setAirQualityObservations:](v5, "setAirQualityObservations:", v11);

    NSStringFromSelector(sel_currentObservations);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setCurrentObservations:](v5, "setCurrentObservations:", v13);

    NSStringFromSelector(sel_lastTwentyFourHoursOfObservations);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setLastTwentyFourHoursOfObservations:](v5, "setLastTwentyFourHoursOfObservations:", v15);

    NSStringFromSelector(sel_hourlyForecastedConditions);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setHourlyForecastedConditions:](v5, "setHourlyForecastedConditions:", v17);

    NSStringFromSelector(sel_dailyForecastedConditions);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setDailyForecastedConditions:](v5, "setDailyForecastedConditions:", v19);

    NSStringFromSelector(sel_dailyPollenForecastedConditions);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setDailyPollenForecastedConditions:](v5, "setDailyPollenForecastedConditions:", v21);

    v22 = objc_opt_class();
    NSStringFromSelector(sel_changeForecasts);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setChangeForecasts:](v5, "setChangeForecasts:", v24);

    v25 = objc_opt_class();
    NSStringFromSelector(sel_severeWeatherEvents);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setSevereWeatherEvents:](v5, "setSevereWeatherEvents:", v27);

    v28 = objc_opt_class();
    NSStringFromSelector(sel_nextHourPrecipitation);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setNextHourPrecipitation:](v5, "setNextHourPrecipitation:", v30);

    v31 = objc_opt_class();
    NSStringFromSelector(sel_rawAPIData);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setRawAPIData:](v5, "setRawAPIData:", v33);

    NSStringFromSelector(sel_responseWasFromCache);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateCommonResponse setResponseWasFromCache:](v5, "setResponseWasFromCache:", objc_msgSend(v4, "decodeBoolForKey:", v34));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)WFAggregateCommonResponse;
  v4 = a3;
  -[WFResponse encodeWithCoder:](&v27, sel_encodeWithCoder_, v4);
  -[WFAggregateCommonResponse airQualityObservations](self, "airQualityObservations", v27.receiver, v27.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_airQualityObservations);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[WFAggregateCommonResponse currentObservations](self, "currentObservations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_currentObservations);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[WFAggregateCommonResponse lastTwentyFourHoursOfObservations](self, "lastTwentyFourHoursOfObservations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_lastTwentyFourHoursOfObservations);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[WFAggregateCommonResponse hourlyForecastedConditions](self, "hourlyForecastedConditions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hourlyForecastedConditions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[WFAggregateCommonResponse dailyForecastedConditions](self, "dailyForecastedConditions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dailyForecastedConditions);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[WFAggregateCommonResponse dailyPollenForecastedConditions](self, "dailyPollenForecastedConditions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dailyPollenForecastedConditions);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  v17 = -[WFAggregateCommonResponse responseWasFromCache](self, "responseWasFromCache");
  NSStringFromSelector(sel_responseWasFromCache);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  -[WFAggregateCommonResponse changeForecasts](self, "changeForecasts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_changeForecasts);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  -[WFAggregateCommonResponse severeWeatherEvents](self, "severeWeatherEvents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_severeWeatherEvents);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  -[WFAggregateCommonResponse nextHourPrecipitation](self, "nextHourPrecipitation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_nextHourPrecipitation);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[WFAggregateCommonResponse rawAPIData](self, "rawAPIData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_rawAPIData);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

}

- (WFAirQualityConditions)airQualityObservations
{
  return self->_airQualityObservations;
}

- (void)setAirQualityObservations:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityObservations, a3);
}

- (WFWeatherConditions)currentObservations
{
  return self->_currentObservations;
}

- (void)setCurrentObservations:(id)a3
{
  objc_storeStrong((id *)&self->_currentObservations, a3);
}

- (NSArray)lastTwentyFourHoursOfObservations
{
  return self->_lastTwentyFourHoursOfObservations;
}

- (void)setLastTwentyFourHoursOfObservations:(id)a3
{
  objc_storeStrong((id *)&self->_lastTwentyFourHoursOfObservations, a3);
}

- (NSArray)hourlyForecastedConditions
{
  return self->_hourlyForecastedConditions;
}

- (void)setHourlyForecastedConditions:(id)a3
{
  objc_storeStrong((id *)&self->_hourlyForecastedConditions, a3);
}

- (NSArray)dailyForecastedConditions
{
  return self->_dailyForecastedConditions;
}

- (void)setDailyForecastedConditions:(id)a3
{
  objc_storeStrong((id *)&self->_dailyForecastedConditions, a3);
}

- (NSArray)dailyPollenForecastedConditions
{
  return self->_dailyPollenForecastedConditions;
}

- (void)setDailyPollenForecastedConditions:(id)a3
{
  objc_storeStrong((id *)&self->_dailyPollenForecastedConditions, a3);
}

- (NSArray)changeForecasts
{
  return self->_changeForecasts;
}

- (void)setChangeForecasts:(id)a3
{
  objc_storeStrong((id *)&self->_changeForecasts, a3);
}

- (NSArray)severeWeatherEvents
{
  return self->_severeWeatherEvents;
}

- (void)setSevereWeatherEvents:(id)a3
{
  objc_storeStrong((id *)&self->_severeWeatherEvents, a3);
}

- (WFNextHourPrecipitation)nextHourPrecipitation
{
  return self->_nextHourPrecipitation;
}

- (void)setNextHourPrecipitation:(id)a3
{
  objc_storeStrong((id *)&self->_nextHourPrecipitation, a3);
}

- (NSData)rawAPIData
{
  return self->_rawAPIData;
}

- (void)setRawAPIData:(id)a3
{
  objc_storeStrong((id *)&self->_rawAPIData, a3);
}

- (BOOL)responseWasFromCache
{
  return self->_responseWasFromCache;
}

- (void)setResponseWasFromCache:(BOOL)a3
{
  self->_responseWasFromCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAPIData, 0);
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_severeWeatherEvents, 0);
  objc_storeStrong((id *)&self->_changeForecasts, 0);
  objc_storeStrong((id *)&self->_dailyPollenForecastedConditions, 0);
  objc_storeStrong((id *)&self->_dailyForecastedConditions, 0);
  objc_storeStrong((id *)&self->_hourlyForecastedConditions, 0);
  objc_storeStrong((id *)&self->_lastTwentyFourHoursOfObservations, 0);
  objc_storeStrong((id *)&self->_currentObservations, 0);
  objc_storeStrong((id *)&self->_airQualityObservations, 0);
}

@end

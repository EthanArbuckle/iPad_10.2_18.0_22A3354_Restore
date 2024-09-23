@implementation WFParsedForecastData

- (id)objectForForecastType:(unint64_t)a3
{
  void *v4;

  v4 = 0;
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64 || a3 == 128)
      {
LABEL_10:
        -[WFParsedForecastData currentConditions](self, "currentConditions");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a3 == 16)
    {
      -[WFParsedForecastData pollenForecasts](self, "pollenForecasts");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 32)
    {
      -[WFParsedForecastData lastTwentyFourHoursOfObservations](self, "lastTwentyFourHoursOfObservations");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        -[WFParsedForecastData airQualityObservations](self, "airQualityObservations");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2uLL:
        goto LABEL_10;
      case 4uLL:
        -[WFParsedForecastData hourlyForecasts](self, "hourlyForecasts");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 8uLL:
        -[WFParsedForecastData dailyForecasts](self, "dailyForecasts");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        return v4;
    }
  }
  return v4;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
  objc_storeStrong((id *)&self->_rawData, a3);
}

- (WFAirQualityConditions)airQualityObservations
{
  return self->_airQualityObservations;
}

- (void)setAirQualityObservations:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityObservations, a3);
}

- (WFWeatherConditions)currentConditions
{
  return self->_currentConditions;
}

- (void)setCurrentConditions:(id)a3
{
  objc_storeStrong((id *)&self->_currentConditions, a3);
}

- (NSArray)lastTwentyFourHoursOfObservations
{
  return self->_lastTwentyFourHoursOfObservations;
}

- (void)setLastTwentyFourHoursOfObservations:(id)a3
{
  objc_storeStrong((id *)&self->_lastTwentyFourHoursOfObservations, a3);
}

- (NSArray)dailyForecasts
{
  return self->_dailyForecasts;
}

- (void)setDailyForecasts:(id)a3
{
  objc_storeStrong((id *)&self->_dailyForecasts, a3);
}

- (NSArray)hourlyForecasts
{
  return self->_hourlyForecasts;
}

- (void)setHourlyForecasts:(id)a3
{
  objc_storeStrong((id *)&self->_hourlyForecasts, a3);
}

- (NSArray)pollenForecasts
{
  return self->_pollenForecasts;
}

- (void)setPollenForecasts:(id)a3
{
  objc_storeStrong((id *)&self->_pollenForecasts, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_severeWeatherEvents, 0);
  objc_storeStrong((id *)&self->_changeForecasts, 0);
  objc_storeStrong((id *)&self->_pollenForecasts, 0);
  objc_storeStrong((id *)&self->_hourlyForecasts, 0);
  objc_storeStrong((id *)&self->_dailyForecasts, 0);
  objc_storeStrong((id *)&self->_lastTwentyFourHoursOfObservations, 0);
  objc_storeStrong((id *)&self->_currentConditions, 0);
  objc_storeStrong((id *)&self->_airQualityObservations, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end

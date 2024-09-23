@implementation WFAggregateCommonForecast

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

- (NSArray)severeWeatherEvents
{
  return self->_severeWeatherEvents;
}

- (void)setSevereWeatherEvents:(id)a3
{
  objc_storeStrong((id *)&self->_severeWeatherEvents, a3);
}

- (NSArray)changeForecasts
{
  return self->_changeForecasts;
}

- (void)setChangeForecasts:(id)a3
{
  objc_storeStrong((id *)&self->_changeForecasts, a3);
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
  objc_storeStrong((id *)&self->_changeForecasts, 0);
  objc_storeStrong((id *)&self->_severeWeatherEvents, 0);
  objc_storeStrong((id *)&self->_dailyPollenForecastedConditions, 0);
  objc_storeStrong((id *)&self->_dailyForecastedConditions, 0);
  objc_storeStrong((id *)&self->_hourlyForecastedConditions, 0);
  objc_storeStrong((id *)&self->_lastTwentyFourHoursOfObservations, 0);
  objc_storeStrong((id *)&self->_currentObservations, 0);
  objc_storeStrong((id *)&self->_airQualityObservations, 0);
}

@end

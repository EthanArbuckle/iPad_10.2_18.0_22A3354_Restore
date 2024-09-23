@implementation WAForecastModel

- (id)copyWithZone:(_NSZone *)a3
{
  WAForecastModel *v4;
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

  v4 = -[WAForecastModel init](+[WAForecastModel allocWithZone:](WAForecastModel, "allocWithZone:", a3), "init");
  -[WAForecastModel city](self, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setCity:](v4, "setCity:", v5);

  -[WAForecastModel location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setLocation:](v4, "setLocation:", v6);

  -[WAForecastModel currentConditions](self, "currentConditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setCurrentConditions:](v4, "setCurrentConditions:", v7);

  -[WAForecastModel airQualityConditions](self, "airQualityConditions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setAirQualityConditions:](v4, "setAirQualityConditions:", v8);

  -[WAForecastModel hourlyForecasts](self, "hourlyForecasts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setHourlyForecasts:](v4, "setHourlyForecasts:", v9);

  -[WAForecastModel dailyForecasts](self, "dailyForecasts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setDailyForecasts:](v4, "setDailyForecasts:", v10);

  -[WAForecastModel sunrise](self, "sunrise");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setSunrise:](v4, "setSunrise:", v11);

  -[WAForecastModel sunset](self, "sunset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setSunset:](v4, "setSunset:", v12);

  -[WAForecastModel deepLink](self, "deepLink");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setDeepLink:](v4, "setDeepLink:", v13);

  -[WAForecastModel link](self, "link");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setLink:](v4, "setLink:", v14);

  -[WAForecastModel severeWeatherEvents](self, "severeWeatherEvents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setSevereWeatherEvents:](v4, "setSevereWeatherEvents:", v15);

  -[WAForecastModel changeForecasts](self, "changeForecasts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setChangeForecasts:](v4, "setChangeForecasts:", v16);

  -[WAForecastModel nextHourPrecipitation](self, "nextHourPrecipitation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel setNextHourPrecipitation:](v4, "setNextHourPrecipitation:", v17);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WAForecastModel *v4;
  WAForecastModel *v5;
  WAForecastModel *v6;
  WAForecastModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int IsEqual;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;

  v4 = (WAForecastModel *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    -[WAForecastModel location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "geoLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAForecastModel location](v7, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "geoLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "distanceFromLocation:", v9);
    if (v12 <= 0.0)
    {
      -[WAForecastModel sunrise](self, "sunrise");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAForecastModel sunrise](v7, "sunrise");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (WAObjectIsEqual(v14, v15))
      {
        -[WAForecastModel sunset](self, "sunset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WAForecastModel sunset](v7, "sunset");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (WAObjectIsEqual(v16, v17))
        {
          v33 = v17;
          v34 = v16;
          -[WAForecastModel currentConditions](self, "currentConditions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[WAForecastModel currentConditions](v7, "currentConditions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          IsEqual = WAObjectIsEqual(v18, v19);

          if (!IsEqual)
            goto LABEL_17;
          -[WAForecastModel dailyForecasts](self, "dailyForecasts");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[WAForecastModel dailyForecasts](v7, "dailyForecasts");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = WAObjectIsEqual(v21, v22);

          if (!v23)
            goto LABEL_17;
          -[WAForecastModel hourlyForecasts](self, "hourlyForecasts");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[WAForecastModel hourlyForecasts](v7, "hourlyForecasts");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = WAObjectIsEqual(v24, v25);

          if (!v26)
            goto LABEL_17;
          -[WAForecastModel severeWeatherEvents](self, "severeWeatherEvents");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[WAForecastModel severeWeatherEvents](v7, "severeWeatherEvents");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = WAObjectIsEqual(v27, v28);

          if (v29)
          {
            -[WAForecastModel nextHourPrecipitation](self, "nextHourPrecipitation");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[WAForecastModel nextHourPrecipitation](v7, "nextHourPrecipitation");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = WAObjectIsEqual(v30, v31);

          }
          else
          {
LABEL_17:
            v13 = 0;
          }
          v17 = v33;
          v16 = v34;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WAForecastModel description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WAForecastModel location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel sunset](self, "sunset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel sunrise](self, "sunrise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel currentConditions](self, "currentConditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel dailyForecasts](self, "dailyForecasts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel hourlyForecasts](self, "hourlyForecasts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel airQualityConditions](self, "airQualityConditions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel link](self, "link");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModel deepLink](self, "deepLink");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WAForecastModel location:'%@' sunset:'%@' sunrise:'%@' current conditions:'%@' dailyForecasts:'%@' hourlyForecasts:'%@' air quality: '%@' link:'%@' deepLink:'%@'>"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isPopulated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[WAForecastModel city](self, "city");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WAForecastModel location](self, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WAForecastModel currentConditions](self, "currentConditions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[WAForecastModel hourlyForecasts](self, "hourlyForecasts");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          -[WAForecastModel dailyForecasts](self, "dailyForecasts");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            -[WAForecastModel sunrise](self, "sunrise");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
            {
              -[WAForecastModel sunset](self, "sunset");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v9 != 0;

            }
            else
            {
              v10 = 0;
            }

          }
          else
          {
            v10 = 0;
          }

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (City)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (WACurrentForecast)currentConditions
{
  return self->_currentConditions;
}

- (void)setCurrentConditions:(id)a3
{
  objc_storeStrong((id *)&self->_currentConditions, a3);
}

- (WFAirQualityConditions)airQualityConditions
{
  return self->_airQualityConditions;
}

- (void)setAirQualityConditions:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityConditions, a3);
}

- (NSArray)hourlyForecasts
{
  return self->_hourlyForecasts;
}

- (void)setHourlyForecasts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)dailyForecasts
{
  return self->_dailyForecasts;
}

- (void)setDailyForecasts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)sunrise
{
  return self->_sunrise;
}

- (void)setSunrise:(id)a3
{
  objc_storeStrong((id *)&self->_sunrise, a3);
}

- (NSDate)sunset
{
  return self->_sunset;
}

- (void)setSunset:(id)a3
{
  objc_storeStrong((id *)&self->_sunset, a3);
}

- (NSURL)deepLink
{
  return self->_deepLink;
}

- (void)setDeepLink:(id)a3
{
  objc_storeStrong((id *)&self->_deepLink, a3);
}

- (NSURL)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_storeStrong((id *)&self->_link, a3);
}

- (NSArray)severeWeatherEvents
{
  return self->_severeWeatherEvents;
}

- (void)setSevereWeatherEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)changeForecasts
{
  return self->_changeForecasts;
}

- (void)setChangeForecasts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (WFNextHourPrecipitation)nextHourPrecipitation
{
  return self->_nextHourPrecipitation;
}

- (void)setNextHourPrecipitation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int)unit
{
  return self->_unit;
}

- (void)setUnit:(int)a3
{
  self->_unit = a3;
}

- (WFWeatherConditions)underlyingCurrentConditions
{
  return self->_underlyingCurrentConditions;
}

- (void)setUnderlyingCurrentConditions:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingCurrentConditions, a3);
}

- (NSArray)underlyingHourlyConditions
{
  return self->_underlyingHourlyConditions;
}

- (void)setUnderlyingHourlyConditions:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingHourlyConditions, a3);
}

- (NSArray)underlyingDailyConditions
{
  return self->_underlyingDailyConditions;
}

- (void)setUnderlyingDailyConditions:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingDailyConditions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDailyConditions, 0);
  objc_storeStrong((id *)&self->_underlyingHourlyConditions, 0);
  objc_storeStrong((id *)&self->_underlyingCurrentConditions, 0);
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_changeForecasts, 0);
  objc_storeStrong((id *)&self->_severeWeatherEvents, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_deepLink, 0);
  objc_storeStrong((id *)&self->_sunset, 0);
  objc_storeStrong((id *)&self->_sunrise, 0);
  objc_storeStrong((id *)&self->_dailyForecasts, 0);
  objc_storeStrong((id *)&self->_hourlyForecasts, 0);
  objc_storeStrong((id *)&self->_airQualityConditions, 0);
  objc_storeStrong((id *)&self->_currentConditions, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_city, 0);
}

@end

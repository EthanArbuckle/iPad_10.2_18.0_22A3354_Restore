@implementation WFWeatherEventsConfig

- (WFWeatherEventsConfig)initWithDictionary:(id)a3
{
  id v4;
  WFWeatherEventsConfig *v5;
  void *v6;
  void *v7;
  void *v8;
  WFWeatherEventConfig *v9;
  WFWeatherEventConfig *changeInConditions;
  WFWeatherEventConfig *v11;
  WFWeatherEventConfig *nextHourPrecipitation;
  WFWeatherEventConfig *v13;
  WFWeatherEventConfig *severeWeather;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFWeatherEventsConfig;
  v5 = -[WFWeatherEventsConfig init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "dictionaryForKey:", CFSTR("cic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryForKey:", CFSTR("nhp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryForKey:", CFSTR("severe"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFWeatherEventConfig initWithDictionary:defaulEnabled:]([WFWeatherEventConfig alloc], "initWithDictionary:defaulEnabled:", v6, 1);
    changeInConditions = v5->_changeInConditions;
    v5->_changeInConditions = v9;

    v11 = -[WFWeatherEventConfig initWithDictionary:defaulEnabled:]([WFWeatherEventConfig alloc], "initWithDictionary:defaulEnabled:", v7, 1);
    nextHourPrecipitation = v5->_nextHourPrecipitation;
    v5->_nextHourPrecipitation = v11;

    v13 = -[WFWeatherEventConfig initWithDictionary:defaulEnabled:]([WFWeatherEventConfig alloc], "initWithDictionary:defaulEnabled:", v8, 1);
    severeWeather = v5->_severeWeather;
    v5->_severeWeather = v13;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[WFWeatherEventConfig copyWithZone:](self->_changeInConditions, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[WFWeatherEventConfig copyWithZone:](self->_nextHourPrecipitation, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[WFWeatherEventConfig copyWithZone:](self->_severeWeather, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (WFWeatherEventConfig)changeInConditions
{
  return self->_changeInConditions;
}

- (void)setChangeInConditions:(id)a3
{
  objc_storeStrong((id *)&self->_changeInConditions, a3);
}

- (WFWeatherEventConfig)nextHourPrecipitation
{
  return self->_nextHourPrecipitation;
}

- (void)setNextHourPrecipitation:(id)a3
{
  objc_storeStrong((id *)&self->_nextHourPrecipitation, a3);
}

- (WFWeatherEventConfig)severeWeather
{
  return self->_severeWeather;
}

- (void)setSevereWeather:(id)a3
{
  objc_storeStrong((id *)&self->_severeWeather, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_severeWeather, 0);
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_changeInConditions, 0);
}

@end

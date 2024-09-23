@implementation WFWeatherConditions

- (void)editLinksWithLocale:(id)a3 trackingParameter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a4;
  v6 = a3;
  -[WFWeatherConditions valueForComponent:](self, "valueForComponent:", CFSTR("WFWeatherIOSLinkComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherConditions valueForComponent:](self, "valueForComponent:", CFSTR("WFWeatherMobileLinkComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherConditions valueForComponent:](self, "valueForComponent:", CFSTR("WFWeatherWebLinkComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_msgSend(v7, "wf_URLHasParameter:", v19) & 1) == 0)
  {
    objc_msgSend(v7, "wf_URLWithTracking:", v19);
    v10 = objc_claimAutoreleasedReturnValue();

    -[WFWeatherConditions setValue:forComponent:](self, "setValue:forComponent:", v10, CFSTR("WFWeatherIOSLinkComponent"));
    v7 = (void *)v10;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "lowercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingFormat:", CFSTR("&locale=%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend(v8, "wf_URLHasParameter:", v16) & 1) == 0)
  {
    objc_msgSend(v8, "wf_URLWithTracking:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    -[WFWeatherConditions setValue:forComponent:](self, "setValue:forComponent:", v17, CFSTR("WFWeatherMobileLinkComponent"));
    v8 = (void *)v17;
  }
  if (v9 && (objc_msgSend(v9, "wf_URLHasParameter:", v16) & 1) == 0)
  {
    objc_msgSend(v9, "wf_URLWithTracking:", v16);
    v18 = objc_claimAutoreleasedReturnValue();

    -[WFWeatherConditions setValue:forComponent:](self, "setValue:forComponent:", v18, CFSTR("WFWeatherWebLinkComponent"));
    v9 = (void *)v18;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_commonInit
{
  self->_componentsLock._os_unfair_lock_opaque = 0;
}

- (WFWeatherConditions)init
{
  WFWeatherConditions *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *components;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWeatherConditions;
  v2 = -[WFWeatherConditions init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    components = v2->_components;
    v2->_components = v3;

    -[WFWeatherConditions _commonInit](v2, "_commonInit");
  }
  return v2;
}

- (WFWeatherConditions)initWithCoder:(id)a3
{
  id v4;
  WFWeatherConditions *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *components;
  uint64_t v9;
  WFLocation *location;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWeatherConditions;
  v5 = -[WFWeatherConditions init](&v12, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken_0 != -1)
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_14);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__classes_0, CFSTR("WFWeatherForecastComponentsDictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", v6, 1);
    components = v5->_components;
    v5->_components = (NSMutableDictionary *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFWeatherForecastComponentsLocationKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (WFLocation *)v9;

    v5->_nightForecast = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WFWeatherForecastComponentsIsNightForecastKey"));
    -[WFWeatherConditions _commonInit](v5, "_commonInit");

  }
  return v5;
}

void __37__WFWeatherConditions_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)initWithCoder__classes_0;
  initWithCoder__classes_0 = v10;

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFWeatherConditions components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("WFWeatherForecastComponentsDictionary"));

  -[WFWeatherConditions location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("WFWeatherForecastComponentsLocationKey"));

  objc_msgSend(v6, "encodeBool:forKey:", -[WFWeatherConditions isNightForecast](self, "isNightForecast"), CFSTR("WFWeatherForecastComponentsIsNightForecastKey"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_opt_class();
  v4 = objc_opt_new();
  v5 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[WFWeatherConditions components](self, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "initWithDictionary:copyItems:", v6, 1);
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  -[WFWeatherConditions location](self, "location");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v9;

  *(_BYTE *)(v4 + 16) = -[WFWeatherConditions isNightForecast](self, "isNightForecast");
  return (id)v4;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p, "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyy-MM-dd'T'hh:mm:ss"));
  -[WFWeatherConditions components](self, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __34__WFWeatherConditions_description__block_invoke;
  v12[3] = &unk_24CCA1C48;
  v13 = v4;
  v14 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "substringWithRange:", 0, objc_msgSend(v6, "length") - 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __34__WFWeatherConditions_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%@ = %@, "), v9, v6);

}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  WFLocation *v4;
  WFLocation *location;

  v4 = (WFLocation *)objc_msgSend(a3, "copy");
  location = self->_location;
  self->_location = v4;

}

- (NSMutableDictionary)components
{
  os_unfair_lock_s *p_componentsLock;
  void *v4;

  p_componentsLock = &self->_componentsLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_components, "copy");
  os_unfair_lock_unlock(p_componentsLock);
  return (NSMutableDictionary *)v4;
}

- (void)setComponents:(id)a3
{
  os_unfair_lock_s *p_componentsLock;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *components;

  p_componentsLock = &self->_componentsLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (NSMutableDictionary *)objc_msgSend(v5, "copy");

  components = self->_components;
  self->_components = v6;

  os_unfair_lock_unlock(p_componentsLock);
}

- (id)valueForComponentSync:(id)a3
{
  os_unfair_lock_s *p_componentsLock;
  id v5;
  void *v6;

  p_componentsLock = &self->_componentsLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary valueForKey:](self->_components, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_componentsLock);
  return v6;
}

- (void)setValueSync:(id)a3 forComponent:(id)a4
{
  os_unfair_lock_s *p_componentsLock;
  id v7;
  id v8;

  p_componentsLock = &self->_componentsLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary setValue:forKey:](self->_components, "setValue:forKey:", v8, v7);

  os_unfair_lock_unlock(p_componentsLock);
}

- (id)allComponents
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  -[WFWeatherConditions components](self, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v2, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)valueForComponent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  v4 = a3;
  if (valueForComponent__onceToken != -1)
    dispatch_once(&valueForComponent__onceToken, &__block_literal_global_104);
  v5 = objc_msgSend(v4, "hash");
  -[WFWeatherConditions valueForComponentSync:](self, "valueForComponentSync:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (v5 == valueForComponent__forecastTimeComponentHash
      && (-[WFWeatherConditions valueForComponentSync:](self, "valueForComponentSync:", CFSTR("WFWeatherForecastDateComponent")), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = (void *)v10;
      +[WFWeatherConditions calendar](WFWeatherConditions, "calendar");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:", +[WFWeatherConditions dateComponentCalendarUnits](WFWeatherConditions, "dateComponentCalendarUnits"), v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("WFWeatherForecastTimeComponent");
    }
    else
    {
      if (v5 != valueForComponent__forecastExpirationTimeComponentHash
        || (-[WFWeatherConditions valueForComponentSync:](self, "valueForComponentSync:", CFSTR("WFWeatherForecastExpirationDateComponent")), (v14 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (v5 == valueForComponent__sunriseTimeComponentHash
          || v5 == valueForComponent__sunsetTimeComponentHash
          || v5 == valueForComponent__sunriseDateComponentHash
          || v5 == valueForComponent__sunsetDateComponentHash)
        {
          -[WFWeatherConditions valueForComponentSync:](self, "valueForComponentSync:", CFSTR("WFWeatherForecastDateComponent"));
          v16 = objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            v9 = 0;
            goto LABEL_14;
          }
          v11 = (void *)v16;
          -[WFWeatherConditions valueForComponentSync:](self, "valueForComponentSync:", CFSTR("WFWeatherSunriseDateComponent"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWeatherConditions valueForComponentSync:](self, "valueForComponentSync:", CFSTR("WFWeatherSunsetDateComponent"));
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v17 && v18)
          {
            v20 = (id)v18;
            v12 = v17;
          }
          else
          {
            -[WFWeatherConditions location](self, "location");
            v28 = v19;
            v29 = v17;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "sunrise:andSunset:forDate:", &v29, &v28, v11);
            v12 = v29;

            v20 = v28;
            if (v12 && v20)
            {
              -[WFWeatherConditions setValueSync:forComponent:](self, "setValueSync:forComponent:", v12, CFSTR("WFWeatherSunriseDateComponent"));
              -[WFWeatherConditions setValueSync:forComponent:](self, "setValueSync:forComponent:", v20, CFSTR("WFWeatherSunsetDateComponent"));
            }

          }
          v21 = v12;
          if (v5 == valueForComponent__sunriseDateComponentHash
            || (v21 = v20, v5 == valueForComponent__sunsetDateComponentHash))
          {
            v9 = v21;

            goto LABEL_13;
          }
          -[WFWeatherConditions location](self, "location");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "timeZone");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA28]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "componentsInTimeZone:fromDate:", v22, v12);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "componentsInTimeZone:fromDate:", v22, v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWeatherConditions setValueSync:forComponent:](self, "setValueSync:forComponent:", v24, CFSTR("WFWeatherSunriseTimeComponent"));
          -[WFWeatherConditions setValueSync:forComponent:](self, "setValueSync:forComponent:", v25, CFSTR("WFWeatherSunsetTimeComponent"));

        }
        -[WFWeatherConditions valueForComponentSync:](self, "valueForComponentSync:", v4);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
      v11 = (void *)v14;
      +[WFWeatherConditions calendar](WFWeatherConditions, "calendar");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:", +[WFWeatherConditions dateComponentCalendarUnits](WFWeatherConditions, "dateComponentCalendarUnits"), v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("WFWeatherForecastExpirationTimeComponent");
    }
    -[WFWeatherConditions setValueSync:forComponent:](self, "setValueSync:forComponent:", v9, v13);
LABEL_13:

    goto LABEL_14;
  }
  v8 = v6;
LABEL_5:
  v9 = v8;
LABEL_14:

  return v9;
}

uint64_t __41__WFWeatherConditions_valueForComponent___block_invoke()
{
  uint64_t result;

  valueForComponent__forecastTimeComponentHash = objc_msgSend(CFSTR("WFWeatherForecastTimeComponent"), "hash");
  valueForComponent__forecastExpirationTimeComponentHash = objc_msgSend(CFSTR("WFWeatherForecastExpirationTimeComponent"), "hash");
  valueForComponent__sunriseTimeComponentHash = objc_msgSend(CFSTR("WFWeatherSunriseTimeComponent"), "hash");
  valueForComponent__sunsetTimeComponentHash = objc_msgSend(CFSTR("WFWeatherSunsetTimeComponent"), "hash");
  valueForComponent__sunriseDateComponentHash = objc_msgSend(CFSTR("WFWeatherSunriseDateComponent"), "hash");
  result = objc_msgSend(CFSTR("WFWeatherSunsetDateComponent"), "hash");
  valueForComponent__sunsetDateComponentHash = result;
  return result;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[WFWeatherConditions components](self, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setValue:(id)a3 forComponent:(id)a4
{
  if (a4)
    -[WFWeatherConditions setValueSync:forComponent:](self, "setValueSync:forComponent:", a3);
}

- (BOOL)wf_isDay
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  -[WFWeatherConditions valueForComponent:](self, "valueForComponent:", CFSTR("WFWeatherSunsetDateComponent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherConditions valueForComponent:](self, "valueForComponent:", CFSTR("WFWeatherSunriseDateComponent"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6 && -[WFWeatherConditions wf_isDayIfSunrise:sunset:](self, "wf_isDayIfSunrise:sunset:", v4, v3);

  return v7;
}

- (BOOL)wf_isDayIfSunrise:(id)a3 sunset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  -[WFWeatherConditions valueForComponent:](self, "valueForComponent:", CFSTR("WFWeatherForecastDateComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 1;
  if (v6 && v7 && v8)
  {
    objc_msgSend(v8, "timeIntervalSince1970");
    v12 = v11;
    objc_msgSend(v7, "timeIntervalSince1970");
    v14 = v13;
    objc_msgSend(v6, "timeIntervalSince1970");
    v16 = v12 <= v14;
    if (v12 >= v15)
      v16 = 1;
    v17 = v12 > v15;
    if (v12 >= v14)
      v17 = 0;
    if (v14 > v15)
      v10 = v17;
    else
      v10 = v16;
  }

  return v10;
}

+ (NSCalendar)calendar
{
  if (calendar_onceToken != -1)
    dispatch_once(&calendar_onceToken, &__block_literal_global_107);
  return (NSCalendar *)(id)calendar_Calendar;
}

void __31__WFWeatherConditions_calendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BDBCE48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA28]);
  v2 = (void *)calendar_Calendar;
  calendar_Calendar = v1;

  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)calendar_Calendar, "setTimeZone:", v3);

}

+ (unint64_t)dateComponentCalendarUnits
{
  return 3146494;
}

- (BOOL)isNightForecast
{
  return self->_nightForecast;
}

- (void)setNightForecast:(BOOL)a3
{
  self->_nightForecast = a3;
}

- (os_unfair_lock_s)componentsLock
{
  return self->_componentsLock;
}

- (void)setComponentsLock:(os_unfair_lock_s)a3
{
  self->_componentsLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end

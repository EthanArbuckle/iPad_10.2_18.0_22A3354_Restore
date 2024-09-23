@implementation WAHourlyForecast

+ (id)hourlyForecastForLocation:(id)a3 conditions:(id)a4 sunriseDateComponents:(id)a5 sunsetDateComponents:(id)a6
{
  id v11;
  id v12;
  WAHourlyForecast *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v38;
  void *v39;
  id v40;
  id v41;

  v11 = a3;
  v12 = a4;
  v41 = a5;
  v40 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WAHourlyForecast+WFAdditions.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WAHourlyForecast+WFAdditions.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conditions"));

LABEL_3:
  v13 = objc_alloc_init(WAHourlyForecast);
  -[WAHourlyForecast setEventType:](v13, "setEventType:", 0);
  objc_msgSend(v12, "valueForComponent:", *MEMORY[0x24BEC22D0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAHourlyForecast setTemperature:](v13, "setTemperature:", v14);

  objc_msgSend(v12, "valueForComponent:", *MEMORY[0x24BEC2308]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAHourlyForecast setHourIndex:](v13, "setHourIndex:", objc_msgSend(v15, "integerValue"));
  objc_msgSend(v12, "valueForComponent:", *MEMORY[0x24BEC22A8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  -[WAHourlyForecast setPercentPrecipitation:](v13, "setPercentPrecipitation:", v17);
  objc_msgSend(v12, "valueForComponent:", *MEMORY[0x24BEC2270]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSince1970");
  v21 = v20;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc(MEMORY[0x24BDBCE48]);
  v24 = (void *)objc_msgSend(v23, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA28]);
  objc_msgSend(v11, "timeZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTimeZone:", v25);

  objc_msgSend(v24, "components:fromDate:", 96, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x24BDD17C8];
  v28 = objc_msgSend(v26, "hour");
  v29 = objc_msgSend(v26, "minute");
  v30 = 0;
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
    v30 = objc_msgSend(v26, "minute");
  objc_msgSend(v27, "stringWithFormat:", CFSTR("%02zd:%02zd"), v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAHourlyForecast setTime:](v13, "setTime:", v31);

  objc_msgSend(v12, "valueForComponent:", *MEMORY[0x24BEC2300]);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  v34 = &unk_24DDB1710;
  if (v32)
    v34 = (void *)v32;
  v35 = v34;

  v36 = objc_msgSend(v35, "unsignedIntegerValue");
  -[WAHourlyForecast setConditionCode:](v13, "setConditionCode:", v36);

  return v13;
}

+ (int64_t)TimeValueFromString:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 100 * objc_msgSend(v4, "integerValue");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = self->_eventType;
  v6 = -[NSString copyWithZone:](self->_time, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_QWORD *)(v5 + 24) = self->_hourIndex;
  v8 = -[WFTemperature copyWithZone:](self->_temperature, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  *(_QWORD *)(v5 + 48) = self->_conditionCode;
  *(double *)(v5 + 56) = self->_percentPrecipitation;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  WAHourlyForecast *v4;
  WAHourlyForecast *v5;
  WAHourlyForecast *v6;
  WAHourlyForecast *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  double v13;
  float v14;
  double v15;
  float v16;
  void *v17;
  void *v18;
  char IsEqual;

  v4 = (WAHourlyForecast *)a3;
  if (v4 == self)
  {
    IsEqual = 1;
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

    if (!v7)
      goto LABEL_11;
    v8 = -[WAHourlyForecast eventType](v7, "eventType");
    if (v8 != -[WAHourlyForecast eventType](self, "eventType"))
      goto LABEL_11;
    -[WAHourlyForecast time](v7, "time");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAHourlyForecast time](self, "time");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_11;
    v12 = -[WAHourlyForecast conditionCode](v7, "conditionCode");
    if (v12 == -[WAHourlyForecast conditionCode](self, "conditionCode")
      && (-[WAHourlyForecast percentPrecipitation](v7, "percentPrecipitation"),
          v14 = v13,
          -[WAHourlyForecast percentPrecipitation](self, "percentPrecipitation"),
          v16 = v15,
          WAFloatIsEqual(v14, v16)))
    {
      -[WAHourlyForecast temperature](v7, "temperature");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAHourlyForecast temperature](self, "temperature");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      IsEqual = WAObjectIsEqual(v17, v18);

    }
    else
    {
LABEL_11:
      IsEqual = 0;
    }

  }
  return IsEqual;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WAHourlyForecast description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)setTemperature:(id)a3
{
  id v5;
  WFTemperature **p_temperature;
  WFTemperature *temperature;
  id v8;

  v5 = a3;
  temperature = self->_temperature;
  p_temperature = &self->_temperature;
  v8 = v5;
  if ((-[WFTemperature isEqualToTemperature:](temperature, "isEqualToTemperature:") & 1) == 0)
    objc_storeStrong((id *)p_temperature, a3);

}

- (id)description
{
  void *v3;
  NSString *time;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  time = self->_time;
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[WAHourlyForecast temperature](self, "temperature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "temperatureForUnit:", 2);
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WAHourlyForecast - Hour: %@, Temp: %@, ConditionCode: %ld, Precipitation: %f>"), time, v7, self->_conditionCode, *(_QWORD *)&self->_percentPrecipitation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (NSString)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)hourIndex
{
  return self->_hourIndex;
}

- (void)setHourIndex:(int64_t)a3
{
  self->_hourIndex = a3;
}

- (WFTemperature)temperature
{
  return self->_temperature;
}

- (NSString)forecastDetail
{
  return self->_forecastDetail;
}

- (void)setForecastDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)conditionCode
{
  return self->_conditionCode;
}

- (void)setConditionCode:(int64_t)a3
{
  self->_conditionCode = a3;
}

- (double)percentPrecipitation
{
  return self->_percentPrecipitation;
}

- (void)setPercentPrecipitation:(double)a3
{
  self->_percentPrecipitation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecastDetail, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_time, 0);
}

@end

@implementation WADayForecast

+ (id)dayForecastForLocation:(id)a3 conditions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WADayForecast *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WADayForecast+WFAdditions.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WADayForecast+WFAdditions.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conditions"));

LABEL_3:
  v10 = objc_alloc_init(WADayForecast);
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2278]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WADayForecast setHigh:](v10, "setHigh:", v11);

  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2290]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WADayForecast setLow:](v10, "setLow:", v12);

  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC22A8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  -[WADayForecast setPercentPrecipitation:](v10, "setPercentPrecipitation:", v14);
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2300]);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &unk_24DDB1728;
  if (v15)
    v17 = (void *)v15;
  v18 = v17;

  v19 = objc_msgSend(v18, "unsignedIntegerValue");
  -[WADayForecast setIcon:](v10, "setIcon:", v19);
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2270]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc(MEMORY[0x24BDBCE48]);
  v23 = (void *)objc_msgSend(v22, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA28]);
  objc_msgSend(v7, "timeZone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTimeZone:", v24);

  objc_msgSend(v23, "components:fromDate:", 512, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WADayForecast setDayOfWeek:](v10, "setDayOfWeek:", objc_msgSend(v25, "weekday"));
  objc_msgSend(v7, "timeZone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WADayForecast setIsYesterday:](v10, "setIsYesterday:", DateIsYesterdayInTimezone(v21, v26));

  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2308]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WADayForecast setDayNumber:](v10, "setDayNumber:", objc_msgSend(v27, "integerValue") - 1);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WADayForecast *v4;
  void *v5;
  void *v6;

  v4 = -[WADayForecast init](+[WADayForecast allocWithZone:](WADayForecast, "allocWithZone:", a3), "init");
  -[WADayForecast high](self, "high");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WADayForecast setHigh:](v4, "setHigh:", v5);

  -[WADayForecast low](self, "low");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WADayForecast setLow:](v4, "setLow:", v6);

  -[WADayForecast percentPrecipitation](self, "percentPrecipitation");
  -[WADayForecast setPercentPrecipitation:](v4, "setPercentPrecipitation:");
  -[WADayForecast setIcon:](v4, "setIcon:", -[WADayForecast icon](self, "icon"));
  -[WADayForecast setDayNumber:](v4, "setDayNumber:", -[WADayForecast dayNumber](self, "dayNumber"));
  -[WADayForecast setDayOfWeek:](v4, "setDayOfWeek:", -[WADayForecast dayOfWeek](self, "dayOfWeek"));
  -[WADayForecast setIsYesterday:](v4, "setIsYesterday:", -[WADayForecast isYesterday](self, "isYesterday"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WADayForecast *v4;
  WADayForecast *v5;
  WADayForecast *v6;
  WADayForecast *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _BOOL4 v18;
  _BOOL4 v19;

  v4 = (WADayForecast *)a3;
  if (v4 == self)
  {
    LOBYTE(v19) = 1;
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

    -[WADayForecast high](self, "high");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WADayForecast high](v7, "high");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (WAObjectIsEqual(v8, v9))
    {
      -[WADayForecast low](self, "low");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WADayForecast low](v7, "low");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (WAObjectIsEqual(v10, v11)
        && (-[WADayForecast percentPrecipitation](self, "percentPrecipitation"),
            v13 = v12,
            -[WADayForecast percentPrecipitation](v7, "percentPrecipitation"),
            v13 == v14)
        && (v15 = -[WADayForecast icon](self, "icon"), v15 == -[WADayForecast icon](v7, "icon"))
        && (v16 = -[WADayForecast dayNumber](self, "dayNumber"), v16 == -[WADayForecast dayNumber](v7, "dayNumber"))
        && (v17 = -[WADayForecast dayOfWeek](self, "dayOfWeek"), v17 == -[WADayForecast dayOfWeek](v7, "dayOfWeek")))
      {
        v18 = -[WADayForecast isYesterday](self, "isYesterday");
        v19 = v18 ^ -[WADayForecast isYesterday](v7, "isYesterday") ^ 1;
      }
      else
      {
        LOBYTE(v19) = 0;
      }

    }
    else
    {
      LOBYTE(v19) = 0;
    }

  }
  return v19;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WADayForecast description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<WADayForecast - Day of Week: %lu, Day number: %lu, Icon: %lu, High: %@, Low: %@>"), self->_dayOfWeek, self->_dayNumber, self->_icon, self->_high, self->_low);
}

- (void)setHigh:(id)a3
{
  id v5;
  WFTemperature **p_high;
  WFTemperature *high;
  id v8;

  v5 = a3;
  high = self->_high;
  p_high = &self->_high;
  v8 = v5;
  if ((-[WFTemperature isEqualToTemperature:](high, "isEqualToTemperature:") & 1) == 0)
    objc_storeStrong((id *)p_high, a3);

}

- (void)setLow:(id)a3
{
  id v5;
  WFTemperature **p_low;
  WFTemperature *low;
  id v8;

  v5 = a3;
  low = self->_low;
  p_low = &self->_low;
  v8 = v5;
  if ((-[WFTemperature isEqualToTemperature:](low, "isEqualToTemperature:") & 1) == 0)
    objc_storeStrong((id *)p_low, a3);

}

- (int64_t)compareDayNumberToDayForecast:(id)a3
{
  if (objc_msgSend(a3, "dayNumber") > self->_dayNumber)
    return -1;
  else
    return 1;
}

- (WFTemperature)high
{
  return self->_high;
}

- (WFTemperature)low
{
  return self->_low;
}

- (double)percentPrecipitation
{
  return self->_percentPrecipitation;
}

- (void)setPercentPrecipitation:(double)a3
{
  self->_percentPrecipitation = a3;
}

- (unint64_t)icon
{
  return self->_icon;
}

- (void)setIcon:(unint64_t)a3
{
  self->_icon = a3;
}

- (unint64_t)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setDayOfWeek:(unint64_t)a3
{
  self->_dayOfWeek = a3;
}

- (unint64_t)dayNumber
{
  return self->_dayNumber;
}

- (void)setDayNumber:(unint64_t)a3
{
  self->_dayNumber = a3;
}

- (BOOL)isYesterday
{
  return self->_isYesterday;
}

- (void)setIsYesterday:(BOOL)a3
{
  self->_isYesterday = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_low, 0);
  objc_storeStrong((id *)&self->_high, 0);
}

@end

@implementation WACurrentForecast

- (id)copyWithZone:(_NSZone *)a3
{
  WACurrentForecast *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[WACurrentForecast init](+[WACurrentForecast allocWithZone:](WACurrentForecast, "allocWithZone:", a3), "init");
  -[WACurrentForecast temperature](self, "temperature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[WACurrentForecast setTemperature:](v4, "setTemperature:", v6);

  -[WACurrentForecast feelsLike](self, "feelsLike");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[WACurrentForecast setFeelsLike:](v4, "setFeelsLike:", v8);

  -[WACurrentForecast windSpeed](self, "windSpeed");
  -[WACurrentForecast setWindSpeed:](v4, "setWindSpeed:");
  -[WACurrentForecast windDirection](self, "windDirection");
  -[WACurrentForecast setWindDirection:](v4, "setWindDirection:");
  -[WACurrentForecast humidity](self, "humidity");
  -[WACurrentForecast setHumidity:](v4, "setHumidity:");
  -[WACurrentForecast dewPoint](self, "dewPoint");
  -[WACurrentForecast setDewPoint:](v4, "setDewPoint:");
  -[WACurrentForecast visibility](self, "visibility");
  -[WACurrentForecast setVisibility:](v4, "setVisibility:");
  -[WACurrentForecast pressure](self, "pressure");
  -[WACurrentForecast setPressure:](v4, "setPressure:");
  -[WACurrentForecast setPressureRising:](v4, "setPressureRising:", -[WACurrentForecast pressureRising](self, "pressureRising"));
  -[WACurrentForecast setUVIndex:](v4, "setUVIndex:", -[WACurrentForecast UVIndex](self, "UVIndex"));
  -[WACurrentForecast precipitationPast24Hours](self, "precipitationPast24Hours");
  -[WACurrentForecast setPrecipitationPast24Hours:](v4, "setPrecipitationPast24Hours:");
  -[WACurrentForecast setConditionCode:](v4, "setConditionCode:", -[WACurrentForecast conditionCode](self, "conditionCode"));
  -[WACurrentForecast setObservationTime:](v4, "setObservationTime:", -[WACurrentForecast observationTime](self, "observationTime"));
  -[WACurrentForecast providerName](self, "providerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WACurrentForecast setProviderName:](v4, "setProviderName:", v9);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  float v20;
  double v21;
  int64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WACurrentForecast temperature](self, "temperature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WACurrentForecast feelsLike](self, "feelsLike");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WACurrentForecast windSpeed](self, "windSpeed");
  v7 = v6;
  -[WACurrentForecast windDirection](self, "windDirection");
  v9 = v8;
  -[WACurrentForecast humidity](self, "humidity");
  v11 = v10;
  -[WACurrentForecast dewPoint](self, "dewPoint");
  v13 = v12;
  -[WACurrentForecast visibility](self, "visibility");
  v15 = v14;
  -[WACurrentForecast pressure](self, "pressure");
  v17 = v16;
  v18 = -[WACurrentForecast pressureRising](self, "pressureRising");
  v19 = -[WACurrentForecast UVIndex](self, "UVIndex");
  -[WACurrentForecast precipitationPast24Hours](self, "precipitationPast24Hours");
  v21 = v20;
  v22 = -[WACurrentForecast conditionCode](self, "conditionCode");
  v23 = -[WACurrentForecast observationTime](self, "observationTime");
  -[WACurrentForecast providerName](self, "providerName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WACurrentForecast temperature: '%@' feelsLike: '%@' windSpeed: '%f' windDirection: '%f' humidity: '%f' dewPoint: '%f' visibility: '%f' pressure: '%f' pressureRising: '%lu' UVIndex: '%lu' precipitationPast24Hours: '%f' conditionCode: '%ld' observationTime: '%lu' providerName: %@>"), v4, v5, *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11, *(_QWORD *)&v13, *(_QWORD *)&v15, *(_QWORD *)&v17, v18, v19, *(_QWORD *)&v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  WACurrentForecast *v4;
  WACurrentForecast *v5;
  WACurrentForecast *v6;
  WACurrentForecast *v7;
  void *v8;
  void *v9;
  int IsEqual;
  void *v11;
  void *v12;
  int v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  unint64_t v32;
  unint64_t v33;
  float v34;
  float v35;
  float v36;
  int64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  char v41;

  v4 = (WACurrentForecast *)a3;
  if (v4 == self)
  {
    v41 = 1;
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

    -[WACurrentForecast temperature](self, "temperature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WACurrentForecast temperature](v7, "temperature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IsEqual = WAObjectIsEqual(v8, v9);

    if (!IsEqual)
      goto LABEL_19;
    -[WACurrentForecast feelsLike](self, "feelsLike");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WACurrentForecast feelsLike](v7, "feelsLike");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = WAObjectIsEqual(v11, v12);

    if (!v13)
      goto LABEL_19;
    -[WACurrentForecast windSpeed](self, "windSpeed");
    v15 = v14;
    -[WACurrentForecast windSpeed](v7, "windSpeed");
    if (!WAFloatIsEqual(v15, v16))
      goto LABEL_19;
    -[WACurrentForecast windDirection](self, "windDirection");
    v18 = v17;
    -[WACurrentForecast windDirection](v7, "windDirection");
    if (!WAFloatIsEqual(v18, v19))
      goto LABEL_19;
    -[WACurrentForecast humidity](self, "humidity");
    v21 = v20;
    -[WACurrentForecast humidity](v7, "humidity");
    if (!WAFloatIsEqual(v21, v22))
      goto LABEL_19;
    -[WACurrentForecast dewPoint](self, "dewPoint");
    v24 = v23;
    -[WACurrentForecast dewPoint](v7, "dewPoint");
    if (!WAFloatIsEqual(v24, v25))
      goto LABEL_19;
    -[WACurrentForecast visibility](self, "visibility");
    v27 = v26;
    -[WACurrentForecast visibility](v7, "visibility");
    if (!WAFloatIsEqual(v27, v28))
      goto LABEL_19;
    -[WACurrentForecast pressure](self, "pressure");
    v30 = v29;
    -[WACurrentForecast pressure](v7, "pressure");
    if (!WAFloatIsEqual(v30, v31))
      goto LABEL_19;
    v32 = -[WACurrentForecast pressureRising](self, "pressureRising");
    if (v32 == -[WACurrentForecast pressureRising](v7, "pressureRising")
      && (v33 = -[WACurrentForecast UVIndex](self, "UVIndex"), v33 == -[WACurrentForecast UVIndex](v7, "UVIndex"))
      && (-[WACurrentForecast precipitationPast24Hours](self, "precipitationPast24Hours"),
          v35 = v34,
          -[WACurrentForecast precipitationPast24Hours](v7, "precipitationPast24Hours"),
          WAFloatIsEqual(v35, v36))
      && (v37 = -[WACurrentForecast conditionCode](self, "conditionCode"),
          v37 == -[WACurrentForecast conditionCode](v7, "conditionCode"))
      && (v38 = -[WACurrentForecast observationTime](self, "observationTime"),
          v38 == -[WACurrentForecast observationTime](v7, "observationTime")))
    {
      -[WACurrentForecast providerName](self, "providerName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[WACurrentForecast providerName](v7, "providerName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "isEqualToString:", v40);

    }
    else
    {
LABEL_19:
      v41 = 0;
    }

  }
  return v41;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WACurrentForecast description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (WFTemperature)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(id)a3
{
  objc_storeStrong((id *)&self->_temperature, a3);
}

- (WFTemperature)feelsLike
{
  return self->_feelsLike;
}

- (void)setFeelsLike:(id)a3
{
  objc_storeStrong((id *)&self->_feelsLike, a3);
}

- (float)windSpeed
{
  return self->_windSpeed;
}

- (void)setWindSpeed:(float)a3
{
  self->_windSpeed = a3;
}

- (float)windDirection
{
  return self->_windDirection;
}

- (void)setWindDirection:(float)a3
{
  self->_windDirection = a3;
}

- (float)humidity
{
  return self->_humidity;
}

- (void)setHumidity:(float)a3
{
  self->_humidity = a3;
}

- (float)dewPoint
{
  return self->_dewPoint;
}

- (void)setDewPoint:(float)a3
{
  self->_dewPoint = a3;
}

- (float)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(float)a3
{
  self->_visibility = a3;
}

- (float)pressure
{
  return self->_pressure;
}

- (void)setPressure:(float)a3
{
  self->_pressure = a3;
}

- (unint64_t)pressureRising
{
  return self->_pressureRising;
}

- (void)setPressureRising:(unint64_t)a3
{
  self->_pressureRising = a3;
}

- (unint64_t)UVIndex
{
  return self->_UVIndex;
}

- (void)setUVIndex:(unint64_t)a3
{
  self->_UVIndex = a3;
}

- (float)precipitationPast24Hours
{
  return self->_precipitationPast24Hours;
}

- (void)setPrecipitationPast24Hours:(float)a3
{
  self->_precipitationPast24Hours = a3;
}

- (int64_t)conditionCode
{
  return self->_conditionCode;
}

- (void)setConditionCode:(int64_t)a3
{
  self->_conditionCode = a3;
}

- (unint64_t)observationTime
{
  return self->_observationTime;
}

- (void)setObservationTime:(unint64_t)a3
{
  self->_observationTime = a3;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_feelsLike, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
}

+ (id)currentForecastForLocation:(id)a3 conditions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  unint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

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
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WACurrentForecast+WFAdditions.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WACurrentForecast+WFAdditions.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conditions"));

LABEL_3:
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC22D0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTemperature:", v11);

  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2268]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFeelsLike:", v12);

  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2258]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProviderName:", v13);

  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC22F0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v14;
  if (v14)
    objc_msgSend(v14, "floatValue");
  else
    LODWORD(v15) = 0x800000;
  objc_msgSend(v10, "setWindDirection:", v15);
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC22F8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v16;
  if (v16)
    objc_msgSend(v16, "floatValue");
  else
    LODWORD(v17) = 0x800000;
  objc_msgSend(v10, "setWindSpeed:", v17);
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2280]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v18;
  if (v18)
    objc_msgSend(v18, "floatValue");
  else
    LODWORD(v19) = 0x800000;
  objc_msgSend(v10, "setHumidity:", v19);
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2260]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v20;
  if (v20)
    objc_msgSend(v20, "floatValue");
  else
    LODWORD(v21) = 0x800000;
  objc_msgSend(v10, "setDewPoint:", v21);
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC22E0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v22;
  if (v22)
    objc_msgSend(v22, "floatValue");
  else
    LODWORD(v23) = 0x800000;
  objc_msgSend(v10, "setVisibility:", v23);
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC22B0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v24;
  if (v24)
    objc_msgSend(v24, "floatValue");
  else
    LODWORD(v25) = 0x800000;
  objc_msgSend(v10, "setPressure:", v25);
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC22B8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    v28 = objc_msgSend(v26, "unsignedIntegerValue");
    if (v28 <= 4)
      objc_msgSend(v10, "setPressureRising:", PressureStatesMap[v28]);
  }
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC22D8]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUVIndex:", objc_msgSend(v48, "unsignedIntegerValue"));
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC22A0]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "doubleValue");
  v30 = v29 / 10.0;
  *(float *)&v30 = v30;
  objc_msgSend(v10, "setPrecipitationPast24Hours:", v30);
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2300]);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  v33 = &unk_24DDB1740;
  if (v31)
    v33 = (void *)v31;
  v34 = v33;

  v35 = objc_msgSend(v34, "unsignedIntegerValue");
  objc_msgSend(v10, "setConditionCode:", v35);
  +[City _ISO8601Calendar](City, "_ISO8601Calendar");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeZone");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForComponent:", *MEMORY[0x24BEC2270]);
  v46 = v7;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "date");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTimeZone:", v37);
  objc_msgSend(v36, "components:fromDate:", 96, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObservationTime:", objc_msgSend(v42, "minute") + 100 * objc_msgSend(v42, "hour"));

  return v10;
}

@end

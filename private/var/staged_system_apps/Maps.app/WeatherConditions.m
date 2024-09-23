@implementation WeatherConditions

- (WeatherConditions)initWithTemperature:(id)a3 name:(id)a4 palette:(id)a5 forLocation:(id)a6 withExpirationDate:(id)a7 conditionDescription:(id)a8 temperatureDescription:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  WeatherConditions *v22;
  NSString *v23;
  NSString *temperature;
  NSString *v25;
  NSString *name;
  NSArray *v27;
  NSArray *palette;
  CLLocation *v29;
  CLLocation *location;
  NSDate *v31;
  NSDate *expirationDate;
  NSString *v33;
  NSString *conditionDescription;
  NSString *v35;
  NSString *temperatureDescription;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  NSString *v41;
  NSString *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSDate *v46;
  id v48;
  id v49;
  objc_super v50;
  uint8_t buf[4];
  NSString *v52;
  __int16 v53;
  NSString *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  NSDate *v58;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v50.receiver = self;
  v50.super_class = (Class)WeatherConditions;
  v22 = -[WeatherConditions init](&v50, "init");
  if (v22)
  {
    v23 = (NSString *)objc_msgSend(v15, "copy");
    temperature = v22->_temperature;
    v22->_temperature = v23;

    v25 = (NSString *)objc_msgSend(v16, "copy");
    name = v22->_name;
    v22->_name = v25;

    v27 = (NSArray *)objc_msgSend(v17, "copy");
    palette = v22->_palette;
    v22->_palette = v27;

    v29 = (CLLocation *)objc_msgSend(v18, "copy");
    location = v22->_location;
    v22->_location = v29;

    v31 = (NSDate *)objc_msgSend(v19, "copy");
    expirationDate = v22->_expirationDate;
    v22->_expirationDate = v31;

    v33 = (NSString *)objc_msgSend(v20, "copy");
    conditionDescription = v22->_conditionDescription;
    v22->_conditionDescription = v33;

    v35 = (NSString *)objc_msgSend(v21, "copy");
    temperatureDescription = v22->_temperatureDescription;
    v22->_temperatureDescription = v35;

    v37 = sub_10043276C();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v18;
      v49 = v16;
      v39 = v17;
      v40 = v15;
      v41 = v22->_temperatureDescription;
      v42 = v22->_name;
      -[CLLocation coordinate](v22->_location, "coordinate");
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v43, v44));
      v46 = v22->_expirationDate;
      *(_DWORD *)buf = 138413059;
      v52 = v41;
      v15 = v40;
      v17 = v39;
      v53 = 2112;
      v54 = v42;
      v18 = v48;
      v16 = v49;
      v55 = 2113;
      v56 = v45;
      v57 = 2112;
      v58 = v46;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Weather %@, %@ for location = %{private}@ with expirationDate = %@", buf, 0x2Au);

    }
  }

  return v22;
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_temperature, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSArray copyWithZone:](self->_palette, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[CLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSString copyWithZone:](self->_conditionDescription, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  v18 = -[NSString copyWithZone:](self->_temperatureDescription, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (NSString)temperature
{
  return self->_temperature;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)palette
{
  return self->_palette;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)conditionDescription
{
  return self->_conditionDescription;
}

- (NSString)temperatureDescription
{
  return self->_temperatureDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temperatureDescription, 0);
  objc_storeStrong((id *)&self->_conditionDescription, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
}

@end

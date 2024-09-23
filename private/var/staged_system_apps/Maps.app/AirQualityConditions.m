@implementation AirQualityConditions

- (AirQualityConditions)initWithAirQualityIndex:(unint64_t)a3 isNumerical:(BOOL)a4 color:(id)a5 learnMoreURL:(id)a6 forLocation:(id)a7 withExpirationDate:(id)a8 airQualityDescription:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  AirQualityConditions *v20;
  AirQualityConditions *v21;
  uint64_t v22;
  UIColor *color;
  NSURL *v24;
  NSURL *learnMoreURL;
  CLLocation *v26;
  CLLocation *location;
  NSDate *v28;
  NSDate *expirationDate;
  NSString *v30;
  NSString *airQualityDescription;
  id v32;
  NSObject *v33;
  NSString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSDate *v38;
  objc_super v40;
  uint8_t buf[4];
  NSString *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  NSDate *v46;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v40.receiver = self;
  v40.super_class = (Class)AirQualityConditions;
  v20 = -[AirQualityConditions init](&v40, "init");
  v21 = v20;
  if (v20)
  {
    v20->_airQualityIndex = a3;
    v20->_hasNumericalAirQualityIndex = a4;
    v22 = objc_claimAutoreleasedReturnValue(-[AirQualityConditions colorForString:](v20, "colorForString:", v15));
    color = v21->_color;
    v21->_color = (UIColor *)v22;

    v24 = (NSURL *)objc_msgSend(v16, "copy");
    learnMoreURL = v21->_learnMoreURL;
    v21->_learnMoreURL = v24;

    v26 = (CLLocation *)objc_msgSend(v17, "copy");
    location = v21->_location;
    v21->_location = v26;

    v28 = (NSDate *)objc_msgSend(v18, "copy");
    expirationDate = v21->_expirationDate;
    v21->_expirationDate = v28;

    v30 = (NSString *)objc_msgSend(v19, "copy");
    airQualityDescription = v21->_airQualityDescription;
    v21->_airQualityDescription = v30;

    v32 = sub_10043276C();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v21->_airQualityDescription;
      -[CLLocation coordinate](v21->_location, "coordinate");
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v35, v36));
      v38 = v21->_expirationDate;
      *(_DWORD *)buf = 138412803;
      v42 = v34;
      v43 = 2113;
      v44 = v37;
      v45 = 2112;
      v46 = v38;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Air quality = %@ for location = %{private}@ with expirationDate = %@", buf, 0x20u);

    }
  }

  return v21;
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

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[1] = self->_airQualityIndex;
  *((_BYTE *)v5 + 16) = self->_hasNumericalAirQualityIndex;
  v6 = -[UIColor copyWithZone:](self->_color, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSURL copyWithZone:](self->_learnMoreURL, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[CLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  v13 = (void *)v5[6];
  v5[6] = v12;

  v14 = -[NSString copyWithZone:](self->_airQualityDescription, "copyWithZone:", a3);
  v15 = (void *)v5[7];
  v5[7] = v14;

  return v5;
}

- (id)colorForString:(id)a3
{
  return +[UIColor _maps_colorFromHexString:](UIColor, "_maps_colorFromHexString:", a3);
}

- (unint64_t)airQualityIndex
{
  return self->_airQualityIndex;
}

- (BOOL)hasNumericalAirQualityIndex
{
  return self->_hasNumericalAirQualityIndex;
}

- (UIColor)color
{
  return self->_color;
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)airQualityDescription
{
  return self->_airQualityDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airQualityDescription, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end

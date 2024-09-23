@implementation PKPassWeatherInformation

- (PKPassWeatherInformation)initWithCityName:(id)a3 date:(id)a4 lightSymbol:(id)a5 darkSymbol:(id)a6 weatherDescription:(id)a7 highTemperature:(id)a8 lowTemperature:(id)a9 rawLocation:(id)a10 attributionURL:(id)a11 weatherURL:(id)a12 isHistoricalEstimate:(BOOL)a13 isForPastDate:(BOOL)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  PKPassWeatherInformation *v24;
  PKPassWeatherInformation *v25;
  id obj;
  id v28;
  id v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  obj = a4;
  v35 = a4;
  v28 = a5;
  v34 = a5;
  v29 = a6;
  v33 = a6;
  v32 = a7;
  v31 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v37.receiver = self;
  v37.super_class = (Class)PKPassWeatherInformation;
  v24 = -[PKPassWeatherInformation init](&v37, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_cityName, a3);
    objc_storeStrong((id *)&v25->_date, obj);
    objc_storeStrong((id *)&v25->_lightSymbol, v28);
    objc_storeStrong((id *)&v25->_darkSymbol, v29);
    objc_storeStrong((id *)&v25->_weatherDescription, a7);
    objc_storeStrong((id *)&v25->_highTemperature, a8);
    objc_storeStrong((id *)&v25->_lowTemperature, a9);
    objc_storeStrong((id *)&v25->_rawLocation, a10);
    objc_storeStrong((id *)&v25->_attributionURL, a11);
    objc_storeStrong((id *)&v25->_weatherURL, a12);
    v25->_isHistoricalEstimate = a13;
    v25->_isForPastDate = a14;
  }

  return v25;
}

- (PKPassWeatherInformation)initWithCoder:(id)a3
{
  id v4;
  PKPassWeatherInformation *v5;
  uint64_t v6;
  NSString *cityName;
  uint64_t v8;
  NSDate *date;
  uint64_t v10;
  PKPassWeatherSymbol *lightSymbol;
  uint64_t v12;
  PKPassWeatherSymbol *darkSymbol;
  uint64_t v14;
  NSString *weatherDescription;
  uint64_t v16;
  NSMeasurement *highTemperature;
  uint64_t v18;
  NSMeasurement *lowTemperature;
  uint64_t v20;
  CLLocation *rawLocation;
  uint64_t v22;
  NSURL *attributionURL;
  uint64_t v24;
  NSURL *weatherURL;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPassWeatherInformation;
  v5 = -[PKPassWeatherInformation init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cityName"));
    v6 = objc_claimAutoreleasedReturnValue();
    cityName = v5->_cityName;
    v5->_cityName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weatherDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lightSymbol"));
    v10 = objc_claimAutoreleasedReturnValue();
    lightSymbol = v5->_lightSymbol;
    v5->_lightSymbol = (PKPassWeatherSymbol *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("darkSymbol"));
    v12 = objc_claimAutoreleasedReturnValue();
    darkSymbol = v5->_darkSymbol;
    v5->_darkSymbol = (PKPassWeatherSymbol *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weatherDescription"));
    v14 = objc_claimAutoreleasedReturnValue();
    weatherDescription = v5->_weatherDescription;
    v5->_weatherDescription = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("highTemperature"));
    v16 = objc_claimAutoreleasedReturnValue();
    highTemperature = v5->_highTemperature;
    v5->_highTemperature = (NSMeasurement *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lowTemperature"));
    v18 = objc_claimAutoreleasedReturnValue();
    lowTemperature = v5->_lowTemperature;
    v5->_lowTemperature = (NSMeasurement *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawLocation"));
    v20 = objc_claimAutoreleasedReturnValue();
    rawLocation = v5->_rawLocation;
    v5->_rawLocation = (CLLocation *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributionURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    attributionURL = v5->_attributionURL;
    v5->_attributionURL = (NSURL *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weatherURL"));
    v24 = objc_claimAutoreleasedReturnValue();
    weatherURL = v5->_weatherURL;
    v5->_weatherURL = (NSURL *)v24;

    v5->_isHistoricalEstimate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("historicalEstimate"));
    v5->_isForPastDate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forPastDate"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *cityName;
  id v5;

  cityName = self->_cityName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cityName, CFSTR("cityName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("weatherDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lightSymbol, CFSTR("lightSymbol"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_darkSymbol, CFSTR("darkSymbol"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_weatherDescription, CFSTR("weatherDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_highTemperature, CFSTR("highTemperature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lowTemperature, CFSTR("lowTemperature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawLocation, CFSTR("rawLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributionURL, CFSTR("attributionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_weatherURL, CFSTR("weatherURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isHistoricalEstimate, CFSTR("historicalEstimate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isForPastDate, CFSTR("forPastDate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassWeatherInformation *v5;
  uint64_t v6;
  NSString *cityName;
  uint64_t v8;
  NSDate *date;
  PKPassWeatherSymbol *v10;
  PKPassWeatherSymbol *lightSymbol;
  PKPassWeatherSymbol *v12;
  PKPassWeatherSymbol *darkSymbol;
  uint64_t v14;
  NSString *weatherDescription;
  uint64_t v16;
  NSMeasurement *highTemperature;
  uint64_t v18;
  NSMeasurement *lowTemperature;
  uint64_t v20;
  CLLocation *rawLocation;
  uint64_t v22;
  NSURL *attributionURL;
  uint64_t v24;
  NSURL *weatherURL;

  v5 = objc_alloc_init(PKPassWeatherInformation);
  v6 = -[NSString copyWithZone:](self->_cityName, "copyWithZone:", a3);
  cityName = v5->_cityName;
  v5->_cityName = (NSString *)v6;

  v8 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
  date = v5->_date;
  v5->_date = (NSDate *)v8;

  v10 = -[PKPassWeatherSymbol copyWithZone:](self->_lightSymbol, "copyWithZone:", a3);
  lightSymbol = v5->_lightSymbol;
  v5->_lightSymbol = v10;

  v12 = -[PKPassWeatherSymbol copyWithZone:](self->_darkSymbol, "copyWithZone:", a3);
  darkSymbol = v5->_darkSymbol;
  v5->_darkSymbol = v12;

  v14 = -[NSString copyWithZone:](self->_weatherDescription, "copyWithZone:", a3);
  weatherDescription = v5->_weatherDescription;
  v5->_weatherDescription = (NSString *)v14;

  v16 = -[NSMeasurement copyWithZone:](self->_highTemperature, "copyWithZone:", a3);
  highTemperature = v5->_highTemperature;
  v5->_highTemperature = (NSMeasurement *)v16;

  v18 = -[NSMeasurement copyWithZone:](self->_lowTemperature, "copyWithZone:", a3);
  lowTemperature = v5->_lowTemperature;
  v5->_lowTemperature = (NSMeasurement *)v18;

  v20 = -[CLLocation copyWithZone:](self->_rawLocation, "copyWithZone:", a3);
  rawLocation = v5->_rawLocation;
  v5->_rawLocation = (CLLocation *)v20;

  v22 = -[NSURL copyWithZone:](self->_attributionURL, "copyWithZone:", a3);
  attributionURL = v5->_attributionURL;
  v5->_attributionURL = (NSURL *)v22;

  v24 = -[NSURL copyWithZone:](self->_weatherURL, "copyWithZone:", a3);
  weatherURL = v5->_weatherURL;
  v5->_weatherURL = (NSURL *)v24;

  v5->_isHistoricalEstimate = self->_isHistoricalEstimate;
  v5->_isForPastDate = self->_isForPastDate;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPassWeatherInformation *v4;
  PKPassWeatherInformation *v5;
  BOOL v6;

  v4 = (PKPassWeatherInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassWeatherInformation isEqualToWeatherInformation:](self, "isEqualToWeatherInformation:", v5);

  return v6;
}

- (BOOL)isEqualToWeatherInformation:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  BOOL v10;

  v4 = a3;
  if (!PKEqualObjects()
    || !PKEqualObjects()
    || !PKEqualObjects()
    || !PKEqualObjects())
  {
    goto LABEL_19;
  }
  v5 = (void *)v4[7];
  v6 = self->_weatherDescription;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_19:
      v10 = 0;
      goto LABEL_20;
    }
    v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_19;
  }
  if (!PKEqualObjects()
    || !PKEqualObjects()
    || !PKEqualObjects()
    || !PKEqualObjects()
    || !PKEqualObjects()
    || self->_isHistoricalEstimate != *((unsigned __int8 *)v4 + 8))
  {
    goto LABEL_19;
  }
  v10 = self->_isForPastDate == *((unsigned __int8 *)v4 + 9);
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_cityName);
  objc_msgSend(v3, "safelyAddObject:", self->_date);
  objc_msgSend(v3, "safelyAddObject:", self->_lightSymbol);
  objc_msgSend(v3, "safelyAddObject:", self->_darkSymbol);
  objc_msgSend(v3, "safelyAddObject:", self->_weatherDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_highTemperature);
  objc_msgSend(v3, "safelyAddObject:", self->_lowTemperature);
  objc_msgSend(v3, "safelyAddObject:", self->_rawLocation);
  objc_msgSend(v3, "safelyAddObject:", self->_attributionURL);
  objc_msgSend(v3, "safelyAddObject:", self->_weatherURL);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isHistoricalEstimate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isForPastDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v5);

  v6 = PKCombinedHash();
  return v6;
}

- (CLLocation)rawLocation
{
  return self->_rawLocation;
}

- (NSString)cityName
{
  return self->_cityName;
}

- (NSDate)date
{
  return self->_date;
}

- (PKPassWeatherSymbol)lightSymbol
{
  return self->_lightSymbol;
}

- (PKPassWeatherSymbol)darkSymbol
{
  return self->_darkSymbol;
}

- (NSString)weatherDescription
{
  return self->_weatherDescription;
}

- (NSMeasurement)highTemperature
{
  return self->_highTemperature;
}

- (NSMeasurement)lowTemperature
{
  return self->_lowTemperature;
}

- (NSURL)attributionURL
{
  return self->_attributionURL;
}

- (NSURL)weatherURL
{
  return self->_weatherURL;
}

- (BOOL)isHistoricalEstimate
{
  return self->_isHistoricalEstimate;
}

- (BOOL)isForPastDate
{
  return self->_isForPastDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherURL, 0);
  objc_storeStrong((id *)&self->_attributionURL, 0);
  objc_storeStrong((id *)&self->_lowTemperature, 0);
  objc_storeStrong((id *)&self->_highTemperature, 0);
  objc_storeStrong((id *)&self->_weatherDescription, 0);
  objc_storeStrong((id *)&self->_darkSymbol, 0);
  objc_storeStrong((id *)&self->_lightSymbol, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_cityName, 0);
  objc_storeStrong((id *)&self->_rawLocation, 0);
}

@end

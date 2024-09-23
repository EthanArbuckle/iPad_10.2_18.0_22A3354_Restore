@implementation WCDefaultCity

+ (id)cityFromAlCity:(id)a3
{
  id v3;
  WCDefaultCity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(WCDefaultCity);
  objc_msgSend(v3, "localeCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDefaultCity setLocaleCode:](v4, "setLocaleCode:", v5);

  objc_msgSend(v3, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDefaultCity setTimeZone:](v4, "setTimeZone:", v6);

  objc_msgSend(v3, "longitude");
  -[WCDefaultCity setLongitude:](v4, "setLongitude:");
  objc_msgSend(v3, "latitude");
  -[WCDefaultCity setLatitude:](v4, "setLatitude:");
  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDefaultCity setName:](v4, "setName:", v7);

  objc_msgSend(v3, "unlocalizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDefaultCity setUnlocalizedName:](v4, "setUnlocalizedName:", v8);

  objc_msgSend(v3, "countryName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDefaultCity setCountryName:](v4, "setCountryName:", v9);

  objc_msgSend(v3, "unlocalizedCountryName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDefaultCity setUnlocalizedCountryName:](v4, "setUnlocalizedCountryName:", v10);

  objc_msgSend(v3, "countryOverride");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDefaultCity setCountryOverride:](v4, "setCountryOverride:", v11);

  objc_msgSend(v3, "unlocalizedCountryOverride");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WCDefaultCity setUnlocalizedCountryOverride:](v4, "setUnlocalizedCountryOverride:", v12);
  return v4;
}

- (void)setUnlocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setUnlocalizedCountryOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setUnlocalizedCountryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLongitude:(float)a3
{
  self->_longitude = a3;
}

- (void)setLocaleCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLatitude:(float)a3
{
  self->_latitude = a3;
}

- (void)setCountryOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setCountryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)WCDefaultCity;
  -[WCDefaultCity description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDefaultCity name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDefaultCity countryName](self, "countryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDefaultCity countryOverride](self, "countryOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@, %@ [%@] || %@, %@ || %f %f"), v4, v5, v6, v7, self->_timeZone, self->_localeCode, self->_latitude, self->_longitude);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)localeCode
{
  return self->_localeCode;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (float)longitude
{
  return self->_longitude;
}

- (float)latitude
{
  return self->_latitude;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)unlocalizedName
{
  return self->_unlocalizedName;
}

- (NSString)countryName
{
  return self->_countryName;
}

- (NSString)unlocalizedCountryName
{
  return self->_unlocalizedCountryName;
}

- (NSString)countryOverride
{
  return self->_countryOverride;
}

- (NSString)unlocalizedCountryOverride
{
  return self->_unlocalizedCountryOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlocalizedCountryOverride, 0);
  objc_storeStrong((id *)&self->_countryOverride, 0);
  objc_storeStrong((id *)&self->_unlocalizedCountryName, 0);
  objc_storeStrong((id *)&self->_countryName, 0);
  objc_storeStrong((id *)&self->_unlocalizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localeCode, 0);
}

@end

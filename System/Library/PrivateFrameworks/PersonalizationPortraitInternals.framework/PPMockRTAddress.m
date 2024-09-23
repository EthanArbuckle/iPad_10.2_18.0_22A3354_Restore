@implementation PPMockRTAddress

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (void)setSubThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_subThoroughfare, a3);
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (void)setThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_thoroughfare, a3);
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setSubLocality:(id)a3
{
  objc_storeStrong((id *)&self->_subLocality, a3);
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_storeStrong((id *)&self->_locality, a3);
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setSubAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_subAdministrativeArea, a3);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeArea, a3);
}

- (NSString)administrativeAreaCode
{
  return self->_administrativeAreaCode;
}

- (void)setAdministrativeAreaCode:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeAreaCode, a3);
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
  objc_storeStrong((id *)&self->_postalCode, a3);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)inlandWater
{
  return self->_inlandWater;
}

- (void)setInlandWater:(id)a3
{
  objc_storeStrong((id *)&self->_inlandWater, a3);
}

- (NSString)ocean
{
  return self->_ocean;
}

- (void)setOcean:(id)a3
{
  objc_storeStrong((id *)&self->_ocean, a3);
}

- (NSArray)areasOfInterest
{
  return self->_areasOfInterest;
}

- (void)setAreasOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_areasOfInterest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areasOfInterest, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
}

@end

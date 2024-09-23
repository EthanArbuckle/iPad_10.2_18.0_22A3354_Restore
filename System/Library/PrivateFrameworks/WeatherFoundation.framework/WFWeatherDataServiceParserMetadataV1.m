@implementation WFWeatherDataServiceParserMetadataV1

- (NSDate)readDate
{
  return self->_readDate;
}

- (void)setReadDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (void)setExpireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)providerLogoURL
{
  return self->_providerLogoURL;
}

- (void)setProviderLogoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)dataOrigination
{
  return self->_dataOrigination;
}

- (void)setDataOrigination:(int64_t)a3
{
  self->_dataOrigination = a3;
}

- (BOOL)temporarilyUnavailable
{
  return self->_temporarilyUnavailable;
}

- (void)setTemporarilyUnavailable:(BOOL)a3
{
  self->_temporarilyUnavailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerLogoURL, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_expireDate, 0);
  objc_storeStrong((id *)&self->_readDate, 0);
}

@end

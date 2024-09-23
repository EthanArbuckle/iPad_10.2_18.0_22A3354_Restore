@implementation WFAirQualityResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFAirQualityResponse)initWithCoder:(id)a3
{
  id v4;
  WFAirQualityResponse *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFAirQualityResponse;
  v5 = -[WFResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityResponseConditionsKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAirQualityResponse setAirQualityConditions:](v5, "setAirQualityConditions:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAirQualityResponse;
  v4 = a3;
  -[WFResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFAirQualityResponse airQualityConditions](self, "airQualityConditions", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFAirQualityResponseConditionsKey"));

}

- (WFAirQualityConditions)airQualityConditions
{
  return self->_airQualityConditions;
}

- (void)setAirQualityConditions:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityConditions, a3);
}

- (BOOL)responseWasFromCache
{
  return self->_responseWasFromCache;
}

- (void)setResponseWasFromCache:(BOOL)a3
{
  self->_responseWasFromCache = a3;
}

- (NSData)rawAPIData
{
  return self->_rawAPIData;
}

- (void)setRawAPIData:(id)a3
{
  objc_storeStrong((id *)&self->_rawAPIData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAPIData, 0);
  objc_storeStrong((id *)&self->_airQualityConditions, 0);
}

@end

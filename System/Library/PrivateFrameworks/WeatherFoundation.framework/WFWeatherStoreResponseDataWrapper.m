@implementation WFWeatherStoreResponseDataWrapper

- (WFWeatherStoreResponseDataWrapper)initWithForecastData:(id)a3
{
  id v4;
  WFWeatherStoreResponseDataWrapper *v5;
  WFWeatherStoreResponseDataWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFWeatherStoreResponseDataWrapper;
  v5 = -[WFWeatherStoreResponseDataWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WFWeatherStoreResponseDataWrapper setRequestType:](v5, "setRequestType:", 0);
    -[WFWeatherStoreResponseDataWrapper setForecastData:](v6, "setForecastData:", v4);
  }

  return v6;
}

- (WFWeatherStoreResponseDataWrapper)initWithAQIScale:(id)a3
{
  id v4;
  WFWeatherStoreResponseDataWrapper *v5;
  WFWeatherStoreResponseDataWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFWeatherStoreResponseDataWrapper;
  v5 = -[WFWeatherStoreResponseDataWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WFWeatherStoreResponseDataWrapper setRequestType:](v5, "setRequestType:", 1);
    -[WFWeatherStoreResponseDataWrapper setAqiScale:](v6, "setAqiScale:", v4);
  }

  return v6;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (WFParsedForecastData)forecastData
{
  return self->_forecastData;
}

- (void)setForecastData:(id)a3
{
  objc_storeStrong((id *)&self->_forecastData, a3);
}

- (WFAQIScale)aqiScale
{
  return self->_aqiScale;
}

- (void)setAqiScale:(id)a3
{
  objc_storeStrong((id *)&self->_aqiScale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aqiScale, 0);
  objc_storeStrong((id *)&self->_forecastData, 0);
}

@end

@implementation PKPassCachedWeatherInformation

- (PKPassCachedWeatherInformation)initWithWeatherInformation:(id)a3
{
  id v5;
  PKPassCachedWeatherInformation *v6;
  PKPassCachedWeatherInformation *v7;
  PKPassCachedWeatherInformation *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPassCachedWeatherInformation;
    v6 = -[PKPassCachedWeatherInformation init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_weatherInformation, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)beginContentAccess
{
  BOOL v2;

  v2 = self->_weatherInformation != 0;
  self->_contentBeingAcccessed = v2;
  return v2;
}

- (void)discardContentIfPossible
{
  PKPassWeatherInformation *weatherInformation;

  weatherInformation = self->_weatherInformation;
  self->_weatherInformation = 0;

}

- (void)endContentAccess
{
  self->_contentBeingAcccessed = 0;
}

- (BOOL)isContentDiscarded
{
  return self->_weatherInformation == 0;
}

- (PKPassWeatherInformation)weatherInformation
{
  return self->_weatherInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherInformation, 0);
}

@end

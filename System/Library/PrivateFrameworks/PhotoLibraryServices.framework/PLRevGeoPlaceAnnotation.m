@implementation PLRevGeoPlaceAnnotation

- (PLRevGeoPlaceAnnotation)init
{
  PLRevGeoPlaceAnnotation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLRevGeoPlaceAnnotation;
  result = -[PLRevGeoPlaceAnnotation init](&v3, sel_init);
  if (result)
    result->_placeLevel = 0;
  return result;
}

- (PLRevGeoPlaceAnnotation)initWithData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *placeName;
  PLRevGeoPlaceAnnotation *v9;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("level"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      self->_placeLevel = objc_msgSend(v5, "intValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    placeName = self->_placeName;
    self->_placeName = v7;

    v9 = self;
  }
  else
  {
    v9 = -[PLRevGeoPlaceAnnotation init](self, "init");
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLRevGeoPlaceAnnotation placeLevel](self, "placeLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRevGeoPlaceAnnotation placeName](self, "placeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("place type: %@, place string: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)placeLevel
{
  return self->_placeLevel;
}

- (void)setPlaceLevel:(int)a3
{
  self->_placeLevel = a3;
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
  objc_storeStrong((id *)&self->_placeName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeName, 0);
}

@end

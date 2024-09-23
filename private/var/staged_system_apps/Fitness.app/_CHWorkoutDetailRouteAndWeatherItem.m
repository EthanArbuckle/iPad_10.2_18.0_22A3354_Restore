@implementation _CHWorkoutDetailRouteAndWeatherItem

- (HKLocationReadings)locationReadings
{
  return self->_locationReadings;
}

- (void)setLocationReadings:(id)a3
{
  objc_storeStrong((id *)&self->_locationReadings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationReadings, 0);
}

@end

@implementation RideBookingPassengersChoice

- (NSString)formattedPriceRange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  NSString *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPassengersChoice intentsPartySizeOption](self, "intentsPartySizeOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "priceRange"));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingPassengersChoice intentsPriceRange](self, "intentsPriceRange"));
  v7 = v6;

  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_formattedStringWithDefaultShortFormatStrings"));
  v9 = v8;
  if (!v8)
    v8 = &stru_1011EB268;
  v10 = v8;

  return v10;
}

- (unint64_t)size
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPassengersChoice intentsPartySizeOption](self, "intentsPartySizeOption"));
  v4 = objc_msgSend(v3, "partySizeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPassengersChoice intentsPartySizeOption](self, "intentsPartySizeOption"));
  objc_msgSend(v5, "partySizeRange");
  v7 = (unint64_t)v4 + v6;

  return v7;
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPassengersChoice intentsPartySizeOption](self, "intentsPartySizeOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sizeDescription"));

  return (NSString *)v3;
}

- (RideBookingPassengersChoice)initWithNumberOfPassengers:(unint64_t)a3
{
  RideBookingPassengersChoice *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RideBookingPassengersChoice;
  result = -[RideBookingPassengersChoice init](&v5, "init");
  if (result)
    result->_numberOfPassengers = a3;
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Number of Passengers: %lu"), self->_numberOfPassengers);
}

- (unint64_t)numberOfPassengers
{
  return self->_numberOfPassengers;
}

- (void)setNumberOfPassengers:(unint64_t)a3
{
  self->_numberOfPassengers = a3;
}

- (INPriceRange)intentsPriceRange
{
  return (INPriceRange *)objc_getAssociatedObject(self, &unk_100E3D068);
}

- (void)setIntentsPriceRange:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPassengersChoice intentsPriceRange](self, "intentsPriceRange"));
  if ((objc_msgSend(v4, "isEqual:", value) & 1) == 0)
    objc_setAssociatedObject(self, &unk_100E3D068, value, (void *)3);

}

- (INRidePartySizeOption)intentsPartySizeOption
{
  return (INRidePartySizeOption *)objc_getAssociatedObject(self, &unk_100E3D069);
}

- (void)setIntentsPartySizeOption:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPassengersChoice intentsPartySizeOption](self, "intentsPartySizeOption"));
  if ((objc_msgSend(v4, "isEqual:", value) & 1) == 0)
    objc_setAssociatedObject(self, &unk_100E3D069, value, (void *)3);

}

@end

@implementation PAEInstant

- (PAEInstant)initWithAPIManager:(id)a3
{
  PAEInstant *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEInstant;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 7;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end

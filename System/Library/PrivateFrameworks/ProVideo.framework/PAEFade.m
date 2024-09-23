@implementation PAEFade

- (PAEFade)initWithAPIManager:(id)a3
{
  PAEFade *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEFade;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 3;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end

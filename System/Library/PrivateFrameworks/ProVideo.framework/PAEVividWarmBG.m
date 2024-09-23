@implementation PAEVividWarmBG

- (PAEVividWarmBG)initWithAPIManager:(id)a3
{
  PAEVividWarmBG *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEVividWarmBG;
  result = -[PAEPhotosFilters initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    result->super.whichFilter = 18;
  return result;
}

- (BOOL)addParameters
{
  return 1;
}

@end
